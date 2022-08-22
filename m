Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0282359CCE1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 02:10:00 +0200 (CEST)
Received: from localhost ([::1]:40222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHUV-0004s3-2U
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 20:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJE-0004MY-Rs
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:22 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:34438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJC-0002l2-Fv
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:20 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 c16-20020a17090aa61000b001fb3286d9f7so106364pjq.1
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=aw89WC7RVHXSLWd5cxN77p9SR70YM5CjHyw47X2hKRo=;
 b=NOrVboCN+OjzkiKZCn3ILsFYXFSARCkLBY5PU6iHq/1E2RQU13/iijXauZi3nl7nPy
 sEWF4djDlLbgGqRgbDkL5FQG1UUWgeLe3lGPloDHCVo0Qg/3/0eXzdzQ2yAbC3OUqgDP
 4wLgsWs1A0sF85elvhFOT9CC3/MMg9WOLrM0DAjgEvcMyBquFygFRvL6vvVSrS1M5owY
 KAGpbcfYHOPsre3uUb8dE53R/7U++wsfGmcGAmE/3rOm7onDaieQfMFDc3HQ7TLdVib5
 Ej7hm+fKzqqKy/atXuyCZBiRCODQ/XgRHKK3SvKscyJpf5P4gMP/KIzClPegsz0JGx63
 APyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=aw89WC7RVHXSLWd5cxN77p9SR70YM5CjHyw47X2hKRo=;
 b=HdkZKUxQd1algaWU1jL4fQpt+X59S+Oe28Fp3McbB05LJr3OIC3seLs06JzcQkOqZH
 u3DOFMwJ1r0SVZxTk74Y622T9ziD60G61AGMsWIBIZ5xYPTpaFSQYV535yPYrvxZ5W5q
 iU7a9MV5ysuXUkG+Phe5bItYCTQFOAfzOalOz+jhbt3JEsxgYNe+jg3Ht1sP2QFlu2yy
 /uNYGcbsiq3g07sgLBU7wdeNW6IfR+vSNOyGLQiDr10ItVe/ZvGxNO7EBLEdfZmxb45O
 gCsChqOOSnEsfkH8kfAVcPx6JM4q2vRSMzwKDuPg+lpU2ciNjdvfGW5kn/odWPnedJKZ
 5nPA==
X-Gm-Message-State: ACgBeo1WPAonB7/ILPNc7UToZgZCS11W2i91IGs3PBiZPLM9GHF6Cvnk
 7TIPsfnn4lRxggB7s/tAIfXw5/yDxuCxsQ==
X-Google-Smtp-Source: AA6agR6BUFvHy+P/STckusk2mjXKg9j3P1l2PZr0gW9boUeHt9Jbu55cbJZwqCy7u3obDiTt2+5AcQ==
X-Received: by 2002:a17:902:e5cf:b0:172:e7e6:d7e with SMTP id
 u15-20020a170902e5cf00b00172e7e60d7emr7570419plf.30.1661212696815; 
 Mon, 22 Aug 2022 16:58:16 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 w190-20020a6230c7000000b0052d52de6726sm9173159pfw.124.2022.08.22.16.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:58:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	eduardo@habkost.net
Subject: [PATCH 14/14] target/i386: Use atomic operations for pte updates
Date: Mon, 22 Aug 2022 16:58:03 -0700
Message-Id: <20220822235803.1729290-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822235803.1729290-1-richard.henderson@linaro.org>
References: <20220822235803.1729290-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Use probe_access_full in order to resolve to a host address,
which then lets us use a host cmpxchg to update the pte.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/279
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/sysemu/excp_helper.c | 242 +++++++++++++++++++--------
 1 file changed, 168 insertions(+), 74 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index e5d9ff138e..74a76cf883 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -27,8 +27,8 @@ typedef struct TranslateParams {
     target_ulong cr3;
     int pg_mode;
     int mmu_idx;
+    int ptw_idx;
     MMUAccessType access_type;
-    bool use_stage2;
 } TranslateParams;
 
 typedef struct TranslateResult {
@@ -50,43 +50,106 @@ typedef struct TranslateFault {
     TranslateFaultStage2 stage2;
 } TranslateFault;
 
-#define PTE_HPHYS(ADDR)                                         \
-    do {                                                        \
-        if (in->use_stage2) {                                   \
-            nested_in.addr = (ADDR);                            \
-            if (!mmu_translate(env, &nested_in, out, err)) {    \
-                err->stage2 = S2_GPT;                           \
-                return false;                                   \
-            }                                                   \
-            (ADDR) = out->paddr;                                \
-        }                                                       \
-    } while (0)
+typedef struct PTETranslate {
+    CPUX86State *env;
+    TranslateFault *err;
+    int ptw_idx;
+    void *haddr;
+    hwaddr gaddr;
+} PTETranslate;
+
+static bool ptw_translate(PTETranslate *inout, hwaddr addr)
+{
+    CPUTLBEntryFull *full;
+    int flags;
+
+    inout->gaddr = addr;
+    flags = probe_access_full(inout->env, addr, MMU_DATA_STORE,
+                              inout->ptw_idx, true, &inout->haddr, &full, 0);
+
+    if (unlikely(flags & TLB_INVALID_MASK)) {
+        TranslateFault *err = inout->err;
+
+        assert(inout->ptw_idx == MMU_NESTED_IDX);
+        err->exception_index = 0; /* unused */
+        err->error_code = inout->env->error_code;
+        err->cr2 = addr;
+        err->stage2 = S2_GPT;
+        return false;
+    }
+    return true;
+}
+
+static inline uint32_t ptw_ldl(const PTETranslate *in)
+{
+    if (likely(in->haddr)) {
+        return ldl_p(in->haddr);
+    }
+    return cpu_ldl_mmuidx_ra(in->env, in->gaddr, in->ptw_idx, 0);
+}
+
+static inline uint64_t ptw_ldq(const PTETranslate *in)
+{
+    if (likely(in->haddr)) {
+        return ldq_p(in->haddr);
+    }
+    return cpu_ldq_mmuidx_ra(in->env, in->gaddr, in->ptw_idx, 0);
+}
+
+/*
+ * Note that we can use a 32-bit cmpxchg for all page table entries,
+ * even 64-bit ones, because PG_PRESENT_MASK, PG_ACCESSED_MASK and
+ * PG_DIRTY_MASK are all in the low 32 bits.
+ */
+static bool ptw_setl_slow(const PTETranslate *in, uint32_t old, uint32_t new)
+{
+    uint32_t cmp;
+
+    /* Does x86 really perform a rmw cycle on mmio for ptw? */
+    start_exclusive();
+    cmp = cpu_ldl_mmuidx_ra(in->env, in->gaddr, in->ptw_idx, 0);
+    if (cmp == old) {
+        cpu_stl_mmuidx_ra(in->env, in->gaddr, new, in->ptw_idx, 0);
+    }
+    end_exclusive();
+    return cmp == old;
+}
+
+static inline bool ptw_setl(const PTETranslate *in, uint32_t old, uint32_t set)
+{
+    if (set & ~old) {
+        uint32_t new = old | set;
+        if (likely(in->haddr)) {
+            old = cpu_to_le32(old);
+            new = cpu_to_le32(new);
+            return qatomic_cmpxchg((uint32_t *)in->haddr, old, new) == old;
+        }
+        return ptw_setl_slow(in, old, new);
+    }
+    return true;
+}
 
 static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
                           TranslateResult *out, TranslateFault *err)
 {
-    TranslateParams nested_in = {
-        /* Use store for page table entries, to allow A/D flag updates. */
-        .access_type = MMU_DATA_STORE,
-        .cr3 = env->nested_cr3,
-        .pg_mode = env->nested_pg_mode,
-        .mmu_idx = MMU_USER_IDX,
-        .use_stage2 = false,
-    };
-
-    CPUState *cs = env_cpu(env);
-    X86CPU *cpu = env_archcpu(env);
     const int32_t a20_mask = x86_get_a20_mask(env);
     const target_ulong addr = in->addr;
     const int pg_mode = in->pg_mode;
     const bool is_user = (in->mmu_idx == MMU_USER_IDX);
     const MMUAccessType access_type = in->access_type;
-    uint64_t ptep, pte;
+    uint64_t ptep, pte, rsvd_mask;
+    PTETranslate pte_trans = {
+        .env = env,
+        .err = err,
+        .ptw_idx = in->ptw_idx,
+    };
     hwaddr pte_addr;
-    uint64_t rsvd_mask = PG_ADDRESS_MASK & ~MAKE_64BIT_MASK(0, cpu->phys_bits);
     uint32_t pkr;
     int page_size;
 
+ restart_all:
+    rsvd_mask = ~MAKE_64BIT_MASK(0, env_archcpu(env)->phys_bits);
+    rsvd_mask &= PG_ADDRESS_MASK;
     if (!(pg_mode & PG_MODE_NXE)) {
         rsvd_mask |= PG_NX_MASK;
     }
@@ -100,17 +163,19 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
                  */
                 pte_addr = ((in->cr3 & ~0xfff) +
                             (((addr >> 48) & 0x1ff) << 3)) & a20_mask;
-                PTE_HPHYS(pte_addr);
-                pte = x86_ldq_phys(cs, pte_addr);
+                if (!ptw_translate(&pte_trans, pte_addr)) {
+                    return false;
+                }
+            restart_5:
+                pte = ptw_ldq(&pte_trans);
                 if (!(pte & PG_PRESENT_MASK)) {
                     goto do_fault;
                 }
                 if (pte & (rsvd_mask | PG_PSE_MASK)) {
                     goto do_fault_rsvd;
                 }
-                if (!(pte & PG_ACCESSED_MASK)) {
-                    pte |= PG_ACCESSED_MASK;
-                    x86_stl_phys_notdirty(cs, pte_addr, pte);
+                if (!ptw_setl(&pte_trans, pte, PG_ACCESSED_MASK)) {
+                    goto restart_5;
                 }
                 ptep = pte ^ PG_NX_MASK;
             } else {
@@ -123,17 +188,19 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
              */
             pte_addr = ((pte & PG_ADDRESS_MASK) +
                         (((addr >> 39) & 0x1ff) << 3)) & a20_mask;
-            PTE_HPHYS(pte_addr);
-            pte = x86_ldq_phys(cs, pte_addr);
+            if (!ptw_translate(&pte_trans, pte_addr)) {
+                return false;
+            }
+        restart_4:
+            pte = ptw_ldq(&pte_trans);
             if (!(pte & PG_PRESENT_MASK)) {
                 goto do_fault;
             }
             if (pte & (rsvd_mask | PG_PSE_MASK)) {
                 goto do_fault_rsvd;
             }
-            if (!(pte & PG_ACCESSED_MASK)) {
-                pte |= PG_ACCESSED_MASK;
-                x86_stl_phys_notdirty(cs, pte_addr, pte);
+            if (!ptw_setl(&pte_trans, pte, PG_ACCESSED_MASK)) {
+                goto restart_4;
             }
             ptep &= pte ^ PG_NX_MASK;
 
@@ -142,19 +209,21 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
              */
             pte_addr = ((pte & PG_ADDRESS_MASK) +
                         (((addr >> 30) & 0x1ff) << 3)) & a20_mask;
-            PTE_HPHYS(pte_addr);
-            pte = x86_ldq_phys(cs, pte_addr);
+            if (!ptw_translate(&pte_trans, pte_addr)) {
+                return false;
+            }
+        restart_3_lma:
+            pte = ptw_ldq(&pte_trans);
             if (!(pte & PG_PRESENT_MASK)) {
                 goto do_fault;
             }
             if (pte & rsvd_mask) {
                 goto do_fault_rsvd;
             }
-            ptep &= pte ^ PG_NX_MASK;
-            if (!(pte & PG_ACCESSED_MASK)) {
-                pte |= PG_ACCESSED_MASK;
-                x86_stl_phys_notdirty(cs, pte_addr, pte);
+            if (!ptw_setl(&pte_trans, pte, PG_ACCESSED_MASK)) {
+                goto restart_3_lma;
             }
+            ptep &= pte ^ PG_NX_MASK;
             if (pte & PG_PSE_MASK) {
                 /* 1 GB page */
                 page_size = 1024 * 1024 * 1024;
@@ -167,15 +236,21 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
              * Page table level 3
              */
             pte_addr = ((in->cr3 & ~0x1f) + ((addr >> 27) & 0x18)) & a20_mask;
-            PTE_HPHYS(pte_addr);
-            pte = x86_ldq_phys(cs, pte_addr);
+            if (!ptw_translate(&pte_trans, pte_addr)) {
+                return false;
+            }
+            rsvd_mask |= PG_HI_USER_MASK;
+        restart_3_nolma:
+            pte = ptw_ldq(&pte_trans);
             if (!(pte & PG_PRESENT_MASK)) {
                 goto do_fault;
             }
-            rsvd_mask |= PG_HI_USER_MASK;
             if (pte & (rsvd_mask | PG_NX_MASK)) {
                 goto do_fault_rsvd;
             }
+            if (!ptw_setl(&pte_trans, pte, PG_ACCESSED_MASK)) {
+                goto restart_3_nolma;
+            }
             ptep = PG_NX_MASK | PG_USER_MASK | PG_RW_MASK;
         }
 
@@ -184,32 +259,37 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
          */
         pte_addr = ((pte & PG_ADDRESS_MASK) +
                     (((addr >> 21) & 0x1ff) << 3)) & a20_mask;
-        PTE_HPHYS(pte_addr);
-        pte = x86_ldq_phys(cs, pte_addr);
+        if (!ptw_translate(&pte_trans, pte_addr)) {
+            return false;
+        }
+    restart_2_pae:
+        pte = ptw_ldq(&pte_trans);
         if (!(pte & PG_PRESENT_MASK)) {
             goto do_fault;
         }
         if (pte & rsvd_mask) {
             goto do_fault_rsvd;
         }
-        ptep &= pte ^ PG_NX_MASK;
         if (pte & PG_PSE_MASK) {
             /* 2 MB page */
             page_size = 2048 * 1024;
+            ptep &= pte ^ PG_NX_MASK;
             goto do_check_protect;
         }
-        if (!(pte & PG_ACCESSED_MASK)) {
-            pte |= PG_ACCESSED_MASK;
-            x86_stl_phys_notdirty(cs, pte_addr, pte);
+        if (!ptw_setl(&pte_trans, pte, PG_ACCESSED_MASK)) {
+            goto restart_2_pae;
         }
+        ptep &= pte ^ PG_NX_MASK;
 
         /*
          * Page table level 1
          */
         pte_addr = ((pte & PG_ADDRESS_MASK) +
                     (((addr >> 12) & 0x1ff) << 3)) & a20_mask;
-        PTE_HPHYS(pte_addr);
-        pte = x86_ldq_phys(cs, pte_addr);
+        if (!ptw_translate(&pte_trans, pte_addr)) {
+            return false;
+        }
+        pte = ptw_ldq(&pte_trans);
         if (!(pte & PG_PRESENT_MASK)) {
             goto do_fault;
         }
@@ -224,8 +304,11 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
          * Page table level 2
          */
         pte_addr = ((in->cr3 & ~0xfff) + ((addr >> 20) & 0xffc)) & a20_mask;
-        PTE_HPHYS(pte_addr);
-        pte = x86_ldl_phys(cs, pte_addr);
+        if (!ptw_translate(&pte_trans, pte_addr)) {
+            return false;
+        }
+    restart_2_nopae:
+        pte = ptw_ldl(&pte_trans);
         if (!(pte & PG_PRESENT_MASK)) {
             goto do_fault;
         }
@@ -242,17 +325,18 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
             rsvd_mask = 0x200000;
             goto do_check_protect_pse36;
         }
-        if (!(pte & PG_ACCESSED_MASK)) {
-            pte |= PG_ACCESSED_MASK;
-            x86_stl_phys_notdirty(cs, pte_addr, pte);
+        if (!ptw_setl(&pte_trans, pte, PG_ACCESSED_MASK)) {
+            goto restart_2_nopae;
         }
 
         /*
          * Page table level 1
          */
         pte_addr = ((pte & ~0xfffu) + ((addr >> 10) & 0xffc)) & a20_mask;
-        PTE_HPHYS(pte_addr);
-        pte = x86_ldl_phys(cs, pte_addr);
+        if (!ptw_translate(&pte_trans, pte_addr)) {
+            return false;
+        }
+        pte = ptw_ldl(&pte_trans);
         if (!(pte & PG_PRESENT_MASK)) {
             goto do_fault;
         }
@@ -319,27 +403,35 @@ do_check_protect_pse36:
         uint32_t set = PG_ACCESSED_MASK;
         if (access_type == MMU_DATA_STORE) {
             set |= PG_DIRTY_MASK;
+        } else if (!(pte & PG_DIRTY_MASK)) {
+            /*
+             * Only set write access if already dirty...
+             * otherwise wait for dirty access.
+             */
+            prot &= ~PAGE_WRITE;
         }
-        if (set & ~pte) {
-            pte |= set;
-            x86_stl_phys_notdirty(cs, pte_addr, pte);
+        if (!ptw_setl(&pte_trans, pte, set)) {
+            /*
+             * We can arrive here from any of 3 levels and 2 formats.
+             * The only safe thing is to restart the entire lookup.
+             */
+            goto restart_all;
         }
     }
 
-    if (!(pte & PG_DIRTY_MASK)) {
-        /* only set write access if already dirty... otherwise wait
-           for dirty access */
-        assert(access_type != MMU_DATA_STORE);
-        prot &= ~PAGE_WRITE;
-    }
-
     /* align to page_size */
     out->paddr = (pte & a20_mask & PG_ADDRESS_MASK & ~(page_size - 1))
                | (addr & (page_size - 1));
 
-    if (in->use_stage2) {
-        nested_in.addr = out->paddr;
-        nested_in.access_type = access_type;
+    if (in->ptw_idx == MMU_NESTED_IDX) {
+        TranslateParams nested_in = {
+            .addr = out->paddr,
+            .access_type = access_type,
+            .cr3 = env->nested_cr3,
+            .pg_mode = env->nested_pg_mode,
+            .mmu_idx = MMU_USER_IDX,
+            .ptw_idx = MMU_PHYS_IDX,
+        };
 
         if (!mmu_translate(env, &nested_in, out, err)) {
             err->stage2 = S2_GPA;
@@ -436,7 +528,7 @@ static bool get_physical_address(CPUX86State *env, vaddr addr,
             in.cr3 = env->nested_cr3;
             in.pg_mode = env->nested_pg_mode;
             in.mmu_idx = MMU_USER_IDX;
-            in.use_stage2 = false;
+            in.ptw_idx = MMU_PHYS_IDX;
 
             if (!mmu_translate(env, &in, out, err)) {
                 err->stage2 = S2_GPA;
@@ -449,7 +541,7 @@ static bool get_physical_address(CPUX86State *env, vaddr addr,
     default:
         in.cr3 = env->cr[3];
         in.mmu_idx = mmu_idx;
-        in.use_stage2 = use_stage2;
+        in.ptw_idx = use_stage2 ? MMU_NESTED_IDX : MMU_PHYS_IDX;
         in.pg_mode = get_pg_mode(env);
 
         if (likely(in.pg_mode)) {
@@ -504,6 +596,8 @@ bool x86_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
     }
 
     if (probe) {
+        /* This will be used if recursing for stage2 translation. */
+        env->error_code = err.error_code;
         return false;
     }
 
-- 
2.34.1


