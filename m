Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835625092DA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:31:19 +0200 (CEST)
Received: from localhost ([::1]:35866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhIr0-0003Bg-Hh
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIe2-0000Yi-Ix; Wed, 20 Apr 2022 18:17:54 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:40578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIe0-0006Ai-SC; Wed, 20 Apr 2022 18:17:54 -0400
Received: by mail-oi1-x234.google.com with SMTP id r85so3667195oie.7;
 Wed, 20 Apr 2022 15:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ocuRPmviH90kePLqA3uWGQ6EaI/mY/Ed1xN/dy4K+E=;
 b=kUSjQ3a4uYfXFVB/xuHzfK5Qp6W8iK9R/NfeewNlK3wOByPZhHDRQ+p5r0j9zRM6Tv
 NLoeRJKkMqI5eRkNZIBMsF2CWLRdOTFrgj48ycIHzyJNzxFAKxmrgsB8830uKMYTEeNT
 YcyMOMtl/Kbx+R431GPRahkLaKe2302AZaytzuLNogF7QGA43c4lNrvgmJiQJyJyVZUO
 2/STrznCyVOtwBQdbBoC/1XnM2Uz/r9s3d+p/BdPZ4NAYfmi84XtkxG2gTxYQmh8nQMA
 nL1e0Sn2NPsLr8fMppuT3CsbAtQJn3Ceser7kGUqz0Kia/D9MsrZJoxwR7DMCRb0RfEq
 QJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ocuRPmviH90kePLqA3uWGQ6EaI/mY/Ed1xN/dy4K+E=;
 b=ODtYWK6JU44SsG+Rvv8tmbxDj2H6OCBPMMcEN7OCnZIgdPJiujMxcx4JmWjEQ6wc8Y
 P2IapWe3rzp9il3kYvBFnvzBe6Zo9Rf2nEJX7TuvV4IGOyz72mjCxCamMZEcuRw59VQV
 6OdjSrlK1QzpGwlqFOqjXxf8Sdtp+3PI66OV2sow4QK+gB13Qpw6em63tHMIuOdWlw2Z
 6A6TdhtLjJrSQ+hMi6c/Pe5FjTerThwxfsFoeSc4b0LZHFPQculRs1CmHEr+jnVda4BV
 ZJ4ORS8RymtxhjcY+YFxuyOe9C0LcW/Cjz2a/9EBT5udISbnqAcTURs/5XoGEkAK5oIm
 xJjA==
X-Gm-Message-State: AOAM532vbKyOOttyFSG62qlAiEOGrZ2PnjH2gSyGks/v2J7G3v57krcI
 HNFIUBIii7xEPKi6st3JYd0dzeNaCe0=
X-Google-Smtp-Source: ABdhPJzYVlx+Z49r3M+aLgCGDZPEY2UG0V77wLfZ6c1AxtwUs6aZzv6fGt5WzgtOnPCa5YwtW6PdCQ==
X-Received: by 2002:a54:4114:0:b0:322:9b44:e45e with SMTP id
 l20-20020a544114000000b003229b44e45emr2698683oic.230.1650493069207; 
 Wed, 20 Apr 2022 15:17:49 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:17:48 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/23] softfloat: add float128_to_int128
Date: Wed, 20 Apr 2022 19:13:21 -0300
Message-Id: <20220420221329.169755-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 danielhb413@gmail.com, qemu-ppc@nongnu.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Implements float128_to_int128 based on parts_float_to_int logic.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220330175932.6995-7-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 fpu/softfloat.c         | 64 +++++++++++++++++++++++++++++++++++++++++
 include/fpu/softfloat.h |  2 ++
 include/qemu/int128.h   |  2 ++
 3 files changed, 68 insertions(+)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index ce21b64e4f..5e2cf20448 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3154,6 +3154,60 @@ static int64_t float128_to_int64_scalbn(float128 a, FloatRoundMode rmode,
     return parts_float_to_sint(&p, rmode, scale, INT64_MIN, INT64_MAX, s);
 }
 
