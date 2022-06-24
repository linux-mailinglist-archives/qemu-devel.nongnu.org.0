Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B4D558C5D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 02:42:59 +0200 (CEST)
Received: from localhost ([::1]:32848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4XPW-0003mc-Sx
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 20:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4XKB-000884-KU
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 20:37:27 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:47856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4XK8-0008AI-Rm
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 20:37:27 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NK2tAg002361
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 17:37:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=vkIuvikgQrwo7fa6nz/P6mEK+vmMT4LslDo01SzFxFU=;
 b=Mq37nu+Pd9TlfCQAYWRfe8teOlCJI4a6Dutqctf7r+bI+1yT0qy57hB389KHA9v6YEBP
 cG9OUr33MNwF+GDJY4teWfSUvSFjM2421vnaDdTHXppg0uJs1wcNKGDhWYRbAcKe4DAT
 jEs9kZ8HiQsDyWQphXXdqY264W4hxkD17BY= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gv2nav1ad-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 17:37:23 -0700
Received: from twshared18443.03.prn6.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 23 Jun 2022 17:37:18 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 3400D88BA296; Thu, 23 Jun 2022 17:37:02 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <clg@kaod.org>, <peter.maydell@linaro.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v2 3/8] aspeed: Remove usage of sysbus_mmio_map
Date: Thu, 23 Jun 2022 17:36:56 -0700
Message-ID: <20220624003701.1363500-4-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624003701.1363500-1-pdel@fb.com>
References: <20220624003701.1363500-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: lXq433InbuZzQpM_5ElVljmEsX-yK_lE
X-Proofpoint-GUID: lXq433InbuZzQpM_5ElVljmEsX-yK_lE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_11,2022-06-23_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=717463a23e=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

sysbus_mmio_map maps devices into "get_system_memory()".

With the new SoC memory attribute, we want to make sure that each device =
is
mapped into the SoC memory.

In single SoC machines, the SoC memory is the same as "get_system_memory(=
)",
but in multi SoC machines it will be different.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed_ast10x0.c     | 25 +++++++++---------
 hw/arm/aspeed_ast2600.c     | 51 ++++++++++++++++++++-----------------
 hw/arm/aspeed_soc.c         | 47 ++++++++++++++++++++--------------
 include/hw/arm/aspeed_soc.h |  1 +
 4 files changed, 69 insertions(+), 55 deletions(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index e074f80cc7..f8f321374a 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -188,7 +188,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *d=
ev_soc, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SC=
U]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV=
_SCU]);
=20
     /* I2C */
=20
@@ -197,7 +197,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *d=
ev_soc, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2=
C]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV=
_I2C]);
     for (i =3D 0; i < ASPEED_I2C_GET_CLASS(&s->i2c)->num_busses; i++) {
         qemu_irq irq =3D qdev_get_gpio_in(DEVICE(&s->armv7m),
                                         sc->irqmap[ASPEED_DEV_I2C] + i);
@@ -209,7 +209,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *d=
ev_soc, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LP=
C]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV=
_LPC]);
=20
     /* Connect the LPC IRQ to the GIC. It is otherwise unused. */
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 0,
@@ -243,7 +243,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *d=
ev_soc, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->timerctrl), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timerctrl), 0,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->timerctrl), 0,
                     sc->memmap[ASPEED_DEV_TIMER1]);
     for (i =3D 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
         qemu_irq irq =3D aspeed_soc_get_irq(s, ASPEED_DEV_TIMER1 + i);
@@ -254,7 +254,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *d=
ev_soc, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_AD=
C]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV=
_ADC]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
=20
@@ -264,8 +264,8 @@ static void aspeed_soc_ast1030_realize(DeviceState *d=
ev_soc, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->fmc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 0, sc->memmap[ASPEED_DEV_FM=
C]);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 1,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->fmc), 0, sc->memmap[ASPEED_DEV=
_FMC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->fmc), 1,
                     ASPEED_SMC_GET_CLASS(&s->fmc)->flash_window_base);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->fmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_FMC));
@@ -277,9 +277,9 @@ static void aspeed_soc_ast1030_realize(DeviceState *d=
ev_soc, Error **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->spi[i]), 0,
                         sc->memmap[ASPEED_DEV_SPI1 + i]);
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 1,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->spi[i]), 1,
                         ASPEED_SMC_GET_CLASS(&s->spi[i])->flash_window_b=
ase);
     }
=20
@@ -287,7 +287,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *d=
ev_soc, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sbc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV_SB=
C]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV=
_SBC]);
=20
     /* Watch dog */
     for (i =3D 0; i < sc->wdts_num; i++) {
@@ -298,7 +298,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *d=
ev_soc, Error **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
                         sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
     }
