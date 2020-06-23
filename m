Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B1F205C40
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 21:54:29 +0200 (CEST)
Received: from localhost ([::1]:59898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnp00-00020t-7s
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 15:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnok9-0005SZ-Hc
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 15:38:05 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnok2-0005w5-DZ
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 15:38:05 -0400
Received: by mail-pl1-x630.google.com with SMTP id k1so9547651pls.2
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 12:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8SoCe9AuCUcKtfQ8ICpVOHtRn9cbfe46b8zjqnRa9W4=;
 b=iqblgLlqDa27N6Zu7DbDC85EtHsTYtxbYiOvj5KpRxazgECQs0hhbv3qg4alZlfVSU
 rjR9nBAThw1lbeFxbEg+fCUoZNwOra4pzyxvwbDhy8sfvF4EgSWKjhQEVs7Za4pZzg+V
 u+i9VBNhxKvsjTrimTMxsk2tFkpvIoDG4LUqDygYGFLRGAOXIog60J34ujKdJANHivdo
 O7/hJHJFlrXyP3/ba7t4EJLV8R2Ulev7NCeco1WyHaJzHl1YrLHEgn8NnN+8C3Kqj6l3
 yAAcbn10Uc2xRoxXXZAASJ3iAyCHyoKPbpudlnlgKvmjEVMmXdbovnLRN86l0WDDm2OY
 F/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8SoCe9AuCUcKtfQ8ICpVOHtRn9cbfe46b8zjqnRa9W4=;
 b=Pmdel+hxP7g4o/eFjWk1VsKKz2SKCpXvQmVFYix8lLRXlGMOVn8NbOMYmr7jkWPa8v
 m7h72eKp6XxrBWntH4VNstFd/bOzvSIy5mLbW9D5kYY297T+ipns4J2sxlmLISvSjCGj
 n3Okx72FPbKbJGirt+JTSnk+E5Mr9maVY3ovoLp7lixPdO+6On/8Yhy0aqYjbBZF3lTW
 yAIb3hRnsecQmdaq3BfIszP7rBnPTfiVesYTS9w1sUwOkckRiFN9GeqQVJ11CucK6AdH
 YzOU/a1a2i67glMUVrFXYsfCYKNMVfTSOKOliPMGXrjX4zIP39wEO8wN8qF1wvawzQ0g
 /njg==
X-Gm-Message-State: AOAM532hhzM7fl0h6zTq5rVKGKunmoi8cJpqLV39Q2cv6v623oUzIPbg
 E6MnAuY47hvMIrC5pSYqoW2Ipn9kdjc=
X-Google-Smtp-Source: ABdhPJz+Xn/quhczHWGB+5gDPA08JVjkGJcPx0QEwV+3zX3o050Oa2PWfIruCoPNKy6ldZedo35cag==
X-Received: by 2002:a17:90a:f282:: with SMTP id
 fs2mr2360295pjb.132.1592941076571; 
 Tue, 23 Jun 2020 12:37:56 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 41/45] target/arm: Always pass cacheattr to get_phys_addr
Date: Tue, 23 Jun 2020 12:36:54 -0700
Message-Id: <20200623193658.623279-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need to check the memattr of a page in order to determine
whether it is Tagged for MTE.  Between Stage1 and Stage2,
this becomes simpler if we always collect this data, instead
of occasionally being presented with NULL.

Use the nonnull attribute to allow the compiler to check that
all pointer arguments are non-null.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h  |  3 ++-
 target/arm/helper.c     | 60 ++++++++++++++++++++---------------------
 target/arm/m_helper.c   | 11 +++++---
 target/arm/tlb_helper.c |  4 ++-
 4 files changed, 42 insertions(+), 36 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3306c4f829..ae99725d2b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1294,7 +1294,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
                    target_ulong *page_size,
-                   ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs);
+                   ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
+    __attribute__((nonnull));
 
 void arm_log_exception(int idx);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d220612a20..2072db2f92 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -44,7 +44,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
                                bool s1_is_el0,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
                                target_ulong *page_size_ptr,
-                               ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs);
+                               ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
+    __attribute__((nonnull));
 #endif
 
 static void switch_mode(CPUARMState *env, int mode);
@@ -11101,19 +11102,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         arm_tlb_bti_gp(txattrs) = true;
     }
 
-    if (cacheattrs != NULL) {
-        if (mmu_idx == ARMMMUIdx_Stage2) {
-            cacheattrs->attrs = convert_stage2_attrs(env,
-                                                     extract32(attrs, 0, 4));
-        } else {
-            /* Index into MAIR registers for cache attributes */
-            uint8_t attrindx = extract32(attrs, 0, 3);
-            uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
-            assert(attrindx <= 7);
-            cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
-        }
-        cacheattrs->shareability = extract32(attrs, 6, 2);
+    if (mmu_idx == ARMMMUIdx_Stage2) {
+        cacheattrs->attrs = convert_stage2_attrs(env, extract32(attrs, 0, 4));
+    } else {
+        /* Index into MAIR registers for cache attributes */
+        uint8_t attrindx = extract32(attrs, 0, 3);
+        uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
+        assert(attrindx <= 7);
+        cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
     }
+    cacheattrs->shareability = extract32(attrs, 6, 2);
 
     *phys_ptr = descaddr;
     *page_size_ptr = page_size;
@@ -11948,28 +11946,29 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             ret = get_phys_addr_lpae(env, ipa, access_type, ARMMMUIdx_Stage2,
                                      mmu_idx == ARMMMUIdx_E10_0,
                                      phys_ptr, attrs, &s2_prot,
-                                     page_size, fi,
-                                     cacheattrs != NULL ? &cacheattrs2 : NULL);
+                                     page_size, fi, &cacheattrs2);
             fi->s2addr = ipa;
             /* Combine the S1 and S2 perms.  */
             *prot &= s2_prot;
 
