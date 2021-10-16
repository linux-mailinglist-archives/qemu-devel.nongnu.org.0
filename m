Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABAF43043F
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:40:02 +0200 (CEST)
Received: from localhost ([::1]:48226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbobB-0002tu-Ly
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDd-0008Og-PV
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:43 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:53835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDZ-000288-0G
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:41 -0400
Received: by mail-pj1-x102d.google.com with SMTP id ls18so9474594pjb.3
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lhm3i8dv7cISRiranLLYJSVbRTBKDG8gMQNChvdAMxQ=;
 b=mjBe4AvojHNphU2EhVIpblqpmvIIvhh8Dy3jl44UciNGaAvjSho5NRTn9GSOP4XvOv
 jt7FMnETzOxLLqpDxIWua/CCLrRrO7wp+fxkizZ17QSCstHfDdS1l6SyVaONnfGkk5+o
 ecWeQIsNU/I2IXpK+ENVEve5s/fDHwO2zIJADbEMofu/FQnDtk+gvXB6nQ4uAzvuGL/P
 AmFrDfQxVg7ZxGpB4WKVZPj43d8f2ASsgHuNTDUbvPoviwdApTrTOFnWzPazNhHEkSO3
 O2eVU5DBcbegk9bOZ5tvuyRselFzmz9/azcUyYuA3hGZv8S05zvvBDdexc37XzBVjp2P
 l3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lhm3i8dv7cISRiranLLYJSVbRTBKDG8gMQNChvdAMxQ=;
 b=SRt2W4Ceh9FiIhCzQt2HltWpQBO1npWQ5iuXbojGHLXkgjE0o029YJf+44OazG0XeK
 7H0YX17Yr7J6A1j2a5aoV3GXhNs2L2qDVyj757roCnaRzxQG+domJqNQ5fdqPUVMDrlO
 W1fnR0H/OPXoucOie5bDg5EVAjIdjSiHVBHTeUnGkW7FO/30/Gf7Krwj2tQ/eE+Wj5fc
 NR+cYsROPNrZcAXk5lYGDOj+jnLHJF1W+m9nyAj7McYceZ6fqd0fEtkU88K9Fb+i/01h
 IUnThQj/E0iTlvCSGGf3aYY6dFoaIDfvJ5Oo5OLDptDOh/phXQN9r96cHsDKY5NaLkf5
 V51g==
X-Gm-Message-State: AOAM532e6s2P/H6cVXa35EG5kqvJ0ec8aFPWAZNfD1k2Sx/NlTy30KEa
 Llr4U1Ez2W2FFyNsnmp1ynZ0m7DM+QPPKA==
X-Google-Smtp-Source: ABdhPJw97mG8UdFCO6aeVaH7V+j1iF578vrxPjXRaYStftzcD4ldZ4SEL2d+hZHBZGJxAwZD0/EPTw==
X-Received: by 2002:a17:90b:4d08:: with SMTP id
 mw8mr12513619pjb.96.1634408134868; 
 Sat, 16 Oct 2021 11:15:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/24] target/sh4: Drop check for singlestep_enabled
Date: Sat, 16 Oct 2021 11:15:11 -0700
Message-Id: <20211016181514.3165661-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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


