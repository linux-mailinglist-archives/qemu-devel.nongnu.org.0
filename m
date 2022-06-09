Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D66C54561F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 23:05:49 +0200 (CEST)
Received: from localhost ([::1]:58896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzPLg-0000JI-EF
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 17:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmS-0004BO-VN
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:25 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:45050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmO-0008SR-FK
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:24 -0400
Received: by mail-pl1-x635.google.com with SMTP id h1so21111454plf.11
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DZfUsxzMa6ISMCnyMY5oUW8yvE0MgIXecjoPtJTXdCc=;
 b=N/PtKLN+DaNyYNedI38JkBBybfI/cMSzKWB3QEhzyg417e4BFkf1xVVLnfI4tRj0WV
 LrkL/ZrqBzxIBYOAXCsFEjV/aZ5O+6b1rQaKXSlq75EzZZ8zj5977f2DgWfUiCdjNlsf
 5or23/Dzy9q6SbhkrP5nEwOn8ccNCVL2B/cQgs+Sl1WmbexpWxbVkfbl3FZSfeJ3XpKJ
 bg/IZ1knuYh1yvIN/vp+1TZBYcZXF+DlIQVA6+D9E74mnmzn+n9tHZDeD5/LqCn9/0U1
 PMOkR92bk/83Ttjt94yGcD79kIOQvcy7p/SMTgMZAwJ8QKvxPYBuFy325LgZAYqYoY5n
 dDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DZfUsxzMa6ISMCnyMY5oUW8yvE0MgIXecjoPtJTXdCc=;
 b=Q7AYDMasH+xhskqLApp/jdScunfOclzOTAYl8q0X9KsKbxEjcMbGXeEPkTwE6jQ7x/
 JnzjbxMAZNwzTelZgTjqf6EzATbXjNUrt8p/M7G+M/nxEOhxPc3Y4rET4/LVi0VaWFs6
 U+K1QQObFsgPvZWbMCZAyqpv1zxrrps44AwSZzFqt2MFOpGyM3xWNutrMER+vNdr6Mz9
 dBIja3w/defY49AQRSNc/d0x6+3ipdpYwjVx0loQ5jru6UYHrgpzQ3pBNF+arq1LDfDt
 +12lGYCEPoX1zsZiL1b8ahFlk6Nrftvv8GyUhALf8o0A+65C7M8B/mrnvc5FtQDLtStT
 BC+g==
X-Gm-Message-State: AOAM5330CWEsLQyi4QZVgUcDg9tPB6p8ohPWK5VfjClUoZaA4buS/F7/
 ztRBxqq+I+J3PhgTMp9LLn+D5s6R78Fc8w==
X-Google-Smtp-Source: ABdhPJxeymeShwUT3saSlmkIV+GkroNZjyraDxNmsjKg3EZCwkhnelmBKWcASvmn8Y2k07fVfEJAdw==
X-Received: by 2002:a17:902:f149:b0:167:8569:ec00 with SMTP id
 d9-20020a170902f14900b001678569ec00mr20336312plb.8.1654806559701; 
 Thu, 09 Jun 2022 13:29:19 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 19/23] target/arm: Introduce helper_exception_with_syndrome
Date: Thu,  9 Jun 2022 13:28:57 -0700
Message-Id: <20220609202901.1177572-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the helper we can use exception_target_el at runtime,
instead of default_exception_el at translate time.
While we're at it, remove the DisasContext parameter from
gen_exception, as it is no longer used.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h    |  1 +
 target/arm/op_helper.c | 10 ++++++++++
 target/arm/translate.c | 18 +++++++++++++-----
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index db7447d233..07d45faf49 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -45,6 +45,7 @@ DEF_HELPER_FLAGS_2(usad8, TCG_CALL_NO_RWG_SE, i32, i32, i32)
 DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
                    i32, i32, i32, i32)
 DEF_HELPER_2(exception_internal, noreturn, env, i32)
+DEF_HELPER_3(exception_with_syndrome, noreturn, env, i32, i32)
 DEF_HELPER_4(exception_with_syndrome_el, noreturn, env, i32, i32, i32)
 DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
 DEF_HELPER_2(exception_swstep, noreturn, env, i32)
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 8a6a3b8551..c5bde1cfcc 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -399,6 +399,16 @@ void HELPER(exception_with_syndrome_el)(CPUARMState *env, uint32_t excp,
     raise_exception(env, excp, syndrome, target_el);
 }
 
+/*
+ * Raise an exception with the specified syndrome register value
+ * to the default target el.
+ */
+void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
+                                     uint32_t syndrome)
+{
+    raise_exception(env, excp, syndrome, exception_target_el(env));
+}
+
 uint32_t HELPER(cpsr_read)(CPUARMState *env)
 {
     return cpsr_read(env) & ~CPSR_EXEC;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index fcb6ee648b..81c27e7c70 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1097,9 +1097,10 @@ static void gen_exception_el(int excp, uint32_t syndrome, uint32_t target_el)
     gen_exception_el_v(excp, syndrome, tcg_constant_i32(target_el));
 }
 
-static void gen_exception(DisasContext *s, int excp, uint32_t syndrome)
+static void gen_exception(int excp, uint32_t syndrome)
 {
-    gen_exception_el(excp, syndrome, default_exception_el(s));
+    gen_helper_exception_with_syndrome(cpu_env, tcg_constant_i32(excp),
+                                       tcg_constant_i32(syndrome));
 }
 
 static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
@@ -1123,7 +1124,14 @@ void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
 
 void gen_exception_insn(DisasContext *s, uint64_t pc, int excp, uint32_t syn)
 {
-    gen_exception_insn_el(s, pc, excp, syn, default_exception_el(s));
+    if (s->aarch64) {
+        gen_a64_set_pc_im(pc);
+    } else {
+        gen_set_condexec(s);
+        gen_set_pc_im(s, pc);
+    }
+    gen_exception(excp, syn);
+    s->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
@@ -9766,7 +9774,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_SWI:
             gen_ss_advance(dc);
-            gen_exception(dc, EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
+            gen_exception(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
             break;
         case DISAS_HVC:
             gen_ss_advance(dc);
@@ -9835,7 +9843,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_helper_yield(cpu_env);
             break;
         case DISAS_SWI:
-            gen_exception(dc, EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
+            gen_exception(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
             break;
         case DISAS_HVC:
             gen_exception_el(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
-- 
2.34.1


