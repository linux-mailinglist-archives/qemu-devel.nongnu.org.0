Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B283442D04
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:44:18 +0100 (CET)
Received: from localhost ([::1]:53566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsDA-00089V-Nk
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrh9-0001LM-R8
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:11 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:40671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrh6-0001vR-OM
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:11 -0400
Received: by mail-qv1-xf30.google.com with SMTP id b11so9636718qvm.7
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lCTWBHg3yAPeLZcM1I7LLlGr7M38G+m6NQblxbcjKCQ=;
 b=ygL+JwzcnQXrPBY2UEo3CTtFx8eia8lQsuQ3t85CspfP1A6ipne1h+0PZDMI5Np/zH
 yS/qYabeHL6hoIbqOw4OHcg2gSpOGshe5Hnl+1mezsnADaA6Ae16GV6BYREbXZ7/arr9
 npV2GnF6E36jvrQZ6m3u4VSsykOu3pBSxlm6JVUqZMwj74Iqv0/0pOc5ohmhxpmd8uKt
 7KZOlVhO3VK95WM0vG0Zvz84waoR1OPENtOC5thWrL9DtqBwxQKkey9WkbVSBuSfqeXM
 L5WvHcUymNQzkBxi/D548X0AJ+MOwjFHnB200B79mv6ISGqDGnoy1BhSbNc7HV0Fi19/
 mY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lCTWBHg3yAPeLZcM1I7LLlGr7M38G+m6NQblxbcjKCQ=;
 b=rozDFYVazA+r32ZCJAsYG+hmmfG+ftftKHo5ALfOGLI25wFNDYhy143bd8dgp7khMf
 i38jj7v+7UtngjJON7CqG491HT2bRj4rbIGw8gxEwLWQs+rEf9JtNJ6frF2iwtR9KLX+
 Oh1kSijtYvhdP8XtGQ0Mqh3EamotFJo3qu4bBU6UQ1q0/a8lFDUWDUX3XXHDKPJI/i90
 vPBZ7W/qlOlpgCXsjnOV3J0rdd8xhyIxj5Koq0/+Q9XC8OxxXp2J0rIXPZ2ttn9HZUNS
 U7tVozDh6DkfZHvYVBH/tHPjT7a+iLRWI8IqfPpdGglIK2PzSknezAyvgu/KMLundHUd
 I6Fg==
X-Gm-Message-State: AOAM533ndWkKyFePu6P3OT5/l4oAP8ViZOpyci0vq9MNmeMn7+Od/uIY
 /KCN6cUbSUumUQoxJ6LE3VLzZwUBD+ePoA==
X-Google-Smtp-Source: ABdhPJxLMZwj1Vr86ZyKeCG7BvE3i+NWvgQeoy884GKk+Ue6SofXjid8sG9h1klEbg1TEJwqEyNKMw==
X-Received: by 2002:a0c:c702:: with SMTP id w2mr34490446qvi.24.1635851467919; 
 Tue, 02 Nov 2021 04:11:07 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm25sm12730854qkb.4.2021.11.02.04.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:11:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 44/60] target/alpha: Implement alpha_cpu_record_sigbus
Date: Tue,  2 Nov 2021 07:07:24 -0400
Message-Id: <20211102110740.215699-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf30.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


