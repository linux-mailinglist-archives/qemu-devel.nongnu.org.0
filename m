Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC314518FB4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:05:59 +0200 (CEST)
Received: from localhost ([::1]:54692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlziX-0001vd-8T
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZz-0000nd-2L
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:53:03 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:46712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZv-0006OH-31
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:53:01 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 cq17-20020a17090af99100b001dc0386cd8fso2880353pjb.5
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=l75mJLkyS62K5L377zFVSd2gu1rBBy1agq6hzSt3Vpo=;
 b=AoBEQWbfAB7HJwFtFMDqPiV4GJRQfgl0Ue/SdQi67z3yELsujJI4hl/iiz5+MFqKNr
 gb3B/oexgaBUMSPChdbyt30TNNwO3upw9UKEr0+IiowBb4W2uwpOiC3+m0enuQMa7sf+
 O6sr5brQcNdgkd0Uv5YyRLXvlHAtBILQM/cIaM5nGynLiXbm0ngtJxunmYgEbAqWsW9I
 Sz/leRGCyKz8I5gVnRxJgxoEOK3m78xnWm0kDQbcFoqHSui5UAMYl4/09cd83aWr0b+e
 y75WWJf/vucL6by+Nta4loXuD0AQuJcov2sEKkSp+lk/x1VBWGGGh9MEB+CGQi77cQwZ
 akcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l75mJLkyS62K5L377zFVSd2gu1rBBy1agq6hzSt3Vpo=;
 b=jHvU/57tYycCpkd6yNpgg+HuRd08pZouDnDZrP6ssGdnHsWV5hoxgWdEtZYBdK20Mg
 Q3AJFF/FRMwLYDWbPKxQ/p0+EEtnglIzLm1G8MNJ5UWLAY/HmoPfS9Zlf1Y7Kxzmoqhx
 Vjy2h83SYov25rr0tAHbAvlvN9BKqAsOGbumgYreVP7elzTwSBnAeNV+c/orcK3PGszS
 ixzTBfPQTLCxoQONeS6oeowyTm5NCxIeNCYjMzGacEtxwsurikhiRzs3HD4tp9D+IHVj
 G74BLY659aiXmJ0wJEZONHElBLQ9yA7JiGbLqaWF+B2/xyDj0Eyo4zgbEUKMV4R1ReCy
 VYbQ==
X-Gm-Message-State: AOAM532Cx8byqLDqH0JfJx5N/eKxipjfMzYBySCF1MfJEIeI5y/ybSbg
 UO42qx6Z8w5VB3pzWTekjxn2oEyyyde1qQ==
X-Google-Smtp-Source: ABdhPJzLlE7thkOJYl6CXtnpMCqca0RNyPmirMO0vN5yx/0w12dGawsA8LfaHs/tGULrbbMduZKKmw==
X-Received: by 2002:a17:90a:c595:b0:1d9:532e:52fd with SMTP id
 l21-20020a17090ac59500b001d9532e52fdmr6542620pjt.79.1651607576483; 
 Tue, 03 May 2022 12:52:56 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 71/74] target/rx: Consolidate exception helpers
Date: Tue,  3 May 2022 12:48:40 -0700
Message-Id: <20220503194843.1379101-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace 5 helpers with 1.  Store pc before raising
privileged and undefined instruction exceptions,
which means we don't need to use tcg unwinding.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/helper.h    |  6 +-----
 target/rx/op_helper.c | 25 ++++---------------------
 target/rx/translate.c | 23 +++++++++++------------
 3 files changed, 16 insertions(+), 38 deletions(-)

diff --git a/target/rx/helper.h b/target/rx/helper.h
index ebb4739474..e6763b5a90 100644
--- a/target/rx/helper.h
+++ b/target/rx/helper.h
@@ -1,9 +1,5 @@
-DEF_HELPER_1(raise_illegal_instruction, noreturn, env)
-DEF_HELPER_1(raise_access_fault, noreturn, env)
-DEF_HELPER_1(raise_privilege_violation, noreturn, env)
+DEF_HELPER_2(raise_exception, noreturn, env, i32)
 DEF_HELPER_1(wait, noreturn, env)
