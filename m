Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFD742A9D5
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:43:56 +0200 (CEST)
Received: from localhost ([::1]:44342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKsd-0001CP-SG
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXm-0006sw-DX
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:22 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:40728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXj-0004CS-O9
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:22 -0400
Received: by mail-pl1-x62d.google.com with SMTP id v20so6774646plo.7
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lWWxg8MR6KKJ1tBQpQnAGh32uFzHWDCE77XSSdScV5I=;
 b=kfdVtP6RD4L9n8aInOd1qojHZTDc8MshQLR3Uc2IkKwBjwPzDINwZEZW31t243xRA+
 3t97Yg136Yp4uM/qBk53eHHk5kGUCDCF/yp8JAV/dP6HxGMeYg9eRQse8EtfZ6G32j8P
 bTm4F83Wpfxa6F18Ki8Wl5kyjNT+aZuWMXlzxUypUnhSa1oRYdz0FRXZKGn2oHY4PSfb
 HkPIkVJTSEIy8EVk+Y0QUXtgJqmWlflDvqMYLNgN7o+sGEH069yFwzB3dcMMbNV9giEt
 g0HvfTAfqysXMGy51BUqp70LaNIa7n+xojXwPath9inhks+0Te2a5hhNXeIH7eaGagTn
 vVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lWWxg8MR6KKJ1tBQpQnAGh32uFzHWDCE77XSSdScV5I=;
 b=RXOVoc0faDRE84SYJA6EAbfkt8O/9tbvioHeNPT6VfC94pi7S7TuI2fHkqoXLuCWK3
 Wco8hi9C5WOG32OqXShP7UsfZE//k7N6RDDcL2lPz/8ZutTY5CmJ2PDJ4rDCf5/ot4mR
 hYMguTn3ok9jfApo4rEw0NGvbUQaN7cpeUSh3a+yWUiThpi0iIBlj64LLT2iQyp7ulxz
 Bu2fzKphawy1jZzlm35KLFX9smFQX7WOEtJj7c98Z3YCj994BlYHPcFYa6mti4iwPAdd
 dylWg6U/RGEGTIwPH2xqehIH33QY982D0m/E8oLbJ6qMKHnQeEjxhVSPKjheWlLbvYVI
 jqUw==
X-Gm-Message-State: AOAM530yqweLt8MwG4zt35J58XR2JvtmKx9vn2QKDf1xnaf0R0SJd3Wq
 YZKjmVSpb2DfiR/q6c7eIhlE53rNseJaCw==
X-Google-Smtp-Source: ABdhPJyTh7VjjvMs1UOcf7oj8TU1uodKMmnISEoD/sUPbSyl7TVsAMfXZOBREKLNS+kCFOsC/obfdA==
X-Received: by 2002:a17:90a:5d8c:: with SMTP id
 t12mr7202898pji.98.1634055738251; 
 Tue, 12 Oct 2021 09:22:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/23] target/tricore: Drop check for singlestep_enabled
Date: Tue, 12 Oct 2021 09:21:58 -0700
Message-Id: <20211012162159.471406-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
 target/tricore/helper.h    |  1 -
 target/tricore/op_helper.c |  7 -------
 target/tricore/translate.c | 14 +-------------
 3 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/target/tricore/helper.h b/target/tricore/helper.h
index 78176aa17a..b64780c37d 100644
--- a/target/tricore/helper.h
+++ b/target/tricore/helper.h
@@ -153,4 +153,3 @@ DEF_HELPER_2(psw_write, void, env, i32)
 DEF_HELPER_1(psw_read, i32, env)
 /* Exceptions */
 DEF_HELPER_3(raise_exception_sync, noreturn, env, i32, i32)
-DEF_HELPER_2(qemu_excp, noreturn, env, i32)
diff --git a/target/tricore/op_helper.c b/target/tricore/op_helper.c
index 32c2bc1699..9476d10d00 100644
--- a/target/tricore/op_helper.c
+++ b/target/tricore/op_helper.c
@@ -107,13 +107,6 @@ static void raise_exception_sync_helper(CPUTriCoreState *env, uint32_t class,
     raise_exception_sync_internal(env, class, tin, pc, 0);
 }
 
-void helper_qemu_excp(CPUTriCoreState *env, uint32_t excp)
-{
-    CPUState *cs = env_cpu(env);
-    cs->exception_index = excp;
-    cpu_loop_exit(cs);
-}
-
 /* Addressing mode helper */
 
 static uint16_t reverse16(uint16_t val)
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index a0cc0f1cb3..07084407cb 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -3225,14 +3225,6 @@ static inline void gen_save_pc(target_ulong pc)
     tcg_gen_movi_tl(cpu_PC, pc);
 }
 
-static void generate_qemu_excp(DisasContext *ctx, int excp)
-{
-    TCGv_i32 tmp = tcg_const_i32(excp);
-    gen_helper_qemu_excp(cpu_env, tmp);
-    ctx->base.is_jmp = DISAS_NORETURN;
-    tcg_temp_free(tmp);
-}
-
 static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
     if (translator_use_goto_tb(&ctx->base, dest)) {
@@ -3241,11 +3233,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         tcg_gen_exit_tb(ctx->base.tb, n);
     } else {
         gen_save_pc(dest);
-        if (ctx->base.singlestep_enabled) {
-            generate_qemu_excp(ctx, EXCP_DEBUG);
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-        }
+        tcg_gen_lookup_and_goto_ptr();
     }
 }
 
-- 
2.25.1


