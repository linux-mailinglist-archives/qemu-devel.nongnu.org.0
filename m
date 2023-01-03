Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6666465C606
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:24:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClre-0000GL-TX; Tue, 03 Jan 2023 13:18:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrL-0008Ok-Lx
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:10 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrJ-0005Hh-Bf
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:59 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-46198b81e5eso447802937b3.4
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Giw+JXSeEeudG8bVmdhTP6eAIZIod5pTf9XSXTJ4xZQ=;
 b=f6LPjgglZp8gUIz/TSmNAR8uViyIdAMirRlVDGe3eoXKKkovb7eFw2p/sGXY6z6iym
 RWCAkfmnmwW5a2YkIg25Mxb0DAn4zEw1msjXxxfPRud/pZMK+VRSLa1Q2NCaDVUk+YnP
 RQSiXzG2kmU9sgFAW6j76ppNCg+ojkuVGSjNeubwjYukv8veOBVLjUON8VwS1oV/YSLA
 DKJSSHeKjQ8iCbd7R6N49gMNx1Q3NTgWPXgfXG6AHIpb6UTHIU4F8+GEnKr2MP0EaDuq
 s4711+h+/Zhg4g93IZloU71WRPl8kjUFgwaxUDbqsHuKMOGnsc7kQdofJbk4xoiC3Iys
 PDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Giw+JXSeEeudG8bVmdhTP6eAIZIod5pTf9XSXTJ4xZQ=;
 b=wBrmL36S8o4eUdhaTE0cF018fbjlyUECqlZtChN96ugvY69XptdwpIuIFrZud1V43y
 9Zl91Acxdw7swkXNEq3DAbRyMSLbumuk/UIOxfmaf+zd85F6B80j9mX8f1mqLssJKPgR
 zWth4978MkpAzBiMM7QKbWM3LY1xoUWgdlNZmb/+QI+PgHyJ9U8Ix3KQ8AT1c8qahJEo
 UNNUvBnBWE19W6F6VBmmYnMiaFobUCAmq9HrVdiLJNuG4vzcjNDg61GrW7HwMPqvdcyd
 G2fkjoG7hz2Rsx6z8CCq6BcJmu8xcInOoIS65aswshYJPD+fjt2inIiM/AiMc/jkmJfB
 ywIg==
X-Gm-Message-State: AFqh2kqo/RFz0jit+fb5mgt6VdjeHPlxLuQTU99VZeVTQFx6SDJ1eC9t
 TDQk9IS/ZWOXqNFZ8O2G0lpQH7zBFuhh143yJqE=
X-Google-Smtp-Source: AMrXdXs5WTWQ/mTOGpm+20aEI9lwBQ9G/I6/JD51IFswjJn2nxZQGAVFRIP9swK1ZOKOTjoa+FBdYA==
X-Received: by 2002:a05:690c:250:b0:3e9:e55d:61e1 with SMTP id
 ba16-20020a05690c025000b003e9e55d61e1mr37195403ywb.8.1672769876170; 
 Tue, 03 Jan 2023 10:17:56 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:17:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 22/40] target/arm: Hoist feature and dtb_compatible from
 KVM, HVF
Date: Tue,  3 Jan 2023 10:16:28 -0800
Message-Id: <20230103181646.55711-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1133.google.com
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

These settings are generic and identical between the two
host accelerators.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c   | 23 ++++++++++++++++++++++-
 target/arm/hvf/hvf.c | 13 +------------
 target/arm/kvm.c     | 29 ++---------------------------
 3 files changed, 25 insertions(+), 40 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 668e979a24..75a88f9deb 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1090,6 +1090,21 @@ static void aarch64_neoverse_n1_class_init(ARMCPUClass *cpu)
     cpu->isar.reset_pmcr_el0 = 0x410c3000;
 }
 
