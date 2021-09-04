Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDB2400DA0
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 02:02:44 +0200 (CEST)
Received: from localhost ([::1]:39470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMfcR-0002JJ-5D
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 20:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfWX-0006eI-Uu
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:56:37 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfWW-0007rh-Dt
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:56:37 -0400
Received: by mail-wr1-x435.google.com with SMTP id b6so4039080wrh.10
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ySPqMD9ZyNtG7iqcl+Yn5bN0IEHkMFklgd5QFPSdjlQ=;
 b=kKgIzj/DPKMar9KljMMzuQSjrHa20C21lLIqBZcCe7qNLCTowgHvPgrgGH04PbeKlh
 Xsaa19MWt1E5XGvDb3dQwe2/Qg8oFDjNY0OO7nWLb6pGu0VC+eaaPZPlSPRtfo9qbnPg
 UeghxZskgcMyzOFSEiLtzkeSqa1Uqu6F/DQG/y7aiyFZKXUJT6bMu12F7aTnaZ/lFCSZ
 zOSmB30KV7bdKVIfdXvfbGcOyUT/mKDzJ1D8oM8Wz+YAtFfaFJWkqaztGuj4LbyjEdEO
 CEyvE5A5p05MZY+Aodb2p8HBNcxeQifiP7Mv9252xAMaG/8Hg0oTmGw9ghZH6ay65w2H
 lTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ySPqMD9ZyNtG7iqcl+Yn5bN0IEHkMFklgd5QFPSdjlQ=;
 b=uGLjnw24GjdqdyjOHxMUwy34H2hIBngbVFqLnIrC+GYB85U5p8OK7coXtqusaPGkLf
 Ve9gjwuMZsF18gSsvacynC+7366aM6301od1WBTZqdqOYRAdf+yhn0bdtivYqo8oxu0Z
 VSUnm2c9ZRu0eDjjHVs/qT06sRpM5GlK0+C8+shdE41zzeXDLCaq3E2YPHBvFUGFQXNX
 NodY4rWi5mNSlW7C+CWNomlcT2RT9aN2d3z1oFqbnukfZTkLaMx9TG78h+YQ+RFj2Xvx
 DKcQiXA+xC/xvCqA2Qv4FSsKMLJRiwReGJSV7sxPli56JjxZkqUhlnt8onjPbKxIOBp8
 Xo2g==
X-Gm-Message-State: AOAM532q1ODWlf1mXQPiCiVqSMNOgC+89n1H/g5gyHtNLZdi/P8uPFU0
 KAMjFoiI8Lqc8XBalBXf9RZNk/xNjNU=
X-Google-Smtp-Source: ABdhPJz9YkZVUxalA3avtcO2LlGECaBQwd6HoLe8UGG7af86yk+/NpV0RisAjcq5R6qEKP89UJcPuA==
X-Received: by 2002:adf:9ccc:: with SMTP id h12mr5580036wre.385.1630799794865; 
 Sat, 04 Sep 2021 16:56:34 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id n15sm3419601wrv.48.2021.09.04.16.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:56:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/24] target/i386: Restrict cpu_exec_interrupt() handler
 to sysemu
Date: Sun,  5 Sep 2021 01:55:28 +0200
Message-Id: <20210904235542.1092641-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


