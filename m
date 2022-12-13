Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B6864B8F2
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 16:51:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p57YF-0005Ru-Jy; Tue, 13 Dec 2022 10:50:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p57Y8-0005Pk-IX
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 10:50:37 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p57Y6-00077A-5j
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 10:50:32 -0500
Received: by mail-wr1-x436.google.com with SMTP id u12so16058737wrr.11
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 07:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IF3EhrrSupu0hN06Z89nBmDPBtfeLQTf71/XWhtNN9s=;
 b=iD3ovvxLq9bjSUL1EIF/wgcdE7aCBSQOZYq5OExFC3TYT3VU5NX6QzC9gTplo4wDmr
 6FGOdxiRjwM7HgskA4ug+AzT0iRA5KwwIwcPV2gHuPsNyYdVAojDcXOsROq/AyUFa0Ij
 +VSmN4Tl7KNFHPIL0Zw14nCEcJLN9Ljheml37Qq1ulADdz/BJVvRVgp0CXmmLg0/LVni
 JiflqUjQbyBPlWZ6Cbwsd9rTDfVp49oSTlUzLmubKQZSi7Sy2wvb05v3QgpMS0NxZ81G
 Y0NP75t2U5juoBBddgjlT9t5Jg46fC8c+KvghVbta8Y/LoI0OnuLXGWojiTfK6Ga1vvW
 dlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IF3EhrrSupu0hN06Z89nBmDPBtfeLQTf71/XWhtNN9s=;
 b=Pt2KiWVmj5sQ+3p1g7EJLGnWxV6JfmwUKKJlz33LXyUfUxA8KhYE0WKi/Zu6Vzp4oK
 4gUPLoLxJfhdiDACRCfdPMN3cFcBsUgIbGddhy0eP2fDf1hi3PpG1oifRbZSbGpel+30
 q0+ZNIIlkIsjart5wytx5L6+fbhAOyTQyjRx5pPTMYbQg24PsDa1s3UB25Tzx/hDntzV
 9rqq42EaWoA4qh/FCXlGC7FB00tN8yyTgRZ+nEXZ18T4o7hnTLzrobt4Wt42vwzInAaR
 yr0YYfm8AKlVsU5FgBmhOHHdR3XNjFF6oIXb6YbfS4fP3s5j8FvMxpdIwJJrfIfRdQsP
 s+7Q==
X-Gm-Message-State: ANoB5plCK9Q4yehf+BTI5c7zfG4YWABtpuwZSlphqIHV9PbD7VDxESuf
 41oqhk9C7R9otszIgjO0uDTaIHnwWMJhaFtjBfo=
X-Google-Smtp-Source: AA0mqf4xbsn1s9rnv/lp/b35lAs05NmaviSdt4VnXZzOwDqRuXXgJPnSRVRLacww1K2dqol99gDqwQ==
X-Received: by 2002:a05:6000:170b:b0:242:806c:8612 with SMTP id
 n11-20020a056000170b00b00242806c8612mr16330621wrc.7.1670946628015; 
 Tue, 13 Dec 2022 07:50:28 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t2-20020adfa2c2000000b002428c4fb16asm159747wra.10.2022.12.13.07.50.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Dec 2022 07:50:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>
Subject: [PATCH-for-8.0] tests/avocado: Add a quick test to boot Trusted
 Firmware on SBSA-ref
Date: Tue, 13 Dec 2022 16:50:25 +0100
Message-Id: <20221213155025.40920-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

This quick test boots TF-A on the SBSA-ref machine up to the
EDK2 banner.

It was helpful to catch an issue with Secure PTW fixed in
commit cead7fa4c0 ("target/arm: Two fixes for secure ptw").

Prebuilt flash volumes are included, with the build recipes
to reproduce.

Example of execution:

  $ avocado --show=app,console run -t machine:sbsa-ref tests/avocado
   (1/1) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_tfa_v2_8:
  console: NOTICE:  Booting Trusted Firmware
  console: NOTICE:  BL1: v2.7(release):v2.8-rc0
  console: NOTICE:  BL1: Built : 22:41:04, Nov 15 2022
  console: NOTICE:  BL1: Booting BL2
  console: NOTICE:  BL2: v2.5(release):v2.5-432-ga4ea20502
  console: NOTICE:  BL2: Built : 13:50:23, Sep 13 2021
  console: NOTICE:  BL1: Booting BL31
  console: NOTICE:  BL31: v2.5(release):v2.5-432-ga4ea20502
  console: NOTICE:  BL31: Built : 13:50:23, Sep 13 2021
  console: UEFI firmware (version 1.0 built at 22:54:31 on Nov 15 2022)
  console: QEMU SBSA-REF Machine
   arm-virt                                            2.00 GHz
   1.0                                                 1024 MB RAM
  PASS (1.73 s)
  RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 1.94 s

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                              |  1 +
 tests/avocado/machine_aarch64_sbsaref.py | 96 ++++++++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 tests/avocado/machine_aarch64_sbsaref.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 6966490c94..ddc2340661 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -891,6 +891,7 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/sbsa-ref.c
 F: docs/system/arm/sbsa.rst
