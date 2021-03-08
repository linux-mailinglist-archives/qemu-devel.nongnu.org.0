Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3243315BB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:18:47 +0100 (CET)
Received: from localhost ([::1]:45404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKSs-0006DM-Gs
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:18:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJl2-00074D-W0
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:29 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkk-00076K-VW
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:28 -0500
Received: by mail-wr1-x42c.google.com with SMTP id u14so12350226wri.3
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VzBFR3Zg7nDFsCTXNMdnPjwhZo6M/LAKlaXW7PFlGEQ=;
 b=s710ZIqiHsGTxMAqfwTVWT4nNi2G0anN73o53m1SeUjqrVr5W0QRaGr37a0R6XLKfB
 ArIRGIIMY9rbzrnAylqg9ZmSEe1ZyID5+2yah8smQFXTwYOmaDFyap7lIN0X3H2Cddht
 dLCB+quA1eKSfLJ1JUXahSSSH0V/BOiJCWxaML/3vN/rDJ5hIwaTumT/udQxhOQSKWay
 tcbReIiBR1/m8z4a6ieqKSwJIQjEeTkKeunzqKJaYx/Ao1V8zGb6o9MZvgWQUmuNBROw
 fWwWWhSaJCN6Crv1p3Dfv8HwokhrNejmzHYWoiv9odavYNXgSVbS7PRzQuXPnzsyHw85
 NQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VzBFR3Zg7nDFsCTXNMdnPjwhZo6M/LAKlaXW7PFlGEQ=;
 b=e3i/nxrqa/+EmRNS6Ez3HUSw6HleHUHbZFocY9/cIhe/TPtiU+crZsjSfhKJ2gbvck
 GJAtdQ2JwWCHyCXLqaO1qEF6bQtxW+W9c+EaJ9gizZlSenFf6qtgp8gPuVRfMd+5494z
 ikFjyJm8D6YYJJ2Zm9S7JvbSmifPwyACAiPVE6nG0hNil0Tpu+BWAQWPn2NWDUZO3zGZ
 LF7SyNHMMhrrnzv6RytTkKnyor/ZzT/bMFEXLjP2GXv+CCq5Ob+dRsdctt3XuuQqJtIL
 WJDVPtvxy6+zMgfQXRF/PZKT1K7RbCY/KMI3YgpUXELPXgdYg9yoFtZbGF0PmT1O8o0A
 9ELA==
X-Gm-Message-State: AOAM5307TGxVX6dQ3a+VyNBWnKcSFVz5SLhDb2QXwtTBq/12MCdFpPJ6
 1mP7SeSFR+8V+d0JlTTx07udZBAFakFckw==
X-Google-Smtp-Source: ABdhPJysIneKqgLUtDzpSwfYUVmjQX8puw1YQxbbzGQVCPMr/S4F05sGDwvUZwKUqKOrsNCZhwU0AQ==
X-Received: by 2002:a5d:4592:: with SMTP id p18mr25656706wrq.244.1615224788447; 
 Mon, 08 Mar 2021 09:33:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/54] hw/arm/armsse: Move PPUs into data-driven framework
Date: Mon,  8 Mar 2021 17:32:19 +0000
Message-Id: <20210308173244.20710-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

Move the PPUs into the data-driven device placement framework.
We don't implement them, so they are just TYPE_UNIMPLEMENTED stubs.

