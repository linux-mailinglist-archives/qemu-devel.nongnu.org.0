Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81C143D9DA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:27:50 +0200 (CEST)
Received: from localhost ([::1]:44246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfw4z-0006fT-Uv
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPp-0001dc-Pf
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:18 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:43720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPj-0006Up-GK
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:17 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 k2-20020a17090ac50200b001a218b956aaso3551383pjt.2
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A6kctx71i8wzEpW9P/tf7EMU4+ENs8we2z5h5BKjvM0=;
 b=CS958hBKAXVq+buI5QL55jQMlNyQhosyFRDxa2/PmOkyDgrloLUYAwX6ppr945WdEx
 Rl6aQEElnCt348TnZP4Fn26tFg7o5HaMMrvOXAxgnkWbo7hV+DCA6t2Oirs9meygPAeU
 whPVWIQieUElWqJV2YqTjXg9q+ET/Gq82B/kguLMtIzYlAjcYtATrrE+8D4u4DtgYRY2
 fbOA3UFIypvigP24c+1FH7mbJm7VYZgzwLPbWSRXgfzEpafXLfcJkroCsAVLEkotv7e8
 StE8i8q1fn3vqP860jFt9VASXjYNTqjgBVvoztfBMHNFgP3BfpAKHJ1jBNUZf2ATfKnE
 v6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A6kctx71i8wzEpW9P/tf7EMU4+ENs8we2z5h5BKjvM0=;
 b=wdbfHy0ySPcPdYHeT6nvOjPtlOIF4N+5TSt6viOMbJwPYIOqgC3aENtmr6PyoZ+E13
 T0TrapZZR1l+Gi1SMvfCoHpbBg2w5axL0y0biJldPAwP8DbQOCLKtMIxhnR8Lx/JDwyM
 DVn4t5vCyq8MpRFxQYdcL0Sfm+SVsGNDWBVlkCM0AZwu4MDmQDTUM2ujz3pjC8MPeWSr
 CBQXsaZawoZavuRBruU1cb/dKLWYnDfJdQS/8oMa7H6rk4T0syoP2VRQNeQWZD7rCDbe
 wOnxj10NaVkiKKq/E2oFE3TbaSm30BPkn0gDyAEMPE7BnMHsxEp9LHQ7B88+AlSOQqfJ
 yiHg==
X-Gm-Message-State: AOAM533hfq5TELRqrqMIn0suJyYNIi5boVM8SnpKvXnK5kOLhDkJlnuy
 1oLgWZ9PZYd/kXwWu6mYoG3vr8qSxs5GyQ==
X-Google-Smtp-Source: ABdhPJyXfLr/kneGciMtnlYko+1OnkMI76pxrZCoxMIl/PjDhMQv2z1G9WJVnLZ3aTJ4p8mZzgfsFg==
X-Received: by 2002:a17:903:1207:b0:138:e2f9:6c98 with SMTP id
 l7-20020a170903120700b00138e2f96c98mr1480276plh.11.1635389109790; 
 Wed, 27 Oct 2021 19:45:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z8sm995907pgc.53.2021.10.27.19.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:45:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 55/56] tcg/optimize: Propagate sign info for bit counting
Date: Wed, 27 Oct 2021 19:41:30 -0700
Message-Id: <20211028024131.1492790-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The results are generally 6 bit unsigned values, though
the count leading and trailing bits may produce any value
for a zero input.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 5fa4d7285d..c0eccc61d6 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1229,7 +1229,7 @@ static bool fold_count_zeros(OptContext *ctx, TCGOp *op)
         g_assert_not_reached();
     }
     ctx->z_mask = arg_info(op->args[2])->z_mask | z_mask;
-
+    ctx->s_mask = smask_from_zmask(ctx->z_mask);
     return false;
 }
 
@@ -1249,6 +1249,7 @@ static bool fold_ctpop(OptContext *ctx, TCGOp *op)
     default:
         g_assert_not_reached();
     }
+    ctx->s_mask = smask_from_zmask(ctx->z_mask);
     return false;
 }
 
-- 
2.25.1


