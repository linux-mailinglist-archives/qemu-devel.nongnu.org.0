Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D2F3B88CF
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:56:47 +0200 (CEST)
Received: from localhost ([::1]:36932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfOA-0001Rx-9D
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0s-0005TN-Bv
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:42 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:44004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0q-000259-6F
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:42 -0400
Received: by mail-pg1-x533.google.com with SMTP id o18so2557592pgu.10
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CGijMJQVEM12PQG7khoLYEEx6Kld5VypBBc7yQ7jwvM=;
 b=VTYPQBjK6p7DYGo5l6qZl0gdVcIQLlyb8ZC+vJvs1a7w+LvQJZRcjZKhmiraFvfCge
 3qRCpYDKtOHfnWQked0FrdlwPl6xqB6IIMAnfOYbqZh6GqTHidT3rgCZ2vI7HY+GQsqV
 /AXCi/ozG2ug0csPqsWV9j8Vy4f+XSHahHuO5GuAF7UWtFf7c6itaVc1wVBy+Vxs7STg
 dyzI6PhlGgeU0OrzZkJyPTgS/XTszqBt++MIKUuL7Mshd0foS+spLNh3QpolJuDZ5q9w
 ro/C1m1XY7cFBlzzViyXYhifgEzRAVgp/CfmdyfejPONyXrA01jfoqEUyXW8/6Rsi1pr
 A5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CGijMJQVEM12PQG7khoLYEEx6Kld5VypBBc7yQ7jwvM=;
 b=tRUscqEDfKuhYc2avK407SILJEOj9sRExdt35fIAjNfK8T6F4Xv8uBe9kPufN/BASu
 To/bGxkoFijxFeaqjcgm6H8Q/oGUjJi8u4TDHtcVKzE5eRbOlx0nmrRjiKjrSQ9ja5kW
 kk8pfVa2x1kfcz6fd5Z8iioZzXoGVweVopxx0jX3h57m/UGGPD8s8pFRPVDgDyvTyht2
 TWS/Seh4wXIEdGYJpx+r/NKqq/G2vyLbyNmDcxaDcj4Qf5g9zl6v3mSYwggx5oh/dYnN
 NyUPzS+s2nIS6jIgOy3X0rH6cJk4g20LGs7jC6pSSD6hf7DUJTyqjarMVu/UgTyPwugk
 SF7A==
X-Gm-Message-State: AOAM530nSiBWkHM+BPzFibZm4eZbl/FfJd5C45FBBA7ef0iNbS8/42xU
 1u0s0Wh8fJxQ/kYQqFciQt8pjhKXgbikNw==
X-Google-Smtp-Source: ABdhPJyljVy5vXhY/DG+2iQ6xvpkzXxkciE9Z4E9mr52VYAoEBF32G1p6FtENeo5BZdkY94PBsu0MA==
X-Received: by 2002:a63:dc06:: with SMTP id s6mr35787279pgg.39.1625077958903; 
 Wed, 30 Jun 2021 11:32:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/28] target/ppc: Use translator_use_goto_tb
Date: Wed, 30 Jun 2021 11:32:17 -0700
Message-Id: <20210630183226.3290849-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index f65d1e81ea..0fb09f2301 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4302,15 +4302,7 @@ static inline void gen_update_cfar(DisasContext *ctx, target_ulong nip)
 
 static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
 {
-    if (unlikely(ctx->singlestep_enabled)) {
-        return false;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    return (ctx->base.tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
+    return translator_use_goto_tb(&ctx->base, dest);
 }
 
 static void gen_lookup_and_goto_ptr(DisasContext *ctx)
-- 
2.25.1


