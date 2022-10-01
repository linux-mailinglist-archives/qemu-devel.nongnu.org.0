Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6734F5F1DDA
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:50:39 +0200 (CEST)
Received: from localhost ([::1]:46410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefhG-0003xj-EF
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHn-00078d-Cu
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:19 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:34408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHi-0006KI-Ee
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:19 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id i9so1134277qvu.1
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=UT7PUowAnf9kIJYhZKLeWwVw/owenw9n/bgkOzzGDTA=;
 b=Nklxs0WOGJWlWSPNR5idPTXKHFjAL5m8TPVxF4Eyuk4BXfOGQpUWN75sH56leEc4Hw
 h+AHn+b7Rw3EzINSVjD2pJSWsTHPczLvn842Fyw+dI039Hwm8VUYAkWKFcthSBGAerTG
 9AZO5lJMC3R5NEGh9dgyq0qtrkL8QVkfGq068geT+QJP/SP0hqJ+i2yrBB8g9hYTIIDZ
 Y8hXmR498INEFB/gA9As+a6y1/FQDA0RvadW9kvDZdcz4dMOBWDOi/Y/X68hYAyjy123
 83XtKQ2J4JZ1gilWXJ8bbiBNFmrjc1FeC8H26ENe4k6gJL5JmErr8wm+P5Q28PtlSwRK
 6UNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UT7PUowAnf9kIJYhZKLeWwVw/owenw9n/bgkOzzGDTA=;
 b=tBKW6U7t0G0yfbh6yJyol8/mo8nCkfc+porOx2T9Rp5rpeZMj9qkOi1WBdUs0QqWMo
 pVXLajCUSPwRXYbSCNBn2cnj/bHfpIm8is5Few+yn5fR5NREIJMFsfDQ39cYtkhlv0wJ
 w+fgjawc7zLSEMyc8QETONSmN9A8lMx4mVbdx6s3BQUh2Ejj6kk7VJcbTSfmEI88LlKz
 3FZRPXwJE8pzuIuNyd3Sl4NTvDCjlQoQub0fqtT5Kmb5MwZ1tS4e81hH678KSde9QCVQ
 qR08/z0MiMvFN2LR2KsifHIS5VIImMAJMPfwZU2eIEXu5lSvs4rtGGkyQI6skh7C8HZQ
 +YHw==
X-Gm-Message-State: ACrzQf3D6QJu5wZNnGRohSdVVwQSnq+A0vLyrGUdg+bPH8ODmCnir9cx
 Gq6sC7wpZNHQXySEbzraJOEfsnTzRtu9TA==
X-Google-Smtp-Source: AMsMyM66j0fMYuBSobolk0vYkJ0F/AS2BJ7dqsQ5czgvSbOxrxax0Pd0+TdIyvho2YMT1IclnPRSOg==
X-Received: by 2002:a05:6214:1d21:b0:4ad:1361:befa with SMTP id
 f1-20020a0562141d2100b004ad1361befamr11050811qvd.111.1664641452096; 
 Sat, 01 Oct 2022 09:24:12 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 20/42] target/arm: Use tlb_set_page_full
Date: Sat,  1 Oct 2022 09:22:56 -0700
Message-Id: <20221001162318.153420-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2a.google.com
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
index b509d70851..fd17aee459 100644
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
index 4eec22b1f8..6fe85c6642 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3320,8 +3320,8 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
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
@@ -3345,13 +3345,13 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
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
index 8d27a98a42..1bc194ffa1 100644
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
@@ -1733,9 +1734,9 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
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
@@ -1785,13 +1786,13 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
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
@@ -1817,7 +1818,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 
     if (matchregion == -1) {
         /* hit using the background region */
-        get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->prot);
+        get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->f.prot);
     } else {
         uint32_t ap = extract32(env->pmsav8.rbar[secure][matchregion], 1, 2);
         uint32_t xn = extract32(env->pmsav8.rbar[secure][matchregion], 0, 1);
@@ -1832,9 +1833,9 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
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
@@ -1847,7 +1848,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 
     fi->type = ARMFault_Permission;
     fi->level = 1;
-    return !(result->prot & (1 << access_type));
+    return !(result->f.prot & (1 << access_type));
 }
 
 static bool v8m_is_sau_exempt(CPUARMState *env,
@@ -2011,9 +2012,9 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
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
@@ -2023,7 +2024,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
              * might downgrade a secure access to nonsecure.
              */
             if (sattrs.ns) {
-                result->attrs.secure = false;
+                result->f.attrs.secure = false;
             } else if (!secure) {
                 /*
                  * NS access to S memory must fault.
@@ -2036,9 +2037,9 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
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
@@ -2047,7 +2048,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, secure,
                             result, fi, NULL);
     if (sattrs.subpage) {
-        result->page_size = 1;
+        result->f.lg_page_size = 0;
     }
     return ret;
 }
@@ -2338,9 +2339,9 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
         result->cacheattrs.is_s2_format = false;
     }
 
-    result->phys = address;
-    result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-    result->page_size = TARGET_PAGE_SIZE;
+    result->f.phys_addr = address;
+    result->f.prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+    result->f.lg_page_size = TARGET_PAGE_BITS;
     result->cacheattrs.shareability = shareability;
     result->cacheattrs.attrs = memattr;
     return 0;
@@ -2377,8 +2378,8 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                 return ret;
             }
 
-            ipa = result->phys;
-            ipa_secure = result->attrs.secure;
+            ipa = result->f.phys_addr;
+            ipa_secure = result->f.attrs.secure;
             if (is_secure) {
                 /* Select TCR based on the NS bit from the S1 walk. */
                 s2walk_secure = !(ipa_secure
@@ -2398,7 +2399,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
              * Save the stage1 results so that we may merge
              * prot and cacheattrs later.
              */
-            s1_prot = result->prot;
+            s1_prot = result->f.prot;
             cacheattrs1 = result->cacheattrs;
             memset(result, 0, sizeof(*result));
 
@@ -2407,7 +2408,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             fi->s2addr = ipa;
 
             /* Combine the S1 and S2 perms.  */
-            result->prot &= s1_prot;
+            result->f.prot &= s1_prot;
 
             /* If S2 fails, return early.  */
             if (ret) {
@@ -2435,10 +2436,10 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
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
@@ -2457,8 +2458,8 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
      * cannot upgrade an non-secure translation regime's attributes
      * to secure.
      */
-    result->attrs.secure = is_secure;
-    result->attrs.user = regime_is_user(env, mmu_idx);
+    result->f.attrs.secure = is_secure;
+    result->f.attrs.user = regime_is_user(env, mmu_idx);
 
     /*
      * Fast Context Switch Extension. This doesn't exist at all in v8.
@@ -2475,7 +2476,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
 
     if (arm_feature(env, ARM_FEATURE_PMSA)) {
         bool ret;
-        result->page_size = TARGET_PAGE_SIZE;
+        result->f.lg_page_size = TARGET_PAGE_BITS;
 
         if (arm_feature(env, ARM_FEATURE_V8)) {
             /* PMSAv8 */
@@ -2496,9 +2497,9 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
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
@@ -2573,10 +2574,10 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
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


