Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5806AB3E9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:47:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyyJ-00047e-Ot; Sun, 05 Mar 2023 19:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxi-0002tK-Ts
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:25 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxe-0007Lm-CK
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:19 -0500
Received: by mail-pg1-x532.google.com with SMTP id bn17so4535590pgb.10
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6I7Tkr0gEn5C9IQe3ln5Tw/bG/eqeOfdkUEZ9u/mHS8=;
 b=THFoH1XynQo5bP/ay+iwqFOwpGHuOTPZQrG0YZUYIFcync4c3dbMmx+mHshaeKKBNe
 +h6dPSt8VD0zRl3GA1hx75z8RCORr1b6jYVcvf+r/Qutsy5jND98BwE6x18PM14KUpiR
 OyLSdiQeW1NXkh2+HnL5RSt2j6T+knAYwNfnKzBm3u90jPkOpFHRCvDi+g1qmHsnedSc
 +ylB28ihEsQ6WV8lqVfwEZ82FP39K4CjFekXIm1dVzlCSrzJ5MxQeFuYaEajNu3oHpgs
 OtfcUe7/GonGTvO4VlLFTmRJDEPtWMFbcTyYomd7CtZz2/UmOJXYzf/PvGwTlcGwGW47
 zisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6I7Tkr0gEn5C9IQe3ln5Tw/bG/eqeOfdkUEZ9u/mHS8=;
 b=PV9xRZfDN2v3lzg/wVzv1VtMVIFCUAuLNWgLpKv6cVnVM6vBfU70kl1fZTPnPlQX4b
 4ysXot3qeA9TkzVuUEvOyKwIBOUqyMhYlNOWyxifp5wL/o3gzR02qIPykaE5YPUDx9og
 6tcglcjyalX96f/H96gdy8YmosEBuAKkSFnfe5TQ1k3oVo0PsPxO/gBYn1GU3hwTWiYX
 yloxEvh35h2OtZfeHCG63IWm8BiP7cP7DzxGb+wXBMofPmmOoYEPqwPHQ1OMLUgDyEtp
 sHatQ5Xn0MRFbjmZkTQZHwGVLOXPrJy9MTILkqGXU9f/xKnxRY0Y7gBv+niqrJgH9CKO
 FQDQ==
X-Gm-Message-State: AO0yUKV/wDJHotOHLx0Vzzj3mxmjpY4kp+U3psQ0nQXiWinT06VrbH+u
 jd4jCxDwRARyaBrJx8/lRFKJAKV6wroVaZTP5MAzxQ==
X-Google-Smtp-Source: AK7set9eMcvSYdoj/aWVbg8OO6rsbfWgV/5Afk0JD3XhAIKq8ip9jc2z0r7R7J2mUbSLz/XL86TuCQ==
X-Received: by 2002:a05:6a00:796:b0:5a8:e3d5:d7d4 with SMTP id
 g22-20020a056a00079600b005a8e3d5d7d4mr12449309pfu.7.1678063456757; 
 Sun, 05 Mar 2023 16:44:16 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:44:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 68/84] docs/devel/tcg-ops: Drop recommendation to free temps
Date: Sun,  5 Mar 2023 16:39:38 -0800
Message-Id: <20230306003954.1866998-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/devel/tcg-ops.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/docs/devel/tcg-ops.rst b/docs/devel/tcg-ops.rst
index 561c416574..f3f451b77f 100644
--- a/docs/devel/tcg-ops.rst
+++ b/docs/devel/tcg-ops.rst
@@ -951,10 +951,6 @@ Recommended coding rules for best performance
   often modified, e.g. the integer registers and the condition
   codes. TCG will be able to use host registers to store them.
 
-- Free temporaries when they are no longer used (``tcg_temp_free``).
-  Since ``tcg_const_x`` also creates a temporary, you should free it
-  after it is used.
-
 - Don't hesitate to use helpers for complicated or seldom used guest
   instructions. There is little performance advantage in using TCG to
   implement guest instructions taking more than about twenty TCG
-- 
2.34.1


