Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B886017F1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:44:56 +0200 (CEST)
Received: from localhost ([::1]:47492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okW2h-00065w-7I
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfL-00027T-1x; Mon, 17 Oct 2022 15:20:48 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:37467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfI-0002u8-M9; Mon, 17 Oct 2022 15:20:46 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-12c8312131fso14405528fac.4; 
 Mon, 17 Oct 2022 12:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L+F+1JjcNb4/Wf0SU/a4zB9X6iRc6akJhwpK72igWTM=;
 b=DdCjNmX8ZYg2gTN5rIDRqaW2Y2HBNoRpH99qbnBEs6XFwg0nYA7R8l1rpsswJQtsor
 JKPho+H+MfN3WzrL1I7cMzK/LhEOxW3jpNRFEVjqOCXJezklFfBDfLZfdL3d2g2r+AAv
 af5T+VXVmH4uKR4mODmz207J0pn6Z6RxS4cbldMI9zdnr9UxOyCycD1A2JEa8AC39o16
 XVGkoPE1u7/AtcRrVSS/8wa4TmHfN8UmDQlYqLA8vWleUcr+BnKluEa6xf9hz32na74D
 H7yWNN/lQaCjPtQzhByMRyw3mRs4cC4mpwRUjKYS3ZL+GeBjrWBSY+kWasit1OzVIVxS
 xYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L+F+1JjcNb4/Wf0SU/a4zB9X6iRc6akJhwpK72igWTM=;
 b=z9UD9vXUlaqTtSEiULJem3xtmFsiSeAO3ckr+x5h7h6uIoiJCyXvnqauJ/G0CvtXtY
 a19Iv1elOMS3f/pWVWztkRAGsIelePlz3RHT8nCC3vARUaE1eDB8KrX7XZkg2eBzmh6I
 alx3Lz/Wlaydb/MblZhHtPfOol3c7G/W1y2P7aU0j+dtZNr6lOXFkKhG431t5AcrVksd
 T/twrmpgwG2ErKujO7o2+WcLf3tiCEL/CI+qTBuopADUJX5jHUjfGDiYU3BrpUaUgAHS
 OIMwjqed/no/ts/jEE/9XWzp6T+AI0yyyHvlGk2aRD1nGlB4ul14YHS0SLn7ZVIW8SLX
 YAng==
X-Gm-Message-State: ACrzQf0XBk9w5eEoBAdQxlzyEh1hjNT4/VMHI7vNFFcDmrWrzsfGZqfn
 etdUi98qUjnjJ+75hff8iwOz+AXotjU=
X-Google-Smtp-Source: AMsMyM5VD65PUiRkm3gzK4aUbLrXmqvABXFm+V+N5eVGc5m6SBxJAwuIzqKn6QP3eJpNAH+S61DCXQ==
X-Received: by 2002:a05:6870:7390:b0:131:de6f:b7ce with SMTP id
 z16-20020a056870739000b00131de6fb7cemr16341120oam.245.1666034431644; 
 Mon, 17 Oct 2022 12:20:31 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:20:31 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 06/38] ppc4xx: Use Ppc4xxSdramBank in ppc4xx_sdram_banks()
Date: Mon, 17 Oct 2022 16:19:37 -0300
Message-Id: <20221017192009.92404-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
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

