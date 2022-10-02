Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EA55F2454
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 19:42:31 +0200 (CEST)
Received: from localhost ([::1]:37520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1of2z0-0006M0-NZ
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 13:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of2nX-0005Sj-Jc
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 13:30:43 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:45679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of2nT-0006Bf-5M
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 13:30:39 -0400
Received: by mail-pf1-x433.google.com with SMTP id c3so3518788pfb.12
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 10:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=T8uWtBP3TZO6X3XhGgQrKyuC5IL3sIGd/gd8Mwr3t5A=;
 b=gdnpXsQwP2Zz4uU7G4xib6P+/8iqrRFcqnnOzRVlfo0jad+Ow+PWObSIoXoBw5/ExN
 gRxHXGM1cFg1IGGfavP4CWyX1iFpcTaYivnXzh+PPbzlA5jldBHRQ2CTsZdMXZS3uHew
 aAiXq6DAW/Zaw9xwvjmnkbs5gt1hWgSDv1r0Y8AlyXccCQ5sFat7Kt5v2FrMvMWmBR4X
 nJiCD+j3HQV6BT7G68TX7U2+sM2fmOcRrgoWiCzv7mDyeJGdxIPOspyAhRx8xiPcKR2k
 QEpD7jGZJe11ZNTrf7RJuX5Vecf8GwpMFMri/N+aSOXZocm/P+JIerSOrOPyJAl38c32
 DCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=T8uWtBP3TZO6X3XhGgQrKyuC5IL3sIGd/gd8Mwr3t5A=;
 b=fRmi6vnnaFDSvY2Mm1I3+pNAQACu0qVxZfR6t75JFFBSO+Te8jREtJVdflbSWHiWgI
 LGkLdWAd4/XFV7rOrGGNw9VE9YIxiyI7Yo90vxVVlzqru9khIIGbmDFotVWKRKjcj6hS
 2nSWAOCmuPphOg1rw48dTWORCuGrG/TzjhWJNAGe5CIFvAbKNscNzWLMqkRzVj01+mTz
 R508uPrDkd+43hLb+4JfvmzvQULXhzz2mEE3PYizMlUscXOyV/5GLIteGT5uUREs4fBk
 k3v9qyPIKryBlI4zp/hmOB/lQAXMnbfS+s5ZfY7jrFR5mrZ1IPHBsk4VChigK/bqjAiD
 jgsA==
X-Gm-Message-State: ACrzQf1Eq5ykDtOM3rca2jWLnXSdUErikD5GOZntzevpStJ/reux4BLE
 bjnOAWS/hidaPrgRz3eLqSVWqHHKSuivbg==
X-Google-Smtp-Source: AMsMyM6Ppshro29vaIdbl9Hxjr1TyhbCMoGwYFMDUY7PrPICYvjkhA0yFy/QQsNdq4wrAMjPzhnpnQ==
X-Received: by 2002:a05:6a00:1f05:b0:540:6552:dfbf with SMTP id
 be5-20020a056a001f0500b005406552dfbfmr18860159pfb.65.1664731833706; 
 Sun, 02 Oct 2022 10:30:33 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8002:3cad:72cd:dd96:98f6:c3cf])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62168d000000b0056025ccc3bbsm2749783pfw.146.2022.10.02.10.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 10:30:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 4/9] target/i386: Reorg GET_HPHYS
Date: Sun,  2 Oct 2022 10:29:51 -0700
Message-Id: <20221002172956.265735-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221002172956.265735-1-richard.henderson@linaro.org>
References: <20221002172956.265735-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
index 00ce4cf253..816b307547 100644
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


