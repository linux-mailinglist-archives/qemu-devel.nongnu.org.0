Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FF15A8715
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:56:01 +0200 (CEST)
Received: from localhost ([::1]:57046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTToe-0001ah-6P
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpp-0005uY-Nv; Wed, 31 Aug 2022 14:53:09 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:42496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpl-0008GS-SS; Wed, 31 Aug 2022 14:53:08 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-11f34610d4aso15462202fac.9; 
 Wed, 31 Aug 2022 11:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=tQvCwiYNGXwV2kWCePM2OOCgPrh6ASxpJcZnsWiI9bI=;
 b=jQlmonkySc3iRDNPpWEjAtq2F8j8vE/biF+/x7glOrtFbREwoQNkUipHss5cEjRwM0
 wkENZYWFARJ+nutZBsm8NcVd4UXnjzkkJY8KnXBP7vF106osAaE+3yl/bA5FDuGjEVlK
 +Ec8PCr14MT9valn4aIyJYQn2ucPbCS5Gj6A4cCP5TsYbAWTnLFWFYXDiAQXKKPuuCIM
 GviAvDKfhmXcjWX1NnSsSHbSq1HlVKetnTOvMz8t/33rlPMU1MrKFbKKXL7KcUriWv0G
 FpGcLFkYemjXQYMeaw5iN6L/kiP49BcErZZl2OvfoYBB0/wFodenIAC4hAbdkZ7bU1s/
 7ICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=tQvCwiYNGXwV2kWCePM2OOCgPrh6ASxpJcZnsWiI9bI=;
 b=fjbjPjwedldSn1BU6NGDM/uh+e0Q8kJK0KVG7IPZyk8B5vNYkgReynYw/k2g/aKbvu
 yWlOD0WzN8LXVt+a6mH7cJOFQp5S7uYwbqnjTXjIG21DC9ojuBI2XZF7ReXDpyv34OUu
 4J6FfQrhittkoJgGmjJhzxbXPhizHQNol1A4HB40yyumjXVIUMPa4NxroIcrNm/6e/GW
 3Kt3sHNcHQ2+yNQoygjSASlQWRsiQBCT8aFJRnkTVebuLr77qatiQ3BBgESo/FYRtt/8
 Jfdv7OdwkWw3WV1CzEoLhn5WJaR6H27s1Db6InoI1L+vcuUNTc1qLe2xMD55RWvlbGPK
 Mh8A==
X-Gm-Message-State: ACgBeo0W/zQlUMyZJebxerzSGQ9dpuSgKlnJDkIUABxC1ICLoh3AbZS1
 s4RK9L1+QFh0rAAiDvz/tmGeLRx5eY4=
X-Google-Smtp-Source: AA6agR7xDvGkxvulkibSDKUnsO92tnG4i9wMsfaStKhgZ3UZBQ9lCLfZqCz3bgirMyCIbLPqr8loZg==
X-Received: by 2002:a05:6808:f8f:b0:345:4955:a8 with SMTP id
 o15-20020a0568080f8f00b00345495500a8mr1740799oiw.166.1661971984175; 
 Wed, 31 Aug 2022 11:53:04 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:53:03 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PULL 51/60] ppc4xx: Rename ppc405-ebc to ppc4xx-ebc
Date: Wed, 31 Aug 2022 15:50:25 -0300
Message-Id: <20220831185034.23240-52-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2d.google.com
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
Message-Id: <63d9b14c8ff5f73e35bffca1036394b5235735ee.1660746880.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405.h         |  2 +-
 hw/ppc/ppc405_uc.c      |  2 +-
 hw/ppc/ppc4xx_devs.c    | 12 ++++++------
 hw/ppc/sam460ex.c       |  2 +-
 include/hw/ppc/ppc4xx.h |  6 +++---
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 57e1494b05..343a84c98e 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -214,7 +214,7 @@ struct Ppc405SoCState {
     Ppc405OcmState ocm;
     Ppc405GpioState gpio;
     Ppc405DmaState dma;
-    Ppc405EbcState ebc;
+    Ppc4xxEbcState ebc;
     Ppc405OpbaState opba;
     Ppc405PobState pob;
     Ppc4xxPlbState plb;
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index c7bc40ba08..247c4f3fa8 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1094,7 +1094,7 @@ static void ppc405_soc_instance_init(Object *obj)
 
     object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
 
-    object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
+    object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC4xx_EBC);
 
     object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
 
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 00bb3fe974..fbfb21c8e8 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -756,7 +756,7 @@ enum {
 
 static uint32_t dcr_read_ebc(void *opaque, int dcrn)
 {
-    Ppc405EbcState *ebc = opaque;
+    Ppc4xxEbcState *ebc = opaque;
     uint32_t ret;
 
     switch (dcrn) {
@@ -840,7 +840,7 @@ static uint32_t dcr_read_ebc(void *opaque, int dcrn)
 
 static void dcr_write_ebc(void *opaque, int dcrn, uint32_t val)
 {
-    Ppc405EbcState *ebc = opaque;
+    Ppc4xxEbcState *ebc = opaque;
 
     switch (dcrn) {
     case EBC0_CFGADDR:
@@ -899,7 +899,7 @@ static void dcr_write_ebc(void *opaque, int dcrn, uint32_t val)
 
 static void ppc405_ebc_reset(DeviceState *dev)
 {
-    Ppc405EbcState *ebc = PPC405_EBC(dev);
+    Ppc4xxEbcState *ebc = PPC4xx_EBC(dev);
     int i;
 
     ebc->addr = 0x00000000;
@@ -916,7 +916,7 @@ static void ppc405_ebc_reset(DeviceState *dev)
 
 static void ppc405_ebc_realize(DeviceState *dev, Error **errp)
 {
-    Ppc405EbcState *ebc = PPC405_EBC(dev);
+    Ppc4xxEbcState *ebc = PPC4xx_EBC(dev);
     Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
 
     ppc4xx_dcr_register(dcr, EBC0_CFGADDR, ebc, &dcr_read_ebc, &dcr_write_ebc);
@@ -975,9 +975,9 @@ static const TypeInfo ppc4xx_types[] = {
         .instance_size  = sizeof(Ppc4xxPlbState),
         .class_init     = ppc405_plb_class_init,
     }, {
-        .name           = TYPE_PPC405_EBC,
+        .name           = TYPE_PPC4xx_EBC,
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
-        .instance_size  = sizeof(Ppc405EbcState),
+        .instance_size  = sizeof(Ppc4xxEbcState),
         .class_init     = ppc405_ebc_class_init,
     }, {
         .name           = TYPE_PPC4xx_DCR_DEVICE,
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 6b1c843eeb..0d9259f0f2 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -372,7 +372,7 @@ static void sam460ex_init(MachineState *machine)
                                qdev_get_gpio_in(uic[0], 3));
 
     /* External bus controller */
-    dev = qdev_new(TYPE_PPC405_EBC);
+    dev = qdev_new(TYPE_PPC4xx_EBC);
     ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
     object_unref(OBJECT(dev));
 
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index 4472ec254e..a1781afa8e 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -95,9 +95,9 @@ struct Ppc4xxPlbState {
 };
 
 /* Peripheral controller */
-#define TYPE_PPC405_EBC "ppc405-ebc"
-OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
-struct Ppc405EbcState {
+#define TYPE_PPC4xx_EBC "ppc4xx-ebc"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxEbcState, PPC4xx_EBC);
+struct Ppc4xxEbcState {
     Ppc4xxDcrDeviceState parent_obj;
 
     uint32_t addr;
-- 
2.37.2


