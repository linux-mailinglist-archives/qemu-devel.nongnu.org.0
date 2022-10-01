Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B205F1DFD
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 19:00:47 +0200 (CEST)
Received: from localhost ([::1]:54850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefr4-0003N5-I1
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 13:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefI8-0008Go-AQ
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:40 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:46857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefI6-0006PQ-5a
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:40 -0400
Received: by mail-qk1-x736.google.com with SMTP id d17so4524602qko.13
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=WH93/bK7v3kp/pKnTict/jbomZX/0gxJBlUtQBFUx68=;
 b=fw16RTiYbXvGuI1+bAZl3XOPQOivuJ28ewOkNsEcxowpjr6zUucmOMbX5wqofcsbcd
 r4hNNckolDWXfHN5WauEJJmdSaCfaS2qZIGg7eUKnrQgyo28LkBif+OQyDkMmJJdvTl2
 pDKH0/90Kbq1he4i6nvvhkAvp4PJMz9EHs5ns1X+5HO6uh1v5gRfsmZwi5ixNXLg0hXI
 +nk4OsU2YiR17yWaBzswPaqU25ypMvH1vXdAP5tuKvz/KJ/5SqT7ST0FAWPFZl0gJ6aR
 EjM5B59bnFZvWOGK7z7o7C3jBwVda2zWsQqb+yi5H5ZsDqk9Myt8dOGK3Piw9O0Sckcx
 PLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WH93/bK7v3kp/pKnTict/jbomZX/0gxJBlUtQBFUx68=;
 b=WRYn7R66yGn6ofnmZ4CMyM3eNDSd/x7wOYS+QA4QGQMg0HZqyuZ8zUdtlt+dGWa0bG
 lXC89mesEs+S0TlTMyx7wKZcXERsrJbRBEx5mz+lYRfrwVpEeoPXn8aiYfi/x7rz+o2x
 wky43hP7guqE1aiwQZCER6gohxMo2XtIcZHdMKGxWkjYSetBjuo83fImVNDhPCLJBWEF
 m3Wita0AsEn7GspDMe/a0SYV95qqzcuTgdF3IMx590IlACJOmWQBSGs3tLaF0rlnC9wK
 CxlIZy5XSrpDeVKJ3aw9p5NQg+BogT3r39QFc2clJq4pHUJr3pstFsC5Uv+iHfebMMT4
 up3g==
X-Gm-Message-State: ACrzQf1QM2E6K8IcNdc9WD+BhGaZVlAHzsKMGAaK2KKljbbhN7lTKArA
 EePQxWcZE6z4dgY6f2QLcZINyQVHR8oy8w==
X-Google-Smtp-Source: AMsMyM60wIuvcByFIvwoQYiW4d3+dWA7C1FURoet2/qcj+HQfYyZiYj4WBvGTArmCtjQiM4L7aF7Ug==
X-Received: by 2002:a05:620a:448e:b0:6ce:8dd2:bc46 with SMTP id
 x14-20020a05620a448e00b006ce8dd2bc46mr9748377qkp.705.1664641477034; 
 Sat, 01 Oct 2022 09:24:37 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 30/42] target/arm: Add ptw_idx argument to S1_ptw_translate
Date: Sat,  1 Oct 2022 09:23:06 -0700
Message-Id: <20221001162318.153420-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hoist the computation of the mmu_idx for the ptw up to
get_phys_addr_with_secure_debug and get_phys_addr_twostage.
This removes the duplicate check for stage2 disabled
from the middle of the walk, performing it only once.

Pass ptw_idx through get_phys_addr_{v5,v6,lpae} and arm_{ldl,ldq}_ptw.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 104 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 71 insertions(+), 33 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 445382ab03..7a77bea2c7 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -17,7 +17,8 @@
 
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool is_secure, bool s1_is_el0, bool debug,
+                               ARMMMUIdx ptw_idx, bool is_secure,
+                               bool s1_is_el0, bool debug,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
@@ -220,21 +221,16 @@ static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
 }
 
 /* Translate a S1 pagetable walk through S2 if needed.  */
