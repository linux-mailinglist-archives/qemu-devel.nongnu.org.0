Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D49E6D8E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 08:51:12 +0100 (CET)
Received: from localhost ([::1]:51518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iOznz-0004Ex-36
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 03:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47189)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iOzcH-0008Cc-MR
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 03:39:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iOzcG-0003wk-9T
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 03:39:05 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53448
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iOzcG-0003wb-51
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 03:39:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572248343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hDDZoBbp0nmoQFmuY1KFWn8uA+svV+IpopWN5pL5EUU=;
 b=AhCe96SSomz+qjuw9/m3q34MK3AjfJD7u9nNyKpB5TTs9BRoJk3LqTsQNTvuRh42b8otWf
 4obzWRhniLngasXvB6s48DFqsdHwi2yn+6OnByAYBcF7SKZbMJCL3PONGhKeRgd4U69zCg
 V5+D1ky0bXkRhNb70T0LKbO7+GhxcKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-ozL2vi7CNtGWgIj8KuqghA-1; Mon, 28 Oct 2019 03:38:59 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C7DA800D41;
 Mon, 28 Oct 2019 07:38:58 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-86.brq.redhat.com [10.40.204.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47EAA19C69;
 Mon, 28 Oct 2019 07:38:50 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/26] tests/boot_linux_console: Run BusyBox on 5KEc 64-bit cpu
Date: Mon, 28 Oct 2019 08:34:41 +0100
Message-Id: <20191028073441.6448-27-philmd@redhat.com>
In-Reply-To: <20191028073441.6448-1-philmd@redhat.com>
References: <20191028073441.6448-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: ozL2vi7CNtGWgIj8KuqghA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kamil Rytarowski <kamil@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

This tests boots a Linux kernel on a Malta machine up to a
busybox shell on the serial console. Few commands are executed
before halting the machine (via reboot).

We use the Fedora 24 kernel extracted from the image at:
https://fedoraproject.org/wiki/Architectures/MIPS
and the initrd cpio image from the kerneltests project:
https://kerneltests.org/

If MIPS is a target being built, "make check-acceptance" will
automatically include this test by the use of the "arch:mips" tags.

Alternatively, this test can be run using:

  $ AVOCADO_ALLOW_UNTRUSTED_CODE=3Dyes \
    avocado --show=3Dconsole run -t arch:mips64el \
      tests/acceptance/boot_linux_console.py
  console: [    0.000000] Linux version 3.19.3.mtoman.20150408 (mtoman@debi=
an-co3-1) (gcc version 5.0.0 20150316 (Red Hat 5.0.0-0.20) (GCC) ) #3 Wed A=
pr 8 14:32:50 UTC 2015
  console: [    0.000000] Early serial console at I/O port 0x3f8 (options '=
38400n8')
  console: [    0.000000] bootconsole [uart0] enabled
  console: [    0.000000] CPU0 revision is: 00018900 (MIPS 5KE)
  console: [    0.000000] Checking for the multiply/shift bug... no.
  console: [    0.000000] Checking for the daddiu bug... no.
  [...]
  console: Boot successful.
  console: cat /proc/cpuinfo
  console: / # cat /proc/cpuinfo
  console: system type            : MIPS Malta
  console: machine                        : Unknown
  console: processor              : 0
  console: cpu model              : MIPS 5KE V0.0
  console: : 1616.89
  console: wait instruction       : nouname -a
  console: microsecond timers     : yes
  console: tlb_entries            : 32
  console: extra interrupt vector : yes
  console: hardware watchpoint    : yes, count: 1, address/irw mask: [0x0ff=
8]
  console: isa                    : mips1 mips2 mips3 mips4 mips5 mips32r1 =
mips32r2 mips64r1 mips64r2
  console: ASEs implemented       :
  console: shadow register sets   : 1
  console: kscratch registers     : 0
  console: package                        : 0
  console: core                   : 0
  console: VCED exceptions                : not available
  console: VCEI exceptions                : not available
  console: / #
  console: / # uname -a
  console: Linux buildroot 3.19.3.mtoman.20150408 #3 Wed Apr 8 14:32:50 UTC=
 2015 mips64 GNU/Linux
  console: reboot
  console: / #
  console: / # reboot
  console: / #
  console: / # reboot: Restarting system
  PASS (7.04 s)
  JOB TIME   : 7.20 s

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 tests/acceptance/boot_linux_console.py | 41 ++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot=
_linux_console.py
index 489df4862c..959d4557c9 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -168,6 +168,47 @@ class BootLinuxConsole(MachineTest):
         exec_command_and_wait_for_pattern(self, 'reboot',
                                                 'reboot: Restarting system=
')
=20
+    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code=
')
+    def test_mips64el_malta_5KEc_cpio(self):
+        """
+        :avocado: tags=3Darch:mips64el
+        :avocado: tags=3Dmachine:malta
+        :avocado: tags=3Dendian:little
+        """
+        kernel_url =3D ('https://github.com/philmd/qemu-testing-blob/'
+                      'raw/9ad2df38/mips/malta/mips64el/'
+                      'vmlinux-3.19.3.mtoman.20150408')
+        kernel_hash =3D '00d1d268fb9f7d8beda1de6bebcc46e884d71754'
+        kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkernel_h=
ash)
+        initrd_url =3D ('https://github.com/groeck/linux-build-test/'
+                      'raw/8584a59e/rootfs/'
+                      'mipsel64/rootfs.mipsel64r1.cpio.gz')
+        initrd_hash =3D '1dbb8a396e916847325284dbe2151167'
+        initrd_path_gz =3D self.fetch_asset(initrd_url, algorithm=3D'md5',
+                                          asset_hash=3Dinitrd_hash)
+        initrd_path =3D self.workdir + "rootfs.cpio"
+        archive.gzip_uncompress(initrd_path_gz, initrd_path)
+
+        self.vm.set_machine('malta')
+        self.vm.set_console()
+        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE
+                               + 'console=3DttyS0 console=3Dtty '
+                               + 'rdinit=3D/sbin/init noreboot')
+        self.vm.add_args('-cpu', '5KEc',
+                         '-kernel', kernel_path,
+                         '-initrd', initrd_path,
+                         '-append', kernel_command_line,
+                         '-no-reboot')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'Boot successful.')
+
+        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
+                                                'MIPS 5KE')
+        exec_command_and_wait_for_pattern(self, 'uname -a',
+                                                '3.19.3.mtoman.20150408')
+        exec_command_and_wait_for_pattern(self, 'reboot',
+                                                'reboot: Restarting system=
')
+
     def do_test_mips_malta32el_nanomips(self, kernel_url, kernel_hash):
         kernel_path_xz =3D self.fetch_asset(kernel_url, asset_hash=3Dkerne=
l_hash)
         kernel_path =3D self.workdir + "kernel"
--=20
2.21.0


