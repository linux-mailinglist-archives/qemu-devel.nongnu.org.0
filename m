Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ACC425DB6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:40:48 +0200 (CEST)
Received: from localhost ([::1]:52016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaC6-0001oe-7R
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZXJ-0007Zo-PK
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:58:38 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:36650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZXI-0003v8-9D
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:58:37 -0400
Received: by mail-pf1-x42d.google.com with SMTP id m26so6259564pff.3
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NCnmxC0/EB26lNMO55xRTDlo+OZH62QpEouvYYVySyw=;
 b=oGwwBVyd45SkJF+tL8UNcUK7bm5D+5ry2Piqj9Hry2WZgmu7Gg8elZdMl2i7VO0dXq
 HC+81/99SBunKz23TaSAnOzVSfPnVf03lRNRDbVFQBMz3igCYiHRdjYJV7GGFr/11Y+z
 dbl8XaTJHJZXhWTvsD/03MZyPk85Y7Gt9bAlpvyQVTP/OKT5iPDEsWRD6ys3nA2fe0O5
 LdvSmlam0arMwHj9JjZasEWJrJQss6OREhUTL/iOiEffs9dFjkWFNEf3W2rvHxMn7ZrA
 el/i2eBmTOdtsKMRCpK0Pfp+O6PkXuPVDs8Nk0EBEcanvxOgJxKizzLpJbBRg6FCo8Hm
 XDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NCnmxC0/EB26lNMO55xRTDlo+OZH62QpEouvYYVySyw=;
 b=DDwX8bEFDM/KFJZpwjKxbyMKIhLeUDqdl+qRfATJiNIge41lbUXojdGvAfJNCmieRv
 spT9soahkxI/E27Tso0Uwpaub/YHlDfOaC75aj0dvABa+1sNfiNE07kE/S71CtBCRaOX
 y0kP7dexHWfP4jGt1vmNqtMWh2nKo6I798waxCYikgcLTmqLogFvc1ade0on80Lq7MTy
 g3YnBFtukEy6fqnaPDypXcZiUO4Kt5tNKo6yYMMgnPj+l4AHlRKmgAmKBH92D4ko5P2C
 +DS3ME+FmWF/lpdHH2ZMZg1tPGbu3mIHrz5fRHCvBrBiqFUIStm91f4KjQ/xPf3cHvPC
 pJjA==
X-Gm-Message-State: AOAM532Memt2w/GkkviApp92dRoJf49LOm2EmKuFLZX0JQoQAU1vs27Y
 uLx+JTNUIGrXVKFNuwRk17HHpcvoGR0J3Q==
X-Google-Smtp-Source: ABdhPJwyULXEaeTOh6QqeJqgI+fz4nGWwkDwDLRCejJHmPWHxwCPXaob6shSlcuk8uQvDnpG5vhyqw==
X-Received: by 2002:aa7:9209:0:b0:44b:e5d4:d8cb with SMTP id
 9-20020aa79209000000b0044be5d4d8cbmr6028853pfo.65.1633636714936; 
 Thu, 07 Oct 2021 12:58:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t2sm8995380pjf.1.2021.10.07.12.58.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:58:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 47/48] tcg/optimize: Propagate sign info for bit counting
Date: Thu,  7 Oct 2021 12:54:55 -0700
Message-Id: <20211007195456.1168070-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The results are generally 6 bit unsigned values, though
the count leading and trailing bits may produce any value
for a zero input.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 1c106bfbc3..678e7c1983 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1216,6 +1216,7 @@ static bool fold_count_zeros(OptContext *ctx, TCGOp *op)
         g_assert_not_reached();
     }
     ctx->z_mask = arg_info(op->args[2])->z_mask | z_mask;
+    ctx->s_mask = smask_from_zmask(z_mask);
 
     return false;
 }
@@ -1236,6 +1237,7 @@ static bool fold_ctpop(OptContext *ctx, TCGOp *op)
     default:
         g_assert_not_reached();
     }
+    ctx->s_mask = smask_from_zmask(ctx->z_mask);
     return false;
 }
 
-- 
2.25.1


