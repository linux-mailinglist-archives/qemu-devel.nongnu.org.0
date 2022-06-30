Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88761561941
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 13:32:34 +0200 (CEST)
Received: from localhost ([::1]:57224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6sPR-0001HD-Iu
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 07:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHz-0007ww-NS; Thu, 30 Jun 2022 07:24:51 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:39119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHw-00025Y-Ht; Thu, 30 Jun 2022 07:24:51 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbb10hlmz4xYY;
 Thu, 30 Jun 2022 21:24:45 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbZz0N7Kz4xD5;
 Thu, 30 Jun 2022 21:24:42 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 10/27] aspeed: Remove usage of sysbus_mmio_map
Date: Thu, 30 Jun 2022 13:23:54 +0200
Message-Id: <20220630112411.1474431-11-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220630112411.1474431-1-clg@kaod.org>
References: <20220630112411.1474431-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Delevoryas <pdel@fb.com>

sysbus_mmio_map maps devices into "get_system_memory()".

With the new SoC memory attribute, we want to make sure that each device is
mapped into the SoC memory.

In single SoC machines, the SoC memory is the same as "get_system_memory()",
but in multi SoC machines it will be different.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220624003701.1363500-4-pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  1 +
 hw/arm/aspeed_ast10x0.c     | 25 +++++++++---------
 hw/arm/aspeed_ast2600.c     | 51 ++++++++++++++++++++-----------------
 hw/arm/aspeed_soc.c         | 47 ++++++++++++++++++++--------------
 4 files changed, 69 insertions(+), 55 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index c8e903b821db..1ab328d00cc5 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -168,5 +168,6 @@ enum {
 qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
 void aspeed_soc_uart_init(AspeedSoCState *s);
 bool aspeed_soc_dram_init(AspeedSoCState *s, Error **errp);
+void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr addr);
 
 #endif /* ASPEED_SOC_H */
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index e074f80cc742..f8f321374a69 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -188,7 +188,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SCU]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SCU]);
 
     /* I2C */
 
@@ -197,7 +197,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2C]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2C]);
     for (i = 0; i < ASPEED_I2C_GET_CLASS(&s->i2c)->num_busses; i++) {
         qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->armv7m),
                                         sc->irqmap[ASPEED_DEV_I2C] + i);
@@ -209,7 +209,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LPC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LPC]);
 
     /* Connect the LPC IRQ to the GIC. It is otherwise unused. */
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 0,
@@ -243,7 +243,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->timerctrl), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timerctrl), 0,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->timerctrl), 0,
                     sc->memmap[ASPEED_DEV_TIMER1]);
     for (i = 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
         qemu_irq irq = aspeed_soc_get_irq(s, ASPEED_DEV_TIMER1 + i);
@@ -254,7 +254,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_ADC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_ADC]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
 
@@ -264,8 +264,8 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->fmc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 0, sc->memmap[ASPEED_DEV_FMC]);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 1,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->fmc), 0, sc->memmap[ASPEED_DEV_FMC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->fmc), 1,
                     ASPEED_SMC_GET_CLASS(&s->fmc)->flash_window_base);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->fmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_FMC));
@@ -277,9 +277,9 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->spi[i]), 0,
                         sc->memmap[ASPEED_DEV_SPI1 + i]);
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 1,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->spi[i]), 1,
                         ASPEED_SMC_GET_CLASS(&s->spi[i])->flash_window_base);
     }
 
@@ -287,7 +287,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sbc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV_SBC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV_SBC]);
 
     /* Watch dog */
     for (i = 0; i < sc->wdts_num; i++) {
@@ -298,7 +298,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
                         sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
     }
 
