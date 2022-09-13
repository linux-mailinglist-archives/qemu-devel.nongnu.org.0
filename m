Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F715B7BFA
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 22:05:51 +0200 (CEST)
Received: from localhost ([::1]:59014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYCAI-0004M3-JN
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 16:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oYBxa-0001fx-Le; Tue, 13 Sep 2022 15:52:42 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:12578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oYBxX-000531-Lq; Tue, 13 Sep 2022 15:52:42 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2B2A074637E;
 Tue, 13 Sep 2022 21:52:38 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0937874632B; Tue, 13 Sep 2022 21:52:38 +0200 (CEST)
Message-Id: <09a0ad26c9f088650a0254ceb3f2a82d346384c9.1663097286.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1663097286.git.balaton@eik.bme.hu>
References: <cover.1663097286.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 11/20] ppc440_sdram: Get rid of the init RAM hack
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Sep 2022 21:52:38 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Remove the do_init parameter of ppc440_sdram_init and enable SDRAM
controller from the board via DCR access instead. Firmware does this
so it may not be needed when booting firmware only with -kernel but we
enable it unconditionally to preserve previous behaviour.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
v2: replace 0x08000000 with BIT(27)

 hw/ppc/ppc440.h    | 3 +--
 hw/ppc/ppc440_uc.c | 8 ++------
 hw/ppc/sam460ex.c  | 8 +++++++-
 3 files changed, 10 insertions(+), 9 deletions(-)

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
index 3c442eaecc..b3f56c49b5 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -723,12 +723,11 @@ static void sdram_reset(void *opaque)
     ppc440_sdram_t *sdram = opaque;
 
     sdram->addr = 0;
-    sdram->mcopt2 = BIT(27);
+    sdram->mcopt2 = 0;
 }
 
 void ppc440_sdram_init(CPUPPCState *env, int nbanks,
-                       Ppc4xxSdramBank *ram_banks,
-                       int do_init)
+                       Ppc4xxSdramBank *ram_banks)
 {
     ppc440_sdram_t *sdram;
     int i;
@@ -745,9 +744,6 @@ void ppc440_sdram_init(CPUPPCState *env, int nbanks,
                      sdram, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM0_CFGDATA,
                      sdram, &dcr_read_sdram, &dcr_write_sdram);
-    if (do_init) {
-        sdram_map_bcr(sdram);
-    }
 
     ppc_dcr_register(env, SDRAM_R0BAS,
                      sdram, &dcr_read_sdram, &dcr_write_sdram);
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index f4c2a693fb..dac329d482 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -345,7 +345,13 @@ static void sam460ex_init(MachineState *machine)
     ppc4xx_sdram_banks(machine->ram, 1, ram_banks, ppc460ex_sdram_bank_sizes);
 
     /* FIXME: does 460EX have ECC interrupts? */
-    ppc440_sdram_init(env, 1, ram_banks, 1);
+    ppc440_sdram_init(env, 1, ram_banks);
+    /* Enable SDRAM memory regions as we may boot without firmware */
+    if (ppc_dcr_write(env->dcr_env, SDRAM0_CFGADDR, 0x21) ||
+        ppc_dcr_write(env->dcr_env, SDRAM0_CFGDATA, 0x08000000)) {
+        error_report("Couldn't enable memory regions");
+        exit(1);
+    }
 
     /* IIC controllers and devices */
     dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600700,
-- 
2.30.4


