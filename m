Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E07A42E7E7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:33:59 +0200 (CEST)
Received: from localhost ([::1]:38288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEus-0004ey-Nu
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEZ8-0007Se-94
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:30 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:33489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYy-0000OQ-Ab
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:26 -0400
Received: by mail-pg1-x533.google.com with SMTP id j190so699112pgd.0
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bcv7+vrfVWDaxhREKP7oW3QycojCjuZf0xWMtNuZYi8=;
 b=nqjIwyO7/ZRFzBPLOzhopXQZLFm+44ULxd4SnMfqxFopMonT56mMtoiQiD3DaMjYqQ
 I356AZsJYnrdLddc2Ilv2QCStubgYhuPMVEDfdYZa2Y4y2qLi1DZ1XAVxAs2fNSWJi/4
 EXIg0+Optnbz12ixi1cvonfEegRbuwVYr7HZ66WFMGhSRAy+yBy6RLxyUxGeFXfJS93x
 v5UR1hAYDW2tk4Hbw695Ysdqfaiq6FsvnJXdW06uCndeB7rho3807nYOpQhQzYfiAZ/8
 8X5CY/GMu1AvmS96k7BfD9TOELsnFdZvNe3mp4jo8DYEk7Fv0wnV927gPxhVPguMczTm
 TUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bcv7+vrfVWDaxhREKP7oW3QycojCjuZf0xWMtNuZYi8=;
 b=sHrRtzo57idoP+VOtFYmSPjrvAkC0sVM8QzQKwUsLcSf6UI3ipChjOSn8wqmnbV6Lq
 2kLvrcQIKpaS09vKjqH6PKbZR/G03D110zmdXsa01j2YkL9zHbc/CTHKKlWzFd72+7AD
 3ggil9Elpw7Dmh/AzUC0QJumkPHo8gHi6rH8ne7SxXi6C1Vr7cMXn4cja3BYDQFN1k3F
 wBJOF9GrK/m5u/42k6zgtZbz6LGXEzCtHvDFSflzcO4PZh5/IFfrelicSbKRoDby2jfW
 QMeBi/FWAU6XGB55hIa6gggjDUdRuy1+Q5B5pzT3R60NYtFyXZ4zeGkMCT1hJGMQ3WtN
 9Oig==
X-Gm-Message-State: AOAM530Nx3jmVe7xFpPf7IRZC3Op/y61OlQ+AcxVGP48z5wCIcPS25Ke
 RRD46R52Zy1FOmnKpYjLYUhR5X5QQydTCw==
X-Google-Smtp-Source: ABdhPJxTZ/Y7ATUdyRUEp+2teEwdKAVvEbY7cDTIU5PhrJUvTaAfziQ8RtEVF+HNLEpZpmTg75ctMw==
X-Received: by 2002:a63:7447:: with SMTP id e7mr7408673pgn.261.1634271077653; 
 Thu, 14 Oct 2021 21:11:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:11:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 27/67] target/i386: Implement x86_cpu_record_sigsegv
Date: Thu, 14 Oct 2021 21:10:13 -0700
Message-Id: <20211015041053.2769193-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com,
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


