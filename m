Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AD865C62D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:26:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCls8-0001Cd-6d; Tue, 03 Jan 2023 13:18:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pCls6-00017v-7n
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:46 -0500
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pCls3-0005PE-Ku
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:45 -0500
Received: by mail-qv1-xf2e.google.com with SMTP id j9so15630918qvt.0
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AkaW/qtvsCW7a76sQ3IuBy/9ulOGdfXEvrcn4pt2h3o=;
 b=P7/SMwRcz8trG6lwyX//Xrq/CDgbNGm7SMpEM3zszbiNWi+DH3VRbL5qpFbSO9KNVA
 7xgZ1Vx1y5ZsPcX6bzIUUB0ANuz33ZGbhuh5X0kReiIJcgoiMygl9QtfjGWMs15lkEVX
 lp857nXyGLh7srwBl3tghwUGItqvY7gjb2R+ya1eNX2l1WTUPZM22eEWPConSIbiEab5
 4Q6FBOm50wbisMrNryhloJFnIdDduuJxm3jIf9Tw8erQvhwb85bIXBqS3uHicSF85yyD
 3AN+70CAAW7IBbMcH9hpBwmLG8Bv/Ggz1m1lB15T4+so17PHWzQSO5KS/v0AJgxM+JP8
 3CuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AkaW/qtvsCW7a76sQ3IuBy/9ulOGdfXEvrcn4pt2h3o=;
 b=4WFHXWdnj9Y0oqaKKMBFrZOI8Hfa/niYs3JVv8a/UP3bTPWS5bDWTPVYLTCG0vmSdE
 uwymO5An+RlShKiZ8CmFDNWrs8GK5pz36fWNAA/vsialfdoEqVk1ApqA4nzlFJ0II3pM
 VQmqX0P9Aig5DqmXbGOjnboY0hILQcAfHKybClcAV90XQ12i3KqqiT0ifoYNfIBRN8ng
 8I5OuAjted+w3ZTGpi92ScRn3WKEP3Q3LXmmv97hNUpU0l3eJr8g2Qu+NGnIlv90Esp/
 /am6tDYd9KhF4yZKfMICQqiMro8ARl7mUT0m+AMZ6QZmSgP+4txLEHAOXywcs2TwOwGH
 2MbA==
X-Gm-Message-State: AFqh2kqaFse1VBkBpKsC42lqFV6hiNSVFMt5cSIEQuUd5b0mDlKuFEok
 rH58B5Drzl4HXdn7EfJsOz8nSfAqR3+nhYZ5vg4=
X-Google-Smtp-Source: AMrXdXtuwk6gYSOp9eWxZdbQQZG7aH8eFTczAwSCaAHr0H0arKaF4H1XYSExxtLA6XVq9fEh3gLS2Q==
X-Received: by 2002:a0c:fcd0:0:b0:531:8f0c:e6b0 with SMTP id
 i16-20020a0cfcd0000000b005318f0ce6b0mr37037877qvq.7.1672769922496; 
 Tue, 03 Jan 2023 10:18:42 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:18:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 38/40] target/arm: Move "vfp" and "neon" to class
 properties
Date: Tue,  3 Jan 2023 10:16:44 -0800
Message-Id: <20230103181646.55711-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
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

