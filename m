Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 459146E4A37
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 15:44:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poP92-000100-0g; Mon, 17 Apr 2023 09:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poP8o-0000wW-LP
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:43:35 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poP8m-0006PN-5e
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:43:34 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 he11-20020a05600c540b00b003ef6d684102so11877183wmb.3
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 06:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681739010; x=1684331010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LMO93F3Hze3WmAFJjq9M6fx6aUK0FzdAjBDglR4FAf0=;
 b=DjAruh2zsN6yukgVe7V3XGLyQyveYf4UpKsK0AOqEpuraYvlPdHxVI2CzBH+LV8t4Q
 YV89Y23fwW1NA4n3x9dFGx4+gqWsWzN4+eFRcoqaecd2QSq7HI6s3EomKkomocv6DQxJ
 bm0tpcxNuUVkMX1KLOpA2XjaG+30jYn7ZBVVbZ6Z3/ZCqOnxJ7Om1K8TTSdf0SKxEfcb
 RwcNcDjz3Bux+s36TOYEsxV0DM5VTQbHkaw4zysNqK3w9vhYrwNnEz+U6tWUokTQG4Bz
 7yITOd4iwRF6a6uuw9vlvfAYwyB7q0vA84OjTpko3Hrq2iNRZFckSm11E09EFN6o9Bue
 V26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681739010; x=1684331010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LMO93F3Hze3WmAFJjq9M6fx6aUK0FzdAjBDglR4FAf0=;
 b=aa43n/OfLhLnhkx8MX1WayzhQKK6BFwOKhHoGeTr2aoI+n5KqQtrKJBrxpXJW8IKLU
 6sIM0dMZJsWthFz1dgRW79QiPUoIAMrdKPJGLNDIWyD42dW/J/7S0W68Ma5foQZY0TnZ
 Gk4ovHOT1zE5DAM92to/MqLxCbdeQXAaIRm7o4bWLCS0xWR2130GI2Gj7jLyPVlm6drj
 fNR0ZxFw5U9a1UJ8D4LVmR5peQWsVpmnAxhos/TruoEzdrub1swqCvS/lAy8FEDzv8gO
 7922hs4PidYMcAwY32bEqXaNYaeP+zCmx1DgYvfCfpBLRvFW4bf56tqFEPEyXXGfrZ0G
 3ASQ==
X-Gm-Message-State: AAQBX9dTXUjwKNQP5O3M6P37Nf65wZ2QzyrjpK4/w7QQ732q93n9NLkn
 KGTecDKyYuuGr7NPfEW8cbQYqg==
X-Google-Smtp-Source: AKy350aL8Oyf7LStqu1hFU8kK3deqSje9F48GgYZZEEwb4L2ie1RhE0+VGeZc65q1jCpoWy3iE/qDg==
X-Received: by 2002:a1c:f315:0:b0:3f1:6757:6243 with SMTP id
 q21-20020a1cf315000000b003f167576243mr5090506wmq.35.1681739010249; 
 Mon, 17 Apr 2023 06:43:30 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 iv8-20020a05600c548800b003f09e294d5esm15588456wmb.6.2023.04.17.06.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 06:43:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2B2261FFBB;
 Mon, 17 Apr 2023 14:43:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v4 3/6] tests/avocado: Add set of boot tests on SBSA-ref
Date: Mon, 17 Apr 2023 14:43:18 +0100
Message-Id: <20230417134321.3627231-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417134321.3627231-1-alex.bennee@linaro.org>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

This change adds set of boot tests on SBSA-ref machine:

1. boot firmware up to the EDK2 banner
2. boot Alpine Linux

Prebuilt flash volumes are included, built using upstream documentation.

To unify tests for AArch64/virt and AArch64/sbsa-ref we boot
the same Alpine Linux image on both.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230323082813.971535-1-marcin.juszkiewicz@linaro.org>
Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>
Message-Id: <20230328171426.14258-1-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS                              |   1 +
 tests/avocado/machine_aarch64_sbsaref.py | 158 +++++++++++++++++++++++
 2 files changed, 159 insertions(+)
 create mode 100644 tests/avocado/machine_aarch64_sbsaref.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 2c2068ea5c..b31e00f318 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -942,6 +942,7 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/sbsa-ref.c
 F: docs/system/arm/sbsa.rst
