Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C5559CD30
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 02:25:07 +0200 (CEST)
Received: from localhost ([::1]:38398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHj9-00082I-0Y
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 20:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJD-0004Kk-9c
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:20 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:41957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJA-0002kd-Uq
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:19 -0400
Received: by mail-pf1-x430.google.com with SMTP id g129so8558657pfb.8
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ZuWAoydCsbhGhXC27sk5LZjx46/nNcBzVoMelGwV460=;
 b=osWygQU8pmzFo6+dC7vAgBaeEqGGZ8PvZHMKQfjR3LL5ysBDFS35euqPXlLKEGFcKg
 hMoFfQSYnp3u0HhXPGYWPtvaK8PEFY3LpLILa4qfWoRDMmjUFUDhapVabNMgYoncDXR+
 i6X6weOYEEp2DzQQmeTh216fwLTJRwhGnsgg2gRp/POLX0Drls1txY9bkU8hafmh6qwK
 TEEjGn/CSAwzFjvaCboZ6MdC/4fQlbozudREYKVnjj9zqm5KrBVU87kw9NF4qQG3F8Qq
 vk7h7oBGACj7bW5AKbB4KhLBXgG6lAcJosnH2SKATlfX8aULs6RnK3FnVlOkWrjn4csa
 MJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ZuWAoydCsbhGhXC27sk5LZjx46/nNcBzVoMelGwV460=;
 b=Vag7CAbWqaM0jNP/2eyX1zXFmf3TRcth3EvQ5sNsAFx81J5Gn0ZnSany6saUtspMS6
 vz9J443eCDdeKDu64ZUlfBIEpSFPCo8UIIiGRuTc7VXoFUrMISPBmur7iaXstLjWRK+5
 7XHKx5IrMulpbTfeGPr4W+FTGPnOTalfo7qguaF0NlbxRz8Viy3+Jwm0iV/jNkXK34UL
 hJeTHumpkOYkcYXqyFq+SGdIQouEKtQq0TLE/afwwNRJWLFTTtEKxYcpNFOGshhr36lY
 8wJMaVMK/gjKQXFuToJcpjgSQkZ1zHpR8/zW1Wlcf6iZ/hCI6Wx3tvuIlfGXtPWisJEt
 rzSA==
X-Gm-Message-State: ACgBeo3Q4B8GGy8M/oc5d2G5Q94cvw2TguE9UhQqmbDGXR+Ye1byRa0T
 P7sziBcTcRahHbDwwbp1jZODQdIG0t00Qw==
X-Google-Smtp-Source: AA6agR4v5WluYdVX/k0y9TKf/eZty/nI7W3XeRHDMFZmkLnsDlq0+zTxDy8ZvsWqC6WfsbFXOpgvCQ==
X-Received: by 2002:a63:1f1b:0:b0:429:b4be:72f0 with SMTP id
 f27-20020a631f1b000000b00429b4be72f0mr18315435pgf.622.1661212695062; 
 Mon, 22 Aug 2022 16:58:15 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 w190-20020a6230c7000000b0052d52de6726sm9173159pfw.124.2022.08.22.16.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:58:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	eduardo@habkost.net
Subject: [PATCH 12/14] target/i386: Use MMU_NESTED_IDX for vmload/vmsave
Date: Mon, 22 Aug 2022 16:58:01 -0700
Message-Id: <20220822235803.1729290-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822235803.1729290-1-richard.henderson@linaro.org>
References: <20220822235803.1729290-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Use MMU_NESTED_IDX for each memory access, rather than
just a single translation to physical.  Adjust svm_save_seg
and svm_load_seg to pass in mmu_idx.

This removes the last use of get_hphys so remove it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/cpu.h                    |   2 -
 target/i386/tcg/sysemu/excp_helper.c |  31 ----
 target/i386/tcg/sysemu/svm_helper.c  | 231 +++++++++++++++------------
 3 files changed, 126 insertions(+), 138 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9a40b54ae5..10a5e79774 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2381,8 +2381,6 @@ static inline bool ctl_has_irq(CPUX86State *env)
     return (env->int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
 }
 
-hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
-                        int *prot);
 #if defined(TARGET_X86_64) && \
     defined(CONFIG_USER_ONLY) && \
     defined(CONFIG_LINUX)
diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index f771d25f32..11f64e5965 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -413,37 +413,6 @@ static G_NORETURN void raise_stage2(CPUX86State *env, TranslateFault *err,
     cpu_vmexit(env, SVM_EXIT_NPF, exit_info_1, retaddr);
 }
 
-hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
-                 int *prot)
-{
-    CPUX86State *env = cs->env_ptr;
-
-    if (likely(!(env->hflags2 & HF2_NPT_MASK))) {
-        return gphys;
-    } else {
-        TranslateParams in = {
-            .addr = gphys,
-            .cr3 = env->nested_cr3,
-            .pg_mode = env->nested_pg_mode,
-            .mmu_idx = MMU_USER_IDX,
-            .access_type = access_type,
-            .use_stage2 = false,
-        };
-        TranslateResult out;
-        TranslateFault err;
-
-        if (!mmu_translate(env, &in, &out, &err)) {
-            err.stage2 = prot ? SVM_NPTEXIT_GPA : SVM_NPTEXIT_GPT;
-            raise_stage2(env, &err, env->retaddr);
-        }
-
-        if (prot) {
-            *prot &= out.prot;
-        }
-        return out.paddr;
-    }
-}
-
 static bool get_physical_address(CPUX86State *env, vaddr addr,
                                  MMUAccessType access_type, int mmu_idx,
                                  TranslateResult *out, TranslateFault *err)
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 85b7741d94..8e88567399 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -27,19 +27,19 @@
 
 /* Secure Virtual Machine helpers */
 
