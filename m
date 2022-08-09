Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2D558DB64
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 17:53:12 +0200 (CEST)
Received: from localhost ([::1]:46050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLRXb-0007fT-QF
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 11:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uImW=YN=kaod.org=clg@ozlabs.org>)
 id 1oLRL0-0004jl-1Y; Tue, 09 Aug 2022 11:40:11 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:41871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uImW=YN=kaod.org=clg@ozlabs.org>)
 id 1oLRKv-0004SX-GH; Tue, 09 Aug 2022 11:40:07 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4M2HM74DBqz4xXS;
 Wed, 10 Aug 2022 01:40:03 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4M2HM53m5Kz4xTv;
 Wed, 10 Aug 2022 01:40:01 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 20/24] ppc/ppc405: Use an embedded PPCUIC model in SoC state
Date: Tue,  9 Aug 2022 17:39:00 +0200
Message-Id: <20220809153904.485018-21-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809153904.485018-1-clg@kaod.org>
References: <20220809153904.485018-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=uImW=YN=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h    |  3 ++-
 hw/ppc/ppc405_uc.c | 26 +++++++++++++-------------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 31c94e474209..8e67ad0b72c3 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -27,6 +27,7 @@
 
 #include "qom/object.h"
 #include "hw/ppc/ppc4xx.h"
+#include "hw/intc/ppc-uic.h"
 
 #define PPC405EP_SDRAM_BASE 0x00000000
 #define PPC405EP_NVRAM_BASE 0xF0000000
@@ -234,7 +235,7 @@ struct Ppc405SoCState {
     hwaddr ram_size;
 
     PowerPCCPU cpu;
-    DeviceState *uic;
+    PPCUIC uic;
     Ppc405CpcState cpc;
     Ppc405GptState gpt;
     Ppc405OcmState ocm;
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 290cfa352bed..328224bb0620 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1350,6 +1350,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "cpu", &s->cpu,
                             POWERPC_CPU_TYPE_NAME("405ep"));
 
+    object_initialize_child(obj, "uic", &s->uic, TYPE_PPC_UIC);
+
     object_initialize_child(obj, "cpc", &s->cpc, TYPE_PPC405_CPC);
     object_property_add_alias(obj, "sys-clk", OBJECT(&s->cpc), "sys-clk");
 
@@ -1415,17 +1417,15 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->opba), 0, 0xef600600);
 
     /* Universal interrupt controller */
-    s->uic = qdev_new(TYPE_PPC_UIC);
-
-    object_property_set_link(OBJECT(s->uic), "cpu", OBJECT(&s->cpu),
+    object_property_set_link(OBJECT(&s->uic), "cpu", OBJECT(&s->cpu),
                              &error_fatal);
-    if (!sysbus_realize(SYS_BUS_DEVICE(s->uic), errp)) {
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->uic), errp)) {
         return;
     }
 
-    sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_INT,
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->uic), PPCUIC_OUTPUT_INT,
                        qdev_get_gpio_in(DEVICE(&s->cpu), PPC40x_INPUT_INT));
-    sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_CINT,
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->uic), PPCUIC_OUTPUT_CINT,
                        qdev_get_gpio_in(DEVICE(&s->cpu), PPC40x_INPUT_CINT));
 
     /* SDRAM controller */
@@ -1436,7 +1436,7 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
                              "ppc405.sdram0", s->dram_mr,
                              s->ram_bases[0], s->ram_sizes[0]);
 
-    ppc4xx_sdram_init(env, qdev_get_gpio_in(s->uic, 17), 1,
+    ppc4xx_sdram_init(env, qdev_get_gpio_in(DEVICE(&s->uic), 17), 1,
                       s->ram_banks, s->ram_bases, s->ram_sizes,
                       s->do_dram_init);
 
@@ -1452,12 +1452,12 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 
     for (i = 0; i < ARRAY_SIZE(s->dma.irqs); i++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), i,
-                           qdev_get_gpio_in(s->uic, 5 + i));
+                           qdev_get_gpio_in(DEVICE(&s->uic), 5 + i));
     }
 
     /* I2C controller */
     sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
-                         qdev_get_gpio_in(s->uic, 2));
+                         qdev_get_gpio_in(DEVICE(&s->uic), 2));
 
     /* GPIO */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
@@ -1468,13 +1468,13 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
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
@@ -1492,7 +1492,7 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 
     for (i = 0; i < ARRAY_SIZE(s->gpt.irqs); i++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpt), i,
-                           qdev_get_gpio_in(s->uic, 19 + i));
+                           qdev_get_gpio_in(DEVICE(&s->uic), 19 + i));
     }
 
     /* MAL */
@@ -1504,7 +1504,7 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 
     for (i = 0; i < ARRAY_SIZE(s->mal.irqs); i++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->mal), i,
-                           qdev_get_gpio_in(s->uic, 11 + i));
+                           qdev_get_gpio_in(DEVICE(&s->uic), 11 + i));
     }
 
     /* Ethernet */
-- 
2.37.1


