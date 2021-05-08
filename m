Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E69CA376EE6
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:42:05 +0200 (CEST)
Received: from localhost ([::1]:52100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCuq-0003wo-WE
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8A-0003Oo-3b
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:47 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC88-0005Xp-A3
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:45 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so6554371pjb.4
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jj12YuLJHh6Oh0IVnZb6UWCqmTi7ol2b4RGLMuxGRMs=;
 b=RycazAL0aOSpcA4WGriN2xv74sN+27JCubZHcifpriZC2ioJCPwuJFSHS4IKdrwyA0
 /0H8/QX3CaLn2xFSpwOEhaYozuUXIqSom0/kb/HCRZJe4mIW3IIcwuEsj04bR4li2wEg
 JXQaHOayerofcomsKyZcVCcCr8Z+sJAtyNnpKtE5f2I06BL3GMWaAslPTks+IMnz9l9V
 KPDY46CUgAM3AxyXED13R1xlZLLO9pusFqALLb1VjSzhKYcIAzwGwpYLoK92GB9lS0JH
 H4PETKCDVl1P4v5Ap0OkJrDS9WIEKeqbOG+o+j2dNRhyAyeYeq84QynMPCAjOXwcesX4
 tBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jj12YuLJHh6Oh0IVnZb6UWCqmTi7ol2b4RGLMuxGRMs=;
 b=s7kk5OpDsN5RMsCxWleLr3ldqY5XDyvTkHS1IhAXmjs3WR5xuIejJ4A99f1Os4MESw
 aOojnUQ5n8Ed4/HHzfMEgBfeGmCvqpsY4AKMVbI6jKScQeKWLvnRQry5a8itZUPV4Gww
 c55VOdM3+6ak1JXt+82JpbbgW8qoXnHGATL9rccJYGVsQaRIKJTSyvI6I0ys+UR1d+Ge
 0Zfb3so9wzu5JhbJ83eMlF6rJoEssdiR6PJcLDLv9XwpJ5Am/XotCbknvX2wiArYk7VK
 2cGh3z3U9asa8Nb9s2TpZ0rgq2jn4BQE/nfHBjke0qmzwwYODM+pZPPlxCVZH0zJQBgK
 53UA==
X-Gm-Message-State: AOAM532wov9XRoR312Ifpa5BJ4MSNBkm2OhinlyCUYQxRo6lIoWqS97s
 +xiX6awdn8CdRdCXKsvaBOenIsWRIGlW3Q==
X-Google-Smtp-Source: ABdhPJxDZfKQpxCCxUevkncMhmmTJo4LtxbsAE5wu/woGJE+WHBTjP1musGeI/oZp2F3UnQvN/GjTw==
X-Received: by 2002:a17:90a:cf10:: with SMTP id
 h16mr13534007pju.49.1620438702973; 
 Fri, 07 May 2021 18:51:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 60/72] softfloat: Convert floatx80_mul to FloatParts
Date: Fri,  7 May 2021 18:47:50 -0700
Message-Id: <20210508014802.892561-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 76 +++++++++----------------------------------------
 1 file changed, 14 insertions(+), 62 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 3c6751e4d0..4454219f8a 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1943,6 +1943,20 @@ float128_mul(float128 a, float128 b, float_status *status)
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
@@ -5865,68 +5879,6 @@ floatx80 floatx80_round_to_int(floatx80 a, float_status *status)
 
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


