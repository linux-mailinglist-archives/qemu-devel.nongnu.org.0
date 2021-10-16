Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3905430454
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:43:11 +0200 (CEST)
Received: from localhost ([::1]:51638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboeF-0005KT-2t
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDd-0008Oh-ST
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:42 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:35539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDZ-00028Z-6w
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:41 -0400
Received: by mail-pf1-x433.google.com with SMTP id c29so11290857pfp.2
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NPB1z8UtX5ACFEzlMyiCpvPuDGWU/IxFEL5YV3sYj1g=;
 b=pZKoSadMtZuDgOlG3iJWU9aXVDuenSOHw3S60UuJDbNzOihAZhmfuA5k24TVTHHadk
 Bnk4WvRze5K2nCj9J8hSN9uL3DkaPDzjdPj6kWxjgLSgrmnXZI8yIahxr1DrIcNz+NQ7
 FLjKSZ3CITKjOFdA1r77ujA2ntsXN6D1537p3c1maoy/TZ4Yj8sQY7zhTFS9ZzKiwVOR
 epkRtVFLxBDHgcdWZEtz6SPKnYucnUIzLLMGD5mHz83/goXvs0rqKhXaEZ5Ap09FaxdB
 zIv5J6QCBEz3OIXTUMOj7FikvR62PzGRLuimUa0hO1Y+quaH7Uj0WKannTaE+AxuqzGm
 7vCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NPB1z8UtX5ACFEzlMyiCpvPuDGWU/IxFEL5YV3sYj1g=;
 b=zrZHE51QOinxyqMeUNwbiZbOZFhcZMxb6xy5m56FFihsuqA9QlDDVsUVxT6y3y4B5a
 XE/j17bxcGZ7SUKDnrF36Y80IGoPmhzh66BkccqypFl57tt+mV+9qs1h2uHLCm1HmKlx
 9BBAsBDzGpIAN7C9AQFFt5EqNOuqlU/joH0ZYU8A8qqLTIp3GWH0G3F7s1mf6ItWUEXd
 r4CunNpWHVHzezrm6b5rXrJWiANqPHSMaCDOSmjjMsipXAMIEyDSklF84/AxU1sTN5en
 STSYC0uhE5YeOcD5RCg45KtiV27sHOL5qaYGnEcn/96a5X2cVt+KnT2XyqYGzyIBBPfp
 xBTg==
X-Gm-Message-State: AOAM532RqYsW2Dt9PFAkAtGVgoc9aNh3yPfcCAOdYuFC1bjCodEJQH6R
 uHz/NREjUlIhcYyL5FzrbXHR+5KSBZ2GFQ==
X-Google-Smtp-Source: ABdhPJxWj6d/lv1tsx/6E7l68IAukl4EizDhcDt+FFMh6zANh95o/0mGfttlKO35eAlzRlYQH9CWjg==
X-Received: by 2002:a05:6a00:214d:b0:44d:35e9:4ce2 with SMTP id
 o13-20020a056a00214d00b0044d35e94ce2mr18997912pfk.13.1634408135755; 
 Sat, 16 Oct 2021 11:15:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/24] target/tricore: Drop check for singlestep_enabled
Date: Sat, 16 Oct 2021 11:15:12 -0700
Message-Id: <20211016181514.3165661-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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


