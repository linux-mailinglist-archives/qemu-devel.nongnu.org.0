Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A53D96017DD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:40:26 +0200 (CEST)
Received: from localhost ([::1]:44454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVyL-00048t-5X
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfd-0002Qv-Nc; Mon, 17 Oct 2022 15:21:07 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:34752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfb-0002wJ-KN; Mon, 17 Oct 2022 15:21:05 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1321a1e94b3so14411459fac.1; 
 Mon, 17 Oct 2022 12:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DPXl1Gm2g7mHh9cdSYveKslac/TylmOSXU/YJk+sAgU=;
 b=ArC0YsMz623Gl7vUmuHWNkh9VUz43mmqo1n4ETtwj7V59s7JgoFgepn7SPnP6u+IU4
 E3AIltbz6bGk3zLMmpjiWVmjafbvDTAco2726Dj+CK+71osWUsZzT1WqWtMdU7Ylg+9j
 xu1MgJS25YojLZO/H6y9qAZXSyj2Uqf0FQZFq1GlyOt+AEAD8IJdQ6M9qowuntQoxdgH
 iBSgn9rhE/QY9EB2c+BDJUHdVfxGoJFbdwCjadJYQxI0756eZMpmMnU42QLD4NNc66Qv
 9eypmt1+mpfRjoLvDBJCmM2xjM0zSB0M6nvkOxE6BAMwsP9cCLVdfeYFgjX4mAU6z2e0
 thCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DPXl1Gm2g7mHh9cdSYveKslac/TylmOSXU/YJk+sAgU=;
 b=PVnGQR3uE8vwxYThBCgPBBSAA09T+zAxTG/X6HUnoVf3qyzbZ1K5lJnV2hdY9NmSkq
 LKKKusSORINDqhHzI4tkeegDeGg8aSZSHzJcm9UmNqp5mqzM5D92LDfKlE/4W1X2N0+C
 biaY/GEeLJPI8tyF5wrkhlTg7f8MKuo3PuQzqQ/P3rL4tQsclyxHBfdDLF1MrPAIk1OF
 nAQna3kHaYTQvxYkyfy8IAZeX7VAA+L74vUTSYmull1P0/JrcOvqHmnOzpdtt9qTUNae
 em0fx0IinjQY2QscrZr6XJJnZGdvrGbyiaH/K2uPyU+nZR7D8NyC6iwPP7SckG0AuP2H
 egpQ==
X-Gm-Message-State: ACrzQf3mRZA3hnDwejMZFFABNk4KsWHS7IfU6IlUdZgOKv7pPEQ4Aux4
 DzYnILVFMy27WkuqLgwx2ZxjU88nDME=
X-Google-Smtp-Source: AMsMyM5kRUXNZOJrBerL8EQlw9EXe51u/hkZW0zuQfeAr1u/B/w0f16g8ES66nuptbx2kwe/bpz0Fw==
X-Received: by 2002:a05:6870:460b:b0:133:2116:3571 with SMTP id
 z11-20020a056870460b00b0013321163571mr6594541oao.176.1666034461085; 
 Mon, 17 Oct 2022 12:21:01 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:21:00 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 17/38] ppc440_sdram: QOM'ify
Date: Mon, 17 Oct 2022 16:19:48 -0300
Message-Id: <20221017192009.92404-18-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
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

Change the ppc440_sdram model to a QOM class derived from the
PPC4xx-dcr-device and name it ppc4xx-sdram-ddr2. This is mostly
modelling the DDR2 SDRAM controller found in the 460EX (used on the
sam460ex board). Newer SoCs (regardless of their PPC core, e.g. 405EX)
may have this controller but we only emulate enough of it for the
sam460ex u-boot firmware.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <3e82ae575c7c41e464a0082d55ecb4ebcc4d4329.1664021647.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc440.h         |   2 -
 hw/ppc/ppc440_uc.c      | 121 ++++++++++++++++++++++++----------------
 hw/ppc/sam460ex.c       |   9 ++-
 include/hw/ppc/ppc4xx.h |  18 +++++-
 4 files changed, 97 insertions(+), 53 deletions(-)

