Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F7D5A8734
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 22:07:19 +0200 (CEST)
Received: from localhost ([::1]:54768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTzZ-00070O-El
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 16:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpl-0005lz-Ju; Wed, 31 Aug 2022 14:53:05 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:43680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpi-0008Fu-55; Wed, 31 Aug 2022 14:53:04 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-11eb44f520dso22014504fac.10; 
 Wed, 31 Aug 2022 11:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=vR5Oyxg4paaL58xru3og8Z85gj1FQWtbuNa7g3PNrIE=;
 b=MQXII0x0ZG8Ov8IXBaJ3MuSS18PWr3gYg13uSrreOlyqNmo87pyxI20RLHquw5I7GR
 ruwin99G3N9Te/WUZ6nRjfZVrFPbscX6pVNYQ+6m1+EQirGxEci7WkiOWznUBSo5iqvu
 f+V7zThNPN9K3CG9q6dx4G6ybkcgbaIMXRNoXghiAnQ5HK5c4qwcBTHzK5B1Uv7H/jI4
 cTr57iWydu6JrAtJUugiZaUcGkZGEoW7aOa8/4NOoWUCJHBfbdzWxRY4D8O7gI8PbrfA
 1skXMMh/AitvAc8aEkMkyHH4F0qBAuk5/5xtpFHbYTJFC1jGeKcupO6+igWfw6d6G9Ec
 8mAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=vR5Oyxg4paaL58xru3og8Z85gj1FQWtbuNa7g3PNrIE=;
 b=2xpzymYpRV2bktqCDltQYjsaMNSZgoIUkjqHLxIBAcmQ3YsMIhuHECsqaRb25MZTVO
 FCQHT7LwQ1qD1FcWps6f31BgnRwq7Tns1PoLK/Rs1ahGZkbPCaQfbtmmTrA1go48jjlE
 e1nMtMz8QUbuO8WICKPihNz2iGymKVmOxFUZTSL9FMf0AEu3SqLoIvndxtokI3YWSg54
 7TEw5VQ36Pxn0YRz6JfWE0u7kSskoCdyyvJan8lT0JhYGtPbu5GkBw6EeMcd0+A33sjh
 j5gJi+E+nSVxZ/p0qiB+/FT6ML+6mdr7dYiSqpc7DclvxkyMTyp9ec3xsfLAiBA3aJ0D
 K8ww==
X-Gm-Message-State: ACgBeo30sjjGIjDeSMtA/atMtDswq43+TsfgxqqAwIhvmBa2ntZVMX2Y
 aVsYzQ69VbsqlaGo1nabylCF3rt7o/c=
X-Google-Smtp-Source: AA6agR4YbnQStHxOwTaL9BSQncBUe+2V4PLlRuc3cpStOfFCEsNMcyXtZl7eJaeEZyySRchJ4A95mw==
X-Received: by 2002:a05:6870:3413:b0:11e:35e:db23 with SMTP id
 g19-20020a056870341300b0011e035edb23mr2067479oah.34.1661971979443; 
 Wed, 31 Aug 2022 11:52:59 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:52:59 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PULL 49/60] ppc4xx: Rename ppc405-plb to ppc4xx-plb
Date: Wed, 31 Aug 2022 15:50:23 -0300
Message-Id: <20220831185034.23240-50-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
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

This device is shared between different 4xx socs.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <5b13ebfd12a71a28035bed5a915cbeee81cf21d1.1660746880.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405.h         |  2 +-
 hw/ppc/ppc405_uc.c      |  2 +-
 hw/ppc/ppc4xx_devs.c    | 12 ++++++------
 hw/ppc/sam460ex.c       |  2 +-
 include/hw/ppc/ppc4xx.h |  6 +++---
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index d85c595f9d..8521be317d 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -232,7 +232,7 @@ struct Ppc405SoCState {
     Ppc405EbcState ebc;
     Ppc405OpbaState opba;
     Ppc405PobState pob;
-    Ppc405PlbState plb;
+    Ppc4xxPlbState plb;
     Ppc4xxMalState mal;
 };
 
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 3382ed3252..b7f6d1c9c1 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1286,7 +1286,7 @@ static void ppc405_soc_instance_init(Object *obj)
 
     object_initialize_child(obj, "pob", &s->pob, TYPE_PPC405_POB);
 
