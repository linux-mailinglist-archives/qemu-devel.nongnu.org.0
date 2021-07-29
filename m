Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5CA3DA204
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:22:03 +0200 (CEST)
Received: from localhost ([::1]:36036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9470-0003zX-1A
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940e-0000FY-TI
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:29 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940W-0000ze-U9
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:28 -0400
Received: by mail-wr1-x42f.google.com with SMTP id b7so6454411wri.8
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SngGo1vVY/dtcXAMZ+FWnV5QnI/yJF6vZ4XQ33WiT+w=;
 b=BU/lZOxZuQ/YyalcmqPglVnC9D2ypjEIpi2DwBz16NjDeHsYMUSODtB9HJPxQ1u/91
 VDrSsEBBBv/BbhiRO0i8+CHB9wV8PDGre4St7kn8+8kvEFKYIbqB8H3Vj9VNOi8z9cDM
 4jERJ1CuAcvYN1ntH+3jcBGC+M2zcDJOe7QPhjbosu9lvjngnb7/2BLK2nJpkBZB5TsX
 sgOLNYJHS4Mwdfb2rUkChbRgZ+Dc9hUj3qfUDZr5oRdRHhHES2PcaY/raLYMNJMJL+Ua
 Q/VJoKW6++wf3g1ykqgG7aSu8aTXjSEO7tDoDEr2kx9ddLRVbwpgL0JwTZSzkiC5RWNW
 rJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SngGo1vVY/dtcXAMZ+FWnV5QnI/yJF6vZ4XQ33WiT+w=;
 b=DZOm3ag+y8nPoumv3ALiTSqxJlQhieDTwTeJW3SQRYnaXq5JpEhHXnSWO5u5aC9lgV
 NmIMcPF8GPvyhIYo+1UjSP8m4vT+BJKBi0Qp7aDpIQnPCn529XwPCRh945XHB11OZ9MU
 rGuq9vPOg8daLgpMo0WXPallor9yvhHMxatKKgRF8L82o9d5RDzGEcmMrZ6Gs5yTceiy
 0CKAh1ch6KaA8Z8+smTljWXfTXPMI/ou4+Xl0CFjRV7aJ7Ak6HBvexIm70gFL7RwOvsy
 2kJEzcUnSMncrLg8tN+MarHUwnovAm6H7qMLI5q4CsOlGTAI/ahTOx0WH7JypRbCOLhn
 94/Q==
X-Gm-Message-State: AOAM5332akkmHkGUBTm7+zvZ2WsDK0cwOtYhmfdVItjGLzKLq24Qp4u1
 R6oFVfXVHud6ydNaNs52Mb3gNg==
X-Google-Smtp-Source: ABdhPJzlYQlXsopXEiAnO6slvFlXfa9APv40jm1pHY3rAcFZVapN2QhIpFMFqjoHnJNsh5QkDV8pVw==
X-Received: by 2002:adf:a409:: with SMTP id d9mr4284457wra.237.1627557319627; 
 Thu, 29 Jul 2021 04:15:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 06/53] target/arm: Fix 48-bit saturating shifts
Date: Thu, 29 Jul 2021 12:14:25 +0100
Message-Id: <20210729111512.16541-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In do_sqrshl48_d() and do_uqrshl48_d() we got some of the edge
cases wrong and failed to saturate correctly:

(1) In do_sqrshl48_d() we used the same code that do_shrshl_bhs()
does to obtain the saturated most-negative and most-positive 48-bit
signed values for the large-shift-left case.  This gives (1 << 47)
for saturate-to-most-negative, but we weren't sign-extending this
value to the 64-bit output as the pseudocode requires.

(2) For left shifts by less than 48, we copied the "8/16 bit" code
from do_sqrshl_bhs() and do_uqrshl_bhs().  This doesn't do the right
thing because it assumes the C type we're working with is at least
twice the number of bits we're saturating to (so that a shift left by
bits-1 can't shift anything off the top of the value).  This isn't
true for bits == 48, so we would incorrectly return 0 rather than the
most-positive value for situations like "shift (1 << 44) right by
20".  Instead check for saturation by doing the shift and signextend
and then testing whether shifting back left again gives the original
value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve_helper.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 847ef5156ad..5730b48f35e 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1576,9 +1576,8 @@ static inline int64_t do_sqrshl48_d(int64_t src, int64_t shift,
         }
         return src >> -shift;
     } else if (shift < 48) {
-        int64_t val = src << shift;
-        int64_t extval = sextract64(val, 0, 48);
-        if (!sat || val == extval) {
+        int64_t extval = sextract64(src << shift, 0, 48);
+        if (!sat || src == (extval >> shift)) {
             return extval;
         }
     } else if (!sat || src == 0) {
@@ -1586,7 +1585,7 @@ static inline int64_t do_sqrshl48_d(int64_t src, int64_t shift,
     }
 
     *sat = 1;
-    return (1ULL << 47) - (src >= 0);
+    return src >= 0 ? MAKE_64BIT_MASK(0, 47) : MAKE_64BIT_MASK(47, 17);
 }
 
 /* Operate on 64-bit values, but saturate at 48 bits */
@@ -1609,9 +1608,8 @@ static inline uint64_t do_uqrshl48_d(uint64_t src, int64_t shift,
             return extval;
         }
     } else if (shift < 48) {
-        uint64_t val = src << shift;
-        uint64_t extval = extract64(val, 0, 48);
-        if (!sat || val == extval) {
+        uint64_t extval = extract64(src << shift, 0, 48);
+        if (!sat || src == (extval >> shift)) {
             return extval;
         }
     } else if (!sat || src == 0) {
-- 
2.20.1


