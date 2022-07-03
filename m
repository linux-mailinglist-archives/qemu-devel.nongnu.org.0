Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E15564662
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:19:52 +0200 (CEST)
Received: from localhost ([::1]:49746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vlf-0005LP-CP
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzW-0001Vo-2n
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:07 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzT-0006gb-OA
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:05 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 b12-20020a17090a6acc00b001ec2b181c98so10564108pjm.4
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nffg//dkzBQoqRm5IXNwBlQ5m5g6qr/efQ0ZTxyujnA=;
 b=tDHaKxhX9KFtEIu5KOtZtndzqzuEDkEbwTsAxa7b9nHsnShlJEBTsabBbJBurwB86G
 yoijL/Fo5GYmRMB9G3heKBY8CxfKjuf6MFF73Tj1RQ890X+F9DIFrnDHZXaPD13INuPk
 tpEeA5dCnt9+v5PL4LBRXdT+Gyz0UMfuW6uEllX9ihC1OCXMvDCDiK3Qv3fzpgzBPP8g
 5g4xwZ6lyNLTdGq+dvZOQvJR52BBFtsmu3Es1sN7wAvfYDTWF4k5ipXMXfEVnFTtfjYy
 Db3V92cB+SS6excUuyLAR4+cmHNy4dIYsKxSuK6OLa2UjM9JBEY9w7zVyBcsKwXobUQd
 9CHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nffg//dkzBQoqRm5IXNwBlQ5m5g6qr/efQ0ZTxyujnA=;
 b=iI3AB4C5H6X09WbJ5oPfI4N0VNVS9IdIKitivDpXAz/ORNVGZjZd4ZyCNVv+5FD+RP
 YkNjER9X/jw6FeLzrILt4ztCWOF4YYShZSRmC8i3hbhjrJoIxmsAlLn8n+so1RFax/Wp
 oStGfKwpWoZih0dqaJX1xkG0cO/aBDrRnkzFClrLBHax4HNjlO4VD55zJ1U+ueQd5cJs
 FOVWqPo/MzIg3ObnB66X+IWHSKS8vrhXJ0qMPH4uOvJ8BzDbrbK74sd4hTtlGbf03Bmz
 Da+H8gYT9hgVbFg64NDnf4NnDlEWeUnvZAI1rVKYBqxIXoqV5H3+vdq9QzUo3ioMYMnQ
 QdKQ==
X-Gm-Message-State: AJIora+f9mrHyf9dd7GAYg5gVGnhzWO4sFJOvbPlYY7nENpNaSy0z026
 q1T/Jd0+eRUqeGSi+D+DSm7HIc+ENGxzfYL6
X-Google-Smtp-Source: AGRyM1uEiKHtyS/w/3NXHpiFVEV9hX2N2oSmPV89OvmJX0Tz+p7nZpA8Ad94H3bZeyt+dCJS4ZC5nQ==
X-Received: by 2002:a17:90a:598f:b0:1ef:32d9:1fa2 with SMTP id
 l15-20020a17090a598f00b001ef32d91fa2mr22308483pji.182.1656837002748; 
 Sun, 03 Jul 2022 01:30:02 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:30:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 51/62] target/arm: Add ptw_idx argument to S1_ptw_translate
Date: Sun,  3 Jul 2022 13:54:08 +0530
Message-Id: <20220703082419.770989-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
get_phys_addr_with_secure and get_phys_addr_twostage.
This removes the duplicate check for stage2 disabled
from the middle of the walk, performing it only once.

Pass ptw_idx through get_phys_addr_{v5,v6,lpae} and
arm_{ldl,ldq}_ptw.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 100 +++++++++++++++++++++++++++++++----------------
 1 file changed, 67 insertions(+), 33 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e42286b4c1..6eb61849d3 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -17,7 +17,8 @@
 
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool is_secure, bool s1_is_el0,
+                               ARMMMUIdx ptw_idx, bool is_secure,
+                               bool s1_is_el0,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
@@ -190,21 +191,16 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
 }
 
 /* Translate a S1 pagetable walk through S2 if needed.  */