-            /* Combine the S1 and S2 cache attributes, if needed */
-            if (!ret && cacheattrs != NULL) {
-                if (env->cp15.hcr_el2 & HCR_DC) {
-                    /*
-                     * HCR.DC forces the first stage attributes to
-                     *  Normal Non-Shareable,
-                     *  Inner Write-Back Read-Allocate Write-Allocate,
-                     *  Outer Write-Back Read-Allocate Write-Allocate.
-                     */
-                    cacheattrs->attrs = 0xff;
-                    cacheattrs->shareability = 0;
-                }
-                *cacheattrs = combine_cacheattrs(*cacheattrs, cacheattrs2);
+            /* If S2 fails, return early.  */
+            if (ret) {
+                return ret;
             }
 
-            return ret;
+            /* Combine the S1 and S2 cache attributes. */
+            if (env->cp15.hcr_el2 & HCR_DC) {
+                /*
+                 * HCR.DC forces the first stage attributes to
+                 *  Normal Non-Shareable,
+                 *  Inner Write-Back Read-Allocate Write-Allocate,
+                 *  Outer Write-Back Read-Allocate Write-Allocate.
+                 */
+                cacheattrs->attrs = 0xff;
+                cacheattrs->shareability = 0;
+            }
+            *cacheattrs = combine_cacheattrs(*cacheattrs, cacheattrs2);
+            return 0;
         } else {
             /*
              * For non-EL2 CPUs a stage1+stage2 translation is just stage 1.
@@ -12094,11 +12093,12 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     bool ret;
     ARMMMUFaultInfo fi = {};
     ARMMMUIdx mmu_idx = arm_mmu_idx(env);
+    ARMCacheAttrs cacheattrs = {};
 
     *attrs = (MemTxAttrs) {};
 
     ret = get_phys_addr(env, addr, 0, mmu_idx, &phys_addr,
-                        attrs, &prot, &page_size, &fi, NULL);
+                        attrs, &prot, &page_size, &fi, &cacheattrs);
 
     if (ret) {
         return -1;
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 5e8a795d20..036454234c 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -187,12 +187,13 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
     hwaddr physaddr;
     int prot;
     ARMMMUFaultInfo fi = {};
+    ARMCacheAttrs cacheattrs = {};
     bool secure = mmu_idx & ARM_MMU_IDX_M_S;
     int exc;
     bool exc_secure;
 
     if (get_phys_addr(env, addr, MMU_DATA_STORE, mmu_idx, &physaddr,
-                      &attrs, &prot, &page_size, &fi, NULL)) {
+                      &attrs, &prot, &page_size, &fi, &cacheattrs)) {
         /* MPU/SAU lookup failed */
         if (fi.type == ARMFault_QEMU_SFault) {
             if (mode == STACK_LAZYFP) {
@@ -279,13 +280,14 @@ static bool v7m_stack_read(ARMCPU *cpu, uint32_t *dest, uint32_t addr,
     hwaddr physaddr;
     int prot;
     ARMMMUFaultInfo fi = {};
+    ARMCacheAttrs cacheattrs = {};
     bool secure = mmu_idx & ARM_MMU_IDX_M_S;
     int exc;
     bool exc_secure;
     uint32_t value;
 
     if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &physaddr,
-                      &attrs, &prot, &page_size, &fi, NULL)) {
+                      &attrs, &prot, &page_size, &fi, &cacheattrs)) {
         /* MPU/SAU lookup failed */
         if (fi.type == ARMFault_QEMU_SFault) {
             qemu_log_mask(CPU_LOG_INT,
@@ -1928,6 +1930,7 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     V8M_SAttributes sattrs = {};
     MemTxAttrs attrs = {};
     ARMMMUFaultInfo fi = {};
+    ARMCacheAttrs cacheattrs = {};
     MemTxResult txres;
     target_ulong page_size;
     hwaddr physaddr;
@@ -1945,8 +1948,8 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx,
                       "...really SecureFault with SFSR.INVEP\n");
         return false;
     }
-    if (get_phys_addr(env, addr, MMU_INST_FETCH, mmu_idx,
-                      &physaddr, &attrs, &prot, &page_size, &fi, NULL)) {
+    if (get_phys_addr(env, addr, MMU_INST_FETCH, mmu_idx, &physaddr,
+                      &attrs, &prot, &page_size, &fi, &cacheattrs)) {
         /* the MPU lookup failed */
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_IACCVIOL_MASK;
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM, env->v7m.secure);
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 522a6442a4..89d90465a3 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -166,6 +166,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     int prot, ret;
     MemTxAttrs attrs = {};
     ARMMMUFaultInfo fi = {};
+    ARMCacheAttrs cacheattrs = {};
 
     /*
      * Walk the page table and (if the mapping exists) add the page
@@ -175,7 +176,8 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
      */
     ret = get_phys_addr(&cpu->env, address, access_type,
                         core_to_arm_mmu_idx(&cpu->env, mmu_idx),
-                        &phys_addr, &attrs, &prot, &page_size, &fi, NULL);
+                        &phys_addr, &attrs, &prot, &page_size,
+                        &fi, &cacheattrs);
     if (likely(!ret)) {
         /*
          * Map a single [sub]page. Regions smaller than our declared
-- 
2.25.1


