Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A026017D9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:40:10 +0200 (CEST)
Received: from localhost ([::1]:38722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVy5-0002nj-8j
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfF-0001t4-9I; Mon, 17 Oct 2022 15:20:41 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:40566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfD-0002tO-Ce; Mon, 17 Oct 2022 15:20:41 -0400
Received: by mail-oi1-x231.google.com with SMTP id l5so13220150oif.7;
 Mon, 17 Oct 2022 12:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QTrW1fMp+tMypGOIXzhzboV+/SCCFYeb2uEWz/sl2AY=;
 b=G4apcGm2ZzH9Y9+MPCIlXLo50mxuoMkn8KR476LkGUbsBl8qh2SkeRN/HdI8DGkSG9
 +Kgavmx1IfRTGPKlCfsOzqz6Irw5pKFL9tl/6Q6Uvl+A7v2vME50wgqcinmsOLO7C6BG
 CTkUfTfS/vhNXnaGisgTwHv4wsdwj7qNdbWuqucwi4OAFcYaiDTfnN6nmk8m7PLtuML8
 6Ijp1EHwL1lqV9ZGn0IbNCrJoP4ZYlfjMxaWm23wfHMDfJj2OTpLJpGdJZcssafzFue0
 rwHloY35QYtGTMlISJydM7H1sP2Mg/Fi3Bvi9sJLOlttqupq517T9WAe7Ki8wtiuO8D3
 9lcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QTrW1fMp+tMypGOIXzhzboV+/SCCFYeb2uEWz/sl2AY=;
 b=1eTudq+gdho8gq4SmXMRrMJ28Ivq4F/nrdqf4ZbaN84kpLhu1x2H7fLfQvKhI1xMYF
 QD1E0YUsbQ5e6buXe4s1DNu51lEBoFh0u/Lvo2GKMB83h7EPcs+BMXwfU4Zu3wVWsyGD
 gFm9Bd1sOrZkfVgzHbI3nk+bOKyxShhEn2jAm8+IwsVYceSR3//Fuw6pKXJ3fwjEPBtd
 PoE8Oyxq5I2KJ7lRuK3VTEtfLsUNQ83EqV2SzIncy06kf89y1m/paMRgLrUPhihv6mpB
 AnFrR5Hg8YuZ7yWAx9ld4TxMkjJ96WJPvf+tC6tSXOkjUYK2XGt1XKXAo2vA5hczOUXv
 JPCQ==
X-Gm-Message-State: ACrzQf2/iBNwqT9v/WUWSVICSR6WZiqbRg3VNTi2wWpDJPqBuFVQP7YH
 einTif916dlC4MwGmr6EfKJl49KhmtA=
X-Google-Smtp-Source: AMsMyM7Ci7WVvgya0o/pK4yeMBVkVIw/GlA7JPqtAIFjIGtfIPxem9k/hSa+tANfGkDRWtFipOk+PA==
X-Received: by 2002:a05:6808:120c:b0:351:6d17:1845 with SMTP id
 a12-20020a056808120c00b003516d171845mr5955253oil.254.1666034437346; 
 Mon, 17 Oct 2022 12:20:37 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:20:36 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 08/38] ppc4xx_sdram: Move size check to ppc4xx_sdram_init()
Date: Mon, 17 Oct 2022 16:19:39 -0300
Message-Id: <20221017192009.92404-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Instead of checking if memory size is valid in board code move this
check to ppc4xx_sdram_init() as this is a restriction imposed by the
SDRAM controller.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <39e5129dd095b285676a6267c5753786da1bc30d.1664021647.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
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
2.37.3


