Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EADD45A86CF
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:35:03 +0200 (CEST)
Received: from localhost ([::1]:53568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTUN-0005XH-21
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpZ-0005di-5u; Wed, 31 Aug 2022 14:52:54 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:35713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpX-0008Dh-Au; Wed, 31 Aug 2022 14:52:52 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 y25-20020a056830109900b0063b3c1fe018so3552345oto.2; 
 Wed, 31 Aug 2022 11:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=z/b+egppYmEi9Hh3GfZBRX8qVYe1kymjrxCQEiMEnMU=;
 b=oUMCisw44YEBndv6huFjoXZdAFUWiR8/CHqGkORlfgGWG+WkDRUSw7NKx0l6dwq2iu
 25aAOiOUp9UxtZ+lR+MHGp+zrPDZj20qG13P9zxE3PR62/Dec5ejUtE5CY0//VDmkTSh
 C5t0umP+526xObonp8lHFPu4GifdQWJnBmU7aUNQa8TleNW49Fqn7dnUnGy2naNJ1K1m
 lo72zXYZRmuFS4H5zFiYNT04RNYGIM5AQgtISO50iOKCLtRoO//0DpO1IVgmqVxBvXdd
 tTDSjkGU6/ckT8Jcnx55E1Hv+RZOazZyydm2SezWVZUPKrPdTafxc+b3pX+zjZ13V4+j
 PyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=z/b+egppYmEi9Hh3GfZBRX8qVYe1kymjrxCQEiMEnMU=;
 b=OdKgZqVVhQBmbU6Bysj9C6/i/OO4ZrN1ntNJa1gF+kAolmAiqlHVAaLTxx0TkWwb/k
 PdqqoPp0zmVQJRxRREP5/nOBFThm0pxmqNtbUc2mcO0Ho01FEmCzu6V3keEYhizht8iX
 wSodHPRWTgvff96jz6ka8It7sjJhRRWKqbP/nlu4ncardayhYe9D0sGlexgJotpOrR3n
 o1rZeJkBzLQW6txQJobcrMVGgUtNjCgt7N5yrqhK7FXhnwM8N6jc+mENgUt2MS/Ou6n3
 VHlSo3OCA9SrDsPjRboVL4v3Q2izPxPFngF/T4+4+hQePZi86NCfiBUmKq6WNvjDy/7c
 Eqjw==
X-Gm-Message-State: ACgBeo2SZAHgw6JUK2fQPyaobYrRTaj2wU1YBMddpf4NFuDFKhukQRFE
 ywcEohn2jugT6tW+gaV6u5V2UV/1gqc=
X-Google-Smtp-Source: AA6agR4L7TPCgHdJGUrAhIyI24FO4dxYb69YpguHr6A/rwo0RmKYoDoTfHfZ9/WMGnhwaiRTZ8IwnQ==
X-Received: by 2002:a05:6830:1145:b0:639:6fc2:3ac9 with SMTP id
 x5-20020a056830114500b006396fc23ac9mr10165617otq.303.1661971968904; 
 Wed, 31 Aug 2022 11:52:48 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:52:48 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 45/60] ppc/ppc405: QOM'ify POB
Date: Wed, 31 Aug 2022 15:50:19 -0300
Message-Id: <20220831185034.23240-46-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32e.google.com
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

POB is currently modeled as a simple DCR device.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
[balaton: ppc4xx_dcr_register changes]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <2bb1a89182523059ecb0e8d20c22a293534dec17.1660746880.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405.h    | 12 ++++++++++
 hw/ppc/ppc405_uc.c | 56 ++++++++++++++++++++++++++--------------------
 2 files changed, 44 insertions(+), 24 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index d63c2acdc7..4140e811d5 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,6 +63,17 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
 };
 
+/* PLB to OPB bridge */
+#define TYPE_PPC405_POB "ppc405-pob"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PobState, PPC405_POB);
+struct Ppc405PobState {
+    Ppc4xxDcrDeviceState parent_obj;
+
+    uint32_t bear;
+    uint32_t besr0;
+    uint32_t besr1;
+};
+
 /* OPB arbitrer */
 #define TYPE_PPC405_OPBA "ppc405-opba"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405OpbaState, PPC405_OPBA);
