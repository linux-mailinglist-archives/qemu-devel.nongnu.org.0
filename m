Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6956E43D9EA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:39:01 +0200 (CEST)
Received: from localhost ([::1]:33986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfwFo-0002LY-Iq
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPm-0001cN-5y
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:14 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:50931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPi-0006UH-RU
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:13 -0400
Received: by mail-pj1-x1035.google.com with SMTP id gn3so3612220pjb.0
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UvnOEYcQnp8j/yc4rVZsMaNR1mFxyTm3qBQfekyS408=;
 b=y4UGZHo/gYpnmImKlAbfQZogwMEQA1OOmPXlRUzQWWOL6y1HluHFCvwCiRoKIox5XS
 QHzsu9XzWzOgZVILE2COE2Q8j8vv5BvILDfBjeMxyNcrwpSG6zExmm2r3XWYIj7wiR+M
 VLh1YfdUiv5Fxv+m1wOea/C1C73la3NEL36vmUx/tVZt7ikXM2HU+RJk7MEzKxANgRyt
 AzquS4RHYeK+Tz0sRa2QR53LjaLP+3eOIZpAFUbQS+SwkN67eVv7SohY1EU4zDuPI8Ta
 yiW9zTi82ZwPymswlbmLikc5CNJpVDwNh/b1fwvMR8uPdhhbuW2UR52c4XNlGVzaRM3T
 fU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UvnOEYcQnp8j/yc4rVZsMaNR1mFxyTm3qBQfekyS408=;
 b=ZuwTo65S3gyaWgGHmBo9MrVh2puWyNnMY/4z9NLylw2mVAbgWwjnclTIvJIY7TcoU3
 HVOt0w/tGai5/qaffuO1e2jjgWNMUSpU3hPjeIclmg6B+yZU5L/j9VHhXA7x5JD71ETR
 gJ5bePmi4v1FuBR2WjzNnRjPpt63+fP0lbFr5VHWX6tywFS6Onb6dKwTaQyyjmP8e06r
 s9OHvMqsWY2qbwbqsSQUL9tRuSky8OcQlSo4CqTVbPoPFQUIv314Po6ocHDEpfboVBox
 Z8zIz7Lbg1mgBNWCeUeSs5nfABCS1gdrwEoyEVgToqe8ZEQYclQnqX3nXms+LaLzprei
 +32Q==
X-Gm-Message-State: AOAM533/LvqrZJVcUel83Q4H2uXT+Swz7UygG8qo6o8g7JxtzcgEJG2G
 QCVE/oNYF3/N86Z4StSOcTPJ2RsBI7ibpw==
X-Google-Smtp-Source: ABdhPJwBuoZIqX5LZlW9+wRVRWbPFRLQWdm58egeFKph97PS/ofq0itDN/d83v4IzqFoYXBRunA43A==
X-Received: by 2002:a17:902:6ac7:b0:140:14d5:cfb6 with SMTP id
 i7-20020a1709026ac700b0014014d5cfb6mr1264335plt.58.1635389109168; 
 Wed, 27 Oct 2021 19:45:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z8sm995907pgc.53.2021.10.27.19.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:45:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 54/56] tcg/optimize: Propagate sign info for setcond
Date: Wed, 27 Oct 2021 19:41:29 -0700
Message-Id: <20211028024131.1492790-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The result is either 0 or 1, which means that we have
a 2 bit signed result, and thus 62 bits of sign.
For clarity, use the smask_from_zmask function.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index de1abd9cc3..5fa4d7285d 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1730,6 +1730,7 @@ static bool fold_setcond(OptContext *ctx, TCGOp *op)
     }
 
     ctx->z_mask = 1;
+    ctx->s_mask = smask_from_zmask(1);
     return false;
 }
 
@@ -1802,6 +1803,7 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *op)
     }
 
     ctx->z_mask = 1;
+    ctx->s_mask = smask_from_zmask(1);
     return false;
 
  do_setcond_const:
-- 
2.25.1


