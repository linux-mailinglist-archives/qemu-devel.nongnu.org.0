Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D6959C4E7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 19:19:55 +0200 (CEST)
Received: from localhost ([::1]:37838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQB5e-0007px-PB
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 13:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Oj-0004f1-0k
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:29 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:38755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Od-0001ax-Qh
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:28 -0400
Received: by mail-pf1-x42d.google.com with SMTP id y127so7716014pfy.5
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=DXX8xFRgoLfGrBLoJgCHBIES2WAuCLiCftR5z1MDZC4=;
 b=vX7tvs6PNftA4IM3kWT08DWV7XYyYwTEE7vuMrZTwHNZ8TKl6YsSLC2ydWdGSaM2Cl
 HWCq+X7Y9lLTasBv8hjC8ElqMsAHm72GUfpeSVRqldzIhIWzuN5mHdwaNFpYTXky46pk
 5PS4RvswMQdQYJHr4rBiEr5V5YqvpK+/veGoaXb1AD84duzR//QtL+7Vs9Y5CS4QmH1K
 xpDdD5hj8MJFv9LGnfjiYUERXwyLnoNnh6fdWV9YMLJLHrvWqb7AQJmrKOnP5rPXW0AR
 +zGVgaylMgDpAEx5NzgF5dNwk5MWvB01R+zul64UQqww6aBvtulqLawgn0Fvo3b5M8vl
 LuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=DXX8xFRgoLfGrBLoJgCHBIES2WAuCLiCftR5z1MDZC4=;
 b=uhUiav46KGWr9JvQu/xJUkO0snPTH3DiX/RfEOlZBwTq6sSXuk0wTcNuat9huWDQvL
 gWOmlndYNY1Wx2WvZBnLg07Ot82qwvz5DkyDOEMfz16eaV9cBEhdFxjuEHK5NGAtPrCm
 Am2TYlgpPhQ18SZwTh5SrNftqN3KKms5gt+e+QZyQRM5nzNZitYV2ZyyLB0o8whyp/sk
 Ap/QMrhps7dCQYIJnaUmfHzR2N7oFG3IeMqSOSgV2nDyaQ3If2xNcPj+/fqP0oCprzPI
 N4J6rFeNozFXkccadZzNJqUkp2Bkz3nhSbJpHuLytvrvNZBmdCHg6tXC76CIvAvcI5EJ
 cZhQ==
X-Gm-Message-State: ACgBeo2FYNuau7JFJqdCI35ivTS/JtdgopxlNAevez1HUYb1PQ3HajwD
 eAZbgakuOZXYnnj/XD6pMjUQojTm+EnVJg==
X-Google-Smtp-Source: AA6agR67w8ds/+uspy73jIGIiBoGCKOUzCWsP2mBZ/eq1lXsGM+ksFUWAiYFbNKV7KJrzkwYAbvpxw==
X-Received: by 2002:a63:2b02:0:b0:41d:9b5e:7d69 with SMTP id
 r2-20020a632b02000000b0041d9b5e7d69mr17083387pgr.165.1661182281250; 
 Mon, 22 Aug 2022 08:31:21 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 42/66] target/arm: Use tlb_set_page_full
Date: Mon, 22 Aug 2022 08:27:17 -0700
Message-Id: <20220822152741.1617527-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

Adjust GetPhysAddrResult to fill in CPUTLBEntryFull,
so that it may be passed directly to tlb_set_page_full.