-static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx, hwaddr addr,
+static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
+                             ARMMMUIdx s2_mmu_idx, hwaddr addr,
                              bool *is_secure_ptr, void **hphys, hwaddr *gphys,
                              bool debug, ARMMMUFaultInfo *fi)
 {
     bool is_secure = *is_secure_ptr;
-    ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
-    bool s2_phys = false;
     uint8_t pte_attrs;
-    bool pte_secure;
+    bool s2_phys, pte_secure;
 
-    if (!arm_mmu_idx_is_stage1_of_2(mmu_idx)
-        || regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
-        s2_mmu_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
-        s2_phys = true;
-    }
+    s2_phys = s2_mmu_idx == ARMMMUIdx_Phys_S || s2_mmu_idx == ARMMMUIdx_Phys_NS;
 
     if (unlikely(debug)) {
         /*
@@ -247,8 +243,12 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx, hwaddr addr,
             pte_secure = is_secure;
         } else {
             GetPhysAddrResult s2 = { };
+            ARMMMUIdx phys_idx = (is_secure ? ARMMMUIdx_Phys_S
+                                  : ARMMMUIdx_Phys_NS);
+
             if (!get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx,
-                                    is_secure, false, debug, &s2, fi)) {
+                                    phys_idx, is_secure, false, debug,
+                                    &s2, fi)) {
                 goto fail;
             }
             *gphys = s2.f.phys_addr;
@@ -310,7 +310,8 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx, hwaddr addr,
 
 /* All loads done in the course of a page table walk go through here. */
 static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, bool debug, ARMMMUFaultInfo *fi)
+                            ARMMMUIdx mmu_idx, ARMMMUIdx ptw_idx,
+                            bool debug, ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     void *hphys;
@@ -318,7 +319,7 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     uint32_t data;
     bool be;
 
-    if (!S1_ptw_translate(env, mmu_idx, addr, &is_secure,
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, &is_secure,
                           &hphys, &gphys, debug, fi)) {
         /* Failure. */
         assert(fi->s1ptw);
@@ -354,7 +355,8 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
 }
 
 static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, bool debug, ARMMMUFaultInfo *fi)
+                            ARMMMUIdx mmu_idx, ARMMMUIdx ptw_idx,
+                            bool debug, ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     void *hphys;
@@ -362,7 +364,7 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     uint64_t data;
     bool be;
 
-    if (!S1_ptw_translate(env, mmu_idx, addr, &is_secure,
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, &is_secure,
                           &hphys, &gphys, debug, fi)) {
         /* Failure. */
         assert(fi->s1ptw);
@@ -507,7 +509,7 @@ static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             bool is_secure, bool debug,
+                             ARMMMUIdx ptw_idx, bool is_secure, bool debug,
                              GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     int level = 1;
@@ -527,7 +529,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, debug, fi);
+    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, debug, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -565,7 +567,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             /* Fine pagetable.  */
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, debug, fi);
+        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, debug, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -626,7 +628,7 @@ do_fault:
 
 static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             bool is_secure, bool debug,
+                             ARMMMUIdx ptw_idx, bool is_secure, bool debug,
                              GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -650,7 +652,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, debug, fi);
+    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, debug, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -703,7 +705,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, debug, fi);
+        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, debug, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -1058,7 +1060,8 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
  */
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool is_secure, bool s1_is_el0, bool debug,
+                               ARMMMUIdx ptw_idx, bool is_secure,
+                               bool s1_is_el0, bool debug,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -1284,7 +1287,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         descaddr |= (address >> (stride * (4 - level))) & indexmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
-        descriptor = arm_ldq_ptw(env, descaddr, !nstable, mmu_idx, debug, fi);
+        descriptor = arm_ldq_ptw(env, descaddr, !nstable, mmu_idx,
+                                 ptw_idx, debug, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -2446,7 +2450,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
     int s1_prot;
     bool ret, ipa_secure, s2walk_secure;
     ARMCacheAttrs cacheattrs1;
-    ARMMMUIdx s2_mmu_idx;
+    ARMMMUIdx s2_mmu_idx, s2_ptw_idx;
     bool is_el0;
     uint64_t hcr;
 
@@ -2471,7 +2475,13 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
         s2walk_secure = false;
     }
 