+static Int128 float128_to_int128_scalbn(float128 a, FloatRoundMode rmode,
+                                        int scale, float_status *s)
+{
+    int flags = 0;
+    Int128 r;
+    FloatParts128 p;
+
+    float128_unpack_canonical(&p, a, s);
+
+    switch (p.cls) {
+    case float_class_snan:
+        flags |= float_flag_invalid_snan;
+        /* fall through */
+    case float_class_qnan:
+        flags |= float_flag_invalid;
+        r = UINT128_MAX;
+        break;
+
+    case float_class_inf:
+        flags = float_flag_invalid | float_flag_invalid_cvti;
+        r = p.sign ? INT128_MIN : INT128_MAX;
+        break;
+
+    case float_class_zero:
+        return int128_zero();
+
+    case float_class_normal:
+        if (parts_round_to_int_normal(&p, rmode, scale, 128 - 2)) {
+            flags = float_flag_inexact;
+        }
+
+        if (p.exp < 127) {
+            int shift = 127 - p.exp;
+            r = int128_urshift(int128_make128(p.frac_lo, p.frac_hi), shift);
+            if (p.sign) {
+                r = int128_neg(r);
+            }
+        } else if (p.exp == 127 && p.sign && p.frac_lo == 0 &&
+                   p.frac_hi == DECOMPOSED_IMPLICIT_BIT) {
+            r = INT128_MIN;
+        } else {
+            flags = float_flag_invalid | float_flag_invalid_cvti;
+            r = p.sign ? INT128_MIN : INT128_MAX;
+        }
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+
+    float_raise(flags, s);
+    return r;
+}
+
 static int32_t floatx80_to_int32_scalbn(floatx80 a, FloatRoundMode rmode,
                                         int scale, float_status *s)
 {
@@ -3236,6 +3290,11 @@ int64_t float128_to_int64(float128 a, float_status *s)
     return float128_to_int64_scalbn(a, s->float_rounding_mode, 0, s);
 }
 
+Int128 float128_to_int128(float128 a, float_status *s)
+{
+    return float128_to_int128_scalbn(a, s->float_rounding_mode, 0, s);
+}
+
 int32_t floatx80_to_int32(floatx80 a, float_status *s)
 {
     return floatx80_to_int32_scalbn(a, s->float_rounding_mode, 0, s);
@@ -3301,6 +3360,11 @@ int64_t float128_to_int64_round_to_zero(float128 a, float_status *s)
     return float128_to_int64_scalbn(a, float_round_to_zero, 0, s);
 }
 
+Int128 float128_to_int128_round_to_zero(float128 a, float_status *s)
+{
+    return float128_to_int128_scalbn(a, float_round_to_zero, 0, s);
+}
+
 int32_t floatx80_to_int32_round_to_zero(floatx80 a, float_status *s)
 {
     return floatx80_to_int32_scalbn(a, float_round_to_zero, 0, s);
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 6cfe9ee474..3dcf20e3a2 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -1204,7 +1204,9 @@ floatx80 floatx80_default_nan(float_status *status);
 int32_t float128_to_int32(float128, float_status *status);
 int32_t float128_to_int32_round_to_zero(float128, float_status *status);
 int64_t float128_to_int64(float128, float_status *status);
+Int128 float128_to_int128(float128, float_status *status);
 int64_t float128_to_int64_round_to_zero(float128, float_status *status);
+Int128 float128_to_int128_round_to_zero(float128, float_status *status);
 uint64_t float128_to_uint64(float128, float_status *status);
 Int128 float128_to_uint128(float128, float_status *status);
 uint64_t float128_to_uint64_round_to_zero(float128, float_status *status);
diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index 1f82918c73..ef71f56e3f 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -431,5 +431,7 @@ static inline void bswap128s(Int128 *s)
 }
 
 #define UINT128_MAX int128_make128(~0LL, ~0LL)
+#define INT128_MAX int128_make128(UINT64_MAX, INT64_MAX)
+#define INT128_MIN int128_make128(0, INT64_MIN)
 
 #endif /* INT128_H */
-- 
2.35.1


