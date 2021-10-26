Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F61143BE35
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:55:58 +0200 (CEST)
Received: from localhost ([::1]:43938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfWIP-0006VG-A6
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVdQ-0000EO-1F
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:13:36 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:43676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVdN-00037p-7h
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:13:35 -0400
Received: by mail-pf1-x42b.google.com with SMTP id 187so880138pfc.10
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HNbzgMBtjU/uvlvvRvWfsbvztDv8gt6Nc5lohSZdq6Q=;
 b=fxMsTFC9sXQUKZGQ+78YBs5Ap8mWYWldP9a61pQiaIYCWtwNzp7UvPTHAstLk+xvjZ
 OPB5D+zalM0WrJu5mz2xm3sBKjtktTS89JYAPcONFNO4XyjtZ4wBTX8NRfoS5FelybQ/
 MEj0/tDBfKay/serhayVon3Pw6Wq/5PBM0jWb09Xy2qY5NLxWSNSeQYZHaFfPzoErxy2
 J15dRgguo9zrfrOh77P0DJ7hHsqdxXwmuiq6yNqmaLhufP2XI4lbka7zzjZrJCD1OsQF
 Zal8glWb4bFBTfcrl26oEpQEp2yrcoE2OG7K+gfliZB9tSEbJVbw5wcKemvtm362uoeM
 h+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HNbzgMBtjU/uvlvvRvWfsbvztDv8gt6Nc5lohSZdq6Q=;
 b=uSZOlTqMnX5RFWJisrXO9WpRlgB9MV5TAAImzAqWgiDqguiYBzX1Fg6nTDj/yuEizN
 DG6IAl/fLZ9kdoCvhDSbxnZ1aX9LYOub1wj1r4dDri0mpBPQtfjwroEZM5zhnqmlI3E/
 YLCTOOEePaFZlV9mR/YK/S5Ou4BV7kBv2gvWObf7OybMa6fcyX0iwwWMs18rOk0yOuQ7
 qfaOe4e/tcHSzSCeZVkvLEpEG8evWjfrP9czVj0CnhkmuZbCk7x4RCdq16Jc5vw8FMYM
 zTWeC59+2KeumwuFI2ErhJ/s6G6l/W0KGM2nCH9JsiBPg1cTm/Tz/7zAELmL3ffRtMJ+
 WLIA==
X-Gm-Message-State: AOAM531y0TErBwY4FkCyKPEmi/V/hTvy0WhRsnOPW+2crgfnZrgTqg4i
 d2yc/+q7YqvUBCQnZ5hvNrPqsMhzYsumbw==
X-Google-Smtp-Source: ABdhPJwvBivdQLXWFJT13qCq5CnQAWjEBIb4pGIySUzD+fok/u5wbSIx/PSEL3eu4AwxouF07ufkqA==
X-Received: by 2002:a63:8c4d:: with SMTP id q13mr21279148pgn.92.1635290011779; 
 Tue, 26 Oct 2021 16:13:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d6sm24158122pfa.39.2021.10.26.16.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:13:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 50/51] tcg/optimize: Propagate sign info for bit counting
Date: Tue, 26 Oct 2021 16:09:42 -0700
Message-Id: <20211026230943.1225890-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The results are generally 6 bit unsigned values, though
the count leading and trailing bits may produce any value
for a zero input.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 515087876c..ccabc5ed54 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1228,7 +1228,7 @@ static bool fold_count_zeros(OptContext *ctx, TCGOp *op)
         g_assert_not_reached();
     }
     ctx->z_mask = arg_info(op->args[2])->z_mask | z_mask;
-
+    ctx->s_mask = smask_from_zmask(ctx->z_mask);
     return false;
 }
 
@@ -1248,6 +1248,7 @@ static bool fold_ctpop(OptContext *ctx, TCGOp *op)
     default:
         g_assert_not_reached();
     }
+    ctx->s_mask = smask_from_zmask(ctx->z_mask);
     return false;
 }
 
-- 
2.25.1


