Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0BF436D00
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:46:21 +0200 (CEST)
Received: from localhost ([::1]:59594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdftE-0007gK-IT
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfJR-00045P-4V
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:09:24 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:41916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfJO-00009f-33
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:09:20 -0400
Received: by mail-pf1-x435.google.com with SMTP id y7so1761702pfg.8
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5G0K+H2e7otmmKQ9zQj4DbcKrZpcr7GS6k3OOPhe8m0=;
 b=vCm+AY8XgFxNqih386bdjh1udkCg8ZLLYM8SkbeYNOAR48KzWyXJAy2WomEfqNuszo
 WK6zSBhDz7pkZEImz8D33Px0mn0TKUVcUuKmzg9g3dMhCOB+oy8+LIAwn/g17wcHltOB
 PfQBKZUyhe9tgFg0AWKRzPlU6BvfPRkSJp4uFCFB9aCggiKKi2K0f0ODdlEDAXmUwqeq
 FfE6ueRFLOgyMSVPBG3n+aKcnAtZ3ByWwhmQ2SNQWxHvGSJEag9xY5cI0V2brjgzAXJv
 6fgJqSBUtvvBd+FgrUnl6J8jV56X9gBdNV0Y+AHZGOG5+qANK5tFQISHTt5cLSAK0P4n
 fRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5G0K+H2e7otmmKQ9zQj4DbcKrZpcr7GS6k3OOPhe8m0=;
 b=ERTbfpXFjpTLHopRbODMWk8fxg5O03QfdUn2/evJIGt79yGYw/DEZdb4JgLpcN2oLt
 ytZ5u51GfByi0YBMwySe/qJIeJ1+WRxZpH5W2IQ/0CYAQjGFpNhIoAkdf2Dt+WAe3fVx
 /6gjZ/bkT8xarGCFcDK8kPe6Wpuy+KhA3vFvdPwBWrr+fHpnwM9I18QJ8iFv1oziHEmm
 ZuXfbLQLXfyVzgyuyGpLLU2ijFdYYurnWa3ksfxGim00cBmzqNaOddi+ZEphGVV+b1Hj
 wmjMJlVWmTrEPGRWdodjGFH15+wW7Rpya37IwIlcwPWP4PJ0GnfmAM9jvfXFsGv7zEM4
 fCxA==
X-Gm-Message-State: AOAM533at+tSayRm/jKOATZshY2yRVT5vFYAaXh/pPlBoj/liCp0sZIb
 z2NfElSC0gK5O1WqH4flMjHvP4OyAdQ8dA==
X-Google-Smtp-Source: ABdhPJzdUl0kY0BTURs85ZX8z2cFCVy2zlb2bKyJbYoFe5iVAPY9GIlJiUbr0ZUn3uhtMKe7tcBOvA==
X-Received: by 2002:a05:6a00:124e:b0:44d:cb39:40f6 with SMTP id
 u14-20020a056a00124e00b0044dcb3940f6mr8092425pfi.22.1634850556758; 
 Thu, 21 Oct 2021 14:09:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i5sm6258856pgo.36.2021.10.21.14.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:09:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 47/48] tcg/optimize: Propagate sign info for bit counting
Date: Thu, 21 Oct 2021 14:05:38 -0700
Message-Id: <20211021210539.825582-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The results are generally 6 bit unsigned values, though
the count leading and trailing bits may produce any value
for a zero input.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 64d3256bbc..3dd9219d69 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1215,7 +1215,7 @@ static bool fold_count_zeros(OptContext *ctx, TCGOp *op)
         g_assert_not_reached();
     }
     ctx->z_mask = arg_info(op->args[2])->z_mask | z_mask;
-
+    ctx->s_mask = smask_from_zmask(ctx->z_mask);
     return false;
 }
 
@@ -1235,6 +1235,7 @@ static bool fold_ctpop(OptContext *ctx, TCGOp *op)
     default:
         g_assert_not_reached();
     }
+    ctx->s_mask = smask_from_zmask(ctx->z_mask);
     return false;
 }
 
-- 
2.25.1


