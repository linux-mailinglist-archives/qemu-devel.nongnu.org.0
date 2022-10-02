Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8500E5F244D
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 19:37:39 +0200 (CEST)
Received: from localhost ([::1]:33022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1of2uI-0000H7-KK
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 13:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of2nV-0005Sh-Vc
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 13:30:43 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:33561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of2nR-0006BU-BX
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 13:30:35 -0400
Received: by mail-pf1-x435.google.com with SMTP id w2so8416099pfb.0
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 10:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=eSyXIPxnSfJv4KTx45fDzIMqON6eUhifkXEE6zOJl1g=;
 b=f+Gbo3Kw6k0QJo64zpVfkQKzAv3UfpbzFHoYGxveykErr9INc5L1RM6hj1DJnmjpn/
 85ZguURDEYRuqh6bXUVsL78VM5HuhrxCAjKCuqbXm/N7MUpv2z9Pw4eYm5NZL9TPgrx4
 Von1pXCORU7j4IUZoGTwjWaCmFbFCIArB03aGRj5R514MnwR2GsYEoL1O+tyxhI0xtEH
 L6BZ6Il8Sd50PQdzUUXLcvojq/Bth/BM4FvIwerUfxDGBsTOXsjFxfplOXcGWfznKmMp
 W0Xb061Hz6spZOm6XAZfkHkO9NnFfR0pID+bh52lt3qHs2gnIfLAIloafOBPYqXkcH+Y
 t6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=eSyXIPxnSfJv4KTx45fDzIMqON6eUhifkXEE6zOJl1g=;
 b=wuG2kF4BFnZHXU593aXcGH/a7YwO2b/M7p2AlJRHOC9fCUoXtcqYIuVxSRff0A8uA9
 qfziz18LWtOqvDcrK5/5fnlJxNRlLv9nfrTt6Qs9RKJQneA3lQ+T3pkLxZ9+kEnYPdJu
 wNGBVOkNcqzRtQTs9BiIWV/2en4bN6VFDapBfPjkbvwJjV/FDFU1jGdnKWW8joIMQWJK
 3E1vpjvdiNpYUYYjvchFtZMXxFBx4//1IvTlsv68yYtXm/xmGh3wrapOknx3zwIhog+l
 Z8iKpuiLQSz9fOS34qOwMqdS0EjlNSIBSOYAoYoO4snrHNTMOvkPyOd7b+DHSSK51YJn
 6/Bw==
X-Gm-Message-State: ACrzQf0JpSKSonyR4FYmwxF5hZ0j2HsBuk2nXgtxLV3/XU4IzEIyRT44
 33N/kjchQ9zruvm8CapI8h2dXQfUakQ7pw==
X-Google-Smtp-Source: AMsMyM5MmdhSxFz/y1hl9R2lKoXGSj1uGHccRMib8SMCQ9l1KFoyYHrJrWfDXyXlDcfwVv921tnbHg==
X-Received: by 2002:a05:6a00:e8f:b0:536:c98e:8307 with SMTP id
 bo15-20020a056a000e8f00b00536c98e8307mr18919574pfb.73.1664731831694; 
 Sun, 02 Oct 2022 10:30:31 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8002:3cad:72cd:dd96:98f6:c3cf])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62168d000000b0056025ccc3bbsm2749783pfw.146.2022.10.02.10.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 10:30:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 3/9] target/i386: Introduce structures for mmu_translate
Date: Sun,  2 Oct 2022 10:29:50 -0700
Message-Id: <20221002172956.265735-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221002172956.265735-1-richard.henderson@linaro.org>
References: <20221002172956.265735-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Create TranslateParams for inputs, TranslateResults for successful
outputs, and TranslateFault for error outputs; return true on success.

