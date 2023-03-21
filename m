Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFB56C2ECF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 11:27:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peZBV-0000ST-QV; Tue, 21 Mar 2023 06:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1peZBP-0000Pa-Ql; Tue, 21 Mar 2023 06:25:35 -0400
Received: from m12.mail.163.com ([220.181.12.198])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1peZBK-0008Py-Kb; Tue, 21 Mar 2023 06:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=4UQO2
 xnQll/tvgNy28RwEnPve1F8ycgnNdJM52nuoCg=; b=Dwo/uLhfF5bcoYTtKGQSu
 S9YS6rz2e5eSoviuwjwggsy7xIyxhMTPpjio20OFAFYD1O1vxtPwV700Pa+hf0hD
 cRQ14OzZOe3Sv7wjDFko3I3WrN2uyhDY9wueezQX/2lV+Fe3gIz1kTf33a3SLJQ+
 wVm3tumv48y3k9dD5Wcg+c=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.19])
 by zwqz-smtp-mta-g5-1 (Coremail) with SMTP id
 _____wBnznIHhhlk7VIWAA--.11160S11; 
 Tue, 21 Mar 2023 18:25:16 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v1 09/11] hw: arm: allwinner-r40: Add emac and gmac support
Date: Tue, 21 Mar 2023 18:25:08 +0800
Message-Id: <20230321102510.16754-10-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230321102510.16754-1-qianfanguijin@163.com>
References: <20230321102510.16754-1-qianfanguijin@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnznIHhhlk7VIWAA--.11160S11
X-Coremail-Antispam: 1Uf129KBjvJXoW3JFW5Ar48uFWUAFyxWF48Zwb_yoWxGryxpF
 43CrZ8KrWFg3WrAr4kKws3Xryftw18CrnrtF1SkF4ftF1DWr1kXr42ya1UuFy5Grs7Ga13
 WrZ3WFWSg3W7t3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEOJ5wUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiQhA57VaEEu4FNgAAsb
Received-SPF: pass client-ip=220.181.12.198;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_VALIDITY_RPBL=1.31, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

R40 has two ethernet controllers named as emac and gmac. The emac is
compatibled with A10, and the GMAC is compatibled with H3.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 hw/arm/allwinner-r40.c         | 48 ++++++++++++++++++++++++++++++++--
 hw/arm/bananapi_m2u.c          |  3 +++
 include/hw/arm/allwinner-r40.h |  6 +++++
 3 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
