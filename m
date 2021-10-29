Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9A643F6B3
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:34:34 +0200 (CEST)
Received: from localhost ([::1]:46824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKXB-0000kg-Al
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdp-0002c0-Pf
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:22 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:42632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdl-0000O5-Hq
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:21 -0400
Received: by mail-pf1-x433.google.com with SMTP id m14so8087227pfc.9
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UvnOEYcQnp8j/yc4rVZsMaNR1mFxyTm3qBQfekyS408=;
 b=rBXk5DvahkcVp8QAwfS2v+q7roOKM4YCbpkaMvM7R+MHlzqLnmtAbPoFE89uvQVmlx
 ZY4y9o8ZF3uAywdBOg0V9qhw4Nta/IKuykB413oBphMAdgWquN14kX7FL1OrjxvUJwZJ
 FonXXhFvaBW5Uw2xAgtmEjxZcn2zR9LKjI8ZNpuOdozHZiDcgaRuZMpYjKO/5EpFOLaE
 PoaOlWdB/1Imd7+BHUG6ToXw9V0Ajld3vrtEafClauLQpU/qwXHFj6ArhnArb2Yvy1Di
 yNoxv6z0348W8tBSYxTLYsDuXEFFbhSksV0Pc9uH5jAr5z5LlH9s2i5n+at6csRTAXTF
 7FVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UvnOEYcQnp8j/yc4rVZsMaNR1mFxyTm3qBQfekyS408=;
 b=1X24dqZ+N3U9jmuoB2/PIl7ZDMCOVFLlAnpeIBhQyvsM3EGtn/hBbTwXa1HUEgWISY
 UxHWGJyE5GN9go2WdB3smNvsKUJponcx4U7ipn02taYN31sz3VdV0eIfaue9eBQGvkm/
 qx7sfA6ktQXRWcDEDhSehJCApkr7Pg03d2DZLWMA0CVMKheDpb7aXsB+iAWJc2+PH3jG
 w0qh9n1k5Ni7iItZJftQeI6J03sv0cbJA2EbTTvSvVEx8TlVN2Yi21hmPmtWCWmV8YVb
 TL5T9+E7zg4XjPyz6MmRo+YUfdPdpSezmHU2+gbDbDyTcNXvze2UL1gK3ki2B7I0Vrsc
 C8bg==
X-Gm-Message-State: AOAM531BfotV3welF2DzfBBYX/v4mk16sISnlWvJ1nqghOKBBahFaF45
 JOb5fk1G+zgsxPskicHl2VjPfRN0h0TEgg==
X-Google-Smtp-Source: ABdhPJyQKUbZeUwjqjB5J+od6GcotDX9MO2WfeWzsTVK91jGuoEwYXhXkFpQ6Nfp3tMya9BU0yMryA==
X-Received: by 2002:a63:1406:: with SMTP id u6mr6500218pgl.106.1635482235248; 
 Thu, 28 Oct 2021 21:37:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b8sm5228232pfv.56.2021.10.28.21.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:37:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 55/60] tcg/optimize: Propagate sign info for setcond
Date: Thu, 28 Oct 2021 21:33:24 -0700
Message-Id: <20211029043329.1518029-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

The result is either 0 or 1, which means that we have
a 2 bit signed result, and thus 62 bits of sign.
For clarity, use the smask_from_zmask function.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index de1abd9cc3..5fa4d7285d 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1730,6 +1730,7 @@ static bool fold_setcond(OptContext *ctx, TCGOp *op)
     }
 
     ctx->z_mask = 1;
+    ctx->s_mask = smask_from_zmask(1);
     return false;
 }
 
@@ -1802,6 +1803,7 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *op)
     }
 
     ctx->z_mask = 1;
+    ctx->s_mask = smask_from_zmask(1);
     return false;
 
  do_setcond_const:
-- 
2.25.1


