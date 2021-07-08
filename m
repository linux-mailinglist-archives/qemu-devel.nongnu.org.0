Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACB73C17E4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:13:39 +0200 (CEST)
Received: from localhost ([::1]:51822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Xak-000067-TV
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5M-0001xn-UH
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:12 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:54145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5G-0008Fo-U7
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:12 -0400
Received: by mail-pj1-x1032.google.com with SMTP id p9so3905771pjl.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HmrvZ2YDmFmQRowDiyGgkhSWbFuv8fekjQLGpsBU/NM=;
 b=ICfs3/QbHJc8lbvq3cYZwYHT+/Pg1j5aWpkA86/pSkobvukWMFrHeA5SLs77Xgf87d
 FzlWvkwaX2Nxagzff+zuUx2klIYq9LvmrqUSbAvXCMvMvnL/Ltv8Np1W5Sz2IymoJImb
 +vEAU/LtjNOtXYV+wqwsKxyfffFLA/l1KZzZjyEVqxjqJzqrz72kKWjwjSy0Y6L+go5C
 En/jlPbD4hvXs7ZQJdSHJ/f4Qj8ghKW7wb/vnM4VcStuU4LUc2sqyv1cy+B/VQ8291TK
 9ogQwrRuwY3t0L6saK5zZ1f96bOWn76n+xYpbTsl4LxrA6fUDfv+xAyAnT3oY02pCj57
 3/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HmrvZ2YDmFmQRowDiyGgkhSWbFuv8fekjQLGpsBU/NM=;
 b=bgEgBGvRIfiW9Pm7MIydDQbOiQjOPS750c4FYnQEwUR1/J3gnVFu95hpI7aJdP6ndX
 gN8sT1xahTU9oolGXPpp/IfeeV7BG9VO3B+PIzHRWVFOwygvGx/hukY8WArEIg2fy1Xy
 PuB6R1/bixiNdGdXJwtzN9Di44Kac6P7Z4YsM1QAQxkFNVKaJmCzR2vSVC79CYxdMK8K
 9CVV1cdrTdyrPuHGXZspIS/dUghN3XjOrbNT6SBTdOf6LKNVHHkUHsF6uIZi7eTpQZh0
 FFzkEdylMakeijT9+WdMuvdUvIpOJiuQOM8J6K2Gr6K+38KGyMepIpGP45WQems3gfhr
 YOkA==
X-Gm-Message-State: AOAM5321O/Qq5/8DSkdDV2X+ZtFRtxcCF2LN4iVXDdmx77npN6HH0sNb
 J4FeU5Ur4gSvoaFVpUJmJ71N+TL3FLzbnA==
X-Google-Smtp-Source: ABdhPJwCdqLNjplMSuYjuJCfgUsjCFNoAqUb6xw3QetblLCamOjsQfIKKlUFzk6iK96z9kpocMdpeA==
X-Received: by 2002:a17:90a:780c:: with SMTP id
 w12mr5747940pjk.42.1625762465613; 
 Thu, 08 Jul 2021 09:41:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:41:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 26/28] target/tricore: Use translator_use_goto_tb
Date: Thu,  8 Jul 2021 09:40:48 -0700
Message-Id: <20210708164050.711967-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 2a814263de..09465ea013 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -3225,19 +3225,6 @@ static inline void gen_save_pc(target_ulong pc)
     tcg_gen_movi_tl(cpu_PC, pc);
 }
 
-static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
-{
-    if (unlikely(ctx->base.singlestep_enabled)) {
-        return false;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    return (ctx->base.tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
 static void generate_qemu_excp(DisasContext *ctx, int excp)
 {
     TCGv_i32 tmp = tcg_const_i32(excp);
@@ -3246,9 +3233,9 @@ static void generate_qemu_excp(DisasContext *ctx, int excp)
     tcg_temp_free(tmp);
 }
 
-static inline void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
+static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
-    if (use_goto_tb(ctx, dest)) {
+    if (translator_use_goto_tb(&ctx->base, dest)) {
         tcg_gen_goto_tb(n);
         gen_save_pc(dest);
         tcg_gen_exit_tb(ctx->base.tb, n);
-- 
2.25.1


