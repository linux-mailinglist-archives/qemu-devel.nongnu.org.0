Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABF15645E0
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:43:22 +0200 (CEST)
Received: from localhost ([::1]:46644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vCL-00040y-MG
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuZ-0006rG-2N
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:24:59 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:46846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuX-0005sH-49
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:24:58 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so6689183pjj.5
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nWhJRX2CcLLqjJLeiFrCW24//WXCOsrf/EygkQpW/6g=;
 b=MuttzmbSQvnQ4fDjSiKUpl9JiTPG1eNTnxWXj15G3yp6TXpYvXu1W988Ah7Eo1dI2w
 CSpSBq4mAPaUHqnpsx8OKknvRoTXedMJ8P7/834A9766VCXRmBEhPJiAuhwuNx1qQyIM
 iQBtnu097NzckEEJiSsaRDQ5EaE7Jq/xa3TfhjZ7FENTTqC11sHt6ZWDlpeoIfp4mjav
 mPWGWbv3ZiyK8q545xLW6vYQznHnRN88slLeRLXlbKyk9UpXl7ZrM8890I+41fUKh1gE
 hhB3POkqmyu6wVH1CYBprVLpYq02w0Nko4AJABatxDbjDyr/24XKsGb6lTQdbk/WtYOC
 5OOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nWhJRX2CcLLqjJLeiFrCW24//WXCOsrf/EygkQpW/6g=;
 b=xyBoX9kCpnBZY9ecDRAr/IZ1XG/Y60vK3Z5XCXbgvDHrC3I2zkTKeHmMXZrTcauZdi
 S5bfyZqw9C4qS9UYIFW4Tx3dXTkuLEmEwc+U1WMXmGMqM7HRjW38HezNSMux5J6PDBuA
 /Av6trQOH1xSKoML/U6V9ffkN8GgPJpLe3TroUJ7euBvG6w4EkZ5HQax9QJkN1NSvCza
 TpV++zUoCUsixxy/UyEKXlki/hdOetacTtITc2zTSmZaNCNI1AZJBIGVbSlGUZ2HNdXS
 RAIapFm284ghdf9nWRRt/ZWpzcc6BLqs512P9ix10J1PQsTgO8lLgSHLnDXSWSieqcIG
 rnxg==
X-Gm-Message-State: AJIora/y7+vaTxddEyR6/jcLpMvw9RshMg1wFB4SG4oqyDZR/0Ua7Kta
 kt9P8eZ8o9AvGHxFU4SCQF4cDERTHypo6kdQ
X-Google-Smtp-Source: AGRyM1u/GxVi9uPP3xxvEt7rZsKVRlJnRWs4nt3znGz+5vWtw7gPFIzTOS1U4EcVc2NBWhoiKtdg+w==
X-Received: by 2002:a17:90b:218:b0:1ef:1440:ebe1 with SMTP id
 fy24-20020a17090b021800b001ef1440ebe1mr28988693pjb.166.1656836695664; 
 Sun, 03 Jul 2022 01:24:55 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:24:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 10/62] target/arm: Use GetPhysAddrResult in get_phys_addr_lpae
Date: Sun,  3 Jul 2022 13:53:27 +0530
Message-Id: <20220703082419.770989-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 69 ++++++++++++++++++------------------------------
 1 file changed, 26 insertions(+), 43 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b78658161f..5e79c9be98 100644
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
@@ -968,19 +961,13 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
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
@@ -1298,16 +1285,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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
 
@@ -1317,23 +1304,23 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          * the CPU doesn't support TZ or this is a non-secure translation
          * regime, because the attribute will already be non-secure.
          */
-        txattrs->secure = false;
+        result->attrs.secure = false;
     }
     /* When in aarch64 mode, and BTI is enabled, remember GP in the IOTLB.  */
     if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
-        cacheattrs->guarded = guarded;
+        result->cacheattrs.guarded = guarded;
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
@@ -1342,13 +1329,13 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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
@@ -2350,10 +2337,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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
@@ -2524,9 +2509,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
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
2.34.1


