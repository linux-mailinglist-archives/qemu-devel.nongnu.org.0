Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A29A6FEDA1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:14:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Lc-0007HU-Qn; Thu, 11 May 2023 04:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1La-0007ER-1o
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:22 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1LY-0001wp-Dx
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:21 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-94a342f7c4cso1466701166b.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792499; x=1686384499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zWzZj4XIntENO/xAWOBchS++0j1IHClHqbogxDhHrI8=;
 b=VfBD2Q3nC4FfGmqVFq0EB6nwR+TLWcysemzsSplOQzEtKgFl6R22yzishkDSGwVJxl
 R8V4zaXEDQKl6t+4NMTRKPIvsQj9pO4J7zmYIf7uZ9Ols7JRVry41PkwUoeLHNx/B7Lh
 RXg+kjLrVFumZVUQWnDW+L2o2oPdmZZCg7YC4STOqYFmnvh32evzSVjt+Pa3fJ9vQzwu
 VhkjvFQGW9K1ynlAwHgiu/rE/0POoJ4HjvC0uPTHzIaRZIxaOODefuHwHNPoFLEyXWKI
 +9lTBzyOJnRXrNtG29ISpJbfWZSRHXyA5hSX7VYMiKYkW3KZPe/EuZJaNWpZLVc91qP0
 bk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792499; x=1686384499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zWzZj4XIntENO/xAWOBchS++0j1IHClHqbogxDhHrI8=;
 b=HO1TZZn3Kew/v+d7ONykjvzk9/w1NMpTl1/o3enpz8IrhXBThgUsR7TUrJNjH+PQl6
 14Cm0+KufAw9+WmBkpToK091d4I9a+FfnWem0XRw++GcXX0tBKuzFYoVjTQ3x5r39WF9
 Wy6uX7bDnLfMgypgQjLm6QZboQP1cA5D1FeCqp7R75P9wmm7CZFZBufTxKCmyHZtkv9a
 LJLht20j+pc/2lavAPwyZGSj3KWpctGn/A8e4OG5C8PO+S90RYphGmlqu5Gusjm0TLA/
 0J15+qvFkagATdfaNmzi2dyIhHYSorDw2/HIbxhW+Z98cZZGA9wbuc4PrRx/6oUoBeCc
 Q1rQ==
X-Gm-Message-State: AC+VfDyZl9xdowq6APYuKnECNekqKXzaDIP0kq2QSvewUORNlK/ykePB
 UuPThczGfnOve28olu2/Uw8Q/GRQLJFzix1YbrZ7uQ==
X-Google-Smtp-Source: ACHHUZ4mdEP09j27mpHkQ2/Qev0B+GeEpcefk6JzHcNmDCSzw+4BxeZSV49y5SZUqxAQaLrwGmGvbw==
X-Received: by 2002:a17:907:869e:b0:93d:ae74:fa9e with SMTP id
 qa30-20020a170907869e00b0093dae74fa9emr19713813ejc.7.1683792498916; 
 Thu, 11 May 2023 01:08:18 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b00959c6cb82basm3635225ejc.105.2023.05.11.01.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:08:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 43/53] target/mips: Use MO_ALIGN instead of 0
Date: Thu, 11 May 2023 09:04:40 +0100
Message-Id: <20230511080450.860923-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The opposite of MO_UNALN is MO_ALIGN.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/nanomips_translate.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index b96dcd2ae9..a98dde0d2e 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -4305,7 +4305,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                     TCGv va = tcg_temp_new();
                     TCGv t1 = tcg_temp_new();
                     MemOp memop = (extract32(ctx->opcode, 8, 3)) ==
-                                      NM_P_LS_UAWM ? MO_UNALN : 0;
+                                      NM_P_LS_UAWM ? MO_UNALN : MO_ALIGN;
 
                     count = (count == 0) ? 8 : count;
                     while (counter != count) {
-- 
2.34.1


