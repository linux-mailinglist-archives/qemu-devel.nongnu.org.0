Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCC51E7653
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 09:05:59 +0200 (CEST)
Received: from localhost ([::1]:59730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeZ5a-0004Yt-Cx
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 03:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Pavel.Dovgaluk@gmail.com>)
 id 1jeZ4M-0003En-Bv
 for qemu-devel@nongnu.org; Fri, 29 May 2020 03:04:42 -0400
Received: from mail.ispras.ru ([83.149.199.45]:33216)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Pavel.Dovgaluk@gmail.com>) id 1jeZ4L-0000mB-GV
 for qemu-devel@nongnu.org; Fri, 29 May 2020 03:04:42 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 9872DCD461;
 Fri, 29 May 2020 10:04:39 +0300 (MSK)
Subject: [PATCH v3 01/11] tests/acceptance: allow console interaction with
 specific VMs
From: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 May 2020 10:04:39 +0300
Message-ID: <159073587933.20809.5122618715976660635.stgit@pasha-ThinkPad-X280>
In-Reply-To: <159073587336.20809.5404476664125786279.stgit@pasha-ThinkPad-X280>
References: <159073587336.20809.5404476664125786279.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=83.149.199.45;
 envelope-from=Pavel.Dovgaluk@gmail.com; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/29 01:56:22
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FROM=0.001, NML_ADSP_CUSTOM_MED=0.9,
 SPF_SOFTFAIL=0.665, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wrampazz@redhat.com, alex.bennee@linaro.org, dovgaluk@ispras.ru,
 pavel.dovgaluk@ispras.ru, crosa@redhat.com, pbonzini@redhat.com,
 philmd@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Console interaction in avocado scripts was possible only with single
default VM.
This patch modifies the function parameters to allow passing a specific
VM as a parameter to interact with it.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 0 files changed

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 59e7b4f763..77d1c1d9ff 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -69,13 +69,15 @@ def pick_default_qemu_bin(arch=None):
 
 
 def _console_interaction(test, success_message, failure_message,
-                         send_string, keep_sending=False):
+                         send_string, keep_sending=False, vm=None):
     assert not keep_sending or send_string
-    console = test.vm.console_socket.makefile()
+    if vm is None:
+        vm = test.vm
+    console = vm.console_socket.makefile()
     console_logger = logging.getLogger('console')
     while True:
         if send_string:
-            test.vm.console_socket.sendall(send_string.encode())
+            vm.console_socket.sendall(send_string.encode())
             if not keep_sending:
                 send_string = None # send only once
         msg = console.readline().strip()
@@ -115,7 +117,8 @@ def interrupt_interactive_console_until_pattern(test, success_message,
     _console_interaction(test, success_message, failure_message,
                          interrupt_string, True)
 
-def wait_for_console_pattern(test, success_message, failure_message=None):
+def wait_for_console_pattern(test, success_message, failure_message=None,
+                             vm=None):
     """
     Waits for messages to appear on the console, while logging the content
 
@@ -125,7 +128,7 @@ def wait_for_console_pattern(test, success_message, failure_message=None):
     :param success_message: if this message appears, test succeeds
     :param failure_message: if this message appears, test fails
     """
-    _console_interaction(test, success_message, failure_message, None)
+    _console_interaction(test, success_message, failure_message, None, vm=vm)
 
 def exec_command_and_wait_for_pattern(test, command,
                                       success_message, failure_message=None):


