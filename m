Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689033FB18A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 09:02:35 +0200 (CEST)
Received: from localhost ([::1]:42400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbJS-00023G-Fz
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 03:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKamS-0003EN-0T
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:28:29 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:33656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKamL-0001nk-PY
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:28:27 -0400
Received: by mail-pl1-x62b.google.com with SMTP id m4so7977107pll.0
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LV58SddOWnlnFKtjz4i6HF8Dt9vT0aWd1Tsy/0qkamg=;
 b=DNDpdfwAyZx2VkGQJiz0cQ0eUBRo6jSvXElkV3peZhAq252+UB99OJLNIxSXY+IWrk
 olnHeTaf8wmWETH6lLSiXeCSj4z0tXrw8SFcc/lNpHR+5IMb5Jz43OZviRUacXiEaO00
 rx3CqAvvQPyMlPd3clztCeRK6xZ18uMReED8YlXdFuo4YyTTfuXAqgctLGvYfnSt3PhK
 vSVpP0bxfOKTWSZBqTJjjpxvjvryuYje4Tic1GsJb3w/5IuUARYnnfj0BdwabrOs0p8B
 /aaZjmGRovCV5m7n4AsW1sdkF2d4epqc2dTxq0alLlzbKLERGd6P11zSOYuRqvJydt7H
 uqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LV58SddOWnlnFKtjz4i6HF8Dt9vT0aWd1Tsy/0qkamg=;
 b=Lq7slv5BREudF0QeU1pu2C83+Cc4AIR7J3D8mbkanR3t9tN4okXf7Q3btBoRYrosdE
 RBxajY7CY9tCjZn5CDfddvKNz9LLRNhe94roxKaYzslFsZ6heSTLOst/Cu0VLfH/zS4j
 Yjm3vYaABhZH0a0Re/7qO8KiKu26ekuiYmCFYwffq3nsTBF861O4fgQnG8FBBbSWQSNs
 CBYr1Qely1xxLEn90uQphKOsU0+6TUParT28U8969jkht6OX8cg9nui6BSiAYXzrq4GO
 JnPNu9dqd2eQ48zjltakiK+aenxkspnqu8h1CVGFKOzO9eglDq4TsKQ0RP706xG7hJAm
 FU0g==
X-Gm-Message-State: AOAM531ShVFZjpcX6K2Ghms/SZ0uMbdJdFmCD6Mu4yEqeoLhM7fu8Efn
 /kjGWLQp3/WZTg1v35ay3Z5JZ47h6XkIWw==
X-Google-Smtp-Source: ABdhPJwSdhTz1ZMcbyKgszK4APkRiJoq87XpP3fM+d1ldWhkPCFc40LPZTh+26SA10P25OHUcMFPZQ==
X-Received: by 2002:a17:902:dacc:b0:135:7ac:b790 with SMTP id
 q12-20020a170902dacc00b0013507acb790mr20042223plx.5.1630304900207; 
 Sun, 29 Aug 2021 23:28:20 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id o6sm13337072pjk.4.2021.08.29.23.28.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:28:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 42/48] tcg/optimize: Add more simplifications for orc
Date: Sun, 29 Aug 2021 23:24:45 -0700
Message-Id: <20210830062451.639572-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Two simplifications that were missing from before the split
to fold functions, and are now easy to provide.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index a66ac77c29..6feaf905e7 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1554,6 +1554,8 @@ static bool fold_or(OptContext *ctx, TCGOp *op)
 static bool fold_orc(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_xx_to_i(ctx, op, -1) ||
+        fold_xi_to_x(ctx, op, -1) ||
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
-- 
2.25.1


