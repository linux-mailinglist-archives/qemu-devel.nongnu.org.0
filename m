Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A243B790C
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 22:03:36 +0200 (CEST)
Received: from localhost ([::1]:44686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJxH-0007Mt-Av
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 16:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwh-0004Cb-Ex
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:55 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:35568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwQ-00032B-9O
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:55 -0400
Received: by mail-pf1-x432.google.com with SMTP id d12so124765pfj.2
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rDcd1B4hkbSouihbsC6aTM+tsQYAgRbIHXLOVbVbwkg=;
 b=KkK8dyUEPIAeXRm9JrzMNFk0vyLNaY53s+YVi06N1M3DQ6JcjgyplU/ppLBx7D28Ad
 2zY7ISWu621SYpnkBtKExq3MAgWe3P56Kh7U4wM+JW8Gc6x7OSe/EkB4ih/xtX+hIbGB
 jvVS76aXudR97+eaC83ow9MDt3hEYPQQA070Px9xE7WcuY5c6pGNNcIK2IOm+7bk/q7q
 KHK1ROvo2emKr7uPCOIaEXCp8zTs1brU5hWqpOBlYcXs6E6c1pLN6bhmT3iNFnJXU2sA
 4TvLX3thlVDIDIpVV0Mjxss0hSnn9ofFTLKYe/nGV8D9pAooMytZUA1Oy2hwGcErmj2E
 cOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rDcd1B4hkbSouihbsC6aTM+tsQYAgRbIHXLOVbVbwkg=;
 b=GiVoboM0vvcK8zaYOK8IGCq+xYGKUDsv4L2tyuc1zPYLqctggvQvDO7CcCZ68V/beR
 iboSKF1iEkGz3GiZCL+kh+12laEwNVVDPRl8p5g3kI2UxzRsPh1lR3PvbmSG/CbeKxDu
 qcbGY5DeYAyKBbzm1c1eDkcEgVTLcsNHJWhYel1cCE1bR79MItwj3nsx2QHRMCU3kH6f
 Mf0V+ew9eCFnIDzbh6e2pdqHWJe/SAcOSOknmMmAdScRePlK6vDiawNfU55Xj8dFfehZ
 K2X+s8cY9ersRsD+xgIF8cw/0JEn5lpTVlKly0YTYdlYg8r/gHsGrDTKNqZFRNG3lv8g
 7Leg==
X-Gm-Message-State: AOAM531pm0M5a8VgReLu+s8BHcQbTpY5OZ5LAcLcM5Lg3v3cBe+AtvpP
 EZi9I9JgjKVuzHk8IiwbIJD9wnvbb7NFXw==
X-Google-Smtp-Source: ABdhPJzehJGJ9CZ2hZjQ6lPkb8EM4AfZaLmOZJQOevSB8fOGu9MV4unoD3AQsR9q6pITrNVFGLJyIw==
X-Received: by 2002:a63:b60c:: with SMTP id j12mr30050381pgf.393.1624993117061; 
 Tue, 29 Jun 2021 11:58:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm18002849pfh.103.2021.06.29.11.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:58:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 59/63] target/sh4: Improve swap.b translation
Date: Tue, 29 Jun 2021 11:54:51 -0700
Message-Id: <20210629185455.3131172-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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


