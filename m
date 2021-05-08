Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF05E376E6F
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:13:56 +0200 (CEST)
Received: from localhost ([::1]:53944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCTb-0007Q3-S0
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC55-0004I3-O7
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:35 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:43990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4q-0003d5-EJ
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:35 -0400
Received: by mail-pg1-x52c.google.com with SMTP id p12so8609373pgj.10
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M0HPVw7scs60cHj18a7NXaB7BAAJWWtGGR8hDFRPUCY=;
 b=G6E8FrJo7NIxYAGoHIkfWijbSKvNK4KDoqXjZiSxFfXhtprc+EQOdk5movyQdCRtsC
 YyVNFytJC7qw3f4KwRUoufoXpPsaPjK1wVVkErrcImLcO/tSp+HUM2+5M9oA00ruKdIP
 a3+XIyFlPJA3OgF4btV6bO0yzYL6H7vUKw5HdiCokDLOHA/Cjt0Y3PnBwaH/CmiNWOy3
 lPpfOl/3Y1sv4jqqwurKeQASCKclUdeFwVzhfc89OczqGGO75dxTsyFr9Ap8wpp+PCgN
 /bkT1xnHo+j94OWVr7KColt3K+gIAoQFbAZziMmFowDuImXvfSdp+qYF9gEeucn9tiAj
 lQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M0HPVw7scs60cHj18a7NXaB7BAAJWWtGGR8hDFRPUCY=;
 b=odxu48vDbzMw5yKh6uyb0kEuDHo3XMFEkuFWb7gLHA2PEq9hpMbj1SHxaK1x80f2do
 S99kOy436Mt94xnag8o6WqugZT2Puaee5KLFtd409WZFEN4VhzehHwboRK2bR4oPqqSg
 FH170kvnfbgnEz38WqfuMKjpK5aNNJLUkh4fAsNK/GXo+OC3avzMbUVcwMfykxB4TDy1
 Q1x3kM59nIsRsi7Y+Xrb95jm46A/esm7O9ZQhUetcJPX4thOZKmUzjzu+KUQMZ32pJYe
 0Lve1bmQ18P3G2I0F8bmMVwPjUb94WdPa2BF4+TUdtZIRs0FGXRHvXIaZdG3x5cf08Sx
 fUvA==
X-Gm-Message-State: AOAM531aepu3ZWqfJlCIpBESJzpN6Cr9Zh1X+CkDMJFuaZqOun8xG4wm
 BXpRkj36MRutBL4q+h/DfECick4dKDF95w==
X-Google-Smtp-Source: ABdhPJzlfhs/BlguW5N9oH/fAXanQk4TcgrSpbmnjVVwVgR/0LZZsRc5NMc6BS2EJpLMugdpH2rSAA==
X-Received: by 2002:a65:4902:: with SMTP id p2mr12971471pgs.424.1620438498782; 
 Fri, 07 May 2021 18:48:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/72] softfloat: Use pointers with ftype_round_pack_canonical
Date: Fri,  7 May 2021 18:47:13 -0700
Message-Id: <20210508014802.892561-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
 fpu/softfloat.c | 131 +++++++++++++++++++++++++-----------------------
 1 file changed, 68 insertions(+), 63 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index e53d4a138f..b0cbd5941c 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -945,22 +945,25 @@ static void bfloat16_unpack_canonical(FloatParts64 *p, bfloat16 f,
     *p = sf_canonicalize(*p, &bfloat16_params, s);
 }
 