=20
@@ -306,7 +306,8 @@ static void aspeed_soc_ast1030_realize(DeviceState *d=
ev_soc, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, sc->memmap[ASPEED_DEV_G=
PIO]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio), 0,
+                    sc->memmap[ASPEED_DEV_GPIO]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
 }
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index d8e5b607e9..477dd36042 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -310,7 +310,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
                             &error_abort);
=20
     sysbus_realize(SYS_BUS_DEVICE(&s->a7mpcore), &error_abort);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->a7mpcore), 0, ASPEED_A7MPCORE_ADD=
R);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->a7mpcore), 0, ASPEED_A7MPCORE_=
ADDR);
=20
     for (i =3D 0; i < sc->num_cpus; i++) {
         SysBusDevice *sbd =3D SYS_BUS_DEVICE(&s->a7mpcore);
@@ -344,13 +344,13 @@ static void aspeed_soc_ast2600_realize(DeviceState =
*dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SC=
U]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV=
_SCU]);
=20
     /* RTC */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->rtc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->rtc), 0, sc->memmap[ASPEED_DEV_RT=
C]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->rtc), 0, sc->memmap[ASPEED_DEV=
_RTC]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_RTC));
=20
@@ -360,7 +360,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->timerctrl), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timerctrl), 0,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->timerctrl), 0,
                     sc->memmap[ASPEED_DEV_TIMER1]);
     for (i =3D 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
         qemu_irq irq =3D aspeed_soc_get_irq(s, ASPEED_DEV_TIMER1 + i);
@@ -371,7 +371,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_AD=
C]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV=
_ADC]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
=20
@@ -384,7 +384,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2=
C]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV=
_I2C]);
     for (i =3D 0; i < ASPEED_I2C_GET_CLASS(&s->i2c)->num_busses; i++) {
         qemu_irq irq =3D qdev_get_gpio_in(DEVICE(&s->a7mpcore),
                                         sc->irqmap[ASPEED_DEV_I2C] + i);
@@ -398,8 +398,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->fmc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 0, sc->memmap[ASPEED_DEV_FM=
C]);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 1,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->fmc), 0, sc->memmap[ASPEED_DEV=
_FMC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->fmc), 1,
                     ASPEED_SMC_GET_CLASS(&s->fmc)->flash_window_base);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->fmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_FMC));
@@ -411,9 +411,9 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->spi[i]), 0,
                         sc->memmap[ASPEED_DEV_SPI1 + i]);
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 1,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->spi[i]), 1,
                         ASPEED_SMC_GET_CLASS(&s->spi[i])->flash_window_b=
ase);
     }
=20
@@ -422,7 +422,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->ehci[i]), errp)) {
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ehci[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->ehci[i]), 0,
                         sc->memmap[ASPEED_DEV_EHCI1 + i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->ehci[i]), 0,
                            aspeed_soc_get_irq(s, ASPEED_DEV_EHCI1 + i));
@@ -432,7 +432,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sdmc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, sc->memmap[ASPEED_DEV_S=
DMC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sdmc), 0,
+                    sc->memmap[ASPEED_DEV_SDMC]);
=20
     /* Watch dog */
     for (i =3D 0; i < sc->wdts_num; i++) {
@@ -443,7 +444,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
                         sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
     }
=20
@@ -454,7 +455,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->ftgmac100[i]), errp)) {
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
                         sc->memmap[ASPEED_DEV_ETH1 + i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
                            aspeed_soc_get_irq(s, ASPEED_DEV_ETH1 + i));
@@ -465,7 +466,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
             return;
         }
=20
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->mii[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->mii[i]), 0,
                         sc->memmap[ASPEED_DEV_MII1 + i]);
     }
=20
@@ -473,7 +474,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->xdma), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->xdma), 0,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->xdma), 0,
                     sc->memmap[ASPEED_DEV_XDMA]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->xdma), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_XDMA));
@@ -482,14 +483,14 @@ static void aspeed_soc_ast2600_realize(DeviceState =
*dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, sc->memmap[ASPEED_DEV_G=
PIO]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio), 0, sc->memmap[ASPEED_DE=
V_GPIO]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
=20
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio_1_8v), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio_1_8v), 0,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio_1_8v), 0,
                     sc->memmap[ASPEED_DEV_GPIO_1_8V]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio_1_8v), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_GPIO_1_8V));
@@ -498,7 +499,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sdhci), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdhci), 0,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sdhci), 0,
                     sc->memmap[ASPEED_DEV_SDHCI]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_SDHCI));
