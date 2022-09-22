Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E11D5E6AF6
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:31:23 +0200 (CEST)
Received: from localhost ([::1]:43528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQyo-0007q7-03
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAv-00029z-7v
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:47 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:50853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAs-0005Np-4W
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:44 -0400
Received: by mail-wm1-x334.google.com with SMTP id ay36so7182290wmb.0
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=gRurciE+TALpwZNtDPbsw3br2HBbVUeEcSlrHdrEwwM=;
 b=Y7KZiyGtMcnKoE/LrGEkqenSMkTO/3bYbazi0A9vEO5CPthvzNyAfs+lDhrgefT0xd
 qLcfJ03eu4X0gnXgUFjCYqfIlje9rdTWfe+JBV9mSVUbKsGjIAxDvVAuPJk7+cff0uvY
 VabMTAUXNB01auZHwt483xe5vkfg6i21/eWAr+hF/1yKNxF9mrJQY6hT6VqHOwP3pvRX
 eGC303ut/WK1MZ7yIz224WRmiOWfuR8oMqoCrn/4co4NcJi6QLzFelarN3gpNAKR8e18
 /9f7NlXXuNFbiXaoecSUsLUmMhrunTOgLcxd82hlJ9TNSRnOniObx1qTsdpWtMv4WQuK
 0YDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gRurciE+TALpwZNtDPbsw3br2HBbVUeEcSlrHdrEwwM=;
 b=6Zxp1icW3KHX7sGmUBKU4B7z6QQCjVuhUVa0xBQ1C8QHWV0D7cWaVVgFCpX8Qm0aPQ
 nbKWxbBELS+9GmCoFVhXJFDroWWvMA6zn0dRatoGA423jvNORvoBdZvw9qit+s9ACbI1
 5FX9eJqJO0j+eh3dzWLUft6tcjPMQwBOWjJLvkg4sY5sxUHwxSLyutXMvMnh2F3JrHxK
 ii87Vmfo0gXnIiRnXvyGFS1yze7lH5nHI54HTX8ZrSMBR3JsN5EH6vnrRVAuHuAqtSqZ
 +aUS/gus4yJNlCUCFh7nK57AW/4gYINXQR1JGYwQbgVd9P22sEwRV/a3lg2owlMh8gVh
 FDlA==
X-Gm-Message-State: ACrzQf1Bs+AyDoRKwMEhLi3j25aaupKiRxka1KV12/MSa00DqoQtGsO6
 vl4GH/2cuRhVhfiY4HEsgWsPCvTCsVHKcA==
X-Google-Smtp-Source: AMsMyM79cU9eQLnTJpbpJJ5zQHf5cV7W3ScaKGncCq8TvYoVyCugcvJU7LyPe2JLVOPBiFrTY7haeg==
X-Received: by 2002:a05:600c:898:b0:3b4:8110:7fab with SMTP id
 l24-20020a05600c089800b003b481107fabmr9705548wmp.19.1663864541282; 
 Thu, 22 Sep 2022 09:35:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/39] target/arm: Use GetPhysAddrResult in get_phys_addr_lpae
Date: Thu, 22 Sep 2022 17:35:01 +0100
Message-Id: <20220922163536.1096175-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220822152741.1617527-4-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 69 ++++++++++++++++++------------------------------
 1 file changed, 26 insertions(+), 43 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8db2abac015..e8d3f88628e 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -16,10 +16,8 @@
 
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool s1_is_el0, hwaddr *phys_ptr,
-                               MemTxAttrs *txattrs, int *prot,
-                               target_ulong *page_size_ptr,
-                               ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
+                               bool s1_is_el0, GetPhysAddrResult *result,
+                               ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
 /* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
@@ -204,18 +202,13 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
 {
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
         !regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
-        target_ulong s2size;
-        hwaddr s2pa;
-        int s2prot;
-        int ret;
         ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S
                                           : ARMMMUIdx_Stage2;
-        ARMCacheAttrs cacheattrs = {};
-        MemTxAttrs txattrs = {};
+        GetPhysAddrResult s2 = {};
+        int ret;
 
         ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx, false,
-                                 &s2pa, &txattrs, &s2prot, &s2size, fi,
-                                 &cacheattrs);
+                                 &s2, fi);
         if (ret) {
             assert(fi->type != ARMFault_None);
             fi->s2addr = addr;
@@ -225,7 +218,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             return ~0;
         }
         if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
-            ptw_attrs_are_device(env, cacheattrs)) {
+            ptw_attrs_are_device(env, s2.cacheattrs)) {
             /*
              * PTW set and S1 walk touched S2 Device memory:
              * generate Permission fault.
@@ -249,7 +242,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             assert(!*is_secure);
         }
 
-        addr = s2pa;
+        addr = s2.phys;
     }
     return addr;
 }
@@ -972,19 +965,13 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
  *             table walk), must be true if this is stage 2 of a stage 1+2
  *             walk for an EL0 access. If @mmu_idx is anything else,
  *             @s1_is_el0 is ignored.
- * @phys_ptr: set to the physical address corresponding to the virtual address
- * @attrs: set to the memory transaction attributes to use
- * @prot: set to the permissions for the page containing phys_ptr
- * @page_size_ptr: set to the size of the page containing phys_ptr
+ * @result: set on translation success,
  * @fi: set to fault info if the translation fails
- * @cacheattrs: (if non-NULL) set to the cacheability/shareability attributes
  */
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool s1_is_el0, hwaddr *phys_ptr,
-                               MemTxAttrs *txattrs, int *prot,
-                               target_ulong *page_size_ptr,
-                               ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
+                               bool s1_is_el0, GetPhysAddrResult *result,
+                               ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     /* Read an LPAE long-descriptor translation table. */
@@ -1302,16 +1289,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         ns = mmu_idx == ARMMMUIdx_Stage2;
         xn = extract32(attrs, 11, 2);
