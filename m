Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BD6440AEA
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:11:22 +0200 (CEST)
Received: from localhost ([::1]:40788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsp7-00050w-Pr
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1m-0001RH-2t
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:22 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:45944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1i-0002AW-I7
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:21 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so9589856pjb.4
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lCTWBHg3yAPeLZcM1I7LLlGr7M38G+m6NQblxbcjKCQ=;
 b=Dy3LzhKKgB7BMAxTIXqqfj+KUDeS40rOS7LWaQ6ti+lJGXwng+eavRsxrz8pDRLilH
 AWCaSPoPm/0Z513LdxaNwybn1ANeUXmraIFXRRGfRws8f3diBsFBRiy+g4zoU8NQANTp
 6TWmsUoyaC3JRXtF+BvZ0NuKPP56iafIej8w8ksNs5n0jt8juUNlPwKMOAmafnNhg60U
 cJYcX4uHntq9H2n1ia6epxU7NvRFCTjn8yqz6VNiFduJbwsuZqsIqxHSmNDjjhwO1o0G
 yJwCbbp5PDrIz9NERsO37CXG57KHzr4r59nP8YqJr+wAtpGojJvzqLcXLNId4oLtYFuw
 6bKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lCTWBHg3yAPeLZcM1I7LLlGr7M38G+m6NQblxbcjKCQ=;
 b=oN/nRYYL71GKOa9DAXvnG9Pgl4Vo9Mk1YSrPiupdaddGHyCexDDcLmsXR97JvExNnB
 UJIKC4UifTavybj9TrvfDVm3zYj4LeS+lX3QcPRgrcKkg3SgfTDE1XpPlyhEL/itL+4N
 gyyuILBbNNdq147l2N51PoFOc75XWzI8hDJgdMvxvBlZXzES7tBGZe43WEdwzBsBNi22
 l+d6fzk9Efu801DEt6ptY3sRpanKnOsKfk4DkbNypWrUnu1z38F/jyFwKx4ScI3Dv2MQ
 tw1L8nso489MY6qclr8ZfOgVybq2fXFc53q9gYB6HrD+RxI3cWBMOFaqJloBjJGbc0t5
 zz7w==
X-Gm-Message-State: AOAM53009cRj4awFY4hQqGLtXaLEKqxJGIi8mj4U3+wD25HpmhaO6YCz
 e6erLqcWkJCivSxKbKNxqa3bTt6GqKD4HA==
X-Google-Smtp-Source: ABdhPJz4QvjIwThtOifN+/RMlEWo4McKknJrwZ4Y3+qUt0zp7BEY1zn4pyvZupiDIlFnz2jfNjjpEg==
X-Received: by 2002:a17:90b:1010:: with SMTP id
 gm16mr26919681pjb.190.1635614417362; 
 Sat, 30 Oct 2021 10:20:17 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 44/66] target/alpha: Implement alpha_cpu_record_sigbus
Date: Sat, 30 Oct 2021 10:16:13 -0700
Message-Id: <20211030171635.1689530-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Record trap_arg{0,1,2} for the linux-user signal frame.

Raise SIGBUS directly from cpu_loop_exit_sigbus, which means
we can remove the code for EXCP_UNALIGN in cpu_loop.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/cpu.h          |  8 +++++---
 linux-user/alpha/cpu_loop.c |  7 -------
 target/alpha/cpu.c          |  1 +
 target/alpha/mem_helper.c   | 30 ++++++++++++++++++++++--------
 4 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index d49cc36d07..afd975c878 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -282,9 +282,6 @@ void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                   MMUAccessType access_type, int mmu_idx,
-                                   uintptr_t retaddr) QEMU_NORETURN;
 
 #define cpu_list alpha_cpu_list
 
@@ -451,10 +448,15 @@ void cpu_alpha_store_gr(CPUAlphaState *env, unsigned reg, uint64_t val);
 void alpha_cpu_record_sigsegv(CPUState *cs, vaddr address,
                               MMUAccessType access_type,
                               bool maperr, uintptr_t retaddr);
+void alpha_cpu_record_sigbus(CPUState *cs, vaddr address,
+                             MMUAccessType access_type, uintptr_t retaddr);
 #else
 bool alpha_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
+void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
+                                   MMUAccessType access_type, int mmu_idx,
+                                   uintptr_t retaddr) QEMU_NORETURN;
 void alpha_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                      vaddr addr, unsigned size,
                                      MMUAccessType access_type,
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 4cc8e0a55c..4029849d5c 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -54,13 +54,6 @@ void cpu_loop(CPUAlphaState *env)
             fprintf(stderr, "External interrupt. Exit\n");
             exit(EXIT_FAILURE);
             break;
-        case EXCP_UNALIGN:
-            info.si_signo = TARGET_SIGBUS;
-            info.si_errno = 0;
-            info.si_code = TARGET_BUS_ADRALN;
-            info._sifields._sigfault._addr = env->trap_arg0;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case EXCP_OPCDEC:
         do_sigill:
             info.si_signo = TARGET_SIGILL;
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 69f32c3078..a8990d401b 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -221,6 +221,7 @@ static const struct TCGCPUOps alpha_tcg_ops = {
 
 #ifdef CONFIG_USER_ONLY
     .record_sigsegv = alpha_cpu_record_sigsegv,
+    .record_sigbus = alpha_cpu_record_sigbus,
 #else
     .tlb_fill = alpha_cpu_tlb_fill,
     .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
diff --git a/target/alpha/mem_helper.c b/target/alpha/mem_helper.c
index 75e72bc337..47283a0612 100644
--- a/target/alpha/mem_helper.c
+++ b/target/alpha/mem_helper.c
@@ -23,18 +23,12 @@
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 
-/* Softmmu support */
-#ifndef CONFIG_USER_ONLY
-void alpha_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                   MMUAccessType access_type,
-                                   int mmu_idx, uintptr_t retaddr)
+static void do_unaligned_access(CPUAlphaState *env, vaddr addr, uintptr_t retaddr)
 {
-    AlphaCPU *cpu = ALPHA_CPU(cs);
-    CPUAlphaState *env = &cpu->env;
     uint64_t pc;
     uint32_t insn;
 
-    cpu_restore_state(cs, retaddr, true);
+    cpu_restore_state(env_cpu(env), retaddr, true);
 
     pc = env->pc;
     insn = cpu_ldl_code(env, pc);
@@ -42,6 +36,26 @@ void alpha_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     env->trap_arg0 = addr;
     env->trap_arg1 = insn >> 26;                /* opcode */
     env->trap_arg2 = (insn >> 21) & 31;         /* dest regno */
+}
+
+#ifdef CONFIG_USER_ONLY
+void alpha_cpu_record_sigbus(CPUState *cs, vaddr addr,
+                             MMUAccessType access_type, uintptr_t retaddr)
+{
+    AlphaCPU *cpu = ALPHA_CPU(cs);
+    CPUAlphaState *env = &cpu->env;
+
+    do_unaligned_access(env, addr, retaddr);
+}
+#else
+void alpha_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
+                                   MMUAccessType access_type,
+                                   int mmu_idx, uintptr_t retaddr)
+{
+    AlphaCPU *cpu = ALPHA_CPU(cs);
+    CPUAlphaState *env = &cpu->env;
+
+    do_unaligned_access(env, addr, retaddr);
     cs->exception_index = EXCP_UNALIGN;
     env->error_code = 0;
     cpu_loop_exit(cs);
-- 
2.25.1


