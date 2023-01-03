Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4057765C61F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:25:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrd-0000DM-Jz; Tue, 03 Jan 2023 13:18:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrP-0008Os-Iw
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:10 -0500
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrM-0005IB-8g
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:02 -0500
Received: by mail-vk1-xa2f.google.com with SMTP id 6so15693479vkz.0
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/jTn1GxLrxhP97RklVZOWNe5snNH2L7l/ITGnN9gIBg=;
 b=SeY7fHclwugtpZzK/CFvRn4e6R915X/8lxcuXlILBpWBNZsnwx7VmXMLiK+Prx2U3Q
 rAoQn2uGq5uCx6wtmbq9PZKU1EHf9mD45KoiB19Nbf+PXHkJyF7vHi7W7BaFg9eKBurY
 sDJkYvrV4yPI1SdGG72uu14bkpMdIGdc+TxyI6rGxdLiFK+NVhPPEBBbSggGQnEJD222
 XTNLgflbxpiluMcZF++Li2C7Lf3Twy8OZQ+wUr3SNLfexAB+KxNKk8pSB1Q96JXBkrbn
 IRz2+iPNc5L3fb3/ewZsunYCqbU11MB10zG17/nvC7aYC4vcV/cwb1aUD61ptcoE7wlE
 l1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/jTn1GxLrxhP97RklVZOWNe5snNH2L7l/ITGnN9gIBg=;
 b=e+R49hPyOslyP5Uj60ZW3j0KN3jWZ0kJs80RuGkQfbFnYF/p/ZlAZXlO6P2Iv93LkH
 IYsL05pXmzBKHZANef/ZyjK0UNiJX7zJCeMmlekgdWHpQTpCWbyTEgWHfRyd+7cNh7rE
 FOQlhnlB2fx/i4ksUQC2Jc5alDz2vI7rrRc8F+G6obYRBBJ2RAuL3d18osnihe3Dy5Ax
 ayaHuRi0fDqoZOvNeo8fQQ4/5+Gq3wxvpzaEM55Br/IjiuX9vMxLjSqLuO55gUlxBOT5
 pB7wVYW5uHw7YZRcQsFFo6LvY8nuN7otZTq4earuBSwuqRCx2WdFIZ+5OkuhqCsXbtCK
 yl/Q==
X-Gm-Message-State: AFqh2kpLVB30PTUeW2Tqp7xuFypGFURmHT5uugHFu5vGiF+3D22tLduv
 QRW/YzEOXGwLolov4y+F6AYFoHBQ+unmZLKf9sc=
X-Google-Smtp-Source: AMrXdXv3GUBf63Je2YGCIdmyx13dr+lKXOYhnUd44m32kW4Z06DA6g9YQ/6c684KXnsWr42SwbPzCQ==
X-Received: by 2002:a1f:e284:0:b0:3d1:f1f1:b946 with SMTP id
 z126-20020a1fe284000000b003d1f1f1b946mr16211418vkg.6.1672769879073; 
 Tue, 03 Jan 2023 10:17:59 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:17:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 23/40] target/arm: Probe KVM host into ARMCPUClass
Date: Tue,  3 Jan 2023 10:16:29 -0800
Message-Id: <20230103181646.55711-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa2f.google.com
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

We can now store these values into ARMCPUClass instead of into
a temporary ARMHostCPUFeatures structure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm_arm.h |  14 ++---
 target/arm/cpu64.c   |  18 +++++--
 target/arm/kvm.c     | 119 +++++++++++++++++--------------------------
 3 files changed, 69 insertions(+), 82 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 8efbe0cc4b..d426e24c53 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -140,13 +140,15 @@ void kvm_arm_destroy_scratch_host_vcpu(int *fdarray);
 uint32_t kvm_arm_sve_get_vls(CPUState *cs);
 
 /**
- * kvm_arm_set_cpu_features_from_host:
- * @cpu: ARMCPU to set the features for
+ * kvm_arm_get_host_cpu_features:
+ * @acc: ARMCPUClass to fill in
  *
- * Set up the ARMCPU struct fields up to match the information probed
- * from the host CPU.
+ * Probe the capabilities of the host kernel's preferred CPU and fill
+ * in the ARMCPUClass struct accordingly.
+ *
+ * Returns true on success and false otherwise.
  */
