Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C327B34724B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 08:21:53 +0100 (CET)
Received: from localhost ([::1]:53280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOxpw-0005pg-NI
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 03:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lOxeq-0002Kl-K0; Wed, 24 Mar 2021 03:10:24 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:37494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lOxen-0008Rs-PD; Wed, 24 Mar 2021 03:10:24 -0400
Received: by mail-pf1-x432.google.com with SMTP id c204so16664072pfc.4;
 Wed, 24 Mar 2021 00:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HDSFn4bKerXCB9fvr54a1qP4KtwmAp4Jsq0C9zzwwGM=;
 b=DEyO8IzAf4bOVfBNRmgN3Kalor0t0gFh1wRO9VaN+5yyNsmDXcOMGgo8FgfRJExTXC
 +2ZV2jEUSfI3H5iYAPhrzI0Ohcr+1mTtGM7gTHxq6gbCnqOgdsdX5OQd2jOqbNCglPdI
 WqfzarkawdUfLyuLc6Zz/rPF7P1pNBxUd4gHEqJ+/3K+Uri392v2z4ZF0R8j/aG7zfaa
 zb+YZGLeWACHj2CvCVxnq8oRtRWQEzzj7N7pH6LrgUGgOrmOI3wWDbqgrjFvgA/DsulY
 fgw7TXLyUHWoTRNb92BDrrtGfg1KQ9MAWoVKKSG5gbTh0ZNc7aP3KvY46CBYhAj1KfCL
 /AXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HDSFn4bKerXCB9fvr54a1qP4KtwmAp4Jsq0C9zzwwGM=;
 b=kVA3O697AJGZXbMPv81sAkkh3t9LkqwxZMu9/To7BvUujDFTxm0p22aP2mo+osu0gf
 BKdNU0ccOSubdeHfv1jT67h4uwNjCH5hriLBFcRXrrt+/1p7bjmD0DzpKXCdeESSPdfK
 AWaEJUsGM1G9coaWpXbOSPo2fLDCAq/Qe2xuIEHX3x5uJgB8OZ9Zigc3/PyYkedHF/IU
 khw+ru1TZDBxPnH8nJfV4XaLCy6d+uYfhYMSPGxBxhbU4Awv4Iiohu+tmmZYnPMuerQ5
 qE2aIRQjru8/3CahLvcXPC0qGtsFX6hqEEuX3m2IlOjUjgbyRJ3mFEuL3bGmiuQEBHiP
 /7xg==
X-Gm-Message-State: AOAM531aDCtoNWyg3nPdJIFTIBrfxmyHrgbH9fShhgjzTcFrnggQ9y4B
 833CoKaTbWBuSpRsW2Ni/w4=
X-Google-Smtp-Source: ABdhPJxlqyDDXKqoB+E4GyHpx5gdRAOhnKBMwPOSIHLgUzFlORzlMbhvwl52uVKS8XG8FXfIlR+Y6w==
X-Received: by 2002:aa7:9852:0:b029:211:6824:6c7d with SMTP id
 n18-20020aa798520000b029021168246c7dmr1949033pfq.19.1616569819987; 
 Wed, 24 Mar 2021 00:10:19 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id y22sm1297116pfn.32.2021.03.24.00.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 00:10:19 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 2/3] aspeed: Integrate HACE
Date: Wed, 24 Mar 2021 17:39:54 +1030
Message-Id: <20210324070955.125941-3-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324070955.125941-1-joel@jms.id.au>
References: <20210324070955.125941-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the hash and crypto engine model to the Aspeed socs.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3: Rebase on upstream
v4: Update integration for soc-specific hace objects
---
 docs/system/arm/aspeed.rst  |  2 +-
 include/hw/arm/aspeed_soc.h |  3 +++
 hw/arm/aspeed_ast2600.c     | 15 +++++++++++++++
 hw/arm/aspeed_soc.c         | 16 ++++++++++++++++
 4 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index d1fb8f25b39c..f9466e6d8245 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -49,6 +49,7 @@ Supported devices
  * Ethernet controllers
  * Front LEDs (PCA9552 on I2C bus)
  * LPC Peripheral Controller (a subset of subdevices are supported)
+ * Hash/Crypto Engine (HACE) - Hash support only, no scatter-gather
 
 
 Missing devices
@@ -59,7 +60,6 @@ Missing devices
  * PWM and Fan Controller
  * Slave GPIO Controller
  * Super I/O Controller
- * Hash/Crypto Engine
  * PCI-Express 1 Controller
  * Graphic Display Controller
  * PECI Controller
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 9359d6da336d..d9161d26d645 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -21,6 +21,7 @@
 #include "hw/rtc/aspeed_rtc.h"
 #include "hw/i2c/aspeed_i2c.h"
 #include "hw/ssi/aspeed_smc.h"
