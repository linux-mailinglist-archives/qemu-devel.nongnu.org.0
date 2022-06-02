Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCE353C087
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 23:59:40 +0200 (CEST)
Received: from localhost ([::1]:33660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwsqx-0008Ig-8H
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 17:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgm-0004cO-5U
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:08 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:41921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgj-0008VG-3X
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:07 -0400
Received: by mail-pf1-x42e.google.com with SMTP id p8so5795319pfh.8
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EVyZvmlYsEV05qY937aLYRbVAXbV11KqU2qhcOkYz0E=;
 b=qqVglmdP1BrMQMv9WOI/QvFeQlhcBvuPVJa2iGGds8ak1UZmiXn7DEOadBM9P8A7W5
 BFFW126rhLLSo2J6Lnyq+7OiP3TP3MIGylCMZzMypa4RhFyapgDvjIXt9JU001/XBYMl
 s6fWAcvqlsY7om/7qOM3LjCiaihRu9XSYMMsX2LVN+709GEqSLWu/T6me6+gBOSRX0Na
 A/QimdLDJcDdsaAR/VvfpOer/yuKECU8WN5nbyErfTvfpAy3H64R4Kp59lK0pQo0jvyA
 8UZUPOxxwk5VCiTK89XCFrfvC25z5M8UPZHLItV8AGeKqqZDv9GBK48AYqv+Bdrrz9SA
 O1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EVyZvmlYsEV05qY937aLYRbVAXbV11KqU2qhcOkYz0E=;
 b=tou27VK9xsGFSPBaV/gLgFFdVs1iM+sjYGW0/zH0jNK+8IZwboLYqdIonKMI7xSn1u
 JRWmU2Fm9m+q4+P/ViGAtoM8R4droSKjIUUzrNCxMmZOnVfFwiGKNvsl2e085Rkazx3B
 RI8whyeep6jPtPbgyvS8u12ohKPzDuhG9QVSTVzLkuV3FFq2y+6VjXdl5RJlUN1yUTAR
 10c0RJieDsRTYGeS7JY5rhnYkU/df0n82hdiUuW+cLV2HeaakKtE08ypNDO1mS3edLOh
 v5WDBsNGGKuMrhFv7ZWi68bzhgeduPE2ivb966VonHWHJbLSD8aK6fyb0VZc4Smdb/Ds
 Yy9A==
X-Gm-Message-State: AOAM530BZkzJ2wXsC2bBH+n9JSNNTTttGOtu7htaYGadiALJWy285exW
 rEgJ4row71DlPqczzORk26uBlcE9jnS/xQ==
X-Google-Smtp-Source: ABdhPJwj5qZP3hTiFOGmo0t60Dc3EZues/3zsOa2zSMp3ErKynszY2bYVeSHWh1+Gom7G2VbDFBISQ==
X-Received: by 2002:a63:5706:0:b0:3fc:a31b:9083 with SMTP id
 l6-20020a635706000000b003fca31b9083mr5863292pgb.333.1654206544125; 
 Thu, 02 Jun 2022 14:49:04 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 11/71] target/arm: Use uint32_t instead of bitmap for sve vq's
Date: Thu,  2 Jun 2022 14:47:53 -0700
Message-Id: <20220602214853.496211-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The bitmap need only hold 15 bits; bitmap is over-complicated.
We can simplify operations quite a bit with plain logical ops.

