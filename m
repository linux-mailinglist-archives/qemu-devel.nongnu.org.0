Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C6B410848
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 21:07:48 +0200 (CEST)
Received: from localhost ([::1]:34864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfgh-0000Jj-LR
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 15:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLm-0005Jr-TC
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:10 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:52167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLb-0006vo-3l
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:10 -0400
Received: by mail-pj1-x1030.google.com with SMTP id dw14so9179892pjb.1
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K0fQfQv3eI9fj5VVYuJMrdPgUOCZpzNCV/amqlAI9NY=;
 b=TNP/i4DymDyMMlS/4Zyqpp0V5kP+7O7ZgtbEH2vMsgIoZRqRWb5ahcqE+ae+KRFDxS
 4YIMOdKBliEuXx60c4aTanWoTw+blhcHhCSX1PwR5SSvbWyRZC6W7YODXMB4Ff65Ik2x
 AZfVO7V6VKhMXSIM/ApTJOpSzrKU8JLTB3jW3QXwOGhoaN/rdy9zYlYuJOPxG2Ql6ZJn
 8USTbO0REzYu5JSeRLQTb6TPKkedu3BbTNv7XLNFN6961TW5/sN7ZPgjkTbN/JJu1/Qk
 oT6NTL3SmpZUqTL651qmZxRohhOq9Pdz11CWQEiC/d1FEi7E2UjnUuObwnPNyounVX87
 m+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K0fQfQv3eI9fj5VVYuJMrdPgUOCZpzNCV/amqlAI9NY=;
 b=0SQnb2hYwBqa7HX/yjrKmfg5g7CIuh41y9waFid754XHAqNw7KVOqpaCdXgyXC25DF
 BPUmVlTEJ9rrz+gz19DcucrDYO6Tqpa3Z2WgzzIejaB2f+YGKPipCoYLXAc27Jby6rFQ
 WDgKWyPKbGBX99YiWd3tXwKn45QB+kDszjZPwuA0HwHIHJnBLCzI8IEy7oYF/fZlWPw0
 0Xz5BoY3cRZA4DEms74UyEoPHlRaOFaZvX7mftWqcW0qXsuxF5vQ6NbUZuJmN1HrIsTx
 bGGRTHgfvGtLX3I8g+8HTQqw7YnhlnpbAxBdTm06gnHzCRCxKuVXPvDZpPppvw9fdkMf
 Atkw==
X-Gm-Message-State: AOAM533JxIhfoUNu3AkGE1d/08qRDKFnZoEOn/X9v01NlUsghjpaQ3er
 I7kT4NIydHBpQ70JJ5M+TNm3BkFTvD41Ow==
X-Google-Smtp-Source: ABdhPJxcElwmVsff5vSiCTtvqKdfjpiT5yFnoJVwmm6TX5QM9M4U9tkHEGvVhqHonCTZR3nMEuMi1A==
X-Received: by 2002:a17:90b:1c92:: with SMTP id
 oo18mr28669688pjb.56.1631990751022; 
 Sat, 18 Sep 2021 11:45:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/41] target/i386: Implement x86_cpu_record_sigsegv
Date: Sat, 18 Sep 2021 11:45:13 -0700
Message-Id: <20210918184527.408540-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Record cr2, error_code, and exception_index.  That last means
that we must exit to cpu_loop ourselves, instead of letting
exception_index being overwritten.

Use the maperr parameter to properly set PG_ERROR_P_MASK.

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
index aef050d089..3fab3676b1 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -77,11 +77,12 @@ static const struct TCGCPUOps x86_tcg_ops = {
     .synchronize_from_tb = x86_cpu_synchronize_from_tb,
     .cpu_exec_enter = x86_cpu_exec_enter,
     .cpu_exec_exit = x86_cpu_exec_exit,
-    .tlb_fill = x86_cpu_tlb_fill,
 #ifdef CONFIG_USER_ONLY
     .fake_user_interrupt = x86_cpu_do_interrupt,
+    .record_sigsegv = x86_cpu_record_sigsegv,
 #else
     .has_work = x86_cpu_has_work,
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