-static inline void svm_save_seg(CPUX86State *env, hwaddr addr,
-                                const SegmentCache *sc)
+static void svm_save_seg(CPUX86State *env, int mmu_idx, hwaddr addr,
+                         const SegmentCache *sc)
 {
-    CPUState *cs = env_cpu(env);
-
-    x86_stw_phys(cs, addr + offsetof(struct vmcb_seg, selector),
-             sc->selector);
-    x86_stq_phys(cs, addr + offsetof(struct vmcb_seg, base),
-             sc->base);
-    x86_stl_phys(cs, addr + offsetof(struct vmcb_seg, limit),
-             sc->limit);
-    x86_stw_phys(cs, addr + offsetof(struct vmcb_seg, attrib),
-             ((sc->flags >> 8) & 0xff) | ((sc->flags >> 12) & 0x0f00));
+    cpu_stw_mmuidx_ra(env, addr + offsetof(struct vmcb_seg, selector),
+                      sc->selector, mmu_idx, 0);
+    cpu_stq_mmuidx_ra(env, addr + offsetof(struct vmcb_seg, base),
+                      sc->base, mmu_idx, 0);
+    cpu_stl_mmuidx_ra(env, addr + offsetof(struct vmcb_seg, limit),
+                      sc->limit, mmu_idx, 0);
+    cpu_stw_mmuidx_ra(env, addr + offsetof(struct vmcb_seg, attrib),
+                      ((sc->flags >> 8) & 0xff)
+                      | ((sc->flags >> 12) & 0x0f00),
+                      mmu_idx, 0);
 }
 
 /*
@@ -52,29 +52,36 @@ static inline void svm_canonicalization(CPUX86State *env, target_ulong *seg_base
     *seg_base = ((((long) *seg_base) << shift_amt) >> shift_amt);
 }
 
-static inline void svm_load_seg(CPUX86State *env, hwaddr addr,
-                                SegmentCache *sc)
+static void svm_load_seg(CPUX86State *env, int mmu_idx, hwaddr addr,
+                         SegmentCache *sc)
 {
-    CPUState *cs = env_cpu(env);
     unsigned int flags;
 
-    sc->selector = x86_lduw_phys(cs,
-                             addr + offsetof(struct vmcb_seg, selector));
-    sc->base = x86_ldq_phys(cs, addr + offsetof(struct vmcb_seg, base));
-    sc->limit = x86_ldl_phys(cs, addr + offsetof(struct vmcb_seg, limit));
-    flags = x86_lduw_phys(cs, addr + offsetof(struct vmcb_seg, attrib));
+    sc->selector =
+        cpu_lduw_mmuidx_ra(env, addr + offsetof(struct vmcb_seg, selector),
+                           mmu_idx, 0);
+    sc->base =
+        cpu_ldq_mmuidx_ra(env, addr + offsetof(struct vmcb_seg, base),
+                          mmu_idx, 0);
+    sc->limit =
+        cpu_ldl_mmuidx_ra(env, addr + offsetof(struct vmcb_seg, limit),
+                          mmu_idx, 0);
+    flags =
+        cpu_lduw_mmuidx_ra(env, addr + offsetof(struct vmcb_seg, attrib),
+                           mmu_idx, 0);
     sc->flags = ((flags & 0xff) << 8) | ((flags & 0x0f00) << 12);
+
     svm_canonicalization(env, &sc->base);
 }
 
-static inline void svm_load_seg_cache(CPUX86State *env, hwaddr addr,
-                                      int seg_reg)
+static void svm_load_seg_cache(CPUX86State *env, int mmu_idx,
+                               hwaddr addr, int seg_reg)
 {
-    SegmentCache sc1, *sc = &sc1;
+    SegmentCache sc;
 
-    svm_load_seg(env, addr, sc);
-    cpu_x86_load_seg_cache(env, seg_reg, sc->selector,
-                           sc->base, sc->limit, sc->flags);
+    svm_load_seg(env, mmu_idx, addr, &sc);
+    cpu_x86_load_seg_cache(env, seg_reg, sc.selector,
+                           sc.base, sc.limit, sc.flags);
 }
 
 static inline bool is_efer_invalid_state (CPUX86State *env)
@@ -199,13 +206,17 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
              env->vm_hsave + offsetof(struct vmcb, save.rflags),
              cpu_compute_eflags(env));
 
-    svm_save_seg(env, env->vm_hsave + offsetof(struct vmcb, save.es),
+    svm_save_seg(env, MMU_PHYS_IDX,
+                 env->vm_hsave + offsetof(struct vmcb, save.es),
                  &env->segs[R_ES]);
-    svm_save_seg(env, env->vm_hsave + offsetof(struct vmcb, save.cs),
+    svm_save_seg(env, MMU_PHYS_IDX,
+                 env->vm_hsave + offsetof(struct vmcb, save.cs),
                  &env->segs[R_CS]);
-    svm_save_seg(env, env->vm_hsave + offsetof(struct vmcb, save.ss),
+    svm_save_seg(env, MMU_PHYS_IDX,
+                 env->vm_hsave + offsetof(struct vmcb, save.ss),
                  &env->segs[R_SS]);
-    svm_save_seg(env, env->vm_hsave + offsetof(struct vmcb, save.ds),
+    svm_save_seg(env, MMU_PHYS_IDX,
+                 env->vm_hsave + offsetof(struct vmcb, save.ds),
                  &env->segs[R_DS]);
 
     x86_stq_phys(cs, env->vm_hsave + offsetof(struct vmcb, save.rip),
@@ -325,18 +336,18 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
                                                           save.rflags)),
                     ~(CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C | DF_MASK));
 
-    svm_load_seg_cache(env, env->vm_vmcb + offsetof(struct vmcb, save.es),
-                       R_ES);
-    svm_load_seg_cache(env, env->vm_vmcb + offsetof(struct vmcb, save.cs),
-                       R_CS);
-    svm_load_seg_cache(env, env->vm_vmcb + offsetof(struct vmcb, save.ss),
-                       R_SS);
-    svm_load_seg_cache(env, env->vm_vmcb + offsetof(struct vmcb, save.ds),
-                       R_DS);
-    svm_load_seg(env, env->vm_vmcb + offsetof(struct vmcb, save.idtr),
-                       &env->idt);
-    svm_load_seg(env, env->vm_vmcb + offsetof(struct vmcb, save.gdtr),
-                       &env->gdt);
+    svm_load_seg_cache(env, MMU_PHYS_IDX,
+                       env->vm_vmcb + offsetof(struct vmcb, save.es), R_ES);
+    svm_load_seg_cache(env, MMU_PHYS_IDX,
+                       env->vm_vmcb + offsetof(struct vmcb, save.cs), R_CS);
+    svm_load_seg_cache(env, MMU_PHYS_IDX,
+                       env->vm_vmcb + offsetof(struct vmcb, save.ss), R_SS);
+    svm_load_seg_cache(env, MMU_PHYS_IDX,
+                       env->vm_vmcb + offsetof(struct vmcb, save.ds), R_DS);
+    svm_load_seg(env, MMU_PHYS_IDX,
+                 env->vm_vmcb + offsetof(struct vmcb, save.idtr), &env->idt);
+    svm_load_seg(env, MMU_PHYS_IDX,
+                 env->vm_vmcb + offsetof(struct vmcb, save.gdtr), &env->gdt);
 
     env->eip = x86_ldq_phys(cs,
                         env->vm_vmcb + offsetof(struct vmcb, save.rip));
@@ -451,9 +462,8 @@ void helper_vmmcall(CPUX86State *env)
 
 void helper_vmload(CPUX86State *env, int aflag)
 {
-    CPUState *cs = env_cpu(env);
+    int mmu_idx = MMU_PHYS_IDX;
     target_ulong addr;
-    int prot;
 
     cpu_svm_check_intercept_param(env, SVM_EXIT_VMLOAD, 0, GETPC());
 
@@ -464,43 +474,52 @@ void helper_vmload(CPUX86State *env, int aflag)
     }
 
     if (virtual_vm_load_save_enabled(env, SVM_EXIT_VMLOAD, GETPC())) {
-        addr = get_hphys(cs, addr, MMU_DATA_LOAD, &prot);
+        mmu_idx = MMU_NESTED_IDX;
     }
 
-    qemu_log_mask(CPU_LOG_TB_IN_ASM, "vmload! " TARGET_FMT_lx
-                  "\nFS: %016" PRIx64 " | " TARGET_FMT_lx "\n",
-                  addr, x86_ldq_phys(cs, addr + offsetof(struct vmcb,
-                                                          save.fs.base)),
-                  env->segs[R_FS].base);
-
-    svm_load_seg_cache(env, addr + offsetof(struct vmcb, save.fs), R_FS);
-    svm_load_seg_cache(env, addr + offsetof(struct vmcb, save.gs), R_GS);
-    svm_load_seg(env, addr + offsetof(struct vmcb, save.tr), &env->tr);
-    svm_load_seg(env, addr + offsetof(struct vmcb, save.ldtr), &env->ldt);
+    svm_load_seg_cache(env, mmu_idx,
+                       addr + offsetof(struct vmcb, save.fs), R_FS);
+    svm_load_seg_cache(env, mmu_idx,
+                       addr + offsetof(struct vmcb, save.gs), R_GS);
+    svm_load_seg(env, mmu_idx,
+                 addr + offsetof(struct vmcb, save.tr), &env->tr);
+    svm_load_seg(env, mmu_idx,
+                 addr + offsetof(struct vmcb, save.ldtr), &env->ldt);
 
 #ifdef TARGET_X86_64
-    env->kernelgsbase = x86_ldq_phys(cs, addr + offsetof(struct vmcb,
-                                                 save.kernel_gs_base));
-    env->lstar = x86_ldq_phys(cs, addr + offsetof(struct vmcb, save.lstar));
-    env->cstar = x86_ldq_phys(cs, addr + offsetof(struct vmcb, save.cstar));
-    env->fmask = x86_ldq_phys(cs, addr + offsetof(struct vmcb, save.sfmask));
+    env->kernelgsbase =
+        cpu_ldq_mmuidx_ra(env,
+                          addr + offsetof(struct vmcb, save.kernel_gs_base),
+                          mmu_idx, 0);
+    env->lstar =
+        cpu_ldq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.lstar),
+                          mmu_idx, 0);
+    env->cstar =
+        cpu_ldq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.cstar),
+                          mmu_idx, 0);
+    env->fmask =
+        cpu_ldq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.sfmask),
+                          mmu_idx, 0);
     svm_canonicalization(env, &env->kernelgsbase);
 #endif
-    env->star = x86_ldq_phys(cs, addr + offsetof(struct vmcb, save.star));
-    env->sysenter_cs = x86_ldq_phys(cs,
-                                addr + offsetof(struct vmcb, save.sysenter_cs));
-    env->sysenter_esp = x86_ldq_phys(cs, addr + offsetof(struct vmcb,
-                                                 save.sysenter_esp));
-    env->sysenter_eip = x86_ldq_phys(cs, addr + offsetof(struct vmcb,
-                                                 save.sysenter_eip));
-
+    env->star =
+        cpu_ldq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.star),
+                          mmu_idx, 0);
+    env->sysenter_cs =
+        cpu_ldq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.sysenter_cs),
+                          mmu_idx, 0);
+    env->sysenter_esp =
+        cpu_ldq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.sysenter_esp),
+                          mmu_idx, 0);
+    env->sysenter_eip =
+        cpu_ldq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.sysenter_eip),
+                          mmu_idx, 0);
 }
 
 void helper_vmsave(CPUX86State *env, int aflag)
 {
-    CPUState *cs = env_cpu(env);
+    int mmu_idx = MMU_PHYS_IDX;
     target_ulong addr;
-    int prot;
 
     cpu_svm_check_intercept_param(env, SVM_EXIT_VMSAVE, 0, GETPC());
 
@@ -511,38 +530,36 @@ void helper_vmsave(CPUX86State *env, int aflag)
     }
 
     if (virtual_vm_load_save_enabled(env, SVM_EXIT_VMSAVE, GETPC())) {
-        addr = get_hphys(cs, addr, MMU_DATA_STORE, &prot);
+        mmu_idx = MMU_NESTED_IDX;
     }
 
-    qemu_log_mask(CPU_LOG_TB_IN_ASM, "vmsave! " TARGET_FMT_lx
-                  "\nFS: %016" PRIx64 " | " TARGET_FMT_lx "\n",
-                  addr, x86_ldq_phys(cs,
-                                 addr + offsetof(struct vmcb, save.fs.base)),
-                  env->segs[R_FS].base);
-
-    svm_save_seg(env, addr + offsetof(struct vmcb, save.fs),
+    svm_save_seg(env, mmu_idx, addr + offsetof(struct vmcb, save.fs),
                  &env->segs[R_FS]);
-    svm_save_seg(env, addr + offsetof(struct vmcb, save.gs),
+    svm_save_seg(env, mmu_idx, addr + offsetof(struct vmcb, save.gs),
                  &env->segs[R_GS]);
-    svm_save_seg(env, addr + offsetof(struct vmcb, save.tr),
+    svm_save_seg(env, mmu_idx, addr + offsetof(struct vmcb, save.tr),
                  &env->tr);
-    svm_save_seg(env, addr + offsetof(struct vmcb, save.ldtr),
+    svm_save_seg(env, mmu_idx, addr + offsetof(struct vmcb, save.ldtr),
                  &env->ldt);
 
 #ifdef TARGET_X86_64
-    x86_stq_phys(cs, addr + offsetof(struct vmcb, save.kernel_gs_base),
-             env->kernelgsbase);
-    x86_stq_phys(cs, addr + offsetof(struct vmcb, save.lstar), env->lstar);
-    x86_stq_phys(cs, addr + offsetof(struct vmcb, save.cstar), env->cstar);
-    x86_stq_phys(cs, addr + offsetof(struct vmcb, save.sfmask), env->fmask);
+    cpu_stq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.kernel_gs_base),
+                      env->kernelgsbase, mmu_idx, 0);
+    cpu_stq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.lstar),
+                      env->lstar, mmu_idx, 0);
+    cpu_stq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.cstar),
+                      env->cstar, mmu_idx, 0);
+    cpu_stq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.sfmask),
+                      env->fmask, mmu_idx, 0);
 #endif
-    x86_stq_phys(cs, addr + offsetof(struct vmcb, save.star), env->star);
-    x86_stq_phys(cs,
-             addr + offsetof(struct vmcb, save.sysenter_cs), env->sysenter_cs);
-    x86_stq_phys(cs, addr + offsetof(struct vmcb, save.sysenter_esp),
-             env->sysenter_esp);
-    x86_stq_phys(cs, addr + offsetof(struct vmcb, save.sysenter_eip),
-             env->sysenter_eip);
+    cpu_stq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.star),
+                      env->star, mmu_idx, 0);
+    cpu_stq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.sysenter_cs),
+                      env->sysenter_cs, mmu_idx, 0);
+    cpu_stq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.sysenter_esp),
+                      env->sysenter_esp, mmu_idx, 0);
+    cpu_stq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.sysenter_eip),
+                      env->sysenter_eip, mmu_idx, 0);
 }
 
 void helper_stgi(CPUX86State *env)
@@ -725,13 +742,17 @@ void do_vmexit(CPUX86State *env)
     tlb_flush_by_mmuidx(cs, 1 << MMU_NESTED_IDX);
 
     /* Save the VM state in the vmcb */
