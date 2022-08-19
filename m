Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C0C59A2E6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:30:14 +0200 (CEST)
Received: from localhost ([::1]:52928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP5oz-0002ny-EU
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oP5ID-0000N7-Q2; Fri, 19 Aug 2022 12:56:21 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:14301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oP5I9-00010M-Bq; Fri, 19 Aug 2022 12:56:21 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E75BB747F32;
 Fri, 19 Aug 2022 18:55:55 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B064B747F1B; Fri, 19 Aug 2022 18:55:55 +0200 (CEST)
Message-Id: <fef3a6c066b6dcd6cb9ff64510ec0969fbc6dba5.1660926381.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660926381.git.balaton@eik.bme.hu>
References: <cover.1660926381.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 16/20] ppc4xx_sdram: Move ppc4xx DDR and DDR2 SDRAM controller
 models together
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Aug 2022 18:55:55 +0200 (CEST)
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

Move the PPC4xx DDR and DDR2 SDRAM contrller models into a new file
called ppc4xx_sdram to separate from other device models and put them
in one place allowing sharing some code between them.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/meson.build      |   3 +-
 hw/ppc/ppc440_uc.c      | 321 -----------------
 hw/ppc/ppc4xx_devs.c    | 403 ---------------------
 hw/ppc/ppc4xx_sdram.c   | 752 ++++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/ppc4xx.h |  34 +-
 5 files changed, 771 insertions(+), 742 deletions(-)
 create mode 100644 hw/ppc/ppc4xx_sdram.c

diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
index 62801923f3..74720dd1e1 100644
--- a/hw/ppc/meson.build
+++ b/hw/ppc/meson.build
@@ -59,8 +59,9 @@ ppc_ss.add(when: 'CONFIG_PPC440', if_true: files(
   'ppc440_bamboo.c',
   'ppc440_pcix.c', 'ppc440_uc.c'))
 ppc_ss.add(when: 'CONFIG_PPC4XX', if_true: files(
+  'ppc4xx_devs.c',
   'ppc4xx_pci.c',
-  'ppc4xx_devs.c'))
+  'ppc4xx_sdram.c'))
 ppc_ss.add(when: 'CONFIG_SAM460EX', if_true: files('sam460ex.c'))
 # PReP
 ppc_ss.add(when: 'CONFIG_PREP', if_true: files('prep.c'))
diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index a75a1748bd..651263926e 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -10,20 +10,14 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
-#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
-#include "qemu/module.h"
 #include "hw/irq.h"
-#include "exec/memory.h"
 #include "hw/ppc/ppc4xx.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci/pci.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/reset.h"
 #include "ppc440.h"
-#include "qom/object.h"
-#include "trace.h"
 
 /*****************************************************************************/
 /* L2 Cache as SRAM */
@@ -379,10 +373,6 @@ enum {
     PESDR1_RSTSTA = 0x365,
 };
 
-#define SDR0_DDR0_DDRM_ENCODE(n)  ((((unsigned long)(n)) & 0x03) << 29)
-#define SDR0_DDR0_DDRM_DDR1       0x20000000
-#define SDR0_DDR0_DDRM_DDR2       0x40000000
-
 static uint32_t dcr_read_sdr(void *opaque, int dcrn)
 {
     ppc4xx_sdr_t *sdr = opaque;
@@ -481,317 +471,6 @@ void ppc4xx_sdr_init(CPUPPCState *env)
                      sdr, &dcr_read_sdr, &dcr_write_sdr);
 }
 
