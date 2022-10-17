Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E498601803
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:48:19 +0200 (CEST)
Received: from localhost ([::1]:39310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okW5y-0004m1-5P
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfa-0002K1-2t; Mon, 17 Oct 2022 15:21:03 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:44694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfY-0002vr-7C; Mon, 17 Oct 2022 15:21:01 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 a14-20020a9d470e000000b00661b66a5393so6363475otf.11; 
 Mon, 17 Oct 2022 12:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eDEboB/CKaR5SCzmMnnn8QW/gZpMEIfNfOkYBWCdeSY=;
 b=SEfAbSqThGHEqgjlN22HPJZZ/8jetz2FiUwF8HJGctoU6lt2Ya9yntkJgbbGcfC435
 H1Tw6THvjrLR6iHbGVySgXc0L2C2royTZyqXELxDMdN11662ASL1qScqppLq0x4ijkpW
 FUUMrCefuXOtT6GRLOfbY9K0mBvjsseO56WJw+djXf9Rg7SlOFZEK+HCrY51ABeIgPMW
 CUvHp9hhViEiR1XhqWA6zB5IK0udea5UcMpRXVvOF1EMiWJysIABuJFOM1gvm/QXdTla
 /XcW9cGsSUOoBIapBpoGSWGSAjBnrXj/ORms6mjk2vapsvarqDtrchzNGDpEdXYRG4Q4
 7FlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eDEboB/CKaR5SCzmMnnn8QW/gZpMEIfNfOkYBWCdeSY=;
 b=gJjpxWvVKNJ2K8mUuaaOhBJ7dxd+uvcS3+LW4SO5j/cONlNkFp1OMFknpVtwCCuDXB
 bmVjXDXsuFfTpXd8sHG7jRFBKOu8Gl/q6jS6UwSQk8ZvdBqEMmKjJzJr/xXOpj3IVgeC
 j4v+5Y+8HNjYLJmNhut5yhjWlcIxzIflqBlB320Pg9EX9OgPepF3bcssD96fBf0IiBb5
 i4Q8JqcOqsyTFs3sS8njkh51BRdh8bxrKJ9Wvl0XtJelH3b4ZX3a7mYlyHNvvTW2NEJo
 0+wz6VVx2McZjyggojL8bO9vorMxRpjGhZ9N/rnGlXdF1iyS7qBM0KTDsqV7HoPL3us6
 oARQ==
X-Gm-Message-State: ACrzQf1KgMnFf5jbcPjmR58d9CA+6OJ2n+5itmKt0zgP2KztfYdZfDFV
 ZElWnuvlch7Ay6wQz8PAbvoqoHb9K50=
X-Google-Smtp-Source: AMsMyM52qDIJlnwZ/s3HIImLvLJIgVbJUljn5hjNFJqpxBCnuzlHzV4Cbz3o1oXYPMWxrIeLC9sxzg==
X-Received: by 2002:a9d:6e10:0:b0:661:bbbb:4a4c with SMTP id
 e16-20020a9d6e10000000b00661bbbb4a4cmr5831408otr.228.1666034458294; 
 Mon, 17 Oct 2022 12:20:58 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:20:57 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 16/38] ppc440_sdram: Move RAM size check to ppc440_sdram_init
Date: Mon, 17 Oct 2022 16:19:47 -0300
Message-Id: <20221017192009.92404-17-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32e.google.com
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

Move the check for valid memory sizes from board to sdram controller
init. This adds the missing valid memory sizes of 16 and 8 MiB to the
DoC and the board now only checks for additional restrictions imposed
by its firmware then sdram init checks for valid sizes for SoC.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <41da3797392acaacc7963b79512c8af8005fa4b0.1664021647.git.balaton@eik.bme.hu>
[danielhb: avoid 4*GiB size due to 32 bit build problems]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc440.h    |  4 ++--
 hw/ppc/ppc440_uc.c | 19 +++++++++++--------
 hw/ppc/sam460ex.c  | 32 +++++++++++++++++---------------
 3 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/hw/ppc/ppc440.h b/hw/ppc/ppc440.h
index 01d76b8000..29f6f14ed7 100644
--- a/hw/ppc/ppc440.h
+++ b/hw/ppc/ppc440.h
@@ -11,13 +11,13 @@
 #ifndef PPC440_H
 #define PPC440_H
 
-#include "hw/ppc/ppc4xx.h"
+#include "hw/ppc/ppc.h"
 
 void ppc4xx_l2sram_init(CPUPPCState *env);
 void ppc4xx_cpr_init(CPUPPCState *env);
 void ppc4xx_sdr_init(CPUPPCState *env);
 void ppc440_sdram_init(CPUPPCState *env, int nbanks,
-                       Ppc4xxSdramBank *ram_banks);
+                       MemoryRegion *ram);
 void ppc4xx_ahb_init(CPUPPCState *env);
 void ppc4xx_dma_init(CPUPPCState *env, int dcr_base);
 void ppc460ex_pcie_init(CPUPPCState *env);
diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index edd0781eb7..dd873d892c 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -487,7 +487,7 @@ void ppc4xx_sdr_init(CPUPPCState *env)
 typedef struct ppc440_sdram_t {
     uint32_t addr;
     uint32_t mcopt2;
-    int nbanks;
+    int nbanks; /* Banks to use from the 4, e.g. when board has less slots */
     Ppc4xxSdramBank bank[4];
 } ppc440_sdram_t;
 
@@ -733,18 +733,21 @@ static void sdram_ddr2_reset(void *opaque)
 }
 
 void ppc440_sdram_init(CPUPPCState *env, int nbanks,
-                       Ppc4xxSdramBank *ram_banks)
+                       MemoryRegion *ram)
 {
     ppc440_sdram_t *s;
-    int i;
+    /*
+     * SoC also has 4 GiB but that causes problem with 32 bit
+     * builds (4*GiB overflows the 32 bit ram_addr_t).
+     */
+    const ram_addr_t valid_bank_sizes[] = {
+        2 * GiB, 1 * GiB, 512 * MiB, 256 * MiB, 128 * MiB,
+        64 * MiB, 32 * MiB, 16 * MiB, 8 * MiB, 0
+    };
 
     s = g_malloc0(sizeof(*s));
     s->nbanks = nbanks;
-    for (i = 0; i < nbanks; i++) {
-        s->bank[i].ram = ram_banks[i].ram;
-        s->bank[i].base = ram_banks[i].base;
-        s->bank[i].size = ram_banks[i].size;
-    }
+    ppc4xx_sdram_banks(ram, s->nbanks, s->bank, valid_bank_sizes);
     qemu_register_reset(&sdram_ddr2_reset, s);
     ppc_dcr_register(env, SDRAM0_CFGADDR,
                      s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index b318521b01..13055a8916 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -74,13 +74,6 @@
 #define EBC_FREQ 115000000
 #define UART_FREQ 11059200
 
-/* The SoC could also handle 4 GiB but firmware does not work with that. */
-/* Maybe it overflows a signed 32 bit number somewhere? */
-static const ram_addr_t ppc460ex_sdram_bank_sizes[] = {
-    2 * GiB, 1 * GiB, 512 * MiB, 256 * MiB, 128 * MiB, 64 * MiB,
-    32 * MiB, 0
-};
-
 struct boot_info {
     uint32_t dt_base;
     uint32_t dt_size;
@@ -273,7 +266,6 @@ static void sam460ex_init(MachineState *machine)
 {
     MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *isa = g_new(MemoryRegion, 1);
-    Ppc4xxSdramBank *ram_banks = g_new0(Ppc4xxSdramBank, 1);
     MemoryRegion *l2cache_ram = g_new(MemoryRegion, 1);
     DeviceState *uic[4];
     int i;
@@ -340,12 +332,22 @@ static void sam460ex_init(MachineState *machine)
     }
 
     /* SDRAM controller */
-    /* put all RAM on first bank because board has one slot
-     * and firmware only checks that */
-    ppc4xx_sdram_banks(machine->ram, 1, ram_banks, ppc460ex_sdram_bank_sizes);
-
+    /* The SoC could also handle 4 GiB but firmware does not work with that. */
+    if (machine->ram_size > 2 * GiB) {
+        error_report("Memory over 2 GiB is not supported");
+        exit(1);
+    }
+    /* Firmware needs at least 64 MiB */
+    if (machine->ram_size < 64 * MiB) {
+        error_report("Memory below 64 MiB is not supported");
+        exit(1);
+    }
+    /*
+     * Put all RAM on first bank because board has one slot
+     * and firmware only checks that
+     */
+    ppc440_sdram_init(env, 1, machine->ram);
     /* FIXME: does 460EX have ECC interrupts? */
-    ppc440_sdram_init(env, 1, ram_banks);
     /* Enable SDRAM memory regions as we may boot without firmware */
     ppc4xx_sdram_ddr2_enable(env);
 
@@ -354,8 +356,8 @@ static void sam460ex_init(MachineState *machine)
                                qdev_get_gpio_in(uic[0], 2));
     i2c = PPC4xx_I2C(dev)->bus;
     /* SPD EEPROM on RAM module */
-    spd_data = spd_data_generate(ram_banks->size < 128 * MiB ? DDR : DDR2,
-                                 ram_banks->size);
+    spd_data = spd_data_generate(machine->ram_size < 128 * MiB ? DDR : DDR2,
+                                 machine->ram_size);
     spd_data[20] = 4; /* SO-DIMM module */
     smbus_eeprom_init_one(i2c, 0x50, spd_data);
     /* RTC */
-- 
2.37.3