The introduction of SVE_VQ_POW2_MAP eliminates the need for
looping in order to search for powers of two.  Simply perform
the logical ops and use count leading or trailing zeros as
required to find the result.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       |   6 +--
 target/arm/internals.h |   5 ++
 target/arm/kvm_arm.h   |   7 ++-
 target/arm/cpu64.c     | 117 ++++++++++++++++++++---------------------
 target/arm/helper.c    |   9 +---
 target/arm/kvm64.c     |  36 +++----------
 6 files changed, 75 insertions(+), 105 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 830d358d46..ef51c3774e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1041,9 +1041,9 @@ struct ArchCPU {
      * Bits set in sve_vq_supported represent valid vector lengths for
      * the CPU type.
      */
-    DECLARE_BITMAP(sve_vq_map, ARM_MAX_VQ);
-    DECLARE_BITMAP(sve_vq_init, ARM_MAX_VQ);
-    DECLARE_BITMAP(sve_vq_supported, ARM_MAX_VQ);
+    uint32_t sve_vq_map;
+    uint32_t sve_vq_init;
+    uint32_t sve_vq_supported;
 
     /* Generic timer counter frequency, in Hz */
     uint64_t gt_cntfrq_hz;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 4dcdca918b..8bac570475 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1321,4 +1321,9 @@ bool el_is_in_host(CPUARMState *env, int el);
 
 void aa32_max_features(ARMCPU *cpu);
 
+/* Powers of 2 for sve_vq_map et al. */
+#define SVE_VQ_POW2_MAP                                 \
+    ((1 << (1 - 1)) | (1 << (2 - 1)) |                  \
+     (1 << (4 - 1)) | (1 << (8 - 1)) | (1 << (16 - 1)))
+
 #endif
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index b7f78b5215..99017b635c 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -239,13 +239,12 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf);
 /**
  * kvm_arm_sve_get_vls:
  * @cs: CPUState
- * @map: bitmap to fill in
  *
  * Get all the SVE vector lengths supported by the KVM host, setting
  * the bits corresponding to their length in quadwords minus one
- * (vq - 1) in @map up to ARM_MAX_VQ.
+ * (vq - 1) up to ARM_MAX_VQ.  Return the resulting map.
  */
-void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map);
+uint32_t kvm_arm_sve_get_vls(CPUState *cs);
 
 /**
  * kvm_arm_set_cpu_features_from_host:
@@ -439,7 +438,7 @@ static inline void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
     g_assert_not_reached();
 }
 
-static inline void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
+static inline uint32_t kvm_arm_sve_get_vls(CPUState *cs)
 {
     g_assert_not_reached();
 }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3ff9219ca3..51c5d8d4bc 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -355,8 +355,11 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
      * any of the above.  Finally, if SVE is not disabled, then at least one
      * vector length must be enabled.
      */
-    DECLARE_BITMAP(tmp, ARM_MAX_VQ);
-    uint32_t vq, max_vq = 0;
+    uint32_t vq_map = cpu->sve_vq_map;
+    uint32_t vq_init = cpu->sve_vq_init;
+    uint32_t vq_supported;
+    uint32_t vq_mask = 0;
+    uint32_t tmp, vq, max_vq = 0;
 
     /*
      * CPU models specify a set of supported vector lengths which are
@@ -364,10 +367,16 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
      * in the supported bitmap results in an error.  When KVM is enabled we
      * fetch the supported bitmap from the host.
      */
