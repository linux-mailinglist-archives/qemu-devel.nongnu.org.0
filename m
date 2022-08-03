Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B980588DE9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 15:52:10 +0200 (CEST)
Received: from localhost ([::1]:45698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJEnB-0002GY-Fg
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 09:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fO70=YH=kaod.org=clg@ozlabs.org>)
 id 1oJERG-0003SN-A4; Wed, 03 Aug 2022 09:29:30 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:38947
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fO70=YH=kaod.org=clg@ozlabs.org>)
 id 1oJERE-0000br-7Z; Wed, 03 Aug 2022 09:29:30 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LyXl93Bhbz4xGM;
 Wed,  3 Aug 2022 23:29:25 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LyXl74gzBz4xGH;
 Wed,  3 Aug 2022 23:29:23 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 13/20] ppc/ppc405: QOM'ify OPBA
Date: Wed,  3 Aug 2022 15:28:37 +0200
Message-Id: <20220803132844.2370514-14-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220803132844.2370514-1-clg@kaod.org>
References: <20220803132844.2370514-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=fO70=YH=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h    | 12 ++++++++++++
 hw/ppc/ppc405_uc.c | 47 +++++++++++++++++++++++++++-------------------
 2 files changed, 40 insertions(+), 19 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 1c7fe07b8084..808662d81599 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -65,6 +65,17 @@ struct ppc4xx_bd_info_t {
 
 typedef struct Ppc405SoCState Ppc405SoCState;
 
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
@@ -219,6 +230,7 @@ struct Ppc405SoCState {
     Ppc405GpioState gpio;
     Ppc405DmaState dma;
     Ppc405EbcState ebc;
+    Ppc405OpbaState opba;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 0166f3fc36da..04f7af0f8f09 100644
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
@@ -1434,6 +1433,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
 
     object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
+
+    object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
 }
 
 static void ppc405_soc_realize(DeviceState *dev, Error **errp)
@@ -1478,7 +1479,10 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     ppc4xx_pob_init(env);
 
     /* OBP arbitrer */
-    ppc4xx_opba_init(0xef600600);
+   if (!sysbus_realize(SYS_BUS_DEVICE(&s->opba), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->opba), 0, 0xef600600);
 
     /* Universal interrupt controller */
     s->uic = qdev_new(TYPE_PPC_UIC);
@@ -1596,6 +1600,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_OPBA,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(Ppc405OpbaState),
+        .class_init     = ppc405_opba_class_init,
+    }, {
         .name           = TYPE_PPC405_EBC,
         .parent         = TYPE_DEVICE,
         .instance_size  = sizeof(Ppc405EbcState),
-- 
2.37.1


