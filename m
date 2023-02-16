Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB9D699B0F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:16:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnK-0008Bl-02; Thu, 16 Feb 2023 12:11:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnH-0008AW-Tk
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:39 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnE-0007qg-QN
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:39 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 o19-20020a05600c379300b003e21af96703so1025730wmr.2
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=I41Rq1BCBKNBN1fSGYnJWT1+PVJR4PoFDqsrj7M3m7k=;
 b=bJ45PsBVW4PEH8/9BhxIJl+rrow6MvmSOiRQqDUkR+PcmAzBjUSwUZra8rrMynr9ia
 YphbI0t+Sw44+GkO68obo+BL74DpjMF2u0EJ10uvw6q7QbyKrJ8iRCi1nl3C1RDNzPa2
 Vx3mJfo18m3MIvMylaHEWdM2Fniw/lXUSXPoMlry0HD6HgQs1z7rWXHeB1Tj+QMgAN3c
 FekF+j4sGEZube6LCslLi8xmUYFxrpZ4J6AquSyjH+zOPmAs32WZ171esAH+DRN0EYlu
 LGGkwfC85XUmx3t2TwY89HOT7tIxyLPaLDcauhtjfv+HV2vFzYYvrOD0EaI/B/it02kV
 2SOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I41Rq1BCBKNBN1fSGYnJWT1+PVJR4PoFDqsrj7M3m7k=;
 b=b9k0pp04D2eGER+AkURcZ033DhHxRLzlV0TC7riuv3545VRGRm7W5L8rIhcGCc/Wsb
 +OeUt+2njl4fcLxbyVRf/eiadUXP6ggW+xI9pexc/VNTlfTVuXsfL+zAWGe/Z8ogGK40
 2ijW6fXMcuglS7PeWLblpxpw5pdDVcBdnSK4j8kjRQtfc/Mu0uqqqIQYGO9GWSNdtwXo
 Zu5BvXez8TJEGQj/SAcMIft+kZaq4oj9I/RrCVaRsjVXCYEnHgs3wdMs6Jq8gFkMT26H
 9AuA9be88H00Wksu2MozixLFm0wYpJPJgHILrk0W1kCyyrLg1syr2ZwNCR0B9Qe14KMP
 lgTg==
X-Gm-Message-State: AO0yUKWOyEYWjCyzrHLQnFt6PUsMjkmYz+OFlsXolUMVsrZM7VOJrHij
 4pQkb52juRodR2/Xzo598dCXD/blzFsjUgyp
X-Google-Smtp-Source: AK7set+IBI4fB7WaduzZDpecSvegY69VFKJ1heol3c8UQXfpT1buQxkFYsAUJ8ZOxx54J9dJp5mK4A==
X-Received: by 2002:a05:600c:4486:b0:3e0:185:e916 with SMTP id
 e6-20020a05600c448600b003e00185e916mr5729630wmo.13.1676567495525; 
 Thu, 16 Feb 2023 09:11:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/30] tests/avocado: retire the Aarch64 TCG tests from
 boot_linux.py
Date: Thu, 16 Feb 2023 17:11:05 +0000
Message-Id: <20230216171123.2518285-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alex Bennée <alex.bennee@linaro.org>

The two TCG tests for GICv2 and GICv3 are very heavy weight distros
that take a long time to boot up, especially for an --enable-debug
build. The total code coverage they give is:

  Overall coverage rate:
    lines......: 11.2% (59584 of 530123 lines)
    functions..: 15.0% (7436 of 49443 functions)
    branches...: 6.3% (19273 of 303933 branches)

We already get pretty close to that with the machine_aarch64_virt
tests which only does one full boot (~120s vs ~600s) of alpine. We
expand the kernel+initrd boot (~8s) to test both GICs and also add an
RNG device and a block device to generate a few IRQs and exercise the
storage layer. With that we get to a coverage of:

  Overall coverage rate:
    lines......: 11.0% (58121 of 530123 lines)
    functions..: 14.9% (7343 of 49443 functions)
    branches...: 6.0% (18269 of 303933 branches)

which I feel is close enough given the massive time saving. If we want
to target any more sub-systems we can use lighter weight more directed
tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230203181632.2919715-1-alex.bennee@linaro.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/avocado/boot_linux.py           | 48 ++++----------------
 tests/avocado/machine_aarch64_virt.py | 63 ++++++++++++++++++++++++---
 2 files changed, 65 insertions(+), 46 deletions(-)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index b3e58fa3093..fe0bb180d90 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -58,52 +58,16 @@ def test_pc_q35_kvm(self):
         self.launch_and_wait(set_up_ssh_connection=False)
 
 
-# For Aarch64 we only boot KVM tests in CI as the TCG tests are very
-# heavyweight. There are lighter weight distros which we use in the
-# machine_aarch64_virt.py tests.
+# For Aarch64 we only boot KVM tests in CI as booting the current
+# Fedora OS in TCG tests is very heavyweight. There are lighter weight
+# distros which we use in the machine_aarch64_virt.py tests.
 class BootLinuxAarch64(LinuxTest):
     """
     :avocado: tags=arch:aarch64
     :avocado: tags=machine:virt
-    :avocado: tags=machine:gic-version=2
     """
     timeout = 720
 
