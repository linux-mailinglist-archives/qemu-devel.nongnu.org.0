Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACD549537B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 18:43:56 +0100 (CET)
Received: from localhost ([::1]:39818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAbTW-0002bM-Mh
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 12:43:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgB-000451-8O
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:40 -0500
Received: from [2a00:1450:4864:20::32c] (port=37552
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWg6-00036F-RH
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:36 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso21597349wmj.2
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yP7uL/J3E+G1iSjxZS2jRscQ7wrFAtxD33gMt+rUCoc=;
 b=CKMtDHmVBnu1kP4s3AGDFyx2K7dnRnM18P9Rb0Q3Ves+jTIjQ8gn2KulEojus4QUK5
 BuPft6be5WRnwsGFevenbFchdVKbep/66He/JNcrXd7FrEBaA/5/rB6olVELoIGkekvM
 8jG7pJoiMAkFWSsQoEHdNAp/C5HkTfAKAOXStibqoC3gnC7lkaF39I66gLhikOP057l+
 pijOpxVbw0+WeQuITJz/o3TcJe+PjQgvqjp6ahwPNwrmRgZPRAdEEaWtTM7e218rY0NW
 9CDauDTEKsZVhqY5psmGoFCH/IIbrbOKDF8S1KEOa2hd7Q8+dofr/4xn78h03+INsum3
 JaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yP7uL/J3E+G1iSjxZS2jRscQ7wrFAtxD33gMt+rUCoc=;
 b=IsPZqXa1kvXYxT5XYfl21DbZodw0P3WqO9hTQVFY330rRqDVjYd61ifOapEWetNUva
 mlFUNuAnvlUFJ9BQ5A9YH/R9taf3ByTPHDG4ZqtNK3vnPSGWMscD5KU6i4hS8xLZUsA4
 tfl5pLi+kISv8JTLpIC3UPOv2Kb5ddwMwlyD7FJff4IXcWnyXPri/ONGujc/zRUvFLqU
 o1qoE23KqUZYKjO4OJqLsbExDyjFbolObZ6VKGxi1KBeF2RuMBDm3qWCBVZ/+JaHksuQ
 NRhQQ9BrJEDhtgOTaGCAtOESpgNJjrEk3C6GvDmbASq9Q02wHSuGW4FJv5ZdIEqU9Wd2
 AByQ==
X-Gm-Message-State: AOAM530IX7B18ikk+9gGxWxQeFDeHLC1qhlIXw4GFJW538PyIJUORzeE
 vWUyNVkcudeaGVUaFDHTj0te/N4FF13TCw==
X-Google-Smtp-Source: ABdhPJxY+ir1M71cMVgvbKlZCp2FRaMCWvnP508X6fjVDO6dxySqjviZxjtG+QANtbw8h4P12voofQ==
X-Received: by 2002:a05:600c:4b95:: with SMTP id
 e21mr1648113wmp.106.1642682193604; 
 Thu, 20 Jan 2022 04:36:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/38] hw/arm/virt: KVM: Enable PAuth when supported by the host
Date: Thu, 20 Jan 2022 12:35:53 +0000
Message-Id: <20220120123630.267975-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc Zyngier <maz@kernel.org>

Add basic support for Pointer Authentication when running a KVM
guest and that the host supports it, loosely based on the SVE
support.

Although the feature is enabled by default when the host advertises
it, it is possible to disable it by setting the 'pauth=off' CPU
property. The 'pauth' comment is removed from cpu-features.rst,
as it is now common to both TCG and KVM.

Tested on an Apple M1 running 5.16-rc6.

Cc: Eric Auger <eric.auger@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220107150154.2490308-1-maz@kernel.org
[PMM: fixed indentation]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/cpu-features.rst |  4 ----
 target/arm/cpu.h                 |  1 +
 target/arm/cpu.c                 | 16 +++++-----------
 target/arm/cpu64.c               | 31 +++++++++++++++++++++++++++----
 target/arm/kvm64.c               | 21 +++++++++++++++++++++
 5 files changed, 54 insertions(+), 19 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 584eb170974..3e626c4b68a 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -217,10 +217,6 @@ TCG VCPU Features
 TCG VCPU features are CPU features that are specific to TCG.
 Below is the list of TCG VCPU features and their descriptions.
 
-  pauth                    Enable or disable ``FEAT_Pauth``, pointer
-                           authentication.  By default, the feature is
-                           enabled with ``-cpu max``.
-
   pauth-impdef             When ``FEAT_Pauth`` is enabled, either the
                            *impdef* (Implementation Defined) algorithm
                            is enabled or the *architected* QARMA algorithm
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e33f37b70ad..c6a4d50e821 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1076,6 +1076,7 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
 void aarch64_add_sve_properties(Object *obj);
+void aarch64_add_pauth_properties(Object *obj);
 
 /*
  * SVE registers are encoded in KVM's memory in an endianness-invariant format.
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a211804fd3d..cdbc4cdd012 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1380,17 +1380,10 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             return;
         }
 
-        /*
-         * KVM does not support modifications to this feature.
-         * We have not registered the cpu properties when KVM
-         * is in use, so the user will not be able to set them.
-         */
-        if (!kvm_enabled()) {
-            arm_cpu_pauth_finalize(cpu, &local_err);
-            if (local_err != NULL) {
-                error_propagate(errp, local_err);
-                return;
-            }
+        arm_cpu_pauth_finalize(cpu, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
         }
     }
 
@@ -2091,6 +2084,7 @@ static void arm_host_initfn(Object *obj)
     kvm_arm_set_cpu_features_from_host(cpu);
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         aarch64_add_sve_properties(obj);
+        aarch64_add_pauth_properties(obj);
     }
 #else
     hvf_arm_set_cpu_features_from_host(cpu);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 15245a60a8c..8786be7783e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -630,6 +630,15 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
     int arch_val = 0, impdef_val = 0;
     uint64_t t;
 
