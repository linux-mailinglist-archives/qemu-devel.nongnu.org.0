Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A951C68A16F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 19:18:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO0cb-0006vi-BI; Fri, 03 Feb 2023 13:17:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pO0cA-0006sl-Aq
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:17:03 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pO0c8-000265-5u
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:16:46 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so4533121wms.2
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 10:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EzqoLWqBm0/hNkAOy5sIAnLAMP+HyBvp1Gw9LlyYTNA=;
 b=DaWGN7IIPVnTVKq4iE7J8Woc67f/ushPtS27gDaWEhtVPwm3r1vjOgY1xbsIfYi/Pm
 8S5/SzK9ZnMp2PG7qXdeGqQZaCV7/98ggCeDelgXa5akqR57SVq49MxJZmvhrw3DXmrd
 ArbHKf9Duca+QY9R73AfwZaW8GQLdkrbxmq/IwWUiuNQIvdsB9WMq7ZmBr4/Zy870dpM
 kHj3ApFDUqUrgApaRK9qg1Mxr3ho3hVB7uRGAMBtCUsJNwz5PWcwjao4MaMMnfHZ+NkI
 ZGrJK5DCG8UH1Blwqt+TFJAVslXmzau3TqSerKY3tGXSuLFdC93URYxBC+LdlK/xxE/P
 TakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EzqoLWqBm0/hNkAOy5sIAnLAMP+HyBvp1Gw9LlyYTNA=;
 b=kPi564lT8vWv7zbLGMZ22CN9zaiKk/irSb74+6BdfvRfxPlWf4pfjE41OfyaW8bAWg
 zNKGH1pLm0S04szizFM3nJFbS0ohrkROOXnHyIp9HTiETT82GajG671yiTyToqpFLR4g
 9SO0q0UskMywmThcwI6ueoyRtPmkjWk32BAecftevZ5MRTLTqe1/L3+fF3x+D0OI+N/t
 4T+uCcJfbonA8/7mdltiLdVqRh8PFJAw7wnNhJGWpa6hywl/qT/+Wb01qhaaDHXNqzPu
 tlcQPqRGc6uBnx7UA8TuTk4hymWmA4OVpWHpuExU8FP40n99Kx/OjggtZBUWdrEBCHFh
 9gZg==
X-Gm-Message-State: AO0yUKUGWxVyyUZetE3+JY+D1xlRQpAA4lyFN+Z2dUrp8JEnATsnbQFZ
 y50MtsnxqFZeohZycRJZLhYN8A==
X-Google-Smtp-Source: AK7set/Y7z7UUCNwJe4wEWPKRrcam+q6/8yuW8ODz595YaLA8yUNfF7rKtDIQyPnyVsOG7wEZ8YwLg==
X-Received: by 2002:a05:600c:3ac7:b0:3dc:557f:6123 with SMTP id
 d7-20020a05600c3ac700b003dc557f6123mr10499003wms.1.1675448202378; 
 Fri, 03 Feb 2023 10:16:42 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c351000b003dc521f336esm3688797wmq.14.2023.02.03.10.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 10:16:41 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 633E41FFB7;
 Fri,  3 Feb 2023 18:16:41 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] tests/avocado: retire the Aarch64 TCG tests from
 boot_linux.py
Date: Fri,  3 Feb 2023 18:16:32 +0000
Message-Id: <20230203181632.2919715-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 tests/avocado/boot_linux.py           | 48 ++++----------------
 tests/avocado/machine_aarch64_virt.py | 63 ++++++++++++++++++++++++---
 2 files changed, 65 insertions(+), 46 deletions(-)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index b3e58fa309..fe0bb180d9 100644
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
index c2b2ba2cf8..25dab8dc00 100644
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
2.39.1


