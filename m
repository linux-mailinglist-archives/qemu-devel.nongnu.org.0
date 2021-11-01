Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0A8441F98
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:52:36 +0100 (CET)
Received: from localhost ([::1]:41290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbU3-0007Wc-L0
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb6D-0003o9-4q
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:57 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:39599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb64-0000ew-34
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:56 -0400
Received: by mail-qk1-x72e.google.com with SMTP id bk22so10495235qkb.6
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/utnMsLyouv7LilvnHYZPxrZ8zRoC/jZ7xS1qGJE894=;
 b=uMRuFyoHe3DFWXikZOF+KRdmMfIB3Xycz61+QfhjHQoQ9H0+wWW/XS1qeDi3UBFGoR
 YbE9GSDJ7G4YjZfILJGQlaCKSL5r3rHFvH+u0MGaG1DYMsElpBaxqKW4PU0V6OGSGFUq
 q38fump4Pf5i3wUFwxmLs+5DNBodPvC7f9AhEGY5oycL0NGix8rFh+WlXds2uPUHCrpW
 pbIRz7wZkXeE00rP1vP1FIoF+6k/Wm/OjAIBYviSMfd1PeDUomb6aOneTTZ0y9MjDgE6
 ls+k+BQP8nfRj/VCzAfP5eZUN+MLtH/V4p3GJ/6YH4KVsxWmw/mwBj/mKSgUqpGynOhQ
 MHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/utnMsLyouv7LilvnHYZPxrZ8zRoC/jZ7xS1qGJE894=;
 b=XOxn4ADpvbq6oQ9QD4w0y2LMzgNls6UW8CDGgJQArE4MSrza9LdBdj7vXR0FLikz2U
 SjA8quIrl+r9JM4K0BfKfDxoSKOUi7GZ68gaq5xA/ub6+AMQ4fJmnexCR+XUls/HxhlH
 4z2hBrLIg+Qsj9WumDksvS5mpzVBLTVqksVkOJqF9tcbgISzPDSjbvT19IdKCn2jtFm9
 oGVzBHAk0z3YzyoucPDQD6wBJ65WA+RsFdAO3ukSCY/jEKvnEbyJQJEDGKf+jzv3h54A
 p/xlqFv4bAF+2WZj/sLx8A1repYbBO79jGDvZpt6SaIhcBXKl/U9h1G4YfV8xX4t6Fh1
 oPSQ==
X-Gm-Message-State: AOAM530hZWKF2yFoEGHp+R9Yw8+fcf+D13qxfR5PyR81KjGxnhFq6No5
 moJqz9f/EBwtcZsEFL/Ufyo3K4M8qcfxBw==
X-Google-Smtp-Source: ABdhPJwFFfl4rfAOS9fq1xYD1JzgjZr6MU5GmsyL2WSLvI2bHlSJD6Nh/dyGv96HF8iquS7rWZSlUg==
X-Received: by 2002:a05:620a:2545:: with SMTP id
 s5mr23473450qko.323.1635787667281; 
 Mon, 01 Nov 2021 10:27:47 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 28/60] target/m68k: Make m68k_cpu_tlb_fill sysemu only
Date: Mon,  1 Nov 2021 13:26:57 -0400
Message-Id: <20211101172729.23149-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The fallback code in cpu_loop_exit_sigsegv is sufficient
for m68k linux-user.

Remove the code from cpu_loop that handled EXCP_ACCESS.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/cpu_loop.c | 10 ----------
 target/m68k/cpu.c          |  2 +-
 target/m68k/helper.c       |  6 +-----
 3 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index ebf32be78f..790bd558c3 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -90,16 +90,6 @@ void cpu_loop(CPUM68KState *env)
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
-        case EXCP_ACCESS:
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = env->mmu.ar;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
-            break;
         case EXCP_DEBUG:
             info.si_signo = TARGET_SIGTRAP;
             info.si_errno = 0;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 66d22d1189..c7aeb7da9c 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -515,9 +515,9 @@ static const struct SysemuCPUOps m68k_sysemu_ops = {
 
 static const struct TCGCPUOps m68k_tcg_ops = {
     .initialize = m68k_tcg_init,
-    .tlb_fill = m68k_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill = m68k_cpu_tlb_fill,
     .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
     .do_interrupt = m68k_cpu_do_interrupt,
     .do_transaction_failed = m68k_cpu_transaction_failed,
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 137a3e1a3d..5728e48585 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -978,16 +978,12 @@ void m68k_set_irq_level(M68kCPU *cpu, int level, uint8_t vector)
     }
 }
 
-#endif
-
 bool m68k_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType qemu_access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr)
 {
     M68kCPU *cpu = M68K_CPU(cs);
     CPUM68KState *env = &cpu->env;
-
-#ifndef CONFIG_USER_ONLY
     hwaddr physical;
     int prot;
     int access_type;
@@ -1051,12 +1047,12 @@ bool m68k_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     if (!(access_type & ACCESS_STORE)) {
         env->mmu.ssw |= M68K_RW_040;
     }
-#endif
 
     cs->exception_index = EXCP_ACCESS;
     env->mmu.ar = address;
     cpu_loop_exit_restore(cs, retaddr);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 uint32_t HELPER(bitrev)(uint32_t x)
 {
-- 
2.25.1


