Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD62358DB4C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 17:43:25 +0200 (CEST)
Received: from localhost ([::1]:53598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLRO8-0001jp-DA
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 11:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uImW=YN=kaod.org=clg@ozlabs.org>)
 id 1oLRKP-000424-5t; Tue, 09 Aug 2022 11:39:33 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:56151
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uImW=YN=kaod.org=clg@ozlabs.org>)
 id 1oLRKM-0004My-5A; Tue, 09 Aug 2022 11:39:32 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4M2HLP2hq7z4xTx;
 Wed, 10 Aug 2022 01:39:25 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4M2HLM2VDYz4xTv;
 Wed, 10 Aug 2022 01:39:23 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 05/24] ppc/ppc405: Introduce a PPC405 SoC
Date: Tue,  9 Aug 2022 17:38:45 +0200
Message-Id: <20220809153904.485018-6-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809153904.485018-1-clg@kaod.org>
References: <20220809153904.485018-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=uImW=YN=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
QOM'ified devices will be reintroduced one by one. Start with the
memory regions, which name prefix is changed to "ppc405".

Also, initialize only one RAM bank. The second bank is a dummy one
(zero size) which is here to match the hard coded number of banks in
ppc405ep_init().

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h        | 16 ++++++++++++++++
 hw/ppc/ppc405_boards.c | 23 ++++++++++++-----------
 hw/ppc/ppc405_uc.c     | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 11 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 83f156f585c8..66dc21cdfed8 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -25,6 +25,7 @@
 #ifndef PPC405_H
 #define PPC405_H
 
+#include "qom/object.h"
 #include "hw/ppc/ppc4xx.h"
 
 #define PPC405EP_SDRAM_BASE 0x00000000
@@ -62,6 +63,21 @@ struct ppc4xx_bd_info_t {
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
+    MemoryRegion ram_banks[2];
+    hwaddr ram_bases[2], ram_sizes[2];
+
+    MemoryRegion *dram_mr;
+    hwaddr ram_size;
+};
+
 /* PowerPC 405 core */
 ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
 
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 381f39aa94cb..f029d6f415f6 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -57,6 +57,8 @@ struct Ppc405MachineState {
     /* Private */
     MachineState parent_obj;
     /* Public */
+
+    Ppc405SoCState soc;
 };
 
 /*****************************************************************************/
@@ -232,11 +234,10 @@ static void boot_from_kernel(MachineState *machine, PowerPCCPU *cpu)
 
 static void ppc405_init(MachineState *machine)
 {
+    Ppc405MachineState *ppc405 = PPC405_MACHINE(machine);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const char *kernel_filename = machine->kernel_filename;
     PowerPCCPU *cpu;
-    MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
-    hwaddr ram_bases[2], ram_sizes[2];
     MemoryRegion *sysmem = get_system_memory();
     DeviceState *uicdev;
 
@@ -247,16 +248,16 @@ static void ppc405_init(MachineState *machine)
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
+    qdev_realize(DEVICE(&ppc405->soc), NULL, &error_fatal);
 
-    cpu = ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
+    cpu = ppc405ep_init(sysmem, ppc405->soc.ram_banks, ppc405->soc.ram_bases,
+                        ppc405->soc.ram_sizes,
                         33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
 
     /* allocate and load BIOS */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index d6420c88d3a6..adadb3a0ae08 100644
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
@@ -1530,3 +1531,42 @@ PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
 
     return cpu;
 }
+
+static void ppc405_soc_realize(DeviceState *dev, Error **errp)
+{
+    Ppc405SoCState *s = PPC405_SOC(dev);
+
+    /* Initialize only one bank */
+    s->ram_bases[0] = 0;
+    s->ram_sizes[0] = s->ram_size;
+    memory_region_init_alias(&s->ram_banks[0], OBJECT(s),
+                             "ppc405.sdram0", s->dram_mr,
+                             s->ram_bases[0], s->ram_sizes[0]);
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