-    object_initialize_child(obj, "plb", &s->plb, TYPE_PPC405_PLB);
+    object_initialize_child(obj, "plb", &s->plb, TYPE_PPC4xx_PLB);
 
     object_initialize_child(obj, "mal", &s->mal, TYPE_PPC4xx_MAL);
 }
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 843d759b1b..3baa2fa2b3 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -671,7 +671,7 @@ enum {
 
 static uint32_t dcr_read_plb(void *opaque, int dcrn)
 {
-    Ppc405PlbState *plb = opaque;
+    Ppc4xxPlbState *plb = opaque;
     uint32_t ret;
 
     switch (dcrn) {
@@ -695,7 +695,7 @@ static uint32_t dcr_read_plb(void *opaque, int dcrn)
 
 static void dcr_write_plb(void *opaque, int dcrn, uint32_t val)
 {
-    Ppc405PlbState *plb = opaque;
+    Ppc4xxPlbState *plb = opaque;
 
     switch (dcrn) {
     case PLB0_ACR:
@@ -717,7 +717,7 @@ static void dcr_write_plb(void *opaque, int dcrn, uint32_t val)
 
 static void ppc405_plb_reset(DeviceState *dev)
 {
-    Ppc405PlbState *plb = PPC405_PLB(dev);
+    Ppc4xxPlbState *plb = PPC4xx_PLB(dev);
 
     plb->acr = 0x00000000;
     plb->bear = 0x00000000;
@@ -726,7 +726,7 @@ static void ppc405_plb_reset(DeviceState *dev)
 
 static void ppc405_plb_realize(DeviceState *dev, Error **errp)
 {
-    Ppc405PlbState *plb = PPC405_PLB(dev);
+    Ppc4xxPlbState *plb = PPC4xx_PLB(dev);
     Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
 
     ppc4xx_dcr_register(dcr, PLB3A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
@@ -784,9 +784,9 @@ static const TypeInfo ppc4xx_types[] = {
         .instance_finalize = ppc4xx_mal_finalize,
         .class_init     = ppc4xx_mal_class_init,
     }, {
-        .name           = TYPE_PPC405_PLB,
+        .name           = TYPE_PPC4xx_PLB,
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
-        .instance_size  = sizeof(Ppc405PlbState),
+        .instance_size  = sizeof(Ppc4xxPlbState),
         .class_init     = ppc405_plb_class_init,
     }, {
         .name           = TYPE_PPC4xx_DCR_DEVICE,
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index c16303462d..6b1c843eeb 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -308,7 +308,7 @@ static void sam460ex_init(MachineState *machine)
     ppc_dcr_init(env, NULL, NULL);
 
     /* PLB arbitrer */
-    dev = qdev_new(TYPE_PPC405_PLB);
+    dev = qdev_new(TYPE_PPC4xx_PLB);
     ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
     object_unref(OBJECT(dev));
 
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index e696e159f3..b19e59271b 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -84,9 +84,9 @@ struct Ppc4xxMalState {
 };
 
 /* Peripheral local bus arbitrer */
-#define TYPE_PPC405_PLB "ppc405-plb"
-OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PlbState, PPC405_PLB);
-struct Ppc405PlbState {
+#define TYPE_PPC4xx_PLB "ppc4xx-plb"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxPlbState, PPC4xx_PLB);
+struct Ppc4xxPlbState {
     Ppc4xxDcrDeviceState parent_obj;
 
     uint32_t acr;
-- 
2.37.2


