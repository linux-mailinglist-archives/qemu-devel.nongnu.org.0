Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6913590CA
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 02:09:04 +0200 (CEST)
Received: from localhost ([::1]:45860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUehr-0003c6-JD
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 20:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lUecL-0001L6-4D; Thu, 08 Apr 2021 20:03:21 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:34460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lUecI-0005Gs-Sf; Thu, 08 Apr 2021 20:03:20 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 d5-20020a17090a2a45b029014d934553c4so3077130pjg.1; 
 Thu, 08 Apr 2021 17:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kwD/RKuZN+mlh4Ty+7pzKaHHLeb9EOYsbjJSUaaH9tA=;
 b=qwtfZOWEL0gIAcoZ8XwBkOCLbn6YJSutmM6jrsp/7J2zkITRN3LhQU+WSCdDwKp4lc
 AsTdtzz9rRO2ni36h1/mwmIc9iYWbGxMiX1c+1/SHKvpqKUHX8hHWUdOxOQ1pE/wVaiY
 nv50u/AvB7xMBf/v1Wn1W8AByhlZs6RH7ENTNhPHxH88nHTZpQtcooalLqN/UtNPxs2o
 i4sSOpupjpqovqxSbHhtXN7SfCm9LXYVUMt8IgigPA20ait1DcU2X3clLZUK88pmCXJX
 56ZkvdngUIZH2Y1/L6U/z0+NjeTxbXFOvguaTg/giwLwDxGxsWhJIGd9yPTGT1w9KOWI
 Y05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kwD/RKuZN+mlh4Ty+7pzKaHHLeb9EOYsbjJSUaaH9tA=;
 b=S4uypR6Dzv8Ak+HHLxaxuP48n3Avo6N8DnppbTMDVfTZEJvTsDIhNVtKWuUMnL+cJa
 lZMJdVP0TX5Yk8GYO4cP5ud16BUZq+U9bRFSV9Ta4mQhZujWf0lnmgycmAwSdcdW7lBa
 9FbjsJoeRh1A+Tfi44ndIog2GiX1OVzkA6ev3T/4LalVQ0PmUvLoCVlTkMqEChtHill4
 8806t+ly8iLczA1GY2bvmr1w83yAiz+jGt0vkkOIJftcU95J5+B3Ab/gh8s2UjbwnreE
 GWVVJYxXMou4BlK1YPgP+AQmEkGsi6smjB18tN4aY/YdCcNZ4xKr4WPoPCnBQwOhhsea
 5Ucw==
X-Gm-Message-State: AOAM530vscw62k9mVSd2l1VdlkW038a7X7QaUNisPeppVVylG9Gwqw41
 HBAnkJhcFRZB07d1LSX144U=
X-Google-Smtp-Source: ABdhPJxd/5zKkNOnhD+SN2mT5gyUg193nx7+SJnimH9t1tKLE4q+HV+tcQWAfLfsdRnUHJ85OeIl4A==
X-Received: by 2002:a17:90b:1904:: with SMTP id
 mp4mr5706065pjb.193.1617926597188; 
 Thu, 08 Apr 2021 17:03:17 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id f17sm393406pfk.184.2021.04.08.17.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 17:03:16 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v5 2/3] aspeed: Integrate HACE
Date: Fri,  9 Apr 2021 09:32:52 +0930
Message-Id: <20210409000253.1475587-3-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210409000253.1475587-1-joel@jms.id.au>
References: <20210409000253.1475587-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the hash and crypto engine model to the Aspeed socs.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 docs/system/arm/aspeed.rst  |  1 -
 include/hw/arm/aspeed_soc.h |  3 +++
 hw/arm/aspeed_ast2600.c     | 15 +++++++++++++++
 hw/arm/aspeed_soc.c         | 16 ++++++++++++++++
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 23a1468cd175..a1911f940316 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -60,7 +60,6 @@ Missing devices
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
index 2a1255b6a042..e0fbb020c770 100644
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
@@ -494,6 +499,16 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
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
index 817f3ba63dfd..8ed29113f79f 100644
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
@@ -421,6 +427,16 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
 
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


