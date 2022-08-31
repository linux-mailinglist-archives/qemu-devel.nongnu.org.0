Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3B35A86DF
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:39:53 +0200 (CEST)
Received: from localhost ([::1]:42686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTZ2-0004At-IH
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpI-000510-SH; Wed, 31 Aug 2022 14:52:36 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:36356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpF-0008Ah-OV; Wed, 31 Aug 2022 14:52:36 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-11f11d932a8so17879557fac.3; 
 Wed, 31 Aug 2022 11:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=s/zdOvjPcpnrdO6dY7ITLPaCBlyqQYBoCUfJukmDMls=;
 b=Cr5G8XHYu4lTxw0DHGiYyvjuXyfS2258APD3q3ABZaeIQYxM0w4VWgRmOuUHD0mS/b
 7c+H504l6k2Rl3c3pWclj8pKZa4fJPSw9j7YbB4iamxInBDFEY3uIh7u1RdYcFzrBCKi
 dS8mFoNbywdrjrElWi0+OxDFvaoclf/KyHQmzO3IHGTyMDs9IdDDXoa068R5mV0z2IUA
 AJusTTf024IhIWN6LRD6WKtDELyM2fqES1xiz2Q6Xz1GP9HcuY2WFYSuIoBDV7tteIjm
 JYt7Gf0DRjtSTs6g37HCVaoXAnRsDb7PmgK5CZtBXTRTht4Vt/zUx87Mjn+2Hd1yc0NG
 7FeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=s/zdOvjPcpnrdO6dY7ITLPaCBlyqQYBoCUfJukmDMls=;
 b=4hAVkQymFSg8jqYW3aLsoGpz1Mq3oHeuPOG7uDe34pWM26rI0G7cOHmeXWFDmd/UwV
 7eWgF/NYul6FGJwBsdO1kukPQ2SvCCPXJzDcjQtbwnGTQIE/l531dh66GtRVeB+e0f3b
 eF9lQ3/zo8GV4+5nywo14RpdQ6S83uT3Tg1v8fXnl/+3h+D57Yh4Dc5/BTopGqYlpOZK
 fI5ToCVnieZLLu2PACWQPiI1YJQbopGN6Ve/j0/H4HVtUMixF88MaP9GhHZzXAGkFp1z
 MrbOryBcuUAjwY9gTOCtze8L/BMf5QJXMbPkaCYDm5lTsqUIAZdtjZ+lNx0S31xjvI1M
 rh2g==
X-Gm-Message-State: ACgBeo0hdLyGeSjbQrdJu7vLppYv9T+cvpTbmllosoATf+y5jxsB/uF7
 dnbt9iHC9+E+w6m83bSVqlodWroJHIU=
X-Google-Smtp-Source: AA6agR4ES7n1rZG2ei0puR60MeakbsR4PPEhXCo/NDfNj43z5gvx580WRUKxtJ5tApsEgvGivbOzJw==
X-Received: by 2002:a05:6870:c18f:b0:11c:abda:ba81 with SMTP id
 h15-20020a056870c18f00b0011cabdaba81mr2264761oad.229.1661971951102; 
 Wed, 31 Aug 2022 11:52:31 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:52:30 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 38/60] ppc/ppc405: QOM'ify CPC
Date: Wed, 31 Aug 2022 15:50:12 -0300
Message-Id: <20220831185034.23240-39-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Cédric Le Goater <clg@kaod.org>

The CPC controller is currently modeled as a DCR device.

Now that all clock settings are handled at the CPC level, change the
SoC "sys-clk" property to be an alias on the same property in the CPC
model.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
[balaton: ppc4xx_dcr_register changes]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <23393cb91a2c6c560a4461b3e9d1baa48ae28f74.1660746880.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405.h    |  35 ++++++++++-
 hw/ppc/ppc405_uc.c | 141 ++++++++++++++++++++-------------------------
 2 files changed, 95 insertions(+), 81 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 8cc76cc8b3..2ba829988d 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,6 +63,39 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
 };
 
+#define TYPE_PPC405_CPC "ppc405-cpc"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405CpcState, PPC405_CPC);
+
+enum {
+    PPC405EP_CPU_CLK   = 0,
+    PPC405EP_PLB_CLK   = 1,
+    PPC405EP_OPB_CLK   = 2,
+    PPC405EP_EBC_CLK   = 3,
+    PPC405EP_MAL_CLK   = 4,
+    PPC405EP_PCI_CLK   = 5,
+    PPC405EP_UART0_CLK = 6,
+    PPC405EP_UART1_CLK = 7,
+    PPC405EP_CLK_NB    = 8,
+};
+
+struct Ppc405CpcState {
+    Ppc4xxDcrDeviceState parent_obj;
+
+    uint32_t sysclk;
+    clk_setup_t clk_setup[PPC405EP_CLK_NB];
+    uint32_t boot;
+    uint32_t epctl;
+    uint32_t pllmr[2];
+    uint32_t ucr;
+    uint32_t srr;
+    uint32_t jtagid;
+    uint32_t pci;
+    /* Clock and power management */
+    uint32_t er;
+    uint32_t fr;
+    uint32_t sr;
+};
+
 #define TYPE_PPC405_SOC "ppc405-soc"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405SoCState, PPC405_SOC);
 