diff --git a/hw/ppc/ppc440.h b/hw/ppc/ppc440.h
index 29f6f14ed7..7c24db8504 100644
--- a/hw/ppc/ppc440.h
+++ b/hw/ppc/ppc440.h
@@ -16,8 +16,6 @@
 void ppc4xx_l2sram_init(CPUPPCState *env);
 void ppc4xx_cpr_init(CPUPPCState *env);
 void ppc4xx_sdr_init(CPUPPCState *env);
-void ppc440_sdram_init(CPUPPCState *env, int nbanks,
-                       MemoryRegion *ram);
 void ppc4xx_ahb_init(CPUPPCState *env);
 void ppc4xx_dma_init(CPUPPCState *env, int dcr_base);
 void ppc460ex_pcie_init(CPUPPCState *env);
diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index dd873d892c..55082f2b88 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -484,13 +484,6 @@ void ppc4xx_sdr_init(CPUPPCState *env)
 
 /*****************************************************************************/
 /* SDRAM controller */
-typedef struct ppc440_sdram_t {
-    uint32_t addr;
-    uint32_t mcopt2;
-    int nbanks; /* Banks to use from the 4, e.g. when board has less slots */
-    Ppc4xxSdramBank bank[4];
-} ppc440_sdram_t;
-
 enum {
     SDRAM0_CFGADDR = 0x10,
     SDRAM0_CFGDATA,
@@ -581,7 +574,7 @@ static void sdram_bank_unmap(Ppc4xxSdramBank *bank)
     object_unparent(OBJECT(&bank->container));
 }
 