-/*****************************************************************************/
-/* SDRAM controller */
-enum {
-    SDRAM_R0BAS = 0x40,
-    SDRAM_R1BAS,
-    SDRAM_R2BAS,
-    SDRAM_R3BAS,
-    SDRAM_CONF1HB = 0x45,
-    SDRAM_PLBADDULL = 0x4a,
-    SDRAM_CONF1LL = 0x4b,
-    SDRAM_CONFPATHB = 0x4f,
-    SDRAM_PLBADDUHB = 0x50,
-};
-
-static uint32_t sdram_ddr2_bcr(hwaddr ram_base, hwaddr ram_size)
-{
-    uint32_t bcr;
-
-    switch (ram_size) {
-    case (8 * MiB):
-        bcr = 0xffc0;
-        break;
-    case (16 * MiB):
-        bcr = 0xff80;
-        break;
-    case (32 * MiB):
-        bcr = 0xff00;
-        break;
-    case (64 * MiB):
-        bcr = 0xfe00;
-        break;
-    case (128 * MiB):
-        bcr = 0xfc00;
-        break;
-    case (256 * MiB):
-        bcr = 0xf800;
-        break;
-    case (512 * MiB):
-        bcr = 0xf000;
-        break;
-    case (1 * GiB):
-        bcr = 0xe000;
-        break;
-    case (2 * GiB):
-        bcr = 0xc000;
-        break;
-    case (4 * GiB):
-        bcr = 0x8000;
-        break;
-    default:
-        error_report("invalid RAM size " TARGET_FMT_plx, ram_size);
-        return 0;
-    }
-    bcr |= ram_base >> 2 & 0xffe00000;
-    bcr |= 1;
-
-    return bcr;
-}
-
-static inline hwaddr sdram_ddr2_base(uint32_t bcr)
-{
-    return (bcr & 0xffe00000) << 2;
-}
-
-static uint64_t sdram_ddr2_size(uint32_t bcr)
-{
-    uint64_t size;
-    int sh;
-
-    sh = 1024 - ((bcr >> 6) & 0x3ff);
-    size = 8 * MiB * sh;
-
-    return size;
-}
-
-static void sdram_bank_map(Ppc4xxSdramBank *bank)
-{
-    memory_region_init(&bank->container, NULL, "sdram-container", bank->size);
-    memory_region_add_subregion(&bank->container, 0, &bank->ram);
-    memory_region_add_subregion(get_system_memory(), bank->base,
-                                &bank->container);
-}
-
-static void sdram_bank_unmap(Ppc4xxSdramBank *bank)
-{
-    memory_region_del_subregion(get_system_memory(), &bank->container);
-    memory_region_del_subregion(&bank->container, &bank->ram);
-    object_unparent(OBJECT(&bank->container));
-}
-
-static void sdram_ddr2_set_bcr(Ppc4xxSdramDdr2State *sdram, int i,
-                               uint32_t bcr, int enabled)
-{
-    if (sdram->bank[i].bcr & 1) {
-        /* First unmap RAM if enabled */
-        trace_ppc4xx_sdram_unmap(sdram_ddr2_base(sdram->bank[i].bcr),
-                                 sdram_ddr2_size(sdram->bank[i].bcr));
-        sdram_bank_unmap(&sdram->bank[i]);
-    }
-    sdram->bank[i].bcr = bcr & 0xffe0ffc1;
-    sdram->bank[i].base = sdram_ddr2_base(bcr);
-    sdram->bank[i].size = sdram_ddr2_size(bcr);
-    if (enabled && (bcr & 1)) {
-        trace_ppc4xx_sdram_map(sdram_ddr2_base(bcr), sdram_ddr2_size(bcr));
-        sdram_bank_map(&sdram->bank[i]);
-    }
-}
-
-static void sdram_ddr2_map_bcr(Ppc4xxSdramDdr2State *sdram)
-{
-    int i;
-
-    for (i = 0; i < sdram->nbanks; i++) {
-        if (sdram->bank[i].size) {
-            sdram_ddr2_set_bcr(sdram, i,
-                               sdram_ddr2_bcr(sdram->bank[i].base,
-                                              sdram->bank[i].size), 1);
-        } else {
-            sdram_ddr2_set_bcr(sdram, i, 0, 0);
-        }
-    }
-}
-
-static void sdram_ddr2_unmap_bcr(Ppc4xxSdramDdr2State *sdram)
-{
-    int i;
-
-    for (i = 0; i < sdram->nbanks; i++) {
-        if (sdram->bank[i].size) {
-            sdram_ddr2_set_bcr(sdram, i, sdram->bank[i].bcr & ~1, 0);
-        }
-    }
-}
-
-static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
-{
-    Ppc4xxSdramDdr2State *sdram = opaque;
-    uint32_t ret = 0;
-
-    switch (dcrn) {
-    case SDRAM_R0BAS:
-    case SDRAM_R1BAS:
-    case SDRAM_R2BAS:
-    case SDRAM_R3BAS:
-        if (sdram->bank[dcrn - SDRAM_R0BAS].size) {
-            ret = sdram_ddr2_bcr(sdram->bank[dcrn - SDRAM_R0BAS].base,
-                                 sdram->bank[dcrn - SDRAM_R0BAS].size);
-        }
-        break;
-    case SDRAM_CONF1HB:
-    case SDRAM_CONF1LL:
-    case SDRAM_CONFPATHB:
-    case SDRAM_PLBADDULL:
-    case SDRAM_PLBADDUHB:
-        break;
-    case SDRAM0_CFGADDR:
-        ret = sdram->addr;
-        break;
-    case SDRAM0_CFGDATA:
-        switch (sdram->addr) {
-        case 0x14: /* SDRAM_MCSTAT (405EX) */
-        case 0x1F:
-            ret = 0x80000000;
-            break;
-        case 0x21: /* SDRAM_MCOPT2 */
-            ret = sdram->mcopt2;
-            break;
-        case 0x40: /* SDRAM_MB0CF */
-            ret = 0x00008001;
-            break;
-        case 0x7A: /* SDRAM_DLCR */
-            ret = 0x02000000;
-            break;
-        case 0xE1: /* SDR0_DDR0 */
-            ret = SDR0_DDR0_DDRM_ENCODE(1) | SDR0_DDR0_DDRM_DDR1;
-            break;
-        default:
-            break;
-        }
-        break;
-    default:
-        break;
-    }
-
-    return ret;
-}
-
-static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
-{
-    Ppc4xxSdramDdr2State *sdram = opaque;
-
-    switch (dcrn) {
-    case SDRAM_R0BAS:
-    case SDRAM_R1BAS:
-    case SDRAM_R2BAS:
-    case SDRAM_R3BAS:
-    case SDRAM_CONF1HB:
-    case SDRAM_CONF1LL:
-    case SDRAM_CONFPATHB:
-    case SDRAM_PLBADDULL:
-    case SDRAM_PLBADDUHB:
-        break;
-    case SDRAM0_CFGADDR:
-        sdram->addr = val;
-        break;
-    case SDRAM0_CFGDATA:
-        switch (sdram->addr) {
-        case 0x00: /* B0CR */
-            break;
-        case 0x21: /* SDRAM_MCOPT2 */
-            if (!(sdram->mcopt2 & 0x08000000) && (val & 0x08000000)) {
-                trace_ppc4xx_sdram_enable("enable");
-                /* validate all RAM mappings */
-                sdram_ddr2_map_bcr(sdram);
-                sdram->mcopt2 |= 0x08000000;
-            } else if ((sdram->mcopt2 & 0x08000000) && !(val & 0x08000000)) {
-                trace_ppc4xx_sdram_enable("disable");
-                /* invalidate all RAM mappings */
-                sdram_ddr2_unmap_bcr(sdram);
-                sdram->mcopt2 &= ~0x08000000;
-            }
-            break;
-        default:
-            break;
-        }
-        break;
-    default:
-        break;
-    }
-}
-
-static void ppc4xx_sdram_ddr2_reset(DeviceState *dev)
-{
-    Ppc4xxSdramDdr2State *sdram = PPC4xx_SDRAM_DDR2(dev);
-
-    sdram->addr = 0;
-    sdram->mcopt2 = 0;
-}
-
-static void ppc4xx_sdram_ddr2_realize(DeviceState *dev, Error **errp)
-{
-    Ppc4xxSdramDdr2State *s = PPC4xx_SDRAM_DDR2(dev);
-    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
-    const ram_addr_t valid_bank_sizes[] = {
-        4 * GiB, 2 * GiB, 1 * GiB, 512 * MiB, 256 * MiB, 128 * MiB, 64 * MiB,
-        32 * MiB, 16 * MiB, 8 * MiB, 0
-    };
-
-    if (s->nbanks < 1 || s->nbanks > 4) {
-        error_setg(errp, "Invalid number of RAM banks");
-        return;
-    }
-    if (!s->dram_mr) {
-        error_setg(errp, "Missing dram memory region");
-        return;
-    }
-    ppc4xx_sdram_banks(s->dram_mr, s->nbanks, s->bank, valid_bank_sizes);
-
-    ppc4xx_dcr_register(dcr, SDRAM0_CFGADDR,
-                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc4xx_dcr_register(dcr, SDRAM0_CFGDATA,
-                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-
-    ppc4xx_dcr_register(dcr, SDRAM_R0BAS,
-                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc4xx_dcr_register(dcr, SDRAM_R1BAS,
-                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc4xx_dcr_register(dcr, SDRAM_R2BAS,
-                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc4xx_dcr_register(dcr, SDRAM_R3BAS,
-                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc4xx_dcr_register(dcr, SDRAM_CONF1HB,
-                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc4xx_dcr_register(dcr, SDRAM_PLBADDULL,
-                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc4xx_dcr_register(dcr, SDRAM_CONF1LL,
-                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc4xx_dcr_register(dcr, SDRAM_CONFPATHB,
-                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc4xx_dcr_register(dcr, SDRAM_PLBADDUHB,
-                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-}
-
-static Property ppc4xx_sdram_ddr2_props[] = {
-    DEFINE_PROP_LINK("dram", Ppc4xxSdramDdr2State, dram_mr, TYPE_MEMORY_REGION,
-                     MemoryRegion *),
-    DEFINE_PROP_UINT32("nbanks", Ppc4xxSdramDdr2State, nbanks, 4),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void ppc4xx_sdram_ddr2_class_init(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-
-    dc->realize = ppc4xx_sdram_ddr2_realize;
-    dc->reset = ppc4xx_sdram_ddr2_reset;
-    /* Reason: only works as function of a ppc4xx SoC */
-    dc->user_creatable = false;
-    device_class_set_props(dc, ppc4xx_sdram_ddr2_props);
-}
-
-static const TypeInfo ppc4xx_types[] = {
-    {
-        .name           = TYPE_PPC4xx_SDRAM_DDR2,
-        .parent         = TYPE_PPC4xx_DCR_DEVICE,
-        .instance_size  = sizeof(Ppc4xxSdramDdr2State),
-        .class_init     = ppc4xx_sdram_ddr2_class_init,
-    }
-};
-DEFINE_TYPES(ppc4xx_types)
-
 /*****************************************************************************/
 /* PLB to AHB bridge */
 enum {
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 7655967351..c1d111465d 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -23,408 +23,10 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/units.h"
-#include "sysemu/reset.h"
 #include "cpu.h"
-#include "hw/irq.h"
-#include "hw/ppc/ppc.h"
 #include "hw/ppc/ppc4xx.h"
 #include "hw/qdev-properties.h"
-#include "qemu/log.h"
-#include "exec/address-spaces.h"
-#include "qemu/error-report.h"
 #include "qapi/error.h"
-#include "trace.h"
-
-/*****************************************************************************/
-/* SDRAM controller */
-/*
- * XXX: TOFIX: some patches have made this code become inconsistent:
- *      there are type inconsistencies, mixing hwaddr, target_ulong
- *      and uint32_t
- */
-static uint32_t sdram_ddr_bcr(hwaddr ram_base, hwaddr ram_size)
-{
-    uint32_t bcr;
-
-    switch (ram_size) {
-    case 4 * MiB:
-        bcr = 0;
-        break;
-    case 8 * MiB:
-        bcr = 0x20000;
-        break;
-    case 16 * MiB:
-        bcr = 0x40000;
-        break;
-    case 32 * MiB:
-        bcr = 0x60000;
-        break;
-    case 64 * MiB:
-        bcr = 0x80000;
-        break;
-    case 128 * MiB:
-        bcr = 0xA0000;
-        break;
-    case 256 * MiB:
-        bcr = 0xC0000;
-        break;
-    default:
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid RAM size 0x%" HWADDR_PRIx "\n", __func__,
-                      ram_size);
-        return 0;
-    }
-    bcr |= ram_base & 0xFF800000;
-    bcr |= 1;
-
-    return bcr;
-}
-
-static inline hwaddr sdram_ddr_base(uint32_t bcr)
-{
-    return bcr & 0xFF800000;
-}
-
-static target_ulong sdram_ddr_size(uint32_t bcr)
-{
-    target_ulong size;
-    int sh;
-
-    sh = (bcr >> 17) & 0x7;
-    if (sh == 7) {
-        size = -1;
-    } else {
-        size = (4 * MiB) << sh;
-    }
-
-    return size;
-}
-
-static void sdram_ddr_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
-                              uint32_t bcr, int enabled)
-{
-    if (sdram->bank[i].bcr & 1) {
-        /* Unmap RAM */
-        trace_ppc4xx_sdram_unmap(sdram_ddr_base(sdram->bank[i].bcr),
-                                 sdram_ddr_size(sdram->bank[i].bcr));
-        memory_region_del_subregion(get_system_memory(),
-                                    &sdram->bank[i].container);
-        memory_region_del_subregion(&sdram->bank[i].container,
-                                    &sdram->bank[i].ram);
-        object_unparent(OBJECT(&sdram->bank[i].container));
-    }
-    sdram->bank[i].bcr = bcr & 0xFFDEE001;
-    if (enabled && (bcr & 1)) {
-        trace_ppc4xx_sdram_map(sdram_ddr_base(bcr), sdram_ddr_size(bcr));
-        memory_region_init(&sdram->bank[i].container, NULL, "sdram-container",
-                           sdram_ddr_size(bcr));
-        memory_region_add_subregion(&sdram->bank[i].container, 0,
-                                    &sdram->bank[i].ram);
-        memory_region_add_subregion(get_system_memory(),
-                                    sdram_ddr_base(bcr),
-                                    &sdram->bank[i].container);
-    }
-}
-
-static void sdram_ddr_map_bcr(Ppc4xxSdramDdrState *sdram)
-{
-    int i;
-
-    for (i = 0; i < sdram->nbanks; i++) {
-        if (sdram->bank[i].size != 0) {
-            sdram_ddr_set_bcr(sdram, i, sdram_ddr_bcr(sdram->bank[i].base,
-                                                      sdram->bank[i].size), 1);
-        } else {
-            sdram_ddr_set_bcr(sdram, i, 0, 0);
-        }
-    }
-}
-
-static void sdram_ddr_unmap_bcr(Ppc4xxSdramDdrState *sdram)
-{
-    int i;
-
-    for (i = 0; i < sdram->nbanks; i++) {
-        trace_ppc4xx_sdram_unmap(sdram_ddr_base(sdram->bank[i].bcr),
-                                 sdram_ddr_size(sdram->bank[i].bcr));
-        memory_region_del_subregion(get_system_memory(),
-                                    &sdram->bank[i].ram);
-    }
-}
-
-static uint32_t sdram_ddr_dcr_read(void *opaque, int dcrn)
-{
-    Ppc4xxSdramDdrState *sdram = opaque;
-    uint32_t ret;
-
-    switch (dcrn) {
-    case SDRAM0_CFGADDR:
-        ret = sdram->addr;
-        break;
-    case SDRAM0_CFGDATA:
-        switch (sdram->addr) {
-        case 0x00: /* SDRAM_BESR0 */
-            ret = sdram->besr0;
-            break;
-        case 0x08: /* SDRAM_BESR1 */
-            ret = sdram->besr1;
-            break;
-        case 0x10: /* SDRAM_BEAR */
-            ret = sdram->bear;
-            break;
-        case 0x20: /* SDRAM_CFG */
-            ret = sdram->cfg;
-            break;
-        case 0x24: /* SDRAM_STATUS */
-            ret = sdram->status;
-            break;
-        case 0x30: /* SDRAM_RTR */
-            ret = sdram->rtr;
-            break;
-        case 0x34: /* SDRAM_PMIT */
-            ret = sdram->pmit;
-            break;
-        case 0x40: /* SDRAM_B0CR */
-            ret = sdram->bank[0].bcr;
-            break;
-        case 0x44: /* SDRAM_B1CR */
-            ret = sdram->bank[1].bcr;
-            break;
-        case 0x48: /* SDRAM_B2CR */
-            ret = sdram->bank[2].bcr;
-            break;
-        case 0x4C: /* SDRAM_B3CR */
-            ret = sdram->bank[3].bcr;
-            break;
-        case 0x80: /* SDRAM_TR */
-            ret = -1; /* ? */
-            break;
-        case 0x94: /* SDRAM_ECCCFG */
-            ret = sdram->ecccfg;
-            break;
-        case 0x98: /* SDRAM_ECCESR */
-            ret = sdram->eccesr;
-            break;
-        default: /* Error */
-            ret = -1;
-            break;
-        }
-        break;
-    default:
-        /* Avoid gcc warning */
-        ret = 0;
-        break;
-    }
-
-    return ret;
-}
-
-static void sdram_ddr_dcr_write(void *opaque, int dcrn, uint32_t val)
-{
-    Ppc4xxSdramDdrState *sdram = opaque;
-
-    switch (dcrn) {
-    case SDRAM0_CFGADDR:
-        sdram->addr = val;
-        break;
-    case SDRAM0_CFGDATA:
-        switch (sdram->addr) {
-        case 0x00: /* SDRAM_BESR0 */
-            sdram->besr0 &= ~val;
-            break;
-        case 0x08: /* SDRAM_BESR1 */
-            sdram->besr1 &= ~val;
-            break;
-        case 0x10: /* SDRAM_BEAR */
-            sdram->bear = val;
-            break;
-        case 0x20: /* SDRAM_CFG */
-            val &= 0xFFE00000;
-            if (!(sdram->cfg & 0x80000000) && (val & 0x80000000)) {
-                trace_ppc4xx_sdram_enable("enable");
-                /* validate all RAM mappings */
-                sdram_ddr_map_bcr(sdram);
-                sdram->status &= ~0x80000000;
-            } else if ((sdram->cfg & 0x80000000) && !(val & 0x80000000)) {
-                trace_ppc4xx_sdram_enable("disable");
-                /* invalidate all RAM mappings */
-                sdram_ddr_unmap_bcr(sdram);
-                sdram->status |= 0x80000000;
-            }
-            if (!(sdram->cfg & 0x40000000) && (val & 0x40000000)) {
-                sdram->status |= 0x40000000;
-            } else if ((sdram->cfg & 0x40000000) && !(val & 0x40000000)) {
-                sdram->status &= ~0x40000000;
-            }
-            sdram->cfg = val;
-            break;
-        case 0x24: /* SDRAM_STATUS */
-            /* Read-only register */
-            break;
-        case 0x30: /* SDRAM_RTR */
-            sdram->rtr = val & 0x3FF80000;
-            break;
-        case 0x34: /* SDRAM_PMIT */
-            sdram->pmit = (val & 0xF8000000) | 0x07C00000;
-            break;
-        case 0x40: /* SDRAM_B0CR */
-            sdram_ddr_set_bcr(sdram, 0, val, sdram->cfg & 0x80000000);
-            break;
-        case 0x44: /* SDRAM_B1CR */
-            sdram_ddr_set_bcr(sdram, 1, val, sdram->cfg & 0x80000000);
-            break;
-        case 0x48: /* SDRAM_B2CR */
-            sdram_ddr_set_bcr(sdram, 2, val, sdram->cfg & 0x80000000);
-            break;
-        case 0x4C: /* SDRAM_B3CR */
-            sdram_ddr_set_bcr(sdram, 3, val, sdram->cfg & 0x80000000);
-            break;
-        case 0x80: /* SDRAM_TR */
-            sdram->tr = val & 0x018FC01F;
-            break;
-        case 0x94: /* SDRAM_ECCCFG */
-            sdram->ecccfg = val & 0x00F00000;
-            break;
-        case 0x98: /* SDRAM_ECCESR */
-            val &= 0xFFF0F000;
-            if (sdram->eccesr == 0 && val != 0) {
-                qemu_irq_raise(sdram->irq);
-            } else if (sdram->eccesr != 0 && val == 0) {
-                qemu_irq_lower(sdram->irq);
-            }
-            sdram->eccesr = val;
-            break;
-        default: /* Error */
-            break;
-        }
-        break;
-    }
-}
-
-static void ppc4xx_sdram_ddr_reset(DeviceState *dev)
-{
-    Ppc4xxSdramDdrState *sdram = PPC4xx_SDRAM_DDR(dev);
-
-    sdram->addr = 0;
-    sdram->bear = 0;
-    sdram->besr0 = 0; /* No error */
-    sdram->besr1 = 0; /* No error */
-    sdram->cfg = 0;
-    sdram->ecccfg = 0; /* No ECC */
-    sdram->eccesr = 0; /* No error */
-    sdram->pmit = 0x07C00000;
-    sdram->rtr = 0x05F00000;
-    sdram->tr = 0x00854009;
-    /* We pre-initialize RAM banks */
-    sdram->status = 0;
-    sdram->cfg = 0x00800000;
-}
-
-static void ppc4xx_sdram_ddr_realize(DeviceState *dev, Error **errp)
-{
-    Ppc4xxSdramDdrState *s = PPC4xx_SDRAM_DDR(dev);
-    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
-    const ram_addr_t valid_bank_sizes[] = {
-        256 * MiB, 128 * MiB, 64 * MiB, 32 * MiB, 16 * MiB, 8 * MiB, 4 * MiB, 0
-    };
-
-    if (s->nbanks < 1 || s->nbanks > 4) {
-        error_setg(errp, "Invalid number of RAM banks");
-        return;
-    }
-    if (!s->dram_mr) {
-        error_setg(errp, "Missing dram memory region");
-        return;
-    }
-    ppc4xx_sdram_banks(s->dram_mr, s->nbanks, s->bank, valid_bank_sizes);
-
-    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
-
-    ppc4xx_dcr_register(dcr, SDRAM0_CFGADDR,
-                        s, &sdram_ddr_dcr_read, &sdram_ddr_dcr_write);
-    ppc4xx_dcr_register(dcr, SDRAM0_CFGDATA,
-                        s, &sdram_ddr_dcr_read, &sdram_ddr_dcr_write);
-}
-
-static Property ppc4xx_sdram_ddr_props[] = {
-    DEFINE_PROP_LINK("dram", Ppc4xxSdramDdrState, dram_mr, TYPE_MEMORY_REGION,
-                     MemoryRegion *),
-    DEFINE_PROP_UINT32("nbanks", Ppc4xxSdramDdrState, nbanks, 4),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void ppc4xx_sdram_ddr_class_init(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-
-    dc->realize = ppc4xx_sdram_ddr_realize;
-    dc->reset = ppc4xx_sdram_ddr_reset;
-    /* Reason: only works as function of a ppc4xx SoC */
-    dc->user_creatable = false;
-    device_class_set_props(dc, ppc4xx_sdram_ddr_props);
-}
-
-/*
- * Split RAM between SDRAM banks.
- *
- * sdram_bank_sizes[] must be in descending order, that is sizes[i] > sizes[i+1]
- * and must be 0-terminated.
- *
- * The 4xx SDRAM controller supports a small number of banks, and each bank
- * must be one of a small set of sizes. The number of banks and the supported
- * sizes varies by SoC.
- */
-void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
-                        Ppc4xxSdramBank ram_banks[],
-                        const ram_addr_t sdram_bank_sizes[])
-{
-    ram_addr_t size_left = memory_region_size(ram);
-    ram_addr_t base = 0;
-    ram_addr_t bank_size;
-    int i;
-    int j;
-
-    for (i = 0; i < nr_banks; i++) {
-        for (j = 0; sdram_bank_sizes[j] != 0; j++) {
-            bank_size = sdram_bank_sizes[j];
-            if (bank_size <= size_left) {
-                char name[32];
-
-                ram_banks[i].base = base;
-                ram_banks[i].size = bank_size;
-                base += bank_size;
-                size_left -= bank_size;
-                snprintf(name, sizeof(name), "ppc4xx.sdram%d", i);
-                memory_region_init_alias(&ram_banks[i].ram, NULL, name, ram,
-                                         ram_banks[i].base, ram_banks[i].size);
-                break;
-            }
-        }
-        if (!size_left) {
-            /* No need to use the remaining banks. */
-            break;
-        }
-    }
-
-    if (size_left) {
-        ram_addr_t used_size = memory_region_size(ram) - size_left;
-        GString *s = g_string_new(NULL);
-
-        for (i = 0; sdram_bank_sizes[i]; i++) {
-            g_string_append_printf(s, "%" PRIi64 "%s",
-                                   sdram_bank_sizes[i] / MiB,
-                                   sdram_bank_sizes[i + 1] ? ", " : "");
-        }
-        error_report("at most %d bank%s of %s MiB each supported",
-                     nr_banks, nr_banks == 1 ? "" : "s", s->str);
-        error_printf("Possible valid RAM size: %" PRIi64 " MiB\n",
-            used_size ? used_size / MiB : sdram_bank_sizes[i - 1] / MiB);
-
-        g_string_free(s, true);
-        exit(EXIT_FAILURE);
-    }
-}
 
 /*****************************************************************************/
 /* MAL */
@@ -952,11 +554,6 @@ static void ppc4xx_dcr_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc4xx_types[] = {
     {
-        .name           = TYPE_PPC4xx_SDRAM_DDR,
-        .parent         = TYPE_PPC4xx_DCR_DEVICE,
-        .instance_size  = sizeof(Ppc4xxSdramDdrState),
-        .class_init     = ppc4xx_sdram_ddr_class_init,
-    }, {
         .name           = TYPE_PPC4xx_MAL,
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
         .instance_size  = sizeof(Ppc4xxMalState),
diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
new file mode 100644
index 0000000000..8683207179
--- /dev/null
+++ b/hw/ppc/ppc4xx_sdram.c
@@ -0,0 +1,752 @@
+/*
+ * QEMU PowerPC 4xx embedded processors SDRAM controller emulation
+ *
+ * DDR SDRAM controller:
+ * Copyright (c) 2007 Jocelyn Mayer
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ *
+ * DDR2 SDRAM controller:
+ * Copyright (c) 2012 François Revol
+ * Copyright (c) 2016-2019 BALATON Zoltan
+ *
+ * This work is licensed under the GNU GPL license version 2 or later.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "exec/address-spaces.h" /* get_system_memory() */
+#include "exec/cpu-defs.h" /* target_ulong */
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+#include "hw/ppc/ppc4xx.h"
+#include "trace.h"
+
+/*****************************************************************************/
+/* Shared functions */
+
+/*
+ * Split RAM between SDRAM banks.
+ *
+ * sdram_bank_sizes[] must be in descending order, that is sizes[i] > sizes[i+1]
+ * and must be 0-terminated.
+ *
+ * The 4xx SDRAM controller supports a small number of banks, and each bank
+ * must be one of a small set of sizes. The number of banks and the supported
+ * sizes varies by SoC.
+ */
+static void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
+                               Ppc4xxSdramBank ram_banks[],
+                               const ram_addr_t sdram_bank_sizes[])
+{
+    ram_addr_t size_left = memory_region_size(ram);
+    ram_addr_t base = 0;
+    ram_addr_t bank_size;
+    int i;
+    int j;
+
+    for (i = 0; i < nr_banks; i++) {
+        for (j = 0; sdram_bank_sizes[j] != 0; j++) {
+            bank_size = sdram_bank_sizes[j];
+            if (bank_size <= size_left) {
+                char name[32];
+
+                ram_banks[i].base = base;
+                ram_banks[i].size = bank_size;
+                base += bank_size;
+                size_left -= bank_size;
+                snprintf(name, sizeof(name), "ppc4xx.sdram%d", i);
+                memory_region_init_alias(&ram_banks[i].ram, NULL, name, ram,
+                                         ram_banks[i].base, ram_banks[i].size);
+                break;
+            }
+        }
+        if (!size_left) {
+            /* No need to use the remaining banks. */
+            break;
+        }
+    }
+
+    if (size_left) {
+        ram_addr_t used_size = memory_region_size(ram) - size_left;
+        GString *s = g_string_new(NULL);
+
+        for (i = 0; sdram_bank_sizes[i]; i++) {
+            g_string_append_printf(s, "%" PRIi64 "%s",
+                                   sdram_bank_sizes[i] / MiB,
+                                   sdram_bank_sizes[i + 1] ? ", " : "");
+        }
+        error_report("at most %d bank%s of %s MiB each supported",
+                     nr_banks, nr_banks == 1 ? "" : "s", s->str);
+        error_printf("Possible valid RAM size: %" PRIi64 " MiB\n",
+            used_size ? used_size / MiB : sdram_bank_sizes[i - 1] / MiB);
+
+        g_string_free(s, true);
+        exit(EXIT_FAILURE);
+    }
+}
+
+static void sdram_bank_map(Ppc4xxSdramBank *bank)
+{
+    memory_region_init(&bank->container, NULL, "sdram-container", bank->size);
+    memory_region_add_subregion(&bank->container, 0, &bank->ram);
+    memory_region_add_subregion(get_system_memory(), bank->base,
+                                &bank->container);
+}
+
+static void sdram_bank_unmap(Ppc4xxSdramBank *bank)
+{
+    memory_region_del_subregion(get_system_memory(), &bank->container);
+    memory_region_del_subregion(&bank->container, &bank->ram);
+    object_unparent(OBJECT(&bank->container));
+}
+
+/*****************************************************************************/
+/* DDR SDRAM controller */
+/*
+ * XXX: TOFIX: some patches have made this code become inconsistent:
+ *      there are type inconsistencies, mixing hwaddr, target_ulong
+ *      and uint32_t
+ */
+static uint32_t sdram_ddr_bcr(hwaddr ram_base, hwaddr ram_size)
+{
+    uint32_t bcr;
+
+    switch (ram_size) {
+    case 4 * MiB:
+        bcr = 0;
+        break;
+    case 8 * MiB:
+        bcr = 0x20000;
+        break;
+    case 16 * MiB:
+        bcr = 0x40000;
+        break;
+    case 32 * MiB:
+        bcr = 0x60000;
+        break;
+    case 64 * MiB:
+        bcr = 0x80000;
+        break;
+    case 128 * MiB:
+        bcr = 0xA0000;
+        break;
+    case 256 * MiB:
+        bcr = 0xC0000;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid RAM size 0x%" HWADDR_PRIx "\n", __func__,
+                      ram_size);
+        return 0;
+    }
+    bcr |= ram_base & 0xFF800000;
+    bcr |= 1;
+
+    return bcr;
+}
+
+static inline hwaddr sdram_ddr_base(uint32_t bcr)
+{
+    return bcr & 0xFF800000;
+}
+
+static target_ulong sdram_ddr_size(uint32_t bcr)
+{
+    target_ulong size;
+    int sh;
+
+    sh = (bcr >> 17) & 0x7;
+    if (sh == 7) {
+        size = -1;
+    } else {
+        size = (4 * MiB) << sh;
+    }
+
+    return size;
+}
+
+static void sdram_ddr_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
+                              uint32_t bcr, int enabled)
+{
+    if (sdram->bank[i].bcr & 1) {
+        /* Unmap RAM */
+        trace_ppc4xx_sdram_unmap(sdram_ddr_base(sdram->bank[i].bcr),
+                                 sdram_ddr_size(sdram->bank[i].bcr));
+        memory_region_del_subregion(get_system_memory(),
+                                    &sdram->bank[i].container);
+        memory_region_del_subregion(&sdram->bank[i].container,
+                                    &sdram->bank[i].ram);
+        object_unparent(OBJECT(&sdram->bank[i].container));
+    }
+    sdram->bank[i].bcr = bcr & 0xFFDEE001;
+    if (enabled && (bcr & 1)) {
+        trace_ppc4xx_sdram_map(sdram_ddr_base(bcr), sdram_ddr_size(bcr));
+        memory_region_init(&sdram->bank[i].container, NULL, "sdram-container",
+                           sdram_ddr_size(bcr));
+        memory_region_add_subregion(&sdram->bank[i].container, 0,
+                                    &sdram->bank[i].ram);
+        memory_region_add_subregion(get_system_memory(),
+                                    sdram_ddr_base(bcr),
+                                    &sdram->bank[i].container);
+    }
+}
+
+static void sdram_ddr_map_bcr(Ppc4xxSdramDdrState *sdram)
+{
+    int i;
+
+    for (i = 0; i < sdram->nbanks; i++) {
+        if (sdram->bank[i].size != 0) {
+            sdram_ddr_set_bcr(sdram, i, sdram_ddr_bcr(sdram->bank[i].base,
+                                                      sdram->bank[i].size), 1);
+        } else {
+            sdram_ddr_set_bcr(sdram, i, 0, 0);
+        }
+    }
+}
+
+static void sdram_ddr_unmap_bcr(Ppc4xxSdramDdrState *sdram)
+{
+    int i;
+
+    for (i = 0; i < sdram->nbanks; i++) {
+        trace_ppc4xx_sdram_unmap(sdram_ddr_base(sdram->bank[i].bcr),
+                                 sdram_ddr_size(sdram->bank[i].bcr));
+        memory_region_del_subregion(get_system_memory(),
+                                    &sdram->bank[i].ram);
+    }
+}
+
+static uint32_t sdram_ddr_dcr_read(void *opaque, int dcrn)
+{
+    Ppc4xxSdramDdrState *sdram = opaque;
+    uint32_t ret;
+
+    switch (dcrn) {
+    case SDRAM0_CFGADDR:
+        ret = sdram->addr;
+        break;
+    case SDRAM0_CFGDATA:
+        switch (sdram->addr) {
+        case 0x00: /* SDRAM_BESR0 */
+            ret = sdram->besr0;
+            break;
+        case 0x08: /* SDRAM_BESR1 */
+            ret = sdram->besr1;
+            break;
+        case 0x10: /* SDRAM_BEAR */
+            ret = sdram->bear;
+            break;
+        case 0x20: /* SDRAM_CFG */
+            ret = sdram->cfg;
+            break;
+        case 0x24: /* SDRAM_STATUS */
+            ret = sdram->status;
+            break;
+        case 0x30: /* SDRAM_RTR */
+            ret = sdram->rtr;
+            break;
+        case 0x34: /* SDRAM_PMIT */
+            ret = sdram->pmit;
+            break;
+        case 0x40: /* SDRAM_B0CR */
+            ret = sdram->bank[0].bcr;
+            break;
+        case 0x44: /* SDRAM_B1CR */
+            ret = sdram->bank[1].bcr;
+            break;
+        case 0x48: /* SDRAM_B2CR */
+            ret = sdram->bank[2].bcr;
+            break;
+        case 0x4C: /* SDRAM_B3CR */
+            ret = sdram->bank[3].bcr;
+            break;
+        case 0x80: /* SDRAM_TR */
+            ret = -1; /* ? */
+            break;
+        case 0x94: /* SDRAM_ECCCFG */
+            ret = sdram->ecccfg;
+            break;
+        case 0x98: /* SDRAM_ECCESR */
+            ret = sdram->eccesr;
+            break;
+        default: /* Error */
+            ret = -1;
+            break;
+        }
+        break;
+    default:
+        /* Avoid gcc warning */
+        ret = 0;
+        break;
+    }
+
+    return ret;
+}
+
+static void sdram_ddr_dcr_write(void *opaque, int dcrn, uint32_t val)
+{
+    Ppc4xxSdramDdrState *sdram = opaque;
+
+    switch (dcrn) {
+    case SDRAM0_CFGADDR:
+        sdram->addr = val;
+        break;
+    case SDRAM0_CFGDATA:
+        switch (sdram->addr) {
+        case 0x00: /* SDRAM_BESR0 */
+            sdram->besr0 &= ~val;
+            break;
+        case 0x08: /* SDRAM_BESR1 */
+            sdram->besr1 &= ~val;
+            break;
+        case 0x10: /* SDRAM_BEAR */
+            sdram->bear = val;
+            break;
+        case 0x20: /* SDRAM_CFG */
+            val &= 0xFFE00000;
+            if (!(sdram->cfg & 0x80000000) && (val & 0x80000000)) {
+                trace_ppc4xx_sdram_enable("enable");
+                /* validate all RAM mappings */
+                sdram_ddr_map_bcr(sdram);
+                sdram->status &= ~0x80000000;
+            } else if ((sdram->cfg & 0x80000000) && !(val & 0x80000000)) {
+                trace_ppc4xx_sdram_enable("disable");
+                /* invalidate all RAM mappings */
+                sdram_ddr_unmap_bcr(sdram);
+                sdram->status |= 0x80000000;
+            }
+            if (!(sdram->cfg & 0x40000000) && (val & 0x40000000)) {
+                sdram->status |= 0x40000000;
+            } else if ((sdram->cfg & 0x40000000) && !(val & 0x40000000)) {
+                sdram->status &= ~0x40000000;
+            }
+            sdram->cfg = val;
+            break;
+        case 0x24: /* SDRAM_STATUS */
+            /* Read-only register */
+            break;
+        case 0x30: /* SDRAM_RTR */
+            sdram->rtr = val & 0x3FF80000;
+            break;
+        case 0x34: /* SDRAM_PMIT */
+            sdram->pmit = (val & 0xF8000000) | 0x07C00000;
+            break;
+        case 0x40: /* SDRAM_B0CR */
+            sdram_ddr_set_bcr(sdram, 0, val, sdram->cfg & 0x80000000);
+            break;
+        case 0x44: /* SDRAM_B1CR */
+            sdram_ddr_set_bcr(sdram, 1, val, sdram->cfg & 0x80000000);
+            break;
+        case 0x48: /* SDRAM_B2CR */
+            sdram_ddr_set_bcr(sdram, 2, val, sdram->cfg & 0x80000000);
+            break;
+        case 0x4C: /* SDRAM_B3CR */
+            sdram_ddr_set_bcr(sdram, 3, val, sdram->cfg & 0x80000000);
+            break;
+        case 0x80: /* SDRAM_TR */
+            sdram->tr = val & 0x018FC01F;
+            break;
+        case 0x94: /* SDRAM_ECCCFG */
+            sdram->ecccfg = val & 0x00F00000;
+            break;
+        case 0x98: /* SDRAM_ECCESR */
+            val &= 0xFFF0F000;
+            if (sdram->eccesr == 0 && val != 0) {
+                qemu_irq_raise(sdram->irq);
+            } else if (sdram->eccesr != 0 && val == 0) {
+                qemu_irq_lower(sdram->irq);
+            }
+            sdram->eccesr = val;
+            break;
+        default: /* Error */
+            break;
+        }
+        break;
+    }
+}
+
+static void ppc4xx_sdram_ddr_reset(DeviceState *dev)
+{
+    Ppc4xxSdramDdrState *sdram = PPC4xx_SDRAM_DDR(dev);
+
+    sdram->addr = 0;
+    sdram->bear = 0;
+    sdram->besr0 = 0; /* No error */
+    sdram->besr1 = 0; /* No error */
+    sdram->cfg = 0;
+    sdram->ecccfg = 0; /* No ECC */
+    sdram->eccesr = 0; /* No error */
+    sdram->pmit = 0x07C00000;
+    sdram->rtr = 0x05F00000;
+    sdram->tr = 0x00854009;
+    /* We pre-initialize RAM banks */
+    sdram->status = 0;
+    sdram->cfg = 0x00800000;
+}
+
+static void ppc4xx_sdram_ddr_realize(DeviceState *dev, Error **errp)
+{
+    Ppc4xxSdramDdrState *s = PPC4xx_SDRAM_DDR(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
+    const ram_addr_t valid_bank_sizes[] = {
+        256 * MiB, 128 * MiB, 64 * MiB, 32 * MiB, 16 * MiB, 8 * MiB, 4 * MiB, 0
+    };
+
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
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
+
+    ppc4xx_dcr_register(dcr, SDRAM0_CFGADDR,
+                        s, &sdram_ddr_dcr_read, &sdram_ddr_dcr_write);
+    ppc4xx_dcr_register(dcr, SDRAM0_CFGDATA,
+                        s, &sdram_ddr_dcr_read, &sdram_ddr_dcr_write);
+}
+
+static Property ppc4xx_sdram_ddr_props[] = {
+    DEFINE_PROP_LINK("dram", Ppc4xxSdramDdrState, dram_mr, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
+    DEFINE_PROP_UINT32("nbanks", Ppc4xxSdramDdrState, nbanks, 4),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ppc4xx_sdram_ddr_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc4xx_sdram_ddr_realize;
+    dc->reset = ppc4xx_sdram_ddr_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
+    device_class_set_props(dc, ppc4xx_sdram_ddr_props);
+}
+
+/*****************************************************************************/
+/* DDR2 SDRAM controller */
+enum {
+    SDRAM_R0BAS = 0x40,
+    SDRAM_R1BAS,
+    SDRAM_R2BAS,
+    SDRAM_R3BAS,
+    SDRAM_CONF1HB = 0x45,
+    SDRAM_PLBADDULL = 0x4a,
+    SDRAM_CONF1LL = 0x4b,
+    SDRAM_CONFPATHB = 0x4f,
+    SDRAM_PLBADDUHB = 0x50,
+};
+
+static uint32_t sdram_ddr2_bcr(hwaddr ram_base, hwaddr ram_size)
+{
+    uint32_t bcr;
+
+    switch (ram_size) {
+    case 8 * MiB:
+        bcr = 0xffc0;
+        break;
+    case 16 * MiB:
+        bcr = 0xff80;
+        break;
+    case 32 * MiB:
+        bcr = 0xff00;
+        break;
+    case 64 * MiB:
+        bcr = 0xfe00;
+        break;
+    case 128 * MiB:
+        bcr = 0xfc00;
+        break;
+    case 256 * MiB:
+        bcr = 0xf800;
+        break;
+    case 512 * MiB:
+        bcr = 0xf000;
+        break;
+    case 1 * GiB:
+        bcr = 0xe000;
+        break;
+    case 2 * GiB:
+        bcr = 0xc000;
+        break;
+    case 4 * GiB:
+        bcr = 0x8000;
+        break;
+    default:
+        error_report("invalid RAM size " TARGET_FMT_plx, ram_size);
+        return 0;
+    }
+    bcr |= ram_base >> 2 & 0xffe00000;
+    bcr |= 1;
+
+    return bcr;
+}
+
+static inline hwaddr sdram_ddr2_base(uint32_t bcr)
+{
+    return (bcr & 0xffe00000) << 2;
+}
+
+static uint64_t sdram_ddr2_size(uint32_t bcr)
+{
+    uint64_t size;
+    int sh;
+
+    sh = 1024 - ((bcr >> 6) & 0x3ff);
+    size = 8 * MiB * sh;
+
+    return size;
+}
+
+static void sdram_ddr2_set_bcr(Ppc4xxSdramDdr2State *sdram, int i,
+                               uint32_t bcr, int enabled)
+{
+    if (sdram->bank[i].bcr & 1) {
+        /* First unmap RAM if enabled */
+        trace_ppc4xx_sdram_unmap(sdram_ddr2_base(sdram->bank[i].bcr),
+                                 sdram_ddr2_size(sdram->bank[i].bcr));
+        sdram_bank_unmap(&sdram->bank[i]);
+    }
+    sdram->bank[i].bcr = bcr & 0xffe0ffc1;
+    sdram->bank[i].base = sdram_ddr2_base(bcr);
+    sdram->bank[i].size = sdram_ddr2_size(bcr);
+    if (enabled && (bcr & 1)) {
+        trace_ppc4xx_sdram_map(sdram_ddr2_base(bcr), sdram_ddr2_size(bcr));
+        sdram_bank_map(&sdram->bank[i]);
+    }
+}
+
+static void sdram_ddr2_map_bcr(Ppc4xxSdramDdr2State *sdram)
+{
+    int i;
+
+    for (i = 0; i < sdram->nbanks; i++) {
+        if (sdram->bank[i].size) {
+            sdram_ddr2_set_bcr(sdram, i,
+                               sdram_ddr2_bcr(sdram->bank[i].base,
+                                              sdram->bank[i].size), 1);
+        } else {
+            sdram_ddr2_set_bcr(sdram, i, 0, 0);
+        }
+    }
+}
+
+static void sdram_ddr2_unmap_bcr(Ppc4xxSdramDdr2State *sdram)
+{
+    int i;
+
+    for (i = 0; i < sdram->nbanks; i++) {
+        if (sdram->bank[i].size) {
+            sdram_ddr2_set_bcr(sdram, i, sdram->bank[i].bcr & ~1, 0);
+        }
+    }
+}
+
+static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
+{
+    Ppc4xxSdramDdr2State *sdram = opaque;
+    uint32_t ret = 0;
+
+    switch (dcrn) {
+    case SDRAM_R0BAS:
+    case SDRAM_R1BAS:
+    case SDRAM_R2BAS:
+    case SDRAM_R3BAS:
+        if (sdram->bank[dcrn - SDRAM_R0BAS].size) {
+            ret = sdram_ddr2_bcr(sdram->bank[dcrn - SDRAM_R0BAS].base,
+                                 sdram->bank[dcrn - SDRAM_R0BAS].size);
+        }
+        break;
+    case SDRAM_CONF1HB:
+    case SDRAM_CONF1LL:
+    case SDRAM_CONFPATHB:
+    case SDRAM_PLBADDULL:
+    case SDRAM_PLBADDUHB:
+        break;
+    case SDRAM0_CFGADDR:
+        ret = sdram->addr;
+        break;
+    case SDRAM0_CFGDATA:
+        switch (sdram->addr) {
+        case 0x14: /* SDRAM_MCSTAT (405EX) */
+        case 0x1F:
+            ret = 0x80000000;
+            break;
+        case 0x21: /* SDRAM_MCOPT2 */
+            ret = sdram->mcopt2;
+            break;
+        case 0x40: /* SDRAM_MB0CF */
+            ret = 0x00008001;
+            break;
+        case 0x7A: /* SDRAM_DLCR */
+            ret = 0x02000000;
+            break;
+        case 0xE1: /* SDR0_DDR0 */
+            ret = SDR0_DDR0_DDRM_ENCODE(1) | SDR0_DDR0_DDRM_DDR1;
+            break;
+        default:
+            break;
+        }
+        break;
+    default:
+        break;
+    }
+
+    return ret;
+}
+
+static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
+{
+    Ppc4xxSdramDdr2State *sdram = opaque;
+
+    switch (dcrn) {
+    case SDRAM_R0BAS:
+    case SDRAM_R1BAS:
+    case SDRAM_R2BAS:
+    case SDRAM_R3BAS:
+    case SDRAM_CONF1HB:
+    case SDRAM_CONF1LL:
+    case SDRAM_CONFPATHB:
+    case SDRAM_PLBADDULL:
+    case SDRAM_PLBADDUHB:
+        break;
+    case SDRAM0_CFGADDR:
+        sdram->addr = val;
+        break;
+    case SDRAM0_CFGDATA:
+        switch (sdram->addr) {
+        case 0x00: /* B0CR */
+            break;
+        case 0x21: /* SDRAM_MCOPT2 */
+            if (!(sdram->mcopt2 & 0x08000000) && (val & 0x08000000)) {
+                trace_ppc4xx_sdram_enable("enable");
+                /* validate all RAM mappings */
+                sdram_ddr2_map_bcr(sdram);
+                sdram->mcopt2 |= 0x08000000;
+            } else if ((sdram->mcopt2 & 0x08000000) && !(val & 0x08000000)) {
+                trace_ppc4xx_sdram_enable("disable");
+                /* invalidate all RAM mappings */
+                sdram_ddr2_unmap_bcr(sdram);
+                sdram->mcopt2 &= ~0x08000000;
+            }
+            break;
+        default:
+            break;
+        }
+        break;
+    default:
+        break;
+    }
+}
+
+static void ppc4xx_sdram_ddr2_reset(DeviceState *dev)
+{
+    Ppc4xxSdramDdr2State *sdram = PPC4xx_SDRAM_DDR2(dev);
+
+    sdram->addr = 0;
+    sdram->mcopt2 = 0;
+}
+
+static void ppc4xx_sdram_ddr2_realize(DeviceState *dev, Error **errp)
+{
+    Ppc4xxSdramDdr2State *s = PPC4xx_SDRAM_DDR2(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
+    const ram_addr_t valid_bank_sizes[] = {
+        4 * GiB, 2 * GiB, 1 * GiB, 512 * MiB, 256 * MiB, 128 * MiB, 64 * MiB,
+        32 * MiB, 16 * MiB, 8 * MiB, 0
+    };
+
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
+}
+
+static const TypeInfo ppc4xx_sdram_types[] = {
+    {
+        .name           = TYPE_PPC4xx_SDRAM_DDR,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc4xxSdramDdrState),
+        .class_init     = ppc4xx_sdram_ddr_class_init,
+    }, {
+        .name           = TYPE_PPC4xx_SDRAM_DDR2,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc4xxSdramDdr2State),
+        .class_init     = ppc4xx_sdram_ddr2_class_init,
+    }
+};
+
+DEFINE_TYPES(ppc4xx_sdram_types)
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index 7d3cfa7ad6..7216d62882 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -29,23 +29,6 @@
 #include "exec/memory.h"
 #include "hw/sysbus.h"
 
-typedef struct {
-    MemoryRegion ram;
-    MemoryRegion container; /* used for clipping */
-    hwaddr base;
-    hwaddr size;
-    uint32_t bcr;
-} Ppc4xxSdramBank;
-
-enum {
-    SDRAM0_CFGADDR = 0x010,
-    SDRAM0_CFGDATA = 0x011,
-};
-
-void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
-                        Ppc4xxSdramBank ram_banks[],
-                        const ram_addr_t sdram_bank_sizes[]);
-
 #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
 
 /*
@@ -116,6 +99,23 @@ struct Ppc4xxEbcState {
 };
 
 /* SDRAM DDR controller */
+typedef struct {
+    MemoryRegion ram;
+    MemoryRegion container; /* used for clipping */
+    hwaddr base;
+    hwaddr size;
+    uint32_t bcr;
+} Ppc4xxSdramBank;
+
+enum {
+    SDRAM0_CFGADDR = 0x010,
+    SDRAM0_CFGDATA = 0x011,
+};
+
+#define SDR0_DDR0_DDRM_ENCODE(n)  ((((unsigned long)(n)) & 0x03) << 29)
+#define SDR0_DDR0_DDRM_DDR1       0x20000000
+#define SDR0_DDR0_DDRM_DDR2       0x40000000
+
 #define TYPE_PPC4xx_SDRAM_DDR "ppc4xx-sdram-ddr"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxSdramDdrState, PPC4xx_SDRAM_DDR);
 struct Ppc4xxSdramDdrState {
-- 
2.30.4


