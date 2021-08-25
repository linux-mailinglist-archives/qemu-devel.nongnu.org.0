Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD2A3F7380
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:41:01 +0200 (CEST)
Received: from localhost ([::1]:56498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqL6-0008Qw-UU
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqG0-0002oI-Fk
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:44 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqFy-0005H0-QC
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:44 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso3921163wmb.2
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sUJ1aC1phOvDbqezcommWBZIEjhB/McSlKBhbLrt+C0=;
 b=ooy6h3zQPvYteRWIrvCUxuE4UAmETQENJtEt/Qxa+8zEg2MjnlUjrwsFKAicFO4ulF
 urGFfchDMxINuCZOe7qky4EULzBdGKayfQ8K4Gc6UK4+a0t3y5db0+bAI3HS4A8VReMs
 9jjz/b2zISUto7sG2+X0uWKm9d4TO2hYoumEJzRq1lsm57knXDiavcLzwk7dnetERvqt
 /JgOvVeqP0NhVaKbIXVQsIF/5iP0tbrTkMo1Bo138n0don/bd34d6IYXvaH7DvcIb8Wg
 R4aSLHmfhrzXZn4y2oHGAnO4/Zf/M5UhPK+fBEIv86RQ/tUOPtFKZDYSb44sapmJafWm
 qP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sUJ1aC1phOvDbqezcommWBZIEjhB/McSlKBhbLrt+C0=;
 b=Xu7EyWBEe4OHSNISDl9xjEUbc0Ucu16a+K0qBFfpBgDsPbmh4728hLwkcrK0+kojTe
 IqyOsHMmHtrjXYROsgt5KvxfKRCFbT24kIo9wzpKJ9EZ2DXlGF7uVsVGcIVUrqmfNPW6
 QSmZXf4TFoNlvDvrMnYscC7N1hJE+4qpW8tLAyzFUubhd0UpkwyfyEDyX9LjxlzrcLEp
 EqiJpd/r1iIp9ZlRfoNFjnxQRzvscxRWnCSrHDcBqU9FROJdaOiKia/WFW6aHFmoxqym
 aCCClnBUjeZs7jAPnGhYo7z1VUO7yC09mtQquT+sG3GxZf4YQWWUu1Hu5YaPnbBrlWP9
 HOiQ==
X-Gm-Message-State: AOAM5331TY9Jd3twnD7X1HciFfdyez7n5UiNni6xtnPaq16ke1qzwn0r
 TVZ5/7TqGND276SO/tCSCBeVoepW79A8ng==
X-Google-Smtp-Source: ABdhPJxpLRhce8PCadLl/UPuXRCt33tnycWcPhcRiOtR+qnFsspyTywa7i3dv3ZSjRgzyzbPb6WGVg==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr8615384wmc.21.1629887741381; 
 Wed, 25 Aug 2021 03:35:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/44] target/arm: Fix MVE 48-bit SQRSHRL for small right shifts
Date: Wed, 25 Aug 2021 11:34:57 +0100
Message-Id: <20210825103534.6936-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

We got an edge case wrong in the 48-bit SQRSHRL implementation: if
the shift is to the right, although it always makes the result
smaller than the input value it might not be within the 48-bit range
the result is supposed to be if the input had some bits in [63..48]
set and the shift didn't bring all of those within the [47..0] range.

Handle this similarly to the way we already do for this case in
do_uqrshl48_d(): extend the calculated result from 48 bits,
and return that if not saturating or if it doesn't change the
result; otherwise fall through to return a saturated value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve_helper.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 5730b48f35e..1a4b2ef8075 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1563,6 +1563,8 @@ uint64_t HELPER(mve_uqrshll)(CPUARMState *env, uint64_t n, uint32_t shift)
 static inline int64_t do_sqrshl48_d(int64_t src, int64_t shift,
                                     bool round, uint32_t *sat)
 {
+    int64_t val, extval;
+
     if (shift <= -48) {
         /* Rounding the sign bit always produces 0. */
         if (round) {
@@ -1572,9 +1574,14 @@ static inline int64_t do_sqrshl48_d(int64_t src, int64_t shift,
     } else if (shift < 0) {
         if (round) {
             src >>= -shift - 1;
-            return (src >> 1) + (src & 1);
+            val = (src >> 1) + (src & 1);
+        } else {
+            val = src >> -shift;
+        }
+        extval = sextract64(val, 0, 48);
+        if (!sat || val == extval) {
+            return extval;
         }
-        return src >> -shift;
     } else if (shift < 48) {
         int64_t extval = sextract64(src << shift, 0, 48);
         if (!sat || src == (extval >> shift)) {
-- 
2.20.1