+F: tests/avocado/machine_aarch64_sbsaref.py
 
 Sharp SL-5500 (Collie) PDA
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
new file mode 100644
index 0000000000..b21e3cfc51
--- /dev/null
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -0,0 +1,96 @@
+# Functional test that boots a Linux kernel and checks the console
+#
+# SPDX-FileCopyrightText: 2022 Linaro Ltd.
+# SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+import time
+
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
+    def test_sbsaref_tfa_v2_8(self):
+        """
+        :avocado: tags=cpu:cortex-a57
+
+        Flash volumes generated using:
+
+        - Arm GNU Toolchain version 10.3-2021.07
+          https://developer.arm.com/downloads/-/gnu-a
+          gcc version 10.3.1 20210621 (GNU Toolchain for the A-profile \
+              Architecture 10.3-2021.07 (arm-10.29))
+
+        - Trusted Firmware-A
+          https://github.com/ARM-software/arm-trusted-firmware/blob/v2.8.0/\
+              docs/plat/qemu-sbsa.rst
+
+        - Tianocore EDK II
+          https://github.com/tianocore/edk2/tree/0cb30c3f5e9b/
+          https://github.com/tianocore/edk2-non-osi/tree/61662e8596dd/
+          https://github.com/tianocore/edk2-platforms/tree/e2d7a3014b14/\
+              Platform/Qemu/SbsaQemu
+
+        The last URL contains the various build steps.
+        """
+
+        # Secure BootRom (TF-A code)
+        fs0_xz_url = ('https://fileserver.linaro.org/s/L7BcZXJk37pKfjR/'
+                      'download/SBSA_FLASH0.fd.xz')
+        fs0_xz_hash = 'a865247218af268974a34f8b64af3cfddb3b59de'
+        tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash)
+        archive.extract(tar_xz_path, self.workdir)
+        fs0_path = os.path.join(self.workdir, 'SBSA_FLASH0.fd')
+
+        # Non-secure rom (UEFI and EFI variables)
+        fs1_xz_url = ('https://fileserver.linaro.org/s/rNDQATTJnFCaoxb/'
+                      'download/SBSA_FLASH1.fd.xz')
+        fs1_xz_hash = 'b0ccf5498293d90a28c2f75a3b9906e1d65ad917'
+        tar_xz_path = self.fetch_asset(fs1_xz_url, asset_hash=fs1_xz_hash)
+        archive.extract(tar_xz_path, self.workdir)
+        fs1_path = os.path.join(self.workdir, 'SBSA_FLASH1.fd')
+
+        for path in [fs0_path, fs1_path]:
+            with open(path, 'ab+') as fd:
+                fd.truncate(256 << 20) # Expand volumes to 256MiB
+
+        self.vm.set_console()
+        self.vm.add_args('-cpu', 'cortex-a57',
+                         '-drive', f'if=pflash,file={fs0_path},format=raw',
+                         '-drive', f'if=pflash,file={fs1_path},format=raw')
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
+        wait_for_console_pattern(self, 'Booting Trusted Firmware')
+        wait_for_console_pattern(self, 'BL1: v2.7(release):v2.8-rc0')
+        wait_for_console_pattern(self, 'BL1: Booting BL2')
+
+        # Trusted Boot Firmware
+        wait_for_console_pattern(self, 'BL2: v2.5(release)')
+        wait_for_console_pattern(self, 'Booting BL31')
+
+        # EL3 Runtime Software
+        wait_for_console_pattern(self, 'BL31: v2.5(release)')
+
+        # Non-trusted Firmware
+        wait_for_console_pattern(self, 'UEFI firmware (version 1.0')
+        interrupt_interactive_console_until_pattern(self,
+                                                    'QEMU SBSA-REF Machine')
-- 
2.38.1