Because the SSE-200 and the IotKit diverge here (the IoTKit does
not have the PPUs) we need to separate out the ARMSSEDeviceInfo
for the two variants, and only add the PPUs to the SSE-200.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-30-peter.maydell@linaro.org
---
 include/hw/arm/armsse.h |  10 +-
 hw/arm/armsse.c         | 222 +++++++++++++++++++++++++++++-----------
 2 files changed, 165 insertions(+), 67 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 7416c08a802..eb4e937173f 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -135,14 +135,6 @@ OBJECT_DECLARE_TYPE(ARMSSE, ARMSSEClass,
 
 #define SSE_MAX_CPUS 2
 
-/* These define what each PPU in the ppu[] index is for */
-#define CPU0CORE_PPU 0
-#define CPU1CORE_PPU 1
-#define DBG_PPU 2
-#define RAM0_PPU 3
-#define RAM1_PPU 4
-#define RAM2_PPU 5
-#define RAM3_PPU 6
 #define NUM_PPUS 7
 
 /* Number of CPU IRQs used by the SSE itself */
@@ -176,7 +168,7 @@ struct ARMSSE {
     IoTKitSysCtl sysinfo;
 
     ARMSSEMHU mhu[2];
-    UnimplementedDeviceState ppu[NUM_PPUS];
+    UnimplementedDeviceState unimp[NUM_PPUS];
     UnimplementedDeviceState cachectrl[SSE_MAX_CPUS];
     UnimplementedDeviceState cpusecctrl[SSE_MAX_CPUS];
 
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 961b2d44137..f72d1adafea 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -47,6 +47,7 @@ typedef struct ARMSSEDeviceInfo {
     const char *type; /* QOM type name */
     unsigned int index; /* Which of the N devices of this type is this ? */
     hwaddr addr;
+    hwaddr size; /* only needed for TYPE_UNIMPLEMENTED_DEVICE */
     int ppc; /* Index of APB PPC this device is wired up to, or NO_PPC */
     int ppc_port; /* Port number of this device on the PPC */
     int irq; /* NO_IRQ, or 0..NUM_SSE_IRQS-1, or NMI_0 or NMI_1 */
@@ -62,7 +63,6 @@ struct ARMSSEInfo {
     uint32_t iidr;
     uint32_t cpuwait_rst;
     bool has_mhus;
-    bool has_ppus;
     bool has_cachectrl;
     bool has_cpusecctrl;
     bool has_cpuid;
@@ -94,7 +94,7 @@ static Property armsse_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
-static const ARMSSEDeviceInfo sse200_devices[] = {
+static const ARMSSEDeviceInfo iotkit_devices[] = {
     {
         .name = "timer0",
         .type = TYPE_CMSDK_APB_TIMER,
@@ -178,6 +178,153 @@ static const ARMSSEDeviceInfo sse200_devices[] = {
     }
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
+        .name = "s32ktimer",
+        .type = TYPE_CMSDK_APB_TIMER,
+        .index = 2,
+        .addr = 0x4002f000,
+        .ppc = 1,
+        .ppc_port = 0,
+        .irq = 2,
+        .slowclk = true,
+    },
+    {
+        .name = "dualtimer",
+        .type = TYPE_CMSDK_APB_DUALTIMER,
+        .index = 0,
+        .addr = 0x40002000,
+        .ppc = 0,
+        .ppc_port = 2,
+        .irq = 5,
+    },
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
+    {
+        .name = "armsse-sysinfo",
+        .type = TYPE_IOTKIT_SYSINFO,
+        .index = 0,
+        .addr = 0x40020000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = "armsse-sysctl",
+        .type = TYPE_IOTKIT_SYSCTL,
+        .index = 0,
+        .addr = 0x50021000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = "CPU0CORE_PPU",
+        .type = TYPE_UNIMPLEMENTED_DEVICE,
+        .index = 0,
+        .addr = 0x50023000,
+        .size = 0x1000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = "CPU1CORE_PPU",
+        .type = TYPE_UNIMPLEMENTED_DEVICE,
+        .index = 1,
+        .addr = 0x50025000,
+        .size = 0x1000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = "DBG_PPU",
+        .type = TYPE_UNIMPLEMENTED_DEVICE,
+        .index = 2,
+        .addr = 0x50029000,
+        .size = 0x1000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = "RAM0_PPU",
+        .type = TYPE_UNIMPLEMENTED_DEVICE,
+        .index = 3,
+        .addr = 0x5002a000,
+        .size = 0x1000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = "RAM1_PPU",
+        .type = TYPE_UNIMPLEMENTED_DEVICE,
+        .index = 4,
+        .addr = 0x5002b000,
+        .size = 0x1000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = "RAM2_PPU",
+        .type = TYPE_UNIMPLEMENTED_DEVICE,
+        .index = 5,
+        .addr = 0x5002c000,
+        .size = 0x1000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = "RAM3_PPU",
+        .type = TYPE_UNIMPLEMENTED_DEVICE,
+        .index = 6,
+        .addr = 0x5002d000,
+        .size = 0x1000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = NULL,
+    }
+};
+
 static const ARMSSEInfo armsse_variants[] = {
     {
         .name = TYPE_IOTKIT,
@@ -188,12 +335,11 @@ static const ARMSSEInfo armsse_variants[] = {
         .iidr = 0,
         .cpuwait_rst = 0,
         .has_mhus = false,
-        .has_ppus = false,
         .has_cachectrl = false,
         .has_cpusecctrl = false,
         .has_cpuid = false,
         .props = iotkit_properties,
-        .devinfo = sse200_devices,
+        .devinfo = iotkit_devices,
     },
     {
         .name = TYPE_SSE200,
@@ -204,7 +350,6 @@ static const ARMSSEInfo armsse_variants[] = {
         .iidr = 0,
         .cpuwait_rst = 2,
         .has_mhus = true,
-        .has_ppus = true,
         .has_cachectrl = true,
         .has_cpusecctrl = true,
         .has_cpuid = true,
@@ -431,6 +576,11 @@ static void armsse_init(Object *obj)
             assert(devinfo->index == 0);
             object_initialize_child(obj, devinfo->name, &s->sysctl,
                                     TYPE_IOTKIT_SYSCTL);
+        } else if (!strcmp(devinfo->type, TYPE_UNIMPLEMENTED_DEVICE)) {
+            assert(devinfo->index < ARRAY_SIZE(s->unimp));
+            object_initialize_child(obj, devinfo->name,
+                                    &s->unimp[devinfo->index],
+                                    TYPE_UNIMPLEMENTED_DEVICE);
         } else {
             g_assert_not_reached();
         }
@@ -463,26 +613,6 @@ static void armsse_init(Object *obj)
         object_initialize_child(obj, "mhu0", &s->mhu[0], TYPE_ARMSSE_MHU);
         object_initialize_child(obj, "mhu1", &s->mhu[1], TYPE_ARMSSE_MHU);
     }
-    if (info->has_ppus) {
-        for (i = 0; i < info->num_cpus; i++) {
-            char *name = g_strdup_printf("CPU%dCORE_PPU", i);
-            int ppuidx = CPU0CORE_PPU + i;
-
-            object_initialize_child(obj, name, &s->ppu[ppuidx],
-                                    TYPE_UNIMPLEMENTED_DEVICE);
-            g_free(name);
-        }
-        object_initialize_child(obj, "DBG_PPU", &s->ppu[DBG_PPU],
-                                TYPE_UNIMPLEMENTED_DEVICE);
-        for (i = 0; i < info->sram_banks; i++) {
-            char *name = g_strdup_printf("RAM%d_PPU", i);
-            int ppuidx = RAM0_PPU + i;
-
-            object_initialize_child(obj, name, &s->ppu[ppuidx],
-                                    TYPE_UNIMPLEMENTED_DEVICE);
-            g_free(name);
-        }
-    }
     if (info->has_cachectrl) {
         for (i = 0; i < info->num_cpus; i++) {
             char *name = g_strdup_printf("cachectrl%d", i);
@@ -568,17 +698,6 @@ static qemu_irq armsse_get_common_irq_in(ARMSSE *s, int irqno)
     }
 }
 
-static void map_ppu(ARMSSE *s, int ppuidx, const char *name, hwaddr addr)
-{
-    /* Map a PPU unimplemented device stub */
-    DeviceState *dev = DEVICE(&s->ppu[ppuidx]);
-
-    qdev_prop_set_string(dev, "name", name);
-    qdev_prop_set_uint64(dev, "size", 0x1000);
-    sysbus_realize(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ppu[ppuidx]), 0, addr);
-}
-
 static void armsse_realize(DeviceState *dev, Error **errp)
 {
     ARMSSE *s = ARM_SSE(dev);
@@ -941,6 +1060,15 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                 return;
             }
             mr = sysbus_mmio_get_region(sbd, 0);
+        } else if (!strcmp(devinfo->type, TYPE_UNIMPLEMENTED_DEVICE)) {
+            sbd = SYS_BUS_DEVICE(&s->unimp[devinfo->index]);
+
+            qdev_prop_set_string(DEVICE(sbd), "name", devinfo->name);
+            qdev_prop_set_uint64(DEVICE(sbd), "size", devinfo->size);
+            if (!sysbus_realize(sbd, errp)) {
+                return;
+            }
+            mr = sysbus_mmio_get_region(sbd, 0);
         } else {
             g_assert_not_reached();
         }
@@ -1158,28 +1286,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         memory_region_add_subregion(&s->container, devinfo->addr, mr);
     }
 
-    if (info->has_ppus) {
-        /* CPUnCORE_PPU for each CPU */
-        for (i = 0; i < info->num_cpus; i++) {
-            char *name = g_strdup_printf("CPU%dCORE_PPU", i);
-
-            map_ppu(s, CPU0CORE_PPU + i, name, 0x50023000 + i * 0x2000);
-            /*
-             * We don't support CPU debug so don't create the
-             * CPU0DEBUG_PPU at 0x50024000 and 0x50026000.
-             */
-            g_free(name);
-        }
-        map_ppu(s, DBG_PPU, "DBG_PPU", 0x50029000);
-
-        for (i = 0; i < info->sram_banks; i++) {
-            char *name = g_strdup_printf("RAM%d_PPU", i);
-
-            map_ppu(s, RAM0_PPU + i, name, 0x5002a000 + i * 0x1000);
-            g_free(name);
-        }
-    }
-
     for (i = 0; i < ARRAY_SIZE(s->ppc_irq_splitter); i++) {
         Object *splitter = OBJECT(&s->ppc_irq_splitter[i]);
 
-- 
2.20.1


