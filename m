Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA37440AE2
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:06:02 +0200 (CEST)
Received: from localhost ([::1]:60300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsjx-0007Vv-Ps
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1i-0001QQ-3s
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:18 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:36702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1g-000295-1I
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:17 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 o10-20020a17090a3d4a00b001a6555878a8so1592462pjf.1
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kAcqfrBKLTctf7S2SRnWlKvQ84+gE9eIlExzwRxWIv4=;
 b=y5QQGo1MLXU+/OR5/9pZ0aFtq/lSM76ObKfWwPaiY1CT85YqtP4O0xbq44KYt7T4eR
 YR2do6E0qrt897F8zq85tpgzvPJRZK8AFbS0XM9O4cJbNBd4DhIm1dk7lYTfhyGoFmzZ
 GbUQEUk2s/RUlsYrWGHW2Bj8pf2dDiyriFlyEIM75S7ZL3PtxBYU+Xvj8QzmCe74fEeg
 Lo//h+M3lNt6m2PqixCf6mjijQf1x0vj5UtsPXlbaBXjAlFnC2tn0SX4TWgI/XN47Fn7
 Nx9qH+N/Mnimcj80ogFkmsYzA5rQ9YHSm19fKmgJ0wQTG+69JrNtZLngnCqxgOJ7u3hS
 iE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kAcqfrBKLTctf7S2SRnWlKvQ84+gE9eIlExzwRxWIv4=;
 b=KczZi9HTwbIXeEoIpeolEXmfV8L66uOsfAS8QNCqdDMk/b/J0q0ohOYevM4BbQB0uy
 oFa/uYLSOSS3QTPU2QPtQR31CGPykk7Mkd6MTMLUdBPj3KlK5B/6K8Y+UiCNkNf9YRtq
 dJXTgd4Hn2X8gkOY9U3fZBvI3UWrzQnw1aLIHKbIYlvxUBaTpCrhVTlgJ4yFt2xKonO2
 mF3TNHWBIGX1vfJ0ugHtYQqS2q6ySVkmxOiRIgme7cKIp6SZ/4Em6K+DeVLpURyu9zBf
 iC/kGv1AWHbr4gNEgU0dneY49GTZdXt2un3kFU7OFEpoc0rxC+/c8ectxZC5lwYVNb9T
 gisg==
X-Gm-Message-State: AOAM530vcb2RTaz2Sz9OHAUE0ZwT5Ba5RWqerP/++Rj7pH0Pngh+h9fM
 E3kUJn5m42ySFifj5IrwW6S4yhDldH0ykw==
X-Google-Smtp-Source: ABdhPJxqLDu0KLTq3ApGRHZRajc9UJZ9L2XdzgMNpxdGQgMb9PhjHjdBNlg/SnBYp7SLQJT2OyAlLA==
X-Received: by 2002:a17:903:1252:b0:13d:f3f6:2e1c with SMTP id
 u18-20020a170903125200b0013df3f62e1cmr16209629plh.73.1635614413909; 
 Sat, 30 Oct 2021 10:20:13 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 40/66] target/xtensa: Make xtensa_cpu_tlb_fill sysemu only
Date: Sat, 30 Oct 2021 10:16:09 -0700
Message-Id: <20211030171635.1689530-41-richard.henderson@linaro.org>
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in cpu_loop_exit_sigsegv is sufficient
for xtensa linux-user.

Remove the code from cpu_loop that raised SIGSEGV.

Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/cpu.h          |  2 +-
 linux-user/xtensa/cpu_loop.c |  9 ---------
 target/xtensa/cpu.c          |  2 +-
 target/xtensa/helper.c       | 22 +---------------------
 4 files changed, 3 insertions(+), 32 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index f9a510ca46..02143f2f77 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -563,10 +563,10 @@ struct XtensaCPU {
 };
 
 
+#ifndef CONFIG_USER_ONLY
 bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr);
-#ifndef CONFIG_USER_ONLY
 void xtensa_cpu_do_interrupt(CPUState *cpu);
 bool xtensa_cpu_exec_interrupt(CPUState *cpu, int interrupt_request);
 void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c
index 622afbcd34..a83490ab35 100644
--- a/linux-user/xtensa/cpu_loop.c
+++ b/linux-user/xtensa/cpu_loop.c
@@ -226,15 +226,6 @@ void cpu_loop(CPUXtensaState *env)
                 queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
                 break;
 
-            case LOAD_PROHIBITED_CAUSE:
-            case STORE_PROHIBITED_CAUSE:
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                info.si_code = TARGET_SEGV_ACCERR;
-                info._sifields._sigfault._addr = env->sregs[EXCVADDR];
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-                break;
-
             default:
                 fprintf(stderr, "exccause = %d\n", env->sregs[EXCCAUSE]);
                 g_assert_not_reached();
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index c1cbd03595..224f723236 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -192,10 +192,10 @@ static const struct SysemuCPUOps xtensa_sysemu_ops = {
 
 static const struct TCGCPUOps xtensa_tcg_ops = {
     .initialize = xtensa_translate_init,
-    .tlb_fill = xtensa_cpu_tlb_fill,
     .debug_excp_handler = xtensa_breakpoint_handler,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill = xtensa_cpu_tlb_fill,
     .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .do_interrupt = xtensa_cpu_do_interrupt,
     .do_transaction_failed = xtensa_cpu_do_transaction_failed,
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index f18ab383fd..29d216ec1b 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -242,27 +242,7 @@ void xtensa_cpu_list(void)
     }
 }
 
-#ifdef CONFIG_USER_ONLY
-
-bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                         MMUAccessType access_type, int mmu_idx,
-                         bool probe, uintptr_t retaddr)
-{
-    XtensaCPU *cpu = XTENSA_CPU(cs);
-    CPUXtensaState *env = &cpu->env;
-
-    qemu_log_mask(CPU_LOG_INT,
-                  "%s: rw = %d, address = 0x%08" VADDR_PRIx ", size = %d\n",
-                  __func__, access_type, address, size);
-    env->sregs[EXCVADDR] = address;
-    env->sregs[EXCCAUSE] = (access_type == MMU_DATA_STORE ?
-                            STORE_PROHIBITED_CAUSE : LOAD_PROHIBITED_CAUSE);
-    cs->exception_index = EXC_USER;
-    cpu_loop_exit_restore(cs, retaddr);
-}
-
-#else /* !CONFIG_USER_ONLY */
-
+#ifndef CONFIG_USER_ONLY
 void xtensa_cpu_do_unaligned_access(CPUState *cs,
                                     vaddr addr, MMUAccessType access_type,
                                     int mmu_idx, uintptr_t retaddr)
-- 
2.25.1


