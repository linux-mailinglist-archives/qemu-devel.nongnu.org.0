Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F15400DA3
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 02:05:56 +0200 (CEST)
Received: from localhost ([::1]:47934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMffX-0007wz-8c
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 20:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfWd-0006zr-Fs
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:56:43 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfWb-0007vG-Mw
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:56:43 -0400
Received: by mail-wr1-x431.google.com with SMTP id v10so4066106wrd.4
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=++sCcKA+nb4t/Nwj9iAwDTLzoK2jI2fRSX4bKx1OpXQ=;
 b=mYoSEWPgkoorG8HIY3kec2j3PAL39cn2XiaY1EaCcIlsVZ8D4ySR9Rq7dQoJt5qqFY
 LhghVxLaX3a4+o+IfIyPvwuw2t0nMNS2+LDh7Sx6Q6wfvFihCgrK1n6h1sBqCEdfII29
 Sph5z9DhoB3cxjrkFWjBSJP8DFqhflfrwga6V5dwxkSLlArznIg0e0aLbRcW6yni/wt2
 iSRwbn8aG6e1n9UDKtO+spQ+jrbHZSMsPyiYQnmBQGqnJLd5RqCRuj9eIrYnR5WWsNRe
 VDWQcJ9i9/aGrqtl+XIem+x+ge3ebaj6IvAC4Ow+1DLjBn1W3SMb7wnCUmEfKvajvVe/
 Qhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=++sCcKA+nb4t/Nwj9iAwDTLzoK2jI2fRSX4bKx1OpXQ=;
 b=YpzHDw7f5jz1xzN9xGDX3X7asinFfllYdky5jhIe1qivSVLLbHMAHdadtRnI10Wwub
 BGhEh60blmNTrf2ewt0TzRD1aWdKp0VPbiN1I6+hKWF0D63BycZ0QvSqiXL2vIfp6F4H
 30eTdg3ISDXxBbYjI79llV0dsmJfSyyd6iV/Yq5Rug9iyuZYslBu0h8D4+pe78v95ngF
 j5eqaoR9f6fgGnditrRqOlg6fY1aLcS/1cz2mxlz3upFlERoeRm8LUjSY+n4khAOMucP
 Ms31WErQDIWMS1hl4jOM0yOYYEqXCR9E5FHH1MuKWZPP+8EBontCRsUKQ5vqBc6SSLGi
 +1lQ==
X-Gm-Message-State: AOAM530X1jr3VTFncOFJMv9QyTtYCejkF0Z73a6cVByRNP95c7g1l74v
 2DgLf8eEdbxZQPCfF/AoJjYKvBdEWso=
X-Google-Smtp-Source: ABdhPJzZ/xlnRBdj+AGz06EWxEZSL4moXQCbJlYE0W4qjodP6NiWIwpXv426O4BwRbwloW00muMdPg==
X-Received: by 2002:adf:c44b:: with SMTP id a11mr5860809wrg.416.1630799800176; 
 Sat, 04 Sep 2021 16:56:40 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id m11sm3413261wrz.28.2021.09.04.16.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:56:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/24] target/i386: Move x86_cpu_exec_interrupt() under
 sysemu/ folder
Date: Sun,  5 Sep 2021 01:55:29 +0200
Message-Id: <20210904235542.1092641-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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

Following the logic of commit 30493a030ff ("i386: split seg_helper
into user-only and sysemu parts"), move x86_cpu_exec_interrupt()
under sysemu/seg_helper.c.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
I prefer to not squash this into the previous patch because the
ifdef'ry removal (in previous patch) is not trivial IMO.
---
 target/i386/tcg/seg_helper.c        | 64 ----------------------------
 target/i386/tcg/sysemu/seg_helper.c | 65 +++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+), 64 deletions(-)

diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index 13c6e6ee62e..baa905a0cd6 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -1110,70 +1110,6 @@ void do_interrupt_x86_hardirq(CPUX86State *env, int intno, int is_hw)
     do_interrupt_all(env_archcpu(env), intno, 0, 0, 0, is_hw);
 }
 
