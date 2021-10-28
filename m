Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488E343D9C7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:18:59 +0200 (CEST)
Received: from localhost ([::1]:51826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvwQ-0000ae-0f
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPl-0001bo-9q
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:13 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:39696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPg-0006Dx-RZ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:12 -0400
Received: by mail-pg1-x52f.google.com with SMTP id g184so4932461pgc.6
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SdotFvU2e4IHfnDwno1rmmgso4RvH1V9XL12SznLyiA=;
 b=Z2Clh9uYEpfuvRVKCYW5X8NuN0FmCTjjm+dolBcIIRYBRsxPysVWySIrdROzKINml6
 CZBa6Wk+t6XVbwORVvuFVNy2hv49BVAdVX2qkZbAhWzHTBoGSHuqP7ultmcRdEUJiujE
 H82tWbhU05pUqMoRC9E4UoeM/3miHU3CWNoHqmy+wtPSaeaQeedee5QwLyNia9dZo/3Y
 gtnfa1CWwa7ggh7kMKjgz1LbAHYogcy360+f4AnIIRmiWUGuAX+iBvYsWqNBM3nZ8jD7
 iicZSLg7/k9ITc52Kc1oq8rnryMW0+AEaye4YPsB/ZZ48o0JKoCQN9vs3lM/CjhEeTXi
 CVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SdotFvU2e4IHfnDwno1rmmgso4RvH1V9XL12SznLyiA=;
 b=p5zoN0HvusE/8taSRTEfWMA+6cFavdASNImzc2oiZRga24VZjuj7esZXSv3bW2RDIx
 rDEhNy+1tlwqcg5Tzu2+TTAqtDcV1J7Ds5TmLow3iLi6CSysSZPFIKMSyPfR/yYsPtjW
 wDq6M/GJU9v2kvOcsus+t3lfILdN7EJblUWqlMEuL0kcEnCcAmzSwepvvx3v3nLERCsO
 FVeqp1NXQHn8G3CR7Q4dqYnZsAjz04kKmf/EWoQNsTZLAgjZFzhxZlnKAnlJ0R+BedkD
 zLcPQ8iafxHOkoNzTDjY+EvzYY/YLZvl1CQBGL0OSyADwwjFCQYq54s6eBxbpg0vCy1T
 5Sbg==
X-Gm-Message-State: AOAM5320k7rPc4y7DDoTRfnXZ3oATI8XFoajdNF09TFQlcMRvoGPw/r4
 GukbkV/BqP5H90H1+oOCqFU6xnaE1e/0dQ==
X-Google-Smtp-Source: ABdhPJyAMGfkmYnhfKw+ji38zYaHJM2cNMQT/yc/3zbihYdM9qRNO9AvDhlVWu4v2NLpCwBenEkbCQ==
X-Received: by 2002:a05:6a00:2443:b0:44e:ec:f388 with SMTP id
 d3-20020a056a00244300b0044e00ecf388mr1368424pfj.7.1635389106293; 
 Wed, 27 Oct 2021 19:45:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z8sm995907pgc.53.2021.10.27.19.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:45:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 51/56] tcg/optimize: Use fold_xx_to_i for rem
Date: Wed, 27 Oct 2021 19:41:26 -0700
Message-Id: <20211028024131.1492790-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Recognize the constant function for remainder.

Suggested-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index f8b0709157..7ac63c9231 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1624,7 +1624,11 @@ static bool fold_qemu_st(OptContext *ctx, TCGOp *op)
 
 static bool fold_remainder(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xx_to_i(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_setcond(OptContext *ctx, TCGOp *op)
-- 
2.25.1


