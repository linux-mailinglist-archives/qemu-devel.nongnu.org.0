Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6038E37238B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 01:21:21 +0200 (CEST)
Received: from localhost ([::1]:60816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhsM-0002XX-Hl
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 19:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ldhID-0002Rf-40
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:43:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ldhI9-0007GO-QZ
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620081833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oHQqw87MkCtXD/OLZu48M60oAB2ElURJbeSvmem+tH8=;
 b=hdLf87gIPe3mzk9BzwtCris5Q0wxzqmBAILFw3xhcFtg2n/XgnNPMXR8eqFHvcIM7HNHUt
 Dgg2qaqdoyM/H3PdDiZIhzJApvMuld1xUqQyMLHYrxD0H0dO6twntYHrUcBvsOFk0OdIy7
 J8fVS9T9XG/z6yrV8BUA82m29H7z6ok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-diHcQkTVOAiGqkmSlYh8VA-1; Mon, 03 May 2021 18:43:50 -0400
X-MC-Unique: diHcQkTVOAiGqkmSlYh8VA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2971A107ACCD
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 22:43:50 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-131.gru2.redhat.com
 [10.97.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 041D06060F;
 Mon,  3 May 2021 22:43:46 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] tests/acceptance: Move exec_command_and_wait_for_pattern
 to ConsoleMixIn
Date: Mon,  3 May 2021 19:43:22 -0300
Message-Id: <20210503224326.206208-4-wainersm@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
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

It was the time of exec_command_and_wait_for_pattern() to find a new
home at ConsoleMixIn. This time various tests needed to be adapted.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py   |  29 +++---
 tests/acceptance/boot_linux_console.py      | 107 ++++++++++----------
 tests/acceptance/machine_rx_gdbsim.py       |   8 +-
 tests/acceptance/machine_s390_ccw_virtio.py |  72 ++++++-------
 tests/acceptance/multiprocess.py            |   3 +-
 tests/acceptance/virtio-gpu.py              |  12 +--
 6 files changed, 111 insertions(+), 120 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 4d3b869765..4a0129c0eb 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -114,22 +114,6 @@ def wait_for_console_pattern(test, success_message, failure_message=None,
     """
     _console_interaction(test, success_message, failure_message, None, vm=vm)
 
-def exec_command_and_wait_for_pattern(test, command,
-                                      success_message, failure_message=None):
-    """
-    Send a command to a console (appending CRLF characters), then wait
-    for success_message to appear on the console, while logging the.
-    content. Mark the test as failed if failure_message is found instead.
-
-    :param test: an Avocado test containing a VM that will have its console
-                 read and probed for a success or failure message
-    :type test: :class:`avocado_qemu.Test`
-    :param command: the command to send
-    :param success_message: if this message appears, test succeeds
-    :param failure_message: if this message appears, test fails
-    """
-    _console_interaction(test, success_message, failure_message, command + '\r')
-
 class ConsoleMixIn():
     """Contains utilities for interacting with a guest via Console."""
 
@@ -143,6 +127,19 @@ def exec_command(self, command):
         """
         _console_interaction(self, None, None, command + '\r')
 
+    def exec_command_and_wait_for_pattern(self, command,
+                                          success_message, failure_message=None):
+        """
+        Send a command to a console (appending CRLF characters), then wait
+        for success_message to appear on the console, while logging the.
+        content. Mark the test as failed if failure_message is found instead.
+
+        :param command: the command to send
+        :param success_message: if this message appears, test succeeds
+        :param failure_message: if this message appears, test fails
+        """
+        _console_interaction(self, success_message, failure_message, command + '\r')
+
     def interrupt_interactive_console_until_pattern(self, success_message,
                                                     failure_message=None,
                                                     interrupt_string='\r'):
diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 10317b232b..50e0a3fe79 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -16,7 +16,6 @@
 from avocado import skip
 from avocado import skipUnless
 from avocado_qemu import Test
-from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado_qemu import ConsoleMixIn
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import process
@@ -223,12 +222,12 @@ def test_mips_malta_cpio(self):
         self.vm.launch()
         self.wait_for_console_pattern('Boot successful.')
 
-        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
-                                                'BogoMIPS')
-        exec_command_and_wait_for_pattern(self, 'uname -a',
-                                                'Debian')
-        exec_command_and_wait_for_pattern(self, 'reboot',
-                                                'reboot: Restarting system')
+        self.exec_command_and_wait_for_pattern('cat /proc/cpuinfo',
+                                               'BogoMIPS')
+        self.exec_command_and_wait_for_pattern('uname -a',
+                                               'Debian')
+        self.exec_command_and_wait_for_pattern('reboot',
+                                               'reboot: Restarting system')
         # Wait for VM to shut down gracefully
         self.vm.wait()
 
@@ -265,12 +264,12 @@ def test_mips64el_malta_5KEc_cpio(self):
         self.vm.launch()
         wait_for_console_pattern(self, 'Boot successful.')
 
-        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
-                                                'MIPS 5KE')
-        exec_command_and_wait_for_pattern(self, 'uname -a',
-                                                '3.19.3.mtoman.20150408')
-        exec_command_and_wait_for_pattern(self, 'reboot',
-                                                'reboot: Restarting system')
+        self.exec_command_and_wait_for_pattern('cat /proc/cpuinfo',
+                                               'MIPS 5KE')
+        self.exec_command_and_wait_for_pattern('uname -a',
+                                               '3.19.3.mtoman.20150408')
+        self.exec_command_and_wait_for_pattern('reboot',
+                                               'reboot: Restarting system')
         # Wait for VM to shut down gracefully
         self.vm.wait()
 
