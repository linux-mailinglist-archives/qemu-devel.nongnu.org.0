Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9B842457D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:59:08 +0200 (CEST)
Received: from localhost ([::1]:37996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYBC7-0004n6-55
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAgo-0004jk-Pj
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:26:46 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:39929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAgm-0002Mt-EQ
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:26:46 -0400
Received: by mail-pl1-x635.google.com with SMTP id c4so2145049pls.6
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kAcqfrBKLTctf7S2SRnWlKvQ84+gE9eIlExzwRxWIv4=;
 b=COjjsswkaiUsZQfrO5d5zjBWQXrfv0pjkpgBkDG40M0vI5y9fjWNgLBLtyoOA7A2TG
 lpKEruWK/XLCX/mqnOHSoB16oa3mUr3B8P/3UzsL9kZWCAmRcLFaQDP827/27BWh11uC
 iuNTleQFwVcmawB0gSn0qBUNls0VOrw24u6hIgsdeMIwYHxr6ohvg+kEy/u3EQPhv8Xc
 vLVyDnUbhRjhOCepLRkI9xeP2M6Wk6WqwiGHA0uIDdUt36L+BXg1XiUq2Jm0wFZbUD98
 3KGG4uo4huWg117PCRkdW/S6+8oh0wYlSWZrb8g4LxxP4obGdNyHMHDpvZeSHNjxklXu
 E22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kAcqfrBKLTctf7S2SRnWlKvQ84+gE9eIlExzwRxWIv4=;
 b=nog9jShFu0kudCqwR33/ekVYG6kqeBthPz0KhFM8mZ1FDeCuuQ23IVD6+3itQck3kC
 fyDo3JNW5fgXYBFJ7jFzxm06SvqyyhsLLxnjrqVyatSX/rsRLWfEA+qMZXqxFWpmDJxS
 nG4OF6KfUS8oQ3/0OKXVsev6RFPKBQ2gc8VO1SAro96JMa9meTtuF1lBbnNvpuDgdzfS
 X1QVdwo+lkSo6ZS8lrokcYLkQRLFJoMq28OdM9TUAgwmXD1nxx2rEKop+sNATQUpKNNL
 Z2OOEbTn5MOaeFswyu9W0VW0tH3U9QZHUTE0P8ULeEJ6E086gJRfq158uqGewHLkt8IE
 J1VQ==
X-Gm-Message-State: AOAM5323I8jePgQXYUk7V9Iyge30AeHVSFEfPYvnh5qdxxlCUShLI1yb
 pIhhhyfGD56dHw/8zhZvxOuSDeJQM/ZX+Q==
X-Google-Smtp-Source: ABdhPJwPJGZdQF8EO5MRgb2SGTY2q10PwzZBlaqb5EyHgElZDlPsXq1Tm87SBu+A8dYfjbfS0/KElA==
X-Received: by 2002:a17:90a:9291:: with SMTP id
 n17mr12238751pjo.243.1633541202987; 
 Wed, 06 Oct 2021 10:26:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id p13sm5434011pjb.44.2021.10.06.10.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:26:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 40/41] target/xtensa: Make xtensa_cpu_tlb_fill sysemu only
Date: Wed,  6 Oct 2021 10:23:06 -0700
Message-Id: <20211006172307.780893-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
 laurent@vivier.eu, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