+#include "hw/misc/aspeed_hace.h"
 #include "hw/watchdog/wdt_aspeed.h"
 #include "hw/net/ftgmac100.h"
 #include "target/arm/cpu.h"
@@ -50,6 +51,7 @@ struct AspeedSoCState {
     AspeedTimerCtrlState timerctrl;
     AspeedI2CState i2c;
     AspeedSCUState scu;
+    AspeedHACEState hace;
     AspeedXDMAState xdma;
     AspeedSMCState fmc;
     AspeedSMCState spi[ASPEED_SPIS_NUM];
@@ -133,6 +135,7 @@ enum {
     ASPEED_DEV_XDMA,
     ASPEED_DEV_EMMC,
     ASPEED_DEV_KCS,
+    ASPEED_DEV_HACE,
 };
 
 #endif /* ASPEED_SOC_H */
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index bc87e754a3cc..c149936e0b28 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -42,6 +42,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
     [ASPEED_DEV_ETH2]      = 0x1E680000,
     [ASPEED_DEV_ETH4]      = 0x1E690000,
     [ASPEED_DEV_VIC]       = 0x1E6C0000,
+    [ASPEED_DEV_HACE]      = 0x1E6D0000,
     [ASPEED_DEV_SDMC]      = 0x1E6E0000,
     [ASPEED_DEV_SCU]       = 0x1E6E2000,
     [ASPEED_DEV_XDMA]      = 0x1E6E7000,
@@ -102,6 +103,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
     [ASPEED_DEV_I2C]       = 110,   /* 110 -> 125 */
     [ASPEED_DEV_ETH1]      = 2,
     [ASPEED_DEV_ETH2]      = 3,
+    [ASPEED_DEV_HACE]      = 4,
     [ASPEED_DEV_ETH3]      = 32,
     [ASPEED_DEV_ETH4]      = 33,
     [ASPEED_DEV_KCS]       = 138,   /* 138 -> 142 */
@@ -213,6 +215,9 @@ static void aspeed_soc_ast2600_init(Object *obj)
                             TYPE_SYSBUS_SDHCI);
 
     object_initialize_child(obj, "lpc", &s->lpc, TYPE_ASPEED_LPC);
+
+    snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
+    object_initialize_child(obj, "hace", &s->hace, typename);
 }
 
 /*
@@ -498,6 +503,16 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_4,
                        qdev_get_gpio_in(DEVICE(&s->a7mpcore),
                                 sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_4));
+
+    /* HACE */
+    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(s->dram_mr),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
 }
 
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 057d053c8478..c8c3bd233233 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -34,6 +34,7 @@ static const hwaddr aspeed_soc_ast2400_memmap[] = {
     [ASPEED_DEV_VIC]    = 0x1E6C0000,
     [ASPEED_DEV_SDMC]   = 0x1E6E0000,
     [ASPEED_DEV_SCU]    = 0x1E6E2000,
+    [ASPEED_DEV_HACE]   = 0x1E6E3000,
     [ASPEED_DEV_XDMA]   = 0x1E6E7000,
     [ASPEED_DEV_VIDEO]  = 0x1E700000,
     [ASPEED_DEV_ADC]    = 0x1E6E9000,
@@ -65,6 +66,7 @@ static const hwaddr aspeed_soc_ast2500_memmap[] = {
     [ASPEED_DEV_VIC]    = 0x1E6C0000,
     [ASPEED_DEV_SDMC]   = 0x1E6E0000,
     [ASPEED_DEV_SCU]    = 0x1E6E2000,
+    [ASPEED_DEV_HACE]   = 0x1E6E3000,
     [ASPEED_DEV_XDMA]   = 0x1E6E7000,
     [ASPEED_DEV_ADC]    = 0x1E6E9000,
     [ASPEED_DEV_VIDEO]  = 0x1E700000,
@@ -117,6 +119,7 @@ static const int aspeed_soc_ast2400_irqmap[] = {
     [ASPEED_DEV_ETH2]   = 3,
     [ASPEED_DEV_XDMA]   = 6,
     [ASPEED_DEV_SDHCI]  = 26,
+    [ASPEED_DEV_HACE]   = 4,
 };
 
 #define aspeed_soc_ast2500_irqmap aspeed_soc_ast2400_irqmap
@@ -212,6 +215,9 @@ static void aspeed_soc_init(Object *obj)
     }
 
     object_initialize_child(obj, "lpc", &s->lpc, TYPE_ASPEED_LPC);
+
+    snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
+    object_initialize_child(obj, "hace", &s->hace, typename);
 }
 
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
@@ -425,6 +431,16 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
 
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_4,
                        qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_kcs_4));
+
+    /* HACE */
+    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(s->dram_mr),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
 }
 static Property aspeed_soc_properties[] = {
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
-- 
2.30.2


