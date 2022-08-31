Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE33F5A872C
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 22:00:53 +0200 (CEST)
Received: from localhost ([::1]:39492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTtM-0002Bb-RJ
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 16:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpk-0005lG-1t; Wed, 31 Aug 2022 14:53:04 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c]:44797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpe-0008Fh-Mz; Wed, 31 Aug 2022 14:53:03 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 q6-20020a4aa886000000b0044b06d0c453so2661885oom.11; 
 Wed, 31 Aug 2022 11:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=2EyoAadPCT5UNS7T6rrgozqXW/e8eQhhektGVzBwUIo=;
 b=LvZLzFeuh+UYROznibaR/WIgDtAO/eeTTOTOIuTDy0b02mQnyLxv4Hwu3Pc44shId0
 bLImhKKCXJUGUa8pNIa5fg4QaL+FhkDWOu0Imss2In/Sb7TOc8Ps/UGAc0epn8oc1qL/
 G7zPVD1igWUivL+WvIJHjGdcTl1dNjL4mka2wp9JEHib/D42TDS0btuFriHBO3Br+8et
 OiDzbX85Ty/0c/0HLG24OeVotJiNmmlUl5Xbh2xBNPrtoRW17qD3LOYP5CHh9bAE1JBe
 HpOsP+HAUzb+YAKXi3ZNwpumR1nYp636t8/bW2sLfdyaQGex383z1FEKA0M5kbjeQ5r9
 lSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=2EyoAadPCT5UNS7T6rrgozqXW/e8eQhhektGVzBwUIo=;
 b=Bx6QohqIUWn2/2BgaLyZttl7Hoo73tUXzToO4iktwL84axsEZ0UHAUZ6MAozvMwOSW
 vG2OSYAwMmvy7NNP+B5ZzJeU7D8xrap50AKIGNWjR9vfvZgstFpZqRHLQZxA+S/jtnHN
 DeyhXXx7sheZa2i/jmplJ1uc1m2SF3spob02qHCQNp79mCqYJ6H8T4LvM7/gxZ9CUFB0
 RhpVyxvNik8/bouaYezO1rBstEHNPmC0u9EnumWKM4KB5Q7rfTYmPtk6lv8aZR4yvZ21
 fKme81D6ZDO7TyvSNYjDshJkvlMC3WOh0TyTy9K2Lu3cjLPxmH7cSRPKqZvtkrlcgIh6
 aGhA==
X-Gm-Message-State: ACgBeo2PMlS7lurF4gs1Q44cHIKN47zv5iRTnTAITexZ+bz4NOzXbELS
 oWDgAbeEVRml2vtCs5D2BN9I09dvmlM=
X-Google-Smtp-Source: AA6agR5GZYjXXPp7rxanNY0Or4bkTvV59ZW5tZwz7vonOCU9pFOl89dUSoJRPV22Ri8GFL9Nyt8q/Q==
X-Received: by 2002:a4a:e1ad:0:b0:448:b28c:5fe3 with SMTP id
 13-20020a4ae1ad000000b00448b28c5fe3mr9444275ooy.21.1661971976786; 
 Wed, 31 Aug 2022 11:52:56 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:52:56 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PULL 48/60] ppc4xx: Move PLB model to ppc4xx_devs.c
Date: Wed, 31 Aug 2022 15:50:22 -0300
Message-Id: <20220831185034.23240-49-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2c.google.com
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

From: BALATON Zoltan <balaton@eik.bme.hu>

The PLB is shared between 405 and 440 so move it to the shared file.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <2498384bf3e18959ee8cb984d72fb66b8a6ecadc.1660746880.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405.h         | 11 -----
 hw/ppc/ppc405_uc.c      | 93 ----------------------------------------
 hw/ppc/ppc4xx_devs.c    | 94 +++++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/ppc4xx.h | 11 +++++
 4 files changed, 105 insertions(+), 104 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 31c94e4742..d85c595f9d 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,17 +63,6 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
 };
 
-/* Peripheral local bus arbitrer */
-#define TYPE_PPC405_PLB "ppc405-plb"
-OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PlbState, PPC405_PLB);
-struct Ppc405PlbState {
-    Ppc4xxDcrDeviceState parent_obj;
-
-    uint32_t acr;
-    uint32_t bear;
-    uint32_t besr;
-};
-
 /* PLB to OPB bridge */
 #define TYPE_PPC405_POB "ppc405-pob"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PobState, PPC405_POB);
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index b02dab05b3..3382ed3252 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -137,94 +137,6 @@ ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size)
 /*****************************************************************************/
 /* Shared peripherals */
 
