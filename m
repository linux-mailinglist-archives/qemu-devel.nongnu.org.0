Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A291933152C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:48:37 +0100 (CET)
Received: from localhost ([::1]:52930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJzg-0006nB-KA
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:48:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkt-0006im-7g
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:19 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:38407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkd-00075V-Tz
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:18 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso4294424wmi.3
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pr09MupjCFZZn6n2TbiL0OPMMgOGEzQ19EwlGG2NjiA=;
 b=Bqep9asJBBI8X+ZdgMEbxHQ5WttUEZhgEcmbZ1gSqSi9prXhUPgFDtxi+KDAoVQwJY
 MmkSHwouQDP6GupnZ0olvCG2CVh2cP1hZ8/zUKIFzje+PGoEovfPCosTZAjNVl/e3WSw
 mw547TDKM1Fg/cUBOjxR/FGSY7+F/lV37s/EEn60eAItDXrGGZe9kGzcolLMCypNNdtj
 qf6oq1O7AXPoTKDqNnXZnGMwqW9GNXqVXZL56p6eGgITPwQNelNCsyqDxlu+Fyd8S8TI
 Z39QITtn24IcjBbtV5h3/z/NaAkBrTNi+BqvVw0xvihtUKQKYYsRiFH1F07oOIfgSka+
 DrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pr09MupjCFZZn6n2TbiL0OPMMgOGEzQ19EwlGG2NjiA=;
 b=pxl0XjriPMkpcTSU4nOxh8TFWIM6R0uA0bWXaaS2EGtmH5Bgx5j0miN9wfUAimBbp3
 i/rQwEELKRtwICPBoPXdH+2OPk0ItAcgH21yu18NnSqWczU9uJdQhLlRSDjdnVmI5ojh
 lLh3oRLmjUkqRnuA3re1m5/pcZ0oJucYkjhQtYrGa3ywEt+/oK/EaoBS64Gtp0pjdRQ3
 aKHD/y6UdwQ26lIUcH5NNw6KRghaPfWNVLEPDGr/fKEARdb56pfxLPk9ykQowPNZj9rz
 uqYb+0Fjuxv2CaEeK6AuXybZ7ulcoaKFYNRqT1M9Tt+WeU4G3bE+aZzVWJ3MHIwxn6o+
 tkKg==
X-Gm-Message-State: AOAM531Byfb0hliJ4h0KFAKLU4geHQBKKfWVKG3gh61hZGncdQFO8buL
 RDYWwWo6jg7WiIUyc2HkPdGGSA03+GHiag==
X-Google-Smtp-Source: ABdhPJw7G3hRkPqNuAdzwU6JfDTUIsG3JBMPzSDC8THr2LWZi/J1LQiSSVaTWbIlWjTx6Exy7K0Uvg==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr22570776wmc.43.1615224782452; 
 Mon, 08 Mar 2021 09:33:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/54] hw/arm/armsse: Use an array for apb_ppc fields in the
 state structure
Date: Mon,  8 Mar 2021 17:32:11 +0000
Message-Id: <20210308173244.20710-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

