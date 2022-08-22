Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB9859C318
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 17:42:26 +0200 (CEST)
Received: from localhost ([::1]:37152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ9ZJ-0004cp-6x
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 11:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LA-000724-PP
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:27:48 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:55815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9L6-0000ds-QC
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:27:48 -0400
Received: by mail-pj1-x1036.google.com with SMTP id pm13so2424689pjb.5
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=m5cKad2hrAZKHnUS2CVhyFrLT2HL6vfTPa1btDlvuDw=;
 b=tHtn9GTDnrQuItjNh9GTk2NmQ4iwruAGZqFMWoWjX72HekTJ6D9PplkSh2J38tSiH7
 EtRO9kZdHxC2Sgb54GEvIVjPE1NODYO1mXo8i+u/nEjSZGVOHWriWXcUBRKgWYNsyiU9
 Ldtmou3tiPJg+B9V4y1t6oYYyKLeilBBKryt2SNK6k7A7LU+NZdHgoURlH6CmBfHgLqq
 6c7H/N0yHIQcVW7+z93FUsOlipVk6iyRcmpFoCJfB87qEIU5TivTZyMD7wSJKu9uDRP6
 8JrojoHl/xbIIzPOLPqO1Hrvr4a5qz2ycMCpiSd3jqoV7++bclPzAMNjOmW8qbKzpXZ2
 T3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=m5cKad2hrAZKHnUS2CVhyFrLT2HL6vfTPa1btDlvuDw=;
 b=hZu0jiN9Ngo0hToHidbK/BYMpHoXgzyTW4jxKZJsrmz8TKSmRab2BeyLfYAtboXxiK
 xZhmPhNvxDY6GJK6OzgbftGRvk3Mn3s7DrkYnF3lIpDICkWsNBGc60LburZxdtesYKTz
 s72Smknn8SCFHxi2/LcsKEaizWGt011Ah9Z5WjqxqppnKSE8rHzJOJVv7KQoGwlATZsM
 4vPzwzUYdTFsLa29Gobie2c9JbW2yvMv2pDhiT4fz33ZIxbwRZE1zal7yXCAELuU0W8R
 hY/c9hVPQpeW9/IPNEneeNxBo/w/0bFN9DPHLOIDeg94ZNcR+QZystaRK1VdtQkMRsxQ
 GwUw==
X-Gm-Message-State: ACgBeo34OjlzM9PPQTL5Z5CR4UQuyIqWyBYFYBUtoZdx4beNNxCHLFyS
 0H+97g9Ic9x4eR7juFioKeS4506ubL9pSg==
X-Google-Smtp-Source: AA6agR6oa+6kltN1ntYXRUfef0NlTasCMYNejmapJYnVtgKrQTQcV4gQKWaHAMDYpRnkp1IQGAIanA==
X-Received: by 2002:a17:90a:6b4c:b0:1fa:d973:e4eb with SMTP id
 x12-20020a17090a6b4c00b001fad973e4ebmr20228711pjl.15.1661182063263; 
 Mon, 22 Aug 2022 08:27:43 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 01/66] target/arm: Create GetPhysAddrResult
Date: Mon, 22 Aug 2022 08:26:36 -0700
Message-Id: <20220822152741.1617527-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

Combine 5 output pointer arguments from get_phys_addr
into a single struct.  Adjust all callers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h  |  13 ++++-
 target/arm/helper.c     |  27 ++++-----
 target/arm/m_helper.c   |  52 ++++++-----------
 target/arm/ptw.c        | 120 +++++++++++++++++++++-------------------
 target/arm/tlb_helper.c |  22 +++-----
 5 files changed, 109 insertions(+), 125 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index b8fefdff67..293e27b996 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1142,11 +1142,18 @@ typedef struct ARMCacheAttrs {
     bool is_s2_format:1;
 } ARMCacheAttrs;
 