The change is large, but mostly mechanical.  The major
non-mechanical change is page_size -> lg_page_size.
Most of the time this is obvious, and is related to
TARGET_PAGE_BITS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h  |   5 +-
 target/arm/helper.c     |  12 +--
 target/arm/m_helper.c   |  20 ++---
 target/arm/ptw.c        | 181 ++++++++++++++++++++--------------------
 target/arm/tlb_helper.c |   9 +-
 5 files changed, 112 insertions(+), 115 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a21a21299c..e914227e55 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1071,10 +1071,7 @@ typedef struct ARMCacheAttrs {
 
 /* Fields that are valid upon success. */
 typedef struct GetPhysAddrResult {
-    hwaddr phys;
-    target_ulong page_size;
-    int prot;
-    MemTxAttrs attrs;
+    CPUTLBEntryFull f;
     ARMCacheAttrs cacheattrs;
 } GetPhysAddrResult;
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 55355197b8..887f613b40 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3237,8 +3237,8 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
         /* Create a 64-bit PAR */
         par64 = (1 << 11); /* LPAE bit always set */
         if (!ret) {
-            par64 |= res.phys & ~0xfffULL;
-            if (!res.attrs.secure) {
+            par64 |= res.f.phys_addr & ~0xfffULL;
+            if (!res.f.attrs.secure) {
                 par64 |= (1 << 9); /* NS */
             }
             par64 |= (uint64_t)res.cacheattrs.attrs << 56; /* ATTR */
@@ -3262,13 +3262,13 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
          */
         if (!ret) {
             /* We do not set any attribute bits in the PAR */
-            if (res.page_size == (1 << 24)
+            if (res.f.lg_page_size == 24
                 && arm_feature(env, ARM_FEATURE_V7)) {
-                par64 = (res.phys & 0xff000000) | (1 << 1);
+                par64 = (res.f.phys_addr & 0xff000000) | (1 << 1);
             } else {
-                par64 = res.phys & 0xfffff000;
+                par64 = res.f.phys_addr & 0xfffff000;
             }
-            if (!res.attrs.secure) {
+            if (!res.f.attrs.secure) {
                 par64 |= (1 << 9); /* NS */
             }
         } else {
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 203ba411f6..355cd4d60a 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -223,8 +223,8 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
         }
         goto pend_fault;
     }
-    address_space_stl_le(arm_addressspace(cs, res.attrs), res.phys, value,
-                         res.attrs, &txres);
+    address_space_stl_le(arm_addressspace(cs, res.f.attrs), res.f.phys_addr,
+                         value, res.f.attrs, &txres);
     if (txres != MEMTX_OK) {
         /* BusFault trying to write the data */
         if (mode == STACK_LAZYFP) {
@@ -298,8 +298,8 @@ static bool v7m_stack_read(ARMCPU *cpu, uint32_t *dest, uint32_t addr,
         goto pend_fault;
     }
 
-    value = address_space_ldl(arm_addressspace(cs, res.attrs), res.phys,
-                              res.attrs, &txres);
+    value = address_space_ldl(arm_addressspace(cs, res.f.attrs),
+                              res.f.phys_addr, res.f.attrs, &txres);
     if (txres != MEMTX_OK) {
         /* BusFault trying to read the data */
         qemu_log_mask(CPU_LOG_INT, "...BusFault with BFSR.UNSTKERR\n");
@@ -2022,8 +2022,8 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool secure,
         qemu_log_mask(CPU_LOG_INT, "...really MemManage with CFSR.IACCVIOL\n");
         return false;
     }
-    *insn = address_space_lduw_le(arm_addressspace(cs, res.attrs), res.phys,
-                                  res.attrs, &txres);
+    *insn = address_space_lduw_le(arm_addressspace(cs, res.f.attrs),
+                                  res.f.phys_addr, res.f.attrs, &txres);
     if (txres != MEMTX_OK) {
         env->v7m.cfsr[M_REG_NS] |= R_V7M_CFSR_IBUSERR_MASK;
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_BUS, false);
@@ -2069,8 +2069,8 @@ static bool v7m_read_sg_stack_word(ARMCPU *cpu, ARMMMUIdx mmu_idx,
         }
         return false;
     }
-    value = address_space_ldl(arm_addressspace(cs, res.attrs), res.phys,
-                              res.attrs, &txres);
+    value = address_space_ldl(arm_addressspace(cs, res.f.attrs),
+                              res.f.phys_addr, res.f.attrs, &txres);
     if (txres != MEMTX_OK) {
         /* BusFault trying to read the data */
         qemu_log_mask(CPU_LOG_INT,
@@ -2817,8 +2817,8 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
         } else {
             mrvalid = true;
         }
-        r = res.prot & PAGE_READ;
-        rw = res.prot & PAGE_WRITE;
+        r = res.f.prot & PAGE_READ;
+        rw = res.f.prot & PAGE_WRITE;
     } else {
         r = false;
         rw = false;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index fa76f98b04..dafbf71d00 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -256,7 +256,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             assert(!is_secure);
         }
 
-        addr = s2.phys;
+        addr = s2.f.phys_addr;
     }
     return addr;
 }
@@ -476,7 +476,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         /* 1Mb section.  */
         phys_addr = (desc & 0xfff00000) | (address & 0x000fffff);
         ap = (desc >> 10) & 3;
-        result->page_size = 1024 * 1024;
+        result->f.lg_page_size = 20; /* 1MB */
     } else {
         /* Lookup l2 entry.  */
         if (type == 1) {
@@ -497,12 +497,12 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         case 1: /* 64k page.  */
             phys_addr = (desc & 0xffff0000) | (address & 0xffff);
             ap = (desc >> (4 + ((address >> 13) & 6))) & 3;
-            result->page_size = 0x10000;
+            result->f.lg_page_size = 16;
             break;
         case 2: /* 4k page.  */
             phys_addr = (desc & 0xfffff000) | (address & 0xfff);
             ap = (desc >> (4 + ((address >> 9) & 6))) & 3;
-            result->page_size = 0x1000;
+            result->f.lg_page_size = 12;
             break;
         case 3: /* 1k page, or ARMv6/XScale "extended small (4k) page" */
             if (type == 1) {
@@ -510,7 +510,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                 if (arm_feature(env, ARM_FEATURE_XSCALE)
                     || arm_feature(env, ARM_FEATURE_V6)) {
                     phys_addr = (desc & 0xfffff000) | (address & 0xfff);
-                    result->page_size = 0x1000;
+                    result->f.lg_page_size = 12;
                 } else {
                     /*
                      * UNPREDICTABLE in ARMv5; we choose to take a
@@ -521,7 +521,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                 }
             } else {
                 phys_addr = (desc & 0xfffffc00) | (address & 0x3ff);
-                result->page_size = 0x400;
+                result->f.lg_page_size = 10;
             }
             ap = (desc >> 4) & 3;
             break;
@@ -530,14 +530,14 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             g_assert_not_reached();
         }
     }
-    result->prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
-    result->prot |= result->prot ? PAGE_EXEC : 0;
-    if (!(result->prot & (1 << access_type))) {
+    result->f.prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
+    result->f.prot |= result->f.prot ? PAGE_EXEC : 0;
+    if (!(result->f.prot & (1 << access_type))) {
         /* Access permission fault.  */
         fi->type = ARMFault_Permission;
         goto do_fault;
     }
-    result->phys = phys_addr;
+    result->f.phys_addr = phys_addr;
     return false;
 do_fault:
     fi->domain = domain;
@@ -607,11 +607,11 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
             phys_addr = (desc & 0xff000000) | (address & 0x00ffffff);
             phys_addr |= (uint64_t)extract32(desc, 20, 4) << 32;
             phys_addr |= (uint64_t)extract32(desc, 5, 4) << 36;
-            result->page_size = 0x1000000;
+            result->f.lg_page_size = 24;  /* 16MB */
         } else {
             /* Section.  */
             phys_addr = (desc & 0xfff00000) | (address & 0x000fffff);
-            result->page_size = 0x100000;
+            result->f.lg_page_size = 20;  /* 1MB */
         }
         ap = ((desc >> 10) & 3) | ((desc >> 13) & 4);
         xn = desc & (1 << 4);
@@ -636,12 +636,12 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         case 1: /* 64k page.  */
             phys_addr = (desc & 0xffff0000) | (address & 0xffff);
             xn = desc & (1 << 15);
-            result->page_size = 0x10000;
+            result->f.lg_page_size = 16;
             break;
         case 2: case 3: /* 4k page.  */
             phys_addr = (desc & 0xfffff000) | (address & 0xfff);
             xn = desc & 1;
-            result->page_size = 0x1000;
+            result->f.lg_page_size = 12;
             break;
         default:
             /* Never happens, but compiler isn't smart enough to tell.  */
@@ -649,7 +649,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         }
     }
     if (domain_prot == 3) {
-        result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        result->f.prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
     } else {
         if (pxn && !regime_is_user(env, mmu_idx)) {
             xn = 1;
@@ -667,14 +667,14 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                 fi->type = ARMFault_AccessFlag;
                 goto do_fault;
             }
-            result->prot = simple_ap_to_rw_prot(env, mmu_idx, ap >> 1);
+            result->f.prot = simple_ap_to_rw_prot(env, mmu_idx, ap >> 1);
         } else {
-            result->prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
+            result->f.prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
         }
-        if (result->prot && !xn) {
-            result->prot |= PAGE_EXEC;
+        if (result->f.prot && !xn) {
+            result->f.prot |= PAGE_EXEC;
         }
-        if (!(result->prot & (1 << access_type))) {
+        if (!(result->f.prot & (1 << access_type))) {
             /* Access permission fault.  */
             fi->type = ARMFault_Permission;
             goto do_fault;
@@ -685,9 +685,9 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
          * the CPU doesn't support TZ or this is a non-secure translation
          * regime, because the attribute will already be non-secure.
          */
-        result->attrs.secure = false;
+        result->f.attrs.secure = false;
     }
-    result->phys = phys_addr;
+    result->f.phys_addr = phys_addr;
     return false;
 do_fault:
     fi->domain = domain;
@@ -1298,16 +1298,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         ns = mmu_idx == ARMMMUIdx_Stage2;
         xn = extract32(attrs, 11, 2);
-        result->prot = get_S2prot(env, ap, xn, s1_is_el0);
+        result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
     } else {
         ns = extract32(attrs, 3, 1);
         xn = extract32(attrs, 12, 1);
         pxn = extract32(attrs, 11, 1);
-        result->prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
+        result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
     }
 
     fault_type = ARMFault_Permission;
-    if (!(result->prot & (1 << access_type))) {
+    if (!(result->f.prot & (1 << access_type))) {
         goto do_fault;
     }
 
@@ -1317,11 +1317,11 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          * the CPU doesn't support TZ or this is a non-secure translation
          * regime, because the attribute will already be non-secure.
          */
-        result->attrs.secure = false;
+        result->f.attrs.secure = false;
     }
     /* When in aarch64 mode, and BTI is enabled, remember GP in the IOTLB.  */
     if (aarch64 && guarded && cpu_isar_feature(aa64_bti, cpu)) {
-        arm_tlb_bti_gp(&result->attrs) = true;
+        arm_tlb_bti_gp(&result->f.attrs) = true;
     }
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
@@ -1347,8 +1347,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         result->cacheattrs.shareability = extract32(attrs, 6, 2);
     }
 
-    result->phys = descaddr;
-    result->page_size = page_size;
+    result->f.phys_addr = descaddr;
+    result->f.lg_page_size = ctz64(page_size);
     return false;
 
 do_fault:
@@ -1373,12 +1373,12 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
 
     if (regime_translation_disabled(env, mmu_idx, is_secure)) {
         /* MPU disabled.  */
-        result->phys = address;
-        result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        result->f.phys_addr = address;
+        result->f.prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return false;
     }
 
-    result->phys = address;
+    result->f.phys_addr = address;
     for (n = 7; n >= 0; n--) {
         base = env->cp15.c6_region[n];
         if ((base & 1) == 0) {
@@ -1414,16 +1414,16 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
             fi->level = 1;
             return true;
         }
-        result->prot = PAGE_READ | PAGE_WRITE;
+        result->f.prot = PAGE_READ | PAGE_WRITE;
         break;
     case 2:
-        result->prot = PAGE_READ;
+        result->f.prot = PAGE_READ;
         if (!is_user) {
-            result->prot |= PAGE_WRITE;
+            result->f.prot |= PAGE_WRITE;
         }
         break;
     case 3:
-        result->prot = PAGE_READ | PAGE_WRITE;
+        result->f.prot = PAGE_READ | PAGE_WRITE;
         break;
     case 5:
         if (is_user) {
@@ -1431,10 +1431,10 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
             fi->level = 1;
             return true;
         }
-        result->prot = PAGE_READ;
+        result->f.prot = PAGE_READ;
         break;
     case 6:
-        result->prot = PAGE_READ;
+        result->f.prot = PAGE_READ;
         break;
     default:
         /* Bad permission.  */
@@ -1442,12 +1442,12 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
         fi->level = 1;
         return true;
     }
-    result->prot |= PAGE_EXEC;
+    result->f.prot |= PAGE_EXEC;
     return false;
 }
 
 static void get_phys_addr_pmsav7_default(CPUARMState *env, ARMMMUIdx mmu_idx,
-                                         int32_t address, int *prot)
+                                         int32_t address, uint8_t *prot)
 {
     if (!arm_feature(env, ARM_FEATURE_M)) {
         *prot = PAGE_READ | PAGE_WRITE;
@@ -1531,9 +1531,9 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
     int n;
     bool is_user = regime_is_user(env, mmu_idx);
 
-    result->phys = address;
-    result->page_size = TARGET_PAGE_SIZE;
-    result->prot = 0;
+    result->f.phys_addr = address;
+    result->f.lg_page_size = TARGET_PAGE_BITS;
+    result->f.prot = 0;
 
     if (regime_translation_disabled(env, mmu_idx, secure) ||
         m_is_ppb_region(env, address)) {
@@ -1545,7 +1545,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
          * which always does a direct read using address_space_ldl(), rather
          * than going via this function, so we don't need to check that here.
          */
-        get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->prot);
+        get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->f.prot);
     } else { /* MPU enabled */
         for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
             /* region search */
@@ -1587,7 +1587,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 if (ranges_overlap(base, rmask,
                                    address & TARGET_PAGE_MASK,
                                    TARGET_PAGE_SIZE)) {
-                    result->page_size = 1;
+                    result->f.lg_page_size = 0;
                 }
                 continue;
             }