-    if (kvm_enabled() && kvm_arm_sve_supported()) {
-        kvm_arm_sve_get_vls(CPU(cpu), cpu->sve_vq_supported);
-    } else if (kvm_enabled()) {
-        assert(!cpu_isar_feature(aa64_sve, cpu));
+    if (kvm_enabled()) {
+        if (kvm_arm_sve_supported()) {
+            cpu->sve_vq_supported = kvm_arm_sve_get_vls(CPU(cpu));
+            vq_supported = cpu->sve_vq_supported;
+        } else {
+            assert(!cpu_isar_feature(aa64_sve, cpu));
+            vq_supported = 0;
+        }
+    } else {
+        vq_supported = cpu->sve_vq_supported;
     }
 
     /*
@@ -375,8 +384,9 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
      * From the properties, sve_vq_map<N> implies sve_vq_init<N>.
      * Check first for any sve<N> enabled.
      */
-    if (!bitmap_empty(cpu->sve_vq_map, ARM_MAX_VQ)) {
-        max_vq = find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ) + 1;
+    if (vq_map != 0) {
+        max_vq = 32 - clz32(vq_map);
+        vq_mask = MAKE_64BIT_MASK(0, max_vq);
 
         if (cpu->sve_max_vq && max_vq > cpu->sve_max_vq) {
             error_setg(errp, "cannot enable sve%d", max_vq * 128);
@@ -392,15 +402,10 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
              * For KVM we have to automatically enable all supported unitialized
              * lengths, even when the smaller lengths are not all powers-of-two.
              */
-            bitmap_andnot(tmp, cpu->sve_vq_supported, cpu->sve_vq_init, max_vq);
-            bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
+            vq_map |= vq_supported & ~vq_init & vq_mask;
         } else {
             /* Propagate enabled bits down through required powers-of-two. */
-            for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
-                if (!test_bit(vq - 1, cpu->sve_vq_init)) {
-                    set_bit(vq - 1, cpu->sve_vq_map);
-                }
-            }
+            vq_map |= SVE_VQ_POW2_MAP & ~vq_init & vq_mask;
         }
     } else if (cpu->sve_max_vq == 0) {
         /*
@@ -413,25 +418,18 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
 
         if (kvm_enabled()) {
             /* Disabling a supported length disables all larger lengths. */
-            for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
-                if (test_bit(vq - 1, cpu->sve_vq_init) &&
-                    test_bit(vq - 1, cpu->sve_vq_supported)) {
-                    break;
-                }
-            }
+            tmp = vq_init & vq_supported;
         } else {
             /* Disabling a power-of-two disables all larger lengths. */
-            for (vq = 1; vq <= ARM_MAX_VQ; vq <<= 1) {
-                if (test_bit(vq - 1, cpu->sve_vq_init)) {
-                    break;
-                }
-            }
+            tmp = vq_init & SVE_VQ_POW2_MAP;
         }
+        vq = ctz32(tmp) + 1;
 
         max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
