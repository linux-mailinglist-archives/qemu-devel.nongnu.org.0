Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E5C58DBAB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 18:10:42 +0200 (CEST)
Received: from localhost ([::1]:58632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLRoX-0002Vp-F7
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 12:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uImW=YN=kaod.org=clg@ozlabs.org>)
 id 1oLRL4-0004ml-P1; Tue, 09 Aug 2022 11:40:15 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:51723
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uImW=YN=kaod.org=clg@ozlabs.org>)
 id 1oLRL2-0004SK-7N; Tue, 09 Aug 2022 11:40:14 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4M2HMH1sk5z4xXn;
 Wed, 10 Aug 2022 01:40:11 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4M2HMF1dS9z4xTv;
 Wed, 10 Aug 2022 01:40:08 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 23/24] ppc/ppc405: QOM'ify SDRAM
Date: Tue,  9 Aug 2022 17:39:03 +0200
Message-Id: <20220809153904.485018-24-clg@kaod.org>
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

This is an initial change of the SDRAM controller preserving the
compatibility with the current modeling. Further cleanup will be
possible after conversion of the ppc4xx_sdram_banks() and
ppc4xx_sdram_init() routines of the sam460ex and bamboo machines.

The size and base address of the RAM banks are now set using QOM
property arrays. RAM is equally distributed on each bank at the SoC
level depending on the number of banks we want to initialize (default
is 2). Each RAM memory region representing a RAM bank is initialized
in the realize routine of the SDRAM model after a minimal check on the
RAM size value with the sdram_bcr() routine. This has the benefit of
reporting an error to the user if the requested RAM size is invalid
for the SDRAM controller.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h         |   6 +--
 include/hw/ppc/ppc4xx.h |  32 ++++++++++++
 hw/ppc/ppc405_uc.c      |  34 ++++++++----
 hw/ppc/ppc4xx_devs.c    | 113 ++++++++++++++++++++++++++++------------
 4 files changed, 140 insertions(+), 45 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 56881b181ba1..8c19d167391c 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -228,12 +228,9 @@ struct Ppc405SoCState {
     DeviceState parent_obj;
 
     /* Public */
-    MemoryRegion ram_banks[2];
-    hwaddr ram_bases[2], ram_sizes[2];
-    bool do_dram_init;
-
     MemoryRegion *dram_mr;
     hwaddr ram_size;
+    uint32_t nr_banks;
 
     PowerPCCPU cpu;
     PPCUIC uic;
@@ -241,6 +238,7 @@ struct Ppc405SoCState {
     Ppc405GptState gpt;
     Ppc405OcmState ocm;
     Ppc405GpioState gpio;
+    Ppc4xxSdramState sdram;
     Ppc405DmaState dma;
     PPC4xxI2CState i2c;
     Ppc405EbcState ebc;
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index acd096cb2394..b841f6600b55 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -87,4 +87,36 @@ struct Ppc4xxMalState {
 void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
                      qemu_irq irqs[4]);
 
+/* SDRAM controller */
+#define TYPE_PPC4xx_SDRAM "ppc4xx-sdram"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxSdramState, PPC4xx_SDRAM);
+struct Ppc4xxSdramState {
+    Ppc4xxDcrDeviceState parent_obj;
+
+    MemoryRegion *dram_mr;
+    bool dram_init;
+
+    MemoryRegion containers[4]; /* used for clipping */
+    MemoryRegion *ram_memories;
+    hwaddr *ram_bases;
+    hwaddr *ram_sizes;
+    uint32_t nb_ram_bases;
+    uint32_t nb_ram_sizes;
+    uint32_t nbanks; /* Redundant */
+
+    uint32_t addr;
+    uint32_t besr0;
+    uint32_t besr1;
+    uint32_t bear;
+    uint32_t cfg;
+    uint32_t status;
+    uint32_t rtr;
+    uint32_t pmit;
+    uint32_t bcr[4];
+    uint32_t tr;
+    uint32_t ecccfg;
+    uint32_t eccesr;
+    qemu_irq irq;
+};
+
 #endif /* PPC4XX_H */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 1045f5f13e6c..fe0c92ba0d54 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1361,6 +1361,9 @@ static void ppc405_soc_instance_init(Object *obj)
 
     object_initialize_child(obj, "gpio", &s->gpio, TYPE_PPC405_GPIO);
 
+    object_initialize_child(obj, "sdram", &s->sdram, TYPE_PPC4xx_SDRAM);
+    object_property_add_alias(obj, "dram-init", OBJECT(&s->sdram), "dram-init");
+
     object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
 
     object_initialize_child(obj, "i2c", &s->i2c, TYPE_PPC4xx_I2C);
@@ -1432,15 +1435,28 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 
     /* SDRAM controller */
         /* XXX 405EP has no ECC interrupt */
-    s->ram_bases[0] = 0;
-    s->ram_sizes[0] = s->ram_size;
-    memory_region_init_alias(&s->ram_banks[0], OBJECT(s),
-                             "ppc405.sdram0", s->dram_mr,
-                             s->ram_bases[0], s->ram_sizes[0]);
+    object_property_set_link(OBJECT(&s->sdram), "dram", OBJECT(s->dram_mr),
+                             &error_abort);
+
+    qdev_prop_set_uint32(DEVICE(&s->sdram), "len-ram-sizes", s->nr_banks);
+    qdev_prop_set_uint32(DEVICE(&s->sdram), "len-ram-bases", s->nr_banks);
 
-    ppc4xx_sdram_init(env, qdev_get_gpio_in(DEVICE(&s->uic), 17), 1,
-                      s->ram_banks, s->ram_bases, s->ram_sizes,
-                      s->do_dram_init);
+    for (i = 0; i < s->nr_banks; i++) {
+        char name[32];
+        snprintf(name, sizeof(name), "ram-bases[%d]", i);
+        qdev_prop_set_uint32(DEVICE(&s->sdram), name,
+                             i * s->ram_size / s->nr_banks);
+
+        snprintf(name, sizeof(name), "ram-sizes[%d]", i);
+        qdev_prop_set_uint32(DEVICE(&s->sdram), name,
+                             s->ram_size / s->nr_banks);
+    }
+
+    if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->sdram), &s->cpu, errp)) {
+        return;
+    }
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdram), 0,
+                       qdev_get_gpio_in(DEVICE(&s->uic), 17));
 
     /* External bus controller */
     if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->ebc), &s->cpu, errp)) {
@@ -1520,7 +1536,7 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 static Property ppc405_soc_properties[] = {
     DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
-    DEFINE_PROP_BOOL("dram-init", Ppc405SoCState, do_dram_init, 0),
+    DEFINE_PROP_UINT32("nr-banks", Ppc405SoCState, nr_banks, 2),
     DEFINE_PROP_UINT64("ram-size", Ppc405SoCState, ram_size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index c06c20b195cd..a9ceea13f218 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -39,28 +39,6 @@
 
 /*****************************************************************************/
 /* SDRAM controller */
-typedef struct ppc4xx_sdram_t ppc4xx_sdram_t;
-struct ppc4xx_sdram_t {
-    uint32_t addr;
-    int nbanks;
-    MemoryRegion containers[4]; /* used for clipping */
-    MemoryRegion *ram_memories;
-    hwaddr ram_bases[4];
-    hwaddr ram_sizes[4];
-    uint32_t besr0;
-    uint32_t besr1;
-    uint32_t bear;
-    uint32_t cfg;
-    uint32_t status;
-    uint32_t rtr;
-    uint32_t pmit;
-    uint32_t bcr[4];
-    uint32_t tr;
-    uint32_t ecccfg;
-    uint32_t eccesr;
-    qemu_irq irq;
-};
-
 enum {
     SDRAM0_CFGADDR = 0x010,
     SDRAM0_CFGDATA = 0x011,
@@ -128,7 +106,7 @@ static target_ulong sdram_size (uint32_t bcr)
     return size;
 }
 
-static void sdram_set_bcr(ppc4xx_sdram_t *sdram, int i,
+static void sdram_set_bcr(Ppc4xxSdramState *sdram, int i,
                           uint32_t bcr, int enabled)
 {
     if (sdram->bcr[i] & 0x00000001) {
@@ -154,7 +132,7 @@ static void sdram_set_bcr(ppc4xx_sdram_t *sdram, int i,
     }
 }
 
-static void sdram_map_bcr (ppc4xx_sdram_t *sdram)
+static void sdram_map_bcr(Ppc4xxSdramState *sdram)
 {
     int i;
 
@@ -168,7 +146,7 @@ static void sdram_map_bcr (ppc4xx_sdram_t *sdram)
     }
 }
 
-static void sdram_unmap_bcr (ppc4xx_sdram_t *sdram)
+static void sdram_unmap_bcr(Ppc4xxSdramState *sdram)
 {
     int i;
 
@@ -182,7 +160,7 @@ static void sdram_unmap_bcr (ppc4xx_sdram_t *sdram)
 
 static uint32_t dcr_read_sdram (void *opaque, int dcrn)
 {
-    ppc4xx_sdram_t *sdram;
+    Ppc4xxSdramState *sdram;
     uint32_t ret;
 
     sdram = opaque;
@@ -250,7 +228,7 @@ static uint32_t dcr_read_sdram (void *opaque, int dcrn)
 
 static void dcr_write_sdram (void *opaque, int dcrn, uint32_t val)
 {
-    ppc4xx_sdram_t *sdram;
+    Ppc4xxSdramState *sdram;
 
     sdram = opaque;
     switch (dcrn) {
@@ -329,11 +307,10 @@ static void dcr_write_sdram (void *opaque, int dcrn, uint32_t val)
     }
 }
 
-static void sdram_reset (void *opaque)
+static void ppc4xx_sdram_reset(DeviceState *dev)
 {
-    ppc4xx_sdram_t *sdram;
+    Ppc4xxSdramState *sdram = (Ppc4xxSdramState *) dev;
 
-    sdram = opaque;
     sdram->addr = 0x00000000;
     sdram->bear = 0x00000000;
     sdram->besr0 = 0x00000000; /* No error */
@@ -349,21 +326,88 @@ static void sdram_reset (void *opaque)
     sdram->cfg = 0x00800000;
 }
 
+static void sdram_reset(void *opaque)
+{
+    ppc4xx_sdram_reset(opaque);
+}
+
+static void ppc4xx_sdram_realize(DeviceState *dev, Error **errp)
+{
+    Ppc4xxSdramState *s = PPC4xx_SDRAM(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
+    int i;
+
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
+
+    ppc4xx_dcr_register(dcr, SDRAM0_CFGADDR, &dcr_read_sdram, &dcr_write_sdram);
+    ppc4xx_dcr_register(dcr, SDRAM0_CFGDATA, &dcr_read_sdram, &dcr_write_sdram);
+
+    if (!s->nb_ram_bases || s->nb_ram_bases != s->nb_ram_sizes) {
+        error_setg(errp, "Invalid number of RAM banks");
+        return;
+    }
+
+    s->ram_memories = g_new0(MemoryRegion, s->nb_ram_bases);
+    for (i = 0; i < s->nb_ram_bases; i++) {
+        g_autofree char *name = g_strdup_printf(TYPE_PPC4xx_SDRAM "%d", i);
+
+        if (!sdram_bcr(s->ram_bases[i], s->ram_sizes[i])) {
+            error_setg(errp, "Invalid RAM size 0x%" HWADDR_PRIx,
+                       s->ram_sizes[i]);
+            return;
+        }
+
+        memory_region_init_alias(&s->ram_memories[i], OBJECT(s), name,
+                                 s->dram_mr, s->ram_bases[i], s->ram_sizes[i]);
+    }
+
+    s->nbanks = s->nb_ram_sizes;
+    if (s->dram_init) {
+        sdram_map_bcr(s);
+    }
+}
+
+static Property ppc4xx_sdram_properties[] = {
+    DEFINE_PROP_LINK("dram", Ppc4xxSdramState, dram_mr, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
+    DEFINE_PROP_BOOL("dram-init", Ppc4xxSdramState, dram_init, false),
+    DEFINE_PROP_ARRAY("ram-sizes", Ppc4xxSdramState, nb_ram_sizes,
+                      ram_sizes, qdev_prop_uint64, uint64_t),
+    DEFINE_PROP_ARRAY("ram-bases", Ppc4xxSdramState, nb_ram_bases,
+                      ram_bases, qdev_prop_uint64, uint64_t),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ppc4xx_sdram_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc4xx_sdram_realize;
+    dc->user_creatable = false;
+    dc->reset = ppc4xx_sdram_reset;
+    device_class_set_props(dc, ppc4xx_sdram_properties);
+}
+
 void ppc4xx_sdram_init (CPUPPCState *env, qemu_irq irq, int nbanks,
                         MemoryRegion *ram_memories,
                         hwaddr *ram_bases,
                         hwaddr *ram_sizes,
                         int do_init)
 {
-    ppc4xx_sdram_t *sdram;
+    Ppc4xxSdramState *sdram;
 
-    sdram = g_new0(ppc4xx_sdram_t, 1);
+    sdram = g_new0(Ppc4xxSdramState, 1);
     sdram->irq = irq;
     sdram->nbanks = nbanks;
     sdram->ram_memories = ram_memories;
+
+    sdram->ram_bases = g_new0(hwaddr, 4);
+
     memset(sdram->ram_bases, 0, 4 * sizeof(hwaddr));
     memcpy(sdram->ram_bases, ram_bases,
            nbanks * sizeof(hwaddr));
+
+    sdram->ram_sizes = g_new0(hwaddr, 4);
     memset(sdram->ram_sizes, 0, 4 * sizeof(hwaddr));
     memcpy(sdram->ram_sizes, ram_sizes,
            nbanks * sizeof(hwaddr));
@@ -683,6 +727,11 @@ static void ppc4xx_dcr_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc4xx_types[] = {
     {
+        .name           = TYPE_PPC4xx_SDRAM,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc4xxSdramState),
+        .class_init     = ppc4xx_sdram_class_init,
+    }, {
         .name           = TYPE_PPC4xx_MAL,
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
         .instance_size  = sizeof(Ppc4xxMalState),
-- 
2.37.1


