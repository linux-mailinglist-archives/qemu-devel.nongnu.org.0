Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3183D4EB72F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 01:52:56 +0200 (CEST)
Received: from localhost ([::1]:59924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZLdu-0005mQ-Np
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 19:52:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZLbC-0004df-EH
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 19:50:06 -0400
Received: from [2607:f8b0:4864:20::329] (port=46943
 helo=mail-ot1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZLbA-0007uK-3k
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 19:50:05 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 z9-20020a05683020c900b005b22bf41872so13829370otq.13
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 16:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wv4zOM87pZiL8zau427zLJy6FHkIJNNgq2ga1VuwuJY=;
 b=bAGU6VIhiDJtDf00W0Sx6um+UNz1cPa8stgWv9HhFz44xjEhCniiIRR6B7GErvaisO
 yUiWSoU1Lxa/2lF/1hp+Uq/r4M3ScMInEDOO7cFy+tl8JaL5L1gzXSEPv/cstd7QbxPM
 qDXTz5UCcuj6Ss/HIdDyLiGqiP2PiqMIQWE2lFZp/tU4QzfqE+PBvbjZVkO+jGyWYZJO
 Qu5YY6lokva/hqRVx+6ZTV6xBLUAcbv3iHZ+HtMmbezg47DsBgF3lqkuQbOW/2fevB6x
 DtCBV84tSh+Qe/Vv0+BVcHA9qsn0Be8HMZF1BJZB6TCzS75DaIlJ6Izf34sEcMOTZzNE
 T8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wv4zOM87pZiL8zau427zLJy6FHkIJNNgq2ga1VuwuJY=;
 b=csA2w8GV9xeKkgg7gQmhJWtXnaQyHkZjvVW3FauA5XPymk4Xxw24v+cWVJyhzXjHTr
 1aHPUGz5IVjRNFw16OMdhFdDr/w/TzZDI9qfsGz4sEisZu0Ib6MPcivTdzpGhz+RFufM
 44WPEy8/V6FUty1P8VHuw88uT45LUlcE/knoVRO6bjuzE6FiVPj3sklmGQR6iJUPsBb7
 JsY5x24N3j25sreaX0AhG4P0F9TVdHtZE80MoCDRwWoKizGLkQUM7mSsR30lpjgIC1iO
 n3QRyRwekgBAPzj+HFNEBASElOgu03YORitDf3ma1C9iR/406aZLP7cnvHwrzzsoCAQ+
 4Eow==
X-Gm-Message-State: AOAM5328OQT1sXUYtUmfEUzfmSZV3mH7L5GF1VoTh1jETtRdR6E6igpV
 qFHNfMTtCrGXigJtVijy5FWmJlLwhP5PuTZvXLE=
X-Google-Smtp-Source: ABdhPJzq5NfAtHu4Hox7bVYp4bM3qE8PwLEWLQo2qveGhto7c6V6CkEM0N0jTwC49ab11x0eXakgXQ==
X-Received: by 2002:a9d:6250:0:b0:5cd:afcf:999d with SMTP id
 i16-20020a9d6250000000b005cdafcf999dmr2168711otk.75.1648597798841; 
 Tue, 29 Mar 2022 16:49:58 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 r35-20020a056870582300b000df0dc42ff5sm2995208oap.0.2022.03.29.16.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 16:49:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0?] tcg/aarch64: Use 'ull' suffix to force 64-bit
 constant
Date: Tue, 29 Mar 2022 17:49:56 -0600
Message-Id: <20220329234956.43558-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::329
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Typo used only 'ul' suffix, which is still 32-bits for windows host.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/947
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 077fc51401..5e67f881f1 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1086,9 +1086,9 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
         opc = I3405_MOVZ;
     }
     s0 = ctz64(t0) & (63 & -16);
-    t1 = t0 & ~(0xffffUL << s0);
+    t1 = t0 & ~(0xffffull << s0);
     s1 = ctz64(t1) & (63 & -16);
-    t2 = t1 & ~(0xffffUL << s1);
+    t2 = t1 & ~(0xffffull << s1);
     if (t2 == 0) {
         tcg_out_insn_3405(s, opc, type, rd, t0 >> s0, s0);
         if (t1 != 0) {
-- 
2.25.1