-        bitmap_andnot(cpu->sve_vq_map, cpu->sve_vq_supported,
-                      cpu->sve_vq_init, max_vq);
-        if (max_vq == 0 || bitmap_empty(cpu->sve_vq_map, max_vq)) {
+        vq_mask = MAKE_64BIT_MASK(0, max_vq);
+        vq_map = vq_supported & ~vq_init & vq_mask;
+
+        if (max_vq == 0 || vq_map == 0) {
             error_setg(errp, "cannot disable sve%d", vq * 128);
             error_append_hint(errp, "Disabling sve%d results in all "
                               "vector lengths being disabled.\n",
@@ -441,7 +439,8 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
             return;
         }
 
-        max_vq = find_last_bit(cpu->sve_vq_map, max_vq) + 1;
+        max_vq = 32 - clz32(vq_map);
+        vq_mask = MAKE_64BIT_MASK(0, max_vq);
     }
 
     /*
@@ -451,9 +450,9 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
      */
     if (cpu->sve_max_vq != 0) {
         max_vq = cpu->sve_max_vq;
+        vq_mask = MAKE_64BIT_MASK(0, max_vq);
 
-        if (!test_bit(max_vq - 1, cpu->sve_vq_map) &&
-            test_bit(max_vq - 1, cpu->sve_vq_init)) {
+        if (vq_init & ~vq_map & (1 << (max_vq - 1))) {
             error_setg(errp, "cannot disable sve%d", max_vq * 128);
             error_append_hint(errp, "The maximum vector length must be "
                               "enabled, sve-max-vq=%d (%d bits)\n",
@@ -462,8 +461,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
         }
 
         /* Set all bits not explicitly set within sve-max-vq. */
-        bitmap_complement(tmp, cpu->sve_vq_init, max_vq);
-        bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
+        vq_map |= ~vq_init & vq_mask;
     }
 
     /*
@@ -472,13 +470,14 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
      * are clear, just in case anybody looks.
      */
     assert(max_vq != 0);
-    bitmap_clear(cpu->sve_vq_map, max_vq, ARM_MAX_VQ - max_vq);
+    assert(vq_mask != 0);
+    vq_map &= vq_mask;
 
     /* Ensure the set of lengths matches what is supported. */
-    bitmap_xor(tmp, cpu->sve_vq_map, cpu->sve_vq_supported, max_vq);
-    if (!bitmap_empty(tmp, max_vq)) {
-        vq = find_last_bit(tmp, max_vq) + 1;
-        if (test_bit(vq - 1, cpu->sve_vq_map)) {
+    tmp = vq_map ^ (vq_supported & vq_mask);
+    if (tmp) {
+        vq = 32 - clz32(tmp);
+        if (vq_map & (1 << (vq - 1))) {
             if (cpu->sve_max_vq) {
                 error_setg(errp, "cannot set sve-max-vq=%d", cpu->sve_max_vq);
                 error_append_hint(errp, "This CPU does not support "
@@ -502,15 +501,15 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
                 return;
             } else {
                 /* Ensure all required powers-of-two are enabled. */
-                for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
-                    if (!test_bit(vq - 1, cpu->sve_vq_map)) {
-                        error_setg(errp, "cannot disable sve%d", vq * 128);
-                        error_append_hint(errp, "sve%d is required as it "
-                                          "is a power-of-two length smaller "
-                                          "than the maximum, sve%d\n",
-                                          vq * 128, max_vq * 128);
-                        return;
-                    }
+                tmp = SVE_VQ_POW2_MAP & vq_mask & ~vq_map;
+                if (tmp) {
+                    vq = 32 - clz32(tmp);
+                    error_setg(errp, "cannot disable sve%d", vq * 128);
+                    error_append_hint(errp, "sve%d is required as it "
+                                      "is a power-of-two length smaller "
+                                      "than the maximum, sve%d\n",
+                                      vq * 128, max_vq * 128);
+                    return;
                 }
             }
         }
@@ -530,6 +529,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
 
     /* From now on sve_max_vq is the actual maximum supported length. */
     cpu->sve_max_vq = max_vq;
+    cpu->sve_vq_map = vq_map;
 }
 
 static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
@@ -590,7 +590,7 @@ static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
     if (!cpu_isar_feature(aa64_sve, cpu)) {
         value = false;
     } else {
-        value = test_bit(vq - 1, cpu->sve_vq_map);
+        value = extract32(cpu->sve_vq_map, vq - 1, 1);
     }
     visit_type_bool(v, name, &value, errp);
 }
@@ -612,12 +612,8 @@ static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    if (value) {
-        set_bit(vq - 1, cpu->sve_vq_map);
-    } else {
-        clear_bit(vq - 1, cpu->sve_vq_map);
-    }
-    set_bit(vq - 1, cpu->sve_vq_init);
+    cpu->sve_vq_map = deposit32(cpu->sve_vq_map, vq - 1, 1, value);
+    cpu->sve_vq_init |= 1 << (vq - 1);
 }
 
 static bool cpu_arm_get_sve(Object *obj, Error **errp)
@@ -978,7 +974,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->dcz_blocksize = 7; /*  512 bytes */
 #endif
 
-    bitmap_fill(cpu->sve_vq_supported, ARM_MAX_VQ);
+    cpu->sve_vq_supported = MAKE_64BIT_MASK(0, ARM_MAX_VQ);
 
     aarch64_add_pauth_properties(obj);
     aarch64_add_sve_properties(obj);
@@ -1025,12 +1021,11 @@ static void aarch64_a64fx_initfn(Object *obj)
     cpu->gic_vprebits = 5;
     cpu->gic_pribits = 5;
 
-    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
+    /* The A64FX supports only 128, 256 and 512 bit vector lengths */
     aarch64_add_sve_properties(obj);
-    bitmap_zero(cpu->sve_vq_supported, ARM_MAX_VQ);
-    set_bit(0, cpu->sve_vq_supported); /* 128bit */
-    set_bit(1, cpu->sve_vq_supported); /* 256bit */
-    set_bit(3, cpu->sve_vq_supported); /* 512bit */
+    cpu->sve_vq_supported = (1 << 0)  /* 128bit */
+                          | (1 << 1)  /* 256bit */
+                          | (1 << 3); /* 512bit */
 
     cpu->isar.reset_pmcr_el0 = 0x46014040;
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e84d30e5fc..7b6f31e9c8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6229,7 +6229,6 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
 {
     ARMCPU *cpu = env_archcpu(env);
     uint32_t len = cpu->sve_max_vq - 1;
-    uint32_t end_len;
 
     if (el <= 1 && !el_is_in_host(env, el)) {
         len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
@@ -6241,12 +6240,8 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
         len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
     }
 
-    end_len = len;
-    if (!test_bit(len, cpu->sve_vq_map)) {
-        end_len = find_last_bit(cpu->sve_vq_map, len);
-        assert(end_len < len);
-    }
-    return end_len;
+    len = 31 - clz32(cpu->sve_vq_map & MAKE_64BIT_MASK(0, len + 1));
+    return len;
 }
 
 static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 363032da90..b3f635fc95 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -760,15 +760,13 @@ bool kvm_arm_steal_time_supported(void)
 
 QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
 
-void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
+uint32_t kvm_arm_sve_get_vls(CPUState *cs)
 {
     /* Only call this function if kvm_arm_sve_supported() returns true. */
     static uint64_t vls[KVM_ARM64_SVE_VLS_WORDS];
     static bool probed;
     uint32_t vq = 0;
-    int i, j;
-
-    bitmap_zero(map, ARM_MAX_VQ);
+    int i;
 
     /*
      * KVM ensures all host CPUs support the same set of vector lengths.
@@ -809,46 +807,24 @@ void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
         if (vq > ARM_MAX_VQ) {
             warn_report("KVM supports vector lengths larger than "
                         "QEMU can enable");
+            vls[0] &= MAKE_64BIT_MASK(0, ARM_MAX_VQ);
         }
     }
 
-    for (i = 0; i < KVM_ARM64_SVE_VLS_WORDS; ++i) {
-        if (!vls[i]) {
-            continue;
-        }
-        for (j = 1; j <= 64; ++j) {
-            vq = j + i * 64;
-            if (vq > ARM_MAX_VQ) {
-                return;
-            }
-            if (vls[i] & (1UL << (j - 1))) {
-                set_bit(vq - 1, map);
-            }
-        }
-    }
+    return vls[0];
 }
 
 static int kvm_arm_sve_set_vls(CPUState *cs)
 {
-    uint64_t vls[KVM_ARM64_SVE_VLS_WORDS] = {0};
+    ARMCPU *cpu = ARM_CPU(cs);
+    uint64_t vls[KVM_ARM64_SVE_VLS_WORDS] = { cpu->sve_vq_map };
     struct kvm_one_reg reg = {
         .id = KVM_REG_ARM64_SVE_VLS,
         .addr = (uint64_t)&vls[0],
     };
-    ARMCPU *cpu = ARM_CPU(cs);
-    uint32_t vq;
-    int i, j;
 
     assert(cpu->sve_max_vq <= KVM_ARM64_SVE_VQ_MAX);
 
-    for (vq = 1; vq <= cpu->sve_max_vq; ++vq) {
-        if (test_bit(vq - 1, cpu->sve_vq_map)) {
-            i = (vq - 1) / 64;
-            j = (vq - 1) % 64;
-            vls[i] |= 1UL << j;
-        }
-    }
-
     return kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
 }
 
-- 
2.34.1