-    svm_save_seg(env, env->vm_vmcb + offsetof(struct vmcb, save.es),
+    svm_save_seg(env, MMU_PHYS_IDX,
+                 env->vm_vmcb + offsetof(struct vmcb, save.es),
                  &env->segs[R_ES]);
-    svm_save_seg(env, env->vm_vmcb + offsetof(struct vmcb, save.cs),
+    svm_save_seg(env, MMU_PHYS_IDX,
+                 env->vm_vmcb + offsetof(struct vmcb, save.cs),
                  &env->segs[R_CS]);
-    svm_save_seg(env, env->vm_vmcb + offsetof(struct vmcb, save.ss),
+    svm_save_seg(env, MMU_PHYS_IDX,
+                 env->vm_vmcb + offsetof(struct vmcb, save.ss),
                  &env->segs[R_SS]);
-    svm_save_seg(env, env->vm_vmcb + offsetof(struct vmcb, save.ds),
+    svm_save_seg(env, MMU_PHYS_IDX,
+                 env->vm_vmcb + offsetof(struct vmcb, save.ds),
                  &env->segs[R_DS]);
 
     x86_stq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.gdtr.base),
@@ -812,14 +833,14 @@ void do_vmexit(CPUX86State *env)
                     ~(CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C | DF_MASK |
                       VM_MASK));
 
-    svm_load_seg_cache(env, env->vm_hsave + offsetof(struct vmcb, save.es),
-                       R_ES);
-    svm_load_seg_cache(env, env->vm_hsave + offsetof(struct vmcb, save.cs),
-                       R_CS);
-    svm_load_seg_cache(env, env->vm_hsave + offsetof(struct vmcb, save.ss),
-                       R_SS);
-    svm_load_seg_cache(env, env->vm_hsave + offsetof(struct vmcb, save.ds),
-                       R_DS);
+    svm_load_seg_cache(env, MMU_PHYS_IDX,
+                       env->vm_hsave + offsetof(struct vmcb, save.es), R_ES);
+    svm_load_seg_cache(env, MMU_PHYS_IDX,
+                       env->vm_hsave + offsetof(struct vmcb, save.cs), R_CS);
+    svm_load_seg_cache(env, MMU_PHYS_IDX,
+                       env->vm_hsave + offsetof(struct vmcb, save.ss), R_SS);
+    svm_load_seg_cache(env, MMU_PHYS_IDX,
+                       env->vm_hsave + offsetof(struct vmcb, save.ds), R_DS);
 
     env->eip = x86_ldq_phys(cs,
                         env->vm_hsave + offsetof(struct vmcb, save.rip));
-- 
2.34.1