With the movement of the properties, we can remove the fields
from the cpu entirely, using only the class.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-qom.h    |   4 +
 target/arm/cpu.h        |   4 -
 hw/arm/aspeed_ast2600.c |   3 +-
 target/arm/cpu.c        | 340 +++++++++++++++++++++-------------------
 4 files changed, 186 insertions(+), 165 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index f4e01e0ddb..0e71569ab5 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -188,6 +188,10 @@ struct ARMCPUClass {
     OnOffAuto has_el3;
     /* CPU has virtualization extension */
     OnOffAuto has_el2;
+    /* CPU has VFP */
+    OnOffAuto has_vfp;
+    /* CPU has Neon */
+    OnOffAuto has_neon;
 };
 
 static inline int arm_class_feature(ARMCPUClass *acc, int feature)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 23070a9c25..8d2f78b601 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -888,10 +888,6 @@ struct ArchCPU {
 
     /* CPU has PMU (Performance Monitor Unit) */
     bool has_pmu;
-    /* CPU has VFP */
-    bool has_vfp;
-    /* CPU has Neon */
-    bool has_neon;
 
     /* CPU has memory protection unit */
     bool has_mpu;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index bb8579546e..de5cda2093 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -156,6 +156,7 @@ static void aspeed_soc_ast2600_init(Object *obj)
 
     cpu_class = object_class_by_name(sc->cpu_type);
     class_property_set_uint(cpu_class, "cntfrq", 1125000000, &error_abort);
+    class_property_set_bool(cpu_class, "neon", false, &error_abort);
 
     for (i = 0; i < sc->num_cpus; i++) {
         object_initialize_child(obj, "cpu[*]", &s->cpu[i], sc->cpu_type);
@@ -309,8 +310,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         object_property_set_int(OBJECT(&s->cpu[i]), "mp-affinity",
                                 aspeed_calc_affinity(i), &error_abort);
 
-        object_property_set_bool(OBJECT(&s->cpu[i]), "neon", false,
-                                &error_abort);
         object_property_set_link(OBJECT(&s->cpu[i]), "memory",
                                  OBJECT(s->memory), &error_abort);
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 17d08e0e9c..e48f62a6fc 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1279,12 +1279,6 @@ static void arm_cpu_initfn(Object *obj)
 static Property arm_cpu_reset_cbar_property =
             DEFINE_PROP_UINT64("reset-cbar", ARMCPU, reset_cbar, 0);
 
-static Property arm_cpu_has_vfp_property =
-            DEFINE_PROP_BOOL("vfp", ARMCPU, has_vfp, true);
-
-static Property arm_cpu_has_neon_property =
-            DEFINE_PROP_BOOL("neon", ARMCPU, has_neon, true);
-
 static Property arm_cpu_has_mpu_property =
             DEFINE_PROP_BOOL("has-mpu", ARMCPU, has_mpu, true);
 
@@ -1381,27 +1375,6 @@ static void arm_cpu_post_init(Object *obj)
         object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu);
     }
 
