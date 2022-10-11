Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 731285FAB28
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 05:27:09 +0200 (CEST)
Received: from localhost ([::1]:43882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi5vA-0007ge-ET
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 23:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nq-0002J5-1o
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:34 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:41525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5ni-000312-OP
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:33 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 q10-20020a17090a304a00b0020b1d5f6975so10881635pjl.0
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uov6oVHifc7Y1/3vFmJS1/CKnlYeQIOdKbWg1B/qhKM=;
 b=fuSYhDAsb9kAKThJqbuKC9FTd9qkmJrOeVpfOl1cRRpBbip6HMmdOYXa6cd3i+5ydQ
 x08H7TrgLobdq3KfxGeg1AUJQIm8SQTWdyWrm9Z6vtONzC5ByQiypPSn8DLE62gRz/h7
 ZgEI0BxXdz12bMBZk4AGZ4Pymbu8SQSNwVqmSsgNsU/Lu3zJu5Fyz45DnGNNlaIx3Ht+
 ACYmvx5zOnLBUnrcJg9Q63DMKfKc+LKp0J7qkhYt131qIjpH+2nCC5Rdac3vVysYn8Lp
 3GyHm47kA0CZ534kdSWAA38Zwak5uoNODjrnMKTAtWQUG7+4MGW3OZWN/txm59Uln+A8
 zwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uov6oVHifc7Y1/3vFmJS1/CKnlYeQIOdKbWg1B/qhKM=;
 b=Avp6xLGrcskGOByD1yJuZOxLPnUpP3jzOPuEGdgY7VBHLAW+djOdbdrrMPSz8CiLq+
 rDpfuupK0Cw+whZJjYyMZAKEKW9DZYM7MmxpZWOUV0Pa+hPWItLPZFYVaTXEqg5NMZG5
 8yyuxjFhnEAglL21/P/2laaQwPiB6s8fYK6SVioX0hyFs+zUX+7tvDRpzDyVmQwQ/4Sa
 a5FjcA7y1xLYU3gBCTQI0Melgk3Pea9LjvkqjC8PTXXwnn5V9R3VVTfFZfpvf0Jps1td
 I69zWfuOfU5TWey7HrICK4uXih+5Jj+f8Kwk/ym4KqqyuukrukFz9UpeDZvpn+eZ1u8B
 s2lw==
X-Gm-Message-State: ACrzQf1TR65GvAaLZ8bh/rGbkkRFvma05GO+wIUimWIekn5hPr1L0E72
 OK5LEUSSYx6Bo2PNtX8d4BkMaHSrjZ9JzQ==
X-Google-Smtp-Source: AMsMyM5ZJHK7vSP63LKdUZvkGQ68cMP4d4kx0Zz1O1yj3RNAuhTAvnrOpmSlpETLIIBuFGaM9WET1Q==
X-Received: by 2002:a17:90a:4216:b0:20d:2891:157 with SMTP id
 o22-20020a17090a421600b0020d28910157mr13882873pjg.47.1665458365176; 
 Mon, 10 Oct 2022 20:19:25 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 07/24] target/arm: Split out S1Translate type
Date: Mon, 10 Oct 2022 20:18:54 -0700
Message-Id: <20221011031911.2408754-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Consolidate most of the inputs and outputs of S1_ptw_translate
into a single structure.  Plumb this through arm_ld*_ptw from
the controlling get_phys_addr_* routine.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Replaces a different S1TranslateResult patch, and plumbs the
    structure further out in the function call tree.
---
 target/arm/ptw.c | 140 ++++++++++++++++++++++++++---------------------
 1 file changed, 79 insertions(+), 61 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a977d09c6d..dee69ee743 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -14,9 +14,16 @@
 #include "idau.h"
 
 
-static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
-                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool is_secure, bool s1_is_el0,
+typedef struct S1Translate {
+    ARMMMUIdx in_mmu_idx;
+    bool in_secure;
+    bool out_secure;
+    hwaddr out_phys;
+} S1Translate;
+
+static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
+                               uint64_t address,
+                               MMUAccessType access_type, bool s1_is_el0,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
@@ -211,28 +218,31 @@ static bool ptw_attrs_are_device(uint64_t hcr, ARMCacheAttrs cacheattrs)
 }
 
 /* Translate a S1 pagetable walk through S2 if needed.  */
