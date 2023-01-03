Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B691A65C5ED
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:18:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrc-0000B3-Ud; Tue, 03 Jan 2023 13:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClr3-0008KI-LA
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:42 -0500
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClr1-0005Ez-EC
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:41 -0500
Received: by mail-vs1-xe2e.google.com with SMTP id s127so18615874vsb.5
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jHRFXnO9//MOeiq7qjJkKcDR9svz35fK7EmJ2XSeXDU=;
 b=gyNggrmqP7Y3wY8gBDJjpNvUmy2ZFqhl2pmnsUxTLFY+JFgSc0q4bT2YAsQ0ZaYTCo
 SwORgFaUwRK7K3bq4nS+aT+KeZ1Lk8V9C/3FeMG3ZVXYA2JrsIvtOWvkbPUTRCj9drfe
 bYSP21bFtl+1LNwbARVQRpDyBz5Cb496+1E46B+VkrIz1m845f4xDyy1mAFDJQyOUm7l
 Zl+OfY+xFXxd4S8LtQFiAcbpZkjSY/9YJw7spOp3ngmO3Xlsi/7P2maH9NQGQ5gomiTx
 NPAycoQNN6jPcR04p9xrTTghTB9G+4MFK7uw31Vfr0OuMAM1HacRac1mBGGHIMioCRpn
 Jjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jHRFXnO9//MOeiq7qjJkKcDR9svz35fK7EmJ2XSeXDU=;
 b=DeBu4sSeusUqTdDEjTSqD2UrMvryuG3iUP6ECjO/DvQXuegfs4SwAJyU2aLGiQi7MK
 4QUH9UVnR/47kI8ZLTfq/FQbxDwjp2nmImKE25DxB9/VKmEp+K3tQe97YV/kUILAxznw
 eIuuJezAss9ZCJMnjoq5eMFFviafF1zZ90BSImCK+1fJWnBDaF9wmsmRGu0AtN4IHL4t
 DZX/hvrIAmlBnhRKMth8VTrDOqQdPXb6lD0IjsIyR4lsvs5MmY9DKPgk6auMm+xLTQoO
 8wnOPHUBhdKRzW/jirbkW3ylHPnuI/3PeYTiuyfBzjosJsm7h/P8o/dlEEFaT+bPUY2E
 ZYLA==
X-Gm-Message-State: AFqh2kpAzdjIXHwCNtNG0ek1HOkstw7nsZRPdJSta5+TO91RDIfBH/K7
 JoXnyXv3p34+RCeaGY6uLTmnPk10+f+YNnECPhQ=
X-Google-Smtp-Source: AMrXdXuxftBVFd00nRvTlKMeBdgaQ+74BbEBZKBpbG7uZlF3N86YrkwZ30pa+l+eSIQFbtzkIVT9+g==
X-Received: by 2002:a05:6102:a87:b0:3b1:4cea:cd4a with SMTP id
 n7-20020a0561020a8700b003b14ceacd4amr19789689vsg.17.1672769857130; 
 Tue, 03 Jan 2023 10:17:37 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:17:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 16/40] target/arm: Represent the entire MPIDR_EL1
Date: Tue,  3 Jan 2023 10:16:22 -0800
Message-Id: <20230103181646.55711-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe2e.google.com
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

