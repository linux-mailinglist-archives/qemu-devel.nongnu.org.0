Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5C962DA8F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 13:21:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovdrf-0003ev-5O; Thu, 17 Nov 2022 07:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovdrc-0003eF-NN
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 07:19:28 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovdrN-0000lw-07
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 07:19:28 -0500
Received: by mail-wr1-x435.google.com with SMTP id g12so3496210wrs.10
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 04:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zppMS3RzLmE69IsYwkyZCWHtAwFFv5mlWItJsz2ebKo=;
 b=LzrCaIivMO5Rlbb1xE1gYW1lRgw92kX+e4c3aQ2NEw4sVENVzGjC4Am5/IC2r9qYDN
 YhlR82srSnDINOzcCjRKrVjzi0jL9jHn41pju6OfNHkpKi85x1VMuKOXUoQGPwKB8v3m
 Gw3z++u4ZL0olJJYKrGI0iyd9JizK2JpzUVco8ra2dGn0qj+tiuc7RTy989bznfpzR6Q
 37+Vh5rEVvYDMV3I6Z7nd4sRZI/EWJVtHCaP+9DepQW5tJJrAhVjknjKsXyh0RkZZdGE
 /xpkiQJR0N4rqHKDqX2WWjlnKT4b9QKIF7IWcpZhugG3cJH4egHtNasQ+OzBSeHhTzVh
 bgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zppMS3RzLmE69IsYwkyZCWHtAwFFv5mlWItJsz2ebKo=;
 b=r7DJ+KvBpQ07tm2ex7uaPyfsX0WeGXyUmwf450DNxt1AGStRcS2owo1Dk4kBY9iq3B
 b6kxPcsVDdTlhbCwUdA3qHvr2B1QVBnzbhDcUzqZH5thBYz4ZYv0PR3Kpi4gAnpx3qJp
 8bCW6SAmqdrEdjwrp9xMeD0UqR6hDbJpkjdQSUqAxxHrnVet2GQi3joI0QEY9pKm2omd
 e/+0316AaqvtDHyWp+KtebE0gJJ+NvKMJ1D5tdXlJk0tsZFlRULc/QlMnc3G5UqXA+BQ
 AU3rTgq6jo4e+TcYxC5/2XDatxpb1t3Xb1MwrJXT7z35XKaBn8vxfG9kgbnu1/MFq/Qp
 pcgg==
X-Gm-Message-State: ANoB5pmEMRmProVQ51oKAVNGCfEgdI7IrU4D6K8WfDh6F2oLFP7VXsmU
 LT5WSRGwsDBMsp9gIukJTfwcAA==
X-Google-Smtp-Source: AA0mqf4/+n307EnxYqsZ6gozdyj6A9Gd6qodf/u4Fo9f/sAc0yuWX/obZu0Hd95AeTbTmgUDxpmd9Q==
X-Received: by 2002:a05:6000:1246:b0:22c:d593:f04d with SMTP id
 j6-20020a056000124600b0022cd593f04dmr1316966wrx.277.1668687551238; 
 Thu, 17 Nov 2022 04:19:11 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c458d00b003c7087f6c9asm5743657wmo.32.2022.11.17.04.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 04:19:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 62A8B1FFB7;
 Thu, 17 Nov 2022 12:19:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, thuth@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] tests/avocado: move aarch64 boot_linux tcg tests and slim
 down
Date: Thu, 17 Nov 2022 12:19:00 +0000
Message-Id: <20221117121900.3922169-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

The boot_linux tests download and run a full cloud image boot and
start a full distro. While the ability to test the full boot chain is
worthwhile it is perhaps a little too heavy weight and causes issues
in CI. Fix this by dropping the TCG tests in boot_linux and replacing
them with a alpine linux ISO boot in machine_aarch64_virt.

This boots a fully loaded -cpu max with all the bells and whistles in
41s on my machine. A full debug build takes around 250s on my machine
so we set a more generous timeout to cover that.

We do drop testing for lesser GIC versions although there is some
coverage for that already in the boot_xen.py tests. If we want to
introduce more comprehensive testing we can do it with a custom kernel
and initrd rather than a full distro boot.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/boot_linux.py           | 43 +++++--------------------
 tests/avocado/machine_aarch64_virt.py | 46 ++++++++++++++++++++++++++-
 2 files changed, 53 insertions(+), 36 deletions(-)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index 2be4be395d..0b747d5aa9 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -58,56 +58,29 @@ def test_pc_q35_kvm(self):
         self.launch_and_wait(set_up_ssh_connection=False)
 
 