+/* Fields that are valid upon success. */
+typedef struct GetPhysAddrResult {
+    hwaddr phys;
+    target_ulong page_size;
+    int prot;
+    MemTxAttrs attrs;
+    ARMCacheAttrs cacheattrs;
+} GetPhysAddrResult;
+
 bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                   hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
-                   target_ulong *page_size,
-                   ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
+                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
 void arm_log_exception(CPUState *cs);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d7bc467a2a..68373bc0a9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3107,24 +3107,19 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
 static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx)
 {
-    hwaddr phys_addr;
-    target_ulong page_size;
-    int prot;
     bool ret;
     uint64_t par64;
     bool format64 = false;
-    MemTxAttrs attrs = {};
     ARMMMUFaultInfo fi = {};
-    ARMCacheAttrs cacheattrs = {};
+    GetPhysAddrResult res = {};
 
-    ret = get_phys_addr(env, value, access_type, mmu_idx, &phys_addr, &attrs,
-                        &prot, &page_size, &fi, &cacheattrs);
+    ret = get_phys_addr(env, value, access_type, mmu_idx, &res, &fi);
 
     /*
      * ATS operations only do S1 or S1+S2 translations, so we never
      * have to deal with the ARMCacheAttrs format for S2 only.
      */
-    assert(!cacheattrs.is_s2_format);
+    assert(!res.cacheattrs.is_s2_format);
 
     if (ret) {
         /*
@@ -3230,12 +3225,12 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
         /* Create a 64-bit PAR */
         par64 = (1 << 11); /* LPAE bit always set */
         if (!ret) {
-            par64 |= phys_addr & ~0xfffULL;
-            if (!attrs.secure) {
+            par64 |= res.phys & ~0xfffULL;
+            if (!res.attrs.secure) {
                 par64 |= (1 << 9); /* NS */
             }
-            par64 |= (uint64_t)cacheattrs.attrs << 56; /* ATTR */
-            par64 |= cacheattrs.shareability << 7; /* SH */
+            par64 |= (uint64_t)res.cacheattrs.attrs << 56; /* ATTR */
+            par64 |= res.cacheattrs.shareability << 7; /* SH */
         } else {
             uint32_t fsr = arm_fi_to_lfsc(&fi);
 
@@ -3255,13 +3250,13 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
          */
         if (!ret) {
             /* We do not set any attribute bits in the PAR */
-            if (page_size == (1 << 24)
+            if (res.page_size == (1 << 24)
                 && arm_feature(env, ARM_FEATURE_V7)) {
-                par64 = (phys_addr & 0xff000000) | (1 << 1);
+                par64 = (res.phys & 0xff000000) | (1 << 1);
             } else {
-                par64 = phys_addr & 0xfffff000;
+                par64 = res.phys & 0xfffff000;
             }
-            if (!attrs.secure) {
+            if (!res.attrs.secure) {
                 par64 |= (1 << 9); /* NS */
             }
         } else {
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 308610f6b4..84c6796b8d 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -183,19 +183,14 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
 {
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
-    MemTxAttrs attrs = {};
     MemTxResult txres;
-    target_ulong page_size;
-    hwaddr physaddr;
-    int prot;
+    GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
-    ARMCacheAttrs cacheattrs = {};
     bool secure = mmu_idx & ARM_MMU_IDX_M_S;
     int exc;
     bool exc_secure;
 
-    if (get_phys_addr(env, addr, MMU_DATA_STORE, mmu_idx, &physaddr,
-                      &attrs, &prot, &page_size, &fi, &cacheattrs)) {
+    if (get_phys_addr(env, addr, MMU_DATA_STORE, mmu_idx, &res, &fi)) {
         /* MPU/SAU lookup failed */
         if (fi.type == ARMFault_QEMU_SFault) {
             if (mode == STACK_LAZYFP) {
@@ -228,8 +223,8 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
         }
         goto pend_fault;
     }
-    address_space_stl_le(arm_addressspace(cs, attrs), physaddr, value,
-                         attrs, &txres);
+    address_space_stl_le(arm_addressspace(cs, res.attrs), res.phys, value,
+                         res.attrs, &txres);
     if (txres != MEMTX_OK) {
         /* BusFault trying to write the data */
         if (mode == STACK_LAZYFP) {
@@ -276,20 +271,15 @@ static bool v7m_stack_read(ARMCPU *cpu, uint32_t *dest, uint32_t addr,
 {
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
-    MemTxAttrs attrs = {};
     MemTxResult txres;
-    target_ulong page_size;
-    hwaddr physaddr;
-    int prot;
+    GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
-    ARMCacheAttrs cacheattrs = {};
     bool secure = mmu_idx & ARM_MMU_IDX_M_S;
     int exc;
     bool exc_secure;
     uint32_t value;
 
-    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &physaddr,
-                      &attrs, &prot, &page_size, &fi, &cacheattrs)) {
+    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi)) {
         /* MPU/SAU lookup failed */
         if (fi.type == ARMFault_QEMU_SFault) {
             qemu_log_mask(CPU_LOG_INT,
@@ -308,8 +298,8 @@ static bool v7m_stack_read(ARMCPU *cpu, uint32_t *dest, uint32_t addr,
         goto pend_fault;
     }
 
-    value = address_space_ldl(arm_addressspace(cs, attrs), physaddr,
-                              attrs, &txres);
+    value = address_space_ldl(arm_addressspace(cs, res.attrs), res.phys,
+                              res.attrs, &txres);
     if (txres != MEMTX_OK) {
         /* BusFault trying to read the data */
         qemu_log_mask(CPU_LOG_INT, "...BusFault with BFSR.UNSTKERR\n");
@@ -2008,13 +1998,9 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
     V8M_SAttributes sattrs = {};
-    MemTxAttrs attrs = {};
+    GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
-    ARMCacheAttrs cacheattrs = {};
     MemTxResult txres;
-    target_ulong page_size;
-    hwaddr physaddr;
-    int prot;
 
     v8m_security_lookup(env, addr, MMU_INST_FETCH, mmu_idx, &sattrs);
     if (!sattrs.nsc || sattrs.ns) {
@@ -2028,16 +2014,15 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx,
                       "...really SecureFault with SFSR.INVEP\n");
         return false;
     }
-    if (get_phys_addr(env, addr, MMU_INST_FETCH, mmu_idx, &physaddr,
-                      &attrs, &prot, &page_size, &fi, &cacheattrs)) {
+    if (get_phys_addr(env, addr, MMU_INST_FETCH, mmu_idx, &res, &fi)) {
         /* the MPU lookup failed */
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_IACCVIOL_MASK;
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM, env->v7m.secure);
         qemu_log_mask(CPU_LOG_INT, "...really MemManage with CFSR.IACCVIOL\n");
         return false;
     }
-    *insn = address_space_lduw_le(arm_addressspace(cs, attrs), physaddr,
-                                 attrs, &txres);
+    *insn = address_space_lduw_le(arm_addressspace(cs, res.attrs), res.phys,
+                                  res.attrs, &txres);
     if (txres != MEMTX_OK) {
         env->v7m.cfsr[M_REG_NS] |= R_V7M_CFSR_IBUSERR_MASK;
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_BUS, false);
@@ -2060,17 +2045,12 @@ static bool v7m_read_sg_stack_word(ARMCPU *cpu, ARMMMUIdx mmu_idx,
      */
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
-    MemTxAttrs attrs = {};
     MemTxResult txres;
-    target_ulong page_size;
-    hwaddr physaddr;
-    int prot;
+    GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
-    ARMCacheAttrs cacheattrs = {};
     uint32_t value;
 
-    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &physaddr,
-                      &attrs, &prot, &page_size, &fi, &cacheattrs)) {
+    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi)) {
         /* MPU/SAU lookup failed */
         if (fi.type == ARMFault_QEMU_SFault) {
             qemu_log_mask(CPU_LOG_INT,
@@ -2088,8 +2068,8 @@ static bool v7m_read_sg_stack_word(ARMCPU *cpu, ARMMMUIdx mmu_idx,
         }
         return false;
     }
-    value = address_space_ldl(arm_addressspace(cs, attrs), physaddr,
-                              attrs, &txres);
+    value = address_space_ldl(arm_addressspace(cs, res.attrs), res.phys,
+                              res.attrs, &txres);
     if (txres != MEMTX_OK) {
         /* BusFault trying to read the data */
         qemu_log_mask(CPU_LOG_INT,
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 3261039d93..8db2abac01 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2300,18 +2300,12 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
  * @address: virtual address to get physical address for
  * @access_type: 0 for read, 1 for write, 2 for execute
  * @mmu_idx: MMU index indicating required translation regime
- * @phys_ptr: set to the physical address corresponding to the virtual address
- * @attrs: set to the memory transaction attributes to use
- * @prot: set to the permissions for the page containing phys_ptr
- * @page_size: set to the size of the page containing phys_ptr
+ * @result: set on translation success.
  * @fi: set to fault info if the translation fails
- * @cacheattrs: (if non-NULL) set to the cacheability/shareability attributes
  */
 bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                   hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
-                   target_ulong *page_size,
-                   ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
+                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
 
@@ -2322,43 +2316,54 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
          */
         if (arm_feature(env, ARM_FEATURE_EL2)) {
             hwaddr ipa;
-            int s2_prot;
+            int s1_prot;
             int ret;
             bool ipa_secure;
-            ARMCacheAttrs cacheattrs2 = {};
+            ARMCacheAttrs cacheattrs1;
             ARMMMUIdx s2_mmu_idx;
             bool is_el0;
 
-            ret = get_phys_addr(env, address, access_type, s1_mmu_idx, &ipa,
-                                attrs, prot, page_size, fi, cacheattrs);
+            ret = get_phys_addr(env, address, access_type, s1_mmu_idx,
+                                result, fi);
 
             /* If S1 fails or S2 is disabled, return early.  */
             if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
-                *phys_ptr = ipa;
                 return ret;
             }
 
-            ipa_secure = attrs->secure;
+            ipa = result->phys;
+            ipa_secure = result->attrs.secure;
             if (arm_is_secure_below_el3(env)) {
                 if (ipa_secure) {
-                    attrs->secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
+                    result->attrs.secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
                 } else {
-                    attrs->secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
+                    result->attrs.secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
                 }
             } else {
                 assert(!ipa_secure);
             }
 
-            s2_mmu_idx = attrs->secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+            s2_mmu_idx = (result->attrs.secure
+                          ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
             is_el0 = mmu_idx == ARMMMUIdx_E10_0 || mmu_idx == ARMMMUIdx_SE10_0;
 
-            /* S1 is done. Now do S2 translation.  */
+            /*
+             * S1 is done, now do S2 translation.
+             * Save the stage1 results so that we may merge
+             * prot and cacheattrs later.
+             */
+            s1_prot = result->prot;
+            cacheattrs1 = result->cacheattrs;
+            memset(result, 0, sizeof(*result));
+
             ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx, is_el0,
-                                     phys_ptr, attrs, &s2_prot,
-                                     page_size, fi, &cacheattrs2);
+                                     &result->phys, &result->attrs,
+                                     &result->prot, &result->page_size,
+                                     fi, &result->cacheattrs);
             fi->s2addr = ipa;
+
             /* Combine the S1 and S2 perms.  */
-            *prot &= s2_prot;
+            result->prot &= s1_prot;
 
             /* If S2 fails, return early.  */
             if (ret) {
@@ -2374,20 +2379,21 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                  *  Outer Write-Back Read-Allocate Write-Allocate.
                  * Do not overwrite Tagged within attrs.
                  */
-                if (cacheattrs->attrs != 0xf0) {
-                    cacheattrs->attrs = 0xff;
+                if (cacheattrs1.attrs != 0xf0) {
+                    cacheattrs1.attrs = 0xff;
                 }
-                cacheattrs->shareability = 0;
+                cacheattrs1.shareability = 0;
             }
-            *cacheattrs = combine_cacheattrs(env, *cacheattrs, cacheattrs2);
+            result->cacheattrs = combine_cacheattrs(env, cacheattrs1,
+                                                    result->cacheattrs);
 
             /* Check if IPA translates to secure or non-secure PA space. */
             if (arm_is_secure_below_el3(env)) {
                 if (ipa_secure) {
-                    attrs->secure =
+                    result->attrs.secure =
                         !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW));
                 } else {
-                    attrs->secure =
+                    result->attrs.secure =
                         !((env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))
                         || (env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW)));
                 }
@@ -2406,8 +2412,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
      * cannot upgrade an non-secure translation regime's attributes
      * to secure.
      */
-    attrs->secure = regime_is_secure(env, mmu_idx);
-    attrs->user = regime_is_user(env, mmu_idx);
+    result->attrs.secure = regime_is_secure(env, mmu_idx);
+    result->attrs.user = regime_is_user(env, mmu_idx);
 
     /*
      * Fast Context Switch Extension. This doesn't exist at all in v8.
@@ -2424,20 +2430,22 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
     if (arm_feature(env, ARM_FEATURE_PMSA)) {
         bool ret;
-        *page_size = TARGET_PAGE_SIZE;
+        result->page_size = TARGET_PAGE_SIZE;
 
         if (arm_feature(env, ARM_FEATURE_V8)) {
             /* PMSAv8 */
             ret = get_phys_addr_pmsav8(env, address, access_type, mmu_idx,
-                                       phys_ptr, attrs, prot, page_size, fi);
+                                       &result->phys, &result->attrs,
+                                       &result->prot, &result->page_size, fi);
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-                                       phys_ptr, prot, page_size, fi);
+                                       &result->phys, &result->prot,
+                                       &result->page_size, fi);
         } else {
             /* Pre-v7 MPU */
             ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
-                                       phys_ptr, prot, fi);
+                                       &result->phys, &result->prot, fi);
         }
         qemu_log_mask(CPU_LOG_MMU, "PMSA MPU lookup for %s at 0x%08" PRIx32
                       " mmu_idx %u -> %s (prot %c%c%c)\n",
@@ -2445,9 +2453,9 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                       (access_type == MMU_DATA_STORE ? "writing" : "execute"),
                       (uint32_t)address, mmu_idx,
                       ret ? "Miss" : "Hit",
-                      *prot & PAGE_READ ? 'r' : '-',
-                      *prot & PAGE_WRITE ? 'w' : '-',
-                      *prot & PAGE_EXEC ? 'x' : '-');
+                      result->prot & PAGE_READ ? 'r' : '-',
+                      result->prot & PAGE_WRITE ? 'w' : '-',
+                      result->prot & PAGE_EXEC ? 'x' : '-');
 
         return ret;
     }
@@ -2492,14 +2500,14 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                 address = extract64(address, 0, 52);
             }
         }
-        *phys_ptr = address;
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        *page_size = TARGET_PAGE_SIZE;
+        result->phys = address;
+        result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        result->page_size = TARGET_PAGE_SIZE;
 
         /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
         hcr = arm_hcr_el2_eff(env);
-        cacheattrs->shareability = 0;
-        cacheattrs->is_s2_format = false;
+        result->cacheattrs.shareability = 0;
+        result->cacheattrs.is_s2_format = false;
         if (hcr & HCR_DC) {
             if (hcr & HCR_DCT) {
                 memattr = 0xf0;  /* Tagged, Normal, WB, RWA */
@@ -2512,24 +2520,27 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             } else {
                 memattr = 0x44;  /* Normal, NC, No */
             }
-            cacheattrs->shareability = 2; /* outer sharable */
+            result->cacheattrs.shareability = 2; /* outer sharable */
         } else {
             memattr = 0x00;      /* Device, nGnRnE */
         }
-        cacheattrs->attrs = memattr;
+        result->cacheattrs.attrs = memattr;
         return 0;
     }
 
     if (regime_using_lpae_format(env, mmu_idx)) {
         return get_phys_addr_lpae(env, address, access_type, mmu_idx, false,
-                                  phys_ptr, attrs, prot, page_size,
-                                  fi, cacheattrs);
+                                  &result->phys, &result->attrs,
+                                  &result->prot, &result->page_size,
+                                  fi, &result->cacheattrs);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx,
-                                phys_ptr, attrs, prot, page_size, fi);
+                                &result->phys, &result->attrs,
+                                &result->prot, &result->page_size, fi);
     } else {
         return get_phys_addr_v5(env, address, access_type, mmu_idx,
-                                    phys_ptr, prot, page_size, fi);
+                                &result->phys, &result->prot,
+                                &result->page_size, fi);
     }
 }
 
