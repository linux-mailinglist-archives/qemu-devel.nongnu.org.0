Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B614A3F7D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 10:45:38 +0100 (CET)
Received: from localhost ([::1]:58980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nETFh-00049M-R8
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 04:45:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1nETD5-0001gh-4o
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:42:55 -0500
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:60745)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1nETD3-0000zR-00
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:42:54 -0500
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail02.asahi-net.or.jp (Postfix) with ESMTPA id 9786720801;
 Mon, 31 Jan 2022 18:42:51 +0900 (JST)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id 4D6C01C006A;
 Mon, 31 Jan 2022 18:42:51 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] test/avocado: Update machibe_rx_gdbsim tests.
Date: Mon, 31 Jan 2022 18:42:46 +0900
Message-Id: <20220131094246.772550-2-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220131094246.772550-1-ysato@users.sourceforge.jp>
References: <20220131094246.772550-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.14;
 envelope-from=ysato@users.sourceforge.jp; helo=mail02.asahi-net.or.jp
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since SCI supports continuous data receive, Added that test.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 tests/avocado/machine_rx_gdbsim.py | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/tests/avocado/machine_rx_gdbsim.py b/tests/avocado/machine_rx_gdbsim.py
index 6cd8704b01..04ba1e3ca3 100644
--- a/tests/avocado/machine_rx_gdbsim.py
+++ b/tests/avocado/machine_rx_gdbsim.py
@@ -9,6 +9,7 @@
 # later.  See the COPYING file in the top-level directory.
 
 import os
+import time
 
 from avocado import skipIf
 from avocado_qemu import QemuSystemTest
@@ -20,7 +21,7 @@
 class RxGdbSimMachine(QemuSystemTest):
 
     timeout = 30
-    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 console=ttySC0,9600'
 
     @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_uboot(self):
@@ -31,8 +32,8 @@ def test_uboot(self):
         :avocado: tags=machine:gdbsim-r5f562n8
         :avocado: tags=endian:little
         """
-        uboot_url = ('https://acc.dl.osdn.jp/users/23/23888/u-boot.bin.gz')
-        uboot_hash = '9b78dbd43b40b2526848c0b1ce9de02c24f4dcdb'
+        uboot_url = ('https://osdn.dl.osdn.net/users/37/37476/u-boot.bin.gz')
+        uboot_hash = '5299a1deb6540ed8699a21ab32b61d862f8d3e32'
         uboot_path = self.fetch_asset(uboot_url, asset_hash=uboot_hash)
         uboot_path = archive.uncompress(uboot_path, self.workdir)
 
@@ -40,11 +41,14 @@ def test_uboot(self):
         self.vm.add_args('-bios', uboot_path,
                          '-no-reboot')
         self.vm.launch()
-        uboot_version = 'U-Boot 2016.05-rc3-23705-ga1ef3c71cb-dirty'
+        uboot_version = 'U-Boot 2021.10-rc3-00012-g92f3eb4647 ' \
+            '(Jan 02 2022 - 21:06:23 +0900)'
         wait_for_console_pattern(self, uboot_version)
-        gcc_version = 'rx-unknown-linux-gcc (GCC) 9.0.0 20181105 (experimental)'
-        # FIXME limit baudrate on chardev, else we type too fast
-        #exec_command_and_wait_for_pattern(self, 'version', gcc_version)
+        gcc_version = 'rx-unknown-linux-gcc (GCC) 12.0.0 20210903 ' \
+            '(experimental)'
+        # Wait for prompt
+        time.sleep(1)
+        exec_command_and_wait_for_pattern(self, 'version', gcc_version)
 
     @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_linux_sash(self):
@@ -55,18 +59,19 @@ def test_linux_sash(self):
         :avocado: tags=machine:gdbsim-r5f562n7
         :avocado: tags=endian:little
         """
-        dtb_url = ('https://acc.dl.osdn.jp/users/23/23887/rx-virt.dtb')
-        dtb_hash = '7b4e4e2c71905da44e86ce47adee2210b026ac18'
+        dtb_url = ('https://osdn.dl.osdn.net/users/37/37625/rx-virt.dtb')
+        dtb_hash = 'c69ee47d322285d1fc359d18d50b74e385b4d76c'
         dtb_path = self.fetch_asset(dtb_url, asset_hash=dtb_hash)
-        kernel_url = ('http://acc.dl.osdn.jp/users/23/23845/zImage')
-        kernel_hash = '39a81067f8d72faad90866ddfefa19165d68fc99'
+        kernel_url = ('https://osdn.dl.osdn.net/users/37/37623/zImage')
+        kernel_hash = '7aa396cd62d81d05fb5f8d7e56154cf4bf20e029'
         kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
 
         self.vm.set_console()
         kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'earlycon'
         self.vm.add_args('-kernel', kernel_path,
                          '-dtb', dtb_path,
-                         '-no-reboot')
+                         '-no-reboot',
+                         '-append', kernel_command_line)
         self.vm.launch()
         wait_for_console_pattern(self, 'Sash command shell (version 1.1.1)',
                                  failure_message='Kernel panic - not syncing')
-- 
2.30.2


