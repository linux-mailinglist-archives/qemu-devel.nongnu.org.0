Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE7B5BBFE0
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 22:38:42 +0200 (CEST)
Received: from localhost ([::1]:38742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa13p-0007y9-5l
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 16:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oa0qE-0004g9-4P; Sun, 18 Sep 2022 16:24:38 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:51171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oa0qB-0004Ap-ML; Sun, 18 Sep 2022 16:24:37 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2F28D75A16C;
 Sun, 18 Sep 2022 22:24:34 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B7EB775A162; Sun, 18 Sep 2022 22:24:33 +0200 (CEST)
Message-Id: <4310e61b5558ce5726d1ace1aa7a66b7438fa955.1663531117.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1663531117.git.balaton@eik.bme.hu>
References: <cover.1663531117.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v5 13/21] ppc4xx_sdram: Rename functions to prevent name
 clashes
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Sep 2022 22:24:33 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Rename functions to avoid name clashes when moving the DDR2 controller
model currently called ppc440_sdram to ppc4xx_devs. This also more
clearly shows which function belongs to which model.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/ppc405_boards.c  |  2 +-
 hw/ppc/ppc440_bamboo.c  |  2 +-
 hw/ppc/ppc440_uc.c      | 67 +++++++++++++++++++++--------------------
 hw/ppc/ppc4xx_devs.c    | 46 ++++++++++++++--------------
 hw/ppc/sam460ex.c       |  2 +-
 include/hw/ppc/ppc4xx.h |  4 +--
 6 files changed, 62 insertions(+), 61 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index b59393d4bd..4092ebc1ab 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -337,7 +337,7 @@ static void ppc405_init(MachineState *machine)
 
     /* Load ELF kernel and rootfs.cpio */
     } else if (kernel_filename && !machine->firmware) {
-        ppc4xx_sdram_enable(&ppc405->soc.sdram);
+        ppc4xx_sdram_ddr_enable(&ppc405->soc.sdram);
         boot_from_kernel(machine, &ppc405->soc.cpu);
     }
 }
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 5c35ba6086..56f47e7509 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -204,7 +204,7 @@ static void bamboo_init(MachineState *machine)
     /* XXX 440EP's ECC interrupts are on UIC1, but we've only created UIC0. */
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(uicdev, 14));
     /* Enable SDRAM memory regions, this should be done by the firmware */
-    ppc4xx_sdram_enable(PPC4xx_SDRAM_DDR(dev));
+    ppc4xx_sdram_ddr_enable(PPC4xx_SDRAM_DDR(dev));
 
     /* PCI */
     dev = sysbus_create_varargs(TYPE_PPC4xx_PCI_HOST_BRIDGE,
diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 97e6d5f5b2..edd0781eb7 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -505,7 +505,7 @@ enum {
     SDRAM_PLBADDUHB = 0x50,
 };
 
-static uint32_t sdram_bcr(hwaddr ram_base, hwaddr ram_size)
+static uint32_t sdram_ddr2_bcr(hwaddr ram_base, hwaddr ram_size)
 {
     uint32_t bcr;
 
@@ -550,12 +550,12 @@ static uint32_t sdram_bcr(hwaddr ram_base, hwaddr ram_size)
     return bcr;
 }
 
-static inline hwaddr sdram_base(uint32_t bcr)
+static inline hwaddr sdram_ddr2_base(uint32_t bcr)
 {
     return (bcr & 0xffe00000) << 2;
 }
 
-static uint64_t sdram_size(uint32_t bcr)
+static uint64_t sdram_ddr2_size(uint32_t bcr)
 {
     uint64_t size;
     int sh;
@@ -581,48 +581,49 @@ static void sdram_bank_unmap(Ppc4xxSdramBank *bank)
     object_unparent(OBJECT(&bank->container));
 }
 
-static void sdram_set_bcr(ppc440_sdram_t *sdram, int i,
-                          uint32_t bcr, int enabled)
+static void sdram_ddr2_set_bcr(ppc440_sdram_t *sdram, int i,
+                               uint32_t bcr, int enabled)
 {
     if (sdram->bank[i].bcr & 1) {
         /* First unmap RAM if enabled */
-        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
-                                 sdram_size(sdram->bank[i].bcr));
+        trace_ppc4xx_sdram_unmap(sdram_ddr2_base(sdram->bank[i].bcr),
+                                 sdram_ddr2_size(sdram->bank[i].bcr));
         sdram_bank_unmap(&sdram->bank[i]);
     }
     sdram->bank[i].bcr = bcr & 0xffe0ffc1;
     if (enabled && (bcr & 1)) {
-        trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
+        trace_ppc4xx_sdram_map(sdram_ddr2_base(bcr), sdram_ddr2_size(bcr));
         sdram_bank_map(&sdram->bank[i]);
     }
 }
 