@@ -1625,7 +1625,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 continue;
             }
             if (rsize < TARGET_PAGE_BITS) {
-                result->page_size = 1 << rsize;
+                result->f.lg_page_size = rsize;
             }
             break;
         }
@@ -1636,7 +1636,8 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 fi->type = ARMFault_Background;
                 return true;
             }
-            get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->prot);
+            get_phys_addr_pmsav7_default(env, mmu_idx, address,
+                                         &result->f.prot);
         } else { /* a MPU hit! */
             uint32_t ap = extract32(env->pmsav7.dracr[n], 8, 3);
             uint32_t xn = extract32(env->pmsav7.dracr[n], 12, 1);
@@ -1653,16 +1654,16 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 case 5:
                     break; /* no access */
                 case 3:
-                    result->prot |= PAGE_WRITE;
+                    result->f.prot |= PAGE_WRITE;
                     /* fall through */
                 case 2:
                 case 6:
-                    result->prot |= PAGE_READ | PAGE_EXEC;
+                    result->f.prot |= PAGE_READ | PAGE_EXEC;
                     break;
                 case 7:
                     /* for v7M, same as 6; for R profile a reserved value */
                     if (arm_feature(env, ARM_FEATURE_M)) {
-                        result->prot |= PAGE_READ | PAGE_EXEC;
+                        result->f.prot |= PAGE_READ | PAGE_EXEC;
                         break;
                     }
                     /* fall through */
@@ -1678,16 +1679,16 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 case 1:
                 case 2:
                 case 3:
-                    result->prot |= PAGE_WRITE;
+                    result->f.prot |= PAGE_WRITE;
                     /* fall through */
                 case 5:
                 case 6:
-                    result->prot |= PAGE_READ | PAGE_EXEC;
+                    result->f.prot |= PAGE_READ | PAGE_EXEC;
                     break;
                 case 7:
                     /* for v7M, same as 6; for R profile a reserved value */
                     if (arm_feature(env, ARM_FEATURE_M)) {
-                        result->prot |= PAGE_READ | PAGE_EXEC;
+                        result->f.prot |= PAGE_READ | PAGE_EXEC;
                         break;
                     }
                     /* fall through */
@@ -1700,14 +1701,14 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
             /* execute never */
             if (xn) {
-                result->prot &= ~PAGE_EXEC;
+                result->f.prot &= ~PAGE_EXEC;
             }
         }
     }
 
     fi->type = ARMFault_Permission;
     fi->level = 1;