-static float16 float16a_round_pack_canonical(FloatParts64 p, float_status *s,
+static float16 float16a_round_pack_canonical(FloatParts64 *p,
+                                             float_status *s,
                                              const FloatFmt *params)
 {
-    p = round_canonical(p, s, params);
-    return float16_pack_raw(&p);
+    *p = round_canonical(*p, s, params);
+    return float16_pack_raw(p);
 }
 
-static float16 float16_round_pack_canonical(FloatParts64 p, float_status *s)
+static float16 float16_round_pack_canonical(FloatParts64 *p,
+                                            float_status *s)
 {
     return float16a_round_pack_canonical(p, s, &float16_params);
 }
 
-static bfloat16 bfloat16_round_pack_canonical(FloatParts64 p, float_status *s)
+static bfloat16 bfloat16_round_pack_canonical(FloatParts64 *p,
+                                              float_status *s)
 {
-    p = round_canonical(p, s, &bfloat16_params);
-    return bfloat16_pack_raw(&p);
+    *p = round_canonical(*p, s, &bfloat16_params);
+    return bfloat16_pack_raw(p);
 }
 
 static void float32_unpack_canonical(FloatParts64 *p, float32 f,
@@ -970,10 +973,11 @@ static void float32_unpack_canonical(FloatParts64 *p, float32 f,
     *p = sf_canonicalize(*p, &float32_params, s);
 }
 
-static float32 float32_round_pack_canonical(FloatParts64 p, float_status *s)
+static float32 float32_round_pack_canonical(FloatParts64 *p,
+                                            float_status *s)
 {
-    p = round_canonical(p, s, &float32_params);
-    return float32_pack_raw(&p);
+    *p = round_canonical(*p, s, &float32_params);
+    return float32_pack_raw(p);
 }
 
 static void float64_unpack_canonical(FloatParts64 *p, float64 f,
@@ -983,10 +987,11 @@ static void float64_unpack_canonical(FloatParts64 *p, float64 f,
     *p = sf_canonicalize(*p, &float64_params, s);
 }
 
-static float64 float64_round_pack_canonical(FloatParts64 p, float_status *s)
+static float64 float64_round_pack_canonical(FloatParts64 *p,
+                                            float_status *s)
 {
-    p = round_canonical(p, s, &float64_params);
-    return float64_pack_raw(&p);
+    *p = round_canonical(*p, s, &float64_params);
+    return float64_pack_raw(p);
 }
 
 /*
@@ -1093,7 +1098,7 @@ float16 QEMU_FLATTEN float16_add(float16 a, float16 b, float_status *status)
     float16_unpack_canonical(&pb, b, status);
     pr = addsub_floats(pa, pb, false, status);
 
-    return float16_round_pack_canonical(pr, status);
+    return float16_round_pack_canonical(&pr, status);
 }
 
 float16 QEMU_FLATTEN float16_sub(float16 a, float16 b, float_status *status)
@@ -1104,7 +1109,7 @@ float16 QEMU_FLATTEN float16_sub(float16 a, float16 b, float_status *status)
     float16_unpack_canonical(&pb, b, status);
     pr = addsub_floats(pa, pb, true, status);
 
-    return float16_round_pack_canonical(pr, status);
+    return float16_round_pack_canonical(&pr, status);
 }
 
 static float32 QEMU_SOFTFLOAT_ATTR
@@ -1116,7 +1121,7 @@ soft_f32_addsub(float32 a, float32 b, bool subtract, float_status *status)
     float32_unpack_canonical(&pb, b, status);
     pr = addsub_floats(pa, pb, subtract, status);
 
-    return float32_round_pack_canonical(pr, status);
+    return float32_round_pack_canonical(&pr, status);
 }
 
 static inline float32 soft_f32_add(float32 a, float32 b, float_status *status)
@@ -1138,7 +1143,7 @@ soft_f64_addsub(float64 a, float64 b, bool subtract, float_status *status)
     float64_unpack_canonical(&pb, b, status);
     pr = addsub_floats(pa, pb, subtract, status);
 
-    return float64_round_pack_canonical(pr, status);
+    return float64_round_pack_canonical(&pr, status);
 }
 
 static inline float64 soft_f64_add(float64 a, float64 b, float_status *status)
@@ -1238,7 +1243,7 @@ bfloat16 QEMU_FLATTEN bfloat16_add(bfloat16 a, bfloat16 b, float_status *status)
     bfloat16_unpack_canonical(&pb, b, status);
     pr = addsub_floats(pa, pb, false, status);
 
-    return bfloat16_round_pack_canonical(pr, status);
+    return bfloat16_round_pack_canonical(&pr, status);
 }
 
 bfloat16 QEMU_FLATTEN bfloat16_sub(bfloat16 a, bfloat16 b, float_status *status)
@@ -1249,7 +1254,7 @@ bfloat16 QEMU_FLATTEN bfloat16_sub(bfloat16 a, bfloat16 b, float_status *status)
     bfloat16_unpack_canonical(&pb, b, status);
     pr = addsub_floats(pa, pb, true, status);
 
-    return bfloat16_round_pack_canonical(pr, status);
+    return bfloat16_round_pack_canonical(&pr, status);
 }
 
 /*
@@ -1311,7 +1316,7 @@ float16 QEMU_FLATTEN float16_mul(float16 a, float16 b, float_status *status)
     float16_unpack_canonical(&pb, b, status);
     pr = mul_floats(pa, pb, status);
 
-    return float16_round_pack_canonical(pr, status);
+    return float16_round_pack_canonical(&pr, status);
 }
 
 static float32 QEMU_SOFTFLOAT_ATTR
@@ -1323,7 +1328,7 @@ soft_f32_mul(float32 a, float32 b, float_status *status)
     float32_unpack_canonical(&pb, b, status);
     pr = mul_floats(pa, pb, status);
 
-    return float32_round_pack_canonical(pr, status);
+    return float32_round_pack_canonical(&pr, status);
 }
 
 static float64 QEMU_SOFTFLOAT_ATTR
@@ -1335,7 +1340,7 @@ soft_f64_mul(float64 a, float64 b, float_status *status)
     float64_unpack_canonical(&pb, b, status);
     pr = mul_floats(pa, pb, status);
 
-    return float64_round_pack_canonical(pr, status);
+    return float64_round_pack_canonical(&pr, status);
 }
 
 static float hard_f32_mul(float a, float b)
@@ -1375,7 +1380,7 @@ bfloat16 QEMU_FLATTEN bfloat16_mul(bfloat16 a, bfloat16 b, float_status *status)
     bfloat16_unpack_canonical(&pb, b, status);
     pr = mul_floats(pa, pb, status);
 
-    return bfloat16_round_pack_canonical(pr, status);
+    return bfloat16_round_pack_canonical(&pr, status);
 }
 
 /*
@@ -1574,7 +1579,7 @@ float16 QEMU_FLATTEN float16_muladd(float16 a, float16 b, float16 c,
     float16_unpack_canonical(&pc, c, status);
     pr = muladd_floats(pa, pb, pc, flags, status);
 
-    return float16_round_pack_canonical(pr, status);
+    return float16_round_pack_canonical(&pr, status);
 }
 
 static float32 QEMU_SOFTFLOAT_ATTR
@@ -1588,7 +1593,7 @@ soft_f32_muladd(float32 a, float32 b, float32 c, int flags,
     float32_unpack_canonical(&pc, c, status);
     pr = muladd_floats(pa, pb, pc, flags, status);
 
-    return float32_round_pack_canonical(pr, status);
+    return float32_round_pack_canonical(&pr, status);
 }
 
 static float64 QEMU_SOFTFLOAT_ATTR
@@ -1602,7 +1607,7 @@ soft_f64_muladd(float64 a, float64 b, float64 c, int flags,
     float64_unpack_canonical(&pc, c, status);
     pr = muladd_floats(pa, pb, pc, flags, status);
 
-    return float64_round_pack_canonical(pr, status);
+    return float64_round_pack_canonical(&pr, status);
 }
 
 static bool force_soft_fma;
@@ -1765,7 +1770,7 @@ bfloat16 QEMU_FLATTEN bfloat16_muladd(bfloat16 a, bfloat16 b, bfloat16 c,
     bfloat16_unpack_canonical(&pc, c, status);
     pr = muladd_floats(pa, pb, pc, flags, status);
 
-    return bfloat16_round_pack_canonical(pr, status);
+    return bfloat16_round_pack_canonical(&pr, status);
 }
 
 /*
@@ -1848,7 +1853,7 @@ float16 float16_div(float16 a, float16 b, float_status *status)
     float16_unpack_canonical(&pb, b, status);
     pr = div_floats(pa, pb, status);
 
-    return float16_round_pack_canonical(pr, status);
+    return float16_round_pack_canonical(&pr, status);
 }
 
 static float32 QEMU_SOFTFLOAT_ATTR
@@ -1860,7 +1865,7 @@ soft_f32_div(float32 a, float32 b, float_status *status)
     float32_unpack_canonical(&pb, b, status);
     pr = div_floats(pa, pb, status);
 
-    return float32_round_pack_canonical(pr, status);
+    return float32_round_pack_canonical(&pr, status);
 }
 
 static float64 QEMU_SOFTFLOAT_ATTR
@@ -1872,7 +1877,7 @@ soft_f64_div(float64 a, float64 b, float_status *status)
     float64_unpack_canonical(&pb, b, status);
     pr = div_floats(pa, pb, status);
 
-    return float64_round_pack_canonical(pr, status);
+    return float64_round_pack_canonical(&pr, status);
 }
 
 static float hard_f32_div(float a, float b)
@@ -1946,7 +1951,7 @@ bfloat16 bfloat16_div(bfloat16 a, bfloat16 b, float_status *status)
     bfloat16_unpack_canonical(&pb, b, status);
     pr = div_floats(pa, pb, status);
 
-    return bfloat16_round_pack_canonical(pr, status);
+    return bfloat16_round_pack_canonical(&pr, status);
 }
 
 /*
@@ -2002,7 +2007,7 @@ float32 float16_to_float32(float16 a, bool ieee, float_status *s)
 
     float16a_unpack_canonical(&pa, a, s, fmt16);
     pr = float_to_float(pa, &float32_params, s);
-    return float32_round_pack_canonical(pr, s);
+    return float32_round_pack_canonical(&pr, s);
 }
 
 float64 float16_to_float64(float16 a, bool ieee, float_status *s)
@@ -2012,7 +2017,7 @@ float64 float16_to_float64(float16 a, bool ieee, float_status *s)
 
     float16a_unpack_canonical(&pa, a, s, fmt16);
     pr = float_to_float(pa, &float64_params, s);
-    return float64_round_pack_canonical(pr, s);
+    return float64_round_pack_canonical(&pr, s);
 }
 
 float16 float32_to_float16(float32 a, bool ieee, float_status *s)
@@ -2022,7 +2027,7 @@ float16 float32_to_float16(float32 a, bool ieee, float_status *s)
 
     float32_unpack_canonical(&pa, a, s);
     pr = float_to_float(pa, fmt16, s);
-    return float16a_round_pack_canonical(pr, s, fmt16);
+    return float16a_round_pack_canonical(&pr, s, fmt16);
 }
 
 static float64 QEMU_SOFTFLOAT_ATTR
@@ -2032,7 +2037,7 @@ soft_float32_to_float64(float32 a, float_status *s)
 
     float32_unpack_canonical(&pa, a, s);
     pr = float_to_float(pa, &float64_params, s);
-    return float64_round_pack_canonical(pr, s);
+    return float64_round_pack_canonical(&pr, s);
 }
 
 float64 float32_to_float64(float32 a, float_status *s)
@@ -2058,7 +2063,7 @@ float16 float64_to_float16(float64 a, bool ieee, float_status *s)
 
     float64_unpack_canonical(&pa, a, s);
     pr = float_to_float(pa, fmt16, s);
-    return float16a_round_pack_canonical(pr, s, fmt16);
+    return float16a_round_pack_canonical(&pr, s, fmt16);
 }
 
 float32 float64_to_float32(float64 a, float_status *s)
@@ -2067,7 +2072,7 @@ float32 float64_to_float32(float64 a, float_status *s)
 
     float64_unpack_canonical(&pa, a, s);
     pr = float_to_float(pa, &float32_params, s);
-    return float32_round_pack_canonical(pr, s);
+    return float32_round_pack_canonical(&pr, s);
 }
 
 float32 bfloat16_to_float32(bfloat16 a, float_status *s)
@@ -2076,7 +2081,7 @@ float32 bfloat16_to_float32(bfloat16 a, float_status *s)
 
     bfloat16_unpack_canonical(&pa, a, s);
     pr = float_to_float(pa, &float32_params, s);
-    return float32_round_pack_canonical(pr, s);
+    return float32_round_pack_canonical(&pr, s);
 }
 
 float64 bfloat16_to_float64(bfloat16 a, float_status *s)
@@ -2085,7 +2090,7 @@ float64 bfloat16_to_float64(bfloat16 a, float_status *s)
 
     bfloat16_unpack_canonical(&pa, a, s);
     pr = float_to_float(pa, &float64_params, s);
-    return float64_round_pack_canonical(pr, s);
+    return float64_round_pack_canonical(&pr, s);
 }
 
 bfloat16 float32_to_bfloat16(float32 a, float_status *s)
@@ -2094,7 +2099,7 @@ bfloat16 float32_to_bfloat16(float32 a, float_status *s)
 
     float32_unpack_canonical(&pa, a, s);
     pr = float_to_float(pa, &bfloat16_params, s);
-    return bfloat16_round_pack_canonical(pr, s);
+    return bfloat16_round_pack_canonical(&pr, s);
 }
 
 bfloat16 float64_to_bfloat16(float64 a, float_status *s)
@@ -2103,7 +2108,7 @@ bfloat16 float64_to_bfloat16(float64 a, float_status *s)
 
     float64_unpack_canonical(&pa, a, s);
     pr = float_to_float(pa, &bfloat16_params, s);
-    return bfloat16_round_pack_canonical(pr, s);
+    return bfloat16_round_pack_canonical(&pr, s);
 }
 
 /*
@@ -2220,7 +2225,7 @@ float16 float16_round_to_int(float16 a, float_status *s)
 
     float16_unpack_canonical(&pa, a, s);
     pr = round_to_int(pa, s->float_rounding_mode, 0, s);
-    return float16_round_pack_canonical(pr, s);
+    return float16_round_pack_canonical(&pr, s);
 }
 
 float32 float32_round_to_int(float32 a, float_status *s)
@@ -2229,7 +2234,7 @@ float32 float32_round_to_int(float32 a, float_status *s)
 
     float32_unpack_canonical(&pa, a, s);
     pr = round_to_int(pa, s->float_rounding_mode, 0, s);
-    return float32_round_pack_canonical(pr, s);
+    return float32_round_pack_canonical(&pr, s);
 }
 
 float64 float64_round_to_int(float64 a, float_status *s)
@@ -2238,7 +2243,7 @@ float64 float64_round_to_int(float64 a, float_status *s)
 
     float64_unpack_canonical(&pa, a, s);
     pr = round_to_int(pa, s->float_rounding_mode, 0, s);
-    return float64_round_pack_canonical(pr, s);
+    return float64_round_pack_canonical(&pr, s);
 }
 
 /*
@@ -2252,7 +2257,7 @@ bfloat16 bfloat16_round_to_int(bfloat16 a, float_status *s)
 
     bfloat16_unpack_canonical(&pa, a, s);
     pr = round_to_int(pa, s->float_rounding_mode, 0, s);
-    return bfloat16_round_pack_canonical(pr, s);
+    return bfloat16_round_pack_canonical(&pr, s);
 }
 
 /*
@@ -2898,7 +2903,7 @@ static FloatParts64 int_to_float(int64_t a, int scale, float_status *status)
 float16 int64_to_float16_scalbn(int64_t a, int scale, float_status *status)
 {
     FloatParts64 pa = int_to_float(a, scale, status);
-    return float16_round_pack_canonical(pa, status);
+    return float16_round_pack_canonical(&pa, status);
 }
 
 float16 int32_to_float16_scalbn(int32_t a, int scale, float_status *status)
@@ -2934,7 +2939,7 @@ float16 int8_to_float16(int8_t a, float_status *status)
 float32 int64_to_float32_scalbn(int64_t a, int scale, float_status *status)
 {
     FloatParts64 pa = int_to_float(a, scale, status);
-    return float32_round_pack_canonical(pa, status);
+    return float32_round_pack_canonical(&pa, status);
 }
 
 float32 int32_to_float32_scalbn(int32_t a, int scale, float_status *status)
@@ -2965,7 +2970,7 @@ float32 int16_to_float32(int16_t a, float_status *status)
 float64 int64_to_float64_scalbn(int64_t a, int scale, float_status *status)
 {
     FloatParts64 pa = int_to_float(a, scale, status);
-    return float64_round_pack_canonical(pa, status);
+    return float64_round_pack_canonical(&pa, status);
 }
 
 float64 int32_to_float64_scalbn(int32_t a, int scale, float_status *status)
@@ -3001,7 +3006,7 @@ float64 int16_to_float64(int16_t a, float_status *status)
 bfloat16 int64_to_bfloat16_scalbn(int64_t a, int scale, float_status *status)
 {
     FloatParts64 pa = int_to_float(a, scale, status);
-    return bfloat16_round_pack_canonical(pa, status);
+    return bfloat16_round_pack_canonical(&pa, status);
 }
 
 bfloat16 int32_to_bfloat16_scalbn(int32_t a, int scale, float_status *status)
@@ -3058,7 +3063,7 @@ static FloatParts64 uint_to_float(uint64_t a, int scale, float_status *status)
 float16 uint64_to_float16_scalbn(uint64_t a, int scale, float_status *status)
 {
     FloatParts64 pa = uint_to_float(a, scale, status);
-    return float16_round_pack_canonical(pa, status);
+    return float16_round_pack_canonical(&pa, status);
 }
 
 float16 uint32_to_float16_scalbn(uint32_t a, int scale, float_status *status)
@@ -3094,7 +3099,7 @@ float16 uint8_to_float16(uint8_t a, float_status *status)
 float32 uint64_to_float32_scalbn(uint64_t a, int scale, float_status *status)
 {
     FloatParts64 pa = uint_to_float(a, scale, status);
-    return float32_round_pack_canonical(pa, status);
+    return float32_round_pack_canonical(&pa, status);
 }
 
 float32 uint32_to_float32_scalbn(uint32_t a, int scale, float_status *status)
@@ -3125,7 +3130,7 @@ float32 uint16_to_float32(uint16_t a, float_status *status)
 float64 uint64_to_float64_scalbn(uint64_t a, int scale, float_status *status)
 {
     FloatParts64 pa = uint_to_float(a, scale, status);
-    return float64_round_pack_canonical(pa, status);
+    return float64_round_pack_canonical(&pa, status);
 }
 
 float64 uint32_to_float64_scalbn(uint32_t a, int scale, float_status *status)
@@ -3161,7 +3166,7 @@ float64 uint16_to_float64(uint16_t a, float_status *status)
 bfloat16 uint64_to_bfloat16_scalbn(uint64_t a, int scale, float_status *status)
 {
     FloatParts64 pa = uint_to_float(a, scale, status);
-    return bfloat16_round_pack_canonical(pa, status);
+    return bfloat16_round_pack_canonical(&pa, status);
 }
 
 bfloat16 uint32_to_bfloat16_scalbn(uint32_t a, int scale, float_status *status)
@@ -3284,7 +3289,7 @@ float ## sz float ## sz ## _ ## name(float ## sz a, float ## sz b,      \
     float ## sz ## _unpack_canonical(&pa, a, s);                        \
     float ## sz ## _unpack_canonical(&pb, b, s);                        \
     pr = minmax_floats(pa, pb, ismin, isiee, ismag, s);                 \
-    return float ## sz ## _round_pack_canonical(pr, s);                 \
+    return float ## sz ## _round_pack_canonical(&pr, s);                \
 }
 
 MINMAX(16, min, true, false, false)
@@ -3317,7 +3322,7 @@ bfloat16 bfloat16_ ## name(bfloat16 a, bfloat16 b, float_status *s)     \
     bfloat16_unpack_canonical(&pa, a, s);                               \
     bfloat16_unpack_canonical(&pb, b, s);                               \
     pr = minmax_floats(pa, pb, ismin, isiee, ismag, s);                 \
-    return bfloat16_round_pack_canonical(pr, s);                        \
+    return bfloat16_round_pack_canonical(&pr, s);                       \
 }
 
 BF16_MINMAX(min, true, false, false)
@@ -3535,7 +3540,7 @@ float16 float16_scalbn(float16 a, int n, float_status *status)
 
     float16_unpack_canonical(&pa, a, status);
     pr = scalbn_decomposed(pa, n, status);
-    return float16_round_pack_canonical(pr, status);
+    return float16_round_pack_canonical(&pr, status);
 }
 
 float32 float32_scalbn(float32 a, int n, float_status *status)
@@ -3544,7 +3549,7 @@ float32 float32_scalbn(float32 a, int n, float_status *status)
 
     float32_unpack_canonical(&pa, a, status);
     pr = scalbn_decomposed(pa, n, status);
-    return float32_round_pack_canonical(pr, status);
+    return float32_round_pack_canonical(&pr, status);
 }
 
 float64 float64_scalbn(float64 a, int n, float_status *status)
@@ -3553,7 +3558,7 @@ float64 float64_scalbn(float64 a, int n, float_status *status)
 
     float64_unpack_canonical(&pa, a, status);
     pr = scalbn_decomposed(pa, n, status);
-    return float64_round_pack_canonical(pr, status);
+    return float64_round_pack_canonical(&pr, status);
 }
 
 bfloat16 bfloat16_scalbn(bfloat16 a, int n, float_status *status)
@@ -3562,7 +3567,7 @@ bfloat16 bfloat16_scalbn(bfloat16 a, int n, float_status *status)
 
     bfloat16_unpack_canonical(&pa, a, status);
     pr = scalbn_decomposed(pa, n, status);
-    return bfloat16_round_pack_canonical(pr, status);
+    return bfloat16_round_pack_canonical(&pr, status);
 }
 
 /*
@@ -3642,7 +3647,7 @@ float16 QEMU_FLATTEN float16_sqrt(float16 a, float_status *status)
 
     float16_unpack_canonical(&pa, a, status);
     pr = sqrt_float(pa, status, &float16_params);
-    return float16_round_pack_canonical(pr, status);
+    return float16_round_pack_canonical(&pr, status);
 }
 
 static float32 QEMU_SOFTFLOAT_ATTR
@@ -3652,7 +3657,7 @@ soft_f32_sqrt(float32 a, float_status *status)
 
     float32_unpack_canonical(&pa, a, status);
     pr = sqrt_float(pa, status, &float32_params);
-    return float32_round_pack_canonical(pr, status);
+    return float32_round_pack_canonical(&pr, status);
 }
 
 static float64 QEMU_SOFTFLOAT_ATTR
@@ -3662,7 +3667,7 @@ soft_f64_sqrt(float64 a, float_status *status)
 
     float64_unpack_canonical(&pa, a, status);
     pr = sqrt_float(pa, status, &float64_params);
-    return float64_round_pack_canonical(pr, status);
+    return float64_round_pack_canonical(&pr, status);
 }
 
 float32 QEMU_FLATTEN float32_sqrt(float32 xa, float_status *s)
@@ -3725,7 +3730,7 @@ bfloat16 QEMU_FLATTEN bfloat16_sqrt(bfloat16 a, float_status *status)
 
     bfloat16_unpack_canonical(&pa, a, status);
     pr = sqrt_float(pa, status, &bfloat16_params);
-    return bfloat16_round_pack_canonical(pr, status);
+    return bfloat16_round_pack_canonical(&pr, status);
 }
 
 /*----------------------------------------------------------------------------
-- 
2.25.1


