Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5A515A9DD
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 14:17:09 +0100 (CET)
Received: from localhost ([::1]:37568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1rt6-0000S1-Vh
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 08:17:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33343)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1j1rgD-0004as-Oi
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 08:03:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1j1rfq-00089H-4T
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 08:03:49 -0500
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:32946)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1j1rfp-00085w-Se
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 08:03:26 -0500
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail02.asahi-net.or.jp (Postfix) with ESMTPA id 2910EDD663;
 Wed, 12 Feb 2020 22:03:24 +0900 (JST)
Received: from yo-satoh-debian.localdomain
 (ae231051.dynamic.ppp.asahi-net.or.jp [14.3.231.51])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id EEE81240091;
 Wed, 12 Feb 2020 22:03:23 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH v30 21/22] BootLinuxConsoleTest: Test the RX-Virt machine
Date: Wed, 12 Feb 2020 22:03:10 +0900
Message-Id: <20200212130311.127515-22-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212130311.127515-1-ysato@users.sourceforge.jp>
References: <20200212130311.127515-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.14
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
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Add two tests for the rx-virt machine, based on the recommended test
setup from Yoshinori Sato:
https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg03586.html

- U-Boot prompt
- Linux kernel with Sash shell

These are very quick tests:

  $ avocado run -t arch:rx tests/acceptance/boot_linux_console.py
  JOB ID     : 84a6ef01c0b87975ecbfcb31a920afd735753ace
  JOB LOG    : /home/phil/avocado/job-results/job-2019-05-24T05.02-84a6ef=
0/job.log
   (1/2) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_rx_=
uboot: PASS (0.11 s)
   (2/2) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_rx_=
linux: PASS (0.45 s)
  RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 =
| CANCEL 0

Tests can also be run with:

  $ avocado --show=3Dconsole run -t arch:rx tests/acceptance/boot_linux_c=
onsole.py
  console: U-Boot 2016.05-rc3-23705-ga1ef3c71cb-dirty (Feb 05 2019 - 21:5=
6:06 +0900)
  console: Linux version 4.19.0+ (yo-satoh@yo-satoh-debian) (gcc version =
9.0.0 20181105 (experimental) (GCC)) #137 Wed Feb 20 23:20:02 JST 2019
  console: Built 1 zonelists, mobility grouping on.  Total pages: 8128
  ...
  console: SuperH (H)SCI(F) driver initialized
  console: 88240.serial: ttySC0 at MMIO 0x88240 (irq =3D 215, base_baud =3D=
 0) is a sci
  console: console [ttySC0] enabled
  console: 88248.serial: ttySC1 at MMIO 0x88248 (irq =3D 219, base_baud =3D=
 0) is a sci

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Based-on: 20190517045136.3509-1-richard.henderson@linaro.org
"RX architecture support"
Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 tests/acceptance/boot_linux_console.py | 46 ++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
index 34d37eba3b..367cf480a5 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -686,3 +686,49 @@ class BootLinuxConsole(Test):
         tar_hash =3D '49e88d9933742f0164b60839886c9739cb7a0d34'
         self.vm.add_args('-cpu', 'dc233c')
         self.do_test_advcal_2018('02', tar_hash, 'santas-sleigh-ride.elf=
')
+
+    def test_rx_uboot(self):
+        """
+        :avocado: tags=3Darch:rx
+        :avocado: tags=3Dmachine:rx-virt
+        :avocado: tags=3Dendian:little
+        """
+        uboot_url =3D ('https://acc.dl.osdn.jp/users/23/23888/u-boot.bin=
.gz')
+        uboot_hash =3D '9b78dbd43b40b2526848c0b1ce9de02c24f4dcdb'
+        uboot_path =3D self.fetch_asset(uboot_url, asset_hash=3Duboot_ha=
sh)
+        uboot_path =3D archive.uncompress(uboot_path, self.workdir)
+
+        self.vm.set_machine('rx-virt')
+        self.vm.set_console()
+        self.vm.add_args('-bios', uboot_path,
+                         '-no-reboot')
+        self.vm.launch()
+        uboot_version =3D 'U-Boot 2016.05-rc3-23705-ga1ef3c71cb-dirty'
+        self.wait_for_console_pattern(uboot_version)
+        gcc_version =3D 'rx-unknown-linux-gcc (GCC) 9.0.0 20181105 (expe=
rimental)'
+        # FIXME limit baudrate on chardev, else we type too fast
+        #self.exec_command_and_wait_for_pattern('version', gcc_version)
+
+    def test_rx_linux(self):
+        """
+        :avocado: tags=3Darch:rx
+        :avocado: tags=3Dmachine:rx-virt
+        :avocado: tags=3Dendian:little
+        """
+        dtb_url =3D ('https://acc.dl.osdn.jp/users/23/23887/rx-qemu.dtb'=
)
+        dtb_hash =3D '7b4e4e2c71905da44e86ce47adee2210b026ac18'
+        dtb_path =3D self.fetch_asset(dtb_url, asset_hash=3Ddtb_hash)
+        kernel_url =3D ('http://acc.dl.osdn.jp/users/23/23845/zImage')
+        kernel_hash =3D '39a81067f8d72faad90866ddfefa19165d68fc99'
+        kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkernel=
_hash)
+
+        self.vm.set_machine('rx-virt')
+        self.vm.set_console()
+        kernel_command_line =3D self.KERNEL_COMMON_COMMAND_LINE + 'early=
con'
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-no-reboot')
+        self.vm.launch()
+        self.wait_for_console_pattern('Sash command shell (version 1.1.1=
)')
+        self.exec_command_and_wait_for_pattern('printenv',
+                                               'TERM=3Dlinux')
--=20
2.20.1


