Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CD659C47F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 19:00:22 +0200 (CEST)
Received: from localhost ([::1]:44416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQAmj-00036c-6z
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 13:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ow-0004kk-P0
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:43 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:38420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Om-0001am-73
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:38 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 s31-20020a17090a2f2200b001faaf9d92easo14332929pjd.3
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=QMHGZpV2baRUbxElNpiXVCtLXS1Q/rN0XnOdtvv92bo=;
 b=rjBcar3CJBc4WUqLPUh65JqRTaRma5nzjNxKwpMnNm2p5hRtiCd0HqKk7KKP+gcg0O
 baJAZ7S3AZ4elZqMxk+Y9+AoEYPrK1UrKMPC2yyM6Ky2+dVeb7AIDVKK+F707t5+81iA
 OEhDEcubJUQ6LBWBfsbGanTXFy1FFqgYfxdhvp2th4FjMbpG/oBwKDTferps17RcjIy0
 mXFAeCGG/Dh1qdkmRkGN5hU8RoDhEAPhhbdmKNbPBq00jP0qSIbUE+97ONe/hlKfb4Ee
 wD0WYSAipNwY2l8mCCExzl1UrFXRMu8VUDU+NQjOEX8reZ/3qEKoWR2xU8u9Ms9VBbxN
 VAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=QMHGZpV2baRUbxElNpiXVCtLXS1Q/rN0XnOdtvv92bo=;
 b=Dz+bZuj5dkeJtXN5FS//RO15JMYmLmZJ+tbPdQcg+y6iHIMeatVpP8WHaTQ2LbuFz3
 +eVJxxp3rILspqtQPhBuYWKLL6H+FIB9orvQpACXVSXlEwrugVFKEU95P5x8G968Dcb+
 nylxVPpcXKe4gLgPaI5Xcx66dshOjQW/WKG0YHEIIEYZl4mZItx2RvIPLWjI32WCuC97
 zW2t9ZfcXbGJTzYq7KeijdqPjLf0rEjY1wKfRVPuiM+BldGn5iG6CqkeCJFtQgqGytyb
 dXPrtDUM7/m7gf+rYtVktPFUvJcy/bEjbJdj/x3ULR9N2VakPjs2qcze13fS1HKKhOPH
 eGlA==
X-Gm-Message-State: ACgBeo3rSxWagp3+0/TNfeM+3ukf/hQEyOCtx9btWnmgBQjnLK563sGP
 z/zaue4TSTxG24i3OPMt/3s3nYw5eR8Krg==
X-Google-Smtp-Source: AA6agR6XhZ/cZKoaFjcATOw3+Upm+/FD+YipXw7Cv17e7F9KxjLYL5B8eFppDgl4T9hF0YyFCKISAA==
X-Received: by 2002:a17:903:451:b0:172:ddb9:fe4e with SMTP id
 iw17-20020a170903045100b00172ddb9fe4emr8739315plb.130.1661182291057; 
 Mon, 22 Aug 2022 08:31:31 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 55/66] target/arm: Add ptw_idx argument to S1_ptw_translate
Date: Mon, 22 Aug 2022 08:27:30 -0700
Message-Id: <20220822152741.1617527-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Hoist the computation of the mmu_idx for the ptw up to
get_phys_addr_with_secure and get_phys_addr_twostage.
This removes the duplicate check for stage2 disabled
from the middle of the walk, performing it only once.

Pass ptw_idx through get_phys_addr_{v5,v6,lpae} and arm_{ldl,ldq}_ptw.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 100 +++++++++++++++++++++++++++++++----------------
 1 file changed, 67 insertions(+), 33 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9366066ae0..9673b97f79 100644
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
 
@@ -190,20 +191,15 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
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
     CPUTLBEntryFull *full;
     int flags;
 
-    if (!arm_mmu_idx_is_stage1_of_2(mmu_idx)
-        || regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
-        s2_mmu_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
-    }
-
     env->tlb_fi = fi;
     flags = probe_access_full(env, addr, MMU_DATA_LOAD,
                               arm_to_core_mmu_idx(s2_mmu_idx),
@@ -266,7 +262,8 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx, hwaddr addr,
 
 /* All loads done in the course of a page table walk go through here. */
 static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
+                            ARMMMUIdx mmu_idx, ARMMMUIdx ptw_idx,
+                            ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     void *hphys;
@@ -274,7 +271,7 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     uint32_t data;
     bool be;
 
-    if (!S1_ptw_translate(env, mmu_idx, addr, &is_secure,
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, &is_secure,
                           &hphys, &gphys, fi)) {
         /* Failure. */
         assert(fi->s1ptw);
@@ -310,7 +307,8 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
 }
 
 static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
+                            ARMMMUIdx mmu_idx, ARMMMUIdx ptw_idx,
+                            ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     void *hphys;
@@ -318,7 +316,7 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     uint64_t data;
     bool be;
 
-    if (!S1_ptw_translate(env, mmu_idx, addr, &is_secure,
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, &is_secure,
                           &hphys, &gphys, fi)) {
         /* Failure. */
         assert(fi->s1ptw);
@@ -463,8 +461,8 @@ static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             bool is_secure, GetPhysAddrResult *result,
-                             ARMMMUFaultInfo *fi)
+                             ARMMMUIdx ptw_idx, bool is_secure,
+                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     int level = 1;
     uint32_t table;
@@ -483,7 +481,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -521,7 +519,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             /* Fine pagetable.  */
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -582,8 +580,8 @@ do_fault:
 
 static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             bool is_secure, GetPhysAddrResult *result,
-                             ARMMMUFaultInfo *fi)
+                             ARMMMUIdx ptw_idx, bool is_secure,
+                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     int level = 1;
@@ -606,7 +604,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -659,7 +657,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -1014,7 +1012,8 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
  */
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool is_secure, bool s1_is_el0,
+                               ARMMMUIdx ptw_idx, bool is_secure,
+                               bool s1_is_el0,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -1240,7 +1239,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         descaddr |= (address >> (stride * (4 - level))) & indexmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
-        descriptor = arm_ldq_ptw(env, descaddr, !nstable, mmu_idx, fi);
+        descriptor = arm_ldq_ptw(env, descaddr, !nstable, mmu_idx, ptw_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -2412,7 +2411,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
     bool ret;
     bool ipa_secure;
     ARMCacheAttrs cacheattrs1;
-    ARMMMUIdx s2_mmu_idx;
+    ARMMMUIdx s2_mmu_idx, s2_ptw_idx;
     bool is_el0;
     uint64_t hcr;
 
@@ -2434,7 +2433,13 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
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
@@ -2446,7 +2451,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
+    ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx, s2_ptw_idx,
                              ipa_secure, is_el0, result, fi);
     fi->s2addr = ipa;
 
@@ -2518,19 +2523,49 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
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
@@ -2587,18 +2622,17 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
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


