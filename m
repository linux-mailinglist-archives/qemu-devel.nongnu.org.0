Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AE642A998
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:36:56 +0200 (CEST)
Received: from localhost ([::1]:56766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKlr-0006qA-CM
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXk-0006nL-Ue
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:20 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:45606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXi-0004C4-Uw
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:20 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so2983778pjb.4
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lhm3i8dv7cISRiranLLYJSVbRTBKDG8gMQNChvdAMxQ=;
 b=u9MUfGtAqEYcv+bFp8Rll9r7+CUk2XRXOHpF52nsbrmw13/E41iLrk6OKkkZCE4VUF
 gQk2eEFX3hHXrGmJXBtwCgpKVybWtx64seE0SEuJ9QZHxFfFm4x4fP9xLAVzRPB3jPE8
 I3k5p/2z/BKpOM1PF56rHAWoP1woVcoBHRCVuWmyZ+TU+HFG+29+caASrdR0Av6G3jaJ
 4D0PaU0WqT2sba9ln7YFhpJOOABYe/m7chrAwKnynzSTtd9NjNeHacBob++y0XSaCgXU
 mR2vfC4BmjoqVXdAIoZwgpx1P+HS9RlmZ/A54IK27gCQe03kS52GOZ/PrUgroCMytqcA
 rsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lhm3i8dv7cISRiranLLYJSVbRTBKDG8gMQNChvdAMxQ=;
 b=um/VEybKdZk1JEGpewex9zRunvzpQKw99dFM5heO5NkJyLKN5WuolT5MGR6FE6wt52
 KzaZseMhQf+naxQNQJoYzXbTYWBHq4JxxpK8mketxchsObjym+mgno6u21xmm1cSc+mo
 VwEx+UQltxTSKjFymOhtZNZUpsEVQ4C2FT/w3pWW/J7yyuRJqusIHjM/lr6XmoCV7b7O
 WYiblGQdt2O2M1hPV9T+FJZi0o3C753WjxRhO/788/n9PoKn/tkq/RCYifn58TIjLQm3
 pnmbZ4PUHDjv9kmq835UoG2nfWd+HArbODfvTu2D6iiNxdQetsymyJKqJMZjAXV57jCr
 eDSw==
X-Gm-Message-State: AOAM533q1GLaGlIdKBFAeNzFXur7WB1VDD0wFxD8h5YXhXwps4ri5RBX
 hCBV+7YdbGmuRgPSWxXKxXyJVgS5NF0oDQ==
X-Google-Smtp-Source: ABdhPJyy1gLwLvUKlzDsspFyE4Cl7GNSsLII0IWr9uEmj9KLwJQvlJQXCyGyD3ZYHW/fbw9L3K3P/w==
X-Received: by 2002:a17:902:a3c9:b0:13e:2e41:2a76 with SMTP id
 q9-20020a170902a3c900b0013e2e412a76mr30858364plb.43.1634055737525; 
 Tue, 12 Oct 2021 09:22:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/23] target/sh4: Drop check for singlestep_enabled
Date: Tue, 12 Oct 2021 09:21:57 -0700
Message-Id: <20211012162159.471406-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/helper.h    |  1 -
 target/sh4/op_helper.c |  5 -----
 target/sh4/translate.c | 14 +++-----------
 3 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/target/sh4/helper.h b/target/sh4/helper.h
index 1e768fcbc7..8d792f6b55 100644
--- a/target/sh4/helper.h
+++ b/target/sh4/helper.h
@@ -3,7 +3,6 @@ DEF_HELPER_1(raise_illegal_instruction, noreturn, env)
 DEF_HELPER_1(raise_slot_illegal_instruction, noreturn, env)
 DEF_HELPER_1(raise_fpu_disable, noreturn, env)
 DEF_HELPER_1(raise_slot_fpu_disable, noreturn, env)
-DEF_HELPER_1(debug, noreturn, env)
 DEF_HELPER_1(sleep, noreturn, env)
 DEF_HELPER_2(trapa, noreturn, env, i32)
 DEF_HELPER_1(exclusive, noreturn, env)
diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
index c0cbb95382..c996dce7df 100644
--- a/target/sh4/op_helper.c
+++ b/target/sh4/op_helper.c
@@ -81,11 +81,6 @@ void helper_raise_slot_fpu_disable(CPUSH4State *env)
     raise_exception(env, 0x820, 0);
 }
 
-void helper_debug(CPUSH4State *env)
-{
-    raise_exception(env, EXCP_DEBUG, 0);
-}
-
 void helper_sleep(CPUSH4State *env)
 {
     CPUState *cs = env_cpu(env);
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index d363050272..ce5d674a52 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -240,9 +240,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         tcg_gen_exit_tb(ctx->base.tb, n);
     } else {
         tcg_gen_movi_i32(cpu_pc, dest);
-        if (ctx->base.singlestep_enabled) {
-            gen_helper_debug(cpu_env);
-        } else if (use_exit_tb(ctx)) {
+        if (use_exit_tb(ctx)) {
             tcg_gen_exit_tb(NULL, 0);
         } else {
             tcg_gen_lookup_and_goto_ptr();
@@ -258,9 +256,7 @@ static void gen_jump(DisasContext * ctx)
 	   delayed jump as immediate jump are conditinal jumps */
 	tcg_gen_mov_i32(cpu_pc, cpu_delayed_pc);
         tcg_gen_discard_i32(cpu_delayed_pc);
-        if (ctx->base.singlestep_enabled) {
-            gen_helper_debug(cpu_env);
-        } else if (use_exit_tb(ctx)) {
+        if (use_exit_tb(ctx)) {
             tcg_gen_exit_tb(NULL, 0);
         } else {
             tcg_gen_lookup_and_goto_ptr();
@@ -2324,11 +2320,7 @@ static void sh4_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     switch (ctx->base.is_jmp) {
     case DISAS_STOP:
         gen_save_cpu_state(ctx, true);
-        if (ctx->base.singlestep_enabled) {
-            gen_helper_debug(cpu_env);
-        } else {
-            tcg_gen_exit_tb(NULL, 0);
-        }
+        tcg_gen_exit_tb(NULL, 0);
         break;
     case DISAS_NEXT:
     case DISAS_TOO_MANY:
-- 
2.25.1


