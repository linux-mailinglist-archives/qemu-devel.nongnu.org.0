Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6A1410836
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 20:54:45 +0200 (CEST)
Received: from localhost ([::1]:57274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfU4-0002VF-Nh
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 14:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLb-0005Ba-A0
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:00 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:33631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLP-0006rs-LU
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:57 -0400
Received: by mail-pf1-x42b.google.com with SMTP id s16so4094002pfk.0
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Qr0OuX9QX9R8kKysHcFpFuFjKaNccsgQik+Lfl3HtE=;
 b=FEtv63qdtHpQXjwHldIR6HU0QERpSHEV/wrQ/k2i9kXSuvqbG9PVpC6ZuzTBwSILG4
 bdw+q+IdFpIfFK5Db6UOVvo2Vc23Xi2EAX1MvORh9YazN6wrnRGvRh++dFRySuUN2AI7
 Pe4eOb7Mxw/4IC+8tLvUjI+fG1rwkefw3+ka0ohDVNqfTDbjx1HTpVvTLbhyc9zXwvhK
 9djmE8ZAiMS7m7n6snwHIkw39odafZHHR+i9C+exrl5udt8GflheJnWrLaTWj2l5DNJk
 TNtXGsDTZoPAPaTOm4pbr0+xc//SR351VC5kePPfhW6QeStSczaBnc9pGVmN5zA/ZZFs
 ikwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Qr0OuX9QX9R8kKysHcFpFuFjKaNccsgQik+Lfl3HtE=;
 b=fmRJ/hKN+xCxZ1bBZNcZiWhsVT+Wn5uAz/vpvUN0BwDnL2g5kf0Eib2aQagknOk+AH
 q9BWsRS+2VQ43oosjenN7gyevWb6NFWfmZaMmaIAnbWSdt9qoms2oNf3wWPyK7HjrY7B
 tLCYHEZNWjd4wyd3u6oOQXUxAH5pA/KLaqH1ctEAeS5snWcxr3ZN18bhteAVSt75pcpn
 2M6BShSVQ1pKYcOozo0NmRsjZp46lD/BfMHdwO/r3W+4dMhAoanGaZ+F1zITlOCiCF6c
 pEoJ35l2MlPXXla+DqXk0QMwjyZLNfipdgmJjG1o9hLCFEicISrLFVcPKRISv70aqELP
 0W8g==
X-Gm-Message-State: AOAM5330I/2uWVwkPfT8Y/qJJ3jgpLCC6/ZPe2rWNT23NCdBG83I1Mto
 5uGBTKO7aG0jGC2z92mH6k8kEKqz2pvl+w==
X-Google-Smtp-Source: ABdhPJzvmgNu+YZ0hZK1VEuf/LIF4Xh8GEsZYpTb8jEnC2e8Mn6t9My4dt7kWk1upv2rIDvzNgYfRg==
X-Received: by 2002:a62:16cd:0:b0:440:5296:afab with SMTP id
 196-20020a6216cd000000b004405296afabmr15965978pfw.4.1631990746285; 
 Sat, 18 Sep 2021 11:45:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/41] target/alpha: Make alpha_cpu_tlb_fill sysemu only
Date: Sat, 18 Sep 2021 11:45:07 -0700
Message-Id: <20210918184527.408540-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in raise_sigsegv is sufficient for alpha-linux-user.
Remove the code from cpu_loop that handled EXCP_MMFAULT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/cpu.h          |  7 ++++---
 linux-user/alpha/cpu_loop.c |  8 --------
 target/alpha/cpu.c          |  2 +-
 target/alpha/helper.c       | 13 +------------
 4 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index ce9ec32199..cbca4c369c 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -439,9 +439,6 @@ void alpha_translate_init(void);
 #define CPU_RESOLVING_TYPE TYPE_ALPHA_CPU
 
 void alpha_cpu_list(void);
-bool alpha_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                        MMUAccessType access_type, int mmu_idx,
-                        bool probe, uintptr_t retaddr);
 void QEMU_NORETURN dynamic_excp(CPUAlphaState *, uintptr_t, int, int);
 void QEMU_NORETURN arith_excp(CPUAlphaState *, uintptr_t, int, uint64_t);
 
@@ -449,12 +446,16 @@ uint64_t cpu_alpha_load_fpcr (CPUAlphaState *env);
 void cpu_alpha_store_fpcr (CPUAlphaState *env, uint64_t val);
 uint64_t cpu_alpha_load_gr(CPUAlphaState *env, unsigned reg);
 void cpu_alpha_store_gr(CPUAlphaState *env, unsigned reg, uint64_t val);
+
 #ifndef CONFIG_USER_ONLY
 void alpha_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                      vaddr addr, unsigned size,
                                      MMUAccessType access_type,
                                      int mmu_idx, MemTxAttrs attrs,
                                      MemTxResult response, uintptr_t retaddr);
+bool alpha_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                        MMUAccessType access_type, int mmu_idx,
+                        bool probe, uintptr_t retaddr);
 #endif
 
 static inline void cpu_get_tb_cpu_state(CPUAlphaState *env, target_ulong *pc,
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 7ce2461a02..60b650a827 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -52,14 +52,6 @@ void cpu_loop(CPUAlphaState *env)
             fprintf(stderr, "External interrupt. Exit\n");
             exit(EXIT_FAILURE);
             break;
-        case EXCP_MMFAULT:
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            info.si_code = (page_get_flags(env->trap_arg0) & PAGE_VALID
-                            ? TARGET_SEGV_ACCERR : TARGET_SEGV_MAPERR);
-            info._sifields._sigfault._addr = env->trap_arg0;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case EXCP_UNALIGN:
             info.si_signo = TARGET_SIGBUS;
             info.si_errno = 0;
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 1ca601cac5..83c201d86a 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -220,10 +220,10 @@ static const struct SysemuCPUOps alpha_sysemu_ops = {
 
 static const struct TCGCPUOps alpha_tcg_ops = {
     .initialize = alpha_translate_init,
-    .tlb_fill = alpha_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
     .has_work = alpha_cpu_has_work,
+    .tlb_fill = alpha_cpu_tlb_fill,
     .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .do_interrupt = alpha_cpu_do_interrupt,
     .do_transaction_failed = alpha_cpu_do_transaction_failed,
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 81550d9e2f..266d56ea73 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -119,18 +119,7 @@ void cpu_alpha_store_gr(CPUAlphaState *env, unsigned reg, uint64_t val)
     *cpu_alpha_addr_gr(env, reg) = val;
 }
 
-#if defined(CONFIG_USER_ONLY)
-bool alpha_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                        MMUAccessType access_type, int mmu_idx,
-                        bool probe, uintptr_t retaddr)
-{
-    AlphaCPU *cpu = ALPHA_CPU(cs);
-
-    cs->exception_index = EXCP_MMFAULT;
-    cpu->env.trap_arg0 = address;
-    cpu_loop_exit_restore(cs, retaddr);
-}
-#else
+#ifndef CONFIG_USER_ONLY
 /* Returns the OSF/1 entMM failure indication, or -1 on success.  */
 static int get_physical_address(CPUAlphaState *env, target_ulong addr,
                                 int prot_need, int mmu_idx,
-- 
2.25.1


