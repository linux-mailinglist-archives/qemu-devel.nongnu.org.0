Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE45440A20E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:31:49 +0200 (CEST)
Received: from localhost ([::1]:56132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwMW-0001kn-PM
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6V-0001lb-Hj
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:16 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:42730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6S-0007iX-JY
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:14 -0400
Received: by mail-pf1-x42d.google.com with SMTP id 18so10422643pfh.9
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bwnoJR4CEwG8POKzQ2ZQ3rI8UOXD+2d+R6wBD2qnNhw=;
 b=tsHU7Ce3yOFYh3vhjdbKjxABnTM9CW3LogQcgC0hD57T+7g4Qz3HwRpxgFrwANanc4
 W+MHQNbbIEPusMPHLB8RgVI8KcSw5kaVMqa1/MDoODS+GJDW+MNlHsvFKco/Jq7eN/K7
 40V9obpt/KgK6hoY8oTJ0cNvhpKQWo4JFJzBuSGcf1UUqNhiv6qvxQEGlmKId9rJneuC
 bmXxrD50oMTbkG5PrD9PPMlVVMgUPYldSd176wWL1V7GA4AhSOz055XhdKWUtEZKLy7x
 7zpzEHQd5eFglVNCjE+QxRYVn9Iuik68Fy3Tt9hng0rDten3jgu6sGnf73FVG7wM/Snn
 AiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bwnoJR4CEwG8POKzQ2ZQ3rI8UOXD+2d+R6wBD2qnNhw=;
 b=J2U68YissJOCheZk7TBZ3/d35gytm1mW4XmEQmAZH984c93ONwnwkDyff1Gw7utmes
 RSi9XeSU0reFZI2HPTtS2CecDEXVzoGSw2HfsI1rs20MtoL9bZA4i+B7qqBEIbULMwZz
 wqxW3KTcQXHZYK/mnjURUcWoKKqGT0rd3Dz585ck2PI48iR1c3wrZ+ZPrApWDd9Xv/I8
 5I4MV0xDmcRCsA3UN/8QL4Ra50vIpZ50K0KFKTUJ4WHSRcXWp4RC2j+HdZcpUNBNOXWR
 cM/dNdFZIThhSK1XPe0GeBEnqwvofxrwiUulQtz5xO1fdcgXNwQ2BLAlPQKbk95r4fDk
 Wktg==
X-Gm-Message-State: AOAM531OoPXegtjnq18l7mutDsTFJhYux65yLNBUEDPoMYq7LE7dgnyT
 Of4fuPMbh/Vur/dBHxlsEeOvxu3J5uELEw==
X-Google-Smtp-Source: ABdhPJz4L5VWjr6Ot6jVtBqQ7P1XxL/4w0Xf13AbwSDvPgicxp0rVMI9uOSnHgDLL/XTN+rQsNmOMQ==
X-Received: by 2002:a62:7f4a:0:b0:416:310f:d082 with SMTP id
 a71-20020a627f4a000000b00416310fd082mr1972658pfd.72.1631578511287; 
 Mon, 13 Sep 2021 17:15:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/44] target/i386: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Mon, 13 Sep 2021 17:14:30 -0700
Message-Id: <20210914001456.793490-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210911165434.531552-11-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/helper-tcg.h |  2 ++
 target/i386/tcg/seg_helper.c | 10 ++--------
 target/i386/tcg/tcg-cpu.c    |  2 +-
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index 2510cc244e..60ca09e95e 100644
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
index 56263e358d..4e6f26a7b7 100644
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
         cpu_svm_check_intercept_param(env, SVM_EXIT_VINTR, 0, 0);
         intno = x86_ldl_phys(cs, env->vm_vmcb
@@ -1173,12 +1167,12 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         cs->interrupt_request &= ~CPU_INTERRUPT_VIRQ;
         env->int_ctl &= ~V_IRQ_MASK;
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
index 04c35486a2..3ecfae34cb 100644
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
2.25.1


