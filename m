Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231244BDAC5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 17:14:29 +0100 (CET)
Received: from localhost ([::1]:55356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMBKR-0001md-GC
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 11:14:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMB2H-0006cj-UV
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:55:37 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:35566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMB2F-0002BB-BK
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:55:37 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 1463B21CC4;
 Mon, 21 Feb 2022 15:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645458934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L9InGvuw5dK4vKcHkANkKnIbYK5rhAl1tiLfsUcR2vA=;
 b=ipK7BuuDSNtm2ro0VYVxoG+obU9SkwToaq5yuLo1oABbKhBlcuhE5WX+xJrmtDA76Xiqea
 B4gFmrm7gIw/dzkeMGkX0vjAFnpHFKp7Jv5AbiQK/mnx1ixg5aMj4yMyVsHt/Q9m+4nYUw
 6roHKE68Fj6h0hfxu6YX1vNBP+NKoOI=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] python: qmp_shell: refactor disconnection handling
Date: Mon, 21 Feb 2022 16:55:17 +0100
Message-Id: <20220221155519.2367-4-damien.hedde@greensocs.com>
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

Introduce QMPShellConnectError (subclass of QMPShellError)
to handle disconnection in read_exec_command().

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 python/qemu/aqmp/qmp_shell.py | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/python/qemu/aqmp/qmp_shell.py b/python/qemu/aqmp/qmp_shell.py
index a1bd7d5630..cce7732ba2 100644
--- a/python/qemu/aqmp/qmp_shell.py
+++ b/python/qemu/aqmp/qmp_shell.py
@@ -142,6 +142,12 @@ class QMPShellParseError(QMPShellError):
     """
 
 
+class QMPShellConnectError(QMPShellError):
+    """
+    QMP Shell Connect error class.
+    """
+
+
 class FuzzyJSON(ast.NodeTransformer):
     """
     This extension of ast.NodeTransformer filters literal "true/false/null"
@@ -347,8 +353,7 @@ def _execute_cmd(self, cmdline: str) -> bool:
             self._print(qmpcmd)
         resp = self.cmd_obj(qmpcmd)
         if resp is None:
-            print('Disconnected')
-            return False
+            raise QMPShellConnectError('Disconnected')
         self._print(resp)
         return True
 
@@ -400,6 +405,9 @@ def read_exec_command(self) -> bool:
             return self._execute_cmd(cmdline)
         except QMPShellParseError as err:
             self._print_parse_error(err)
+        except QMPShellConnectError as err:
+            print(f"{err!s}");
+            return False
         return True
 
     def repl(self) -> Iterator[None]:
@@ -481,8 +489,7 @@ def _execute_cmd(self, cmdline: str) -> bool:
                 raise QMPShellParseError('cpu command takes an integer argument')
         resp = self._cmd_passthrough(cmdline, self._cpu_index)
         if resp is None:
-            print('Disconnected')
-            return False
+            raise QMPShellConnectError('Disconnected')
         assert 'return' in resp or 'error' in resp
         if 'return' in resp:
             # Success
-- 
2.35.1


