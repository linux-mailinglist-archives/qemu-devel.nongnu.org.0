Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EC165C5FC
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:22:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrc-0000Au-Q8; Tue, 03 Jan 2023 13:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrI-0008NU-Tb
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:57 -0500
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrE-0005Gi-13
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:56 -0500
Received: by mail-vs1-xe30.google.com with SMTP id i188so32587025vsi.8
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WOgkxoomlodohQOeAEcc5A6oSk0mtn0fP77laaeYcB0=;
 b=tzz/tsxN9uS5qnqhLorwtjdHaIXqpbccSaco+3ubfVNBtft/TiI2jbFNPa8+wyRUzw
 pRSsM0CX099eR2tbasxAEfjLHb57dreWrWhd2Wa8ABstMNElHpvFi1/PgsxOLqkoxLra
 iFJo6zcYV6+eUZJpU1aLyGH1gT3A9diciiZN6sDxmvD15yYCDQdKoA5dE6YD/CICS5RB
 oUDDhlsyh8iLYEX87srnzIEa4oVWxRezdIV4vv8KDQa+IkESrSfDMSbdawiO3ZCr+fB6
 Pd2vBkzfbUHhgMDmIUWUYplQf4VjHHGQvERj0sVgT7uo3X5a/uDMN/9rf8Q1GCjGweYQ
 FENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WOgkxoomlodohQOeAEcc5A6oSk0mtn0fP77laaeYcB0=;
 b=S8D0DJlC/fID1+BpUTzO0/vl/7QC0rRPPmy2hpERpHP3r45qomKSsE1FUAGOfWS1zW
 5vulNFskzpLC5yTvvl+XZuoYySl0l2AeiYzAoHAo4IOHrwbIIvQxAp5V2Bhd6WOCrNmL
 SbqdwEJKalKw0YfNdDmhhrH+qLduFNAa3ekoqFCiUAGaullVt/R2qI8HL7hdYPgNt26B
 qOeFMdMkqx9Z8AWEzSBtmFPCYB38owMwBr3klo9g5tnuugrVp7Hyx2wv47PwgnQW0EW7
 lf50jF2YAPcxjRzxXzSbSTx7b2n6s+gdbdY0lmm7sIbrJD0zLi6oeqUhkGl/LjYlVqoL
 4UnA==
X-Gm-Message-State: AFqh2kq5pmnS24h9lGzfiS9oMbLWEKopY6R9jfvN+LUKNh9yeJtUrw1G
 NiLiKTfTH4Lm6l6zEYeV9Q16UA6ngk7O+kOQLRg=
X-Google-Smtp-Source: AMrXdXs+Egv0neLb71iXpduZqpDPlsPJYx1Cb4VWGb6pCEkNYGY+YzP0k85A9j6FebCbZ2Xtk28VRA==
X-Received: by 2002:a67:f406:0:b0:3ca:f257:9f95 with SMTP id
 p6-20020a67f406000000b003caf2579f95mr12867591vsn.0.1672769870038; 
 Tue, 03 Jan 2023 10:17:50 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:17:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 20/40] target/arm: Merge kvm64.c with kvm.c
Date: Tue,  3 Jan 2023 10:16:26 -0800
Message-Id: <20230103181646.55711-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe30.google.com
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

With appropriate sorting of functions, this allows quite a
number of prototypes to be removed from kvm_arm.h, and the
corresponding functions made static.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm_arm.h   |  190 ----
 target/arm/kvm.c       | 2048 +++++++++++++++++++++++++++++++++++++---
 target/arm/kvm64.c     | 1632 --------------------------------
 target/arm/meson.build |    2 +-
 4 files changed, 1896 insertions(+), 1976 deletions(-)
 delete mode 100644 target/arm/kvm64.c

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 99017b635c..8efbe0cc4b 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -18,32 +18,6 @@
 #define KVM_ARM_VGIC_V2   (1 << 0)
 #define KVM_ARM_VGIC_V3   (1 << 1)
 
-/**
- * kvm_arm_vcpu_init:
- * @cs: CPUState
- *
- * Initialize (or reinitialize) the VCPU by invoking the
- * KVM_ARM_VCPU_INIT ioctl with the CPU type and feature
- * bitmask specified in the CPUState.
- *
- * Returns: 0 if success else < 0 error code
- */
-int kvm_arm_vcpu_init(CPUState *cs);
-
-/**
- * kvm_arm_vcpu_finalize:
- * @cs: CPUState
- * @feature: feature to finalize
- *
- * Finalizes the configuration of the specified VCPU feature by
- * invoking the KVM_ARM_VCPU_FINALIZE ioctl. Features requiring
- * this are documented in the "KVM_ARM_VCPU_FINALIZE" section of
- * KVM's API documentation.
- *
- * Returns: 0 if success else < 0 error code
- */
-int kvm_arm_vcpu_finalize(CPUState *cs, int feature);
-
 /**
  * kvm_arm_register_device:
  * @mr: memory region for this device
@@ -65,37 +39,6 @@ int kvm_arm_vcpu_finalize(CPUState *cs, int feature);
 void kvm_arm_register_device(MemoryRegion *mr, uint64_t devid, uint64_t group,
                              uint64_t attr, int dev_fd, uint64_t addr_ormask);
 
-/**
- * kvm_arm_init_cpreg_list:
- * @cpu: ARMCPU
- *
- * Initialize the ARMCPU cpreg list according to the kernel's
- * definition of what CPU registers it knows about (and throw away
- * the previous TCG-created cpreg list).
- *
- * Returns: 0 if success, else < 0 error code
- */
-int kvm_arm_init_cpreg_list(ARMCPU *cpu);
-
-/**
- * kvm_arm_reg_syncs_via_cpreg_list:
- * @regidx: KVM register index
- *
- * Return true if this KVM register should be synchronized via the
- * cpreg list of arbitrary system registers, false if it is synchronized
- * by hand using code in kvm_arch_get/put_registers().
- */
-bool kvm_arm_reg_syncs_via_cpreg_list(uint64_t regidx);
-
-/**
- * kvm_arm_cpreg_level:
- * @regidx: KVM register index
- *
- * Return the level of this coprocessor/system register.  Return value is
- * either KVM_PUT_RUNTIME_STATE, KVM_PUT_RESET_STATE, or KVM_PUT_FULL_STATE.
- */
-int kvm_arm_cpreg_level(uint64_t regidx);
-
 /**
  * write_list_to_kvmstate:
  * @cpu: ARMCPU
@@ -155,34 +98,6 @@ void kvm_arm_cpu_post_load(ARMCPU *cpu);
  */
 void kvm_arm_reset_vcpu(ARMCPU *cpu);
 
-/**
- * kvm_arm_init_serror_injection:
- * @cs: CPUState
- *
- * Check whether KVM can set guest SError syndrome.
- */
-void kvm_arm_init_serror_injection(CPUState *cs);
-
-/**
- * kvm_get_vcpu_events:
- * @cpu: ARMCPU
- *
- * Get VCPU related state from kvm.
- *
- * Returns: 0 if success else < 0 error code
- */
-int kvm_get_vcpu_events(ARMCPU *cpu);
-
-/**
- * kvm_put_vcpu_events:
- * @cpu: ARMCPU
- *
- * Put VCPU related state to kvm.
- *
- * Returns: 0 if success else < 0 error code
- */
-int kvm_put_vcpu_events(ARMCPU *cpu);
-
 #ifdef CONFIG_KVM
 /**
  * kvm_arm_create_scratch_host_vcpu:
@@ -214,28 +129,6 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
  */
 void kvm_arm_destroy_scratch_host_vcpu(int *fdarray);
 
-/**
- * ARMHostCPUFeatures: information about the host CPU (identified
- * by asking the host kernel)
- */
-typedef struct ARMHostCPUFeatures {
-    ARMISARegisters isar;
-    uint64_t features;
-    uint32_t target;
-    const char *dtb_compatible;
-} ARMHostCPUFeatures;
-
-/**
- * kvm_arm_get_host_cpu_features:
- * @ahcf: ARMHostCPUClass to fill in
- *
- * Probe the capabilities of the host kernel's preferred CPU and fill
- * in the ARMHostCPUClass struct accordingly.
- *
- * Returns true on success and false otherwise.
- */
-bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf);
-
 /**
  * kvm_arm_sve_get_vls:
  * @cs: CPUState
@@ -274,14 +167,6 @@ void kvm_arm_add_vcpu_properties(Object *obj);
  */
 void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp);
 
-/**
- * kvm_arm_steal_time_supported:
- *
- * Returns: true if KVM can enable steal time reporting
- * and false otherwise.
- */
-bool kvm_arm_steal_time_supported(void);
-
 /**
  * kvm_arm_aarch32_supported:
  *
@@ -315,44 +200,6 @@ bool kvm_arm_sve_supported(void);
  */
 int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa);
 
-/**
- * kvm_arm_sync_mpstate_to_kvm:
- * @cpu: ARMCPU
- *
- * If supported set the KVM MP_STATE based on QEMU's model.
- *
- * Returns 0 on success and -1 on failure.
- */
-int kvm_arm_sync_mpstate_to_kvm(ARMCPU *cpu);
-
-/**
- * kvm_arm_sync_mpstate_to_qemu:
- * @cpu: ARMCPU
- *
- * If supported get the MP_STATE from KVM and store in QEMU's model.
- *
- * Returns 0 on success and aborts on failure.
- */
-int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu);
-
-/**
- * kvm_arm_get_virtual_time:
- * @cs: CPUState
- *
- * Gets the VCPU's virtual counter and stores it in the KVM CPU state.
- */
-void kvm_arm_get_virtual_time(CPUState *cs);
-
-/**
- * kvm_arm_put_virtual_time:
- * @cs: CPUState
- *
- * Sets the VCPU's virtual counter to the value stored in the KVM CPU state.
- */
-void kvm_arm_put_virtual_time(CPUState *cs);
-
-void kvm_arm_vm_state_change(void *opaque, bool running, RunState state);
-
 int kvm_arm_vgic_probe(void);
 
 void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
@@ -471,43 +318,6 @@ static inline const char *gicv3_class_name(void)
     }
 }
 
-/**
- * kvm_arm_handle_debug:
- * @cs: CPUState
- * @debug_exit: debug part of the KVM exit structure
- *
- * Returns: TRUE if the debug exception was handled.
- */
-bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit);
-
-/**
- * kvm_arm_hw_debug_active:
- * @cs: CPU State
- *
- * Return: TRUE if any hardware breakpoints in use.
- */
-bool kvm_arm_hw_debug_active(CPUState *cs);
-
-/**
- * kvm_arm_copy_hw_debug_data:
- * @ptr: kvm_guest_debug_arch structure
- *
- * Copy the architecture specific debug registers into the
- * kvm_guest_debug ioctl structure.
- */
-struct kvm_guest_debug_arch;
-void kvm_arm_copy_hw_debug_data(struct kvm_guest_debug_arch *ptr);
-
-/**
- * kvm_arm_verify_ext_dabt_pending:
- * @cs: CPUState
- *
- * Verify the fault status code wrt the Ext DABT injection
- *
- * Returns: true if the fault status code is as expected, false otherwise
- */
-bool kvm_arm_verify_ext_dabt_pending(CPUState *cs);
-
 /**
  * its_class_name:
  *
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index f022c644d2..02a15c6013 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -19,6 +19,7 @@
 #include "qom/object.h"
 #include "qapi/error.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/runstate.h"
 #include "sysemu/kvm.h"
 #include "sysemu/kvm_int.h"
 #include "kvm_arm.h"
@@ -28,8 +29,11 @@
 #include "hw/pci/pci.h"
 #include "exec/memattrs.h"
 #include "exec/address-spaces.h"
+#include "exec/gdbstub.h"
 #include "hw/boards.h"
 #include "hw/irq.h"
+#include "hw/acpi/acpi.h"
+#include "hw/acpi/ghes.h"
 #include "qemu/log.h"
 
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
@@ -40,9 +44,30 @@ static bool cap_has_mp_state;
 static bool cap_has_inject_serror_esr;
 static bool cap_has_inject_ext_dabt;
 
+/**
+ * ARMHostCPUFeatures: information about the host CPU (identified
+ * by asking the host kernel)
+ */
+typedef struct ARMHostCPUFeatures {
+    ARMISARegisters isar;
+    uint64_t features;
+    uint32_t target;
+    const char *dtb_compatible;
+} ARMHostCPUFeatures;
+
 static ARMHostCPUFeatures arm_host_cpu_features;
 
-int kvm_arm_vcpu_init(CPUState *cs)
+/**
+ * kvm_arm_vcpu_init:
+ * @cs: CPUState
+ *
+ * Initialize (or reinitialize) the VCPU by invoking the
+ * KVM_ARM_VCPU_INIT ioctl with the CPU type and feature
+ * bitmask specified in the CPUState.
+ *
+ * Returns: 0 if success else < 0 error code
+ */
+static int kvm_arm_vcpu_init(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     struct kvm_vcpu_init init;
@@ -53,12 +78,30 @@ int kvm_arm_vcpu_init(CPUState *cs)
     return kvm_vcpu_ioctl(cs, KVM_ARM_VCPU_INIT, &init);
 }
 
-int kvm_arm_vcpu_finalize(CPUState *cs, int feature)
+/**
+ * kvm_arm_vcpu_finalize:
+ * @cs: CPUState
+ * @feature: feature to finalize
+ *
+ * Finalizes the configuration of the specified VCPU feature by
+ * invoking the KVM_ARM_VCPU_FINALIZE ioctl. Features requiring
+ * this are documented in the "KVM_ARM_VCPU_FINALIZE" section of
+ * KVM's API documentation.
+ *
+ * Returns: 0 if success else < 0 error code
+ */
+static int kvm_arm_vcpu_finalize(CPUState *cs, int feature)
 {
     return kvm_vcpu_ioctl(cs, KVM_ARM_VCPU_FINALIZE, &feature);
 }
 
-void kvm_arm_init_serror_injection(CPUState *cs)
+/**
+ * kvm_arm_init_serror_injection:
+ * @cs: CPUState
+ *
+ * Check whether KVM can set guest SError syndrome.
+ */
+static void kvm_arm_init_serror_injection(CPUState *cs)
 {
     cap_has_inject_serror_esr = kvm_check_extension(cs->kvm_state,
                                     KVM_CAP_ARM_INJECT_SERROR_ESR);
@@ -166,28 +209,6 @@ void kvm_arm_destroy_scratch_host_vcpu(int *fdarray)
     }
 }
 
-void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
-{
-    CPUARMState *env = &cpu->env;
-
-    if (!arm_host_cpu_features.dtb_compatible) {
-        if (!kvm_enabled() ||
-            !kvm_arm_get_host_cpu_features(&arm_host_cpu_features)) {
-            /* We can't report this error yet, so flag that we need to
-             * in arm_cpu_realizefn().
-             */
-            cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
-            cpu->host_cpu_probe_failed = true;
-            return;
-        }
-    }
-
-    cpu->kvm_target = arm_host_cpu_features.target;
-    cpu->dtb_compatible = arm_host_cpu_features.dtb_compatible;
-    cpu->isar = arm_host_cpu_features.isar;
-    env->features = arm_host_cpu_features.features;
-}
-
 static bool kvm_no_adjvtime_get(Object *obj, Error **errp)
 {
     return !ARM_CPU(obj)->kvm_adjvtime;
@@ -438,11 +459,40 @@ static uint64_t *kvm_arm_get_cpreg_ptr(ARMCPU *cpu, uint64_t regidx)
     return &cpu->cpreg_values[res - cpu->cpreg_indexes];
 }
 
-/* Initialize the ARMCPU cpreg list according to the kernel's
+/**
+ * kvm_arm_reg_syncs_via_cpreg_list:
+ * @regidx: KVM register index
+ *
+ * Return true if this KVM register should be synchronized via the
+ * cpreg list of arbitrary system registers, false if it is synchronized
+ * by hand using code in kvm_arch_get/put_registers().
+ */
+static bool kvm_arm_reg_syncs_via_cpreg_list(uint64_t regidx)
+{
+    /* Return true if the regidx is a register we should synchronize
+     * via the cpreg_tuples array (ie is not a core or sve reg that
+     * we sync by hand in kvm_arch_get/put_registers())
+     */
+    switch (regidx & KVM_REG_ARM_COPROC_MASK) {
+    case KVM_REG_ARM_CORE:
+    case KVM_REG_ARM64_SVE:
+        return false;
+    default:
+        return true;
+    }
+}
+
+/**
+ * kvm_arm_init_cpreg_list:
+ * @cpu: ARMCPU
+ *
+ * Initialize the ARMCPU cpreg list according to the kernel's
  * definition of what CPU registers it knows about (and throw away
  * the previous TCG-created cpreg list).
+ *
+ * Returns: 0 if success, else < 0 error code
  */
-int kvm_arm_init_cpreg_list(ARMCPU *cpu)
+static int kvm_arm_init_cpreg_list(ARMCPU *cpu)
 {
     struct kvm_reg_list rl;
     struct kvm_reg_list *rlp;
@@ -551,6 +601,41 @@ bool write_kvmstate_to_list(ARMCPU *cpu)
     return ok;
 }
 