-    return !(result->prot & (1 << access_type));
+    return !(result->f.prot & (1 << access_type));
 }
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
@@ -1732,9 +1733,9 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     uint32_t addr_page_base = address & TARGET_PAGE_MASK;
     uint32_t addr_page_limit = addr_page_base + (TARGET_PAGE_SIZE - 1);
 
-    result->page_size = TARGET_PAGE_SIZE;
-    result->phys = address;
-    result->prot = 0;
+    result->f.lg_page_size = TARGET_PAGE_BITS;
+    result->f.phys_addr = address;
+    result->f.prot = 0;
     if (mregion) {
         *mregion = -1;
     }
@@ -1784,13 +1785,13 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                     ranges_overlap(base, limit - base + 1,
                                    addr_page_base,
                                    TARGET_PAGE_SIZE)) {
-                    result->page_size = 1;
+                    result->f.lg_page_size = 0;
                 }
                 continue;
             }
 
             if (base > addr_page_base || limit < addr_page_limit) {
-                result->page_size = 1;
+                result->f.lg_page_size = 0;
             }
 
             if (matchregion != -1) {
@@ -1816,7 +1817,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 
     if (matchregion == -1) {
         /* hit using the background region */
-        get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->prot);
+        get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->f.prot);
     } else {
         uint32_t ap = extract32(env->pmsav8.rbar[secure][matchregion], 1, 2);
         uint32_t xn = extract32(env->pmsav8.rbar[secure][matchregion], 0, 1);
@@ -1831,9 +1832,9 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
             xn = 1;
         }
 
