Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41A1381EFE
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 15:06:59 +0200 (CEST)
Received: from localhost ([::1]:54598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGTy-0007PN-OK
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 09:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFzZ-0007nU-B7
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:34 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:39757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz3-0007pG-Hz
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:31 -0400
Received: by mail-qk1-x733.google.com with SMTP id k127so3306410qkc.6
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rn6Xd6npDUL4Fp5tLCCf06ZR2ZSQGYg1xXv43hvT9J8=;
 b=Ejtve6esBMBEDKCClDbqqYHMBl9Mn9U5XHe4tKN69JfWsgUfHjmXsZWyuxcIRhtt19
 YgewJgaPQTCocUDnBZt1uU+19UyaOCDdmkhtqHQmpfac4ubouEOAdF2Sh11Ybz1cDDxS
 +F/6LV2T3ihM6pQKmRcDXUA3XNreFboGz3qBawK/SxG393vwbmx3nJxg96FduwIt8pJ6
 8t/xC/ukkjVoX4d9kAuTU132M+HzlLP8i1R6cENsbuKSJb/33bG4mYdtpJvYaWoS6hsx
 s+ztuJ5v4q7yBfqu5F/VSmcvairyG3AJT3py0FXPY8dO8lcxqs2mGS/FT5PXJUIwBK/0
 ZCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rn6Xd6npDUL4Fp5tLCCf06ZR2ZSQGYg1xXv43hvT9J8=;
 b=Wa9t5rnKeKP9EGFexkGPjfyr1E6AU6n3kVVrGWsMvRPu/7WUVAvLKykGFxV0Qpx0PE
 pnCtETOH6fAjsKB48S3HqsRZv9Zakv5vap7mkFdB+it7GiL69ijdLYvwleZLGBbdInPK
 eGiRRKoVUijVLtZwEyx57jJbr6dzKxh+7G1EvOJKtQAhjTu5CtXegN8v+O8Ek9tEtFSz
 UTPWzYhQxP5HYDc6ult3OoTAVjdznZflMzXWsLzaY7mhpSWGVTNHcygwXLgovuhoMG0x
 hxr1n8u8r8cpSKDoMIKABLa5NNEWMZTZuyXt1+xTwx5L/hoecRxHzbQHk72kS48vssm3
 Z4Ig==
X-Gm-Message-State: AOAM532ZYLqKAPr8sNXElWnLqBCJfVHIq2ZTp8qMeT8etofC5yVWilgd
 YV0l4wqzBZYq5FpvABjTlhhPcpcLWcS+QDGP+dA=
X-Google-Smtp-Source: ABdhPJzTaqT9y3mQqL2ToGnJupY34U154XU+3LGXd1PZNGfnUuZ0WY4ydy/W6BFQNMRmyEWolVY04g==
X-Received: by 2002:a37:a9d2:: with SMTP id
 s201mr52638694qke.417.1621168499966; 
 Sun, 16 May 2021 05:34:59 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/46] softfloat: Use uadd64_carry,
 usub64_borrow in softfloat-macros.h
Date: Sun, 16 May 2021 07:34:18 -0500
Message-Id: <20210516123431.718318-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use compiler support for carry arithmetic.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-macros.h | 95 +++++++++-------------------------
 1 file changed, 25 insertions(+), 70 deletions(-)

diff --git a/include/fpu/softfloat-macros.h b/include/fpu/softfloat-macros.h
index a35ec2893a..2e3760a9c1 100644
--- a/include/fpu/softfloat-macros.h
+++ b/include/fpu/softfloat-macros.h
@@ -83,6 +83,7 @@ this code that are retained.
 #define FPU_SOFTFLOAT_MACROS_H
 
 #include "fpu/softfloat-types.h"
+#include "qemu/host-utils.h"
 
 /*----------------------------------------------------------------------------
 | Shifts `a' right by the number of bits given in `count'.  If any nonzero
@@ -403,16 +404,12 @@ static inline void
 | are stored at the locations pointed to by `z0Ptr' and `z1Ptr'.
 *----------------------------------------------------------------------------*/
 