-static void sdram_map_bcr(ppc440_sdram_t *sdram)
+static void sdram_ddr2_map_bcr(ppc440_sdram_t *sdram)
 {
     int i;
 
     for (i = 0; i < sdram->nbanks; i++) {
         if (sdram->bank[i].size) {
-            sdram_set_bcr(sdram, i, sdram_bcr(sdram->bank[i].base,
+            sdram_ddr2_set_bcr(sdram, i,
+                               sdram_ddr2_bcr(sdram->bank[i].base,
                                               sdram->bank[i].size), 1);
         } else {
-            sdram_set_bcr(sdram, i, 0, 0);
+            sdram_ddr2_set_bcr(sdram, i, 0, 0);
         }
     }
 }
 
-static void sdram_unmap_bcr(ppc440_sdram_t *sdram)
+static void sdram_ddr2_unmap_bcr(ppc440_sdram_t *sdram)
 {
     int i;
 
     for (i = 0; i < sdram->nbanks; i++) {
         if (sdram->bank[i].size) {
-            sdram_set_bcr(sdram, i, sdram->bank[i].bcr & ~1, 0);
+            sdram_ddr2_set_bcr(sdram, i, sdram->bank[i].bcr & ~1, 0);
         }
     }
 }
 
-static uint32_t dcr_read_sdram(void *opaque, int dcrn)
+static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
 {
     ppc440_sdram_t *sdram = opaque;
     uint32_t ret = 0;
@@ -633,8 +634,8 @@ static uint32_t dcr_read_sdram(void *opaque, int dcrn)
     case SDRAM_R2BAS:
     case SDRAM_R3BAS:
         if (sdram->bank[dcrn - SDRAM_R0BAS].size) {
-            ret = sdram_bcr(sdram->bank[dcrn - SDRAM_R0BAS].base,
-                            sdram->bank[dcrn - SDRAM_R0BAS].size);
+            ret = sdram_ddr2_bcr(sdram->bank[dcrn - SDRAM_R0BAS].base,
+                                 sdram->bank[dcrn - SDRAM_R0BAS].size);
         }
         break;
     case SDRAM_CONF1HB:
@@ -677,7 +678,7 @@ static uint32_t dcr_read_sdram(void *opaque, int dcrn)
 
 #define SDRAM_DDR2_MCOPT2_DCEN BIT(27)
 
-static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
+static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
 {
     ppc440_sdram_t *sdram = opaque;
 
@@ -704,13 +705,13 @@ static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
                 (val & SDRAM_DDR2_MCOPT2_DCEN)) {
                 trace_ppc4xx_sdram_enable("enable");
                 /* validate all RAM mappings */
-                sdram_map_bcr(sdram);
+                sdram_ddr2_map_bcr(sdram);
                 sdram->mcopt2 |= SDRAM_DDR2_MCOPT2_DCEN;
             } else if ((sdram->mcopt2 & SDRAM_DDR2_MCOPT2_DCEN) &&
                        !(val & SDRAM_DDR2_MCOPT2_DCEN)) {
                 trace_ppc4xx_sdram_enable("disable");
                 /* invalidate all RAM mappings */
-                sdram_unmap_bcr(sdram);
+                sdram_ddr2_unmap_bcr(sdram);
                 sdram->mcopt2 &= ~SDRAM_DDR2_MCOPT2_DCEN;
             }
             break;
@@ -723,7 +724,7 @@ static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
     }
 }
 
-static void sdram_reset(void *opaque)
+static void sdram_ddr2_reset(void *opaque)
 {
     ppc440_sdram_t *sdram = opaque;
 
@@ -744,33 +745,33 @@ void ppc440_sdram_init(CPUPPCState *env, int nbanks,
         s->bank[i].base = ram_banks[i].base;
         s->bank[i].size = ram_banks[i].size;
     }
-    qemu_register_reset(&sdram_reset, s);
+    qemu_register_reset(&sdram_ddr2_reset, s);
     ppc_dcr_register(env, SDRAM0_CFGADDR,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM0_CFGDATA,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
 
     ppc_dcr_register(env, SDRAM_R0BAS,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_R1BAS,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_R2BAS,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_R3BAS,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_CONF1HB,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_PLBADDULL,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_CONF1LL,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_CONFPATHB,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_PLBADDUHB,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
 }
 
-void ppc440_sdram_enable(CPUPPCState *env)
+void ppc4xx_sdram_ddr2_enable(CPUPPCState *env)
 {
     ppc_dcr_write(env->dcr_env, SDRAM0_CFGADDR, 0x21);
     ppc_dcr_write(env->dcr_env, SDRAM0_CFGDATA, 0x08000000);
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 02ac8ff335..12af90f244 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -86,12 +86,12 @@ static uint32_t sdram_ddr_bcr(hwaddr ram_base, hwaddr ram_size)
     return bcr;
 }
 
-static inline hwaddr sdram_base(uint32_t bcr)
+static inline hwaddr sdram_ddr_base(uint32_t bcr)
 {
     return bcr & 0xFF800000;
 }
 
-static target_ulong sdram_size(uint32_t bcr)
+static target_ulong sdram_ddr_size(uint32_t bcr)
 {
     target_ulong size;
     int sh;
@@ -106,13 +106,13 @@ static target_ulong sdram_size(uint32_t bcr)
     return size;
 }
 
-static void sdram_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
-                          uint32_t bcr, int enabled)
+static void sdram_ddr_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
+                              uint32_t bcr, int enabled)
 {
     if (sdram->bank[i].bcr & 1) {
         /* Unmap RAM */
-        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
-                                 sdram_size(sdram->bank[i].bcr));
+        trace_ppc4xx_sdram_unmap(sdram_ddr_base(sdram->bank[i].bcr),
+                                 sdram_ddr_size(sdram->bank[i].bcr));
         memory_region_del_subregion(get_system_memory(),
                                     &sdram->bank[i].container);
         memory_region_del_subregion(&sdram->bank[i].container,
@@ -121,38 +121,38 @@ static void sdram_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
     }
     sdram->bank[i].bcr = bcr & 0xFFDEE001;
     if (enabled && (bcr & 1)) {
-        trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
+        trace_ppc4xx_sdram_map(sdram_ddr_base(bcr), sdram_ddr_size(bcr));
         memory_region_init(&sdram->bank[i].container, NULL, "sdram-container",
-                           sdram_size(bcr));
+                           sdram_ddr_size(bcr));
         memory_region_add_subregion(&sdram->bank[i].container, 0,
                                     &sdram->bank[i].ram);
         memory_region_add_subregion(get_system_memory(),
-                                    sdram_base(bcr),
+                                    sdram_ddr_base(bcr),
                                     &sdram->bank[i].container);
     }
 }
 
