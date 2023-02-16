Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F827699AFE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:15:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnO-0008OH-0F; Thu, 16 Feb 2023 12:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnL-0008G7-5A
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:43 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnJ-0007qT-8d
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:42 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 s13-20020a05600c45cd00b003ddca7a2bcbso2223344wmo.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=t6RogNGnHVwECUgVRR3m/S1TrD+wfwboOkLyFF8ozOQ=;
 b=dnkvRgHjfqxgAsJTVdIifiKEnbysFhW0aDkGG2SLhFArRryPzvt+v9bOt74+OM7o2+
 289hShX5+4grajsjQRYc/IISG59Q8Rad2stDp+TAgLEmlHHELnI3BcxvTiK40s42/nQh
 eD2SPt8n/i1hqjFrSGIh95S3BlLtJk0agAUHLmxKSpeoDoPuUI7ZiR+PWa5k6RBkhkDM
 BT1PNnk6NNKdgqLtIOodYuGMpaTZGkEd/fTz+IjKFim+KCIv0IbSRceP6d+jVKL88eMl
 m+hCW7azIxjHWFz3ahucyg/5+H23iNeOJjwqtb46fHarnoOONTJW+rI4kBqw2kB6f0TI
 rKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t6RogNGnHVwECUgVRR3m/S1TrD+wfwboOkLyFF8ozOQ=;
 b=0O9TRMoC7BuRqVINU0vl4tzGhlYTTijVJR0CiUMhj2GB/+OkrUkjRK9IQvPoneTbQS
 V8N/1xQwb3KTfiVz1kWtMTrQJqSUZUz7F6U1ZXvL46rwhosi+jPxQeg0t8fhozO8Hehy
 H7HGK0Tb65itTu5uQReo2wt+Ordsa42G70Us8xyLOJBhTihGoK2ht39WcPozhPdiknzQ
 s7xULpXBdt5WBgljZ63Qr8PGLq9bWrfwevhsFS/meiBjDBLVFaLfEoURmikuyneHT4Cl
 aJs9fP1ZrheabXBmpXON5Xehk3mpSRwyA3ZMzVpYJ7vkDpyxLZTWryziMhV/qES+QnC9
 tzqA==
X-Gm-Message-State: AO0yUKXc1SjP3/0eowv1DD67eFmoRMMuNc8rar+4Axf62Ff5IfDg4P3h
 b7XQt/9SOUa1SX2JnKLCC2/b+9xfLYVMhsyc
X-Google-Smtp-Source: AK7set+8D86dQFE6rl9CCLKsO6kI/fWmvbVDh7nGCzQkDDebpbKdhicb60YTNYuvlmJ5G1JD9UDgZQ==
X-Received: by 2002:a05:600c:5124:b0:3e2:1a5e:b150 with SMTP id
 o36-20020a05600c512400b003e21a5eb150mr1098850wms.2.1676567500539; 
 Thu, 16 Feb 2023 09:11:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/30] hw/arm: Attach PSPI module to NPCM7XX SoC
Date: Thu, 16 Feb 2023 17:11:11 +0000
Message-Id: <20230216171123.2518285-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

From: Hao Wu <wuhaotsh@google.com>

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Philippe Mathieu-Daude <philmd@linaro.org>
Message-id: 20230208235433.3989937-4-wuhaotsh@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/nuvoton.rst |  2 +-
 include/hw/arm/npcm7xx.h    |  2 ++
 hw/arm/npcm7xx.c            | 25 +++++++++++++++++++++++--
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index c38df32bde0..0424cae4b01 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -49,6 +49,7 @@ Supported devices
  * SMBus controller (SMBF)
  * Ethernet controller (EMC)
  * Tachometer
+ * Peripheral SPI controller (PSPI)
 
 Missing devices
 ---------------
@@ -64,7 +65,6 @@ Missing devices
 
  * Ethernet controller (GMAC)
  * USB device (USBD)
