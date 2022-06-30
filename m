Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E88561951
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 13:36:29 +0200 (CEST)
Received: from localhost ([::1]:37666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6sTE-0007HO-84
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 07:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sI6-00089X-Hr; Thu, 30 Jun 2022 07:24:58 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:42991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHw-00024n-Kz; Thu, 30 Jun 2022 07:24:58 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbb34Zxyz4xXD;
 Thu, 30 Jun 2022 21:24:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbb14MRxz4xD5;
 Thu, 30 Jun 2022 21:24:45 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 11/27] aspeed: Map unimplemented devices in SoC memory
Date: Thu, 30 Jun 2022 13:23:55 +0200
Message-Id: <20220630112411.1474431-12-clg@kaod.org>
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

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220624003701.1363500-5-pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  9 +++++++++
 hw/arm/aspeed_ast10x0.c     | 16 ++++++++++------
 hw/arm/aspeed_ast2600.c     | 27 ++++++++++++++++++---------
 hw/arm/aspeed_soc.c         | 23 +++++++++++++++++++----
 4 files changed, 56 insertions(+), 19 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 1ab328d00cc5..6cfc0639852e 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -34,6 +34,7 @@
 #include "hw/usb/hcd-ehci.h"
 #include "qom/object.h"
 #include "hw/misc/aspeed_lpc.h"
+#include "hw/misc/unimp.h"
 
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_EHCIS_NUM 2
@@ -66,6 +67,7 @@ struct AspeedSoCState {
     AspeedSMCState spi[ASPEED_SPIS_NUM];
     EHCISysBusState ehci[ASPEED_EHCIS_NUM];
     AspeedSBCState sbc;
+    UnimplementedDeviceState sbc_unimplemented;
     AspeedSDMCState sdmc;
     AspeedWDTState wdt[ASPEED_WDTS_NUM];
     FTGMAC100State ftgmac100[ASPEED_MACS_NUM];
@@ -77,6 +79,10 @@ struct AspeedSoCState {
     AspeedLPCState lpc;
     uint32_t uart_default;
     Clock *sysclk;
+    UnimplementedDeviceState iomem;
+    UnimplementedDeviceState video;
+    UnimplementedDeviceState emmc_boot_controller;
+    UnimplementedDeviceState dpmcu;
 };
 
 #define TYPE_ASPEED_SOC "aspeed-soc"
@@ -169,5 +175,8 @@ qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
 void aspeed_soc_uart_init(AspeedSoCState *s);
 bool aspeed_soc_dram_init(AspeedSoCState *s, Error **errp);
 void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr addr);
+void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
+                                   const char *name, hwaddr addr,
+                                   uint64_t size);
 
 #endif /* ASPEED_SOC_H */
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index f8f321374a69..d34c06db1699 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -142,6 +142,10 @@ static void aspeed_soc_ast1030_init(Object *obj)
 
     snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
     object_initialize_child(obj, "gpio", &s->gpio, typename);
+
+    object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "sbc-unimplemented", &s->sbc_unimplemented,
+                            TYPE_UNIMPLEMENTED_DEVICE);
 }
 
 static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
@@ -158,12 +162,12 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     }
 
     /* General I/O memory space to catch all unimplemented device */
-    create_unimplemented_device("aspeed.sbc",
-                                sc->memmap[ASPEED_DEV_SBC],
-                                0x40000);
-    create_unimplemented_device("aspeed.io",
-                                sc->memmap[ASPEED_DEV_IOMEM],
-                                ASPEED_SOC_IOMEM_SIZE);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
+                                  sc->memmap[ASPEED_DEV_IOMEM],
+                                  ASPEED_SOC_IOMEM_SIZE);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->sbc_unimplemented),
+                                  "aspeed.sbc", sc->memmap[ASPEED_DEV_SBC],
+                                  0x40000);
 
     /* AST1030 CPU Core */
     armv7m = DEVICE(&s->armv7m);
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index f8c640e7fda1..dbb4a2e838f9 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -246,6 +246,13 @@ static void aspeed_soc_ast2600_init(Object *obj)
     object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
 
     object_initialize_child(obj, "sbc", &s->sbc, TYPE_ASPEED_SBC);