-    /*
-     * Allow user to turn off VFP and Neon support, but only for TCG --
-     * KVM does not currently allow us to lie to the guest about its
-     * ID/feature registers, so the guest always sees what the host has.
-     */
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)
-        ? cpu_isar_feature(aa64_fp_simd, cpu)
-        : cpu_isar_feature(aa32_vfp, cpu)) {
-        cpu->has_vfp = true;
-        if (!kvm_enabled() && !arm_feature(&cpu->env, ARM_FEATURE_M)) {
-            qdev_property_add_static(DEVICE(obj), &arm_cpu_has_vfp_property);
-        }
-    }
-
-    if (arm_feature(&cpu->env, ARM_FEATURE_NEON)) {
-        cpu->has_neon = true;
-        if (!kvm_enabled()) {
-            qdev_property_add_static(DEVICE(obj), &arm_cpu_has_neon_property);
-        }
-    }
-
     if (arm_feature(&cpu->env, ARM_FEATURE_PMSA)) {
         qdev_property_add_static(DEVICE(obj), &arm_cpu_has_mpu_property);
         if (arm_feature(&cpu->env, ARM_FEATURE_V7)) {
@@ -1603,137 +1576,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (arm_feature(env, ARM_FEATURE_AARCH64) &&
-        cpu->has_vfp != cpu->has_neon) {
-        /*
-         * This is an architectural requirement for AArch64; AArch32 is
-         * more flexible and permits VFP-no-Neon and Neon-no-VFP.
-         */
-        error_setg(errp,
-                   "AArch64 CPUs must have both VFP and Neon or neither");
-        return;
-    }
-
-    if (!cpu->has_vfp) {
-        uint64_t t;
-        uint32_t u;
-
-        t = cpu->isar.id_aa64isar1;
-        t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 0);
-        cpu->isar.id_aa64isar1 = t;
-
-        t = cpu->isar.id_aa64pfr0;
-        t = FIELD_DP64(t, ID_AA64PFR0, FP, 0xf);
-        cpu->isar.id_aa64pfr0 = t;
-
-        u = cpu->isar.id_isar6;
-        u = FIELD_DP32(u, ID_ISAR6, JSCVT, 0);
-        u = FIELD_DP32(u, ID_ISAR6, BF16, 0);
-        cpu->isar.id_isar6 = u;
-
-        u = cpu->isar.mvfr0;
-        u = FIELD_DP32(u, MVFR0, FPSP, 0);
-        u = FIELD_DP32(u, MVFR0, FPDP, 0);
-        u = FIELD_DP32(u, MVFR0, FPDIVIDE, 0);
-        u = FIELD_DP32(u, MVFR0, FPSQRT, 0);
-        u = FIELD_DP32(u, MVFR0, FPROUND, 0);
-        if (!arm_feature(env, ARM_FEATURE_M)) {
-            u = FIELD_DP32(u, MVFR0, FPTRAP, 0);
-            u = FIELD_DP32(u, MVFR0, FPSHVEC, 0);
-        }
-        cpu->isar.mvfr0 = u;
-
-        u = cpu->isar.mvfr1;
-        u = FIELD_DP32(u, MVFR1, FPFTZ, 0);
-        u = FIELD_DP32(u, MVFR1, FPDNAN, 0);
-        u = FIELD_DP32(u, MVFR1, FPHP, 0);
-        if (arm_feature(env, ARM_FEATURE_M)) {
-            u = FIELD_DP32(u, MVFR1, FP16, 0);
-        }
-        cpu->isar.mvfr1 = u;
-
-        u = cpu->isar.mvfr2;
-        u = FIELD_DP32(u, MVFR2, FPMISC, 0);
-        cpu->isar.mvfr2 = u;
-    }
-
-    if (!cpu->has_neon) {
-        uint64_t t;
-        uint32_t u;
-
-        unset_feature(env, ARM_FEATURE_NEON);
-
-        t = cpu->isar.id_aa64isar0;
-        t = FIELD_DP64(t, ID_AA64ISAR0, AES, 0);
-        t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 0);
-        t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 0);
-        t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 0);
-        t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 0);
-        t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 0);
-        t = FIELD_DP64(t, ID_AA64ISAR0, DP, 0);
-        cpu->isar.id_aa64isar0 = t;
-
-        t = cpu->isar.id_aa64isar1;
-        t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 0);
-        t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 0);
-        t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 0);
-        cpu->isar.id_aa64isar1 = t;
-
-        t = cpu->isar.id_aa64pfr0;
-        t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 0xf);
-        cpu->isar.id_aa64pfr0 = t;
-
-        u = cpu->isar.id_isar5;
-        u = FIELD_DP32(u, ID_ISAR5, AES, 0);
-        u = FIELD_DP32(u, ID_ISAR5, SHA1, 0);
-        u = FIELD_DP32(u, ID_ISAR5, SHA2, 0);
-        u = FIELD_DP32(u, ID_ISAR5, RDM, 0);
-        u = FIELD_DP32(u, ID_ISAR5, VCMA, 0);
-        cpu->isar.id_isar5 = u;
-
-        u = cpu->isar.id_isar6;
-        u = FIELD_DP32(u, ID_ISAR6, DP, 0);
-        u = FIELD_DP32(u, ID_ISAR6, FHM, 0);
-        u = FIELD_DP32(u, ID_ISAR6, BF16, 0);
-        u = FIELD_DP32(u, ID_ISAR6, I8MM, 0);
-        cpu->isar.id_isar6 = u;
-
-        if (!arm_feature(env, ARM_FEATURE_M)) {
-            u = cpu->isar.mvfr1;
-            u = FIELD_DP32(u, MVFR1, SIMDLS, 0);
-            u = FIELD_DP32(u, MVFR1, SIMDINT, 0);
-            u = FIELD_DP32(u, MVFR1, SIMDSP, 0);
-            u = FIELD_DP32(u, MVFR1, SIMDHP, 0);
-            cpu->isar.mvfr1 = u;
-
-            u = cpu->isar.mvfr2;
-            u = FIELD_DP32(u, MVFR2, SIMDMISC, 0);
-            cpu->isar.mvfr2 = u;
-        }
-    }
-
-    if (!cpu->has_neon && !cpu->has_vfp) {
-        uint64_t t;
-        uint32_t u;
-
-        t = cpu->isar.id_aa64isar0;
-        t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 0);
-        cpu->isar.id_aa64isar0 = t;
-
-        t = cpu->isar.id_aa64isar1;
-        t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 0);
-        cpu->isar.id_aa64isar1 = t;
-
-        u = cpu->isar.mvfr0;
-        u = FIELD_DP32(u, MVFR0, SIMDREG, 0);
-        cpu->isar.mvfr0 = u;
-
-        /* Despite the name, this field covers both VFP and Neon */
-        u = cpu->isar.mvfr1;
-        u = FIELD_DP32(u, MVFR1, SIMDFMAC, 0);
-        cpu->isar.mvfr1 = u;
-    }
-
     /*
      * We rely on no XScale CPU having VFP so we can use the same bits in the
      * TB flags field for VECSTRIDE and XSCALE_CPAR.
@@ -2102,7 +1944,6 @@ static bool arm_class_prop_uint64_ofs(ObjectClass *oc, Visitor *v,
     return visit_type_uint64(v, name, ptr, errp);
 }
 
-#ifndef CONFIG_USER_ONLY
 static bool arm_class_prop_get_auto_ofs(ObjectClass *oc, Visitor *v,
                                         const char *name, void *opaque,
                                         Error **errp)
@@ -2131,6 +1972,7 @@ static bool arm_class_prop_set_auto_ofs(ObjectClass *oc, Visitor *v,
     return false;
 }
 
+#ifndef CONFIG_USER_ONLY
 static bool arm_class_prop_set_sctlrbit(ObjectClass *oc, Visitor *v,
                                         const char *name, void *opaque,
                                         Error **errp)
@@ -2339,11 +2181,34 @@ static void arm_cpu_leaf_class_init(ObjectClass *oc, void *data)
                            (void *)(uintptr_t)offsetof(ARMCPUClass, has_el3));
     }
 #endif /* !CONFIG_USER_ONLY */
