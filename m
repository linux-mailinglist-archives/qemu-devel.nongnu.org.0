Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06BB59A2D7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:19:08 +0200 (CEST)
Received: from localhost ([::1]:60906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP5eG-0000fX-2G
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oP5Hq-000805-Ik; Fri, 19 Aug 2022 12:55:58 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:14296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oP5Ho-0000zv-BN; Fri, 19 Aug 2022 12:55:58 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DB24F747F1E;
 Fri, 19 Aug 2022 18:55:54 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A3F64747F1B; Fri, 19 Aug 2022 18:55:54 +0200 (CEST)
Message-Id: <a4205f42dbf34351ea0e27157538271069cb36c7.1660926381.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660926381.git.balaton@eik.bme.hu>
References: <cover.1660926381.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 15/20] ppc440_sdram: QOM'ify
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Aug 2022 18:55:54 +0200 (CEST)
X-Spam-Probability: 8%
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

Change the ppc440_sdram model to a QOM class derived from the
PPC4xx-dcr-device and name it ppc4xx-sdram-ddr2. This is mostly
modelling the DDR2 SDRAM controller found in the 460EX (used on the
sam460ex board). Newer SoCs (regardless of their PPC core, e.g. 405EX)
may have this controller but we only emulate enough of it for the
sam460ex u-boot firmware.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc440.h         |   2 -
 hw/ppc/ppc440_uc.c      | 115 +++++++++++++++++++++++++---------------
 hw/ppc/sam460ex.c       |   7 ++-
 include/hw/ppc/ppc4xx.h |  14 +++++
 4 files changed, 91 insertions(+), 47 deletions(-)

diff --git a/hw/ppc/ppc440.h b/hw/ppc/ppc440.h
index 29f6f14ed7..7c24db8504 100644
--- a/hw/ppc/ppc440.h
+++ b/hw/ppc/ppc440.h
@@ -16,8 +16,6 @@
 void ppc4xx_l2sram_init(CPUPPCState *env);
 void ppc4xx_cpr_init(CPUPPCState *env);
 void ppc4xx_sdr_init(CPUPPCState *env);
-void ppc440_sdram_init(CPUPPCState *env, int nbanks,
-                       MemoryRegion *ram);
 void ppc4xx_ahb_init(CPUPPCState *env);
 void ppc4xx_dma_init(CPUPPCState *env, int dcr_base);
 void ppc460ex_pcie_init(CPUPPCState *env);
diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index e77d56225d..a75a1748bd 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -483,13 +483,6 @@ void ppc4xx_sdr_init(CPUPPCState *env)
 
 /*****************************************************************************/
 /* SDRAM controller */
-typedef struct ppc440_sdram_t {
-    uint32_t addr;
-    uint32_t mcopt2;
-    int nbanks; /* Banks to use from the 4, e.g. when board has less slots */
-    Ppc4xxSdramBank bank[4];
-} ppc440_sdram_t;
-
 enum {
     SDRAM_R0BAS = 0x40,
     SDRAM_R1BAS,
@@ -578,7 +571,7 @@ static void sdram_bank_unmap(Ppc4xxSdramBank *bank)
     object_unparent(OBJECT(&bank->container));
 }
 
