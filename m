Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71570529936
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 07:58:41 +0200 (CEST)
Received: from localhost ([::1]:44974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqqEC-00054R-IR
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 01:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4r-0000U6-8A
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:49:04 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:44634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4n-0007oE-Bj
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:49:00 -0400
Received: by mail-pg1-x536.google.com with SMTP id v10so16027221pgl.11
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 22:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LYTg1A3lKU1yuIoLWQgssj5UJqZjf3gnfu+aKeLn8kc=;
 b=FDm2qPOKrXwb0geJhZVzkAuCZmVV50cIMew58BCAsiLtycoNbtLWRYIPuiHzCL8iXK
 Mtgb9cl4+ukILQjuqpvgfD32RFwSOaVpG501AdpFcPR056bOGAQ+IdEGoq9RtgtLM3Wj
 c6uwA60D/KMeq0OGHVqeb//KCentAF/XSv1YmAt5Dto2/d5Pu3nG/WX+PFOV+2Wnz7MR
 1shprgSoHbqJ8eoQ5uZ5widIDhHzm/duPef9qXE+Njwf5D7dul2O4TP/SpYclH6QpWvs
 klYVdCY1W5U4/gPtnQe+ioStskMzAIePKvRg6nTtq8HUDHuhPOyn3imr6+07iVjbTUzu
 RDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LYTg1A3lKU1yuIoLWQgssj5UJqZjf3gnfu+aKeLn8kc=;
 b=cb8eWrsnlPvvBszo0onCUSb9YfzxpyAqOwQ7fwQXj77uY5R0ofUljMSd6Jk5Tb+4u+
 isky5eIfc/oM4Sq6zZK/QPtIh+L8dvqEXKQA/IOA3N+wlTWtCJqma+JSXroHQ1kyM90Z
 5EoKjnpcaTSnzLUXWgnWDkD4nRrU0nn+5xEFlW8GSlmq+9cvXXbgv4ya1XF+xoGnnVsr
 cbyNIoUotRNLb89djs4txWECTuCE5mo5twWVWwFT7kp77HGEjdynXToYcyr/VhaohTLB
 aLh27cX37ZfQBOM4NVXPWoABaiPhpLx1II6M7qq/0dFq3bH9ROidaUbXYljB7Jyhc+m4
 ZzDA==
X-Gm-Message-State: AOAM533wTl+Ion/CuqKzQM5cxm5G8fEYyD57W40SU7ZeENLGlMsmZZCO
 0UnYs71pyy8auSX4Uouwk58BMwYgbdvpjQ==
X-Google-Smtp-Source: ABdhPJxyMQ+Z4GAyKCEVZeM844hltFuI+/nU5Rp+MpafX1fcXAkt6iGWRUgAJqFiQnaQriaH9mzJ5g==
X-Received: by 2002:a63:fa4b:0:b0:3db:b85:c080 with SMTP id
 g11-20020a63fa4b000000b003db0b85c080mr18236708pgk.465.1652766535938; 
 Mon, 16 May 2022 22:48:55 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 b12-20020a170902d88c00b0015e8d4eb1fasm8146670plz.68.2022.05.16.22.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 22:48:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 5/7] target/arm: Use uint32_t instead of bitmap for sve vq's
Date: Mon, 16 May 2022 22:48:48 -0700
Message-Id: <20220517054850.177016-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220517054850.177016-1-richard.henderson@linaro.org>
References: <20220517054850.177016-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
index d23b7b3ad4..db7e51bf67 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1039,9 +1039,9 @@ struct ArchCPU {
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
index 36ff843cef..4165d49570 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1312,4 +1312,9 @@ void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 
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
index 4ab1dcf2ef..a020933975 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -341,8 +341,11 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
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
@@ -350,10 +353,16 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
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
@@ -361,8 +370,9 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
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
@@ -378,15 +388,10 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
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
@@ -399,25 +404,18 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
 
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
@@ -427,7 +425,8 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
             return;
         }
 
-        max_vq = find_last_bit(cpu->sve_vq_map, max_vq) + 1;
+        max_vq = 32 - clz32(vq_map);
+        vq_mask = MAKE_64BIT_MASK(0, max_vq);
     }
 
     /*
@@ -437,9 +436,9 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
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
@@ -448,8 +447,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
         }
 
         /* Set all bits not explicitly set within sve-max-vq. */
-        bitmap_complement(tmp, cpu->sve_vq_init, max_vq);
-        bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
+        vq_map |= ~vq_init & vq_mask;
     }
 
     /*
@@ -458,13 +456,14 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
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
@@ -488,15 +487,15 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
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
@@ -516,6 +515,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
 
     /* From now on sve_max_vq is the actual maximum supported length. */
     cpu->sve_max_vq = max_vq;
+    cpu->sve_vq_map = vq_map;
 }
 
 static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
@@ -576,7 +576,7 @@ static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
     if (!cpu_isar_feature(aa64_sve, cpu)) {
         value = false;
     } else {
-        value = test_bit(vq - 1, cpu->sve_vq_map);
+        value = (cpu->sve_vq_map >> (vq - 1)) & 1;
     }
     visit_type_bool(v, name, &value, errp);
 }
@@ -598,12 +598,8 @@ static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
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
@@ -952,7 +948,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->dcz_blocksize = 7; /*  512 bytes */
 #endif
 
-    bitmap_fill(cpu->sve_vq_supported, ARM_MAX_VQ);
+    cpu->sve_vq_supported = MAKE_64BIT_MASK(0, ARM_MAX_VQ);
 
     aarch64_add_pauth_properties(obj);
     aarch64_add_sve_properties(obj);
@@ -998,12 +994,11 @@ static void aarch64_a64fx_initfn(Object *obj)
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
 
-    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
+    /* Suppport of A64FX's vector length are 128, 256 and 512bit only */
     aarch64_add_sve_properties(obj);
-    bitmap_zero(cpu->sve_vq_supported, ARM_MAX_VQ);
-    set_bit(0, cpu->sve_vq_supported); /* 128bit */
-    set_bit(1, cpu->sve_vq_supported); /* 256bit */
-    set_bit(3, cpu->sve_vq_supported); /* 512bit */
+    cpu->sve_vq_supported = (1 << 0)  /* 128bit */
+                          | (1 << 1)  /* 256bit */
+                          | (1 << 3); /* 512bit */
 
     /* TODO:  Add A64FX specific HPC extension registers */
 }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0308920357..edeab4e473 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6225,7 +6225,6 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
 {
     ARMCPU *cpu = env_archcpu(env);
     uint32_t len = cpu->sve_max_vq - 1;
-    uint32_t end_len;
 
     if (el <= 1 &&
         (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
@@ -6238,12 +6237,8 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
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
index b8cfaf5782..16cf01acb5 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -748,15 +748,13 @@ bool kvm_arm_steal_time_supported(void)
 
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
@@ -797,46 +795,24 @@ void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
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


