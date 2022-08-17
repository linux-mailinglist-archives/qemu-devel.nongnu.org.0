Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276515972CF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 17:20:37 +0200 (CEST)
Received: from localhost ([::1]:57172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOKqS-00076i-A1
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 11:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKeu-0004mh-JD; Wed, 17 Aug 2022 11:08:41 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:43867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKeg-0002rD-JE; Wed, 17 Aug 2022 11:08:40 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 497DB74763E;
 Wed, 17 Aug 2022 17:08:23 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2030A74763C; Wed, 17 Aug 2022 17:08:23 +0200 (CEST)
Message-Id: <e95d7849f3768e1f9a2846c4b282392750678b3e.1660746880.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660746880.git.balaton@eik.bme.hu>
References: <cover.1660746880.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 05/31] ppc/ppc405: QOM'ify GPIO
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
Date: Wed, 17 Aug 2022 17:08:23 +0200 (CEST)
X-Spam-Probability: 11%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
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

The GPIO controller is currently modeled as a simple SysBus device
with a unique memory region.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
[balaton: Simplify sysbus device casts for readability]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc405.h     | 21 +++++++++++++++++++
 hw/ppc/ppc405_uc.c  | 50 ++++++++++++++++++++++-----------------------
 hw/ppc/trace-events |  1 -
 3 files changed, 45 insertions(+), 27 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index a5b493d3e7..21f6cb3585 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,6 +63,26 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
 };
 
+/* GPIO */
+#define TYPE_PPC405_GPIO "ppc405-gpio"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405GpioState, PPC405_GPIO);
+struct Ppc405GpioState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion io;
+    uint32_t or;
+    uint32_t tcr;
+    uint32_t osrh;
+    uint32_t osrl;
+    uint32_t tsrh;
+    uint32_t tsrl;
+    uint32_t odr;
+    uint32_t ir;
+    uint32_t rr1;
+    uint32_t isr1h;
+    uint32_t isr1l;
+};
+
 /* On Chip Memory */
 #define TYPE_PPC405_OCM "ppc405-ocm"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405OcmState, PPC405_OCM);
@@ -152,6 +172,7 @@ struct Ppc405SoCState {
     Ppc405CpcState cpc;
     Ppc405GptState gpt;
     Ppc405OcmState ocm;
+    Ppc405GpioState gpio;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 2282cfcd18..7ed3cf7149 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -714,22 +714,6 @@ static void ppc405_dma_init(CPUPPCState *env, qemu_irq irqs[4])
 
 /*****************************************************************************/
 /* GPIO */
-typedef struct ppc405_gpio_t ppc405_gpio_t;
-struct ppc405_gpio_t {
-    MemoryRegion io;
-    uint32_t or;
-    uint32_t tcr;
-    uint32_t osrh;
-    uint32_t osrl;
-    uint32_t tsrh;
-    uint32_t tsrl;
-    uint32_t odr;
-    uint32_t ir;
-    uint32_t rr1;
-    uint32_t isr1h;
-    uint32_t isr1l;
-};
-
 static uint64_t ppc405_gpio_read(void *opaque, hwaddr addr, unsigned size)
 {
     trace_ppc405_gpio_read(addr, size);
@@ -748,20 +732,22 @@ static const MemoryRegionOps ppc405_gpio_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void ppc405_gpio_reset (void *opaque)
+static void ppc405_gpio_realize(DeviceState *dev, Error **errp)
 {
+    Ppc405GpioState *s = PPC405_GPIO(dev);
+
+    memory_region_init_io(&s->io, OBJECT(s), &ppc405_gpio_ops, s, "gpio",
+                          0x38);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->io);
 }
 
-static void ppc405_gpio_init(hwaddr base)
+static void ppc405_gpio_class_init(ObjectClass *oc, void *data)
 {
-    ppc405_gpio_t *gpio;
-
-    trace_ppc405_gpio_init(base);
+    DeviceClass *dc = DEVICE_CLASS(oc);
 
-    gpio = g_new0(ppc405_gpio_t, 1);
-    memory_region_init_io(&gpio->io, NULL, &ppc405_gpio_ops, gpio, "pgio", 0x038);
-    memory_region_add_subregion(get_system_memory(), base, &gpio->io);
-    qemu_register_reset(&ppc405_gpio_reset, gpio);
+    dc->realize = ppc405_gpio_realize;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
 }
 
 /*****************************************************************************/
@@ -1411,6 +1397,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "gpt", &s->gpt, TYPE_PPC405_GPT);
 
     object_initialize_child(obj, "ocm", &s->ocm, TYPE_PPC405_OCM);
+
+    object_initialize_child(obj, "gpio", &s->gpio, TYPE_PPC405_GPIO);
 }
 
 static void ppc405_reset(void *opaque)
@@ -1489,8 +1477,13 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     /* I2C controller */
     sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
                          qdev_get_gpio_in(s->uic, 2));
+
     /* GPIO */
-    ppc405_gpio_init(0xef600700);
+    sbd = SYS_BUS_DEVICE(&s->gpio);
+    if (!sysbus_realize(sbd, errp)) {
+        return;
+    }
+    sysbus_mmio_map(sbd, 0, 0xef600700);
 
     /* Serial ports */
     if (serial_hd(0) != NULL) {
@@ -1552,6 +1545,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_GPIO,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(Ppc405GpioState),
+        .class_init     = ppc405_gpio_class_init,
+    }, {
         .name           = TYPE_PPC405_OCM,
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
         .instance_size  = sizeof(Ppc405OcmState),
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index 8d35521bf7..69a95f9f57 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -165,7 +165,6 @@ opba_init(uint64_t addr) "offet 0x%" PRIx64
 
 ppc405_gpio_read(uint64_t addr, uint32_t size) "addr 0x%" PRIx64 " size %d"
 ppc405_gpio_write(uint64_t addr, uint32_t size, uint64_t val) "addr 0x%" PRIx64 " size %d = 0x%" PRIx64
-ppc405_gpio_init(uint64_t addr) "offet 0x%" PRIx64
 
 ocm_update_mappings(uint32_t isarc, uint32_t isacntl, uint32_t dsarc, uint32_t dsacntl, uint32_t ocm_isarc, uint32_t ocm_isacntl, uint32_t ocm_dsarc, uint32_t ocm_dsacntl) "OCM update ISA 0x%08" PRIx32 " 0x%08" PRIx32 " (0x%08" PRIx32" 0x%08" PRIx32 ") DSA 0x%08" PRIx32 " 0x%08" PRIx32" (0x%08" PRIx32 " 0x%08" PRIx32 ")"
 ocm_map(const char* prefix, uint32_t isarc) "OCM map %s 0x%08" PRIx32
-- 
2.30.4


