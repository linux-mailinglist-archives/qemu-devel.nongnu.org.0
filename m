Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A070663C3B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:07:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFA9P-0000v5-HL; Tue, 10 Jan 2023 03:38:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pFA9L-0000tK-Ve; Tue, 10 Jan 2023 03:38:28 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pFA9K-0000WF-2G; Tue, 10 Jan 2023 03:38:27 -0500
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 70CE55F19B;
 Tue, 10 Jan 2023 11:38:17 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b685::1:3c])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 2cYnPs1R4a61-1pOmthUG; Tue, 10 Jan 2023 11:38:16 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1673339896; bh=XaQE7hBGsg7fuFZ/zvEdwzWOhgpjMZcOVhbcqCaUOLQ=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=ob2Zr012YEcNH/NSdkN+1zTBR4+pEuRlBhQv3gGq0ZMf4rDT62q2BPb9WK5H6yR/H
 rvE1zAobtuaUqmYnu3wwB/jV3fevL61ZE1WCiTeU1OU5SoddSQNMcF2TJ9FwrZTOzC
 nj3ATfyqIjtcuUP9wTlgtD8MjF+939WxnsCzUYG8=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: vsementsov@yandex-team.ru, jsnow@redhat.com, crosa@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v4 01/11] python: rename QEMUMonitorProtocol.cmd() to cmd_raw()
Date: Tue, 10 Jan 2023 11:37:48 +0300
Message-Id: <20230110083758.161201-2-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110083758.161201-1-vsementsov@yandex-team.ru>
References: <20230110083758.161201-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Having cmd() and command() methods in one class doesn't look good.
Rename cmd() to cmd_raw(), to show its meaning better.

We also want to rename command() to cmd() in future, so this commit is a
necessary first step.

Keep new cmd_raw() only in a few places where it's really needed and
move to command() where possible.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 python/qemu/machine/machine.py |  2 +-
 python/qemu/qmp/legacy.py      |  8 ++------
 python/qemu/qmp/qmp_shell.py   | 13 +++++++------
 scripts/cpu-x86-uarch-abi.py   | 12 ++++++------
 tests/qemu-iotests/iotests.py  |  2 +-
 5 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 748a0d807c..9059dc3948 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -674,7 +674,7 @@ def qmp(self, cmd: str,
             conv_keys = True
 
         qmp_args = self._qmp_args(conv_keys, args)
-        ret = self._qmp.cmd(cmd, args=qmp_args)
+        ret = self._qmp.cmd_raw(cmd, args=qmp_args)
         if cmd == 'quit' and 'error' not in ret and 'return' in ret:
             self._quit_issued = True
         return ret
diff --git a/python/qemu/qmp/legacy.py b/python/qemu/qmp/legacy.py
index 1951754455..8e1a504052 100644
--- a/python/qemu/qmp/legacy.py
+++ b/python/qemu/qmp/legacy.py
@@ -186,21 +186,17 @@ def cmd_obj(self, qmp_cmd: QMPMessage) -> QMPMessage:
             )
         )
 
-    def cmd(self, name: str,
-            args: Optional[Dict[str, object]] = None,
-            cmd_id: Optional[object] = None) -> QMPMessage:
+    def cmd_raw(self, name: str,
+            args: Optional[Dict[str, object]] = None) -> QMPMessage:
         """
         Build a QMP command and send it to the QMP Monitor.
 
         :param name: command name (string)
         :param args: command arguments (dict)
-        :param cmd_id: command id (dict, list, string or int)
         """
         qmp_cmd: QMPMessage = {'execute': name}
         if args:
             qmp_cmd['arguments'] = args
-        if cmd_id:
-            qmp_cmd['id'] = cmd_id
         return self.cmd_obj(qmp_cmd)
 
     def command(self, cmd: str, **kwds: object) -> QMPReturnValue:
diff --git a/python/qemu/qmp/qmp_shell.py b/python/qemu/qmp/qmp_shell.py
index 619ab42ced..5c0d87a0ec 100644
--- a/python/qemu/qmp/qmp_shell.py
+++ b/python/qemu/qmp/qmp_shell.py
@@ -98,7 +98,7 @@
     Sequence,
 )
 
-from qemu.qmp import ConnectError, QMPError, SocketAddrT
+from qemu.qmp import ConnectError, QMPError, SocketAddrT, ExecuteError
 from qemu.qmp.legacy import (
     QEMUMonitorProtocol,
     QMPBadPortError,
@@ -194,11 +194,12 @@ def close(self) -> None:
         super().close()
 
     def _fill_completion(self) -> None:
-        cmds = self.cmd('query-commands')
-        if 'error' in cmds:
-            return
-        for cmd in cmds['return']:
-            self._completer.append(cmd['name'])
+        try:
+            cmds = self.command('query-commands')
+            for cmd in cmds:
+                self._completer.append(cmd['name'])
+        except ExecuteError:
+            pass
 
     def _completer_setup(self) -> None:
         self._completer = QMPCompleter()
diff --git a/scripts/cpu-x86-uarch-abi.py b/scripts/cpu-x86-uarch-abi.py
index 82ff07582f..893afd1b35 100644
--- a/scripts/cpu-x86-uarch-abi.py
+++ b/scripts/cpu-x86-uarch-abi.py
@@ -69,7 +69,7 @@
 shell = QEMUMonitorProtocol(sock)
 shell.connect()
 
-models = shell.cmd("query-cpu-definitions")
+models = shell.command("query-cpu-definitions")
 
 # These QMP props don't correspond to CPUID fatures
 # so ignore them
@@ -85,7 +85,7 @@
 
 names = []
 
-for model in models["return"]:
+for model in models:
     if "alias-of" in model:
         continue
     names.append(model["name"])
@@ -93,12 +93,12 @@
 models = {}
 
 for name in sorted(names):
-    cpu = shell.cmd("query-cpu-model-expansion",
-                     { "type": "static",
-                       "model": { "name": name }})
+    cpu = shell.command("query-cpu-model-expansion",
+                        { "type": "static",
+                          "model": { "name": name }})
 
     got = {}
-    for (feature, present) in cpu["return"]["model"]["props"].items():
+    for (feature, present) in cpu["model"]["props"].items():
         if present and feature not in skip:
             got[feature] = True
 
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index da7d6637e1..c69b10ac82 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -460,7 +460,7 @@ def __init__(self, *args: str, instance_id: str = 'a', qmp: bool = False):
     def qmp(self, cmd: str, args: Optional[Dict[str, object]] = None) \
             -> QMPMessage:
         assert self._qmp is not None
-        return self._qmp.cmd(cmd, args)
+        return self._qmp.cmd_raw(cmd, args)
 
     def stop(self, kill_signal=15):
         self._p.send_signal(kill_signal)
-- 
2.34.1


