Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296EB59C359
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 17:47:44 +0200 (CEST)
Received: from localhost ([::1]:40102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ9eR-0002bC-96
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 11:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LB-00074c-Sf
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:27:49 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:38823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9L8-0000eb-Qr
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:27:49 -0400
Received: by mail-pg1-x52e.google.com with SMTP id r22so9683749pgm.5
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Kjbrp5bm88e/qRtLpUBYrca0xBOcPN6yN6kx+yhAThA=;
 b=DREKFKYZl1UJY36X8M9Cl/P1svJo84mNYRgBWGyv9cdspIm80gQTwdVIx2H1bn9bHZ
 QLyXvWMRevyHNuBVol1BQrO5T0ECxkegZ+FRkEaeUBBvyBb1ryKqva8cczZ1V2hEBCYi
 soGE8zv+1Vb7iL640wo2dT6xzG61b2zDuWoTjBoU6ZxLVoacp5WlNi2mWGOhoLtDQ34a
 1WvoYzV+NNWMMO/kj0Uq18M6NdI8nCLUy5XvRwvICDmC0Lvpgxt2ThxJupVux4Xls7F2
 Lr8Z5ZDQsd5BUrPr5WDKMSw4KWxJdPlYJK5kJFDwVZ1YUeFuHmgkQ0TZZHQyyCvkC6yY
 r2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Kjbrp5bm88e/qRtLpUBYrca0xBOcPN6yN6kx+yhAThA=;
 b=pM3t5U42BTBF1XHicjUlq2Ed8wpUd79Pl40Y8gnnBsZM3AjtZYfY7VnU6WU4PmRnol
 J0h51WME9Sa0VcEhNRTHjhnQyWESAwlBiYMNpnSsExJDDTcRQPI2IlJKwmgE0wCZASKt
 cvREeT8Z1m8jD1I+4Aa4QYpHOYl0V+owytp5tFhOLjRXQWYhfqizP5WtdT9s+VuB3OsS
 DHRKd0LT+L7DuFVcHwvh0Xf29sf0LrcawjAUk4UnYqmpW9OEO4sCJi09BSrc8UHrs+2e
 E6lS7FsPXRjBGgvRXJB/Hs0ILUPJYpiU7zTiZBGHa9SjTICsZio+veOJYA4K2yg4ACpt
 6wUw==
X-Gm-Message-State: ACgBeo1Ae2uVooPgGEMsAo2xBVX6oHY45xgWRnYZoclw2jAjKhVfTblt
 Y75Hpgp7n+DdASLhIgxiVVprkrwXjnEqwQ==
X-Google-Smtp-Source: AA6agR59z9Q+MtDcNwNIcFpHRXL11MQmxlsy5sUM8hnm7dhdX4gv0k8vb4/JqscztZiXXeI7lsw6VQ==
X-Received: by 2002:aa7:9731:0:b0:536:7b04:acb6 with SMTP id
 k17-20020aa79731000000b005367b04acb6mr7841997pfg.43.1661182065230; 
 Mon, 22 Aug 2022 08:27:45 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 03/66] target/arm: Use GetPhysAddrResult in
 get_phys_addr_lpae
Date: Mon, 22 Aug 2022 08:26:38 -0700
Message-Id: <20220822152741.1617527-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 69 ++++++++++++++++++------------------------------
 1 file changed, 26 insertions(+), 43 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 478ff74550..4f248f6266 100644
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
@@ -2354,10 +2341,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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
@@ -2528,9 +2513,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
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


