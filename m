Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C70E05A86D9
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:38:59 +0200 (CEST)
Received: from localhost ([::1]:48476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTYA-00035x-P0
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpa-0005fM-Sx; Wed, 31 Aug 2022 14:52:56 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:46896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpY-0008E2-RM; Wed, 31 Aug 2022 14:52:54 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 v2-20020a056830090200b006397457afecso10200023ott.13; 
 Wed, 31 Aug 2022 11:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=W4ewbEImUWb7RvK4GePl25jWNEDmdciPkVgtNcLlCyw=;
 b=cHS1aCXGv+N6Ds1GtzP4wXHpHizJiV5l1sATyhs0P/0Zg7zH3axFPRvu691twfoMZU
 crS8d0Pm1AfdsLWBEOiULtO4gp4wexAYNe8PyB171VDzq2yVbh9GPsNAWetLTT/vKPQv
 IxTXDWBO7ofaAvTyQuwl/6GXdROvX3z+H27h+ddDX/py+S+bi4+TtpnYFMUXTPqGEyAe
 Pf1DMroSCTuq2xIHGgSTHCanxZcDoyw1KeCJBdD1CAD6ESLwWNgiMTA/bnjViDqXcSeN
 KN/agApD5HSnsTZk8tfAVJlRKWaIa2fyOGkVWIw8+dvSakz6oTve3oPW7yCBFmFrfE0P
 pQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=W4ewbEImUWb7RvK4GePl25jWNEDmdciPkVgtNcLlCyw=;
 b=mm01Yyj0Q1n3awh1Gjz7sh2dAZFuUH8rgmahiwV/+r+WHbEPZ+6HpxvsePaiUlm7Vc
 2QC1sn4WAd7e19YmyKdYFPGpaH8wfpUefmpvq7oO8puVhMh96WKgSvsPh9FM+vy1FHal
 LFjmUTMjRdX+2yXDjWzRzJYBkD6LMaoRxBfphESAx4P20pHaZ8YE/Zca6AJpaPKWFuGE
 WD4Xs0enr50teKWfBKw6tDOyx+r4mNbRkN7460NIn1k5OOyJiRiFyCQgeGb7K8/LB4Yp
 96kv4+3iE4dQJLUQN65YYQsNg8rExbFq5wvIdO9SlKB4d9B8I3EWbP8sdRq3XTFjYgBm
 3ZgQ==
X-Gm-Message-State: ACgBeo044YZVKyYuj2wGFgTL5zGRTZ7Elaxs+dYEdE2AWPFh7yZsFxZI
 KapooZR2bNSTPIrTqHoCXH/AIW/lzWQ=
X-Google-Smtp-Source: AA6agR7QIE2swedMIRYqaRyg8mGXE7sT1XSTEhQyf/p2zZGtZTwTn1asPo0Ik1HmRmTYT5L+wrVnVQ==
X-Received: by 2002:a05:6830:18d8:b0:638:d6ae:5d4b with SMTP id
 v24-20020a05683018d800b00638d6ae5d4bmr11158914ote.171.1661971971349; 
 Wed, 31 Aug 2022 11:52:51 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:52:51 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 46/60] ppc/ppc405: QOM'ify PLB
Date: Wed, 31 Aug 2022 15:50:20 -0300
Message-Id: <20220831185034.23240-47-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x330.google.com
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

PLB is currently modeled as a simple DCR device. Also drop the
ppc4xx_plb_init() helper and adapt the sam460ex machine.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
[balaton: ppc4xx_dcr_register changes]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <c4256d1bffca86fe1d696aa9c56732e5f563e114.1660746880.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405.h    | 14 ++++++++--
 hw/ppc/ppc405_uc.c | 64 ++++++++++++++++++++++++++--------------------
 hw/ppc/sam460ex.c  |  4 ++-
 3 files changed, 51 insertions(+), 31 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 4140e811d5..cb34792daf 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,6 +63,17 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
 };
 
+/* Peripheral local bus arbitrer */
+#define TYPE_PPC405_PLB "ppc405-plb"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PlbState, PPC405_PLB);
+struct Ppc405PlbState {
+    Ppc4xxDcrDeviceState parent_obj;
+
+    uint32_t acr;
+    uint32_t bear;
+    uint32_t besr;
+};
+
 /* PLB to OPB bridge */
 #define TYPE_PPC405_POB "ppc405-pob"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PobState, PPC405_POB);
@@ -232,11 +243,10 @@ struct Ppc405SoCState {
     Ppc405EbcState ebc;
     Ppc405OpbaState opba;
     Ppc405PobState pob;
+    Ppc405PlbState plb;
 };
 
 /* PowerPC 405 core */
 ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
 
-void ppc4xx_plb_init(CPUPPCState *env);
-
 #endif /* PPC405_H */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index e5604c3421..9ed3ce4ebe 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -148,19 +148,11 @@ enum {
     PLB4A1_ACR = 0x089,
 };
 
