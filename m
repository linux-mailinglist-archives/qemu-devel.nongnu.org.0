Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208C84079B9
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 19:06:13 +0200 (CEST)
Received: from localhost ([::1]:55206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6SB-0000qc-SV
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 13:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6Hv-0007YC-FQ
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:35 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6Hs-0002c6-LW
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:35 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q26so7483190wrc.7
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KmrmQJKuuxtvSWhjZHiSYnfiuVq11gAlW4sC8tAjXUk=;
 b=NAxzEVkDy77sPBxEMuLmND+N75WXUMp66ryBeqNrWMnnPhMOFSD7noSrN+cUwgdQMb
 wC+VMcgru4KhuIm3IfzuZ1ACwyoi2aF7m4ZqM9d3oWSSaypwBgM8b+u69F6lal0oA0+w
 AWqZ8A3QUof+B2613/IRqlghg12h5ybXoCQ3y0EMre/cLBnc8wuwrqDHGf29iWmhbgNW
 O4LJaoSvUYyXu5oKKjmXcfrHVjkWoyJ5sdLIDVtrKfUTNS96XvWF1x5C0tf/jXzp56/g
 q8yohhrt9fs7KIYY7n+8486BsFFP3WNfrweENNiH9SJ20tRLtBWFRelnn316xqbYN2Ds
 x8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KmrmQJKuuxtvSWhjZHiSYnfiuVq11gAlW4sC8tAjXUk=;
 b=5/mRqSQkJWxGjEaPRXw04AoSP8/Lmjjr2l/uYB50I40iVFSmXlaXezm22+A1VXyxmQ
 bARw/I1pQ18mC6poMtDK0jkTSZkPbHHtz1dZzYTHYd5A6v5xYJ55ktxIR7wyYgPWFf3x
 9gKrE5OAHB5SqgTvvhvaQGADiIl3OJ2wR2oJzt1HCrik7cLZ1OwJqnZJUw2RoPRu22hb
 dLiR+Zm5AS5Mw32MCflDtsXJ8f0cQOZidwNzhHCGxFvt7hN08FXNVWxsfkR6xiTK7Zvr
 1DK2Sb8Gy0KvFuD9E4oiegzQYFOP3FOkXfYrXsItnBBn1bS8gyAA6CI4QI1fnnOu1NjU
 Oijw==
X-Gm-Message-State: AOAM530ko2h6dGdQ7f/uytENY5ruSUT+Gtf5yS4JfsldUOAbK9tR8b2B
 BY0b2RUrmdc3QuTyssS0o8FUxOhcw9Y=
X-Google-Smtp-Source: ABdhPJz+JC5O2lLLbpJobtASucneZLg/TgPVXZlhkb7xv67RcBYks6QuSh82sPN89d7R84Gx3gRoUw==
X-Received: by 2002:adf:c501:: with SMTP id q1mr3846189wrf.150.1631379331059; 
 Sat, 11 Sep 2021 09:55:31 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id s14sm1912541wmc.25.2021.09.11.09.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:55:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/24] target/i386: Move x86_cpu_exec_interrupt() under
 sysemu/ folder
Date: Sat, 11 Sep 2021 18:54:21 +0200
Message-Id: <20210911165434.531552-12-f4bug@amsat.org>
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

Following the logic of commit 30493a030ff ("i386: split seg_helper
into user-only and sysemu parts"), move x86_cpu_exec_interrupt()
under sysemu/seg_helper.c.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-By: Warner Losh <imp@bsdimp.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


