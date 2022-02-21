Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02CF4BDABA
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 17:03:29 +0100 (CET)
Received: from localhost ([::1]:44686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMB9s-0002Tp-7H
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 11:03:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMB2K-0006eW-9K
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:55:40 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:35576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMB2H-0002BZ-Gz
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:55:39 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 1C56D21CCE;
 Mon, 21 Feb 2022 15:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645458935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=adKF6/kzoZwx7qMvkl5SLyG2oeu0edQPfJy1BbduMxk=;
 b=CN1F5PC0yF7P87NhZuM/8+v5oCp/lta5TOIMQoRCsxgon+aW0Knvqja62tWg+CBxQVw76G
 2aB5iabEPmmLmNBKIjGUYhzy/EZivUsN0dlaTZ04x60MpR2/1NtyLMY36CtUk5wQWn/xCD
 10AxQ4R4OXbNLGr004348GJFMlpGgp8=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] python: qmp_shell: add -e/--exit-on-error option
Date: Mon, 21 Feb 2022 16:55:18 +0100
Message-Id: <20220221155519.2367-5-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221155519.2367-1-damien.hedde@greensocs.com>
References: <20220221155519.2367-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This option makes qmp_shell exit (with error code 1)
as soon as one of the following error occurs:
+ command parsing error
+ disconnection
+ command failure (response is an error)

_execute_cmd() method now returns None or the response
so that read_exec_command() can do the last check.

This is meant to be used in combination with an input file
redirection. It allows to store a list of commands
into a file and try to run them by qmp_shell and easily
see if it failed or not.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 python/qemu/aqmp/qmp_shell.py | 39 +++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/python/qemu/aqmp/qmp_shell.py b/python/qemu/aqmp/qmp_shell.py
index cce7732ba2..dd38ef8a13 100644
--- a/python/qemu/aqmp/qmp_shell.py
+++ b/python/qemu/aqmp/qmp_shell.py
@@ -11,7 +11,7 @@
 """
 Low-level QEMU shell on top of QMP.
 
-usage: qmp-shell [-h] [-H] [-N] [-v] [-p] qmp_server
+usage: qmp-shell [-h] [-H] [-N] [-v] [-p] [-e] qmp_server
 
 positional arguments:
   qmp_server            < UNIX socket path | TCP address:port >
@@ -23,6 +23,8 @@
                         Skip negotiate (for qemu-ga)
   -v, --verbose         Verbose (echo commands sent and received)
   -p, --pretty          Pretty-print JSON
+  -e, --exit-on-error   Exit when an error occurs (command parsing,
+                        disconnection and command failure)
 
 
 Start QEMU with:
@@ -177,9 +179,11 @@ class QMPShell(QEMUMonitorProtocol):
     :param address: Address of the QMP server.
     :param pretty: Pretty-print QMP messages.
     :param verbose: Echo outgoing QMP messages to console.
+    :param raise_error: Don't continue after an error occured
     """
     def __init__(self, address: SocketAddrT,
-                 pretty: bool = False, verbose: bool = False):
+                 pretty: bool = False, verbose: bool = False,
+                 raise_error: bool = False):
         super().__init__(address)
         self._greeting: Optional[QMPMessage] = None
         self._completer = QMPCompleter()
@@ -189,6 +193,7 @@ def __init__(self, address: SocketAddrT,
                                       '.qmp-shell_history')
         self.pretty = pretty
         self.verbose = verbose
+        self.raise_error = raise_error
 
     def close(self) -> None:
         # Hook into context manager of parent to save shell history.
@@ -343,19 +348,19 @@ def _print_parse_error(self, err: QMPShellParseError) -> None:
             file=sys.stderr
         )
 
-    def _execute_cmd(self, cmdline: str) -> bool:
+    def _execute_cmd(self, cmdline: str) -> Optional[QMPMessage]:
         qmpcmd = self._build_cmd(cmdline)
 
         # For transaction mode, we may have just cached the action:
         if qmpcmd is None:
-            return True
+            return None
         if self.verbose:
             self._print(qmpcmd)
         resp = self.cmd_obj(qmpcmd)
         if resp is None:
             raise QMPShellConnectError('Disconnected')
         self._print(resp)
-        return True
+        return resp
 
     def connect(self, negotiate: bool = True) -> None:
         self._greeting = super().connect(negotiate)
@@ -401,8 +406,13 @@ def read_exec_command(self) -> bool:
                 print(event)
             return True
 
+        if self.raise_error:
+            resp = self._execute_cmd(cmdline)
+            if resp and 'error' in resp:
+                raise QMPShellError(f"Command failed: {resp['error']}")
+            return True
         try:
-            return self._execute_cmd(cmdline)
+            self._execute_cmd(cmdline)
         except QMPShellParseError as err:
             self._print_parse_error(err)
         except QMPShellConnectError as err:
@@ -477,7 +487,7 @@ def _cmd_passthrough(self, cmdline: str,
     def _print_parse_error(self, err: QMPShellParseError) -> None:
         print(f"{err!s}")
 
-    def _execute_cmd(self, cmdline: str) -> bool:
+    def _execute_cmd(self, cmdline: str) -> Optional[QMPMessage]:
         if cmdline.split()[0] == "cpu":
             # trap the cpu command, it requires special setting
             try:
@@ -498,7 +508,7 @@ def _execute_cmd(self, cmdline: str) -> bool:
         else:
             # Error
             print('%s: %s' % (resp['error']['class'], resp['error']['desc']))
-        return True
+        return resp
 
     def show_banner(self, msg: str = 'Welcome to the HMP shell!') -> None:
         QMPShell.show_banner(self, msg)
@@ -523,6 +533,9 @@ def main() -> None:
                         help='Verbose (echo commands sent and received)')
     parser.add_argument('-p', '--pretty', action='store_true',
                         help='Pretty-print JSON')
+    parser.add_argument('-e', '--exit-on-error', action='store_true',
+                        help='Exit when an error occurs (command parsing,'
+                             ' disconnection and command failure)')
 
     default_server = os.environ.get('QMP_SOCKET')
     parser.add_argument('qmp_server', action='store',
@@ -541,7 +554,8 @@ def main() -> None:
         parser.error(f"Bad port number: {args.qmp_server}")
         return  # pycharm doesn't know error() is noreturn
 
-    with shell_class(address, args.pretty, args.verbose) as qemu:
+    with shell_class(address, args.pretty, args.verbose,
+                     args.exit_on_error) as qemu:
         try:
             qemu.connect(negotiate=not args.skip_negotiation)
         except ConnectError as err:
@@ -549,8 +563,11 @@ def main() -> None:
                 die(f"Couldn't connect to {args.qmp_server}: {err!s}")
             die(str(err))
 
-        for _ in qemu.repl():
-            pass
+        try:
+            for _ in qemu.repl():
+                pass
+        except QMPShellError as err:
+            die(str(err))
 
 
 if __name__ == '__main__':
-- 
2.35.1


