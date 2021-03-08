Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68389331585
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:09:10 +0100 (CET)
Received: from localhost ([::1]:48964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKJZ-0003gK-EN
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkv-0006oR-Bx
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:21 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:54572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkg-00075n-4s
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:21 -0500
Received: by mail-wm1-x32b.google.com with SMTP id u187so2487wmg.4
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pcbo91ZW7y7gpWeGAiM+MiGzgSfPEWZH4AyPuFVDBM4=;
 b=wz6TIaMkxoWUu5ttRu1pedX3nn2SJsZQEO8Q5CwPECHoKwaUARGcLcpcI115ovcgTK
 lxswUlb/B1RTwmCM+bnfuxCXdvxq1+DCLgduPb4seDRBXmZwE5kkRIq7WgH5A/6zTbYu
 Ca4gwf7rFu6yZ/t/Z99/fDH8VTV8/MdqIM8TOvrDz4y1z0rrAJo8gtyjRTzJmABirO5B
 j9XD+y8DCJaR6hSmhPj3n3rC/LYrpiR8u1+v5k4iL48jP+U4Uy1Dj9k+QRyvzQTwU9os
 CksctbzPLjtxGo5s2+BjWupfQg/R1Ds5LZ7HxC0yXZv+uL95V7bundx8ZFuGx4TK6Kz/
 DZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pcbo91ZW7y7gpWeGAiM+MiGzgSfPEWZH4AyPuFVDBM4=;
 b=qm1MX/bI5jdfRbZnLC3f0NlBcc8D1dgLncShz+mO8A17QiqqWyIAUoKKBuSj1jVrDX
 R5vgDpjWsabnvWXXk9r8VrYqED5zLX+Zp06mrwMGe+yG67MAUGOMN+hneefhbI7f1ibk
 SRB5o07YQg1pMrAzY5nTgSZKW2KQBGoKZa7qPoauIzX3UwNUEVauJRUc8CF156vUPiDu
 4Rk96MS9Djs9nJxxk8qVV/wRDG8MBFYB50bXsI5fP9bE1efDDlBFm1RwF68tFlipL7Y7
 cOlQV6aSQdGSZnd2/5sIohO46t+3MGiD0w7tUEbgpYOTUQN06VQ05FQq1ojE2XQhjUvO
 pgzw==
X-Gm-Message-State: AOAM533F+JmqK3TCmHYmkvf9rlDAkDrow899fLT2UCkX59dNqwYV1XMs
 m/Owq8lAv0wCd3tt9yCc4RGTcvqJVmqRxg==
X-Google-Smtp-Source: ABdhPJyM6XM93KsWYyxDgblIpP2njdqvy+RJSadLUJWD2tu4t38KQ7ragLsaBrfCahtumSm9EMKWcA==
X-Received: by 2002:a05:600c:1992:: with SMTP id
 t18mr3034283wmq.125.1615224783907; 
 Mon, 08 Mar 2021 09:33:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/54] hw/arm/armsse: Add framework for data-driven device
 placement
Date: Mon,  8 Mar 2021 17:32:13 +0000
Message-Id: <20210308173244.20710-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

The SSE-300 is mostly the same as the SSE-200, but it has moved some
of the devices in the memory map and uses different device types in
some cases.  To accommodate this, add a framework where the placement
and wiring of some devices can be specified in a data table.

