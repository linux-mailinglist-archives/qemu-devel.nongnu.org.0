Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5153DA219
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:29:29 +0200 (CEST)
Received: from localhost ([::1]:60442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94EC-0003SR-Bt
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940k-0000QI-0q
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:37 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:47095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940a-00010B-5f
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:33 -0400
Received: by mail-wr1-x42f.google.com with SMTP id c16so6427554wrp.13
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KHg6Srrabt2i/P1wMabf21oSUvedE7e5kSg7WXSq3yY=;
 b=dzA/zddL6DXQVfgUPv4PH0cqozt2cdld1eme+ZTUV6sOfT+OLDJVEaCgSDY+FzSnxR
 BZsgX8GOUHy0eeDz8G/vStNLHH17b9AZhuPrljAAEAIg6sCuyYmB+oVzr/YjWL+VHjOB
 124p6XzEe0lc71UAEknrAQN1I5r0UzKSMAWQ+Z2p6WoxCJ08U5wRHUDE6SmKOoXJ7OGN
 nrmzxz1fYHRorntH3bomR17oui9sPG7AGTYm7wJYFc00tnyzN3euiwu6/lLsHlayApsh
 lnSoFGzrhL8MAXOjRd5h6GzFk4GJl5YbfhVdGI5HHVSbHf/cBTZEjGACK2LXSdW4qew5
 9vyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KHg6Srrabt2i/P1wMabf21oSUvedE7e5kSg7WXSq3yY=;
 b=m+vEYZw+XxX3gtsf5yd6qnzSr3mioPnBZgWyavqtmf5UrQDLsZY8OvKVZqR21godO2
 SwlYL4rWfkSB1Y1j9ZUkRA/Q91Y009tvK+LO6dVckannyUC9bVM2uOQJ0oDayOMMzcdw
 xpbWXsXWcEUt5NFPFQ3Zfefv2470ivp1JihrhDI8Cc28Qgy3bYU/7CqvaRU3TLIokFOz
 /+NVVsyaHMszEi0iz+rggyEV3eJZYKGNOAMTx/p9NRzSWMVWPG5bAkeG0rn9GenphF8/
 940XHvCJutlRNY/iZKKrmLBTQMZQ1QJx1V3/jpUptXAgA02Y1AN+6glSrlLb5/o2H6rk
 WoBQ==
X-Gm-Message-State: AOAM5312Hm0XArDffjw4oleMJPQeG6TkjNITpwpuCedeVtHhhSyJ9sI1
 FxSK1fvSLnxUEgqbzq0DSKeI5w==
X-Google-Smtp-Source: ABdhPJx9IRd7dXOldI4aiu1IO/1iEsQAd7scPCTDBCk09B1b25Lzv98SnpvRQyY0cJd/X6unryuITA==
X-Received: by 2002:a5d:5412:: with SMTP id g18mr4320538wrv.301.1627557320596; 
 Thu, 29 Jul 2021 04:15:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 07/53] target/arm: Fix MVE 48-bit SQRSHRL for small
 right shifts
Date: Thu, 29 Jul 2021 12:14:26 +0100
Message-Id: <20210729111512.16541-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
---
Not squashed into the previous patch because that one has already
been reviewed, so as this fixes a different edge case I thought
it clearer kept separate.
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


