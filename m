Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCFB41F32C
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:33:58 +0200 (CEST)
Received: from localhost ([::1]:43834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMQ1-00069z-VO
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM8B-000220-Mn
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:15:31 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:34318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM89-0007mi-O6
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:15:31 -0400
Received: by mail-qt1-x833.google.com with SMTP id m26so9655797qtn.1
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A8ETRQBRZXwQK5lj7iW4qTnPhlNs9ObgZ0AlK9jyPww=;
 b=vFuynkTVLmhgEsICW00TbB9HI3WxeIqySmsz7K+3vlRNUSkU3U3nOJHP2Hi4uY9vet
 oqyxTXHO8B7vfYnL6FE4dE4becBZzBFDx+CSL6HMQ2iKGqYUPYlOts3ccW2WRnUlfOHr
 2td1Ae7Wf932SSPpmyajOVBOjk2GYIvTCOI6zDI8VlYFgR0kdsPyNRmfnT71MsbppZd2
 CvBHBE/27FlaXjpnE3Z4Jc1qpF60hefcFxx5l0CMx8mMciTmPiKOYI5fTV8bIWFZd0Mm
 p1z4JVeQgu0QinDSVqk7i5hiGQteTPSaEZNGiyJ78Utz+dOHjXhwsTKKFZZ3OC+Kweb8
 J6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A8ETRQBRZXwQK5lj7iW4qTnPhlNs9ObgZ0AlK9jyPww=;
 b=KcPfj9PMW+so+7LJNBPAncd+mYAycZjdTZt6Cfb+zr7Id983518Tp/CxW5EZZgQeSY
 hvtgn7lYexPoYJCQPpAKz5sgU1Lor3ORO18/E+7eV4Y474DJzw/PpxLxs52XuMdSPSF5
 gL2ou2gpbAr1PtqS/cTQeqv3ALVR4jY+87jA2s2JGpNOJoRgOREdFIDpgf/06yyld2kh
 ljnZjmRYmvozw/WC/RDouaz1LTfc4lCo3oROM5iL/wDS2kM3FGTczJW1P8WKeMYc9XHQ
 79/QleVcO6vj+5+5vRjZjKb2gEgRxtIs+mq+ZhmwhcCiPSzMY5NthiUs8bsOmQSKqPHZ
 BJzQ==
X-Gm-Message-State: AOAM530ia7Qf73tZwU07+oIxRgq5ih2O5kFmHhOs7wXGkqXjDLGPs0oH
 1zKTP/rW2+fL8lREuqWktBKxXpBF3djDcA==
X-Google-Smtp-Source: ABdhPJwCpn/pOyRB/TECXA6NbhwAefxWtSsJtmh2p77zzhSo+K4RFCNy2olElaaxA3c/YyEGPhu/6w==
X-Received: by 2002:a05:622a:147:: with SMTP id
 v7mr14435760qtw.212.1633108528818; 
 Fri, 01 Oct 2021 10:15:28 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id l5sm3697516qtq.4.2021.10.01.10.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:15:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 40/41] target/xtensa: Make xtensa_cpu_tlb_fill sysemu only
Date: Fri,  1 Oct 2021 13:11:50 -0400
Message-Id: <20211001171151.1739472-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
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
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in raise_sigsegv is sufficient for xtensa.
Remove the code from cpu_loop that raised SIGSEGV.

Cc: Max Filippov <jcmvbkbc@gmail.com>
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


