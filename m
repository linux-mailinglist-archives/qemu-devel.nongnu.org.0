Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76815F1E09
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 19:03:58 +0200 (CEST)
Received: from localhost ([::1]:39356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefuA-0008Bf-1H
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 13:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefIE-00009K-Cg
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:46 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:39911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefIC-0006QJ-I3
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:46 -0400
Received: by mail-qt1-x832.google.com with SMTP id s18so4343580qtx.6
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ddXuP4NAsi4/7/1r07P/ZZueGAkWOaBdn4p1jeEw/4M=;
 b=Iskyk8clX7kpEPtUqf4aj+vKy9wJKkfAN6ZRv0iUiXXjsuEldPAQdprxbgWjugIV2g
 R+cK1utM2cmCOSclNn6//OV8PffFTNsGtuuMIUlD+g/U2m0CkvMrYoxs3fMTWiJeElZ9
 5BNdW69hV7l6e5+ITU5wA+yJ0h9qxbeWPyw/UFLlh82+/cEGnqbm1Vs48xFgnn6IE9CH
 z6br7LRvYTCT48u4VDgBf/+6Cw7mRly0snlNEZIncCEfYhgbZJ0alLZpp3/W/8EFrfvA
 5/v3Tvr9bhNBYV5Laxse7MrCJz1hywwHMjCoh455ihTuXNWBuHeibzPjlgEzilGCtz/3
 Jj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ddXuP4NAsi4/7/1r07P/ZZueGAkWOaBdn4p1jeEw/4M=;
 b=kmYHqgXBn+q8Zei23d5feOnTFMpGZZpTGDi77eoDHvHZYZxwNUjucZNIoPKFSesU/B
 jy0hjqEm2y0guOODLM0bKEH3ff9XIuNPRzOiArUt1cVNvO8DzNM9RkVCry49niGufC4h
 S5NvmC7+hoszUwpVeK2MuoNlWGcXsjMezWFedenQfC4RQasHaitLgyH6RxzfMBN9+SQY
 J8sfok2DQjjmZx50u66j5lnwcSALUyJeH4MTFvjf91jrtV1ebvWUu3Ngtr2GaB9RbI9F
 1BsFyAixT5Rj+HwL9/3mPliWbjZkox1q2RnOqNI2euxevQ45Z/Lt+h+2W7qBK2uk2kd0
 JmcQ==
X-Gm-Message-State: ACrzQf1zNnuNgqWls6rDSErb5ayB4bOnVAlnxdjL+Tb947BNy2MWPfUn
 tuqJ5As21gdd7TmgvyxdqkMHBkAI0CD6Xw==
X-Google-Smtp-Source: AMsMyM60GKAzyruNLP7odTqJhlNztDF1pkUggajoOJEy+d65aizXMsjqfWhrKlR9cDCNNO/fVc24wA==
X-Received: by 2002:ac8:57cc:0:b0:35c:b5d1:9024 with SMTP id
 w12-20020ac857cc000000b0035cb5d19024mr11071935qta.214.1664641483531; 
 Sat, 01 Oct 2022 09:24:43 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 33/42] target/arm: Split out S1TranslateResult type
Date: Sat,  1 Oct 2022 09:23:09 -0700
Message-Id: <20221001162318.153420-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
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

Consolidate the results of S1_ptw_translate in one struct.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 70 +++++++++++++++++++++++++-----------------------
 1 file changed, 36 insertions(+), 34 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 7a77bea2c7..99ad894180 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -220,13 +220,18 @@ static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
     }
 }
 
+typedef struct {
+    bool is_secure;
+    void *hphys;
+    hwaddr gphys;
+} S1TranslateResult;
+
 /* Translate a S1 pagetable walk through S2 if needed.  */
 static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                              ARMMMUIdx s2_mmu_idx, hwaddr addr,
-                             bool *is_secure_ptr, void **hphys, hwaddr *gphys,
-                             bool debug, ARMMMUFaultInfo *fi)
+                             bool is_secure, bool debug,
+                             S1TranslateResult *res, ARMMMUFaultInfo *fi)
 {
-    bool is_secure = *is_secure_ptr;
     uint8_t pte_attrs;
     bool s2_phys, pte_secure;
 
@@ -238,7 +243,7 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
          * state of the cpu at all, including softmmu tlb contents.
          */
         if (s2_phys) {
-            *gphys = addr;
+            res->gphys = addr;
             pte_attrs = 0;
             pte_secure = is_secure;
         } else {
@@ -251,11 +256,11 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                                     &s2, fi)) {
                 goto fail;
             }