+typedef struct CPRegStateLevel {
+    uint64_t regidx;
+    int level;
+} CPRegStateLevel;
+
+/* All system registers not listed in the following table are assumed to be
+ * of the level KVM_PUT_RUNTIME_STATE. If a register should be written less
+ * often, you must add it to this table with a state of either
+ * KVM_PUT_RESET_STATE or KVM_PUT_FULL_STATE.
+ */
+static const CPRegStateLevel non_runtime_cpregs[] = {
+    { KVM_REG_ARM_TIMER_CNT, KVM_PUT_FULL_STATE },
+};
+
+/**
+ * kvm_arm_cpreg_level:
+ * @regidx: KVM register index
+ *
+ * Return the level of this coprocessor/system register.  Return value is
+ * either KVM_PUT_RUNTIME_STATE, KVM_PUT_RESET_STATE, or KVM_PUT_FULL_STATE.
+ */
+static int kvm_arm_cpreg_level(uint64_t regidx)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(non_runtime_cpregs); i++) {
+        const CPRegStateLevel *l = &non_runtime_cpregs[i];
+        if (l->regidx == regidx) {
+            return l->level;
+        }
+    }
+
+    return KVM_PUT_RUNTIME_STATE;
+}
+
 bool write_list_to_kvmstate(ARMCPU *cpu, int level)
 {
     CPUState *cs = CPU(cpu);
@@ -634,10 +719,15 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
     write_list_to_cpustate(cpu);
 }
 
-/*
- * Update KVM's MP_STATE based on what QEMU thinks it is
+/**
+ * kvm_arm_sync_mpstate_to_kvm:
+ * @cpu: ARMCPU
+ *
+ * If supported set the KVM MP_STATE based on QEMU's model.
+ *
+ * Returns 0 on success and -1 on failure.
  */
-int kvm_arm_sync_mpstate_to_kvm(ARMCPU *cpu)
+static int kvm_arm_sync_mpstate_to_kvm(ARMCPU *cpu)
 {
     if (cap_has_mp_state) {
         struct kvm_mp_state mp_state = {
@@ -655,10 +745,15 @@ int kvm_arm_sync_mpstate_to_kvm(ARMCPU *cpu)
     return 0;
 }
 
-/*
- * Sync the KVM MP_STATE into QEMU
+/**
+ * kvm_arm_sync_mpstate_to_qemu:
+ * @cpu: ARMCPU
+ *
+ * If supported get the MP_STATE from KVM and store in QEMU's model.
+ *
+ * Returns 0 on success and aborts on failure.
  */
-int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu)
+static int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu)
 {
     if (cap_has_mp_state) {
         struct kvm_mp_state mp_state;
@@ -675,7 +770,13 @@ int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu)
     return 0;
 }
 