@@ -422,9 +421,9 @@ def test_arm_emcraft_sf2(self):
         self.vm.launch()
         self.wait_for_console_pattern('Enter \'help\' for a list')
 
-        exec_command_and_wait_for_pattern(self, 'ifconfig eth0 10.0.2.15',
-                                                 'eth0: link becomes ready')
-        exec_command_and_wait_for_pattern(self, 'ping -c 3 10.0.2.2',
+        self.exec_command_and_wait_for_pattern('ifconfig eth0 10.0.2.15',
+                                               'eth0: link becomes ready')
+        self.exec_command_and_wait_for_pattern('ping -c 3 10.0.2.2',
             '3 packets transmitted, 3 packets received, 0% packet loss')
 
     def do_test_arm_raspi2(self, uart_id):
@@ -541,10 +540,10 @@ def test_arm_cubieboard_initrd(self):
         self.vm.launch()
         self.wait_for_console_pattern('Boot successful.')
 
-        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
-                                                'Allwinner sun4i/sun5i')
-        exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
-                                                'system-control@1c00000')
+        self.exec_command_and_wait_for_pattern('cat /proc/cpuinfo',
+                                               'Allwinner sun4i/sun5i')
+        self.exec_command_and_wait_for_pattern('cat /proc/iomem',
+                                               'system-control@1c00000')
         # cubieboard's reboot is not functioning; omit reboot test.
 
     def test_arm_cubieboard_sata(self):
@@ -584,10 +583,10 @@ def test_arm_cubieboard_sata(self):
         self.vm.launch()
         self.wait_for_console_pattern('Boot successful.')
 
-        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
-                                                'Allwinner sun4i/sun5i')
-        exec_command_and_wait_for_pattern(self, 'cat /proc/partitions',
-                                                'sda')
+        self.exec_command_and_wait_for_pattern('cat /proc/cpuinfo',
+                                               'Allwinner sun4i/sun5i')
+        self.exec_command_and_wait_for_pattern('cat /proc/partitions',
+                                               'sda')
         # cubieboard's reboot is not functioning; omit reboot test.
 
     @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
@@ -628,11 +627,11 @@ def test_arm_quanta_gsj(self):
         self.wait_for_console_pattern('U-Boot ')
         self.interrupt_interactive_console_until_pattern(
                 'Hit any key to stop autoboot:', 'U-Boot>')