@@ -306,7 +306,8 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, sc->memmap[ASPEED_DEV_GPIO]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio), 0,
+                    sc->memmap[ASPEED_DEV_GPIO]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
 }
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index e4aa908faba6..f8c640e7fda1 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -306,7 +306,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
                             &error_abort);
 
     sysbus_realize(SYS_BUS_DEVICE(&s->a7mpcore), &error_abort);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->a7mpcore), 0, ASPEED_A7MPCORE_ADDR);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->a7mpcore), 0, ASPEED_A7MPCORE_ADDR);
 
     for (i = 0; i < sc->num_cpus; i++) {
         SysBusDevice *sbd = SYS_BUS_DEVICE(&s->a7mpcore);
@@ -340,13 +340,13 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SCU]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SCU]);
 
     /* RTC */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->rtc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->rtc), 0, sc->memmap[ASPEED_DEV_RTC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->rtc), 0, sc->memmap[ASPEED_DEV_RTC]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_RTC));
 
@@ -356,7 +356,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->timerctrl), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timerctrl), 0,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->timerctrl), 0,
                     sc->memmap[ASPEED_DEV_TIMER1]);
     for (i = 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
         qemu_irq irq = aspeed_soc_get_irq(s, ASPEED_DEV_TIMER1 + i);
@@ -367,7 +367,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_ADC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_ADC]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
 
@@ -380,7 +380,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2C]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2C]);
     for (i = 0; i < ASPEED_I2C_GET_CLASS(&s->i2c)->num_busses; i++) {
         qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore),
                                         sc->irqmap[ASPEED_DEV_I2C] + i);
@@ -394,8 +394,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->fmc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 0, sc->memmap[ASPEED_DEV_FMC]);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 1,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->fmc), 0, sc->memmap[ASPEED_DEV_FMC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->fmc), 1,
                     ASPEED_SMC_GET_CLASS(&s->fmc)->flash_window_base);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->fmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_FMC));
@@ -407,9 +407,9 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->spi[i]), 0,
                         sc->memmap[ASPEED_DEV_SPI1 + i]);
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 1,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->spi[i]), 1,
                         ASPEED_SMC_GET_CLASS(&s->spi[i])->flash_window_base);
     }
 
@@ -418,7 +418,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->ehci[i]), errp)) {
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ehci[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->ehci[i]), 0,
                         sc->memmap[ASPEED_DEV_EHCI1 + i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->ehci[i]), 0,
                            aspeed_soc_get_irq(s, ASPEED_DEV_EHCI1 + i));
@@ -428,7 +428,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sdmc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, sc->memmap[ASPEED_DEV_SDMC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sdmc), 0,
+                    sc->memmap[ASPEED_DEV_SDMC]);
 
     /* Watch dog */
     for (i = 0; i < sc->wdts_num; i++) {
@@ -439,7 +440,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
                         sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
     }
 
@@ -455,7 +456,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->ftgmac100[i]), errp)) {
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
                         sc->memmap[ASPEED_DEV_ETH1 + i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
                            aspeed_soc_get_irq(s, ASPEED_DEV_ETH1 + i));
@@ -466,7 +467,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
             return;
         }
 
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->mii[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->mii[i]), 0,
                         sc->memmap[ASPEED_DEV_MII1 + i]);
     }
 
@@ -474,7 +475,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->xdma), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->xdma), 0,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->xdma), 0,
                     sc->memmap[ASPEED_DEV_XDMA]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->xdma), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_XDMA));
@@ -483,14 +484,14 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, sc->memmap[ASPEED_DEV_GPIO]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio), 0, sc->memmap[ASPEED_DEV_GPIO]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio_1_8v), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio_1_8v), 0,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio_1_8v), 0,
                     sc->memmap[ASPEED_DEV_GPIO_1_8V]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio_1_8v), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_GPIO_1_8V));
@@ -499,7 +500,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sdhci), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdhci), 0,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sdhci), 0,
                     sc->memmap[ASPEED_DEV_SDHCI]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_SDHCI));
@@ -508,7 +509,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->emmc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->emmc), 0, sc->memmap[ASPEED_DEV_EMMC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->emmc), 0,
+                    sc->memmap[ASPEED_DEV_EMMC]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_EMMC));
 
@@ -516,7 +518,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LPC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LPC]);
 
     /* Connect the LPC IRQ to the GIC. It is otherwise unused. */
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 0,
@@ -552,7 +554,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->hace), 0,
+                    sc->memmap[ASPEED_DEV_HACE]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
 
