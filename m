Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 459073C17F7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:18:16 +0200 (CEST)
Received: from localhost ([::1]:37114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XfD-0000gO-9h
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5F-0001js-KC
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:05 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:43889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5A-0008CH-HY
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:05 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso4172969pjp.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zvxeXohXPpAsGvwu7ALFBTn8vSp6cjjBBPdOsMUtX8A=;
 b=opOX/3kEqlcEcnoFUHUM+zkPlSgsBHo1UySmIqWXgTCEv3hxfw+Nv4MijVwqCSlEfX
 FJb6YoAkz7dTV55p35jEWfH2BIZJSvI/sCcUUjOcfkWzHAkl7GvYgQJ125LmL9t9gK1w
 pyCkXLomiDXEc38TEDB3Daw811DNsgHll1q3JzfURqB71i+pR2f4GZgc5/x+ZAtODOyZ
 lY+5z1V5wYaSTJI2A25nCMgGQiYjhrMUgk9+KVBQO2CZ7iaDv47A0O8OKom2aj//B07V
 oVySRvlVW8iZrSHPyRf3JBPA/ydI19NZj7f2+OSGvOe3lC+3/3d/bOi2Su72VFhZRhNK
 QKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zvxeXohXPpAsGvwu7ALFBTn8vSp6cjjBBPdOsMUtX8A=;
 b=n+/sznICdc8+ewBpOgbOYPEfCKw5RFewsJrQ7gUtRlAUUkjnr6I62TvWhsPR1LYfv7
 gHOhrqSMkkaljP3JSzc9nQR1osQi9THaw9BfvHmBdA7H1qYsb5KwzacyKr5fxy9InneQ
 q6rbq6M9BI/OJsjPtqC5df2r4/QMM10VAiJTGkkkFwDJirO5S5V7wSW0udXPtXiDXWHm
 8s+FD7RAKx8UKw5aVPnmT8aaORSRiGo5i+bMNtz417e2dpE5z8xFduPUiT4tiy1qqWvZ
 yNBC6HAT5gN9SzMK7rjSayNYRxvqMKp6N8nXZ8D03FnMuayHuHOwlLFY72LSNBr/W/ib
 ePsw==
X-Gm-Message-State: AOAM530JynyXimS+e4p3aoieOIiqjMh0ipcErurWRq3CYO1hGwtLr6z7
 eUyFpokPc55857hY/Ght7yWvvtF6QMxcEg==
X-Google-Smtp-Source: ABdhPJyhWSuGz2W1eZE14SqV63FDWcfL5wrkxs3fbyn3/ey0HV+I/899lSB6f3jP1wRJqbud97C1DA==
X-Received: by 2002:a17:903:2345:b029:12a:cfac:3cd8 with SMTP id
 c5-20020a1709032345b029012acfac3cd8mr1040028plh.26.1625762459325; 
 Thu, 08 Jul 2021 09:40:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:40:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/28] target/mips: Use translator_use_goto_tb
Date: Thu,  8 Jul 2021 09:40:37 -0700
Message-Id: <20210708164050.711967-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index ae33c75f08..f22d06952f 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -4948,22 +4948,9 @@ static void gen_trap(DisasContext *ctx, uint32_t opc,
     tcg_temp_free(t1);
 }
 
-static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
+static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
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
-static inline void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
-{
-    if (use_goto_tb(ctx, dest)) {
+    if (translator_use_goto_tb(&ctx->base, dest)) {
         tcg_gen_goto_tb(n);
         gen_save_pc(dest);
         tcg_gen_exit_tb(ctx->base.tb, n);
-- 
2.25.1