-        exec_command_and_wait_for_pattern(
-                self, "setenv bootargs ${bootargs} " + kernel_command_line,
+        self.exec_command_and_wait_for_pattern(
+                "setenv bootargs ${bootargs} " + kernel_command_line,
                 'U-Boot>')
-        exec_command_and_wait_for_pattern(
-                self, 'run romboot', 'Booting Kernel from flash')
+        self.exec_command_and_wait_for_pattern(
+                'run romboot', 'Booting Kernel from flash')
         self.wait_for_console_pattern('Booting Linux on physical CPU 0x0')
         self.wait_for_console_pattern('CPU1: thread -1, cpu 1, socket 0')
         self.wait_for_console_pattern('OpenBMC Project Reference Distro')
@@ -732,12 +731,12 @@ def test_arm_orangepi_initrd(self):
         self.vm.launch()
         self.wait_for_console_pattern('Boot successful.')
 
-        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
-                                                'Allwinner sun8i Family')
-        exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
-                                                'system-control@1c00000')
-        exec_command_and_wait_for_pattern(self, 'reboot',
-                                                'reboot: Restarting system')
+        self.exec_command_and_wait_for_pattern('cat /proc/cpuinfo',
+                                               'Allwinner sun8i Family')
+        self.exec_command_and_wait_for_pattern('cat /proc/iomem',
+                                               'system-control@1c00000')
+        self.exec_command_and_wait_for_pattern('reboot',
+                                               'reboot: Restarting system')
         # Wait for VM to shut down gracefully
         self.vm.wait()
 
@@ -777,18 +776,18 @@ def test_arm_orangepi_sd(self):
         shell_ready = "/bin/sh: can't access tty; job control turned off"
         self.wait_for_console_pattern(shell_ready)
 