@@ -2538,21 +2549,16 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    hwaddr phys_addr;
-    target_ulong page_size;
-    int prot;
-    bool ret;
+    GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
     ARMMMUIdx mmu_idx = arm_mmu_idx(env);
-    ARMCacheAttrs cacheattrs = {};
+    bool ret;
 
-    *attrs = (MemTxAttrs) {};
-
-    ret = get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &phys_addr,
-                        attrs, &prot, &page_size, &fi, &cacheattrs);
+    ret = get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi);
+    *attrs = res.attrs;
 
     if (ret) {
         return -1;
     }
-    return phys_addr;
+    return res.phys;
 }
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 5a709eab56..ad225b1cb2 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -209,11 +209,8 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 {
     ARMCPU *cpu = ARM_CPU(cs);
     ARMMMUFaultInfo fi = {};
-    hwaddr phys_addr;
-    target_ulong page_size;
-    int prot, ret;
-    MemTxAttrs attrs = {};
-    ARMCacheAttrs cacheattrs = {};
+    GetPhysAddrResult res = {};
+    int ret;
 
     /*
      * Walk the page table and (if the mapping exists) add the page
@@ -223,25 +220,24 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
      */
     ret = get_phys_addr(&cpu->env, address, access_type,
                         core_to_arm_mmu_idx(&cpu->env, mmu_idx),
-                        &phys_addr, &attrs, &prot, &page_size,
-                        &fi, &cacheattrs);
+                        &res, &fi);
     if (likely(!ret)) {
         /*
          * Map a single [sub]page. Regions smaller than our declared
          * target page size are handled specially, so for those we
          * pass in the exact addresses.
          */
-        if (page_size >= TARGET_PAGE_SIZE) {
-            phys_addr &= TARGET_PAGE_MASK;
+        if (res.page_size >= TARGET_PAGE_SIZE) {
+            res.phys &= TARGET_PAGE_MASK;
             address &= TARGET_PAGE_MASK;
         }
         /* Notice and record tagged memory. */
-        if (cpu_isar_feature(aa64_mte, cpu) && cacheattrs.attrs == 0xf0) {
-            arm_tlb_mte_tagged(&attrs) = true;
+        if (cpu_isar_feature(aa64_mte, cpu) && res.cacheattrs.attrs == 0xf0) {
+            arm_tlb_mte_tagged(&res.attrs) = true;
         }
 
-        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
-                                prot, mmu_idx, page_size);
+        tlb_set_page_with_attrs(cs, address, res.phys, res.attrs,
+                                res.prot, mmu_idx, res.page_size);
         return true;
     } else if (probe) {
         return false;
-- 
2.34.1


