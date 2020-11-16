Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C16CD2B4077
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 11:09:22 +0100 (CET)
Received: from localhost ([::1]:34112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kebRp-0000jf-FJ
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 05:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kebQw-0000GB-H5
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 05:08:26 -0500
Received: from mail.ispras.ru ([83.149.199.84]:58520)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kebQu-00042N-72
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 05:08:26 -0500
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 9C0A940D4004;
 Mon, 16 Nov 2020 10:08:17 +0000 (UTC)
Subject: [PATCH] tests/acceptance: fix timeout for vm.wait
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Mon, 16 Nov 2020 13:08:17 +0300
Message-ID: <160552129733.22861.2033930860605615947.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 05:08:18
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pavel.dovgalyuk@ispras.ru, philmd@redhat.com, wrampazz@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds timeout parameter to vm.wait() calls, because the default
value is just 30 seconds, and tests may last for more time.

Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
---
 tests/acceptance/boot_linux_console.py |    8 ++++----
 tests/acceptance/replay_kernel.py      |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index cb6086ca6f..1cb8cb7a2a 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -208,7 +208,7 @@ class BootLinuxConsole(LinuxKernelTest):
         exec_command_and_wait_for_pattern(self, 'reboot',
                                                 'reboot: Restarting system')
         # Wait for VM to shut down gracefully
-        self.vm.wait()
+        self.vm.wait(None)
 
     @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
     def test_mips64el_malta_5KEc_cpio(self):
@@ -250,7 +250,7 @@ class BootLinuxConsole(LinuxKernelTest):
         exec_command_and_wait_for_pattern(self, 'reboot',
                                                 'reboot: Restarting system')
         # Wait for VM to shut down gracefully
-        self.vm.wait()
+        self.vm.wait(None)
 
     def do_test_mips_malta32el_nanomips(self, kernel_url, kernel_hash):
         kernel_path_xz = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
@@ -725,7 +725,7 @@ class BootLinuxConsole(LinuxKernelTest):
         exec_command_and_wait_for_pattern(self, 'reboot',
                                                 'reboot: Restarting system')
         # Wait for VM to shut down gracefully
-        self.vm.wait()
+        self.vm.wait(None)
 
     @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
                 'Test artifacts fetched from unreliable apt.armbian.com')
@@ -778,7 +778,7 @@ class BootLinuxConsole(LinuxKernelTest):
         exec_command_and_wait_for_pattern(self, 'reboot',
                                                 'reboot: Restarting system')
         # Wait for VM to shut down gracefully
-        self.vm.wait()
+        self.vm.wait(None)
 
     @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
                 'Test artifacts fetched from unreliable dl.armbian.com')
diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index c8b043ac31..02a52b1d72 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -60,7 +60,7 @@ class ReplayKernelBase(LinuxKernelTest):
             logger.info('finished the recording with log size %s bytes'
                         % os.path.getsize(replay_path))
         else:
-            vm.wait()
+            vm.wait(None)
             logger.info('successfully finished the replay')
         elapsed = time.time() - start_time
         logger.info('elapsed time %.2f sec' % elapsed)