-        result->prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
-        if (result->prot && !xn && !(pxn && !is_user)) {
-            result->prot |= PAGE_EXEC;
+        result->f.prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
+        if (result->f.prot && !xn && !(pxn && !is_user)) {
+            result->f.prot |= PAGE_EXEC;
         }
         /*
          * We don't need to look the attribute up in the MAIR0/MAIR1
@@ -1846,7 +1847,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 
     fi->type = ARMFault_Permission;
     fi->level = 1;
-    return !(result->prot & (1 << access_type));
+    return !(result->f.prot & (1 << access_type));
 }
 
 static bool v8m_is_sau_exempt(CPUARMState *env,
@@ -2010,9 +2011,9 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                 } else {
                     fi->type = ARMFault_QEMU_SFault;
                 }
-                result->page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
-                result->phys = address;
-                result->prot = 0;
+                result->f.lg_page_size = sattrs.subpage ? 0 : TARGET_PAGE_BITS;
+                result->f.phys_addr = address;
+                result->f.prot = 0;
                 return true;
             }
         } else {
@@ -2022,7 +2023,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
              * might downgrade a secure access to nonsecure.
              */
             if (sattrs.ns) {
-                result->attrs.secure = false;
+                result->f.attrs.secure = false;
             } else if (!secure) {
                 /*
                  * NS access to S memory must fault.
@@ -2035,9 +2036,9 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                  * for M_FAKE_FSR_SFAULT in arm_v7m_cpu_do_interrupt().
                  */
                 fi->type = ARMFault_QEMU_SFault;
-                result->page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
-                result->phys = address;
-                result->prot = 0;
+                result->f.lg_page_size = sattrs.subpage ? 0 : TARGET_PAGE_BITS;
+                result->f.phys_addr = address;
+                result->f.prot = 0;
                 return true;
             }
         }
