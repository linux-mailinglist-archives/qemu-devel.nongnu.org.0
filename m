Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665523B4D3D
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:52:17 +0200 (CEST)
Received: from localhost ([::1]:42480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx2Aq-0005rx-Ed
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vu-0002Qg-TG
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:50 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:33601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vt-0000RU-0T
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:50 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 bv12-20020a17090af18cb029016fb18e04cfso1466920pjb.0
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rDcd1B4hkbSouihbsC6aTM+tsQYAgRbIHXLOVbVbwkg=;
 b=l9DVngc1GRnGkdI2SMnU4cN3T17wn7aFj9U82jb/ByzF/Kb73O8xQwdx7ju18gg03o
 MLBJM9taJCZClt7LvfPFpgz+YQ0Po0ZEji2QyV7WTwVvx3R8k4v7NYoiobyuuGT2uX+T
 P3EvN5kFTiL1ffW0CfuzXYvL3wzHmCEX8/hnKAMDPka2rr8D2Aemf/c5b9AyDo+vCKvl
 o+0CJ8EcmPC1ngqDd/F3rTcQDer71QnM1HhJmJz3nuTycHYZdtjnyl/XQq3IlWjssdm3
 krpbcZCuxJtmJEQdhtXQJhVGW58LI20YqEjQHYPo6Nqml9yq/b+rID9mQsKo0FqXzMQD
 g+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rDcd1B4hkbSouihbsC6aTM+tsQYAgRbIHXLOVbVbwkg=;
 b=nBuywT3DWj5X4NkCN2LGM4yi5bsOE5nq+7keSC8MPpmmUQGPWBdfgAnFw1moLU8oLw
 wZMKx8arPyiPiy6JZxIAx2QWMut3uyEjgaub9fd4WViqoZZynnWg2rSNFnaG/4qSjn2y
 5IG5j4sstLkGDsbSwnLZ1jHJyO2COHcWI7bNIB3eONDEv3gUZUoFCtIKHGyXBnkTkFBi
 ojfHaVpsyI1ZT8qMa6xscstvuGAH9ZXyMuwefB0eNb5yYxCx5+1QGkVVHothWDehgJ7g
 wmXfOLRWeQ5UC1tQIySEKxmfOGbCjWvul18vx7nm14gkNkuKFDdmWcsoaMse1TCvrLZ/
 ph5g==
X-Gm-Message-State: AOAM532tKWjbdWBN9JfLuf5phUHk+915fX+twpibdibo7Lp5O2IdKTDt
 uT4GbYov3SqpOypeL8v2XPOV41Zu2m2OxQ==
X-Google-Smtp-Source: ABdhPJzvupSetxjnrrx5i+N4s/+AQ4cCpFycK2bN4FH9f6BwqD1F5w7d4n1/OyozPXU7Iip2R0cLeQ==
X-Received: by 2002:a17:90a:b111:: with SMTP id
 z17mr12243005pjq.57.1624689407771; 
 Fri, 25 Jun 2021 23:36:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/29] target/sh4: Improve swap.b translation
Date: Fri, 25 Jun 2021 23:36:27 -0700
Message-Id: <20210626063631.2411938-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove TCG_BSWAP_IZ and the preceding zero-extension.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/translate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 147219759b..4dcfff81f6 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -676,8 +676,7 @@ static void _decode_opc(DisasContext * ctx)
     case 0x6008:		/* swap.b Rm,Rn */
 	{
             TCGv low = tcg_temp_new();
-	    tcg_gen_ext16u_i32(low, REG(B7_4));
-	    tcg_gen_bswap16_i32(low, low, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
+            tcg_gen_bswap16_i32(low, REG(B7_4), 0);
             tcg_gen_deposit_i32(REG(B11_8), REG(B7_4), low, 0, 16);
 	    tcg_temp_free(low);
 	}
-- 
2.25.1


