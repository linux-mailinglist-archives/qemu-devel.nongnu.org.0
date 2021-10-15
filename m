Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D222A42E7E8
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:34:00 +0200 (CEST)
Received: from localhost ([::1]:38350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEut-0004hi-T2
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEc3-0006PB-0J
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:31 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:33779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEc1-0002kB-Ci
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:30 -0400
Received: by mail-pl1-x62e.google.com with SMTP id y4so5640967plb.0
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kAcqfrBKLTctf7S2SRnWlKvQ84+gE9eIlExzwRxWIv4=;
 b=Z7n/HqexPf03mPIK5CBZaZhWMlm5GOptriO4bhptblllp3qr4tbFRThMMYhtVqHxrf
 oD+b1dolGgDJp4SKiJcFgh5OrAd9Kj77xpsY8E6yNUlI/wg4n3gDZn7qqH6iN73yxvUk
 qJNgVZ0a+RkH1hKEF2OyPrSxd2hxzZeqUgEeuZZ72PvRfCumlqU8wDlR6VWctpuVJUef
 W8j3qaGnwp+310jhG/diF/y3a5aLDZqbQkWv0WvWMco9N+JjQmdgU/ZYTUyGm3PuBblP
 N7+F6znwenHxaHzqTGV5h1ZVmJQKmaXIkJSsqXEQ/wZGFuXFondzbDbwVLhBcNOyfx9J
 nCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kAcqfrBKLTctf7S2SRnWlKvQ84+gE9eIlExzwRxWIv4=;
 b=sSEykkskwIWmrB+1ikDEGZJni+tP+E88pyeUpjMLvp2h0pVoVJnyxQqDLDJJks+b7w
 CChnn0GB/q6huter19HCGFcuEnLVfDW9DmdMPkxTkYPk1YjVF5lBjS9OLSijuONyKVSS
 E8gEkkTI7cG7rPJdaqsy084xWlSyyuIx6ogCXY1Ds5/F5QMJazdNRrGlohF1Bc2oJwiD
 uoF5DjT0bnjXh9lG4W4g5z+dWWe4vuszAM7s+Rysudv7KOFfX8pCZt6khBkbOQl/mzqy
 LtJY4fnRAzCk6Y36kCj9sZhyLKXgwT1Aik+B2Zmj3rerjg2KsIiTYKwcPzvTruNpsnp7
 31dw==
X-Gm-Message-State: AOAM532YssS2uxlsojCFXkcLKBuxP6UzbKg1zFEqmyArYSkqc33HYcyL
 KHN8Y4vcUo174wnyVIqlg6+34mdBWSyRMg==
X-Google-Smtp-Source: ABdhPJw+dlQDzpQTiVE2oVGv1GXkXJGD2lNeRtn43pHSEOqgaNn/hhspX7i6c2cs+VMlabYtJwn/Rw==
X-Received: by 2002:a17:90a:428e:: with SMTP id
 p14mr25294389pjg.92.1634271267726; 
 Thu, 14 Oct 2021 21:14:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 40/67] target/xtensa: Make xtensa_cpu_tlb_fill sysemu only
Date: Thu, 14 Oct 2021 21:10:26 -0700
Message-Id: <20211015041053.2769193-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
 laurent@vivier.eu, imp@bsdimp.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