This commit adds the framework for this data-driven device placement,
and makes the CMSDK APB timer devices use it.  Subsequent commits
will convert the other devices which differ between SSE-200 and
SSE-300.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-24-peter.maydell@linaro.org
---
 include/hw/arm/armsse.h |   3 +-
 hw/arm/armsse.c         | 147 +++++++++++++++++++++++++++++++++-------
 2 files changed, 125 insertions(+), 25 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index e34263fed8b..c1f4df295a4 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -158,8 +158,7 @@ struct ARMSSE {
     IoTKitSecCtl secctl;
     TZPPC apb_ppc[NUM_INTERNAL_PPCS];
     TZMPC mpc[IOTS_NUM_MPC];
-    CMSDKAPBTimer timer0;
-    CMSDKAPBTimer timer1;
+    CMSDKAPBTimer timer[2];
     CMSDKAPBTimer s32ktimer;
     qemu_or_irq ppc_irq_orgate;
     SplitIRQ sec_resp_splitter;
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 5ae6ce344ee..22dd437a4ba 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -24,6 +24,27 @@
 #include "hw/irq.h"
 #include "hw/qdev-clock.h"
 
+/*
+ * The SSE-300 puts some devices in different places to the
+ * SSE-200 (and original IoTKit). We use an array of these structs
+ * to define how each variant lays out these devices. (Parts of the
+ * SoC that are the same for all variants aren't handled via these
+ * data structures.)
+ */
+
+#define NO_IRQ -1
+#define NO_PPC -1
+
+typedef struct ARMSSEDeviceInfo {
+    const char *name; /* name to use for the QOM object; NULL terminates list */
+    const char *type; /* QOM type name */
+    unsigned int index; /* Which of the N devices of this type is this ? */
+    hwaddr addr;
+    int ppc; /* Index of APB PPC this device is wired up to, or NO_PPC */
+    int ppc_port; /* Port number of this device on the PPC */
+    int irq; /* NO_IRQ, or 0..NUM_SSE_IRQS-1 */
+} ARMSSEDeviceInfo;
+
 struct ARMSSEInfo {
     const char *name;
     uint32_t sse_version;
@@ -38,6 +59,7 @@ struct ARMSSEInfo {
     bool has_cpusecctrl;
     bool has_cpuid;
     Property *props;
+    const ARMSSEDeviceInfo *devinfo;
 };
 
 static Property iotkit_properties[] = {
@@ -64,6 +86,30 @@ static Property armsse_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
+static const ARMSSEDeviceInfo sse200_devices[] = {
+    {
+        .name = "timer0",
+        .type = TYPE_CMSDK_APB_TIMER,
+        .index = 0,
+        .addr = 0x40000000,
+        .ppc = 0,
+        .ppc_port = 0,
+        .irq = 3,
+    },
+    {
+        .name = "timer1",
+        .type = TYPE_CMSDK_APB_TIMER,
+        .index = 1,
+        .addr = 0x40001000,
+        .ppc = 0,
+        .ppc_port = 1,
+        .irq = 4,
+    },
+    {
+        .name = NULL,
+    }
+};
+
 static const ARMSSEInfo armsse_variants[] = {
     {
         .name = TYPE_IOTKIT,
@@ -79,6 +125,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_cpusecctrl = false,
         .has_cpuid = false,
         .props = iotkit_properties,
+        .devinfo = sse200_devices,
     },
     {
         .name = TYPE_SSE200,
@@ -94,6 +141,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_cpusecctrl = true,
         .has_cpuid = true,
         .props = armsse_properties,
+        .devinfo = sse200_devices,
     },
 };
 
@@ -250,6 +298,7 @@ static void armsse_init(Object *obj)
     ARMSSE *s = ARM_SSE(obj);
     ARMSSEClass *asc = ARM_SSE_GET_CLASS(obj);
     const ARMSSEInfo *info = asc->info;
+    const ARMSSEDeviceInfo *devinfo;
     int i;
 
     assert(info->sram_banks <= MAX_SRAM_BANKS);
@@ -290,6 +339,18 @@ static void armsse_init(Object *obj)
         }
     }
 
+    for (devinfo = info->devinfo; devinfo->name; devinfo++) {
+        assert(devinfo->ppc == NO_PPC || devinfo->ppc < ARRAY_SIZE(s->apb_ppc));
+        if (!strcmp(devinfo->type, TYPE_CMSDK_APB_TIMER)) {
+            assert(devinfo->index < ARRAY_SIZE(s->timer));
+            object_initialize_child(obj, devinfo->name,
+                                    &s->timer[devinfo->index],
+                                    TYPE_CMSDK_APB_TIMER);
+        } else {
+            g_assert_not_reached();
+        }
+    }
+
     object_initialize_child(obj, "secctl", &s->secctl, TYPE_IOTKIT_SECCTL);
 
     for (i = 0; i < ARRAY_SIZE(s->apb_ppc); i++) {
@@ -312,8 +373,6 @@ static void armsse_init(Object *obj)
         object_initialize_child(obj, name, splitter, TYPE_SPLIT_IRQ);
         g_free(name);
     }
-    object_initialize_child(obj, "timer0", &s->timer0, TYPE_CMSDK_APB_TIMER);
-    object_initialize_child(obj, "timer1", &s->timer1, TYPE_CMSDK_APB_TIMER);
     object_initialize_child(obj, "s32ktimer", &s->s32ktimer,
                             TYPE_CMSDK_APB_TIMER);
     object_initialize_child(obj, "dualtimer", &s->dualtimer,
@@ -453,6 +512,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     ARMSSE *s = ARM_SSE(dev);
     ARMSSEClass *asc = ARM_SSE_GET_CLASS(dev);
     const ARMSSEInfo *info = asc->info;
+    const ARMSSEDeviceInfo *devinfo;
     int i;
     MemoryRegion *mr;
     Error *err = NULL;
@@ -736,25 +796,53 @@ static void armsse_realize(DeviceState *dev, Error **errp)
      * it to the appropriate PPC port; then we can realize the PPC and
      * map its upstream ends to the right place in the container.
      */
-    qdev_connect_clock_in(DEVICE(&s->timer0), "pclk", s->mainclk);
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer0), errp)) {
-        return;
-    }
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer0), 0,
-                       armsse_get_common_irq_in(s, 3));
-    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->timer0), 0);
-    object_property_set_link(OBJECT(&s->apb_ppc[0]), "port[0]", OBJECT(mr),
-                             &error_abort);
+    for (devinfo = info->devinfo; devinfo->name; devinfo++) {
+        SysBusDevice *sbd;
+        qemu_irq irq;
 
-    qdev_connect_clock_in(DEVICE(&s->timer1), "pclk", s->mainclk);
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer1), errp)) {
-        return;
+        if (!strcmp(devinfo->type, TYPE_CMSDK_APB_TIMER)) {
+            sbd = SYS_BUS_DEVICE(&s->timer[devinfo->index]);
+
+            qdev_connect_clock_in(DEVICE(sbd), "pclk", s->mainclk);
+            if (!sysbus_realize(sbd, errp)) {
+                return;
+            }
+            mr = sysbus_mmio_get_region(sbd, 0);
+        } else {
+            g_assert_not_reached();
+        }
+
+        switch (devinfo->irq) {
+        case NO_IRQ:
+            irq = NULL;
+            break;
+        case 0 ... NUM_SSE_IRQS - 1:
+            irq = armsse_get_common_irq_in(s, devinfo->irq);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        if (irq) {
+            sysbus_connect_irq(sbd, 0, irq);
+        }
+
+        /*
+         * Devices connected to a PPC are connected to the port here;
+         * we will map the upstream end of that port to the right address
+         * in the container later after the PPC has been realized.
+         * Devices not connected to a PPC can be mapped immediately.
+         */
+        if (devinfo->ppc != NO_PPC) {
+            TZPPC *ppc = &s->apb_ppc[devinfo->ppc];
+            g_autofree char *portname = g_strdup_printf("port[%d]",
+                                                        devinfo->ppc_port);
+            object_property_set_link(OBJECT(ppc), portname, OBJECT(mr),
+                                     &error_abort);
+        } else {
+            memory_region_add_subregion(&s->container, devinfo->addr, mr);
+        }
     }
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer1), 0,
-                       armsse_get_common_irq_in(s, 4));
-    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->timer1), 0);
-    object_property_set_link(OBJECT(&s->apb_ppc[0]), "port[1]", OBJECT(mr),
-                             &error_abort);
 
     qdev_connect_clock_in(DEVICE(&s->dualtimer), "TIMCLK", s->mainclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->dualtimer), errp)) {
@@ -813,10 +901,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     sbd_apb_ppc0 = SYS_BUS_DEVICE(&s->apb_ppc[0]);
     dev_apb_ppc0 = DEVICE(&s->apb_ppc[0]);
 
-    mr = sysbus_mmio_get_region(sbd_apb_ppc0, 0);
-    memory_region_add_subregion(&s->container, 0x40000000, mr);
-    mr = sysbus_mmio_get_region(sbd_apb_ppc0, 1);
-    memory_region_add_subregion(&s->container, 0x40001000, mr);
     mr = sysbus_mmio_get_region(sbd_apb_ppc0, 2);
     memory_region_add_subregion(&s->container, 0x40002000, mr);
     if (info->has_mhus) {
@@ -947,6 +1031,23 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                           qdev_get_gpio_in_named(dev_apb_ppc1,
                                                  "cfg_sec_resp", 0));
 
+    /*
+     * Now both PPCs are realized we can map the upstream ends of
+     * ports which correspond to entries in the devinfo array.
+     * The ports which are connected to non-devinfo devices have
+     * already been mapped.
+     */
+    for (devinfo = info->devinfo; devinfo->name; devinfo++) {
+        SysBusDevice *ppc_sbd;
+
+        if (devinfo->ppc == NO_PPC) {
+            continue;
+        }
+        ppc_sbd = SYS_BUS_DEVICE(&s->apb_ppc[devinfo->ppc]);
+        mr = sysbus_mmio_get_region(ppc_sbd, devinfo->ppc_port);
+        memory_region_add_subregion(&s->container, devinfo->addr, mr);
+    }
+
     if (!object_property_set_int(OBJECT(&s->sysinfo), "SYS_VERSION",
                                  info->sys_version, errp)) {
         return;
-- 
2.20.1


