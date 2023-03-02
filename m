Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8A26A816C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:43:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhJh-00046Z-8Y; Thu, 02 Mar 2023 06:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1pXhJe-00044O-Ie; Thu, 02 Mar 2023 06:41:42 -0500
Received: from m12.mail.163.com ([123.126.96.234])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1pXhJZ-0006AA-6S; Thu, 02 Mar 2023 06:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=f9kMM
 +dxEpew9cx4pL3nax+OxmxeKeCN7PZ/tpvgjE8=; b=PlcImAcHHsx/ESTo7xBWI
 mOnlgH3ov9KNmOpd+Y4OLtj+PE/CCkIQXXeTlMtIly80XeSZ/FM7NOABKI1n/KHT
 Gws6NuKZQQsWWjejdC0kAsxkTSIt1qKUISCDXrTu7NEHVBcssJ4b/GA8fLMOfU6a
 BQv0a1piR9L1LsfaaAtZb0=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [144.123.156.254])
 by smtp20 (Coremail) with SMTP id H91pCgBni79OiwBknjVaGA--.63318S9;
 Thu, 02 Mar 2023 19:41:07 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [RFC PATCH v1 07/12] hw: arm: allwinner-r40: Add 5 TWI controllers
Date: Thu,  2 Mar 2023 19:40:56 +0800
Message-Id: <20230302114102.32236-8-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230302114102.32236-1-qianfanguijin@163.com>
References: <20230302114102.32236-1-qianfanguijin@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: H91pCgBni79OiwBknjVaGA--.63318S9
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jr4kWF17Wry3KFWkKr47XFb_yoW7ZF48pF
 W7C390grW0gw1rAr4kKws3XrySy348Gr17K3WS9FWftr10gr4kXry2va1UCF15Krs7Way3
 XrZ5JFWxG3W7taDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRT5lbUUUUU=
X-Originating-IP: [144.123.156.254]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiGhMm7VaEEb8QVwAAs5
Received-SPF: pass client-ip=123.126.96.234;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: qianfan Zhao <qianfanguijin@163.com>

TWI(i2c) is designed to be used as an interface between CPU host and the
serial 2-Wire bus. It can support all standard 2-Wire transfer, can be
operated in standard mode(100kbit/s) or fast-mode, supporting data rate
up to 400kbit/s.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 hw/arm/allwinner-r40.c         | 47 ++++++++++++++++++++++++++++++----
 include/hw/arm/allwinner-r40.h | 11 ++++++++
 2 files changed, 53 insertions(+), 5 deletions(-)

diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
index 2fb1bd8805..694453d1e5 100644
--- a/hw/arm/allwinner-r40.c
+++ b/hw/arm/allwinner-r40.c
@@ -52,6 +52,11 @@ const hwaddr allwinner_r40_memmap[] = {
     [AW_R40_DEV_UART5]      = 0x01c29400,
     [AW_R40_DEV_UART6]      = 0x01c29800,
     [AW_R40_DEV_UART7]      = 0x01c29c00,
+    [AW_R40_DEV_TWI0]       = 0x01c2ac00,
+    [AW_R40_DEV_TWI1]       = 0x01c2b000,
+    [AW_R40_DEV_TWI2]       = 0x01c2b400,
+    [AW_R40_DEV_TWI3]       = 0x01c2b800,
+    [AW_R40_DEV_TWI4]       = 0x01c2c000,
     [AW_R40_DEV_GIC_DIST]   = 0x01c81000,
     [AW_R40_DEV_GIC_CPU]    = 0x01c82000,
     [AW_R40_DEV_GIC_HYP]    = 0x01c84000,
@@ -115,11 +120,6 @@ static struct AwR40Unimplemented r40_unimplemented[] = {
     { "uart7",      0x01c29c00, 1 * KiB },
     { "ps20",       0x01c2a000, 1 * KiB },
     { "ps21",       0x01c2a400, 1 * KiB },
-    { "twi0",       0x01c2ac00, 1 * KiB },
-    { "twi1",       0x01c2b000, 1 * KiB },
-    { "twi2",       0x01c2b400, 1 * KiB },
-    { "twi3",       0x01c2b800, 1 * KiB },
-    { "twi4",       0x01c2c000, 1 * KiB },
     { "scr",        0x01c2c400, 1 * KiB },
     { "tvd-top",    0x01c30000, 4 * KiB },
     { "tvd0",       0x01c31000, 4 * KiB },
@@ -166,6 +166,9 @@ enum {
     AW_R40_GIC_SPI_UART1     =  2,
     AW_R40_GIC_SPI_UART2     =  3,
     AW_R40_GIC_SPI_UART3     =  4,
+    AW_R40_GIC_SPI_TWI0      =  7,
+    AW_R40_GIC_SPI_TWI1      =  8,
+    AW_R40_GIC_SPI_TWI2      =  9,
     AW_R40_GIC_SPI_UART4     = 17,
     AW_R40_GIC_SPI_UART5     = 18,
     AW_R40_GIC_SPI_UART6     = 19,
@@ -176,6 +179,8 @@ enum {
     AW_R40_GIC_SPI_MMC1      = 33,
     AW_R40_GIC_SPI_MMC2      = 34,
     AW_R40_GIC_SPI_MMC3      = 35,
+    AW_R40_GIC_SPI_TWI3      = 88,
+    AW_R40_GIC_SPI_TWI4      = 89,
 };
 
 /* Allwinner R40 general constants */
@@ -261,6 +266,12 @@ static void allwinner_r40_init(Object *obj)
     object_initialize_child(obj, "mmc1", &s->mmc1, TYPE_AW_SDHOST_SUN5I);
     object_initialize_child(obj, "mmc2", &s->mmc2, TYPE_AW_SDHOST_SUN5I);
     object_initialize_child(obj, "mmc3", &s->mmc3, TYPE_AW_SDHOST_SUN5I);
+
+    object_initialize_child(obj, "twi0", &s->i2c0, TYPE_AW_I2C_SUN6I);
+    object_initialize_child(obj, "twi1", &s->i2c1, TYPE_AW_I2C_SUN6I);
+    object_initialize_child(obj, "twi2", &s->i2c2, TYPE_AW_I2C_SUN6I);
+    object_initialize_child(obj, "twi3", &s->i2c3, TYPE_AW_I2C_SUN6I);
+    object_initialize_child(obj, "twi4", &s->i2c4, TYPE_AW_I2C_SUN6I);
 }
 
 static void allwinner_r40_realize(DeviceState *dev, Error **errp)
@@ -428,6 +439,32 @@ static void allwinner_r40_realize(DeviceState *dev, Error **errp)
                    qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_UART7),
                    115200, serial_hd(7), DEVICE_NATIVE_ENDIAN);
 
