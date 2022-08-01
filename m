Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DB4586BC7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 15:18:33 +0200 (CEST)
Received: from localhost ([::1]:45860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIVJW-0007fT-7x
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 09:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1oIVCV-00048W-T4; Mon, 01 Aug 2022 09:11:16 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:35837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1oIVCT-0007Gf-Lj; Mon, 01 Aug 2022 09:11:15 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LxJR31nsFz4xG7;
 Mon,  1 Aug 2022 23:11:11 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LxJR06Fm4z4x1L;
 Mon,  1 Aug 2022 23:11:08 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 04/19] ppc/ppc405: Introduce a PPC405 SoC
Date: Mon,  1 Aug 2022 15:10:24 +0200
Message-Id: <20220801131039.1693913-5-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220801131039.1693913-1-clg@kaod.org>
References: <20220801131039.1693913-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=LBbo=YF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

It is an initial model to start QOMification of the PPC405 board.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h        | 17 ++++++++++++++
 hw/ppc/ppc405_boards.c | 29 ++++++++++-------------
 hw/ppc/ppc405_uc.c     | 53 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+), 17 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 83f156f585c8..c8cddb71733a 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -25,6 +25,7 @@
 #ifndef PPC405_H
 #define PPC405_H
 
+#include "qom/object.h"
 #include "hw/ppc/ppc4xx.h"
 
 #define PPC405EP_SDRAM_BASE 0x00000000
@@ -62,6 +63,22 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
 };
 
+#define TYPE_PPC405_SOC "ppc405-soc"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405SoCState, PPC405_SOC);
+
+struct Ppc405SoCState {
+    /* Private */
+    DeviceState parent_obj;
+
+    /* Public */
+    MemoryRegion sram;
+    MemoryRegion ram_memories[2];
+    hwaddr ram_bases[2], ram_sizes[2];
+
+    MemoryRegion *dram_mr;
+    hwaddr ram_size;
+};
+
 /* PowerPC 405 core */
 ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
 
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 24ec948d22a4..96db52c5a309 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -54,6 +54,8 @@ struct Ppc405MachineState {
     /* Private */
     MachineState parent_obj;
     /* Public */
+
+    Ppc405SoCState soc;
 };
 
 #define TYPE_PPC405_MACHINE MACHINE_TYPE_NAME("ppc405")
@@ -232,12 +234,10 @@ static void boot_from_kernel(MachineState *machine, PowerPCCPU *cpu)
 
 static void ppc405_init(MachineState *machine)
 {
+    Ppc405MachineState *ppc405 = PPC405_MACHINE(machine);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const char *kernel_filename = machine->kernel_filename;
     PowerPCCPU *cpu;
-    MemoryRegion *sram = g_new(MemoryRegion, 1);
-    MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
-    hwaddr ram_bases[2], ram_sizes[2];
     MemoryRegion *sysmem = get_system_memory();
     DeviceState *uicdev;
 
@@ -248,23 +248,18 @@ static void ppc405_init(MachineState *machine)
         exit(EXIT_FAILURE);
     }
 
-    /* XXX: fix this */
-    memory_region_init_alias(&ram_memories[0], NULL, "ef405ep.ram.alias",
-                             machine->ram, 0, machine->ram_size);
-    ram_bases[0] = 0;
-    ram_sizes[0] = machine->ram_size;
-    memory_region_init(&ram_memories[1], NULL, "ef405ep.ram1", 0);
-    ram_bases[1] = 0x00000000;
-    ram_sizes[1] = 0x00000000;
+    object_initialize_child(OBJECT(machine), "soc", &ppc405->soc,
+                            TYPE_PPC405_SOC);
+    object_property_set_uint(OBJECT(&ppc405->soc), "ram-size",
+                             machine->ram_size, &error_fatal);
+    object_property_set_link(OBJECT(&ppc405->soc), "dram",
+                             OBJECT(machine->ram), &error_abort);
+    qdev_realize(DEVICE(&ppc405->soc), NULL, &error_abort);
 
-    cpu = ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
+    cpu = ppc405ep_init(sysmem, ppc405->soc.ram_memories, ppc405->soc.ram_bases,
+                        ppc405->soc.ram_sizes,
                         33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
 
-    /* allocate SRAM */
-    memory_region_init_ram(sram, NULL, "ef405ep.sram", PPC405EP_SRAM_SIZE,
-                           &error_fatal);
-    memory_region_add_subregion(sysmem, PPC405EP_SRAM_BASE, sram);
-
     /* allocate and load BIOS */
     if (machine->firmware) {
         MemoryRegion *bios = g_new(MemoryRegion, 1);
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index d6420c88d3a6..156e839b8283 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -30,6 +30,7 @@
 #include "hw/ppc/ppc.h"
 #include "hw/i2c/ppc4xx_i2c.h"
 #include "hw/irq.h"
+#include "hw/qdev-properties.h"
 #include "ppc405.h"
 #include "hw/char/serial.h"
 #include "qemu/timer.h"
@@ -1530,3 +1531,55 @@ PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
 
     return cpu;
 }
+
+static void ppc405_soc_realize(DeviceState *dev, Error **errp)
+{
+    Ppc405SoCState *s = PPC405_SOC(dev);
+    Error *err = NULL;
+
+    /* XXX: fix this ? */
+    memory_region_init_alias(&s->ram_memories[0], OBJECT(s),
+                             "ef405ep.ram.alias", s->dram_mr, 0, s->ram_size);
+    s->ram_bases[0] = 0;
+    s->ram_sizes[0] = s->ram_size;
+    memory_region_init(&s->ram_memories[1], OBJECT(s), "ef405ep.ram1", 0);
+    s->ram_bases[1] = 0x00000000;
+    s->ram_sizes[1] = 0x00000000;
+
+    /* allocate SRAM */
+    memory_region_init_ram(&s->sram, OBJECT(s), "ef405ep.sram",
+                           PPC405EP_SRAM_SIZE,  &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    memory_region_add_subregion(get_system_memory(), PPC405EP_SRAM_BASE,
+                                &s->sram);
+}
+
+static Property ppc405_soc_properties[] = {
+    DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
+    DEFINE_PROP_UINT64("ram-size", Ppc405SoCState, ram_size, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ppc405_soc_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_soc_realize;
+    dc->user_creatable = false;
+    device_class_set_props(dc, ppc405_soc_properties);
+}
+
+static const TypeInfo ppc405_types[] = {
+    {
+        .name           = TYPE_PPC405_SOC,
+        .parent         = TYPE_DEVICE,
+        .instance_size  = sizeof(Ppc405SoCState),
+        .class_init     = ppc405_soc_class_init,
+    }
+};
+
+DEFINE_TYPES(ppc405_types)
-- 
2.37.1