-        *prot = get_S2prot(env, ap, xn, s1_is_el0);
+        result->prot = get_S2prot(env, ap, xn, s1_is_el0);
     } else {
         ns = extract32(attrs, 3, 1);
         xn = extract32(attrs, 12, 1);
         pxn = extract32(attrs, 11, 1);
-        *prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
+        result->prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
     }
 
     fault_type = ARMFault_Permission;
-    if (!(*prot & (1 << access_type))) {
+    if (!(result->prot & (1 << access_type))) {
         goto do_fault;
     }
 
@@ -1321,23 +1308,23 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          * the CPU doesn't support TZ or this is a non-secure translation
          * regime, because the attribute will already be non-secure.
          */
-        txattrs->secure = false;
+        result->attrs.secure = false;
     }
     /* When in aarch64 mode, and BTI is enabled, remember GP in the IOTLB.  */
     if (aarch64 && guarded && cpu_isar_feature(aa64_bti, cpu)) {
-        arm_tlb_bti_gp(txattrs) = true;
+        arm_tlb_bti_gp(&result->attrs) = true;
     }
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
-        cacheattrs->is_s2_format = true;
-        cacheattrs->attrs = extract32(attrs, 0, 4);
+        result->cacheattrs.is_s2_format = true;
+        result->cacheattrs.attrs = extract32(attrs, 0, 4);
     } else {
         /* Index into MAIR registers for cache attributes */
         uint8_t attrindx = extract32(attrs, 0, 3);
         uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
         assert(attrindx <= 7);
-        cacheattrs->is_s2_format = false;
-        cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
+        result->cacheattrs.is_s2_format = false;
+        result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
     }
 
     /*
@@ -1346,13 +1333,13 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      * that case comes from TCR_ELx, which we extracted earlier.
      */
     if (param.ds) {
-        cacheattrs->shareability = param.sh;
+        result->cacheattrs.shareability = param.sh;
     } else {
-        cacheattrs->shareability = extract32(attrs, 6, 2);
+        result->cacheattrs.shareability = extract32(attrs, 6, 2);
     }
 
-    *phys_ptr = descaddr;
-    *page_size_ptr = page_size;
+    result->phys = descaddr;
+    result->page_size = page_size;
     return false;
 
 do_fault:
@@ -2356,10 +2343,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             cacheattrs1 = result->cacheattrs;
             memset(result, 0, sizeof(*result));
 
-            ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx, is_el0,
-                                     &result->phys, &result->attrs,
-                                     &result->prot, &result->page_size,
-                                     fi, &result->cacheattrs);
+            ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
+                                     is_el0, result, fi);
             fi->s2addr = ipa;
 
             /* Combine the S1 and S2 perms.  */
@@ -2530,9 +2515,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
     if (regime_using_lpae_format(env, mmu_idx)) {
         return get_phys_addr_lpae(env, address, access_type, mmu_idx, false,
-                                  &result->phys, &result->attrs,
-                                  &result->prot, &result->page_size,
-                                  fi, &result->cacheattrs);
+                                  result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx,
                                 &result->phys, &result->attrs,
-- 
2.25.1


