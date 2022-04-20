Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 628B550930A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:41:10 +0200 (CEST)
Received: from localhost ([::1]:59102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhJ0X-0002g9-94
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIe1-0000Uo-AU; Wed, 20 Apr 2022 18:17:53 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:39506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIdw-0006AO-G7; Wed, 20 Apr 2022 18:17:52 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 k29-20020a056830243d00b006040caa0988so2054117ots.6; 
 Wed, 20 Apr 2022 15:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MF4i7kajCeIXfqc2vLUVXHtJfTWzjNo76PYczy7TM7w=;
 b=jyQrMycViJWukIl4Riu4544+vTZU7jySIY1fK2tvPt9KYWpZrfcWIWuwqibJMdZShi
 909lVU4VobeKSZDgcNkjHQFwfxabufd+dCnLtEHFsCoQeWl6M5mQ0+2dOJnd1f8bQt6m
 rfL/XgFzKZU99/7WKIKbY/OPwv0rLR5Qhyn6lvGCy/f8aOHd77GKO1/J0fwhtg6To9xm
 Gu0N+r7uKLhuSXXFXYn17k5V066nuVyPQhZMs3HozWInMrwquwaZ/c6zhx0ySCoSWZJS
 eaypPhHvCQdgyyKBfwh5oU7GyQpzXhiXaxk5uDfTKJLr5hSZ332mbQJ2oKVDT1JJzeig
 9Qzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MF4i7kajCeIXfqc2vLUVXHtJfTWzjNo76PYczy7TM7w=;
 b=xdVKfU7TNNF0s6630wBL+RmLfyBQfTovyWRx1ZqqjiCyPZEe1mi75S1v7ns95frluG
 Job3Q3UuWCdcTBF/6PR3ZX7wZiRSRZ98l41gR+L78fleuIFv4INGmwTrRVEZumMTltss
 BjUPEcS5zCkU+tBfzqqOfxUrDJqv3VEKT90JG4kxDxnxCOQH+nLU+mH1wEduWIDcE116
 wHJJZYwCONPOOU+zL3QpFy3FDJsNZXur55ArJrU8f/Gd9vH/8/kemOIXzpU0KoquFNl0
 T+L1vKfh0gTZZy7DTBQ1HX3VjXE4rN/5a+nCNQ92OgDVlYOt/49WWXv3KHDD6bDEM3Is
 n2fg==
X-Gm-Message-State: AOAM531ZNap4iZXneheJZlvJvOczVADeXpLioFS7sNMgkcG69aZjtr23
 DVtFbtla39Fc4b9QE7TKYuO/KBMWwdE=
X-Google-Smtp-Source: ABdhPJyF0UVjd+ZEFwpde8gXZ2hesqq8jjlJKkXvaYgjvADdDfqJ2Hh8Wb85wzFIRYhKjOvFP7vJFQ==
X-Received: by 2002:a9d:62c:0:b0:5e6:b611:ff6b with SMTP id
 41-20020a9d062c000000b005e6b611ff6bmr8357116otn.210.1650493067002; 
 Wed, 20 Apr 2022 15:17:47 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:17:46 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/23] softfloat: add float128_to_uint128
Date: Wed, 20 Apr 2022 19:13:20 -0300
Message-Id: <20220420221329.169755-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x336.google.com
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

Implements float128_to_uint128 based on parts_float_to_uint logic.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220330175932.6995-6-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 fpu/softfloat.c         | 65 +++++++++++++++++++++++++++++++++++++++++
 include/fpu/softfloat.h |  2 ++
 2 files changed, 67 insertions(+)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 60b4702945..ce21b64e4f 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3480,6 +3480,61 @@ static uint64_t float128_to_uint64_scalbn(float128 a, FloatRoundMode rmode,
     return parts_float_to_uint(&p, rmode, scale, UINT64_MAX, s);
 }
 
+static Int128 float128_to_uint128_scalbn(float128 a, FloatRoundMode rmode,
+                                         int scale, float_status *s)
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
+        r = p.sign ? int128_zero() : UINT128_MAX;
+        break;
+
+    case float_class_zero:
+        return int128_zero();
+
+    case float_class_normal:
+        if (parts_round_to_int_normal(&p, rmode, scale, 128 - 2)) {
+            flags = float_flag_inexact;
+            if (p.cls == float_class_zero) {
+                r = int128_zero();
+                break;
+            }
+        }
+
+        if (p.sign) {
+            flags = float_flag_invalid | float_flag_invalid_cvti;
+            r = int128_zero();
+        } else if (p.exp <= 127) {
+            int shift = 127 - p.exp;
+            r = int128_urshift(int128_make128(p.frac_lo, p.frac_hi), shift);
+        } else {
+            flags = float_flag_invalid | float_flag_invalid_cvti;
+            r = UINT128_MAX;
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
 uint8_t float16_to_uint8(float16 a, float_status *s)
 {
     return float16_to_uint8_scalbn(a, s->float_rounding_mode, 0, s);
@@ -3540,6 +3595,11 @@ uint64_t float128_to_uint64(float128 a, float_status *s)
     return float128_to_uint64_scalbn(a, s->float_rounding_mode, 0, s);
 }
 
+Int128 float128_to_uint128(float128 a, float_status *s)
+{
+    return float128_to_uint128_scalbn(a, s->float_rounding_mode, 0, s);
+}
+
 uint16_t float16_to_uint16_round_to_zero(float16 a, float_status *s)
 {
     return float16_to_uint16_scalbn(a, float_round_to_zero, 0, s);
@@ -3595,6 +3655,11 @@ uint64_t float128_to_uint64_round_to_zero(float128 a, float_status *s)
     return float128_to_uint64_scalbn(a, float_round_to_zero, 0, s);
 }
 
+Int128 float128_to_uint128_round_to_zero(float128 a, float_status *s)
+{
+    return float128_to_uint128_scalbn(a, float_round_to_zero, 0, s);
+}
+
 uint16_t bfloat16_to_uint16(bfloat16 a, float_status *s)
 {
     return bfloat16_to_uint16_scalbn(a, s->float_rounding_mode, 0, s);
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 3994b7235d..6cfe9ee474 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -1206,7 +1206,9 @@ int32_t float128_to_int32_round_to_zero(float128, float_status *status);
 int64_t float128_to_int64(float128, float_status *status);
 int64_t float128_to_int64_round_to_zero(float128, float_status *status);
 uint64_t float128_to_uint64(float128, float_status *status);
+Int128 float128_to_uint128(float128, float_status *status);
 uint64_t float128_to_uint64_round_to_zero(float128, float_status *status);
+Int128 float128_to_uint128_round_to_zero(float128, float_status *status);
 uint32_t float128_to_uint32(float128, float_status *status);
 uint32_t float128_to_uint32_round_to_zero(float128, float_status *status);
 float32 float128_to_float32(float128, float_status *status);
-- 
2.35.1