@@ -78,9 +111,9 @@ struct Ppc405SoCState {
     MemoryRegion *dram_mr;
     hwaddr ram_size;
 
-    uint32_t sysclk;
     PowerPCCPU cpu;
     DeviceState *uic;
+    Ppc405CpcState cpc;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 14a525b2eb..ec83c292a5 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1178,36 +1178,7 @@ enum {
 #endif
 };
 
-enum {
-    PPC405EP_CPU_CLK   = 0,
-    PPC405EP_PLB_CLK   = 1,
-    PPC405EP_OPB_CLK   = 2,
-    PPC405EP_EBC_CLK   = 3,
-    PPC405EP_MAL_CLK   = 4,
-    PPC405EP_PCI_CLK   = 5,
-    PPC405EP_UART0_CLK = 6,
-    PPC405EP_UART1_CLK = 7,
-    PPC405EP_CLK_NB    = 8,
-};
-
-typedef struct ppc405ep_cpc_t ppc405ep_cpc_t;
-struct ppc405ep_cpc_t {
-    uint32_t sysclk;
-    clk_setup_t clk_setup[PPC405EP_CLK_NB];
-    uint32_t boot;
-    uint32_t epctl;
-    uint32_t pllmr[2];
-    uint32_t ucr;
-    uint32_t srr;
-    uint32_t jtagid;
-    uint32_t pci;
-    /* Clock and power management */
-    uint32_t er;
-    uint32_t fr;
-    uint32_t sr;
-};
-
-static void ppc405ep_compute_clocks (ppc405ep_cpc_t *cpc)
+static void ppc405ep_compute_clocks(Ppc405CpcState *cpc)
 {
     uint32_t CPU_clk, PLB_clk, OPB_clk, EBC_clk, MAL_clk, PCI_clk;
     uint32_t UART0_clk, UART1_clk;
@@ -1300,12 +1271,11 @@ static void ppc405ep_compute_clocks (ppc405ep_cpc_t *cpc)
     clk_setup(&cpc->clk_setup[PPC405EP_UART1_CLK], UART1_clk);
 }
 
-static uint32_t dcr_read_epcpc (void *opaque, int dcrn)
+static uint32_t dcr_read_epcpc(void *opaque, int dcrn)
 {
-    ppc405ep_cpc_t *cpc;
+    Ppc405CpcState *cpc = opaque;
     uint32_t ret;
 
-    cpc = opaque;
     switch (dcrn) {
     case PPC405EP_CPC0_BOOT:
         ret = cpc->boot;
@@ -1340,11 +1310,10 @@ static uint32_t dcr_read_epcpc (void *opaque, int dcrn)
     return ret;
 }
 
-static void dcr_write_epcpc (void *opaque, int dcrn, uint32_t val)
+static void dcr_write_epcpc(void *opaque, int dcrn, uint32_t val)
 {
-    ppc405ep_cpc_t *cpc;
+    Ppc405CpcState *cpc = opaque;
 
-    cpc = opaque;
     switch (dcrn) {
     case PPC405EP_CPC0_BOOT:
         /* Read-only register */
@@ -1377,9 +1346,9 @@ static void dcr_write_epcpc (void *opaque, int dcrn, uint32_t val)
     }
 }
 
-static void ppc405ep_cpc_reset (void *opaque)
+static void ppc405_cpc_reset(DeviceState *dev)
 {
-    ppc405ep_cpc_t *cpc = opaque;
+    Ppc405CpcState *cpc = PPC405_CPC(dev);
 
     cpc->boot = 0x00000010;     /* Boot from PCI - IIC EEPROM disabled */
     cpc->epctl = 0x00000000;
@@ -1391,53 +1360,66 @@ static void ppc405ep_cpc_reset (void *opaque)
     cpc->er = 0x00000000;
     cpc->fr = 0x00000000;
     cpc->sr = 0x00000000;
+    cpc->jtagid = 0x20267049;
     ppc405ep_compute_clocks(cpc);
 }
 
 /* XXX: sysclk should be between 25 and 100 MHz */
-static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
-                               uint32_t sysclk)
+static void ppc405_cpc_realize(DeviceState *dev, Error **errp)
 {
-    ppc405ep_cpc_t *cpc;
+    Ppc405CpcState *cpc = PPC405_CPC(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
+
+    assert(dcr->cpu);
+    cpc->clk_setup[PPC405EP_CPU_CLK].cb =
+        ppc_40x_timers_init(&dcr->cpu->env, cpc->sysclk, PPC_INTERRUPT_PIT);
+    cpc->clk_setup[PPC405EP_CPU_CLK].opaque = &dcr->cpu->env;
+
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_BOOT, cpc,
+                        &dcr_read_epcpc, &dcr_write_epcpc);
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_EPCTL, cpc,
+                        &dcr_read_epcpc, &dcr_write_epcpc);
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_PLLMR0, cpc,
+                        &dcr_read_epcpc, &dcr_write_epcpc);
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_PLLMR1, cpc,
+                        &dcr_read_epcpc, &dcr_write_epcpc);
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_UCR, cpc,
+                        &dcr_read_epcpc, &dcr_write_epcpc);
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_SRR, cpc,
+                        &dcr_read_epcpc, &dcr_write_epcpc);
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_JTAGID, cpc,
+                        &dcr_read_epcpc, &dcr_write_epcpc);
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_PCI, cpc,
+                        &dcr_read_epcpc, &dcr_write_epcpc);
+}
 