-/*****************************************************************************/
-/* Peripheral local bus arbitrer */
-enum {
-    PLB3A0_ACR = 0x077,
-    PLB4A0_ACR = 0x081,
-    PLB0_BESR  = 0x084,
-    PLB0_BEAR  = 0x086,
-    PLB0_ACR   = 0x087,
-    PLB4A1_ACR = 0x089,
-};
-
-static uint32_t dcr_read_plb(void *opaque, int dcrn)
-{
-    Ppc405PlbState *plb = opaque;
-    uint32_t ret;
-
-    switch (dcrn) {
-    case PLB0_ACR:
-        ret = plb->acr;
-        break;
-    case PLB0_BEAR:
-        ret = plb->bear;
-        break;
-    case PLB0_BESR:
-        ret = plb->besr;
-        break;
-    default:
-        /* Avoid gcc warning */
-        ret = 0;
-        break;
-    }
-
-    return ret;
-}
-
-static void dcr_write_plb(void *opaque, int dcrn, uint32_t val)
-{
-    Ppc405PlbState *plb = opaque;
-
-    switch (dcrn) {
-    case PLB0_ACR:
-        /* We don't care about the actual parameters written as
-         * we don't manage any priorities on the bus
-         */
-        plb->acr = val & 0xF8000000;
-        break;
-    case PLB0_BEAR:
-        /* Read only */
-        break;
-    case PLB0_BESR:
-        /* Write-clear */
-        plb->besr &= ~val;
-        break;
-    }
-}
-
-static void ppc405_plb_reset(DeviceState *dev)
-{
-    Ppc405PlbState *plb = PPC405_PLB(dev);
-
-    plb->acr = 0x00000000;
-    plb->bear = 0x00000000;
-    plb->besr = 0x00000000;
-}
-
-static void ppc405_plb_realize(DeviceState *dev, Error **errp)
-{
-    Ppc405PlbState *plb = PPC405_PLB(dev);
-    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
-
-    ppc4xx_dcr_register(dcr, PLB3A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
-    ppc4xx_dcr_register(dcr, PLB4A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
-    ppc4xx_dcr_register(dcr, PLB0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
-    ppc4xx_dcr_register(dcr, PLB0_BEAR, plb, &dcr_read_plb, &dcr_write_plb);
-    ppc4xx_dcr_register(dcr, PLB0_BESR, plb, &dcr_read_plb, &dcr_write_plb);
-    ppc4xx_dcr_register(dcr, PLB4A1_ACR, plb, &dcr_read_plb, &dcr_write_plb);
-}
-
-static void ppc405_plb_class_init(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-
-    dc->realize = ppc405_plb_realize;
-    dc->reset = ppc405_plb_reset;
-    /* Reason: only works as function of a ppc4xx SoC */
-    dc->user_creatable = false;
-}
-
 /*****************************************************************************/
 /* PLB to OPB bridge */
 enum {
@@ -1538,11 +1450,6 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
-        .name           = TYPE_PPC405_PLB,
-        .parent         = TYPE_PPC4xx_DCR_DEVICE,
-        .instance_size  = sizeof(Ppc405PlbState),
-        .class_init     = ppc405_plb_class_init,
-    }, {
         .name           = TYPE_PPC405_POB,
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
         .instance_size  = sizeof(Ppc405PobState),
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 7d40c1b68a..843d759b1b 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -658,6 +658,95 @@ static void ppc4xx_mal_class_init(ObjectClass *oc, void *data)
     device_class_set_props(dc, ppc4xx_mal_properties);
 }
 
+/*****************************************************************************/
+/* Peripheral local bus arbitrer */
+enum {
+    PLB3A0_ACR = 0x077,
+    PLB4A0_ACR = 0x081,
+    PLB0_BESR  = 0x084,
+    PLB0_BEAR  = 0x086,
+    PLB0_ACR   = 0x087,
+    PLB4A1_ACR = 0x089,
+};
+
+static uint32_t dcr_read_plb(void *opaque, int dcrn)
+{
+    Ppc405PlbState *plb = opaque;
+    uint32_t ret;
+
+    switch (dcrn) {
+    case PLB0_ACR:
+        ret = plb->acr;
+        break;
+    case PLB0_BEAR:
+        ret = plb->bear;
+        break;
+    case PLB0_BESR:
+        ret = plb->besr;
+        break;
+    default:
+        /* Avoid gcc warning */
+        ret = 0;
+        break;
+    }
+
+    return ret;
+}
+
+static void dcr_write_plb(void *opaque, int dcrn, uint32_t val)
+{
+    Ppc405PlbState *plb = opaque;
+
+    switch (dcrn) {
+    case PLB0_ACR:
+        /*
+         * We don't care about the actual parameters written as
+         * we don't manage any priorities on the bus
+         */
+        plb->acr = val & 0xF8000000;
+        break;
+    case PLB0_BEAR:
+        /* Read only */
+        break;
+    case PLB0_BESR:
+        /* Write-clear */
+        plb->besr &= ~val;
+        break;
+    }
+}
+
+static void ppc405_plb_reset(DeviceState *dev)
+{
+    Ppc405PlbState *plb = PPC405_PLB(dev);
+
+    plb->acr = 0x00000000;
+    plb->bear = 0x00000000;
+    plb->besr = 0x00000000;
+}
+
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
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_plb_realize;
+    dc->reset = ppc405_plb_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
+}
+
 /* PPC4xx_DCR_DEVICE */
 
 void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn, void *opaque,
@@ -694,6 +783,11 @@ static const TypeInfo ppc4xx_types[] = {
         .instance_size  = sizeof(Ppc4xxMalState),
         .instance_finalize = ppc4xx_mal_finalize,
         .class_init     = ppc4xx_mal_class_init,
+    }, {
+        .name           = TYPE_PPC405_PLB,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc405PlbState),
+        .class_init     = ppc405_plb_class_init,
     }, {
         .name           = TYPE_PPC4xx_DCR_DEVICE,
         .parent         = TYPE_SYS_BUS_DEVICE,
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index f40bd49bc7..e696e159f3 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -83,4 +83,15 @@ struct Ppc4xxMalState {
     uint8_t  rxcnum;
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
 #endif /* PPC4XX_H */
-- 
2.37.2


