Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2986588D7E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 15:44:31 +0200 (CEST)
Received: from localhost ([::1]:60500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJEfm-00014v-O8
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 09:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fO70=YH=kaod.org=clg@ozlabs.org>)
 id 1oJER4-0002hP-5v; Wed, 03 Aug 2022 09:29:18 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:57147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fO70=YH=kaod.org=clg@ozlabs.org>)
 id 1oJER0-0000X7-TW; Wed, 03 Aug 2022 09:29:17 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LyXkx6h3fz4xGC;
 Wed,  3 Aug 2022 23:29:13 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LyXkw14Fmz4x1Y;
 Wed,  3 Aug 2022 23:29:11 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 08/20] ppc/ppc405: QOM'ify GPT
Date: Wed,  3 Aug 2022 15:28:32 +0200
Message-Id: <20220803132844.2370514-9-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220803132844.2370514-1-clg@kaod.org>
References: <20220803132844.2370514-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=fO70=YH=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
 hw/ppc/ppc405.h    | 22 ++++++++++++
 hw/ppc/ppc405_uc.c | 90 +++++++++++++++++++++++-----------------------
 2 files changed, 67 insertions(+), 45 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 88c63774d9ba..b8b662c0f7d1 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -65,6 +65,27 @@ struct ppc4xx_bd_info_t {
 
 typedef struct Ppc405SoCState Ppc405SoCState;
 
+/* General purpose timers */
+#define TYPE_PPC405_GPT "ppc405-gpt"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405GptState, PPC405_GPT);
+struct Ppc405GptState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+
+    int64_t tb_offset;
+    uint32_t tb_freq;
+    QEMUTimer *timer;
+    qemu_irq irqs[5];
+    uint32_t oe;
+    uint32_t ol;
+    uint32_t im;
+    uint32_t is;
+    uint32_t ie;
+    uint32_t comp[5];
+    uint32_t mask[5];
+};
+
 #define TYPE_PPC405_CPC "ppc405-cpc"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405CpcState, PPC405_CPC);
 
@@ -119,6 +140,7 @@ struct Ppc405SoCState {
     PowerPCCPU cpu;
     DeviceState *uic;
     Ppc405CpcState cpc;
+    Ppc405GptState gpt;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 32bfc9480bc6..71efcf087c9a 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -926,34 +926,18 @@ static void ppc405_ocm_init(CPUPPCState *env)
 
 /*****************************************************************************/
 /* General purpose timers */
-typedef struct ppc4xx_gpt_t ppc4xx_gpt_t;
-struct ppc4xx_gpt_t {
-    MemoryRegion iomem;
-    int64_t tb_offset;
-    uint32_t tb_freq;
-    QEMUTimer *timer;
-    qemu_irq irqs[5];
-    uint32_t oe;
-    uint32_t ol;
-    uint32_t im;
-    uint32_t is;
-    uint32_t ie;
-    uint32_t comp[5];
-    uint32_t mask[5];
-};
-
-static int ppc4xx_gpt_compare (ppc4xx_gpt_t *gpt, int n)
+static int ppc4xx_gpt_compare(Ppc405GptState *gpt, int n)
 {
     /* XXX: TODO */
     return 0;
 }
 
-static void ppc4xx_gpt_set_output (ppc4xx_gpt_t *gpt, int n, int level)
+static void ppc4xx_gpt_set_output(Ppc405GptState *gpt, int n, int level)
 {
     /* XXX: TODO */
 }
 
-static void ppc4xx_gpt_set_outputs (ppc4xx_gpt_t *gpt)
+static void ppc4xx_gpt_set_outputs(Ppc405GptState *gpt)
 {
     uint32_t mask;
     int i;
@@ -974,7 +958,7 @@ static void ppc4xx_gpt_set_outputs (ppc4xx_gpt_t *gpt)
     }
 }
 
-static void ppc4xx_gpt_set_irqs (ppc4xx_gpt_t *gpt)
+static void ppc4xx_gpt_set_irqs(Ppc405GptState *gpt)
 {
     uint32_t mask;
     int i;
@@ -989,14 +973,14 @@ static void ppc4xx_gpt_set_irqs (ppc4xx_gpt_t *gpt)
     }
 }
 
