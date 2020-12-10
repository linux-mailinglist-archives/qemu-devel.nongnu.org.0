Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4E62D5A3D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:18:36 +0100 (CET)
Received: from localhost ([::1]:52360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKu3-00082D-Il
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:18:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR4-0001Yd-LN
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:38 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQg-000736-CT
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:38 -0500
Received: by mail-wm1-x331.google.com with SMTP id y23so5005776wmi.1
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=t3m1K3VFzcJivp35jn7u4hjssugJbQusEvdAPiBN5BU=;
 b=RhqxyzYri52+2FTPMz4Ul9e6BUc4BATyJv5HgmTZh2j0OdDgiBhkz/J31N+9mw3GWH
 i+m+1+8CwoGLkTu7//ndb/VDrtSQuGrXE7UE7dDXml0tXj/08VWgGWZ/H/8INX5Udftz
 6maLedWrfPNetMdS2mq686hYzG2yXhebGFRIcq1wctBlvuCeg1f2eDcEL5VKU1fDdrPc
 Z1mNVbytL+ayDvz9yUO9cMcMOqKbqIfHY1b8EbrczUJV949KSKDrBdon88WWp0EoZgE9
 pEwy4BTPINpoRqm7/qJvrmhNqf1HfPziKv/BEF2JEZQGBhd0Ku+tf/dRMJ1NA4tPc4P6
 yQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t3m1K3VFzcJivp35jn7u4hjssugJbQusEvdAPiBN5BU=;
 b=qwn3cmQ6k7nFjT0rOOqOMZ/JPw0bFpZx20qn1RzFJUNb777MvXShbK0NuSVwsmvr6x
 71yAAvGSG53TOAHUnTM1bg+Y7VU2z0NlssUUjkUOooEpSlepwkupztBLWOBMpPryZjEv
 9xCRP2vjTir/wfQPrs4qDCkIsQOgKu/DxbA4g2edRkWw9lbSAFhqIX6YYFbcl+2/x+TD
 21JhYtBUKuwewlybvmrqXEunnXLKeVeszVuecVY7WS7UgZT28X8Fm7EL8bnBsO468mwn
 dTvehg3aRl70WfIuWgdZfVLCKLzxMZxjJkdreIoKiEjDYYhQlt2t41OcpJRTqYtYOlhN
 cYRA==
X-Gm-Message-State: AOAM531YrwKNEHouNTGl3x3wvJZluLSe3GAd6YYh0ey3rix71D90IP0m
 PJTCYcoxdJYKWgq4ZnDOwhQJs0EPXHaa/Q==
X-Google-Smtp-Source: ABdhPJxZY8Z952n2+I2lpLBGSTwJW3YTewYgWSTbGTrr54zOHHWP0zom3F524nu9x+I6EWOa0JwUYg==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr7743721wmb.83.1607600892814; 
 Thu, 10 Dec 2020 03:48:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/36] hw/intc/armv7m_nvic: Make all of system PPB range be
 RAZWI/BusFault
Date: Thu, 10 Dec 2020 11:47:32 +0000
Message-Id: <20201210114756.16501-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-2-peter.maydell@linaro.org
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


