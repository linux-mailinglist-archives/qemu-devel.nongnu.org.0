Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010113B88CE
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:56:31 +0200 (CEST)
Received: from localhost ([::1]:35980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfNt-0000jY-WE
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0x-0005mw-Or
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:47 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:44730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0t-00027q-GT
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:47 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so1983295pjo.3
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tZb8axAgxZbtOE+ars3KbfwaNr5DhJbyVKuqHiiznqE=;
 b=tVbqVrtY1mBu1QNknzhbpNXI/qBDKp1UL3Zcw/zGPE5xe33gdOuyam9WrOp/Z0hd6l
 dnl9jJgR1I8PS6BLPlCPhNZ530m5UbdYAEFveo4QMHfWu/N2ptMZTXQhiM2I8iJzgLWq
 7N8x45neH6euzRT6BND1MXMKeZkBHGH8udu34R5Tvg7dRk6gkv5Wrcl9luMveiLFoSgM
 T+iqT8hEVpK6sEn8ue/lPz7kg9b04mw6SDSmABK0pikq8OTPJcpxu1W4Ghuc8I5bWwtR
 I8vWW+raaVaKnSm8/f8G18q6WnSWsDDnuVWMi0fazNjehSq5gkhApdlxjr7xYS32WzkV
 y0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tZb8axAgxZbtOE+ars3KbfwaNr5DhJbyVKuqHiiznqE=;
 b=iEJZ1BAQrcX8NzFo7LwsIgPoCSh613Sp31MnDBwfzKRr3uLNYefHpdv1MZMWf+HrxJ
 zKxTNm99OJtDBasBVZQBPN0Z8/Ix9/YcAeG1phuaG6LaPpaSO7P+lrRmi9DCxT7pTKR2
 rzgKWNiY84B8BdWn7klVcWrvpJAz7WhY+cOYPfEq1n1z34Bp3SoOCRyliczUrNVISgBm
 84lW/coIQRkvlmB58BanAPi99n41hrTrURNHTvesu2w7d49pSf4D9yYRmey+zeH/rgPV
 hlLlBGvjOzsgmDmm9/+IOf6t8Hul0CjMtEPEqYm33cfHL6k6YS+cKzPqOdrN9Is4y3r0
 XpLg==
X-Gm-Message-State: AOAM532S9qBhmV1PH8mFreFqLfqRT/bl6/s33Oha1BtMx+aPVQceb3NL
 /y7mPMyOMIUCwztJbkeMPmIuwTds/wG0KQ==
X-Google-Smtp-Source: ABdhPJzbVzgxGrTyZegXKZFOPc2t4k+6CNRQsUW7tyjzDKo2oJV9c6vSi9TEPSKLtNd1zT+gDxVQ6g==
X-Received: by 2002:a17:902:eb44:b029:128:fbff:1e28 with SMTP id
 i4-20020a170902eb44b0290128fbff1e28mr9495402pli.66.1625077962192; 
 Wed, 30 Jun 2021 11:32:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/28] target/sh4: Use translator_use_goto_tb
Date: Wed, 30 Jun 2021 11:32:22 -0700
Message-Id: <20210630183226.3290849-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/translate.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 4dcfff81f6..db09a0bce3 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -225,17 +225,12 @@ static inline bool use_exit_tb(DisasContext *ctx)
     return (ctx->tbflags & GUSA_EXCLUSIVE) != 0;
 }
 
-static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
+static bool use_goto_tb(DisasContext *ctx, target_ulong dest)
 {
-    /* Use a direct jump if in same page and singlestep not enabled */
-    if (unlikely(ctx->base.singlestep_enabled || use_exit_tb(ctx))) {
+    if (use_exit_tb(ctx)) {
         return false;
     }
-#ifndef CONFIG_USER_ONLY
-    return (ctx->base.tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
+    return translator_use_goto_tb(&ctx->base, dest);
 }
 
 static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
-- 
2.25.1


