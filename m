Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C275D3A5EA2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:54:01 +0200 (CEST)
Received: from localhost ([::1]:54560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiM4-0006Sr-RD
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6z-0002bx-UE
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:25 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6r-0003dF-8c
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:25 -0400
Received: by mail-pl1-x62f.google.com with SMTP id x19so6162041pln.2
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T7BJEd3GAshXT7gnjM3Wy8Serp0Ny2cG7uiwPGDYDAQ=;
 b=gDQUzFhVCqTkO67z878SfPpWgFohfEH9yt9rHm+bXIE07OT3Fb/LhDdlPOxx4z3eqA
 GiXtLUYK3r6/bDpzchEHVJ+OY+SMXfw9P5Xh0nrnpvq8uMLnz1ZKC1lTl9PCPVDSu+HA
 2HU2gY+Yt9cGIo38L/ECxS8UYFQLQD9sdkCdyaWRJbLs+gMLvOyugMQ6ISNg2yIshXVd
 Tgmg2vOfe1TibzvH6NnN9VxI2BuH7lrCu057TAww3Qpeu8/hnJ4FtiL4s3LYFRAHAEMQ
 UuOlkUPRiYBYJA8zbJUrxTAIV+QvezUA0R6OZJJfW1us9+JMFj9ZA4CtViqP11DK3MeI
 oBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T7BJEd3GAshXT7gnjM3Wy8Serp0Ny2cG7uiwPGDYDAQ=;
 b=a82UxxKOkR+vvRG9f229uMz2U/+B747FK5svqO1OcEqRIFKU/XKzXvgHR8P6iPDxbS
 ZEw2iKNAKMLFDJgHBJAQ00HZOsv6vnvbotMlp/U3YrVXKd60lbulusd/nTQGs3/SpjMo
 vTYJOao/XDsTDMrd7rAsek6g8uInvRj2RQSPoyOsHF+tRi3ochhOOG2KteIjFuEp+fzC
 FyFxIIDezP8Xc2eAhbFO/bzrrLV2xAUoaMwu7AQdE/e1n9TOuhLwj5lecgaAawuXfOuE
 mK3DpsTEIxs7CIvH7JsU//lwuFIXOy/9CVoQDhKDsxCFhjfItSxTKbGlLZlU1yIdS3n9
 8yNA==
X-Gm-Message-State: AOAM532WFOPuH/TULZKuvNwUI8/bxOdgeVDFpdWBfO0cM57b82kjP1id
 9bJcc50RR8kxAlS9H9a4Nu3IX1YGszgoVg==
X-Google-Smtp-Source: ABdhPJxfMF+Pt4iSCaOLHl3S8wzYXx/RUsOFp93r9argEM9zZBfUdoEdzujb8CE5Z34XGkdJrAHqIw==
X-Received: by 2002:a17:90a:e654:: with SMTP id
 ep20mr17611003pjb.168.1623659895736; 
 Mon, 14 Jun 2021 01:38:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/28] target/sh4: Improve swap.b translation
Date: Mon, 14 Jun 2021 01:37:56 -0700
Message-Id: <20210614083800.1166166-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove TCG_BSWAP_IZ and the preceding zero-extension.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/translate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 147219759b..f45515952f 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -676,8 +676,7 @@ static void _decode_opc(DisasContext * ctx)
     case 0x6008:		/* swap.b Rm,Rn */
 	{
             TCGv low = tcg_temp_new();
-	    tcg_gen_ext16u_i32(low, REG(B7_4));
-	    tcg_gen_bswap16_i32(low, low, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
+	    tcg_gen_bswap16_i32(low, REG(B7_4), 0);
             tcg_gen_deposit_i32(REG(B11_8), REG(B7_4), low, 0, 16);
 	    tcg_temp_free(low);
 	}
-- 
2.25.1