+# For Aarch64 we only boot KVM tests with the full LinuxTest cloud
+# init. The TCG tests are run with lighter weight distros in the
+# machine_aarch64_virt.py tests.
 class BootLinuxAarch64(LinuxTest):
     """
     :avocado: tags=arch:aarch64
     :avocado: tags=machine:virt
-    :avocado: tags=machine:gic-version=2
     """
     timeout = 240
 
-    def add_common_args(self):
-        self.vm.add_args('-bios',
-                         os.path.join(BUILD_DIR, 'pc-bios',
-                                      'edk2-aarch64-code.fd'))
-        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
-        self.vm.add_args('-object', 'rng-random,id=rng0,filename=/dev/urandom')
-
-    def test_virt_tcg_gicv2(self):
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
-    def test_virt_tcg_gicv3(self):
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
         :avocado: tags=cpu:host
+        :avocado: tags=machine:gic-version=host
         """
         self.require_accelerator("kvm")
         self.vm.add_args("-accel", "kvm")
         self.vm.add_args("-machine", "virt,gic-version=host")
-        self.add_common_args()
+        self.vm.add_args('-bios', os.path.join(BUILD_DIR, 'pc-bios',
+                                               'edk2-aarch64-code.fd'))
+        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
+        self.vm.add_args('-object', 'rng-random,id=rng0,filename=/dev/urandom')
         self.launch_and_wait(set_up_ssh_connection=False)
 
 
diff --git a/tests/avocado/machine_aarch64_virt.py b/tests/avocado/machine_aarch64_virt.py
index 21848cba70..19a2bcb7ad 100644
--- a/tests/avocado/machine_aarch64_virt.py
+++ b/tests/avocado/machine_aarch64_virt.py
@@ -1,4 +1,5 @@
-# Functional test that boots a Linux kernel and checks the console
+# Functional test that boots a various Linux systems and checks the
+# console output.
 #
 # Copyright (c) 2022 Linaro Ltd.
 #
@@ -8,19 +9,62 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 
 import time
+import os
 
 from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 from avocado_qemu import exec_command
+from avocado_qemu import BUILD_DIR
 
 class Aarch64VirtMachine(QemuSystemTest):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+    timeout = 360
 
     def wait_for_console_pattern(self, success_message, vm=None):
         wait_for_console_pattern(self, success_message,
                                  failure_message='Kernel panic - not syncing',
                                  vm=vm)
 
+    # This tests the whole boot chain from EFI to Userspace
+    # We only boot a whole OS for the current top level CPU and GIC
+    # Other test profiles should use more minimal boots
+    def test_virt_tcg_gic_max(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=machine:virt
+        :avocado: tags=accel:tcg
+        """
+        iso_url = ('https://dl-cdn.alpinelinux.org/'
+                   'alpine/v3.16/releases/aarch64/'
+                   'alpine-standard-3.16.3-aarch64.iso')
+
+        # Alpine use sha256 so I recalculated this myself
+        iso_sha1 = 'd2c461648ed9fe217c0f1bf90c2747d17244f1dc'
+        iso_path = self.fetch_asset(iso_url, asset_hash=iso_sha1)
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyAMA0')
+        self.require_accelerator("tcg")
+
+        self.vm.add_args("-accel", "tcg")
+        self.vm.add_args("-cpu", "max,pauth-impdef=on")
+        self.vm.add_args("-machine",
+                         "virt,acpi=on,"
+                         "virtualization=on,"
+                         "mte=on,"
+                         "gic-version=max,iommu=smmuv3")
+        self.vm.add_args("-smp", "2", "-m", "1024")
+        self.vm.add_args('-bios', os.path.join(BUILD_DIR, 'pc-bios',
+                                               'edk2-aarch64-code.fd'))
+        self.vm.add_args("-drive", f"file={iso_path},format=raw")
+        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
+        self.vm.add_args('-object', 'rng-random,id=rng0,filename=/dev/urandom')
+
+        self.vm.launch()
+        self.wait_for_console_pattern('Welcome to Alpine Linux 3.16')
+
+
     def test_aarch64_virt(self):
         """
         :avocado: tags=arch:aarch64
-- 
2.34.1