+    /* I2C */
+    sysbus_realize(SYS_BUS_DEVICE(&s->i2c0), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c0), 0, s->memmap[AW_R40_DEV_TWI0]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c0), 0,
+                       qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_TWI0));
+
+    sysbus_realize(SYS_BUS_DEVICE(&s->i2c1), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c1), 0, s->memmap[AW_R40_DEV_TWI1]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c1), 0,
+                       qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_TWI1));
+
+    sysbus_realize(SYS_BUS_DEVICE(&s->i2c2), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c2), 0, s->memmap[AW_R40_DEV_TWI2]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c2), 0,
+                       qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_TWI2));
+
+    sysbus_realize(SYS_BUS_DEVICE(&s->i2c3), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c3), 0, s->memmap[AW_R40_DEV_TWI3]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c3), 0,
+                       qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_TWI3));
+
+    sysbus_realize(SYS_BUS_DEVICE(&s->i2c4), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c4), 0, s->memmap[AW_R40_DEV_TWI4]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c4), 0,
+                       qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_TWI4));
+
     /* Unimplemented devices */
     for (i = 0; i < ARRAY_SIZE(r40_unimplemented); i++) {
         create_unimplemented_device(r40_unimplemented[i].device_name,
diff --git a/include/hw/arm/allwinner-r40.h b/include/hw/arm/allwinner-r40.h
index dfb5eb609c..6a7e5c1e31 100644
--- a/include/hw/arm/allwinner-r40.h
+++ b/include/hw/arm/allwinner-r40.h
@@ -26,6 +26,7 @@
 #include "hw/intc/arm_gic.h"
 #include "hw/sd/allwinner-sdhost.h"
 #include "hw/misc/allwinner-r40-ccu.h"
+#include "hw/i2c/allwinner-i2c.h"
 #include "target/arm/cpu.h"
 #include "sysemu/block-backend.h"
 
@@ -48,6 +49,11 @@ enum {
     AW_R40_DEV_UART5,
     AW_R40_DEV_UART6,
     AW_R40_DEV_UART7,
+    AW_R40_DEV_TWI0,
+    AW_R40_DEV_TWI1,
+    AW_R40_DEV_TWI2,
+    AW_R40_DEV_TWI3,
+    AW_R40_DEV_TWI4,
     AW_R40_DEV_GIC_DIST,
     AW_R40_DEV_GIC_CPU,
     AW_R40_DEV_GIC_HYP,
@@ -89,6 +95,11 @@ struct AwR40State {
     AwSdHostState mmc2;
     AwSdHostState mmc3;
     AwR40ClockCtlState ccu;
+    AWI2CState i2c0;
+    AWI2CState i2c1;
+    AWI2CState i2c2;
+    AWI2CState i2c3;
+    AWI2CState i2c4;
     GICState gic;
     MemoryRegion sram_a1;
     MemoryRegion sram_a2;
-- 
2.25.1