-        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
-                                                'Allwinner sun8i Family')
-        exec_command_and_wait_for_pattern(self, 'cat /proc/partitions',
-                                                'mmcblk0')
-        exec_command_and_wait_for_pattern(self, 'ifconfig eth0 up',
-                                                 'eth0: Link is Up')
-        exec_command_and_wait_for_pattern(self, 'udhcpc eth0',
+        self.exec_command_and_wait_for_pattern('cat /proc/cpuinfo',
+                                               'Allwinner sun8i Family')
+        self.exec_command_and_wait_for_pattern('cat /proc/partitions',
+                                               'mmcblk0')
+        self.exec_command_and_wait_for_pattern('ifconfig eth0 up',
+                                               'eth0: Link is Up')
+        self.exec_command_and_wait_for_pattern('udhcpc eth0',
             'udhcpc: lease of 10.0.2.15 obtained')
-        exec_command_and_wait_for_pattern(self, 'ping -c 3 10.0.2.2',
+        self.exec_command_and_wait_for_pattern('ping -c 3 10.0.2.2',
             '3 packets transmitted, 3 packets received, 0% packet loss')
-        exec_command_and_wait_for_pattern(self, 'reboot',
-                                                'reboot: Restarting system')
+        self.exec_command_and_wait_for_pattern('reboot',
+                                               'reboot: Restarting system')
         # Wait for VM to shut down gracefully
         self.vm.wait()
 
@@ -829,10 +828,10 @@ def test_arm_orangepi_bionic_20_08(self):
 
         self.wait_for_console_pattern('U-Boot SPL')
         self.wait_for_console_pattern('Autoboot in ')
-        exec_command_and_wait_for_pattern(self, ' ', '=>')
-        exec_command_and_wait_for_pattern(self, "setenv extraargs '" +
-                                                kernel_command_line + "'", '=>')
-        exec_command_and_wait_for_pattern(self, 'boot', 'Starting kernel ...');
+        self.exec_command_and_wait_for_pattern(' ', '=>')
+        self.exec_command_and_wait_for_pattern("setenv extraargs '" +
+                                               kernel_command_line + "'", '=>')
+        self.exec_command_and_wait_for_pattern('boot', 'Starting kernel ...');
 
         self.wait_for_console_pattern('systemd[1]: Set hostname ' +
                                       'to <orangepipc>')
@@ -883,20 +882,20 @@ def test_arm_orangepi_uboot_netbsd9(self):
                                        'Hit any key to stop autoboot:',
                                        'switch to partitions #0, OK')
 
-        exec_command_and_wait_for_pattern(self, '', '=>')
+        self.exec_command_and_wait_for_pattern('', '=>')
         cmd = 'setenv bootargs root=ld0a'
-        exec_command_and_wait_for_pattern(self, cmd, '=>')
+        self.exec_command_and_wait_for_pattern(cmd, '=>')
         cmd = 'setenv kernel netbsd-GENERIC.ub'
-        exec_command_and_wait_for_pattern(self, cmd, '=>')
+        self.exec_command_and_wait_for_pattern(cmd, '=>')
         cmd = 'setenv fdtfile dtb/sun8i-h3-orangepi-pc.dtb'
-        exec_command_and_wait_for_pattern(self, cmd, '=>')
+        self.exec_command_and_wait_for_pattern(cmd, '=>')
         cmd = ("setenv bootcmd 'fatload mmc 0:1 ${kernel_addr_r} ${kernel}; "
                "fatload mmc 0:1 ${fdt_addr_r} ${fdtfile}; "
                "fdt addr ${fdt_addr_r}; "
                "bootm ${kernel_addr_r} - ${fdt_addr_r}'")
-        exec_command_and_wait_for_pattern(self, cmd, '=>')
+        self.exec_command_and_wait_for_pattern(cmd, '=>')
 
-        exec_command_and_wait_for_pattern(self, 'boot',
+        self.exec_command_and_wait_for_pattern('boot',
                                           'Booting kernel from Legacy Image')
         wait_for_console_pattern(self, 'Starting kernel ...')
         wait_for_console_pattern(self, 'NetBSD 9.0 (GENERIC)')
diff --git a/tests/acceptance/machine_rx_gdbsim.py b/tests/acceptance/machine_rx_gdbsim.py
index 32b737b6d8..a893273bad 100644
--- a/tests/acceptance/machine_rx_gdbsim.py
+++ b/tests/acceptance/machine_rx_gdbsim.py
@@ -12,12 +12,12 @@
 
 from avocado import skipIf
 from avocado_qemu import Test
-from avocado_qemu import exec_command_and_wait_for_pattern
+from avocado_qemu import ConsoleMixIn
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import archive
 
 
-class RxGdbSimMachine(Test):
+class RxGdbSimMachine(Test, ConsoleMixIn):
 
     timeout = 30
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
@@ -44,7 +44,7 @@ def test_uboot(self):
         wait_for_console_pattern(self, uboot_version)
         gcc_version = 'rx-unknown-linux-gcc (GCC) 9.0.0 20181105 (experimental)'
         # FIXME limit baudrate on chardev, else we type too fast
-        #exec_command_and_wait_for_pattern(self, 'version', gcc_version)
+        #self.exec_command_and_wait_for_pattern('version', gcc_version)
 
     @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_linux_sash(self):
@@ -70,4 +70,4 @@ def test_linux_sash(self):
         self.vm.launch()
         wait_for_console_pattern(self, 'Sash command shell (version 1.1.1)',
                                  failure_message='Kernel panic - not syncing')
-        exec_command_and_wait_for_pattern(self, 'printenv', 'TERM=linux')
+        self.exec_command_and_wait_for_pattern('printenv', 'TERM=linux')
diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
index 4028c99afc..537393c42f 100644
--- a/tests/acceptance/machine_s390_ccw_virtio.py
+++ b/tests/acceptance/machine_s390_ccw_virtio.py
@@ -14,11 +14,11 @@
 
 from avocado import skipIf
 from avocado_qemu import Test
-from avocado_qemu import exec_command_and_wait_for_pattern
+from avocado_qemu import ConsoleMixIn
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import archive
 
-class S390CCWVirtioMachine(Test):
+class S390CCWVirtioMachine(Test, ConsoleMixIn):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
 
     timeout = 120
@@ -29,13 +29,13 @@ def wait_for_console_pattern(self, success_message, vm=None):
                                  vm=vm)
 
     def wait_for_crw_reports(self):
-        exec_command_and_wait_for_pattern(self,
+        self.exec_command_and_wait_for_pattern(
                         'while ! (dmesg -c | grep CRW) ; do sleep 1 ; done',
                         'CRW reports')
 
     dmesg_clear_count = 1
     def clear_guest_dmesg(self):
-        exec_command_and_wait_for_pattern(self, 'dmesg -c > /dev/null; '
+        self.exec_command_and_wait_for_pattern('dmesg -c > /dev/null; '
                     'echo dm_clear\ ' + str(self.dmesg_clear_count),
                     'dm_clear ' + str(self.dmesg_clear_count))
         self.dmesg_clear_count += 1
@@ -81,13 +81,13 @@ def test_s390x_devices(self):
         shell_ready = "sh: can't access tty; job control turned off"
         self.wait_for_console_pattern(shell_ready)
         # first debug shell is too early, we need to wait for device detection
-        exec_command_and_wait_for_pattern(self, 'exit', shell_ready)
+        self.exec_command_and_wait_for_pattern('exit', shell_ready)
 
         ccw_bus_ids="0.1.1111  0.2.0000  0.3.1234"
         pci_bus_ids="0005:00:00.0  000a:00:00.0"
-        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
+        self.exec_command_and_wait_for_pattern('ls /sys/bus/ccw/devices/',
                                           ccw_bus_ids)
-        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/pci/devices/',
+        self.exec_command_and_wait_for_pattern('ls /sys/bus/pci/devices/',
                                           pci_bus_ids)
         # check that the device at 0.2.0000 is in legacy mode, while the
         # device at 0.3.1234 has the virtio-1 feature bit set
@@ -95,14 +95,14 @@ def test_s390x_devices(self):
                             "10000000000000000000000000000000"
         virtio_rng_features_legacy="00000000000000000000000000001100" + \
                                    "00000000000000000000000000000000"
-        exec_command_and_wait_for_pattern(self,
+        self.exec_command_and_wait_for_pattern(
                         'cat /sys/bus/ccw/devices/0.2.0000/virtio?/features',
                         virtio_rng_features_legacy)
-        exec_command_and_wait_for_pattern(self,
+        self.exec_command_and_wait_for_pattern(
                         'cat /sys/bus/ccw/devices/0.3.1234/virtio?/features',
                         virtio_rng_features)
         # check that /dev/hwrng works - and that it's gone after ejecting
-        exec_command_and_wait_for_pattern(self,
+        self.exec_command_and_wait_for_pattern(
                         'dd if=/dev/hwrng of=/dev/null bs=1k count=10',
                         '10+0 records out')
         self.clear_guest_dmesg()
@@ -111,22 +111,22 @@ def test_s390x_devices(self):
         self.clear_guest_dmesg()
         self.vm.command('device_del', id='rn2')
         self.wait_for_crw_reports()
-        exec_command_and_wait_for_pattern(self,
+        self.exec_command_and_wait_for_pattern(
                         'dd if=/dev/hwrng of=/dev/null bs=1k count=10',
                         'dd: /dev/hwrng: No such device')
         # verify that we indeed have virtio-net devices (without having the
         # virtio-net driver handy)
-        exec_command_and_wait_for_pattern(self,
+        self.exec_command_and_wait_for_pattern(
                                     'cat /sys/bus/ccw/devices/0.1.1111/cutype',
                                     '3832/01')
-        exec_command_and_wait_for_pattern(self,
+        self.exec_command_and_wait_for_pattern(
                     'cat /sys/bus/pci/devices/0005\:00\:00.0/subsystem_vendor',
                     '0x1af4')
-        exec_command_and_wait_for_pattern(self,
+        self.exec_command_and_wait_for_pattern(
                     'cat /sys/bus/pci/devices/0005\:00\:00.0/subsystem_device',
                     '0x0001')
         # check fid propagation
-        exec_command_and_wait_for_pattern(self,
+        self.exec_command_and_wait_for_pattern(
                         'cat /sys/bus/pci/devices/000a\:00\:00.0/function_id',
                         '0x0000000c')
         # add another device
@@ -134,7 +134,7 @@ def test_s390x_devices(self):
         self.vm.command('device_add', driver='virtio-net-ccw',
                         devno='fe.0.4711', id='net_4711')
         self.wait_for_crw_reports()
-        exec_command_and_wait_for_pattern(self, 'for i in 1 2 3 4 5 6 7 ; do '
+        self.exec_command_and_wait_for_pattern('for i in 1 2 3 4 5 6 7 ; do '
                     'if [ -e /sys/bus/ccw/devices/*4711 ]; then break; fi ;'
                     'sleep 1 ; done ; ls /sys/bus/ccw/devices/',
                     '0.0.4711')
@@ -144,17 +144,17 @@ def test_s390x_devices(self):
         self.vm.event_wait(name='DEVICE_DELETED',
                            match={'data': {'device': 'net_4711'}})
         self.wait_for_crw_reports()
-        exec_command_and_wait_for_pattern(self,
+        self.exec_command_and_wait_for_pattern(
                                           'ls /sys/bus/ccw/devices/0.0.4711',
                                           'No such file or directory')
         # test the virtio-balloon device
-        exec_command_and_wait_for_pattern(self, 'head -n 1 /proc/meminfo',
+        self.exec_command_and_wait_for_pattern('head -n 1 /proc/meminfo',
                                           'MemTotal:         115640 kB')
         self.vm.command('human-monitor-command', command_line='balloon 96')
-        exec_command_and_wait_for_pattern(self, 'head -n 1 /proc/meminfo',
+        self.exec_command_and_wait_for_pattern('head -n 1 /proc/meminfo',
                                           'MemTotal:          82872 kB')
         self.vm.command('human-monitor-command', command_line='balloon 128')
-        exec_command_and_wait_for_pattern(self, 'head -n 1 /proc/meminfo',
+        self.exec_command_and_wait_for_pattern('head -n 1 /proc/meminfo',
                                           'MemTotal:         115640 kB')
 
 
@@ -203,23 +203,23 @@ def test_s390x_fedora(self):
 
         # Some tests to see whether the CLI options have been considered:
         self.log.info("Test whether QEMU CLI options have been considered")
-        exec_command_and_wait_for_pattern(self,
+        self.exec_command_and_wait_for_pattern(
                         'while ! (dmesg | grep enP7p0s0) ; do sleep 1 ; done',
                         'virtio_net virtio0 enP7p0s0: renamed')
-        exec_command_and_wait_for_pattern(self, 'lspci',
+        self.exec_command_and_wait_for_pattern('lspci',
                              '0007:00:00.0 Class 0200: Device 1af4:1000')
-        exec_command_and_wait_for_pattern(self,
+        self.exec_command_and_wait_for_pattern(
                              'cat /sys/class/net/enP7p0s0/address',
                              '02:ca:fe:fa:ce:12')
-        exec_command_and_wait_for_pattern(self, 'lscss', '0.1.9876')
-        exec_command_and_wait_for_pattern(self, 'lscss', '0.2.5432')
-        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
+        self.exec_command_and_wait_for_pattern('lscss', '0.1.9876')
+        self.exec_command_and_wait_for_pattern('lscss', '0.2.5432')
+        self.exec_command_and_wait_for_pattern('cat /proc/cpuinfo',
                              'processors    : 4')
-        exec_command_and_wait_for_pattern(self, 'grep MemTotal /proc/meminfo',
+        self.exec_command_and_wait_for_pattern('grep MemTotal /proc/meminfo',
                              'MemTotal:         499848 kB')
-        exec_command_and_wait_for_pattern(self, 'grep Name /proc/sysinfo',
+        self.exec_command_and_wait_for_pattern('grep Name /proc/sysinfo',
                              'Extended Name:   Some Guest Name')
-        exec_command_and_wait_for_pattern(self, 'grep UUID /proc/sysinfo',
+        self.exec_command_and_wait_for_pattern('grep UUID /proc/sysinfo',
                              '30de4fd9-b4d5-409e-86a5-09b387f70bfa')
 
         # Disable blinking cursor, then write some stuff into the framebuffer.
@@ -229,16 +229,16 @@ def test_s390x_fedora(self):
         # can simply read the written "magic bytes" back from the PPM file to
         # check whether the framebuffer is working as expected.
         self.log.info("Test screendump of virtio-gpu device")
-        exec_command_and_wait_for_pattern(self,
+        self.exec_command_and_wait_for_pattern(
                         'while ! (dmesg | grep gpudrmfb) ; do sleep 1 ; done',
                         'virtio_gpudrmfb frame buffer device')
-        exec_command_and_wait_for_pattern(self,
+        self.exec_command_and_wait_for_pattern(
             'echo -e "\e[?25l" > /dev/tty0', ':/#')
-        exec_command_and_wait_for_pattern(self, 'for ((i=0;i<250;i++)); do '
+        self.exec_command_and_wait_for_pattern('for ((i=0;i<250;i++)); do '
             'echo " The  qu ick  fo x j ump s o ver  a  laz y d og" >> fox.txt;'
             'done',
             ':/#')
-        exec_command_and_wait_for_pattern(self,
+        self.exec_command_and_wait_for_pattern(
             'dd if=fox.txt of=/dev/fb0 bs=1000 oflag=sync,nocache ; rm fox.txt',
             '12+0 records out')
         with tempfile.NamedTemporaryFile(suffix='.ppm',
@@ -261,12 +261,12 @@ def test_s390x_fedora(self):
                         id='cbe0')
         self.vm.command('device_add', driver='virtio-crypto-ccw', id='crypdev0',
                         cryptodev='cbe0', devno='fe.0.2342')
-        exec_command_and_wait_for_pattern(self,
+        self.exec_command_and_wait_for_pattern(
                         'while ! (dmesg -c | grep Accelerator.device) ; do'
                         ' sleep 1 ; done', 'Accelerator device is ready')
-        exec_command_and_wait_for_pattern(self, 'lscss', '0.0.2342')
+        self.exec_command_and_wait_for_pattern('lscss', '0.0.2342')
         self.vm.command('device_del', id='crypdev0')
         self.vm.command('object-del', id='cbe0')
-        exec_command_and_wait_for_pattern(self,
+        self.exec_command_and_wait_for_pattern(
                         'while ! (dmesg -c | grep Start.virtcrypto_remove) ; do'
                         ' sleep 1 ; done', 'Start virtcrypto_remove.')
diff --git a/tests/acceptance/multiprocess.py b/tests/acceptance/multiprocess.py
index 41d3e51164..b4a6d20770 100644
--- a/tests/acceptance/multiprocess.py
+++ b/tests/acceptance/multiprocess.py
@@ -10,7 +10,6 @@
 from avocado_qemu import Test
 from avocado_qemu import wait_for_console_pattern
 from avocado_qemu import ConsoleMixIn
-from avocado_qemu import exec_command_and_wait_for_pattern
 
 class Multiprocess(Test, ConsoleMixIn):
     """
@@ -60,7 +59,7 @@ def do_test(self, kernel_url, initrd_url, kernel_command_line,
         wait_for_console_pattern(self, 'as init process',
                                  'Kernel panic - not syncing')
         self.exec_command('mount -t sysfs sysfs /sys')
-        exec_command_and_wait_for_pattern(self,
+        self.exec_command_and_wait_for_pattern(
                                           'cat /sys/bus/pci/devices/*/uevent',
                                           'PCI_ID=1000:0012')
 
diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
index ab18cddbb7..4d65431ef1 100644
--- a/tests/acceptance/virtio-gpu.py
+++ b/tests/acceptance/virtio-gpu.py
@@ -7,7 +7,7 @@
 from avocado_qemu import Test
 from avocado_qemu import BUILD_DIR
 from avocado_qemu import wait_for_console_pattern
-from avocado_qemu import exec_command_and_wait_for_pattern
+from avocado_qemu import ConsoleMixIn
 from avocado_qemu import is_readable_executable_file
 
 from qemu.accel import kvm_available
@@ -31,7 +31,7 @@ def pick_default_vug_bin():
         return bld_dir_path
 
 
-class VirtioGPUx86(Test):
+class VirtioGPUx86(Test, ConsoleMixIn):
     """
     :avocado: tags=virtio-gpu
     """
@@ -92,9 +92,7 @@ def test_virtio_vga_virgl(self):
             self.cancel("VirGL not enabled?")
 
         self.wait_for_console_pattern("as init process")
-        exec_command_and_wait_for_pattern(
-            self, "/usr/sbin/modprobe virtio_gpu", ""
-        )
+        self.exec_command_and_wait_for_pattern("/usr/sbin/modprobe virtio_gpu", "")
         self.wait_for_console_pattern("features: +virgl +edid")
 
     def test_vhost_user_vga_virgl(self):
@@ -157,9 +155,7 @@ def test_vhost_user_vga_virgl(self):
         )
         self.vm.launch()
         self.wait_for_console_pattern("as init process")
-        exec_command_and_wait_for_pattern(
-            self, "/usr/sbin/modprobe virtio_gpu", ""
-        )
+        self.exec_command_and_wait_for_pattern("/usr/sbin/modprobe virtio_gpu", "")
         self.wait_for_console_pattern("features: +virgl -edid")
         self.vm.shutdown()
         qemu_sock.close()
-- 
2.29.2