-DEF_HELPER_2(rxint, noreturn, env, i32)
-DEF_HELPER_1(rxbrk, noreturn, env)
 DEF_HELPER_FLAGS_3(fadd, TCG_CALL_NO_WG, f32, env, f32, f32)
 DEF_HELPER_FLAGS_3(fsub, TCG_CALL_NO_WG, f32, env, f32, f32)
 DEF_HELPER_FLAGS_3(fmul, TCG_CALL_NO_WG, f32, env, f32, f32)
diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index 6ab7b070bd..f2b58bcad5 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -428,19 +428,12 @@ void raise_exception(CPURXState *env, int index, uintptr_t retaddr)
     cpu_loop_exit_restore(cs, retaddr);
 }
 
-G_NORETURN void helper_raise_privilege_violation(CPURXState *env)
+G_NORETURN void helper_raise_exception(CPURXState *env, uint32_t index)
 {
-    raise_exception(env, EXCP_PRIVILEGED, GETPC());
-}
+    CPUState *cs = env_cpu(env);
 
-G_NORETURN void helper_raise_access_fault(CPURXState *env)
-{
-    raise_exception(env, EXCP_ACCESS, GETPC());
-}
-
-G_NORETURN void helper_raise_illegal_instruction(CPURXState *env)
-{
-    raise_exception(env, EXCP_UNDEFINED, GETPC());
+    cs->exception_index = index;
+    cpu_loop_exit(cs);
 }
 
 G_NORETURN void helper_wait(CPURXState *env)
@@ -452,13 +445,3 @@ G_NORETURN void helper_wait(CPURXState *env)
     env->psw_i = 1;
     raise_exception(env, EXCP_HLT, 0);
 }
-
-G_NORETURN void helper_rxint(CPURXState *env, uint32_t vec)
-{
-    raise_exception(env, EXCP_INTB_0 + vec, 0);
-}
-
-G_NORETURN void helper_rxbrk(CPURXState *env)
-{
-    raise_exception(env, EXCP_INTB_0, 0);
-}
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 62aee66937..ddf31afb11 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -156,6 +156,13 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
+static void gen_raise_exception(DisasContext *ctx, int vec, bool advance_pc)
+{
+    tcg_gen_movi_i32(cpu_pc, advance_pc ? ctx->base.pc_next : ctx->pc);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(vec));
+    ctx->base.is_jmp = DISAS_NORETURN;
+}
+
 /* generic load wrapper */
 static inline void rx_gen_ld(unsigned int size, TCGv reg, TCGv mem)
 {
@@ -234,7 +241,7 @@ static int is_privileged(DisasContext *ctx, int is_exception)
 {
     if (FIELD_EX32(ctx->tb_flags, PSW, PM)) {
         if (is_exception) {
-            gen_helper_raise_privilege_violation(cpu_env);
+            gen_raise_exception(ctx, EXCP_PRIVILEGED, false);
         }
         return 0;
     } else {
@@ -2261,23 +2268,15 @@ static bool trans_RTE(DisasContext *ctx, arg_RTE *a)
 /* brk */
 static bool trans_BRK(DisasContext *ctx, arg_BRK *a)
 {
-    tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
-    gen_helper_rxbrk(cpu_env);
-    ctx->base.is_jmp = DISAS_NORETURN;
+    gen_raise_exception(ctx, EXCP_INTB_0, true);
     return true;
 }
 
 /* int #imm */
 static bool trans_INT(DisasContext *ctx, arg_INT *a)
 {
-    TCGv vec;
-
     tcg_debug_assert(a->imm < 0x100);
-    vec = tcg_const_i32(a->imm);
-    tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
-    gen_helper_rxint(cpu_env, vec);
-    tcg_temp_free(vec);
-    ctx->base.is_jmp = DISAS_NORETURN;
+    gen_raise_exception(ctx, EXCP_INTB_0 + a->imm, true);
     return true;
 }
 
@@ -2318,7 +2317,7 @@ static void rx_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     ctx->pc = ctx->base.pc_next;
     insn = decode_load(ctx);
     if (!decode(ctx, insn)) {
-        gen_helper_raise_illegal_instruction(cpu_env);
+        gen_raise_exception(ctx, EXCP_UNDEFINED, false);
     }
 }
 
-- 
2.34.1