@@ -560,7 +563,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3C]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3C]);
     for (i = 0; i < ASPEED_I3C_NR_DEVICES; i++) {
         qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore),
                                         sc->irqmap[ASPEED_DEV_I3C] + i);
@@ -572,7 +575,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sbc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV_SBC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV_SBC]);
 }
 
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 502c23dd0218..500cfda724ae 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -263,13 +263,13 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SCU]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SCU]);
 
     /* VIC */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->vic), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->vic), 0, sc->memmap[ASPEED_DEV_VIC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->vic), 0, sc->memmap[ASPEED_DEV_VIC]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 0,
                        qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 1,
@@ -279,7 +279,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->rtc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->rtc), 0, sc->memmap[ASPEED_DEV_RTC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->rtc), 0, sc->memmap[ASPEED_DEV_RTC]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_RTC));
 
@@ -289,7 +289,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->timerctrl), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timerctrl), 0,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->timerctrl), 0,
                     sc->memmap[ASPEED_DEV_TIMER1]);
     for (i = 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
         qemu_irq irq = aspeed_soc_get_irq(s, ASPEED_DEV_TIMER1 + i);
@@ -300,7 +300,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_ADC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_ADC]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
 
@@ -313,7 +313,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2C]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2C]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_I2C));
 
@@ -323,8 +323,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->fmc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 0, sc->memmap[ASPEED_DEV_FMC]);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 1,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->fmc), 0, sc->memmap[ASPEED_DEV_FMC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->fmc), 1,
                     ASPEED_SMC_GET_CLASS(&s->fmc)->flash_window_base);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->fmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_FMC));
@@ -334,9 +334,9 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->spi[i]), 0,
                         sc->memmap[ASPEED_DEV_SPI1 + i]);
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 1,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->spi[i]), 1,
                         ASPEED_SMC_GET_CLASS(&s->spi[i])->flash_window_base);
     }
 
@@ -345,7 +345,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->ehci[i]), errp)) {
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ehci[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->ehci[i]), 0,
                         sc->memmap[ASPEED_DEV_EHCI1 + i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->ehci[i]), 0,
                            aspeed_soc_get_irq(s, ASPEED_DEV_EHCI1 + i));
@@ -355,7 +355,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sdmc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, sc->memmap[ASPEED_DEV_SDMC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sdmc), 0,
+                    sc->memmap[ASPEED_DEV_SDMC]);
 
     /* Watch dog */
     for (i = 0; i < sc->wdts_num; i++) {
@@ -366,7 +367,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
                         sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
     }
 
@@ -382,7 +383,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->ftgmac100[i]), errp)) {
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
                         sc->memmap[ASPEED_DEV_ETH1 + i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
                            aspeed_soc_get_irq(s, ASPEED_DEV_ETH1 + i));
@@ -392,7 +393,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->xdma), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->xdma), 0,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->xdma), 0,
                     sc->memmap[ASPEED_DEV_XDMA]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->xdma), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_XDMA));
@@ -401,7 +402,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, sc->memmap[ASPEED_DEV_GPIO]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio), 0,
+                    sc->memmap[ASPEED_DEV_GPIO]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
 
@@ -409,7 +411,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sdhci), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdhci), 0,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sdhci), 0,
                     sc->memmap[ASPEED_DEV_SDHCI]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_SDHCI));
@@ -418,7 +420,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LPC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LPC]);
 
     /* Connect the LPC IRQ to the VIC */
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 0,
@@ -451,7 +453,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->hace), 0,
+                    sc->memmap[ASPEED_DEV_HACE]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
 }
@@ -610,3 +613,9 @@ bool aspeed_soc_dram_init(AspeedSoCState *s, Error **errp)
                       sc->memmap[ASPEED_DEV_SDRAM], &s->dram_container);
     return true;
 }
+
+void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr addr)
+{
+    memory_region_add_subregion(s->memory, addr,
+                                sysbus_mmio_get_region(dev, n));
+}
-- 
2.35.3


