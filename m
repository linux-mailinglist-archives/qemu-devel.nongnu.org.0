Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3DF31FBAB
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:08:28 +0100 (CET)
Received: from localhost ([::1]:59884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7ON-0002uE-Ju
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:08:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73f-0002Uq-Np
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:03 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73I-0003Zk-KH
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:03 -0500
Received: by mail-wr1-x431.google.com with SMTP id 7so8918280wrz.0
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ypb9NfsHfVKKOEKmFsF9EWiA17gITygP1HJEOh1ub2g=;
 b=E6QddN8Rr3BHAQ6mJAsaB6OVciN+FlQPW2EIyhyttI4s/+g3VdsIhlqlRQcMfg5v6S
 +wtJkTOW6EeSuyfjbLxC0WCFHQnyBSeNvDKahMCAZGHxpzqbsTvcB5IXBTkTE/EbhbfC
 OC6G9+ZuIkdLZPrL8Tyl1YGH8O+1OCOHBSpN8LANSI98IGGXa7bArA6BrEgLbIxvrgpF
 H+Dx2uwJc/hXbmy5UhkZnxTX4e3loxyqzviT1pUxeeTSqJAu2mslUoc1XYE2lTz14rDi
 95rImNyzWdvu+s4u/UnikdExhJ+jEaiDUOY7S3kPLfady9DbzRIiiqYiI/1W+htjuteD
 MUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ypb9NfsHfVKKOEKmFsF9EWiA17gITygP1HJEOh1ub2g=;
 b=axqm6j2C6DoqjZtT1XRL7tzo80Fx4qR3w265vMtskKVnkwoFnl6TTUhlM0UESlYSo0
 wLaqm1KYKVBwa0ZUIDKN/mMa+is4WK3Un6h1mOgtss16QqYmEKvtgBeZbFz4zCdQ7wDu
 6YwMKh3nhBtKZEKTjR68odjIhJVmixwiwwVZ2G1fwe4I8FT07TVioX9OBEl7Pher7e9D
 cInETLXd1h6+3+Ckz2CIuYNdt2soozwqFRyf5nR0oTicHXR6HTZFVLCcnV9gGGIKMDzj
 9hRY3WPpkWfnp9ceDu7DreKuRVaNfY6H5VLQ/1kJ8X88/V+6W9LtpI1Tnnomgn/mP2vm
 NSmw==
X-Gm-Message-State: AOAM530mwNpz3R8dyuwgdfH7WdfPFFAdoL1oZh6IBdyWiGyVeLJ7CDNb
 qWQktudyJkTtoPzfnAavcxYLtw==
X-Google-Smtp-Source: ABdhPJwpjR96GIlmzjKPulL9/sVGe6CR3wNvcrjFyDwRXHkGvn1E8kE0iYhne2jR3UI1e9kF7QbdBQ==
X-Received: by 2002:adf:82b3:: with SMTP id 48mr9255199wrc.22.1613745999174;
 Fri, 19 Feb 2021 06:46:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 25/44] hw/arm/armsse: Move watchdogs into data-driven framework
