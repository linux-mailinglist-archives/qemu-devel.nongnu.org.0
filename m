Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDB73C7177
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:49:58 +0200 (CEST)
Received: from localhost ([::1]:56284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3InM-0004yc-QX
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbW-0008SZ-1a
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:42 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbQ-0003dI-DR
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:41 -0400
Received: by mail-wr1-x42a.google.com with SMTP id l7so29611864wrv.7
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hzoBamT9L0is33IwFMKLrmnDteA/k33y/OWd2P4v5ng=;
 b=rR55kHlQIl1wQrwUm7Xj4eNLUchExUoJuFxbGK2hPb/tq6itxRee7QxMeQXHH18+m5
 dEuOfmI2C12ZOblK0FJgPYD37OBJ3lUMDj0A7dVJ5JcXxfSue26SQhPVQWKHMYmQU4Db
 irwul/UrxmiUeUo3SF0XtgJ1lHY3tCBTcjemaaydQ71Jtq6fNowUWZ35chPKdteooQ9n
 8cGS9lX575VTDi1wnwhl872p3bNlF7JIJhbGYS4HpG1dBHpnIwu1YYbvcdYkYMliBZS5
 40teNAimv/aDyVTaXQfw4E6Dv5CxhfBkUtwJ/bnPy+BPPPYexpZhmaX5PPckBBrGKIvx
 mSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hzoBamT9L0is33IwFMKLrmnDteA/k33y/OWd2P4v5ng=;
 b=ceNHWq3wRJCyQV1XCASwavulXdKbZ92PAAu/ryT6agzgnuksj+VFqFBP1XudZSarX0
 AxeH8Tg1uNv+W6MI8vRI7WKGTMFuQbjItKOQokyzNQnOsKJRIxFl/F31OkxYDdCr8llI
 O6t5+atgpLaFabmYrFOBxP9PuVxCdi3AzFVTIe57PjDsZcgZL83dZaFXzOSlreFmUaGR
 czg24MCpKTRyQltQYPdQe/Q7QsPH8yReriym0N8kvWKfj6f/AuiAo2TxZZuSbT3LSvZv
 Bjpe+ZBuoQrwYwr4tW2JDthARhZgSyNQBY3T0LPNku6QONnaK9gpPJKdgtoBO4ovzT/+
 f38w==
X-Gm-Message-State: AOAM532bsXdOcWnqpKM1NAjr3V0EuSna04+md5arzANuSx0tKmUKBId5
 3rY0Yfhg1Lm9GwWGtKOKfN85vGU4jRfUGuBI
X-Google-Smtp-Source: ABdhPJw2rxp2JLV20GQ2+1j7o80ISN4qJMoLbml6hXzdka1OlyyhsR19sZlkwh8aFnav9D+2tOPmxQ==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr5862352wrr.57.1626183453988; 
 Tue, 13 Jul 2021 06:37:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 06/34] target/arm: Fix 48-bit saturating shifts
Date: Tue, 13 Jul 2021 14:36:58 +0100
Message-Id: <20210713133726.26842-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 target/arm/mve_helper.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 8cbfd3a8c53..f17e5a413fd 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1579,9 +1579,8 @@ static inline int64_t do_sqrshl48_d(int64_t src, int64_t shift,
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
@@ -1589,7 +1588,7 @@ static inline int64_t do_sqrshl48_d(int64_t src, int64_t shift,
     }
 
     *sat = 1;
-    return (1ULL << 47) - (src >= 0);
+    return sextract64((1ULL << 47) - (src >= 0), 0, 48);
 }
 
 /* Operate on 64-bit values, but saturate at 48 bits */
@@ -1612,9 +1611,8 @@ static inline uint64_t do_uqrshl48_d(uint64_t src, int64_t shift,
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


