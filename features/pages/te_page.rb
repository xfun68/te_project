class TEPage
  TE_URL = "http://te.thoughtworks.com"
  PREFIX = "activities_0_items"

  def initialize(browser)
    @browser = browser
    @browser.goto(TE_URL)
  end

  def password
    @browser.text_field(:id => "password")
  end

  def username
    @browser.text_field(:id => "username")
  end

  def activity_code
    @browser.text_field(:id => "activities_0_activity")
  end

  # id : 0...9,10,...
  def category(id)
    @browser.select_list(:id => "#{PREFIX}_#{id}_category")
  end

  def date(id)
    @browser.text_field(:id => "#{PREFIX}_#{id}_item_date_string")
  end

  def amount(id)
    @browser.text_field(:id => "#{PREFIX}_#{id}_amount")
  end

  def currency(id)
    @browser.select_list(:id => "#{PREFIX}_#{id}_currency")
  end

  def description(id)
    @browser.text_field(:id => "#{PREFIX}_#{id}_description")
  end

  def vendor(id)
    @browser.text_field(:id => "#{PREFIX}_#{id}_vendor")
  end

  def payment(id)
    @browser.select_list(:id => "#{PREFIX}_#{id}_payment")
  end

  def attendees(id)
    @browser.text_field(:id => "#{PREFIX}_#{id}_attendees")
  end

  def add_expense_row
    @browser.image(:alt => "Addrow_button")
  end

  def add_new_expense
    @browser.goto("https://te.thoughtworks.com/expense_reports/new")
  end

  def login
    @browser.button(:text => "LOGIN")
  end

  def save_as_draft
    @browser.button(:value => "Save as draft")
  end

  def wait_for_expense_row(index)
    add_expense_row.click
    category_string = "activities_0_items_#{index + 5}_category"
    Watir::Wait::until do
      category = @browser.select_list(:id => category_string)
      category.exist? && category.visible?
    end
  end
end