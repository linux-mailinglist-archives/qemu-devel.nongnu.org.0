Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3AE53B158
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:51:07 +0200 (CEST)
Received: from localhost ([::1]:47406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwZzO-0004TQ-CH
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZj9-0002bA-IL
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:19 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:44615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZj7-0005GO-I4
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:19 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so3577359pjb.3
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ga6M5TFkkaYF0mj3zd4e3fWL1GckLYt0gBCWZ8vZfkU=;
 b=zYAViKlrko/kTMxjpr9FhJ53h1vFswuBA5nuDoaJD3/Q3rGz4JmjvsVRNVfLtY6ToK
 q3JEGoWH2OsVGo3PJsnIZRS3SeTOrGhmDuRwezEKSa8O0gMk67W8KLODGEvuu8HLicPH
 VY8/hrN4i8DUPLG5RPIhg82JiKpelKyU20n7OENKk8WUmWBJQXC64Te1FrMlzRza4i7B
 tuQSfaXTuSKnAhJ4e3rKSKKB1yRoK2oBY5buK5kSIKmK8vWFzBQA6R9gAZFG8a6OZiO9
 4HL29t+FQwMw1m1REZG/TLzHEzEivJRo5Anjw2sLUcl3MI7N598ezFxNrgti3m49RpMa
 7LTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ga6M5TFkkaYF0mj3zd4e3fWL1GckLYt0gBCWZ8vZfkU=;
 b=sITlOrAH0b1+zue7NQxoiDu9XzArCytR2YnxO0mEuCePGhHgyghSbZNz5y2IM/dZC0
 d1mwmYJZEhjDpZxiHCxklEmlBh2UW2KLT2lFlg3Sg6ZQbBOqNwylDQIwjueH4z6slSDw
 +IwEOssgeF+41bTjdHl3+5xlnnCyewHxWB1T1wQDvZ8GUvTtkHdtbSXxSAwrAhjl5SpQ
 c1ORBmqpwcHjH70pnZqQN3JL3+2AgeVTKYnnx9LRFK//FEmEg91DwsKFFvVw7zGz6upp
 W7nBOvkeX2ZoeUgUXW08A9XmDKnaX3xCHFI9KPyh8k+vXMaV+O/eCTA4k/+TTqem7KIK
 aiLA==
X-Gm-Message-State: AOAM530bFL9IEflpJWsXKp6ACF4dQgni72hXHprJ5SvZz3yzlmKiHCML
 1xcpjKrzmg3ONBBWkbu4Q/FhaKbqkmGyCA==
X-Google-Smtp-Source: ABdhPJyPj4UwmRQoMqS/FCzNXVeLhTwexkGCPSTCUyu5epsul+O5VZInFDwFY2b2VvmWbD3ABS3uQg==
X-Received: by 2002:a17:90b:4b82:b0:1e6:7835:2f05 with SMTP id
 lr2-20020a17090b4b8200b001e678352f05mr2363161pjb.121.1654133656233; 
 Wed, 01 Jun 2022 18:34:16 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:1eca:8ee3:9269:e00c])
 by smtp.gmail.com with ESMTPSA id
 l191-20020a6391c8000000b003fc5b1db26fsm1962875pge.52.2022.06.01.18.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 18:34:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v6 10/17] target/m68k: Implement TRAPcc
Date: Wed,  1 Jun 2022 18:33:54 -0700
Message-Id: <20220602013401.303699-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602013401.303699-1-richard.henderson@linaro.org>
References: <20220602013401.303699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/754
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v6: Use more exact masks for trapcc, to fix overlap with scc.
---
 target/m68k/cpu.h          |  2 ++
 linux-user/m68k/cpu_loop.c |  1 +
 target/m68k/cpu.c          |  1 +
 target/m68k/op_helper.c    |  6 +----
 target/m68k/translate.c    | 49 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 558c3c67d6..4d8f48e8c7 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -534,6 +534,8 @@ enum m68k_features {
     M68K_FEATURE_MOVEC,
     /* Unaligned data accesses (680[2346]0) */
     M68K_FEATURE_UNALIGNED_DATA,
+    /* TRAPcc insn. (680[2346]0, and CPU32) */
+    M68K_FEATURE_TRAPCC,
 };
 
 static inline int m68k_feature(CPUM68KState *env, int feature)
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index fcf9220552..3d3033155f 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -47,6 +47,7 @@ void cpu_loop(CPUM68KState *env)
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
             break;
         case EXCP_CHK:
