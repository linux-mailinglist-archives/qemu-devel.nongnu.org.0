Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B526C3AF981
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:36:39 +0200 (CEST)
Received: from localhost ([::1]:57542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTT4-0006DV-Pd
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTCB-0001Dx-3Z
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:11 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:34355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC8-00062f-3c
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:10 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso736222pjx.1
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EzJ1xh0bwnQkkpHhQH0S/Akj7K6Bvw2BctkCRqh+aEM=;
 b=qL6sVl+MIvj9Top58LYsb6SMS0EK9uaUjfbu3KZfiHahlYRCNbpenfR8HazhgVkR6n
 vG6Bjoei3kkeINbDmoQPbxc7UjlH74liOpQLxFO4wzXe3RGfPIQ6fEWGhTgDmIm/x3cm
 B15Zj0OlHYhYXa2UdRSGUqyvsFZIhGyyqij6+WOEv3zmesLvU90mz7igJ1tI6apHOL9r
 qsRPo0pLyNuP19J1dvXNw3bwDzcDxsM8oFMCiYPPJRZsPHYHYEaQXxSAmSU6JvMxlZ4Z
 Rv+TX/HQdp3uCKm0vKMuMr6lN7TMnaoicmS49RCc4Cv09hY8t7oHoKMtXdwP7hBQGcot
 SUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EzJ1xh0bwnQkkpHhQH0S/Akj7K6Bvw2BctkCRqh+aEM=;
 b=R8YXMSLDf60HjYcaWMr+3yuVZvNFbbgqO84nCUndqtf0yOsgCMnpj3oMwDYoBjXV78
 fKT9Y7hltQsAO19yhsxQGO9rTvLLkbK2Ra6VVAfV4qTngfvsH1e0KR1kFDgEiIRtDkxE
 qwnuuA9KZ3LQJWAPUl+dVdNzkLr8UrdiqEeUett9TrdWDJyxa3AFHvVT8NL52wJGnykp
 h6kpj1hbssWkN2+D8f+lkgUJd+LIh1eYzzw2BGlGYP+MGRd8N57ep5dvsXjknwO9nD8+
 53P+qIjI/uSDGN4aKn/qcZHDDGie3OEvnlROvFg5rY7r1wqy4h+u1Lm2sjox1LF6QWJZ
 +ZEw==
X-Gm-Message-State: AOAM532ezkAoGvuYrD47YR+FSvJiXiPFRMxIWLO9LrOAAz6ac9EnrS6d
 mp4LUy1V7gz7GMXPxtVE0hnci4vwIvnstw==
X-Google-Smtp-Source: ABdhPJwHfFPptaEN/7hWD2iu3AD4WkhYH8MmrE5ZsKrcdRGOrMk/7JXMlOzJuMkDa88KUQHsU+nyug==
X-Received: by 2002:a17:902:ed44:b029:11e:c5f6:9d45 with SMTP id
 y4-20020a170902ed44b029011ec5f69d45mr19800231plb.55.1624317546736; 
 Mon, 21 Jun 2021 16:19:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:19:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/29] target/sh4: Improve swap.b translation
Date: Mon, 21 Jun 2021 16:18:45 -0700
Message-Id: <20210621231849.1871164-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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