+F: tests/avocado/machine_aarch64_sbsaref.py
 
 Sharp SL-5500 (Collie) PDA
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
new file mode 100644
index 0000000000..0a79fa7ab6
--- /dev/null
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -0,0 +1,158 @@
+# Functional test that boots a Linux kernel and checks the console
+#
+# SPDX-FileCopyrightText: 2023 Linaro Ltd.
+# SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
+# SPDX-FileContributor: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+
+from avocado import skip
+from avocado import skipUnless
+from avocado.utils import archive
+
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import interrupt_interactive_console_until_pattern
+
+
+class Aarch64SbsarefMachine(QemuSystemTest):
+    """
+    :avocado: tags=arch:aarch64
+    :avocado: tags=machine:sbsa-ref
+    """
+
+    timeout = 180
+
+    def fetch_firmware(self):
+        """
+        Flash volumes generated using:
+
+        - Fedora GNU Toolchain version 12.2.1 20220819 (Red Hat Cross 12.2.1-2)
+
+        - Trusted Firmware-A
+          https://github.com/ARM-software/arm-trusted-firmware/tree/5fdb2e54
+
+        - Tianocore EDK II
+          https://github.com/tianocore/edk2/tree/494127613b
+          https://github.com/tianocore/edk2-non-osi/tree/41876073
+          https://github.com/tianocore/edk2-platforms/tree/8efa4f42
+        """
+
+        # Secure BootRom (TF-A code)
+        fs0_xz_url = (
+            "https://fileserver.linaro.org/s/ATnSmq6k8SoXgbH/"
+            "download/SBSA_FLASH0.fd.xz"
+        )
+        fs0_xz_hash = "a210a09692bcbe0a3743ffd0df44e80e0c7ad8ab"
+        tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash)
+        archive.extract(tar_xz_path, self.workdir)
+        fs0_path = os.path.join(self.workdir, "SBSA_FLASH0.fd")
+
+        # Non-secure rom (UEFI and EFI variables)
+        fs1_xz_url = (
+            "https://fileserver.linaro.org/s/t8foNnMPz74DZZy/"
+            "download/SBSA_FLASH1.fd.xz"
+        )
+        fs1_xz_hash = "13a9a262953787c7fc5a9155dfaa26e703631e02"
+        tar_xz_path = self.fetch_asset(fs1_xz_url, asset_hash=fs1_xz_hash)
+        archive.extract(tar_xz_path, self.workdir)
+        fs1_path = os.path.join(self.workdir, "SBSA_FLASH1.fd")
+
+        for path in [fs0_path, fs1_path]:
+            with open(path, "ab+") as fd:
+                fd.truncate(256 << 20)  # Expand volumes to 256MiB
+
+        self.vm.set_console()
+        self.vm.add_args(
+            "-drive",
+            f"if=pflash,file={fs0_path},format=raw",
+            "-drive",
+            f"if=pflash,file={fs1_path},format=raw",
+            "-smp",
+            "1",
+            "-machine",
+            "sbsa-ref",
+        )
+
+    def test_sbsaref_edk2_firmware(self):
+        """
+        :avocado: tags=cpu:cortex-a57
+        """
+
+        self.fetch_firmware()
+        self.vm.launch()
+
+        # TF-A boot sequence:
+        #
+        # https://github.com/ARM-software/arm-trusted-firmware/blob/v2.8.0/\
+        #     docs/design/trusted-board-boot.rst#trusted-board-boot-sequence
+        # https://trustedfirmware-a.readthedocs.io/en/v2.8/\
+        #     design/firmware-design.html#cold-boot
+
+        # AP Trusted ROM
+        wait_for_console_pattern(self, "Booting Trusted Firmware")
+        wait_for_console_pattern(self, "BL1: v2.8(release):v2.8")
+        wait_for_console_pattern(self, "BL1: Booting BL2")
+
+        # Trusted Boot Firmware
+        wait_for_console_pattern(self, "BL2: v2.8(release)")
+        wait_for_console_pattern(self, "Booting BL31")
+
+        # EL3 Runtime Software
+        wait_for_console_pattern(self, "BL31: v2.8(release)")
+
+        # Non-trusted Firmware
+        wait_for_console_pattern(self, "UEFI firmware (version 1.0")
+        interrupt_interactive_console_until_pattern(self, "QEMU SBSA-REF Machine")
+
+    # This tests the whole boot chain from EFI to Userspace
+    # We only boot a whole OS for the current top level CPU and GIC
+    # Other test profiles should use more minimal boots
+    def boot_alpine_linux(self, cpu):
+        self.fetch_firmware()
+
+        iso_url = (
+            "https://dl-cdn.alpinelinux.org/"
+            "alpine/v3.17/releases/aarch64/alpine-standard-3.17.2-aarch64.iso"
+        )
+
+        iso_hash = "5a36304ecf039292082d92b48152a9ec21009d3a62f459de623e19c4bd9dc027"
+        iso_path = self.fetch_asset(iso_url, algorithm="sha256", asset_hash=iso_hash)
+
+        self.vm.set_console()
+        self.vm.add_args(
+            "-cpu",
+            cpu,
+            "-drive",
+            f"file={iso_path},format=raw",
+            "-device",
+            "virtio-rng-pci,rng=rng0",
+            "-object",
+            "rng-random,id=rng0,filename=/dev/urandom",
+        )
+
+        self.vm.launch()
+        wait_for_console_pattern(self, "Welcome to Alpine Linux 3.17")
+
+    @skipUnless(os.getenv("AVOCADO_TIMEOUT_EXPECTED"), "Test might timeout")
+    def test_sbsaref_alpine_linux_cortex_a57(self):
+        """
+        :avocado: tags=cpu:cortex-a57
+        """
+        self.boot_alpine_linux("cortex-a57")
+
+    @skipUnless(os.getenv("AVOCADO_TIMEOUT_EXPECTED"), "Test might timeout")
+    def test_sbsaref_alpine_linux_neoverse_n1(self):
+        """
+        :avocado: tags=cpu:max
+        """
+        self.boot_alpine_linux("neoverse-n1")
+
+    @skip("requires TF-A update to handle FEAT_FGT")
+    def test_sbsaref_alpine_linux_max(self):
+        """
+        :avocado: tags=cpu:max
+        """
+        self.boot_alpine_linux("max,pauth-impdef=on")
-- 
2.39.2


