Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AB158C6AD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 12:44:39 +0200 (CEST)
Received: from localhost ([::1]:60398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL0FS-0007b5-CP
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 06:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c6th=YM=kaod.org=clg@ozlabs.org>)
 id 1oKzzl-0005dq-S1; Mon, 08 Aug 2022 06:28:29 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:46857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c6th=YM=kaod.org=clg@ozlabs.org>)
 id 1oKzzj-0001Uj-Sd; Mon, 08 Aug 2022 06:28:25 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4M1XTx3dDyz4xVF;
 Mon,  8 Aug 2022 20:28:21 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4M1XTv3KzPz4xVB;
 Mon,  8 Aug 2022 20:28:19 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 15/22] ppc/ppc405: QOM'ify OPBA
Date: Mon,  8 Aug 2022 12:27:27 +0200
Message-Id: <20220808102734.133084-16-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808102734.133084-1-clg@kaod.org>
References: <20220808102734.133084-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=c6th=YM=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

The OPB arbitrer is currently modeled as a simple SysBus device with a
unique memory region.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h    | 12 ++++++++++++
 hw/ppc/ppc405_uc.c | 47 +++++++++++++++++++++++++++-------------------
 2 files changed, 40 insertions(+), 19 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 82bf8dae931f..d63c2acdc7b5 100644
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
index 732b05156715..d66db9b9c14a 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -310,16 +310,10 @@ static void ppc4xx_pob_init(CPUPPCState *env)
 
 /*****************************************************************************/
 /* OPB arbitrer */
-typedef struct ppc4xx_opba_t ppc4xx_opba_t;
-struct ppc4xx_opba_t {
-    MemoryRegion io;
-    uint8_t cr;
-    uint8_t pr;
-};
 
 static uint64_t opba_readb(void *opaque, hwaddr addr, unsigned size)
 {
-    ppc4xx_opba_t *opba = opaque;
+    Ppc405OpbaState *opba = PPC405_OPBA(opaque);
     uint32_t ret;
 
     switch (addr) {
@@ -341,7 +335,7 @@ static uint64_t opba_readb(void *opaque, hwaddr addr, unsigned size)
 static void opba_writeb(void *opaque, hwaddr addr, uint64_t value,
                         unsigned size)
 {
-    ppc4xx_opba_t *opba = opaque;
+    Ppc405OpbaState *opba = PPC405_OPBA(opaque);
 
     trace_opba_writeb(addr, value);
 
@@ -366,25 +360,30 @@ static const MemoryRegionOps opba_ops = {
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
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
-    trace_opba_init(base);
+    memory_region_init_io(&s->io, OBJECT(s), &opba_ops, s, "opba", 0x002);
+    sysbus_init_mmio(sbd, &s->io);
+}
+
+static void ppc405_opba_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
 
-    opba = g_new0(ppc4xx_opba_t, 1);
-    memory_region_init_io(&opba->io, NULL, &opba_ops, opba, "opba", 0x002);
-    memory_region_add_subregion(get_system_memory(), base, &opba->io);
-    qemu_register_reset(ppc4xx_opba_reset, opba);
+    dc->realize = ppc405_opba_realize;
+    dc->reset = ppc405_opba_reset;
+    dc->user_creatable = false;
 }
 
 /*****************************************************************************/
@@ -1360,6 +1359,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
 
     object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
+
+    object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
 }
 
 static void ppc405_soc_realize(DeviceState *dev, Error **errp)
@@ -1391,7 +1392,10 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     ppc4xx_pob_init(env);
 
     /* OBP arbitrer */
-    ppc4xx_opba_init(0xef600600);
+   if (!sysbus_realize(SYS_BUS_DEVICE(&s->opba), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->opba), 0, 0xef600600);
 
     /* Universal interrupt controller */
     s->uic = qdev_new(TYPE_PPC_UIC);
@@ -1504,6 +1508,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
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
-- 
2.37.1


