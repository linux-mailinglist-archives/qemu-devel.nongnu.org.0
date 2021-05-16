Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD781381EFA
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 15:05:07 +0200 (CEST)
Received: from localhost ([::1]:47452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGSA-0002XD-SB
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 09:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFzC-0007ex-Iu
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:13 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:43922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyv-0007mt-Lm
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:10 -0400
Received: by mail-qk1-x72b.google.com with SMTP id a22so3278810qkl.10
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VuTZsp4nWzxSgrnRWmG8340twmRTJJl7O53UuGDFiDA=;
 b=zB3jc6Sj6guevuaKEsPhcYRfz5CW9LTic7Tk3ZtdhwPmO2iSvrVlc9K5EXL4VzrMHs
 fFdDRUGUxua/JiyEoFK8ZX1b1ptBfOdgBV25vtKmieH+0VnIiMq8LEutRGi1aFGtVcpE
 HK+FOKr5/8bo9BZhabg72wrL39t+u3b22/zRLG/MHO56JSuksozOywLn7ISuWBiLugn5
 /z01Ro0CWVIt49Jg7YcPfdZc9u22kt/tyh/Xcoj9lMryNHotXdvV5MGBKSAuNYpDbvqM
 Q7i2SgNMhp7t0lrZhPFXyswwFGb7h60RY3nA2BJx0HFXL8895d7EDqQtcqEh/MC7J10X
 bLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VuTZsp4nWzxSgrnRWmG8340twmRTJJl7O53UuGDFiDA=;
 b=CqHMcgfYdaJbsxk8UYTRoY7C3vfmnWgPlxQ3vMjfdgTyBy5+rEt9d1vjx4KLGFgqwa
 jdIh2tkQmAtVDNysaAcOp11i9PETwsmcluFXEAXYx0AcdNxQGzKIX4giegn2Nzbny9YZ
 2Wr6Uh7GFTdWe/jSd2+98AttzCJLXpuKPy6y090NE6yHFD3uEu7sMpmw0jz3IWsEf5eT
 MWvxxPX03tVw1mO1JhmltYaS+fEGnXezTi4lzzVQeR/FGl0WVFMGietI2HGvnzQuvlM6
 A3NQ/fU6b/rYt4iEcmd/6QMfqN2osWZKNPNL40YCcdfe54jroN9usL6gnxEn7D0oEHeq
 gyKg==
X-Gm-Message-State: AOAM532c6jvSondlMJuOu+JicBrNTgJYpC7p9JbCslbG8SBwvFvwFo50
 Nz5Ou4yCJUNEd2YW6HB3ftoB23s9Gr/hrp0OuQo=
X-Google-Smtp-Source: ABdhPJzuRlVuYBtGyc4FP49+6EtxpLS/6DHgGVxXwNYv3bL12EKckVKI8ZzKlJBRY3ZjSYZC33DggQ==
X-Received: by 2002:a05:620a:24cf:: with SMTP id
 m15mr50525402qkn.435.1621168490352; 
 Sun, 16 May 2021 05:34:50 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/46] softfloat: Use pointers with ftype_pack_raw
Date: Sun, 16 May 2021 07:34:06 -0500
Message-Id: <20210516123431.718318-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 44 ++++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index b59b777bca..e02cbafaf9 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -626,24 +626,24 @@ static uint64_t pack_raw64(const FloatParts64 *p, const FloatFmt *fmt)
     return ret;
 }
 
-static inline float16 float16_pack_raw(FloatParts64 p)
+static inline float16 float16_pack_raw(const FloatParts64 *p)
 {
-    return make_float16(pack_raw64(&p, &float16_params));
+    return make_float16(pack_raw64(p, &float16_params));
 }
 
-static inline bfloat16 bfloat16_pack_raw(FloatParts64 p)
+static inline bfloat16 bfloat16_pack_raw(const FloatParts64 *p)
 {
-    return pack_raw64(&p, &bfloat16_params);
+    return pack_raw64(p, &bfloat16_params);
 }
 
-static inline float32 float32_pack_raw(FloatParts64 p)
+static inline float32 float32_pack_raw(const FloatParts64 *p)
 {
-    return make_float32(pack_raw64(&p, &float32_params));
+    return make_float32(pack_raw64(p, &float32_params));
 }
 
