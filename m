Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0BF3FD86F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:08:27 +0200 (CEST)
Received: from localhost ([::1]:36828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLO6U-0000Xu-7m
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcS-0007Ak-DW
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:25 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcK-0005qe-6x
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:24 -0400
Received: by mail-wr1-x42f.google.com with SMTP id b6so3705477wrh.10
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eBt5P+WEQI8XZSApXglAcqpV6GH9r8ahPX4b9vNojmU=;
 b=r7s/IKp8oryYsJSC49QLz6Ty/y/NycDNw71zn2B/4kWu0ykg3UeKx//Q6YWR8g8H4m
 FPbxjAaPij9qetHQcMACq8N8c//04qkhQuO/xiLHfFAehJBA2WFA6hCp2jMwUdvzTkSV
 4qjtrAzg9aBaNfmoZkBAHuOlQ9jmZcjjuOVQaAJdQbhloVwcuWibFBoxe4+symjBfcCM
 85EMYri35w4nS6OYzX33+AMHSTZGVku2eHm0mCbIhMfO0IKfozW/bids08WvQ2+7gJtp
 FMTLx4YFLoStQV82yiUPrFAvAXS59CuGLylKKCWpCaysBInBn3x441zrjBpuo1BIxmfi
 xBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eBt5P+WEQI8XZSApXglAcqpV6GH9r8ahPX4b9vNojmU=;
 b=B4DDZBm/ViIq1aPwrQUrWXx37jwXVAnRli/UcUAe9kHHb3AT6TtAyv0sPKjxHgTExp
 2H1vxabFxaF0tte/VLEfat1e3fmzkHOsRBBEJMM5a52dyhhfvvmONXi9R361OHELCHpH
 x7TJGKnhQJOClPdjEubnSRMfhIpxYZ78YxkoXFf+8Ym8gWush0zH5F2hS/iCzfyB9Tp3
 PbVSjRHttto6XlDdy/4JizFKbvo7z9dTuxlWePS+/CwxzgjisJz49P/sji9Rpw0qXRj3
 Lps90QF8z+zIjePBotawAYnCXQzwsm6wqxDA10QnBLeOUlayYCliEA4OyI9YcTrPz5ev
 U9pw==
X-Gm-Message-State: AOAM530JYaDEf5R93ALMXcZPhagcoduivys7rKXLQ2XZ09OYZAKhb1zZ
 f1wNaxWAV9SRJlIcK9p9F2shWeAQ4DMeXg==
X-Google-Smtp-Source: ABdhPJwKluFuNJz5QK8rc1naZ7t+sjtIaewLCKn64BkBqwwk4GbSIDMCzgx1Ia0V90piGV+LPYPP5w==
X-Received: by 2002:adf:ded1:: with SMTP id i17mr36161096wrn.303.1630492634867; 
 Wed, 01 Sep 2021 03:37:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/51] arm: Move systick device creation from NVIC to ARMv7M
 object
Date: Wed,  1 Sep 2021 11:36:30 +0100
Message-Id: <20210901103653.13435-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

There's no particular reason why the NVIC should be owning the
SysTick device objects; move them into the ARMv7M container object
instead, as part of consolidating the "create the devices which are
built into an M-profile CPU and map them into their architected
locations in the address space" work into one place.

This involves temporarily creating a duplicate copy of the
nvic_sysreg_ns_ops struct and its read/write functions (renamed as
v7m_sysreg_ns_*), but we will delete the NVIC's copy of this code in
a subsequent patch.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210812093356.1946-3-peter.maydell@linaro.org
---
 include/hw/arm/armv7m.h       |  12 ++++
 include/hw/intc/armv7m_nvic.h |   4 --
 hw/arm/armv7m.c               | 125 ++++++++++++++++++++++++++++++++++
 hw/intc/armv7m_nvic.c         |  73 --------------------
 4 files changed, 137 insertions(+), 77 deletions(-)

diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index 4cae0d7eeaa..360c35c5fb2 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -60,11 +60,23 @@ struct ARMv7MState {
     BitBandState bitband[ARMV7M_NUM_BITBANDS];
     ARMCPU *cpu;
     ARMv7MRAS ras;
+    SysTickState systick[M_REG_NUM_BANKS];
 
     /* MemoryRegion we pass to the CPU, with our devices layered on
      * top of the ones the board provides in board_memory.
      */
     MemoryRegion container;
+    /*
+     * MemoryRegion which passes the transaction to either the S or the
+     * NS systick device depending on the transaction attributes
+     */
+    MemoryRegion systickmem;
+    /*
+     * MemoryRegion which enforces the S/NS handling of the systick
+     * device NS alias region and passes the transaction to the
+     * NS systick device if appropriate.
+     */
+    MemoryRegion systick_ns_mem;
 
     /* Properties */
     char *cpu_type;
diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index 33b6d8810c7..6a6a99090c7 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -81,16 +81,12 @@ struct NVICState {
 
     MemoryRegion sysregmem;
     MemoryRegion sysreg_ns_mem;
-    MemoryRegion systickmem;
-    MemoryRegion systick_ns_mem;
     MemoryRegion container;
     MemoryRegion defaultmem;
 
     uint32_t num_irq;
     qemu_irq excpout;
     qemu_irq sysresetreq;
-
-    SysTickState systick[M_REG_NUM_BANKS];
 };
 
 #endif
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 8964730d153..364ac069702 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -124,6 +124,85 @@ static const hwaddr bitband_output_addr[ARMV7M_NUM_BITBANDS] = {
     0x22000000, 0x42000000
 };
 
+static MemTxResult v7m_sysreg_ns_write(void *opaque, hwaddr addr,
+                                       uint64_t value, unsigned size,
+                                       MemTxAttrs attrs)
+{
+    MemoryRegion *mr = opaque;
+
+    if (attrs.secure) {
+        /* S accesses to the alias act like NS accesses to the real region */
+        attrs.secure = 0;
+        return memory_region_dispatch_write(mr, addr, value,
+                                            size_memop(size) | MO_TE, attrs);
+    } else {
+        /* NS attrs are RAZ/WI for privileged, and BusFault for user */
+        if (attrs.user) {
+            return MEMTX_ERROR;
+        }
+        return MEMTX_OK;
+    }
+}
+
+static MemTxResult v7m_sysreg_ns_read(void *opaque, hwaddr addr,
+                                      uint64_t *data, unsigned size,
+                                      MemTxAttrs attrs)
+{
+    MemoryRegion *mr = opaque;
+
+    if (attrs.secure) {
+        /* S accesses to the alias act like NS accesses to the real region */
+        attrs.secure = 0;
+        return memory_region_dispatch_read(mr, addr, data,
+                                           size_memop(size) | MO_TE, attrs);
+    } else {
+        /* NS attrs are RAZ/WI for privileged, and BusFault for user */
+        if (attrs.user) {
+            return MEMTX_ERROR;
+        }
+        *data = 0;
+        return MEMTX_OK;
+    }
+}
+
+static const MemoryRegionOps v7m_sysreg_ns_ops = {
+    .read_with_attrs = v7m_sysreg_ns_read,
+    .write_with_attrs = v7m_sysreg_ns_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static MemTxResult v7m_systick_write(void *opaque, hwaddr addr,
+                                     uint64_t value, unsigned size,
+                                     MemTxAttrs attrs)
+{
+    ARMv7MState *s = opaque;
+    MemoryRegion *mr;
+
+    /* Direct the access to the correct systick */
+    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
+    return memory_region_dispatch_write(mr, addr, value,
+                                        size_memop(size) | MO_TE, attrs);
+}
+
+static MemTxResult v7m_systick_read(void *opaque, hwaddr addr,
+                                    uint64_t *data, unsigned size,
+                                    MemTxAttrs attrs)
+{
+    ARMv7MState *s = opaque;
+    MemoryRegion *mr;
+
+    /* Direct the access to the correct systick */
+    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
+    return memory_region_dispatch_read(mr, addr, data, size_memop(size) | MO_TE,
+                                       attrs);
+}
+
+static const MemoryRegionOps v7m_systick_ops = {
+    .read_with_attrs = v7m_systick_read,
+    .write_with_attrs = v7m_systick_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
 static void armv7m_instance_init(Object *obj)
 {
     ARMv7MState *s = ARMV7M(obj);
@@ -137,6 +216,13 @@ static void armv7m_instance_init(Object *obj)
     object_property_add_alias(obj, "num-irq",
                               OBJECT(&s->nvic), "num-irq");
 
+    object_initialize_child(obj, "systick-reg-ns", &s->systick[M_REG_NS],
+                            TYPE_SYSTICK);
+    /*
+     * We can't initialize the secure systick here, as we don't know
+     * yet if we need it.
+     */
+
     for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
         object_initialize_child(obj, "bitband[*]", &s->bitband[i],
                                 TYPE_BITBAND);
@@ -231,6 +317,45 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->container, 0xe0000000,
                                 sysbus_mmio_get_region(sbd, 0));
 
+    /* Create and map the systick devices */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), errp)) {
+        return;
+    }
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), 0,
+                       qdev_get_gpio_in_named(DEVICE(&s->nvic),
+                                              "systick-trigger", M_REG_NS));
+
+    if (arm_feature(&s->cpu->env, ARM_FEATURE_M_SECURITY)) {
+        /*
+         * We couldn't init the secure systick device in instance_init
+         * as we didn't know then if the CPU had the security extensions;
+         * so we have to do it here.
+         */
+        object_initialize_child(OBJECT(dev), "systick-reg-s",
+                                &s->systick[M_REG_S], TYPE_SYSTICK);
+
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_S]), errp)) {
+            return;
+        }
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->systick[M_REG_S]), 0,
+                           qdev_get_gpio_in_named(DEVICE(&s->nvic),
+                                                  "systick-trigger", M_REG_S));
+    }
+
+    memory_region_init_io(&s->systickmem, OBJECT(s),
+                          &v7m_systick_ops, s,
+                          "v7m_systick", 0xe0);
+
+    memory_region_add_subregion_overlap(&s->container, 0xe000e010,
+                                        &s->systickmem, 1);
+    if (arm_feature(&s->cpu->env, ARM_FEATURE_V8)) {
+        memory_region_init_io(&s->systick_ns_mem, OBJECT(s),
+                              &v7m_sysreg_ns_ops, &s->systickmem,
+                              "v7m_systick_ns", 0xe0);
+        memory_region_add_subregion_overlap(&s->container, 0xe002e010,
+                                            &s->systick_ns_mem, 1);
+    }
+
     /* If the CPU has RAS support, create the RAS register block */
     if (cpu_isar_feature(aa32_ras, s->cpu)) {
         object_initialize_child(OBJECT(dev), "armv7m-ras",
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index a5975592dfa..2b3e79a3da9 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2517,38 +2517,6 @@ static const MemoryRegionOps nvic_sysreg_ns_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static MemTxResult nvic_systick_write(void *opaque, hwaddr addr,
-                                      uint64_t value, unsigned size,
-                                      MemTxAttrs attrs)
-{
-    NVICState *s = opaque;
-    MemoryRegion *mr;
-
-    /* Direct the access to the correct systick */
-    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
-    return memory_region_dispatch_write(mr, addr, value,
-                                        size_memop(size) | MO_TE, attrs);
-}
-
-static MemTxResult nvic_systick_read(void *opaque, hwaddr addr,
-                                     uint64_t *data, unsigned size,
-                                     MemTxAttrs attrs)
-{
-    NVICState *s = opaque;
-    MemoryRegion *mr;
-
-    /* Direct the access to the correct systick */
-    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
-    return memory_region_dispatch_read(mr, addr, data, size_memop(size) | MO_TE,
-                                       attrs);
-}
-
-static const MemoryRegionOps nvic_systick_ops = {
-    .read_with_attrs = nvic_systick_read,
-    .write_with_attrs = nvic_systick_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
 /*
  * Unassigned portions of the PPB space are RAZ/WI for privileged
  * accesses, and fault for non-privileged accesses.
@@ -2801,29 +2769,6 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
 
     s->num_prio_bits = arm_feature(&s->cpu->env, ARM_FEATURE_V7) ? 8 : 2;
 
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), errp)) {
-        return;
-    }
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), 0,
-                       qdev_get_gpio_in_named(dev, "systick-trigger",
-                                              M_REG_NS));
-
-    if (arm_feature(&s->cpu->env, ARM_FEATURE_M_SECURITY)) {
-        /* We couldn't init the secure systick device in instance_init
-         * as we didn't know then if the CPU had the security extensions;
-         * so we have to do it here.
-         */
-        object_initialize_child(OBJECT(dev), "systick-reg-s",
-                                &s->systick[M_REG_S], TYPE_SYSTICK);
-
-        if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_S]), errp)) {
-            return;
-        }
-        sysbus_connect_irq(SYS_BUS_DEVICE(&s->systick[M_REG_S]), 0,
-                           qdev_get_gpio_in_named(dev, "systick-trigger",
-                                                  M_REG_S));
-    }
-
     /*
      * This device provides a single sysbus memory region which
      * represents the whole of the "System PPB" space. This is the
@@ -2877,23 +2822,11 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
                           "nvic_sysregs", 0x1000);
     memory_region_add_subregion(&s->container, 0xe000, &s->sysregmem);
 
-    memory_region_init_io(&s->systickmem, OBJECT(s),
-                          &nvic_systick_ops, s,
-                          "nvic_systick", 0xe0);
-
-    memory_region_add_subregion_overlap(&s->container, 0xe010,
-                                        &s->systickmem, 1);
-
     if (arm_feature(&s->cpu->env, ARM_FEATURE_V8)) {
         memory_region_init_io(&s->sysreg_ns_mem, OBJECT(s),
                               &nvic_sysreg_ns_ops, &s->sysregmem,
                               "nvic_sysregs_ns", 0x1000);
         memory_region_add_subregion(&s->container, 0x2e000, &s->sysreg_ns_mem);
-        memory_region_init_io(&s->systick_ns_mem, OBJECT(s),
-                              &nvic_sysreg_ns_ops, &s->systickmem,
-                              "nvic_systick_ns", 0xe0);
-        memory_region_add_subregion_overlap(&s->container, 0x2e010,
-                                            &s->systick_ns_mem, 1);
     }
 
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container);
@@ -2905,12 +2838,6 @@ static void armv7m_nvic_instance_init(Object *obj)
     NVICState *nvic = NVIC(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
-    object_initialize_child(obj, "systick-reg-ns", &nvic->systick[M_REG_NS],
-                            TYPE_SYSTICK);
-    /* We can't initialize the secure systick here, as we don't know
-     * yet if we need it.
-     */
-
     sysbus_init_irq(sbd, &nvic->excpout);
     qdev_init_gpio_out_named(dev, &nvic->sysresetreq, "SYSRESETREQ", 1);
     qdev_init_gpio_in_named(dev, nvic_systick_trigger, "systick-trigger",
-- 
2.20.1


