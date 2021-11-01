Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9CF441FC5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:02:59 +0100 (CET)
Received: from localhost ([::1]:52598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbe6-0000Ce-70
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9A-0007ow-6I
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:00 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:35473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb95-0001BI-Ml
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:30:59 -0400
Received: by mail-qk1-x72c.google.com with SMTP id az8so6051415qkb.2
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kAcqfrBKLTctf7S2SRnWlKvQ84+gE9eIlExzwRxWIv4=;
 b=ykl5ZlwRrgC7z3ei8BsniBxhkudtigX32LT3slXDyqH+3CxWVRyAZszh/Ix6af9v8z
 CQ7B1NMzvgxxJG4LCnOWZcEyI1sz7CU44p7S9IQCYQYRScgVZmZf8vMApO14m3VUL6sx
 vw6cfkc/0stMUln/tHjsv0XXh/EAHvD6nfE0wvD8f07RNWM+oj1prXA5nRrxpA97tElU
 cTSevb7GeUGzyF4QT8z1EzNSUjVXP/tyWntvlfg7ivZP/iXklDmThcgiq+fb6hcy54hb
 zmcdmpGCllGPIF5QACe2yl68v9vNe99tHyPsn68KEtI3qaU12/+RD0hggIN+yVLfK7ne
 Ul6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kAcqfrBKLTctf7S2SRnWlKvQ84+gE9eIlExzwRxWIv4=;
 b=TouPE19wcBwCo+sRsMiLs2PrCs5zY1BvxHuoZAv1Ad20WFpa67f5XYoa584+/uhz+K
 wVFFyokLbnrILxuuXd/Qc1J2Fhik+46ZhDWcQJkIPKL1/6jI4A9Qz9L7JoRwSv1CgQY+
 DsQnUiNSRE8H58ppccgM2BvV6cuMt5Pq6u2K0cFsEQtch1/aR+g5L1mB45/xykOK1R1g
 UXhBtiru49QZfazfPZTB3fuEvTnLqr/9mx5mtsruM4UjKREgsztPJLt9Nzqj5AYMsOBU
 itpYcnqcjsWI5I6z00udU/Z3q0RYcApMsvriDUZXVhreyNwVzBFRq1p2dLfTYI9pSL7t
 Hk4A==
X-Gm-Message-State: AOAM530PGEVAPFuPEVTQB5VLtnXY+gkqaL+EYZzkZmwj2ul6ieUSSJbT
 QoYpIKqZyEktwSibgPuxAKSAjhcDdEigBQ==
X-Google-Smtp-Source: ABdhPJykGU/bVIkxhTB52az3Uc/Q6QWofs/u3UdnIgI+SxlL5SCzaOc5S5zpaxQHE9b0Rf6LdNQugA==
X-Received: by 2002:a05:620a:1aa3:: with SMTP id
 bl35mr5166328qkb.450.1635787854667; 
 Mon, 01 Nov 2021 10:30:54 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id 13sm1222289qkc.40.2021.11.01.10.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:30:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 40/60] target/xtensa: Make xtensa_cpu_tlb_fill sysemu only
Date: Mon,  1 Nov 2021 13:27:09 -0400
Message-Id: <20211101172729.23149-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
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