Convert the apb_ppc0 and apb_ppc1 fields in the ARMSSE state struct
to use an array instead of two separate fields.  We already had one
place in the code that wanted to be able to refer to the PPC by
index, and we're about to add more code like that.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-22-peter.maydell@linaro.org
---
 include/hw/arm/armsse.h |  6 +++---
 hw/arm/armsse.c         | 32 ++++++++++++++++++--------------
 2 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 09284ca75cf..771150b0a94 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -124,8 +124,9 @@ OBJECT_DECLARE_TYPE(ARMSSE, ARMSSEClass,
 /* We have an IRQ splitter and an OR gate input for each external PPC
  * and the 2 internal PPCs
  */
+#define NUM_INTERNAL_PPCS 2
 #define NUM_EXTERNAL_PPCS (IOTS_NUM_AHB_EXP_PPC + IOTS_NUM_APB_EXP_PPC)
-#define NUM_PPCS (NUM_EXTERNAL_PPCS + 2)
+#define NUM_PPCS (NUM_EXTERNAL_PPCS + NUM_INTERNAL_PPCS)
 
 #define MAX_SRAM_BANKS 4
 #if MAX_SRAM_BANKS > IOTS_NUM_MPC
@@ -152,8 +153,7 @@ struct ARMSSE {
     ARMv7MState armv7m[SSE_MAX_CPUS];
     CPUClusterState cluster[SSE_MAX_CPUS];
     IoTKitSecCtl secctl;
-    TZPPC apb_ppc0;
-    TZPPC apb_ppc1;
+    TZPPC apb_ppc[NUM_INTERNAL_PPCS];
     TZMPC mpc[IOTS_NUM_MPC];
     CMSDKAPBTimer timer0;
     CMSDKAPBTimer timer1;
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 326e161c8d4..2b25fca1ca2 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -291,8 +291,12 @@ static void armsse_init(Object *obj)
     }
 
     object_initialize_child(obj, "secctl", &s->secctl, TYPE_IOTKIT_SECCTL);
-    object_initialize_child(obj, "apb-ppc0", &s->apb_ppc0, TYPE_TZ_PPC);
-    object_initialize_child(obj, "apb-ppc1", &s->apb_ppc1, TYPE_TZ_PPC);
+
+    for (i = 0; i < ARRAY_SIZE(s->apb_ppc); i++) {
+        g_autofree char *name = g_strdup_printf("apb-ppc%d", i);
+        object_initialize_child(obj, name, &s->apb_ppc[i], TYPE_TZ_PPC);
+    }
+
     for (i = 0; i < info->sram_banks; i++) {
         char *name = g_strdup_printf("mpc%d", i);
         object_initialize_child(obj, name, &s->mpc[i], TYPE_TZ_MPC);
@@ -739,7 +743,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer0), 0,
                        armsse_get_common_irq_in(s, 3));
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->timer0), 0);
-    object_property_set_link(OBJECT(&s->apb_ppc0), "port[0]", OBJECT(mr),
+    object_property_set_link(OBJECT(&s->apb_ppc[0]), "port[0]", OBJECT(mr),
                              &error_abort);
 
     qdev_connect_clock_in(DEVICE(&s->timer1), "pclk", s->mainclk);
@@ -749,7 +753,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer1), 0,
                        armsse_get_common_irq_in(s, 4));
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->timer1), 0);
-    object_property_set_link(OBJECT(&s->apb_ppc0), "port[1]", OBJECT(mr),
+    object_property_set_link(OBJECT(&s->apb_ppc[0]), "port[1]", OBJECT(mr),
                              &error_abort);
 
     qdev_connect_clock_in(DEVICE(&s->dualtimer), "TIMCLK", s->mainclk);
@@ -759,7 +763,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->dualtimer), 0,
                        armsse_get_common_irq_in(s, 5));
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dualtimer), 0);
-    object_property_set_link(OBJECT(&s->apb_ppc0), "port[2]", OBJECT(mr),
+    object_property_set_link(OBJECT(&s->apb_ppc[0]), "port[2]", OBJECT(mr),
                              &error_abort);
 
     if (info->has_mhus) {
@@ -782,7 +786,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
             }
             port = g_strdup_printf("port[%d]", i + 3);
             mr = sysbus_mmio_get_region(mhu_sbd, 0);
-            object_property_set_link(OBJECT(&s->apb_ppc0), port, OBJECT(mr),
+            object_property_set_link(OBJECT(&s->apb_ppc[0]), port, OBJECT(mr),
                                      &error_abort);
             g_free(port);
 
@@ -802,12 +806,12 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->apb_ppc0), errp)) {
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->apb_ppc[0]), errp)) {
         return;
     }
 
-    sbd_apb_ppc0 = SYS_BUS_DEVICE(&s->apb_ppc0);
-    dev_apb_ppc0 = DEVICE(&s->apb_ppc0);
+    sbd_apb_ppc0 = SYS_BUS_DEVICE(&s->apb_ppc[0]);
+    dev_apb_ppc0 = DEVICE(&s->apb_ppc[0]);
 
     mr = sysbus_mmio_get_region(sbd_apb_ppc0, 0);
     memory_region_add_subregion(&s->container, 0x40000000, mr);
@@ -917,16 +921,16 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->s32ktimer), 0,
                        armsse_get_common_irq_in(s, 2));
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->s32ktimer), 0);
-    object_property_set_link(OBJECT(&s->apb_ppc1), "port[0]", OBJECT(mr),
+    object_property_set_link(OBJECT(&s->apb_ppc[1]), "port[0]", OBJECT(mr),
                              &error_abort);
 
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->apb_ppc1), errp)) {
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->apb_ppc[1]), errp)) {
         return;
     }
-    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->apb_ppc1), 0);
+    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->apb_ppc[1]), 0);
     memory_region_add_subregion(&s->container, 0x4002f000, mr);
 
-    dev_apb_ppc1 = DEVICE(&s->apb_ppc1);
+    dev_apb_ppc1 = DEVICE(&s->apb_ppc[1]);
     qdev_connect_gpio_out_named(dev_secctl, "apb_ppc1_nonsec", 0,
                                 qdev_get_gpio_in_named(dev_apb_ppc1,
                                                        "cfg_nonsec", 0));
@@ -1063,7 +1067,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         DeviceState *devs = DEVICE(&s->ppc_irq_splitter[i]);
         char *gpioname = g_strdup_printf("apb_ppc%d_irq_status",
                                          i - NUM_EXTERNAL_PPCS);
-        TZPPC *ppc = (i == NUM_EXTERNAL_PPCS) ? &s->apb_ppc0 : &s->apb_ppc1;
+        TZPPC *ppc = &s->apb_ppc[i - NUM_EXTERNAL_PPCS];
 
         qdev_connect_gpio_out(devs, 0,
                               qdev_get_gpio_in_named(dev_secctl, gpioname, 0));
-- 
2.20.1