-static void ppc4xx_gpt_compute_timer (ppc4xx_gpt_t *gpt)
+static void ppc4xx_gpt_compute_timer(Ppc405GptState *gpt)
 {
     /* XXX: TODO */
 }
 
 static uint64_t ppc4xx_gpt_read(void *opaque, hwaddr addr, unsigned size)
 {
-    ppc4xx_gpt_t *gpt = opaque;
+    Ppc405GptState *gpt = PPC405_GPT(opaque);
     uint32_t ret;
     int idx;
 
@@ -1050,7 +1034,7 @@ static uint64_t ppc4xx_gpt_read(void *opaque, hwaddr addr, unsigned size)
 static void ppc4xx_gpt_write(void *opaque, hwaddr addr, uint64_t value,
                              unsigned size)
 {
-    ppc4xx_gpt_t *gpt = opaque;
+    Ppc405GptState *gpt = PPC405_GPT(opaque);
     int idx;
 
     trace_ppc4xx_gpt_write(addr, size, value);
@@ -1116,20 +1100,18 @@ static const MemoryRegionOps gpt_ops = {
 
 static void ppc4xx_gpt_cb (void *opaque)
 {
-    ppc4xx_gpt_t *gpt;
+    Ppc405GptState *gpt = PPC405_GPT(opaque);
 
-    gpt = opaque;
     ppc4xx_gpt_set_irqs(gpt);
     ppc4xx_gpt_set_outputs(gpt);
     ppc4xx_gpt_compute_timer(gpt);
 }
 
-static void ppc4xx_gpt_reset (void *opaque)
+static void ppc405_gpt_reset(DeviceState *dev)
 {
-    ppc4xx_gpt_t *gpt;
+    Ppc405GptState *gpt = PPC405_GPT(dev);
     int i;
 
-    gpt = opaque;
     timer_del(gpt->timer);
     gpt->oe = 0x00000000;
     gpt->ol = 0x00000000;
@@ -1142,21 +1124,28 @@ static void ppc4xx_gpt_reset (void *opaque)
     }
 }
 
-static void ppc4xx_gpt_init(hwaddr base, qemu_irq irqs[5])
+static void ppc405_gpt_realize(DeviceState *dev, Error **errp)
 {
-    ppc4xx_gpt_t *gpt;
+    Ppc405GptState *s = PPC405_GPT(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     int i;
 
-    trace_ppc4xx_gpt_init(base);
+    s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &ppc4xx_gpt_cb, s);
+    memory_region_init_io(&s->iomem, OBJECT(s), &gpt_ops, s, "gpt", 0x0d4);
+    sysbus_init_mmio(sbd, &s->iomem);
 
-    gpt = g_new0(ppc4xx_gpt_t, 1);
-    for (i = 0; i < 5; i++) {
-        gpt->irqs[i] = irqs[i];
+    for (i = 0; i < ARRAY_SIZE(s->irqs); i++) {
+        sysbus_init_irq(sbd, &s->irqs[i]);
     }
-    gpt->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &ppc4xx_gpt_cb, gpt);
-    memory_region_init_io(&gpt->iomem, NULL, &gpt_ops, gpt, "gpt", 0x0d4);
-    memory_region_add_subregion(get_system_memory(), base, &gpt->iomem);
-    qemu_register_reset(ppc4xx_gpt_reset, gpt);
+}
+
+static void ppc405_gpt_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_gpt_realize;
+    dc->user_creatable = false;
+    dc->reset = ppc405_gpt_reset;
 }
 
 /*****************************************************************************/
@@ -1422,14 +1411,17 @@ static void ppc405_soc_instance_init(Object *obj)
 
     object_initialize_child(obj, "cpc", &s->cpc, TYPE_PPC405_CPC);
     object_property_add_alias(obj, "sys-clk", OBJECT(&s->cpc), "sys-clk");
+
+    object_initialize_child(obj, "gpt", &s->gpt, TYPE_PPC405_GPT);
 }
 
 static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 {
     Ppc405SoCState *s = PPC405_SOC(dev);
-    qemu_irq dma_irqs[4], gpt_irqs[5], mal_irqs[4];
+    qemu_irq dma_irqs[4], mal_irqs[4];
     CPUPPCState *env;
     Error *err = NULL;
+    int i;
 
     /* allocate SRAM */
     memory_region_init_ram(&s->sram, OBJECT(s), "ppc405.sram",
@@ -1526,12 +1518,15 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     ppc405_ocm_init(env);
 
     /* GPT */
-    gpt_irqs[0] = qdev_get_gpio_in(s->uic, 19);
-    gpt_irqs[1] = qdev_get_gpio_in(s->uic, 20);
-    gpt_irqs[2] = qdev_get_gpio_in(s->uic, 21);
-    gpt_irqs[3] = qdev_get_gpio_in(s->uic, 22);
-    gpt_irqs[4] = qdev_get_gpio_in(s->uic, 23);
-    ppc4xx_gpt_init(0xef600000, gpt_irqs);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpt), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpt), 0, 0xef600000);
+
+    for (i = 0; i < ARRAY_SIZE(s->gpt.irqs); i++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpt), i,
+                           qdev_get_gpio_in(s->uic, 19 + i));
+    }
 
     /* MAL */
     mal_irqs[0] = qdev_get_gpio_in(s->uic, 11);
@@ -1563,6 +1558,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_GPT,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(Ppc405GptState),
+        .class_init     = ppc405_gpt_class_init,
+    }, {
         .name           = TYPE_PPC405_CPC,
         .parent         = TYPE_DEVICE,
         .instance_size  = sizeof(Ppc405CpcState),
-- 
2.37.1


