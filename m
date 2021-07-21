Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2212C3D094C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:59:26 +0200 (CEST)
Received: from localhost ([::1]:59910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m66CT-0000Uk-5a
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vz-0005DX-70
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:23 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:35832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vw-0005hP-8L
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:22 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 gp5-20020a17090adf05b0290175c085e7a5so3452127pjb.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZjR+I5E2mfbwjMd9wQ1dGRQB0TRr29G+cbMBcP2brug=;
 b=YaRsGTylcyAtcJL8SFLipifeGMKUCxhNmRL3+TeLDl4RlZdNunUida6vM4qZ6OCITG
 5hxV5vgStfkvlKnZPG1wtqvtuUkhEdOsG7KHjitCruDxpV/7o5xudehEC6aOqw2fwBud
 PvjmD3D6vfYtmNCPHOXm93M+Zq6uPuugTPppuasEkvSvOy2gm0Us8D5DrLf3sRY/Ecr3
 pSgPpWXSlIYLUX8l7CHMblW3O/raLQHm8ALpSasMy0qoONpWJk7C6qbFsJTJpSn4H8zW
 sNUDLyM29VMY8zefG6IA274XH4fRyk28mafL6E3xDahrt8sYAlk5sk1aTYs+zK78ccKH
 UKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZjR+I5E2mfbwjMd9wQ1dGRQB0TRr29G+cbMBcP2brug=;
 b=C1Xw4/KmtZxOTMhEAAy8JRVb4imfYByS45u9cFAX1vK4RBh2j9VSGn3PReLVvbap15
 pGs12cGA0mi2nKs0Y7ORWO/MQErGIsdYQEdn2F7o2y1w6H4556zFs3PNIDBCGtfA2tb0
 34b7bfMc8Uub6wMTjM9uy3GPhmlhpJPO50+j3QBIQ87cToxxvmOUVVawBexIpe3kTYx2
 HMSbXb5mqAIZcPey9RxOg1/Yu4NCeUTjOO3L2UMMGYrPPt48fyP9DHSS3BBo1bDbDUI0
 w/HldCVUqSLIRAG57lhzygX3h2JyEvy3G8OPKnINKhmWOWWWUdOqXm+sXjUCc5IfpO9g
 c/cQ==
X-Gm-Message-State: AOAM5335xHIKLC56W4LEVanp4Wz+3jLJfBkg5ee+O7Pacy1Y1ybnhebb
 KA++ljNylBiWrBnlW0M/4bV4QT7USAkf7Q==
X-Google-Smtp-Source: ABdhPJzi3euvKGGk6fseyp3Gf5VC7c9GRIIvs1mx4G/nf2NTliphCFaK80oEMM4QUUE7Q6UFePY7eA==
X-Received: by 2002:a17:90a:fb93:: with SMTP id
 cp19mr33210543pjb.30.1626849739042; 
 Tue, 20 Jul 2021 23:42:19 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.42.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 21/23] target/sh4: Drop check for singlestep_enabled
Date: Tue, 20 Jul 2021 20:41:53 -1000
Message-Id: <20210721064155.645508-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

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
index 8704fea1ca..3ce35b9e4c 100644
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