-static void sdram_ddr2_set_bcr(ppc440_sdram_t *sdram, int i,
+static void sdram_ddr2_set_bcr(Ppc4xxSdramDdr2State *sdram, int i,
                                uint32_t bcr, int enabled)
 {
     if (sdram->bank[i].bcr & 1) {
@@ -597,7 +590,7 @@ static void sdram_ddr2_set_bcr(ppc440_sdram_t *sdram, int i,
     }
 }
 
-static void sdram_ddr2_map_bcr(ppc440_sdram_t *sdram)
+static void sdram_ddr2_map_bcr(Ppc4xxSdramDdr2State *sdram)
 {
     int i;
 
@@ -612,7 +605,7 @@ static void sdram_ddr2_map_bcr(ppc440_sdram_t *sdram)
     }
 }
 
-static void sdram_ddr2_unmap_bcr(ppc440_sdram_t *sdram)
+static void sdram_ddr2_unmap_bcr(Ppc4xxSdramDdr2State *sdram)
 {
     int i;
 
@@ -625,7 +618,7 @@ static void sdram_ddr2_unmap_bcr(ppc440_sdram_t *sdram)
 
 static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
 {
-    ppc440_sdram_t *sdram = opaque;
+    Ppc4xxSdramDdr2State *sdram = opaque;
     uint32_t ret = 0;
 
     switch (dcrn) {
@@ -680,7 +673,7 @@ static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
 
 static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
 {
-    ppc440_sdram_t *sdram = opaque;
+    Ppc4xxSdramDdr2State *sdram = opaque;
 
     switch (dcrn) {
     case SDRAM_R0BAS:
@@ -724,18 +717,18 @@ static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
     }
 }
 
-static void sdram_ddr2_reset(void *opaque)
+static void ppc4xx_sdram_ddr2_reset(DeviceState *dev)
 {
-    ppc440_sdram_t *sdram = opaque;
+    Ppc4xxSdramDdr2State *sdram = PPC4xx_SDRAM_DDR2(dev);
 
     sdram->addr = 0;
     sdram->mcopt2 = 0;
 }
 
-void ppc440_sdram_init(CPUPPCState *env, int nbanks,
-                       MemoryRegion *ram)
+static void ppc4xx_sdram_ddr2_realize(DeviceState *dev, Error **errp)
 {
-    ppc440_sdram_t *s;
+    Ppc4xxSdramDdr2State *s = PPC4xx_SDRAM_DDR2(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
     /*
      * SoC also has 4 GiB but that causes problem with 32 bit
      * builds (4*GiB overflows the 32 bit ram_addr_t).
@@ -745,41 +738,75 @@ void ppc440_sdram_init(CPUPPCState *env, int nbanks,
         64 * MiB, 32 * MiB, 16 * MiB, 8 * MiB, 0
     };
 
-    s = g_malloc0(sizeof(*s));
-    s->nbanks = nbanks;
-    ppc4xx_sdram_banks(ram, s->nbanks, s->bank, valid_bank_sizes);
-    qemu_register_reset(&sdram_ddr2_reset, s);
-    ppc_dcr_register(env, SDRAM0_CFGADDR,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc_dcr_register(env, SDRAM0_CFGDATA,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-
-    ppc_dcr_register(env, SDRAM_R0BAS,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc_dcr_register(env, SDRAM_R1BAS,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc_dcr_register(env, SDRAM_R2BAS,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc_dcr_register(env, SDRAM_R3BAS,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc_dcr_register(env, SDRAM_CONF1HB,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc_dcr_register(env, SDRAM_PLBADDULL,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc_dcr_register(env, SDRAM_CONF1LL,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc_dcr_register(env, SDRAM_CONFPATHB,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
-    ppc_dcr_register(env, SDRAM_PLBADDUHB,
-                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
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
 }
 
-void ppc4xx_sdram_ddr2_enable(CPUPPCState *env)
+void ppc4xx_sdram_ddr2_enable(Ppc4xxSdramDdr2State *s)
 {
-    ppc_dcr_write(env->dcr_env, SDRAM0_CFGADDR, 0x21);
-    ppc_dcr_write(env->dcr_env, SDRAM0_CFGDATA, 0x08000000);
+    sdram_ddr2_dcr_write(s, SDRAM0_CFGADDR, 0x21);
+    sdram_ddr2_dcr_write(s, SDRAM0_CFGDATA, 0x08000000);
 }
 
+static const TypeInfo ppc4xx_types[] = {
+    {
+        .name           = TYPE_PPC4xx_SDRAM_DDR2,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc4xxSdramDdr2State),
+        .class_init     = ppc4xx_sdram_ddr2_class_init,
+    }
+};
+DEFINE_TYPES(ppc4xx_types)
+
 /*****************************************************************************/
 /* PLB to AHB bridge */
 enum {
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 13055a8916..f03cdc9ecc 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -342,14 +342,19 @@ static void sam460ex_init(MachineState *machine)
         error_report("Memory below 64 MiB is not supported");
         exit(1);
     }
+    dev = qdev_new(TYPE_PPC4xx_SDRAM_DDR2);
+    object_property_set_link(OBJECT(dev), "dram", OBJECT(machine->ram),
+                             &error_abort);
     /*
      * Put all RAM on first bank because board has one slot
      * and firmware only checks that
      */
-    ppc440_sdram_init(env, 1, machine->ram);
+    object_property_set_int(OBJECT(dev), "nbanks", 1, &error_abort);
+    ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
+    object_unref(OBJECT(dev));
     /* FIXME: does 460EX have ECC interrupts? */
     /* Enable SDRAM memory regions as we may boot without firmware */
-    ppc4xx_sdram_ddr2_enable(env);
+    ppc4xx_sdram_ddr2_enable(PPC4xx_SDRAM_DDR2(dev));
 
     /* IIC controllers and devices */
     dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600700,
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index fd0b3ca82a..ff88385ac0 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -37,8 +37,6 @@ typedef struct {
     uint32_t bcr;
 } Ppc4xxSdramBank;
 
-void ppc4xx_sdram_ddr2_enable(CPUPPCState *env);
-
 void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
                         Ppc4xxSdramBank ram_banks[],
                         const ram_addr_t sdram_bank_sizes[]);
@@ -138,4 +136,20 @@ struct Ppc4xxSdramDdrState {
 
 void ppc4xx_sdram_ddr_enable(Ppc4xxSdramDdrState *s);
 
+/* SDRAM DDR2 controller */
+#define TYPE_PPC4xx_SDRAM_DDR2 "ppc4xx-sdram-ddr2"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxSdramDdr2State, PPC4xx_SDRAM_DDR2);
+struct Ppc4xxSdramDdr2State {
+    Ppc4xxDcrDeviceState parent_obj;
+
+    MemoryRegion *dram_mr;
+    uint32_t nbanks; /* Banks to use from 4, e.g. when board has less slots */
+    Ppc4xxSdramBank bank[4];
+
+    uint32_t addr;
+    uint32_t mcopt2;
+};
+
+void ppc4xx_sdram_ddr2_enable(Ppc4xxSdramDdr2State *s);
+
 #endif /* PPC4XX_H */
-- 
2.37.3


