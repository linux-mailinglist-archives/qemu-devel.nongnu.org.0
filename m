Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F23746484D9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 16:18:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3f82-0005WJ-N8; Fri, 09 Dec 2022 10:17:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3f6k-00057D-U7
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:16:23 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3f6h-0008Dg-Vs
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:16:14 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so64747wma.1
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 07:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X94vOjJli80zkgb0fhpVEEc/w9edJfWAmH0Oey1raYk=;
 b=wU087BbnXdpGzdtdBGi6yc0d98iZxJgAQvhe9Wcs1oN3zGPRxLlMS65xl4HKcR6hTG
 F4te2IfzT3Zkdgb3h2WFAEIP5yPNI1UlDeRrNeJ06pSGJ1HTCX9hR9JTEOHKinrL7WZj
 uO1uGUF2Kh8yMX8DpdgVtzC1onCCHso6mLZY9ISrbtWrbs9lYvx4KCaVPw41WFucDbwi
 D7HtO4QEqpDlfwoSAGTBu6YRsON1VXJjahoijVid52tczfm1ckGbnEAOgn5cYVvtQSdG
 Ghb5tAT1uGP5egXY1VP4sgZcEnokpxW2q80P+cXgt1g85CTfS7SsNex+URmbN3Xgj6N1
 vkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X94vOjJli80zkgb0fhpVEEc/w9edJfWAmH0Oey1raYk=;
 b=LJ+k9/74Tx3RH5NQZVQBfV/twEiQFgDdo13Q1uqwJaaud2do0yAnhUCopT8hdSqfMv
 T2Kd1D0ucd6GjN8TVtDWCN7ETc32yOKyb6TYyVoOGwjrivlbqf1XSVoBKKc+Qa2114sd
 N4x6ZzZY4/UKJp4xdfbMtUPgQ4eVWWMzjc1oIQp0zK5Iuk64mXOobof4KbLCNdPMzetO
 GHMb8ZnHuOA9rJQpXzOAF86yjLLfO+cbxQ8XpVqubY4hh8DoJR56n5nYCvbD6/Hne6o1
 3yOW6ti44Swm/iQneD/m3g5vl8nn4TGzF2h8fNZ3KhRdv6FAwgqC4kxMDW9fUrXWvD73
 YqKg==
X-Gm-Message-State: ANoB5plE5UTBjc4zRM8yv0YcmvbB5rhjxW+Kb50pvliDs5GKu0tLZSn3
 QrBgcBBESrCw2bs2AX+ccwFtef3Dymzu5H/p9sI=
X-Google-Smtp-Source: AA0mqf5S2YGVmpRH/4yivwA2Gw0x7hbAB7JMScrgGGEFXqTVdfo2N6MpYxJXGgU+utvBljHhleJtbw==
X-Received: by 2002:a05:600c:4451:b0:3cf:894d:1d06 with SMTP id
 v17-20020a05600c445100b003cf894d1d06mr5597207wmn.30.1670598970122; 
 Fri, 09 Dec 2022 07:16:10 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c474a00b003c701c12a17sm54144wmo.12.2022.12.09.07.16.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 07:16:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH-for-8.0 7/7] hw/mips/gt64xxx_pci: Move it to hw/pci-host/
