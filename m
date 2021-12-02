Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC49466B4E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 21:59:54 +0100 (CET)
Received: from localhost ([::1]:39438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mstBJ-0005ju-UK
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 15:59:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0x-000085-2g
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:11 -0500
Received: from [2607:f8b0:4864:20::433] (port=33703
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0v-0005U5-DD
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:10 -0500
Received: by mail-pf1-x433.google.com with SMTP id x5so776011pfr.0
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 12:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zWqJqLjylsPF2+hUki5Vjip4Wvsqiu7KEGUjTIQCZgg=;
 b=K1X40JCuG2X6BmGWO1I8qxG2+ulwVP/tL46rcxYZB6AR4UhiL2vT9ig7XE+/Smapzl
 nA06fFfbYYKDDIS6JP2QhaalAmMefDis31lCVABqx6+yAKzc2NudxCm6TyPaKuS8VDuJ
 fuQ7I/tTKFkUK4G3bPchnVzSaMJQTp+i+YdoNeRwujAvu1hSFrr44PNUaIncsPWYSbhx
 WOClscyftY+PeHAKIeYn0xp3f57BAGu31gLLG02+mOQU9Oqhlv513BvCr6wWqyBI2axM
 PMrRuLWwQnIDjDGsQUzVfVnp7yxCIlYbJfJo3eocKHyrYapDPGRhb5JwufQjOIwyLVN8
 nSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zWqJqLjylsPF2+hUki5Vjip4Wvsqiu7KEGUjTIQCZgg=;
 b=btbFJ/Xg128RbAq/W5wokpFDtoIUy3Y+FwTBpdlrVLoMq40IK+Rzt6BXwrDtYO2TFI
 PgxfTJ19q2rjkeGGQSaNdIOx9SeZsrOBDbxkNwiF8IAbHwFP71WtcRWccPkjfdca6kt4
 vEv7Etb0mAObxosy/sgAJDlECjnVoXQy8FCruRIe4YKsM5cf4/+Ab/ganjOkYAiKh38g
 4ng+JnC0hKGz41OCAoMG1hVp8OR0CJ0hn0C0Y4ndugwTXLZAiuEF6tOBIKG8wLrBiSvI
 CmHpLb6iIT3dB25zd4YQwXMWofJAYKEizOFl/SDq53/1hhIJytPgJaPOuhQOpakv5veP
 dhCA==
X-Gm-Message-State: AOAM5332E/hMmrDIzhUd+sDuSlCYqmiZbWCJPq87lckBudHqPk9/o89r
 smDgxmpBqpFKDBKbU3z+IfIQIQBnKjDE8Q==
X-Google-Smtp-Source: ABdhPJygyExRHSCesw5ihkomleC/Qvg+78hGDqpXRkH95yVII6gJK96EdGmjT++dik95ELQVXOZrgw==
X-Received: by 2002:a63:4c09:: with SMTP id z9mr1155837pga.561.1638478148114; 
 Thu, 02 Dec 2021 12:49:08 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id pi17sm3721391pjb.34.2021.12.02.12.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 12:49:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/15] target/m68k: Implement TRAPcc
Date: Thu,  2 Dec 2021 12:48:54 -0800
Message-Id: <20211202204900.50973-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202204900.50973-1-richard.henderson@linaro.org>
References: <20211202204900.50973-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/cpu.h          |  2 ++
 linux-user/m68k/cpu_loop.c |  1 +
 target/m68k/cpu.c          |  1 +
 target/m68k/op_helper.c    |  2 +-
 target/m68k/translate.c    | 41 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index a3423729ef..14e130f400 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -527,6 +527,8 @@ enum m68k_features {
     M68K_FEATURE_MOVEC,
     /* Unaligned data accesses (680[2346]0) */
     M68K_FEATURE_UNALIGNED_DATA,
+    /* TRAPcc insn. (680[2346]0, and CPU32) */
+    M68K_FEATURE_TRAPCC,
 };
 
 static inline int m68k_feature(CPUM68KState *env, int feature)
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 8e2b79550d..ed366d1645 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -49,6 +49,7 @@ void cpu_loop(CPUM68KState *env)
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
index c9ea28bf68..811b8bd117 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -395,7 +395,6 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         break;
 
     case EXCP_ILLEGAL:
-    case EXCP_TRAPCC:
         /* FIXME: addr is not only env->pc */
         do_stack_frame(env, &sp, 2, oldsr, env->pc, env->pc);
         break;
@@ -403,6 +402,7 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
     case EXCP_CHK:
     case EXCP_DIV0:
     case EXCP_TRACE:
+    case EXCP_TRAPCC:
         do_stack_frame(env, &sp, 2, oldsr, env->mmu.ar, env->pc);
         break;
 
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index fc2b6a3085..e5338b50ad 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -4876,6 +4876,46 @@ DISAS_INSN(trap)
     gen_exception(s, s->pc, EXCP_TRAP0 + (insn & 0xf));
 }
 
+static void do_trapcc(DisasContext *s, DisasCompare *c)
+{
+    TCGLabel *over = gen_new_label();
+
+    /* Jump over if !c. */
+    update_cc_op(s);
+    tcg_gen_brcond_i32(tcg_invert_cond(c->tcond), c->v1, c->v2, over);
+    free_cond(c);
+
+    tcg_gen_movi_i32(QREG_PC, s->pc);
+    gen_raise_exception_format2(s, EXCP_TRAPCC);
+
+    gen_set_label(over);
+    s->base.is_jmp = DISAS_NEXT;
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
+        /* Illegal insn */
+        disas_undef(env, s, insn);
+        return;
+    }
+
+    gen_cc_cond(&c, s, extract32(insn, 8, 4));
+    do_trapcc(s, &c);
+}
+
 static void gen_load_fcr(DisasContext *s, TCGv res, int reg)
 {
     switch (reg) {
@@ -6047,6 +6087,7 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(scc,       50c0, f0f8, CF_ISA_A); /* Scc.B Dx   */
     INSN(scc,       50c0, f0c0, M68000);   /* Scc.B <EA> */
     INSN(dbcc,      50c8, f0f8, M68000);
+    INSN(trapcc,    50f8, f0f8, TRAPCC);
     INSN(tpf,       51f8, fff8, CF_ISA_A);
 
     /* Branch instructions.  */
-- 
2.25.1


