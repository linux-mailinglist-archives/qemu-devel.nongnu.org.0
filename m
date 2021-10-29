Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAF043F6A6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:28:09 +0200 (CEST)
Received: from localhost ([::1]:36020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKQy-0001Zp-NX
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdn-0002ZV-OF
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:19 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdh-0000Nb-OO
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:17 -0400
Received: by mail-pg1-x52a.google.com with SMTP id f5so8668423pgc.12
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cdbRxhQ1wpUhR1+s4AARw22mXFf4Uzb2BWNb0AuXuG8=;
 b=QZVZRr1oLfQ5uDGfVtoInQYUzeVzaXlhm35beqrq3iS0cRcsAtBh/kmQfkGY+khrmL
 YnTcO6mXhC8OphJoXzndfwhTPgzSdL8rmBI8Wnq4cFZ6dwZ4Qerg6ZupcuUo4IjNvo9W
 rXhul2KjPOR4iPkB2VzXj0SAEUtu5IK0CQoJpOiXvyhuw3nyCADe1djcEfU/m3T3oe6q
 XmsKzMQ75n1QAAC+84D1x9DmphpgmFruwQM2R5xQa4lden0JKCNcUE6kPS79gFgAIzEw
 L/Az5gOf0FV8KAOxH4AHg8o9DtZu3ZHeHYyhoVNM2tfetSGvwM+YKxto9BSIZMPHBLyV
 jhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cdbRxhQ1wpUhR1+s4AARw22mXFf4Uzb2BWNb0AuXuG8=;
 b=CzS48CKPejKlE9V+uQoqr/ZL8506lH2deQsRT7q3PWFUY+EVgCpdCLVlZ+U0pxpSqk
 HuDDuT42HLbBBV8hQfYubJx/JWfzawJ0fBWfjrUUB3qipgPAyLIRrASBRR8++4m35VeR
 ZSNBbolmROXeBlmgnj47OdvNqhs00BD7/MG+wTfk3/74/kQVWy1FS6rZyo5/QidESw9m
 1u8OdigXkZshflEaW34P+c1haYWJ6TjjY1IvQZFSZnWBunVmABhmHuhydn4JS8iQATeS
 Kv3WqaBV2wk4CX6FBw6W4zeqLOeXIIrydZIUKcsNBCRjVVKl5vWrTikpxzpWsTr1c3Xb
 c9Yw==
X-Gm-Message-State: AOAM5320wd9QB04hWQs5seEDCSAsO+RgVPrBuOFuDfCAmiJawwTV/dnd
 zildpLperGRJ9Dzx1wjlmLvIilwnelbfRg==
X-Google-Smtp-Source: ABdhPJzxisKO+L0S40r4VynYc4FLaUgi7MDdOvSEcd5eXUBUD7mPBPVn6R6L7zpHtMgspMqdqVQmYQ==
X-Received: by 2002:a63:af44:: with SMTP id s4mr6496780pgo.219.1635482232254; 
 Thu, 28 Oct 2021 21:37:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b8sm5228232pfv.56.2021.10.28.21.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:37:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 51/60] tcg/optimize: Use fold_xi_to_x for div
Date: Thu, 28 Oct 2021 21:33:20 -0700
Message-Id: <20211029043329.1518029-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recognize the identity function for division.

Suggested-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 907049fb06..f8b0709157 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1218,7 +1218,11 @@ static bool fold_deposit(OptContext *ctx, TCGOp *op)
 
 static bool fold_divide(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xi_to_x(ctx, op, 1)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_dup(OptContext *ctx, TCGOp *op)
-- 
2.25.1


