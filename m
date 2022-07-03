Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6DC564668
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:26:12 +0200 (CEST)
Received: from localhost ([::1]:37760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vrn-0008Jg-G5
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzk-0001ht-Aw
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:21 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:42504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzi-0006pe-4U
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:20 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 73-20020a17090a0fcf00b001eaee69f600so6731224pjz.1
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wSNR2kbAW9oQa+mDxGRThKTDiu+IXYao0zmFIiXWIZ0=;
 b=T4ce/4RjBiL5U7E54ur6JPK1AZM8MBWrdfat7ZB7xbkr4Rmtm+TT9E86TXhAUZ9pLk
 64vE1+X3aVHBQ977WJbpxecGgQFmuQg3BpRNFIYSFKct/h2ecjg4bLB1lE7XNlO/sLYK
 T8xAVrA1MhbqQsTwdlMV7klJJdlJA/eLCW+o20HR5wUGwLJEYP9M011MW+0ipcZXx8sk
 SbZhdJ/ae1V/RtjFL2PFY3eeCt1f8hMzVp7T0P4SUxHJnWF9s7YBQ57ml8M4LGms0XPY
 4jnLZ2p3uzgdGUqXT1kEseBR1YCqAA0hkaedQy53qDWtmIDXpeXa5AszqhmlR+jYKam0
 7hsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wSNR2kbAW9oQa+mDxGRThKTDiu+IXYao0zmFIiXWIZ0=;
 b=1qRgiKMwZa9MGQddaBccuZbxnIvE680C7J9JrHpcUhwR8x1qppAPagOtpv1sCdlRy7
 5eFw9pvt/Wa7cS+1FWdSD63H28mydWxoErwcGvd1+8wYgMYB/nrYaO1mhTRpTwQCwqOQ
 UvlnXEstGJvZDJ+OqSh1bgGCdWLPzQfv6Zv2qxMvhCK8yvGOGSeLbPKBsM0c0mWmrkqL
 ADu+VKNsDCu0BevJfjx+MHuQas3u566+JXRj6i1Rt6esfZg2qx3uBFjZXxhGUnI1WURL
 tTt+UqVlvGEVetG3AyRZ30ZZatBXUPjLa825Cd2WpfIE9BPScV3VImGgyqqT3puA8cn4
 tC+w==
X-Gm-Message-State: AJIora9KNqBfkgvzKuOtR/9pg41O0zkEjmfgpUDi6sbiUgIOqCQPYvMA
 awRsHgbeQCoY/z8wFkjkEVhEyus5bPPZkZQW
X-Google-Smtp-Source: AGRyM1vMSMNXIm26c+IwmWq94YDBnMgZEBlRPlPG5cCjL7QL+6hCNwVBGXF4X4tch6W6WEIXEfG5UA==
X-Received: by 2002:a17:90b:4a12:b0:1ed:56ab:b2d5 with SMTP id
 kk18-20020a17090b4a1200b001ed56abb2d5mr28406053pjb.152.1656837016767; 
 Sun, 03 Jul 2022 01:30:16 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:30:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 56/62] target/arm: Move S1_ptw_translate outside arm_ld[lq]_ptw
Date: Sun,  3 Jul 2022 13:54:13 +0530
Message-Id: <20220703082419.770989-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Separate S1 translation from the actual lookup.
Will enable lpae hardware updates.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 83 +++++++++++++++++++++++++-----------------------
 1 file changed, 44 insertions(+), 39 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b5105a2e92..dee857ae89 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -268,37 +268,29 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
 }
 
 /* All loads done in the course of a page table walk go through here. */
