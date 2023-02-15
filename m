Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54312698473
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:26:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNPS-0006k5-QN; Wed, 15 Feb 2023 14:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPM-0006hp-PW
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:36 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPJ-0001g5-P5
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:36 -0500
Received: by mail-wr1-x429.google.com with SMTP id co8so16494375wrb.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pOGRkGIImJUYHM7juc7wyyKAcjrkEX/ui1SLJCBbokI=;
 b=oFXwg/2sI++cuAp23+D+Dh/ns3LCMZ3J8fdAIyoR8ogYJJPLTgGgNIMGcitthKq9WE
 4bt+VZ36yaZ+oTP2OKoPz2VM4B3n09xP8Nv3fUow78x0mpZN4EtoGsacx00Hzkulc3uC
 VZoT6FmF/XZUAo5qLColcMRqzJbJaD5gDmslIQZn0uM06toiJzxVjJOKJyxrPIYHsKfQ
 gVfkhOvzhZKwyAXb/Eh8yqaxmwBPs2C0kdzgj7RKlfzSctCwoTGEgaLku2WrhUBEGnem
 bo+oZZyLKMjTZW4VvJ2zH4pFV4hzol5AkSXU8T3gbS1EIL1zdHyFY4/XvZx2n87HAWy8
 2qCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pOGRkGIImJUYHM7juc7wyyKAcjrkEX/ui1SLJCBbokI=;
 b=25t3ccdCEL0rklCS5TQcjzgOy0uCLhwrVL8vkMtXu/379igPYeI2L8SIwLKVZUZ8Ay
 GX1GLp7Slt0hI6SJSMNtaoe/X1h9Om9PD5hNQEcu3VK/KNGNUO+oyzm+aasveofNP7uJ
 woPshZOf2OUmz050L63K34ufy6r6suosaYmL4cVTy5WK5kF0lkfB/whRgAuB44FOzsEA
 HP+MpAm/erEIFqj1gUgeAQmJ0ufzSyst4KH/MHyvu/Bt6wlqQBtidWtR7fuBIm7tQSFE
 r0zhD1OF+fUtb82KXMX1Lm8KXnYnbTzsdip1Akwt5eNx1tIMsktY1dr+2uTa/xoWqqUO
 O9RQ==
X-Gm-Message-State: AO0yUKUQBrOJ+7ILWBKWijISVwKtolGNaJUYId5OgT+ko/Z7/ze4c26X
 wgZuF+XAVSbGl0xYln88sh/WiXD6zB+FAYcf
X-Google-Smtp-Source: AK7set/CXz1vLUu/7tybIH/+2ZmbEDmxTdPf8SaA6RCRF2HHCdKVWq5fzb3FedVCcpkqL3O4wIJctA==
X-Received: by 2002:a5d:56c5:0:b0:2c3:ed18:2e96 with SMTP id
 m5-20020a5d56c5000000b002c3ed182e96mr2426322wrw.13.1676489132141; 
 Wed, 15 Feb 2023 11:25:32 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a5d614d000000b002c5526234d2sm10480314wrt.8.2023.02.15.11.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 11:25:31 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9C6891FFBA;
 Wed, 15 Feb 2023 19:25:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 02/12] tests/avocado: retire the Aarch64 TCG tests from
 boot_linux.py
Date: Wed, 15 Feb 2023 19:25:20 +0000
Message-Id: <20230215192530.299263-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215192530.299263-1-alex.bennee@linaro.org>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>

---
v2
  - fix checkpatch warning
---
 tests/avocado/boot_linux.py           | 48 ++++----------------
 tests/avocado/machine_aarch64_virt.py | 64 ++++++++++++++++++++++++---
 2 files changed, 66 insertions(+), 46 deletions(-)

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
index c2b2ba2cf8..60921fed8b 100644
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
 
@@ -83,13 +85,63 @@ def test_aarch64_virt(self):
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
+                         f"driver=qcow2,file.driver=file,"
+                         f"file.filename={image_path},node-name=scratch")
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


