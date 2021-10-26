Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C27F43BE36
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:56:18 +0200 (CEST)
Received: from localhost ([::1]:44854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfWIi-00077y-5m
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVdI-00007d-QE
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:13:30 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:41745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVdH-00036k-DS
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:13:28 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so692740pjb.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/NZkowD6C8yX465pZ6nDRR+ZC3z4EscWFPRhl5q7Pl8=;
 b=r9yHUsvzHOyfPO32p/wVt5uO/7ixnfsrhFZcqNuX1c7EVUKoZ8D9KC5jJvWINYDISW
 oNxQAoWSXWhONSAFyHXp4ry2IpJWz4g4j7RDRfJ8ZIBGGxWRWyUop44UD4YoOu6JSIam
 MI4P7kCsvSgKwdFLnvf6lgjXdPs1EbEMEXN+QLsxQ4yx8L8DKG7GwLM6eS3vFsMxkwsG
 TzJpjbCXbiatBn4OQxIhcLXEjf8Id2AzgmlbD+512jqOOH+kJgOtywoJDYWalxAVxWjr
 jldhBdMRGSXgjelUct4TbV2pFvTvYx2I7rDdS0zEcMt8McdMG7M/FVw+RAokqYBwHBnL
 Wl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/NZkowD6C8yX465pZ6nDRR+ZC3z4EscWFPRhl5q7Pl8=;
 b=tYB9OEWvAVbyPMUusv5RYve5hYNxcHfeO2w9c8p2Vxf9P22c13klHZqxpL56o3oIpH
 8451dG8hoNb9K6Zt4pdSQui80+9MKWdP6jUxLOfT/9g1+gZu+1p6F7ECEZTMagcZxlO5
 4i8i97SqzA3QPh2sdo6guWEpD53BSvfdZ1mcfTpYOb8NTLqvxpNnQN8xiLuJo2rUtNDF
 iqlSwngmP7EgPt5GkTexY1LUjnj5nwTZvUweH2cndB5Z0PMNYJFt2QtBmapJSid6Rwio
 475zdQdGRnSw1TPCWGCrxDXcCjn0eCkohlRCnj2CNwCLifZ+91pVEM2z+wiZWIZ44djq
 sP5g==
X-Gm-Message-State: AOAM531pLrIH1Yp/uQQDenn79DGTQmkt7kYdOtK4HdLlVQnGiuuZyF5s
 lrF8uel4eP2a5OKOszvQsOSDidFnd3NHvQ==
X-Google-Smtp-Source: ABdhPJwB7OUm9/PlnMrwtYHokggcL09y0GFkjoHISd0mcQ6yNnxF4CEy4L7gXn0UQ46YYrlkULO1dw==
X-Received: by 2002:a17:90a:4e42:: with SMTP id
 t2mr1987974pjl.108.1635290005967; 
 Tue, 26 Oct 2021 16:13:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d6sm24158122pfa.39.2021.10.26.16.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:13:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 44/51] tcg/optimize: Use fold_xi_to_x for mul
Date: Tue, 26 Oct 2021 16:09:36 -0700
Message-Id: <20211026230943.1225890-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Recognize the identity function for low-part multiply.

Suggested-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index bea82305db..fe2b1eb18e 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1460,7 +1460,8 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
 static bool fold_mul(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
-        fold_xi_to_i(ctx, op, 0)) {
+        fold_xi_to_i(ctx, op, 0) ||
+        fold_xi_to_x(ctx, op, 1)) {
         return true;
     }
     return false;
-- 
2.25.1