-#ifndef CONFIG_USER_ONLY
-bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
-{
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
-    int intno;
-
-    interrupt_request = x86_cpu_pending_interrupt(cs, interrupt_request);
-    if (!interrupt_request) {
-        return false;
-    }
-
-    /* Don't process multiple interrupt requests in a single call.
-     * This is required to make icount-driven execution deterministic.
-     */
-    switch (interrupt_request) {
-    case CPU_INTERRUPT_POLL:
-        cs->interrupt_request &= ~CPU_INTERRUPT_POLL;
-        apic_poll_irq(cpu->apic_state);
-        break;
-    case CPU_INTERRUPT_SIPI:
-        do_cpu_sipi(cpu);
-        break;
-    case CPU_INTERRUPT_SMI:
-        cpu_svm_check_intercept_param(env, SVM_EXIT_SMI, 0, 0);
-        cs->interrupt_request &= ~CPU_INTERRUPT_SMI;
-        do_smm_enter(cpu);
-        break;
-    case CPU_INTERRUPT_NMI:
-        cpu_svm_check_intercept_param(env, SVM_EXIT_NMI, 0, 0);
-        cs->interrupt_request &= ~CPU_INTERRUPT_NMI;
-        env->hflags2 |= HF2_NMI_MASK;
-        do_interrupt_x86_hardirq(env, EXCP02_NMI, 1);
-        break;
-    case CPU_INTERRUPT_MCE:
-        cs->interrupt_request &= ~CPU_INTERRUPT_MCE;
-        do_interrupt_x86_hardirq(env, EXCP12_MCHK, 0);
-        break;
-    case CPU_INTERRUPT_HARD:
-        cpu_svm_check_intercept_param(env, SVM_EXIT_INTR, 0, 0);
-        cs->interrupt_request &= ~(CPU_INTERRUPT_HARD |
-                                   CPU_INTERRUPT_VIRQ);
-        intno = cpu_get_pic_interrupt(env);
-        qemu_log_mask(CPU_LOG_TB_IN_ASM,
-                      "Servicing hardware INT=0x%02x\n", intno);
-        do_interrupt_x86_hardirq(env, intno, 1);
-        break;
-    case CPU_INTERRUPT_VIRQ:
-        /* FIXME: this should respect TPR */
-        cpu_svm_check_intercept_param(env, SVM_EXIT_VINTR, 0, 0);
-        intno = x86_ldl_phys(cs, env->vm_vmcb
-                             + offsetof(struct vmcb, control.int_vector));
-        qemu_log_mask(CPU_LOG_TB_IN_ASM,
-                      "Servicing virtual hardware INT=0x%02x\n", intno);
-        do_interrupt_x86_hardirq(env, intno, 1);
-        cs->interrupt_request &= ~CPU_INTERRUPT_VIRQ;
-        break;
-    }
-
-    /* Ensure that no TB jump will be modified as the program flow was changed.  */
-    return true;
-}
-#endif /* CONFIG_USER_ONLY */
-
 void helper_lldt(CPUX86State *env, int selector)
 {
     SegmentCache *dt;
diff --git a/target/i386/tcg/sysemu/seg_helper.c b/target/i386/tcg/sysemu/seg_helper.c
index 82c0856c417..b425b930f9d 100644
--- a/target/i386/tcg/sysemu/seg_helper.c
+++ b/target/i386/tcg/sysemu/seg_helper.c
@@ -125,6 +125,71 @@ void x86_cpu_do_interrupt(CPUState *cs)
     }
 }
 
+bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+    int intno;
+
+    interrupt_request = x86_cpu_pending_interrupt(cs, interrupt_request);
+    if (!interrupt_request) {
+        return false;
+    }
+
+    /*
+     * Don't process multiple interrupt requests in a single call.
+     * This is required to make icount-driven execution deterministic.
+     */
+    switch (interrupt_request) {
+    case CPU_INTERRUPT_POLL:
+        cs->interrupt_request &= ~CPU_INTERRUPT_POLL;
+        apic_poll_irq(cpu->apic_state);
+        break;
+    case CPU_INTERRUPT_SIPI:
+        do_cpu_sipi(cpu);
+        break;
+    case CPU_INTERRUPT_SMI:
+        cpu_svm_check_intercept_param(env, SVM_EXIT_SMI, 0, 0);
+        cs->interrupt_request &= ~CPU_INTERRUPT_SMI;
+        do_smm_enter(cpu);
+        break;
+    case CPU_INTERRUPT_NMI:
+        cpu_svm_check_intercept_param(env, SVM_EXIT_NMI, 0, 0);
+        cs->interrupt_request &= ~CPU_INTERRUPT_NMI;
+        env->hflags2 |= HF2_NMI_MASK;
+        do_interrupt_x86_hardirq(env, EXCP02_NMI, 1);
+        break;
+    case CPU_INTERRUPT_MCE:
+        cs->interrupt_request &= ~CPU_INTERRUPT_MCE;
+        do_interrupt_x86_hardirq(env, EXCP12_MCHK, 0);
+        break;
+    case CPU_INTERRUPT_HARD:
+        cpu_svm_check_intercept_param(env, SVM_EXIT_INTR, 0, 0);
+        cs->interrupt_request &= ~(CPU_INTERRUPT_HARD |
+                                   CPU_INTERRUPT_VIRQ);
+        intno = cpu_get_pic_interrupt(env);
+        qemu_log_mask(CPU_LOG_TB_IN_ASM,
+                      "Servicing hardware INT=0x%02x\n", intno);
+        do_interrupt_x86_hardirq(env, intno, 1);
+        break;
+    case CPU_INTERRUPT_VIRQ:
+        /* FIXME: this should respect TPR */
+        cpu_svm_check_intercept_param(env, SVM_EXIT_VINTR, 0, 0);
+        intno = x86_ldl_phys(cs, env->vm_vmcb
+                             + offsetof(struct vmcb, control.int_vector));
+        qemu_log_mask(CPU_LOG_TB_IN_ASM,
+                      "Servicing virtual hardware INT=0x%02x\n", intno);
+        do_interrupt_x86_hardirq(env, intno, 1);
+        cs->interrupt_request &= ~CPU_INTERRUPT_VIRQ;
+        break;
+    }
+
+    /*
+     * Ensure that no TB jump will be modified as the program flow was changed.
+     */
+    return true;
+}
+
 /* check if Port I/O is allowed in TSS */
 void helper_check_io(CPUX86State *env, uint32_t addr, uint32_t size)
 {
-- 
2.31.1


