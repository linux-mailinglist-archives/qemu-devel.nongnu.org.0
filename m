Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC315A86F2
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:49:43 +0200 (CEST)
Received: from localhost ([::1]:36028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTiZ-0008Bg-0v
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpm-0005oe-E0; Wed, 31 Aug 2022 14:53:06 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:33743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpk-0008G4-3U; Wed, 31 Aug 2022 14:53:06 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-11eb8b133fbso21861595fac.0; 
 Wed, 31 Aug 2022 11:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=kNmkwpwxqhA5/JWfF5UKN4JOJ5vbN/VCHNECQcca3Dk=;
 b=gLmhu8NByq15nVb27+XSjb7swwrBjqe+ZcZ+ZX6otdl9WZzXX2aQ4Hn7tlfiKpz29H
 Hu570GIl4m+l+hR3SO69j0i3ZrrhDMSoeTf5oVul39l5uVKXqo3e5Ca978eLoLVB4EvD
 wLyKpH87pYkNsZaCCZbY3AGLZtAGuF9tAysE6xkRjc5Tsw9n0vVy/kCmePsRW/J3Ocnd
 IGfwYRjUX3lvk2Majxhzxtf5JKNk8F5Rp61HHF2fG/VyBGR+59pGCQXzkf/5wURG+So1
 YC9Xk3kj/trEM42g4qg7QAn9u+TSXCPHMBkragkVJ8iGE09FtuLlHZs6LjNM0sRhnsxf
 tA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=kNmkwpwxqhA5/JWfF5UKN4JOJ5vbN/VCHNECQcca3Dk=;
 b=ndYV0ywCzzEdNlbti6WZzVj7UAScCRe3BeBRSkY9x083xZ8tPpE/YgfuC4cArDjlA4
 ISL93Xp2HjqNa3yZsVyCF62EMov4s6PvE2yX5w/r4vKVRkleWzIJdvpw+jb1AdamEe1w
 ut0mHGNtB8ehdwuruGUxjppcTF6v9RSBwOE+fnTndUe+dq09LxuS9p4rrCYHoI+hKO2X
 i/okJohE0ffVUjAU1T85+ulwhYWrlts9OYgnctcqZ8YDrZyFQl2zQjk5UIrzSLBGCHJx
 JzvX1/KXyb9/KgQUGVQNxkNqEYc1/U61Ef/bsZHV4MNZCC88ZhcjtSAh+ygoBsfkDurj
 TQTA==
X-Gm-Message-State: ACgBeo2WrIVbxGpkZjsM5KTSqX+kuaGFoSxLY/KsfsOY0jv/I9pv999S
 jvovWGoPVAF+SzUoElcMhfT+LGxS+wc=
X-Google-Smtp-Source: AA6agR7Ij2mFYO1zy6a6fYrFVK7K3ILLvWy+HVGtYrkKt8hWfNVXKTmZ6FwYK09b/GLFxOBW2LWgjA==
X-Received: by 2002:a05:6870:4708:b0:122:4180:850b with SMTP id
 b8-20020a056870470800b001224180850bmr1242193oaq.93.1661971981868; 
 Wed, 31 Aug 2022 11:53:01 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:53:01 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PULL 50/60] ppc4xx: Move EBC model to ppc4xx_devs.c
Date: Wed, 31 Aug 2022 15:50:24 -0300
Message-Id: <20220831185034.23240-51-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
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

The EBC is shared between 405 and 440 so move it to shared file.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <10eae70509ca4bd74858fc2c0a0f0e4eb9330199.1660746880.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405.h         |  15 ----
 hw/ppc/ppc405_uc.c      | 191 ----------------------------------------
 hw/ppc/ppc4xx_devs.c    | 191 ++++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/ppc4xx.h |  15 ++++
 4 files changed, 206 insertions(+), 206 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 8521be317d..57e1494b05 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -85,21 +85,6 @@ struct Ppc405OpbaState {
     uint8_t pr;
 };
 
-/* Peripheral controller */
-#define TYPE_PPC405_EBC "ppc405-ebc"
-OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
-struct Ppc405EbcState {
-    Ppc4xxDcrDeviceState parent_obj;
-
-    uint32_t addr;
-    uint32_t bcr[8];
-    uint32_t bap[8];
-    uint32_t bear;
-    uint32_t besr0;
-    uint32_t besr1;
-    uint32_t cfg;
-};
-
 /* DMA controller */
 #define TYPE_PPC405_DMA "ppc405-dma"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405DmaState, PPC405_DMA);
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index b7f6d1c9c1..c7bc40ba08 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -299,192 +299,6 @@ static void ppc405_opba_class_init(ObjectClass *oc, void *data)
 /* Code decompression controller */
 /* XXX: TODO */
 
