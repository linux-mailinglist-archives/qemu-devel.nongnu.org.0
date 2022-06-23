Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 721C65589FA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 22:22:52 +0200 (CEST)
Received: from localhost ([::1]:51260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4TLn-0001LF-It
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 16:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cZ0p=W6=kaod.org=clg@ozlabs.org>)
 id 1o4TKh-0008EZ-1w; Thu, 23 Jun 2022 16:21:43 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:51991
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cZ0p=W6=kaod.org=clg@ozlabs.org>)
 id 1o4TKe-0003XK-42; Thu, 23 Jun 2022 16:21:42 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LTWqf1rYCz4xXj;
 Fri, 24 Jun 2022 06:21:34 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LTWqZ5qR9z4xR9;
 Fri, 24 Jun 2022 06:21:30 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2] aspeed: Set the dram container at the SoC level
Date: Thu, 23 Jun 2022 22:21:23 +0200
Message-Id: <20220623202123.3972977-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=cZ0p=W6=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Currently, the Aspeed machines allocate a ram container region in
which the machine ram region is mapped. See commit ad1a9782186d
("aspeed: add a RAM memory region container"). An extra region is
mapped after ram in the ram container to catch invalid access done by
FW. That's how FW determines the size of ram. See commit ebe31c0a8ef7
("aspeed: add a max_ram_size property to the memory controller").

