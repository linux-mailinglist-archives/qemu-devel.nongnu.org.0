Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7563E3F7372
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:38:48 +0200 (CEST)
Received: from localhost ([::1]:48320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqIx-0002nl-IT
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqG0-0002mh-3J
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:44 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqFy-0005G5-2M
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:43 -0400
Received: by mail-wr1-x434.google.com with SMTP id q11so8711981wrr.9
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SngGo1vVY/dtcXAMZ+FWnV5QnI/yJF6vZ4XQ33WiT+w=;
 b=pZdogSgJ/TB3lZjG1JLJWkiEBT1JGwqd4sSClEMumLC32SPTF1YMGZcVouXtANP8p+
 Jku87yUA4OFrDKGcbw7AZ2AOIVKUdbvCDQZ08fG/kwguB9s/s9eHdBz1g51DV+XGa4or
 fYPWkqYLIXqeddMS8ko2JsRgjLR7k8RYAwY+U17ojbeC/9yvJgU4+W0JssOwCF5cUcRw
 m2dbfZ5rTiCOxqjKTLk6IYB8JeoUc3DubXJr1HhtYfDoGxdQrWnR8yKWgwkprVRfkVy9
 QzBnz3dyj6UlXcj9tAoXTUml9JTz/+gS93etdnOxNPEDpEPeSBCOGkRT2JAEQLitsqO5
 mVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SngGo1vVY/dtcXAMZ+FWnV5QnI/yJF6vZ4XQ33WiT+w=;
 b=F/8nxOg/i0NXbIjJsmnYsJfW4lZHJ7AznBkXd6XBDKV0fqYpUD4wNNtydJMjMohoIc
 K1a13Zy27MBqV5IykA2drcT5EEf+/hnMvQaRw7hVL63JxVjLu21R811kA8TIfLWjBODU
 1ydOc0FPT36tOMUBCPBYatV/PlnNWxZ9u44kEdoUaMz56PCMjQ/8cfs9odOMhTgvWQer
 h1HX7qNthN4h+5S/GqfeKKQO+6b2Wgr+4ky/bsAdjX5d/mwtm5k59FScCqFnM7E+vaio
 ScCGrP1GBUat7qkPdkEXRI28pBQiNftZuqnthWI6s3UzIQyAK/CC0b6/93tNNiw6Ggb/
 2Bqw==
X-Gm-Message-State: AOAM532qxQkZxGVJOZ4T5ojHH7WFtc2t8znf+TgroUD7joW0BK6Csnce
 6TdoYPNrrVEOXCsUsGFz+7TpO1he8eLEEA==
X-Google-Smtp-Source: ABdhPJzjPd4x78JWdF/S5lz1D1zQJUNFVVe56APqXRMgV/LGbQbmZ9SAUOJ2753CA6eDw3wUaLD/MA==
X-Received: by 2002:a5d:5983:: with SMTP id n3mr14864356wri.227.1629887740722; 
 Wed, 25 Aug 2021 03:35:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/44] target/arm: Fix 48-bit saturating shifts
Date: Wed, 25 Aug 2021 11:34:56 +0100
Message-Id: <20210825103534.6936-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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


