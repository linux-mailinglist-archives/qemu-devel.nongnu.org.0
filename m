Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A718764A344
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:28:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jmH-0004eS-CH; Mon, 12 Dec 2022 09:27:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p4jlz-0004TW-Hk
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:27:15 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p4jlv-00063e-Sy
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:27:13 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h10so12265289wrx.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 06:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kt7Ghylf7rGQFKKAbtd2vnJIMc4YhVzESoBE7byDclo=;
 b=PKwbZ6gRCupbG9MC6qrqbpPaWPFxdOjW5QKnQ1jNc/j/IsAimbus1oXNu5aJMLfDRc
 7zYLI5IuMb+/1IBrrB/xio2rjkm3ENG6giK7yIhyvLrtQU6x5luu4bUnBogMmlxfM4je
 RBhTLBh4yk2GNDkIPYFzXTbJsMBv4PpP4YLN0sWDhhZ8D+l133kgjcTIF4uGJHcy/ybY
 ok9uSfOBbY534eSQjmpUGsd5xfsKRXkCsdTarSnSWg38zRby6lGKc+oyqDhiY8z4fJSV
 iP8gVTCy68iNAusu1H92N/IROnimvxAK0lRkXjq4PbXMNopUSRq2fQL2BjIs3+5a0xxo
 ubqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kt7Ghylf7rGQFKKAbtd2vnJIMc4YhVzESoBE7byDclo=;
 b=FrqqyRwtBlTjKcjdeozJedYRgAY4HI8QR/Z1Hue76rxW0bbxT5vCY1Vm0jEC+Dj08X
 X9zOpVpi2neRTPnXP2ou3YrvXDtrd9fpAUNTzuQTzsI54W/jpl79Y+YtzXGBYkyo0Eds
 g2bLZKUkDbfb/slMKPCZP92FhEZBD/OT+xSfBxn6Q35ZVXof6c5tNqcAPZJSeRhTEicO
 Coj1AAqUinl+emphFFETtwBRrlqnzV7K9puhPxTwFpTWApXgs0XXkajIqqVJOqMLvfkz
 t9ERhv0rKiZ+QVP/dXUDXuWLJOPgvKdQcRcs71YNqwycTafcOJ/9eNvdoQ2XGFP89Db4
 RHVw==
X-Gm-Message-State: ANoB5pkeW6naiG6sIg50d7dSZV/5Ym8juhK+l1E+dUkZIOZv2VVZxIwY
 mLjx/rzt0NVmEqNylVNpYvwpPw==
X-Google-Smtp-Source: AA0mqf7+wpl1okw3POSF7tQBEV1W5E7YSNArn2FPF8FA3TpYDW7UddwvBfBTG0LG4aUcfDpUwfGlog==
X-Received: by 2002:a5d:690c:0:b0:242:3fa4:8217 with SMTP id
 t12-20020a5d690c000000b002423fa48217mr9952194wru.50.1670855229958; 
 Mon, 12 Dec 2022 06:27:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a5d500b000000b00241fde8fe04sm9033524wrt.7.2022.12.12.06.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 06:27:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Tobias=20R=C3=B6hmel?= <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH] target/arm:Set lg_page_size to 0 if either S1 or S2 asks for
 it
Date: Mon, 12 Dec 2022 14:27:08 +0000
Message-Id: <20221212142708.610090-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
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

In get_phys_addr_twostage() we set the lg_page_size of the result to
the maximum of the stage 1 and stage 2 page sizes.  This works for
the case where we do want to create a TLB entry, because we know the
common TLB code only creates entries of the TARGET_PAGE_SIZE and
asking for a size larger than that only means that invalidations
invalidate the whole larger area.  However, if lg_page_size is
smaller than TARGET_PAGE_SIZE this effectively means "don't create a
TLB entry"; in this case if either S1 or S2 said "this covers less
than a page and can't go in a TLB" then the final result also should
be marked that way.  Set the resulting page size to 0 if either
stage asked for a less-than-a-page entry, and expand the comment
to explain what's going on.

This has no effect for VMSA because currently the VMSA lookup always
returns results that cover at least TARGET_PAGE_SIZE; however when we
add v8R support it will reuse this code path, and for v8R the S1 and
S2 results can be smaller than TARGET_PAGE_SIZE.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Specifically, this avoids bugs for v8R if either S1 or S2
MPU is set up with region sizes < 1K.

 target/arm/ptw.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index f812734bfb2..2e7826dc29b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2655,10 +2655,20 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     }
 
     /*
-     * Use the maximum of the S1 & S2 page size, so that invalidation
-     * of pages > TARGET_PAGE_SIZE works correctly.
+     * If either S1 or S2 returned a result smaller than TARGET_PAGE_SIZE,
+     * this means "don't put this in the TLB"; in this case, return a
+     * result with lg_page_size == 0 to achieve that. Otherwise,
+     * use the maximum of the S1 & S2 page size, so that invalidation
+     * of pages > TARGET_PAGE_SIZE works correctly. (This works even though
+     * we know the combined result permissions etc only cover the minimum
+     * of the S1 and S2 page size, because we know that the common TLB code
+     * never actually creates TLB entries bigger than TARGET_PAGE_SIZE,
+     * and passing a larger page size value only affects invalidations.)
      */
-    if (result->f.lg_page_size < s1_lgpgsz) {
+    if (result->f.lg_page_size < TARGET_PAGE_BITS ||
+        s1_lgpgsz < TARGET_PAGE_BITS) {
+        result->f.lg_page_size = 0;
+    } else if (result->f.lg_page_size < s1_lgpgsz) {
         result->f.lg_page_size = s1_lgpgsz;
     }
 
-- 
2.25.1


