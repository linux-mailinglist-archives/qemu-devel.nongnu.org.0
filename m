Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12E66F08A0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:47:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3oX-0001vu-Na; Thu, 27 Apr 2023 11:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o6-0001pH-Lo
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:18 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o2-0004j0-Hh
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:17 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f19a80a330so41743735e9.2
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682610313; x=1685202313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m3zAanYebbZhFO73oDp9ANAxrPZGnhSnFIhjJ3ZsGEU=;
 b=k25iDfa8qX/wTq6JpIISVl6gD01rxrFSoEX1SnovYzC0SUzx36qrPA0yBzpz7V0Vdt
 LCAtm0nUdFqXu+ljsWtbYqhRAugGfaNV2Cc2xh4wXY/umI91pXLmDniuVDEimCd7BPmI
 eZz3nh9ZUPEV/9HU/nyJlxtOQb3eRY39sdVqbAhAwyj5ksWZ33AISqOWFdCgawdgCgRo
 wGp4MHbzewDP3Vkj3TZhpKHhgLi4J4B7ZpMJXZkK7dujfRzjQ58IWfxdMGvOekFW6aIs
 wY1M0kGpM4l6fHUl/FX4oszzyt3Kz73977/+2gYhGtHTUAQLxC73diuNphBcBXDS/Joc
 6jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610313; x=1685202313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m3zAanYebbZhFO73oDp9ANAxrPZGnhSnFIhjJ3ZsGEU=;
 b=XM7OnL3RzcB+mqfuqCVJKF+z5udbNqksXyPTz/csUzJBTRPOGFV72axYYfynwo+BNS
 YUjuYIhvda+vWyrPAhrtry+s8i5I0wvUFNsv3vH3tjPej663YUuJw2UVRbLmKqUmVc42
 WucU8OPLwxQznxi/NXBoPQlQ9xaXho/zGcf0baE3n/vaTFQ/T9RpFwq2zOYK0IyfUYbl
 0Op15o+Pm3Id01iWc6LNXwU+rdXua7nOBbU1qQBY5erV3YLgKEEszXW+fwNHiUPb9/K2
 5ty+L5+mg1r3DbS9z6GF27XTxert2hVh04NmMLR9130uBHbF1vOPu06ahEJh9l3oOJII
 12Fg==
X-Gm-Message-State: AC+VfDzlTCxpAOwSVSV4gxgM6TqxD9RaHdx0k5Hkq5uAzXXUIaOjGEpP
 BtiXf5TLM2xL99XHVeRR/4b/Cg==
X-Google-Smtp-Source: ACHHUZ4KCY9TJsyYfIyGg73BJceTxOOg3HB2KkeRXbD/INWZbtFKLXSatad63fFuU8LBKzx98wRaXw==
X-Received: by 2002:a05:600c:2155:b0:3ef:df3:1693 with SMTP id
 v21-20020a05600c215500b003ef0df31693mr1697370wml.32.1682610312892; 
 Thu, 27 Apr 2023 08:45:12 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c450e00b003f0a6a1f969sm25272355wmo.46.2023.04.27.08.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 08:45:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0C35D1FFBB;
 Thu, 27 Apr 2023 16:45:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org (open list:SBSA-REF)
Subject: [PULL 03/18] tests/avocado: Add set of boot tests on SBSA-ref
Date: Thu, 27 Apr 2023 16:44:55 +0100
Message-Id: <20230427154510.1791273-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427154510.1791273-1-alex.bennee@linaro.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
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
Message-Id: <20230424092249.58552-4-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index a8b942dea4..214124c84c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -943,6 +943,7 @@ L: qemu-arm@nongnu.org
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