Replace ARMCPU.mp_affinity with CPUARMState.cp15.mpidr_el1,
setting the additional bits as required.  In particular,
always set the U bit when there is only one cpu in the system.
Remove the mp_is_up bit which attempted to do the same thing.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     |  7 ++--
 target/arm/cpu.c     | 80 +++++++++++++++++++++++++++++++++++++-------
 target/arm/cpu_tcg.c |  1 -
 target/arm/helper.c  | 25 ++------------
 target/arm/hvf/hvf.c |  2 +-
 target/arm/kvm64.c   |  4 +--
 6 files changed, 75 insertions(+), 44 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 499d2a6028..0c5b942ed0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -935,9 +935,6 @@ struct ArchCPU {
     /* KVM steal time */
     OnOffAuto kvm_steal_time;
 
-    /* Uniprocessor system with MP extensions */
-    bool mp_is_up;
-
     /* True if we tried kvm_arm_host_cpu_features() during CPU instance_init
      * and the probe failed (so we need to report the error in realize)
      */
@@ -977,7 +974,7 @@ struct ArchCPU {
     uint64_t id_aa64afr0;
     uint64_t id_aa64afr1;
     uint64_t clidr;
-    uint64_t mp_affinity; /* MP ID without feature bits */
+    uint64_t mpidr_el1;
     /* The elements of this array are the CCSIDR values for each cache,
      * in the order L1DCache, L1ICache, L2DCache, L2ICache, etc.
      */
@@ -1041,7 +1038,7 @@ uint64_t arm_build_mp_affinity(int idx, uint8_t clustersz);
 
 static inline uint64_t arm_cpu_mp_affinity(ARMCPU *cpu)
 {
-    return cpu->mp_affinity;
+    return cpu->mpidr_el1 & ARM64_AFFINITY_MASK;
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a104a77165..a46fa424d3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1231,6 +1231,9 @@ static void arm_cpu_initfn(Object *obj)
     cpu->sme_default_vq = 2;
 # endif
 #else
+    /* To be set properly by either the board or by realize. */
+    cpu->mpidr_el1 = ARM64_AFFINITY_INVALID;
+
     /* Our inbound IRQ and FIQ lines */
     if (kvm_enabled()) {
         /* VIRQ and VFIQ are unused with KVM but we add them to maintain
@@ -1921,16 +1924,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    /* This cpu-id-to-MPIDR affinity is used only for TCG; KVM will override it.
-     * We don't support setting cluster ID ([16..23]) (known as Aff2
-     * in later ARM ARM versions), or any of the higher affinity level fields,
-     * so these bits always RAZ.
-     */
-    if (cpu->mp_affinity == ARM64_AFFINITY_INVALID) {
-        cpu->mp_affinity = arm_build_mp_affinity(cs->cpu_index,
-                                                 ARM_DEFAULT_CPUS_PER_CLUSTER);
-    }
-
     if (cpu->reset_hivecs) {
             cpu->reset_sctlr |= (1 << 13);
     }
@@ -2116,7 +2109,27 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     if (cpu->core_count == -1) {
         cpu->core_count = smp_cpus;
     }
-#endif
+
+    /*
+     * Provide a default cpu-id-to-MPIDR affinity; we don't support setting
+     * Aff2 or Aff3.  This has already set by KVM and by some board models,
+     * which will have cleared our internal invalid bit.
+     */
+    if (cpu->mpidr_el1 == ARM64_AFFINITY_INVALID) {
+        assert(!kvm_enabled());
+        assert(cs->cpu_index < 256 * ARM_DEFAULT_CPUS_PER_CLUSTER);
+        cpu->mpidr_el1 = arm_build_mp_affinity(cs->cpu_index,
+                                               ARM_DEFAULT_CPUS_PER_CLUSTER);
+    }
+#endif /* !CONFIG_USER_ONLY */
+
+    /* Linux exposes M to userland, so still need to set it for user-only. */
+    if (arm_feature(env, ARM_FEATURE_V7MP)) {
+        cpu->mpidr_el1 |= (1u << 31);   /* M */
+        if (cpu->core_count == 1) {
+            cpu->mpidr_el1 |= 1 << 30;  /* U */
+        }
+    }
 
     if (tcg_enabled()) {
         int dcz_blocklen = 4 << cpu->dcz_blocksize;
@@ -2176,10 +2189,47 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
+static void cpu_arm_set_mp_affinity(Object *obj, Visitor *v, const char *name,
+                                    void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    CPUARMState *env = &cpu->env;
+    uint64_t value;
+
+    if (!visit_type_uint64(v, name, &value, errp)) {
+        return;
+    }
+
+    if (arm_feature(env, ARM_FEATURE_AARCH64)) {
+        value &= ARM64_AFFINITY_MASK;
+    } else {
+        value &= ARM32_AFFINITY_MASK;
+    }
+    if (cpu->mpidr_el1 == ARM64_AFFINITY_INVALID) {
+        cpu->mpidr_el1 = value;
+    } else {
+        cpu->mpidr_el1 &= ~ARM64_AFFINITY_MASK;
+        cpu->mpidr_el1 |= value;
+    }
+}
+
+static void cpu_arm_get_mp_affinity(Object *obj, Visitor *v, const char *name,
+                                    void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint64_t value;
+
+    /*
+     * Note that the arm64 mask is a superset of the arm32 mask,
+     * and we will have limited the value upon setting.
+     * Here we simply want to return the Aff[0-3] fields.
+     */
+    value = cpu->mpidr_el1 & ARM64_AFFINITY_MASK;
+    visit_type_uint64(v, name, &value, errp);
+}
+
 static Property arm_cpu_properties[] = {
     DEFINE_PROP_UINT64("midr", ARMCPU, midr, 0),
-    DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
-                        mp_affinity, ARM64_AFFINITY_INVALID),
     DEFINE_PROP_INT32("node-id", ARMCPU, node_id, CPU_UNSET_NUMA_NODE_ID),
     DEFINE_PROP_INT32("core-count", ARMCPU, core_count, -1),
     DEFINE_PROP_END_OF_LIST()
@@ -2244,6 +2294,10 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 
     device_class_set_props(dc, arm_cpu_properties);
 
+    object_class_property_add(oc, "mp-affinity", "uint64",
+                              cpu_arm_get_mp_affinity,
+                              cpu_arm_set_mp_affinity, NULL, NULL);
+
     resettable_class_set_parent_phases(rc, NULL, arm_cpu_reset_hold, NULL,
                                        &acc->parent_phases);
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index d566a815d3..7514065d5b 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -848,7 +848,6 @@ static void cortex_r5_initfn(Object *obj)
     cpu->isar.id_isar4 = 0x0010142;
     cpu->isar.id_isar5 = 0x0;
     cpu->isar.id_isar6 = 0x0;
-    cpu->mp_is_up = true;
     cpu->pmsav7_dregion = 16;
     cpu->isar.reset_pmcr_el0 = 0x41151800;
     define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index bac2ea62c4..8f5097f995 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4087,24 +4087,6 @@ static uint64_t midr_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return raw_read(env, ri);
 }
 
-static uint64_t mpidr_read_val(CPUARMState *env)
-{
-    ARMCPU *cpu = env_archcpu(env);
-    uint64_t mpidr = cpu->mp_affinity;
-
-    if (arm_feature(env, ARM_FEATURE_V7MP)) {
-        mpidr |= (1U << 31);
-        /* Cores which are uniprocessor (non-coherent)
-         * but still implement the MP extensions set
-         * bit 30. (For instance, Cortex-R5).
-         */
-        if (cpu->mp_is_up) {
-            mpidr |= (1u << 30);
-        }
-    }
-    return mpidr;
-}
-
 static uint64_t mpidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     unsigned int cur_el = arm_current_el(env);
@@ -4112,7 +4094,7 @@ static uint64_t mpidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
     if (arm_is_el2_enabled(env) && cur_el == 1) {
         return env->cp15.vmpidr_el2;
     }
-    return mpidr_read_val(env);
+    return env_archcpu(env)->mpidr_el1;
 }
 
 static const ARMCPRegInfo lpae_cp_reginfo[] = {
@@ -7940,7 +7922,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (arm_feature(env, ARM_FEATURE_EL2)
         || (arm_feature(env, ARM_FEATURE_EL3)
             && arm_feature(env, ARM_FEATURE_V8))) {
-        uint64_t vmpidr_def = mpidr_read_val(env);
         ARMCPRegInfo vpidr_regs[] = {
             { .name = "VPIDR", .state = ARM_CP_STATE_AA32,
               .cp = 15, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 0,
@@ -7956,12 +7937,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "VMPIDR", .state = ARM_CP_STATE_AA32,
               .cp = 15, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 5,
               .access = PL2_RW, .accessfn = access_el3_aa32ns,
-              .resetvalue = vmpidr_def,
+              .resetvalue = cpu->mpidr_el1,
               .type = ARM_CP_ALIAS | ARM_CP_EL3_NO_EL2_C_NZ,
               .fieldoffset = offsetoflow32(CPUARMState, cp15.vmpidr_el2) },
             { .name = "VMPIDR_EL2", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 5,
-              .access = PL2_RW, .resetvalue = vmpidr_def,
+              .access = PL2_RW, .resetvalue = cpu->mpidr_el1,
               .type = ARM_CP_EL3_NO_EL2_C_NZ,
               .fieldoffset = offsetof(CPUARMState, cp15.vmpidr_el2) },
         };
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index e0ba91f5c6..278a4b2ede 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -607,7 +607,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     assert_hvf_ok(ret);
 
     ret = hv_vcpu_set_sys_reg(cpu->hvf->fd, HV_SYS_REG_MPIDR_EL1,
-                              arm_cpu->mp_affinity);
+                              arm_cpu->mpidr_el1);
     assert_hvf_ok(ret);
 
     ret = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_ID_AA64PFR0_EL1, &pfr);
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 1197253d12..2cdd7517b8 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -914,11 +914,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
      * Currently KVM has its own idea about MPIDR assignment, so we
      * override our defaults with what we get from KVM.
      */
-    ret = kvm_get_one_reg(cs, ARM64_SYS_REG(ARM_CPU_ID_MPIDR), &mpidr);
+    ret = kvm_get_one_reg(cs, ARM64_SYS_REG(ARM_CPU_ID_MPIDR),
+                          &cpu->mpidr_el1);
     if (ret) {
         return ret;
     }
-    cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
 
     kvm_arm_init_debug(cs);
 
-- 
2.34.1