index 191ce8b93c..a81614c581 100644
--- a/hw/arm/allwinner-r40.c
+++ b/hw/arm/allwinner-r40.c
@@ -39,6 +39,7 @@ const hwaddr allwinner_r40_memmap[] = {
     [AW_R40_DEV_SRAM_A2]    = 0x00004000,
     [AW_R40_DEV_SRAM_A3]    = 0x00008000,
     [AW_R40_DEV_SRAM_A4]    = 0x0000b400,
+    [AW_R40_DEV_EMAC]       = 0x01c0b000,
     [AW_R40_DEV_MMC0]       = 0x01c0f000,
     [AW_R40_DEV_MMC1]       = 0x01c10000,
     [AW_R40_DEV_MMC2]       = 0x01c11000,
@@ -58,6 +59,7 @@ const hwaddr allwinner_r40_memmap[] = {
     [AW_R40_DEV_TWI2]       = 0x01c2b400,
     [AW_R40_DEV_TWI3]       = 0x01c2b800,
     [AW_R40_DEV_TWI4]       = 0x01c2c000,
+    [AW_R40_DEV_GMAC]       = 0x01c50000,
     [AW_R40_DEV_DRAMCOM]    = 0x01c62000,
     [AW_R40_DEV_DRAMCTL]    = 0x01c63000,
     [AW_R40_DEV_DRAMPHY]    = 0x01c65000,
@@ -86,7 +88,6 @@ static struct AwR40Unimplemented r40_unimplemented[] = {
     { "spi1",       0x01c06000, 4 * KiB },
     { "cs0",        0x01c09000, 4 * KiB },
     { "keymem",     0x01c0a000, 4 * KiB },
-    { "emac",       0x01c0b000, 4 * KiB },
     { "usb0-otg",   0x01c13000, 4 * KiB },
     { "usb0-host",  0x01c14000, 4 * KiB },
     { "crypto",     0x01c15000, 4 * KiB },
@@ -131,7 +132,6 @@ static struct AwR40Unimplemented r40_unimplemented[] = {
     { "tvd2",       0x01c33000, 4 * KiB },
     { "tvd3",       0x01c34000, 4 * KiB },
     { "gpu",        0x01c40000, 64 * KiB },
-    { "gmac",       0x01c50000, 64 * KiB },
     { "hstmr",      0x01c60000, 4 * KiB },
     { "tcon-top",   0x01c70000, 4 * KiB },
     { "lcd0",       0x01c71000, 4 * KiB },
@@ -182,6 +182,8 @@ enum {
     AW_R40_GIC_SPI_MMC1      = 33,
     AW_R40_GIC_SPI_MMC2      = 34,
     AW_R40_GIC_SPI_MMC3      = 35,
+    AW_R40_GIC_SPI_EMAC      = 55,
+    AW_R40_GIC_SPI_GMAC      = 85,
     AW_R40_GIC_SPI_TWI3      = 88,
     AW_R40_GIC_SPI_TWI4      = 89,
 };
@@ -277,6 +279,11 @@ static void allwinner_r40_init(Object *obj)
     object_initialize_child(obj, "twi3", &s->i2c3, TYPE_AW_I2C_SUN6I);
     object_initialize_child(obj, "twi4", &s->i2c4, TYPE_AW_I2C_SUN6I);
 
+    object_initialize_child(obj, "emac", &s->emac, TYPE_AW_EMAC);
+    object_initialize_child(obj, "gmac", &s->gmac, TYPE_AW_SUN8I_EMAC);
+    object_property_add_alias(obj, "gmac-phy-addr",
+                              OBJECT(&s->gmac), "phy-addr");
+
     object_initialize_child(obj, "dramc", &s->dramc, TYPE_AW_R40_DRAMC);
     object_property_add_alias(obj, "ram-addr", OBJECT(&s->dramc),
                              "ram-addr");
@@ -286,6 +293,7 @@ static void allwinner_r40_init(Object *obj)
 
 static void allwinner_r40_realize(DeviceState *dev, Error **errp)
 {
+    const char *r40_nic_models[] = { "gmac", "emac", NULL };
     AwR40State *s = AW_R40(dev);
     unsigned i;
 
@@ -481,6 +489,42 @@ static void allwinner_r40_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->dramc), 1, s->memmap[AW_R40_DEV_DRAMCTL]);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->dramc), 2, s->memmap[AW_R40_DEV_DRAMPHY]);
 
+    /* nic support gmac and emac */
+    for (int i = 0; i < ARRAY_SIZE(r40_nic_models) - 1; i++) {
+        NICInfo *nic = &nd_table[i];
+
+        if (!nic->used)
+            continue;
+        if (qemu_show_nic_models(nic->model, r40_nic_models))
+            exit(0);
+
+        switch (qemu_find_nic_model(nic, r40_nic_models, r40_nic_models[0])) {
+        case 0: /* gmac */
+            qdev_set_nic_properties(DEVICE(&s->gmac), nic);
+            break;
+        case 1: /* emac */
+            qdev_set_nic_properties(DEVICE(&s->emac), nic);
+            break;
+        default:
+            exit(1);
+            break;
+        }
+    }
+
+    /* GMAC */
+    object_property_set_link(OBJECT(&s->gmac), "dma-memory",
+                                     OBJECT(get_system_memory()), &error_fatal);
+    sysbus_realize(SYS_BUS_DEVICE(&s->gmac), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gmac), 0, s->memmap[AW_R40_DEV_GMAC]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->gmac), 0,
+                       qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_GMAC));
+
+    /* EMAC */
+    sysbus_realize(SYS_BUS_DEVICE(&s->emac), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->emac), 0, s->memmap[AW_R40_DEV_EMAC]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->emac), 0,
+                       qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_EMAC));
+
     /* Unimplemented devices */
     for (i = 0; i < ARRAY_SIZE(r40_unimplemented); i++) {
         create_unimplemented_device(r40_unimplemented[i].device_name,
diff --git a/hw/arm/bananapi_m2u.c b/hw/arm/bananapi_m2u.c
index d185f979c0..7207f673e2 100644
--- a/hw/arm/bananapi_m2u.c
+++ b/hw/arm/bananapi_m2u.c
@@ -86,6 +86,9 @@ static void bpim2u_init(MachineState *machine)
     object_property_set_int(OBJECT(r40), "ram-size", r40->ram_size,
                             &error_abort);
 
+    /* GMAC PHY */
+    object_property_set_uint(OBJECT(r40), "gmac-phy-addr", 1, &error_abort);
+
     /* Mark R40 object realized */
     qdev_realize(DEVICE(r40), NULL, &error_abort);
 
diff --git a/include/hw/arm/allwinner-r40.h b/include/hw/arm/allwinner-r40.h
index 6fc9691bb5..c97392d12f 100644
--- a/include/hw/arm/allwinner-r40.h
+++ b/include/hw/arm/allwinner-r40.h
@@ -28,6 +28,8 @@
 #include "hw/misc/allwinner-r40-ccu.h"
 #include "hw/misc/allwinner-r40-dramc.h"
 #include "hw/i2c/allwinner-i2c.h"
+#include "hw/net/allwinner_emac.h"
+#include "hw/net/allwinner-sun8i-emac.h"
 #include "target/arm/cpu.h"
 #include "sysemu/block-backend.h"
 
@@ -36,6 +38,7 @@ enum {
     AW_R40_DEV_SRAM_A2,
     AW_R40_DEV_SRAM_A3,
     AW_R40_DEV_SRAM_A4,
+    AW_R40_DEV_EMAC,
     AW_R40_DEV_MMC0,
     AW_R40_DEV_MMC1,
     AW_R40_DEV_MMC2,
@@ -55,6 +58,7 @@ enum {
     AW_R40_DEV_TWI2,
     AW_R40_DEV_TWI3,
     AW_R40_DEV_TWI4,
+    AW_R40_DEV_GMAC,
     AW_R40_DEV_GIC_DIST,
     AW_R40_DEV_GIC_CPU,
     AW_R40_DEV_GIC_HYP,
@@ -111,6 +115,8 @@ struct AwR40State {
     AWI2CState i2c2;
     AWI2CState i2c3;
     AWI2CState i2c4;
+    AwEmacState emac;
+    AwSun8iEmacState gmac;
     GICState gic;
     MemoryRegion sram_a1;
     MemoryRegion sram_a2;
-- 
2.25.1