@@ -2046,7 +2047,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, secure,
                             result, fi, NULL);
     if (sattrs.subpage) {
-        result->page_size = 1;
+        result->f.lg_page_size = 0;
     }
     return ret;
 }
@@ -2353,9 +2354,9 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
         break;
     }
 
-    result->phys = address;
-    result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-    result->page_size = TARGET_PAGE_SIZE;
+    result->f.phys_addr = address;
+    result->f.prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+    result->f.lg_page_size = TARGET_PAGE_BITS;
     result->cacheattrs.is_s2_format = false;
     result->cacheattrs.shareability = shareability;
     result->cacheattrs.attrs = memattr;
@@ -2416,10 +2417,10 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                 return ret;
             }
 
-            ipa = result->phys;
+            ipa = result->f.phys_addr;
             if (is_secure) {
                 /* Select TCR based on the NS bit from the S1 walk. */
-                ipa_secure = !(result->attrs.secure
+                ipa_secure = !(result->f.attrs.secure
                                ? env->cp15.vstcr_el2 & VSTCR_SW
                                : env->cp15.vtcr_el2 & VTCR_NSW);
             } else {
@@ -2434,7 +2435,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
              * Save the stage1 results so that we may merge
              * prot and cacheattrs later.
              */
-            s1_prot = result->prot;
+            s1_prot = result->f.prot;
             cacheattrs1 = result->cacheattrs;
             memset(result, 0, sizeof(*result));
 
@@ -2443,7 +2444,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             fi->s2addr = ipa;
 
             /* Combine the S1 and S2 perms.  */
-            result->prot &= s1_prot;
+            result->f.prot &= s1_prot;
 
             /* If S2 fails, return early.  */
             if (ret) {
@@ -2471,10 +2472,10 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             /* Check if IPA translates to secure or non-secure PA space. */
             if (is_secure) {
                 if (ipa_secure) {
-                    result->attrs.secure =
+                    result->f.attrs.secure =
                         !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW));
                 } else {
-                    result->attrs.secure =
+                    result->f.attrs.secure =
                         !((env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))
                         || (env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW)));
                 }
