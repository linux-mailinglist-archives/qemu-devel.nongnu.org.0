Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 729D962E2FC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 18:27:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovieF-0006Qs-VW; Thu, 17 Nov 2022 12:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovie4-0006LO-7w
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:49 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovie0-0006Es-7w
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:47 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so1646921wma.1
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 09:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=26+j95KhNnRg/9welD9ngC/SIn1nmwD8VeCvoiMe1LU=;
 b=YgCe2PVQijyi04ajtrLo84dw7mATzK7TD4mOOLljMpfS2dbUa3JswIAy0VJMUigvJB
 pRCxy4n1+Gy08IDESPCJX4B1Tt7Ubm280y04JZjI6xlRKYjrd4OtcgEVBquZXBketgBc
 uKgVB27+gNt8Sevvo3nHl/27k7/uR8DaBkpjevLd6to+Q1Tm5ukvxoT1ZXAyGU/OhCdf
 6pAXx4Hhgvy9RnFxnkGB0ye3h2PUmldHAq9sCVqRyYuCLC3SFsq13h8PtDxMqWpZl+pr
 zJQ6qOeg0svxQqzfCjdzOEtYw2mNwDfgDMBf5pj53HxPJ+HBpXnvT3jgCOz/7W7y1DjK
 ///w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=26+j95KhNnRg/9welD9ngC/SIn1nmwD8VeCvoiMe1LU=;
 b=HqDflufN/+sjK4WhILSpuvQLMqwrlB1aIQ1E2gAXWJyTQK7AF4bP4zcANjpQfDkLqq
 cb1/qD0crLGHaPWK+4OqTv3BWLqJ3nW67TiyK22pUGdGxHprynGroBjY24Su+3SpRHvs
 jsAWR/xbxbaRQY9TpHRBUhSPHW88Uylf+xVlPWKSgUHKLcYoyO7qSBney2Ux3SERlhBg
 z1TKzN+djZjSNqjFiRNko9Rl/siA8oYy5XJl3Lol4RdHwxr1UeYav5Hz/5GNbvY40TWt
 HbRZvOQLonO90k1VJlQ3kfhjzWFeglCEBPmIEF9O+NYUJt9V10nTEXeaGgmFt9fcTgiB
 9NSQ==
X-Gm-Message-State: ANoB5pnUmvSpouE2vnaSZ4gc38duAusVuiDEFGBjNykRENM74niIcX1U
 mfsdq0y9TblgwN6wg47RZCj/OA==
X-Google-Smtp-Source: AA0mqf6BAIyDT6V+BVpmqlC9Fkrod7xaA8slwcSzX9S6bvKfv2hzsZ6Omf+lyF7bAPL5UZVfdZSXpQ==
X-Received: by 2002:a7b:c456:0:b0:3a5:f600:502e with SMTP id
 l22-20020a7bc456000000b003a5f600502emr2479667wmi.39.1668705939518; 
 Thu, 17 Nov 2022 09:25:39 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l32-20020a05600c1d2000b003cfbbd54178sm11306161wms.2.2022.11.17.09.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 09:25:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B30041FFC1;
 Thu, 17 Nov 2022 17:25:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org (open list:Virt)
Subject: [PATCH  v3 09/13] tests/avocado: introduce alpine virt test for CI
Date: Thu, 17 Nov 2022 17:25:28 +0000
Message-Id: <20221117172532.538149-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117172532.538149-1-alex.bennee@linaro.org>
References: <20221117172532.538149-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

The boot_linux tests download and run a full cloud image boot and
start a full distro. While the ability to test the full boot chain is
worthwhile it is perhaps a little too heavy weight and causes issues
in CI. Fix this by introducing a new alpine linux ISO boot in
machine_aarch64_virt.

This boots a fully loaded -cpu max with all the bells and whistles in
31s on my machine. A full debug build takes around 180s on my machine
so we set a more generous timeout to cover that.

We don't add a test for lesser GIC versions although there is some
coverage for that already in the boot_xen.py tests. If we want to
introduce more comprehensive testing we can do it with a custom kernel
and initrd rather than a full distro boot.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v1
  - use "virt" image instead (even faster)
  - don't drop boot_linux (it is now disabled for CI)
  - re-phrase commit message
  - add alpine to the test name
---
 tests/avocado/machine_aarch64_virt.py | 46 ++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/tests/avocado/machine_aarch64_virt.py b/tests/avocado/machine_aarch64_virt.py
index 21848cba70..c2b2ba2cf8 100644
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
+    def test_alpine_virt_tcg_gic_max(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=machine:virt
+        :avocado: tags=accel:tcg
+        """
+        iso_url = ('https://dl-cdn.alpinelinux.org/'
+                   'alpine/v3.16/releases/aarch64/'
+                   'alpine-virt-3.16.3-aarch64.iso')
+
+        # Alpine use sha256 so I recalculated this myself
+        iso_sha1 = '0683bc089486d55c91bf6607d5ecb93925769bc0'
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


