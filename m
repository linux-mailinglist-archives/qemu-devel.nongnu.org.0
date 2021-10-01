Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 537BC41F300
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:22:35 +0200 (CEST)
Received: from localhost ([::1]:42424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMF0-0002tE-Ao
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM52-0004w2-4o
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:16 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:44776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4z-00059l-Q1
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:15 -0400
Received: by mail-qk1-x732.google.com with SMTP id 194so9804185qkj.11
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sf9skOTdSQRGdKDCQ03O+bONiWBitaK9Yr/SJ3+lYKM=;
 b=yYOAOkIwwjKjILSTBDJEBFLPCoIKmcKnZm+B23qp1zX01ixLfQUibVDoxVAc/dmh7f
 kjWtnnx45xr6ZN/Qsve6G/6o3HMcIbkK2lBgj+UIOBSLhZrwYLHt1iSaD+n3d3e5jvki
 mogEKvUAaQeP+Ox7Z4Q0KEdF8XrNUFhgqZBAbSsoe6xf+OHdai7L3GzIqmfp1gVaaWQ4
 RBnHxOuPbTiKPXTaXzBzRDbok8e9QIlEGcIg3pqRFtldJlIJa6zfm1wgm7R01T5vBJHd
 kihni2EAajU5gzpsAxlAr/I4Cqg9b1qfJRGivAJoSy0WE/CtZPG0Buwdx+d1k2v1VGex
 fZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sf9skOTdSQRGdKDCQ03O+bONiWBitaK9Yr/SJ3+lYKM=;
 b=pr1RUDWQKwfMVFg+a0iul1LY7QJ26MprGRSFEdeAbpL0iO9VgmggFUc0lELFHpinr4
 KvGGoQuci94FKFneVdNghxQzm0sjIjckKjLf8SJkXjwoDCNuPtm3j9BTlFKzlcp2nFeL
 Epmc1kLGYvZzPrI1MNPWA9OIKGpTMoiX8w2e42Ooiog+iT31sBKlqhwJ+RDUt7eCaVtb
 v+1MciF5D0J17ScCz9JJItRYtYGOpwiM06wsvVXPNlsZLSyaX73wZO3+XAmWf9kWMfza
 4aCTd2xIaCkKgen7Bpyo6SRbKsnrFD7tDBp4uKTu0L3lriLJ7SGaXLTg0jDHOx4j46X8
 Z7+A==
X-Gm-Message-State: AOAM533Zk73TR/n4sDPldOtMbwmSPYR9gFjcvIHiOsUeFT6v7/fPnBgE
 Gw1guH6jQ4l5poo0WtefsoHPJpFdx/udvw==
X-Google-Smtp-Source: ABdhPJxE6SkliJeHpFkF0PYv8TZEqIPbnOaJNS1JKAbVbUqORTsIvtYjPUDHzxYow+DTtnyagViZCQ==
X-Received: by 2002:a37:6851:: with SMTP id d78mr10473807qkc.220.1633108331851; 
 Fri, 01 Oct 2021 10:12:11 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/41] target/alpha: Make alpha_cpu_tlb_fill sysemu only
Date: Fri,  1 Oct 2021 13:11:31 -0400
Message-Id: <20211001171151.1739472-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
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
index 772828cc26..ec6657a490 100644
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
index 1b00a81385..4cc8e0a55c 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -54,14 +54,6 @@ void cpu_loop(CPUAlphaState *env)
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
index 93e16a2ffb..52031ca981 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -218,9 +218,9 @@ static const struct SysemuCPUOps alpha_sysemu_ops = {
 
 static const struct TCGCPUOps alpha_tcg_ops = {
     .initialize = alpha_translate_init,
-    .tlb_fill = alpha_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
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