-    s2_mmu_idx = (s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
+    if (s2walk_secure) {
+        s2_mmu_idx = ARMMMUIdx_Stage2_S;
+        s2_ptw_idx = ARMMMUIdx_Phys_S;
+    } else {
+        s2_mmu_idx = ARMMMUIdx_Stage2;
+        s2_ptw_idx = ARMMMUIdx_Phys_NS;
+    }
     is_el0 = s1_mmu_idx == ARMMMUIdx_Stage1_E0;
 
     /*
@@ -2482,7 +2492,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
+    ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx, s2_ptw_idx,
                              s2walk_secure, is_el0, debug, result, fi);
     fi->s2addr = ipa;
 
@@ -2534,9 +2544,32 @@ static bool get_phys_addr_with_secure_debug(CPUARMState *env,
                                             GetPhysAddrResult *result,
                                             ARMMMUFaultInfo *fi)
 {
-    ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
+    ARMMMUIdx s1_mmu_idx, ptw_idx;
 
-    if (mmu_idx != s1_mmu_idx) {
+    switch (mmu_idx) {
+    case ARMMMUIdx_Phys_S:
+    case ARMMMUIdx_Phys_NS:
+    do_disabled:
+        /* Checking Phys early avoids special casing later vs regime_el. */
+        return get_phys_addr_disabled(env, address, access_type, mmu_idx,
+                                      is_secure, result, fi);
+
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_Stage1_E1_PAN:
+        /* First stage lookup uses second stage for ptw. */
+        ptw_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+        break;
+
+    case ARMMMUIdx_E10_0:
+        s1_mmu_idx = ARMMMUIdx_Stage1_E0;
+        goto do_twostage;
+    case ARMMMUIdx_E10_1:
+        s1_mmu_idx = ARMMMUIdx_Stage1_E1;
+        goto do_twostage;
+    case ARMMMUIdx_E10_1_PAN:
+        s1_mmu_idx = ARMMMUIdx_Stage1_E1_PAN;
+    do_twostage:
         /*
          * Call ourselves recursively to do the stage 1 and then stage 2
          * translations if mmu_idx is a two-stage regime.
@@ -2548,6 +2581,12 @@ static bool get_phys_addr_with_secure_debug(CPUARMState *env,
         }
         /* For non-EL2 CPUs a stage1+stage2 translation is just stage 1. */
         mmu_idx = s1_mmu_idx;
+        /* fall through */
+
+    default:
+        /* Single stage and second stage uses physical for ptw. */
+        ptw_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
+        break;
     }
 
     /*
@@ -2604,18 +2643,17 @@ static bool get_phys_addr_with_secure_debug(CPUARMState *env,
     /* Definitely a real MMU, not an MPU */
 
     if (regime_translation_disabled(env, mmu_idx, is_secure)) {
-        return get_phys_addr_disabled(env, address, access_type, mmu_idx,
-                                      is_secure, result, fi);
+        goto do_disabled;
     }
     if (regime_using_lpae_format(env, mmu_idx)) {
         return get_phys_addr_lpae(env, address, access_type, mmu_idx,
-                                  is_secure, false, debug, result, fi);
+                                  ptw_idx, is_secure, false, debug, result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx,
-                                is_secure, debug, result, fi);
+                                ptw_idx, is_secure, debug, result, fi);
     } else {
         return get_phys_addr_v5(env, address, access_type, mmu_idx,
-                                is_secure, debug, result, fi);
+                                ptw_idx, is_secure, debug, result, fi);
     }
 }
 
-- 
2.34.1


