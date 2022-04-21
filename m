Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CB350A4C0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:55:42 +0200 (CEST)
Received: from localhost ([::1]:60528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZ9i-0006M4-2M
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZi-00087I-Nk
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:30 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:42762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZh-0006Lr-4c
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:30 -0400
Received: by mail-pf1-x435.google.com with SMTP id j17so5287412pfi.9
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MKlth30hb0JDpCAkuU+AtSK9JdNhBrNjhcXkx0wo6j8=;
 b=kIBmr4o6br2U5i37kFg951yAk6ajch/nfb8+p7e5r+0e1jbFDgD6N1lVpF5D3mY2Xv
 MOppHgb0P4c4zPamoPp2fYLI0uHq0NQtGtb/oE+U46kl2mjtcyzoo3E1RlouE2XeMoaJ
 JfRzzt2aei+zeHSGySdL8pNiZmkFd1XswlflJKpuPYHp8Gym0UDOYpmEow0UdpVoBWrx
 6UtmAYU0vQuZnNnHqc4ICrsSerp9cWPvyobO5IR0bgp1stmwl+2WfZtz2KnIuTXGitjb
 42PY4XIzAJatNFuuUoGyzJN5L8ZfJzR8Qo3o+gd9g0CeLzzUZfGBG4X2A9lft/tDGW1+
 Ls7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MKlth30hb0JDpCAkuU+AtSK9JdNhBrNjhcXkx0wo6j8=;
 b=wNtN09TF06BmVORVKCl61rmw2qB1WSiRxSY8ywQDZZ34YixyR9loeDWvtdx1GsMqVk
 Wf4Og2KN3GzUGxrRg4LoxPQOtYMM9q9om7UQG5L4zXDekeFUow3QAhxLn2o6eZTnS23H
 7eMvkdjMS0zT0vXKwxxFg90wGy2YDZlNg98Jn/lXQmUKIKMg5Y7e/0Ysnstuo1+dji6O
 o7ob9avFWcRPrCVe4cBkjvQSaxF/I4agcDo8fFmUb+FpDLArwKaRw3yWLxDyIUrThU7O
 mLW9jkRVxZmipeUgR/01+xlUuEdI/Oz7i1KGDYOxdujpajEw4xcWVp+o2pdV0fShmil/
 QLrA==
X-Gm-Message-State: AOAM533Q73aJrzkGkRn7AOwGB0P5jcJJnwfVry7SoxTsjSBFI2Lxk8qc
 YeGRl7t14rl5Eua7p5RH2RYRC2PsnrHNMA==
X-Google-Smtp-Source: ABdhPJxEkxvLHh0HV4A1G9fGlTAyyggHJ+eOoWBRVPpFtGU3cuoaTcsi8lwEe5G/SNoDbFfz1dpmGg==
X-Received: by 2002:a63:d10d:0:b0:39c:d17a:7b08 with SMTP id
 k13-20020a63d10d000000b0039cd17a7b08mr24014360pgg.180.1650554306338; 
 Thu, 21 Apr 2022 08:18:26 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:18:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 31/64] target/nios2: Create EXCP_SEMIHOST for semi-hosting
Date: Thu, 21 Apr 2022 08:17:02 -0700
Message-Id: <20220421151735.31996-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Decode 'break 1' during translation, rather than doing
it again during exception processing.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h       |  1 +
 target/nios2/helper.c    | 14 ++++++--------
 target/nios2/translate.c | 17 ++++++++++++++++-
 3 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 1998a16940..9e82100a1f 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -156,6 +156,7 @@ FIELD(CR_TLBMISC, EE, 24, 1)
 
 /* Exceptions */
 #define EXCP_BREAK    0x1000
+#define EXCP_SEMIHOST 0x1001
 #define EXCP_RESET    0
 #define EXCP_PRESET   1
 #define EXCP_IRQ      2
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index a56aaaea18..1d17c0379f 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -152,14 +152,6 @@ void nios2_cpu_do_interrupt(CPUState *cs)
 
     case EXCP_BREAK:
         qemu_log_mask(CPU_LOG_INT, "BREAK exception at pc=%x\n", env->pc);
-        /* The semihosting instruction is "break 1".  */
-        if (semihosting_enabled() &&
-            cpu_ldl_code(env, env->pc) == 0x003da07a)  {
-            qemu_log_mask(CPU_LOG_INT, "Entering semihosting\n");
-            env->pc += 4;
-            do_nios2_semihosting(env);
-            break;
-        }
 
         if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
             env->ctrl[CR_BSTATUS] = env->ctrl[CR_STATUS];
@@ -176,6 +168,12 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->pc = cpu->exception_addr;
         break;
 
+    case EXCP_SEMIHOST:
+        qemu_log_mask(CPU_LOG_INT, "BREAK semihosting at pc=%x\n", env->pc);
+        env->pc += 4;
+        do_nios2_semihosting(env);
+        break;
+
     default:
         cpu_abort(cs, "unhandled exception type=%d\n",
                   cs->exception_index);
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 4191db1342..97e531529f 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -33,6 +33,7 @@
 #include "exec/translator.h"
 #include "qemu/qemu-print.h"
 #include "exec/gen-icount.h"
+#include "semihosting/semihost.h"
 
 /* is_jmp field values */
 #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
@@ -686,6 +687,20 @@ static void trap(DisasContext *dc, uint32_t code, uint32_t flags)
     t_gen_helper_raise_exception(dc, EXCP_TRAP);
 }
 
+static void gen_break(DisasContext *dc, uint32_t code, uint32_t flags)
+{
+#ifndef CONFIG_USER_ONLY
+    /* The semihosting instruction is "break 1".  */
+    R_TYPE(instr, code);
+    if (semihosting_enabled() && instr.imm5 == 1) {
+        t_gen_helper_raise_exception(dc, EXCP_SEMIHOST);
+        return;
+    }
+#endif
+
+    t_gen_helper_raise_exception(dc, EXCP_BREAK);
+}
+
 static const Nios2Instruction r_type_instructions[] = {
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION(eret),                                /* eret */
@@ -739,7 +754,7 @@ static const Nios2Instruction r_type_instructions[] = {
     INSTRUCTION(add),                                 /* add */
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION_ILLEGAL(),
-    INSTRUCTION_FLG(gen_excp, EXCP_BREAK),            /* break */
+    INSTRUCTION(gen_break),                           /* break */
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION(nop),                                 /* nop */
     INSTRUCTION_ILLEGAL(),
-- 
2.34.1


