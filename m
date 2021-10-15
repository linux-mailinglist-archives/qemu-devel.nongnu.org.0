Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6304842E7F3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:39:27 +0200 (CEST)
Received: from localhost ([::1]:55020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbF0A-0007mI-ET
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEc6-0006d5-VS
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:34 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:44677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEc4-0002nb-TV
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:34 -0400
Received: by mail-pl1-x634.google.com with SMTP id t11so5591572plq.11
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rjBYeTS3X9ZvDGx0FPpXOAHGwl8wPIvp5ueP48Sb5aY=;
 b=aii45HRDIzXwwLEg2C5lkj+nmA/V8MBOpjqmMSeRWc3RsuZAcfF8QHVBlrdR9EFXQf
 cEz6iG8bqfTDrpyQIdZktvg/3RqJQKN4Gix+qOb1G022r5PysBiEkr56Grmb8H62pQdF
 q3LQ5EZAWuyqYQm8HQAYrTHHTBQyxWkftDqqJJmUf43DvMRrZJURhO3t8AIe6eii++D+
 WL4VozPXh4f3HK6vChuEYfIH6TQiOTPEtk8sJtj+gcy8sD4/UwVXHSy2lNrsq5RX3Iiy
 4nQsAxRPsEgsywE4a2QtPxaENxCvKv1iqLB8BJXRm5n/trb3uBNc+HisnYrg+da/R729
 fHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rjBYeTS3X9ZvDGx0FPpXOAHGwl8wPIvp5ueP48Sb5aY=;
 b=Nl1JDQVPcNdIgX+jQkgB73l8Fggnt673kdsh+YQzlLH93/X+3QYEdsNd/z0ouemS+t
 e1ImX3nw/pBtDIeIlcdTq/VmczyE1yajFHZaT1tpL52hyFsSF2GLooE28hfaT4nCezcJ
 v3YhGweEkCLI3cDSwLv3jevqFrjvxcRxEl1fI0o8jgr1zgX7Dt3BdQiuzU55FMs14aZy
 nb3p7LgVQ25esRzR9ZvaO1rS37zvRMLUGXLUJTuoNJrB6iOIJWIiOzryXDxH/tcgujAj
 0uwOStKvr+Ee5KBQnJWfJ3n4wTa0jpyUd0iIlYBpNq8ZFOS/iSKomb2YNXdbcFHYLqrI
 Fcqg==
X-Gm-Message-State: AOAM5301QjaeL3GINHGpFrHiDT6J21CYqG0tqBq6bKHcoM1gZ8kjFAJ2
 QzQe6cExzV0XfmOiCEVLNg+LY4M9tiA=
X-Google-Smtp-Source: ABdhPJw8OwSx+jHgzgBLb6D0TUeusvbmWpRtcPj88/WW+unUk74BNXShsP/RWnrgbHUHuGIkpGHtKQ==
X-Received: by 2002:a17:90a:7e82:: with SMTP id
 j2mr10774963pjl.165.1634271271566; 
 Thu, 14 Oct 2021 21:14:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 45/67] target/alpha: Implement alpha_cpu_record_sigbus
Date: Thu, 14 Oct 2021 21:10:31 -0700
Message-Id: <20211015041053.2769193-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Record trap_arg{0,1,2} for the linux-user signal frame.

Raise SIGBUS directly from cpu_loop_exit_sigbus, which means
we can remove the code for EXCP_UNALIGN in cpu_loop.

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


