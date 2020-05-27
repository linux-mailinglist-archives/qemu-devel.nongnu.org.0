Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 841CF1E3F16
	for <lists+qemu-devel@lfdr.de>; Wed, 27 May 2020 12:33:43 +0200 (CEST)
Received: from localhost ([::1]:48898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdtNW-0004jx-G6
	for lists+qemu-devel@lfdr.de; Wed, 27 May 2020 06:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Pavel.Dovgaluk@gmail.com>)
 id 1jdtKm-0000he-Ko
 for qemu-devel@nongnu.org; Wed, 27 May 2020 06:30:53 -0400
Received: from mail.ispras.ru ([83.149.199.45]:33504)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Pavel.Dovgaluk@gmail.com>) id 1jdtKl-0001m5-RR
 for qemu-devel@nongnu.org; Wed, 27 May 2020 06:30:52 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id E8EDFCD463;
 Wed, 27 May 2020 13:30:49 +0300 (MSK)
Subject: [PATCH v2 02/11] tests/acceptance: refactor boot_linux_console test
 to allow code reuse
From: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 27 May 2020 13:30:49 +0300
Message-ID: <159057544969.16818.6615283542905717210.stgit@pasha-ThinkPad-X280>
In-Reply-To: <159057543840.16818.14393433996899521784.stgit@pasha-ThinkPad-X280>
References: <159057543840.16818.14393433996899521784.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: softfail client-ip=83.149.199.45;
 envelope-from=Pavel.Dovgaluk@gmail.com; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 06:30:39
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
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch splits code in BootLinuxConsole class into two different
classes to allow reusing it by record/replay tests.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
---
 0 files changed

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index c6b06a1a13..f23c5833b7 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -28,19 +28,13 @@ try:
 except CmdNotFoundError:
     P7ZIP_AVAILABLE = False
 
-class BootLinuxConsole(Test):
-    """
-    Boots a Linux kernel and checks that the console is operational and the
-    kernel command line is properly passed from QEMU to the kernel
-    """
-
-    timeout = 90
-
+class LinuxKernelUtils(Test):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
 
-    def wait_for_console_pattern(self, success_message):
+    def wait_for_console_pattern(self, success_message, vm=None):
         wait_for_console_pattern(self, success_message,
-                                 failure_message='Kernel panic - not syncing')
+                                 failure_message='Kernel panic - not syncing',
+                                 vm=vm)
 
     def extract_from_deb(self, deb, path):
         """
@@ -79,6 +73,13 @@ class BootLinuxConsole(Test):
         os.chdir(cwd)
         return os.path.normpath(os.path.join(self.workdir, path))
 
+class BootLinuxConsole(LinuxKernelUtils):
+    """
+    Boots a Linux kernel and checks that the console is operational and the
+    kernel command line is properly passed from QEMU to the kernel
+    """
+    timeout = 90
+
     def test_x86_64_pc(self):
         """
         :avocado: tags=arch:x86_64


