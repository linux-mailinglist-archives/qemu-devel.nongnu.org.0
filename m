Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847874C169C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 16:23:38 +0100 (CET)
Received: from localhost ([::1]:38434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMtUP-0003LT-6y
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 10:23:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMtTK-0002d7-BP
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 10:22:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMtTG-0005v9-4K
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 10:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645629744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sM+YOA4zTb8hShVSmFY6AFkYF55TY8+bjJdQu1TFSSI=;
 b=aA7DPO+FkmgL6E/hCkGd8G7npILX8OSkTQGSxKmZZPuyajhOzX2eYz855QY5uLbXAT32S1
 ClNsMVkr9tb4ieJna5DOFxZWGnbOt9AqCzGUakqmwZWGcoFVOAbnI4kBybdzlP/Mo/Z51x
 K65s5dBC2WcA2hm90033+8x/3aNe184=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-vlYAhyffNDS_DzknCcnH9A-1; Wed, 23 Feb 2022 10:22:23 -0500
X-MC-Unique: vlYAhyffNDS_DzknCcnH9A-1
Received: by mail-ua1-f70.google.com with SMTP id
 i47-20020ab015b2000000b0033bdcb385f5so1654562uae.12
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 07:22:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sM+YOA4zTb8hShVSmFY6AFkYF55TY8+bjJdQu1TFSSI=;
 b=PcNgWcQgFQ/eXlj9Vlivd4JLoOLUlF4RCh/pQBcGC6KkKZUMIawof2sApl5wB/Yi7H
 9U1AXt/sIFlJcenbBLSAfbx4kJ8KG6xjkdyW1TfeqTrw+Gj6A5RLi/NyUcKJ3CwIDLo9
 eimUGz6wddq+zV9scCQz3h8xcxu7oWbNB5mox+YNttFi2WVeVxnmBcTGaNQvkikx2y1P
 VtpR61/9Eg4cstMyBTNvJc1jsXcXcNM6vVw5KsbTMQ+PHKc7EdSeyDkUD6lgpxEdqfN0
 N5kr1oliBGeUdyygKRJQvNCRA0nc7eBZLijcjuK5prv0Bbn2LiRkWmEGj0xIBWi2wuQI
 aQ8Q==
X-Gm-Message-State: AOAM530dZDfa7Lz+5eG8qKcoJ8ImNziMsIyoiF8THR5Ln3/Z7Xd8BfS5
 aQ1/ksd0xdHxrZHLmGKPcgLa6KRC7W8dMXhh3SdY3xtwCd1joRR8ndSsk0RUi7i6qvJ/NXg3+Y4
 moeoSVskZuIBUn8b2bmhtK7Ph0HfmIM8=
X-Received: by 2002:a05:6102:3591:b0:31b:4f52:29f1 with SMTP id
 h17-20020a056102359100b0031b4f5229f1mr89114vsu.61.1645629742833; 
 Wed, 23 Feb 2022 07:22:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTjmCOuEEH0iURUFvyOZOWh6UQsduz9HQ87H+N5IdT2oHQkZXoRyMIRdhkz6XN86U4/vsi/2pKKCXS9R6T9yM=
X-Received: by 2002:a05:6102:3591:b0:31b:4f52:29f1 with SMTP id
 h17-20020a056102359100b0031b4f5229f1mr89100vsu.61.1645629742518; Wed, 23 Feb
 2022 07:22:22 -0800 (PST)
MIME-Version: 1.0
References: <20220221155519.2367-1-damien.hedde@greensocs.com>
 <20220221155519.2367-5-damien.hedde@greensocs.com>
In-Reply-To: <20220221155519.2367-5-damien.hedde@greensocs.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 23 Feb 2022 10:22:11 -0500
Message-ID: <CAFn=p-ZErejiw7mn_kN6c+57ya4OgS3ANpUa=BtS3Be=vcSOvg@mail.gmail.com>
Subject: Re: [PATCH 4/5] python: qmp_shell: add -e/--exit-on-error option
To: Damien Hedde <damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 21, 2022 at 10:55 AM Damien Hedde
<damien.hedde@greensocs.com> wrote:
>
> This option makes qmp_shell exit (with error code 1)
> as soon as one of the following error occurs:
> + command parsing error
> + disconnection
> + command failure (response is an error)
>
> _execute_cmd() method now returns None or the response
> so that read_exec_command() can do the last check.
>
> This is meant to be used in combination with an input file
> redirection. It allows to store a list of commands
> into a file and try to run them by qmp_shell and easily
> see if it failed or not.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Based on this patch, it looks like you really want something
scriptable, so I think the qemu-send idea that Dan has suggested might
be the best way to go. Are you still hoping to use the interactive
"short" QMP command format? That might be a bad idea, given how flaky
the parsing is -- and how we don't actually have a published standard
for that format. We've *never* liked the bad parsing here, so I have a
reluctance to use it in more places.

I'm having the naive idea that a script file could be as simple as a
list of QMP commands to send:

[
    {"execute": "block-dirty-bitmap-add", "arguments": { ... }},
    ...
]

And a processing script could be something as simple as:

~~~
with open("script.json") as infile:
    script = json.load(infile)

for command in script:
    await qmp.execute_msg(command)
~~~


It's very simple to do, but the script file format is now a bit more
chatty than it used to be. You could also elide the "execute" and
"arguments" keys, perhaps:

[
    {"block-dirty-bitmap-add": {"name": ..., "node": ...},
    ...
]

And then the script only changes a little bit:

for item in script:
    for cmd, args in item.items():
        await qmp.execute(cmd, args)

but this might lose the ability to opt into "execute-oob" as one
consequence of a more terse script format.



> ---
>  python/qemu/aqmp/qmp_shell.py | 39 +++++++++++++++++++++++++----------
>  1 file changed, 28 insertions(+), 11 deletions(-)
>
> diff --git a/python/qemu/aqmp/qmp_shell.py b/python/qemu/aqmp/qmp_shell.py
> index cce7732ba2..dd38ef8a13 100644
> --- a/python/qemu/aqmp/qmp_shell.py
> +++ b/python/qemu/aqmp/qmp_shell.py
> @@ -11,7 +11,7 @@
>  """
>  Low-level QEMU shell on top of QMP.
>
> -usage: qmp-shell [-h] [-H] [-N] [-v] [-p] qmp_server
> +usage: qmp-shell [-h] [-H] [-N] [-v] [-p] [-e] qmp_server
>
>  positional arguments:
>    qmp_server            < UNIX socket path | TCP address:port >
> @@ -23,6 +23,8 @@
>                          Skip negotiate (for qemu-ga)
>    -v, --verbose         Verbose (echo commands sent and received)
>    -p, --pretty          Pretty-print JSON
> +  -e, --exit-on-error   Exit when an error occurs (command parsing,
> +                        disconnection and command failure)
>
>
>  Start QEMU with:
> @@ -177,9 +179,11 @@ class QMPShell(QEMUMonitorProtocol):
>      :param address: Address of the QMP server.
>      :param pretty: Pretty-print QMP messages.
>      :param verbose: Echo outgoing QMP messages to console.
> +    :param raise_error: Don't continue after an error occured
>      """
>      def __init__(self, address: SocketAddrT,
> -                 pretty: bool = False, verbose: bool = False):
> +                 pretty: bool = False, verbose: bool = False,
> +                 raise_error: bool = False):
>          super().__init__(address)
>          self._greeting: Optional[QMPMessage] = None
>          self._completer = QMPCompleter()
> @@ -189,6 +193,7 @@ def __init__(self, address: SocketAddrT,
>                                        '.qmp-shell_history')
>          self.pretty = pretty
>          self.verbose = verbose
> +        self.raise_error = raise_error
>
>      def close(self) -> None:
>          # Hook into context manager of parent to save shell history.
> @@ -343,19 +348,19 @@ def _print_parse_error(self, err: QMPShellParseError) -> None:
>              file=sys.stderr
>          )
>
> -    def _execute_cmd(self, cmdline: str) -> bool:
> +    def _execute_cmd(self, cmdline: str) -> Optional[QMPMessage]:
>          qmpcmd = self._build_cmd(cmdline)
>
>          # For transaction mode, we may have just cached the action:
>          if qmpcmd is None:
> -            return True
> +            return None
>          if self.verbose:
>              self._print(qmpcmd)
>          resp = self.cmd_obj(qmpcmd)
>          if resp is None:
>              raise QMPShellConnectError('Disconnected')
>          self._print(resp)
> -        return True
> +        return resp
>
>      def connect(self, negotiate: bool = True) -> None:
>          self._greeting = super().connect(negotiate)
> @@ -401,8 +406,13 @@ def read_exec_command(self) -> bool:
>                  print(event)
>              return True
>
> +        if self.raise_error:
> +            resp = self._execute_cmd(cmdline)
> +            if resp and 'error' in resp:
> +                raise QMPShellError(f"Command failed: {resp['error']}")
> +            return True
>          try:
> -            return self._execute_cmd(cmdline)
> +            self._execute_cmd(cmdline)
>          except QMPShellParseError as err:
>              self._print_parse_error(err)
>          except QMPShellConnectError as err:
> @@ -477,7 +487,7 @@ def _cmd_passthrough(self, cmdline: str,
>      def _print_parse_error(self, err: QMPShellParseError) -> None:
>          print(f"{err!s}")
>
> -    def _execute_cmd(self, cmdline: str) -> bool:
> +    def _execute_cmd(self, cmdline: str) -> Optional[QMPMessage]:
>          if cmdline.split()[0] == "cpu":
>              # trap the cpu command, it requires special setting
>              try:
> @@ -498,7 +508,7 @@ def _execute_cmd(self, cmdline: str) -> bool:
>          else:
>              # Error
>              print('%s: %s' % (resp['error']['class'], resp['error']['desc']))
> -        return True
> +        return resp
>
>      def show_banner(self, msg: str = 'Welcome to the HMP shell!') -> None:
>          QMPShell.show_banner(self, msg)
> @@ -523,6 +533,9 @@ def main() -> None:
>                          help='Verbose (echo commands sent and received)')
>      parser.add_argument('-p', '--pretty', action='store_true',
>                          help='Pretty-print JSON')
> +    parser.add_argument('-e', '--exit-on-error', action='store_true',
> +                        help='Exit when an error occurs (command parsing,'
> +                             ' disconnection and command failure)')
>
>      default_server = os.environ.get('QMP_SOCKET')
>      parser.add_argument('qmp_server', action='store',
> @@ -541,7 +554,8 @@ def main() -> None:
>          parser.error(f"Bad port number: {args.qmp_server}")
>          return  # pycharm doesn't know error() is noreturn
>
> -    with shell_class(address, args.pretty, args.verbose) as qemu:
> +    with shell_class(address, args.pretty, args.verbose,
> +                     args.exit_on_error) as qemu:
>          try:
>              qemu.connect(negotiate=not args.skip_negotiation)
>          except ConnectError as err:
> @@ -549,8 +563,11 @@ def main() -> None:
>                  die(f"Couldn't connect to {args.qmp_server}: {err!s}")
>              die(str(err))
>
> -        for _ in qemu.repl():
> -            pass
> +        try:
> +            for _ in qemu.repl():
> +                pass
> +        except QMPShellError as err:
> +            die(str(err))
>
>
>  if __name__ == '__main__':
> --
> 2.35.1
>


