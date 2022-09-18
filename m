Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3025BBFD4
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 22:31:46 +0200 (CEST)
Received: from localhost ([::1]:41962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa0x7-0005Br-6u
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 16:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oa0q6-0004C9-TA; Sun, 18 Sep 2022 16:24:30 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:51137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oa0q4-00049D-Uy; Sun, 18 Sep 2022 16:24:30 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 81ED575A164;
 Sun, 18 Sep 2022 22:24:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5B0FD75A16A; Sun, 18 Sep 2022 22:24:26 +0200 (CEST)
Message-Id: <7b412e4ee7c57f53505077e0003c88957711378b.1663531117.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1663531117.git.balaton@eik.bme.hu>
References: <cover.1663531117.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v5 06/21] ppc4xx_sdram: Move size check to ppc4xx_sdram_init()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Sep 2022 22:24:26 +0200 (CEST)
X-Spam-Probability: 10%
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

Instead of checking if memory size is valid in board code move this
check to ppc4xx_sdram_init() as this is a restriction imposed by the
SDRAM controller.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/ppc405.h         |  2 --
 hw/ppc/ppc405_boards.c  | 10 ----------
 hw/ppc/ppc405_uc.c      | 11 ++---------
 hw/ppc/ppc440_bamboo.c  | 10 +---------
 hw/ppc/ppc4xx_devs.c    | 14 ++++++--------
 include/hw/ppc/ppc4xx.h |  2 +-
 6 files changed, 10 insertions(+), 39 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index ca0972b88b..ad54dff542 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -167,9 +167,7 @@ struct Ppc405SoCState {
     DeviceState parent_obj;
 
     /* Public */
-    Ppc4xxSdramBank ram_banks[2];
     MemoryRegion *dram_mr;
-    hwaddr ram_size;
 
     PowerPCCPU cpu;
     PPCUIC uic;
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 1eaeca8806..824acf7a80 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -271,21 +271,11 @@ static void boot_from_kernel(MachineState *machine, PowerPCCPU *cpu)
 static void ppc405_init(MachineState *machine)
 {
     Ppc405MachineState *ppc405 = PPC405_MACHINE(machine);
-    MachineClass *mc = MACHINE_GET_CLASS(machine);
     const char *kernel_filename = machine->kernel_filename;
     MemoryRegion *sysmem = get_system_memory();
 
-    if (machine->ram_size != mc->default_ram_size) {
-        char *sz = size_to_str(mc->default_ram_size);
-        error_report("Invalid RAM size, should be %s", sz);
-        g_free(sz);
-        exit(EXIT_FAILURE);
-    }
-
     object_initialize_child(OBJECT(machine), "soc", &ppc405->soc,
                             TYPE_PPC405_SOC);
-    object_property_set_uint(OBJECT(&ppc405->soc), "ram-size",
-                             machine->ram_size, &error_fatal);
     object_property_set_link(OBJECT(&ppc405->soc), "dram",
                              OBJECT(machine->ram), &error_abort);
     object_property_set_uint(OBJECT(&ppc405->soc), "sys-clk", 33333333,
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index bcbf35bc14..e1c7188e61 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1073,15 +1073,9 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
                        qdev_get_gpio_in(DEVICE(&s->cpu), PPC40x_INPUT_CINT));
 
     /* SDRAM controller */
-        /* XXX 405EP has no ECC interrupt */
-    s->ram_banks[0].base = 0;
-    s->ram_banks[0].size = s->ram_size;
-    memory_region_init_alias(&s->ram_banks[0].ram, OBJECT(s),
-                             "ppc405.sdram0", s->dram_mr,
-                             s->ram_banks[0].base, s->ram_banks[0].size);
-
+    /* XXX 405EP has no ECC interrupt */
     ppc4xx_sdram_init(env, qdev_get_gpio_in(DEVICE(&s->uic), 17), 1,
-                      s->ram_banks);
+                      s->dram_mr);
 
     /* External bus controller */
     if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->ebc), &s->cpu, errp)) {
@@ -1159,7 +1153,6 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 static Property ppc405_soc_properties[] = {
     DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
-    DEFINE_PROP_UINT64("ram-size", Ppc405SoCState, ram_size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 7ec7c7c43d..91d9a4eef3 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -50,10 +50,6 @@
 
 #define PPC440EP_SDRAM_NR_BANKS 4
 
-static const ram_addr_t ppc440ep_sdram_bank_sizes[] = {
-    256 * MiB, 128 * MiB, 64 * MiB, 32 * MiB, 16 * MiB, 8 * MiB, 4 * MiB, 0
-};
-
 static hwaddr entry;
 
 static int bamboo_load_device_tree(hwaddr addr,
@@ -168,8 +164,6 @@ static void bamboo_init(MachineState *machine)
     unsigned int pci_irq_nrs[4] = { 28, 27, 26, 25 };
     MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *isa = g_new(MemoryRegion, 1);
-    Ppc4xxSdramBank *ram_banks = g_new0(Ppc4xxSdramBank,
-                                        PPC440EP_SDRAM_NR_BANKS);
     PCIBus *pcibus;
     PowerPCCPU *cpu;
     CPUPPCState *env;
@@ -204,11 +198,9 @@ static void bamboo_init(MachineState *machine)
                        qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
 
     /* SDRAM controller */
-    ppc4xx_sdram_banks(machine->ram, PPC440EP_SDRAM_NR_BANKS, ram_banks,
-                       ppc440ep_sdram_bank_sizes);
     /* XXX 440EP's ECC interrupts are on UIC1, but we've only created UIC0. */
     ppc4xx_sdram_init(env, qdev_get_gpio_in(uicdev, 14),
-                      PPC440EP_SDRAM_NR_BANKS, ram_banks);
+                      PPC440EP_SDRAM_NR_BANKS, machine->ram);
     /* Enable SDRAM memory regions, this should be done by the firmware */
     ppc4xx_sdram_enable(env);
 
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index fcbda57c55..2e0343970f 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -41,7 +41,7 @@
 typedef struct ppc4xx_sdram_t ppc4xx_sdram_t;
 struct ppc4xx_sdram_t {
     uint32_t addr;
-    int nbanks;
+    int nbanks; /* Banks to use from the 4, e.g. when board has less slots */
     Ppc4xxSdramBank bank[4];
     uint32_t besr0;
     uint32_t besr1;
@@ -348,19 +348,17 @@ static void sdram_reset(void *opaque)
 }
 
 void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
-                       Ppc4xxSdramBank *ram_banks)
+                       MemoryRegion *ram)
 {
     ppc4xx_sdram_t *sdram;
-    int i;
+    const ram_addr_t valid_bank_sizes[] = {
+        256 * MiB, 128 * MiB, 64 * MiB, 32 * MiB, 16 * MiB, 8 * MiB, 4 * MiB, 0
+    };
 
     sdram = g_new0(ppc4xx_sdram_t, 1);
     sdram->irq = irq;
     sdram->nbanks = nbanks;
-    for (i = 0; i < nbanks; i++) {
-        sdram->bank[i].ram = ram_banks[i].ram;
-        sdram->bank[i].base = ram_banks[i].base;
-        sdram->bank[i].size = ram_banks[i].size;
-    }
+    ppc4xx_sdram_banks(ram, sdram->nbanks, sdram->bank, valid_bank_sizes);
     qemu_register_reset(&sdram_reset, sdram);
     ppc_dcr_register(env, SDRAM0_CFGADDR,
                      sdram, &dcr_read_sdram, &dcr_write_sdram);
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index a7b41c7eaa..1d41db9b30 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -44,7 +44,7 @@ void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
                         const ram_addr_t sdram_bank_sizes[]);
 
 void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
-                       Ppc4xxSdramBank *ram_banks);
+                       MemoryRegion *ram);
 
 #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
 
-- 
2.30.4


