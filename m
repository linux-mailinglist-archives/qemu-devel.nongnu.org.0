Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE0939AD45
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:55:24 +0200 (CEST)
Received: from localhost ([::1]:47172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lovJD-0007PA-PP
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov6C-0002hg-TI
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:56 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:42719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5z-00017q-Pb
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:56 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 l23-20020a17090a0717b029016ae774f973so4044548pjl.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q8lAbNppcyHGJO57X+8D3vs8Lmd+nrqoL0h5uKHL3jg=;
 b=f0h9kkYQtht//enboMld31rdes5z4fiTZoCk/iov1xAG5M6QK7hNQUnjZ1+jWTRAbG
 5ocuDuvsM+te9U/A6WhCR0UShI0szqcX1AfOk9c/R55Gx5SQoBSP7TG78SSsv3zrJ/Db
 Oxeq5iGgRTa0vboZoUfcbdZJk83zXBlreINrsWl5BhDzd/ao52UtgSlvCkMM5kqsznwh
 EkTfvhcL/SfhHyX76HaxZhYtDGRumkfB6paahONnfa859OY2fPeo4FC+YOwgry1Ygt2X
 /4V3sggAmmQbOumJHaSpsG8ODYMzNF8erjQBdvzBtX7VIcLcOuTmZJnveUYjGS+XT84P
 oGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q8lAbNppcyHGJO57X+8D3vs8Lmd+nrqoL0h5uKHL3jg=;
 b=m9UbV+U6l2XzRjQRyJ3Y9E9tj6fNT6jW9jOZuVJF730Fp1Hw6pJ8/nC4vQBqSt4S+V
 sSfOxZW/8KqSM5q6HI/3N+9n6FpYl86LtI4iGhcYS8MOqlibfM0bTCIGjqKiR3HHgwH8
 2joyd2ZNvcJkqjst5qDiDTQvy+GWvYkWoxg8YgK0gpwi2s/LACYMdKIgEVY8zI+92TfA
 LRAI31/Bf1Ih5mYanYJbkRxj9eQT1xFhEP9K8YSkwo+/2Qp8tlrlrsIm6a+yzYeuXwLU
 495IMgeJGgNNnYn8t8ir3OrW+/7SqzFLNNMcpvGbnfqhBrgrHOSlQ858y2xuQKQfa+6k
 DB/Q==
X-Gm-Message-State: AOAM531KwIPLcyIvjcWEHxr+jA38+JaUuMKeBLbIXzHwJQsP132jzXRH
 mVcvQXz8n9tRwIbaTnPvpK2qtesfsw7y6g==
X-Google-Smtp-Source: ABdhPJy36mmdunt0y84HYGehvZmqqjU+412xtFHabcjoGxn2+wxyRXIdiaKY/KRJALYsatuCjiTcbA==
X-Received: by 2002:a17:902:ee8c:b029:fe:dc5f:564 with SMTP id
 a12-20020a170902ee8cb02900fedc5f0564mr1176093pld.71.1622756502496; 
 Thu, 03 Jun 2021 14:41:42 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/29] softfloat: Convert floatx80_mul to FloatParts
Date: Thu,  3 Jun 2021 14:41:17 -0700
Message-Id: <20210603214131.629841-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 76 +++++++++----------------------------------------
 1 file changed, 14 insertions(+), 62 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 737f5d7701..ae2e7aa274 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1944,6 +1944,20 @@ float128_mul(float128 a, float128 b, float_status *status)
     return float128_round_pack_canonical(pr, status);
 }
 
+floatx80 QEMU_FLATTEN
+floatx80_mul(floatx80 a, floatx80 b, float_status *status)
+{
+    FloatParts128 pa, pb, *pr;
+
+    if (!floatx80_unpack_canonical(&pa, a, status) ||
+        !floatx80_unpack_canonical(&pb, b, status)) {
+        return floatx80_default_nan(status);
+    }
+
+    pr = parts_mul(&pa, &pb, status);
+    return floatx80_round_pack_canonical(pr, status);
+}
+
 /*
  * Fused multiply-add
  */
@@ -5863,68 +5877,6 @@ floatx80 floatx80_round_to_int(floatx80 a, float_status *status)
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of multiplying the extended double-precision floating-
-| point values `a' and `b'.  The operation is performed according to the
-| IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-floatx80 floatx80_mul(floatx80 a, floatx80 b, float_status *status)
-{
-    bool aSign, bSign, zSign;
-    int32_t aExp, bExp, zExp;
-    uint64_t aSig, bSig, zSig0, zSig1;
-
-    if (floatx80_invalid_encoding(a) || floatx80_invalid_encoding(b)) {
-        float_raise(float_flag_invalid, status);
-        return floatx80_default_nan(status);
-    }
-    aSig = extractFloatx80Frac( a );
-    aExp = extractFloatx80Exp( a );
-    aSign = extractFloatx80Sign( a );
-    bSig = extractFloatx80Frac( b );
-    bExp = extractFloatx80Exp( b );
-    bSign = extractFloatx80Sign( b );
-    zSign = aSign ^ bSign;
-    if ( aExp == 0x7FFF ) {
-        if (    (uint64_t) ( aSig<<1 )
-             || ( ( bExp == 0x7FFF ) && (uint64_t) ( bSig<<1 ) ) ) {
-            return propagateFloatx80NaN(a, b, status);
-        }
-        if ( ( bExp | bSig ) == 0 ) goto invalid;
-        return packFloatx80(zSign, floatx80_infinity_high,
-                                   floatx80_infinity_low);
-    }
-    if ( bExp == 0x7FFF ) {
-        if ((uint64_t)(bSig << 1)) {
-            return propagateFloatx80NaN(a, b, status);
-        }
-        if ( ( aExp | aSig ) == 0 ) {
- invalid:
-            float_raise(float_flag_invalid, status);
-            return floatx80_default_nan(status);
-        }
-        return packFloatx80(zSign, floatx80_infinity_high,
-                                   floatx80_infinity_low);
-    }
-    if ( aExp == 0 ) {
-        if ( aSig == 0 ) return packFloatx80( zSign, 0, 0 );
-        normalizeFloatx80Subnormal( aSig, &aExp, &aSig );
-    }
-    if ( bExp == 0 ) {
-        if ( bSig == 0 ) return packFloatx80( zSign, 0, 0 );
-        normalizeFloatx80Subnormal( bSig, &bExp, &bSig );
-    }
-    zExp = aExp + bExp - 0x3FFE;
-    mul64To128( aSig, bSig, &zSig0, &zSig1 );
-    if ( 0 < (int64_t) zSig0 ) {
-        shortShift128Left( zSig0, zSig1, 1, &zSig0, &zSig1 );
-        --zExp;
-    }
-    return roundAndPackFloatx80(status->floatx80_rounding_precision,
-                                zSign, zExp, zSig0, zSig1, status);
-}
-
 /*----------------------------------------------------------------------------
 | Returns the result of dividing the extended double-precision floating-point
 | value `a' by the corresponding value `b'.  The operation is performed
-- 
2.25.1