Move stage1 error paths from handle_mmu_fault to x86_cpu_tlb_fill;
reorg the rest of handle_mmu_fault into get_physical_address.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/sysemu/excp_helper.c | 322 ++++++++++++++-------------
 1 file changed, 171 insertions(+), 151 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index c9f6afba29..00ce4cf253 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -22,30 +22,45 @@
 #include "exec/exec-all.h"
 #include "tcg/helper-tcg.h"
 
-#define PG_ERROR_OK (-1)
+typedef struct TranslateParams {
+    target_ulong addr;
+    target_ulong cr3;
+    int pg_mode;
+    int mmu_idx;
+    MMUAccessType access_type;
+    bool use_stage2;
+} TranslateParams;
+
+typedef struct TranslateResult {
+    hwaddr paddr;
+    int prot;
+    int page_size;
+} TranslateResult;
+
+typedef struct TranslateFault {
+    int exception_index;
+    int error_code;
+    target_ulong cr2;
+} TranslateFault;
 
 #define GET_HPHYS(cs, gpa, access_type, prot)  \
-	(use_stage2 ? get_hphys(cs, gpa, access_type, prot) : gpa)
+	(in->use_stage2 ? get_hphys(cs, gpa, access_type, prot) : gpa)
 
-static int mmu_translate(CPUState *cs, hwaddr addr, bool use_stage2,
-                         uint64_t cr3, MMUAccessType access_type,
-                         int mmu_idx, int pg_mode,
-                         hwaddr *xlat, int *page_size, int *prot)
+static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
+                          TranslateResult *out, TranslateFault *err)
 {
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
+    CPUState *cs = env_cpu(env);
+    X86CPU *cpu = env_archcpu(env);
+    const int32_t a20_mask = x86_get_a20_mask(env);
+    const target_ulong addr = in->addr;
+    const int pg_mode = in->pg_mode;
+    const bool is_user = (in->mmu_idx == MMU_USER_IDX);
+    const MMUAccessType access_type = in->access_type;
     uint64_t ptep, pte;
-    int32_t a20_mask;
-    target_ulong pde_addr, pte_addr;
-    int error_code = 0;
-    bool is_dirty, is_write, is_user;
+    hwaddr pde_addr, pte_addr;
     uint64_t rsvd_mask = PG_ADDRESS_MASK & ~MAKE_64BIT_MASK(0, cpu->phys_bits);
-    uint32_t page_offset;
     uint32_t pkr;
-
-    is_user = (mmu_idx == MMU_USER_IDX);
-    is_write = (access_type == MMU_DATA_STORE);
-    a20_mask = x86_get_a20_mask(env);
+    int page_size;
 
     if (!(pg_mode & PG_MODE_NXE)) {
         rsvd_mask |= PG_NX_MASK;
@@ -62,7 +77,7 @@ static int mmu_translate(CPUState *cs, hwaddr addr, bool use_stage2,
             uint64_t pml4e_addr, pml4e;
 
             if (la57) {
-                pml5e_addr = ((cr3 & ~0xfff) +
+                pml5e_addr = ((in->cr3 & ~0xfff) +
                         (((addr >> 48) & 0x1ff) << 3)) & a20_mask;
                 pml5e_addr = GET_HPHYS(cs, pml5e_addr, MMU_DATA_STORE, NULL);
                 pml5e = x86_ldq_phys(cs, pml5e_addr);
@@ -78,7 +93,7 @@ static int mmu_translate(CPUState *cs, hwaddr addr, bool use_stage2,
                 }
                 ptep = pml5e ^ PG_NX_MASK;
             } else {
-                pml5e = cr3;
+                pml5e = in->cr3;
                 ptep = PG_NX_MASK | PG_USER_MASK | PG_RW_MASK;
             }
 
@@ -114,7 +129,7 @@ static int mmu_translate(CPUState *cs, hwaddr addr, bool use_stage2,
             }
             if (pdpe & PG_PSE_MASK) {
                 /* 1 GB page */
-                *page_size = 1024 * 1024 * 1024;
+                page_size = 1024 * 1024 * 1024;
                 pte_addr = pdpe_addr;
                 pte = pdpe;
                 goto do_check_protect;
@@ -123,7 +138,7 @@ static int mmu_translate(CPUState *cs, hwaddr addr, bool use_stage2,
 #endif
         {
             /* XXX: load them when cr3 is loaded ? */
-            pdpe_addr = ((cr3 & ~0x1f) + ((addr >> 27) & 0x18)) &
+            pdpe_addr = ((in->cr3 & ~0x1f) + ((addr >> 27) & 0x18)) &
                 a20_mask;
             pdpe_addr = GET_HPHYS(cs, pdpe_addr, MMU_DATA_STORE, NULL);
             pdpe = x86_ldq_phys(cs, pdpe_addr);
@@ -150,7 +165,7 @@ static int mmu_translate(CPUState *cs, hwaddr addr, bool use_stage2,
         ptep &= pde ^ PG_NX_MASK;
         if (pde & PG_PSE_MASK) {
             /* 2 MB page */
-            *page_size = 2048 * 1024;
+            page_size = 2048 * 1024;
             pte_addr = pde_addr;
             pte = pde;
             goto do_check_protect;
@@ -172,12 +187,12 @@ static int mmu_translate(CPUState *cs, hwaddr addr, bool use_stage2,
         }
         /* combine pde and pte nx, user and rw protections */
         ptep &= pte ^ PG_NX_MASK;
-        *page_size = 4096;
+        page_size = 4096;
     } else {
         uint32_t pde;
 
         /* page directory entry */
-        pde_addr = ((cr3 & ~0xfff) + ((addr >> 20) & 0xffc)) &
+        pde_addr = ((in->cr3 & ~0xfff) + ((addr >> 20) & 0xffc)) &
             a20_mask;
         pde_addr = GET_HPHYS(cs, pde_addr, MMU_DATA_STORE, NULL);
         pde = x86_ldl_phys(cs, pde_addr);
@@ -188,7 +203,7 @@ static int mmu_translate(CPUState *cs, hwaddr addr, bool use_stage2,
 
         /* if PSE bit is set, then we use a 4MB page */
         if ((pde & PG_PSE_MASK) && (pg_mode & PG_MODE_PSE)) {
-            *page_size = 4096 * 1024;
+            page_size = 4096 * 1024;
             pte_addr = pde_addr;
 
             /* Bits 20-13 provide bits 39-32 of the address, bit 21 is reserved.
@@ -214,12 +229,12 @@ static int mmu_translate(CPUState *cs, hwaddr addr, bool use_stage2,
         }
         /* combine pde and pte user and rw protections */
         ptep &= pte | PG_NX_MASK;
-        *page_size = 4096;
+        page_size = 4096;
         rsvd_mask = 0;
     }
 
 do_check_protect:
-    rsvd_mask |= (*page_size - 1) & PG_ADDRESS_MASK & ~PG_PSE_PAT_MASK;
+    rsvd_mask |= (page_size - 1) & PG_ADDRESS_MASK & ~PG_PSE_PAT_MASK;
 do_check_protect_pse36:
     if (pte & rsvd_mask) {
         goto do_fault_rsvd;
@@ -231,17 +246,17 @@ do_check_protect_pse36:
         goto do_fault_protect;
     }
 
-    *prot = 0;
-    if (mmu_idx != MMU_KSMAP_IDX || !(ptep & PG_USER_MASK)) {
-        *prot |= PAGE_READ;
+    int prot = 0;
+    if (in->mmu_idx != MMU_KSMAP_IDX || !(ptep & PG_USER_MASK)) {
+        prot |= PAGE_READ;
         if ((ptep & PG_RW_MASK) || !(is_user || (pg_mode & PG_MODE_WP))) {
-            *prot |= PAGE_WRITE;
+            prot |= PAGE_WRITE;
         }
     }
     if (!(ptep & PG_NX_MASK) &&
-        (mmu_idx == MMU_USER_IDX ||
+        (is_user ||
          !((pg_mode & PG_MODE_SMEP) && (ptep & PG_USER_MASK)))) {
-        *prot |= PAGE_EXEC;
+        prot |= PAGE_EXEC;
     }
 
     if (ptep & PG_USER_MASK) {
@@ -260,164 +275,151 @@ do_check_protect_pse36:
         } else if (pkr_wd && (is_user || (pg_mode & PG_MODE_WP))) {
             pkr_prot &= ~PAGE_WRITE;
         }
-
-        *prot &= pkr_prot;
         if ((pkr_prot & (1 << access_type)) == 0) {
-            assert(access_type != MMU_INST_FETCH);
-            error_code |= PG_ERROR_PK_MASK;
-            goto do_fault_protect;
+            goto do_fault_pk_protect;
         }
+        prot &= pkr_prot;
     }
 
-    if ((*prot & (1 << access_type)) == 0) {
+    if ((prot & (1 << access_type)) == 0) {
         goto do_fault_protect;
     }
 
     /* yes, it can! */
-    is_dirty = is_write && !(pte & PG_DIRTY_MASK);
-    if (!(pte & PG_ACCESSED_MASK) || is_dirty) {
-        pte |= PG_ACCESSED_MASK;
-        if (is_dirty) {
-            pte |= PG_DIRTY_MASK;
+    {
+        uint32_t set = PG_ACCESSED_MASK;
+        if (access_type == MMU_DATA_STORE) {
+            set |= PG_DIRTY_MASK;
+        }
+        if (set & ~pte) {
+            pte |= set;
+            x86_stl_phys_notdirty(cs, pte_addr, pte);
         }
-        x86_stl_phys_notdirty(cs, pte_addr, pte);
     }
 
     if (!(pte & PG_DIRTY_MASK)) {
         /* only set write access if already dirty... otherwise wait
            for dirty access */
-        assert(!is_write);
-        *prot &= ~PAGE_WRITE;
+        assert(access_type != MMU_DATA_STORE);
+        prot &= ~PAGE_WRITE;
     }
-
-    pte = pte & a20_mask;
+    out->prot = prot;
+    out->page_size = page_size;
 
     /* align to page_size */
-    pte &= PG_ADDRESS_MASK & ~(*page_size - 1);
-    page_offset = addr & (*page_size - 1);
-    *xlat = GET_HPHYS(cs, pte + page_offset, access_type, prot);
-    return PG_ERROR_OK;
+    out->paddr = (pte & a20_mask & PG_ADDRESS_MASK & ~(page_size - 1))
+               | (addr & (page_size - 1));
+    out->paddr = GET_HPHYS(cs, out->paddr, access_type, &out->prot);
+    return true;
 
+    int error_code;
  do_fault_rsvd:
-    error_code |= PG_ERROR_RSVD_MASK;
+    error_code = PG_ERROR_RSVD_MASK;
+    goto do_fault_cont;
  do_fault_protect:
-    error_code |= PG_ERROR_P_MASK;
+    error_code = PG_ERROR_P_MASK;
+    goto do_fault_cont;
+ do_fault_pk_protect:
+    assert(access_type != MMU_INST_FETCH);
+    error_code = PG_ERROR_PK_MASK | PG_ERROR_P_MASK;
+    goto do_fault_cont;
  do_fault:
-    error_code |= (is_write << PG_ERROR_W_BIT);
-    if (is_user)
+    error_code = 0;
+ do_fault_cont:
+    if (is_user) {
         error_code |= PG_ERROR_U_MASK;
-    if (access_type == MMU_INST_FETCH &&
-        ((pg_mode & PG_MODE_NXE) || (pg_mode & PG_MODE_SMEP)))
-        error_code |= PG_ERROR_I_D_MASK;
-    return error_code;
+    }
+    switch (access_type) {
+    case MMU_DATA_LOAD:
+        break;
+    case MMU_DATA_STORE:
+        error_code |= PG_ERROR_W_MASK;
+        break;
+    case MMU_INST_FETCH:
+        if (pg_mode & (PG_MODE_NXE | PG_MODE_SMEP)) {
+            error_code |= PG_ERROR_I_D_MASK;
+        }
+        break;
+    }
+    err->exception_index = EXCP0E_PAGE;
+    err->error_code = error_code;
+    err->cr2 = addr;
+    return false;
 }
 
 hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
-                        int *prot)
+                 int *prot)
 {
     CPUX86State *env = &X86_CPU(cs)->env;
-    uint64_t exit_info_1;
-    int page_size;
-    int next_prot;
-    hwaddr hphys;
 
     if (likely(!(env->hflags2 & HF2_NPT_MASK))) {
         return gphys;
-    }
+    } else {
+        TranslateParams in = {
+            .addr = gphys,
+            .cr3 = env->nested_cr3,
+            .pg_mode = env->nested_pg_mode,
+            .mmu_idx = MMU_USER_IDX,
+            .access_type = access_type,
+            .use_stage2 = false,
+        };
+        TranslateResult out;
+        TranslateFault err;
+        uint64_t exit_info_1;
 
-    exit_info_1 = mmu_translate(cs, gphys, false, env->nested_cr3,
-                               access_type, MMU_USER_IDX, env->nested_pg_mode,
-                               &hphys, &page_size, &next_prot);
-    if (exit_info_1 == PG_ERROR_OK) {
-        if (prot) {
-            *prot &= next_prot;
+        if (mmu_translate(env, &in, &out, &err)) {
+            if (prot) {
+                *prot &= out.prot;
+            }
+            return out.paddr;
         }
-        return hphys;
-    }
 
-    x86_stq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.exit_info_2),
-                 gphys);
-    if (prot) {
-        exit_info_1 |= SVM_NPTEXIT_GPA;
-    } else { /* page table access */
-        exit_info_1 |= SVM_NPTEXIT_GPT;
+        x86_stq_phys(cs, env->vm_vmcb +
+                     offsetof(struct vmcb, control.exit_info_2), gphys);
+        exit_info_1 = err.error_code
+                    | (prot ? SVM_NPTEXIT_GPA : SVM_NPTEXIT_GPT);
+        cpu_vmexit(env, SVM_EXIT_NPF, exit_info_1, env->retaddr);
     }
-    cpu_vmexit(env, SVM_EXIT_NPF, exit_info_1, env->retaddr);
 }
 
-/* return value:
- * -1 = cannot handle fault
- * 0  = nothing more to do
- * 1  = generate PF fault
- */
-static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
-                            MMUAccessType access_type, int mmu_idx)
+static bool get_physical_address(CPUX86State *env, vaddr addr,
+                                 MMUAccessType access_type, int mmu_idx,
+                                 TranslateResult *out, TranslateFault *err)
 {
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
-    int error_code = PG_ERROR_OK;
-    int pg_mode, prot, page_size;
-    int32_t a20_mask;
-    hwaddr paddr;
-    hwaddr vaddr;
-
-#if defined(DEBUG_MMU)
-    printf("MMU fault: addr=%" VADDR_PRIx " w=%d mmu=%d eip=" TARGET_FMT_lx "\n",
-           addr, access_type, mmu_idx, env->eip);
-#endif
-
     if (!(env->cr[0] & CR0_PG_MASK)) {
-        a20_mask = x86_get_a20_mask(env);
-        paddr = addr & a20_mask;
+        out->paddr = addr & x86_get_a20_mask(env);
+
 #ifdef TARGET_X86_64
         if (!(env->hflags & HF_LMA_MASK)) {
             /* Without long mode we can only address 32bits in real mode */
-            paddr = (uint32_t)paddr;
+            out->paddr = (uint32_t)out->paddr;
         }
 #endif
-        prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        page_size = 4096;
+        out->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        out->page_size = TARGET_PAGE_SIZE;
+        return true;
     } else {
-        pg_mode = get_pg_mode(env);
-        if (pg_mode & PG_MODE_LMA) {
-            int32_t sext;
+        TranslateParams in = {
+            .addr = addr,
+            .cr3 = env->cr[3],
+            .pg_mode = get_pg_mode(env),
+            .mmu_idx = mmu_idx,
+            .access_type = access_type,
+            .use_stage2 = true
+        };
 
+        if (in.pg_mode & PG_MODE_LMA) {
             /* test virtual address sign extension */
-            sext = (int64_t)addr >> (pg_mode & PG_MODE_LA57 ? 56 : 47);
+            int shift = in.pg_mode & PG_MODE_LA57 ? 56 : 47;
+            int64_t sext = (int64_t)addr >> shift;
             if (sext != 0 && sext != -1) {
-                env->error_code = 0;
-                cs->exception_index = EXCP0D_GPF;
-                return 1;
+                err->exception_index = EXCP0D_GPF;
+                err->error_code = 0;
+                err->cr2 = addr;
+                return false;
             }
         }
-
-        error_code = mmu_translate(cs, addr, true, env->cr[3], access_type,
-                                   mmu_idx, pg_mode,
-                                   &paddr, &page_size, &prot);
-    }
-
-    if (error_code == PG_ERROR_OK) {
-        /* Even if 4MB pages, we map only one 4KB page in the cache to
-           avoid filling it too fast */
-        vaddr = addr & TARGET_PAGE_MASK;
-        paddr &= TARGET_PAGE_MASK;
-
-        assert(prot & (1 << access_type));
-        tlb_set_page_with_attrs(cs, vaddr, paddr, cpu_get_mem_attrs(env),
-                                prot, mmu_idx, page_size);
-        return 0;
-    } else {
-        if (env->intercept_exceptions & (1 << EXCP0E_PAGE)) {
-            /* cr2 is not modified in case of exceptions */
-            x86_stq_phys(cs,
-                     env->vm_vmcb + offsetof(struct vmcb, control.exit_info_2),
-                     addr);
-        } else {
-            env->cr[2] = addr;
-        }
-        env->error_code = error_code;
-        cs->exception_index = EXCP0E_PAGE;
-        return 1;
+        return mmu_translate(env, &in, out, err);
     }
 }
 
@@ -425,17 +427,35 @@ bool x86_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr)
 {
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
+    CPUX86State *env = cs->env_ptr;
+    TranslateResult out;
+    TranslateFault err;
 
-    env->retaddr = retaddr;
-    if (handle_mmu_fault(cs, addr, size, access_type, mmu_idx)) {
-        /* FIXME: On error in get_hphys we have already jumped out.  */
-        g_assert(!probe);
-        raise_exception_err_ra(env, cs->exception_index,
-                               env->error_code, retaddr);
+    if (get_physical_address(env, addr, access_type, mmu_idx, &out, &err)) {
+        /*
+         * Even if 4MB pages, we map only one 4KB page in the cache to
+         * avoid filling it too fast.
+         */
+        assert(out.prot & (1 << access_type));
+        tlb_set_page_with_attrs(cs, addr & TARGET_PAGE_MASK,
+                                out.paddr & TARGET_PAGE_MASK,
+                                cpu_get_mem_attrs(env),
+                                out.prot, mmu_idx, out.page_size);
+        return true;
     }
-    return true;
+
+    /* FIXME: On error in get_hphys we have already jumped out.  */
+    g_assert(!probe);
+
+    if (env->intercept_exceptions & (1 << err.exception_index)) {
+        /* cr2 is not modified in case of exceptions */
+        x86_stq_phys(cs, env->vm_vmcb +
+                     offsetof(struct vmcb, control.exit_info_2),
+                     err.cr2);
+    } else {
+        env->cr[2] = err.cr2;
+    }
+    raise_exception_err_ra(env, err.exception_index, err.error_code, retaddr);
 }
 
 G_NORETURN void x86_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
-- 
2.34.1


