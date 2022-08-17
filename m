Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4DF5972DE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 17:26:14 +0200 (CEST)
Received: from localhost ([::1]:45260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOKvt-0001An-7J
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 11:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKen-0004go-Lz; Wed, 17 Aug 2022 11:08:35 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:43877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKei-0002uU-Jq; Wed, 17 Aug 2022 11:08:33 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6841F747F1B;
 Wed, 17 Aug 2022 17:08:26 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3E47D747F19; Wed, 17 Aug 2022 17:08:26 +0200 (CEST)
Message-Id: <38476bc43d2332db2f09dbede9eff5234d6ce217.1660746880.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660746880.git.balaton@eik.bme.hu>
References: <cover.1660746880.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 08/31] ppc/ppc405: QOM'ify OPBA
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
Date: Wed, 17 Aug 2022 17:08:26 +0200 (CEST)
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

The OPB arbitrer is currently modeled as a simple SysBus device with a
unique memory region.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
[balaton: ppc4xx_dcr_register changes]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc405.h     | 12 +++++++++++
 hw/ppc/ppc405_uc.c  | 49 +++++++++++++++++++++++++++------------------
 hw/ppc/trace-events |  1 -
 3 files changed, 41 insertions(+), 21 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 82bf8dae93..d63c2acdc7 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,6 +63,17 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
 };
 
+/* OPB arbitrer */
+#define TYPE_PPC405_OPBA "ppc405-opba"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405OpbaState, PPC405_OPBA);
+struct Ppc405OpbaState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion io;
+    uint8_t cr;
+    uint8_t pr;
+};
+
 /* Peripheral controller */
 #define TYPE_PPC405_EBC "ppc405-ebc"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
@@ -208,6 +219,7 @@ struct Ppc405SoCState {
     Ppc405GpioState gpio;
     Ppc405DmaState dma;
     Ppc405EbcState ebc;
+    Ppc405OpbaState opba;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index f259de07e2..911ec958c6 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -310,16 +310,9 @@ static void ppc4xx_pob_init(CPUPPCState *env)
 
 /*****************************************************************************/
 /* OPB arbitrer */
-typedef struct ppc4xx_opba_t ppc4xx_opba_t;
-struct ppc4xx_opba_t {
-    MemoryRegion io;
-    uint8_t cr;
-    uint8_t pr;
-};
-
 static uint64_t opba_readb(void *opaque, hwaddr addr, unsigned size)
 {
-    ppc4xx_opba_t *opba = opaque;
+    Ppc405OpbaState *opba = opaque;
     uint32_t ret;
 
     switch (addr) {
@@ -341,7 +334,7 @@ static uint64_t opba_readb(void *opaque, hwaddr addr, unsigned size)
 static void opba_writeb(void *opaque, hwaddr addr, uint64_t value,
                         unsigned size)
 {
-    ppc4xx_opba_t *opba = opaque;
+    Ppc405OpbaState *opba = opaque;
 
     trace_opba_writeb(addr, value);
 
@@ -366,25 +359,30 @@ static const MemoryRegionOps opba_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
 };
 
-static void ppc4xx_opba_reset (void *opaque)
+static void ppc405_opba_reset(DeviceState *dev)
 {
-    ppc4xx_opba_t *opba;
+    Ppc405OpbaState *opba = PPC405_OPBA(dev);
 
-    opba = opaque;
     opba->cr = 0x00; /* No dynamic priorities - park disabled */
     opba->pr = 0x11;
 }
 
-static void ppc4xx_opba_init(hwaddr base)
+static void ppc405_opba_realize(DeviceState *dev, Error **errp)
 {
-    ppc4xx_opba_t *opba;
+    Ppc405OpbaState *s = PPC405_OPBA(dev);
+
+    memory_region_init_io(&s->io, OBJECT(s), &opba_ops, s, "opba", 2);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->io);
+}
 
-    trace_opba_init(base);
+static void ppc405_opba_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
 
-    opba = g_new0(ppc4xx_opba_t, 1);
-    memory_region_init_io(&opba->io, NULL, &opba_ops, opba, "opba", 0x002);
-    memory_region_add_subregion(get_system_memory(), base, &opba->io);
-    qemu_register_reset(ppc4xx_opba_reset, opba);
+    dc->realize = ppc405_opba_realize;
+    dc->reset = ppc405_opba_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
 }
 
 /*****************************************************************************/
@@ -1370,6 +1368,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
 
     object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
+
+    object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
 }
 
 static void ppc405_reset(void *opaque)
@@ -1407,7 +1407,11 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     ppc4xx_pob_init(env);
 
     /* OBP arbitrer */
-    ppc4xx_opba_init(0xef600600);
+    sbd = SYS_BUS_DEVICE(&s->opba);
+    if (!sysbus_realize(sbd, errp)) {
+        return;
+    }
+    sysbus_mmio_map(sbd, 0, 0xef600600);
 
     /* Universal interrupt controller */
     s->uic = qdev_new(TYPE_PPC_UIC);
@@ -1520,6 +1524,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_OPBA,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(Ppc405OpbaState),
+        .class_init     = ppc405_opba_class_init,
+    }, {
         .name           = TYPE_PPC405_EBC,
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
         .instance_size  = sizeof(Ppc405EbcState),
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index 69a95f9f57..a07d5aca0f 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -161,7 +161,6 @@ ppc440_pcix_reg_write(uint64_t addr, uint32_t val, uint32_t size) "addr 0x%" PRI
 # ppc405_boards.c
 opba_readb(uint64_t addr, uint32_t val) "addr 0x%" PRIx64 " = 0x%" PRIx32
 opba_writeb(uint64_t addr, uint64_t val) "addr 0x%" PRIx64 " = 0x%" PRIx64
-opba_init(uint64_t addr) "offet 0x%" PRIx64
 
 ppc405_gpio_read(uint64_t addr, uint32_t size) "addr 0x%" PRIx64 " size %d"
 ppc405_gpio_write(uint64_t addr, uint32_t size, uint64_t val) "addr 0x%" PRIx64 " size %d = 0x%" PRIx64
-- 
2.30.4


