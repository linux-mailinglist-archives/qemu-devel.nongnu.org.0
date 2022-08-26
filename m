Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 166755A30AE
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 22:57:17 +0200 (CEST)
Received: from localhost ([::1]:52162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRgOA-0005Yf-P3
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 16:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRgMR-0002iz-PT
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:55:27 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:50773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRgMP-00033e-Ul
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:55:27 -0400
Received: by mail-pj1-x1033.google.com with SMTP id t5so2703875pjs.0
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 13:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=nBCtz7PB4cTchcvi0fFpq6V9ay+TdmIULp5h3yuZcPo=;
 b=kl0DtsZs0j2+VeYTmTxQ3D4tzjK5CY0xI9927FvYOSmJjnkuXhA8qaNQ6mMgmu8ttd
 bbhKyXuLUoMpKiWJCr0vKjbYOVucNnmX2ATvXMKG2mWBDeCvFEwmcgmfY1jcngHrVjex
 cpNl3lodfRshZsoiz/9mrno1tB6xAi5oBU6z3k58sqoH8nlKDzopOZviRq3Gro4gZTku
 j9avKrCnxjFd+6zWyUCjfldinCs5/lNokdLjxCUf9LekfUOqAzu9B+EGbuR0iTHqyH7+
 Sk83q+zKEk521efmK1R/3gIYi5qPlHETJGykvEJP/rb+H0X1nXOPqr26+ThIoxM51wMW
 J7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=nBCtz7PB4cTchcvi0fFpq6V9ay+TdmIULp5h3yuZcPo=;
 b=cqH/PHSKJgZhs44H8u/gio2NCaP5IVncO5pEaCBLdVwTBHgNgvCcgZaSvzwA1HP/Go
 1zg4rluFuc/PknOcveH0pjeVsmjqCWXLHVA2ylRlEYe+vseCWdlib+b0YZ0CK+OHLNGu
 wbDNzoEHxUSsK9m6n273sl9cKwrQqykgwADve5j7ZzDPZh7ejygIi74eGh/UQ0ocJDYT
 K8+wz5ssIxPIWukrIVvT6Zr76QltN9zDL4MUEP03l4OaIjKaL2UsFxYlTj3GehuEOLhM
 WN6YoF53t8ucaikJHfTTrNL2rmUTJniwjvEcXZRWA7yPYaNa6rHq1dEPQ54m0jdP9zrR
 bcsg==
X-Gm-Message-State: ACgBeo17t62/DToWdTgihlGeZM1mWGu+igoASTo17iEe9Og7R5eEv5T8
 HHwgfnkZm0nkpC7aImPQaE79ly8O6/ftXQ==
X-Google-Smtp-Source: AA6agR4pIhRIZod6jaCByaUKkyar6aUTBWQwnY/3cHVO3C+vfYdW6fj0rm1nmATeLlOWL1s3dPQHHw==
X-Received: by 2002:a17:903:18b:b0:16e:f09c:919b with SMTP id
 z11-20020a170903018b00b0016ef09c919bmr5367708plg.135.1661547324211; 
 Fri, 26 Aug 2022 13:55:24 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a170902650b00b00172a567d910sm2009900plk.289.2022.08.26.13.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 13:55:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mrolnik@gmail.com
Subject: [PATCH 3/3] target/avr: Disable interrupts when env->skip set
Date: Fri, 26 Aug 2022 13:55:18 -0700
Message-Id: <20220826205518.2339352-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826205518.2339352-1-richard.henderson@linaro.org>
References: <20220826205518.2339352-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

This bit is not saved across interrupts, so we must
delay delivering the interrupt until the skip has
been processed.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1118
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/helper.c    |  9 +++++++++
 target/avr/translate.c | 26 ++++++++++++++++++++++----
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/target/avr/helper.c b/target/avr/helper.c
index 34f1cbffb2..156dde4e92 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -31,6 +31,15 @@ bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     AVRCPU *cpu = AVR_CPU(cs);
     CPUAVRState *env = &cpu->env;
 
+    /*
+     * We cannot separate a skip from the next instruction,
+     * as the skip would not be preserved across the interrupt.
+     * Separating the two insn normally only happens at page boundaries.
+     */
+    if (env->skip) {
+        return false;
+    }
+
     if (interrupt_request & CPU_INTERRUPT_RESET) {
         if (cpu_interrupts_enabled(env)) {
             cs->exception_index = EXCP_RESET;
diff --git a/target/avr/translate.c b/target/avr/translate.c
index dc9c3d6bcc..026753c963 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -2971,8 +2971,18 @@ static void avr_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     if (skip_label) {
         canonicalize_skip(ctx);
         gen_set_label(skip_label);
-        if (ctx->base.is_jmp == DISAS_NORETURN) {
+
+        switch (ctx->base.is_jmp) {
+        case DISAS_NORETURN:
             ctx->base.is_jmp = DISAS_CHAIN;
+            break;
+        case DISAS_NEXT:
+            if (ctx->base.tb->flags & TB_FLAGS_SKIP) {
+                ctx->base.is_jmp = DISAS_TOO_MANY;
+            }
+            break;
+        default:
+            break;
         }
     }
 
@@ -2989,6 +2999,11 @@ static void avr_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     bool nonconst_skip = canonicalize_skip(ctx);
+    /*
+     * Because we disable interrupts while env->skip is set,
+     * we must return to the main loop to re-evaluate afterward.
+     */
+    bool force_exit = ctx->base.tb->flags & TB_FLAGS_SKIP;
 
     switch (ctx->base.is_jmp) {
     case DISAS_NORETURN:
@@ -2997,7 +3012,7 @@ static void avr_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     case DISAS_NEXT:
     case DISAS_TOO_MANY:
     case DISAS_CHAIN:
-        if (!nonconst_skip) {
+        if (!nonconst_skip && !force_exit) {
             /* Note gen_goto_tb checks singlestep.  */
             gen_goto_tb(ctx, 1, ctx->npc);
             break;
@@ -3005,8 +3020,11 @@ static void avr_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         tcg_gen_movi_tl(cpu_pc, ctx->npc);
         /* fall through */
     case DISAS_LOOKUP:
-        tcg_gen_lookup_and_goto_ptr();
-        break;
+        if (!force_exit) {
+            tcg_gen_lookup_and_goto_ptr();
+            break;
+        }
+        /* fall through */
     case DISAS_EXIT:
         tcg_gen_exit_tb(NULL, 0);
         break;
-- 
2.34.1


