Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0235A8725
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:58:23 +0200 (CEST)
Received: from localhost ([::1]:52600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTqw-0007A1-83
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpu-00067h-Iu; Wed, 31 Aug 2022 14:53:14 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:35795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSps-0008HI-CY; Wed, 31 Aug 2022 14:53:14 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1225219ee46so1591117fac.2; 
 Wed, 31 Aug 2022 11:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=IW+uNORh9L53DMlTb2og/e/AUTa2y7dlPMLto1bT3og=;
 b=HRmquejj6M9bBs4IHjiyokLojMvaJtgD1EfXYucTQcnk7RoKPZD04EW5sN8KH8UUn6
 yLAM/B9c8Nnf6kNJUITQ8kfaGVInrRmsDy9mG+oyFUELoS4rsqgv8b83/e34MDziTUOQ
 cTOgTpmtqUOvNTL5cPB6Dyvl5cbMuyfPwOTatjA/foBDZjbZ7xsgJA72qecqBKsiF9Zx
 SEJjG/R6aEtiQFjYBRpWdl+jdTegMJX0A8HdgoKPHGXjE6+oMdYOnFW1EE/9yRkwU3uJ
 rG3507rLImB+xn+lsRokqLZxI9wE5YhtQEUnsNnm1hlQrNhnuaUopEq6t42VbtazB5gH
 gEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=IW+uNORh9L53DMlTb2og/e/AUTa2y7dlPMLto1bT3og=;
 b=X/xfEojpB+1M3uiYTgv3YI0khNGI68XtnllKK5n71zRtCU3vorNvG755JgavHHdTnK
 ZFBaoX2wSpRWvntdyhgrvtflGG9fQAu1NhHpQrVcY0mBqv38tCIiqmHU9Fas4S01GuZe
 zO0RoFkyElYfO2sVeCqIZlPQqBI5kC0HlYyWszWsw+2OUZKAapC1LucLR3eCbmCgQ9X7
 1yRihyQDTSpMcA7x+gmjnu4dD9KiRvQT+I5C554EatI5yeRVWxBsX2WJT/JjxemZ7rS6
 NMiewkx+eEVj9+j0o/+6NrzOAh/jisRjFn90iRKb1J/c+FejARruic982OUgfSgqWxSg
 WgAQ==
X-Gm-Message-State: ACgBeo307jaKY5QPPwNXzbCjYO7x00z8j+4POi+X7RdHQKM1/Xx4cOyx
 53geyWbnYRk03FVtemBzlKJL3RRh5GU=
X-Google-Smtp-Source: AA6agR76S7J/FqvVljAU0EBpQGdXfQfgV1B7Xp27lJToR2Tu4FnD5veRKXg9y+9RX4E7RaEtvMS6OA==
X-Received: by 2002:a05:6808:1528:b0:343:2b03:95bb with SMTP id
 u40-20020a056808152800b003432b0395bbmr1748396oiw.34.1661971989891; 
 Wed, 31 Aug 2022 11:53:09 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:53:09 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 53/60] hw/intc/ppc-uic: Convert ppc-uic to a PPC4xx DCR device
Date: Wed, 31 Aug 2022 15:50:27 -0300
Message-Id: <20220831185034.23240-54-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
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

Make ppc-uic a subclass of ppc4xx-dcr-device which will handle the cpu
link and make it uniform with the other PPC4xx devices.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <eb548130cf60aea8a6ea4dba4dee1686b3cabc3d.1660746880.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/intc/ppc-uic.c         | 26 ++++++--------------------
 hw/ppc/ppc405_uc.c        |  6 ++----
 hw/ppc/ppc440_bamboo.c    |  7 ++-----
 hw/ppc/ppc4xx_devs.c      |  1 -
 hw/ppc/sam460ex.c         | 17 +++++++----------
 hw/ppc/virtex_ml507.c     |  7 ++-----
 include/hw/intc/ppc-uic.h |  6 ++----
 7 files changed, 21 insertions(+), 49 deletions(-)

diff --git a/hw/intc/ppc-uic.c b/hw/intc/ppc-uic.c
index 60013f2dde..dcf5de5d43 100644
--- a/hw/intc/ppc-uic.c
+++ b/hw/intc/ppc-uic.c
@@ -25,11 +25,8 @@
 #include "qemu/osdep.h"
 #include "hw/intc/ppc-uic.h"
 #include "hw/irq.h"