- * Peripheral SPI controller (PSPI)
  * SD/MMC host
  * PECI interface
  * PCI and PCIe root complex and bridges
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index f1b7e4a48d3..72c77220964 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -32,6 +32,7 @@
 #include "hw/nvram/npcm7xx_otp.h"
 #include "hw/timer/npcm7xx_timer.h"
 #include "hw/ssi/npcm7xx_fiu.h"
+#include "hw/ssi/npcm_pspi.h"
 #include "hw/usb/hcd-ehci.h"
 #include "hw/usb/hcd-ohci.h"
 #include "target/arm/cpu.h"
@@ -104,6 +105,7 @@ struct NPCM7xxState {
     NPCM7xxFIUState     fiu[2];
     NPCM7xxEMCState     emc[2];
     NPCM7xxSDHCIState   mmc;
+    NPCMPSPIState       pspi[2];
 };
 
 #define TYPE_NPCM7XX    "npcm7xx"
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index d85cc027651..15ff21d0472 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -86,6 +86,8 @@ enum NPCM7xxInterrupt {
     NPCM7XX_EMC1RX_IRQ          = 15,
     NPCM7XX_EMC1TX_IRQ,
     NPCM7XX_MMC_IRQ             = 26,
+    NPCM7XX_PSPI2_IRQ           = 28,
+    NPCM7XX_PSPI1_IRQ           = 31,
     NPCM7XX_TIMER0_IRQ          = 32,   /* Timer Module 0 */
     NPCM7XX_TIMER1_IRQ,
     NPCM7XX_TIMER2_IRQ,
@@ -220,6 +222,12 @@ static const hwaddr npcm7xx_emc_addr[] = {
     0xf0826000,
 };
 
+/* Register base address for each PSPI Module */
+static const hwaddr npcm7xx_pspi_addr[] = {
+    0xf0200000,
+    0xf0201000,
+};
+
 static const struct {
     hwaddr regs_addr;
     uint32_t unconnected_pins;
@@ -444,6 +452,10 @@ static void npcm7xx_init(Object *obj)
         object_initialize_child(obj, "emc[*]", &s->emc[i], TYPE_NPCM7XX_EMC);
     }
 
+    for (i = 0; i < ARRAY_SIZE(s->pspi); i++) {
+        object_initialize_child(obj, "pspi[*]", &s->pspi[i], TYPE_NPCM_PSPI);
+    }
+
     object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
 }
 
@@ -715,6 +727,17 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->mmc), 0,
             npcm7xx_irq(s, NPCM7XX_MMC_IRQ));
 
+    /* PSPI */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_pspi_addr) != ARRAY_SIZE(s->pspi));
+    for (i = 0; i < ARRAY_SIZE(s->pspi); i++) {
+        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->pspi[i]);
+        int irq = (i == 0) ? NPCM7XX_PSPI1_IRQ : NPCM7XX_PSPI2_IRQ;
+
+        sysbus_realize(sbd, &error_abort);
+        sysbus_mmio_map(sbd, 0, npcm7xx_pspi_addr[i]);
+        sysbus_connect_irq(sbd, 0, npcm7xx_irq(s, irq));
+    }
+
     create_unimplemented_device("npcm7xx.shm",          0xc0001000,   4 * KiB);
     create_unimplemented_device("npcm7xx.vdmx",         0xe0800000,   4 * KiB);
     create_unimplemented_device("npcm7xx.pcierc",       0xe1000000,  64 * KiB);
@@ -724,8 +747,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.peci",         0xf0100000,   4 * KiB);
     create_unimplemented_device("npcm7xx.siox[1]",      0xf0101000,   4 * KiB);
     create_unimplemented_device("npcm7xx.siox[2]",      0xf0102000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.pspi1",        0xf0200000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.pspi2",        0xf0201000,   4 * KiB);
     create_unimplemented_device("npcm7xx.ahbpci",       0xf0400000,   1 * MiB);
     create_unimplemented_device("npcm7xx.mcphy",        0xf05f0000,  64 * KiB);
     create_unimplemented_device("npcm7xx.gmac1",        0xf0802000,   8 * KiB);
-- 
2.34.1


