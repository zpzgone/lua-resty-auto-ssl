local start_sockproc = require "resty.auto-ssl.utils.start_sockproc"

return function()
  -- Startup sockproc. This background process allows for non-blocking shell
  -- commands with resty.shell.
  --
  -- We do this in the init_worker phase, so that it will always be started
  -- with the same permissions as the nginx workers (and not the elevated
  -- permissions of the nginx master process).
  --
  -- If we implement a native resty Let's Encrypt ACME client (rather than
  -- relying on letsencrypt.sh), then we could get rid of the need for this
  -- background process, which would be nice.
  start_sockproc()
end
