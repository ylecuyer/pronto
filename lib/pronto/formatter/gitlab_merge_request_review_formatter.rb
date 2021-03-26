module Pronto
  module Formatter
    class GitlabMergeRequestReviewFormatter < PullRequestFormatter
      def client_module
        Gitlab
      end

      def pretty_name
        'Gitlab'
      end

      def existing_comments(_, client, repo)
        puts "existing"
        sha = repo.head_commit_sha
        comments = client.pull_comments(sha)
        grouped_comments(comments)
      end

      def submit_comments(client, comments)
        puts "submit"
        client.create_pull_request_review(comments)
      end

      def line_number(message, _)
        message.line.line.new_lineno if message.line
      end
    end
  end
end
