Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F3E65C5FB
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:21:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCls5-000176-RI; Tue, 03 Jan 2023 13:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pCls0-0000zF-Ng
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:43 -0500
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrx-0005OO-S2
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:40 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id v81so15688171vkv.5
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cEjKn8qgsXWu9xhy89oOazfgxATFsGsm3Jhd9ukMHZ8=;
 b=qlKact7TahAyRlVZ+5ZWb2kohoG5Lm14aBHGRh2/pv8MgAQE17iKr2O53keEOsVubZ
 u+JRT7sKKp7zUuAJ7tn1UVH/m95L29sEc7XvBMCEJ4a7TRfMVPGkWYxlQKgQiKHJ+v5r
 4BwQKBwyLxgohi5db3aN5klTJhIYwwIhVotSyCPuXQqi0DQ763BZeyTQEKf2RWis3Yrq
 G7qphE5OJnhx+iw8r7Cr/0ou4UA3iSPSjCSGHupmcN8upYbpA8MzSGpH5n4MXa0I+7EL
 op7YWji1arWVNxyPF+Gx84WvQPT60dWzdAYuzldnoDriKsHQ5GFeTGr0X7P1XmIKe1tT
 S9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cEjKn8qgsXWu9xhy89oOazfgxATFsGsm3Jhd9ukMHZ8=;
 b=vOyhZLI7aIIR9NzBdYA1F6yH9MTV9FI5OVY6P+AM/5nrHWevSQjz6RV7Aufg6ntxOn
 QlegBksY7ovcd4Bz8l8bS+b9bQrWKyAmHUipi8Qz7/EZZAZeKe70ewKTcMwK28bh656D
 oB26x4rQyfnkR6Zp9ZsQNhp75KHrEhTr28CSHtRYolc69xnoKWGC5WVN23A0Ag2QUxlL
 PypilgW2QkpsyRjiOVgBeBoqnj5Wu0mtcvvgSrBgO455NeAyCwn10F/jFWystBeQOgFT
 9XkaIECdyahIeV7QhIdaX+UQXQfqreo3drFek6TjTbgcvNWXL42gqN+vQ1KLRp0QF5Jw
 LsaA==
X-Gm-Message-State: AFqh2kpq57Tc8yxwQEqt6X7xEJgN+NzHgZqPKjsAzpzQU1T9m+ORJ8gK
 cr1L6rpczk4EnuZoojxLvC/JssQ8IgREIPvpzHk=
X-Google-Smtp-Source: AMrXdXv1QtnExEGlpFOQ79SgTiNbZmXzN+yOIVnQhBNpoF0NhJlgdbbiOWZJwMPG4TeUpJfKH3Q27Q==
X-Received: by 2002:a1f:1802:0:b0:3d0:bcff:a591 with SMTP id
 2-20020a1f1802000000b003d0bcffa591mr18379677vky.0.1672769916860; 
 Tue, 03 Jan 2023 10:18:36 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:18:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 36/40] target/arm: Move "has_el3" to class property
Date: Tue,  3 Jan 2023 10:16:42 -0800
Message-Id: <20230103181646.55711-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

