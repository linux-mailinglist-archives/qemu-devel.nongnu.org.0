Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E9242456E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:56:24 +0200 (CEST)
Received: from localhost ([::1]:57994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYB9T-0007dK-W9
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdi-0007Hx-19
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:34 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdg-0008Df-Fh
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:33 -0400
Received: by mail-pf1-x433.google.com with SMTP id p1so2951818pfh.8
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bcv7+vrfVWDaxhREKP7oW3QycojCjuZf0xWMtNuZYi8=;
 b=VQq9dUBOBAyFm6fewzfpfgGtnACtquvwEoF7cFOL6lDwq1noDGCIUr3cuvjqXACt7f
 3zp8xgmdQuyc7bGFvWlh/hyiwbqH9rh7EscGpsOYLQNJ8yIF6GryqQT1sbebXx2b6TQg
 GY6nnIpj/Yiu+kBZxK8e44zGA2l8vPYHslWiYZGi5wUrFJcqm+zMZ2aVIucC7X8lOJko
 AZtOz5vRrk+PSUANAuJCfJbG/80Fwq1bY2VuhawQjSGgP/TWbQtt4z4kafEsgVQuMcoD
 48xJv7gDgmvNu4wu/ozTMrL0pFA9KYYgGcLhgH59D8faajhAYO9FayouBiFN9MAt+tj0
 FsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bcv7+vrfVWDaxhREKP7oW3QycojCjuZf0xWMtNuZYi8=;
 b=gX4XIovAp8ivX10sUQqxpNtR4Hhl2RC/JNbxuKNM8t9fhQECfygQCdlhf3w+q3oPh8
 4dSMkNajxHGEW5rMdz8J+4nKsiJ68a3dFv2MPwktdWIgFo3iG7dCi1ddC6j28IGQeNJY
 tELQ2GUCQxT48H7M2JfOpatFgqVv77a64lvLQ8RmUXjRtvpEAAb2/mWcLLTiSisnaI2W
 eWciP75nQJZY/vTuAguPDiUtPRMQKm+SFt6ERDR2bC6TmBGJxT9eucNmk/v5l4zpir8j
 S/K99Fb4pZvair0UySRhpqnUADJCk2r58e7pNZXVUHPX/tPvMY8etHUrrdjbiPc637mR
 ECjQ==
X-Gm-Message-State: AOAM533Pwi/cOmCJbZnJa8wHs8dBgBFA6u5wZNIuV62f1TP/zpXa9A5G
 LbSWLf5FilAgIn+2SLSSQ3h0Rh39fYMWPw==
X-Google-Smtp-Source: ABdhPJxORWfDYODQfB76UXUbo9PrPd/LUEIe/M5OnKPtcN6auSZnMyO0rI//pjU69zUEpfOJFvkH9g==
X-Received: by 2002:a63:3705:: with SMTP id e5mr22047030pga.307.1633541011195; 
 Wed, 06 Oct 2021 10:23:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 27/41] target/i386: Implement x86_cpu_record_sigsegv
Date: Wed,  6 Oct 2021 10:22:53 -0700
Message-Id: <20211006172307.780893-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


