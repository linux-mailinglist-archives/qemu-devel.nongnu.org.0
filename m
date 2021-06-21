Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7983AE184
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:44:49 +0200 (CEST)
Received: from localhost ([::1]:35830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv8zY-0006TD-H9
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8q1-0003ss-NX
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:00 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:34592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pu-0005CP-0u
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:54 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso9328379pjx.1
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qHC3jVIB4e+/pVCBe7FuoNbsxTyhoj4fhboHXtuba70=;
 b=EDUnLdsHnQS5QT/SVyv+z47A8UMpFKRqMphRK/WxJNuQAp53zJVKluEUsEjcRS546C
 J9XSL0cWBYIhi0Fvgs/eEz54B4nlSqXQI1ugtVRVP6UwEf9K88D+KbGK63v8WH4Jdeh+
 XS+yi12bw7kC/TCVgBVKfVXhZ563KZxQutFlZUMh1C3RJOjh0l3S6A2beRTV4luN6sCS
 QeINN0FATNWCJ26YscchYz1qyx8GjIGfHTV2s9vYCnqHY28/Q487W4W2lvx7IxCxJfW1
 ocbLavUpwH5PISd7TGHWJs1d6QzjoFTFO4pn+YepKUH4FUj9B3eXWgUtsPEh2WoVx7d+
 V6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qHC3jVIB4e+/pVCBe7FuoNbsxTyhoj4fhboHXtuba70=;
 b=UrJ2PGJ0UdFXwLjJRIWucc5lMjn2bpxfVS9w6+tO5HEKzAoleXTOUZDGwPLwOgnaFs
 EO9TRaUyurzhzMGuXKtqb06D9AdN4rYVYQbCcynYt8v2s/cSR6NjJ5vG3o8s/9YZYDbX
 bVxYrJUTIZ0syo5WDBwYRISjTELmbvsl8+M34IwHof7NVrxCbT8utSRDApnYUMu6mDfg
 hmFYwJkonSHY9QSICC05RTg3XT7y9EYYDx7WJE8K1i4tXOAQAss+5JJY/p/IC8XQcJht
 UVvJ9faca+GXz8MFEJ2G/0UYllstR0WrcEIrB4hBqpqJt+qVlEIOpRggojOTbpmlnuUI
 KDpQ==
X-Gm-Message-State: AOAM530/iuX3qM7poGcbpzYC3Pr0rZUeCOKTmw31ABJh9Dy3AUEotZzK
 wfZ9boh/wGOLqA7lqpjnR3jT9lb3sgF+pA==
X-Google-Smtp-Source: ABdhPJwW0HROuVjO+RN0vaztdSGv/XWB2JoYtmPd9BnYq1KKZFqL01Qumb6/pEJbZ6LYaVJRUGs4fg==
X-Received: by 2002:a17:902:b616:b029:ee:c73b:163d with SMTP id
 b22-20020a170902b616b02900eec73b163dmr15619647pls.30.1624239288490; 
 Sun, 20 Jun 2021 18:34:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/26] target/mips: Use translator_use_goto_tb
Date: Sun, 20 Jun 2021 18:34:26 -0700
Message-Id: <20210621013439.1791385-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 797eba4434..d59986b340 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -5019,22 +5019,9 @@ static void gen_trap(DisasContext *ctx, uint32_t opc,
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