@@ -220,6 +231,7 @@ struct Ppc405SoCState {
     Ppc405DmaState dma;
     Ppc405EbcState ebc;
     Ppc405OpbaState opba;
+    Ppc405PobState pob;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 2c482bc25c..e5604c3421 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -234,19 +234,11 @@ enum {
     POB0_BEAR  = 0x0A4,
 };
 
-typedef struct ppc4xx_pob_t ppc4xx_pob_t;
-struct ppc4xx_pob_t {
-    uint32_t bear;
-    uint32_t besr0;
-    uint32_t besr1;
-};
-
-static uint32_t dcr_read_pob (void *opaque, int dcrn)
+static uint32_t dcr_read_pob(void *opaque, int dcrn)
 {
-    ppc4xx_pob_t *pob;
+    Ppc405PobState *pob = opaque;
     uint32_t ret;
 
-    pob = opaque;
     switch (dcrn) {
     case POB0_BEAR:
         ret = pob->bear;
@@ -266,11 +258,10 @@ static uint32_t dcr_read_pob (void *opaque, int dcrn)
     return ret;
 }
 
-static void dcr_write_pob (void *opaque, int dcrn, uint32_t val)
+static void dcr_write_pob(void *opaque, int dcrn, uint32_t val)
 {
-    ppc4xx_pob_t *pob;
+    Ppc405PobState *pob = opaque;
 
-    pob = opaque;
     switch (dcrn) {
     case POB0_BEAR:
         /* Read only */
@@ -286,26 +277,34 @@ static void dcr_write_pob (void *opaque, int dcrn, uint32_t val)
     }
 }
 
-static void ppc4xx_pob_reset (void *opaque)
+static void ppc405_pob_reset(DeviceState *dev)
 {
-    ppc4xx_pob_t *pob;
+    Ppc405PobState *pob = PPC405_POB(dev);
 
-    pob = opaque;
     /* No error */
     pob->bear = 0x00000000;
     pob->besr0 = 0x0000000;
     pob->besr1 = 0x0000000;
 }
 
-static void ppc4xx_pob_init(CPUPPCState *env)
+static void ppc405_pob_realize(DeviceState *dev, Error **errp)
+{
+    Ppc405PobState *pob = PPC405_POB(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
+
+    ppc4xx_dcr_register(dcr, POB0_BEAR, pob, &dcr_read_pob, &dcr_write_pob);
+    ppc4xx_dcr_register(dcr, POB0_BESR0, pob, &dcr_read_pob, &dcr_write_pob);
+    ppc4xx_dcr_register(dcr, POB0_BESR1, pob, &dcr_read_pob, &dcr_write_pob);
+}
+
+static void ppc405_pob_class_init(ObjectClass *oc, void *data)
 {
-    ppc4xx_pob_t *pob;
+    DeviceClass *dc = DEVICE_CLASS(oc);
 
-    pob = g_new0(ppc4xx_pob_t, 1);
-    ppc_dcr_register(env, POB0_BEAR, pob, &dcr_read_pob, &dcr_write_pob);
-    ppc_dcr_register(env, POB0_BESR0, pob, &dcr_read_pob, &dcr_write_pob);
-    ppc_dcr_register(env, POB0_BESR1, pob, &dcr_read_pob, &dcr_write_pob);
-    qemu_register_reset(ppc4xx_pob_reset, pob);
+    dc->realize = ppc405_pob_realize;
+    dc->reset = ppc405_pob_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
 }
 
 /*****************************************************************************/
@@ -1373,6 +1372,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
 
     object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
+
+    object_initialize_child(obj, "pob", &s->pob, TYPE_PPC405_POB);
 }
 
 static void ppc405_reset(void *opaque)
@@ -1407,7 +1408,9 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     ppc4xx_plb_init(env);
 
     /* PLB to OPB bridge */
-    ppc4xx_pob_init(env);
+    if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->pob), &s->cpu, errp)) {
+        return;
+    }
 
     /* OBP arbitrer */
     sbd = SYS_BUS_DEVICE(&s->opba);
@@ -1527,6 +1530,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_POB,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc405PobState),
+        .class_init     = ppc405_pob_class_init,
+    }, {
         .name           = TYPE_PPC405_OPBA,
         .parent         = TYPE_SYS_BUS_DEVICE,
         .instance_size  = sizeof(Ppc405OpbaState),
-- 
2.37.2


