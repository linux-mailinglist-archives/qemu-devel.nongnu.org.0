Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BADA559CCD3
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 02:07:20 +0200 (CEST)
Received: from localhost ([::1]:33430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHRv-0007fW-Oy
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 20:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJA-0004GE-LM
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:17 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:45735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJ8-0002hw-MR
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:16 -0400
Received: by mail-pg1-x531.google.com with SMTP id f4so8972837pgc.12
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=wBA5wtnterigVJfmKiwsv2bUvfjFDn8Z+n998PE2YkE=;
 b=jBDKmtXzlHl9pgQ9sVIy+FMzeQ5tu9HEiaasqu2VnYOPEPa7+MvJi1lx+YWQk5kxHa
 SV0tb5cO36ftq8IzB2w7Xu09CMJxyTfyx3A0Rz079XKwh1//6at4bmeE8n+EATbNz+kM
 gg0sN8t/OHdCLOJ3uq9+IjFMxA4GcNTaLz27q1gix2B9mLS4sWmpEkq0O4R2ecm21Ts7
 204jWw7nl5f+xRCR/U+W7Yd15lLZyaNxw9f5fhXwEdgXl1rVv7wyTAAk3hmhkdFPIqJx
 6L8Vjtt8/u//Pj7PDSkYS74GoH/wwfScfR++q1gsCNxAGWqXWabxOorcicS6M3jbNmd4
 xJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=wBA5wtnterigVJfmKiwsv2bUvfjFDn8Z+n998PE2YkE=;
 b=PXcGeXxw31rdSCfeFLVvBZqzFT7ckaajwUwA3GjJxnOSzbfQ6SOK3RjCCaJzjL5ksn
 f1RxL5Xmm5T3dSalo1jAXF9TfkSCFVb5yYFI71nEThonEnwillXrjitBHfu80oqNqorH
 t/iYUbtXMrnd4Z6ffaCdwymkRDP9mu0Fgw6dL1HLFmHjX3xq1Ia7amPbnQD9adGW5JLZ
 pUkEC7YGlXEVhnSINzkwPXrNcG8092ZsE0ydhnvL5VQa8jEnfTscGUTwd/W4qNSszWQ6
 JhPYqTx+6bbuHDRbjLS1qv7tNerUKy5z37CJteOQIzwY8JDiyoNbp5kzSFNjzm+9oL+s
 u2dw==
X-Gm-Message-State: ACgBeo3RGKryp2SWE0+U6ePZpqmOPrYm3d1s1vDZ125Ubw+UCqTNW04x
 zD+oW4xorrNhLdY04k2SDBp0SmY/34ISig==
X-Google-Smtp-Source: AA6agR572NbjfMLtc2mswtl86Q/zqnGJFVPUSJANCxpgJtGdPoAvesZeLQSNT684Iih8YiMQLDG3Ew==
X-Received: by 2002:a63:164d:0:b0:416:4bc:1c28 with SMTP id
 13-20020a63164d000000b0041604bc1c28mr18516751pgw.302.1661212693523; 
 Mon, 22 Aug 2022 16:58:13 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 w190-20020a6230c7000000b0052d52de6726sm9173159pfw.124.2022.08.22.16.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:58:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	eduardo@habkost.net
Subject: [PATCH 10/14] target/i386: Reorg GET_HPHYS
Date: Mon, 22 Aug 2022 16:57:59 -0700
Message-Id: <20220822235803.1729290-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822235803.1729290-1-richard.henderson@linaro.org>
References: <20220822235803.1729290-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

Replace with PTE_HPHYS for the page table walk, and a direct call
to mmu_translate for the final stage2 translation.  Hoist the check
for HF2_NPT_MASK out to get_physical_address, which avoids the
recursive call when stage2 is disabled.

We can now return all the way out to x86_cpu_tlb_fill before raising
an exception, which means probe works.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/sysemu/excp_helper.c | 123 +++++++++++++++++++++------
 1 file changed, 95 insertions(+), 28 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index a6b7562bf3..e9adaa3dad 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -37,18 +37,43 @@ typedef struct TranslateResult {
     int page_size;
 } TranslateResult;
 
+typedef enum TranslateFaultStage2 {
+    S2_NONE,
+    S2_GPA,
+    S2_GPT,
+} TranslateFaultStage2;
+
 typedef struct TranslateFault {
     int exception_index;
     int error_code;
     target_ulong cr2;
+    TranslateFaultStage2 stage2;
 } TranslateFault;
 
-#define GET_HPHYS(cs, gpa, access_type, prot)  \
-	(in->use_stage2 ? get_hphys(cs, gpa, access_type, prot) : gpa)
+#define PTE_HPHYS(ADDR)                                         \
+    do {                                                        \
+        if (in->use_stage2) {                                   \
+            nested_in.addr = (ADDR);                            \
+            if (!mmu_translate(env, &nested_in, out, err)) {    \
+                err->stage2 = S2_GPT;                           \
+                return false;                                   \
+            }                                                   \
+            (ADDR) = out->paddr;                                \
+        }                                                       \
+    } while (0)
 
 static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
                           TranslateResult *out, TranslateFault *err)
 {
+    TranslateParams nested_in = {
+        /* Use store for page table entries, to allow A/D flag updates. */
+        .access_type = MMU_DATA_STORE,
+        .cr3 = env->nested_cr3,
+        .pg_mode = env->nested_pg_mode,
+        .mmu_idx = MMU_USER_IDX,
+        .use_stage2 = false,
+    };
+
     CPUState *cs = env_cpu(env);
     X86CPU *cpu = env_archcpu(env);
     const int32_t a20_mask = x86_get_a20_mask(env);
@@ -79,7 +104,7 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
             if (la57) {
                 pml5e_addr = ((in->cr3 & ~0xfff) +
                         (((addr >> 48) & 0x1ff) << 3)) & a20_mask;
-                pml5e_addr = GET_HPHYS(cs, pml5e_addr, MMU_DATA_STORE, NULL);
+                PTE_HPHYS(pml5e_addr);
                 pml5e = x86_ldq_phys(cs, pml5e_addr);
                 if (!(pml5e & PG_PRESENT_MASK)) {
                     goto do_fault;
@@ -99,7 +124,7 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
 
             pml4e_addr = ((pml5e & PG_ADDRESS_MASK) +
                     (((addr >> 39) & 0x1ff) << 3)) & a20_mask;
-            pml4e_addr = GET_HPHYS(cs, pml4e_addr, MMU_DATA_STORE, NULL);
+            PTE_HPHYS(pml4e_addr);
             pml4e = x86_ldq_phys(cs, pml4e_addr);
             if (!(pml4e & PG_PRESENT_MASK)) {
                 goto do_fault;
@@ -114,7 +139,7 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
             ptep &= pml4e ^ PG_NX_MASK;
             pdpe_addr = ((pml4e & PG_ADDRESS_MASK) + (((addr >> 30) & 0x1ff) << 3)) &
                 a20_mask;
-            pdpe_addr = GET_HPHYS(cs, pdpe_addr, MMU_DATA_STORE, NULL);
+            PTE_HPHYS(pdpe_addr);
             pdpe = x86_ldq_phys(cs, pdpe_addr);
             if (!(pdpe & PG_PRESENT_MASK)) {
                 goto do_fault;
@@ -140,7 +165,7 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
             /* XXX: load them when cr3 is loaded ? */
             pdpe_addr = ((in->cr3 & ~0x1f) + ((addr >> 27) & 0x18)) &
                 a20_mask;
-            pdpe_addr = GET_HPHYS(cs, pdpe_addr, MMU_DATA_STORE, NULL);
+            PTE_HPHYS(pdpe_addr);
             pdpe = x86_ldq_phys(cs, pdpe_addr);
             if (!(pdpe & PG_PRESENT_MASK)) {
                 goto do_fault;
@@ -154,7 +179,7 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
 
         pde_addr = ((pdpe & PG_ADDRESS_MASK) + (((addr >> 21) & 0x1ff) << 3)) &
             a20_mask;
-        pde_addr = GET_HPHYS(cs, pde_addr, MMU_DATA_STORE, NULL);
+        PTE_HPHYS(pde_addr);
         pde = x86_ldq_phys(cs, pde_addr);
         if (!(pde & PG_PRESENT_MASK)) {
             goto do_fault;
@@ -177,7 +202,7 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
         }
         pte_addr = ((pde & PG_ADDRESS_MASK) + (((addr >> 12) & 0x1ff) << 3)) &
             a20_mask;
-        pte_addr = GET_HPHYS(cs, pte_addr, MMU_DATA_STORE, NULL);
+        PTE_HPHYS(pte_addr);
         pte = x86_ldq_phys(cs, pte_addr);
         if (!(pte & PG_PRESENT_MASK)) {
             goto do_fault;
@@ -194,7 +219,7 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
         /* page directory entry */
         pde_addr = ((in->cr3 & ~0xfff) + ((addr >> 20) & 0xffc)) &
             a20_mask;
-        pde_addr = GET_HPHYS(cs, pde_addr, MMU_DATA_STORE, NULL);
+        PTE_HPHYS(pde_addr);
         pde = x86_ldl_phys(cs, pde_addr);
         if (!(pde & PG_PRESENT_MASK)) {
             goto do_fault;
@@ -222,7 +247,7 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
         /* page directory entry */
         pte_addr = ((pde & ~0xfff) + ((addr >> 10) & 0xffc)) &
             a20_mask;
-        pte_addr = GET_HPHYS(cs, pte_addr, MMU_DATA_STORE, NULL);
+        PTE_HPHYS(pte_addr);
         pte = x86_ldl_phys(cs, pte_addr);
         if (!(pte & PG_PRESENT_MASK)) {
             goto do_fault;
@@ -303,13 +328,31 @@ do_check_protect_pse36:
         assert(access_type != MMU_DATA_STORE);
         prot &= ~PAGE_WRITE;
     }
-    out->prot = prot;
-    out->page_size = page_size;
 
     /* align to page_size */
     out->paddr = (pte & a20_mask & PG_ADDRESS_MASK & ~(page_size - 1))
                | (addr & (page_size - 1));
-    out->paddr = GET_HPHYS(cs, out->paddr, access_type, &out->prot);
+
+    if (in->use_stage2) {
+        nested_in.addr = out->paddr;
+        nested_in.access_type = access_type;
+
+        if (!mmu_translate(env, &nested_in, out, err)) {
+            err->stage2 = S2_GPA;
+            return false;
+        }
+
+        /* Merge stage1 & stage2 protection bits. */
+        prot &= out->prot;
+
+        /* Re-verify resulting protection. */
+        if ((prot & (1 << access_type)) == 0) {
+            goto do_fault_protect;
+        }
+    }
+
+    out->prot = prot;
+    out->page_size = page_size;
     return true;
 
     int error_code;
@@ -344,13 +387,36 @@ do_check_protect_pse36:
     err->exception_index = EXCP0E_PAGE;
     err->error_code = error_code;
     err->cr2 = addr;
+    err->stage2 = S2_NONE;
     return false;
 }
 
+static G_NORETURN void raise_stage2(CPUX86State *env, TranslateFault *err,
+                                    uintptr_t retaddr)
+{
+    uint64_t exit_info_1 = err->error_code;
+
+    switch (err->stage2) {
+    case S2_GPT:
+        exit_info_1 |= SVM_NPTEXIT_GPT;
+        break;
+    case S2_GPA:
+        exit_info_1 |= SVM_NPTEXIT_GPA;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    x86_stq_phys(env_cpu(env),
+                 env->vm_vmcb + offsetof(struct vmcb, control.exit_info_2),
+                 err->cr2);
+    cpu_vmexit(env, SVM_EXIT_NPF, exit_info_1, retaddr);
+}
+
 hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
                  int *prot)
 {
-    CPUX86State *env = &X86_CPU(cs)->env;
+    CPUX86State *env = cs->env_ptr;
 
     if (likely(!(env->hflags2 & HF2_NPT_MASK))) {
         return gphys;
@@ -365,20 +431,16 @@ hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
         };
         TranslateResult out;
         TranslateFault err;
-        uint64_t exit_info_1;
 
-        if (mmu_translate(env, &in, &out, &err)) {
-            if (prot) {
-                *prot &= out.prot;
-            }
-            return out.paddr;
+        if (!mmu_translate(env, &in, &out, &err)) {
+            err.stage2 = prot ? SVM_NPTEXIT_GPA : SVM_NPTEXIT_GPT;
+            raise_stage2(env, &err, env->retaddr);
         }
 
-        x86_stq_phys(cs, env->vm_vmcb +
-                     offsetof(struct vmcb, control.exit_info_2), gphys);
-        exit_info_1 = err.error_code
-                    | (prot ? SVM_NPTEXIT_GPA : SVM_NPTEXIT_GPT);
-        cpu_vmexit(env, SVM_EXIT_NPF, exit_info_1, env->retaddr);
+        if (prot) {
+            *prot &= out.prot;
+        }
+        return out.paddr;
     }
 }
 
@@ -405,7 +467,7 @@ static bool get_physical_address(CPUX86State *env, vaddr addr,
             .pg_mode = get_pg_mode(env),
             .mmu_idx = mmu_idx,
             .access_type = access_type,
-            .use_stage2 = true
+            .use_stage2 = env->hflags2 & HF2_NPT_MASK,
         };
 
         if (in.pg_mode & PG_MODE_LMA) {
@@ -444,8 +506,13 @@ bool x86_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
         return true;
     }
 
-    /* FIXME: On error in get_hphys we have already jumped out.  */
-    g_assert(!probe);
+    if (probe) {
+        return false;
+    }
+
+    if (err.stage2 != S2_NONE) {
+        raise_stage2(env, &err, retaddr);
+    }
 
     if (env->intercept_exceptions & (1 << err.exception_index)) {
         /* cr2 is not modified in case of exceptions */
-- 
2.34.1


