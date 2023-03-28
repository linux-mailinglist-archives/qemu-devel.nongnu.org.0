Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C896CC8F7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 19:16:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phCu8-0004IQ-I7; Tue, 28 Mar 2023 13:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phCu2-0004Hn-Dn
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:14:35 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phCtz-0003d5-9B
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:14:34 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 o24-20020a05600c511800b003ef59905f26so7976632wms.2
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 10:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680023669;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8cNgbsSDC/UUm9AqLvK1cXOSgLg0mHlsYNdhy9K84Hc=;
 b=SNAcpr/nngva8aX9rgRYc9WsgbEBChE3SGDR3loVfQK5hZMexEcHyaOW0Hx0XDEE33
 QsMCfxl0LSLVvBhnusPqr/xv/CKlC8hMelqXx/+RXtRPURv9roW+XK4jsNT5BjgQ1YW0
 NNZhCPADuf1dAUi1nlox5+Zbnd2PtEH5N5K7g4lNGM37g0FUuhpVlBaJqUev1YFwjJQ2
 nXfD3v55HUbXmhJwU3/R18cosjwKYZawDLU4cyH1JbAKgI8sF+62Bq6HdyMYB++lt86a
 lbm0f2SZmHE95DvgO9XfqnQrjyd0b8USplOJ++nrJerfUEl7bK+uUFqXXIYgQYwH/N2a
 KfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680023669;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8cNgbsSDC/UUm9AqLvK1cXOSgLg0mHlsYNdhy9K84Hc=;
 b=Im0oc65yyEUAxJih6XSpswYRTujcijKK3VAv8015TR8YiCPQFuqlYPRxdebv3zv6IT
 eFsaRjRa1jSV2oCNdNN4s/RpXu0lef0HQ/Lklvb5UhJzN454I/lsYGZ53+y7qgxNLGtY
 Le52pg3y/vUg7gIIK8yKCQp4l+lHVbHGvFnNYLW+irbAt1R9mDJecsu2qlSB4c8qKfFT
 sv7umSTsq+LgUTesNZ2nNr/CMYSXg+s20iedzDiYzpmv5o6DNgSDlTp/KCyIHyInDz5z
 jJmLk6eUPjod+vNdsbWIv9Ok7IxNVrunSY83v/un7myIDNmeq+gocEXF1OQnEG2Y4av+
 6nxQ==
X-Gm-Message-State: AO0yUKWYOFDoz6DDJ+YkgSGZ45qqx3x8jK1r1DR6N58kFHXsh/9nCETd
 cBzhBFTUW98vEsUz5fpbHTOBgkfKIS6TYRmV8fo=
X-Google-Smtp-Source: AK7set9Hrgl6YzKXwZ6MLeSmXn+nWUB4UNlAGspYMNM5xM9+AuxBAU3mG/IZBoF+RhtUtI5Q5rHivQ==
X-Received: by 2002:a05:600c:280e:b0:3ed:551b:b78f with SMTP id
 m14-20020a05600c280e00b003ed551bb78fmr12634709wmb.4.1680023669146; 
 Tue, 28 Mar 2023 10:14:29 -0700 (PDT)
Received: from localhost.localdomain ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c0a0600b003ee6aa4e6a9sm13425930wmp.5.2023.03.28.10.14.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Mar 2023 10:14:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v3] tests/avocado: Add set of boot tests on SBSA-ref
Date: Tue, 28 Mar 2023 19:14:26 +0200
Message-Id: <20230328171426.14258-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

This change adds set of boot tests on SBSA-ref machine:

1. boot firmware up to the EDK2 banner
2. boot Alpine Linux

Prebuilt flash volumes are included, built using upstream documentation.

To unify tests for AArch64/virt and AArch64/sbsa-ref we boot
the same Alpine Linux image on both.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230323082813.971535-1-marcin.juszkiewicz@linaro.org>
---
Since v2:
- Use Alpine sha256
- Use @skip* decorators
- Run black indenter

$ AVOCADO_TIMEOUT_EXPECTED=1 avocado --show=app run -t machine:sbsa-ref tests/avocado/machine_aarch64_sbsaref.py
JOB ID     : b6682352323bc601f49a2b247cfe388b4b09047f
JOB LOG    : /home/philippe.mathieu-daude/avocado/job-results/job-2023-03-28T15.29-b668235/job.log
 (1/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_edk2_firmware: PASS (5.85 s)
 (2/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_alpine_linux_cortex_a57: PASS (118.45 s)
 (3/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_alpine_linux_neoverse_n1: PASS (119.22 s)
 (4/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_alpine_linux_max: SKIP: requires TF-A update to handle FEAT_FGT
RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 1 | WARN 0 | INTERRUPT 0 | CANCEL 0
JOB TIME   : 244.32 s
---
 MAINTAINERS                              |   1 +
 tests/avocado/machine_aarch64_sbsaref.py | 158 +++++++++++++++++++++++
 2 files changed, 159 insertions(+)
 create mode 100644 tests/avocado/machine_aarch64_sbsaref.py

diff --git a/MAINTAINERS b/MAINTAINERS
index ef45b5e71e..ee4bd28205 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -928,6 +928,7 @@ L: qemu-arm@nongnu.org
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
2.38.1


