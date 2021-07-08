Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A3E3C1937
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:32:41 +0200 (CEST)
Received: from localhost ([::1]:37902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YpE-0002gg-4x
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1YiP-00016B-Gs
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:25:37 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1YiD-0007r8-Tt
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:25:35 -0400
Received: by mail-pf1-x42c.google.com with SMTP id x16so6265905pfa.13
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 11:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IU508E6076QPCLXIaQLJ1tRTfkoF/jqLFHz6sCXWRL8=;
 b=Un8RtB5SXEHKbNimPTFGC+ApzES0lrwxUfyHDYr8BuULdVjtgN+PR0XccS5j+a3o/i
 RHBR8JTAVAQf/FDLaCmPnIKXgK12n3ZGWlUai4izg3AJd3DaCfjCfnwXzBqTmDIMV5Bv
 nf7TZLwXhx0WvcWiOGdYSV5bRV6enJjC4Fi+eJwzMxO1Jr9+piqZvGrOVzWgvQj4ECNc
 rddLhSJgcMKO7WOuiHdtWptKoLNKAdNEncLnJJpzfr4ea2aLQsB6GB2B0eJ4BVwwEtJX
 +/mHRBNAND3OAapPgZ3EmsBW8p7ZdNRSKfESlu3jKQGk/G11zbZFb3ImwDcJytVuJnUZ
 5Bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IU508E6076QPCLXIaQLJ1tRTfkoF/jqLFHz6sCXWRL8=;
 b=oCcH+MezNBuZpHSzM0HZf2s7aZQNFxzmwew3cnxmtCvZJP5fOnfjgEBITowcsuoe70
 6Q7PbSfC4APG7gxvt0GlVIV/xXwBo1zmyfrBXi6xPlNLCgnvGd5EkQgPgzmL2L2gB2PT
 Bz2ftajfMgCu0Ahn1SKvEuR8cGpBomZJmbvjB9LW0V1/Ic3pIvUZm9u0cdx4ID9AVG+H
 zYdQvh7IiKjmgtu8YorgbZUdL0VGDAK31ouiQYjkjXGonqz2HEyceeTYt/MiEm9CBXIl
 Ra5AIcDHwStD1qRuzNh4riGlK7f3wDj8KRqc397aWZX020q20X0C+fuFlaq2v/GAu6h3
 gXXQ==
X-Gm-Message-State: AOAM532gUpq88fVPCOKSWzf+Gkw7d8GPJVl9hMs/gn9U7D5NL76Ek6Tp
 xviY1RI1W1z8KwHoS2g+FJYWow/jVp7/Wg==
X-Google-Smtp-Source: ABdhPJyptd4zfWWIYVRT+xpNbso5GZzROH0nqZXGYBjdtFTZEsqo9k13S/hHkx7SJU0wH1hKGUgMnA==
X-Received: by 2002:a63:470d:: with SMTP id u13mr17511851pga.318.1625768722122; 
 Thu, 08 Jul 2021 11:25:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d67sm2751810pfd.81.2021.07.08.11.25.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 11:25:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/alpha: Use tcg_constant_i64 for zero and lit
Date: Thu,  8 Jul 2021 11:25:18 -0700
Message-Id: <20210708182519.750626-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708182519.750626-1-richard.henderson@linaro.org>
References: <20210708182519.750626-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

These constant temps do not need to be freed, and
therefore need less bookkeeping from tcg producers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 5ea091eef5..3fd66fb78d 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -67,8 +67,6 @@ struct DisasContext {
     /* Temporaries for $31 and $f31 as source and destination.  */
     TCGv zero;
     TCGv sink;
-    /* Temporary for immediate constants.  */
-    TCGv lit;
 };
 
 /* Target-specific return values from translate_one, indicating the
@@ -158,7 +156,7 @@ void alpha_translate_init(void)
 static TCGv load_zero(DisasContext *ctx)
 {
     if (!ctx->zero) {
-        ctx->zero = tcg_const_i64(0);
+        ctx->zero = tcg_constant_i64(0);
     }
     return ctx->zero;
 }
@@ -178,14 +176,6 @@ static void free_context_temps(DisasContext *ctx)
         tcg_temp_free(ctx->sink);
         ctx->sink = NULL;
     }
-    if (ctx->zero) {
-        tcg_temp_free(ctx->zero);
-        ctx->zero = NULL;
-    }
-    if (ctx->lit) {
-        tcg_temp_free(ctx->lit);
-        ctx->lit = NULL;
-    }
 }
 
 static TCGv load_gpr(DisasContext *ctx, unsigned reg)
@@ -201,8 +191,7 @@ static TCGv load_gpr_lit(DisasContext *ctx, unsigned reg,
                          uint8_t lit, bool islit)
 {
     if (islit) {
-        ctx->lit = tcg_const_i64(lit);
-        return ctx->lit;
+        return tcg_constant_i64(lit);
     } else if (likely(reg < 31)) {
         return ctx->ir[reg];
     } else {
@@ -3024,7 +3013,6 @@ static void alpha_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
 
     ctx->zero = NULL;
     ctx->sink = NULL;
-    ctx->lit = NULL;
 
     /* Bound the number of insns to execute to those left on the page.  */
     if (in_superpage(ctx, ctx->base.pc_first)) {
-- 
2.25.1


