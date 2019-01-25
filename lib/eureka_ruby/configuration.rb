# https://www.skcript.com/svr/the-easiest-configuration-block-for-your-ruby-gems/
# https://github.com/shideneyu/kraken_client
# https://www.reddit.com/r/ruby/comments/54fgia/whats_the_best_configuration_pattern_when/
# https://robots.thoughtbot.com/mygem-configure-block
# https://github.com/thoughtbot/clearance/blob/master/lib/clearance/configuration.rb
module EurekaRuby
  class Configuration
    attr_accessor :eureka_url
    attr_accessor :app_id
    attr_accessor :host_name
    attr_accessor :ip_addr
    attr_accessor :port

    def initialize
      @port = 3000
    end

    def instance_id
      "#{host_name}:#{ip_addr}:#{port}"
    end
  end

  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield configuration
    end
  end
end