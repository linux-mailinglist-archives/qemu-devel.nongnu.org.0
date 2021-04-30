Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB1236F3B0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:30:53 +0200 (CEST)
Received: from localhost ([::1]:36596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcHzY-0008BV-7q
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlO-00035p-Mz
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:15 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:38836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHl5-0007VY-Ah
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:14 -0400
Received: by mail-pg1-x530.google.com with SMTP id i14so3864522pgk.5
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jt6WDlTVZ95m5Svb67/E+vHr02oKATGFQUbtmFvmoVU=;
 b=NOVOgnWW3ffgAEJaN82rP2fiN343BOGcF5WvNrqVFJIUAxyQXEAGv24HXv15GHTseN
 f6E0w4TPDVqiwBQmbiLGhmOaPNo3tp93kXStHruzAQmY36OVJBR9jUMdlKqDxXEi8fC3
 iUWgXqqYtEvD1L9NiDDd6y8UfddpL3WY0iXeov4LcbbTowVKiSP1r/nTnBUnk5m2AYEg
 T4B6BY5VYWGS39sEZp6bgpO6TFD34ezMS2ARts5FEKoOdlo1nV2qwWSRlb2nXDH5ojNP
 0J3wh0uhcZa6nmH2c/n4qyXvQC3qYTNHwkp1459CUqL80ErD8UVV5sdLRhy2Fmf/lrHU
 A8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jt6WDlTVZ95m5Svb67/E+vHr02oKATGFQUbtmFvmoVU=;
 b=rryLL8rtEL6TztDMvn2GmKO7I3+ASzmYdc0BhzatAg234VwcdMYyqWoHB23I232xbL
 VbNe7biqwqdJ0EGb4foCOPwSVtCAgqIbm/QQ3dV+jkufJB1ZZO33PzXEPIPan3/dQ9Kz
 sBxZo7jmZTEsj6BeI315dctqtBAY9EXLIQ4qKcUlonp4zBm0W1CJMTWpvHJ86a332OmT
 RkGOvFb/AyrlxLxBYNwh9lljGGc3y2z7ONnE+GBqWbrP2q1XnwAAIGdH6RrTVcTPMbYn
 fv+1ulKdbrsTyj+T3ywntB1558dghKjsW/EG0TcplTuWphicbZeBB+ulheo0aXrx/VQd
 55pA==
X-Gm-Message-State: AOAM533IkasQIbyUyYP579DvWn6j/M+IQPDzrpR27RexE8BhLqqOY3dt
 2ERce0qs2wDhTkW+afY62LqAVHBfzA/3DA==
X-Google-Smtp-Source: ABdhPJyWFITTnRu59Lty/1J10sDjvUviuDqScKA3tISH8PWsiu+4r7MRpL9r3oiAMUdUmi/5a7HKyA==
X-Received: by 2002:a65:6147:: with SMTP id o7mr2344172pgv.157.1619745349423; 
 Thu, 29 Apr 2021 18:15:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/30] target/ppc: Move DISAS_NORETURN setting into
 gen_exception*
Date: Thu, 29 Apr 2021 18:15:20 -0700
Message-Id: <20210430011543.1017113-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are other valid settings for is_jmp besides
DISAS_NEXT and DISAS_NORETURN, so eliminating that
dichotomy from ppc_tr_translate_insn is helpful.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Retain an exit from translator loop for ctx->exception.
    Do not emit code for single-step or ppc_tr_tb_stop for NORETURN.
---
 target/ppc/translate.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index ebe5afe7ae..3607cc12f3 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -262,7 +262,8 @@ static void gen_exception_err(DisasContext *ctx, uint32_t excp, uint32_t error)
     gen_helper_raise_exception_err(cpu_env, t0, t1);
     tcg_temp_free_i32(t0);
     tcg_temp_free_i32(t1);
-    ctx->exception = (excp);
+    ctx->exception = excp;
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_exception(DisasContext *ctx, uint32_t excp)
@@ -279,7 +280,8 @@ static void gen_exception(DisasContext *ctx, uint32_t excp)
     t0 = tcg_const_i32(excp);
     gen_helper_raise_exception(cpu_env, t0);
     tcg_temp_free_i32(t0);
-    ctx->exception = (excp);
+    ctx->exception = excp;
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_exception_nip(DisasContext *ctx, uint32_t excp,
@@ -291,7 +293,8 @@ static void gen_exception_nip(DisasContext *ctx, uint32_t excp,
     t0 = tcg_const_i32(excp);
     gen_helper_raise_exception(cpu_env, t0);
     tcg_temp_free_i32(t0);
-    ctx->exception = (excp);
+    ctx->exception = excp;
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 /*
@@ -337,6 +340,7 @@ static void gen_debug_exception(DisasContext *ctx)
     t0 = tcg_const_i32(EXCP_DEBUG);
     gen_helper_raise_exception(cpu_env, t0);
     tcg_temp_free_i32(t0);
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 static inline void gen_inval_exception(DisasContext *ctx, uint32_t error)
@@ -8037,7 +8041,6 @@ static bool ppc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     gen_debug_exception(ctx);
-    dcbase->is_jmp = DISAS_NORETURN;
     /*
      * The address covered by the breakpoint must be included in
      * [tb->pc, tb->pc + tb->size) in order to for it to be properly
@@ -8067,18 +8070,19 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     ok = decode_legacy(cpu, ctx, insn);
     if (!ok) {
         gen_invalid(ctx);
-        ctx->base.is_jmp = DISAS_NORETURN;
     }
 
 #if defined(DO_PPC_STATISTICS)
     handler->count++;
 #endif
+
     /* Check trace mode exceptions */
     if (unlikely(ctx->singlestep_enabled & CPU_SINGLE_STEP &&
                  (ctx->base.pc_next <= 0x100 || ctx->base.pc_next > 0xF00) &&
                  ctx->exception != POWERPC_SYSCALL &&
                  ctx->exception != POWERPC_EXCP_TRAP &&
-                 ctx->exception != POWERPC_EXCP_BRANCH)) {
+                 ctx->exception != POWERPC_EXCP_BRANCH &&
+                 ctx->base.is_jmp != DISAS_NORETURN)) {
         uint32_t excp = gen_prep_dbgex(ctx);
         gen_exception_nip(ctx, excp, ctx->base.pc_next);
     }
@@ -8089,14 +8093,20 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
                  opc3(ctx->opcode), opc4(ctx->opcode), ctx->opcode);
     }
 
-    ctx->base.is_jmp = ctx->exception == POWERPC_EXCP_NONE ?
-        DISAS_NEXT : DISAS_NORETURN;
+    if (ctx->base.is_jmp == DISAS_NEXT
+        && ctx->exception != POWERPC_EXCP_NONE) {
+        ctx->base.is_jmp = DISAS_TOO_MANY;
+    }
 }
 
 static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
+    if (ctx->base.is_jmp == DISAS_NORETURN) {
+        return;
+    }
+
     if (ctx->exception == POWERPC_EXCP_NONE) {
         gen_goto_tb(ctx, 0, ctx->base.pc_next);
     } else if (ctx->exception != POWERPC_EXCP_BRANCH) {
-- 
2.25.1


