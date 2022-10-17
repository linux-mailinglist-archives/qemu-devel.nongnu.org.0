Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 600156017FF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:48:09 +0200 (CEST)
Received: from localhost ([::1]:46224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okW5o-0003zi-Al
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfS-0002Dm-BT; Mon, 17 Oct 2022 15:20:54 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:39603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfP-0002us-Sv; Mon, 17 Oct 2022 15:20:54 -0400
Received: by mail-oi1-x229.google.com with SMTP id n130so13219316oia.6;
 Mon, 17 Oct 2022 12:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QY9Kj18IJ5rqPzyXYufSGrMcuTD+LdPJg5fj27oyf14=;
 b=NeF9RKVM8ltyj4WNeAnEmlwYZh7L4NxwBu84jEkiy2u+vQVeKctr0UxAi4jP1aZYli
 KjO64jD5tAm0rbAWzCv8jDUGqr0r7rDhojV3Zc1xAYUJK8I/NZBLi/tBYLLhXAoTnesm
 RDIyRfZhUn1g2qLnVnpynGabZwaxxpUVn7HwtM1kk9Nk/VhEsHpu45ILNOD14x7i6Xu3
 pCZl6lcwNl6dvDFbFYy6imFVIc2RmxzPwxpZWagsFo8p0APU0xFsceSPk+jkZ76a9k52
 F3jJfUDnRjL4coqQJ/0knhMIlvnGuYCDVHGHsvtelurSzvyaUjCBq/kIlWi4DpyqnUsc
 vRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QY9Kj18IJ5rqPzyXYufSGrMcuTD+LdPJg5fj27oyf14=;
 b=v6wtQpM6XNzCTjd8v4IKv06jvKjyOIKlZZWF2gQRDE+eh+y4iovOzir6BsF24PeiEz
 JDJikLQtoxUBSd6hzpetHeP5yBGy+tx981j2SMcAMaDzFBFYzb1GMl06unQ5E6d2dcPn
 1KQfhAQNiJtNdb3hzVzMoCLfX68qSeKYOtRACVx8XJiUXL+EdefxeYS7RgaY0eUpVxE9
 u4schRyUxvptqz5YXGyXvcSMXrwCSDaCTJdyN4UwF//BFZ2W0j4MhtymvDF3TBPLML6z
 ZEmYymqkgot9YwPP4N0jM9338HpOEFZR0zgjWlwGM+Hu4IXAS5dlkh0SORtn4HiL85Op
 KstA==
X-Gm-Message-State: ACrzQf011DJiDgMTOP+2kzxxM5S9Sq+qZXrI1ZisAYVAlMu8P38fyOYT
 6tO0/kifnYN3C/Qz9WwLgq9Psg2mv1k=
X-Google-Smtp-Source: AMsMyM6YX6ArNJ4bxYiH8g4b0/eu9CctdPybON5yp5CsAjBOebDLrs0ykM0z7LghupZ31TeRnYmXVw==
X-Received: by 2002:aca:3608:0:b0:34f:bb9b:cdc9 with SMTP id
 d8-20020aca3608000000b0034fbb9bcdc9mr5709446oia.261.1666034450367; 
 Mon, 17 Oct 2022 12:20:50 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:20:50 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 13/38] ppc440_sdram: Get rid of the init RAM hack
Date: Mon, 17 Oct 2022 16:19:44 -0300
Message-Id: <20221017192009.92404-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
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

Remove the do_init parameter of ppc440_sdram_init and enable SDRAM
controller from the board. Firmware does this so it may only be needed
when booting with -kernel without firmware but we enable SDRAM
unconditionally to preserve previous behaviour.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <c2eda8f83c82f655aa7821a5a8c9310484bd6a1d.1664021647.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
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
2.37.3


