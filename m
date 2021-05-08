Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04008376EC9
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:31:39 +0200 (CEST)
Received: from localhost ([::1]:43506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCkk-0004jz-2h
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8B-0003Q0-Ts
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:49 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:41936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC88-0005YS-OV
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:47 -0400
Received: by mail-pf1-x430.google.com with SMTP id v191so9113944pfc.8
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FSL59L/m+X7B3mH0rEWJF/oml5iJv4eaLF4keH+NgLs=;
 b=VVU3RGcMe3yvoNP2zG8ApLezRgxa4J9PQVODHiR7b/EFhSIR9XLOi7gxzSGjQCrQsj
 67zYU/aKxgumbbgDkGq/GXQ8LkOvsxTkIe+/D8yIUh/8EP+sZsIu1vSK61OIE5D93WUV
 tsjgNmHjbjLMdktHQJPTq8jqq3Nm5SgfSVP5Pe3xHKvh38zEPpIwxoCadui4qLagWPR0
 Z5ErBvsviJB2PNntlL0rFXaQ2gB25IeH5woEnTg2Kl5eEcDJSK5DwaH+FcvBCf4eeHME
 M6djk+aBbbplpB4fMb18bh1Xz/1qqCuZx5eWE/Atb+jcZUsixSn8YBjTFd4lTOIYNuCV
 5Xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FSL59L/m+X7B3mH0rEWJF/oml5iJv4eaLF4keH+NgLs=;
 b=Nex/acv9qdZ6yBOyVR22vrabgvjdFuluvotHQioxjQ0rOfANt9jc/S+tDbO4Uj58cP
 09WsKiG3L0vo5Q7uS5njH9MawRhg9bjyQ+ZcImvUi63S9VUculUZ81LecLIm5uMLDKrM
 CoNp5l90bpOj7pXfsIj22NHzkkCVDgOzITNW9ZseX2SDkznfV3pqbcQJcd0PeauBIV5a
 vmzlIkCCTPLsYCHiAglH/b+yPvOmJd9s/PMkDjhRmgpPaH2BLegTZFIBj82rW21gn6lg
 R4+yfun4DAXSmFtZI7Nr9AZidDFvK7luO0n2i31Mx6tPOa+QzPlkneprHnQC7Nft+uso
 GSpw==
X-Gm-Message-State: AOAM533rMNsnEEWb/wD0Z13ET3SRO/W2DE+WddGFeuBKcfkKpCkJ8K/+
 EmsVQRn0rgC30PP/HYvEOgoU7+oE1wXavw==
X-Google-Smtp-Source: ABdhPJzL5oh3W5L6F/Vp8CnffuIy6qN59nmcuVTNZNYHBENg6Z5jcW8kgJ96JJZRX6cMJUST/Hsdog==
X-Received: by 2002:a65:6a08:: with SMTP id m8mr13186863pgu.146.1620438703520; 
 Fri, 07 May 2021 18:51:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 61/72] softfloat: Convert floatx80_div to FloatParts
Date: Fri,  7 May 2021 18:47:51 -0700
Message-Id: <20210508014802.892561-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
 fpu/softfloat.c | 100 +++++++-----------------------------------------
 1 file changed, 13 insertions(+), 87 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 4454219f8a..352f359bc5 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2293,6 +2293,19 @@ float128_div(float128 a, float128 b, float_status *status)
     return float128_round_pack_canonical(pr, status);
 }
 
+floatx80 floatx80_div(floatx80 a, floatx80 b, float_status *status)
+{
+    FloatParts128 pa, pb, *pr;
+
+    if (!floatx80_unpack_canonical(&pa, a, status) ||
+        !floatx80_unpack_canonical(&pb, b, status)) {
+        return floatx80_default_nan(status);
+    }
+
+    pr = parts_div(&pa, &pb, status);
+    return floatx80_round_pack_canonical(pr, status);
+}
+
 /*
  * Float to Float conversions
  *
@@ -5879,93 +5892,6 @@ floatx80 floatx80_round_to_int(floatx80 a, float_status *status)
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of dividing the extended double-precision floating-point
-| value `a' by the corresponding value `b'.  The operation is performed
-| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-floatx80 floatx80_div(floatx80 a, floatx80 b, float_status *status)
-{
-    bool aSign, bSign, zSign;
-    int32_t aExp, bExp, zExp;
-    uint64_t aSig, bSig, zSig0, zSig1;
-    uint64_t rem0, rem1, rem2, term0, term1, term2;
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
-        if ((uint64_t)(aSig << 1)) {
-            return propagateFloatx80NaN(a, b, status);
-        }
-        if ( bExp == 0x7FFF ) {
-            if ((uint64_t)(bSig << 1)) {
-                return propagateFloatx80NaN(a, b, status);
-            }
-            goto invalid;
-        }
-        return packFloatx80(zSign, floatx80_infinity_high,
-                                   floatx80_infinity_low);
-    }
-    if ( bExp == 0x7FFF ) {
-        if ((uint64_t)(bSig << 1)) {
-            return propagateFloatx80NaN(a, b, status);
-        }
-        return packFloatx80( zSign, 0, 0 );
-    }
-    if ( bExp == 0 ) {
-        if ( bSig == 0 ) {
-            if ( ( aExp | aSig ) == 0 ) {
- invalid:
-                float_raise(float_flag_invalid, status);
-                return floatx80_default_nan(status);
-            }
-            float_raise(float_flag_divbyzero, status);
-            return packFloatx80(zSign, floatx80_infinity_high,
-                                       floatx80_infinity_low);
-        }
-        normalizeFloatx80Subnormal( bSig, &bExp, &bSig );
-    }
-    if ( aExp == 0 ) {
-        if ( aSig == 0 ) return packFloatx80( zSign, 0, 0 );
-        normalizeFloatx80Subnormal( aSig, &aExp, &aSig );
-    }
-    zExp = aExp - bExp + 0x3FFE;
-    rem1 = 0;
-    if ( bSig <= aSig ) {
-        shift128Right( aSig, 0, 1, &aSig, &rem1 );
-        ++zExp;
-    }
-    zSig0 = estimateDiv128To64( aSig, rem1, bSig );
-    mul64To128( bSig, zSig0, &term0, &term1 );
-    sub128( aSig, rem1, term0, term1, &rem0, &rem1 );
-    while ( (int64_t) rem0 < 0 ) {
-        --zSig0;
-        add128( rem0, rem1, 0, bSig, &rem0, &rem1 );
-    }
-    zSig1 = estimateDiv128To64( rem1, 0, bSig );
-    if ( (uint64_t) ( zSig1<<1 ) <= 8 ) {
-        mul64To128( bSig, zSig1, &term1, &term2 );
-        sub128( rem1, 0, term1, term2, &rem1, &rem2 );
-        while ( (int64_t) rem1 < 0 ) {
-            --zSig1;
-            add128( rem1, rem2, 0, bSig, &rem1, &rem2 );
-        }
-        zSig1 |= ( ( rem1 | rem2 ) != 0 );
-    }
-    return roundAndPackFloatx80(status->floatx80_rounding_precision,
-                                zSign, zExp, zSig0, zSig1, status);
-}
-
 /*----------------------------------------------------------------------------
 | Returns the remainder of the extended double-precision floating-point value
 | `a' with respect to the corresponding value `b'.  The operation is performed
-- 
2.25.1


