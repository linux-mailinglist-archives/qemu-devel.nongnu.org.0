Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 009053959D2
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 13:41:07 +0200 (CEST)
Received: from localhost ([::1]:53476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lngI5-0008N6-HD
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 07:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lngFr-0007SG-Tf; Mon, 31 May 2021 07:38:49 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lngFm-0006U7-Em; Mon, 31 May 2021 07:38:46 -0400
Received: by mail-wr1-x435.google.com with SMTP id q5so10595305wrs.4;
 Mon, 31 May 2021 04:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e2UKF779h06D4dCwRlOC/0/ZdIDRpyrTW1OZpW2u0Lw=;
 b=IAhEk9LSnZ+swfjDxc+GOmbyWS2csPlGLxPVoeq9avlNIaeTAK8ZgBEJhJSD5FxvtW
 RsO1OTo7zauYudyRaAmQTtj0RH7P6snaj7+s4DRwTHa2dH9nSLdSkoZYkh97FRI5uxjl
 K03vHGqdwWJ6ixAYGTAm/ibXgCysRD5tSlmTp/n4KkS54u/ggRkmLjx5mvVfKMfppWwy
 byjAOQ4AAumfKMLiwFxk3OHb2m6qDOeHnNBxYvVxzTKebpiV6Ep9O6krHACnB1IWbele
 gdA+A+fB+Pe/3NSbo+R2S1utdhg85GrZLwpMDF2OU1tMQ3c5AyxLgKS60Y31hPFKSKw0
 eSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=e2UKF779h06D4dCwRlOC/0/ZdIDRpyrTW1OZpW2u0Lw=;
 b=gqY/kDlnBBdE9ZbbcMDdsHA/U199XjpQcg2RG9G2TKb1Xg/OWqar7zHW20JcGSoSoX
 r9Jshczbwn6qUrIqKts14WlvGBo6ooOL/kv9hMINGciCwI06LyyJHMuAO5I8Uk6MegjL
 TL7twbD3a0eG9uljCrMawUBdqdE+RgdpeHrmO+cMkZTM01vqbNHpjNuqq+iiQB9u4YZA
 lcVw5qsYbM3Ydf/KbcWMk7Hw2PqhSelHWplxTKltYS3PgtGpS1gUJvJDr24SkiAB3Ejn
 uO0cMg1KYFKzt7KWz1my+WSr6EIcQUx7Epsbc03pgWkTK1TuLFQQiIJEpkzzzwEVmbgq
 XkBg==
X-Gm-Message-State: AOAM530Ai3FmcMhPd0n33QaPYQF6a0MHx6t5lMfCRypD+z2543l22nXj
 6ImMD4txiI3WKN59FJJKpvSt6Gl9P69jzA==
X-Google-Smtp-Source: ABdhPJw0DnXCR/5gqT+GIZnDrWyP2GiXCvPu6E80sYnJIo0vtf6dZlOBM+S1GLd3x4/FnVWb5J9mlA==
X-Received: by 2002:a5d:4e0c:: with SMTP id p12mr22266596wrt.268.1622461119436; 
 Mon, 31 May 2021 04:38:39 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id o3sm1567730wrm.78.2021.05.31.04.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 04:38:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests: Boot and halt a Linux guest on the Raspberry Pi 2
 machine
Date: Mon, 31 May 2021 13:38:37 +0200
Message-Id: <20210531113837.1689775-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Nolan Leake <nolan@sigbus.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a test booting and quickly shutdown a raspi2 machine,
to test the power management model:

   (1/1) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd:
  console: [    0.000000] Booting Linux on physical CPU 0xf00
  console: [    0.000000] Linux version 4.14.98-v7+ (dom@dom-XPS-13-9370) (gcc version 4.9.3 (crosstool-NG crosstool-ng-1.22.0-88-g8460611)) #1200 SMP Tue Feb 12 20:27:48 GMT 2019
  console: [    0.000000] CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=10c5387d
  console: [    0.000000] CPU: div instructions available: patching division code
  console: [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
  console: [    0.000000] OF: fdt: Machine model: Raspberry Pi 2 Model B
  ...
  console: Boot successful.
  console: cat /proc/cpuinfo
  console: / # cat /proc/cpuinfo
  ...
  console: processor      : 3
  console: model name     : ARMv7 Processor rev 5 (v7l)
  console: BogoMIPS       : 125.00
  console: Features       : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt vfpd32 lpae evtstrm
  console: CPU implementer        : 0x41
  console: CPU architecture: 7
  console: CPU variant    : 0x0
  console: CPU part       : 0xc07
  console: CPU revision   : 5
  console: Hardware       : BCM2835
  console: Revision       : 0000
  console: Serial         : 0000000000000000
  console: cat /proc/iomem
  console: / # cat /proc/iomem
  console: 00000000-3bffffff : System RAM
  console: 00008000-00afffff : Kernel code
  console: 00c00000-00d468ef : Kernel data
  console: 3f006000-3f006fff : dwc_otg
  console: 3f007000-3f007eff : /soc/dma@7e007000
  console: 3f00b880-3f00b8bf : /soc/mailbox@7e00b880
  console: 3f100000-3f100027 : /soc/watchdog@7e100000
  console: 3f101000-3f102fff : /soc/cprman@7e101000
  console: 3f200000-3f2000b3 : /soc/gpio@7e200000
  PASS (24.59 s)
  RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 25.02 s

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Based-on: <162137039825.30884.2445825798240809194-0@git.sr.ht>
---
 tests/acceptance/boot_linux_console.py | 43 ++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 276a53f1464..19d328203c7 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -16,6 +16,7 @@
 from avocado import skip
 from avocado import skipUnless
 from avocado_qemu import Test
+from avocado_qemu import exec_command
 from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado_qemu import interrupt_interactive_console_until_pattern
 from avocado_qemu import wait_for_console_pattern
@@ -467,6 +468,48 @@ def test_arm_raspi2_uart0(self):
         """
         self.do_test_arm_raspi2(0)
 
+    def test_arm_raspi2_initrd(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:raspi2
+        """
+        deb_url = ('http://archive.raspberrypi.org/debian/'
+                   'pool/main/r/raspberrypi-firmware/'
+                   'raspberrypi-kernel_1.20190215-1_armhf.deb')
+        deb_hash = 'cd284220b32128c5084037553db3c482426f3972'
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        kernel_path = self.extract_from_deb(deb_path, '/boot/kernel7.img')
+        dtb_path = self.extract_from_deb(deb_path, '/boot/bcm2709-rpi-2-b.dtb')
+
+        initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
+                      '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
+                      'arm/rootfs-armv7a.cpio.gz')
+        initrd_hash = '604b2e45cdf35045846b8bbfbf2129b1891bdc9c'
+        initrd_path_gz = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
+        initrd_path = os.path.join(self.workdir, 'rootfs.cpio')
+        archive.gzip_uncompress(initrd_path_gz, initrd_path)
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'earlycon=pl011,0x3f201000 console=ttyAMA0 '
+                               'panic=-1 noreboot ' +
+                               'dwc_otg.fiq_fsm_enable=0')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-initrd', initrd_path,
+                         '-append', kernel_command_line,
+                         '-no-reboot')
+        self.vm.launch()
+        self.wait_for_console_pattern('Boot successful.')
+
+        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
+                                                'BCM2835')
+        exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
+                                                '/soc/cprman@7e101000')
+        exec_command(self, 'halt')
+        # Wait for VM to shut down gracefully
+        self.vm.wait()
+
     def test_arm_exynos4210_initrd(self):
         """
         :avocado: tags=arch:arm
-- 
2.26.3


