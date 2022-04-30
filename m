Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7025515FC4
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 20:08:39 +0200 (CEST)
Received: from localhost ([::1]:36836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkrWJ-0000ef-1n
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 14:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrI5-0004gE-4P
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:57 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:56163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrI3-00083L-1H
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:56 -0400
Received: by mail-pj1-x102f.google.com with SMTP id r9so9583662pjo.5
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kDs65ZOPg5Kkkmp8VxOfy5lQsAHsaoUz3vkTXU8oqCw=;
 b=GTy5pZSvfnY/zhRVUMVLBleTLjiKjCQxK0BODFBoelQ0cnDfH4EbNrxqQOlih8erih
 dYVWKOm8xcoJfiXchQnmFWba8w/lxjiKLpGU66J/8IcXOVR4ZoC5fPCdc86349K6CGm3
 C1XgS439F2/SynXqEA0a3F1Wy5JGgX9na2HusGEdU8Xm6h1EkwiDR2hKV2HLTq4/IGls
 OJyjUMX0Uk8jPgRCGH4rT62ym0Oy6GlebiI+0zwldVIPIQn/Tfdv+vNQ+I85mWpOssg3
 A16dNgTTUPDhdOiwPvvf0OWtbN84ja/GQ0/2lzMcTnAKpZbEDhxJe4MkVljI8/xb3sJo
 qR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kDs65ZOPg5Kkkmp8VxOfy5lQsAHsaoUz3vkTXU8oqCw=;
 b=hG5uYWB8mIDb42E6/gogOYZShm5rjI0343aMAejA3sDOxN0sOnAgP5Y5+x77URvddo
 dze/VGaHYNulTak7uferzlPclLtV0sBNRo1w7JRsdQ47Xos8MgNfgWSa6HCMSaokpi0/
 rZ715YZP6hX8Si/LmDNpRQ42yMe9UPxpNSXsn2ioQatZ6Hr6mmb0mCR11M3huemsA0rs
 iAhPDxH+yJeji0m1LC49bdeoQUcyrIzjdTlePAqsIZjSm6MHWlVQv/R7MpCX9HII0oKs
 ngOdEgB47wNcSWQW/j0YJs+mHwdNGaiOOHOsaPLt0RdxQg17Ri/Rn5sOzOy21s7s1yJe
 dqxA==
X-Gm-Message-State: AOAM533FcUUCJ8EQLwLiaKgcal8stZxlega5Fex04PepCTL0T6FCGEp2
 NjXBmku61UbCUxDaVmA/mNsIzwuE+MKc0Q==
X-Google-Smtp-Source: ABdhPJwnYWkQDqB+KIwolgxmal+1y3IQ41RbfszixxpPxwKfqllSE7ezfVm2utm7nKx2C2isauX3tQ==
X-Received: by 2002:a17:902:8644:b0:153:9f01:2090 with SMTP id
 y4-20020a170902864400b001539f012090mr4371462plt.101.1651341233200; 
 Sat, 30 Apr 2022 10:53:53 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 5-20020a170902c20500b0015e8d4eb282sm1740910pll.204.2022.04.30.10.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 10:53:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/17] target/m68k: Implement TRAPcc
Date: Sat, 30 Apr 2022 10:53:35 -0700
Message-Id: <20220430175342.370628-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430175342.370628-1-richard.henderson@linaro.org>
References: <20220430175342.370628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/754
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
index 000bb44cc3..5007b24c03 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -48,6 +48,7 @@ void cpu_loop(CPUM68KState *env)
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
index 399d9232e4..c4fe8abc03 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -4879,6 +4879,54 @@ DISAS_INSN(trap)
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
@@ -6050,6 +6098,7 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(scc,       50c0, f0f8, CF_ISA_A); /* Scc.B Dx   */
     INSN(scc,       50c0, f0c0, M68000);   /* Scc.B <EA> */
     INSN(dbcc,      50c8, f0f8, M68000);
+    INSN(trapcc,    50f8, f0f8, TRAPCC);
     INSN(tpf,       51f8, fff8, CF_ISA_A);
 
     /* Branch instructions.  */
-- 
2.34.1


