Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CF733158B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:11:52 +0100 (CET)
Received: from localhost ([::1]:56508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKMB-0006mU-C0
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:11:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkw-0006qb-0G
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:22 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJki-00075y-Gb
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:21 -0500
Received: by mail-wr1-x429.google.com with SMTP id d15so12343000wrv.5
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iuyiLn4KGvttLEu60Dar3A697ZuItbMknvlHJfRw2cQ=;
 b=EyXe7CtI6TlTq8Rs1lKus/84/PsQGdkLLeS+8hZwWJRicE3AEdncCvJ+N4pLCh55P/
 iLMaLm42DA3ZhXDrlg4YhRpmynvyEthQ6ooJ2y519JCWiwUljljD24Hul4hJ7AhtcJAB
 oq4ti5f7ZBSmyRVhRvwpsrdcjy7zTuVawN1WjU+pK6uvkkEtDL1ewdH74HVHFXYfDVgp
 I4UeOFOTy9vXpnwqeVTaxkKwwx5Hf1iSu6swSQZt7o/pZlNTGD66JoSXXhJZzPKPPEQM
 Laqjihlu/UDCk2hKBnHcAASRWCyJFkmIxmq8tBIEnegRGkVBZgaPJuhtB1CkDef+0Bfg
 nFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iuyiLn4KGvttLEu60Dar3A697ZuItbMknvlHJfRw2cQ=;
 b=KM5GkWizwL2DtYN1UGCOvGcL7KauNQwzQnKVXDDtx53HaprjKXgxyKfyv07XDzyvBy
 9O6akU2T/9mCBVlYUjIsAjDZcdFUnnUUuiipyj8W8XFmQ23pyHzoznvAe8PoUrgjzJlE
 88p5wTOsUwl+y48NZCXSxJOPNV4g3x5W1ek9EdS1i0SLTzUvg13I4+GziYl0FJk3doyx
 CKKIh6zKcmL6fGox2Wk6uyEtxC/na8xw11YJrfHFTGf4X4A0AXPZpAzPq5qV1tcHgwa4
 qaRPLe2k/FW4T/MHyP4efKlZuSBbTMOGeB47jYyUtglWUidYmOXkYKJwkcYwzMXye1GT
 jkNw==
X-Gm-Message-State: AOAM532kthXb3J8krliuAFFfa4tkduW40d0pxIvjYSEZPyomn1WEVCA7
 rg3RMx1vQwjo4T1j5SpbyPqMpDLSiMujXA==
X-Google-Smtp-Source: ABdhPJyDAdg/iornRAL3tV2KA2CMO3rUaDjq1mEHaMuPqQtwQ0WxWcxRjCAuVlhDzz4Fr2w9zInfkQ==
X-Received: by 2002:adf:dd4f:: with SMTP id u15mr24439210wrm.260.1615224785384; 
 Mon, 08 Mar 2021 09:33:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/54] hw/arm/armsse: Move watchdogs into data-driven framework
Date: Mon,  8 Mar 2021 17:32:15 +0000
Message-Id: <20210308173244.20710-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-26-peter.maydell@linaro.org
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