+static void aarch64_host_class_init(ARMCPUClass *acc)
+{
+    /*
+     * While we don't know all the host details, we can assume at
+     * least v8 with VFPv4+Neon; this in turn implies most of the
+     * other feature bits.
+     */
+    acc->dtb_compatible = "arm,arm-v8";
+    set_class_feature(acc, ARM_FEATURE_V8);
+    set_class_feature(acc, ARM_FEATURE_NEON);
+    set_class_feature(acc, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(acc, ARM_FEATURE_AARCH64);
+    set_class_feature(acc, ARM_FEATURE_PMU);
+}
+
 static void aarch64_host_object_init(Object *obj)
 {
 #if defined(CONFIG_KVM)
@@ -1122,8 +1137,12 @@ static bool aarch64_max_class_late_init(ARMCPUClass *cpu, Error **errp)
         return true;
     }
 
-    /* '-cpu max' for TCG: we currently do this as "A57 with extra things" */
+    /*
+     * '-cpu max' for TCG: we currently do this as "A57 with extra things"
+     * Retain the more generic dtb_compatible setting from host_class_init.
+     */
     aarch64_a57_class_init(cpu);
+    cpu->dtb_compatible = "arm,arm-v8";
 
     /*
      * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
@@ -1316,10 +1335,12 @@ static const ARMCPUInfo aarch64_cpus[] = {
       .class_init = aarch64_a64fx_class_init,
       .object_init = aarch64_a64fx_object_init },
     { .name = "max",
+      .class_init = aarch64_host_class_init,
       .class_late_init = aarch64_max_class_late_init,
       .object_init = aarch64_max_object_init },
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     { .name = "host",
+      .class_init = aarch64_host_class_init,
       .object_init = aarch64_host_object_init },
 #endif
 };
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 278a4b2ede..8bb8b475cd 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -97,10 +97,8 @@ static HVFVTimer vtimer;
 
 typedef struct ARMHostCPUFeatures {
     ARMISARegisters isar;
-    uint64_t features;
     uint64_t midr;
     uint32_t reset_sctlr;
-    const char *dtb_compatible;
 } ARMHostCPUFeatures;
 
 static ARMHostCPUFeatures arm_host_cpu_features;
@@ -489,13 +487,6 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     hv_vcpu_exit_t *exit;
     int i;
 
-    ahcf->dtb_compatible = "arm,arm-v8";
-    ahcf->features = (1ULL << ARM_FEATURE_V8) |
-                     (1ULL << ARM_FEATURE_NEON) |
-                     (1ULL << ARM_FEATURE_AARCH64) |
-                     (1ULL << ARM_FEATURE_PMU) |
-                     (1ULL << ARM_FEATURE_GENERIC_TIMER);
-
     /* We set up a small vcpu to extract host registers */
 
     if (hv_vcpu_create(&fd, &exit, NULL) != HV_SUCCESS) {
@@ -532,7 +523,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 
 void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu)
 {
-    if (!arm_host_cpu_features.dtb_compatible) {
+    if (!arm_host_cpu_features.reset_sctlr) {
         if (!hvf_enabled() ||
             !hvf_arm_get_host_cpu_features(&arm_host_cpu_features)) {
             /*
@@ -544,9 +535,7 @@ void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu)
         }
     }
 
-    cpu->dtb_compatible = arm_host_cpu_features.dtb_compatible;
     cpu->isar = arm_host_cpu_features.isar;
-    cpu->env.features = arm_host_cpu_features.features;
     cpu->midr = arm_host_cpu_features.midr;
     cpu->reset_sctlr = arm_host_cpu_features.reset_sctlr;
 }
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 02a15c6013..ac164a6130 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -50,9 +50,7 @@ static bool cap_has_inject_ext_dabt;
  */
 typedef struct ARMHostCPUFeatures {
     ARMISARegisters isar;
-    uint64_t features;
     uint32_t target;
-    const char *dtb_compatible;
 } ARMHostCPUFeatures;
 
 static ARMHostCPUFeatures arm_host_cpu_features;
@@ -1567,7 +1565,6 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     int fdarray[3];
     bool sve_supported;
     bool pmu_supported = false;
-    uint64_t features = 0;
     int err;
 
     /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
@@ -1615,7 +1612,6 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     }
 
     ahcf->target = init.target;
-    ahcf->dtb_compatible = "arm,arm-v8";
 
     err = read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr0,
                          ARM64_SYS_REG(3, 0, 0, 4, 0));
@@ -1760,31 +1756,12 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 
     kvm_arm_destroy_scratch_host_vcpu(fdarray);
 
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
+    return !err;
 }
 
 void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
 {
-    CPUARMState *env = &cpu->env;
-
-    if (!arm_host_cpu_features.dtb_compatible) {
+    if (!arm_host_cpu_features.isar.id_aa64pfr0) {
         if (!kvm_enabled() ||
             !kvm_arm_get_host_cpu_features(&arm_host_cpu_features)) {
             /* We can't report this error yet, so flag that we need to
@@ -1797,9 +1774,7 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
     }
 
     cpu->kvm_target = arm_host_cpu_features.target;
-    cpu->dtb_compatible = arm_host_cpu_features.dtb_compatible;
     cpu->isar = arm_host_cpu_features.isar;
-    env->features = arm_host_cpu_features.features;
 }
 
 /**
-- 
2.34.1