@@ -507,7 +508,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->emmc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->emmc), 0, sc->memmap[ASPEED_DEV_E=
MMC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->emmc), 0,
+                    sc->memmap[ASPEED_DEV_EMMC]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_EMMC));
=20
@@ -515,7 +517,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LP=
C]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV=
_LPC]);
=20
     /* Connect the LPC IRQ to the GIC. It is otherwise unused. */
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 0,
@@ -551,7 +553,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_H=
ACE]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->hace), 0,
+                    sc->memmap[ASPEED_DEV_HACE]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
=20
@@ -559,7 +562,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3=
C]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV=
_I3C]);
     for (i =3D 0; i < ASPEED_I3C_NR_DEVICES; i++) {
         qemu_irq irq =3D qdev_get_gpio_in(DEVICE(&s->a7mpcore),
                                         sc->irqmap[ASPEED_DEV_I3C] + i);
@@ -571,7 +574,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sbc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV_SB=
C]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV=
_SBC]);
 }
=20
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 3b531519e9..46cbc63644 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -268,13 +268,13 @@ static void aspeed_soc_realize(DeviceState *dev, Er=
ror **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SC=
U]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV=
_SCU]);
=20
     /* VIC */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->vic), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->vic), 0, sc->memmap[ASPEED_DEV_VI=
C]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->vic), 0, sc->memmap[ASPEED_DEV=
_VIC]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 0,
                        qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 1,
@@ -284,7 +284,7 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->rtc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->rtc), 0, sc->memmap[ASPEED_DEV_RT=
C]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->rtc), 0, sc->memmap[ASPEED_DEV=
_RTC]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_RTC));
=20
@@ -294,7 +294,7 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->timerctrl), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timerctrl), 0,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->timerctrl), 0,
                     sc->memmap[ASPEED_DEV_TIMER1]);
     for (i =3D 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
         qemu_irq irq =3D aspeed_soc_get_irq(s, ASPEED_DEV_TIMER1 + i);
@@ -305,7 +305,7 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_AD=
C]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV=
_ADC]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
=20
@@ -318,7 +318,7 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2=
C]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV=
_I2C]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_I2C));
=20
@@ -328,8 +328,8 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->fmc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 0, sc->memmap[ASPEED_DEV_FM=
C]);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 1,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->fmc), 0, sc->memmap[ASPEED_DEV=
_FMC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->fmc), 1,
                     ASPEED_SMC_GET_CLASS(&s->fmc)->flash_window_base);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->fmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_FMC));
@@ -339,9 +339,9 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->spi[i]), 0,
                         sc->memmap[ASPEED_DEV_SPI1 + i]);
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 1,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->spi[i]), 1,
                         ASPEED_SMC_GET_CLASS(&s->spi[i])->flash_window_b=
ase);
     }
=20
@@ -350,7 +350,7 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->ehci[i]), errp)) {
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ehci[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->ehci[i]), 0,
                         sc->memmap[ASPEED_DEV_EHCI1 + i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->ehci[i]), 0,
                            aspeed_soc_get_irq(s, ASPEED_DEV_EHCI1 + i));
@@ -360,7 +360,8 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sdmc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, sc->memmap[ASPEED_DEV_S=
DMC]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sdmc), 0,
+                    sc->memmap[ASPEED_DEV_SDMC]);
=20
     /* Watch dog */
     for (i =3D 0; i < sc->wdts_num; i++) {
@@ -371,7 +372,7 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
                         sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
     }
=20
@@ -382,7 +383,7 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->ftgmac100[i]), errp)) {
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
                         sc->memmap[ASPEED_DEV_ETH1 + i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
                            aspeed_soc_get_irq(s, ASPEED_DEV_ETH1 + i));
@@ -392,7 +393,7 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->xdma), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->xdma), 0,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->xdma), 0,
                     sc->memmap[ASPEED_DEV_XDMA]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->xdma), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_XDMA));
@@ -401,7 +402,8 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, sc->memmap[ASPEED_DEV_G=
PIO]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio), 0,
+                    sc->memmap[ASPEED_DEV_GPIO]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
=20
@@ -409,7 +411,7 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sdhci), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdhci), 0,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sdhci), 0,
                     sc->memmap[ASPEED_DEV_SDHCI]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_SDHCI));
@@ -418,7 +420,7 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LP=
C]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV=
_LPC]);
=20
     /* Connect the LPC IRQ to the VIC */
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 0,
@@ -451,7 +453,8 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_H=
ACE]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->hace), 0,
+                    sc->memmap[ASPEED_DEV_HACE]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
 }
@@ -602,3 +605,9 @@ bool aspeed_soc_dram_init(AspeedSoCState *s, Error **=
errp)
                                 &s->dram_container);
     return true;
 }
+
+void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr=
 addr)
+{
+    memory_region_add_subregion(s->memory, addr,
+                                sysbus_mmio_get_region(dev, n));
+}
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index c8e903b821..1ab328d00c 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -168,5 +168,6 @@ enum {
 qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
 void aspeed_soc_uart_init(AspeedSoCState *s);
 bool aspeed_soc_dram_init(AspeedSoCState *s, Error **errp);
+void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr=
 addr);
=20
 #endif /* ASPEED_SOC_H */
--=20
2.30.2


