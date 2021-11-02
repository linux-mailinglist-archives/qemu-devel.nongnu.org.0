Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5595442C69
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:21:24 +0100 (CET)
Received: from localhost ([::1]:50722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrr1-0001KC-QK
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreG-0003s9-AJ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:12 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:39504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhre3-0000w8-CV
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:11 -0400
Received: by mail-qk1-x72e.google.com with SMTP id bk22so12482348qkb.6
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bcv7+vrfVWDaxhREKP7oW3QycojCjuZf0xWMtNuZYi8=;
 b=VhhMXEt1F5UycjB4r+Cd4HQkr9225pO6eL8qvN1PrQ1fRduWHTeixFvbw80x6V6EcB
 D6YH8zxwipI0BZ32mXEH/LSJrM97hxUgYaYJbHapdDM4fo8lxEeIfX/Um4ZavhD73TpO
 o1iSgx5lcveP8hL48A1GCMwz6XG3lK0q52PFb7XRr4LvWQLxDlEzbRarUVnOH8Kffoyu
 F0pS/BUqVn70pWfNhq1CN2XbGhsIWNauMemv3/eQMzbB7yQNC8M0hbuVeA1fOllIjZpI
 W5z/mED/nXrdCr4Gm+5d9IsKcgQ3RCGscA/AtRD4+myR4Lgz7b0sxwZQyITGhM8xhHcN
 vG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bcv7+vrfVWDaxhREKP7oW3QycojCjuZf0xWMtNuZYi8=;
 b=5OSVVfn/QBLxVnYfDP5+SXtm6+sUBM0vZNf2iMI947x750XUMEUbw4QCQWUFYfZeq9
 hJkuxFrV8LaXqY4DWEJNblz/L6xX8drlBWFNMg4iWwpYXCveS5LRiohMWVaDJmSwD+7H
 oQ/A+2aTEpMgFvt+zaX+osXhQlWLr1OiqeFJ+JZxxjL4iGMeLmSAqL1yPNTYJROERmEp
 yDuS5Q98lrQGXxpxRA6IWP0p01dTUa74dRA60FMy9yqnWrh4nPxnN2HVxyS2agDR0MLE
 pL86q3ynx2cVVVxlh45LAZYXHNOua0UYK6JUI8sOgxU6lvmbxlm54//1tZ+bLbc8vWnV
 a0Bw==
X-Gm-Message-State: AOAM531iwAa3/kvB3UPaarkEwmhczOX/jVqdhjYMcQ4AJDDMdIp0Os8E
 9Ewht3c+FRuuafjSS/Ex4OFVxYrbSBasgw==
X-Google-Smtp-Source: ABdhPJx5JSMT29cxrN5Ouh/62xtCYp95gTC7LNk08LH7gVltwQvWwuF9T9K1aBNByy1q5uNO/6Ipxg==
X-Received: by 2002:a37:6c83:: with SMTP id
 h125mr27783636qkc.486.1635851277219; 
 Tue, 02 Nov 2021 04:07:57 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/60] target/i386: Implement x86_cpu_record_sigsegv
Date: Tue,  2 Nov 2021 07:07:07 -0400
Message-Id: <20211102110740.215699-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
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