-static inline void
- add128(
-     uint64_t a0, uint64_t a1, uint64_t b0, uint64_t b1, uint64_t *z0Ptr, uint64_t *z1Ptr )
+static inline void add128(uint64_t a0, uint64_t a1, uint64_t b0, uint64_t b1,
+                          uint64_t *z0Ptr, uint64_t *z1Ptr)
 {
-    uint64_t z1;
-
-    z1 = a1 + b1;
-    *z1Ptr = z1;
-    *z0Ptr = a0 + b0 + ( z1 < a1 );
-
+    bool c = 0;
+    *z1Ptr = uadd64_carry(a1, b1, &c);
+    *z0Ptr = uadd64_carry(a0, b0, &c);
 }
 
 /*----------------------------------------------------------------------------
@@ -423,34 +420,14 @@ static inline void
 | `z1Ptr', and `z2Ptr'.
 *----------------------------------------------------------------------------*/
 
-static inline void
- add192(
-     uint64_t a0,
-     uint64_t a1,
-     uint64_t a2,
-     uint64_t b0,
-     uint64_t b1,
-     uint64_t b2,
-     uint64_t *z0Ptr,
-     uint64_t *z1Ptr,
-     uint64_t *z2Ptr
- )
+static inline void add192(uint64_t a0, uint64_t a1, uint64_t a2,
+                          uint64_t b0, uint64_t b1, uint64_t b2,
+                          uint64_t *z0Ptr, uint64_t *z1Ptr, uint64_t *z2Ptr)
 {
-    uint64_t z0, z1, z2;
-    int8_t carry0, carry1;
-
-    z2 = a2 + b2;
-    carry1 = ( z2 < a2 );
-    z1 = a1 + b1;
-    carry0 = ( z1 < a1 );
-    z0 = a0 + b0;
-    z1 += carry1;
-    z0 += ( z1 < carry1 );
-    z0 += carry0;
-    *z2Ptr = z2;
-    *z1Ptr = z1;
-    *z0Ptr = z0;
-
+    bool c = 0;
+    *z2Ptr = uadd64_carry(a2, b2, &c);
+    *z1Ptr = uadd64_carry(a1, b1, &c);
+    *z0Ptr = uadd64_carry(a0, b0, &c);
 }
 
 /*----------------------------------------------------------------------------
@@ -461,14 +438,12 @@ static inline void
 | `z1Ptr'.
 *----------------------------------------------------------------------------*/
 
-static inline void
- sub128(
-     uint64_t a0, uint64_t a1, uint64_t b0, uint64_t b1, uint64_t *z0Ptr, uint64_t *z1Ptr )
+static inline void sub128(uint64_t a0, uint64_t a1, uint64_t b0, uint64_t b1,
+                          uint64_t *z0Ptr, uint64_t *z1Ptr)
 {
-
-    *z1Ptr = a1 - b1;
-    *z0Ptr = a0 - b0 - ( a1 < b1 );
-
+    bool c = 0;
+    *z1Ptr = usub64_borrow(a1, b1, &c);
+    *z0Ptr = usub64_borrow(a0, b0, &c);
 }
 
 /*----------------------------------------------------------------------------
@@ -479,34 +454,14 @@ static inline void
 | pointed to by `z0Ptr', `z1Ptr', and `z2Ptr'.
 *----------------------------------------------------------------------------*/
 
-static inline void
- sub192(
-     uint64_t a0,
-     uint64_t a1,
-     uint64_t a2,
-     uint64_t b0,
-     uint64_t b1,
-     uint64_t b2,
-     uint64_t *z0Ptr,
-     uint64_t *z1Ptr,
-     uint64_t *z2Ptr
- )
+static inline void sub192(uint64_t a0, uint64_t a1, uint64_t a2,
+                          uint64_t b0, uint64_t b1, uint64_t b2,
+                          uint64_t *z0Ptr, uint64_t *z1Ptr, uint64_t *z2Ptr)
 {
-    uint64_t z0, z1, z2;
-    int8_t borrow0, borrow1;
-
-    z2 = a2 - b2;
-    borrow1 = ( a2 < b2 );
-    z1 = a1 - b1;
-    borrow0 = ( a1 < b1 );
-    z0 = a0 - b0;
-    z0 -= ( z1 < borrow1 );
-    z1 -= borrow1;
-    z0 -= borrow0;
-    *z2Ptr = z2;
-    *z1Ptr = z1;
-    *z0Ptr = z0;
-
+    bool c = 0;
+    *z2Ptr = usub64_borrow(a2, b2, &c);
+    *z1Ptr = usub64_borrow(a1, b1, &c);
+    *z0Ptr = usub64_borrow(a0, b0, &c);
 }
 
 /*----------------------------------------------------------------------------
-- 
2.25.1


