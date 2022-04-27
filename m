Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF88511042
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 06:42:29 +0200 (CEST)
Received: from localhost ([::1]:52328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njZVV-000472-1X
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 00:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njZSx-0001IQ-1L
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 00:39:51 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njZSu-0007SU-Sb
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 00:39:50 -0400
Received: by mail-pg1-x52b.google.com with SMTP id r83so554126pgr.2
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 21:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mvRig1nFgvxtwsEdF8GyeeEoyjVTBGh15NALcLN7Zm0=;
 b=Yu7d/kXROEeLSqJaaAVounzKK/oo825RWn0/DAOqWyeI+jBIlBjRenjbp+4DwsMYP8
 8K4xK0Z/x/fXjr5yItF+8M9/KDdhMlvJ2cKxK1qdustLMo1fQWJhsoQH/4uhrHN9a31N
 NUaL2HoA/dnQSY4het0P735RJLj7zRm1uqfJJUCBqCM0gO9PhWDC3O/ZzSqWbcLYWDpk
 QcVfpwE1HxMsarEjBCePRumXlyRnqea3nSpS1uYNMxuKnt2MTubxVsBg3Cii8Rx2MVNf
 q50Pqi0fyqIfHAfhd9iQ0ukZK2BXA4HmiPm16vnqVHdQFJAfKrNNQO8kes4Yi5ffXM7c
 bl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mvRig1nFgvxtwsEdF8GyeeEoyjVTBGh15NALcLN7Zm0=;
 b=tlZpzr40zxAXVlMWuaYpv9vU+tEb1XZ9sAftOBEOYyqUjgFJARCZSTuNZeTJHLGJOw
 ZbkgFDe2+ZWZgFUKdZcZbosISWXrAVxUwUemlwRa2XhYFBuH+wnMIpYjrnd9Gng8kPwb
 TwNVPLeEVcfOAV4JVKDi7JZkCEdQFtxNG5kS/94toVaB6JDUVZuG3gDSrCNyVgAxfIvb
 liJ/4279zDhruIyPFOQcAIDm6k30Krw8D6ngrdhNCXuzYeeK90ODZYo1+pSCCBCvyh+d
 LXQqFvXBEmZKggXaM3RavPcBEtKuj55wxYyiLkKxlP1ZRUJDxlj4WslrwfvcEDN1PhEZ
 C2Bw==
X-Gm-Message-State: AOAM532ynFJOqek1HgBTIfMwaibTj8weJEMgz1Zc5hS975RN0WwQoQUR
 55y0keVmUIoW+XS0PAk/9X5oJWcGEm+RiA==
X-Google-Smtp-Source: ABdhPJwnzOOPKmcBijrF7ndT1Ote2KNX+BRc7pUpfOJJzxiyxWvwJ19Vye2chyRZhSX4Aw0vh5vn6w==
X-Received: by 2002:a63:5d60:0:b0:3a9:ef9f:eac2 with SMTP id
 o32-20020a635d60000000b003a9ef9feac2mr22280086pgm.553.1651034387372; 
 Tue, 26 Apr 2022 21:39:47 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f16-20020aa78b10000000b0050a81508653sm16875632pfd.198.2022.04.26.21.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 21:39:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/6] softfloat: Fix declaration of partsN_compare
Date: Tue, 26 Apr 2022 21:39:40 -0700
Message-Id: <20220427043942.294654-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220427043942.294654-1-richard.henderson@linaro.org>
References: <20220427043942.294654-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The declaration used 'int', while the definition used 'FloatRelation'.
This should have resulted in a compiler error, but mysteriously didn't.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220401132240.79730-2-richard.henderson@linaro.org>
---
 fpu/softfloat.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 5e2cf20448..e7d7ad56bc 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -874,10 +874,10 @@ static FloatParts128 *parts128_minmax(FloatParts128 *a, FloatParts128 *b,
 #define parts_minmax(A, B, S, F) \
     PARTS_GENERIC_64_128(minmax, A)(A, B, S, F)
 
-static int parts64_compare(FloatParts64 *a, FloatParts64 *b,
-                           float_status *s, bool q);
-static int parts128_compare(FloatParts128 *a, FloatParts128 *b,
-                            float_status *s, bool q);
+static FloatRelation parts64_compare(FloatParts64 *a, FloatParts64 *b,
+                                     float_status *s, bool q);
+static FloatRelation parts128_compare(FloatParts128 *a, FloatParts128 *b,
+                                      float_status *s, bool q);
 
 #define parts_compare(A, B, S, Q) \
     PARTS_GENERIC_64_128(compare, A)(A, B, S, Q)
-- 
2.34.1


