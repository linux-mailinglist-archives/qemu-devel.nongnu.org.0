Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ADF3BA0E2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:05:58 +0200 (CEST)
Received: from localhost ([::1]:53900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzIrl-0007i3-1R
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIm6-0007bZ-6m
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:06 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIm0-0007eM-E9
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:05 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v5so12374979wrt.3
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5akzeUiGlBGtHAS3RuczEvkoVsSXwfyWzIG88croaKk=;
 b=xS6dNVGm+6wgl2HOH2Gayfc6sjyJc8JGLtXYluh7EZpKZ0bb8RxnCzdeCthaToGS+T
 JKP2SHDfLcXVYXAdTk+Eq7iZmXpIcB2cXIxhEFgtGXUoYipsr1m/fgcc7AbXHywtMNHU
 5LB6kElRrAkoW6ao+f96S+/wJdlrK5hg71nm3zvtlIfEkkJKE0lSe+F1JA+BwQ/dGR6L
 xtzs0pYarVjz6v1dvbch71g93NODZvcwRFX0GCOpWXyHA0Xc24pbYZdetnyu6S3FwSxG
 rBc3QkipiS8br07xlXF5w8h1RfO/m+eab7vzvCLZm1ibZYPZNqCj5OYXMHYvb99L6xQz
 FJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5akzeUiGlBGtHAS3RuczEvkoVsSXwfyWzIG88croaKk=;
 b=n4NE3RlERh+weGuVWpeQ9zJa7TMnBZx6ux/3OPHLFSsP1vhNY1piKaz9WxUfXUwGth
 HRoKQtCDd1WGzVZ4UhjdyqT/gokTXO8kpOEg01GEFEN91gQbMM9O+LxPuLKS27ePfs1w
 /GPbBzlk+efZawnLHLbfw/1pTyYOTTm1fp7b/6IXSqMv6Kgqp18E8gaFk1n3nTvGFywI
 yZwrv5Mz+XEQc9L2hec5jJgti/f9J1+ieB6WaYBUnmyi3jUkPC4EvygVeVDaRPKVHRjU
 uNEhP9yKJW8oiPZqigKKlzOT3jrkVQEANWiQWBXlxOZw0gYyCuLHt5+zW3XibvDDHE5+
 /tiw==
X-Gm-Message-State: AOAM531iUfYHPSyrJhS+UJnFbzRyfxubbc1hCMkjYi1T0rgGGl89BW6f
 /HX7tAF8MyCJ/MDEyKMTQjFiCeSqVNA2qFvf
X-Google-Smtp-Source: ABdhPJw6qg0OJQrd/rFebeT4cFrgngJ4Qylebmq+5IySaW/Y/XYWZa97yHZStB5oOVVhaJr3Ssd9nw==
X-Received: by 2002:adf:db41:: with SMTP id f1mr5767626wrj.153.1625230799210; 
 Fri, 02 Jul 2021 05:59:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s3sm3333351wro.30.2021.07.02.05.59.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 05:59:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/24] tests: Boot and halt a Linux guest on the Raspberry Pi 2
 machine
Date: Fri,  2 Jul 2021 13:59:34 +0100
Message-Id: <20210702125954.13247-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702125954.13247-1-peter.maydell@linaro.org>
References: <20210702125954.13247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

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
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-id: 20210531113837.1689775-1-f4bug@amsat.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/acceptance/boot_linux_console.py | 43 ++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index cded547d1d4..3ae11a7a8f3 100644
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
@@ -477,6 +478,48 @@ def test_arm_raspi2_uart0(self):
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
2.20.1