Date: Fri,  9 Dec 2022 16:15:33 +0100
Message-Id: <20221209151533.69516-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209151533.69516-1-philmd@linaro.org>
References: <20221209151533.69516-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The GT-64120 is a north-bridge, and it is not MIPS specific.
Move it with the other north-bridge devices.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS                                   | 2 +-
 hw/mips/Kconfig                               | 6 ------
 hw/mips/meson.build                           | 1 -
 hw/mips/trace-events                          | 6 ------
 hw/pci-host/Kconfig                           | 6 ++++++
 hw/{mips/gt64xxx_pci.c => pci-host/gt64120.c} | 0
 hw/pci-host/meson.build                       | 1 +
 hw/pci-host/trace-events                      | 7 +++++++
 meson.build                                   | 1 -
 9 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 hw/mips/trace-events
 rename hw/{mips/gt64xxx_pci.c => pci-host/gt64120.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6966490c94..e558b53e85 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1226,7 +1226,7 @@ S: Odd Fixes
 F: hw/isa/piix4.c
 F: hw/acpi/piix4.c
 F: hw/mips/malta.c
-F: hw/mips/gt64xxx_pci.c
+F: hw/pci-host/gt64120.c
 F: include/hw/southbridge/piix.h
 F: tests/avocado/linux_ssh_mips_malta.py
 F: tests/avocado/machine_mips_malta.py
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index 8f7bce38fb..7a55143f8a 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -60,9 +60,3 @@ config MIPS_BOSTON
 
 config FW_CFG_MIPS
     bool
-
-config GT64120
-    bool
-    select PCI
-    select EMPTY_SLOT
-    select I8259
diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index 152103f15f..900613fc08 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -3,7 +3,6 @@ mips_ss.add(files('bootloader.c', 'mips_int.c'))
 mips_ss.add(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg.c'))
 mips_ss.add(when: 'CONFIG_LOONGSON3V', if_true: files('loongson3_bootp.c', 'loongson3_virt.c'))
 mips_ss.add(when: 'CONFIG_MALTA', if_true: files('malta.c'))
-softmmu_ss.add(when: 'CONFIG_GT64120', if_true: files('gt64xxx_pci.c'))
 mips_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('cps.c'))
 
 if 'CONFIG_TCG' in config_all
diff --git a/hw/mips/trace-events b/hw/mips/trace-events
deleted file mode 100644
index 13ee731a48..0000000000
--- a/hw/mips/trace-events
+++ /dev/null
@@ -1,6 +0,0 @@
-# gt64xxx_pci.c
-gt64120_read(uint64_t addr, uint64_t value) "gt64120 read 0x%03"PRIx64" value:0x%08" PRIx64
-gt64120_write(uint64_t addr, uint64_t value) "gt64120 write 0x%03"PRIx64" value:0x%08" PRIx64
-gt64120_read_intreg(const char *regname, unsigned size, uint64_t value) "gt64120 read %s size:%u value:0x%08" PRIx64
-gt64120_write_intreg(const char *regname, unsigned size, uint64_t value) "gt64120 write %s size:%u value:0x%08" PRIx64
-gt64120_isd_remap(uint64_t from_length, uint64_t from_addr, uint64_t to_length, uint64_t to_addr) "ISD: 0x%08" PRIx64 "@0x%08" PRIx64 " -> 0x%08" PRIx64 "@0x%08" PRIx64
diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
index 38fd2ee8f3..a07070eddf 100644
--- a/hw/pci-host/Kconfig
+++ b/hw/pci-host/Kconfig
@@ -81,3 +81,9 @@ config MV64361
 config DINO
     bool
     select PCI
+
+config GT64120
+    bool
+    select PCI
+    select EMPTY_SLOT
+    select I8259
diff --git a/hw/mips/gt64xxx_pci.c b/hw/pci-host/gt64120.c
similarity index 100%
rename from hw/mips/gt64xxx_pci.c
rename to hw/pci-host/gt64120.c
diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
index e832babc9d..9a813d552e 100644
--- a/hw/pci-host/meson.build
+++ b/hw/pci-host/meson.build
@@ -1,6 +1,7 @@
 pci_ss = ss.source_set()
 pci_ss.add(when: 'CONFIG_PAM', if_true: files('pam.c'))
 pci_ss.add(when: 'CONFIG_PCI_BONITO', if_true: files('bonito.c'))
+pci_ss.add(when: 'CONFIG_GT64120', if_true: files('gt64120.c'))
 pci_ss.add(when: 'CONFIG_PCI_EXPRESS_DESIGNWARE', if_true: files('designware.c'))
 pci_ss.add(when: 'CONFIG_PCI_EXPRESS_GENERIC_BRIDGE', if_true: files('gpex.c'))
 pci_ss.add(when: ['CONFIG_PCI_EXPRESS_GENERIC_BRIDGE', 'CONFIG_ACPI'], if_true: files('gpex-acpi.c'))
diff --git a/hw/pci-host/trace-events b/hw/pci-host/trace-events
index 437e66ff50..9d216bb89f 100644
--- a/hw/pci-host/trace-events
+++ b/hw/pci-host/trace-events
@@ -6,6 +6,13 @@ bonito_spciconf_small_access(uint64_t addr, unsigned size) "PCI config address i
 # grackle.c
 grackle_set_irq(int irq_num, int level) "set_irq num %d level %d"
 
+# gt64120.c
+gt64120_read(uint64_t addr, uint64_t value) "gt64120 read 0x%03"PRIx64" value:0x%08" PRIx64
+gt64120_write(uint64_t addr, uint64_t value) "gt64120 write 0x%03"PRIx64" value:0x%08" PRIx64
+gt64120_read_intreg(const char *regname, unsigned size, uint64_t value) "gt64120 read %s size:%u value:0x%08" PRIx64
+gt64120_write_intreg(const char *regname, unsigned size, uint64_t value) "gt64120 write %s size:%u value:0x%08" PRIx64
+gt64120_isd_remap(uint64_t from_length, uint64_t from_addr, uint64_t to_length, uint64_t to_addr) "ISD: 0x%08" PRIx64 "@0x%08" PRIx64 " -> 0x%08" PRIx64 "@0x%08" PRIx64
+
 # mv64361.c
 mv64361_region_map(const char *name, uint64_t poffs, uint64_t size, uint64_t moffs) "Mapping %s 0x%"PRIx64"+0x%"PRIx64" @ 0x%"PRIx64
 mv64361_region_enable(const char *op, int num) "Should %s region %d"
diff --git a/meson.build b/meson.build
index 5c6b5a1c75..bd5774f32f 100644
--- a/meson.build
+++ b/meson.build
@@ -2944,7 +2944,6 @@ if have_system
     'hw/intc',
     'hw/isa',
     'hw/mem',
-    'hw/mips',
     'hw/misc',
     'hw/misc/macio',
     'hw/net',
-- 
2.38.1


