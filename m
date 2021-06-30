Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AAC3B88B3
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:47:54 +0200 (CEST)
Received: from localhost ([::1]:42172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfFZ-0002og-8h
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0q-0005Ju-1K
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:40 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:41920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0n-00023V-Ns
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:39 -0400
Received: by mail-pg1-x52f.google.com with SMTP id m26so3178534pgb.8
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1HJD3JCb9LiRtjNiA/n4zNuSXKpMe99KSR3Hi1PuyQo=;
 b=B4/45vN1alKBnuNUinuR/wim9yW576/vzDaJwEjBTQYfzycPESOo6eod6Dc3Ws7P29
 +GTlvYwBQwkyzPgJbt0D/ayimzSpUIxOkyY0+93cgBo8p6sxZmMOM+w+OIszoZubOHCz
 wRUUl+Oy2RDfrkMNqXR5/8MweENDB2BOujfTpTlFMIdAfYZ0TSB00E6WikdL5w3lDMIm
 HQMEYNiFFzecbjiN5oUOIBXXA2dtWj8abchnrDy1dHsRWLxKtO2X68eQLvUxoFb1AAB2
 HA41381pqzwktExeKIrcFtHkvJELFwsKwQ/wrWAZIwlO3d5qdbwN/0sK6fI78lcQKonb
 KwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1HJD3JCb9LiRtjNiA/n4zNuSXKpMe99KSR3Hi1PuyQo=;
 b=hKVgEQ3UIkF1U7bx7ElkwiZycgNIxd9NzauSlSltzjbUgnKD+KM+11YDhRGVyYqt5V
 GytJ/+CUA4y2i+cBi1genCsEAi8BArhFgOd3tJ6e48hCuVd12MtVn1S9rSe6ltzML9xr
 nN2D38tWa5I3DE4HU+4OEVNEtLIoZ3m/IObGISvUgWbCoilX3G+faCuIdM64K9iZrhFg
 qjLjpSDA+ox45qoSO3Ip9hWcAu4+ax8lCFYomb420v4REaKwYCU6wDmvSWFlIt9iEJhb
 1CZz2rZiTTRKjWyUcnkA0kFbCuLWDbX1+IGLiWGYlTzNSQqqYjSg4pf7CS5QF+++wIYw
 oTXQ==
X-Gm-Message-State: AOAM531aEOndlyC8L2ALlwPitISGvwmLhmv4GX5IePKfLuAX9gbsY7I6
 HbtmYk5jdgBGimMHP4+umjki+mHH2T7DQA==
X-Google-Smtp-Source: ABdhPJyRBiv1PF9w7PuHnQPh4nzloDti6R6kJdhSgaxCKqun+BzdG5DlGX3YPCqr9vx285VcR9uTAw==
X-Received: by 2002:a05:6a00:2403:b029:309:8a37:2d51 with SMTP id
 z3-20020a056a002403b02903098a372d51mr29424617pfh.79.1625077956640; 
 Wed, 30 Jun 2021 11:32:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/28] target/mips: Use translator_use_goto_tb
Date: Wed, 30 Jun 2021 11:32:13 -0700
Message-Id: <20210630183226.3290849-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
index b4a454ec09..52ae88b777 100644
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


