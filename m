Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5664841F374
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:44:20 +0200 (CEST)
Received: from localhost ([::1]:37498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMa2-0004Nd-Ed
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM54-00054R-RU
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:20 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:42629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM52-0005E4-S4
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:18 -0400
Received: by mail-qk1-x72e.google.com with SMTP id x12so9811156qkf.9
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jdc9xUljuMqC9v+WfiNACe7k1BrlAm8+Ia/kMx84Cy4=;
 b=vVMy3Qv2zCl393tPfHiMTEvfTN325WQlNvLAtnHJ7Nfe0QPAVPQ18wIFJBgzChN65n
 VeNmMeyOMHBDQ3KvRsXW7F5KPnRLC8KPNl9+FTSV+AY/WmHsrrRS/t9aeLdWuopuFqEw
 Kq+FXiZ5uOwgIPYzzNxiIjIcw20e3q9vQvuWzUap+F71FjpP2jVAQlwS5MAyhF5aICg7
 9onyuWKKi7/8nvOGXUQEPJ9JzRiG23mMnqWcA8g3utoAAZ7NUukZMbYELmcuojqMcxoK
 aBJTc9+E5WypqCUegxq9jWNODTPjP5cP1fc2s8tcRnHycyWaZP3ke1kZVzUKsGQIgtJS
 ZSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jdc9xUljuMqC9v+WfiNACe7k1BrlAm8+Ia/kMx84Cy4=;
 b=nZDw/fXV748YqF0Nv6YYvy2m8MC80+uy0+26O6BPa1pVCvcls70JNMzqbsBzbO93vs
 JmHtCpg3kLg2ERZcfp26rrqlzDB8H4sv5JoQpRG6Wk+MEXZjthmnbCzQHLAvfpyi6ncV
 o/j0MQAKwjJ3IhDOfVssI5pVqpFqwZfI01aPog00vUHXLZ6fAz8OwIwzc4xQB3Tq57OI
 2JC7z6WEmXCVGKsMb3iXsQmXenzrprRW2UfyrLkkMRmLUxqzeQsqaJL2agJLfKSxsWTw
 Da+31innWvP0YAaYCwTwllPfL8HbHlDqlzyzRK8iF3/jcc4UvBBDopjzzuiPt7VVphJo
 lw2g==
X-Gm-Message-State: AOAM530McqEhHegALN3sLL/jHjr4DjUuBW+WIwMbDxgf+6NzsuETUOn9
 +v1rftUIcPBIMynx4g2OsfBZCrGFcn6ZxA==
X-Google-Smtp-Source: ABdhPJzBe8yt0DLfimhiS9hq9Gz9G90ZJiQOIEmJksmHjERKsmwfew3ntjr/kQ7RotKkiTPz0wDo/g==
X-Received: by 2002:a37:64ce:: with SMTP id
 y197mr10665772qkb.399.1633108335904; 
 Fri, 01 Oct 2021 10:12:15 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 26/41] target/hppa: Make hppa_cpu_tlb_fill sysemu only
Date: Fri,  1 Oct 2021 13:11:36 -0400
Message-Id: <20211001171151.1739472-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
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

The fallback code in raise_sigsegv is sufficient for hppa-linux-user.
Remove the code from cpu_loop that raised SIGSEGV.

This makes all of the code in mem_helper.c sysemu only, so remove the
ifdefs and move the file to hppa_softmmu_ss.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/cpu.h          |  2 +-
 linux-user/hppa/cpu_loop.c | 16 ----------------
 target/hppa/cpu.c          |  2 +-
 target/hppa/mem_helper.c   | 15 ---------------
 target/hppa/meson.build    |  6 ++++--
 5 files changed, 6 insertions(+), 35 deletions(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index d3cb7a279f..294fd7297f 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -323,10 +323,10 @@ hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr);
 int hppa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int hppa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void hppa_cpu_dump_state(CPUState *cs, FILE *f, int);
+#ifndef CONFIG_USER_ONLY
 bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
-#ifndef CONFIG_USER_ONLY
 void hppa_cpu_do_interrupt(CPUState *cpu);
 bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);
 int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 81607a9b27..e0a62deeb9 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -144,22 +144,6 @@ void cpu_loop(CPUHPPAState *env)
             env->iaoq_f = env->gr[31];
             env->iaoq_b = env->gr[31] + 4;
             break;
-        case EXCP_ITLB_MISS:
-        case EXCP_DTLB_MISS:
-        case EXCP_NA_ITLB_MISS:
-        case EXCP_NA_DTLB_MISS:
-        case EXCP_IMP:
-        case EXCP_DMP:
-        case EXCP_DMB:
-        case EXCP_PAGE_REF:
-        case EXCP_DMAR:
-        case EXCP_DMPI:
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            info.si_code = TARGET_SEGV_ACCERR;
-            info._sifields._sigfault._addr = env->cr[CR_IOR];
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case EXCP_UNALIGN:
             info.si_signo = TARGET_SIGBUS;
             info.si_errno = 0;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 89cba9d7a2..23eb254228 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -145,9 +145,9 @@ static const struct SysemuCPUOps hppa_sysemu_ops = {
 static const struct TCGCPUOps hppa_tcg_ops = {
     .initialize = hppa_translate_init,
     .synchronize_from_tb = hppa_cpu_synchronize_from_tb,
-    .tlb_fill = hppa_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill = hppa_cpu_tlb_fill,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .do_interrupt = hppa_cpu_do_interrupt,
     .do_unaligned_access = hppa_cpu_do_unaligned_access,
diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index afc5b56c3e..bf07445cd1 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -24,20 +24,6 @@
 #include "hw/core/cpu.h"
 #include "trace.h"
 
-#ifdef CONFIG_USER_ONLY
-bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                       MMUAccessType access_type, int mmu_idx,
-                       bool probe, uintptr_t retaddr)
-{
-    HPPACPU *cpu = HPPA_CPU(cs);
-
-    /* ??? Test between data page fault and data memory protection trap,
-       which would affect si_code.  */
-    cs->exception_index = EXCP_DMP;
-    cpu->env.cr[CR_IOR] = address;
-    cpu_loop_exit_restore(cs, retaddr);
-}
-#else
 static hppa_tlb_entry *hppa_find_tlb(CPUHPPAState *env, vaddr addr)
 {
     int i;
@@ -392,4 +378,3 @@ int hppa_artype_for_page(CPUHPPAState *env, target_ulong vaddr)
     hppa_tlb_entry *ent = hppa_find_tlb(env, vaddr);
     return ent ? ent->ar_type : -1;
 }
-#endif /* CONFIG_USER_ONLY */
diff --git a/target/hppa/meson.build b/target/hppa/meson.build
index 8a7ff82efc..021e42a2d0 100644
--- a/target/hppa/meson.build
+++ b/target/hppa/meson.build
@@ -7,13 +7,15 @@ hppa_ss.add(files(
   'gdbstub.c',
   'helper.c',
   'int_helper.c',
-  'mem_helper.c',
   'op_helper.c',
   'translate.c',
 ))
 
 hppa_softmmu_ss = ss.source_set()
-hppa_softmmu_ss.add(files('machine.c'))
+hppa_softmmu_ss.add(files(
+  'machine.c',
+  'mem_helper.c',
+))
 
 target_arch += {'hppa': hppa_ss}
 target_softmmu_arch += {'hppa': hppa_softmmu_ss}
-- 
2.25.1