Let's move all the logic under the SoC where it should be. It will
also ease the work on multi SoC support.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 Changes in v2:

 - handle errors

 include/hw/arm/aspeed_soc.h |  2 ++
 hw/arm/aspeed.c             | 39 ++---------------------------------
 hw/arm/aspeed_ast2600.c     |  6 ++++--
 hw/arm/aspeed_soc.c         | 41 +++++++++++++++++++++++++++++++++++--
 4 files changed, 47 insertions(+), 41 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 02a5a9ffcbd3..e8a104823d35 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -50,6 +50,7 @@ struct AspeedSoCState {
     A15MPPrivState     a7mpcore;
     ARMv7MState        armv7m;
     MemoryRegion *dram_mr;
+    MemoryRegion dram_container;
     MemoryRegion sram;
     AspeedVICState vic;
     AspeedRtcState rtc;
@@ -165,5 +166,6 @@ enum {
 
 qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
 void aspeed_soc_uart_init(AspeedSoCState *s);
+bool aspeed_soc_dram_init(AspeedSoCState *s, Error **errp);
 
 #endif /* ASPEED_SOC_H */
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a06f7c1b62a9..dc09773b0ba5 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -174,27 +174,6 @@ struct AspeedMachineState {
 #define BLETCHLEY_BMC_HW_STRAP1 AST2600_EVB_HW_STRAP1
 #define BLETCHLEY_BMC_HW_STRAP2 AST2600_EVB_HW_STRAP2
 
-/*
- * The max ram region is for firmwares that scan the address space
- * with load/store to guess how much RAM the SoC has.
- */
-static uint64_t max_ram_read(void *opaque, hwaddr offset, unsigned size)
-{
-    return 0;
-}
-
-static void max_ram_write(void *opaque, hwaddr offset, uint64_t value,
-                           unsigned size)
-{
-    /* Discard writes */
-}
-
-static const MemoryRegionOps max_ram_ops = {
-    .read = max_ram_read,
-    .write = max_ram_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
 #define AST_SMP_MAILBOX_BASE            0x1e6e2180
 #define AST_SMP_MBOX_FIELD_ENTRY        (AST_SMP_MAILBOX_BASE + 0x0)
 #define AST_SMP_MBOX_FIELD_GOSIGN       (AST_SMP_MAILBOX_BASE + 0x4)
@@ -324,20 +303,16 @@ static void aspeed_machine_init(MachineState *machine)
     AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(machine);
     AspeedSoCClass *sc;
     DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
-    ram_addr_t max_ram_size;
     int i;
     NICInfo *nd = &nd_table[0];
 
-    memory_region_init(&bmc->ram_container, NULL, "aspeed-ram-container",
-                       4 * GiB);
-    memory_region_add_subregion(&bmc->ram_container, 0, machine->ram);
-
     object_initialize_child(OBJECT(machine), "soc", &bmc->soc, amc->soc_name);
 
     sc = ASPEED_SOC_GET_CLASS(&bmc->soc);
 
     /*
-     * This will error out if isize is not supported by memory controller.
+     * This will error out if the RAM size is not supported by the
+     * memory controller of the SoC.
      */
     object_property_set_uint(OBJECT(&bmc->soc), "ram-size", machine->ram_size,
                              &error_fatal);
@@ -369,16 +344,6 @@ static void aspeed_machine_init(MachineState *machine)
                          amc->uart_default);
     qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
 
-    memory_region_add_subregion(get_system_memory(),
-                                sc->memmap[ASPEED_DEV_SDRAM],
-                                &bmc->ram_container);
-
-    max_ram_size = object_property_get_uint(OBJECT(&bmc->soc), "max-ram-size",
-                                            &error_abort);
-    memory_region_init_io(&bmc->max_ram, NULL, &max_ram_ops, NULL,
-                          "max_ram", max_ram_size  - machine->ram_size);
-    memory_region_add_subregion(&bmc->ram_container, machine->ram_size, &bmc->max_ram);
-
     aspeed_board_init_flashes(&bmc->soc.fmc,
                               bmc->fmc_model ? bmc->fmc_model : amc->fmc_model,
                               amc->num_cs, 0);
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index b0a4199b6960..f70b17d3f9cf 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -197,8 +197,6 @@ static void aspeed_soc_ast2600_init(Object *obj)
     object_initialize_child(obj, "sdmc", &s->sdmc, typename);
     object_property_add_alias(obj, "ram-size", OBJECT(&s->sdmc),
                               "ram-size");
-    object_property_add_alias(obj, "max-ram-size", OBJECT(&s->sdmc),
-                              "max-ram-size");
 
     for (i = 0; i < sc->wdts_num; i++) {
         snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
@@ -271,6 +269,10 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     /* IO space */
     create_unimplemented_device("aspeed_soc.io", sc->memmap[ASPEED_DEV_IOMEM],
                                 ASPEED_SOC_IOMEM_SIZE);
+    /* RAM */
+    if (!aspeed_soc_dram_init(s, errp)) {
+        return;
+    }
 
     /* Video engine stub */
     create_unimplemented_device("aspeed.video", sc->memmap[ASPEED_DEV_VIDEO],
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 30574d4276ab..f5300288745b 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "hw/misc/unimp.h"
 #include "hw/arm/aspeed_soc.h"
@@ -191,8 +192,6 @@ static void aspeed_soc_init(Object *obj)
     object_initialize_child(obj, "sdmc", &s->sdmc, typename);
     object_property_add_alias(obj, "ram-size", OBJECT(&s->sdmc),
                               "ram-size");
-    object_property_add_alias(obj, "max-ram-size", OBJECT(&s->sdmc),
-                              "max-ram-size");
 
     for (i = 0; i < sc->wdts_num; i++) {
         snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
@@ -237,6 +236,11 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("aspeed_soc.io", sc->memmap[ASPEED_DEV_IOMEM],
                                 ASPEED_SOC_IOMEM_SIZE);
 
+    /* RAM */
+    if (!aspeed_soc_dram_init(s, errp)) {
+        return;
+    }
+
     /* Video engine stub */
     create_unimplemented_device("aspeed.video", sc->memmap[ASPEED_DEV_VIDEO],
                                 0x1000);
@@ -561,3 +565,36 @@ void aspeed_soc_uart_init(AspeedSoCState *s)
                        serial_hd(i), DEVICE_LITTLE_ENDIAN);
     }
 }
+
+bool aspeed_soc_dram_init(AspeedSoCState *s, Error **errp)
+{
+    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+    ram_addr_t ram_size, max_ram_size;
+    DeviceState *dev;
+
+    memory_region_init(&s->dram_container, OBJECT(s), "ram-container", 4 * GiB);
+    memory_region_add_subregion(&s->dram_container, 0, s->dram_mr);
+
+    /*
+     * Add a memory region beyond the RAM region to let firmwares scan
+     * the address space with load/store and guess how much RAM the
+     * SoC has.
+     */
+    ram_size = object_property_get_uint(OBJECT(&s->sdmc), "ram-size",
+                                        &error_abort);
+    max_ram_size = object_property_get_uint(OBJECT(&s->sdmc), "max-ram-size",
+                                            &error_abort);
+
+    dev = qdev_new(TYPE_UNIMPLEMENTED_DEVICE);
+    qdev_prop_set_string(dev, "name", "ram-empty");
+    qdev_prop_set_uint64(dev, "size", max_ram_size  - ram_size);
+    if (!sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), errp)) {
+        return false;
+    }
+    memory_region_add_subregion_overlap(&s->dram_container, ram_size,
+                      sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0), -1000);
+
+    memory_region_add_subregion(get_system_memory(),
+                      sc->memmap[ASPEED_DEV_SDRAM], &s->dram_container);
+    return true;
+}
-- 
2.35.3