Change ppc4xx_sdram_banks() to take one Ppc4xxSdramBank array instead
of the separate arrays and adjust ppc4xx_sdram_init() and
ppc440_sdram_init() accordingly as well as machines using these.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <e3a1fea51f29779fd6a61be90a29c684f3299544.1664021647.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405.h         |  4 +---
 hw/ppc/ppc405_uc.c      | 10 +++++-----
 hw/ppc/ppc440.h         |  5 ++---
 hw/ppc/ppc440_bamboo.c  | 15 ++++++---------
 hw/ppc/ppc440_uc.c      |  9 ++++-----
 hw/ppc/ppc4xx_devs.c    | 21 +++++++++------------
 hw/ppc/sam460ex.c       | 15 +++++----------
 include/hw/ppc/ppc4xx.h |  9 +++------
 8 files changed, 35 insertions(+), 53 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 756865621b..ca0972b88b 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -167,9 +167,7 @@ struct Ppc405SoCState {
     DeviceState parent_obj;
 
     /* Public */
-    MemoryRegion ram_banks[2];
-    hwaddr ram_bases[2], ram_sizes[2];
-
+    Ppc4xxSdramBank ram_banks[2];
     MemoryRegion *dram_mr;
     hwaddr ram_size;
 
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 1e02347e57..bcbf35bc14 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1074,14 +1074,14 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 
     /* SDRAM controller */
         /* XXX 405EP has no ECC interrupt */
-    s->ram_bases[0] = 0;
-    s->ram_sizes[0] = s->ram_size;
-    memory_region_init_alias(&s->ram_banks[0], OBJECT(s),
+    s->ram_banks[0].base = 0;
+    s->ram_banks[0].size = s->ram_size;
+    memory_region_init_alias(&s->ram_banks[0].ram, OBJECT(s),
                              "ppc405.sdram0", s->dram_mr,
-                             s->ram_bases[0], s->ram_sizes[0]);
+                             s->ram_banks[0].base, s->ram_banks[0].size);
 
     ppc4xx_sdram_init(env, qdev_get_gpio_in(DEVICE(&s->uic), 17), 1,
-                      s->ram_banks, s->ram_bases, s->ram_sizes);
+                      s->ram_banks);
 
     /* External bus controller */
     if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->ebc), &s->cpu, errp)) {
diff --git a/hw/ppc/ppc440.h b/hw/ppc/ppc440.h
index 7cef936125..e6c905b7d6 100644
--- a/hw/ppc/ppc440.h
+++ b/hw/ppc/ppc440.h
@@ -11,14 +11,13 @@
 #ifndef PPC440_H
 #define PPC440_H
 
-#include "hw/ppc/ppc.h"
+#include "hw/ppc/ppc4xx.h"
 
 void ppc4xx_l2sram_init(CPUPPCState *env);
 void ppc4xx_cpr_init(CPUPPCState *env);
 void ppc4xx_sdr_init(CPUPPCState *env);
 void ppc440_sdram_init(CPUPPCState *env, int nbanks,
-                       MemoryRegion *ram_memories,
-                       hwaddr *ram_bases, hwaddr *ram_sizes,
+                       Ppc4xxSdramBank *ram_banks,
                        int do_init);
 void ppc4xx_ahb_init(CPUPPCState *env);
 void ppc4xx_dma_init(CPUPPCState *env, int dcr_base);
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 409a8840da..edfb8c9709 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -168,9 +168,8 @@ static void bamboo_init(MachineState *machine)
     unsigned int pci_irq_nrs[4] = { 28, 27, 26, 25 };
     MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *isa = g_new(MemoryRegion, 1);
-    MemoryRegion *ram_memories = g_new(MemoryRegion, PPC440EP_SDRAM_NR_BANKS);
-    hwaddr ram_bases[PPC440EP_SDRAM_NR_BANKS] = {0};
-    hwaddr ram_sizes[PPC440EP_SDRAM_NR_BANKS] = {0};
+    Ppc4xxSdramBank *ram_banks = g_new0(Ppc4xxSdramBank,
+                                        PPC440EP_SDRAM_NR_BANKS);
     PCIBus *pcibus;
     PowerPCCPU *cpu;
     CPUPPCState *env;
@@ -205,13 +204,11 @@ static void bamboo_init(MachineState *machine)
                        qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
 
     /* SDRAM controller */
-    ppc4xx_sdram_banks(machine->ram, PPC440EP_SDRAM_NR_BANKS, ram_memories,
-                       ram_bases, ram_sizes, ppc440ep_sdram_bank_sizes);
+    ppc4xx_sdram_banks(machine->ram, PPC440EP_SDRAM_NR_BANKS, ram_banks,
+                       ppc440ep_sdram_bank_sizes);
     /* XXX 440EP's ECC interrupts are on UIC1, but we've only created UIC0. */
-    ppc4xx_sdram_init(env,
-                      qdev_get_gpio_in(uicdev, 14),
-                      PPC440EP_SDRAM_NR_BANKS, ram_memories,
-                      ram_bases, ram_sizes);
+    ppc4xx_sdram_init(env, qdev_get_gpio_in(uicdev, 14),
+                      PPC440EP_SDRAM_NR_BANKS, ram_banks);
     /* Enable SDRAM memory regions, this should be done by the firmware */
     ppc4xx_sdram_enable(env);
 
diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index db33334e29..8eae4ad9f0 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -692,8 +692,7 @@ static void sdram_reset(void *opaque)
 }
 
 void ppc440_sdram_init(CPUPPCState *env, int nbanks,
-                       MemoryRegion *ram_memories,
-                       hwaddr *ram_bases, hwaddr *ram_sizes,
+                       Ppc4xxSdramBank *ram_banks,
                        int do_init)
 {
     ppc440_sdram_t *sdram;
@@ -702,9 +701,9 @@ void ppc440_sdram_init(CPUPPCState *env, int nbanks,
     sdram = g_malloc0(sizeof(*sdram));
     sdram->nbanks = nbanks;
     for (i = 0; i < nbanks; i++) {
-        sdram->bank[i].ram = ram_memories[i];
-        sdram->bank[i].base = ram_bases[i];
-        sdram->bank[i].size = ram_sizes[i];
+        sdram->bank[i].ram = ram_banks[i].ram;
+        sdram->bank[i].base = ram_banks[i].base;
+        sdram->bank[i].size = ram_banks[i].size;
     }
     qemu_register_reset(&sdram_reset, sdram);
     ppc_dcr_register(env, SDRAM0_CFGADDR,
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 3475589679..fcbda57c55 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -348,9 +348,7 @@ static void sdram_reset(void *opaque)
 }
 
 void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
-                       MemoryRegion *ram_memories,
-                       hwaddr *ram_bases,
-                       hwaddr *ram_sizes)
+                       Ppc4xxSdramBank *ram_banks)
 {
     ppc4xx_sdram_t *sdram;
     int i;
@@ -359,9 +357,9 @@ void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
     sdram->irq = irq;
     sdram->nbanks = nbanks;
     for (i = 0; i < nbanks; i++) {
-        sdram->bank[i].ram = ram_memories[i];
-        sdram->bank[i].base = ram_bases[i];
-        sdram->bank[i].size = ram_sizes[i];
+        sdram->bank[i].ram = ram_banks[i].ram;
+        sdram->bank[i].base = ram_banks[i].base;
+        sdram->bank[i].size = ram_banks[i].size;
     }
     qemu_register_reset(&sdram_reset, sdram);
     ppc_dcr_register(env, SDRAM0_CFGADDR,
@@ -387,8 +385,7 @@ void ppc4xx_sdram_enable(CPUPPCState *env)
  * sizes varies by SoC.
  */
 void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
-                        MemoryRegion ram_memories[],
-                        hwaddr ram_bases[], hwaddr ram_sizes[],
+                        Ppc4xxSdramBank ram_banks[],
                         const ram_addr_t sdram_bank_sizes[])
 {
     ram_addr_t size_left = memory_region_size(ram);
@@ -403,13 +400,13 @@ void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
             if (bank_size <= size_left) {
                 char name[32];
 
-                ram_bases[i] = base;
-                ram_sizes[i] = bank_size;
+                ram_banks[i].base = base;
+                ram_banks[i].size = bank_size;
                 base += bank_size;
                 size_left -= bank_size;
                 snprintf(name, sizeof(name), "ppc4xx.sdram%d", i);
-                memory_region_init_alias(&ram_memories[i], NULL, name, ram,
-                                         ram_bases[i], ram_sizes[i]);
+                memory_region_init_alias(&ram_banks[i].ram, NULL, name, ram,
+                                         ram_banks[i].base, ram_banks[i].size);
                 break;
             }
         }
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 850bb3b817..f4c2a693fb 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -73,7 +73,6 @@
 #define OPB_FREQ 115000000
 #define EBC_FREQ 115000000
 #define UART_FREQ 11059200
-#define SDRAM_NR_BANKS 4
 
 /* The SoC could also handle 4 GiB but firmware does not work with that. */
 /* Maybe it overflows a signed 32 bit number somewhere? */
@@ -274,9 +273,7 @@ static void sam460ex_init(MachineState *machine)
 {
     MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *isa = g_new(MemoryRegion, 1);
-    MemoryRegion *ram_memories = g_new(MemoryRegion, SDRAM_NR_BANKS);
-    hwaddr ram_bases[SDRAM_NR_BANKS] = {0};
-    hwaddr ram_sizes[SDRAM_NR_BANKS] = {0};
+    Ppc4xxSdramBank *ram_banks = g_new0(Ppc4xxSdramBank, 1);
     MemoryRegion *l2cache_ram = g_new(MemoryRegion, 1);
     DeviceState *uic[4];
     int i;
@@ -345,20 +342,18 @@ static void sam460ex_init(MachineState *machine)
     /* SDRAM controller */
     /* put all RAM on first bank because board has one slot
      * and firmware only checks that */
-    ppc4xx_sdram_banks(machine->ram, 1, ram_memories, ram_bases, ram_sizes,
-                       ppc460ex_sdram_bank_sizes);
+    ppc4xx_sdram_banks(machine->ram, 1, ram_banks, ppc460ex_sdram_bank_sizes);
 
     /* FIXME: does 460EX have ECC interrupts? */
-    ppc440_sdram_init(env, SDRAM_NR_BANKS, ram_memories,
-                      ram_bases, ram_sizes, 1);
+    ppc440_sdram_init(env, 1, ram_banks, 1);
 
     /* IIC controllers and devices */
     dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600700,
                                qdev_get_gpio_in(uic[0], 2));
     i2c = PPC4xx_I2C(dev)->bus;
     /* SPD EEPROM on RAM module */
-    spd_data = spd_data_generate(ram_sizes[0] < 128 * MiB ? DDR : DDR2,
-                                 ram_sizes[0]);
+    spd_data = spd_data_generate(ram_banks->size < 128 * MiB ? DDR : DDR2,
+                                 ram_banks->size);
     spd_data[20] = 4; /* SO-DIMM module */
     smbus_eeprom_init_one(i2c, 0x50, spd_data);
     /* RTC */
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index 13b3229851..a7b41c7eaa 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -40,14 +40,11 @@ typedef struct {
 void ppc4xx_sdram_enable(CPUPPCState *env);
 
 void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
-                        MemoryRegion ram_memories[],
-                        hwaddr ram_bases[], hwaddr ram_sizes[],
+                        Ppc4xxSdramBank ram_banks[],
                         const ram_addr_t sdram_bank_sizes[]);
 
-void ppc4xx_sdram_init (CPUPPCState *env, qemu_irq irq, int nbanks,
-                        MemoryRegion ram_memories[],
-                        hwaddr *ram_bases,
-                        hwaddr *ram_sizes);
+void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
+                       Ppc4xxSdramBank *ram_banks);
 
 #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
 
-- 
2.37.3