-    cpc = g_new0(ppc405ep_cpc_t, 1);
-    memcpy(cpc->clk_setup, clk_setup,
-           PPC405EP_CLK_NB * sizeof(clk_setup_t));
-    cpc->jtagid = 0x20267049;
-    cpc->sysclk = sysclk;
-    qemu_register_reset(&ppc405ep_cpc_reset, cpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_BOOT, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_EPCTL, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_PLLMR0, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_PLLMR1, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_UCR, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_SRR, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_JTAGID, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_PCI, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-#if 0
-    ppc_dcr_register(env, PPC405EP_CPC0_ER, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_FR, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_SR, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-#endif
+static Property ppc405_cpc_properties[] = {
+    DEFINE_PROP_UINT32("sys-clk", Ppc405CpcState, sysclk, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ppc405_cpc_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_cpc_realize;
+    dc->reset = ppc405_cpc_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
+    device_class_set_props(dc, ppc405_cpc_properties);
 }
 
+/* PPC405_SOC */
+
 static void ppc405_soc_instance_init(Object *obj)
 {
     Ppc405SoCState *s = PPC405_SOC(obj);
 
     object_initialize_child(obj, "cpu", &s->cpu,
                             POWERPC_CPU_TYPE_NAME("405ep"));
+
+    object_initialize_child(obj, "cpc", &s->cpc, TYPE_PPC405_CPC);
+    object_property_add_alias(obj, "sys-clk", OBJECT(&s->cpc), "sys-clk");
 }
 
 static void ppc405_reset(void *opaque)
@@ -1448,12 +1430,9 @@ static void ppc405_reset(void *opaque)
 static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 {
     Ppc405SoCState *s = PPC405_SOC(dev);
-    clk_setup_t clk_setup[PPC405EP_CLK_NB];
     qemu_irq dma_irqs[4], gpt_irqs[5], mal_irqs[4];
     CPUPPCState *env;
 
-    memset(clk_setup, 0, sizeof(clk_setup));
-
     /* init CPUs */
     if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
         return;
@@ -1462,14 +1441,12 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 
     env = &s->cpu.env;
 
-    clk_setup[PPC405EP_CPU_CLK].cb =
-        ppc_40x_timers_init(env, s->sysclk, PPC_INTERRUPT_PIT);
-    clk_setup[PPC405EP_CPU_CLK].opaque = env;
-
     ppc_dcr_init(env, NULL, NULL);
 
     /* CPU control */
-    ppc405ep_cpc_init(env, clk_setup, s->sysclk);
+    if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->cpc), &s->cpu, errp)) {
+        return;
+    }
 
     /* PLB arbitrer */
     ppc4xx_plb_init(env);
@@ -1561,7 +1538,6 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 static Property ppc405_soc_properties[] = {
     DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
-    DEFINE_PROP_UINT32("sys-clk", Ppc405SoCState, sysclk, 0),
     DEFINE_PROP_BOOL("dram-init", Ppc405SoCState, do_dram_init, 0),
     DEFINE_PROP_UINT64("ram-size", Ppc405SoCState, ram_size, 0),
     DEFINE_PROP_END_OF_LIST(),
@@ -1579,6 +1555,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_CPC,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc405CpcState),
+        .class_init     = ppc405_cpc_class_init,
+    }, {
         .name           = TYPE_PPC405_SOC,
         .parent         = TYPE_DEVICE,
         .instance_size  = sizeof(Ppc405SoCState),
-- 
2.37.2


