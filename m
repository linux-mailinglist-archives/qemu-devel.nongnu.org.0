Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85BC597330
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 17:42:20 +0200 (CEST)
Received: from localhost ([::1]:51606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLBT-0006bz-Uu
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 11:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKes-0004k8-As; Wed, 17 Aug 2022 11:08:40 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:43917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKeq-0002yY-Bv; Wed, 17 Aug 2022 11:08:38 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DAD0B746396;
 Wed, 17 Aug 2022 17:08:34 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A58A674638A; Wed, 17 Aug 2022 17:08:34 +0200 (CEST)
Message-Id: <ac5f010f4eb3ade061c65bc39a049f231f75574a.1660746880.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660746880.git.balaton@eik.bme.hu>
References: <cover.1660746880.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 16/31] ppc/ppc405: Use an embedded PPCUIC model in SoC state
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Aug 2022 17:08:34 +0200 (CEST)
X-Spam-Probability: 10%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Cédric Le Goater <clg@kaod.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
[balaton: Simplify sysbus device casts for readability]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc405.h    |  3 ++-
 hw/ppc/ppc405_uc.c | 28 ++++++++++++++--------------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 343a84c98e..67f4c14f50 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -27,6 +27,7 @@
 
 #include "qom/object.h"
 #include "hw/ppc/ppc4xx.h"
+#include "hw/intc/ppc-uic.h"
 
 #define PPC405EP_SDRAM_BASE 0x00000000
 #define PPC405EP_NVRAM_BASE 0xF0000000
@@ -208,7 +209,7 @@ struct Ppc405SoCState {
     hwaddr ram_size;
 
     PowerPCCPU cpu;
-    DeviceState *uic;
+    PPCUIC uic;
     Ppc405CpcState cpc;
     Ppc405GptState gpt;
     Ppc405OcmState ocm;
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index e817f00ad1..8412c11dd5 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1080,6 +1080,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "cpu", &s->cpu,
                             POWERPC_CPU_TYPE_NAME("405ep"));
 
+    object_initialize_child(obj, "uic", &s->uic, TYPE_PPC_UIC);
+
     object_initialize_child(obj, "cpc", &s->cpc, TYPE_PPC405_CPC);
     object_property_add_alias(obj, "sys-clk", OBJECT(&s->cpc), "sys-clk");
 
@@ -1147,17 +1149,15 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(sbd, 0, 0xef600600);
 
     /* Universal interrupt controller */
-    s->uic = qdev_new(TYPE_PPC_UIC);
-
-    object_property_set_link(OBJECT(s->uic), "cpu", OBJECT(&s->cpu),
+    object_property_set_link(OBJECT(&s->uic), "cpu", OBJECT(&s->cpu),
                              &error_fatal);
-    if (!sysbus_realize(SYS_BUS_DEVICE(s->uic), errp)) {
+    sbd = SYS_BUS_DEVICE(&s->uic);
+    if (!sysbus_realize(sbd, errp)) {
         return;
     }
-
-    sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_INT,
+    sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
                        qdev_get_gpio_in(DEVICE(&s->cpu), PPC40x_INPUT_INT));
-    sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_CINT,
+    sysbus_connect_irq(sbd, PPCUIC_OUTPUT_CINT,
                        qdev_get_gpio_in(DEVICE(&s->cpu), PPC40x_INPUT_CINT));
 
     /* SDRAM controller */
@@ -1168,7 +1168,7 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
                              "ppc405.sdram0", s->dram_mr,
                              s->ram_bases[0], s->ram_sizes[0]);
 
-    ppc4xx_sdram_init(env, qdev_get_gpio_in(s->uic, 17), 1,
+    ppc4xx_sdram_init(env, qdev_get_gpio_in(DEVICE(&s->uic), 17), 1,
                       s->ram_banks, s->ram_bases, s->ram_sizes,
                       s->do_dram_init);
 
@@ -1183,12 +1183,12 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     }
     sbd = SYS_BUS_DEVICE(&s->dma);
     for (i = 0; i < ARRAY_SIZE(s->dma.irqs); i++) {
-        sysbus_connect_irq(sbd, i, qdev_get_gpio_in(s->uic, 5 + i));
+        sysbus_connect_irq(sbd, i, qdev_get_gpio_in(DEVICE(&s->uic), 5 + i));
     }
 
     /* I2C controller */
     sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
-                         qdev_get_gpio_in(s->uic, 2));
+                         qdev_get_gpio_in(DEVICE(&s->uic), 2));
 
     /* GPIO */
     sbd = SYS_BUS_DEVICE(&s->gpio);
@@ -1200,13 +1200,13 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     /* Serial ports */
     if (serial_hd(0) != NULL) {
         serial_mm_init(get_system_memory(), 0xef600300, 0,
-                       qdev_get_gpio_in(s->uic, 0),
+                       qdev_get_gpio_in(DEVICE(&s->uic), 0),
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
                        DEVICE_BIG_ENDIAN);
     }
     if (serial_hd(1) != NULL) {
         serial_mm_init(get_system_memory(), 0xef600400, 0,
-                       qdev_get_gpio_in(s->uic, 1),
+                       qdev_get_gpio_in(DEVICE(&s->uic), 1),
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
                        DEVICE_BIG_ENDIAN);
     }
@@ -1223,7 +1223,7 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(sbd, 0, 0xef600000);
     for (i = 0; i < ARRAY_SIZE(s->gpt.irqs); i++) {
-        sysbus_connect_irq(sbd, i, qdev_get_gpio_in(s->uic, 19 + i));
+        sysbus_connect_irq(sbd, i, qdev_get_gpio_in(DEVICE(&s->uic), 19 + i));
     }
 
     /* MAL */
@@ -1234,7 +1234,7 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     }
     sbd = SYS_BUS_DEVICE(&s->mal);
     for (i = 0; i < ARRAY_SIZE(s->mal.irqs); i++) {
-        sysbus_connect_irq(sbd, i, qdev_get_gpio_in(s->uic, 11 + i));
+        sysbus_connect_irq(sbd, i, qdev_get_gpio_in(DEVICE(&s->uic), 11 + i));
     }
 
     /* Ethernet */
-- 
2.30.4


