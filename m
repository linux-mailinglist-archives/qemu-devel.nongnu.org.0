Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8652E4079AC
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 18:57:26 +0200 (CEST)
Received: from localhost ([::1]:59838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6Jh-0001jA-Je
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 12:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6Hp-0007FA-3X
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:29 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6Hn-0002Z2-Hz
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:28 -0400
Received: by mail-wr1-x42c.google.com with SMTP id t8so2460130wrq.4
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ySPqMD9ZyNtG7iqcl+Yn5bN0IEHkMFklgd5QFPSdjlQ=;
 b=bpE/KVUBVKyum2YVrj5djqP6EG67iwLPtAzrgdsmJYInHbGLQau555j2v+wTbHZjNl
 qzXbaj7De6NwrlZneqc7gaF9KjMa9UfOYF2tk6wTNQ39TMs8n5eunpdsUuR8rU7J1jgr
 JmXJ2pFNxxFNTZ//drRsM7dpygWMs21WvE7Bnu2bFQ2ubcMzTcYSOmaPD4LtsLAuttp/
 BHMbrRCLCt15dSiQbioL5idyb8CEyt2nBfsQnJU/tGtVLjTLCVLExnwdeJpmqomDmHvd
 338Cqun5JNLB+1c19S5j2UvxGIUIQyVM3eS5Yu7wnNAdn70kG/RaBHjD4xSILK9PKSt+
 /WWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ySPqMD9ZyNtG7iqcl+Yn5bN0IEHkMFklgd5QFPSdjlQ=;
 b=JQenVD5COtSOQJJTdaDlWRHSvS9oKZlToqVOcdVhJeN/U6CHKFA1CHn9m6xrNhNDqR
 6Ah8UO20H04apwsRnZ4dZzvBqEJR3mQxCgD0cX/b0uMFEO1c5eebeVlsCkBGYEQ440kd
 I15jCFpaj1vGmU2YDhx763aLUJe2/X8Rg+wRIJXSeVpVazlA/E02LbircANqnJ03Ow8+
 hUpHI5KlsP0EOt6IT5H4ZiC0Ca9Mn7Jy3uffqfsNlh5YCMdGdRAIdgtXIXf+C8jpZqdQ
 SQ7t8XnlTHwWHIJVj8+W3lYRnv1YmRwYVzOF2FDITwNOZGKZg0xhPuN9RTJXj0KU02JA
 dbcw==
X-Gm-Message-State: AOAM530CmsQTWgZ9WsSVWzywJ/FIvoSpZtOmAyAcsDTNqzy3wHzZUifG
 7lEvhBfxZOiloAFNtf8EXg5bRy/FEi4=
X-Google-Smtp-Source: ABdhPJySEOkvk1+blg3x923oFj0cU0U1hdoHIyQ0qXqRtssBBfdscgdbwJR/pYlo+xwWygm0RK0vrA==
X-Received: by 2002:a5d:470b:: with SMTP id y11mr3914172wrq.213.1631379326094; 
 Sat, 11 Sep 2021 09:55:26 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id t18sm2058786wrp.97.2021.09.11.09.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:55:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/24] target/i386: Restrict cpu_exec_interrupt() handler
 to sysemu
Date: Sat, 11 Sep 2021 18:54:20 +0200
Message-Id: <20210911165434.531552-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
References: <20210911165434.531552-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/tcg/helper-tcg.h |  2 ++
 target/i386/tcg/seg_helper.c | 10 ++--------
 target/i386/tcg/tcg-cpu.c    |  2 +-
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index 2510cc244e9..60ca09e95eb 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -38,7 +38,9 @@ QEMU_BUILD_BUG_ON(TCG_PHYS_ADDR_BITS > TARGET_PHYS_ADDR_SPACE_BITS);
  * @cpu: vCPU the interrupt is to be handled by.
  */
 void x86_cpu_do_interrupt(CPUState *cpu);
+#ifndef CONFIG_USER_ONLY
 bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#endif
 
 /* helper.c */
 bool x86_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index dee7bef68c6..13c6e6ee62e 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -1110,6 +1110,7 @@ void do_interrupt_x86_hardirq(CPUX86State *env, int intno, int is_hw)
     do_interrupt_all(env_archcpu(env), intno, 0, 0, 0, is_hw);
 }
 
+#ifndef CONFIG_USER_ONLY
 bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -1125,23 +1126,17 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
      * This is required to make icount-driven execution deterministic.
      */
     switch (interrupt_request) {
-#if !defined(CONFIG_USER_ONLY)
     case CPU_INTERRUPT_POLL:
         cs->interrupt_request &= ~CPU_INTERRUPT_POLL;
         apic_poll_irq(cpu->apic_state);
         break;
-#endif
     case CPU_INTERRUPT_SIPI:
         do_cpu_sipi(cpu);
         break;
     case CPU_INTERRUPT_SMI:
         cpu_svm_check_intercept_param(env, SVM_EXIT_SMI, 0, 0);
         cs->interrupt_request &= ~CPU_INTERRUPT_SMI;
-#ifdef CONFIG_USER_ONLY
-        cpu_abort(CPU(cpu), "SMI interrupt: cannot enter SMM in user-mode");
-#else
         do_smm_enter(cpu);
-#endif /* CONFIG_USER_ONLY */
         break;
     case CPU_INTERRUPT_NMI:
         cpu_svm_check_intercept_param(env, SVM_EXIT_NMI, 0, 0);
@@ -1162,7 +1157,6 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
                       "Servicing hardware INT=0x%02x\n", intno);
         do_interrupt_x86_hardirq(env, intno, 1);
         break;
-#if !defined(CONFIG_USER_ONLY)
     case CPU_INTERRUPT_VIRQ:
         /* FIXME: this should respect TPR */
         cpu_svm_check_intercept_param(env, SVM_EXIT_VINTR, 0, 0);
@@ -1173,12 +1167,12 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         do_interrupt_x86_hardirq(env, intno, 1);
         cs->interrupt_request &= ~CPU_INTERRUPT_VIRQ;
         break;
-#endif
     }
 
     /* Ensure that no TB jump will be modified as the program flow was changed.  */
     return true;
 }
+#endif /* CONFIG_USER_ONLY */
 
 void helper_lldt(CPUX86State *env, int selector)
 {
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 04c35486a2f..3ecfae34cb5 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -72,12 +72,12 @@ static const struct TCGCPUOps x86_tcg_ops = {
     .synchronize_from_tb = x86_cpu_synchronize_from_tb,
     .cpu_exec_enter = x86_cpu_exec_enter,
     .cpu_exec_exit = x86_cpu_exec_exit,
-    .cpu_exec_interrupt = x86_cpu_exec_interrupt,
     .tlb_fill = x86_cpu_tlb_fill,
 #ifdef CONFIG_USER_ONLY
     .fake_user_interrupt = x86_cpu_do_interrupt,
 #else
     .do_interrupt = x86_cpu_do_interrupt,
+    .cpu_exec_interrupt = x86_cpu_exec_interrupt,
     .debug_excp_handler = breakpoint_handler,
     .debug_check_breakpoint = x86_debug_check_breakpoint,
 #endif /* !CONFIG_USER_ONLY */
-- 
2.31.1