-typedef struct ppc4xx_plb_t ppc4xx_plb_t;
-struct ppc4xx_plb_t {
-    uint32_t acr;
-    uint32_t bear;
-    uint32_t besr;
-};
-
-static uint32_t dcr_read_plb (void *opaque, int dcrn)
+static uint32_t dcr_read_plb(void *opaque, int dcrn)
 {
-    ppc4xx_plb_t *plb;
+    Ppc405PlbState *plb = opaque;
     uint32_t ret;
 
-    plb = opaque;
     switch (dcrn) {
     case PLB0_ACR:
         ret = plb->acr;
@@ -180,11 +172,10 @@ static uint32_t dcr_read_plb (void *opaque, int dcrn)
     return ret;
 }
 
-static void dcr_write_plb (void *opaque, int dcrn, uint32_t val)
+static void dcr_write_plb(void *opaque, int dcrn, uint32_t val)
 {
-    ppc4xx_plb_t *plb;
+    Ppc405PlbState *plb = opaque;
 
-    plb = opaque;
     switch (dcrn) {
     case PLB0_ACR:
         /* We don't care about the actual parameters written as
@@ -202,28 +193,36 @@ static void dcr_write_plb (void *opaque, int dcrn, uint32_t val)
     }
 }
 
-static void ppc4xx_plb_reset (void *opaque)
+static void ppc405_plb_reset(DeviceState *dev)
 {
-    ppc4xx_plb_t *plb;
+    Ppc405PlbState *plb = PPC405_PLB(dev);
 
-    plb = opaque;
     plb->acr = 0x00000000;
     plb->bear = 0x00000000;
     plb->besr = 0x00000000;
 }
 
-void ppc4xx_plb_init(CPUPPCState *env)
+static void ppc405_plb_realize(DeviceState *dev, Error **errp)
+{
+    Ppc405PlbState *plb = PPC405_PLB(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
+
+    ppc4xx_dcr_register(dcr, PLB3A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
+    ppc4xx_dcr_register(dcr, PLB4A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
+    ppc4xx_dcr_register(dcr, PLB0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
+    ppc4xx_dcr_register(dcr, PLB0_BEAR, plb, &dcr_read_plb, &dcr_write_plb);
+    ppc4xx_dcr_register(dcr, PLB0_BESR, plb, &dcr_read_plb, &dcr_write_plb);
+    ppc4xx_dcr_register(dcr, PLB4A1_ACR, plb, &dcr_read_plb, &dcr_write_plb);
+}
+
+static void ppc405_plb_class_init(ObjectClass *oc, void *data)
 {
-    ppc4xx_plb_t *plb;
-
-    plb = g_new0(ppc4xx_plb_t, 1);
-    ppc_dcr_register(env, PLB3A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
-    ppc_dcr_register(env, PLB4A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
-    ppc_dcr_register(env, PLB0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
-    ppc_dcr_register(env, PLB0_BEAR, plb, &dcr_read_plb, &dcr_write_plb);
-    ppc_dcr_register(env, PLB0_BESR, plb, &dcr_read_plb, &dcr_write_plb);
-    ppc_dcr_register(env, PLB4A1_ACR, plb, &dcr_read_plb, &dcr_write_plb);
-    qemu_register_reset(ppc4xx_plb_reset, plb);
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_plb_realize;
+    dc->reset = ppc405_plb_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
 }
 
 /*****************************************************************************/
@@ -1374,6 +1373,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
 
     object_initialize_child(obj, "pob", &s->pob, TYPE_PPC405_POB);
+
+    object_initialize_child(obj, "plb", &s->plb, TYPE_PPC405_PLB);
 }
 
 static void ppc405_reset(void *opaque)
@@ -1405,7 +1406,9 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* PLB arbitrer */
-    ppc4xx_plb_init(env);
+    if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->plb), &s->cpu, errp)) {
+        return;
+    }
 
     /* PLB to OPB bridge */
     if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->pob), &s->cpu, errp)) {
@@ -1530,6 +1533,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_PLB,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc405PlbState),
+        .class_init     = ppc405_plb_class_init,
+    }, {
         .name           = TYPE_PPC405_POB,
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
         .instance_size  = sizeof(Ppc405PobState),
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 320c61a7f3..31139c1554 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -309,7 +309,9 @@ static void sam460ex_init(MachineState *machine)
     ppc_dcr_init(env, NULL, NULL);
 
     /* PLB arbitrer */
-    ppc4xx_plb_init(env);
+    dev = qdev_new(TYPE_PPC405_PLB);
+    ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
+    object_unref(OBJECT(dev));
 
     /* interrupt controllers */
     for (i = 0; i < ARRAY_SIZE(uic); i++) {
-- 
2.37.2


