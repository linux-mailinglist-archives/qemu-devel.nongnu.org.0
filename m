Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B804BDABD
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 17:08:51 +0100 (CET)
Received: from localhost ([::1]:48368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMBF4-0005BT-Ae
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 11:08:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMB2L-0006ek-0R
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:55:41 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:35588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMB2H-0002Bl-Tf
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:55:40 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 82DEC21EBE;
 Mon, 21 Feb 2022 15:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645458936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ye4DkYiS7T2Juwk3S1UpOfiAeeqAlWPrmNV+EwdOzhI=;
 b=T6RoeFbG9DO9xOhqeSGgbH1dWhdqJ3KuTFH4I40ApJTMdLjN6OC063Q7Eti1MsZmuMNi2E
 hC0J4VN0fp8jys/TlhFYcUkyBgMGaW2pipqYPeKxNXhbZnOEKpHztld5cmLxVCCTyR++Ke
 N9C9nq9bipm1LBr4gV7N35hKdVOmY/g=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] python: qmp_shell: handle comment lines and escaped eol
Date: Mon, 21 Feb 2022 16:55:19 +0100
Message-Id: <20220221155519.2367-6-damien.hedde@greensocs.com>
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

In order to support more user-friendly command list file,
this commit adds the support for:
+ comment lines: line staring by '#' are ignored
+ escaped enf-of-line: line with trailing ' \' are continued
  on next one

For eol: we impose a space before the '\' in order not to trigger
the escape if the '\' is for example at the end of a value in a
'key=value' sequence.
Althought it does not have any real interest in interactive mode,
the prompt is adapted when in that case.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 python/qemu/aqmp/qmp_shell.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/python/qemu/aqmp/qmp_shell.py b/python/qemu/aqmp/qmp_shell.py
index dd38ef8a13..64cd31dcd6 100644
--- a/python/qemu/aqmp/qmp_shell.py
+++ b/python/qemu/aqmp/qmp_shell.py
@@ -188,6 +188,7 @@ def __init__(self, address: SocketAddrT,
         self._greeting: Optional[QMPMessage] = None
         self._completer = QMPCompleter()
         self._transmode = False
+        self._escaped_eol = False
         self._actions: List[QMPMessage] = []
         self._histfile = os.path.join(os.path.expanduser('~'),
                                       '.qmp-shell_history')
@@ -385,6 +386,8 @@ def prompt(self) -> str:
         """
         if not sys.stdin.isatty():
             return ""
+        if self._escaped_eol:
+            return '> '
         if self._transmode:
             return 'TRANS> '
         return '(QEMU) '
@@ -397,6 +400,11 @@ def read_exec_command(self) -> bool:
         """
         try:
             cmdline = input(self.prompt)
+            self._escaped_eol = True
+            while cmdline[-2:] == ' \\':
+                #only remove the trailing '\', keep the space
+                cmdline = cmdline[:-1] + input(self.prompt)
+            self._escaped_eol = False
         except EOFError:
             print()
             return False
@@ -406,6 +414,10 @@ def read_exec_command(self) -> bool:
                 print(event)
             return True
 
+        if cmdline[0] == '#':
+            #consider these lines as comments
+            return True
+
         if self.raise_error:
             resp = self._execute_cmd(cmdline)
             if resp and 'error' in resp:
-- 
2.35.1


