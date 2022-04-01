Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ECB4EEE19
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:27:56 +0200 (CEST)
Received: from localhost ([::1]:58524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHJj-0005nP-9l
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:27:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naHEj-0007bs-Sd
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:22:45 -0400
Received: from [2607:f8b0:4864:20::32a] (port=39787
 helo=mail-ot1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naHEi-0006xj-Hj
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:22:45 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 a17-20020a9d3e11000000b005cb483c500dso2106273otd.6
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RbIV1+8NyqMJlYAlK7WMJI7CdKY136/WMhV7maG3bQw=;
 b=N5JhM7vd1/+ttZgA3ovc3BAm9ZxkmQYMeWRxVIz9gc+Jcn8PsEQh3RhvasqyJndYUW
 gQ6QPIMGBKtndW07jzKzpXNMPMdg5YOwi+k8l4crXsnIHfz780x9PRyTlql5087wZXpZ
 lsEm9+nsdpy6grqd2VG0SyfibAyvEFG6W8kLWVg0TOtakVsrMDRuxwI/Ve16UfJzTNS+
 6sDIIwZRsAvj2ZX+zWOWPi0Xte3mT21UzCCpXg3OQcYYebZR1fVxlgX93tV5JMhG/WJO
 bUDymzdJeMp8lyosj3yiLgo03XwThxfMSkL3l5GVyLy/xU7Wck8pji5zOS/KjtrGpDm9
 ctGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RbIV1+8NyqMJlYAlK7WMJI7CdKY136/WMhV7maG3bQw=;
 b=BWrmvKrVn5iO3Q6PfrCK49smhVohJ38yDOg2hAI7tWPHXiykTO5j6cTjVbNqpvbn91
 x94c40dfH5m4QKoqFZ2wF55U6PhZ1oeLKS9N9kIDhBVEFokfV/3D2ScmYnmqMrZLCFNR
 x3sIXmod+zxGsIgmMNVlhY2uFwzPOke6g2Kx731nimxQ95D+NnMPQcfRCO9yKscDEWMe
 RkgxIgHw6QrMwmX7rj7kAbggyIvLzRPTYr9vN79wA+jqgHTEIpXWoZYPikGttVgkbYjW
 S9z/0q+QsAttfn+Coy1Y3tcIbpyz1EUdOXvnYOEhvwD4rswEj8SZ90cXQ0pGEeYj1tjf
 7vAg==
X-Gm-Message-State: AOAM533JXzvhM8DwmJjezxF+1T6HSA73RLaCD/tsdC/47Z5pekU+pUcj
 aos5FCQxU6HSGhClTUlnT6Rp+mPTYuTJx1QmPfw=
X-Google-Smtp-Source: ABdhPJzCjc9CfXxpAiZmTM0luYlIZlZN3nKc+sDhCBggWuPvHLgeLDSTQbYded7izcAhYbdly4lQSg==
X-Received: by 2002:a05:6830:1d70:b0:5b2:2c27:be29 with SMTP id
 l16-20020a0568301d7000b005b22c27be29mr7415773oti.89.1648819363510; 
 Fri, 01 Apr 2022 06:22:43 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 x1-20020a4ae781000000b00320d5d238efsm1006935oov.3.2022.04.01.06.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 06:22:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] softfloat: Fix declaration of partsN_compare
Date: Fri,  1 Apr 2022 07:22:38 -0600
Message-Id: <20220401132240.79730-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401132240.79730-1-richard.henderson@linaro.org>
References: <20220401132240.79730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The declaration used 'int', while the definition used 'FloatRelation'.
This should have resulted in a compiler error, but mysteriously didn't.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 7f524d4377..7e62fcf414 100644
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
2.25.1


