Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98A7338F5C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:04:42 +0100 (CET)
Received: from localhost ([::1]:47674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiPB-0001OP-TO
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:04:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCy-0002qs-R6
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:04 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCm-0001xm-5G
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:04 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso15840807wme.0
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ik9jvanJtzvUGmVetGUeUXXj1nZla8t1qz4dVFL21YM=;
 b=VT6SEJB0wVrvAIpK0e9Z+Abvgx0ERGsOu31qFS1V1hDg4buefD/xftTjw+EM0iIpnp
 0evQZrF9ChlqtAoBWVxXFvs1ZXY6wp0XJQ4eR2JYzQ1W+g9TzCkRYUTUPXVtDeXjw0zk
 Pju4ipanZr4ckZDd1Vew4pimtEKT1LC186HNnh2+WC2tzHtzfaqmfnSn/dlnjbSvTEj3
 NimWjSwugINtpq0SqQxCZkFjPpr7UybZ7jMvsPLn1TJ6BnHfPY4bRniABHnES7H8I86U
 wORzXkbiE5Crt7bgi376eMXkB03AMMoj/i8o2Xi5/Q2smMslGdKF01XvEmgT9b3a4QDM
 1GGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ik9jvanJtzvUGmVetGUeUXXj1nZla8t1qz4dVFL21YM=;
 b=IWNuUB/VYPuT/PyTpJKvhVBXKJqw+COdFG1iIJPxTx+LpyBH9+tbJiRFwyC+/FAroo
 ZIdAK+tJt2CggSdqE209c3QhMrR9e8cYtwj9mt0Ldxb5RLXnk0zvCRH8JixNEIeyZjE4
 FrwxHsaIEfk58Jl3mcXkjWW3v6atDQy0mSLFYlYBAVe8110j29TIoWwCzduqOOwQcEV0
 nyec93NYKF/KRTKkxBsdKogS20WPq2+fafsTv9LZk7xNd2pLuQtIaAFmMbp+Ur+SHdbj
 Yay8WSVNN9/tS7dxAd2Tn5WYw87zLhD9KkSojBGURibExzOSgG5vLUueIp5Tlpntbawc
 9trQ==
X-Gm-Message-State: AOAM532Zma8eS5rO+K1au3zhaIAqJ/Mw8g+9Hl+Ze5xEBIcg2lCHLFhO
 1dLanJdID4AaODMG4HyuwM0LSeDfZ86p0FjG
X-Google-Smtp-Source: ABdhPJzNRSvHbTMql9LRrQLmKvVL3T9I/wwAJUl+zAMHT71S9tVQu/u23VOEA2pnBqmQaky3zFg/bg==
X-Received: by 2002:a1c:7714:: with SMTP id t20mr12924175wmi.107.1615557110146; 
 Fri, 12 Mar 2021 05:51:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/39] target/arm: Fix sve_zip_p vs odd vector lengths
Date: Fri, 12 Mar 2021 13:51:12 +0000
Message-Id: <20210312135140.1099-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Wrote too much with low-half zip (zip1) with vl % 512 != 0.

Adjust all of the x + (y << s) to x | (y << s) as a style fix.

We only ever have exact overlap between D, M, and N.  Therefore
we only need a single temporary, and we do not need to check for
partial overlap.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210309155305.11301-3-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve_helper.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 11c9397dbb6..2fb4b2c1ea2 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1871,6 +1871,7 @@ void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
     intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     int esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
     intptr_t high = FIELD_EX32(pred_desc, PREDDESC, DATA);
+    int esize = 1 << esz;
     uint64_t *d = vd;
     intptr_t i;
 
@@ -1883,33 +1884,35 @@ void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
         mm = extract64(mm, high * half, half);
         nn = expand_bits(nn, esz);
         mm = expand_bits(mm, esz);
-        d[0] = nn + (mm << (1 << esz));
+        d[0] = nn | (mm << esize);
     } else {
-        ARMPredicateReg tmp_n, tmp_m;
+        ARMPredicateReg tmp;
 
         /* We produce output faster than we consume input.
            Therefore we must be mindful of possible overlap.  */
-        if ((vn - vd) < (uintptr_t)oprsz) {
-            vn = memcpy(&tmp_n, vn, oprsz);
-        }
-        if ((vm - vd) < (uintptr_t)oprsz) {
-            vm = memcpy(&tmp_m, vm, oprsz);
+        if (vd == vn) {
+            vn = memcpy(&tmp, vn, oprsz);
+            if (vd == vm) {
+                vm = vn;
+            }
+        } else if (vd == vm) {
+            vm = memcpy(&tmp, vm, oprsz);
         }
         if (high) {
             high = oprsz >> 1;
         }
 
-        if ((high & 3) == 0) {
+        if ((oprsz & 7) == 0) {
             uint32_t *n = vn, *m = vm;
             high >>= 2;
 
-            for (i = 0; i < DIV_ROUND_UP(oprsz, 8); i++) {
+            for (i = 0; i < oprsz / 8; i++) {
                 uint64_t nn = n[H4(high + i)];
                 uint64_t mm = m[H4(high + i)];
 
                 nn = expand_bits(nn, esz);
                 mm = expand_bits(mm, esz);
-                d[i] = nn + (mm << (1 << esz));
+                d[i] = nn | (mm << esize);
             }
         } else {
             uint8_t *n = vn, *m = vm;
@@ -1921,7 +1924,7 @@ void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 
                 nn = expand_bits(nn, esz);
                 mm = expand_bits(mm, esz);
-                d16[H2(i)] = nn + (mm << (1 << esz));
+                d16[H2(i)] = nn | (mm << esize);
             }
         }
     }
-- 
2.20.1


