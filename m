Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3141C372395
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 01:25:59 +0200 (CEST)
Received: from localhost ([::1]:38846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhws-0005FI-6f
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 19:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ldhIb-0002l8-Ma
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:44:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ldhIY-0007OR-32
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:44:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620081856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KMtJt5XBtvo1jrR71Hr9QYznAUGCS99ndKySs7xNSUs=;
 b=D9ugGKYp1i9RnW4AKaM89xjbNdbDMXe2sYOijIhXWwLxyOv5zABhYN3iWv+vONSIEZ86MA
 /dUe6vekg2brOeOQmu5bzdvFY9bZBcIKxo4xTSJT/w8ldU2Su7gZWL9epNRhY+LC/fOD2I
 kQ7wS0fp3p+W7tOfqJkIdPL3jzuOnLQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-lHHRBrMZPo-b1q6r0h-Lwg-1; Mon, 03 May 2021 18:44:07 -0400
X-MC-Unique: lHHRBrMZPo-b1q6r0h-Lwg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6ECE48189C4
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 22:44:06 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-131.gru2.redhat.com
 [10.97.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6EB36060F;
 Mon,  3 May 2021 22:44:01 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] tests/acceptance: Move wait_for_console_pattern to
 ConsoleMixIn
Date: Mon,  3 May 2021 19:43:25 -0300
Message-Id: <20210503224326.206208-7-wainersm@redhat.com>
In-Reply-To: <20210503224326.206208-1-wainersm@redhat.com>
References: <20210503224326.206208-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: willianr@redhat.com, philmd@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This moved wait_for_console_pattern() to ConsoleMixIn.

By far this change required the most adaptations on tests.

Notice that:

 1) Some tests from boot_linux_console.py were using the wait_for_console_pattern()
    from the avocado_qemu package rather than the overloaded method on the
    LinuxKernelTest class, and that explains the explict calls to
    ConsoleMixIn.wait_for_console_pattern().

    Likewise in boot_xen.py file.

 2) In virtiofs_submounts.py, wait_for_console_pattern() was imported but not used.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py    | 23 +++++++++-----------
 tests/acceptance/boot_linux_console.py       | 14 ++++++------
 tests/acceptance/boot_xen.py                 |  5 +++--
 tests/acceptance/linux_ssh_mips_malta.py     |  8 +++----
 tests/acceptance/machine_arm_canona1100.py   |  6 ++---
 tests/acceptance/machine_arm_integratorcp.py |  8 +++----
 tests/acceptance/machine_arm_n8x0.py         |  6 ++---
 tests/acceptance/machine_microblaze.py       |  8 +++----
 tests/acceptance/machine_mips_loongson3v.py  |  6 ++---
 tests/acceptance/machine_mips_malta.py       |  6 ++---
 tests/acceptance/machine_ppc.py              | 10 ++++-----
 tests/acceptance/machine_rx_gdbsim.py        |  7 +++---
 tests/acceptance/machine_s390_ccw_virtio.py  |  7 +++---
 tests/acceptance/machine_sparc64_sun4u.py    |  6 ++---
 tests/acceptance/machine_sparc_leon3.py      |  8 +++----
 tests/acceptance/multiprocess.py             |  5 ++---
 tests/acceptance/ppc_prep_40p.py             | 16 +++++++-------
 tests/acceptance/virtio-gpu.py               |  4 +---
 tests/acceptance/virtiofs_submounts.py       |  1 -
 19 files changed, 73 insertions(+), 81 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 4a0129c0eb..b21f9ea3ff 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -101,19 +101,6 @@ def _console_interaction(test, success_message, failure_message,
                     (failure_message, success_message)
             test.fail(fail)
 
-def wait_for_console_pattern(test, success_message, failure_message=None,
-                             vm=None):
-    """
-    Waits for messages to appear on the console, while logging the content
-
-    :param test: an Avocado test containing a VM that will have its console
-                 read and probed for a success or failure message
-    :type test: :class:`avocado_qemu.Test`
-    :param success_message: if this message appears, test succeeds
-    :param failure_message: if this message appears, test fails
-    """
-    _console_interaction(test, success_message, failure_message, None, vm=vm)
-
 class ConsoleMixIn():
     """Contains utilities for interacting with a guest via Console."""
 
@@ -163,6 +150,16 @@ def interrupt_interactive_console_until_pattern(self, success_message,
         _console_interaction(self, success_message, failure_message,
                          interrupt_string, True)
 
+    def wait_for_console_pattern(self, success_message, failure_message=None,
+                             vm=None):
+        """
+        Waits for messages to appear on the console, while logging the content
+
+        :param success_message: if this message appears, test succeeds
+        :param failure_message: if this message appears, test fails
+        """
+        _console_interaction(self, success_message, failure_message, None, vm=vm)
+
 class Test(avocado.Test):
     def _get_unique_tag_val(self, tag_name):
         """
diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 50e0a3fe79..e8d7a127fe 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -17,7 +17,6 @@
 from avocado import skipUnless
 from avocado_qemu import Test
 from avocado_qemu import ConsoleMixIn
-from avocado_qemu import wait_for_console_pattern
 from avocado.utils import process
 from avocado.utils import archive
 from avocado.utils.path import find_command, CmdNotFoundError
@@ -48,7 +47,7 @@ class LinuxKernelTest(Test, ConsoleMixIn):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
 
     def wait_for_console_pattern(self, success_message, vm=None):
-        wait_for_console_pattern(self, success_message,
+        super().wait_for_console_pattern(success_message,
                                  failure_message='Kernel panic - not syncing',
                                  vm=vm)
 
@@ -262,7 +261,7 @@ def test_mips64el_malta_5KEc_cpio(self):
                          '-append', kernel_command_line,
                          '-no-reboot')
         self.vm.launch()
-        wait_for_console_pattern(self, 'Boot successful.')
+        ConsoleMixIn.wait_for_console_pattern(self, 'Boot successful.')
 
         self.exec_command_and_wait_for_pattern('cat /proc/cpuinfo',
                                                'MIPS 5KE')
@@ -877,7 +876,7 @@ def test_arm_orangepi_uboot_netbsd9(self):
                          '-global', 'allwinner-rtc.base-year=2000',
                          '-no-reboot')
         self.vm.launch()
-        wait_for_console_pattern(self, 'U-Boot 2020.01+dfsg-1')
+        ConsoleMixIn.wait_for_console_pattern(self, 'U-Boot 2020.01+dfsg-1')
         self.interrupt_interactive_console_until_pattern(
                                        'Hit any key to stop autoboot:',
                                        'switch to partitions #0, OK')
@@ -897,10 +896,11 @@ def test_arm_orangepi_uboot_netbsd9(self):
 
         self.exec_command_and_wait_for_pattern('boot',
                                           'Booting kernel from Legacy Image')
-        wait_for_console_pattern(self, 'Starting kernel ...')
-        wait_for_console_pattern(self, 'NetBSD 9.0 (GENERIC)')
+        ConsoleMixIn.wait_for_console_pattern(self, 'Starting kernel ...')
+        ConsoleMixIn.wait_for_console_pattern(self, 'NetBSD 9.0 (GENERIC)')
         # Wait for user-space
-        wait_for_console_pattern(self, 'Starting root file system check')
+        ConsoleMixIn.wait_for_console_pattern(self,
+                                            'Starting root file system check')
 
     def test_aarch64_raspi3_atf(self):
         """
diff --git a/tests/acceptance/boot_xen.py b/tests/acceptance/boot_xen.py
index 75c2d44492..9b5506398e 100644
--- a/tests/acceptance/boot_xen.py
+++ b/tests/acceptance/boot_xen.py
@@ -14,7 +14,6 @@
 import os
 
 from avocado import skipIf
-from avocado_qemu import wait_for_console_pattern
 from boot_linux_console import LinuxKernelTest
 
 
@@ -59,7 +58,9 @@ def launch_xen(self, xen_path):
         self.vm.launch()
 
         console_pattern = 'VFS: Cannot open root device'
-        wait_for_console_pattern(self, console_pattern, "Panic on CPU 0:")
+        # pylint: disable=E1003
+        super(LinuxKernelTest, self).wait_for_console_pattern(console_pattern,
+            "Panic on CPU 0:")
 
 
 class BootXen(BootXenBase):
diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptance/linux_ssh_mips_malta.py
index 6dbd02d49d..8d8531b6c5 100644
--- a/tests/acceptance/linux_ssh_mips_malta.py
+++ b/tests/acceptance/linux_ssh_mips_malta.py
@@ -13,13 +13,13 @@
 
 from avocado import skipUnless
 from avocado_qemu import Test
-from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import ConsoleMixIn
 from avocado.utils import process
 from avocado.utils import archive
 from avocado.utils import ssh
 
 
-class LinuxSSH(Test):
+class LinuxSSH(Test, ConsoleMixIn):
 
     timeout = 150 # Not for 'configure --enable-debug --enable-debug-tcg'
 
@@ -126,7 +126,7 @@ def boot_debian_wheezy_image_and_ssh_login(self, endianess, kernel_path):
 
         self.log.info('VM launched, waiting for sshd')
         console_pattern = 'Starting OpenBSD Secure Shell server: sshd'
-        wait_for_console_pattern(self, console_pattern, 'Oops')
+        self.wait_for_console_pattern(console_pattern, 'Oops')
         self.log.info('sshd ready')
 
         self.ssh_connect('root', 'root')
@@ -134,7 +134,7 @@ def boot_debian_wheezy_image_and_ssh_login(self, endianess, kernel_path):
     def shutdown_via_ssh(self):
         self.ssh_command('poweroff')
         self.ssh_disconnect_vm()
-        wait_for_console_pattern(self, 'Power down', 'Oops')
+        self.wait_for_console_pattern('Power down', 'Oops')
 
     def ssh_command_output_contains(self, cmd, exp):
         stdout, _ = self.ssh_command(cmd)
diff --git a/tests/acceptance/machine_arm_canona1100.py b/tests/acceptance/machine_arm_canona1100.py
index 0e5c43dbcf..945aa83270 100644
--- a/tests/acceptance/machine_arm_canona1100.py
+++ b/tests/acceptance/machine_arm_canona1100.py
@@ -9,10 +9,10 @@
 # later.  See the COPYING file in the top-level directory.
 
 from avocado_qemu import Test
-from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import ConsoleMixIn
 from avocado.utils import archive
 
-class CanonA1100Machine(Test):
+class CanonA1100Machine(Test, ConsoleMixIn):
     """Boots the barebox firmware and checks that the console is operational"""
 
     timeout = 90
@@ -32,4 +32,4 @@ def test_arm_canona1100(self):
         self.vm.add_args('-bios',
                          self.workdir + '/day18/barebox.canon-a1100.bin')
         self.vm.launch()
-        wait_for_console_pattern(self, 'running /env/bin/init')
+        self.wait_for_console_pattern('running /env/bin/init')
diff --git a/tests/acceptance/machine_arm_integratorcp.py b/tests/acceptance/machine_arm_integratorcp.py
index 49c8ebff78..490bafa571 100644
--- a/tests/acceptance/machine_arm_integratorcp.py
+++ b/tests/acceptance/machine_arm_integratorcp.py
@@ -13,7 +13,7 @@
 
 from avocado import skipUnless
 from avocado_qemu import Test
-from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import ConsoleMixIn
 
 
 NUMPY_AVAILABLE = True
@@ -29,7 +29,7 @@
     CV2_AVAILABLE = False
 
 
-class IntegratorMachine(Test):
+class IntegratorMachine(Test, ConsoleMixIn):
 
     timeout = 90
 
@@ -59,7 +59,7 @@ def test_integratorcp_console(self):
         :avocado: tags=device:pl011
         """
         self.boot_integratorcp()
-        wait_for_console_pattern(self, 'Log in as root')
+        self.wait_for_console_pattern('Log in as root')
 
     @skipUnless(NUMPY_AVAILABLE, 'Python NumPy not installed')
     @skipUnless(CV2_AVAILABLE, 'Python OpenCV not installed')
@@ -80,7 +80,7 @@ def test_framebuffer_tux_logo(self):
 
         self.boot_integratorcp()
         framebuffer_ready = 'Console: switching to colour frame buffer device'
-        wait_for_console_pattern(self, framebuffer_ready)
+        self.wait_for_console_pattern(framebuffer_ready)
         self.vm.command('human-monitor-command', command_line='stop')
         self.vm.command('human-monitor-command',
                         command_line='screendump %s' % screendump_path)
diff --git a/tests/acceptance/machine_arm_n8x0.py b/tests/acceptance/machine_arm_n8x0.py
index e5741f2d8d..403415243e 100644
--- a/tests/acceptance/machine_arm_n8x0.py
+++ b/tests/acceptance/machine_arm_n8x0.py
@@ -12,9 +12,9 @@
 
 from avocado import skipUnless
 from avocado_qemu import Test
-from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import ConsoleMixIn
 
-class N8x0Machine(Test):
+class N8x0Machine(Test, ConsoleMixIn):
     """Boots the Linux kernel and checks that the console is operational"""
 
     timeout = 90
@@ -30,7 +30,7 @@ def __do_test_n8x0(self):
         self.vm.add_args('-kernel', kernel_path,
                          '-append', 'printk.time=0 console=ttyS1')
         self.vm.launch()
-        wait_for_console_pattern(self, 'TSC2005 driver initializing')
+        self.wait_for_console_pattern('TSC2005 driver initializing')
 
     @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
     def test_n800(self):
diff --git a/tests/acceptance/machine_microblaze.py b/tests/acceptance/machine_microblaze.py
index 7f6d18495d..d6ecd69e95 100644
--- a/tests/acceptance/machine_microblaze.py
+++ b/tests/acceptance/machine_microblaze.py
@@ -6,10 +6,10 @@
 # later. See the COPYING file in the top-level directory.
 
 from avocado_qemu import Test
-from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import ConsoleMixIn
 from avocado.utils import archive
 
-class MicroblazeMachine(Test):
+class MicroblazeMachine(Test, ConsoleMixIn):
 
     timeout = 90
 
@@ -27,8 +27,8 @@ def test_microblaze_s3adsp1800(self):
         self.vm.set_console()
         self.vm.add_args('-kernel', self.workdir + '/day17/ballerina.bin')
         self.vm.launch()
-        wait_for_console_pattern(self, 'This architecture does not have '
-                                       'kernel memory protection')
+        self.wait_for_console_pattern('This architecture does not have '
+                                      'kernel memory protection')
         # Note:
         # The kernel sometimes gets stuck after the "This architecture ..."
         # message, that's why we don't test for a later string here. This
diff --git a/tests/acceptance/machine_mips_loongson3v.py b/tests/acceptance/machine_mips_loongson3v.py
index 85b131a40f..58242d5c9b 100644
--- a/tests/acceptance/machine_mips_loongson3v.py
+++ b/tests/acceptance/machine_mips_loongson3v.py
@@ -12,9 +12,9 @@
 
 from avocado import skipUnless
 from avocado_qemu import Test
-from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import ConsoleMixIn
 
-class MipsLoongson3v(Test):
+class MipsLoongson3v(Test, ConsoleMixIn):
     timeout = 60
 
     @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
@@ -36,4 +36,4 @@ def test_pmon_serial_console(self):
         self.vm.set_console()
         self.vm.add_args('-bios', pmon_path)
         self.vm.launch()
-        wait_for_console_pattern(self, 'CPU GODSON3 BogoMIPS:')
+        self.wait_for_console_pattern('CPU GODSON3 BogoMIPS:')
diff --git a/tests/acceptance/machine_mips_malta.py b/tests/acceptance/machine_mips_malta.py
index 7c9a4ee4d2..e05fa862cc 100644
--- a/tests/acceptance/machine_mips_malta.py
+++ b/tests/acceptance/machine_mips_malta.py
@@ -13,7 +13,7 @@
 
 from avocado import skipUnless
 from avocado_qemu import Test
-from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import ConsoleMixIn
 from avocado.utils import archive
 from avocado import skipIf
 
@@ -33,7 +33,7 @@
 
 @skipUnless(NUMPY_AVAILABLE, 'Python NumPy not installed')
 @skipUnless(CV2_AVAILABLE, 'Python OpenCV not installed')
-class MaltaMachineFramebuffer(Test):
+class MaltaMachineFramebuffer(Test, ConsoleMixIn):
 
     timeout = 30
 
@@ -68,7 +68,7 @@ def do_test_i6400_framebuffer_logo(self, cpu_cores_count):
                          '-append', kernel_command_line)
         self.vm.launch()
         framebuffer_ready = 'Console: switching to colour frame buffer device'
-        wait_for_console_pattern(self, framebuffer_ready,
+        self.wait_for_console_pattern(framebuffer_ready,
                                  failure_message='Kernel panic - not syncing')
         self.vm.command('human-monitor-command', command_line='stop')
         self.vm.command('human-monitor-command',
diff --git a/tests/acceptance/machine_ppc.py b/tests/acceptance/machine_ppc.py
index a836e2496f..61f378a3a2 100644
--- a/tests/acceptance/machine_ppc.py
+++ b/tests/acceptance/machine_ppc.py
@@ -7,9 +7,9 @@
 
 from avocado.utils import archive
 from avocado_qemu import Test
-from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import ConsoleMixIn
 
-class PpcMachine(Test):
+class PpcMachine(Test, ConsoleMixIn):
 
     timeout = 90
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
@@ -32,7 +32,7 @@ def test_ppc64_pseries(self):
                          '-append', kernel_command_line)
         self.vm.launch()
         console_pattern = 'Kernel command line: %s' % kernel_command_line
-        wait_for_console_pattern(self, console_pattern, self.panic_message)
+        self.wait_for_console_pattern(console_pattern, self.panic_message)
 
     def test_ppc_mpc8544ds(self):
         """
@@ -47,7 +47,7 @@ def test_ppc_mpc8544ds(self):
         self.vm.set_console()
         self.vm.add_args('-kernel', self.workdir + '/creek/creek.bin')
         self.vm.launch()
-        wait_for_console_pattern(self, 'QEMU advent calendar 2020',
+        self.wait_for_console_pattern('QEMU advent calendar 2020',
                                  self.panic_message)
 
     def test_ppc_virtex_ml507(self):
@@ -65,5 +65,5 @@ def test_ppc_virtex_ml507(self):
                          '-dtb', self.workdir + '/hippo/virtex440-ml507.dtb',
                          '-m', '512')
         self.vm.launch()
-        wait_for_console_pattern(self, 'QEMU advent calendar 2020',
+        self.wait_for_console_pattern('QEMU advent calendar 2020',
                                  self.panic_message)
diff --git a/tests/acceptance/machine_rx_gdbsim.py b/tests/acceptance/machine_rx_gdbsim.py
index a893273bad..7a77cfe116 100644
--- a/tests/acceptance/machine_rx_gdbsim.py
+++ b/tests/acceptance/machine_rx_gdbsim.py
@@ -13,7 +13,6 @@
 from avocado import skipIf
 from avocado_qemu import Test
 from avocado_qemu import ConsoleMixIn
-from avocado_qemu import wait_for_console_pattern
 from avocado.utils import archive
 
 
@@ -41,7 +40,7 @@ def test_uboot(self):
                          '-no-reboot')
         self.vm.launch()
         uboot_version = 'U-Boot 2016.05-rc3-23705-ga1ef3c71cb-dirty'
-        wait_for_console_pattern(self, uboot_version)
+        self.wait_for_console_pattern(uboot_version)
         gcc_version = 'rx-unknown-linux-gcc (GCC) 9.0.0 20181105 (experimental)'
         # FIXME limit baudrate on chardev, else we type too fast
         #self.exec_command_and_wait_for_pattern('version', gcc_version)
@@ -68,6 +67,6 @@ def test_linux_sash(self):
                          '-dtb', dtb_path,
                          '-no-reboot')
         self.vm.launch()
-        wait_for_console_pattern(self, 'Sash command shell (version 1.1.1)',
-                                 failure_message='Kernel panic - not syncing')
+        self.wait_for_console_pattern('Sash command shell (version 1.1.1)',
+                                      failure_message='Kernel panic - not syncing')
         self.exec_command_and_wait_for_pattern('printenv', 'TERM=linux')
diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
index 537393c42f..bc1606ae43 100644
--- a/tests/acceptance/machine_s390_ccw_virtio.py
+++ b/tests/acceptance/machine_s390_ccw_virtio.py
@@ -15,7 +15,6 @@
 from avocado import skipIf
 from avocado_qemu import Test
 from avocado_qemu import ConsoleMixIn
-from avocado_qemu import wait_for_console_pattern
 from avocado.utils import archive
 
 class S390CCWVirtioMachine(Test, ConsoleMixIn):
@@ -24,9 +23,9 @@ class S390CCWVirtioMachine(Test, ConsoleMixIn):
     timeout = 120
 
     def wait_for_console_pattern(self, success_message, vm=None):
-        wait_for_console_pattern(self, success_message,
-                                 failure_message='Kernel panic - not syncing',
-                                 vm=vm)
+        super().wait_for_console_pattern(success_message,
+                                       failure_message='Kernel panic - not syncing',
+                                       vm=vm)
 
     def wait_for_crw_reports(self):
         self.exec_command_and_wait_for_pattern(
diff --git a/tests/acceptance/machine_sparc64_sun4u.py b/tests/acceptance/machine_sparc64_sun4u.py
index c7ad474bdc..810f11b049 100644
--- a/tests/acceptance/machine_sparc64_sun4u.py
+++ b/tests/acceptance/machine_sparc64_sun4u.py
@@ -9,10 +9,10 @@
 # later. See the COPYING file in the top-level directory.
 
 from avocado.utils import archive
+from avocado_qemu import ConsoleMixIn
 from avocado_qemu import Test
-from avocado_qemu import wait_for_console_pattern
 
-class Sun4uMachine(Test):
+class Sun4uMachine(Test, ConsoleMixIn):
     """Boots the Linux kernel and checks that the console is operational"""
 
     timeout = 90
@@ -32,4 +32,4 @@ def test_sparc64_sun4u(self):
         self.vm.add_args('-kernel', self.workdir + '/day23/vmlinux',
                          '-append', self.KERNEL_COMMON_COMMAND_LINE)
         self.vm.launch()
-        wait_for_console_pattern(self, 'Starting logging: OK')
+        self.wait_for_console_pattern('Starting logging: OK')
diff --git a/tests/acceptance/machine_sparc_leon3.py b/tests/acceptance/machine_sparc_leon3.py
index 2405cd7a0d..1bf7812987 100644
--- a/tests/acceptance/machine_sparc_leon3.py
+++ b/tests/acceptance/machine_sparc_leon3.py
@@ -6,11 +6,11 @@
 # later. See the COPYING file in the top-level directory.
 
 from avocado_qemu import Test
-from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import ConsoleMixIn
 from avocado import skip
 
 
-class Leon3Machine(Test):
+class Leon3Machine(Test, ConsoleMixIn):
 
     timeout = 60
 
@@ -33,5 +33,5 @@ def test_leon3_helenos_uimage(self):
 
         self.vm.launch()
 
-        wait_for_console_pattern(self, 'Copyright (c) 2001-2014 HelenOS project')
-        wait_for_console_pattern(self, 'Booting the kernel ...')
+        self.wait_for_console_pattern('Copyright (c) 2001-2014 HelenOS project')
+        self.wait_for_console_pattern('Booting the kernel ...')
diff --git a/tests/acceptance/multiprocess.py b/tests/acceptance/multiprocess.py
index b4a6d20770..9f487fb7bc 100644
--- a/tests/acceptance/multiprocess.py
+++ b/tests/acceptance/multiprocess.py
@@ -8,7 +8,6 @@
 import socket
 
 from avocado_qemu import Test
-from avocado_qemu import wait_for_console_pattern
 from avocado_qemu import ConsoleMixIn
 
 class Multiprocess(Test, ConsoleMixIn):
@@ -56,8 +55,8 @@ def do_test(self, kernel_url, initrd_url, kernel_command_line,
                          'x-pci-proxy-dev,'
                          'id=lsi1,fd='+str(proxy_sock.fileno()))
         self.vm.launch()
-        wait_for_console_pattern(self, 'as init process',
-                                 'Kernel panic - not syncing')
+        self.wait_for_console_pattern('as init process',
+                                      'Kernel panic - not syncing')
         self.exec_command('mount -t sysfs sysfs /sys')
         self.exec_command_and_wait_for_pattern(
                                           'cat /sys/bus/pci/devices/*/uevent',
diff --git a/tests/acceptance/ppc_prep_40p.py b/tests/acceptance/ppc_prep_40p.py
index 96ba13b894..35475892be 100644
--- a/tests/acceptance/ppc_prep_40p.py
+++ b/tests/acceptance/ppc_prep_40p.py
@@ -10,10 +10,10 @@
 from avocado import skipIf
 from avocado import skipUnless
 from avocado_qemu import Test
-from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import ConsoleMixIn
 
 
-class IbmPrep40pMachine(Test):
+class IbmPrep40pMachine(Test, ConsoleMixIn):
 
     timeout = 60
 
@@ -44,8 +44,8 @@ def test_factory_firmware_and_netbsd(self):
                          '-fda', drive_path)
         self.vm.launch()
         os_banner = 'NetBSD 4.0 (GENERIC) #0: Sun Dec 16 00:49:40 PST 2007'
-        wait_for_console_pattern(self, os_banner)
-        wait_for_console_pattern(self, 'Model: IBM PPS Model 6015')
+        self.wait_for_console_pattern(os_banner)
+        self.wait_for_console_pattern('Model: IBM PPS Model 6015')
 
     def test_openbios_192m(self):
         """
@@ -56,9 +56,9 @@ def test_openbios_192m(self):
         self.vm.add_args('-m', '192') # test fw_cfg
 
         self.vm.launch()
-        wait_for_console_pattern(self, '>> OpenBIOS')
-        wait_for_console_pattern(self, '>> Memory: 192M')
-        wait_for_console_pattern(self, '>> CPU type PowerPC,604')
+        self.wait_for_console_pattern('>> OpenBIOS')
+        self.wait_for_console_pattern('>> Memory: 192M')
+        self.wait_for_console_pattern('>> CPU type PowerPC,604')
 
     def test_openbios_and_netbsd(self):
         """
@@ -75,4 +75,4 @@ def test_openbios_and_netbsd(self):
                          '-boot', 'd')
 
         self.vm.launch()
-        wait_for_console_pattern(self, 'NetBSD/prep BOOT, Revision 1.9')
+        self.wait_for_console_pattern('NetBSD/prep BOOT, Revision 1.9')
diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
index 4d65431ef1..a7e6bbb8a2 100644
--- a/tests/acceptance/virtio-gpu.py
+++ b/tests/acceptance/virtio-gpu.py
@@ -6,7 +6,6 @@
 
 from avocado_qemu import Test
 from avocado_qemu import BUILD_DIR
-from avocado_qemu import wait_for_console_pattern
 from avocado_qemu import ConsoleMixIn
 from avocado_qemu import is_readable_executable_file
 
@@ -49,8 +48,7 @@ class VirtioGPUx86(Test, ConsoleMixIn):
     )
 
     def wait_for_console_pattern(self, success_message, vm=None):
-        wait_for_console_pattern(
-            self,
+        super().wait_for_console_pattern(
             success_message,
             failure_message="Kernel panic - not syncing",
             vm=vm,
diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index 46fa65392a..ad1999a372 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -6,7 +6,6 @@
 
 from avocado import skipUnless
 from avocado_qemu import LinuxTest, BUILD_DIR
-from avocado_qemu import wait_for_console_pattern
 from avocado.utils import ssh
 
 
-- 
2.29.2