-            *gphys = s2.f.phys_addr;
+            res->gphys = s2.f.phys_addr;
             pte_attrs = s2.cacheattrs.attrs;
             pte_secure = s2.f.attrs.secure;
         }
-        *hphys = NULL;
+        res->hphys = NULL;
     } else {
         CPUTLBEntryFull *full;
         int flags;
@@ -263,13 +268,13 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         env->tlb_fi = fi;
         flags = probe_access_full(env, addr, MMU_DATA_LOAD,
                                   arm_to_core_mmu_idx(s2_mmu_idx),
-                                  true, hphys, &full, 0);
+                                  true, &res->hphys, &full, 0);
         env->tlb_fi = NULL;
 
         if (unlikely(flags & TLB_INVALID_MASK)) {
             goto fail;
         }
-        *gphys = full->phys_addr;
+        res->gphys = full->phys_addr;
         pte_attrs = full->pte_attrs;
         pte_secure = full->attrs.secure;
     }
@@ -291,12 +296,11 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         }
     }
 
-    if (is_secure) {
-        /* Check if page table walk is to secure or non-secure PA space. */
-        *is_secure_ptr = !(pte_secure
-                           ? env->cp15.vstcr_el2 & VSTCR_SW
-                           : env->cp15.vtcr_el2 & VTCR_NSW);
-    }
+    /* Check if page table walk is to secure or non-secure PA space. */
+    res->is_secure = (is_secure &&
+                      !(pte_secure
+                        ? env->cp15.vstcr_el2 & VSTCR_SW
+                        : env->cp15.vtcr_el2 & VTCR_NSW));
     return true;
 
  fail:
@@ -314,36 +318,35 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
                             bool debug, ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    void *hphys;
-    hwaddr gphys;
+    S1TranslateResult s1;
     uint32_t data;
     bool be;
 
-    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, &is_secure,
-                          &hphys, &gphys, debug, fi)) {
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure,
+                          debug, &s1, fi)) {
         /* Failure. */
         assert(fi->s1ptw);
         return 0;
     }
 
     be = regime_translation_big_endian(env, mmu_idx);
-    if (likely(hphys)) {
+    if (likely(s1.hphys)) {
         /* Page tables are in RAM, and we have the host address. */
         if (be) {
-            data = ldl_be_p(hphys);
+            data = ldl_be_p(s1.hphys);
         } else {
-            data = ldl_le_p(hphys);
+            data = ldl_le_p(s1.hphys);
         }
     } else {
         /* Page tables are in MMIO. */
-        MemTxAttrs attrs = { .secure = is_secure };
+        MemTxAttrs attrs = { .secure = s1.is_secure };
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
         if (be) {
-            data = address_space_ldl_be(as, gphys, attrs, &result);
+            data = address_space_ldl_be(as, s1.gphys, attrs, &result);
         } else {
-            data = address_space_ldl_le(as, gphys, attrs, &result);
+            data = address_space_ldl_le(as, s1.gphys, attrs, &result);
         }
         if (unlikely(result != MEMTX_OK)) {
             fi->type = ARMFault_SyncExternalOnWalk;
@@ -359,36 +362,35 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
                             bool debug, ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    void *hphys;
-    hwaddr gphys;
+    S1TranslateResult s1;
     uint64_t data;
     bool be;
 
-    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, &is_secure,
-                          &hphys, &gphys, debug, fi)) {
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure,
+                          debug, &s1, fi)) {
         /* Failure. */
         assert(fi->s1ptw);
         return 0;
     }
 
     be = regime_translation_big_endian(env, mmu_idx);
-    if (likely(hphys)) {
+    if (likely(s1.hphys)) {
         /* Page tables are in RAM, and we have the host address. */
         if (be) {
-            data = ldq_be_p(hphys);
+            data = ldq_be_p(s1.hphys);
         } else {
-            data = ldq_le_p(hphys);
+            data = ldq_le_p(s1.hphys);
         }
     } else {
         /* Page tables are in MMIO. */
-        MemTxAttrs attrs = { .secure = is_secure };
+        MemTxAttrs attrs = { .secure = s1.is_secure };
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
         if (be) {
-            data = address_space_ldq_be(as, gphys, attrs, &result);
+            data = address_space_ldq_be(as, s1.gphys, attrs, &result);
         } else {
-            data = address_space_ldq_le(as, gphys, attrs, &result);
+            data = address_space_ldq_le(as, s1.gphys, attrs, &result);
         }
         if (unlikely(result != MEMTX_OK)) {
             fi->type = ARMFault_SyncExternalOnWalk;
-- 
2.34.1