Date: Fri, 19 Feb 2021 14:45:58 +0000
Message-Id: <20210219144617.4782-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Move the CMSDK watchdog device handling into the data-driven device
placement framework.  This is slightly more complicated because these
devices might wire their IRQs up to the NMI line, and because one of
them uses the slow 32KHz clock rather than the main clock.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h |   4 +-
 hw/arm/armsse.c         | 109 ++++++++++++++++++++++++----------------
 2 files changed, 66 insertions(+), 47 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index c1f4df295a4..3f8f3750577 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -171,9 +171,7 @@ struct ARMSSE {
 
     CMSDKAPBDualTimer dualtimer;
 
-    CMSDKAPBWatchdog s32kwatchdog;
-    CMSDKAPBWatchdog nswatchdog;
-    CMSDKAPBWatchdog swatchdog;
+    CMSDKAPBWatchdog cmsdk_watchdog[3];
 
     IoTKitSysCtl sysctl;
     IoTKitSysCtl sysinfo;
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index f8da7fb00f9..6540ffb919b 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -34,6 +34,13 @@
 
 #define NO_IRQ -1
 #define NO_PPC -1
+/*
+ * Special values for ARMSSEDeviceInfo::irq to indicate that this
+ * device uses one of the inputs to the OR gate that feeds into the
+ * CPU NMI input.
+ */
+#define NMI_0 10000
+#define NMI_1 10001
 
 typedef struct ARMSSEDeviceInfo {
     const char *name; /* name to use for the QOM object; NULL terminates list */
@@ -42,7 +49,8 @@ typedef struct ARMSSEDeviceInfo {
     hwaddr addr;
     int ppc; /* Index of APB PPC this device is wired up to, or NO_PPC */
     int ppc_port; /* Port number of this device on the PPC */
-    int irq; /* NO_IRQ, or 0..NUM_SSE_IRQS-1 */
+    int irq; /* NO_IRQ, or 0..NUM_SSE_IRQS-1, or NMI_0 or NMI_1 */
+    bool slowclk; /* true if device uses the slow 32KHz clock */
 } ARMSSEDeviceInfo;
 
 struct ARMSSEInfo {
@@ -114,6 +122,31 @@ static const ARMSSEDeviceInfo sse200_devices[] = {
         .ppc_port = 2,
         .irq = 5,
     },
+    {
+        .name = "s32kwatchdog",
+        .type = TYPE_CMSDK_APB_WATCHDOG,
+        .index = 0,
+        .addr = 0x5002e000,
+        .ppc = NO_PPC,
+        .irq = NMI_0,
+        .slowclk = true,
+    },
+    {
+        .name = "nswatchdog",
+        .type = TYPE_CMSDK_APB_WATCHDOG,
+        .index = 1,
+        .addr = 0x40081000,
+        .ppc = NO_PPC,
+        .irq = 1,
+    },
+    {
+        .name = "swatchdog",
+        .type = TYPE_CMSDK_APB_WATCHDOG,
+        .index = 2,
+        .addr = 0x50081000,
+        .ppc = NO_PPC,
+        .irq = NMI_1,
+    },
     {
         .name = NULL,
     }
@@ -359,6 +392,11 @@ static void armsse_init(Object *obj)
             assert(devinfo->index == 0);
             object_initialize_child(obj, devinfo->name, &s->dualtimer,
                                     TYPE_CMSDK_APB_DUALTIMER);
+        } else if (!strcmp(devinfo->type, TYPE_CMSDK_APB_WATCHDOG)) {
+            assert(devinfo->index < ARRAY_SIZE(s->cmsdk_watchdog));
+            object_initialize_child(obj, devinfo->name,
+                                    &s->cmsdk_watchdog[devinfo->index],
+                                    TYPE_CMSDK_APB_WATCHDOG);
         } else {
             g_assert_not_reached();
         }
@@ -386,14 +424,9 @@ static void armsse_init(Object *obj)
         object_initialize_child(obj, name, splitter, TYPE_SPLIT_IRQ);
         g_free(name);
     }
+
     object_initialize_child(obj, "s32ktimer", &s->s32ktimer,
                             TYPE_CMSDK_APB_TIMER);
-    object_initialize_child(obj, "s32kwatchdog", &s->s32kwatchdog,
-                            TYPE_CMSDK_APB_WATCHDOG);
-    object_initialize_child(obj, "nswatchdog", &s->nswatchdog,
-                            TYPE_CMSDK_APB_WATCHDOG);
-    object_initialize_child(obj, "swatchdog", &s->swatchdog,
-                            TYPE_CMSDK_APB_WATCHDOG);
     object_initialize_child(obj, "armsse-sysctl", &s->sysctl,
                             TYPE_IOTKIT_SYSCTL);
     object_initialize_child(obj, "armsse-sysinfo", &s->sysinfo,
@@ -797,6 +830,17 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     qdev_connect_gpio_out(DEVICE(&s->mpc_irq_orgate), 0,
                           armsse_get_common_irq_in(s, 9));
 
+    /* This OR gate wires together outputs from the secure watchdogs to NMI */
+    if (!object_property_set_int(OBJECT(&s->nmi_orgate), "num-lines", 2,
+                                 errp)) {
+        return;
+    }
+    if (!qdev_realize(DEVICE(&s->nmi_orgate), NULL, errp)) {
+        return;
+    }
+    qdev_connect_gpio_out(DEVICE(&s->nmi_orgate), 0,
+                          qdev_get_gpio_in_named(DEVICE(&s->armv7m), "NMI", 0));
+
     /* Devices behind APB PPC0:
      *   0x40000000: timer0
      *   0x40001000: timer1
@@ -827,6 +871,15 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                 return;
             }
             mr = sysbus_mmio_get_region(sbd, 0);
+        } else if (!strcmp(devinfo->type, TYPE_CMSDK_APB_WATCHDOG)) {
+            sbd = SYS_BUS_DEVICE(&s->cmsdk_watchdog[devinfo->index]);
+
+            qdev_connect_clock_in(DEVICE(sbd), "WDOGCLK",
+                                  devinfo->slowclk ? s->s32kclk : s->mainclk);
+            if (!sysbus_realize(sbd, errp)) {
+                return;
+            }
+            mr = sysbus_mmio_get_region(sbd, 0);
         } else {
             g_assert_not_reached();
         }
@@ -838,6 +891,11 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         case 0 ... NUM_SSE_IRQS - 1:
             irq = armsse_get_common_irq_in(s, devinfo->irq);
             break;
+        case NMI_0:
+        case NMI_1:
+            irq = qdev_get_gpio_in(DEVICE(&s->nmi_orgate),
+                                   devinfo->irq - NMI_0);
+            break;
         default:
             g_assert_not_reached();
         }
@@ -1108,43 +1166,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    /* This OR gate wires together outputs from the secure watchdogs to NMI */
-    if (!object_property_set_int(OBJECT(&s->nmi_orgate), "num-lines", 2,
-                                 errp)) {
-        return;
-    }
-    if (!qdev_realize(DEVICE(&s->nmi_orgate), NULL, errp)) {
-        return;
-    }
-    qdev_connect_gpio_out(DEVICE(&s->nmi_orgate), 0,
-                          qdev_get_gpio_in_named(DEVICE(&s->armv7m), "NMI", 0));
-
-    qdev_connect_clock_in(DEVICE(&s->s32kwatchdog), "WDOGCLK", s->s32kclk);
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->s32kwatchdog), errp)) {
-        return;
-    }
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->s32kwatchdog), 0,
-                       qdev_get_gpio_in(DEVICE(&s->nmi_orgate), 0));
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->s32kwatchdog), 0, 0x5002e000);
-
-    /* 0x40080000 .. 0x4008ffff : ARMSSE second Base peripheral region */
-
-    qdev_connect_clock_in(DEVICE(&s->nswatchdog), "WDOGCLK", s->mainclk);
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->nswatchdog), errp)) {
-        return;
-    }
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->nswatchdog), 0,
-                       armsse_get_common_irq_in(s, 1));
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->nswatchdog), 0, 0x40081000);
-
-    qdev_connect_clock_in(DEVICE(&s->swatchdog), "WDOGCLK", s->mainclk);
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->swatchdog), errp)) {
-        return;
-    }
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->swatchdog), 0,
-                       qdev_get_gpio_in(DEVICE(&s->nmi_orgate), 1));
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->swatchdog), 0, 0x50081000);
-
     for (i = 0; i < ARRAY_SIZE(s->ppc_irq_splitter); i++) {
         Object *splitter = OBJECT(&s->ppc_irq_splitter[i]);
 
-- 
2.20.1