-/*****************************************************************************/
-/* Peripheral controller */
-enum {
-    EBC0_CFGADDR = 0x012,
-    EBC0_CFGDATA = 0x013,
-};
-
-static uint32_t dcr_read_ebc(void *opaque, int dcrn)
-{
-    Ppc405EbcState *ebc = opaque;
-    uint32_t ret;
-
-    switch (dcrn) {
-    case EBC0_CFGADDR:
-        ret = ebc->addr;
-        break;
-    case EBC0_CFGDATA:
-        switch (ebc->addr) {
-        case 0x00: /* B0CR */
-            ret = ebc->bcr[0];
-            break;
-        case 0x01: /* B1CR */
-            ret = ebc->bcr[1];
-            break;
-        case 0x02: /* B2CR */
-            ret = ebc->bcr[2];
-            break;
-        case 0x03: /* B3CR */
-            ret = ebc->bcr[3];
-            break;
-        case 0x04: /* B4CR */
-            ret = ebc->bcr[4];
-            break;
-        case 0x05: /* B5CR */
-            ret = ebc->bcr[5];
-            break;
-        case 0x06: /* B6CR */
-            ret = ebc->bcr[6];
-            break;
-        case 0x07: /* B7CR */
-            ret = ebc->bcr[7];
-            break;
-        case 0x10: /* B0AP */
-            ret = ebc->bap[0];
-            break;
-        case 0x11: /* B1AP */
-            ret = ebc->bap[1];
-            break;
-        case 0x12: /* B2AP */
-            ret = ebc->bap[2];
-            break;
-        case 0x13: /* B3AP */
-            ret = ebc->bap[3];
-            break;
-        case 0x14: /* B4AP */
-            ret = ebc->bap[4];
-            break;
-        case 0x15: /* B5AP */
-            ret = ebc->bap[5];
-            break;
-        case 0x16: /* B6AP */
-            ret = ebc->bap[6];
-            break;
-        case 0x17: /* B7AP */
-            ret = ebc->bap[7];
-            break;
-        case 0x20: /* BEAR */
-            ret = ebc->bear;
-            break;
-        case 0x21: /* BESR0 */
-            ret = ebc->besr0;
-            break;
-        case 0x22: /* BESR1 */
-            ret = ebc->besr1;
-            break;
-        case 0x23: /* CFG */
-            ret = ebc->cfg;
-            break;
-        default:
-            ret = 0x00000000;
-            break;
-        }
-        break;
-    default:
-        ret = 0x00000000;
-        break;
-    }
-
-    return ret;
-}
-
-static void dcr_write_ebc(void *opaque, int dcrn, uint32_t val)
-{
-    Ppc405EbcState *ebc = opaque;
-
-    switch (dcrn) {
-    case EBC0_CFGADDR:
-        ebc->addr = val;
-        break;
-    case EBC0_CFGDATA:
-        switch (ebc->addr) {
-        case 0x00: /* B0CR */
-            break;
-        case 0x01: /* B1CR */
-            break;
-        case 0x02: /* B2CR */
-            break;
-        case 0x03: /* B3CR */
-            break;
-        case 0x04: /* B4CR */
-            break;
-        case 0x05: /* B5CR */
-            break;
-        case 0x06: /* B6CR */
-            break;
-        case 0x07: /* B7CR */
-            break;
-        case 0x10: /* B0AP */
-            break;
-        case 0x11: /* B1AP */
-            break;
-        case 0x12: /* B2AP */
-            break;
-        case 0x13: /* B3AP */
-            break;
-        case 0x14: /* B4AP */
-            break;
-        case 0x15: /* B5AP */
-            break;
-        case 0x16: /* B6AP */
-            break;
-        case 0x17: /* B7AP */
-            break;
-        case 0x20: /* BEAR */
-            break;
-        case 0x21: /* BESR0 */
-            break;
-        case 0x22: /* BESR1 */
-            break;
-        case 0x23: /* CFG */
-            break;
-        default:
-            break;
-        }
-        break;
-    default:
-        break;
-    }
-}
-
-static void ppc405_ebc_reset(DeviceState *dev)
-{
-    Ppc405EbcState *ebc = PPC405_EBC(dev);
-    int i;
-
-    ebc->addr = 0x00000000;
-    ebc->bap[0] = 0x7F8FFE80;
-    ebc->bcr[0] = 0xFFE28000;
-    for (i = 0; i < 8; i++) {
-        ebc->bap[i] = 0x00000000;
-        ebc->bcr[i] = 0x00000000;
-    }
-    ebc->besr0 = 0x00000000;
-    ebc->besr1 = 0x00000000;
-    ebc->cfg = 0x80400000;
-}
-
-static void ppc405_ebc_realize(DeviceState *dev, Error **errp)
-{
-    Ppc405EbcState *ebc = PPC405_EBC(dev);
-    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
-
-    ppc4xx_dcr_register(dcr, EBC0_CFGADDR, ebc, &dcr_read_ebc, &dcr_write_ebc);
-    ppc4xx_dcr_register(dcr, EBC0_CFGDATA, ebc, &dcr_read_ebc, &dcr_write_ebc);
-}
-
-static void ppc405_ebc_class_init(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-
-    dc->realize = ppc405_ebc_realize;
-    dc->reset = ppc405_ebc_reset;
-    /* Reason: only works as function of a ppc4xx SoC */
-    dc->user_creatable = false;
-}
-
 /*****************************************************************************/
 /* DMA controller */
 enum {
@@ -1459,11 +1273,6 @@ static const TypeInfo ppc405_types[] = {
         .parent         = TYPE_SYS_BUS_DEVICE,
         .instance_size  = sizeof(Ppc405OpbaState),
         .class_init     = ppc405_opba_class_init,
-    }, {
-        .name           = TYPE_PPC405_EBC,
-        .parent         = TYPE_PPC4xx_DCR_DEVICE,
-        .instance_size  = sizeof(Ppc405EbcState),
-        .class_init     = ppc405_ebc_class_init,
     }, {
         .name           = TYPE_PPC405_DMA,
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 3baa2fa2b3..00bb3fe974 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -747,6 +747,192 @@ static void ppc405_plb_class_init(ObjectClass *oc, void *data)
     dc->user_creatable = false;
 }
 
+/*****************************************************************************/
+/* Peripheral controller */
+enum {
+    EBC0_CFGADDR = 0x012,
+    EBC0_CFGDATA = 0x013,
+};
+
+static uint32_t dcr_read_ebc(void *opaque, int dcrn)
+{
+    Ppc405EbcState *ebc = opaque;
+    uint32_t ret;
+
+    switch (dcrn) {
+    case EBC0_CFGADDR:
+        ret = ebc->addr;
+        break;
+    case EBC0_CFGDATA:
+        switch (ebc->addr) {
+        case 0x00: /* B0CR */
+            ret = ebc->bcr[0];
+            break;
+        case 0x01: /* B1CR */
+            ret = ebc->bcr[1];
+            break;
+        case 0x02: /* B2CR */
+            ret = ebc->bcr[2];
+            break;
+        case 0x03: /* B3CR */
+            ret = ebc->bcr[3];
+            break;
+        case 0x04: /* B4CR */
+            ret = ebc->bcr[4];
+            break;
+        case 0x05: /* B5CR */
+            ret = ebc->bcr[5];
+            break;
+        case 0x06: /* B6CR */
+            ret = ebc->bcr[6];
+            break;
+        case 0x07: /* B7CR */
+            ret = ebc->bcr[7];
+            break;
+        case 0x10: /* B0AP */
+            ret = ebc->bap[0];
+            break;
+        case 0x11: /* B1AP */
+            ret = ebc->bap[1];
+            break;
+        case 0x12: /* B2AP */
+            ret = ebc->bap[2];
+            break;
+        case 0x13: /* B3AP */
+            ret = ebc->bap[3];
+            break;
+        case 0x14: /* B4AP */
+            ret = ebc->bap[4];
+            break;
+        case 0x15: /* B5AP */
+            ret = ebc->bap[5];
+            break;
+        case 0x16: /* B6AP */
+            ret = ebc->bap[6];
+            break;
+        case 0x17: /* B7AP */
+            ret = ebc->bap[7];
+            break;
+        case 0x20: /* BEAR */
+            ret = ebc->bear;
+            break;
+        case 0x21: /* BESR0 */
+            ret = ebc->besr0;
+            break;
+        case 0x22: /* BESR1 */
+            ret = ebc->besr1;
+            break;
+        case 0x23: /* CFG */
+            ret = ebc->cfg;
+            break;
+        default:
+            ret = 0x00000000;
+            break;
+        }
+        break;
+    default:
+        ret = 0x00000000;
+        break;
+    }
+
+    return ret;
+}
+
+static void dcr_write_ebc(void *opaque, int dcrn, uint32_t val)
+{
+    Ppc405EbcState *ebc = opaque;
+
+    switch (dcrn) {
+    case EBC0_CFGADDR:
+        ebc->addr = val;
+        break;
+    case EBC0_CFGDATA:
+        switch (ebc->addr) {
+        case 0x00: /* B0CR */
+            break;
+        case 0x01: /* B1CR */
+            break;
+        case 0x02: /* B2CR */
+            break;
+        case 0x03: /* B3CR */
+            break;
+        case 0x04: /* B4CR */
+            break;
+        case 0x05: /* B5CR */
+            break;
+        case 0x06: /* B6CR */
+            break;
+        case 0x07: /* B7CR */
+            break;
+        case 0x10: /* B0AP */
+            break;
+        case 0x11: /* B1AP */
+            break;
+        case 0x12: /* B2AP */
+            break;
+        case 0x13: /* B3AP */
+            break;
+        case 0x14: /* B4AP */
+            break;
+        case 0x15: /* B5AP */
+            break;
+        case 0x16: /* B6AP */
+            break;
+        case 0x17: /* B7AP */
+            break;
+        case 0x20: /* BEAR */
+            break;
+        case 0x21: /* BESR0 */
+            break;
+        case 0x22: /* BESR1 */
+            break;
+        case 0x23: /* CFG */
+            break;
+        default:
+            break;
+        }
+        break;
+    default:
+        break;
+    }
+}
+
+static void ppc405_ebc_reset(DeviceState *dev)
+{
+    Ppc405EbcState *ebc = PPC405_EBC(dev);
+    int i;
+
+    ebc->addr = 0x00000000;
+    ebc->bap[0] = 0x7F8FFE80;
+    ebc->bcr[0] = 0xFFE28000;
+    for (i = 0; i < 8; i++) {
+        ebc->bap[i] = 0x00000000;
+        ebc->bcr[i] = 0x00000000;
+    }
+    ebc->besr0 = 0x00000000;
+    ebc->besr1 = 0x00000000;
+    ebc->cfg = 0x80400000;
+}
+
+static void ppc405_ebc_realize(DeviceState *dev, Error **errp)
+{
+    Ppc405EbcState *ebc = PPC405_EBC(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
+
+    ppc4xx_dcr_register(dcr, EBC0_CFGADDR, ebc, &dcr_read_ebc, &dcr_write_ebc);
+    ppc4xx_dcr_register(dcr, EBC0_CFGDATA, ebc, &dcr_read_ebc, &dcr_write_ebc);
+}
+
+static void ppc405_ebc_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_ebc_realize;
+    dc->reset = ppc405_ebc_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
+}
+
 /* PPC4xx_DCR_DEVICE */
 
 void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn, void *opaque,
@@ -788,6 +974,11 @@ static const TypeInfo ppc4xx_types[] = {
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
         .instance_size  = sizeof(Ppc4xxPlbState),
         .class_init     = ppc405_plb_class_init,
+    }, {
+        .name           = TYPE_PPC405_EBC,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc405EbcState),
+        .class_init     = ppc405_ebc_class_init,
     }, {
         .name           = TYPE_PPC4xx_DCR_DEVICE,
         .parent         = TYPE_SYS_BUS_DEVICE,
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index b19e59271b..4472ec254e 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -94,4 +94,19 @@ struct Ppc4xxPlbState {
     uint32_t besr;
 };
 
+/* Peripheral controller */
+#define TYPE_PPC405_EBC "ppc405-ebc"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
+struct Ppc405EbcState {
+    Ppc4xxDcrDeviceState parent_obj;
+
+    uint32_t addr;
+    uint32_t bcr[8];
+    uint32_t bap[8];
+    uint32_t bear;
+    uint32_t besr0;
+    uint32_t besr1;
+    uint32_t cfg;
+};
+
 #endif /* PPC4XX_H */
-- 
2.37.2


