Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E755E43F677
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:12:39 +0200 (CEST)
Received: from localhost ([::1]:40210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKBy-0001D7-W5
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdr-0002dD-Mr
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:24 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:37449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdl-0000OJ-IT
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:23 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so9653166pjl.2
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A6kctx71i8wzEpW9P/tf7EMU4+ENs8we2z5h5BKjvM0=;
 b=q31IzQeSrYcdc9cJBuuNkwxLHkc0M3H4uz0dWtL1XFkHSE31NITvYNItX9CPc68I89
 9dF39fiDR7EXUq+JNF7bYlnV1LMemc+/darHj97B0WcRfMUgdec0ceFWabLr8wBrHQTX
 modIuqAlhQ/zyfPwU8cR0oROx2z8ih0ZPhFONIE/7cQ2nV8OxW3k6Brn1kpWHleOz4pC
 O76npblMY2JurdauB971JclG7dmzxV5EuFzxI3kP09xTVPuLV5XxdcuDmqsdRlVfs4m6
 0Zn6uKSkQyJF7YXosslDg4GwL4X9ybrfxU93HyeErIH8k+ARK65npeFN6BJxeU9LKKET
 mTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A6kctx71i8wzEpW9P/tf7EMU4+ENs8we2z5h5BKjvM0=;
 b=r2F06zsDOE6JYefmFc5S7FRHL3Y8Ie3VTSkLELFnWjhiZN6HbbXx1fu2X0Dj8Xky88
 ltfCfar5OK/KgN05dX2fYP7ohp7lWOQd2ErCrYQTpM2zST/XWqPYMXZmCcxo828u1rG8
 MARIkmjvZAn+QQy75ra9kBz4QJT9IM1wr/JV8dNfpc3W9qulALiA4O5GZhTj7RpJ8cqX
 FLxjkFEIFrXJU+FA6c5s5T1FDhRks7npVgM3/gb0buHChzpFYfvFI4DTwx5hkmUurTIP
 wpl0yiTYl2mk2MXCKd4Sc72V9JyhkAYGTJHgbvquvj6Gz07usarNHrAlUJyp7BSklb1a
 XXxg==
X-Gm-Message-State: AOAM5333ZmqqlbnmKsBvj68+HVU7dxYwRnFwAXZQEmUSIfDbdWjfVWNt
 U3g8daz2UxKMRkOxe2tLBpnE8g3bZM9HbQ==
X-Google-Smtp-Source: ABdhPJwqh0gdoIFhspCIpMgsP6swrY6N4vzFHC+xe7h5yyTZC7Av9JHQPj88T+j3XnixNY/LyuI9CA==
X-Received: by 2002:a17:90a:4283:: with SMTP id
 p3mr17434371pjg.23.1635482235964; 
 Thu, 28 Oct 2021 21:37:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b8sm5228232pfv.56.2021.10.28.21.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:37:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 56/60] tcg/optimize: Propagate sign info for bit counting
Date: Thu, 28 Oct 2021 21:33:25 -0700
Message-Id: <20211029043329.1518029-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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