-#include "cpu.h"
-#include "hw/ppc/ppc.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
-#include "qapi/error.h"
 
 enum {
     DCR_UICSR  = 0x000,
@@ -105,10 +102,9 @@ static void ppcuic_trigger_irq(PPCUIC *uic)
 
 static void ppcuic_set_irq(void *opaque, int irq_num, int level)
 {
-    PPCUIC *uic;
+    PPCUIC *uic = opaque;
     uint32_t mask, sr;
 
-    uic = opaque;
     mask = 1U << (31 - irq_num);
     LOG_UIC("%s: irq %d level %d uicsr %08" PRIx32
                 " mask %08" PRIx32 " => %08" PRIx32 " %08" PRIx32 "\n",
@@ -144,10 +140,9 @@ static void ppcuic_set_irq(void *opaque, int irq_num, int level)
 
 static uint32_t dcr_read_uic(void *opaque, int dcrn)
 {
-    PPCUIC *uic;
+    PPCUIC *uic = opaque;
     uint32_t ret;
 
-    uic = opaque;
     dcrn -= uic->dcr_base;
     switch (dcrn) {
     case DCR_UICSR:
@@ -192,9 +187,8 @@ static uint32_t dcr_read_uic(void *opaque, int dcrn)
 
 static void dcr_write_uic(void *opaque, int dcrn, uint32_t val)
 {
-    PPCUIC *uic;
+    PPCUIC *uic = opaque;
 
-    uic = opaque;
     dcrn -= uic->dcr_base;
     LOG_UIC("%s: dcr %d val 0x%x\n", __func__, dcrn, val);
     switch (dcrn) {
@@ -251,19 +245,12 @@ static void ppc_uic_reset(DeviceState *dev)
 static void ppc_uic_realize(DeviceState *dev, Error **errp)
 {
     PPCUIC *uic = PPC_UIC(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
-    PowerPCCPU *cpu;
     int i;
 
-    if (!uic->cpu) {
-        /* This is a programming error in the code using this device */
-        error_setg(errp, "ppc-uic 'cpu' link property was not set");
-        return;
-    }
-
-    cpu = POWERPC_CPU(uic->cpu);
     for (i = 0; i < DCR_UICMAX; i++) {
-        ppc_dcr_register(&cpu->env, uic->dcr_base + i, uic,
+        ppc4xx_dcr_register(dcr, uic->dcr_base + i, uic,
                          &dcr_read_uic, &dcr_write_uic);
     }
 
@@ -273,7 +260,6 @@ static void ppc_uic_realize(DeviceState *dev, Error **errp)
 }
 
 static Property ppc_uic_properties[] = {
-    DEFINE_PROP_LINK("cpu", PPCUIC, cpu, TYPE_CPU, CPUState *),
     DEFINE_PROP_UINT32("dcr-base", PPCUIC, dcr_base, 0xc0),
     DEFINE_PROP_BOOL("use-vectors", PPCUIC, use_vectors, true),
     DEFINE_PROP_END_OF_LIST()
@@ -308,7 +294,7 @@ static void ppc_uic_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo ppc_uic_info = {
     .name = TYPE_PPC_UIC,
-    .parent = TYPE_SYS_BUS_DEVICE,
+    .parent = TYPE_PPC4xx_DCR_DEVICE,
     .instance_size = sizeof(PPCUIC),
     .class_init = ppc_uic_class_init,
 };
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 47bb9f534a..dc17d5bdb5 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1152,12 +1152,10 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(sbd, 0, 0xef600600);
 
     /* Universal interrupt controller */
-    object_property_set_link(OBJECT(&s->uic), "cpu", OBJECT(&s->cpu),
-                             &error_fatal);
-    sbd = SYS_BUS_DEVICE(&s->uic);
-    if (!sysbus_realize(sbd, errp)) {
+    if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->uic), &s->cpu, errp)) {
         return;
     }
+    sbd = SYS_BUS_DEVICE(&s->uic);
     sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
                        qdev_get_gpio_in(DEVICE(&s->cpu), PPC40x_INPUT_INT));
     sysbus_connect_irq(sbd, PPCUIC_OUTPUT_CINT,
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 873f930c77..b14a9ef776 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -193,12 +193,9 @@ static void bamboo_init(MachineState *machine)
 
     /* interrupt controller */
     uicdev = qdev_new(TYPE_PPC_UIC);
+    ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(uicdev), cpu, &error_fatal);
+    object_unref(OBJECT(uicdev));
     uicsbd = SYS_BUS_DEVICE(uicdev);
-
-    object_property_set_link(OBJECT(uicdev), "cpu", OBJECT(cpu),
-                             &error_fatal);
-    sysbus_realize_and_unref(uicsbd, &error_fatal);
-
     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
                        qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index fbfb21c8e8..37e3b87c2e 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -29,7 +29,6 @@
 #include "hw/irq.h"
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/ppc4xx.h"
-#include "hw/intc/ppc-uic.h"
 #include "hw/qdev-properties.h"
 #include "qemu/log.h"
 #include "exec/address-spaces.h"
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 0d9259f0f2..348ed27211 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -314,7 +314,6 @@ static void sam460ex_init(MachineState *machine)
 
     /* interrupt controllers */
     for (i = 0; i < ARRAY_SIZE(uic); i++) {
-        SysBusDevice *sbd;
         /*
          * UICs 1, 2 and 3 are cascaded through UIC 0.
          * input_ints[n] is the interrupt number on UIC 0 which
@@ -326,22 +325,20 @@ static void sam460ex_init(MachineState *machine)
         const int input_ints[] = { -1, 30, 10, 16 };
 
         uic[i] = qdev_new(TYPE_PPC_UIC);
-        sbd = SYS_BUS_DEVICE(uic[i]);
-
         qdev_prop_set_uint32(uic[i], "dcr-base", 0xc0 + i * 0x10);
-        object_property_set_link(OBJECT(uic[i]), "cpu", OBJECT(cpu),
-                                 &error_fatal);
-        sysbus_realize_and_unref(sbd, &error_fatal);
+        ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(uic[i]), cpu, &error_fatal);
+        object_unref(OBJECT(uic[i]));
 
+        sbdev = SYS_BUS_DEVICE(uic[i]);
         if (i == 0) {
-            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
+            sysbus_connect_irq(sbdev, PPCUIC_OUTPUT_INT,
                              qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
-            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_CINT,
+            sysbus_connect_irq(sbdev, PPCUIC_OUTPUT_CINT,
                              qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
         } else {
-            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
+            sysbus_connect_irq(sbdev, PPCUIC_OUTPUT_INT,
                                qdev_get_gpio_in(uic[0], input_ints[i]));
-            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_CINT,
+            sysbus_connect_irq(sbdev, PPCUIC_OUTPUT_CINT,
                                qdev_get_gpio_in(uic[0], input_ints[i] + 1));
         }
     }
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 53b126ff48..493ea0c19f 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -104,12 +104,9 @@ static PowerPCCPU *ppc440_init_xilinx(const char *cpu_type, uint32_t sysclk)
 
     /* interrupt controller */
     uicdev = qdev_new(TYPE_PPC_UIC);
+    ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(uicdev), cpu, &error_fatal);
+    object_unref(OBJECT(uicdev));
     uicsbd = SYS_BUS_DEVICE(uicdev);
-
-    object_property_set_link(OBJECT(uicdev), "cpu", OBJECT(cpu),
-                             &error_fatal);
-    sysbus_realize_and_unref(uicsbd, &error_fatal);
-
     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
                        qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
diff --git a/include/hw/intc/ppc-uic.h b/include/hw/intc/ppc-uic.h
index 22dd5e5ac2..4d82e9a3c6 100644
--- a/include/hw/intc/ppc-uic.h
+++ b/include/hw/intc/ppc-uic.h
@@ -25,8 +25,7 @@
 #ifndef HW_INTC_PPC_UIC_H
 #define HW_INTC_PPC_UIC_H
 
-#include "hw/sysbus.h"
-#include "qom/object.h"
+#include "hw/ppc/ppc4xx.h"
 
 #define TYPE_PPC_UIC "ppc-uic"
 OBJECT_DECLARE_SIMPLE_TYPE(PPCUIC, PPC_UIC)
@@ -56,14 +55,13 @@ enum {
 
 struct PPCUIC {
     /*< private >*/
-    SysBusDevice parent_obj;
+    Ppc4xxDcrDeviceState parent_obj;
 
     /*< public >*/
     qemu_irq output_int;
     qemu_irq output_cint;
 
     /* properties */
-    CPUState *cpu;
     uint32_t dcr_base;
     bool use_vectors;
 
-- 
2.37.2