-static void sdram_map_bcr(Ppc4xxSdramDdrState *sdram)
+static void sdram_ddr_map_bcr(Ppc4xxSdramDdrState *sdram)
 {
     int i;
 
     for (i = 0; i < sdram->nbanks; i++) {
         if (sdram->bank[i].size != 0) {
-            sdram_set_bcr(sdram, i, sdram_ddr_bcr(sdram->bank[i].base,
-                                                  sdram->bank[i].size), 1);
+            sdram_ddr_set_bcr(sdram, i, sdram_ddr_bcr(sdram->bank[i].base,
+                                                      sdram->bank[i].size), 1);
         } else {
-            sdram_set_bcr(sdram, i, 0, 0);
+            sdram_ddr_set_bcr(sdram, i, 0, 0);
         }
     }
 }
 
-static void sdram_unmap_bcr(Ppc4xxSdramDdrState *sdram)
+static void sdram_ddr_unmap_bcr(Ppc4xxSdramDdrState *sdram)
 {
     int i;
 
     for (i = 0; i < sdram->nbanks; i++) {
-        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
-                                 sdram_size(sdram->bank[i].bcr));
+        trace_ppc4xx_sdram_unmap(sdram_ddr_base(sdram->bank[i].bcr),
+                                 sdram_ddr_size(sdram->bank[i].bcr));
         memory_region_del_subregion(get_system_memory(),
                                     &sdram->bank[i].ram);
     }