+
+    object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "video", &s->video, TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "dpmcu", &s->dpmcu, TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "emmc-boot-controller",
+                            &s->emmc_boot_controller,
+                            TYPE_UNIMPLEMENTED_DEVICE);
 }
 
 /*
@@ -267,17 +274,18 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     qemu_irq irq;
 
     /* IO space */
-    create_unimplemented_device("aspeed_soc.io", sc->memmap[ASPEED_DEV_IOMEM],
-                                ASPEED_SOC_IOMEM_SIZE);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
+                                  sc->memmap[ASPEED_DEV_IOMEM],
+                                  ASPEED_SOC_IOMEM_SIZE);
 
     /* Video engine stub */
-    create_unimplemented_device("aspeed.video", sc->memmap[ASPEED_DEV_VIDEO],
-                                0x1000);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->video), "aspeed.video",
+                                  sc->memmap[ASPEED_DEV_VIDEO], 0x1000);
 
     /* eMMC Boot Controller stub */
-    create_unimplemented_device("aspeed.emmc-boot-controller",
-                                sc->memmap[ASPEED_DEV_EMMC_BC],
-                                0x1000);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->emmc_boot_controller),
+                                  "aspeed.emmc-boot-controller",
+                                  sc->memmap[ASPEED_DEV_EMMC_BC], 0x1000);
 
     /* CPU */
     for (i = 0; i < sc->num_cpus; i++) {
@@ -333,8 +341,9 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
                                 sc->memmap[ASPEED_DEV_SRAM], &s->sram);
 
     /* DPMCU */
-    create_unimplemented_device("aspeed.dpmcu", sc->memmap[ASPEED_DEV_DPMCU],
-                                ASPEED_SOC_DPMCU_SIZE);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->dpmcu), "aspeed.dpmcu",
+                                  sc->memmap[ASPEED_DEV_DPMCU],
+                                  ASPEED_SOC_DPMCU_SIZE);
 
     /* SCU */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 500cfda724ae..369c59a0100d 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -223,6 +223,9 @@ static void aspeed_soc_init(Object *obj)
 
     snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
     object_initialize_child(obj, "hace", &s->hace, typename);
+
+    object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "video", &s->video, TYPE_UNIMPLEMENTED_DEVICE);
 }
 
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
@@ -233,12 +236,13 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     Error *err = NULL;
 
     /* IO space */
-    create_unimplemented_device("aspeed_soc.io", sc->memmap[ASPEED_DEV_IOMEM],
-                                ASPEED_SOC_IOMEM_SIZE);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
+                                  sc->memmap[ASPEED_DEV_IOMEM],
+                                  ASPEED_SOC_IOMEM_SIZE);
 
     /* Video engine stub */
-    create_unimplemented_device("aspeed.video", sc->memmap[ASPEED_DEV_VIDEO],
-                                0x1000);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->video), "aspeed.video",
+                                  sc->memmap[ASPEED_DEV_VIDEO], 0x1000);
 
     /* CPU */
     for (i = 0; i < sc->num_cpus; i++) {
@@ -619,3 +623,14 @@ void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr addr)
     memory_region_add_subregion(s->memory, addr,
                                 sysbus_mmio_get_region(dev, n));
 }
+
+void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
+                                   const char *name, hwaddr addr, uint64_t size)
+{
+    qdev_prop_set_string(DEVICE(dev), "name", name);
+    qdev_prop_set_uint64(DEVICE(dev), "size", size);
+    sysbus_realize(dev, &error_abort);
+
+    memory_region_add_subregion_overlap(s->memory, addr,
+                                        sysbus_mmio_get_region(dev, 0), -1000);
+}
-- 
2.35.3