-static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
-                               hwaddr addr, bool *is_secure_ptr,
-                               ARMMMUFaultInfo *fi)
+static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
+                             hwaddr addr, ARMMMUFaultInfo *fi)
 {
-    bool is_secure = *is_secure_ptr;
+    bool is_secure = ptw->in_secure;
     ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
 
-    if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
+    if (arm_mmu_idx_is_stage1_of_2(ptw->in_mmu_idx) &&
         !regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
         GetPhysAddrResult s2 = {};
+        S1Translate s2ptw = {
+            .in_mmu_idx = s2_mmu_idx,
+            .in_secure = is_secure,
+        };
         uint64_t hcr;
         int ret;
 
-        ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx,
-                                 is_secure, false, &s2, fi);
+        ret = get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
+                                 false, &s2, fi);
         if (ret) {
             assert(fi->type != ARMFault_None);
             fi->s2addr = addr;
             fi->stage2 = true;
             fi->s1ptw = true;
             fi->s1ns = !is_secure;
-            return ~0;
+            return false;
         }
 
         hcr = arm_hcr_el2_eff_secstate(env, is_secure);
@@ -246,7 +256,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             fi->stage2 = true;
             fi->s1ptw = true;
             fi->s1ns = !is_secure;
-            return ~0;
+            return false;
         }
 
         if (arm_is_secure_below_el3(env)) {
@@ -256,19 +266,21 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             } else {
                 is_secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
             }
-            *is_secure_ptr = is_secure;
         } else {
             assert(!is_secure);
         }
 
         addr = s2.f.phys_addr;
     }
-    return addr;
+
+    ptw->out_secure = is_secure;
+    ptw->out_phys = addr;
+    return true;
 }
 
 /* All loads done in the course of a page table walk go through here. */
-static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
+static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
+                            ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     MemTxAttrs attrs = {};
@@ -276,13 +288,13 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     AddressSpace *as;
     uint32_t data;
 