@@ -249,12 +249,12 @@ static void sdram_ddr_dcr_write(void *opaque, int dcrn, uint32_t val)
             if (!(sdram->cfg & 0x80000000) && (val & 0x80000000)) {
                 trace_ppc4xx_sdram_enable("enable");
                 /* validate all RAM mappings */
-                sdram_map_bcr(sdram);
+                sdram_ddr_map_bcr(sdram);
                 sdram->status &= ~0x80000000;
             } else if ((sdram->cfg & 0x80000000) && !(val & 0x80000000)) {
                 trace_ppc4xx_sdram_enable("disable");
                 /* invalidate all RAM mappings */
-                sdram_unmap_bcr(sdram);
+                sdram_ddr_unmap_bcr(sdram);
                 sdram->status |= 0x80000000;
             }
             if (!(sdram->cfg & 0x40000000) && (val & 0x40000000)) {
@@ -274,16 +274,16 @@ static void sdram_ddr_dcr_write(void *opaque, int dcrn, uint32_t val)
             sdram->pmit = (val & 0xF8000000) | 0x07C00000;
             break;
         case 0x40: /* SDRAM_B0CR */
-            sdram_set_bcr(sdram, 0, val, sdram->cfg & 0x80000000);
+            sdram_ddr_set_bcr(sdram, 0, val, sdram->cfg & 0x80000000);
             break;
         case 0x44: /* SDRAM_B1CR */
-            sdram_set_bcr(sdram, 1, val, sdram->cfg & 0x80000000);
+            sdram_ddr_set_bcr(sdram, 1, val, sdram->cfg & 0x80000000);
             break;
         case 0x48: /* SDRAM_B2CR */
-            sdram_set_bcr(sdram, 2, val, sdram->cfg & 0x80000000);
+            sdram_ddr_set_bcr(sdram, 2, val, sdram->cfg & 0x80000000);
             break;
         case 0x4C: /* SDRAM_B3CR */
-            sdram_set_bcr(sdram, 3, val, sdram->cfg & 0x80000000);
+            sdram_ddr_set_bcr(sdram, 3, val, sdram->cfg & 0x80000000);
             break;
         case 0x80: /* SDRAM_TR */
             sdram->tr = val & 0x018FC01F;
@@ -370,7 +370,7 @@ static void ppc4xx_sdram_ddr_class_init(ObjectClass *oc, void *data)
     device_class_set_props(dc, ppc4xx_sdram_ddr_props);
 }
 
-void ppc4xx_sdram_enable(Ppc4xxSdramDdrState *s)
+void ppc4xx_sdram_ddr_enable(Ppc4xxSdramDdrState *s)
 {
     sdram_ddr_dcr_write(s, SDRAM0_CFGADDR, 0x20);
     sdram_ddr_dcr_write(s, SDRAM0_CFGDATA, 0x80000000);
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 9c01211b20..b318521b01 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -347,7 +347,7 @@ static void sam460ex_init(MachineState *machine)
     /* FIXME: does 460EX have ECC interrupts? */
     ppc440_sdram_init(env, 1, ram_banks);
     /* Enable SDRAM memory regions as we may boot without firmware */
-    ppc440_sdram_enable(env);
+    ppc4xx_sdram_ddr2_enable(env);
 
     /* IIC controllers and devices */
     dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600700,
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index 78a845399e..fd0b3ca82a 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -37,7 +37,7 @@ typedef struct {
     uint32_t bcr;
 } Ppc4xxSdramBank;
 
-void ppc440_sdram_enable(CPUPPCState *env);
+void ppc4xx_sdram_ddr2_enable(CPUPPCState *env);
 
 void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
                         Ppc4xxSdramBank ram_banks[],
@@ -136,6 +136,6 @@ struct Ppc4xxSdramDdrState {
     uint32_t eccesr;
 };
 
-void ppc4xx_sdram_enable(Ppc4xxSdramDdrState *s);
+void ppc4xx_sdram_ddr_enable(Ppc4xxSdramDdrState *s);
 
 #endif /* PPC4XX_H */
-- 
2.30.4