+
+    /*
+     * Similarly, allow user to turn off VFP and Neon support with TCG.
+     * While the id registers may not yet be configured for properly
+     * detecting VFP for "host" or "max", we know that all aarch64 has
+     * support, so substitute AARCH64.  Neon is always set correctly.
+     */
+    if (arm_class_feature(acc, ARM_FEATURE_AARCH64) ||
+        (class_isar_feature(aa32_vfp, acc) &&
+         !arm_class_feature(acc, ARM_FEATURE_M))) {
+        class_property_add(oc, "vfp", "bool", NULL,
+                           arm_class_prop_get_auto_ofs,
+                           arm_class_prop_set_auto_ofs,
+                           (void *)(uintptr_t)offsetof(ARMCPUClass, has_vfp));
+    }
+    if (arm_class_feature(acc, ARM_FEATURE_NEON)) {
+        class_property_add(oc, "neon", "bool", NULL,
+                           arm_class_prop_get_auto_ofs,
+                           arm_class_prop_set_auto_ofs,
+                           (void *)(uintptr_t)offsetof(ARMCPUClass, has_neon));
+    }
 }
 
 static bool arm_cpu_class_late_init(ObjectClass *oc, Error **errp)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
+    uint64_t t;
+    uint32_t u;
 
     if (acc->info->class_late_init) {
         if (!acc->info->class_late_init(acc, errp)) {
@@ -2417,6 +2282,163 @@ static bool arm_cpu_class_late_init(ObjectClass *oc, Error **errp)
     }
 #endif /* !CONFIG_USER_ONLY */
 
+    if (!arm_class_feature(acc, ARM_FEATURE_M)) {
+        if (acc->has_vfp == ON_OFF_AUTO_AUTO) {
+            acc->has_vfp = ((arm_class_feature(acc, ARM_FEATURE_AARCH64)
+                             ? class_isar_feature(aa64_fp_simd, acc)
+                             : class_isar_feature(aa32_vfp, acc))
+                            ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF);
+        }
+        switch (acc->has_vfp) {
+        default:
+            g_assert_not_reached();
+        case ON_OFF_AUTO_ON:
+            break;
+        case ON_OFF_AUTO_OFF:
+            /*
+             * Neither KVM nor HVF allow us to lie to the guest about
+             * ID/feature registers, so the guest always sees what
+             * the host has.
+             */
+            if (!tcg_enabled() && !qtest_enabled()) {
+                error_setg(errp,
+                           "Cannot enable %s when guest CPU has VFP disabled",
+                           current_accel_name());
+                return false;
+            }
+
+            t = acc->isar.id_aa64isar1;
+            t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 0);
+            acc->isar.id_aa64isar1 = t;
+
+            t = acc->isar.id_aa64pfr0;
+            t = FIELD_DP64(t, ID_AA64PFR0, FP, 0xf);
+            acc->isar.id_aa64pfr0 = t;
+
+            u = acc->isar.id_isar6;
+            u = FIELD_DP32(u, ID_ISAR6, JSCVT, 0);
+            u = FIELD_DP32(u, ID_ISAR6, BF16, 0);
+            acc->isar.id_isar6 = u;
+
+            u = acc->isar.mvfr0;
+            u = FIELD_DP32(u, MVFR0, FPSP, 0);
+            u = FIELD_DP32(u, MVFR0, FPDP, 0);
+            u = FIELD_DP32(u, MVFR0, FPDIVIDE, 0);
+            u = FIELD_DP32(u, MVFR0, FPSQRT, 0);
+            u = FIELD_DP32(u, MVFR0, FPROUND, 0);
+            u = FIELD_DP32(u, MVFR0, FPTRAP, 0);
+            u = FIELD_DP32(u, MVFR0, FPSHVEC, 0);
+            acc->isar.mvfr0 = u;
+
+            u = acc->isar.mvfr1;
+            u = FIELD_DP32(u, MVFR1, FPFTZ, 0);
+            u = FIELD_DP32(u, MVFR1, FPDNAN, 0);
+            u = FIELD_DP32(u, MVFR1, FPHP, 0);
+            acc->isar.mvfr1 = u;
+
+            u = acc->isar.mvfr2;
+            u = FIELD_DP32(u, MVFR2, FPMISC, 0);
+            acc->isar.mvfr2 = u;
+            break;
+        }
+
+        if (acc->has_neon == ON_OFF_AUTO_AUTO) {
+            acc->has_neon = (arm_class_feature(acc, ARM_FEATURE_NEON)
+                             ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF);
+        }
+        switch (acc->has_neon) {
+        default:
+            g_assert_not_reached();
+        case ON_OFF_AUTO_ON:
+            break;
+        case ON_OFF_AUTO_OFF:
+            if (!tcg_enabled() && !qtest_enabled()) {
+                error_setg(errp,
+                           "Cannot enable %s when guest CPU has NEON disabled",
+                           current_accel_name());
+                return false;
+            }
+
+            unset_class_feature(acc, ARM_FEATURE_NEON);
+
+            t = acc->isar.id_aa64isar0;
+            t = FIELD_DP64(t, ID_AA64ISAR0, AES, 0);
+            t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 0);
+            t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 0);
+            t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 0);
+            t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 0);
+            t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 0);
+            t = FIELD_DP64(t, ID_AA64ISAR0, DP, 0);
+            acc->isar.id_aa64isar0 = t;
+
+            t = acc->isar.id_aa64isar1;
+            t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 0);
+            t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 0);
+            t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 0);
+            acc->isar.id_aa64isar1 = t;
+
+            t = acc->isar.id_aa64pfr0;
+            t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 0xf);
+            acc->isar.id_aa64pfr0 = t;
+
+            u = acc->isar.id_isar5;
+            u = FIELD_DP32(u, ID_ISAR5, AES, 0);
+            u = FIELD_DP32(u, ID_ISAR5, SHA1, 0);
+            u = FIELD_DP32(u, ID_ISAR5, SHA2, 0);
+            u = FIELD_DP32(u, ID_ISAR5, RDM, 0);
+            u = FIELD_DP32(u, ID_ISAR5, VCMA, 0);
+            acc->isar.id_isar5 = u;
+
+            u = acc->isar.id_isar6;
+            u = FIELD_DP32(u, ID_ISAR6, DP, 0);
+            u = FIELD_DP32(u, ID_ISAR6, FHM, 0);
+            u = FIELD_DP32(u, ID_ISAR6, BF16, 0);
+            u = FIELD_DP32(u, ID_ISAR6, I8MM, 0);
+            acc->isar.id_isar6 = u;
+
+            u = acc->isar.mvfr1;
+            u = FIELD_DP32(u, MVFR1, SIMDLS, 0);
+            u = FIELD_DP32(u, MVFR1, SIMDINT, 0);
+            u = FIELD_DP32(u, MVFR1, SIMDSP, 0);
+            u = FIELD_DP32(u, MVFR1, SIMDHP, 0);
+            acc->isar.mvfr1 = u;
+
+            u = acc->isar.mvfr2;
+            u = FIELD_DP32(u, MVFR2, SIMDMISC, 0);
+            acc->isar.mvfr2 = u;
+
+            if (acc->has_vfp == ON_OFF_AUTO_OFF) {
+                t = acc->isar.id_aa64isar0;
+                t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 0);
+                acc->isar.id_aa64isar0 = t;
+
+                t = acc->isar.id_aa64isar1;
+                t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 0);
+                acc->isar.id_aa64isar1 = t;
+
+                u = acc->isar.mvfr0;
+                u = FIELD_DP32(u, MVFR0, SIMDREG, 0);
+                acc->isar.mvfr0 = u;
+
+                /* Despite the name, this field covers both VFP and Neon */
+                u = acc->isar.mvfr1;
+                u = FIELD_DP32(u, MVFR1, SIMDFMAC, 0);
+                acc->isar.mvfr1 = u;
+            }
+            break;
+        }
+        if (acc->has_vfp != acc->has_neon &&
+            arm_class_feature(acc, ARM_FEATURE_AARCH64)) {
+            /*
+             * This is an architectural requirement for AArch64; AArch32 is
+             * more flexible and permits VFP-no-Neon and Neon-no-VFP.
+             */
+            error_setg(errp,
+                       "AArch64 CPUs must have both VFP and Neon or neither");
+            return false;
+        }
+    }
+
     /* Run some consistency checks for TCG. */
     if (tcg_enabled()) {
         bool no_aa32 = arm_class_feature(acc, ARM_FEATURE_AARCH64) &&
-- 
2.34.1