-void kvm_arm_get_virtual_time(CPUState *cs)
+/**
+ * kvm_arm_get_virtual_time:
+ * @cs: CPUState
+ *
+ * Gets the VCPU's virtual counter and stores it in the KVM CPU state.
+ */
+static void kvm_arm_get_virtual_time(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     struct kvm_one_reg reg = {
@@ -697,7 +798,13 @@ void kvm_arm_get_virtual_time(CPUState *cs)
     cpu->kvm_vtime_dirty = true;
 }
 
-void kvm_arm_put_virtual_time(CPUState *cs)
+/**
+ * kvm_arm_put_virtual_time:
+ * @cs: CPUState
+ *
+ * Sets the VCPU's virtual counter to the value stored in the KVM CPU state.
+ */
+static void kvm_arm_put_virtual_time(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     struct kvm_one_reg reg = {
@@ -719,7 +826,15 @@ void kvm_arm_put_virtual_time(CPUState *cs)
     cpu->kvm_vtime_dirty = false;
 }
 
-int kvm_put_vcpu_events(ARMCPU *cpu)
+/**
+ * kvm_put_vcpu_events:
+ * @cpu: ARMCPU
+ *
+ * Put VCPU related state to kvm.
+ *
+ * Returns: 0 if success else < 0 error code
+ */
+static int kvm_put_vcpu_events(ARMCPU *cpu)
 {
     CPUARMState *env = &cpu->env;
     struct kvm_vcpu_events events;
@@ -748,7 +863,15 @@ int kvm_put_vcpu_events(ARMCPU *cpu)
     return ret;
 }
 
-int kvm_get_vcpu_events(ARMCPU *cpu)
+/**
+ * kvm_get_vcpu_events:
+ * @cpu: ARMCPU
+ *
+ * Get VCPU related state from kvm.
+ *
+ * Returns: 0 if success else < 0 error code
+ */
+static int kvm_get_vcpu_events(ARMCPU *cpu)
 {
     CPUARMState *env = &cpu->env;
     struct kvm_vcpu_events events;
@@ -772,88 +895,7 @@ int kvm_get_vcpu_events(ARMCPU *cpu)
     return 0;
 }
 
-void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    if (unlikely(env->ext_dabt_raised)) {
-        /*
-         * Verifying that the ext DABT has been properly injected,
-         * otherwise risking indefinitely re-running the faulting instruction
-         * Covering a very narrow case for kernels 5.5..5.5.4
-         * when injected abort was misconfigured to be
-         * an IMPLEMENTATION DEFINED exception (for 32-bit EL1)
-         */
-        if (!arm_feature(env, ARM_FEATURE_AARCH64) &&
-            unlikely(!kvm_arm_verify_ext_dabt_pending(cs))) {
-
-            error_report("Data abort exception with no valid ISS generated by "
-                   "guest memory access. KVM unable to emulate faulting "
-                   "instruction. Failed to inject an external data abort "
-                   "into the guest.");
-            abort();
-       }
-       /* Clear the status */
-       env->ext_dabt_raised = 0;
-    }
-}
-
-MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
-{
-    ARMCPU *cpu;
-    uint32_t switched_level;
-
-    if (kvm_irqchip_in_kernel()) {
-        /*
-         * We only need to sync timer states with user-space interrupt
-         * controllers, so return early and save cycles if we don't.
-         */
-        return MEMTXATTRS_UNSPECIFIED;
-    }
-
-    cpu = ARM_CPU(cs);
-
-    /* Synchronize our shadowed in-kernel device irq lines with the kvm ones */
-    if (run->s.regs.device_irq_level != cpu->device_irq_level) {
-        switched_level = cpu->device_irq_level ^ run->s.regs.device_irq_level;
-
-        qemu_mutex_lock_iothread();
-
-        if (switched_level & KVM_ARM_DEV_EL1_VTIMER) {
-            qemu_set_irq(cpu->gt_timer_outputs[GTIMER_VIRT],
-                         !!(run->s.regs.device_irq_level &
-                            KVM_ARM_DEV_EL1_VTIMER));
-            switched_level &= ~KVM_ARM_DEV_EL1_VTIMER;
-        }
-
-        if (switched_level & KVM_ARM_DEV_EL1_PTIMER) {
-            qemu_set_irq(cpu->gt_timer_outputs[GTIMER_PHYS],
-                         !!(run->s.regs.device_irq_level &
-                            KVM_ARM_DEV_EL1_PTIMER));
-            switched_level &= ~KVM_ARM_DEV_EL1_PTIMER;
-        }
-
-        if (switched_level & KVM_ARM_DEV_PMU) {
-            qemu_set_irq(cpu->pmu_interrupt,
-                         !!(run->s.regs.device_irq_level & KVM_ARM_DEV_PMU));
-            switched_level &= ~KVM_ARM_DEV_PMU;
-        }
-
-        if (switched_level) {
-            qemu_log_mask(LOG_UNIMP, "%s: unhandled in-kernel device IRQ %x\n",
-                          __func__, switched_level);
-        }
-
-        /* We also mark unknown levels as processed to not waste cycles */
-        cpu->device_irq_level = run->s.regs.device_irq_level;
-        qemu_mutex_unlock_iothread();
-    }
-
-    return MEMTXATTRS_UNSPECIFIED;
-}
-
-void kvm_arm_vm_state_change(void *opaque, bool running, RunState state)
+static void kvm_arm_vm_state_change(void *opaque, bool running, RunState state)
 {
     CPUState *cs = opaque;
     ARMCPU *cpu = ARM_CPU(cs);
@@ -910,29 +952,6 @@ static int kvm_arm_handle_dabt_nisv(CPUState *cs, uint64_t esr_iss,
     return -1;
 }
 
-int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
-{
-    int ret = 0;
-
-    switch (run->exit_reason) {
-    case KVM_EXIT_DEBUG:
-        if (kvm_arm_handle_debug(cs, &run->debug.arch)) {
-            ret = EXCP_DEBUG;
-        } /* otherwise return to guest */
-        break;
-    case KVM_EXIT_ARM_NISV:
-        /* External DABT with no valid iss to decode */
-        ret = kvm_arm_handle_dabt_nisv(cs, run->arm_nisv.esr_iss,
-                                       run->arm_nisv.fault_ipa);
-        break;
-    default:
-        qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
-                      __func__, run->exit_reason);
-        break;
-    }
-    return ret;
-}
-
 bool kvm_arch_stop_on_emulation_error(CPUState *cs)
 {
     return true;
@@ -943,17 +962,6 @@ int kvm_arch_process_async_events(CPUState *cs)
     return 0;
 }
 
-void kvm_arch_update_guest_debug(CPUState *cs, struct kvm_guest_debug *dbg)
-{
-    if (kvm_sw_breakpoints_active(cs)) {
-        dbg->control |= KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_USE_SW_BP;
-    }
-    if (kvm_arm_hw_debug_active(cs)) {
-        dbg->control |= KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_USE_HW;
-        kvm_arm_copy_hw_debug_data(&dbg->arch);
-    }
-}
-
 void kvm_arch_init_irq_routing(KVMState *s)
 {
 }
@@ -1062,3 +1070,1737 @@ bool kvm_arch_cpu_check_are_resettable(void)
 void kvm_arch_accel_class_init(ObjectClass *oc)
 {
 }
+
+static bool have_guest_debug;
+
+/*
+ * Although the ARM implementation of hardware assisted debugging
+ * allows for different breakpoints per-core, the current GDB
+ * interface treats them as a global pool of registers (which seems to
+ * be the case for x86, ppc and s390). As a result we store one copy
+ * of registers which is used for all active cores.
+ *
+ * Write access is serialised by virtue of the GDB protocol which
+ * updates things. Read access (i.e. when the values are copied to the
+ * vCPU) is also gated by GDB's run control.
+ *
+ * This is not unreasonable as most of the time debugging kernels you
+ * never know which core will eventually execute your function.
+ */
+
+typedef struct {
+    uint64_t bcr;
+    uint64_t bvr;
+} HWBreakpoint;
+
+/* The watchpoint registers can cover more area than the requested
+ * watchpoint so we need to store the additional information
+ * somewhere. We also need to supply a CPUWatchpoint to the GDB stub
+ * when the watchpoint is hit.
+ */
+typedef struct {
+    uint64_t wcr;
+    uint64_t wvr;
+    CPUWatchpoint details;
+} HWWatchpoint;
+
+/* Maximum and current break/watch point counts */
+int max_hw_bps, max_hw_wps;
+GArray *hw_breakpoints, *hw_watchpoints;
+
+#define cur_hw_wps      (hw_watchpoints->len)
+#define cur_hw_bps      (hw_breakpoints->len)
+#define get_hw_bp(i)    (&g_array_index(hw_breakpoints, HWBreakpoint, i))
+#define get_hw_wp(i)    (&g_array_index(hw_watchpoints, HWWatchpoint, i))
+
+/**
+ * kvm_arm_init_debug() - check for guest debug capabilities
+ * @cs: CPUState
+ *
+ * kvm_check_extension returns the number of debug registers we have
+ * or 0 if we have none.
+ *
+ */
+static void kvm_arm_init_debug(CPUState *cs)
+{
+    have_guest_debug = kvm_check_extension(cs->kvm_state,
+                                           KVM_CAP_SET_GUEST_DEBUG);
+
+    max_hw_wps = kvm_check_extension(cs->kvm_state, KVM_CAP_GUEST_DEBUG_HW_WPS);
+    hw_watchpoints = g_array_sized_new(true, true,
+                                       sizeof(HWWatchpoint), max_hw_wps);
+
+    max_hw_bps = kvm_check_extension(cs->kvm_state, KVM_CAP_GUEST_DEBUG_HW_BPS);
+    hw_breakpoints = g_array_sized_new(true, true,
+                                       sizeof(HWBreakpoint), max_hw_bps);
+    return;
+}
+
+/**
+ * insert_hw_breakpoint()
+ * @addr: address of breakpoint
+ *
+ * See ARM ARM D2.9.1 for details but here we are only going to create
+ * simple un-linked breakpoints (i.e. we don't chain breakpoints
+ * together to match address and context or vmid). The hardware is
+ * capable of fancier matching but that will require exposing that
+ * fanciness to GDB's interface
+ *
+ * DBGBCR<n>_EL1, Debug Breakpoint Control Registers
+ *
+ *  31  24 23  20 19   16 15 14  13  12   9 8   5 4    3 2   1  0
+ * +------+------+-------+-----+----+------+-----+------+-----+---+
+ * | RES0 |  BT  |  LBN  | SSC | HMC| RES0 | BAS | RES0 | PMC | E |
+ * +------+------+-------+-----+----+------+-----+------+-----+---+
+ *
+ * BT: Breakpoint type (0 = unlinked address match)
+ * LBN: Linked BP number (0 = unused)
+ * SSC/HMC/PMC: Security, Higher and Priv access control (Table D-12)
+ * BAS: Byte Address Select (RES1 for AArch64)
+ * E: Enable bit
+ *
+ * DBGBVR<n>_EL1, Debug Breakpoint Value Registers
+ *
+ *  63  53 52       49 48       2  1 0
+ * +------+-----------+----------+-----+
+ * | RESS | VA[52:49] | VA[48:2] | 0 0 |
+ * +------+-----------+----------+-----+
+ *
+ * Depending on the addressing mode bits the top bits of the register
+ * are a sign extension of the highest applicable VA bit. Some
+ * versions of GDB don't do it correctly so we ensure they are correct
+ * here so future PC comparisons will work properly.
+ */
+
+static int insert_hw_breakpoint(target_ulong addr)
+{
+    HWBreakpoint brk = {
+        .bcr = 0x1,                             /* BCR E=1, enable */
+        .bvr = sextract64(addr, 0, 53)
+    };
+
+    if (cur_hw_bps >= max_hw_bps) {
+        return -ENOBUFS;
+    }
+
+    brk.bcr = deposit32(brk.bcr, 1, 2, 0x3);   /* PMC = 11 */
+    brk.bcr = deposit32(brk.bcr, 5, 4, 0xf);   /* BAS = RES1 */
+
+    g_array_append_val(hw_breakpoints, brk);
+
+    return 0;
+}
+
+/**
+ * delete_hw_breakpoint()
+ * @pc: address of breakpoint
+ *
+ * Delete a breakpoint and shuffle any above down
+ */
+
+static int delete_hw_breakpoint(target_ulong pc)
+{
+    int i;
+    for (i = 0; i < hw_breakpoints->len; i++) {
+        HWBreakpoint *brk = get_hw_bp(i);
+        if (brk->bvr == pc) {
+            g_array_remove_index(hw_breakpoints, i);
+            return 0;
+        }
+    }
+    return -ENOENT;
+}
+
+/**
+ * insert_hw_watchpoint()
+ * @addr: address of watch point
+ * @len: size of area
+ * @type: type of watch point
+ *
+ * See ARM ARM D2.10. As with the breakpoints we can do some advanced
+ * stuff if we want to. The watch points can be linked with the break
+ * points above to make them context aware. However for simplicity
+ * currently we only deal with simple read/write watch points.
+ *
+ * D7.3.11 DBGWCR<n>_EL1, Debug Watchpoint Control Registers
+ *
+ *  31  29 28   24 23  21  20  19 16 15 14  13   12  5 4   3 2   1  0
+ * +------+-------+------+----+-----+-----+-----+-----+-----+-----+---+
+ * | RES0 |  MASK | RES0 | WT | LBN | SSC | HMC | BAS | LSC | PAC | E |
+ * +------+-------+------+----+-----+-----+-----+-----+-----+-----+---+
+ *
+ * MASK: num bits addr mask (0=none,01/10=res,11=3 bits (8 bytes))
+ * WT: 0 - unlinked, 1 - linked (not currently used)
+ * LBN: Linked BP number (not currently used)
+ * SSC/HMC/PAC: Security, Higher and Priv access control (Table D2-11)
+ * BAS: Byte Address Select
+ * LSC: Load/Store control (01: load, 10: store, 11: both)
+ * E: Enable
+ *
+ * The bottom 2 bits of the value register are masked. Therefore to
+ * break on any sizes smaller than an unaligned word you need to set
+ * MASK=0, BAS=bit per byte in question. For larger regions (^2) you
+ * need to ensure you mask the address as required and set BAS=0xff
+ */
+
+static int insert_hw_watchpoint(target_ulong addr,
+                                target_ulong len, int type)
+{
+    HWWatchpoint wp = {
+        .wcr = R_DBGWCR_E_MASK, /* E=1, enable */
+        .wvr = addr & (~0x7ULL),
+        .details = { .vaddr = addr, .len = len }
+    };
+
+    if (cur_hw_wps >= max_hw_wps) {
+        return -ENOBUFS;
+    }
+
+    /*
+     * HMC=0 SSC=0 PAC=3 will hit EL0 or EL1, any security state,
+     * valid whether EL3 is implemented or not
+     */
+    wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, PAC, 3);
+
+    switch (type) {
+    case GDB_WATCHPOINT_READ:
+        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 1);
+        wp.details.flags = BP_MEM_READ;
+        break;
+    case GDB_WATCHPOINT_WRITE:
+        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 2);
+        wp.details.flags = BP_MEM_WRITE;
+        break;
+    case GDB_WATCHPOINT_ACCESS:
+        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 3);
+        wp.details.flags = BP_MEM_ACCESS;
+        break;
+    default:
+        g_assert_not_reached();
+        break;
+    }
+    if (len <= 8) {
+        /* we align the address and set the bits in BAS */
+        int off = addr & 0x7;
+        int bas = (1 << len) - 1;
+
+        wp.wcr = deposit32(wp.wcr, 5 + off, 8 - off, bas);
+    } else {
+        /* For ranges above 8 bytes we need to be a power of 2 */
+        if (is_power_of_2(len)) {
+            int bits = ctz64(len);
+
+            wp.wvr &= ~((1 << bits) - 1);
+            wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, MASK, bits);
+            wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, BAS, 0xff);
+        } else {
+            return -ENOBUFS;
+        }
+    }
+
+    g_array_append_val(hw_watchpoints, wp);
+    return 0;
+}
+
+
+static bool check_watchpoint_in_range(int i, target_ulong addr)
+{
+    HWWatchpoint *wp = get_hw_wp(i);
+    uint64_t addr_top, addr_bottom = wp->wvr;
+    int bas = extract32(wp->wcr, 5, 8);
+    int mask = extract32(wp->wcr, 24, 4);
+
+    if (mask) {
+        addr_top = addr_bottom + (1 << mask);
+    } else {
+        /* BAS must be contiguous but can offset against the base
+         * address in DBGWVR */
+        addr_bottom = addr_bottom + ctz32(bas);
+        addr_top = addr_bottom + clo32(bas);
+    }
+
+    if (addr >= addr_bottom && addr <= addr_top) {
+        return true;
+    }
+
+    return false;
+}
+
+/**
+ * delete_hw_watchpoint()
+ * @addr: address of breakpoint
+ *
+ * Delete a breakpoint and shuffle any above down
+ */
+
+static int delete_hw_watchpoint(target_ulong addr,
+                                target_ulong len, int type)
+{
+    int i;
+    for (i = 0; i < cur_hw_wps; i++) {
+        if (check_watchpoint_in_range(i, addr)) {
+            g_array_remove_index(hw_watchpoints, i);
+            return 0;
+        }
+    }
+    return -ENOENT;
+}
+
+
+int kvm_arch_insert_hw_breakpoint(target_ulong addr,
+                                  target_ulong len, int type)
+{
+    switch (type) {
+    case GDB_BREAKPOINT_HW:
+        return insert_hw_breakpoint(addr);
+        break;
+    case GDB_WATCHPOINT_READ:
+    case GDB_WATCHPOINT_WRITE:
+    case GDB_WATCHPOINT_ACCESS:
+        return insert_hw_watchpoint(addr, len, type);
+    default:
+        return -ENOSYS;
+    }
+}
+
+int kvm_arch_remove_hw_breakpoint(target_ulong addr,
+                                  target_ulong len, int type)
+{
+    switch (type) {
+    case GDB_BREAKPOINT_HW:
+        return delete_hw_breakpoint(addr);
+    case GDB_WATCHPOINT_READ:
+    case GDB_WATCHPOINT_WRITE:
+    case GDB_WATCHPOINT_ACCESS:
+        return delete_hw_watchpoint(addr, len, type);
+    default:
+        return -ENOSYS;
+    }
+}
+
+
+void kvm_arch_remove_all_hw_breakpoints(void)
+{
+    if (cur_hw_wps > 0) {
+        g_array_remove_range(hw_watchpoints, 0, cur_hw_wps);
+    }
+    if (cur_hw_bps > 0) {
+        g_array_remove_range(hw_breakpoints, 0, cur_hw_bps);
+    }
+}
+
+/**
+ * kvm_arm_copy_hw_debug_data:
+ * @ptr: kvm_guest_debug_arch structure
+ *
+ * Copy the architecture specific debug registers into the
+ * kvm_guest_debug ioctl structure.
+ */
+static void kvm_arm_copy_hw_debug_data(struct kvm_guest_debug_arch *ptr)
+{
+    int i;
+    memset(ptr, 0, sizeof(struct kvm_guest_debug_arch));
+
+    for (i = 0; i < max_hw_wps; i++) {
+        HWWatchpoint *wp = get_hw_wp(i);
+        ptr->dbg_wcr[i] = wp->wcr;
+        ptr->dbg_wvr[i] = wp->wvr;
+    }
+    for (i = 0; i < max_hw_bps; i++) {
+        HWBreakpoint *bp = get_hw_bp(i);
+        ptr->dbg_bcr[i] = bp->bcr;
+        ptr->dbg_bvr[i] = bp->bvr;
+    }
+}
+
+/**
+ * kvm_arm_hw_debug_active:
+ * @cs: CPU State
+ *
+ * Return: TRUE if any hardware breakpoints in use.
+ */
+static bool kvm_arm_hw_debug_active(CPUState *cs)
+{
+    return ((cur_hw_wps > 0) || (cur_hw_bps > 0));
+}
+
+static bool find_hw_breakpoint(CPUState *cpu, target_ulong pc)
+{
+    int i;
+
+    for (i = 0; i < cur_hw_bps; i++) {
+        HWBreakpoint *bp = get_hw_bp(i);
+        if (bp->bvr == pc) {
+            return true;
+        }
+    }
+    return false;
+}
+
+static CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr)
+{
+    int i;
+
+    for (i = 0; i < cur_hw_wps; i++) {
+        if (check_watchpoint_in_range(i, addr)) {
+            return &get_hw_wp(i)->details;
+        }
+    }
+    return NULL;
+}
+
+static bool kvm_arm_set_device_attr(CPUState *cs, struct kvm_device_attr *attr,
+                                    const char *name)
+{
+    int err;
+
+    err = kvm_vcpu_ioctl(cs, KVM_HAS_DEVICE_ATTR, attr);
+    if (err != 0) {
+        error_report("%s: KVM_HAS_DEVICE_ATTR: %s", name, strerror(-err));
+        return false;
+    }
+
+    err = kvm_vcpu_ioctl(cs, KVM_SET_DEVICE_ATTR, attr);
+    if (err != 0) {
+        error_report("%s: KVM_SET_DEVICE_ATTR: %s", name, strerror(-err));
+        return false;
+    }
+
+    return true;
+}
+
+void kvm_arm_pmu_init(CPUState *cs)
+{
+    struct kvm_device_attr attr = {
+        .group = KVM_ARM_VCPU_PMU_V3_CTRL,
+        .attr = KVM_ARM_VCPU_PMU_V3_INIT,
+    };
+
+    if (!ARM_CPU(cs)->has_pmu) {
+        return;
+    }
+    if (!kvm_arm_set_device_attr(cs, &attr, "PMU")) {
+        error_report("failed to init PMU");
+        abort();
+    }
+}
+
+void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
+{
+    struct kvm_device_attr attr = {
+        .group = KVM_ARM_VCPU_PMU_V3_CTRL,
+        .addr = (intptr_t)&irq,
+        .attr = KVM_ARM_VCPU_PMU_V3_IRQ,
+    };
+
+    if (!ARM_CPU(cs)->has_pmu) {
+        return;
+    }
+    if (!kvm_arm_set_device_attr(cs, &attr, "PMU")) {
+        error_report("failed to set irq for PMU");
+        abort();
+    }
+}
+
+void kvm_arm_pvtime_init(CPUState *cs, uint64_t ipa)
+{
+    struct kvm_device_attr attr = {
+        .group = KVM_ARM_VCPU_PVTIME_CTRL,
+        .attr = KVM_ARM_VCPU_PVTIME_IPA,
+        .addr = (uint64_t)&ipa,
+    };
+
+    if (ARM_CPU(cs)->kvm_steal_time == ON_OFF_AUTO_OFF) {
+        return;
+    }
+    if (!kvm_arm_set_device_attr(cs, &attr, "PVTIME IPA")) {
+        error_report("failed to init PVTIME IPA");
+        abort();
+    }
+}
+
+static int read_sys_reg32(int fd, uint32_t *pret, uint64_t id)
+{
+    uint64_t ret;
+    struct kvm_one_reg idreg = { .id = id, .addr = (uintptr_t)&ret };
+    int err;
+
+    assert((id & KVM_REG_SIZE_MASK) == KVM_REG_SIZE_U64);
+    err = ioctl(fd, KVM_GET_ONE_REG, &idreg);
+    if (err < 0) {
+        return -1;
+    }
+    *pret = ret;
+    return 0;
+}
+
+static int read_sys_reg64(int fd, uint64_t *pret, uint64_t id)
+{
+    struct kvm_one_reg idreg = { .id = id, .addr = (uintptr_t)pret };
+
+    assert((id & KVM_REG_SIZE_MASK) == KVM_REG_SIZE_U64);
+    return ioctl(fd, KVM_GET_ONE_REG, &idreg);
+}
+
+static bool kvm_arm_pauth_supported(void)
+{
+    return (kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_ADDRESS) &&
+            kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_GENERIC));
+}
+
+/**
+ * kvm_arm_get_host_cpu_features:
+ * @ahcf: ARMHostCPUClass to fill in
+ *
+ * Probe the capabilities of the host kernel's preferred CPU and fill
+ * in the ARMHostCPUClass struct accordingly.
+ *
+ * Returns true on success and false otherwise.
+ */
+static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
+{
+    /* Identify the feature bits corresponding to the host CPU, and
+     * fill out the ARMHostCPUClass fields accordingly. To do this
+     * we have to create a scratch VM, create a single CPU inside it,
+     * and then query that CPU for the relevant ID registers.
+     */
+    int fdarray[3];
+    bool sve_supported;
+    bool pmu_supported = false;
+    uint64_t features = 0;
+    int err;
+
+    /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
+     * we know these will only support creating one kind of guest CPU,
+     * which is its preferred CPU type. Fortunately these old kernels
+     * support only a very limited number of CPUs.
+     */
+    static const uint32_t cpus_to_try[] = {
+        KVM_ARM_TARGET_AEM_V8,
+        KVM_ARM_TARGET_FOUNDATION_V8,
+        KVM_ARM_TARGET_CORTEX_A57,
+        QEMU_KVM_ARM_TARGET_NONE
+    };
+    /*
+     * target = -1 informs kvm_arm_create_scratch_host_vcpu()
+     * to use the preferred target
+     */
+    struct kvm_vcpu_init init = { .target = -1, };
+
+    /*
+     * Ask for SVE if supported, so that we can query ID_AA64ZFR0,
+     * which is otherwise RAZ.
+     */
+    sve_supported = kvm_arm_sve_supported();
+    if (sve_supported) {
+        init.features[0] |= 1 << KVM_ARM_VCPU_SVE;
+    }
+
+    /*
+     * Ask for Pointer Authentication if supported, so that we get
+     * the unsanitized field values for AA64ISAR1_EL1.
+     */
+    if (kvm_arm_pauth_supported()) {
+        init.features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
+                             1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
+    }
+
+    if (kvm_arm_pmu_supported()) {
+        init.features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
+        pmu_supported = true;
+    }
+
+    if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
+        return false;
+    }
+
+    ahcf->target = init.target;
+    ahcf->dtb_compatible = "arm,arm-v8";
+
+    err = read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr0,
+                         ARM64_SYS_REG(3, 0, 0, 4, 0));
+    if (unlikely(err < 0)) {
+        /*
+         * Before v4.15, the kernel only exposed a limited number of system
+         * registers, not including any of the interesting AArch64 ID regs.
+         * For the most part we could leave these fields as zero with minimal
+         * effect, since this does not affect the values seen by the guest.
+         *
+         * However, it could cause problems down the line for QEMU,
+         * so provide a minimal v8.0 default.
+         *
+         * ??? Could read MIDR and use knowledge from cpu64.c.
+         * ??? Could map a page of memory into our temp guest and
+         *     run the tiniest of hand-crafted kernels to extract
+         *     the values seen by the guest.
+         * ??? Either of these sounds like too much effort just
+         *     to work around running a modern host kernel.
+         */
+        ahcf->isar.id_aa64pfr0 = 0x00000011; /* EL1&0, AArch64 only */
+        err = 0;
+    } else {
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr1,
+                              ARM64_SYS_REG(3, 0, 0, 4, 1));
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64smfr0,
+                              ARM64_SYS_REG(3, 0, 0, 4, 5));
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr0,
+                              ARM64_SYS_REG(3, 0, 0, 5, 0));
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr1,
+                              ARM64_SYS_REG(3, 0, 0, 5, 1));
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar0,
+                              ARM64_SYS_REG(3, 0, 0, 6, 0));
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar1,
+                              ARM64_SYS_REG(3, 0, 0, 6, 1));
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr0,
+                              ARM64_SYS_REG(3, 0, 0, 7, 0));
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr1,
+                              ARM64_SYS_REG(3, 0, 0, 7, 1));
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr2,
+                              ARM64_SYS_REG(3, 0, 0, 7, 2));
+
+        /*
+         * Note that if AArch32 support is not present in the host,
+         * the AArch32 sysregs are present to be read, but will
+         * return UNKNOWN values.  This is neither better nor worse
+         * than skipping the reads and leaving 0, as we must avoid
+         * considering the values in every case.
+         */
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr0,
+                              ARM64_SYS_REG(3, 0, 0, 1, 0));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr1,
+                              ARM64_SYS_REG(3, 0, 0, 1, 1));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_dfr0,
+                              ARM64_SYS_REG(3, 0, 0, 1, 2));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr0,
+                              ARM64_SYS_REG(3, 0, 0, 1, 4));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr1,
+                              ARM64_SYS_REG(3, 0, 0, 1, 5));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr2,
+                              ARM64_SYS_REG(3, 0, 0, 1, 6));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr3,
+                              ARM64_SYS_REG(3, 0, 0, 1, 7));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar0,
+                              ARM64_SYS_REG(3, 0, 0, 2, 0));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar1,
+                              ARM64_SYS_REG(3, 0, 0, 2, 1));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar2,
+                              ARM64_SYS_REG(3, 0, 0, 2, 2));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar3,
+                              ARM64_SYS_REG(3, 0, 0, 2, 3));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar4,
+                              ARM64_SYS_REG(3, 0, 0, 2, 4));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar5,
+                              ARM64_SYS_REG(3, 0, 0, 2, 5));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr4,
+                              ARM64_SYS_REG(3, 0, 0, 2, 6));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar6,
+                              ARM64_SYS_REG(3, 0, 0, 2, 7));
+
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr0,
+                              ARM64_SYS_REG(3, 0, 0, 3, 0));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr1,
+                              ARM64_SYS_REG(3, 0, 0, 3, 1));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr2,
+                              ARM64_SYS_REG(3, 0, 0, 3, 2));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr2,
+                              ARM64_SYS_REG(3, 0, 0, 3, 4));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_dfr1,
+                              ARM64_SYS_REG(3, 0, 0, 3, 5));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr5,
+                              ARM64_SYS_REG(3, 0, 0, 3, 6));
+
+        /*
+         * DBGDIDR is a bit complicated because the kernel doesn't
+         * provide an accessor for it in 64-bit mode, which is what this
+         * scratch VM is in, and there's no architected "64-bit sysreg
+         * which reads the same as the 32-bit register" the way there is
+         * for other ID registers. Instead we synthesize a value from the
+         * AArch64 ID_AA64DFR0, the same way the kernel code in
+         * arch/arm64/kvm/sys_regs.c:trap_dbgidr() does.
+         * We only do this if the CPU supports AArch32 at EL1.
+         */
+        if (FIELD_EX32(ahcf->isar.id_aa64pfr0, ID_AA64PFR0, EL1) >= 2) {
+            int wrps = FIELD_EX64(ahcf->isar.id_aa64dfr0, ID_AA64DFR0, WRPS);
+            int brps = FIELD_EX64(ahcf->isar.id_aa64dfr0, ID_AA64DFR0, BRPS);
+            int ctx_cmps =
+                FIELD_EX64(ahcf->isar.id_aa64dfr0, ID_AA64DFR0, CTX_CMPS);
+            int version = 6; /* ARMv8 debug architecture */
+            bool has_el3 =
+                !!FIELD_EX32(ahcf->isar.id_aa64pfr0, ID_AA64PFR0, EL3);
+            uint32_t dbgdidr = 0;
+
+            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, WRPS, wrps);
+            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, BRPS, brps);
+            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, CTX_CMPS, ctx_cmps);
+            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, VERSION, version);
+            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, NSUHD_IMP, has_el3);
+            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, SE_IMP, has_el3);
+            dbgdidr |= (1 << 15); /* RES1 bit */
+            ahcf->isar.dbgdidr = dbgdidr;
+        }
+
+        if (pmu_supported) {
+            /* PMCR_EL0 is only accessible if the vCPU has feature PMU_V3 */
+            err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
+                                  ARM64_SYS_REG(3, 3, 9, 12, 0));
+        }
+
+        if (sve_supported) {
+            /*
+             * There is a range of kernels between kernel commit 73433762fcae
+             * and f81cb2c3ad41 which have a bug where the kernel doesn't
+             * expose SYS_ID_AA64ZFR0_EL1 via the ONE_REG API unless the VM has
+             * enabled SVE support, which resulted in an error rather than RAZ.
+             * So only read the register if we set KVM_ARM_VCPU_SVE above.
+             */
+            err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
+                                  ARM64_SYS_REG(3, 0, 0, 4, 4));
+        }
+    }
+
+    kvm_arm_destroy_scratch_host_vcpu(fdarray);
+
+    if (err < 0) {
+        return false;
+    }
+
+    /*
+     * We can assume any KVM supporting CPU is at least a v8
+     * with VFPv4+Neon; this in turn implies most of the other
+     * feature bits.
+     */
+    features |= 1ULL << ARM_FEATURE_V8;
+    features |= 1ULL << ARM_FEATURE_NEON;
+    features |= 1ULL << ARM_FEATURE_AARCH64;
+    features |= 1ULL << ARM_FEATURE_PMU;
+    features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;
+
+    ahcf->features = features;
+
+    return true;
+}
+
+void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
+{
+    CPUARMState *env = &cpu->env;
+
+    if (!arm_host_cpu_features.dtb_compatible) {
+        if (!kvm_enabled() ||
+            !kvm_arm_get_host_cpu_features(&arm_host_cpu_features)) {
+            /* We can't report this error yet, so flag that we need to
+             * in arm_cpu_realizefn().
+             */
+            cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
+            cpu->host_cpu_probe_failed = true;
+            return;
+        }
+    }
+
+    cpu->kvm_target = arm_host_cpu_features.target;
+    cpu->dtb_compatible = arm_host_cpu_features.dtb_compatible;
+    cpu->isar = arm_host_cpu_features.isar;
+    env->features = arm_host_cpu_features.features;
+}
+
+/**
+ * kvm_arm_steal_time_supported:
+ *
+ * Returns: true if KVM can enable steal time reporting
+ * and false otherwise.
+ */
+static bool kvm_arm_steal_time_supported(void)
+{
+    return kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
+}
+
+void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
+{
+    bool has_steal_time = kvm_arm_steal_time_supported();
+
+    if (cpu->kvm_steal_time == ON_OFF_AUTO_AUTO) {
+        if (!has_steal_time || !arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+            cpu->kvm_steal_time = ON_OFF_AUTO_OFF;
+        } else {
+            cpu->kvm_steal_time = ON_OFF_AUTO_ON;
+        }
+    } else if (cpu->kvm_steal_time == ON_OFF_AUTO_ON) {
+        if (!has_steal_time) {
+            error_setg(errp, "'kvm-steal-time' cannot be enabled "
+                             "on this host");
+            return;
+        } else if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+            /*
+             * DEN0057A chapter 2 says "This specification only covers
+             * systems in which the Execution state of the hypervisor
+             * as well as EL1 of virtual machines is AArch64.". And,
+             * to ensure that, the smc/hvc calls are only specified as
+             * smc64/hvc64.
+             */
+            error_setg(errp, "'kvm-steal-time' cannot be enabled "
+                             "for AArch32 guests");
+            return;
+        }
+    }
+}
+
+bool kvm_arm_aarch32_supported(void)
+{
+    return kvm_check_extension(kvm_state, KVM_CAP_ARM_EL1_32BIT);
+}
+
+bool kvm_arm_sve_supported(void)
+{
+    return kvm_check_extension(kvm_state, KVM_CAP_ARM_SVE);
+}
+
+QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
+
+uint32_t kvm_arm_sve_get_vls(CPUState *cs)
+{
+    /* Only call this function if kvm_arm_sve_supported() returns true. */
+    static uint64_t vls[KVM_ARM64_SVE_VLS_WORDS];
+    static bool probed;
+    uint32_t vq = 0;
+    int i;
+
+    /*
+     * KVM ensures all host CPUs support the same set of vector lengths.
+     * So we only need to create the scratch VCPUs once and then cache
+     * the results.
+     */
+    if (!probed) {
+        struct kvm_vcpu_init init = {
+            .target = -1,
+            .features[0] = (1 << KVM_ARM_VCPU_SVE),
+        };
+        struct kvm_one_reg reg = {
+            .id = KVM_REG_ARM64_SVE_VLS,
+            .addr = (uint64_t)&vls[0],
+        };
+        int fdarray[3], ret;
+
+        probed = true;
+
+        if (!kvm_arm_create_scratch_host_vcpu(NULL, fdarray, &init)) {
+            error_report("failed to create scratch VCPU with SVE enabled");
+            abort();
+        }
+        ret = ioctl(fdarray[2], KVM_GET_ONE_REG, &reg);
+        kvm_arm_destroy_scratch_host_vcpu(fdarray);
+        if (ret) {
+            error_report("failed to get KVM_REG_ARM64_SVE_VLS: %s",
+                         strerror(errno));
+            abort();
+        }
+
+        for (i = KVM_ARM64_SVE_VLS_WORDS - 1; i >= 0; --i) {
+            if (vls[i]) {
+                vq = 64 - clz64(vls[i]) + i * 64;
+                break;
+            }
+        }
+        if (vq > ARM_MAX_VQ) {
+            warn_report("KVM supports vector lengths larger than "
+                        "QEMU can enable");
+            vls[0] &= MAKE_64BIT_MASK(0, ARM_MAX_VQ);
+        }
+    }
+
+    return vls[0];
+}
+
+static int kvm_arm_sve_set_vls(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    uint64_t vls[KVM_ARM64_SVE_VLS_WORDS] = { cpu->sve_vq.map };
+    struct kvm_one_reg reg = {
+        .id = KVM_REG_ARM64_SVE_VLS,
+        .addr = (uint64_t)&vls[0],
+    };
+
+    assert(cpu->sve_max_vq <= KVM_ARM64_SVE_VQ_MAX);
+
+    return kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+}
+
+#define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
+
+int kvm_arch_init_vcpu(CPUState *cs)
+{
+    int ret;
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    uint64_t psciver;
+
+    if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE ||
+        !object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU)) {
+        error_report("KVM is not supported for this guest CPU type");
+        return -EINVAL;
+    }
+
+    qemu_add_vm_change_state_handler(kvm_arm_vm_state_change, cs);
+
+    /* Determine init features for this CPU */
+    memset(cpu->kvm_init_features, 0, sizeof(cpu->kvm_init_features));
+    if (cs->start_powered_off) {
+        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_POWER_OFF;
+    }
+    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
+        cpu->psci_version = QEMU_PSCI_VERSION_0_2;
+        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PSCI_0_2;
+    }
+    if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
+    }
+    if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
+        cpu->has_pmu = false;
+    }
+    if (cpu->has_pmu) {
+        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
+    } else {
+        env->features &= ~(1ULL << ARM_FEATURE_PMU);
+    }
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        assert(kvm_arm_sve_supported());
+        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
+    }
+    if (cpu_isar_feature(aa64_pauth, cpu)) {
+        cpu->kvm_init_features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
+                                      1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
+    }
+
+    /* Do KVM_ARM_VCPU_INIT ioctl */
+    ret = kvm_arm_vcpu_init(cs);
+    if (ret) {
+        return ret;
+    }
+
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        ret = kvm_arm_sve_set_vls(cs);
+        if (ret) {
+            return ret;
+        }
+        ret = kvm_arm_vcpu_finalize(cs, KVM_ARM_VCPU_SVE);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    /*
+     * KVM reports the exact PSCI version it is implementing via a
+     * special sysreg. If it is present, use its contents to determine
+     * what to report to the guest in the dtb (it is the PSCI version,
+     * in the same 15-bits major 16-bits minor format that PSCI_VERSION
+     * returns).
+     */
+    if (!kvm_get_one_reg(cs, KVM_REG_ARM_PSCI_VERSION, &psciver)) {
+        cpu->psci_version = psciver;
+    }
+
+    /*
+     * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
+     * Currently KVM has its own idea about MPIDR assignment, so we
+     * override our defaults with what we get from KVM.
+     */
+    ret = kvm_get_one_reg(cs, ARM64_SYS_REG(ARM_CPU_ID_MPIDR),
+                          &cpu->mpidr_el1);
+    if (ret) {
+        return ret;
+    }
+
+    kvm_arm_init_debug(cs);
+
+    /* Check whether user space can specify guest syndrome value */
+    kvm_arm_init_serror_injection(cs);
+
+    return kvm_arm_init_cpreg_list(cpu);
+}
+
+int kvm_arch_destroy_vcpu(CPUState *cs)
+{
+    return 0;
+}
+
+/* Callers must hold the iothread mutex lock */
+static void kvm_inject_arm_sea(CPUState *c)
+{
+    ARMCPU *cpu = ARM_CPU(c);
+    CPUARMState *env = &cpu->env;
+    uint32_t esr;
+    bool same_el;
+
+    c->exception_index = EXCP_DATA_ABORT;
+    env->exception.target_el = 1;
+
+    /*
+     * Set the DFSC to synchronous external abort and set FnV to not valid,
+     * this will tell guest the FAR_ELx is UNKNOWN for this abort.
+     */
+    same_el = arm_current_el(env) == env->exception.target_el;
+    esr = syn_data_abort_no_iss(same_el, 1, 0, 0, 0, 0, 0x10);
+
+    env->exception.syndrome = esr;
+
+    arm_cpu_do_interrupt(c);
+}
+
+#define AARCH64_CORE_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U64 | \
+                 KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
+
+#define AARCH64_SIMD_CORE_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U128 | \
+                 KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
+
+#define AARCH64_SIMD_CTRL_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U32 | \
+                 KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
+
+static int kvm_arch_put_fpsimd(CPUState *cs)
+{
+    CPUARMState *env = &ARM_CPU(cs)->env;
+    struct kvm_one_reg reg;
+    int i, ret;
+
+    for (i = 0; i < 32; i++) {
+        uint64_t *q = aa64_vfp_qreg(env, i);
+#if HOST_BIG_ENDIAN
+        uint64_t fp_val[2] = { q[1], q[0] };
+        reg.addr = (uintptr_t)fp_val;
+#else
+        reg.addr = (uintptr_t)q;
+#endif
+        reg.id = AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]);
+        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
+/*
+ * KVM SVE registers come in slices where ZREGs have a slice size of 2048 bits
+ * and PREGS and the FFR have a slice size of 256 bits. However we simply hard
+ * code the slice index to zero for now as it's unlikely we'll need more than
+ * one slice for quite some time.
+ */
+static int kvm_arch_put_sve(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    uint64_t tmp[ARM_MAX_VQ * 2];
+    uint64_t *r;
+    struct kvm_one_reg reg;
+    int n, ret;
+
+    for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; ++n) {
+        r = sve_bswap64(tmp, &env->vfp.zregs[n].d[0], cpu->sve_max_vq * 2);
+        reg.addr = (uintptr_t)r;
+        reg.id = KVM_REG_ARM64_SVE_ZREG(n, 0);
+        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; ++n) {
+        r = sve_bswap64(tmp, r = &env->vfp.pregs[n].p[0],
+                        DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
+        reg.addr = (uintptr_t)r;
+        reg.id = KVM_REG_ARM64_SVE_PREG(n, 0);
+        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    r = sve_bswap64(tmp, &env->vfp.pregs[FFR_PRED_NUM].p[0],
+                    DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
+    reg.addr = (uintptr_t)r;
+    reg.id = KVM_REG_ARM64_SVE_FFR(0);
+    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+
+    return 0;
+}
+
+int kvm_arch_put_registers(CPUState *cs, int level)
+{
+    struct kvm_one_reg reg;
+    uint64_t val;
+    uint32_t fpr;
+    int i, ret;
+    unsigned int el;
+
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    /* If we are in AArch32 mode then we need to copy the AArch32 regs to the
+     * AArch64 registers before pushing them out to 64-bit KVM.
+     */
+    if (!is_a64(env)) {
+        aarch64_sync_32_to_64(env);
+    }
+
+    for (i = 0; i < 31; i++) {
+        reg.id = AARCH64_CORE_REG(regs.regs[i]);
+        reg.addr = (uintptr_t) &env->xregs[i];
+        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    /* KVM puts SP_EL0 in regs.sp and SP_EL1 in regs.sp_el1. On the
+     * QEMU side we keep the current SP in xregs[31] as well.
+     */
+    aarch64_save_sp(env, 1);
+
+    reg.id = AARCH64_CORE_REG(regs.sp);
+    reg.addr = (uintptr_t) &env->sp_el[0];
+    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg.id = AARCH64_CORE_REG(sp_el1);
+    reg.addr = (uintptr_t) &env->sp_el[1];
+    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+
+    /* Note that KVM thinks pstate is 64 bit but we use a uint32_t */
+    if (is_a64(env)) {
+        val = pstate_read(env);
+    } else {
+        val = cpsr_read(env);
+    }
+    reg.id = AARCH64_CORE_REG(regs.pstate);
+    reg.addr = (uintptr_t) &val;
+    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg.id = AARCH64_CORE_REG(regs.pc);
+    reg.addr = (uintptr_t) &env->pc;
+    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg.id = AARCH64_CORE_REG(elr_el1);
+    reg.addr = (uintptr_t) &env->elr_el[1];
+    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+
+    /* Saved Program State Registers
+     *
+     * Before we restore from the banked_spsr[] array we need to
+     * ensure that any modifications to env->spsr are correctly
+     * reflected in the banks.
+     */
+    el = arm_current_el(env);
+    if (el > 0 && !is_a64(env)) {
+        i = bank_number(env->uncached_cpsr & CPSR_M);
+        env->banked_spsr[i] = env->spsr;
+    }
+
+    /* KVM 0-4 map to QEMU banks 1-5 */
+    for (i = 0; i < KVM_NR_SPSR; i++) {
+        reg.id = AARCH64_CORE_REG(spsr[i]);
+        reg.addr = (uintptr_t) &env->banked_spsr[i + 1];
+        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        ret = kvm_arch_put_sve(cs);
+    } else {
+        ret = kvm_arch_put_fpsimd(cs);
+    }
+    if (ret) {
+        return ret;
+    }
+
+    reg.addr = (uintptr_t)(&fpr);
+    fpr = vfp_get_fpsr(env);
+    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
+    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg.addr = (uintptr_t)(&fpr);
+    fpr = vfp_get_fpcr(env);
+    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
+    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+
+    write_cpustate_to_list(cpu, true);
+
+    if (!write_list_to_kvmstate(cpu, level)) {
+        return -EINVAL;
+    }
+
+   /*
+    * Setting VCPU events should be triggered after syncing the registers
+    * to avoid overwriting potential changes made by KVM upon calling
+    * KVM_SET_VCPU_EVENTS ioctl
+    */
+    ret = kvm_put_vcpu_events(cpu);
+    if (ret) {
+        return ret;
+    }
+
+    kvm_arm_sync_mpstate_to_kvm(cpu);
+
+    return ret;
+}
+
+static int kvm_arch_get_fpsimd(CPUState *cs)
+{
+    CPUARMState *env = &ARM_CPU(cs)->env;
+    struct kvm_one_reg reg;
+    int i, ret;
+
+    for (i = 0; i < 32; i++) {
+        uint64_t *q = aa64_vfp_qreg(env, i);
+        reg.id = AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]);
+        reg.addr = (uintptr_t)q;
+        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        } else {
+#if HOST_BIG_ENDIAN
+            uint64_t t;
+            t = q[0], q[0] = q[1], q[1] = t;
+#endif
+        }
+    }
+
+    return 0;
+}
+
+/*
+ * KVM SVE registers come in slices where ZREGs have a slice size of 2048 bits
+ * and PREGS and the FFR have a slice size of 256 bits. However we simply hard
+ * code the slice index to zero for now as it's unlikely we'll need more than
+ * one slice for quite some time.
+ */
+static int kvm_arch_get_sve(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    struct kvm_one_reg reg;
+    uint64_t *r;
+    int n, ret;
+
+    for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; ++n) {
+        r = &env->vfp.zregs[n].d[0];
+        reg.addr = (uintptr_t)r;
+        reg.id = KVM_REG_ARM64_SVE_ZREG(n, 0);
+        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+        sve_bswap64(r, r, cpu->sve_max_vq * 2);
+    }
+
+    for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; ++n) {
+        r = &env->vfp.pregs[n].p[0];
+        reg.addr = (uintptr_t)r;
+        reg.id = KVM_REG_ARM64_SVE_PREG(n, 0);
+        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+        sve_bswap64(r, r, DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
+    }
+
+    r = &env->vfp.pregs[FFR_PRED_NUM].p[0];
+    reg.addr = (uintptr_t)r;
+    reg.id = KVM_REG_ARM64_SVE_FFR(0);
+    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+    sve_bswap64(r, r, DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
+
+    return 0;
+}
+
+int kvm_arch_get_registers(CPUState *cs)
+{
+    struct kvm_one_reg reg;
+    uint64_t val;
+    unsigned int el;
+    uint32_t fpr;
+    int i, ret;
+
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    for (i = 0; i < 31; i++) {
+        reg.id = AARCH64_CORE_REG(regs.regs[i]);
+        reg.addr = (uintptr_t) &env->xregs[i];
+        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    reg.id = AARCH64_CORE_REG(regs.sp);
+    reg.addr = (uintptr_t) &env->sp_el[0];
+    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg.id = AARCH64_CORE_REG(sp_el1);
+    reg.addr = (uintptr_t) &env->sp_el[1];
+    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg.id = AARCH64_CORE_REG(regs.pstate);
+    reg.addr = (uintptr_t) &val;
+    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+
+    env->aarch64 = ((val & PSTATE_nRW) == 0);
+    if (is_a64(env)) {
+        pstate_write(env, val);
+    } else {
+        cpsr_write(env, val, 0xffffffff, CPSRWriteRaw);
+    }
+
+    /* KVM puts SP_EL0 in regs.sp and SP_EL1 in regs.sp_el1. On the
+     * QEMU side we keep the current SP in xregs[31] as well.
+     */
+    aarch64_restore_sp(env, 1);
+
+    reg.id = AARCH64_CORE_REG(regs.pc);
+    reg.addr = (uintptr_t) &env->pc;
+    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+
+    /* If we are in AArch32 mode then we need to sync the AArch32 regs with the
+     * incoming AArch64 regs received from 64-bit KVM.
+     * We must perform this after all of the registers have been acquired from
+     * the kernel.
+     */
+    if (!is_a64(env)) {
+        aarch64_sync_64_to_32(env);
+    }
+
+    reg.id = AARCH64_CORE_REG(elr_el1);
+    reg.addr = (uintptr_t) &env->elr_el[1];
+    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+
+    /* Fetch the SPSR registers
+     *
+     * KVM SPSRs 0-4 map to QEMU banks 1-5
+     */
+    for (i = 0; i < KVM_NR_SPSR; i++) {
+        reg.id = AARCH64_CORE_REG(spsr[i]);
+        reg.addr = (uintptr_t) &env->banked_spsr[i + 1];
+        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    el = arm_current_el(env);
+    if (el > 0 && !is_a64(env)) {
+        i = bank_number(env->uncached_cpsr & CPSR_M);
+        env->spsr = env->banked_spsr[i];
+    }
+
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        ret = kvm_arch_get_sve(cs);
+    } else {
+        ret = kvm_arch_get_fpsimd(cs);
+    }
+    if (ret) {
+        return ret;
+    }
+
+    reg.addr = (uintptr_t)(&fpr);
+    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
+    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+    vfp_set_fpsr(env, fpr);
+
+    reg.addr = (uintptr_t)(&fpr);
+    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
+    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+    vfp_set_fpcr(env, fpr);
+
+    ret = kvm_get_vcpu_events(cpu);
+    if (ret) {
+        return ret;
+    }
+
+    if (!write_kvmstate_to_list(cpu)) {
+        return -EINVAL;
+    }
+    /* Note that it's OK to have registers which aren't in CPUState,
+     * so we can ignore a failure return here.
+     */
+    write_list_to_cpustate(cpu);
+
+    kvm_arm_sync_mpstate_to_qemu(cpu);
+
+    /* TODO: other registers */
+    return ret;
+}
+
+void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
+{
+    ram_addr_t ram_addr;
+    hwaddr paddr;
+
+    assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
+
+    if (acpi_ghes_present() && addr) {
+        ram_addr = qemu_ram_addr_from_host(addr);
+        if (ram_addr != RAM_ADDR_INVALID &&
+            kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
+            kvm_hwpoison_page_add(ram_addr);
+            /*
+             * If this is a BUS_MCEERR_AR, we know we have been called
+             * synchronously from the vCPU thread, so we can easily
+             * synchronize the state and inject an error.
+             *
+             * TODO: we currently don't tell the guest at all about
+             * BUS_MCEERR_AO. In that case we might either be being
+             * called synchronously from the vCPU thread, or a bit
+             * later from the main thread, so doing the injection of
+             * the error would be more complicated.
+             */
+            if (code == BUS_MCEERR_AR) {
+                kvm_cpu_synchronize_state(c);
+                if (!acpi_ghes_record_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
+                    kvm_inject_arm_sea(c);
+                } else {
+                    error_report("failed to record the error");
+                    abort();
+                }
+            }
+            return;
+        }
+        if (code == BUS_MCEERR_AO) {
+            error_report("Hardware memory error at addr %p for memory used by "
+                "QEMU itself instead of guest system!", addr);
+        }
+    }
+
+    if (code == BUS_MCEERR_AR) {
+        error_report("Hardware memory error!");
+        exit(1);
+    }
+}
+
+/* C6.6.29 BRK instruction */
+static const uint32_t brk_insn = 0xd4200000;
+
+int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
+{
+    if (have_guest_debug) {
+        if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 0) ||
+            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4, 1)) {
+            return -EINVAL;
+        }
+        return 0;
+    } else {
+        error_report("guest debug not supported on this kernel");
+        return -EINVAL;
+    }
+}
+
+int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
+{
+    static uint32_t brk;
+
+    if (have_guest_debug) {
+        if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk, 4, 0) ||
+            brk != brk_insn ||
+            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 1)) {
+            return -EINVAL;
+        }
+        return 0;
+    } else {
+        error_report("guest debug not supported on this kernel");
+        return -EINVAL;
+    }
+}
+
+/**
+ * kvm_arm_handle_debug:
+ * @cs: CPUState
+ * @debug_exit: debug part of the KVM exit structure
+ *
+ * Returns: TRUE if the debug exception was handled.
+ *
+ * See v8 ARM ARM D7.2.27 ESR_ELx, Exception Syndrome Register
+ * To minimise translating between kernel and user-space the kernel
+ * ABI just provides user-space with the full exception syndrome
+ * register value to be decoded in QEMU.
+ */
+static bool kvm_arm_handle_debug(CPUState *cs,
+                                 struct kvm_debug_exit_arch *debug_exit)
+{
+    int hsr_ec = syn_get_ec(debug_exit->hsr);
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    /* Ensure PC is synchronised */
+    kvm_cpu_synchronize_state(cs);
+
+    switch (hsr_ec) {
+    case EC_SOFTWARESTEP:
+        if (cs->singlestep_enabled) {
+            return true;
+        } else {
+            /*
+             * The kernel should have suppressed the guest's ability to
+             * single step at this point so something has gone wrong.
+             */
+            error_report("%s: guest single-step while debugging unsupported"
+                         " (%"PRIx64", %"PRIx32")",
+                         __func__, env->pc, debug_exit->hsr);
+            return false;
+        }
+        break;
+    case EC_AA64_BKPT:
+        if (kvm_find_sw_breakpoint(cs, env->pc)) {
+            return true;
+        }
+        break;
+    case EC_BREAKPOINT:
+        if (find_hw_breakpoint(cs, env->pc)) {
+            return true;
+        }
+        break;
+    case EC_WATCHPOINT:
+    {
+        CPUWatchpoint *wp = find_hw_watchpoint(cs, debug_exit->far);
+        if (wp) {
+            cs->watchpoint_hit = wp;
+            return true;
+        }
+        break;
+    }
+    default:
+        error_report("%s: unhandled debug exit (%"PRIx32", %"PRIx64")",
+                     __func__, debug_exit->hsr, env->pc);
+    }
+
+    /* If we are not handling the debug exception it must belong to
+     * the guest. Let's re-use the existing TCG interrupt code to set
+     * everything up properly.
+     */
+    cs->exception_index = EXCP_BKPT;
+    env->exception.syndrome = debug_exit->hsr;
+    env->exception.vaddress = debug_exit->far;
+    env->exception.target_el = 1;
+    qemu_mutex_lock_iothread();
+    arm_cpu_do_interrupt(cs);
+    qemu_mutex_unlock_iothread();
+
+    return false;
+}
+
+#define ARM64_REG_ESR_EL1 ARM64_SYS_REG(3, 0, 5, 2, 0)
+#define ARM64_REG_TCR_EL1 ARM64_SYS_REG(3, 0, 2, 0, 2)
+
+/*
+ * ESR_EL1
+ * ISS encoding
+ * AARCH64: DFSC,   bits [5:0]
+ * AARCH32:
+ *      TTBCR.EAE == 0
+ *          FS[4]   - DFSR[10]
+ *          FS[3:0] - DFSR[3:0]
+ *      TTBCR.EAE == 1
+ *          FS, bits [5:0]
+ */
+#define ESR_DFSC(aarch64, lpae, v)        \
+    ((aarch64 || (lpae)) ? ((v) & 0x3F)   \
+               : (((v) >> 6) | ((v) & 0x1F)))
+
+#define ESR_DFSC_EXTABT(aarch64, lpae) \
+    ((aarch64) ? 0x10 : (lpae) ? 0x10 : 0x8)
+
+/**
+ * kvm_arm_verify_ext_dabt_pending:
+ * @cs: CPUState
+ *
+ * Verify the fault status code wrt the Ext DABT injection
+ *
+ * Returns: true if the fault status code is as expected, false otherwise
+ */
+static bool kvm_arm_verify_ext_dabt_pending(CPUState *cs)
+{
+    uint64_t dfsr_val;
+
+    if (!kvm_get_one_reg(cs, ARM64_REG_ESR_EL1, &dfsr_val)) {
+        ARMCPU *cpu = ARM_CPU(cs);
+        CPUARMState *env = &cpu->env;
+        int aarch64_mode = arm_feature(env, ARM_FEATURE_AARCH64);
+        int lpae = 0;
+
+        if (!aarch64_mode) {
+            uint64_t ttbcr;
+
+            if (!kvm_get_one_reg(cs, ARM64_REG_TCR_EL1, &ttbcr)) {
+                lpae = arm_feature(env, ARM_FEATURE_LPAE)
+                        && (ttbcr & TTBCR_EAE);
+            }
+        }
+        /*
+         * The verification here is based on the DFSC bits
+         * of the ESR_EL1 reg only
+         */
+         return (ESR_DFSC(aarch64_mode, lpae, dfsr_val) ==
+                ESR_DFSC_EXTABT(aarch64_mode, lpae));
+    }
+    return false;
+}
+
+int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
+{
+    int ret = 0;
+
+    switch (run->exit_reason) {
+    case KVM_EXIT_DEBUG:
+        if (kvm_arm_handle_debug(cs, &run->debug.arch)) {
+            ret = EXCP_DEBUG;
+        } /* otherwise return to guest */
+        break;
+    case KVM_EXIT_ARM_NISV:
+        /* External DABT with no valid iss to decode */
+        ret = kvm_arm_handle_dabt_nisv(cs, run->arm_nisv.esr_iss,
+                                       run->arm_nisv.fault_ipa);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
+                      __func__, run->exit_reason);
+        break;
+    }
+    return ret;
+}
+
+void kvm_arch_update_guest_debug(CPUState *cs, struct kvm_guest_debug *dbg)
+{
+    if (kvm_sw_breakpoints_active(cs)) {
+        dbg->control |= KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_USE_SW_BP;
+    }
+    if (kvm_arm_hw_debug_active(cs)) {
+        dbg->control |= KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_USE_HW;
+        kvm_arm_copy_hw_debug_data(&dbg->arch);
+    }
+}
+
+void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    if (unlikely(env->ext_dabt_raised)) {
+        /*
+         * Verifying that the ext DABT has been properly injected,
+         * otherwise risking indefinitely re-running the faulting instruction
+         * Covering a very narrow case for kernels 5.5..5.5.4
+         * when injected abort was misconfigured to be
+         * an IMPLEMENTATION DEFINED exception (for 32-bit EL1)
+         */
+        if (!arm_feature(env, ARM_FEATURE_AARCH64) &&
+            unlikely(!kvm_arm_verify_ext_dabt_pending(cs))) {
+
+            error_report("Data abort exception with no valid ISS generated by "
+                   "guest memory access. KVM unable to emulate faulting "
+                   "instruction. Failed to inject an external data abort "
+                   "into the guest.");
+            abort();
+       }
+       /* Clear the status */
+       env->ext_dabt_raised = 0;
+    }
+}
+
+MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
+{
+    ARMCPU *cpu;
+    uint32_t switched_level;
+
+    if (kvm_irqchip_in_kernel()) {
+        /*
+         * We only need to sync timer states with user-space interrupt
+         * controllers, so return early and save cycles if we don't.
+         */
+        return MEMTXATTRS_UNSPECIFIED;
+    }
+
+    cpu = ARM_CPU(cs);
+
+    /* Synchronize our shadowed in-kernel device irq lines with the kvm ones */
+    if (run->s.regs.device_irq_level != cpu->device_irq_level) {
+        switched_level = cpu->device_irq_level ^ run->s.regs.device_irq_level;
+
+        qemu_mutex_lock_iothread();
+
+        if (switched_level & KVM_ARM_DEV_EL1_VTIMER) {
+            qemu_set_irq(cpu->gt_timer_outputs[GTIMER_VIRT],
+                         !!(run->s.regs.device_irq_level &
+                            KVM_ARM_DEV_EL1_VTIMER));
+            switched_level &= ~KVM_ARM_DEV_EL1_VTIMER;
+        }
+
+        if (switched_level & KVM_ARM_DEV_EL1_PTIMER) {
+            qemu_set_irq(cpu->gt_timer_outputs[GTIMER_PHYS],
+                         !!(run->s.regs.device_irq_level &
+                            KVM_ARM_DEV_EL1_PTIMER));
+            switched_level &= ~KVM_ARM_DEV_EL1_PTIMER;
+        }
+
+        if (switched_level & KVM_ARM_DEV_PMU) {
+            qemu_set_irq(cpu->pmu_interrupt,
+                         !!(run->s.regs.device_irq_level & KVM_ARM_DEV_PMU));
+            switched_level &= ~KVM_ARM_DEV_PMU;
+        }
+
+        if (switched_level) {
+            qemu_log_mask(LOG_UNIMP, "%s: unhandled in-kernel device IRQ %x\n",
+                          __func__, switched_level);
+        }
+
+        /* We also mark unknown levels as processed to not waste cycles */
+        cpu->device_irq_level = run->s.regs.device_irq_level;
+        qemu_mutex_unlock_iothread();
+    }
+
+    return MEMTXATTRS_UNSPECIFIED;
+}
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
deleted file mode 100644
index 2cdd7517b8..0000000000
--- a/target/arm/kvm64.c
+++ /dev/null
@@ -1,1632 +0,0 @@
-/*
- * ARM implementation of KVM hooks, 64 bit specific code
- *
- * Copyright Mian-M. Hamayun 2013, Virtual Open Systems
- * Copyright Alex Bennée 2014, Linaro
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-#include "qemu/osdep.h"
-#include <sys/ioctl.h>
-#include <sys/ptrace.h>
-
-#include <linux/elf.h>
-#include <linux/kvm.h>
-
-#include "qapi/error.h"
-#include "cpu.h"
-#include "qemu/timer.h"
-#include "qemu/error-report.h"
-#include "qemu/host-utils.h"
-#include "qemu/main-loop.h"
-#include "exec/gdbstub.h"
-#include "sysemu/runstate.h"
-#include "sysemu/kvm.h"
-#include "sysemu/kvm_int.h"
-#include "kvm_arm.h"
-#include "internals.h"
-#include "hw/acpi/acpi.h"
-#include "hw/acpi/ghes.h"
-#include "hw/arm/virt.h"
-
-static bool have_guest_debug;
-
-/*
- * Although the ARM implementation of hardware assisted debugging
- * allows for different breakpoints per-core, the current GDB
- * interface treats them as a global pool of registers (which seems to
- * be the case for x86, ppc and s390). As a result we store one copy
- * of registers which is used for all active cores.
- *
- * Write access is serialised by virtue of the GDB protocol which
- * updates things. Read access (i.e. when the values are copied to the
- * vCPU) is also gated by GDB's run control.
- *
- * This is not unreasonable as most of the time debugging kernels you
- * never know which core will eventually execute your function.
- */
-
-typedef struct {
-    uint64_t bcr;
-    uint64_t bvr;
-} HWBreakpoint;
-
-/* The watchpoint registers can cover more area than the requested
- * watchpoint so we need to store the additional information
- * somewhere. We also need to supply a CPUWatchpoint to the GDB stub
- * when the watchpoint is hit.
- */
-typedef struct {
-    uint64_t wcr;
-    uint64_t wvr;
-    CPUWatchpoint details;
-} HWWatchpoint;
-
-/* Maximum and current break/watch point counts */
-int max_hw_bps, max_hw_wps;
-GArray *hw_breakpoints, *hw_watchpoints;
-
-#define cur_hw_wps      (hw_watchpoints->len)
-#define cur_hw_bps      (hw_breakpoints->len)
-#define get_hw_bp(i)    (&g_array_index(hw_breakpoints, HWBreakpoint, i))
-#define get_hw_wp(i)    (&g_array_index(hw_watchpoints, HWWatchpoint, i))
-
-/**
- * kvm_arm_init_debug() - check for guest debug capabilities
- * @cs: CPUState
- *
- * kvm_check_extension returns the number of debug registers we have
- * or 0 if we have none.
- *
- */
-static void kvm_arm_init_debug(CPUState *cs)
-{
-    have_guest_debug = kvm_check_extension(cs->kvm_state,
-                                           KVM_CAP_SET_GUEST_DEBUG);
-
-    max_hw_wps = kvm_check_extension(cs->kvm_state, KVM_CAP_GUEST_DEBUG_HW_WPS);
-    hw_watchpoints = g_array_sized_new(true, true,
-                                       sizeof(HWWatchpoint), max_hw_wps);
-
-    max_hw_bps = kvm_check_extension(cs->kvm_state, KVM_CAP_GUEST_DEBUG_HW_BPS);
-    hw_breakpoints = g_array_sized_new(true, true,
-                                       sizeof(HWBreakpoint), max_hw_bps);
-    return;
-}
-
-/**
- * insert_hw_breakpoint()
- * @addr: address of breakpoint
- *
- * See ARM ARM D2.9.1 for details but here we are only going to create
- * simple un-linked breakpoints (i.e. we don't chain breakpoints
- * together to match address and context or vmid). The hardware is
- * capable of fancier matching but that will require exposing that
- * fanciness to GDB's interface
- *
- * DBGBCR<n>_EL1, Debug Breakpoint Control Registers
- *
- *  31  24 23  20 19   16 15 14  13  12   9 8   5 4    3 2   1  0
- * +------+------+-------+-----+----+------+-----+------+-----+---+
- * | RES0 |  BT  |  LBN  | SSC | HMC| RES0 | BAS | RES0 | PMC | E |
- * +------+------+-------+-----+----+------+-----+------+-----+---+
- *
- * BT: Breakpoint type (0 = unlinked address match)
- * LBN: Linked BP number (0 = unused)
- * SSC/HMC/PMC: Security, Higher and Priv access control (Table D-12)
- * BAS: Byte Address Select (RES1 for AArch64)
- * E: Enable bit
- *
- * DBGBVR<n>_EL1, Debug Breakpoint Value Registers
- *
- *  63  53 52       49 48       2  1 0
- * +------+-----------+----------+-----+
- * | RESS | VA[52:49] | VA[48:2] | 0 0 |
- * +------+-----------+----------+-----+
- *
- * Depending on the addressing mode bits the top bits of the register
- * are a sign extension of the highest applicable VA bit. Some
- * versions of GDB don't do it correctly so we ensure they are correct
- * here so future PC comparisons will work properly.
- */
-
-static int insert_hw_breakpoint(target_ulong addr)
-{
-    HWBreakpoint brk = {
-        .bcr = 0x1,                             /* BCR E=1, enable */
-        .bvr = sextract64(addr, 0, 53)
-    };
-
-    if (cur_hw_bps >= max_hw_bps) {
-        return -ENOBUFS;
-    }
-
-    brk.bcr = deposit32(brk.bcr, 1, 2, 0x3);   /* PMC = 11 */
-    brk.bcr = deposit32(brk.bcr, 5, 4, 0xf);   /* BAS = RES1 */
-
-    g_array_append_val(hw_breakpoints, brk);
-
-    return 0;
-}
-
-/**
- * delete_hw_breakpoint()
- * @pc: address of breakpoint
- *
- * Delete a breakpoint and shuffle any above down
- */
-
-static int delete_hw_breakpoint(target_ulong pc)
-{
-    int i;
-    for (i = 0; i < hw_breakpoints->len; i++) {
-        HWBreakpoint *brk = get_hw_bp(i);
-        if (brk->bvr == pc) {
-            g_array_remove_index(hw_breakpoints, i);
-            return 0;
-        }
-    }
-    return -ENOENT;
-}
-
-/**
- * insert_hw_watchpoint()
- * @addr: address of watch point
- * @len: size of area
- * @type: type of watch point
- *
- * See ARM ARM D2.10. As with the breakpoints we can do some advanced
- * stuff if we want to. The watch points can be linked with the break
- * points above to make them context aware. However for simplicity
- * currently we only deal with simple read/write watch points.
- *
- * D7.3.11 DBGWCR<n>_EL1, Debug Watchpoint Control Registers
- *
- *  31  29 28   24 23  21  20  19 16 15 14  13   12  5 4   3 2   1  0
- * +------+-------+------+----+-----+-----+-----+-----+-----+-----+---+
- * | RES0 |  MASK | RES0 | WT | LBN | SSC | HMC | BAS | LSC | PAC | E |
- * +------+-------+------+----+-----+-----+-----+-----+-----+-----+---+
- *
- * MASK: num bits addr mask (0=none,01/10=res,11=3 bits (8 bytes))
- * WT: 0 - unlinked, 1 - linked (not currently used)
- * LBN: Linked BP number (not currently used)
- * SSC/HMC/PAC: Security, Higher and Priv access control (Table D2-11)
- * BAS: Byte Address Select
- * LSC: Load/Store control (01: load, 10: store, 11: both)
- * E: Enable
- *
- * The bottom 2 bits of the value register are masked. Therefore to
- * break on any sizes smaller than an unaligned word you need to set
- * MASK=0, BAS=bit per byte in question. For larger regions (^2) you
- * need to ensure you mask the address as required and set BAS=0xff
- */
-
-static int insert_hw_watchpoint(target_ulong addr,
-                                target_ulong len, int type)
-{
-    HWWatchpoint wp = {
-        .wcr = R_DBGWCR_E_MASK, /* E=1, enable */
-        .wvr = addr & (~0x7ULL),
-        .details = { .vaddr = addr, .len = len }
-    };
-
-    if (cur_hw_wps >= max_hw_wps) {
-        return -ENOBUFS;
-    }
-
-    /*
-     * HMC=0 SSC=0 PAC=3 will hit EL0 or EL1, any security state,
-     * valid whether EL3 is implemented or not
-     */
-    wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, PAC, 3);
-
-    switch (type) {
-    case GDB_WATCHPOINT_READ:
-        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 1);
-        wp.details.flags = BP_MEM_READ;
-        break;
-    case GDB_WATCHPOINT_WRITE:
-        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 2);
-        wp.details.flags = BP_MEM_WRITE;
-        break;
-    case GDB_WATCHPOINT_ACCESS:
-        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 3);
-        wp.details.flags = BP_MEM_ACCESS;
-        break;
-    default:
-        g_assert_not_reached();
-        break;
-    }
-    if (len <= 8) {
-        /* we align the address and set the bits in BAS */
-        int off = addr & 0x7;
-        int bas = (1 << len) - 1;
-
-        wp.wcr = deposit32(wp.wcr, 5 + off, 8 - off, bas);
-    } else {
-        /* For ranges above 8 bytes we need to be a power of 2 */
-        if (is_power_of_2(len)) {
-            int bits = ctz64(len);
-
-            wp.wvr &= ~((1 << bits) - 1);
-            wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, MASK, bits);
-            wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, BAS, 0xff);
-        } else {
-            return -ENOBUFS;
-        }
-    }
-
-    g_array_append_val(hw_watchpoints, wp);
-    return 0;
-}
-
-
-static bool check_watchpoint_in_range(int i, target_ulong addr)
-{
-    HWWatchpoint *wp = get_hw_wp(i);
-    uint64_t addr_top, addr_bottom = wp->wvr;
-    int bas = extract32(wp->wcr, 5, 8);
-    int mask = extract32(wp->wcr, 24, 4);
-
-    if (mask) {
-        addr_top = addr_bottom + (1 << mask);
-    } else {
-        /* BAS must be contiguous but can offset against the base
-         * address in DBGWVR */
-        addr_bottom = addr_bottom + ctz32(bas);
-        addr_top = addr_bottom + clo32(bas);
-    }
-
-    if (addr >= addr_bottom && addr <= addr_top) {
-        return true;
-    }
-
-    return false;
-}
-
-/**
- * delete_hw_watchpoint()
- * @addr: address of breakpoint
- *
- * Delete a breakpoint and shuffle any above down
- */
-
-static int delete_hw_watchpoint(target_ulong addr,
-                                target_ulong len, int type)
-{
-    int i;
-    for (i = 0; i < cur_hw_wps; i++) {
-        if (check_watchpoint_in_range(i, addr)) {
-            g_array_remove_index(hw_watchpoints, i);
-            return 0;
-        }
-    }
-    return -ENOENT;
-}
-
-
-int kvm_arch_insert_hw_breakpoint(target_ulong addr,
-                                  target_ulong len, int type)
-{
-    switch (type) {
-    case GDB_BREAKPOINT_HW:
-        return insert_hw_breakpoint(addr);
-        break;
-    case GDB_WATCHPOINT_READ:
-    case GDB_WATCHPOINT_WRITE:
-    case GDB_WATCHPOINT_ACCESS:
-        return insert_hw_watchpoint(addr, len, type);
-    default:
-        return -ENOSYS;
-    }
-}
-
-int kvm_arch_remove_hw_breakpoint(target_ulong addr,
-                                  target_ulong len, int type)
-{
-    switch (type) {
-    case GDB_BREAKPOINT_HW:
-        return delete_hw_breakpoint(addr);
-    case GDB_WATCHPOINT_READ:
-    case GDB_WATCHPOINT_WRITE:
-    case GDB_WATCHPOINT_ACCESS:
-        return delete_hw_watchpoint(addr, len, type);
-    default:
-        return -ENOSYS;
-    }
-}
-
-
-void kvm_arch_remove_all_hw_breakpoints(void)
-{
-    if (cur_hw_wps > 0) {
-        g_array_remove_range(hw_watchpoints, 0, cur_hw_wps);
-    }
-    if (cur_hw_bps > 0) {
-        g_array_remove_range(hw_breakpoints, 0, cur_hw_bps);
-    }
-}
-
-void kvm_arm_copy_hw_debug_data(struct kvm_guest_debug_arch *ptr)
-{
-    int i;
-    memset(ptr, 0, sizeof(struct kvm_guest_debug_arch));
-
-    for (i = 0; i < max_hw_wps; i++) {
-        HWWatchpoint *wp = get_hw_wp(i);
-        ptr->dbg_wcr[i] = wp->wcr;
-        ptr->dbg_wvr[i] = wp->wvr;
-    }
-    for (i = 0; i < max_hw_bps; i++) {
-        HWBreakpoint *bp = get_hw_bp(i);
-        ptr->dbg_bcr[i] = bp->bcr;
-        ptr->dbg_bvr[i] = bp->bvr;
-    }
-}
-
-bool kvm_arm_hw_debug_active(CPUState *cs)
-{
-    return ((cur_hw_wps > 0) || (cur_hw_bps > 0));
-}
-
-static bool find_hw_breakpoint(CPUState *cpu, target_ulong pc)
-{
-    int i;
-
-    for (i = 0; i < cur_hw_bps; i++) {
-        HWBreakpoint *bp = get_hw_bp(i);
-        if (bp->bvr == pc) {
-            return true;
-        }
-    }
-    return false;
-}
-
-static CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr)
-{
-    int i;
-
-    for (i = 0; i < cur_hw_wps; i++) {
-        if (check_watchpoint_in_range(i, addr)) {
-            return &get_hw_wp(i)->details;
-        }
-    }
-    return NULL;
-}
-
-static bool kvm_arm_set_device_attr(CPUState *cs, struct kvm_device_attr *attr,
-                                    const char *name)
-{
-    int err;
-
-    err = kvm_vcpu_ioctl(cs, KVM_HAS_DEVICE_ATTR, attr);
-    if (err != 0) {
-        error_report("%s: KVM_HAS_DEVICE_ATTR: %s", name, strerror(-err));
-        return false;
-    }
-
-    err = kvm_vcpu_ioctl(cs, KVM_SET_DEVICE_ATTR, attr);
-    if (err != 0) {
-        error_report("%s: KVM_SET_DEVICE_ATTR: %s", name, strerror(-err));
-        return false;
-    }
-
-    return true;
-}
-
-void kvm_arm_pmu_init(CPUState *cs)
-{
-    struct kvm_device_attr attr = {
-        .group = KVM_ARM_VCPU_PMU_V3_CTRL,
-        .attr = KVM_ARM_VCPU_PMU_V3_INIT,
-    };
-
-    if (!ARM_CPU(cs)->has_pmu) {
-        return;
-    }
-    if (!kvm_arm_set_device_attr(cs, &attr, "PMU")) {
-        error_report("failed to init PMU");
-        abort();
-    }
-}
-
-void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
-{
-    struct kvm_device_attr attr = {
-        .group = KVM_ARM_VCPU_PMU_V3_CTRL,
-        .addr = (intptr_t)&irq,
-        .attr = KVM_ARM_VCPU_PMU_V3_IRQ,
-    };
-
-    if (!ARM_CPU(cs)->has_pmu) {
-        return;
-    }
-    if (!kvm_arm_set_device_attr(cs, &attr, "PMU")) {
-        error_report("failed to set irq for PMU");
-        abort();
-    }
-}
-
-void kvm_arm_pvtime_init(CPUState *cs, uint64_t ipa)
-{
-    struct kvm_device_attr attr = {
-        .group = KVM_ARM_VCPU_PVTIME_CTRL,
-        .attr = KVM_ARM_VCPU_PVTIME_IPA,
-        .addr = (uint64_t)&ipa,
-    };
-
-    if (ARM_CPU(cs)->kvm_steal_time == ON_OFF_AUTO_OFF) {
-        return;
-    }
-    if (!kvm_arm_set_device_attr(cs, &attr, "PVTIME IPA")) {
-        error_report("failed to init PVTIME IPA");
-        abort();
-    }
-}
-
-static int read_sys_reg32(int fd, uint32_t *pret, uint64_t id)
-{
-    uint64_t ret;
-    struct kvm_one_reg idreg = { .id = id, .addr = (uintptr_t)&ret };
-    int err;
-
-    assert((id & KVM_REG_SIZE_MASK) == KVM_REG_SIZE_U64);
-    err = ioctl(fd, KVM_GET_ONE_REG, &idreg);
-    if (err < 0) {
-        return -1;
-    }
-    *pret = ret;
-    return 0;
-}
-
-static int read_sys_reg64(int fd, uint64_t *pret, uint64_t id)
-{
-    struct kvm_one_reg idreg = { .id = id, .addr = (uintptr_t)pret };
-
-    assert((id & KVM_REG_SIZE_MASK) == KVM_REG_SIZE_U64);
-    return ioctl(fd, KVM_GET_ONE_REG, &idreg);
-}
-
-static bool kvm_arm_pauth_supported(void)
-{
-    return (kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_ADDRESS) &&
-            kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_GENERIC));
-}
-
-bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
-{
-    /* Identify the feature bits corresponding to the host CPU, and
-     * fill out the ARMHostCPUClass fields accordingly. To do this
-     * we have to create a scratch VM, create a single CPU inside it,
-     * and then query that CPU for the relevant ID registers.
-     */
-    int fdarray[3];
-    bool sve_supported;
-    bool pmu_supported = false;
-    uint64_t features = 0;
-    int err;
-
-    /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
-     * we know these will only support creating one kind of guest CPU,
-     * which is its preferred CPU type. Fortunately these old kernels
-     * support only a very limited number of CPUs.
-     */
-    static const uint32_t cpus_to_try[] = {
-        KVM_ARM_TARGET_AEM_V8,
-        KVM_ARM_TARGET_FOUNDATION_V8,
-        KVM_ARM_TARGET_CORTEX_A57,
-        QEMU_KVM_ARM_TARGET_NONE
-    };
-    /*
-     * target = -1 informs kvm_arm_create_scratch_host_vcpu()
-     * to use the preferred target
-     */
-    struct kvm_vcpu_init init = { .target = -1, };
-
-    /*
-     * Ask for SVE if supported, so that we can query ID_AA64ZFR0,
-     * which is otherwise RAZ.
-     */
-    sve_supported = kvm_arm_sve_supported();
-    if (sve_supported) {
-        init.features[0] |= 1 << KVM_ARM_VCPU_SVE;
-    }
-
-    /*
-     * Ask for Pointer Authentication if supported, so that we get
-     * the unsanitized field values for AA64ISAR1_EL1.
-     */
-    if (kvm_arm_pauth_supported()) {
-        init.features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
-                             1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
-    }
-
-    if (kvm_arm_pmu_supported()) {
-        init.features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
-        pmu_supported = true;
-    }
-
-    if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
-        return false;
-    }
-
-    ahcf->target = init.target;
-    ahcf->dtb_compatible = "arm,arm-v8";
-
-    err = read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr0,
-                         ARM64_SYS_REG(3, 0, 0, 4, 0));
-    if (unlikely(err < 0)) {
-        /*
-         * Before v4.15, the kernel only exposed a limited number of system
-         * registers, not including any of the interesting AArch64 ID regs.
-         * For the most part we could leave these fields as zero with minimal
-         * effect, since this does not affect the values seen by the guest.
-         *
-         * However, it could cause problems down the line for QEMU,
-         * so provide a minimal v8.0 default.
-         *
-         * ??? Could read MIDR and use knowledge from cpu64.c.
-         * ??? Could map a page of memory into our temp guest and
-         *     run the tiniest of hand-crafted kernels to extract
-         *     the values seen by the guest.
-         * ??? Either of these sounds like too much effort just
-         *     to work around running a modern host kernel.
-         */
-        ahcf->isar.id_aa64pfr0 = 0x00000011; /* EL1&0, AArch64 only */
-        err = 0;
-    } else {
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr1,
-                              ARM64_SYS_REG(3, 0, 0, 4, 1));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64smfr0,
-                              ARM64_SYS_REG(3, 0, 0, 4, 5));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr0,
-                              ARM64_SYS_REG(3, 0, 0, 5, 0));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr1,
-                              ARM64_SYS_REG(3, 0, 0, 5, 1));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar0,
-                              ARM64_SYS_REG(3, 0, 0, 6, 0));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar1,
-                              ARM64_SYS_REG(3, 0, 0, 6, 1));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr0,
-                              ARM64_SYS_REG(3, 0, 0, 7, 0));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr1,
-                              ARM64_SYS_REG(3, 0, 0, 7, 1));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr2,
-                              ARM64_SYS_REG(3, 0, 0, 7, 2));
-
-        /*
-         * Note that if AArch32 support is not present in the host,
-         * the AArch32 sysregs are present to be read, but will
-         * return UNKNOWN values.  This is neither better nor worse
-         * than skipping the reads and leaving 0, as we must avoid
-         * considering the values in every case.
-         */
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr0,
-                              ARM64_SYS_REG(3, 0, 0, 1, 0));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr1,
-                              ARM64_SYS_REG(3, 0, 0, 1, 1));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_dfr0,
-                              ARM64_SYS_REG(3, 0, 0, 1, 2));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr0,
-                              ARM64_SYS_REG(3, 0, 0, 1, 4));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr1,
-                              ARM64_SYS_REG(3, 0, 0, 1, 5));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr2,
-                              ARM64_SYS_REG(3, 0, 0, 1, 6));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr3,
-                              ARM64_SYS_REG(3, 0, 0, 1, 7));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar0,
-                              ARM64_SYS_REG(3, 0, 0, 2, 0));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar1,
-                              ARM64_SYS_REG(3, 0, 0, 2, 1));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar2,
-                              ARM64_SYS_REG(3, 0, 0, 2, 2));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar3,
-                              ARM64_SYS_REG(3, 0, 0, 2, 3));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar4,
-                              ARM64_SYS_REG(3, 0, 0, 2, 4));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar5,
-                              ARM64_SYS_REG(3, 0, 0, 2, 5));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr4,
-                              ARM64_SYS_REG(3, 0, 0, 2, 6));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar6,
-                              ARM64_SYS_REG(3, 0, 0, 2, 7));
-
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr0,
-                              ARM64_SYS_REG(3, 0, 0, 3, 0));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr1,
-                              ARM64_SYS_REG(3, 0, 0, 3, 1));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr2,
-                              ARM64_SYS_REG(3, 0, 0, 3, 2));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr2,
-                              ARM64_SYS_REG(3, 0, 0, 3, 4));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_dfr1,
-                              ARM64_SYS_REG(3, 0, 0, 3, 5));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr5,
-                              ARM64_SYS_REG(3, 0, 0, 3, 6));
-
-        /*
-         * DBGDIDR is a bit complicated because the kernel doesn't
-         * provide an accessor for it in 64-bit mode, which is what this
-         * scratch VM is in, and there's no architected "64-bit sysreg
-         * which reads the same as the 32-bit register" the way there is
-         * for other ID registers. Instead we synthesize a value from the
-         * AArch64 ID_AA64DFR0, the same way the kernel code in
-         * arch/arm64/kvm/sys_regs.c:trap_dbgidr() does.
-         * We only do this if the CPU supports AArch32 at EL1.
-         */
-        if (FIELD_EX32(ahcf->isar.id_aa64pfr0, ID_AA64PFR0, EL1) >= 2) {
-            int wrps = FIELD_EX64(ahcf->isar.id_aa64dfr0, ID_AA64DFR0, WRPS);
-            int brps = FIELD_EX64(ahcf->isar.id_aa64dfr0, ID_AA64DFR0, BRPS);
-            int ctx_cmps =
-                FIELD_EX64(ahcf->isar.id_aa64dfr0, ID_AA64DFR0, CTX_CMPS);
-            int version = 6; /* ARMv8 debug architecture */
-            bool has_el3 =
-                !!FIELD_EX32(ahcf->isar.id_aa64pfr0, ID_AA64PFR0, EL3);
-            uint32_t dbgdidr = 0;
-
-            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, WRPS, wrps);
-            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, BRPS, brps);
-            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, CTX_CMPS, ctx_cmps);
-            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, VERSION, version);
-            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, NSUHD_IMP, has_el3);
-            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, SE_IMP, has_el3);
-            dbgdidr |= (1 << 15); /* RES1 bit */
-            ahcf->isar.dbgdidr = dbgdidr;
-        }
-
-        if (pmu_supported) {
-            /* PMCR_EL0 is only accessible if the vCPU has feature PMU_V3 */
-            err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
-                                  ARM64_SYS_REG(3, 3, 9, 12, 0));
-        }
-
-        if (sve_supported) {
-            /*
-             * There is a range of kernels between kernel commit 73433762fcae
-             * and f81cb2c3ad41 which have a bug where the kernel doesn't
-             * expose SYS_ID_AA64ZFR0_EL1 via the ONE_REG API unless the VM has
-             * enabled SVE support, which resulted in an error rather than RAZ.
-             * So only read the register if we set KVM_ARM_VCPU_SVE above.
-             */
-            err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
-                                  ARM64_SYS_REG(3, 0, 0, 4, 4));
-        }
-    }
-
-    kvm_arm_destroy_scratch_host_vcpu(fdarray);
-
-    if (err < 0) {
-        return false;
-    }
-
-    /*
-     * We can assume any KVM supporting CPU is at least a v8
-     * with VFPv4+Neon; this in turn implies most of the other
-     * feature bits.
-     */
-    features |= 1ULL << ARM_FEATURE_V8;
-    features |= 1ULL << ARM_FEATURE_NEON;
-    features |= 1ULL << ARM_FEATURE_AARCH64;
-    features |= 1ULL << ARM_FEATURE_PMU;
-    features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;
-
-    ahcf->features = features;
-
-    return true;
-}
-
-void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
-{
-    bool has_steal_time = kvm_arm_steal_time_supported();
-
-    if (cpu->kvm_steal_time == ON_OFF_AUTO_AUTO) {
-        if (!has_steal_time || !arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-            cpu->kvm_steal_time = ON_OFF_AUTO_OFF;
-        } else {
-            cpu->kvm_steal_time = ON_OFF_AUTO_ON;
-        }
-    } else if (cpu->kvm_steal_time == ON_OFF_AUTO_ON) {
-        if (!has_steal_time) {
-            error_setg(errp, "'kvm-steal-time' cannot be enabled "
-                             "on this host");
-            return;
-        } else if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-            /*
-             * DEN0057A chapter 2 says "This specification only covers
-             * systems in which the Execution state of the hypervisor
-             * as well as EL1 of virtual machines is AArch64.". And,
-             * to ensure that, the smc/hvc calls are only specified as
-             * smc64/hvc64.
-             */
-            error_setg(errp, "'kvm-steal-time' cannot be enabled "
-                             "for AArch32 guests");
-            return;
-        }
-    }
-}
-
-bool kvm_arm_aarch32_supported(void)
-{
-    return kvm_check_extension(kvm_state, KVM_CAP_ARM_EL1_32BIT);
-}
-
-bool kvm_arm_sve_supported(void)
-{
-    return kvm_check_extension(kvm_state, KVM_CAP_ARM_SVE);
-}
-
-bool kvm_arm_steal_time_supported(void)
-{
-    return kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
-}
-
-QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
-
-uint32_t kvm_arm_sve_get_vls(CPUState *cs)
-{
-    /* Only call this function if kvm_arm_sve_supported() returns true. */
-    static uint64_t vls[KVM_ARM64_SVE_VLS_WORDS];
-    static bool probed;
-    uint32_t vq = 0;
-    int i;
-
-    /*
-     * KVM ensures all host CPUs support the same set of vector lengths.
-     * So we only need to create the scratch VCPUs once and then cache
-     * the results.
-     */
-    if (!probed) {
-        struct kvm_vcpu_init init = {
-            .target = -1,
-            .features[0] = (1 << KVM_ARM_VCPU_SVE),
-        };
-        struct kvm_one_reg reg = {
-            .id = KVM_REG_ARM64_SVE_VLS,
-            .addr = (uint64_t)&vls[0],
-        };
-        int fdarray[3], ret;
-
-        probed = true;
-
-        if (!kvm_arm_create_scratch_host_vcpu(NULL, fdarray, &init)) {
-            error_report("failed to create scratch VCPU with SVE enabled");
-            abort();
-        }
-        ret = ioctl(fdarray[2], KVM_GET_ONE_REG, &reg);
-        kvm_arm_destroy_scratch_host_vcpu(fdarray);
-        if (ret) {
-            error_report("failed to get KVM_REG_ARM64_SVE_VLS: %s",
-                         strerror(errno));
-            abort();
-        }
-
-        for (i = KVM_ARM64_SVE_VLS_WORDS - 1; i >= 0; --i) {
-            if (vls[i]) {
-                vq = 64 - clz64(vls[i]) + i * 64;
-                break;
-            }
-        }
-        if (vq > ARM_MAX_VQ) {
-            warn_report("KVM supports vector lengths larger than "
-                        "QEMU can enable");
-            vls[0] &= MAKE_64BIT_MASK(0, ARM_MAX_VQ);
-        }
-    }
-
-    return vls[0];
-}
-
-static int kvm_arm_sve_set_vls(CPUState *cs)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    uint64_t vls[KVM_ARM64_SVE_VLS_WORDS] = { cpu->sve_vq.map };
-    struct kvm_one_reg reg = {
-        .id = KVM_REG_ARM64_SVE_VLS,
-        .addr = (uint64_t)&vls[0],
-    };
-
-    assert(cpu->sve_max_vq <= KVM_ARM64_SVE_VQ_MAX);
-
-    return kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
-}
-
-#define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
-
-int kvm_arch_init_vcpu(CPUState *cs)
-{
-    int ret;
-    uint64_t mpidr;
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    uint64_t psciver;
-
-    if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE ||
-        !object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU)) {
-        error_report("KVM is not supported for this guest CPU type");
-        return -EINVAL;
-    }
-
-    qemu_add_vm_change_state_handler(kvm_arm_vm_state_change, cs);
-
-    /* Determine init features for this CPU */
-    memset(cpu->kvm_init_features, 0, sizeof(cpu->kvm_init_features));
-    if (cs->start_powered_off) {
-        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_POWER_OFF;
-    }
-    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
-        cpu->psci_version = QEMU_PSCI_VERSION_0_2;
-        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PSCI_0_2;
-    }
-    if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
-    }
-    if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
-        cpu->has_pmu = false;
-    }
-    if (cpu->has_pmu) {
-        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
-    } else {
-        env->features &= ~(1ULL << ARM_FEATURE_PMU);
-    }
-    if (cpu_isar_feature(aa64_sve, cpu)) {
-        assert(kvm_arm_sve_supported());
-        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
-    }
-    if (cpu_isar_feature(aa64_pauth, cpu)) {
-        cpu->kvm_init_features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
-                                      1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
-    }
-
-    /* Do KVM_ARM_VCPU_INIT ioctl */
-    ret = kvm_arm_vcpu_init(cs);
-    if (ret) {
-        return ret;
-    }
-
-    if (cpu_isar_feature(aa64_sve, cpu)) {
-        ret = kvm_arm_sve_set_vls(cs);
-        if (ret) {
-            return ret;
-        }
-        ret = kvm_arm_vcpu_finalize(cs, KVM_ARM_VCPU_SVE);
-        if (ret) {
-            return ret;
-        }
-    }
-
-    /*
-     * KVM reports the exact PSCI version it is implementing via a
-     * special sysreg. If it is present, use its contents to determine
-     * what to report to the guest in the dtb (it is the PSCI version,
-     * in the same 15-bits major 16-bits minor format that PSCI_VERSION
-     * returns).
-     */
-    if (!kvm_get_one_reg(cs, KVM_REG_ARM_PSCI_VERSION, &psciver)) {
-        cpu->psci_version = psciver;
-    }
-
-    /*
-     * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
-     * Currently KVM has its own idea about MPIDR assignment, so we
-     * override our defaults with what we get from KVM.
-     */
-    ret = kvm_get_one_reg(cs, ARM64_SYS_REG(ARM_CPU_ID_MPIDR),
-                          &cpu->mpidr_el1);
-    if (ret) {
-        return ret;
-    }
-
-    kvm_arm_init_debug(cs);
-
-    /* Check whether user space can specify guest syndrome value */
-    kvm_arm_init_serror_injection(cs);
-
-    return kvm_arm_init_cpreg_list(cpu);
-}
-
-int kvm_arch_destroy_vcpu(CPUState *cs)
-{
-    return 0;
-}
-
-bool kvm_arm_reg_syncs_via_cpreg_list(uint64_t regidx)
-{
-    /* Return true if the regidx is a register we should synchronize
-     * via the cpreg_tuples array (ie is not a core or sve reg that
-     * we sync by hand in kvm_arch_get/put_registers())
-     */
-    switch (regidx & KVM_REG_ARM_COPROC_MASK) {
-    case KVM_REG_ARM_CORE:
-    case KVM_REG_ARM64_SVE:
-        return false;
-    default:
-        return true;
-    }
-}
-
-typedef struct CPRegStateLevel {
-    uint64_t regidx;
-    int level;
-} CPRegStateLevel;
-
-/* All system registers not listed in the following table are assumed to be
- * of the level KVM_PUT_RUNTIME_STATE. If a register should be written less
- * often, you must add it to this table with a state of either
- * KVM_PUT_RESET_STATE or KVM_PUT_FULL_STATE.
- */
-static const CPRegStateLevel non_runtime_cpregs[] = {
-    { KVM_REG_ARM_TIMER_CNT, KVM_PUT_FULL_STATE },
-};
-
-int kvm_arm_cpreg_level(uint64_t regidx)
-{
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(non_runtime_cpregs); i++) {
-        const CPRegStateLevel *l = &non_runtime_cpregs[i];
-        if (l->regidx == regidx) {
-            return l->level;
-        }
-    }
-
-    return KVM_PUT_RUNTIME_STATE;
-}
-
-/* Callers must hold the iothread mutex lock */
-static void kvm_inject_arm_sea(CPUState *c)
-{
-    ARMCPU *cpu = ARM_CPU(c);
-    CPUARMState *env = &cpu->env;
-    uint32_t esr;
-    bool same_el;
-
-    c->exception_index = EXCP_DATA_ABORT;
-    env->exception.target_el = 1;
-
-    /*
-     * Set the DFSC to synchronous external abort and set FnV to not valid,
-     * this will tell guest the FAR_ELx is UNKNOWN for this abort.
-     */
-    same_el = arm_current_el(env) == env->exception.target_el;
-    esr = syn_data_abort_no_iss(same_el, 1, 0, 0, 0, 0, 0x10);
-
-    env->exception.syndrome = esr;
-
-    arm_cpu_do_interrupt(c);
-}
-
-#define AARCH64_CORE_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U64 | \
-                 KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
-
-#define AARCH64_SIMD_CORE_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U128 | \
-                 KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
-
-#define AARCH64_SIMD_CTRL_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U32 | \
-                 KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
-
-static int kvm_arch_put_fpsimd(CPUState *cs)
-{
-    CPUARMState *env = &ARM_CPU(cs)->env;
-    struct kvm_one_reg reg;
-    int i, ret;
-
-    for (i = 0; i < 32; i++) {
-        uint64_t *q = aa64_vfp_qreg(env, i);
-#if HOST_BIG_ENDIAN
-        uint64_t fp_val[2] = { q[1], q[0] };
-        reg.addr = (uintptr_t)fp_val;
-#else
-        reg.addr = (uintptr_t)q;
-#endif
-        reg.id = AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]);
-        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
-        if (ret) {
-            return ret;
-        }
-    }
-
-    return 0;
-}
-
-/*
- * KVM SVE registers come in slices where ZREGs have a slice size of 2048 bits
- * and PREGS and the FFR have a slice size of 256 bits. However we simply hard
- * code the slice index to zero for now as it's unlikely we'll need more than
- * one slice for quite some time.
- */
-static int kvm_arch_put_sve(CPUState *cs)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    uint64_t tmp[ARM_MAX_VQ * 2];
-    uint64_t *r;
-    struct kvm_one_reg reg;
-    int n, ret;
-
-    for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; ++n) {
-        r = sve_bswap64(tmp, &env->vfp.zregs[n].d[0], cpu->sve_max_vq * 2);
-        reg.addr = (uintptr_t)r;
-        reg.id = KVM_REG_ARM64_SVE_ZREG(n, 0);
-        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
-        if (ret) {
-            return ret;
-        }
-    }
-
-    for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; ++n) {
-        r = sve_bswap64(tmp, r = &env->vfp.pregs[n].p[0],
-                        DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
-        reg.addr = (uintptr_t)r;
-        reg.id = KVM_REG_ARM64_SVE_PREG(n, 0);
-        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
-        if (ret) {
-            return ret;
-        }
-    }
-
-    r = sve_bswap64(tmp, &env->vfp.pregs[FFR_PRED_NUM].p[0],
-                    DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
-    reg.addr = (uintptr_t)r;
-    reg.id = KVM_REG_ARM64_SVE_FFR(0);
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-
-    return 0;
-}
-
-int kvm_arch_put_registers(CPUState *cs, int level)
-{
-    struct kvm_one_reg reg;
-    uint64_t val;
-    uint32_t fpr;
-    int i, ret;
-    unsigned int el;
-
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    /* If we are in AArch32 mode then we need to copy the AArch32 regs to the
-     * AArch64 registers before pushing them out to 64-bit KVM.
-     */
-    if (!is_a64(env)) {
-        aarch64_sync_32_to_64(env);
-    }
-
-    for (i = 0; i < 31; i++) {
-        reg.id = AARCH64_CORE_REG(regs.regs[i]);
-        reg.addr = (uintptr_t) &env->xregs[i];
-        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
-        if (ret) {
-            return ret;
-        }
-    }
-
-    /* KVM puts SP_EL0 in regs.sp and SP_EL1 in regs.sp_el1. On the
-     * QEMU side we keep the current SP in xregs[31] as well.
-     */
-    aarch64_save_sp(env, 1);
-
-    reg.id = AARCH64_CORE_REG(regs.sp);
-    reg.addr = (uintptr_t) &env->sp_el[0];
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-
-    reg.id = AARCH64_CORE_REG(sp_el1);
-    reg.addr = (uintptr_t) &env->sp_el[1];
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-
-    /* Note that KVM thinks pstate is 64 bit but we use a uint32_t */
-    if (is_a64(env)) {
-        val = pstate_read(env);
-    } else {
-        val = cpsr_read(env);
-    }
-    reg.id = AARCH64_CORE_REG(regs.pstate);
-    reg.addr = (uintptr_t) &val;
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-
-    reg.id = AARCH64_CORE_REG(regs.pc);
-    reg.addr = (uintptr_t) &env->pc;
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-
-    reg.id = AARCH64_CORE_REG(elr_el1);
-    reg.addr = (uintptr_t) &env->elr_el[1];
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-
-    /* Saved Program State Registers
-     *
-     * Before we restore from the banked_spsr[] array we need to
-     * ensure that any modifications to env->spsr are correctly
-     * reflected in the banks.
-     */
-    el = arm_current_el(env);
-    if (el > 0 && !is_a64(env)) {
-        i = bank_number(env->uncached_cpsr & CPSR_M);
-        env->banked_spsr[i] = env->spsr;
-    }
-
-    /* KVM 0-4 map to QEMU banks 1-5 */
-    for (i = 0; i < KVM_NR_SPSR; i++) {
-        reg.id = AARCH64_CORE_REG(spsr[i]);
-        reg.addr = (uintptr_t) &env->banked_spsr[i + 1];
-        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
-        if (ret) {
-            return ret;
-        }
-    }
-
-    if (cpu_isar_feature(aa64_sve, cpu)) {
-        ret = kvm_arch_put_sve(cs);
-    } else {
-        ret = kvm_arch_put_fpsimd(cs);
-    }
-    if (ret) {
-        return ret;
-    }
-
-    reg.addr = (uintptr_t)(&fpr);
-    fpr = vfp_get_fpsr(env);
-    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-
-    reg.addr = (uintptr_t)(&fpr);
-    fpr = vfp_get_fpcr(env);
-    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-
-    write_cpustate_to_list(cpu, true);
-
-    if (!write_list_to_kvmstate(cpu, level)) {
-        return -EINVAL;
-    }
-
-   /*
-    * Setting VCPU events should be triggered after syncing the registers
-    * to avoid overwriting potential changes made by KVM upon calling
-    * KVM_SET_VCPU_EVENTS ioctl
-    */
-    ret = kvm_put_vcpu_events(cpu);
-    if (ret) {
-        return ret;
-    }
-
-    kvm_arm_sync_mpstate_to_kvm(cpu);
-
-    return ret;
-}
-
-static int kvm_arch_get_fpsimd(CPUState *cs)
-{
-    CPUARMState *env = &ARM_CPU(cs)->env;
-    struct kvm_one_reg reg;
-    int i, ret;
-
-    for (i = 0; i < 32; i++) {
-        uint64_t *q = aa64_vfp_qreg(env, i);
-        reg.id = AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]);
-        reg.addr = (uintptr_t)q;
-        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
-        if (ret) {
-            return ret;
-        } else {
-#if HOST_BIG_ENDIAN
-            uint64_t t;
-            t = q[0], q[0] = q[1], q[1] = t;
-#endif
-        }
-    }
-
-    return 0;
-}
-
-/*
- * KVM SVE registers come in slices where ZREGs have a slice size of 2048 bits
- * and PREGS and the FFR have a slice size of 256 bits. However we simply hard
- * code the slice index to zero for now as it's unlikely we'll need more than
- * one slice for quite some time.
- */
-static int kvm_arch_get_sve(CPUState *cs)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    struct kvm_one_reg reg;
-    uint64_t *r;
-    int n, ret;
-
-    for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; ++n) {
-        r = &env->vfp.zregs[n].d[0];
-        reg.addr = (uintptr_t)r;
-        reg.id = KVM_REG_ARM64_SVE_ZREG(n, 0);
-        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
-        if (ret) {
-            return ret;
-        }
-        sve_bswap64(r, r, cpu->sve_max_vq * 2);
-    }
-
-    for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; ++n) {
-        r = &env->vfp.pregs[n].p[0];
-        reg.addr = (uintptr_t)r;
-        reg.id = KVM_REG_ARM64_SVE_PREG(n, 0);
-        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
-        if (ret) {
-            return ret;
-        }
-        sve_bswap64(r, r, DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
-    }
-
-    r = &env->vfp.pregs[FFR_PRED_NUM].p[0];
-    reg.addr = (uintptr_t)r;
-    reg.id = KVM_REG_ARM64_SVE_FFR(0);
-    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-    sve_bswap64(r, r, DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
-
-    return 0;
-}
-
-int kvm_arch_get_registers(CPUState *cs)
-{
-    struct kvm_one_reg reg;
-    uint64_t val;
-    unsigned int el;
-    uint32_t fpr;
-    int i, ret;
-
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    for (i = 0; i < 31; i++) {
-        reg.id = AARCH64_CORE_REG(regs.regs[i]);
-        reg.addr = (uintptr_t) &env->xregs[i];
-        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
-        if (ret) {
-            return ret;
-        }
-    }
-
-    reg.id = AARCH64_CORE_REG(regs.sp);
-    reg.addr = (uintptr_t) &env->sp_el[0];
-    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-
-    reg.id = AARCH64_CORE_REG(sp_el1);
-    reg.addr = (uintptr_t) &env->sp_el[1];
-    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-
-    reg.id = AARCH64_CORE_REG(regs.pstate);
-    reg.addr = (uintptr_t) &val;
-    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-
-    env->aarch64 = ((val & PSTATE_nRW) == 0);
-    if (is_a64(env)) {
-        pstate_write(env, val);
-    } else {
-        cpsr_write(env, val, 0xffffffff, CPSRWriteRaw);
-    }
-
-    /* KVM puts SP_EL0 in regs.sp and SP_EL1 in regs.sp_el1. On the
-     * QEMU side we keep the current SP in xregs[31] as well.
-     */
-    aarch64_restore_sp(env, 1);
-
-    reg.id = AARCH64_CORE_REG(regs.pc);
-    reg.addr = (uintptr_t) &env->pc;
-    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-
-    /* If we are in AArch32 mode then we need to sync the AArch32 regs with the
-     * incoming AArch64 regs received from 64-bit KVM.
-     * We must perform this after all of the registers have been acquired from
-     * the kernel.
-     */
-    if (!is_a64(env)) {
-        aarch64_sync_64_to_32(env);
-    }
-
-    reg.id = AARCH64_CORE_REG(elr_el1);
-    reg.addr = (uintptr_t) &env->elr_el[1];
-    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-
-    /* Fetch the SPSR registers
-     *
-     * KVM SPSRs 0-4 map to QEMU banks 1-5
-     */
-    for (i = 0; i < KVM_NR_SPSR; i++) {
-        reg.id = AARCH64_CORE_REG(spsr[i]);
-        reg.addr = (uintptr_t) &env->banked_spsr[i + 1];
-        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
-        if (ret) {
-            return ret;
-        }
-    }
-
-    el = arm_current_el(env);
-    if (el > 0 && !is_a64(env)) {
-        i = bank_number(env->uncached_cpsr & CPSR_M);
-        env->spsr = env->banked_spsr[i];
-    }
-
-    if (cpu_isar_feature(aa64_sve, cpu)) {
-        ret = kvm_arch_get_sve(cs);
-    } else {
-        ret = kvm_arch_get_fpsimd(cs);
-    }
-    if (ret) {
-        return ret;
-    }
-
-    reg.addr = (uintptr_t)(&fpr);
-    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
-    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-    vfp_set_fpsr(env, fpr);
-
-    reg.addr = (uintptr_t)(&fpr);
-    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
-    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-    vfp_set_fpcr(env, fpr);
-
-    ret = kvm_get_vcpu_events(cpu);
-    if (ret) {
-        return ret;
-    }
-
-    if (!write_kvmstate_to_list(cpu)) {
-        return -EINVAL;
-    }
-    /* Note that it's OK to have registers which aren't in CPUState,
-     * so we can ignore a failure return here.
-     */
-    write_list_to_cpustate(cpu);
-
-    kvm_arm_sync_mpstate_to_qemu(cpu);
-
-    /* TODO: other registers */
-    return ret;
-}
-
-void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
-{
-    ram_addr_t ram_addr;
-    hwaddr paddr;
-
-    assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
-
-    if (acpi_ghes_present() && addr) {
-        ram_addr = qemu_ram_addr_from_host(addr);
-        if (ram_addr != RAM_ADDR_INVALID &&
-            kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
-            kvm_hwpoison_page_add(ram_addr);
-            /*
-             * If this is a BUS_MCEERR_AR, we know we have been called
-             * synchronously from the vCPU thread, so we can easily
-             * synchronize the state and inject an error.
-             *
-             * TODO: we currently don't tell the guest at all about
-             * BUS_MCEERR_AO. In that case we might either be being
-             * called synchronously from the vCPU thread, or a bit
-             * later from the main thread, so doing the injection of
-             * the error would be more complicated.
-             */
-            if (code == BUS_MCEERR_AR) {
-                kvm_cpu_synchronize_state(c);
-                if (!acpi_ghes_record_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
-                    kvm_inject_arm_sea(c);
-                } else {
-                    error_report("failed to record the error");
-                    abort();
-                }
-            }
-            return;
-        }
-        if (code == BUS_MCEERR_AO) {
-            error_report("Hardware memory error at addr %p for memory used by "
-                "QEMU itself instead of guest system!", addr);
-        }
-    }
-
-    if (code == BUS_MCEERR_AR) {
-        error_report("Hardware memory error!");
-        exit(1);
-    }
-}
-
-/* C6.6.29 BRK instruction */
-static const uint32_t brk_insn = 0xd4200000;
-
-int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
-{
-    if (have_guest_debug) {
-        if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 0) ||
-            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4, 1)) {
-            return -EINVAL;
-        }
-        return 0;
-    } else {
-        error_report("guest debug not supported on this kernel");
-        return -EINVAL;
-    }
-}
-
-int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
-{
-    static uint32_t brk;
-
-    if (have_guest_debug) {
-        if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk, 4, 0) ||
-            brk != brk_insn ||
-            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 1)) {
-            return -EINVAL;
-        }
-        return 0;
-    } else {
-        error_report("guest debug not supported on this kernel");
-        return -EINVAL;
-    }
-}
-
-/* See v8 ARM ARM D7.2.27 ESR_ELx, Exception Syndrome Register
- *
- * To minimise translating between kernel and user-space the kernel
- * ABI just provides user-space with the full exception syndrome
- * register value to be decoded in QEMU.
- */
-
-bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
-{
-    int hsr_ec = syn_get_ec(debug_exit->hsr);
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    /* Ensure PC is synchronised */
-    kvm_cpu_synchronize_state(cs);
-
-    switch (hsr_ec) {
-    case EC_SOFTWARESTEP:
-        if (cs->singlestep_enabled) {
-            return true;
-        } else {
-            /*
-             * The kernel should have suppressed the guest's ability to
-             * single step at this point so something has gone wrong.
-             */
-            error_report("%s: guest single-step while debugging unsupported"
-                         " (%"PRIx64", %"PRIx32")",
-                         __func__, env->pc, debug_exit->hsr);
-            return false;
-        }
-        break;
-    case EC_AA64_BKPT:
-        if (kvm_find_sw_breakpoint(cs, env->pc)) {
-            return true;
-        }
-        break;
-    case EC_BREAKPOINT:
-        if (find_hw_breakpoint(cs, env->pc)) {
-            return true;
-        }
-        break;
-    case EC_WATCHPOINT:
-    {
-        CPUWatchpoint *wp = find_hw_watchpoint(cs, debug_exit->far);
-        if (wp) {
-            cs->watchpoint_hit = wp;
-            return true;
-        }
-        break;
-    }
-    default:
-        error_report("%s: unhandled debug exit (%"PRIx32", %"PRIx64")",
-                     __func__, debug_exit->hsr, env->pc);
-    }
-
-    /* If we are not handling the debug exception it must belong to
-     * the guest. Let's re-use the existing TCG interrupt code to set
-     * everything up properly.
-     */
-    cs->exception_index = EXCP_BKPT;
-    env->exception.syndrome = debug_exit->hsr;
-    env->exception.vaddress = debug_exit->far;
-    env->exception.target_el = 1;
-    qemu_mutex_lock_iothread();
-    arm_cpu_do_interrupt(cs);
-    qemu_mutex_unlock_iothread();
-
-    return false;
-}
-
-#define ARM64_REG_ESR_EL1 ARM64_SYS_REG(3, 0, 5, 2, 0)
-#define ARM64_REG_TCR_EL1 ARM64_SYS_REG(3, 0, 2, 0, 2)
-
-/*
- * ESR_EL1
- * ISS encoding
- * AARCH64: DFSC,   bits [5:0]
- * AARCH32:
- *      TTBCR.EAE == 0
- *          FS[4]   - DFSR[10]
- *          FS[3:0] - DFSR[3:0]
- *      TTBCR.EAE == 1
- *          FS, bits [5:0]
- */
-#define ESR_DFSC(aarch64, lpae, v)        \
-    ((aarch64 || (lpae)) ? ((v) & 0x3F)   \
-               : (((v) >> 6) | ((v) & 0x1F)))
-
-#define ESR_DFSC_EXTABT(aarch64, lpae) \
-    ((aarch64) ? 0x10 : (lpae) ? 0x10 : 0x8)
-
-bool kvm_arm_verify_ext_dabt_pending(CPUState *cs)
-{
-    uint64_t dfsr_val;
-
-    if (!kvm_get_one_reg(cs, ARM64_REG_ESR_EL1, &dfsr_val)) {
-        ARMCPU *cpu = ARM_CPU(cs);
-        CPUARMState *env = &cpu->env;
-        int aarch64_mode = arm_feature(env, ARM_FEATURE_AARCH64);
-        int lpae = 0;
-
-        if (!aarch64_mode) {
-            uint64_t ttbcr;
-
-            if (!kvm_get_one_reg(cs, ARM64_REG_TCR_EL1, &ttbcr)) {
-                lpae = arm_feature(env, ARM_FEATURE_LPAE)
-                        && (ttbcr & TTBCR_EAE);
-            }
-        }
-        /*
-         * The verification here is based on the DFSC bits
-         * of the ESR_EL1 reg only
-         */
-         return (ESR_DFSC(aarch64_mode, lpae, dfsr_val) ==
-                ESR_DFSC_EXTABT(aarch64_mode, lpae));
-    }
-    return false;
-}
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 87e911b27f..f6c96ec184 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -40,7 +40,7 @@ arm_ss.add(files(
 ))
 arm_ss.add(zlib)
 
-arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
+arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
-- 
2.34.1


