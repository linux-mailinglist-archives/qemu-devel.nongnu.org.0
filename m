Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5949F59A2C9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:11:00 +0200 (CEST)
Received: from localhost ([::1]:41108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP5WN-0005Pb-Cj
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oP5Hf-0007mL-Pz; Fri, 19 Aug 2022 12:55:49 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:14227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oP5Hc-0000wZ-Eu; Fri, 19 Aug 2022 12:55:46 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D193C746399;
 Fri, 19 Aug 2022 18:55:39 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id AE8BD746397; Fri, 19 Aug 2022 18:55:39 +0200 (CEST)
Message-Id: <ba99ff4a1a83c40570c85190b5677228f0e45951.1660926381.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660926381.git.balaton@eik.bme.hu>
References: <cover.1660926381.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 01/20] ppc440_bamboo: Remove unnecessary memsets
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Aug 2022 18:55:39 +0200 (CEST)
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

In ppc4xx_sdram_init() the struct is allocated with g_new0() so no
need to clear its elements. In the bamboo machine init memset can be
replaced with array initialiser which is shorter.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc440_bamboo.c | 6 ++----
 hw/ppc/ppc4xx_devs.c   | 8 ++------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index ea945a1c99..5ec82fa8c2 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -169,8 +169,8 @@ static void bamboo_init(MachineState *machine)
     MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *isa = g_new(MemoryRegion, 1);
     MemoryRegion *ram_memories = g_new(MemoryRegion, PPC440EP_SDRAM_NR_BANKS);
-    hwaddr ram_bases[PPC440EP_SDRAM_NR_BANKS];
-    hwaddr ram_sizes[PPC440EP_SDRAM_NR_BANKS];
+    hwaddr ram_bases[PPC440EP_SDRAM_NR_BANKS] = {0};
+    hwaddr ram_sizes[PPC440EP_SDRAM_NR_BANKS] = {0};
     PCIBus *pcibus;
     PowerPCCPU *cpu;
     CPUPPCState *env;
@@ -205,8 +205,6 @@ static void bamboo_init(MachineState *machine)
                        qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
 
     /* SDRAM controller */
-    memset(ram_bases, 0, sizeof(ram_bases));
-    memset(ram_sizes, 0, sizeof(ram_sizes));
     ppc4xx_sdram_banks(machine->ram, PPC440EP_SDRAM_NR_BANKS, ram_memories,
                        ram_bases, ram_sizes, ppc440ep_sdram_bank_sizes);
     /* XXX 440EP's ECC interrupts are on UIC1, but we've only created UIC0. */
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index ce38ae65e6..b4cd10f735 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -363,12 +363,8 @@ void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
     sdram->irq = irq;
     sdram->nbanks = nbanks;
     sdram->ram_memories = ram_memories;
-    memset(sdram->ram_bases, 0, 4 * sizeof(hwaddr));
-    memcpy(sdram->ram_bases, ram_bases,
-           nbanks * sizeof(hwaddr));
-    memset(sdram->ram_sizes, 0, 4 * sizeof(hwaddr));
-    memcpy(sdram->ram_sizes, ram_sizes,
-           nbanks * sizeof(hwaddr));
+    memcpy(sdram->ram_bases, ram_bases, nbanks * sizeof(hwaddr));
+    memcpy(sdram->ram_sizes, ram_sizes, nbanks * sizeof(hwaddr));
     qemu_register_reset(&sdram_reset, sdram);
     ppc_dcr_register(env, SDRAM0_CFGADDR,
                      sdram, &dcr_read_sdram, &dcr_write_sdram);
-- 
2.30.4