-    def add_common_args(self):
-        self.vm.add_args('-bios',
-                         os.path.join(BUILD_DIR, 'pc-bios',
-                                      'edk2-aarch64-code.fd'))
-        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
-        self.vm.add_args('-object', 'rng-random,id=rng0,filename=/dev/urandom')
-
-    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
-    def test_fedora_cloud_tcg_gicv2(self):
-        """
-        :avocado: tags=accel:tcg
-        :avocado: tags=cpu:max
-        :avocado: tags=device:gicv2
-        """
-        self.require_accelerator("tcg")
-        self.vm.add_args("-accel", "tcg")
-        self.vm.add_args("-cpu", "max,lpa2=off")
-        self.vm.add_args("-machine", "virt,gic-version=2")
-        self.add_common_args()
-        self.launch_and_wait(set_up_ssh_connection=False)
-
-    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
-    def test_fedora_cloud_tcg_gicv3(self):
-        """
-        :avocado: tags=accel:tcg
-        :avocado: tags=cpu:max
-        :avocado: tags=device:gicv3
-        """
-        self.require_accelerator("tcg")
-        self.vm.add_args("-accel", "tcg")
-        self.vm.add_args("-cpu", "max,lpa2=off")
-        self.vm.add_args("-machine", "virt,gic-version=3")
-        self.add_common_args()
-        self.launch_and_wait(set_up_ssh_connection=False)
-
     def test_virt_kvm(self):
         """
         :avocado: tags=accel:kvm
@@ -112,7 +76,11 @@ def test_virt_kvm(self):
         self.require_accelerator("kvm")
         self.vm.add_args("-accel", "kvm")
         self.vm.add_args("-machine", "virt,gic-version=host")
-        self.add_common_args()
+        self.vm.add_args('-bios',
+                         os.path.join(BUILD_DIR, 'pc-bios',
+                                      'edk2-aarch64-code.fd'))
+        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
+        self.vm.add_args('-object', 'rng-random,id=rng0,filename=/dev/urandom')
         self.launch_and_wait(set_up_ssh_connection=False)
 
 
diff --git a/tests/avocado/machine_aarch64_virt.py b/tests/avocado/machine_aarch64_virt.py
index c2b2ba2cf87..25dab8dc00a 100644
--- a/tests/avocado/machine_aarch64_virt.py
+++ b/tests/avocado/machine_aarch64_virt.py
@@ -10,11 +10,14 @@
 
 import time
 import os
+import logging
 
 from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 from avocado_qemu import exec_command
 from avocado_qemu import BUILD_DIR
+from avocado.utils import process
+from avocado.utils.path import find_command
 
 class Aarch64VirtMachine(QemuSystemTest):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
@@ -65,16 +68,15 @@ def test_alpine_virt_tcg_gic_max(self):
         self.wait_for_console_pattern('Welcome to Alpine Linux 3.16')
 
 
-    def test_aarch64_virt(self):
+    def common_aarch64_virt(self, machine):
         """
-        :avocado: tags=arch:aarch64
-        :avocado: tags=machine:virt
-        :avocado: tags=accel:tcg
-        :avocado: tags=cpu:max
+        Common code to launch basic virt machine with kernel+initrd
+        and a scratch disk.
         """
+        logger = logging.getLogger('aarch64_virt')
+
         kernel_url = ('https://fileserver.linaro.org/s/'
                       'z6B2ARM7DQT3HWN/download')
-
         kernel_hash = 'ed11daab50c151dde0e1e9c9cb8b2d9bd3215347'
         kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
 
@@ -83,13 +85,62 @@ def test_aarch64_virt(self):
                                'console=ttyAMA0')
         self.require_accelerator("tcg")
         self.vm.add_args('-cpu', 'max,pauth-impdef=on',
+                         '-machine', machine,
                          '-accel', 'tcg',
                          '-kernel', kernel_path,
                          '-append', kernel_command_line)
+
+        # A RNG offers an easy way to generate a few IRQs
+        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
+        self.vm.add_args('-object',
+                         'rng-random,id=rng0,filename=/dev/urandom')
+
+        # Also add a scratch block device
+        logger.info('creating scratch qcow2 image')
+        image_path = os.path.join(self.workdir, 'scratch.qcow2')
+        qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
+        if not os.path.exists(qemu_img):
+            qemu_img = find_command('qemu-img', False)
+        if qemu_img is False:
+            self.cancel('Could not find "qemu-img", which is required to '
+                        'create the temporary qcow2 image')
+        cmd = '%s create -f qcow2 %s 8M' % (qemu_img, image_path)
+        process.run(cmd)
+
+        # Add the device
+        self.vm.add_args('-blockdev',
+                         f"driver=qcow2,file.driver=file,file.filename={image_path},node-name=scratch")
+        self.vm.add_args('-device',
+                         'virtio-blk-device,drive=scratch')
+
         self.vm.launch()
         self.wait_for_console_pattern('Welcome to Buildroot')
         time.sleep(0.1)
         exec_command(self, 'root')
         time.sleep(0.1)
+        exec_command(self, 'dd if=/dev/hwrng of=/dev/vda bs=512 count=4')
+        time.sleep(0.1)
+        exec_command(self, 'md5sum /dev/vda')
+        time.sleep(0.1)
+        exec_command(self, 'cat /proc/interrupts')
+        time.sleep(0.1)
         exec_command(self, 'cat /proc/self/maps')
         time.sleep(0.1)
+
+    def test_aarch64_virt_gicv3(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=machine:virt
+        :avocado: tags=accel:tcg
+        :avocado: tags=cpu:max
+        """
+        self.common_aarch64_virt("virt,gic_version=3")
+
+    def test_aarch64_virt_gicv2(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=machine:virt
+        :avocado: tags=accel:tcg
+        :avocado: tags=cpu:max
+        """
+        self.common_aarch64_virt("virt,gic-version=2")
-- 
2.34.1