-    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
-    attrs.secure = is_secure;
-    as = arm_addressspace(cs, attrs);
-    if (fi->s1ptw) {
+    if (!S1_ptw_translate(env, ptw, addr, fi)) {
         return 0;
     }
-    if (regime_translation_big_endian(env, mmu_idx)) {
+    addr = ptw->out_phys;
+    attrs.secure = ptw->out_secure;
+    as = arm_addressspace(cs, attrs);
+    if (regime_translation_big_endian(env, ptw->in_mmu_idx)) {
         data = address_space_ldl_be(as, addr, attrs, &result);
     } else {
         data = address_space_ldl_le(as, addr, attrs, &result);
@@ -295,8 +307,8 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     return 0;
 }
 
-static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
+static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
+                            ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     MemTxAttrs attrs = {};
@@ -304,13 +316,13 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     AddressSpace *as;
     uint64_t data;
 
-    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
-    attrs.secure = is_secure;
-    as = arm_addressspace(cs, attrs);
-    if (fi->s1ptw) {
+    if (!S1_ptw_translate(env, ptw, addr, fi)) {
         return 0;
     }
-    if (regime_translation_big_endian(env, mmu_idx)) {
+    addr = ptw->out_phys;
+    attrs.secure = ptw->out_secure;
+    as = arm_addressspace(cs, attrs);
+    if (regime_translation_big_endian(env, ptw->in_mmu_idx)) {
         data = address_space_ldq_be(as, addr, attrs, &result);
     } else {
         data = address_space_ldq_le(as, addr, attrs, &result);
@@ -431,10 +443,9 @@ static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
     return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
 }
 
-static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
-                             MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             bool is_secure, GetPhysAddrResult *result,
-                             ARMMMUFaultInfo *fi)
+static bool get_phys_addr_v5(CPUARMState *env, S1Translate *ptw,
+                             uint32_t address, MMUAccessType access_type,
+                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     int level = 1;
     uint32_t table;
@@ -448,18 +459,18 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
 
     /* Pagetable walk.  */
     /* Lookup l1 descriptor.  */
-    if (!get_level1_table_address(env, mmu_idx, &table, address)) {
+    if (!get_level1_table_address(env, ptw->in_mmu_idx, &table, address)) {
         /* Section translation fault if page walk is disabled by PD0 or PD1 */
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+    desc = arm_ldl_ptw(env, ptw, table, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
     type = (desc & 3);
     domain = (desc >> 5) & 0x0f;
-    if (regime_el(env, mmu_idx) == 1) {
+    if (regime_el(env, ptw->in_mmu_idx) == 1) {
         dacr = env->cp15.dacr_ns;
     } else {
         dacr = env->cp15.dacr_s;
@@ -491,7 +502,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             /* Fine pagetable.  */
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+        desc = arm_ldl_ptw(env, ptw, table, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -535,7 +546,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             g_assert_not_reached();
         }
     }
-    result->f.prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
+    result->f.prot = ap_to_rw_prot(env, ptw->in_mmu_idx, ap, domain_prot);
     result->f.prot |= result->f.prot ? PAGE_EXEC : 0;
     if (!(result->f.prot & (1 << access_type))) {
         /* Access permission fault.  */
@@ -550,12 +561,12 @@ do_fault:
     return true;
 }
 
-static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
-                             MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             bool is_secure, GetPhysAddrResult *result,
-                             ARMMMUFaultInfo *fi)
+static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
+                             uint32_t address, MMUAccessType access_type,
+                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
+    ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
     int level = 1;
     uint32_t table;
     uint32_t desc;
@@ -576,7 +587,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+    desc = arm_ldl_ptw(env, ptw, table, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -629,7 +640,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+        desc = arm_ldl_ptw(env, ptw, table, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -972,22 +983,25 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
  * the WnR bit is never set (the caller must do this).
  *
  * @env: CPUARMState
+ * @ptw: Current and next stage parameters for the walk.
  * @address: virtual address to get physical address for
  * @access_type: MMU_DATA_LOAD, MMU_DATA_STORE or MMU_INST_FETCH
- * @mmu_idx: MMU index indicating required translation regime
- * @s1_is_el0: if @mmu_idx is ARMMMUIdx_Stage2 (so this is a stage 2 page
- *             table walk), must be true if this is stage 2 of a stage 1+2
+ * @s1_is_el0: if @ptw->in_mmu_idx is ARMMMUIdx_Stage2
+ *             (so this is a stage 2 page table walk),
+ *             must be true if this is stage 2 of a stage 1+2
  *             walk for an EL0 access. If @mmu_idx is anything else,
  *             @s1_is_el0 is ignored.
  * @result: set on translation success,
  * @fi: set to fault info if the translation fails
  */
-static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
-                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool is_secure, bool s1_is_el0,
+static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
+                               uint64_t address,
+                               MMUAccessType access_type, bool s1_is_el0,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
+    ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
+    bool is_secure = ptw->in_secure;
     /* Read an LPAE long-descriptor translation table. */
     ARMFaultType fault_type = ARMFault_Translation;
     uint32_t level;
@@ -1204,7 +1218,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         descaddr |= (address >> (stride * (4 - level))) & indexmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
-        descriptor = arm_ldq_ptw(env, descaddr, !nstable, mmu_idx, fi);
+        ptw->in_secure = !nstable;
+        descriptor = arm_ldq_ptw(env, ptw, descaddr, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -2361,6 +2376,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                                ARMMMUFaultInfo *fi)
 {
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
+    S1Translate ptw;
 
     if (mmu_idx != s1_mmu_idx) {
         /*
@@ -2373,7 +2389,6 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             int ret;
             bool ipa_secure, s2walk_secure;
             ARMCacheAttrs cacheattrs1;
-            ARMMMUIdx s2_mmu_idx;
             bool is_el0;
             uint64_t hcr;
 
@@ -2398,8 +2413,9 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                 s2walk_secure = false;
             }
 
-            s2_mmu_idx = (s2walk_secure
-                          ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
+            ptw.in_mmu_idx =
+                s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+            ptw.in_secure = s2walk_secure;
             is_el0 = mmu_idx == ARMMMUIdx_E10_0;
 
             /*
@@ -2411,8 +2427,8 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             cacheattrs1 = result->cacheattrs;
             memset(result, 0, sizeof(*result));
 
-            ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
-                                     s2walk_secure, is_el0, result, fi);
+            ret = get_phys_addr_lpae(env, &ptw, ipa, access_type,
+                                     is_el0, result, fi);
             fi->s2addr = ipa;
 
             /* Combine the S1 and S2 perms.  */
@@ -2517,15 +2533,17 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
         return get_phys_addr_disabled(env, address, access_type, mmu_idx,
                                       is_secure, result, fi);
     }
+
+    ptw.in_mmu_idx = mmu_idx;
+    ptw.in_secure = is_secure;
+
     if (regime_using_lpae_format(env, mmu_idx)) {
-        return get_phys_addr_lpae(env, address, access_type, mmu_idx,
-                                  is_secure, false, result, fi);
+        return get_phys_addr_lpae(env, &ptw, address, access_type, false,
+                                  result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
-        return get_phys_addr_v6(env, address, access_type, mmu_idx,
-                                is_secure, result, fi);
+        return get_phys_addr_v6(env, &ptw, address, access_type, result, fi);
     } else {
-        return get_phys_addr_v5(env, address, access_type, mmu_idx,
-                                is_secure, result, fi);
+        return get_phys_addr_v5(env, &ptw, address, access_type, result, fi);
     }
 }
 
-- 
2.34.1


