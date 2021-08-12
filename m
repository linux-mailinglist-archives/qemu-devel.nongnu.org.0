Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689F93EA226
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:36:38 +0200 (CEST)
Received: from localhost ([::1]:49466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE78d-0002VM-Bo
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76J-0005B8-JI
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:11 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76C-0007mT-75
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:10 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so6604299wms.2
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vkRWNgQd3iVKvNvr6CG4AHm0mAPsQ03jgBqfcHJfmVo=;
 b=cG/0QJXNAN4FoHZORotyCcqwKVWz2NhSH+veKb2Te8zDQYoFzDNwNaIWMR5MuhCRZs
 hK7XtvjIzbNEz2eFFXJFkfGUnZAvD7c1dMHUzbuxWnCjLMaMeyMju9tJJHBMiwdQlsDF
 12O8Hvro42L3rXw8Fpbf3RS3/W08nnQk2j52UOdncYEirWLx/IFh2ODwEUiVqONoP2ZW
 yVnoDbN/Ujwf/hOvLiS4mV9tw2/8mjB2SQFnNLRdhS3b/J7QM2ofFdzIlC453S9ySRcm
 mq0sUDNuZnB7J192HTsBFhiBGmsOcSvPRh8y6QzGGQKC3ZX7/tkP8vGVrWjUyuyNKlp5
 4IBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vkRWNgQd3iVKvNvr6CG4AHm0mAPsQ03jgBqfcHJfmVo=;
 b=hpaQ33XY2OmeyMTfqcbQK0YxE7tMyyySeWeTjJTo5BPDgO3PsR8DY45DzFvEcFKcXD
 P/NZtgjOfYDjrnx8BHjEWuVmHE/RtIkYBJMVVReL0tN7PorjYJvl3nL7sP7sA49tURKy
 9yvtDPVXMh1gyiuGybp9N12nVkDWa5BItpadpR9eNAwdy35gx7qOYDM31IgPnOusBIS2
 7tQxlhiicjP9JGKx40oZ5rtVhv09ODZuH6JCfgJFGN7g2gmhZZ6x9Y5Xee1rAGbQ3G0n
 NAYu7IyWYTsxUK6jRdGLOHB5X0i1bHl+0EQ7LAdnoKUHKFDo5eKjFci95/18z/+IS1fT
 Yhng==
X-Gm-Message-State: AOAM5322+sgh0LSopZBhW0SXB8CPkegd1qRAStN7pukAQXHKSa/gLTLH
 YjHzVI/4/jGef/TRFqoYl6FjsQ==
X-Google-Smtp-Source: ABdhPJwACfzen5ziJRaYSvB9GNRABMCbQqTA3O1C4QID3SBNVXDbjC+RM0N9eSjvXHBPdWfGsQEWBg==
X-Received: by 2002:a05:600c:19cd:: with SMTP id
 u13mr10376882wmq.143.1628760842236; 
 Thu, 12 Aug 2021 02:34:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 03/25] arm: Move system PPB container handling to
 armv7m
Date: Thu, 12 Aug 2021 10:33:34 +0100
Message-Id: <20210812093356.1946-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of having the NVIC device provide a single sysbus memory
region covering the whole of the "System PPB" space, which implements
the default behaviour for unimplemented ranges and provides the NS
alias window to the sysregs as well as the main sysreg MR, move this
handling to the container armv7m device.  The NVIC now provides a
single memory region which just implements the system registers.
This consolidates all the handling of "map various devices in the
PPB" into the armv7m container where it belongs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armv7m.h       |   4 +
 include/hw/intc/armv7m_nvic.h |   3 -
 hw/arm/armv7m.c               | 100 ++++++++++++++++++++++-
 hw/intc/armv7m_nvic.c         | 145 +---------------------------------
 4 files changed, 107 insertions(+), 145 deletions(-)

diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index 360c35c5fb2..fe8b248a6c6 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -77,6 +77,10 @@ struct ARMv7MState {
      * NS systick device if appropriate.
      */
     MemoryRegion systick_ns_mem;
+    /* Ditto, for the sysregs region provided by the NVIC */
+    MemoryRegion sysreg_ns_mem;
+    /* MR providing default PPB behaviour */
+    MemoryRegion defaultmem;
 
     /* Properties */
     char *cpu_type;
diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index 6a6a99090c7..0180c7b0ca1 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -80,9 +80,6 @@ struct NVICState {
     int vectpending_prio; /* group prio of the exeception in vectpending */
 
     MemoryRegion sysregmem;
-    MemoryRegion sysreg_ns_mem;
-    MemoryRegion container;
-    MemoryRegion defaultmem;
 
     uint32_t num_irq;
     qemu_irq excpout;
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 364ac069702..7e7fb7a3ad3 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -18,6 +18,7 @@
 #include "sysemu/reset.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "qemu/log.h"
 #include "target/arm/idau.h"
 
 /* Bitbanded IO.  Each word corresponds to a single bit.  */
@@ -203,6 +204,43 @@ static const MemoryRegionOps v7m_systick_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+/*
+ * Unassigned portions of the PPB space are RAZ/WI for privileged
+ * accesses, and fault for non-privileged accesses.
+ */
+static MemTxResult ppb_default_read(void *opaque, hwaddr addr,
+                                    uint64_t *data, unsigned size,
+                                    MemTxAttrs attrs)
+{
+    qemu_log_mask(LOG_UNIMP, "Read of unassigned area of PPB: offset 0x%x\n",
+                  (uint32_t)addr);
+    if (attrs.user) {
+        return MEMTX_ERROR;
+    }
+    *data = 0;
+    return MEMTX_OK;
+}
+
+static MemTxResult ppb_default_write(void *opaque, hwaddr addr,
+                                     uint64_t value, unsigned size,
+                                     MemTxAttrs attrs)
+{
+    qemu_log_mask(LOG_UNIMP, "Write of unassigned area of PPB: offset 0x%x\n",
+                  (uint32_t)addr);
+    if (attrs.user) {
+        return MEMTX_ERROR;
+    }
+    return MEMTX_OK;
+}
+
+static const MemoryRegionOps ppb_default_ops = {
+    .read_with_attrs = ppb_default_read,
+    .write_with_attrs = ppb_default_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 8,
+};
+
 static void armv7m_instance_init(Object *obj)
 {
     ARMv7MState *s = ARMV7M(obj);
@@ -309,13 +347,73 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
     qdev_pass_gpios(DEVICE(&s->nvic), dev, "SYSRESETREQ");
     qdev_pass_gpios(DEVICE(&s->nvic), dev, "NMI");
 
+    /*
+     * We map various devices into the continer MR at their architected
+     * addresses. In particular, we map everything corresponding to the
+     * "System PPB" space. This is the range from 0xe0000000 to 0xe00fffff
+     * and includes the NVIC, the System Control Space (system registers),
+     * the systick timer, and for CPUs with the Security extension an NS
+     * banked version of all of these.
+     *
+     * The default behaviour for unimplemented registers/ranges
+     * (for instance the Data Watchpoint and Trace unit at 0xe0001000)
+     * is to RAZ/WI for privileged access and BusFault for non-privileged
+     * access.
+     *
+     * The NVIC and System Control Space (SCS) starts at 0xe000e000
+     * and looks like this:
+     *  0x004 - ICTR
+     *  0x010 - 0xff - systick
+     *  0x100..0x7ec - NVIC
+     *  0x7f0..0xcff - Reserved
+     *  0xd00..0xd3c - SCS registers
+     *  0xd40..0xeff - Reserved or Not implemented
+     *  0xf00 - STIR
+     *
+     * Some registers within this space are banked between security states.
+     * In v8M there is a second range 0xe002e000..0xe002efff which is the
+     * NonSecure alias SCS; secure accesses to this behave like NS accesses
+     * to the main SCS range, and non-secure accesses (including when
+     * the security extension is not implemented) are RAZ/WI.
+     * Note that both the main SCS range and the alias range are defined
+     * to be exempt from memory attribution (R_BLJT) and so the memory
+     * transaction attribute always matches the current CPU security
+     * state (attrs.secure == env->v7m.secure). In the v7m_sysreg_ns_ops
+     * wrappers we change attrs.secure to indicate the NS access; so
+     * generally code determining which banked register to use should
+     * use attrs.secure; code determining actual behaviour of the system
+     * should use env->v7m.secure.
+     *
+     * Within the PPB space, some MRs overlap, and the priority
+     * of overlapping regions is:
+     *  - default region (for RAZ/WI and BusFault) : -1
+     *  - system register regions (provided by the NVIC) : 0
+     *  - systick : 1
+     * This is because the systick device is a small block of registers
+     * in the middle of the other system control registers.
+     */
+
+    memory_region_init_io(&s->defaultmem, OBJECT(s), &ppb_default_ops, s,
+                          "nvic-default", 0x100000);
+    memory_region_add_subregion_overlap(&s->container, 0xe0000000,
+                                        &s->defaultmem, -1);
+
     /* Wire the NVIC up to the CPU */
     sbd = SYS_BUS_DEVICE(&s->nvic);
     sysbus_connect_irq(sbd, 0,
                        qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
 
-    memory_region_add_subregion(&s->container, 0xe0000000,
+    memory_region_add_subregion(&s->container, 0xe000e000,
                                 sysbus_mmio_get_region(sbd, 0));
+    if (arm_feature(&s->cpu->env, ARM_FEATURE_V8)) {
+        /* Create the NS alias region for the NVIC sysregs */
+        memory_region_init_io(&s->sysreg_ns_mem, OBJECT(s),
+                              &v7m_sysreg_ns_ops,
+                              sysbus_mmio_get_region(sbd, 0),
+                              "nvic_sysregs_ns", 0x1000);
+        memory_region_add_subregion(&s->container, 0xe002e000,
+                                    &s->sysreg_ns_mem);
+    }
 
     /* Create and map the systick devices */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), errp)) {
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 2b3e79a3da9..13df002ce4d 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2470,90 +2470,6 @@ static const MemoryRegionOps nvic_sysreg_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static MemTxResult nvic_sysreg_ns_write(void *opaque, hwaddr addr,
-                                        uint64_t value, unsigned size,
-                                        MemTxAttrs attrs)
-{
-    MemoryRegion *mr = opaque;
-
-    if (attrs.secure) {
-        /* S accesses to the alias act like NS accesses to the real region */
-        attrs.secure = 0;
-        return memory_region_dispatch_write(mr, addr, value,
-                                            size_memop(size) | MO_TE, attrs);
-    } else {
-        /* NS attrs are RAZ/WI for privileged, and BusFault for user */
-        if (attrs.user) {
-            return MEMTX_ERROR;
-        }
-        return MEMTX_OK;
-    }
-}
-
-static MemTxResult nvic_sysreg_ns_read(void *opaque, hwaddr addr,
-                                       uint64_t *data, unsigned size,
-                                       MemTxAttrs attrs)
-{
-    MemoryRegion *mr = opaque;
-
-    if (attrs.secure) {
-        /* S accesses to the alias act like NS accesses to the real region */
-        attrs.secure = 0;
-        return memory_region_dispatch_read(mr, addr, data,
-                                           size_memop(size) | MO_TE, attrs);
-    } else {
-        /* NS attrs are RAZ/WI for privileged, and BusFault for user */
-        if (attrs.user) {
-            return MEMTX_ERROR;
-        }
-        *data = 0;
-        return MEMTX_OK;
-    }
-}
-
-static const MemoryRegionOps nvic_sysreg_ns_ops = {
-    .read_with_attrs = nvic_sysreg_ns_read,
-    .write_with_attrs = nvic_sysreg_ns_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
-/*
- * Unassigned portions of the PPB space are RAZ/WI for privileged
- * accesses, and fault for non-privileged accesses.
- */
-static MemTxResult ppb_default_read(void *opaque, hwaddr addr,
-                                    uint64_t *data, unsigned size,
-                                    MemTxAttrs attrs)
-{
-    qemu_log_mask(LOG_UNIMP, "Read of unassigned area of PPB: offset 0x%x\n",
-                  (uint32_t)addr);
-    if (attrs.user) {
-        return MEMTX_ERROR;
-    }
-    *data = 0;
-    return MEMTX_OK;
-}
-
-static MemTxResult ppb_default_write(void *opaque, hwaddr addr,
-                                     uint64_t value, unsigned size,
-                                     MemTxAttrs attrs)
-{
-    qemu_log_mask(LOG_UNIMP, "Write of unassigned area of PPB: offset 0x%x\n",
-                  (uint32_t)addr);
-    if (attrs.user) {
-        return MEMTX_ERROR;
-    }
-    return MEMTX_OK;
-}
-
-static const MemoryRegionOps ppb_default_ops = {
-    .read_with_attrs = ppb_default_read,
-    .write_with_attrs = ppb_default_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid.min_access_size = 1,
-    .valid.max_access_size = 8,
-};
-
 static int nvic_post_load(void *opaque, int version_id)
 {
     NVICState *s = opaque;
@@ -2770,66 +2686,13 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
     s->num_prio_bits = arm_feature(&s->cpu->env, ARM_FEATURE_V7) ? 8 : 2;
 
     /*
-     * This device provides a single sysbus memory region which
-     * represents the whole of the "System PPB" space. This is the
-     * range from 0xe0000000 to 0xe00fffff and includes the NVIC,
-     * the System Control Space (system registers), the systick timer,
-     * and for CPUs with the Security extension an NS banked version
-     * of all of these.
-     *
-     * The default behaviour for unimplemented registers/ranges
-     * (for instance the Data Watchpoint and Trace unit at 0xe0001000)
-     * is to RAZ/WI for privileged access and BusFault for non-privileged
-     * access.
-     *
-     * The NVIC and System Control Space (SCS) starts at 0xe000e000
-     * and looks like this:
-     *  0x004 - ICTR
-     *  0x010 - 0xff - systick
-     *  0x100..0x7ec - NVIC
-     *  0x7f0..0xcff - Reserved
-     *  0xd00..0xd3c - SCS registers
-     *  0xd40..0xeff - Reserved or Not implemented
-     *  0xf00 - STIR
-     *
-     * Some registers within this space are banked between security states.
-     * In v8M there is a second range 0xe002e000..0xe002efff which is the
-     * NonSecure alias SCS; secure accesses to this behave like NS accesses
-     * to the main SCS range, and non-secure accesses (including when
-     * the security extension is not implemented) are RAZ/WI.
-     * Note that both the main SCS range and the alias range are defined
-     * to be exempt from memory attribution (R_BLJT) and so the memory
-     * transaction attribute always matches the current CPU security
-     * state (attrs.secure == env->v7m.secure). In the nvic_sysreg_ns_ops
-     * wrappers we change attrs.secure to indicate the NS access; so
-     * generally code determining which banked register to use should
-     * use attrs.secure; code determining actual behaviour of the system
-     * should use env->v7m.secure.
-     *
-     * The container covers the whole PPB space. Within it the priority
-     * of overlapping regions is:
-     *  - default region (for RAZ/WI and BusFault) : -1
-     *  - system register regions : 0
-     *  - systick : 1
-     * This is because the systick device is a small block of registers
-     * in the middle of the other system control registers.
+     * This device provides a single memory region which covers the
+     * sysreg/NVIC registers from 0xE000E000 .. 0xE000EFFF, with the
+     * exception of the systick timer registers 0xE000E010 .. 0xE000E0FF.
      */
-    memory_region_init(&s->container, OBJECT(s), "nvic", 0x100000);
-    memory_region_init_io(&s->defaultmem, OBJECT(s), &ppb_default_ops, s,
-                          "nvic-default", 0x100000);
-    memory_region_add_subregion_overlap(&s->container, 0, &s->defaultmem, -1);
     memory_region_init_io(&s->sysregmem, OBJECT(s), &nvic_sysreg_ops, s,
                           "nvic_sysregs", 0x1000);
-    memory_region_add_subregion(&s->container, 0xe000, &s->sysregmem);
-
-    if (arm_feature(&s->cpu->env, ARM_FEATURE_V8)) {
-        memory_region_init_io(&s->sysreg_ns_mem, OBJECT(s),
-                              &nvic_sysreg_ns_ops, &s->sysregmem,
-                              "nvic_sysregs_ns", 0x1000);
-        memory_region_add_subregion(&s->container, 0x2e000, &s->sysreg_ns_mem);
-    }
-
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->sysregmem);
 }
 
 static void armv7m_nvic_instance_init(Object *obj)
-- 
2.20.1