-static void sdram_ddr2_set_bcr(ppc440_sdram_t *sdram, int i,
+static void sdram_ddr2_set_bcr(Ppc4xxSdramDdr2State *sdram, int i,
                                uint32_t bcr, int enabled)
 {
     if (sdram->bank[i].bcr & 1) {
@@ -596,7 +589,7 @@ static void sdram_ddr2_set_bcr(ppc440_sdram_t *sdram, int i,
     }
 }
 
-static void sdram_ddr2_map_bcr(ppc440_sdram_t *sdram)
+static void sdram_ddr2_map_bcr(Ppc4xxSdramDdr2State *sdram)
 {
     int i;
 
@@ -611,7 +604,7 @@ static void sdram_ddr2_map_bcr(ppc440_sdram_t *sdram)
     }
 }
 
-static void sdram_ddr2_unmap_bcr(ppc440_sdram_t *sdram)
+static void sdram_ddr2_unmap_bcr(Ppc4xxSdramDdr2State *sdram)
 {
     int i;
 
@@ -624,7 +617,7 @@ static void sdram_ddr2_unmap_bcr(ppc440_sdram_t *sdram)
 
 static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
 {
-    ppc440_sdram_t *sdram = opaque;
+    Ppc4xxSdramDdr2State *sdram = opaque;
     uint32_t ret = 0;
 
     switch (dcrn) {
@@ -677,7 +670,7 @@ static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
 
 static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
 {
-    ppc440_sdram_t *sdram = opaque;
+    Ppc4xxSdramDdr2State *sdram = opaque;
 
     switch (dcrn) {
     case SDRAM_R0BAS:
@@ -719,52 +712,86 @@ static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
     }
 }
 
-static void sdram_ddr2_reset(void *opaque)
+static void ppc4xx_sdram_ddr2_reset(DeviceState *dev)
 {
-    ppc440_sdram_t *sdram = opaque;
+    Ppc4xxSdramDdr2State *sdram = PPC4xx_SDRAM_DDR2(dev);
 
     sdram->addr = 0;
     sdram->mcopt2 = 0;
 }
 
-void ppc440_sdram_init(CPUPPCState *env, int nbanks,
-                       MemoryRegion *ram)
+static void ppc4xx_sdram_ddr2_realize(DeviceState *dev, Error **errp)
 {
-    ppc440_sdram_t *s;
+    Ppc4xxSdramDdr2State *s = PPC4xx_SDRAM_DDR2(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
     const ram_addr_t valid_bank_sizes[] = {
         4 * GiB, 2 * GiB, 1 * GiB, 512 * MiB, 256 * MiB, 128 * MiB, 64 * MiB,
         32 * MiB, 16 * MiB, 8 * MiB, 0
     };
 
-    s = g_malloc0(sizeof(*s));
-    s->nbanks = nbanks;
-    ppc4xx_sdram_banks(ram, s->nbanks, s->bank, valid_bank_sizes);
-    qemu_register_reset(&sdram_ddr2_reset, s);
-    ppc_dcr_register(env, SDRAM0_CFGADDR,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc_dcr_register(env, SDRAM0_CFGDATA,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-
-    ppc_dcr_register(env, SDRAM_R0BAS,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc_dcr_register(env, SDRAM_R1BAS,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc_dcr_register(env, SDRAM_R2BAS,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc_dcr_register(env, SDRAM_R3BAS,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc_dcr_register(env, SDRAM_CONF1HB,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc_dcr_register(env, SDRAM_PLBADDULL,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc_dcr_register(env, SDRAM_CONF1LL,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc_dcr_register(env, SDRAM_CONFPATHB,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc_dcr_register(env, SDRAM_PLBADDUHB,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
+    if (s->nbanks < 1 || s->nbanks > 4) {
+        error_setg(errp, "Invalid number of RAM banks");
+        return;
+    }
+    if (!s->dram_mr) {
+        error_setg(errp, "Missing dram memory region");
+        return;
+    }
+    ppc4xx_sdram_banks(s->dram_mr, s->nbanks, s->bank, valid_bank_sizes);
+
+    ppc4xx_dcr_register(dcr, SDRAM0_CFGADDR,
+                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
+    ppc4xx_dcr_register(dcr, SDRAM0_CFGDATA,
+                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
+
+    ppc4xx_dcr_register(dcr, SDRAM_R0BAS,
+                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
+    ppc4xx_dcr_register(dcr, SDRAM_R1BAS,
+                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
+    ppc4xx_dcr_register(dcr, SDRAM_R2BAS,
+                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
+    ppc4xx_dcr_register(dcr, SDRAM_R3BAS,
+                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
+    ppc4xx_dcr_register(dcr, SDRAM_CONF1HB,
+                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
+    ppc4xx_dcr_register(dcr, SDRAM_PLBADDULL,
+                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
+    ppc4xx_dcr_register(dcr, SDRAM_CONF1LL,
+                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
+    ppc4xx_dcr_register(dcr, SDRAM_CONFPATHB,
+                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
+    ppc4xx_dcr_register(dcr, SDRAM_PLBADDUHB,
+                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
+}
+
+static Property ppc4xx_sdram_ddr2_props[] = {
+    DEFINE_PROP_LINK("dram", Ppc4xxSdramDdr2State, dram_mr, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
+    DEFINE_PROP_UINT32("nbanks", Ppc4xxSdramDdr2State, nbanks, 4),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ppc4xx_sdram_ddr2_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc4xx_sdram_ddr2_realize;
+    dc->reset = ppc4xx_sdram_ddr2_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
+    device_class_set_props(dc, ppc4xx_sdram_ddr2_props);
 }
 
+static const TypeInfo ppc4xx_types[] = {
+    {
+        .name           = TYPE_PPC4xx_SDRAM_DDR2,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc4xxSdramDdr2State),
+        .class_init     = ppc4xx_sdram_ddr2_class_init,
+    }
+};
+DEFINE_TYPES(ppc4xx_types)
+
 /*****************************************************************************/
 /* PLB to AHB bridge */
 enum {
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 9b850808a3..ea06b099b2 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -342,11 +342,16 @@ static void sam460ex_init(MachineState *machine)
         error_report("Memory below 64 MiB is not supported");
         exit(1);
     }
+    dev = qdev_new(TYPE_PPC4xx_SDRAM_DDR2);
+    object_property_set_link(OBJECT(dev), "dram", OBJECT(machine->ram),
+                             &error_abort);
     /*
      * Put all RAM on first bank because board has one slot
      * and firmware only checks that
      */
-    ppc440_sdram_init(env, 1, machine->ram);
+    object_property_set_int(OBJECT(dev), "nbanks", 1, &error_abort);
+    ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
+    object_unref(OBJECT(dev));
     /* FIXME: does 460EX have ECC interrupts? */
     /* Enable SDRAM memory regions as we may boot without firmware */
     if (ppc_dcr_write(env->dcr_env, SDRAM0_CFGADDR, 0x21) ||
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index 20d0cdde8a..7d3cfa7ad6 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -139,4 +139,18 @@ struct Ppc4xxSdramDdrState {
     uint32_t eccesr;
 };
 
+/* SDRAM DDR2 controller */
+#define TYPE_PPC4xx_SDRAM_DDR2 "ppc4xx-sdram-ddr2"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxSdramDdr2State, PPC4xx_SDRAM_DDR2);
+struct Ppc4xxSdramDdr2State {
+    Ppc4xxDcrDeviceState parent_obj;
+
+    MemoryRegion *dram_mr;
+    uint32_t nbanks; /* Banks to use from 4, e.g. when board has less slots */
+    Ppc4xxSdramBank bank[4];
+
+    uint32_t addr;
+    uint32_t mcopt2;
+};
+
 #endif /* PPC4XX_H */
-- 
2.30.4


