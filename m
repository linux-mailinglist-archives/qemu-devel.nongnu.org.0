Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3F83D3F2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 19:23:34 +0200 (CEST)
Received: from localhost ([::1]:33238 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hakUf-0005hK-9W
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 13:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58173)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hakN3-0008Uh-NA
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 13:15:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hakN0-0004fY-1T
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 13:15:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55266)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hakMz-0004e6-Ku
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 13:15:37 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A74CD4DB10;
 Tue, 11 Jun 2019 17:15:36 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAD7060BF1;
 Tue, 11 Jun 2019 17:15:25 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Date: Tue, 11 Jun 2019 14:14:54 -0300
Message-Id: <20190611171456.23444-5-ehabkost@redhat.com>
In-Reply-To: <20190611171456.23444-1-ehabkost@redhat.com>
References: <20190611171456.23444-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Tue, 11 Jun 2019 17:15:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 4/6] BootLinuxConsoleTest: Test nanoMIPS kernels
 on the I7200 CPU
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
Cc: Fam Zheng <fam@euphon.net>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Similar to the x86_64/pc test, it boots a Linux kernel on a Malta
machine and verify the serial is working.

Use the documentation added in commit f7d257cb4a17 to test
nanoMIPS kernels and the I7200 CPU.

This test can be run using:

  $ avocado --show=3Dconsole run -t arch:mipsel tests/acceptance/boot_lin=
ux_console.py
  console: [    0.000000] Linux version 4.15.18-00432-gb2eb9a8b (emubuild=
@mipscs563) (gcc version 6.3.0 (Codescape GNU Tools 2018.04-02 for nanoMI=
PS Linux)) #1 SMP Wed Jun 27 11:10:08 PDT 2018
  console: [    0.000000] GCRs appear to have been moved (expected them a=
t 0x1fbf8000)!
  console: [    0.000000] GCRs appear to have been moved (expected them a=
t 0x1fbf8000)!
  console: [    0.000000] CPU0 revision is: 00010000 (MIPS GENERIC QEMU)
  console: [    0.000000] MIPS: machine is mti,malta
  console: [    0.000000] Determined physical RAM map:
  console: [    0.000000]  memory: 08000000 @ 00000000 (usable)
  console: [    0.000000] earlycon: ns16550a0 at I/O port 0x3f8 (options =
'38400n8')
  console: [    0.000000] bootconsole [ns16550a0] enabled
  console: [    0.000000] User-defined physical RAM map:
  console: [    0.000000]  memory: 10000000 @ 00000000 (usable)
  console: [    0.000000] Initrd not found or empty - disabling initrd
  console: [    0.000000] MIPS CPS SMP unable to proceed without a CM
  console: [    0.000000] Primary instruction cache 32kB, VIPT, 4-way, li=
nesize 32 bytes.
  console: [    0.000000] Primary data cache 32kB, 4-way, VIPT, cache ali=
ases, linesize 32 bytes
  console: [    0.000000] This processor doesn't support highmem. -262144=
k highmem ignored
  console: [    0.000000] Zone ranges:
  console: [    0.000000]   Normal   [mem 0x0000000000000000-0x000000000f=
ffffff]
  console: [    0.000000]   HighMem  empty
  console: [    0.000000] Movable zone start for each node
  console: [    0.000000] Early memory node ranges
  console: [    0.000000]   node   0: [mem 0x0000000000000000-0x000000000=
fffffff]
  console: [    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x=
000000000fffffff]
  console: [    0.000000] random: get_random_bytes called from start_kern=
el+0x60/0x2f0 with crng_init=3D0
  console: [    0.000000] percpu: Embedded 16 pages/cpu @(ptrval) s36620 =
r8192 d20724 u65536
  console: [    0.000000] Built 1 zonelists, mobility grouping on.  Total=
 pages: 64960
  console: [    0.000000] Kernel command line: printk.time=3D0 mem=3D256m=
@@0x0 console=3DttyS0 earlycon

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20190520231910.12184-3-f4bug@amsat.org>
Acked-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 tests/acceptance/boot_linux_console.py | 58 ++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
index e6b5ed5dda..5d8380a23b 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -10,6 +10,8 @@
=20
 import os
 import logging
+import lzma
+import shutil
=20
 from avocado_qemu import Test
 from avocado.utils import process
@@ -138,6 +140,62 @@ class BootLinuxConsole(Test):
         console_pattern =3D 'Kernel command line: %s' % kernel_command_l=
ine
         self.wait_for_console_pattern(console_pattern)
=20
+    def do_test_mips_malta32el_nanomips(self, kernel_url, kernel_hash):
+        kernel_path_xz =3D self.fetch_asset(kernel_url, asset_hash=3Dker=
nel_hash)
+        kernel_path =3D self.workdir + "kernel"
+        with lzma.open(kernel_path_xz, 'rb') as f_in:
+            with open(kernel_path, 'wb') as f_out:
+                shutil.copyfileobj(f_in, f_out)
+
+        self.vm.set_machine('malta')
+        self.vm.set_console()
+        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE
+                               + 'mem=3D256m@@0x0 '
+                               + 'console=3DttyS0')
+        self.vm.add_args('-no-reboot',
+                         '-cpu', 'I7200',
+                         '-kernel', kernel_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        console_pattern =3D 'Kernel command line: %s' % kernel_command_l=
ine
+        self.wait_for_console_pattern(console_pattern)
+
+    def test_mips_malta32el_nanomips_4k(self):
+        """
+        :avocado: tags=3Darch:mipsel
+        :avocado: tags=3Dmachine:malta
+        :avocado: tags=3Dendian:little
+        """
+        kernel_url =3D ('https://mipsdistros.mips.com/LinuxDistro/nanomi=
ps/'
+                      'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142=
/'
+                      'generic_nano32r6el_page4k.xz')
+        kernel_hash =3D '477456aafd2a0f1ddc9482727f20fe9575565dd6'
+        self.do_test_mips_malta32el_nanomips(kernel_url, kernel_hash)
+
+    def test_mips_malta32el_nanomips_16k_up(self):
+        """
+        :avocado: tags=3Darch:mipsel
+        :avocado: tags=3Dmachine:malta
+        :avocado: tags=3Dendian:little
+        """
+        kernel_url =3D ('https://mipsdistros.mips.com/LinuxDistro/nanomi=
ps/'
+                      'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142=
/'
+                      'generic_nano32r6el_page16k_up.xz')
+        kernel_hash =3D 'e882868f944c71c816e832e2303b7874d044a7bc'
+        self.do_test_mips_malta32el_nanomips(kernel_url, kernel_hash)
+
+    def test_mips_malta32el_nanomips_64k_dbg(self):
+        """
+        :avocado: tags=3Darch:mipsel
+        :avocado: tags=3Dmachine:malta
+        :avocado: tags=3Dendian:little
+        """
+        kernel_url =3D ('https://mipsdistros.mips.com/LinuxDistro/nanomi=
ps/'
+                      'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142=
/'
+                      'generic_nano32r6el_page64k_dbg.xz')
+        kernel_hash =3D '18d1c68f2e23429e266ca39ba5349ccd0aeb7180'
+        self.do_test_mips_malta32el_nanomips(kernel_url, kernel_hash)
+
     def test_aarch64_virt(self):
         """
         :avocado: tags=3Darch:aarch64
--=20
2.18.0.rc1.1.g3f1ff2140


