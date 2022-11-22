Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A53633938
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:58:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQ0t-0002Un-FY; Tue, 22 Nov 2022 04:56:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0q-0002Ox-CH
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:20 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0o-0003uA-Db
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:20 -0500
Received: by mail-wr1-x42c.google.com with SMTP id b12so10074838wrn.2
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 01:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QZkzgfr3NgI9GQ0WZ4StWbyyScfmFuJGZu1Sf1O5bKM=;
 b=Yx4dqRmKNjPgCjyqbfSAAnrpjQaBTEKQanNn56+8WRJXZCzZNo1r7Ka3MDkgndHOht
 Je/plU6Rn1L1vGt+NE7LxWf7HlSbCQYi5+EanjFB12I7LOp6eWDJZFt3GYx//F92B1Om
 RieQFj52Lm5Vq8Oxkzu9TLS6Guvw4x5/ABA/1zhw9kb+lCA0+x4RmXY0PEq2WR/MwXmq
 sDjMiDvRs9h8d1u6jDfohe9Ob+q+D3i++zbhggNJXC3y557ZfYbnseH2OYo3mRcAOUv9
 sRMwR0XgOiL6RxkhXk56DnmfQo1hhJQHuNzKjxm0QIqnA2MmKuzwZptKUUEsqeAztqqR
 7vKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QZkzgfr3NgI9GQ0WZ4StWbyyScfmFuJGZu1Sf1O5bKM=;
 b=m2ONg2FUQ4oOP51v2rCv2V+3r9f9uvxG1+qfoa/sFnf9rgmjOZ3f0Gvz0RVr7RtfwZ
 vpshRrEfI1V314hGIK5BsvEdQ4RLnOq/L2BnI/GqUfLKDUW7smpb8rPUTaQ+iiKyETiU
 8e7qmh/dDaLyzMTrhn+byb8M5dbIjEGCOCdRxLVZXdO5hzQEp94Ngzrq4dBKDS28Wy9M
 A2bZjIzU98E2+nKQyTM+K5aZ8EqMbfNA+qQoI6KgYXbhlq+OE2ESAi22CD7N1Z5jk4yp
 H+1PXJQBaLBVfL8Yef29TARmcbciQzCeUbwpR3Ofh2n1dmXVot051LvJ5iVQzmlYXDP9
 mZuQ==
X-Gm-Message-State: ANoB5pnzkA1drNl58o42kAU8CxrFy4hjvdbDCpLHAb2ECxXyuj+IJm0R
 PMuRPgpGOPS62KlCjqQhnkTHBw==
X-Google-Smtp-Source: AA0mqf4CClIxmCHL2eng0y90ujJ/GeToizqLP5SPEZN6hgbDCmdA1a4a/Vfi4ocr799zv30VSdm5DQ==
X-Received: by 2002:adf:ea82:0:b0:241:e749:f75c with SMTP id
 s2-20020adfea82000000b00241e749f75cmr286887wrm.609.1669110976959; 
 Tue, 22 Nov 2022 01:56:16 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m29-20020a05600c3b1d00b003c6b7f5567csm2259001wms.0.2022.11.22.01.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 01:56:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6C8251FFC1;
 Tue, 22 Nov 2022 09:56:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org (open list:Virt)
Subject: [PULL v2 09/11] tests/avocado: introduce alpine virt test for CI
Date: Tue, 22 Nov 2022 09:56:08 +0000
Message-Id: <20221122095610.3343175-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122095610.3343175-1-alex.bennee@linaro.org>
References: <20221122095610.3343175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221117172532.538149-10-alex.bennee@linaro.org>

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


