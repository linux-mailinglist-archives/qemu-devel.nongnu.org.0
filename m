Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF33465C5F8
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:20:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCls6-00018S-UT; Tue, 03 Jan 2023 13:18:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrx-0000zC-1h
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:43 -0500
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClru-0005O6-SD
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:36 -0500
Received: by mail-qv1-xf2b.google.com with SMTP id w10so18876850qvn.11
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iCYu68/AsQJDDTxu6B7ticUbbeKteDS0WJXiIHlsiNQ=;
 b=NYRXx+bKAavGLJtXYqPL295Qczs1qTCu7ZNqpKMLQxdW/RJEr4x2wCEhaHsRBZuYeg
 huKAwEWNGXopTc8xBfJBw9Mq76j0cMtnK6O7R2082rKu/SM3fHPcV6W+GZCQkOmyGIrw
 pADwrEu6lY1oJ+kYtYlQQC0fX5DgJuK7FdLOL55Kd5StdkpCOfwFNAIB8vxk5httWbj5
 HLocVczpJNREcFNuPvEH02wk+eajFHIv9r1YY055Kn3GvefTJaiHViBRlQ9z4hqLrj3/
 MHY6HniQyiBYwN7u3pN8fNz87BcMdVWXiZIaUJxGG1aGLIouWbNJzNj+xNjm/5vMG4bJ
 yXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iCYu68/AsQJDDTxu6B7ticUbbeKteDS0WJXiIHlsiNQ=;
 b=VDs19D00UwWbtWNNt2ID++Jbw4q9mOZgC6/VitXAgJpaWXXzimmcLLFBGzBiV1ipDx
 /2sMxE01Wj1QSoKY7v7WYkf2GozmnwmN2dBKuwG63Z14mk07vvhiJLR9cYSJ1tZnlOOW
 sWaVbTZbi7h+TFZlyIMT+73rodOoc7wljSa5Q9StRkq9eEf4xJIX2MuAtYJuwL8E3HHP
 G5ZxfCbzkibww9PgA6Q8BaTG5t4aGYxPBVj8p+vEVlerwzP5zCKd/Q+QS/brdB4anQM6
 dKPLq14y1qK+JC8Sgtl4X1LvA1+vrsG/vWcMddwTNSfTvsTMNp+YXE4mDGGmtsIPiKZo
 i24w==
X-Gm-Message-State: AFqh2kqNfy5D8dRrDbvdVubNT3PPaqCFrrZqd5jnRYeaykDCw7CIw3Ru
 KnlwNM1idS/vnDuVi6EzCl8H7zyw84nHyHoqxLA=
X-Google-Smtp-Source: AMrXdXtB0l/eDLAXgfSGO4ftU7VVtsSq/F8JGP56Ski3RNJRSRhJRepW8DZBW6BSXW/efmmbYhl34g==
X-Received: by 2002:a05:6214:4947:b0:52e:6f33:ec2 with SMTP id
 pe7-20020a056214494700b0052e6f330ec2mr53876174qvb.31.1672769913849; 
 Tue, 03 Jan 2023 10:18:33 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:18:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 35/40] target/arm: Move "has_el2" to class property
Date: Tue,  3 Jan 2023 10:16:41 -0800
Message-Id: <20230103181646.55711-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
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

With the movement of the property, we can remove the field from the
cpu entirely, using only the class.  However, late initialization
of the "max" cpu, due to its interaction with "host", means that we
cannot leave the class property undefined when EL2 is not supported.
Adjust the class field to OnOffAuto and generate an error if enabled
when not supported.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-qom.h  |  4 +++
 target/arm/cpu.h      |  3 --
 hw/arm/allwinner-h3.c |  9 ++++--
 hw/arm/vexpress.c     | 10 +++---
 hw/arm/virt.c         | 22 ++++++++-----
 hw/arm/xlnx-zynqmp.c  |  3 +-
 hw/cpu/a15mpcore.c    |  9 +++---
 target/arm/cpu.c      | 74 ++++++++++++++++++++++++++++++++++++-------
 8 files changed, 98 insertions(+), 36 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 2d6fa38a30..fceb557a4d 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -22,6 +22,7 @@
 
 #include "hw/core/cpu.h"
 #include "qom/object.h"
+#include "qapi/qapi-types-common.h"
 
 struct arm_boot_info;
 
