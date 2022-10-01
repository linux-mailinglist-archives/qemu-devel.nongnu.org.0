Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 664D35F1E54
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 19:13:45 +0200 (CEST)
Received: from localhost ([::1]:58706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeg3c-0003wb-7k
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 13:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefIK-0000SM-4B
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:52 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:35596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefIH-0006Rg-3N
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:51 -0400
Received: by mail-qk1-x733.google.com with SMTP id u28so4542726qku.2
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=bV7kcmVq1B6RlQRM4hyx85LaGxM1dlmN2rlKELHByAI=;
 b=wNO+RKhEOiier9Ja8cN2CqUhcHLfuUmXbtsHeOoaC7hIZcU61jqUaKlpbz5KZzdkkW
 XuT+oDXE6rBgd2fibngxBl1DDv4HOUack5fSmkOC06ltguzlb4syG8i8M5juC8EjUOZt
 q+oLySy+JElX3fSZgp0ih8SuX5Ax+B5TlseVVg35shiBV9jm28VrHnDCNUWCtbi4dFBz
 3f3xbnsiNCQX/hyv2n2N1KYCycLQg3QS7+RY/fn5+rzPdVevz4pZ2WehH0zxi+pHP8m+
 oluNMHQACcFJGWrHKOLr14qdhY9FSIH89ZC6XgqnvGJcfb5bXR21sdG24W37MOT3beTC
 XsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bV7kcmVq1B6RlQRM4hyx85LaGxM1dlmN2rlKELHByAI=;
 b=O3ZOOVQxIf1eQ+t0LyNqcDyPy+SPXPJ4TtIEy3p8WsWXjWcNt97YtG9hwf9E9B2n0w
 GDW0Lpg3BtY/EH1PSWPUg+TVt1FPgnd/bxbDc7EurrlPC03N7f2XpEMsOFb15r2/9mgY
 ZvMLmWG+HzjAc4OaerXQMv39SnWiwz08K6vc5eo4+YSr+vdeU2/fRz0us9TB6T6aTt8j
 g1V9vW0otpNUX+fvjq1d8CRjgLEgwUt3yo1ErADy/NVQnrPOULLcIXYCPoHG64DMI5Vh
 /9GOz3/BopxxaZNAmw7Wa12mount6e3JUy1+pW4jZDNoRtCojhZqErkTWJxhPKM8G56o
 jEbQ==
X-Gm-Message-State: ACrzQf147lK0P6c0jhhBybKKHlqPufiOdy7lzV3RFCBZki/NAYLjwfNd
 +mJ9mmEO6pQIJTEXRGOoBuJB2RZAKjPiYw==
X-Google-Smtp-Source: AMsMyM47qSh9JpKoVjg08QhcHnxSB9z0yTu8ipE7g7IClX7Z+YA61tPYEeDlheDt2F1p+tDnyTYg6g==
X-Received: by 2002:a05:620a:2793:b0:6cb:c11a:130f with SMTP id
 g19-20020a05620a279300b006cbc11a130fmr9564402qkp.549.1664641487894; 
 Sat, 01 Oct 2022 09:24:47 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 35/42] target/arm: Move S1_ptw_translate outside
 arm_ld[lq]_ptw
Date: Sat,  1 Oct 2022 09:23:11 -0700
Message-Id: <20221001162318.153420-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 target/arm/ptw.c | 92 +++++++++++++++++++++++++-----------------------
 1 file changed, 48 insertions(+), 44 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d356b0b22d..84b55b640b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -315,38 +315,29 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
 }
 
 /* All loads done in the course of a page table walk go through here. */
-static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUIdx ptw_idx,
-                            bool debug, ARMMMUFaultInfo *fi)
+static uint32_t arm_ldl_ptw(CPUARMState *env, const S1TranslateResult *s1,
+                            ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    S1TranslateResult s1;
     uint32_t data;
 
-    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure,
-                          debug, &s1, fi)) {
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
@@ -357,38 +348,29 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     return data;
 }
 
-static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUIdx ptw_idx,
-                            bool debug, ARMMMUFaultInfo *fi)
+static uint64_t arm_ldq_ptw(CPUARMState *env, const S1TranslateResult *s1,
+                            ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    S1TranslateResult s1;
     uint64_t data;
 
-    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure,
-                          debug, &s1, fi)) {
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
@@ -520,6 +502,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
     int domain = 0;
     int domain_prot;
     hwaddr phys_addr;
+    S1TranslateResult s1;
     uint32_t dacr;
 
     /* Pagetable walk.  */
@@ -529,7 +512,11 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, debug, fi);
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, table,
+                          is_secure, debug, &s1, fi)) {
+        goto do_fault;
+    }
+    desc = arm_ldl_ptw(env, &s1, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -567,7 +554,11 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             /* Fine pagetable.  */
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, debug, fi);
+        if (!S1_ptw_translate(env, mmu_idx, ptw_idx, table,
+                              is_secure, debug, &s1, fi)) {
+            goto do_fault;
+        }
+        desc = arm_ldl_ptw(env, &s1, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -643,6 +634,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
     int domain_prot;
     hwaddr phys_addr;
     uint32_t dacr;
+    S1TranslateResult s1;
     bool ns;
 
     /* Pagetable walk.  */
@@ -652,7 +644,11 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, debug, fi);
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, table,
+                          is_secure, debug, &s1, fi)) {
+        goto do_fault;
+    }
+    desc = arm_ldl_ptw(env, &s1, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -705,7 +701,11 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, debug, fi);
+        if (!S1_ptw_translate(env, mmu_idx, ptw_idx, table,
+                              is_secure, debug, &s1, fi)) {
+            goto do_fault;
+        }
+        desc = arm_ldl_ptw(env, &s1, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -1281,14 +1281,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      */
     tableattrs = is_secure ? 0 : (1 << 4);
     for (;;) {
+        S1TranslateResult s1;
         uint64_t descriptor;
         bool nstable;
 
         descaddr |= (address >> (stride * (4 - level))) & indexmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
-        descriptor = arm_ldq_ptw(env, descaddr, !nstable, mmu_idx,
-                                 ptw_idx, debug, fi);
+        if (!S1_ptw_translate(env, mmu_idx, ptw_idx, descaddr,
+                              !nstable, debug, &s1, fi)) {
+            goto do_fault;
+        }
+        descriptor = arm_ldq_ptw(env, &s1, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
-- 
2.34.1