-static inline float64 float64_pack_raw(FloatParts64 p)
+static inline float64 float64_pack_raw(const FloatParts64 *p)
 {
-    return make_float64(pack_raw64(&p, &float64_params));
+    return make_float64(pack_raw64(p, &float64_params));
 }
 
 /*----------------------------------------------------------------------------
@@ -950,7 +950,8 @@ static FloatParts64 bfloat16_unpack_canonical(bfloat16 f, float_status *s)
 static float16 float16a_round_pack_canonical(FloatParts64 p, float_status *s,
                                              const FloatFmt *params)
 {
-    return float16_pack_raw(round_canonical(p, s, params));
+    p = round_canonical(p, s, params);
+    return float16_pack_raw(&p);
 }
 
 static float16 float16_round_pack_canonical(FloatParts64 p, float_status *s)
@@ -960,7 +961,8 @@ static float16 float16_round_pack_canonical(FloatParts64 p, float_status *s)
 
 static bfloat16 bfloat16_round_pack_canonical(FloatParts64 p, float_status *s)
 {
-    return bfloat16_pack_raw(round_canonical(p, s, &bfloat16_params));
+    p = round_canonical(p, s, &bfloat16_params);
+    return bfloat16_pack_raw(&p);
 }
 
 static FloatParts64 float32_unpack_canonical(float32 f, float_status *s)
@@ -973,7 +975,8 @@ static FloatParts64 float32_unpack_canonical(float32 f, float_status *s)
 
 static float32 float32_round_pack_canonical(FloatParts64 p, float_status *s)
 {
-    return float32_pack_raw(round_canonical(p, s, &float32_params));
+    p = round_canonical(p, s, &float32_params);
+    return float32_pack_raw(&p);
 }
 
 static FloatParts64 float64_unpack_canonical(float64 f, float_status *s)
@@ -986,7 +989,8 @@ static FloatParts64 float64_unpack_canonical(float64 f, float_status *s)
 
 static float64 float64_round_pack_canonical(FloatParts64 p, float_status *s)
 {
-    return float64_pack_raw(round_canonical(p, s, &float64_params));
+    p = round_canonical(p, s, &float64_params);
+    return float64_pack_raw(&p);
 }
 
 /*
@@ -3603,7 +3607,7 @@ float16 float16_default_nan(float_status *status)
 
     parts_default_nan(&p, status);
     p.frac >>= float16_params.frac_shift;
-    return float16_pack_raw(p);
+    return float16_pack_raw(&p);
 }
 
 float32 float32_default_nan(float_status *status)
@@ -3612,7 +3616,7 @@ float32 float32_default_nan(float_status *status)
 
     parts_default_nan(&p, status);
     p.frac >>= float32_params.frac_shift;
-    return float32_pack_raw(p);
+    return float32_pack_raw(&p);
 }
 
 float64 float64_default_nan(float_status *status)
@@ -3621,7 +3625,7 @@ float64 float64_default_nan(float_status *status)
 
     parts_default_nan(&p, status);
     p.frac >>= float64_params.frac_shift;
-    return float64_pack_raw(p);
+    return float64_pack_raw(&p);
 }
 
 float128 float128_default_nan(float_status *status)
@@ -3648,7 +3652,7 @@ bfloat16 bfloat16_default_nan(float_status *status)
 
     parts_default_nan(&p, status);
     p.frac >>= bfloat16_params.frac_shift;
-    return bfloat16_pack_raw(p);
+    return bfloat16_pack_raw(&p);
 }
 
 /*----------------------------------------------------------------------------
@@ -3663,7 +3667,7 @@ float16 float16_silence_nan(float16 a, float_status *status)
     p.frac <<= float16_params.frac_shift;
     p = parts_silence_nan(p, status);
     p.frac >>= float16_params.frac_shift;
-    return float16_pack_raw(p);
+    return float16_pack_raw(&p);
 }
 
 float32 float32_silence_nan(float32 a, float_status *status)
@@ -3674,7 +3678,7 @@ float32 float32_silence_nan(float32 a, float_status *status)
     p.frac <<= float32_params.frac_shift;
     p = parts_silence_nan(p, status);
     p.frac >>= float32_params.frac_shift;
-    return float32_pack_raw(p);
+    return float32_pack_raw(&p);
 }
 
 float64 float64_silence_nan(float64 a, float_status *status)
@@ -3685,7 +3689,7 @@ float64 float64_silence_nan(float64 a, float_status *status)
     p.frac <<= float64_params.frac_shift;
     p = parts_silence_nan(p, status);
     p.frac >>= float64_params.frac_shift;
-    return float64_pack_raw(p);
+    return float64_pack_raw(&p);
 }
 
 bfloat16 bfloat16_silence_nan(bfloat16 a, float_status *status)
@@ -3696,7 +3700,7 @@ bfloat16 bfloat16_silence_nan(bfloat16 a, float_status *status)
     p.frac <<= bfloat16_params.frac_shift;
     p = parts_silence_nan(p, status);
     p.frac >>= bfloat16_params.frac_shift;
-    return bfloat16_pack_raw(p);
+    return bfloat16_pack_raw(&p);
 }
 
 /*----------------------------------------------------------------------------
-- 
2.25.1