@@ -182,6 +183,9 @@ struct ARMCPUClass {
      * QEMU_KVM_ARM_TARGET_NONE if the kernel doesn't support this CPU type.
      */
     uint32_t kvm_target;
+
+    /* CPU has virtualization extension */
+    OnOffAuto has_el2;
 };
 
 static inline int arm_class_feature(ARMCPUClass *acc, int feature)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c0baec37d7..3888cdafdf 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -25,7 +25,6 @@
 #include "hw/registerfields.h"
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
-#include "qapi/qapi-types-common.h"
 
 /* ARM processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)
@@ -887,8 +886,6 @@ struct ArchCPU {
     /* Current power state, access guarded by BQL */
     ARMPSCIState power_state;
 
-    /* CPU has virtualization extension */
-    bool has_el2;
     /* CPU has security extension */
     bool has_el3;
     /* CPU has PMU (Performance Monitor Unit) */
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 308ed15552..07484b9f97 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -188,12 +188,16 @@ void allwinner_h3_bootrom_setup(AwH3State *s, BlockBackend *blk)
 static void allwinner_h3_init(Object *obj)
 {
     AwH3State *s = AW_H3(obj);
+    const char *cpu_type = ARM_CPU_TYPE_NAME("cortex-a7");
+    ObjectClass *cpu_class = object_class_by_name(cpu_type);
 
     s->memmap = allwinner_h3_memmap;
 
+    /* ??? This is the default for A7. */
+    class_property_set_bool(cpu_class, "has_el2", true, &error_abort);
+
     for (int i = 0; i < AW_H3_NUM_CPUS; i++) {
-        object_initialize_child(obj, "cpu[*]", &s->cpus[i],
-                                ARM_CPU_TYPE_NAME("cortex-a7"));
+        object_initialize_child(obj, "cpu[*]", &s->cpus[i], cpu_type);
     }
 
     object_initialize_child(obj, "gic", &s->gic, TYPE_ARM_GIC);
@@ -244,7 +248,6 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
 
         /* All exception levels required */
         qdev_prop_set_bit(DEVICE(&s->cpus[i]), "has_el3", true);
-        qdev_prop_set_bit(DEVICE(&s->cpus[i]), "has_el2", true);
 
         /* Mark realized */
         qdev_realize(DEVICE(&s->cpus[i]), NULL, &error_fatal);
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index e1d1983ae6..211daa8fde 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -208,6 +208,11 @@ static void init_cpus(MachineState *ms, const char *cpu_type,
     SysBusDevice *busdev;
     int n;
     unsigned int smp_cpus = ms->smp.cpus;
+    ObjectClass *cpu_class = object_class_by_name(cpu_type);
+
+    if (!virt) {
+        class_property_set_bool(cpu_class, "has_el2", false, NULL);
+    }
 
     /* Create the actual CPUs */
     for (n = 0; n < smp_cpus; n++) {
@@ -216,11 +221,6 @@ static void init_cpus(MachineState *ms, const char *cpu_type,
         if (!secure) {
             object_property_set_bool(cpuobj, "has_el3", false, NULL);
         }
-        if (!virt) {
-            if (object_property_find(cpuobj, "has_el2")) {
-                object_property_set_bool(cpuobj, "has_el2", false, NULL);
-            }
-        }
 
         if (object_property_find(cpuobj, "reset-cbar")) {
             object_property_set_int(cpuobj, "reset-cbar", periphbase,
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index aed86997c0..dd02e42f97 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2018,6 +2018,7 @@ static void machvirt_init(MachineState *machine)
     MemoryRegion *secure_sysmem = NULL;
     MemoryRegion *tag_sysmem = NULL;
     MemoryRegion *secure_tag_sysmem = NULL;
+    ObjectClass *cpu_class;
     int n, virt_max_cpus;
     bool firmware_loaded;
     bool aarch64 = true;
@@ -2032,6 +2033,16 @@ static void machvirt_init(MachineState *machine)
 
     possible_cpus = mc->possible_cpu_arch_ids(machine);
 
+    assert(possible_cpus->len == max_cpus);
+    for (n = 0; n < max_cpus; n++) {
+        assert(strcmp(machine->cpu_type, possible_cpus->cpus[n].type) == 0);
+    }
+
+    cpu_class = object_class_by_name(machine->cpu_type);
+    if (!vms->virt) {
+        class_property_set_bool(cpu_class, "has_el2", false, &error_abort);
+    }
+
     /*
      * In accelerated mode, the memory map is computed earlier in kvm_type()
      * to create a VM with the right number of IPA bits.
@@ -2046,7 +2057,7 @@ static void machvirt_init(MachineState *machine)
          * we are about to deal with. Once this is done, get rid of
          * the object.
          */
-        cpuobj = object_new(possible_cpus->cpus[0].type);
+        cpuobj = object_new_with_class(cpu_class);
         armcpu = ARM_CPU(cpuobj);
 
         pa_bits = arm_pamax(armcpu);
@@ -2143,8 +2154,7 @@ static void machvirt_init(MachineState *machine)
 
     create_fdt(vms);
 
-    assert(possible_cpus->len == max_cpus);
-    for (n = 0; n < possible_cpus->len; n++) {
+    for (n = 0; n < max_cpus; n++) {
         Object *cpuobj;
         CPUState *cs;
 
@@ -2152,7 +2162,7 @@ static void machvirt_init(MachineState *machine)
             break;
         }
 
-        cpuobj = object_new(possible_cpus->cpus[n].type);
+        cpuobj = object_new_with_class(cpu_class);
         object_property_set_int(cpuobj, "mp-affinity",
                                 possible_cpus->cpus[n].arch_id, NULL);
 
@@ -2168,10 +2178,6 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "has_el3", false, NULL);
         }
 
-        if (!vms->virt && object_property_find(cpuobj, "has_el2")) {
-            object_property_set_bool(cpuobj, "has_el2", false, NULL);
-        }
-
         if (vmc->kvm_no_adjvtime &&
             object_property_find(cpuobj, "kvm-no-adjvtime")) {
             object_property_set_bool(cpuobj, "kvm-no-adjvtime", true, NULL);
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 13ab999eb8..17bad9b4ed 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -385,6 +385,7 @@ static void xlnx_zynqmp_init(Object *obj)
     cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
     cpu_class = object_class_by_name(cpu_type);
     class_property_set_bool(cpu_class, "reset-hivecs", true, &error_abort);
+    class_property_set_bool(cpu_class, "has_el2", s->virt, &error_abort);
 
     for (i = 0; i < num_apus; i++) {
         object_initialize_child(OBJECT(&s->apu_cluster), "apu-cpu[*]",
@@ -529,8 +530,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
         object_property_set_bool(OBJECT(&s->apu_cpu[i]), "has_el3", s->secure,
                                  NULL);
-        object_property_set_bool(OBJECT(&s->apu_cpu[i]), "has_el2", s->virt,
-                                 NULL);
         object_property_set_int(OBJECT(&s->apu_cpu[i]), "reset-cbar",
                                 GIC_BASE_ADDR, &error_abort);
         object_property_set_int(OBJECT(&s->apu_cpu[i]), "core-count",
diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index 774ca9987a..6329d25f68 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -55,7 +55,6 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
     int i;
     bool has_el3;
     bool has_el2 = false;
-    Object *cpuobj;
 
     gicdev = DEVICE(&s->gic);
     qdev_prop_set_uint32(gicdev, "num-cpu", s->num_cpu);
@@ -65,13 +64,15 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
         /* Make the GIC's TZ support match the CPUs. We assume that
          * either all the CPUs have TZ, or none do.
          */
-        cpuobj = OBJECT(qemu_get_cpu(0));
+        Object *cpuobj = OBJECT(qemu_get_cpu(0));
+        ObjectClass *cpucls = object_get_class(cpuobj);
+
         has_el3 = object_property_find(cpuobj, "has_el3") &&
             object_property_get_bool(cpuobj, "has_el3", &error_abort);
         qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
+
         /* Similarly for virtualization support */
-        has_el2 = object_property_find(cpuobj, "has_el2") &&
-            object_property_get_bool(cpuobj, "has_el2", &error_abort);
+        has_el2 = class_property_get_bool(cpucls, "has_el2", NULL);
         qdev_prop_set_bit(gicdev, "has-virtualization-extensions", has_el2);
     }
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 032a2cc00a..db996d8c3a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1281,9 +1281,6 @@ static Property arm_cpu_reset_cbar_property =
             DEFINE_PROP_UINT64("reset-cbar", ARMCPU, reset_cbar, 0);
 
 #ifndef CONFIG_USER_ONLY
-static Property arm_cpu_has_el2_property =
-            DEFINE_PROP_BOOL("has_el2", ARMCPU, has_el2, true);
-
 static Property arm_cpu_has_el3_property =
             DEFINE_PROP_BOOL("has_el3", ARMCPU, has_el3, true);
 #endif
@@ -1391,10 +1388,6 @@ static void arm_cpu_post_init(Object *obj)
                                  qdev_prop_allow_set_link_before_realize,
                                  OBJ_PROP_LINK_STRONG);
     }
-
-    if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_el2_property);
-    }
 #endif
 
     if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
@@ -1818,10 +1811,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                                            ID_AA64PFR0, EL3, 0);
     }
 
-    if (!cpu->has_el2) {
-        unset_feature(env, ARM_FEATURE_EL2);
-    }
-
     if (!cpu->has_pmu) {
         unset_feature(env, ARM_FEATURE_PMU);
     }
@@ -2159,6 +2148,34 @@ static bool arm_class_prop_uint64_ofs(ObjectClass *oc, Visitor *v,
 }
 
 #ifndef CONFIG_USER_ONLY
+static bool arm_class_prop_get_auto_ofs(ObjectClass *oc, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
+{
+    ARMCPUClass *acc = ARM_CPU_CLASS(oc);
+    uintptr_t ofs = (uintptr_t)opaque;
+    OnOffAuto *ptr = (void *)acc + ofs;
+    bool val = *ptr == ON_OFF_AUTO_ON;
+
+    return visit_type_bool(v, name, &val, errp);
+}
+
+static bool arm_class_prop_set_auto_ofs(ObjectClass *oc, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
+{
+    ARMCPUClass *acc = ARM_CPU_CLASS(oc);
+    uintptr_t ofs = (uintptr_t)opaque;
+    OnOffAuto *ptr = (void *)acc + ofs;
+    bool val;
+
+    if (visit_type_bool(v, name, &val, errp)) {
+        *ptr = val ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
+        return true;
+    }
+    return false;
+}
+
 static bool arm_class_prop_set_sctlrbit(ObjectClass *oc, Visitor *v,
                                         const char *name, void *opaque,
                                         Error **errp)
@@ -2334,6 +2351,19 @@ static void arm_cpu_leaf_class_init(ObjectClass *oc, void *data)
                            arm_class_prop_set_sctlrbit,
                            (void *)((uintptr_t)1 << 13));
     }
+
+    /*
+     * With v8, we cannot yet tell if EL[23] are available, because
+     * we do not yet know if we're using tcg or host acceleration.
+     * We will reject incorrect settings during class_late_init.
+     */
+    if (arm_class_feature(acc, ARM_FEATURE_EL2) ||
+        arm_class_feature(acc, ARM_FEATURE_V8)) {
+        class_property_add(oc, "has_el2", "bool", NULL,
+                           arm_class_prop_get_auto_ofs,
+                           arm_class_prop_set_auto_ofs,
+                           (void *)(uintptr_t)offsetof(ARMCPUClass, has_el2));
+    }
 #endif /* !CONFIG_USER_ONLY */
 }
 
@@ -2353,6 +2383,28 @@ static bool arm_cpu_class_late_init(ObjectClass *oc, Error **errp)
         error_setg(errp, "Invalid CNTFRQ: %"PRId64"Hz", acc->gt_cntfrq_hz);
         return false;
     }
+
+    switch (acc->has_el2) {
+    case ON_OFF_AUTO_AUTO:
+        acc->has_el2 = (arm_class_feature(acc, ARM_FEATURE_EL2)
+                        ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF);
+        break;
+    case ON_OFF_AUTO_OFF:
+        unset_class_feature(acc, ARM_FEATURE_EL2);
+        acc->isar.id_pfr1 = FIELD_DP32(acc->isar.id_pfr1, ID_PFR1,
+                                       VIRTUALIZATION, 0);
+        acc->isar.id_aa64pfr0 = FIELD_DP64(acc->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, EL2, 0);
+        break;
+    case ON_OFF_AUTO_ON:
+        if (!arm_class_feature(acc, ARM_FEATURE_EL2)) {
+            error_setg(errp, "CPU does not support EL2");
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