+    /* Exit early if PAuth is enabled, and fall through to disable it */
+    if (kvm_enabled() && cpu->prop_pauth) {
+        if (!cpu_isar_feature(aa64_pauth, cpu)) {
+            error_setg(errp, "'pauth' feature not supported by KVM on this host");
+        }
+
+        return;
+    }
+
     /* TODO: Handle HaveEnhancedPAC, HaveEnhancedPAC2, HaveFPAC. */
     if (cpu->prop_pauth) {
         if (cpu->prop_pauth_impdef) {
@@ -655,6 +664,23 @@ static Property arm_cpu_pauth_property =
 static Property arm_cpu_pauth_impdef_property =
     DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
 
+void aarch64_add_pauth_properties(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    /* Default to PAUTH on, with the architected algorithm on TCG. */
+    qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property);
+    if (kvm_enabled()) {
+        /*
+         * Mirror PAuth support from the probed sysregs back into the
+         * property for KVM. Is it just a bit backward? Yes it is!
+         */
+        cpu->prop_pauth = cpu_isar_feature(aa64_pauth, cpu);
+    } else {
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
+    }
+}
+
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
  * otherwise, a CPU with as many features enabled as our emulation supports.
  * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
@@ -829,13 +855,10 @@ static void aarch64_max_initfn(Object *obj)
         cpu->dcz_blocksize = 7; /*  512 bytes */
 #endif
 
-        /* Default to PAUTH on, with the architected algorithm. */
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property);
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
-
         bitmap_fill(cpu->sve_vq_supported, ARM_MAX_VQ);
     }
 
+    aarch64_add_pauth_properties(obj);
     aarch64_add_sve_properties(obj);
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                         cpu_max_set_sve_max_vq, NULL, NULL);
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index e790d6c9a57..71c3ca69717 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -491,6 +491,12 @@ static int read_sys_reg64(int fd, uint64_t *pret, uint64_t id)
     return ioctl(fd, KVM_GET_ONE_REG, &idreg);
 }
 
+static bool kvm_arm_pauth_supported(void)
+{
+    return (kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_ADDRESS) &&
+            kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_GENERIC));
+}
+
 bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 {
     /* Identify the feature bits corresponding to the host CPU, and
@@ -521,6 +527,17 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      */
     struct kvm_vcpu_init init = { .target = -1, };
 
+    /*
+     * Ask for Pointer Authentication if supported. We can't play the
+     * SVE trick of synthesising the ID reg as KVM won't tell us
+     * whether we have the architected or IMPDEF version of PAuth, so
+     * we have to use the actual ID regs.
+     */
+    if (kvm_arm_pauth_supported()) {
+        init.features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
+                             1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
+    }
+
     if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
         return false;
     }
@@ -865,6 +882,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
         assert(kvm_arm_sve_supported());
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
     }
+    if (cpu_isar_feature(aa64_pauth, cpu)) {
+        cpu->kvm_init_features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
+                                      1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
+    }
 
     /* Do KVM_ARM_VCPU_INIT ioctl */
     ret = kvm_arm_vcpu_init(cs);
-- 
2.25.1


