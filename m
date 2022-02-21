Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCB64BDAC6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 17:14:35 +0100 (CET)
Received: from localhost ([::1]:55500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMBKc-0001st-PR
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 11:14:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMB2H-0006ci-Ok
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:55:37 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:35554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMB2E-0002B1-Er
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:55:36 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 072F721C47;
 Mon, 21 Feb 2022 15:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645458933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3XildHfwEa3XRRUp9QR/mMklLb2sWGeGTzxz8F8pc/g=;
 b=O/eMeSw9wC6qBiJXIm8kOfdnv3+PB//wNT6jLv9wi279YS7aeLofYyHp+9QOA+ujiI4o5T
 Yck9KVBALG5TMbe9/tR9IQYzSGCNS5JXvG99qbOR5GKEbqUYU9aSX4f2vYABbG0csmq3tl
 /XGwoFOWUbxdRMK3jC4dGRT+ilcqG/o=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] python: qmp_shell: refactor the parsing error handling
Date: Mon, 21 Feb 2022 16:55:16 +0100
Message-Id: <20220221155519.2367-3-damien.hedde@greensocs.com>
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

Instead of handling these error in _excute_cmd(), now
raise the exception and let read_exec_command() handle it.

Introduce QMPShellParseError (subclass of QMPShellError)
to replace QMPShellError. In next commit we will introduce
another subclass.

Introduce _print_parse_error() method because QMPShell
and HMPShell handle the printing differently.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 python/qemu/aqmp/qmp_shell.py | 51 +++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/python/qemu/aqmp/qmp_shell.py b/python/qemu/aqmp/qmp_shell.py
index a6e0f5af42..a1bd7d5630 100644
--- a/python/qemu/aqmp/qmp_shell.py
+++ b/python/qemu/aqmp/qmp_shell.py
@@ -136,6 +136,12 @@ class QMPShellError(QMPError):
     """
 
 
+class QMPShellParseError(QMPShellError):
+    """
+    QMP Shell Parse error class.
+    """
+
+
 class FuzzyJSON(ast.NodeTransformer):
     """
     This extension of ast.NodeTransformer filters literal "true/false/null"
@@ -246,7 +252,7 @@ def _cli_expr(self,
         for arg in tokens:
             (key, sep, val) = arg.partition('=')
             if sep != '=':
-                raise QMPShellError(
+                raise QMPShellParseError(
                     f"Expected a key=value pair, got '{arg!s}'"
                 )
 
@@ -258,14 +264,14 @@ def _cli_expr(self,
                 obj = parent.get(path, {})
                 if not isinstance(obj, dict):
                     msg = 'Cannot use "{:s}" as both leaf and non-leaf key'
-                    raise QMPShellError(msg.format('.'.join(curpath)))
+                    raise QMPShellParseError(msg.format('.'.join(curpath)))
                 parent[path] = obj
                 parent = obj
             if optpath[-1] in parent:
                 if isinstance(parent[optpath[-1]], dict):
                     msg = 'Cannot use "{:s}" as both leaf and non-leaf key'
-                    raise QMPShellError(msg.format('.'.join(curpath)))
-                raise QMPShellError(f'Cannot set "{key}" multiple times')
+                    raise QMPShellParseError(msg.format('.'.join(curpath)))
+                raise QMPShellParseError(f'Cannot set "{key}" multiple times')
             parent[optpath[-1]] = value
 
     def _build_cmd(self, cmdline: str) -> Optional[QMPMessage]:
@@ -290,7 +296,7 @@ def _build_cmd(self, cmdline: str) -> Optional[QMPMessage]:
             self._transmode = False
             if len(cmdargs) > 1:
                 msg = 'Unexpected input after close of Transaction sub-shell'
-                raise QMPShellError(msg)
+                raise QMPShellParseError(msg)
             qmpcmd = {
                 'execute': 'transaction',
                 'arguments': {'actions': self._actions}
@@ -323,17 +329,17 @@ def _print(self, qmp_message: object) -> None:
                            sort_keys=self.pretty)
         print(str(jsobj))
 
+    def _print_parse_error(self, err: QMPShellParseError) -> None:
+        print(
+            f"Error while parsing command line: {err!s}\n"
+            "command format: <command-name> "
+            "[arg-name1=arg1] ... [arg-nameN=argN",
+            file=sys.stderr
+        )
+
     def _execute_cmd(self, cmdline: str) -> bool:
-        try:
-            qmpcmd = self._build_cmd(cmdline)
-        except QMPShellError as err:
-            print(
-                f"Error while parsing command line: {err!s}\n"
-                "command format: <command-name> "
-                "[arg-name1=arg1] ... [arg-nameN=argN",
-                file=sys.stderr
-            )
-            return True
+        qmpcmd = self._build_cmd(cmdline)
+
         # For transaction mode, we may have just cached the action:
         if qmpcmd is None:
             return True
@@ -390,7 +396,11 @@ def read_exec_command(self) -> bool:
                 print(event)
             return True
 
-        return self._execute_cmd(cmdline)
+        try:
+            return self._execute_cmd(cmdline)
+        except QMPShellParseError as err:
+            self._print_parse_error(err)
+        return True
 
     def repl(self) -> Iterator[None]:
         """
@@ -456,18 +466,19 @@ def _cmd_passthrough(self, cmdline: str,
             }
         })
 
+    def _print_parse_error(self, err: QMPShellParseError) -> None:
+        print(f"{err!s}")
+
     def _execute_cmd(self, cmdline: str) -> bool:
         if cmdline.split()[0] == "cpu":
             # trap the cpu command, it requires special setting
             try:
                 idx = int(cmdline.split()[1])
                 if 'return' not in self._cmd_passthrough('info version', idx):
-                    print('bad CPU index')
-                    return True
+                    raise QMPShellParseError('bad CPU index')
                 self._cpu_index = idx
             except ValueError:
-                print('cpu command takes an integer argument')
-                return True
+                raise QMPShellParseError('cpu command takes an integer argument')
         resp = self._cmd_passthrough(cmdline, self._cpu_index)
         if resp is None:
             print('Disconnected')
-- 
2.35.1


