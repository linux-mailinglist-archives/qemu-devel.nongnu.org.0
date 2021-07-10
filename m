Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B683C3533
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:37:05 +0200 (CEST)
Received: from localhost ([::1]:58128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2F2O-0002j6-5c
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExQ-0005G2-Rn
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:56 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:38564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExP-0002Hi-7P
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:56 -0400
Received: by mail-pl1-x62e.google.com with SMTP id u3so1515796plf.5
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k3KB/Tkz24jiJG0J6xu6GsoVxf3biKKstX86Aezy0Ms=;
 b=AAe2sx0hx4GS4/VBdE075MymUp8Qz5UJSVBAjFBiEr3m3w1MxwFbfhekwxil/9MQF0
 se2uwvnOIhg9TG+SGybufMzOZiCzJZOzzeqwh6UvAYGf85lAS8yyiSq9Rtxh+tCWFkG8
 t3VEXz764DczZqVCqwHufQV28LFpIac/wEsdVaIGmR+MMlcVxG+skbOdjyghz0gyWG0U
 u1/ByyX9+wQNmK/5SZQdVpBHGkYFO2jSks6b6st2/uXVMmOeSJMkT8nuaIjj3Tp7ezIT
 EHpkw/He+rz5Zuq5MaptgW0Dhvwtkw1FCT75r4CGlAvSwyxxhu1ZJO7pVunZvwHIHlvx
 H4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k3KB/Tkz24jiJG0J6xu6GsoVxf3biKKstX86Aezy0Ms=;
 b=QoDfDY2Q5TLQJd4d2kZntdUiEjMhkICPakNNLj5++k+ION3YH+GVjFJW3PGXeEZ9eG
 IHpKLkgXOXsEEb6//4nLt6kIeqhvV5yvxGYlnCgT1DI7ye7uSGRqneH0Jo0/XbI9rG/Z
 5zolIHrWHODOOabdMXKnHnSTkjxlTe9+5scipgheVyHjrL2+YmyprNckYEHLZv4VeLl4
 pdKbPsTPKXQ9VzsLZ5AhkGFxF8Xe/Gh3GWbBjH3aNemwPb8CJQADdZ5LkLf9YmQfmhYQ
 z7w9lEXK77FpJb5F8T4Mp4EpgmkT0IQo6ajoxTwbe6IJmEDxDQU82ZzI4ZHa7rBnAs6G
 YheQ==
X-Gm-Message-State: AOAM533ROY4aPqFmWP2uE2AzOAfp2Xc74cxRkbyURDM8m/esD9ERJJ+B
 tZ7G//9IBKvZupKWXQhqULN04JD40hsQGw==
X-Google-Smtp-Source: ABdhPJw48/e79ptC4n8lLF0VM9ZVqYXwyUgcNaQIz1zBozJfopB+W0NQPe8WTl1mVuAIXTv+x+Molg==
X-Received: by 2002:a17:90a:4e4a:: with SMTP id
 t10mr44057558pjl.173.1625931113917; 
 Sat, 10 Jul 2021 08:31:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/41] target/avr: Use translator_use_goto_tb
Date: Sat, 10 Jul 2021 08:31:15 -0700
Message-Id: <20210710153143.1320521-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Single stepping is not the only reason not to use goto_tb.
If goto_tb is disallowed, and single-stepping is not enabled,
then use tcg_gen_lookup_and_goto_tb to indirectly chain.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index c06ce45bc7..8237a03c23 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -1083,14 +1083,17 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
     const TranslationBlock *tb = ctx->base.tb;
 
-    if (!ctx->base.singlestep_enabled) {
+    if (translator_use_goto_tb(&ctx->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(cpu_pc, dest);
         tcg_gen_exit_tb(tb, n);
     } else {
         tcg_gen_movi_i32(cpu_pc, dest);
-        gen_helper_debug(cpu_env);
-        tcg_gen_exit_tb(NULL, 0);
+        if (ctx->base.singlestep_enabled) {
+            gen_helper_debug(cpu_env);
+        } else {
+            tcg_gen_lookup_and_goto_ptr();
+        }
     }
     ctx->base.is_jmp = DISAS_NORETURN;
 }
-- 
2.25.1