+        case EXCP_TRAPCC:
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->mmu.ar);
             break;
         case EXCP_DIV0:
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index c7aeb7da9c..5f778773d1 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -162,6 +162,7 @@ static void m68020_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_CHK2);
     m68k_set_feature(env, M68K_FEATURE_MSP);
     m68k_set_feature(env, M68K_FEATURE_UNALIGNED_DATA);
+    m68k_set_feature(env, M68K_FEATURE_TRAPCC);
 }
 
 /*
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index aa62158eb9..61948d92bb 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -399,14 +399,10 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         do_stack_frame(env, &sp, 2, oldsr, 0, env->pc);
         break;
 
-    case EXCP_TRAPCC:
-        /* FIXME: addr is not only env->pc */
-        do_stack_frame(env, &sp, 2, oldsr, env->pc, env->pc);
-        break;
-
     case EXCP_CHK:
     case EXCP_DIV0:
     case EXCP_TRACE:
+    case EXCP_TRAPCC:
         do_stack_frame(env, &sp, 2, oldsr, env->mmu.ar, env->pc);
         break;
 
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 399d9232e4..61b624b3a1 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -4879,6 +4879,53 @@ DISAS_INSN(trap)
     gen_exception(s, s->pc, EXCP_TRAP0 + (insn & 0xf));
 }
 
+static void do_trapcc(DisasContext *s, DisasCompare *c)
+{
+    if (c->tcond != TCG_COND_NEVER) {
+        TCGLabel *over = NULL;
+
+        update_cc_op(s);
+
+        if (c->tcond != TCG_COND_ALWAYS) {
+            /* Jump over if !c. */
+            over = gen_new_label();
+            tcg_gen_brcond_i32(tcg_invert_cond(c->tcond), c->v1, c->v2, over);
+        }
+
+        tcg_gen_movi_i32(QREG_PC, s->pc);
+        gen_raise_exception_format2(s, EXCP_TRAPCC, s->base.pc_next);
+
+        if (over != NULL) {
+            gen_set_label(over);
+            s->base.is_jmp = DISAS_NEXT;
+        }
+    }
+    free_cond(c);
+}
+
+DISAS_INSN(trapcc)
+{
+    DisasCompare c;
+
+    /* Consume and discard the immediate operand. */
+    switch (extract32(insn, 0, 3)) {
+    case 2: /* trapcc.w */
+        (void)read_im16(env, s);
+        break;
+    case 3: /* trapcc.l */
+        (void)read_im32(env, s);
+        break;
+    case 4: /* trapcc (no operand) */
+        break;
+    default:
+        /* trapcc registered with only valid opmodes */
+        g_assert_not_reached();
+    }
+
+    gen_cc_cond(&c, s, extract32(insn, 8, 4));
+    do_trapcc(s, &c);
+}
+
 static void gen_load_fcr(DisasContext *s, TCGv res, int reg)
 {
     switch (reg) {
@@ -6050,6 +6097,8 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(scc,       50c0, f0f8, CF_ISA_A); /* Scc.B Dx   */
     INSN(scc,       50c0, f0c0, M68000);   /* Scc.B <EA> */
     INSN(dbcc,      50c8, f0f8, M68000);
+    INSN(trapcc,    50fa, f0fe, TRAPCC);   /* opmode 010, 011 */
+    INSN(trapcc,    50fc, f0ff, TRAPCC);   /* opmode 100 */
     INSN(tpf,       51f8, fff8, CF_ISA_A);
 
     /* Branch instructions.  */
-- 
2.34.1