-static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx, hwaddr addr,
+static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
+                             ARMMMUIdx s2_mmu_idx, hwaddr addr,
                              bool *is_secure_ptr, void **hphys, hwaddr *gphys,
                              ARMMMUFaultInfo *fi)
 {
     bool is_secure = *is_secure_ptr;
-    ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
     MemTxAttrs attrs = {};
     PageEntryExtra extra;
     int flags;
 
-    if (!arm_mmu_idx_is_stage1_of_2(mmu_idx)
-        || regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
-        s2_mmu_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
-    }
-
     env->tlb_fi = fi;
     flags = probe_access_extra(env, addr, MMU_DATA_LOAD,
                                arm_to_core_mmu_idx(s2_mmu_idx),
@@ -267,7 +263,8 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx, hwaddr addr,
 
 /* All loads done in the course of a page table walk go through here. */
 static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
+                            ARMMMUIdx mmu_idx, ARMMMUIdx ptw_idx,
+                            ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     void *hphys;
@@ -275,7 +272,7 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     uint32_t data;
     bool be;
 
-    if (!S1_ptw_translate(env, mmu_idx, addr, &is_secure,
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, &is_secure,
                           &hphys, &gphys, fi)) {
         /* Failure. */
         assert(fi->s1ptw);
@@ -311,7 +308,8 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
 }
 
 static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
+                            ARMMMUIdx mmu_idx, ARMMMUIdx ptw_idx,
+                            ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     void *hphys;
@@ -319,7 +317,7 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     uint64_t data;
     bool be;
 
-    if (!S1_ptw_translate(env, mmu_idx, addr, &is_secure,
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, &is_secure,
                           &hphys, &gphys, fi)) {
         /* Failure. */
         assert(fi->s1ptw);
@@ -460,8 +458,8 @@ static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             bool is_secure, GetPhysAddrResult *result,
-                             ARMMMUFaultInfo *fi)
+                             ARMMMUIdx ptw_idx, bool is_secure,
+                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     int level = 1;
     uint32_t table;
@@ -480,7 +478,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -518,7 +516,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             /* Fine pagetable.  */
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -579,8 +577,8 @@ do_fault:
 
 static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             bool is_secure, GetPhysAddrResult *result,
-                             ARMMMUFaultInfo *fi)
+                             ARMMMUIdx ptw_idx, bool is_secure,
+                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     int level = 1;
@@ -603,7 +601,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -656,7 +654,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -1011,7 +1009,8 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
  */
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool is_secure, bool s1_is_el0,
+                               ARMMMUIdx ptw_idx, bool is_secure,
+                               bool s1_is_el0,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -1237,7 +1236,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         descaddr |= (address >> (stride * (4 - level))) & indexmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
-        descriptor = arm_ldq_ptw(env, descaddr, !nstable, mmu_idx, fi);
+        descriptor = arm_ldq_ptw(env, descaddr, !nstable, mmu_idx, ptw_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -2408,7 +2407,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
     bool ret;
     bool ipa_secure;
     ARMCacheAttrs cacheattrs1;
-    ARMMMUIdx s2_mmu_idx;
+    ARMMMUIdx s2_mmu_idx, s2_ptw_idx;
     bool is_el0;
     uint64_t hcr;
 
@@ -2430,7 +2429,13 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
         ipa_secure = false;
     }
 
-    s2_mmu_idx = (ipa_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
+    if (ipa_secure) {
+        s2_mmu_idx = ARMMMUIdx_Stage2_S;
+        s2_ptw_idx = ARMMMUIdx_Phys_S;
+    } else {
+        s2_mmu_idx = ARMMMUIdx_Stage2;
+        s2_ptw_idx = ARMMMUIdx_Phys_NS;
+    }
     is_el0 = s1_mmu_idx == ARMMMUIdx_Stage1_E0;
 
     /*
@@ -2442,7 +2447,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
+    ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx, s2_ptw_idx,
                              ipa_secure, is_el0, result, fi);
     fi->s2addr = ipa;
 
@@ -2514,19 +2519,49 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                                bool is_secure, GetPhysAddrResult *result,
                                ARMMMUFaultInfo *fi)
 {
-    ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
+    ARMMMUIdx s1_mmu_idx, s2_mmu_idx, ptw_idx;
 
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
          * translations if mmu_idx is a two-stage regime, and stage2 enabled.
          */
+        s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
         if (arm_feature(env, ARM_FEATURE_EL2) &&
-            !regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
+            !regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
             return get_phys_addr_twostage(env, address, access_type,
                                           s1_mmu_idx, is_secure,
                                           result, fi);
         }
+        /* fall through */
+
+    default:
+        /* Single stage and second stage uses physical for ptw. */
+        ptw_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
+        break;
     }
 
     /*
@@ -2583,18 +2618,17 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
     /* Definitely a real MMU, not an MPU */
 
     if (regime_translation_disabled(env, mmu_idx, is_secure)) {
-        return get_phys_addr_disabled(env, address, access_type, mmu_idx,
-                                      is_secure, result, fi);
+        goto do_disabled;
     }
     if (regime_using_lpae_format(env, mmu_idx)) {
         return get_phys_addr_lpae(env, address, access_type, mmu_idx,
-                                  is_secure, false, result, fi);
+                                  ptw_idx, is_secure, false, result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx,
-                                is_secure, result, fi);
+                                ptw_idx, is_secure, result, fi);
     } else {
         return get_phys_addr_v5(env, address, access_type, mmu_idx,
-                                is_secure, result, fi);
+                                ptw_idx, is_secure, result, fi);
     }
 }
 
-- 
2.34.1


