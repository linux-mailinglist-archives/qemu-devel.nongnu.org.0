Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E38441FA7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:54:43 +0100 (CET)
Received: from localhost ([::1]:50908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbW6-0005TT-98
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb6C-0003nz-3o
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:57 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:33556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb63-0000el-Le
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:55 -0400
Received: by mail-qv1-xf33.google.com with SMTP id bu11so3795098qvb.0
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bcv7+vrfVWDaxhREKP7oW3QycojCjuZf0xWMtNuZYi8=;
 b=tUJ6NGEblY1X7fQsccxxNFdG+BN5St0p4hy0u7ZjpCx48TysS2noEhwRFPlFISx/qx
 ODh/Q/F5NGu4sUkW7i8MGd4KvJeWjm0f4dBgWVK+EMgln4oD4TO7nr9Fya8arKgS2SXt
 pfHFBQT/K/NYosND2rekydk/ViwRbtKAw5ibiBd2fr7tCqmHoXoC24zFWqQsKpI/9Z7L
 s1rC0qqWLLICpD+fUgBmkkM+Big51F4RO2/T8tM6GIguY7VJ3FWxk/frtXhmKLy91d6n
 Q+pKImJFz5JSZQlUEqC4U7ZTLxHJHu0Q/roaXnUSM22RfLrlWsqXCvPFNwWYiKzDu5ij
 Em9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bcv7+vrfVWDaxhREKP7oW3QycojCjuZf0xWMtNuZYi8=;
 b=r2tfH6ja7cYLUUlV3Yy71i5BChFVNRSsv7DuhmV67keve8OX4gLIjPeP+NnXAtdf50
 BbGL0tgET7tatENFKhAQ1fiAplbI2zbvERJKBvm3sMDDxK7vu2+YOytzrmUug598ORdw
 1qyCZdE8i/ayZZW+Y5SyXQMr7IDM+U1EwhH/aDu6pVddBuSbmC9XWYjPrImN5bBrTqzE
 06HKt79UPLrGCQUSbVgTnGg7Hy1/ax6fFKS9QxYTcozEwtGVrKeObjdeRxzd2pPamHgy
 chv8tnuAeLorx+xYSdLBwEUadr4fJPt8Xg2a2We+mchx+H/Gk6/2hqtKsjYgGfpqMh3E
 lFYw==
X-Gm-Message-State: AOAM5323Tk3LKzukB9gPm7zSkMrZx5a8R/vGfsPP+3cfZzK0Z7j+Z0OK
 vh73iuA4jEzteyiuSFq7NHInZp7kVJlG+Q==
X-Google-Smtp-Source: ABdhPJz+lGjHPps9x2w8LvJOi4jAUci5DV8fO590cPVHse79ZaICbGsk+MRguhiYu/CasafLNaNnlw==
X-Received: by 2002:a05:6214:234d:: with SMTP id
 hu13mr19723826qvb.7.1635787666724; 
 Mon, 01 Nov 2021 10:27:46 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 27/60] target/i386: Implement x86_cpu_record_sigsegv
Date: Mon,  1 Nov 2021 13:26:56 -0400
Message-Id: <20211101172729.23149-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf33.google.com
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

Record cr2, error_code, and exception_index.  That last means
that we must exit to cpu_loop ourselves, instead of letting
exception_index being overwritten.

Use the maperr parameter to properly set PG_ERROR_P_MASK.

Reviewed by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/helper-tcg.h       |  6 ++++++
 target/i386/tcg/tcg-cpu.c          |  3 ++-
 target/i386/tcg/user/excp_helper.c | 23 +++++++++++++++++------
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index 60ca09e95e..0a4401e917 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -43,9 +43,15 @@ bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);
 #endif
 
 /* helper.c */
+#ifdef CONFIG_USER_ONLY
+void x86_cpu_record_sigsegv(CPUState *cs, vaddr addr,
+                            MMUAccessType access_type,
+                            bool maperr, uintptr_t ra);
+#else
 bool x86_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr);
+#endif
 
 void breakpoint_handler(CPUState *cs);
 
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 3ecfae34cb..6fdfdf9598 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -72,10 +72,11 @@ static const struct TCGCPUOps x86_tcg_ops = {
     .synchronize_from_tb = x86_cpu_synchronize_from_tb,
     .cpu_exec_enter = x86_cpu_exec_enter,
     .cpu_exec_exit = x86_cpu_exec_exit,
-    .tlb_fill = x86_cpu_tlb_fill,
 #ifdef CONFIG_USER_ONLY
     .fake_user_interrupt = x86_cpu_do_interrupt,
+    .record_sigsegv = x86_cpu_record_sigsegv,
 #else
+    .tlb_fill = x86_cpu_tlb_fill,
     .do_interrupt = x86_cpu_do_interrupt,
     .cpu_exec_interrupt = x86_cpu_exec_interrupt,
     .debug_excp_handler = breakpoint_handler,
diff --git a/target/i386/tcg/user/excp_helper.c b/target/i386/tcg/user/excp_helper.c
index a89b5228fd..cd507e2a1b 100644
--- a/target/i386/tcg/user/excp_helper.c
+++ b/target/i386/tcg/user/excp_helper.c
@@ -22,18 +22,29 @@
 #include "exec/exec-all.h"
 #include "tcg/helper-tcg.h"
 
-bool x86_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
-                      MMUAccessType access_type, int mmu_idx,
-                      bool probe, uintptr_t retaddr)
+void x86_cpu_record_sigsegv(CPUState *cs, vaddr addr,
+                            MMUAccessType access_type,
+                            bool maperr, uintptr_t ra)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
 
+    /*
+     * The error_code that hw reports as part of the exception frame
+     * is copied to linux sigcontext.err.  The exception_index is
+     * copied to linux sigcontext.trapno.  Short of inventing a new
+     * place to store the trapno, we cannot let our caller raise the
+     * signal and set exception_index to EXCP_INTERRUPT.
+     */
     env->cr[2] = addr;
-    env->error_code = (access_type == MMU_DATA_STORE) << PG_ERROR_W_BIT;
-    env->error_code |= PG_ERROR_U_MASK;
+    env->error_code = ((access_type == MMU_DATA_STORE) << PG_ERROR_W_BIT)
+                    | (maperr ? 0 : PG_ERROR_P_MASK)
+                    | PG_ERROR_U_MASK;
     cs->exception_index = EXCP0E_PAGE;
+
+    /* Disable do_interrupt_user. */
     env->exception_is_int = 0;
     env->exception_next_eip = -1;
-    cpu_loop_exit_restore(cs, retaddr);
+
+    cpu_loop_exit_restore(cs, ra);
 }
-- 
2.25.1


