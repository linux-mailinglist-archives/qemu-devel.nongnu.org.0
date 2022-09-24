Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5453A5E8CB3
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 14:50:05 +0200 (CEST)
Received: from localhost ([::1]:42726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc4bc-0008EA-2X
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 08:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oc4GQ-0008S2-8P; Sat, 24 Sep 2022 08:28:11 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:62697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oc4GN-0001CQ-Tw; Sat, 24 Sep 2022 08:28:10 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id EC44675A170;
 Sat, 24 Sep 2022 14:28:00 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C638475A16F; Sat, 24 Sep 2022 14:28:00 +0200 (CEST)
Message-Id: <c2eda8f83c82f655aa7821a5a8c9310484bd6a1d.1664021647.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1664021647.git.balaton@eik.bme.hu>
References: <cover.1664021647.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 11/25] ppc440_sdram: Get rid of the init RAM hack
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 24 Sep 2022 14:28:00 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Remove the do_init parameter of ppc440_sdram_init and enable SDRAM
controller from the board. Firmware does this so it may only be needed
when booting with -kernel without firmware but we enable SDRAM
unconditionally to preserve previous behaviour.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
v5: Add function to enable sdram controller

 hw/ppc/ppc440.h         |  3 +--
 hw/ppc/ppc440_uc.c      | 15 +++++++++------
 hw/ppc/sam460ex.c       |  4 +++-
 include/hw/ppc/ppc4xx.h |  2 ++
 4 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/hw/ppc/ppc440.h b/hw/ppc/ppc440.h
index e6c905b7d6..01d76b8000 100644
--- a/hw/ppc/ppc440.h
+++ b/hw/ppc/ppc440.h
@@ -17,8 +17,7 @@ void ppc4xx_l2sram_init(CPUPPCState *env);
 void ppc4xx_cpr_init(CPUPPCState *env);
 void ppc4xx_sdr_init(CPUPPCState *env);
 void ppc440_sdram_init(CPUPPCState *env, int nbanks,
-                       Ppc4xxSdramBank *ram_banks,
-                       int do_init);
+                       Ppc4xxSdramBank *ram_banks);
 void ppc4xx_ahb_init(CPUPPCState *env);
 void ppc4xx_dma_init(CPUPPCState *env, int dcr_base);
 void ppc460ex_pcie_init(CPUPPCState *env);
diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 3fbfe4ad13..e8bc088c8f 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -16,6 +16,7 @@
 #include "qemu/module.h"
 #include "hw/irq.h"
 #include "exec/memory.h"
+#include "cpu.h"
 #include "hw/ppc/ppc4xx.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci/pci.h"
@@ -727,12 +728,11 @@ static void sdram_reset(void *opaque)
     ppc440_sdram_t *sdram = opaque;
 
     sdram->addr = 0;
-    sdram->mcopt2 = SDRAM_DDR2_MCOPT2_DCEN;
+    sdram->mcopt2 = 0;
 }
 
 void ppc440_sdram_init(CPUPPCState *env, int nbanks,
-                       Ppc4xxSdramBank *ram_banks,
-                       int do_init)
+                       Ppc4xxSdramBank *ram_banks)
 {
     ppc440_sdram_t *sdram;
     int i;
@@ -749,9 +749,6 @@ void ppc440_sdram_init(CPUPPCState *env, int nbanks,
                      sdram, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM0_CFGDATA,
                      sdram, &dcr_read_sdram, &dcr_write_sdram);
-    if (do_init) {
-        sdram_map_bcr(sdram);
-    }
 
     ppc_dcr_register(env, SDRAM_R0BAS,
                      sdram, &dcr_read_sdram, &dcr_write_sdram);
@@ -773,6 +770,12 @@ void ppc440_sdram_init(CPUPPCState *env, int nbanks,
                      sdram, &dcr_read_sdram, &dcr_write_sdram);
 }
 
+void ppc440_sdram_enable(CPUPPCState *env)
+{
+    ppc_dcr_write(env->dcr_env, SDRAM0_CFGADDR, 0x21);
+    ppc_dcr_write(env->dcr_env, SDRAM0_CFGDATA, 0x08000000);
+}
+
 /*****************************************************************************/
 /* PLB to AHB bridge */
 enum {
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index f4c2a693fb..9c01211b20 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -345,7 +345,9 @@ static void sam460ex_init(MachineState *machine)
     ppc4xx_sdram_banks(machine->ram, 1, ram_banks, ppc460ex_sdram_bank_sizes);
 
     /* FIXME: does 460EX have ECC interrupts? */
-    ppc440_sdram_init(env, 1, ram_banks, 1);
+    ppc440_sdram_init(env, 1, ram_banks);
+    /* Enable SDRAM memory regions as we may boot without firmware */
+    ppc440_sdram_enable(env);
 
     /* IIC controllers and devices */
     dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600700,
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index 558500fb97..78a845399e 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -37,6 +37,8 @@ typedef struct {
     uint32_t bcr;
 } Ppc4xxSdramBank;
 
+void ppc440_sdram_enable(CPUPPCState *env);
+
 void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
                         Ppc4xxSdramBank ram_banks[],
                         const ram_addr_t sdram_bank_sizes[]);
-- 
2.30.4


