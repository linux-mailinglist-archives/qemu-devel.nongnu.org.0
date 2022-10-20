Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3233760670D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:30:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZNW-0003HG-JH
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:30:46 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYrc-0008Lb-7m
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYm-0001NB-Do
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:11 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:56274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYj-00010S-Vk
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:04 -0400
Received: by mail-wm1-x32d.google.com with SMTP id t4so14757336wmj.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LppBSbvgQYzDduwhibug2GfYpwzRspc9kyn/V9nL0ds=;
 b=mXTMOJWSQ0JZzD1R5T/b9QCs4fTj7ljjq/IVw/eOtwFXtE2PMgQivb7XVZSUV6oboj
 ksFi50riA21zOdSGij5V74KooZWW2CYhJuqX1j5z831gS2WGbDoiOr7IIMP5eJva3oRI
 TNomp/yMzCcK9YOuGY+evYKqyXVwQiIaGdIHwxAKIMq4yCkN2sffxlyzQ99If62VKJoh
 HDDO9H7vO2AizPGiQFYU/0VGfpH/7P6AXxldBlNbO0WJUdjJ5V3uFUHEaKZZ0WP7CrJt
 aWJh11ZsdDYzNOM3/CfPDjLXjyZXHV7lX/j8f5KM8asT9bzD6SFMkiwgZolumEMGhTNr
 7+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LppBSbvgQYzDduwhibug2GfYpwzRspc9kyn/V9nL0ds=;
 b=ax2TspZTgipL0IxCBaIVLbgA9T2IKajoHDGFKHzXB9FTGfyPs6f+Hv6Z4QMmIzrVGD
 4a8mcVSGC2SYKV/xZGyNfxOgqZEiu41gYax4ymYFXOac1EmYekTdz3Ojg4WJ/0CVlbNy
 3fLdbMblkmGFS/YESro4YfyMlKHdaqn+yLXM9PdMNRGoZOBcf05KajzAVRh0Ci+lewnl
 StyCv+065dv1pmIXwf0KjxMi3TDtVE34CWLjLZ8lbKN7HxtDYLhHTJ6ps20IoNb/YSJS
 TWjC5BaArnMd4kfFL7Gbf9Qt7ceqMZixY5YPVtAlOS/p0BUAeO0yYMRxOTYIas40nE7e
 IIwA==
X-Gm-Message-State: ACrzQf2qHKoC+Gc+3P5JtfxK9IAXBG+Zrnhe9DRCxEBdeXTYyatooUWI
 6kmeuIy8wuPA5WosvPh4VM1EGSHjdvVwpg==
X-Google-Smtp-Source: AMsMyM6rt0SZpl3YdrVTvp0nEI7uhL1mLvSrFQaBzfvP1pywUfe0c0QorZVexDnMl9/7lsH0d8YJRA==
X-Received: by 2002:a05:600c:3b1d:b0:3c6:ff0d:6a60 with SMTP id
 m29-20020a05600c3b1d00b003c6ff0d6a60mr8841046wms.183.1666268520216; 
 Thu, 20 Oct 2022 05:22:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16520192wrs.53.2022.10.20.05.21.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:21:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/24] target/arm: Split out S1Translate type
Date: Thu, 20 Oct 2022 13:21:31 +0100
Message-Id: <20221020122146.3177980-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020122146.3177980-1-peter.maydell@linaro.org>
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Consolidate most of the inputs and outputs of S1_ptw_translate
into a single structure.  Plumb this through arm_ld*_ptw from
the controlling get_phys_addr_* routine.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20221011031911.2408754-8-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 140 ++++++++++++++++++++++++++---------------------
 1 file changed, 79 insertions(+), 61 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a977d09c6d5..dee69ee7438 100644
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
2.25.1


