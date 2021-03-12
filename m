Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFC2338F88
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:12:31 +0100 (CET)
Received: from localhost ([::1]:44436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiWk-0004gA-6s
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:12:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiD8-00032Y-1E
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:15 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:46980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCq-0001xf-6p
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:13 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 d139-20020a1c1d910000b029010b895cb6f2so15225396wmd.5
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wS574F4Ozpo8IKQHqEYrrBVuWSdFOiWjXRiigReoGqU=;
 b=feBTYws5T1HBEzMJ49us4Rp7QRExiYB1Pd2maceltZHi3NEbOiLyNU8YYcv6PDoVTT
 6zUa5HksIZsk0GY/ViTonWmwv4gZEaaS6u1NWx5cLkkXimEq03gsJJEvrWr1Lcvw28vg
 8eXGkDomOl1+vPl/XRRVj/rySVxt1KJvjkgCe/QsI1vE7rtNImQ5eBn0KVse7Omqrk8h
 ZPyvSLi+y3gBpJ6wsuiH26S+Lr7PGj2QSKxCW7GmVgOonkFNilTT6OfpDjeZSUCh0Qe8
 cwtVtl6PEu2877Ghoa0bDrkPi4BKpCfvInIovnt8E6CKWq6xHP8mgccNItqe6sqny88h
 WofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wS574F4Ozpo8IKQHqEYrrBVuWSdFOiWjXRiigReoGqU=;
 b=HFRUBaCSNoiR6qt+dBUhKy1MNISIqXLa5heXlnNJa8vdGyq5pWe1iGQMwoFDlSnWIF
 yrsSjDlCGtNMMMY6wc/7u4lTS9UF5Tm/4FtnBeU2Y/GsZkHirzNObfMRKKvGchcKPzeR
 BY7mUwXTncHXBpwO75BSHQ0P2kHli7nE1FqvzttdveXhE3YSA0URdmstb5ROJb2axLFn
 YiNR1h2abqs6ckfVO8fVdCjvIM46uLZJFPJb8NcZ5JlLpfBS3Dk63e6lpRaEbGQNKMsY
 PI76Q08n6OmTA+p8psSDfQBtPlj/3R1zuvKBmECj4ZNKpo04xBdqrlSy/2ZTyqv4FDyU
 lz+g==
X-Gm-Message-State: AOAM531kuCkDf+v/5OE8tzhM1s5ihLqsk1WdHaWuQXIcUThu27tjomqF
 hw9sVR7WMBDhn0uUf5EohsjF2T4gEx6VZNZU
X-Google-Smtp-Source: ABdhPJwSmugP51t17cINBnQ/r36c03rWra9HCKDHwppzAqYGgetx6xSgFjdRQFSWPE2QQnItju2rzQ==
X-Received: by 2002:a1c:f404:: with SMTP id z4mr13504251wma.39.1615557109491; 
 Fri, 12 Mar 2021 05:51:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/39] target/arm: Fix sve_uzp_p vs odd vector lengths
Date: Fri, 12 Mar 2021 13:51:11 +0000
Message-Id: <20210312135140.1099-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Missed out on compressing the second half of a predicate
with length vl % 512 > 256.

Adjust all of the x + (y << s) to x | (y << s) as a
general style fix.  Drop the extract64 because the input
uint64_t are known to be already zero-extended from the
current size of the predicate.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210309155305.11301-2-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve_helper.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 844db08bd57..11c9397dbb6 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1939,7 +1939,7 @@ void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
     if (oprsz <= 8) {
         l = compress_bits(n[0] >> odd, esz);
         h = compress_bits(m[0] >> odd, esz);
-        d[0] = extract64(l + (h << (4 * oprsz)), 0, 8 * oprsz);
+        d[0] = l | (h << (4 * oprsz));
     } else {
         ARMPredicateReg tmp_m;
         intptr_t oprsz_16 = oprsz / 16;
@@ -1953,23 +1953,35 @@ void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
             h = n[2 * i + 1];
             l = compress_bits(l >> odd, esz);
             h = compress_bits(h >> odd, esz);
-            d[i] = l + (h << 32);
+            d[i] = l | (h << 32);
         }
 
-        /* For VL which is not a power of 2, the results from M do not
-           align nicely with the uint64_t for D.  Put the aligned results
-           from M into TMP_M and then copy it into place afterward.  */
+        /*
+         * For VL which is not a multiple of 512, the results from M do not
+         * align nicely with the uint64_t for D.  Put the aligned results
+         * from M into TMP_M and then copy it into place afterward.
+         */
         if (oprsz & 15) {
-            d[i] = compress_bits(n[2 * i] >> odd, esz);
+            int final_shift = (oprsz & 15) * 2;
+
+            l = n[2 * i + 0];
+            h = n[2 * i + 1];
+            l = compress_bits(l >> odd, esz);
+            h = compress_bits(h >> odd, esz);
+            d[i] = l | (h << final_shift);
 
             for (i = 0; i < oprsz_16; i++) {
                 l = m[2 * i + 0];
                 h = m[2 * i + 1];
                 l = compress_bits(l >> odd, esz);
                 h = compress_bits(h >> odd, esz);
-                tmp_m.p[i] = l + (h << 32);
+                tmp_m.p[i] = l | (h << 32);
             }
-            tmp_m.p[i] = compress_bits(m[2 * i] >> odd, esz);
+            l = m[2 * i + 0];
+            h = m[2 * i + 1];
+            l = compress_bits(l >> odd, esz);
+            h = compress_bits(h >> odd, esz);
+            tmp_m.p[i] = l | (h << final_shift);
 
             swap_memmove(vd + oprsz / 2, &tmp_m, oprsz / 2);
         } else {
@@ -1978,7 +1990,7 @@ void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
                 h = m[2 * i + 1];
                 l = compress_bits(l >> odd, esz);
                 h = compress_bits(h >> odd, esz);
-                d[oprsz_16 + i] = l + (h << 32);
+                d[oprsz_16 + i] = l | (h << 32);
             }
         }
     }
-- 
2.20.1