With the movement of the property, we can remove the field
from the cpu entirely, using only the class.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-qom.h  |  2 ++
 target/arm/cpu.h      |  2 --
 hw/arm/allwinner-h3.c |  5 ++-
 hw/arm/exynos4210.c   | 18 +++++-----
 hw/arm/integratorcp.c | 12 ++++---
 hw/arm/npcm7xx.c      |  5 +--
 hw/arm/realview.c     | 20 +++++------
 hw/arm/versatilepb.c  | 12 ++++---
 hw/arm/vexpress.c     |  9 +++--
 hw/arm/virt.c         |  5 +--
 hw/arm/xilinx_zynq.c  | 14 ++++----
 hw/arm/xlnx-zynqmp.c  |  3 +-
 hw/cpu/a15mpcore.c    |  5 ++-
 hw/cpu/a9mpcore.c     |  6 ++--
 target/arm/cpu.c      | 78 +++++++++++++++++++++++++------------------
 15 files changed, 102 insertions(+), 94 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index fceb557a4d..f4e01e0ddb 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -184,6 +184,8 @@ struct ARMCPUClass {
      */
     uint32_t kvm_target;
 
+    /* CPU has security extension */
+    OnOffAuto has_el3;
     /* CPU has virtualization extension */
     OnOffAuto has_el2;
 };
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 3888cdafdf..5921660d86 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -886,8 +886,6 @@ struct ArchCPU {
     /* Current power state, access guarded by BQL */
     ARMPSCIState power_state;
 
-    /* CPU has security extension */
-    bool has_el3;
     /* CPU has PMU (Performance Monitor Unit) */
     bool has_pmu;
     /* CPU has VFP */
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 07484b9f97..8ec97961de 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -193,7 +193,9 @@ static void allwinner_h3_init(Object *obj)
 
     s->memmap = allwinner_h3_memmap;
 
+    /* All exception levels required. */
     /* ??? This is the default for A7. */
+    class_property_set_bool(cpu_class, "has_el3", true, &error_abort);
     class_property_set_bool(cpu_class, "has_el2", true, &error_abort);
 
     for (int i = 0; i < AW_H3_NUM_CPUS; i++) {
@@ -246,9 +248,6 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
         qdev_prop_set_bit(DEVICE(&s->cpus[i]), "start-powered-off",
                           i > 0);
 
-        /* All exception levels required */
-        qdev_prop_set_bit(DEVICE(&s->cpus[i]), "has_el3", true);
-
         /* Mark realized */
         qdev_realize(DEVICE(&s->cpus[i]), NULL, &error_fatal);
     }
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 8dafa2215b..bf056ecad7 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -548,18 +548,20 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     Exynos4210State *s = EXYNOS4210_SOC(socdev);
     MemoryRegion *system_mem = get_system_memory();
     SysBusDevice *busdev;
+    ObjectClass *cpu_class;
     DeviceState *dev, *uart[4], *pl330[3];
     int i, n;
 
-    for (n = 0; n < EXYNOS4210_NCPUS; n++) {
-        Object *cpuobj = object_new(ARM_CPU_TYPE_NAME("cortex-a9"));
+    cpu_class = object_class_by_name(ARM_CPU_TYPE_NAME("cortex-a9"));
 
-        /* By default A9 CPUs have EL3 enabled.  This board does not currently
-         * support EL3 so the CPU EL3 property is disabled before realization.
-         */
-        if (object_property_find(cpuobj, "has_el3")) {
-            object_property_set_bool(cpuobj, "has_el3", false, &error_fatal);
-        }
+    /*
+     * By default A9 CPUs have EL3 enabled.  This board does not currently
+     * support EL3 so the CPU EL3 property is disabled.
+     */
+    class_property_set_bool(cpu_class, "has_el3", false, &error_abort);
+
+    for (n = 0; n < EXYNOS4210_NCPUS; n++) {
+        Object *cpuobj = object_new_with_class(cpu_class);
 
         s->cpu[n] = ARM_CPU(cpuobj);
         object_property_set_int(cpuobj, "mp-affinity",
diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index b109ece3ae..9244026f3f 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -595,17 +595,19 @@ static void integratorcp_init(MachineState *machine)
     qemu_irq pic[32];
     DeviceState *dev, *sic, *icp;
     DriveInfo *dinfo;
+    ObjectClass *cpu_class;
     int i;
 
-    cpuobj = object_new(machine->cpu_type);
+    cpu_class = object_class_by_name(machine->cpu_type);
 
-    /* By default ARM1176 CPUs have EL3 enabled.  This board does not
+    /*
+     * By default ARM1176 CPUs have EL3 enabled.  This board does not
      * currently support EL3 so the CPU EL3 property is disabled before
      * realization.
      */
-    if (object_property_find(cpuobj, "has_el3")) {
-        object_property_set_bool(cpuobj, "has_el3", false, &error_fatal);
-    }
+    class_property_set_bool(cpu_class, "has_el3", false, NULL);
+
+    cpuobj = object_new_with_class(cpu_class);
 
     qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
 
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 97ac4ac7e9..8dec8e0d12 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -395,6 +395,7 @@ static void npcm7xx_init(Object *obj)
     int i;
 
     class_property_set_bool(cpu_class, "reset-hivecs", true, &error_abort);
+    class_property_set_bool(cpu_class, "has_el3", false, &error_abort);
 
     for (i = 0; i < NPCM7XX_MAX_NUM_CPUS; i++) {
         object_initialize_child(obj, "cpu[*]", &s->cpu[i], cpu_type);
@@ -470,10 +471,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
         object_property_set_int(OBJECT(&s->cpu[i]), "reset-cbar",
                                 NPCM7XX_GIC_CPU_IF_ADDR, &error_abort);
 
-        /* Disable security extensions. */
-        object_property_set_bool(OBJECT(&s->cpu[i]), "has_el3", false,
-                                 &error_abort);
-
         if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
             return;
         }
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index d2dc8a8952..0e1a4ff396 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -81,6 +81,7 @@ static void realview_init(MachineState *machine,
     MemoryRegion *ram_hack = g_new(MemoryRegion, 1);
     DeviceState *dev, *sysctl, *gpio2, *pl041;
     SysBusDevice *busdev;
+    ObjectClass *cpu_class;
     qemu_irq pic[64];
     PCIBus *pci_bus = NULL;
     NICInfo *nd;
@@ -115,22 +116,21 @@ static void realview_init(MachineState *machine,
         break;
     }
 
-    for (n = 0; n < smp_cpus; n++) {
-        Object *cpuobj = object_new(machine->cpu_type);
+    cpu_class = object_class_by_name(machine->cpu_type);
+    /*
+     * By default A9, A15 and ARM1176 CPUs have EL3 enabled.  This board
+     * does not currently support EL3 so the CPU EL3 property is disabled
+     * before realization.
+     */
+    class_property_set_bool(cpu_class, "has_el3", false, NULL);
 
-        /* By default A9,A15 and ARM1176 CPUs have EL3 enabled.  This board
-         * does not currently support EL3 so the CPU EL3 property is disabled
-         * before realization.
-         */
-        if (object_property_find(cpuobj, "has_el3")) {
-            object_property_set_bool(cpuobj, "has_el3", false, &error_fatal);
-        }
+    for (n = 0; n < smp_cpus; n++) {
+        Object *cpuobj = object_new_with_class(cpu_class);
 
         if (is_pb && is_mpcore) {
             object_property_set_int(cpuobj, "reset-cbar", periphbase,
                                     &error_fatal);
         }
-
         qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
 
         cpu_irq[n] = qdev_get_gpio_in(DEVICE(cpuobj), ARM_CPU_IRQ);
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index ecc1f6cf74..5b8c332f64 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -182,6 +182,7 @@ static struct arm_boot_info versatile_binfo;
 
 static void versatile_init(MachineState *machine, int board_id)
 {
+    ObjectClass *cpu_class;
     Object *cpuobj;
     ARMCPU *cpu;
     MemoryRegion *sysmem = get_system_memory();
@@ -206,15 +207,16 @@ static void versatile_init(MachineState *machine, int board_id)
         exit(1);
     }
 
-    cpuobj = object_new(machine->cpu_type);
+    cpu_class = object_class_by_name(machine->cpu_type);
 
-    /* By default ARM1176 CPUs have EL3 enabled.  This board does not
+    /*
+     * By default ARM1176 CPUs have EL3 enabled.  This board does not
      * currently support EL3 so the CPU EL3 property is disabled before
      * realization.
      */
-    if (object_property_find(cpuobj, "has_el3")) {
-        object_property_set_bool(cpuobj, "has_el3", false, &error_fatal);
-    }
+    class_property_set_bool(cpu_class, "has_el3", false, NULL);
+
+    cpuobj = object_new_with_class(cpu_class);
 
     qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
 
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 211daa8fde..d23b678d04 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -210,17 +210,16 @@ static void init_cpus(MachineState *ms, const char *cpu_type,
     unsigned int smp_cpus = ms->smp.cpus;
     ObjectClass *cpu_class = object_class_by_name(cpu_type);
 
+    if (!secure) {
+        class_property_set_bool(cpu_class, "has_el3", false, NULL);
+    }
     if (!virt) {
         class_property_set_bool(cpu_class, "has_el2", false, NULL);
     }
 
     /* Create the actual CPUs */
     for (n = 0; n < smp_cpus; n++) {
-        Object *cpuobj = object_new(cpu_type);
-
-        if (!secure) {
-            object_property_set_bool(cpuobj, "has_el3", false, NULL);
-        }
+        Object *cpuobj = object_new_with_class(cpu_class);
 
         if (object_property_find(cpuobj, "reset-cbar")) {
             object_property_set_int(cpuobj, "reset-cbar", periphbase,
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index dd02e42f97..c1cabe2413 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2039,6 +2039,7 @@ static void machvirt_init(MachineState *machine)
     }
 
     cpu_class = object_class_by_name(machine->cpu_type);
+    class_property_set_bool(cpu_class, "has_el3", vms->secure, &error_abort);
     if (!vms->virt) {
         class_property_set_bool(cpu_class, "has_el2", false, &error_abort);
     }
@@ -2174,10 +2175,6 @@ static void machvirt_init(MachineState *machine)
 
         aarch64 &= object_property_get_bool(cpuobj, "aarch64", NULL);
 
-        if (!vms->secure) {
-            object_property_set_bool(cpuobj, "has_el3", false, NULL);
-        }
-
         if (vmc->kvm_no_adjvtime &&
             object_property_find(cpuobj, "kvm-no-adjvtime")) {
             object_property_set_bool(cpuobj, "kvm-no-adjvtime", true, NULL);
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 3e5b4f4483..8b8fe6736a 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -194,17 +194,15 @@ static void zynq_init(MachineState *machine)
 
     cpu_class = object_class_by_name(machine->cpu_type);
 
-    class_property_set_uint(cpu_class, "midr", ZYNQ_BOARD_MIDR, &error_fatal);
-
-    cpu = ARM_CPU(object_new_with_class(cpu_class));
-
-    /* By default A9 CPUs have EL3 enabled.  This board does not
+    /*
+     * By default A9 CPUs have EL3 enabled.  This board does not
      * currently support EL3 so the CPU EL3 property is disabled before
      * realization.
      */
-    if (object_property_find(OBJECT(cpu), "has_el3")) {
-        object_property_set_bool(OBJECT(cpu), "has_el3", false, &error_fatal);
-    }
+    class_property_set_bool(cpu_class, "has_el3", false, &error_abort);
+    class_property_set_uint(cpu_class, "midr", ZYNQ_BOARD_MIDR, &error_abort);
+
+    cpu = ARM_CPU(object_new_with_class(cpu_class));
 
     object_property_set_int(OBJECT(cpu), "reset-cbar", MPCORE_PERIPHBASE,
                             &error_fatal);
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 17bad9b4ed..86f08a91d9 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -385,6 +385,7 @@ static void xlnx_zynqmp_init(Object *obj)
     cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
     cpu_class = object_class_by_name(cpu_type);
     class_property_set_bool(cpu_class, "reset-hivecs", true, &error_abort);
+    class_property_set_bool(cpu_class, "has_el3", s->secure, &error_abort);
     class_property_set_bool(cpu_class, "has_el2", s->virt, &error_abort);
 
     for (i = 0; i < num_apus; i++) {
@@ -528,8 +529,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
             s->boot_cpu_ptr = &s->apu_cpu[i];
         }
 
-        object_property_set_bool(OBJECT(&s->apu_cpu[i]), "has_el3", s->secure,
-                                 NULL);
         object_property_set_int(OBJECT(&s->apu_cpu[i]), "reset-cbar",
                                 GIC_BASE_ADDR, &error_abort);
         object_property_set_int(OBJECT(&s->apu_cpu[i]), "core-count",
diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index 6329d25f68..e8c0bac02a 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -53,7 +53,6 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
     DeviceState *gicdev;
     SysBusDevice *busdev;
     int i;
-    bool has_el3;
     bool has_el2 = false;
 
     gicdev = DEVICE(&s->gic);
@@ -66,9 +65,9 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
          */
         Object *cpuobj = OBJECT(qemu_get_cpu(0));
         ObjectClass *cpucls = object_get_class(cpuobj);
+        bool has_el3;
 
-        has_el3 = object_property_find(cpuobj, "has_el3") &&
-            object_property_get_bool(cpuobj, "has_el3", &error_abort);
+        has_el3 = class_property_get_bool(cpucls, "has_el3", NULL);
         qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
 
         /* Similarly for virtualization support */
diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index d03f57e579..984e373400 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -55,9 +55,12 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
     bool has_el3;
     CPUState *cpu0;
     Object *cpuobj;
+    ObjectClass *cpucls;
 
     cpu0 = qemu_get_cpu(0);
     cpuobj = OBJECT(cpu0);
+    cpucls = object_get_class(cpuobj);
+
     if (strcmp(object_get_typename(cpuobj), ARM_CPU_TYPE_NAME("cortex-a9"))) {
         /* We might allow Cortex-A5 once we model it */
         error_setg(errp,
@@ -81,8 +84,7 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
     /* Make the GIC's TZ support match the CPUs. We assume that
      * either all the CPUs have TZ, or none do.
      */
-    has_el3 = object_property_find(cpuobj, "has_el3") &&
-        object_property_get_bool(cpuobj, "has_el3", &error_abort);
+    has_el3 = class_property_get_bool(cpucls, "has_el3", &error_abort);
     qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gic), errp)) {
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index db996d8c3a..3262e86e61 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1280,11 +1280,6 @@ static void arm_cpu_initfn(Object *obj)
 static Property arm_cpu_reset_cbar_property =
             DEFINE_PROP_UINT64("reset-cbar", ARMCPU, reset_cbar, 0);
 
-#ifndef CONFIG_USER_ONLY
-static Property arm_cpu_has_el3_property =
-            DEFINE_PROP_BOOL("has_el3", ARMCPU, has_el3, true);
-#endif
-
 static Property arm_cpu_cfgend_property =
             DEFINE_PROP_BOOL("cfgend", ARMCPU, cfgend, false);
 
@@ -1377,11 +1372,6 @@ static void arm_cpu_post_init(Object *obj)
 
 #ifndef CONFIG_USER_ONLY
     if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
-        /* Add the has_el3 state CPU property only if EL3 is allowed.  This will
-         * prevent "has_el3" from existing on CPUs which cannot support EL3.
-         */
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_el3_property);
-
         object_property_add_link(obj, "secure-memory",
                                  TYPE_MEMORY_REGION,
                                  (Object **)&cpu->secure_memory,
@@ -1583,12 +1573,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                        current_accel_name());
             return;
         }
-        if (cpu->has_el3) {
-            error_setg(errp,
-                       "Cannot enable %s when guest CPU has EL3 enabled",
-                       current_accel_name());
-            return;
-        }
         if (cpu->tag_memory) {
             error_setg(errp,
                        "Cannot enable %s when guest CPUs has MTE enabled",
@@ -1795,22 +1779,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
-    if (!arm_feature(env, ARM_FEATURE_M) && !cpu->has_el3) {
-        /* If the has_el3 CPU property is disabled then we need to disable the
-         * feature.
-         */
-        unset_feature(env, ARM_FEATURE_EL3);
-
-        /*
-         * Disable the security extension feature bits in the processor
-         * feature registers as well.
-         */
-        cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1, ID_PFR1, SECURITY, 0);
-        cpu->isar.id_dfr0 = FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, COPSDBG, 0);
-        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
-                                           ID_AA64PFR0, EL3, 0);
-    }
-
     if (!cpu->has_pmu) {
         unset_feature(env, ARM_FEATURE_PMU);
     }
@@ -1929,7 +1897,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 #ifndef CONFIG_USER_ONLY
     MachineState *ms = MACHINE(qdev_get_machine());
     unsigned int smp_cpus = ms->smp.cpus;
-    bool has_secure = cpu->has_el3 || arm_feature(env, ARM_FEATURE_M_SECURITY);
+    bool has_secure = arm_feature(env, ARM_FEATURE_EL3) ||
+                      arm_feature(env, ARM_FEATURE_M_SECURITY);
 
     /*
      * We must set cs->num_ases to the final value before
@@ -2364,6 +2333,13 @@ static void arm_cpu_leaf_class_init(ObjectClass *oc, void *data)
                            arm_class_prop_set_auto_ofs,
                            (void *)(uintptr_t)offsetof(ARMCPUClass, has_el2));
     }
+    if (arm_class_feature(acc, ARM_FEATURE_EL3) ||
+        arm_class_feature(acc, ARM_FEATURE_V8)) {
+        class_property_add(oc, "has_el3", "bool", NULL,
+                           arm_class_prop_get_auto_ofs,
+                           arm_class_prop_set_auto_ofs,
+                           (void *)(uintptr_t)offsetof(ARMCPUClass, has_el3));
+    }
 #endif /* !CONFIG_USER_ONLY */
 }
 
@@ -2405,6 +2381,42 @@ static bool arm_cpu_class_late_init(ObjectClass *oc, Error **errp)
     default:
         g_assert_not_reached();
     }
+
+    if (acc->has_el3 == ON_OFF_AUTO_AUTO) {
+        if (tcg_enabled() || qtest_enabled()) {
+            acc->has_el3 = (arm_class_feature(acc, ARM_FEATURE_EL3)
+                            ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF);
+        } else {
+            acc->has_el3 = ON_OFF_AUTO_OFF;
+        }
+    }
+    switch (acc->has_el3) {
+    case ON_OFF_AUTO_OFF:
+        unset_class_feature(acc, ARM_FEATURE_EL3);
+        /*
+         * Disable the security extension feature bits in the processor
+         * feature registers as well.
+         */
+        acc->isar.id_pfr1 = FIELD_DP32(acc->isar.id_pfr1, ID_PFR1, SECURITY, 0);
+        acc->isar.id_dfr0 = FIELD_DP32(acc->isar.id_dfr0, ID_DFR0, COPSDBG, 0);
+        acc->isar.id_aa64pfr0 = FIELD_DP64(acc->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, EL3, 0);
+        break;
+    case ON_OFF_AUTO_ON:
+        if (!tcg_enabled() && !qtest_enabled()) {
+            error_setg(errp,
+                       "Cannot enable %s when guest CPU has EL3 enabled",
+                       current_accel_name());
+            return false;
+        }
+        if (!arm_class_feature(acc, ARM_FEATURE_EL3)) {
+            error_setg(errp, "CPU does not support EL3");
+            return false;
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
 #endif /* !CONFIG_USER_ONLY */
 
     /* Run some consistency checks for TCG. */
-- 
2.34.1


