Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7360C2B4A73
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:14:31 +0100 (CET)
Received: from localhost ([::1]:39898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keh9C-00048R-9Y
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:14:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3Z-0008Iu-MS
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:41 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3V-0007nv-Vz
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:41 -0500
Received: by mail-wm1-x343.google.com with SMTP id h21so3329058wmb.2
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 08:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iaNS+i1jzPJUyMNsOBEYPhhEyyWtna42P4YBOvu2NNM=;
 b=ZRsuKUdexBwgpmJd99twtW1VHzC/ma26QJIocEkDH2dNqGPbtXvO+nFSrtaAgQk/5H
 8e4nGGDVMa5fpLQcGQ6TaPmS89r3w6szuekDX8BqPN898wtmBpZCiBxoCpX3upxTAFaZ
 zWnddhxXoahKwjgI/bq8cS6yOoo1ZAWIbjIrGH4KmIA1DQ6xZ8TMGz07rd9gkUUWobvL
 V5aXOZ2PtqvoySwgxl65+/w367yO0LOzGSfxZMm4y76LLAWQ/C2AKV/x+Qd0AynwPeYW
 EFWVAKKCaDwQcnzRd+4JHjcl8DCJooI5Wnr9eUi7qsZYjMq8BdUmv1pRglOh/aJ1DWrN
 w3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iaNS+i1jzPJUyMNsOBEYPhhEyyWtna42P4YBOvu2NNM=;
 b=MPcgwD6p4Y61lq3LU8VfQITLEjJXfD8+R1Lml33FALbwSDFwgcoka8+b422VPOS0/5
 bry25JZ4IPgwl4LAvjcwotwpU2blGdNxBuqW21BU7WRzcOfRJ5vvyvqxfHdKud3CUcoX
 FmffhOcAvFjIW4cahcb83eqHzWElDz6jhluQZwLUJE5SmOYp/epkLfUr0x3AEm3GJDtT
 BsgT33Fr+4jUh8EYcwrFtkvHeIZGdFAN7M6Cn3LyH4przTE1/PvUpkwsSoZDd4IbZP+G
 +DG/Pd3X1PTTbqrzYJRsF40eP9eoR4vuM0nTePQAZdUj/Vo06k8GaGAUQ5dJXBIoB/jd
 0+Ew==
X-Gm-Message-State: AOAM533WaDOBSp7mNp4PpJ7CzlWElDD9rM90rt2CPaOw1G9NV7zXebx8
 sMWBIiqnkK2KHqn8BrJA4mOHTY7dlCOLYA==
X-Google-Smtp-Source: ABdhPJxnBsisNKqqlnO1PAmifR5EOP5WRPtEMyuwkOgRr6z/eziPFhnwEz82gyUtlBZa+MsrNrdMTA==
X-Received: by 2002:a05:600c:2048:: with SMTP id
 p8mr16597701wmg.165.1605542914798; 
 Mon, 16 Nov 2020 08:08:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/15] hw/intc/armv7m_nvic: Make all of system PPB range be
 RAZWI/BusFault
Date: Mon, 16 Nov 2020 16:08:17 +0000
Message-Id: <20201116160831.31000-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For M-profile CPUs, the range from 0xe0000000 to 0xe00fffff is the
Private Peripheral Bus range, which includes all of the memory mapped
devices and registers that are part of the CPU itself, including the
NVIC, systick timer, and debug and trace components like the Data
Watchpoint and Trace unit (DWT).  Within this large region, the range
0xe000e000 to 0xe000efff is the System Control Space (NVIC, system
registers, systick) and 0xe002e000 to 0exe002efff is its Non-secure
alias.

The architecture is clear that within the SCS unimplemented registers
should be RES0 for privileged accesses and generate BusFault for
unprivileged accesses, and we currently implement this.

It is less clear about how to handle accesses to unimplemented
regions of the wider PPB.  Unprivileged accesses should definitely
cause BusFaults (R_DQQS), but the behaviour of privileged accesses is
not given as a general rule.  However, the register definitions of
individual registers for components like the DWT all state that they
are RES0 if the relevant component is not implemented, so the
simplest way to provide that is to provide RAZ/WI for the whole range
for privileged accesses.  (The v7M Arm ARM does say that reserved
registers should be UNK/SBZP.)

Expand the container MemoryRegion that the NVIC exposes so that
it covers the whole PPB space. This means:
 * moving the address that the ARMV7M device maps it to down by
   0xe000 bytes
 * moving the off and the offsets within the container of all the
   subregions forward by 0xe000 bytes
 * adding a new default MemoryRegion that covers the whole container
   at a lower priority than anything else and which provides the
   RAZWI/BusFault behaviour

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/armv7m_nvic.h |  1 +
 hw/arm/armv7m.c               |  2 +-
 hw/intc/armv7m_nvic.c         | 78 ++++++++++++++++++++++++++++++-----
 3 files changed, 69 insertions(+), 12 deletions(-)

diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index bb087b23c35..33b6d8810c7 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -84,6 +84,7 @@ struct NVICState {
     MemoryRegion systickmem;
     MemoryRegion systick_ns_mem;
     MemoryRegion container;
+    MemoryRegion defaultmem;
 
     uint32_t num_irq;
     qemu_irq excpout;
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 8113b29f1fd..944f261dd05 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -225,7 +225,7 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(sbd, 0,
                        qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
 
-    memory_region_add_subregion(&s->container, 0xe000e000,
+    memory_region_add_subregion(&s->container, 0xe0000000,
                                 sysbus_mmio_get_region(sbd, 0));
 
     for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 42b1ad59e65..9628ce876e0 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2479,6 +2479,43 @@ static const MemoryRegionOps nvic_systick_ops = {
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
 static int nvic_post_load(void *opaque, int version_id)
 {
     NVICState *s = opaque;
@@ -2675,7 +2712,6 @@ static void nvic_systick_trigger(void *opaque, int n, int level)
 static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
 {
     NVICState *s = NVIC(dev);
-    int regionlen;
 
     /* The armv7m container object will have set our CPU pointer */
     if (!s->cpu || !arm_feature(&s->cpu->env, ARM_FEATURE_M)) {
@@ -2718,7 +2754,20 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
                                                   M_REG_S));
     }
 
-    /* The NVIC and System Control Space (SCS) starts at 0xe000e000
+    /*
+     * This device provides a single sysbus memory region which
+     * represents the whole of the "System PPB" space. This is the
+     * range from 0xe0000000 to 0xe00fffff and includes the NVIC,
+     * the System Control Space (system registers), the systick timer,
+     * and for CPUs with the Security extension an NS banked version
+     * of all of these.
+     *
+     * The default behaviour for unimplemented registers/ranges
+     * (for instance the Data Watchpoint and Trace unit at 0xe0001000)
+     * is to RAZ/WI for privileged access and BusFault for non-privileged
+     * access.
+     *
+     * The NVIC and System Control Space (SCS) starts at 0xe000e000
      * and looks like this:
      *  0x004 - ICTR
      *  0x010 - 0xff - systick
@@ -2741,32 +2790,39 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
      * generally code determining which banked register to use should
      * use attrs.secure; code determining actual behaviour of the system
      * should use env->v7m.secure.
+     *
+     * The container covers the whole PPB space. Within it the priority
+     * of overlapping regions is:
+     *  - default region (for RAZ/WI and BusFault) : -1
+     *  - system register regions : 0
+     *  - systick : 1
+     * This is because the systick device is a small block of registers
+     * in the middle of the other system control registers.
      */
-    regionlen = arm_feature(&s->cpu->env, ARM_FEATURE_V8) ? 0x21000 : 0x1000;
-    memory_region_init(&s->container, OBJECT(s), "nvic", regionlen);
-    /* The system register region goes at the bottom of the priority
-     * stack as it covers the whole page.
-     */
+    memory_region_init(&s->container, OBJECT(s), "nvic", 0x100000);
+    memory_region_init_io(&s->defaultmem, OBJECT(s), &ppb_default_ops, s,
+                          "nvic-default", 0x100000);
+    memory_region_add_subregion_overlap(&s->container, 0, &s->defaultmem, -1);
     memory_region_init_io(&s->sysregmem, OBJECT(s), &nvic_sysreg_ops, s,
                           "nvic_sysregs", 0x1000);
-    memory_region_add_subregion(&s->container, 0, &s->sysregmem);
+    memory_region_add_subregion(&s->container, 0xe000, &s->sysregmem);
 
     memory_region_init_io(&s->systickmem, OBJECT(s),
                           &nvic_systick_ops, s,
                           "nvic_systick", 0xe0);
 
-    memory_region_add_subregion_overlap(&s->container, 0x10,
+    memory_region_add_subregion_overlap(&s->container, 0xe010,
                                         &s->systickmem, 1);
 
     if (arm_feature(&s->cpu->env, ARM_FEATURE_V8)) {
         memory_region_init_io(&s->sysreg_ns_mem, OBJECT(s),
                               &nvic_sysreg_ns_ops, &s->sysregmem,
                               "nvic_sysregs_ns", 0x1000);
-        memory_region_add_subregion(&s->container, 0x20000, &s->sysreg_ns_mem);
+        memory_region_add_subregion(&s->container, 0x2e000, &s->sysreg_ns_mem);
         memory_region_init_io(&s->systick_ns_mem, OBJECT(s),
                               &nvic_sysreg_ns_ops, &s->systickmem,
                               "nvic_systick_ns", 0xe0);
-        memory_region_add_subregion_overlap(&s->container, 0x20010,
+        memory_region_add_subregion_overlap(&s->container, 0x2e010,
                                             &s->systick_ns_mem, 1);
     }
 
-- 
2.20.1