-void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
+bool kvm_arm_get_host_cpu_features(ARMCPUClass *acc, Error **errp);
 
 /**
  * kvm_arm_add_vcpu_properties:
@@ -245,7 +247,7 @@ static inline bool kvm_arm_steal_time_supported(void)
 /*
  * These functions should never actually be called without KVM support.
  */
-static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
+static inline bool kvm_arm_get_host_cpu_features(ARMCPUClass *c, Error **e)
 {
     g_assert_not_reached();
 }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 75a88f9deb..a21bc39449 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1105,11 +1105,21 @@ static void aarch64_host_class_init(ARMCPUClass *acc)
     set_class_feature(acc, ARM_FEATURE_PMU);
 }
 
+static bool aarch64_host_class_late_init(ARMCPUClass *acc, Error **errp)
+{
+    if (kvm_enabled()) {
+        return kvm_arm_get_host_cpu_features(acc, errp);
+    }
+    if (hvf_enabled()) {
+        return true;
+    }
+    error_setg(errp, "The 'host' CPU type can only be used with KVM or HVF");
+    return false;
+}
+
 static void aarch64_host_object_init(Object *obj)
 {
 #if defined(CONFIG_KVM)
-    ARMCPU *cpu = ARM_CPU(obj);
-    kvm_arm_set_cpu_features_from_host(cpu);
     aarch64_add_sve_properties(obj);
     aarch64_add_pauth_properties(obj);
 #elif defined(CONFIG_HVF)
@@ -1134,7 +1144,8 @@ static bool aarch64_max_class_late_init(ARMCPUClass *cpu, Error **errp)
     uint32_t u;
 
     if (kvm_enabled() || hvf_enabled()) {
-        return true;
+        /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
+        return aarch64_host_class_late_init(cpu, errp);
     }
 
     /*
@@ -1341,6 +1352,7 @@ static const ARMCPUInfo aarch64_cpus[] = {
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     { .name = "host",
       .class_init = aarch64_host_class_init,
+      .class_late_init = aarch64_host_class_late_init,
       .object_init = aarch64_host_object_init },
 #endif
 };
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index ac164a6130..85971df07c 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -44,17 +44,6 @@ static bool cap_has_mp_state;
 static bool cap_has_inject_serror_esr;
 static bool cap_has_inject_ext_dabt;
 
-/**
- * ARMHostCPUFeatures: information about the host CPU (identified
- * by asking the host kernel)
- */
-typedef struct ARMHostCPUFeatures {
-    ARMISARegisters isar;
-    uint32_t target;
-} ARMHostCPUFeatures;
-
-static ARMHostCPUFeatures arm_host_cpu_features;
-
 /**
  * kvm_arm_vcpu_init:
  * @cs: CPUState
@@ -1548,14 +1537,14 @@ static bool kvm_arm_pauth_supported(void)
 
 /**
  * kvm_arm_get_host_cpu_features:
- * @ahcf: ARMHostCPUClass to fill in
+ * @acc: ARMCPUClass to fill in
  *
  * Probe the capabilities of the host kernel's preferred CPU and fill
- * in the ARMHostCPUClass struct accordingly.
+ * in the ARMCPUClass struct accordingly.
  *
  * Returns true on success and false otherwise.
  */
-static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
+bool kvm_arm_get_host_cpu_features(ARMCPUClass *acc, Error **errp)
 {
     /* Identify the feature bits corresponding to the host CPU, and
      * fill out the ARMHostCPUClass fields accordingly. To do this
@@ -1608,12 +1597,14 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     }
 
     if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
+        error_setg_errno(errp, "Failed to create host vcpu");
+        acc->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
         return false;
     }
 
-    ahcf->target = init.target;
+    acc->kvm_target = init.target;
 
-    err = read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr0,
+    err = read_sys_reg64(fdarray[2], &acc->isar.id_aa64pfr0,
                          ARM64_SYS_REG(3, 0, 0, 4, 0));
     if (unlikely(err < 0)) {
         /*
@@ -1632,26 +1623,26 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
          * ??? Either of these sounds like too much effort just
          *     to work around running a modern host kernel.
          */
-        ahcf->isar.id_aa64pfr0 = 0x00000011; /* EL1&0, AArch64 only */
+        acc->isar.id_aa64pfr0 = 0x00000011; /* EL1&0, AArch64 only */
         err = 0;
     } else {
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr1,
+        err |= read_sys_reg64(fdarray[2], &acc->isar.id_aa64pfr1,
                               ARM64_SYS_REG(3, 0, 0, 4, 1));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64smfr0,
+        err |= read_sys_reg64(fdarray[2], &acc->isar.id_aa64smfr0,
                               ARM64_SYS_REG(3, 0, 0, 4, 5));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr0,
+        err |= read_sys_reg64(fdarray[2], &acc->isar.id_aa64dfr0,
                               ARM64_SYS_REG(3, 0, 0, 5, 0));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr1,
+        err |= read_sys_reg64(fdarray[2], &acc->isar.id_aa64dfr1,
                               ARM64_SYS_REG(3, 0, 0, 5, 1));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar0,
+        err |= read_sys_reg64(fdarray[2], &acc->isar.id_aa64isar0,
                               ARM64_SYS_REG(3, 0, 0, 6, 0));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar1,
+        err |= read_sys_reg64(fdarray[2], &acc->isar.id_aa64isar1,
                               ARM64_SYS_REG(3, 0, 0, 6, 1));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr0,
+        err |= read_sys_reg64(fdarray[2], &acc->isar.id_aa64mmfr0,
                               ARM64_SYS_REG(3, 0, 0, 7, 0));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr1,
+        err |= read_sys_reg64(fdarray[2], &acc->isar.id_aa64mmfr1,
                               ARM64_SYS_REG(3, 0, 0, 7, 1));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr2,
+        err |= read_sys_reg64(fdarray[2], &acc->isar.id_aa64mmfr2,
                               ARM64_SYS_REG(3, 0, 0, 7, 2));
 
         /*
@@ -1661,48 +1652,48 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
          * than skipping the reads and leaving 0, as we must avoid
          * considering the values in every case.
          */
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr0,
+        err |= read_sys_reg32(fdarray[2], &acc->isar.id_pfr0,
                               ARM64_SYS_REG(3, 0, 0, 1, 0));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr1,
+        err |= read_sys_reg32(fdarray[2], &acc->isar.id_pfr1,
                               ARM64_SYS_REG(3, 0, 0, 1, 1));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_dfr0,
+        err |= read_sys_reg32(fdarray[2], &acc->isar.id_dfr0,
                               ARM64_SYS_REG(3, 0, 0, 1, 2));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr0,
+        err |= read_sys_reg32(fdarray[2], &acc->isar.id_mmfr0,
                               ARM64_SYS_REG(3, 0, 0, 1, 4));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr1,
+        err |= read_sys_reg32(fdarray[2], &acc->isar.id_mmfr1,
                               ARM64_SYS_REG(3, 0, 0, 1, 5));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr2,
+        err |= read_sys_reg32(fdarray[2], &acc->isar.id_mmfr2,
                               ARM64_SYS_REG(3, 0, 0, 1, 6));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr3,
+        err |= read_sys_reg32(fdarray[2], &acc->isar.id_mmfr3,
                               ARM64_SYS_REG(3, 0, 0, 1, 7));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar0,
+        err |= read_sys_reg32(fdarray[2], &acc->isar.id_isar0,
                               ARM64_SYS_REG(3, 0, 0, 2, 0));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar1,
+        err |= read_sys_reg32(fdarray[2], &acc->isar.id_isar1,
                               ARM64_SYS_REG(3, 0, 0, 2, 1));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar2,
+        err |= read_sys_reg32(fdarray[2], &acc->isar.id_isar2,
                               ARM64_SYS_REG(3, 0, 0, 2, 2));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar3,
+        err |= read_sys_reg32(fdarray[2], &acc->isar.id_isar3,
                               ARM64_SYS_REG(3, 0, 0, 2, 3));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar4,
+        err |= read_sys_reg32(fdarray[2], &acc->isar.id_isar4,
                               ARM64_SYS_REG(3, 0, 0, 2, 4));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar5,
+        err |= read_sys_reg32(fdarray[2], &acc->isar.id_isar5,
                               ARM64_SYS_REG(3, 0, 0, 2, 5));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr4,
+        err |= read_sys_reg32(fdarray[2], &acc->isar.id_mmfr4,
                               ARM64_SYS_REG(3, 0, 0, 2, 6));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar6,
+        err |= read_sys_reg32(fdarray[2], &acc->isar.id_isar6,
                               ARM64_SYS_REG(3, 0, 0, 2, 7));
 
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr0,
+        err |= read_sys_reg32(fdarray[2], &acc->isar.mvfr0,
                               ARM64_SYS_REG(3, 0, 0, 3, 0));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr1,
+        err |= read_sys_reg32(fdarray[2], &acc->isar.mvfr1,
                               ARM64_SYS_REG(3, 0, 0, 3, 1));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr2,
+        err |= read_sys_reg32(fdarray[2], &acc->isar.mvfr2,
                               ARM64_SYS_REG(3, 0, 0, 3, 2));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr2,
+        err |= read_sys_reg32(fdarray[2], &acc->isar.id_pfr2,
                               ARM64_SYS_REG(3, 0, 0, 3, 4));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_dfr1,
+        err |= read_sys_reg32(fdarray[2], &acc->isar.id_dfr1,
                               ARM64_SYS_REG(3, 0, 0, 3, 5));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr5,
+        err |= read_sys_reg32(fdarray[2], &acc->isar.id_mmfr5,
                               ARM64_SYS_REG(3, 0, 0, 3, 6));
 
         /*
@@ -1715,14 +1706,14 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
          * arch/arm64/kvm/sys_regs.c:trap_dbgidr() does.
          * We only do this if the CPU supports AArch32 at EL1.
          */
-        if (FIELD_EX32(ahcf->isar.id_aa64pfr0, ID_AA64PFR0, EL1) >= 2) {
-            int wrps = FIELD_EX64(ahcf->isar.id_aa64dfr0, ID_AA64DFR0, WRPS);
-            int brps = FIELD_EX64(ahcf->isar.id_aa64dfr0, ID_AA64DFR0, BRPS);
+        if (FIELD_EX32(acc->isar.id_aa64pfr0, ID_AA64PFR0, EL1) >= 2) {
+            int wrps = FIELD_EX64(acc->isar.id_aa64dfr0, ID_AA64DFR0, WRPS);
+            int brps = FIELD_EX64(acc->isar.id_aa64dfr0, ID_AA64DFR0, BRPS);
             int ctx_cmps =
-                FIELD_EX64(ahcf->isar.id_aa64dfr0, ID_AA64DFR0, CTX_CMPS);
+                FIELD_EX64(acc->isar.id_aa64dfr0, ID_AA64DFR0, CTX_CMPS);
             int version = 6; /* ARMv8 debug architecture */
             bool has_el3 =
-                !!FIELD_EX32(ahcf->isar.id_aa64pfr0, ID_AA64PFR0, EL3);
+                !!FIELD_EX32(acc->isar.id_aa64pfr0, ID_AA64PFR0, EL3);
             uint32_t dbgdidr = 0;
 
             dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, WRPS, wrps);
@@ -1732,12 +1723,12 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
             dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, NSUHD_IMP, has_el3);
             dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, SE_IMP, has_el3);
             dbgdidr |= (1 << 15); /* RES1 bit */
-            ahcf->isar.dbgdidr = dbgdidr;
+            acc->isar.dbgdidr = dbgdidr;
         }
 
         if (pmu_supported) {
             /* PMCR_EL0 is only accessible if the vCPU has feature PMU_V3 */
-            err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
+            err |= read_sys_reg64(fdarray[2], &acc->isar.reset_pmcr_el0,
                                   ARM64_SYS_REG(3, 3, 9, 12, 0));
         }
 
@@ -1749,7 +1740,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
              * enabled SVE support, which resulted in an error rather than RAZ.
              * So only read the register if we set KVM_ARM_VCPU_SVE above.
              */
-            err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
+            err |= read_sys_reg64(fdarray[2], &acc->isar.id_aa64zfr0,
                                   ARM64_SYS_REG(3, 0, 0, 4, 4));
         }
     }
@@ -1759,24 +1750,6 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     return !err;
 }
 
-void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
-{
-    if (!arm_host_cpu_features.isar.id_aa64pfr0) {
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
-    cpu->isar = arm_host_cpu_features.isar;
-}
-
 /**
  * kvm_arm_steal_time_supported:
  *
-- 
2.34.1