@@ -2493,8 +2494,8 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
      * cannot upgrade an non-secure translation regime's attributes
      * to secure.
      */
-    result->attrs.secure = is_secure;
-    result->attrs.user = regime_is_user(env, mmu_idx);
+    result->f.attrs.secure = is_secure;
+    result->f.attrs.user = regime_is_user(env, mmu_idx);
 
     /*
      * Fast Context Switch Extension. This doesn't exist at all in v8.
@@ -2511,7 +2512,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
 
     if (arm_feature(env, ARM_FEATURE_PMSA)) {
         bool ret;
-        result->page_size = TARGET_PAGE_SIZE;
+        result->f.lg_page_size = TARGET_PAGE_BITS;
 
         if (arm_feature(env, ARM_FEATURE_V8)) {
             /* PMSAv8 */
@@ -2532,9 +2533,9 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                       (access_type == MMU_DATA_STORE ? "writing" : "execute"),
                       (uint32_t)address, mmu_idx,
                       ret ? "Miss" : "Hit",
-                      result->prot & PAGE_READ ? 'r' : '-',
-                      result->prot & PAGE_WRITE ? 'w' : '-',
-                      result->prot & PAGE_EXEC ? 'x' : '-');
+                      result->f.prot & PAGE_READ ? 'r' : '-',
+                      result->f.prot & PAGE_WRITE ? 'w' : '-',
+                      result->f.prot & PAGE_EXEC ? 'x' : '-');
 
         return ret;
     }
@@ -2609,10 +2610,10 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     bool ret;
 
     ret = get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi);
-    *attrs = res.attrs;
+    *attrs = res.f.attrs;
 
     if (ret) {
         return -1;
     }
-    return res.phys;
+    return res.f.phys_addr;
 }
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index ad225b1cb2..49601394ec 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -227,17 +227,16 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
          * target page size are handled specially, so for those we
          * pass in the exact addresses.
          */
-        if (res.page_size >= TARGET_PAGE_SIZE) {
-            res.phys &= TARGET_PAGE_MASK;
+        if (res.f.lg_page_size >= TARGET_PAGE_BITS) {
+            res.f.phys_addr &= TARGET_PAGE_MASK;
             address &= TARGET_PAGE_MASK;
         }
         /* Notice and record tagged memory. */
         if (cpu_isar_feature(aa64_mte, cpu) && res.cacheattrs.attrs == 0xf0) {
-            arm_tlb_mte_tagged(&res.attrs) = true;
+            arm_tlb_mte_tagged(&res.f.attrs) = true;
         }
 
-        tlb_set_page_with_attrs(cs, address, res.phys, res.attrs,
-                                res.prot, mmu_idx, res.page_size);
+        tlb_set_page_full(cs, mmu_idx, address, &res.f);
         return true;
     } else if (probe) {
         return false;
-- 
2.34.1


