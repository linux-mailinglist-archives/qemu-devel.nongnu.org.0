Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BE559C4FC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 19:27:06 +0200 (CEST)
Received: from localhost ([::1]:39398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQBCb-0007gZ-7v
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 13:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9P0-0004lP-LY
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:48 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:55199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Op-0001gh-Dj
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:42 -0400
Received: by mail-pj1-x102f.google.com with SMTP id bf22so11336494pjb.4
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=it7B1eMCFXglWpcmLLb+ZPWhWwKZWNZeFgdZdEg2+GA=;
 b=F1m54Fy9FU3KoBB2AO7LQxtORNYxvfXlcPYSv50/6HN00CJC/pUjPdfAzKGWZlT7Sr
 JRqosNtSWOSP6715H8RKCszcpYpOzz2oVtsp4+i6sWUkrWgYkZVG6QKPvKesh2iyfEQ9
 NOywRpvytKasdQG0F0xB46Ez0ROs0gZZKmp8rGZm31Exu2ILOCknF1sfgmkHXLsmFAtP
 CvGL3Y0WLIpnnIhdAG/8AowTs+kU9fb8vSbtEVfathmslpzd9Euo1pt0aWTfneQh+SyG
 3JHkJFG39rT72E44A0Tl/zfxyc/BWH9WsBwtgBWl7uSbyIp1x/nbYYZGpdSODyVtyDbO
 Zc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=it7B1eMCFXglWpcmLLb+ZPWhWwKZWNZeFgdZdEg2+GA=;
 b=JbokmpiSSRmana7Bz6+acb3FoipDaMphd30RDkcuRbjrWSpk/4jo9UM+zZV7yhuno+
 5c5LSrIcAyDYOXXCKUV1+bI5f51RlKcR/2YpZ3S5uz0ajHO3GLluubifqA2X0E+gvEEY
 4F1qVFw283WPbpICqPEMX+92pTTxOpfbzhetPq3PyXkwL6DIOIWXd07JQY2J46uHzn8R
 5RTFZLd5VHfxO9wT+t7nsXsgoPVBAZG7uRCI1Ax0Jo9fi2vFumRIzN1i9oxPyInKtMsz
 nieGcrz3IVP1TnZOgvFuPSRxrEesGX6ff4zBl0N4sceFgV4bIYSGmOn2YIX4s3D53wb3
 Zweg==
X-Gm-Message-State: ACgBeo2AvGevXhkKN8oOC6cTJfZzMHD8tbIT5Iu3qqWNSAJ7QTuLCKoF
 7sAEWiHu2gW45Wb1KD/WqOPaSZU1G0L6XA==
X-Google-Smtp-Source: AA6agR43xic6tMOcGzIrsIqne5EuXWjG+MZ8lfRTRo1FO18cp4+ANs08IT/9/z+coSyxPi4CzXTITQ==
X-Received: by 2002:a17:902:694a:b0:16e:e270:1f84 with SMTP id
 k10-20020a170902694a00b0016ee2701f84mr20838465plt.89.1661182293413; 
 Mon, 22 Aug 2022 08:31:33 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 58/66] target/arm: Split out S1TranslateResult type
Date: Mon, 22 Aug 2022 08:27:33 -0700
Message-Id: <20220822152741.1617527-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Consolidate the results of S1_ptw_translate in one struct.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 60 ++++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9673b97f79..7c44e7eadd 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -190,20 +190,25 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
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
+                             bool is_secure, S1TranslateResult *res,
                              ARMMMUFaultInfo *fi)
 {
-    bool is_secure = *is_secure_ptr;
     CPUTLBEntryFull *full;
     int flags;
 
     env->tlb_fi = fi;
     flags = probe_access_full(env, addr, MMU_DATA_LOAD,
                               arm_to_core_mmu_idx(s2_mmu_idx),
-                              true, hphys, &full, 0);
+                              true, &res->hphys, &full, 0);
     env->tlb_fi = NULL;
 
     if (unlikely(flags & TLB_INVALID_MASK)) {
@@ -249,14 +254,13 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         }
     }
 
-    if (is_secure) {
-        /* Check if page table walk is to secure or non-secure PA space. */
-        *is_secure_ptr = !(full->attrs.secure
-                           ? env->cp15.vstcr_el2 & VSTCR_SW
-                           : env->cp15.vtcr_el2 & VTCR_NSW);
-    }
+    /* Check if page table walk is to secure or non-secure PA space. */
+    res->is_secure = (is_secure &&
+                      !(full->attrs.secure
+                        ? env->cp15.vstcr_el2 & VSTCR_SW
+                        : env->cp15.vtcr_el2 & VTCR_NSW));
 
-    *gphys = full->phys_addr;
+    res->gphys = full->phys_addr;
     return true;
 }
 
@@ -266,36 +270,34 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    void *hphys;
-    hwaddr gphys;
+    S1TranslateResult s1;
     uint32_t data;
     bool be;
 
-    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, &is_secure,
-                          &hphys, &gphys, fi)) {
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure, &s1, fi)) {
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
@@ -311,36 +313,34 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    void *hphys;
-    hwaddr gphys;
+    S1TranslateResult s1;
     uint64_t data;
     bool be;
 
-    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, &is_secure,
-                          &hphys, &gphys, fi)) {
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure, &s1, fi)) {
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


