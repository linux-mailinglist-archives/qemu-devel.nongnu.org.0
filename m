Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D8942A970
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:30:42 +0200 (CEST)
Received: from localhost ([::1]:39478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKfo-0003TF-T0
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXc-0006GU-5L
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:12 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:35758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXa-00044r-Dz
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:11 -0400
Received: by mail-pf1-x433.google.com with SMTP id c29so18108pfp.2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Quiv5vbH7lzjgQxwPWoCohOnwSfDfP+7M3aharRivYE=;
 b=BGUlTWZFIMtS2cP2U1v0WA/iPHhT200xg8xmNDLyy79QcXDlbLfRnIpa9EM6z90vlm
 g3F3jicLEeBJfTXhL8UrtmFxL01AR3yJUzNodlOuhVzwJiIkZDILmAG389eRKW2GjISL
 PMVsqz51co9HmW5flaq6MnXmMwQbqXch7Nq0Dg/Qy1aCzyWQEJhML1nuuJTB1RtEnY0f
 w0Ni+eMc1ivfTD++Lj+npriWHK4okX3coWOsdMdk4HvKyC6wH/7IL38Qza8XL/QUlT7b
 LqzweDASW3fv/XUdM7KrYxZfITZFJLwAAMEX+g+B+CmCiwI9IO3P6EC2f8L+gLwbnQl0
 DIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Quiv5vbH7lzjgQxwPWoCohOnwSfDfP+7M3aharRivYE=;
 b=DzxWV8PGvoJTPr2ApzsIcUCAaqW+UjAFvs9p69DkM1/6Ip1wntCl7Ku7f0UUtwVt24
 voOh0Uzb4jBVy2LWkvxyEezTVl0C7BiT8EhHdKwyHaa46O8dURtZ6PslL4IjJxUTCvJ3
 QD65MvN8yIWgnqOrMWKVjmAQTgFNPq/S+2sMDXitLyez52OPzFs9/eKo1wiKog4sL4x6
 FI/Qu5NtkgknJY73Z6WNGz6Z2yp2isf24gN/YR/8XEIjL5vmasdZJPfP2sN06RUipET4
 GakhveInukyXevO3e6G5mpGM1biQJqJM+CymWHSc2kTgzMyhEXoQcgtNYOvTucS487BL
 QiRw==
X-Gm-Message-State: AOAM530ZRxh8Smy/udQ4gKZFhvm7NH3gpsa1y6sMT85QEZ0xiabJxU4w
 qWKhEBpJQCmaNTxwuruVXpFSr3bpzllOPw==
X-Google-Smtp-Source: ABdhPJwggJJs7t0tXaZvB3Fz7fmShjP7AWgqFkOEYxAOXy7dD/nd7WeQLQ28Kvj6U6MBNT8mHFeIwQ==
X-Received: by 2002:a63:e041:: with SMTP id n1mr24109530pgj.211.1634055728090; 
 Tue, 12 Oct 2021 09:22:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/23] target/i386: Drop check for singlestep_enabled
Date: Tue, 12 Oct 2021 09:21:45 -0700
Message-Id: <20211012162159.471406-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/helper.h          | 1 -
 target/i386/tcg/misc_helper.c | 8 --------
 target/i386/tcg/translate.c   | 4 +---
 3 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index 574ff75615..ac3b4d1ee3 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -56,7 +56,6 @@ DEF_HELPER_2(syscall, void, env, int)
 DEF_HELPER_2(sysret, void, env, int)
 #endif
 DEF_HELPER_FLAGS_2(pause, TCG_CALL_NO_WG, noreturn, env, int)
-DEF_HELPER_FLAGS_1(debug, TCG_CALL_NO_WG, noreturn, env)
 DEF_HELPER_1(reset_rf, void, env)
 DEF_HELPER_FLAGS_3(raise_interrupt, TCG_CALL_NO_WG, noreturn, env, int, int)
 DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, int)
diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index baffa5d7ba..5769db5ace 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -110,14 +110,6 @@ void QEMU_NORETURN helper_pause(CPUX86State *env, int next_eip_addend)
     do_pause(env);
 }
 
-void QEMU_NORETURN helper_debug(CPUX86State *env)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = EXCP_DEBUG;
-    cpu_loop_exit(cs);
-}
-
 uint64_t helper_rdpkru(CPUX86State *env, uint32_t ecx)
 {
     if ((env->cr[4] & CR4_PKE_MASK) == 0) {
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index c8d919bc3f..e9e1451540 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2660,9 +2660,7 @@ do_gen_eob_worker(DisasContext *s, bool inhibit, bool recheck_tf, bool jr)
     if (s->base.tb->flags & HF_RF_MASK) {
         gen_helper_reset_rf(cpu_env);
     }
-    if (s->base.singlestep_enabled) {
-        gen_helper_debug(cpu_env);
-    } else if (recheck_tf) {
+    if (recheck_tf) {
         gen_helper_rechecking_single_step(cpu_env);
         tcg_gen_exit_tb(NULL, 0);
     } else if (s->flags & HF_TF_MASK) {
-- 
2.25.1