-static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUIdx ptw_idx,
+static uint32_t arm_ldl_ptw(CPUARMState *env, const S1TranslateResult *s1,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    S1TranslateResult s1;
     uint32_t data;
 
-    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure, &s1, fi)) {
-        /* Failure. */
-        assert(fi->s1ptw);
-        return 0;
-    }
-
-    if (likely(s1.hphys)) {
+    if (likely(s1->hphys)) {
         /* Page tables are in RAM, and we have the host address. */
-        if (s1.be) {
-            data = ldl_be_p(s1.hphys);
+        if (s1->be) {
+            data = ldl_be_p(s1->hphys);
         } else {
-            data = ldl_le_p(s1.hphys);
+            data = ldl_le_p(s1->hphys);
         }
     } else {
         /* Page tables are in MMIO. */
-        MemTxAttrs attrs = { .secure = s1.is_secure };
+        MemTxAttrs attrs = { .secure = s1->is_secure };
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
-        if (s1.be) {
-            data = address_space_ldl_be(as, s1.gphys, attrs, &result);
+        if (s1->be) {
+            data = address_space_ldl_be(as, s1->gphys, attrs, &result);
         } else {
-            data = address_space_ldl_le(as, s1.gphys, attrs, &result);
+            data = address_space_ldl_le(as, s1->gphys, attrs, &result);
         }
         if (unlikely(result != MEMTX_OK)) {
             fi->type = ARMFault_SyncExternalOnWalk;
@@ -309,37 +301,29 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     return data;
 }
 
-static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUIdx ptw_idx,
+static uint64_t arm_ldq_ptw(CPUARMState *env, const S1TranslateResult *s1,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    S1TranslateResult s1;
     uint64_t data;
 
-    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure, &s1, fi)) {
-        /* Failure. */
-        assert(fi->s1ptw);
-        return 0;
-    }
-
-    if (likely(s1.hphys)) {
+    if (likely(s1->hphys)) {
         /* Page tables are in RAM, and we have the host address. */
-        if (s1.be) {
-            data = ldq_be_p(s1.hphys);
+        if (s1->be) {
+            data = ldq_be_p(s1->hphys);
         } else {
-            data = ldq_le_p(s1.hphys);
+            data = ldq_le_p(s1->hphys);
         }
     } else {
         /* Page tables are in MMIO. */
-        MemTxAttrs attrs = { .secure = s1.is_secure };
+        MemTxAttrs attrs = { .secure = s1->is_secure };
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
-        if (s1.be) {
-            data = address_space_ldq_be(as, s1.gphys, attrs, &result);
+        if (s1->be) {
+            data = address_space_ldq_be(as, s1->gphys, attrs, &result);
         } else {
-            data = address_space_ldq_le(as, s1.gphys, attrs, &result);
+            data = address_space_ldq_le(as, s1->gphys, attrs, &result);
         }
         if (unlikely(result != MEMTX_OK)) {
             fi->type = ARMFault_SyncExternalOnWalk;
@@ -467,6 +451,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
     int domain = 0;
     int domain_prot;
     hwaddr phys_addr;
+    S1TranslateResult s1;
     uint32_t dacr;
 
     /* Pagetable walk.  */
@@ -476,7 +461,10 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, table, is_secure, &s1, fi)) {
+        goto do_fault;
+    }
+    desc = arm_ldl_ptw(env, &s1, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -514,7 +502,11 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             /* Fine pagetable.  */
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
+        if (!S1_ptw_translate(env, mmu_idx, ptw_idx, table,
+                              is_secure, &s1, fi)) {
+            goto do_fault;
+        }
+        desc = arm_ldl_ptw(env, &s1, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -590,6 +582,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
     int domain_prot;
     hwaddr phys_addr;
     uint32_t dacr;
+    S1TranslateResult s1;
     bool ns;
 
     /* Pagetable walk.  */
@@ -599,7 +592,10 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, table, is_secure, &s1, fi)) {
+        goto do_fault;
+    }
+    desc = arm_ldl_ptw(env, &s1, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -652,7 +648,11 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
+        if (!S1_ptw_translate(env, mmu_idx, ptw_idx, table,
+                              is_secure, &s1, fi)) {
+            goto do_fault;
+        }
+        desc = arm_ldl_ptw(env, &s1, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -1228,13 +1228,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      */
     tableattrs = is_secure ? 0 : (1 << 4);
     for (;;) {
+        S1TranslateResult s1;
         uint64_t descriptor;
         bool nstable;
 
         descaddr |= (address >> (stride * (4 - level))) & indexmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
-        descriptor = arm_ldq_ptw(env, descaddr, !nstable, mmu_idx, ptw_idx, fi);
+        if (!S1_ptw_translate(env, mmu_idx, ptw_idx, descaddr,
+                              !nstable, &s1, fi)) {
+            goto do_fault;
+        }
+        descriptor = arm_ldq_ptw(env, &s1, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
-- 
2.34.1


