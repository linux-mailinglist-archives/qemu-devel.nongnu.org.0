Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353DC669E36
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:35:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMGX-0001q0-Gs; Fri, 13 Jan 2023 10:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMGJ-0001ho-MM
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:37 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMGF-000688-VE
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:34 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so1157901wml.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yelke7zGVGxtCJv6hIoquQumyPLK+LvkoIli13Jmif4=;
 b=fiM4eVfgp4fVpa1iB05bOXu7MABPlV9GAxGX1YfylOkjN5heP6CVwX69T8A8Q3pKyl
 tXZjVU5NrlS71U9L3hXpFkCkdu979qYEvha8XQMH2Gvg1kXJKZj6N1ow8sJKpp7qpCXf
 1sYUDUigwmzweLarl8w3yYmXCMTMAZQPnL7KHA9TArfaJMgSAeAPjFL8tbZavES1/LmZ
 9G9TvJdMenbP2VhCoalGgCIrBF9d7kQ9zxETcS4p/mu+Vh4UBBNyu1h1pNaOPiBtasEd
 7loXOfoeCjpfqc9qo3p0BUIbr6deuvSy8CRVF2XUdwwmaYVHKdvzBeg2kU3cbgmJ9+fB
 4uZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yelke7zGVGxtCJv6hIoquQumyPLK+LvkoIli13Jmif4=;
 b=1rpcQrvfv7pCJejWl90Hzwf7KqzNF9cbqKT9J/gOZtdkPbqyg0LVdrPSwivfe4BdW+
 XzbLeLYtbmPQNzArqPobGiDLdW4mYL/3S/vw6HOTlCyzJPXRFzr7mbfLqcg/8sV5tK7K
 p8sOd6DwY52ecmteVFL+FVkyQfVQu/+710NbXupJdCOFRtcbqUYn3kl+q9hW+uWh0bzQ
 rLNEKcP/eifWNSFR4tfXM75eBf+Yh6B+wJy0nvcRRyXYMXHNet1nJpk1+YDKjByrptPM
 4wp0SesnTsKqEi9nTTGKf1UDf1CiXSbMDfFintSL9g3xbHwReUXwmEnwlofOpTvPF0nU
 6SZw==
X-Gm-Message-State: AFqh2koRGRJpqKzz4B3ThV4DZ9Wz0T++MIwmu3hwQkJjlZk0BWSQWcZs
 6yLMYvY2T1ViQiARSqapuowDaKsX2N1J8zq+
X-Google-Smtp-Source: AMrXdXugMdXf8e1PmDFP5k7Ie7GnYef9LkMGNaTn6RUutLIB9ymjcwm2dJucB4S0DtGXOyGKubpeFg==
X-Received: by 2002:a05:600c:19cb:b0:3da:db4:6105 with SMTP id
 u11-20020a05600c19cb00b003da0db46105mr7565385wmq.37.1673624787474; 
 Fri, 13 Jan 2023 07:46:27 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003d2157627a8sm32286830wmq.47.2023.01.13.07.46.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:46:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 11/46] hw/mips/gt64xxx_pci: Move it to hw/pci-host/
Date: Fri, 13 Jan 2023 16:44:57 +0100
Message-Id: <20230113154532.49979-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

The GT-64120 is a north-bridge, and it is not MIPS specific.
Move it with the other north-bridge devices.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20221209151533.69516-8-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS                                   | 2 +-
 hw/mips/Kconfig                               | 6 ------
 hw/mips/meson.build                           | 1 -
 hw/mips/trace-events                          | 7 -------
 hw/pci-host/Kconfig                           | 6 ++++++
 hw/{mips/gt64xxx_pci.c => pci-host/gt64120.c} | 0
 hw/pci-host/meson.build                       | 1 +
 hw/pci-host/trace-events                      | 7 +++++++
 8 files changed, 15 insertions(+), 15 deletions(-)
 rename hw/{mips/gt64xxx_pci.c => pci-host/gt64120.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5606e5dbd2..a670fbc926 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1241,7 +1241,7 @@ S: Odd Fixes
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
index b5b882c6c2..4a4e5fe1a1 100644
--- a/hw/mips/trace-events
+++ b/hw/mips/trace-events
@@ -1,10 +1,3 @@
-# gt64xxx_pci.c
-gt64120_read(uint64_t addr, uint64_t value) "gt64120 read 0x%03"PRIx64" value:0x%08" PRIx64
-gt64120_write(uint64_t addr, uint64_t value) "gt64120 write 0x%03"PRIx64" value:0x%08" PRIx64
-gt64120_read_intreg(const char *regname, unsigned size, uint64_t value) "gt64120 read %s size:%u value:0x%08" PRIx64
-gt64120_write_intreg(const char *regname, unsigned size, uint64_t value) "gt64120 write %s size:%u value:0x%08" PRIx64
-gt64120_isd_remap(uint64_t from_length, uint64_t from_addr, uint64_t to_length, uint64_t to_addr) "ISD: 0x%08" PRIx64 "@0x%08" PRIx64 " -> 0x%08" PRIx64 "@0x%08" PRIx64
-
 # malta.c
 malta_fpga_leds(const char *text) "LEDs %s"
 malta_fpga_display(const char *text) "ASCII '%s'"
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
-- 
2.38.1


