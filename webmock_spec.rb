require_relative './spec_helper'
require 'faraday'

describe 'WebMock' do

  describe '#store_file_success' do
    let(:request_url) { 'http://webmock.for.us' }
    let(:connection) {
      Faraday.new do |f|
        f.request :url_encoded
        f.adapter Faraday.default_adapter
      end
    }

    before do
      stub_request(:post, request_url).with(body: body_hash)
    end

    context 'body with booleans' do
      let(:body_hash) {
        {
          a_boolean_value: false,
          name: 'body hash with a boolean value'
        }
      }
      it 'should not throw exception' do
        connection.post request_url, body_hash
        # exception will be thrown before here
        expect(true).to be(true)
      end
    end

    context 'body with nil' do
      let(:body_hash) {
        {
          a_nil_value: nil,
          name: 'body hash with a nil value'
        }
      }

      it 'should not throw exception' do
        connection.post request_url, body_hash
        # exception will be thrown before here
        expect(true).to be(true)
      end
    end

    context 'body with fixnum' do
      let(:body_hash) {
        {
          a_fixnum_value: 42,
          name: 'body hash with a fixnum value'
        }
      }

      it 'should not throw exception' do
        connection.post request_url, body_hash
        # exception will be thrown before here
        expect(true).to be(true)
      end
    end
  end
end
