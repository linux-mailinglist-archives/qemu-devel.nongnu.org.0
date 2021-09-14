Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A302240A1D7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:21:42 +0200 (CEST)
Received: from localhost ([::1]:59926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwCj-00025p-Mj
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6X-0001mm-7g
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:22 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:37738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6T-0007jN-E7
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:16 -0400
Received: by mail-pf1-x435.google.com with SMTP id j6so10139734pfa.4
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=igroepKHj/bqmpYeun/twznbyYnmC4GYZHQwK3BtdZg=;
 b=oBE4etjY2n85lWlYBi6ViO9MGQ8K5l9MvE5Q04nNeY2Cf6RmwUV7ouBtxPgjGzWgtH
 gXQNh0j6JjcT++Ay8EctkZ1OUNba79bpFJwUtssBv1u5aGVFBNbstILMKMjyCt6vM4kQ
 iL+sPV15av9SHWdttYr/0paH2TJtrMmC/lkAKBp2E2R2fZHPASQGl1ubkxf3iTy3wxdV
 J+NdIm0Dq9qa5W8I7fyBe/Rmk9T6/xRvrKzc3OmiP6+DTES1q5r89Hv52eAHBob1mIy5
 XG5et/xMi5af2MSgznwWGOVrbCzUYvk6nw9cw62NwXs8ikEBd0ApbGBKfAzvQTo6kv57
 vG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=igroepKHj/bqmpYeun/twznbyYnmC4GYZHQwK3BtdZg=;
 b=S+1EtizbJisEUwYkBiiN3jds8UtCt+ffnUs75ULoCNmHtJknSnV2eLtLSuHX5CqDBO
 /SE+Qz6yWwQNVYteoeuOWtgq5apQWNlnn3zxH/zgSwq5aAqWmK6+e7WWI8oGcGm6aeOK
 x3zv4MfaUq7Yu2wkO33wfBuPQvdIwTYJZ1hVXibYkSsB+JtmqKAmb2DXo1S8OYhNTlu3
 aVuXuz2sveNjKPoGES0KWPUgX4uLOlsYgwJOGH9PELPGpbRIFG/YGa75TOKAQ7CKvtWu
 YAOdpsrf8j5BiTUORclruABEI49SV4VSrw/QIgrOGCBkKzE97Q2m4B/etqqoCekbr5EU
 1nTQ==
X-Gm-Message-State: AOAM5317uz3Kg+HMgT6oRT5eseQW+Dr5q6AB8McpjSVPcK08csIdT8BP
 KLekqGf4R8kUvvm/ktHr36wGXnvsQRkyEA==
X-Google-Smtp-Source: ABdhPJxzsoP7z32ffdFwAVdq8uzrK1VDxd9c/wBzyQ5+/FHU+7K/IOGDzU7AnPbrx8+isoJuukQLFA==
X-Received: by 2002:a62:87c6:0:b0:416:4f27:db2c with SMTP id
 i189-20020a6287c6000000b004164f27db2cmr2043872pfe.9.1631578512090; 
 Mon, 13 Sep 2021 17:15:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/44] target/i386: Move x86_cpu_exec_interrupt() under sysemu/
 folder
Date: Mon, 13 Sep 2021 17:14:31 -0700
Message-Id: <20210914001456.793490-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Following the logic of commit 30493a030ff ("i386: split seg_helper
into user-only and sysemu parts"), move x86_cpu_exec_interrupt()
under sysemu/seg_helper.c.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-By: Warner Losh <imp@bsdimp.com>
Message-Id: <20210911165434.531552-12-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/seg_helper.c        | 64 -----------------------------
 target/i386/tcg/sysemu/seg_helper.c | 62 ++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 64 deletions(-)

diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index 4e6f26a7b7..baa905a0cd 100644
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
-        cpu_svm_check_intercept_param(env, SVM_EXIT_VINTR, 0, 0);
-        intno = x86_ldl_phys(cs, env->vm_vmcb
-                             + offsetof(struct vmcb, control.int_vector));
-        qemu_log_mask(CPU_LOG_TB_IN_ASM,
-                      "Servicing virtual hardware INT=0x%02x\n", intno);
-        do_interrupt_x86_hardirq(env, intno, 1);
-        cs->interrupt_request &= ~CPU_INTERRUPT_VIRQ;
-        env->int_ctl &= ~V_IRQ_MASK;
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
index 82c0856c41..bf3444c26b 100644
--- a/target/i386/tcg/sysemu/seg_helper.c
+++ b/target/i386/tcg/sysemu/seg_helper.c
@@ -125,6 +125,68 @@ void x86_cpu_do_interrupt(CPUState *cs)
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
+    /* Don't process multiple interrupt requests in a single call.
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
+        cpu_svm_check_intercept_param(env, SVM_EXIT_VINTR, 0, 0);
+        intno = x86_ldl_phys(cs, env->vm_vmcb
+                             + offsetof(struct vmcb, control.int_vector));
+        qemu_log_mask(CPU_LOG_TB_IN_ASM,
+                      "Servicing virtual hardware INT=0x%02x\n", intno);
+        do_interrupt_x86_hardirq(env, intno, 1);
+        cs->interrupt_request &= ~CPU_INTERRUPT_VIRQ;
+        env->int_ctl &= ~V_IRQ_MASK;
+        break;
+    }
+
+    /* Ensure that no TB jump will be modified as the program flow was changed.  */
+    return true;
+}
+
 /* check if Port I/O is allowed in TSS */
 void helper_check_io(CPUX86State *env, uint32_t addr, uint32_t size)
 {
-- 
2.25.1


