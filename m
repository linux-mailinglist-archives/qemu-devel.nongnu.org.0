Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94602376E4A
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 03:58:50 +0200 (CEST)
Received: from localhost ([::1]:39650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCEz-0003vj-Lx
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 21:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC53-0004GX-PO
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:35 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:44939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4p-0003cx-OA
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:33 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 lj11-20020a17090b344bb029015bc3073608so6550051pjb.3
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oSU8Ftn14AES4clPY4sf6OHCZWERR7N5EEoVS95CUjw=;
 b=nFCoqsA95VWXBWko5Ug+D8QDsNp70e5OGfwe/wscQGrMzraeVvw2ZQqIiAto9DUHnz
 EtLsVPHX58O6FRVgsdRNWvehT9r25lfVLcL1pKFgMPX4xMAdMNAJuG1hewNmMQ3kWasG
 5OnQo28xMexZDmkycWVQSFx14WAS5ctd+BYVOJ6krr3LjKkAzi1DE6sZsdmo30c1cvG+
 JwUFpVEt1UWfwUjJOYEN1Z4t08YhsmW3SYhNBjixpCXrRVhQpTwLY4kHcw6y8JVhYQve
 uXUg71fxNkvNsw+IaJqJYg0zfaUSdXBOhgld582nNlxHiu59FkRT8yfajdCgS00vC9RL
 kuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oSU8Ftn14AES4clPY4sf6OHCZWERR7N5EEoVS95CUjw=;
 b=HKsKpTGIQGI8gB8AI3oEYib67ctScDVKetSD4zIydphlZ+fInabxmpHGdBFgkvUYZO
 yidtJ0fDI3SvzvQgIaaLXm2OU8sz+G0gv40BTJWOJasQJERt+x6icDT6NvQDIgLOSbkf
 15uBN+0XhSL+XeEzk8Eq0CCXmmh5rQeE/UuSvRQmHQ7SSbwBGJWfJ6F9Z21+POCD+y2v
 nsX18Z2f6LRlN6PoBOe8Zj0F9ujiSw8ka+lC6dHb0cg1GT48w2oLWD661HTIcXN/OugS
 DrslNTQaFThtvMruBAGxWMdOiqdwg3+tjtihMygigYwKKCsmqump7Ou68gkY67wbKElF
 7OhA==
X-Gm-Message-State: AOAM531scx45tZT5fwkht3EV7+2W0hF8MgrlQXBmLyg/y01wyrBscdr0
 fIjCmWpL9hDb2fXdeDukVsuMnovbCLi1eA==
X-Google-Smtp-Source: ABdhPJyxHzO8RcQZiZUR6xcQCmNv3FtcQfWubZjzmeNq2vc2x6zICJYPgBb6JKyJilXB/3YAX5QxTg==
X-Received: by 2002:a17:902:c745:b029:ee:8f40:6228 with SMTP id
 q5-20020a170902c745b02900ee8f406228mr12601038plq.22.1620438498056; 
 Fri, 07 May 2021 18:48:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/72] softfloat: Use pointers with ftype_unpack_canonical
Date: Fri,  7 May 2021 18:47:12 -0700
Message-Id: <20210508014802.892561-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
 fpu/softfloat.c | 509 ++++++++++++++++++++++++++++++------------------
 1 file changed, 320 insertions(+), 189 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index e02cbafaf9..e53d4a138f 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -925,26 +925,24 @@ static FloatParts64 pick_nan_muladd(FloatParts64 a, FloatParts64 b, FloatParts64
  * Pack/unpack routines with a specific FloatFmt.
  */
 
-static FloatParts64 float16a_unpack_canonical(float16 f, float_status *s,
-                                            const FloatFmt *params)
+static void float16a_unpack_canonical(FloatParts64 *p, float16 f,
+                                      float_status *s, const FloatFmt *params)
 {
-    FloatParts64 p;
-
-    float16_unpack_raw(&p, f);
-    return sf_canonicalize(p, params, s);
+    float16_unpack_raw(p, f);
+    *p = sf_canonicalize(*p, params, s);
 }
 
-static FloatParts64 float16_unpack_canonical(float16 f, float_status *s)
+static void float16_unpack_canonical(FloatParts64 *p, float16 f,
+                                     float_status *s)
 {
-    return float16a_unpack_canonical(f, s, &float16_params);
+    float16a_unpack_canonical(p, f, s, &float16_params);
 }
 
-static FloatParts64 bfloat16_unpack_canonical(bfloat16 f, float_status *s)
+static void bfloat16_unpack_canonical(FloatParts64 *p, bfloat16 f,
+                                      float_status *s)
 {
-    FloatParts64 p;
-
-    bfloat16_unpack_raw(&p, f);
-    return sf_canonicalize(p, &bfloat16_params, s);
+    bfloat16_unpack_raw(p, f);
+    *p = sf_canonicalize(*p, &bfloat16_params, s);
 }
 
 static float16 float16a_round_pack_canonical(FloatParts64 p, float_status *s,
@@ -965,12 +963,11 @@ static bfloat16 bfloat16_round_pack_canonical(FloatParts64 p, float_status *s)
     return bfloat16_pack_raw(&p);
 }
 
-static FloatParts64 float32_unpack_canonical(float32 f, float_status *s)
+static void float32_unpack_canonical(FloatParts64 *p, float32 f,
+                                     float_status *s)
 {
-    FloatParts64 p;
-
-    float32_unpack_raw(&p, f);
-    return sf_canonicalize(p, &float32_params, s);
+    float32_unpack_raw(p, f);
+    *p = sf_canonicalize(*p, &float32_params, s);
 }
 
 static float32 float32_round_pack_canonical(FloatParts64 p, float_status *s)
@@ -979,12 +976,11 @@ static float32 float32_round_pack_canonical(FloatParts64 p, float_status *s)
     return float32_pack_raw(&p);
 }
 
-static FloatParts64 float64_unpack_canonical(float64 f, float_status *s)
+static void float64_unpack_canonical(FloatParts64 *p, float64 f,
+                                     float_status *s)
 {
-    FloatParts64 p;
-
-    float64_unpack_raw(&p, f);
-    return sf_canonicalize(p, &float64_params, s);
+    float64_unpack_raw(p, f);
+    *p = sf_canonicalize(*p, &float64_params, s);
 }
 
 static float64 float64_round_pack_canonical(FloatParts64 p, float_status *s)
@@ -1091,18 +1087,22 @@ static FloatParts64 addsub_floats(FloatParts64 a, FloatParts64 b, bool subtract,
 
 float16 QEMU_FLATTEN float16_add(float16 a, float16 b, float_status *status)
 {
-    FloatParts64 pa = float16_unpack_canonical(a, status);
-    FloatParts64 pb = float16_unpack_canonical(b, status);
-    FloatParts64 pr = addsub_floats(pa, pb, false, status);
+    FloatParts64 pa, pb, pr;
+
+    float16_unpack_canonical(&pa, a, status);
+    float16_unpack_canonical(&pb, b, status);
+    pr = addsub_floats(pa, pb, false, status);
 
     return float16_round_pack_canonical(pr, status);
 }
 
 float16 QEMU_FLATTEN float16_sub(float16 a, float16 b, float_status *status)
 {
-    FloatParts64 pa = float16_unpack_canonical(a, status);
-    FloatParts64 pb = float16_unpack_canonical(b, status);
-    FloatParts64 pr = addsub_floats(pa, pb, true, status);
+    FloatParts64 pa, pb, pr;
+
+    float16_unpack_canonical(&pa, a, status);
+    float16_unpack_canonical(&pb, b, status);
+    pr = addsub_floats(pa, pb, true, status);
 
     return float16_round_pack_canonical(pr, status);
 }
@@ -1110,9 +1110,11 @@ float16 QEMU_FLATTEN float16_sub(float16 a, float16 b, float_status *status)
 static float32 QEMU_SOFTFLOAT_ATTR
 soft_f32_addsub(float32 a, float32 b, bool subtract, float_status *status)
 {
-    FloatParts64 pa = float32_unpack_canonical(a, status);
-    FloatParts64 pb = float32_unpack_canonical(b, status);
-    FloatParts64 pr = addsub_floats(pa, pb, subtract, status);
+    FloatParts64 pa, pb, pr;
+
+    float32_unpack_canonical(&pa, a, status);
+    float32_unpack_canonical(&pb, b, status);
+    pr = addsub_floats(pa, pb, subtract, status);
 
     return float32_round_pack_canonical(pr, status);
 }
@@ -1130,9 +1132,11 @@ static inline float32 soft_f32_sub(float32 a, float32 b, float_status *status)
 static float64 QEMU_SOFTFLOAT_ATTR
 soft_f64_addsub(float64 a, float64 b, bool subtract, float_status *status)
 {
-    FloatParts64 pa = float64_unpack_canonical(a, status);
-    FloatParts64 pb = float64_unpack_canonical(b, status);
-    FloatParts64 pr = addsub_floats(pa, pb, subtract, status);
+    FloatParts64 pa, pb, pr;
+
+    float64_unpack_canonical(&pa, a, status);
+    float64_unpack_canonical(&pb, b, status);
+    pr = addsub_floats(pa, pb, subtract, status);
 
     return float64_round_pack_canonical(pr, status);
 }
@@ -1228,18 +1232,22 @@ float64_sub(float64 a, float64 b, float_status *s)
  */
 bfloat16 QEMU_FLATTEN bfloat16_add(bfloat16 a, bfloat16 b, float_status *status)
 {
-    FloatParts64 pa = bfloat16_unpack_canonical(a, status);
-    FloatParts64 pb = bfloat16_unpack_canonical(b, status);
-    FloatParts64 pr = addsub_floats(pa, pb, false, status);
+    FloatParts64 pa, pb, pr;
+
+    bfloat16_unpack_canonical(&pa, a, status);
+    bfloat16_unpack_canonical(&pb, b, status);
+    pr = addsub_floats(pa, pb, false, status);
 
     return bfloat16_round_pack_canonical(pr, status);
 }
 
 bfloat16 QEMU_FLATTEN bfloat16_sub(bfloat16 a, bfloat16 b, float_status *status)
 {
-    FloatParts64 pa = bfloat16_unpack_canonical(a, status);
-    FloatParts64 pb = bfloat16_unpack_canonical(b, status);
-    FloatParts64 pr = addsub_floats(pa, pb, true, status);
+    FloatParts64 pa, pb, pr;
+
+    bfloat16_unpack_canonical(&pa, a, status);
+    bfloat16_unpack_canonical(&pb, b, status);
+    pr = addsub_floats(pa, pb, true, status);
 
     return bfloat16_round_pack_canonical(pr, status);
 }
@@ -1297,9 +1305,11 @@ static FloatParts64 mul_floats(FloatParts64 a, FloatParts64 b, float_status *s)
 
 float16 QEMU_FLATTEN float16_mul(float16 a, float16 b, float_status *status)
 {
-    FloatParts64 pa = float16_unpack_canonical(a, status);
-    FloatParts64 pb = float16_unpack_canonical(b, status);
-    FloatParts64 pr = mul_floats(pa, pb, status);
+    FloatParts64 pa, pb, pr;
+
+    float16_unpack_canonical(&pa, a, status);
+    float16_unpack_canonical(&pb, b, status);
+    pr = mul_floats(pa, pb, status);
 
     return float16_round_pack_canonical(pr, status);
 }
@@ -1307,9 +1317,11 @@ float16 QEMU_FLATTEN float16_mul(float16 a, float16 b, float_status *status)
 static float32 QEMU_SOFTFLOAT_ATTR
 soft_f32_mul(float32 a, float32 b, float_status *status)
 {
-    FloatParts64 pa = float32_unpack_canonical(a, status);
-    FloatParts64 pb = float32_unpack_canonical(b, status);
-    FloatParts64 pr = mul_floats(pa, pb, status);
+    FloatParts64 pa, pb, pr;
+
+    float32_unpack_canonical(&pa, a, status);
+    float32_unpack_canonical(&pb, b, status);
+    pr = mul_floats(pa, pb, status);
 
     return float32_round_pack_canonical(pr, status);
 }
@@ -1317,9 +1329,11 @@ soft_f32_mul(float32 a, float32 b, float_status *status)
 static float64 QEMU_SOFTFLOAT_ATTR
 soft_f64_mul(float64 a, float64 b, float_status *status)
 {
-    FloatParts64 pa = float64_unpack_canonical(a, status);
-    FloatParts64 pb = float64_unpack_canonical(b, status);
-    FloatParts64 pr = mul_floats(pa, pb, status);
+    FloatParts64 pa, pb, pr;
+
+    float64_unpack_canonical(&pa, a, status);
+    float64_unpack_canonical(&pb, b, status);
+    pr = mul_floats(pa, pb, status);
 
     return float64_round_pack_canonical(pr, status);
 }
@@ -1355,9 +1369,11 @@ float64_mul(float64 a, float64 b, float_status *s)
 
 bfloat16 QEMU_FLATTEN bfloat16_mul(bfloat16 a, bfloat16 b, float_status *status)
 {
-    FloatParts64 pa = bfloat16_unpack_canonical(a, status);
-    FloatParts64 pb = bfloat16_unpack_canonical(b, status);
-    FloatParts64 pr = mul_floats(pa, pb, status);
+    FloatParts64 pa, pb, pr;
+
+    bfloat16_unpack_canonical(&pa, a, status);
+    bfloat16_unpack_canonical(&pb, b, status);
+    pr = mul_floats(pa, pb, status);
 
     return bfloat16_round_pack_canonical(pr, status);
 }
@@ -1551,10 +1567,12 @@ static FloatParts64 muladd_floats(FloatParts64 a, FloatParts64 b, FloatParts64 c
 float16 QEMU_FLATTEN float16_muladd(float16 a, float16 b, float16 c,
                                                 int flags, float_status *status)
 {
-    FloatParts64 pa = float16_unpack_canonical(a, status);
-    FloatParts64 pb = float16_unpack_canonical(b, status);
-    FloatParts64 pc = float16_unpack_canonical(c, status);
-    FloatParts64 pr = muladd_floats(pa, pb, pc, flags, status);
+    FloatParts64 pa, pb, pc, pr;
+
+    float16_unpack_canonical(&pa, a, status);
+    float16_unpack_canonical(&pb, b, status);
+    float16_unpack_canonical(&pc, c, status);
+    pr = muladd_floats(pa, pb, pc, flags, status);
 
     return float16_round_pack_canonical(pr, status);
 }
@@ -1563,10 +1581,12 @@ static float32 QEMU_SOFTFLOAT_ATTR
 soft_f32_muladd(float32 a, float32 b, float32 c, int flags,
                 float_status *status)
 {
-    FloatParts64 pa = float32_unpack_canonical(a, status);
-    FloatParts64 pb = float32_unpack_canonical(b, status);
-    FloatParts64 pc = float32_unpack_canonical(c, status);
-    FloatParts64 pr = muladd_floats(pa, pb, pc, flags, status);
+    FloatParts64 pa, pb, pc, pr;
+
+    float32_unpack_canonical(&pa, a, status);
+    float32_unpack_canonical(&pb, b, status);
+    float32_unpack_canonical(&pc, c, status);
+    pr = muladd_floats(pa, pb, pc, flags, status);
 
     return float32_round_pack_canonical(pr, status);
 }
@@ -1575,10 +1595,12 @@ static float64 QEMU_SOFTFLOAT_ATTR
 soft_f64_muladd(float64 a, float64 b, float64 c, int flags,
                 float_status *status)
 {
-    FloatParts64 pa = float64_unpack_canonical(a, status);
-    FloatParts64 pb = float64_unpack_canonical(b, status);
-    FloatParts64 pc = float64_unpack_canonical(c, status);
-    FloatParts64 pr = muladd_floats(pa, pb, pc, flags, status);
+    FloatParts64 pa, pb, pc, pr;
+
+    float64_unpack_canonical(&pa, a, status);
+    float64_unpack_canonical(&pb, b, status);
+    float64_unpack_canonical(&pc, c, status);
+    pr = muladd_floats(pa, pb, pc, flags, status);
 
     return float64_round_pack_canonical(pr, status);
 }
@@ -1736,10 +1758,12 @@ float64_muladd(float64 xa, float64 xb, float64 xc, int flags, float_status *s)
 bfloat16 QEMU_FLATTEN bfloat16_muladd(bfloat16 a, bfloat16 b, bfloat16 c,
                                       int flags, float_status *status)
 {
-    FloatParts64 pa = bfloat16_unpack_canonical(a, status);
-    FloatParts64 pb = bfloat16_unpack_canonical(b, status);
-    FloatParts64 pc = bfloat16_unpack_canonical(c, status);
-    FloatParts64 pr = muladd_floats(pa, pb, pc, flags, status);
+    FloatParts64 pa, pb, pc, pr;
+
+    bfloat16_unpack_canonical(&pa, a, status);
+    bfloat16_unpack_canonical(&pb, b, status);
+    bfloat16_unpack_canonical(&pc, c, status);
+    pr = muladd_floats(pa, pb, pc, flags, status);
 
     return bfloat16_round_pack_canonical(pr, status);
 }
@@ -1818,9 +1842,11 @@ static FloatParts64 div_floats(FloatParts64 a, FloatParts64 b, float_status *s)
 
 float16 float16_div(float16 a, float16 b, float_status *status)
 {
-    FloatParts64 pa = float16_unpack_canonical(a, status);
-    FloatParts64 pb = float16_unpack_canonical(b, status);
-    FloatParts64 pr = div_floats(pa, pb, status);
+    FloatParts64 pa, pb, pr;
+
+    float16_unpack_canonical(&pa, a, status);
+    float16_unpack_canonical(&pb, b, status);
+    pr = div_floats(pa, pb, status);
 
     return float16_round_pack_canonical(pr, status);
 }
@@ -1828,9 +1854,11 @@ float16 float16_div(float16 a, float16 b, float_status *status)
 static float32 QEMU_SOFTFLOAT_ATTR
 soft_f32_div(float32 a, float32 b, float_status *status)
 {
-    FloatParts64 pa = float32_unpack_canonical(a, status);
-    FloatParts64 pb = float32_unpack_canonical(b, status);
-    FloatParts64 pr = div_floats(pa, pb, status);
+    FloatParts64 pa, pb, pr;
+
+    float32_unpack_canonical(&pa, a, status);
+    float32_unpack_canonical(&pb, b, status);
+    pr = div_floats(pa, pb, status);
 
     return float32_round_pack_canonical(pr, status);
 }
@@ -1838,9 +1866,11 @@ soft_f32_div(float32 a, float32 b, float_status *status)
 static float64 QEMU_SOFTFLOAT_ATTR
 soft_f64_div(float64 a, float64 b, float_status *status)
 {
-    FloatParts64 pa = float64_unpack_canonical(a, status);
-    FloatParts64 pb = float64_unpack_canonical(b, status);
-    FloatParts64 pr = div_floats(pa, pb, status);
+    FloatParts64 pa, pb, pr;
+
+    float64_unpack_canonical(&pa, a, status);
+    float64_unpack_canonical(&pb, b, status);
+    pr = div_floats(pa, pb, status);
 
     return float64_round_pack_canonical(pr, status);
 }
@@ -1910,9 +1940,11 @@ float64_div(float64 a, float64 b, float_status *s)
 
 bfloat16 bfloat16_div(bfloat16 a, bfloat16 b, float_status *status)
 {
-    FloatParts64 pa = bfloat16_unpack_canonical(a, status);
-    FloatParts64 pb = bfloat16_unpack_canonical(b, status);
-    FloatParts64 pr = div_floats(pa, pb, status);
+    FloatParts64 pa, pb, pr;
+
+    bfloat16_unpack_canonical(&pa, a, status);
+    bfloat16_unpack_canonical(&pb, b, status);
+    pr = div_floats(pa, pb, status);
 
     return bfloat16_round_pack_canonical(pr, status);
 }
@@ -1966,32 +1998,40 @@ static FloatParts64 float_to_float(FloatParts64 a, const FloatFmt *dstf,
 float32 float16_to_float32(float16 a, bool ieee, float_status *s)
 {
     const FloatFmt *fmt16 = ieee ? &float16_params : &float16_params_ahp;
-    FloatParts64 p = float16a_unpack_canonical(a, s, fmt16);
-    FloatParts64 pr = float_to_float(p, &float32_params, s);
+    FloatParts64 pa, pr;
+
+    float16a_unpack_canonical(&pa, a, s, fmt16);
+    pr = float_to_float(pa, &float32_params, s);
     return float32_round_pack_canonical(pr, s);
 }
 
 float64 float16_to_float64(float16 a, bool ieee, float_status *s)
 {
     const FloatFmt *fmt16 = ieee ? &float16_params : &float16_params_ahp;
-    FloatParts64 p = float16a_unpack_canonical(a, s, fmt16);
-    FloatParts64 pr = float_to_float(p, &float64_params, s);
+    FloatParts64 pa, pr;
+
+    float16a_unpack_canonical(&pa, a, s, fmt16);
+    pr = float_to_float(pa, &float64_params, s);
     return float64_round_pack_canonical(pr, s);
 }
 
 float16 float32_to_float16(float32 a, bool ieee, float_status *s)
 {
     const FloatFmt *fmt16 = ieee ? &float16_params : &float16_params_ahp;
-    FloatParts64 p = float32_unpack_canonical(a, s);
-    FloatParts64 pr = float_to_float(p, fmt16, s);
+    FloatParts64 pa, pr;
+
+    float32_unpack_canonical(&pa, a, s);
+    pr = float_to_float(pa, fmt16, s);
     return float16a_round_pack_canonical(pr, s, fmt16);
 }
 
 static float64 QEMU_SOFTFLOAT_ATTR
 soft_float32_to_float64(float32 a, float_status *s)
 {
-    FloatParts64 p = float32_unpack_canonical(a, s);
-    FloatParts64 pr = float_to_float(p, &float64_params, s);
+    FloatParts64 pa, pr;
+
+    float32_unpack_canonical(&pa, a, s);
+    pr = float_to_float(pa, &float64_params, s);
     return float64_round_pack_canonical(pr, s);
 }
 
@@ -2014,43 +2054,55 @@ float64 float32_to_float64(float32 a, float_status *s)
 float16 float64_to_float16(float64 a, bool ieee, float_status *s)
 {
     const FloatFmt *fmt16 = ieee ? &float16_params : &float16_params_ahp;
-    FloatParts64 p = float64_unpack_canonical(a, s);
-    FloatParts64 pr = float_to_float(p, fmt16, s);
+    FloatParts64 pa, pr;
+
+    float64_unpack_canonical(&pa, a, s);
+    pr = float_to_float(pa, fmt16, s);
     return float16a_round_pack_canonical(pr, s, fmt16);
 }
 
 float32 float64_to_float32(float64 a, float_status *s)
 {
-    FloatParts64 p = float64_unpack_canonical(a, s);
-    FloatParts64 pr = float_to_float(p, &float32_params, s);
+    FloatParts64 pa, pr;
+
+    float64_unpack_canonical(&pa, a, s);
+    pr = float_to_float(pa, &float32_params, s);
     return float32_round_pack_canonical(pr, s);
 }
 
 float32 bfloat16_to_float32(bfloat16 a, float_status *s)
 {
-    FloatParts64 p = bfloat16_unpack_canonical(a, s);
-    FloatParts64 pr = float_to_float(p, &float32_params, s);
+    FloatParts64 pa, pr;
+
+    bfloat16_unpack_canonical(&pa, a, s);
+    pr = float_to_float(pa, &float32_params, s);
     return float32_round_pack_canonical(pr, s);
 }
 
 float64 bfloat16_to_float64(bfloat16 a, float_status *s)
 {
-    FloatParts64 p = bfloat16_unpack_canonical(a, s);
-    FloatParts64 pr = float_to_float(p, &float64_params, s);
+    FloatParts64 pa, pr;
+
+    bfloat16_unpack_canonical(&pa, a, s);
+    pr = float_to_float(pa, &float64_params, s);
     return float64_round_pack_canonical(pr, s);
 }
 
 bfloat16 float32_to_bfloat16(float32 a, float_status *s)
 {
-    FloatParts64 p = float32_unpack_canonical(a, s);
-    FloatParts64 pr = float_to_float(p, &bfloat16_params, s);
+    FloatParts64 pa, pr;
+
+    float32_unpack_canonical(&pa, a, s);
+    pr = float_to_float(pa, &bfloat16_params, s);
     return bfloat16_round_pack_canonical(pr, s);
 }
 
 bfloat16 float64_to_bfloat16(float64 a, float_status *s)
 {
-    FloatParts64 p = float64_unpack_canonical(a, s);
-    FloatParts64 pr = float_to_float(p, &bfloat16_params, s);
+    FloatParts64 pa, pr;
+
+    float64_unpack_canonical(&pa, a, s);
+    pr = float_to_float(pa, &bfloat16_params, s);
     return bfloat16_round_pack_canonical(pr, s);
 }
 
@@ -2164,22 +2216,28 @@ static FloatParts64 round_to_int(FloatParts64 a, FloatRoundMode rmode,
 
 float16 float16_round_to_int(float16 a, float_status *s)
 {
-    FloatParts64 pa = float16_unpack_canonical(a, s);
-    FloatParts64 pr = round_to_int(pa, s->float_rounding_mode, 0, s);
+    FloatParts64 pa, pr;
+
+    float16_unpack_canonical(&pa, a, s);
+    pr = round_to_int(pa, s->float_rounding_mode, 0, s);
     return float16_round_pack_canonical(pr, s);
 }
 
 float32 float32_round_to_int(float32 a, float_status *s)
 {
-    FloatParts64 pa = float32_unpack_canonical(a, s);
-    FloatParts64 pr = round_to_int(pa, s->float_rounding_mode, 0, s);
+    FloatParts64 pa, pr;
+
+    float32_unpack_canonical(&pa, a, s);
+    pr = round_to_int(pa, s->float_rounding_mode, 0, s);
     return float32_round_pack_canonical(pr, s);
 }
 
 float64 float64_round_to_int(float64 a, float_status *s)
 {
-    FloatParts64 pa = float64_unpack_canonical(a, s);
-    FloatParts64 pr = round_to_int(pa, s->float_rounding_mode, 0, s);
+    FloatParts64 pa, pr;
+
+    float64_unpack_canonical(&pa, a, s);
+    pr = round_to_int(pa, s->float_rounding_mode, 0, s);
     return float64_round_pack_canonical(pr, s);
 }
 
@@ -2190,8 +2248,10 @@ float64 float64_round_to_int(float64 a, float_status *s)
 
 bfloat16 bfloat16_round_to_int(bfloat16 a, float_status *s)
 {
-    FloatParts64 pa = bfloat16_unpack_canonical(a, s);
-    FloatParts64 pr = round_to_int(pa, s->float_rounding_mode, 0, s);
+    FloatParts64 pa, pr;
+
+    bfloat16_unpack_canonical(&pa, a, s);
+    pr = round_to_int(pa, s->float_rounding_mode, 0, s);
     return bfloat16_round_pack_canonical(pr, s);
 }
 
@@ -2253,71 +2313,91 @@ static int64_t round_to_int_and_pack(FloatParts64 in, FloatRoundMode rmode,
 int8_t float16_to_int8_scalbn(float16 a, FloatRoundMode rmode, int scale,
                               float_status *s)
 {
-    return round_to_int_and_pack(float16_unpack_canonical(a, s),
-                                 rmode, scale, INT8_MIN, INT8_MAX, s);
+    FloatParts64 p;
+
+    float16_unpack_canonical(&p, a, s);
+    return round_to_int_and_pack(p, rmode, scale, INT8_MIN, INT8_MAX, s);
 }
 
 int16_t float16_to_int16_scalbn(float16 a, FloatRoundMode rmode, int scale,
                                 float_status *s)
 {
-    return round_to_int_and_pack(float16_unpack_canonical(a, s),
-                                 rmode, scale, INT16_MIN, INT16_MAX, s);
+    FloatParts64 p;
+
+    float16_unpack_canonical(&p, a, s);
+    return round_to_int_and_pack(p, rmode, scale, INT16_MIN, INT16_MAX, s);
 }
 
 int32_t float16_to_int32_scalbn(float16 a, FloatRoundMode rmode, int scale,
                                 float_status *s)
 {
-    return round_to_int_and_pack(float16_unpack_canonical(a, s),
-                                 rmode, scale, INT32_MIN, INT32_MAX, s);
+    FloatParts64 p;
+
+    float16_unpack_canonical(&p, a, s);
+    return round_to_int_and_pack(p, rmode, scale, INT32_MIN, INT32_MAX, s);
 }
 
 int64_t float16_to_int64_scalbn(float16 a, FloatRoundMode rmode, int scale,
                                 float_status *s)
 {
-    return round_to_int_and_pack(float16_unpack_canonical(a, s),
-                                 rmode, scale, INT64_MIN, INT64_MAX, s);
+    FloatParts64 p;
+
+    float16_unpack_canonical(&p, a, s);
+    return round_to_int_and_pack(p, rmode, scale, INT64_MIN, INT64_MAX, s);
 }
 
 int16_t float32_to_int16_scalbn(float32 a, FloatRoundMode rmode, int scale,
                                 float_status *s)
 {
-    return round_to_int_and_pack(float32_unpack_canonical(a, s),
-                                 rmode, scale, INT16_MIN, INT16_MAX, s);
+    FloatParts64 p;
+
+    float32_unpack_canonical(&p, a, s);
+    return round_to_int_and_pack(p, rmode, scale, INT16_MIN, INT16_MAX, s);
 }
 
 int32_t float32_to_int32_scalbn(float32 a, FloatRoundMode rmode, int scale,
                                 float_status *s)
 {
-    return round_to_int_and_pack(float32_unpack_canonical(a, s),
-                                 rmode, scale, INT32_MIN, INT32_MAX, s);
+    FloatParts64 p;
+
+    float32_unpack_canonical(&p, a, s);
+    return round_to_int_and_pack(p, rmode, scale, INT32_MIN, INT32_MAX, s);
 }
 
 int64_t float32_to_int64_scalbn(float32 a, FloatRoundMode rmode, int scale,
                                 float_status *s)
 {
-    return round_to_int_and_pack(float32_unpack_canonical(a, s),
-                                 rmode, scale, INT64_MIN, INT64_MAX, s);
+    FloatParts64 p;
+
+    float32_unpack_canonical(&p, a, s);
+    return round_to_int_and_pack(p, rmode, scale, INT64_MIN, INT64_MAX, s);
 }
 
 int16_t float64_to_int16_scalbn(float64 a, FloatRoundMode rmode, int scale,
                                 float_status *s)
 {
-    return round_to_int_and_pack(float64_unpack_canonical(a, s),
-                                 rmode, scale, INT16_MIN, INT16_MAX, s);
+    FloatParts64 p;
+
+    float64_unpack_canonical(&p, a, s);
+    return round_to_int_and_pack(p, rmode, scale, INT16_MIN, INT16_MAX, s);
 }
 
 int32_t float64_to_int32_scalbn(float64 a, FloatRoundMode rmode, int scale,
                                 float_status *s)
 {
-    return round_to_int_and_pack(float64_unpack_canonical(a, s),
-                                 rmode, scale, INT32_MIN, INT32_MAX, s);
+    FloatParts64 p;
+
+    float64_unpack_canonical(&p, a, s);
+    return round_to_int_and_pack(p, rmode, scale, INT32_MIN, INT32_MAX, s);
 }
 
 int64_t float64_to_int64_scalbn(float64 a, FloatRoundMode rmode, int scale,
                                 float_status *s)
 {
-    return round_to_int_and_pack(float64_unpack_canonical(a, s),
-                                 rmode, scale, INT64_MIN, INT64_MAX, s);
+    FloatParts64 p;
+
+    float64_unpack_canonical(&p, a, s);
+    return round_to_int_and_pack(p, rmode, scale, INT64_MIN, INT64_MAX, s);
 }
 
 int8_t float16_to_int8(float16 a, float_status *s)
@@ -2423,22 +2503,28 @@ int64_t float64_to_int64_round_to_zero(float64 a, float_status *s)
 int16_t bfloat16_to_int16_scalbn(bfloat16 a, FloatRoundMode rmode, int scale,
                                  float_status *s)
 {
-    return round_to_int_and_pack(bfloat16_unpack_canonical(a, s),
-                                 rmode, scale, INT16_MIN, INT16_MAX, s);
+    FloatParts64 p;
+
+    bfloat16_unpack_canonical(&p, a, s);
+    return round_to_int_and_pack(p, rmode, scale, INT16_MIN, INT16_MAX, s);
 }
 
 int32_t bfloat16_to_int32_scalbn(bfloat16 a, FloatRoundMode rmode, int scale,
                                  float_status *s)
 {
-    return round_to_int_and_pack(bfloat16_unpack_canonical(a, s),
-                                 rmode, scale, INT32_MIN, INT32_MAX, s);
+    FloatParts64 p;
+
+    bfloat16_unpack_canonical(&p, a, s);
+    return round_to_int_and_pack(p, rmode, scale, INT32_MIN, INT32_MAX, s);
 }
 
 int64_t bfloat16_to_int64_scalbn(bfloat16 a, FloatRoundMode rmode, int scale,
                                  float_status *s)
 {
-    return round_to_int_and_pack(bfloat16_unpack_canonical(a, s),
-                                 rmode, scale, INT64_MIN, INT64_MAX, s);
+    FloatParts64 p;
+
+    bfloat16_unpack_canonical(&p, a, s);
+    return round_to_int_and_pack(p, rmode, scale, INT64_MIN, INT64_MAX, s);
 }
 
 int16_t bfloat16_to_int16(bfloat16 a, float_status *s)
@@ -2532,71 +2618,91 @@ static uint64_t round_to_uint_and_pack(FloatParts64 in, FloatRoundMode rmode,
 uint8_t float16_to_uint8_scalbn(float16 a, FloatRoundMode rmode, int scale,
                                 float_status *s)
 {
-    return round_to_uint_and_pack(float16_unpack_canonical(a, s),
-                                  rmode, scale, UINT8_MAX, s);
+    FloatParts64 p;
+
+    float16_unpack_canonical(&p, a, s);
+    return round_to_uint_and_pack(p, rmode, scale, UINT8_MAX, s);
 }
 
 uint16_t float16_to_uint16_scalbn(float16 a, FloatRoundMode rmode, int scale,
                                   float_status *s)
 {
-    return round_to_uint_and_pack(float16_unpack_canonical(a, s),
-                                  rmode, scale, UINT16_MAX, s);
+    FloatParts64 p;
+
+    float16_unpack_canonical(&p, a, s);
+    return round_to_uint_and_pack(p, rmode, scale, UINT16_MAX, s);
 }
 
 uint32_t float16_to_uint32_scalbn(float16 a, FloatRoundMode rmode, int scale,
                                   float_status *s)
 {
-    return round_to_uint_and_pack(float16_unpack_canonical(a, s),
-                                  rmode, scale, UINT32_MAX, s);
+    FloatParts64 p;
+
+    float16_unpack_canonical(&p, a, s);
+    return round_to_uint_and_pack(p, rmode, scale, UINT32_MAX, s);
 }
 
 uint64_t float16_to_uint64_scalbn(float16 a, FloatRoundMode rmode, int scale,
                                   float_status *s)
 {
-    return round_to_uint_and_pack(float16_unpack_canonical(a, s),
-                                  rmode, scale, UINT64_MAX, s);
+    FloatParts64 p;
+
+    float16_unpack_canonical(&p, a, s);
+    return round_to_uint_and_pack(p, rmode, scale, UINT64_MAX, s);
 }
 
 uint16_t float32_to_uint16_scalbn(float32 a, FloatRoundMode rmode, int scale,
                                   float_status *s)
 {
-    return round_to_uint_and_pack(float32_unpack_canonical(a, s),
-                                  rmode, scale, UINT16_MAX, s);
+    FloatParts64 p;
+
+    float32_unpack_canonical(&p, a, s);
+    return round_to_uint_and_pack(p, rmode, scale, UINT16_MAX, s);
 }
 
 uint32_t float32_to_uint32_scalbn(float32 a, FloatRoundMode rmode, int scale,
                                   float_status *s)
 {
-    return round_to_uint_and_pack(float32_unpack_canonical(a, s),
-                                  rmode, scale, UINT32_MAX, s);
+    FloatParts64 p;
+
+    float32_unpack_canonical(&p, a, s);
+    return round_to_uint_and_pack(p, rmode, scale, UINT32_MAX, s);
 }
 
 uint64_t float32_to_uint64_scalbn(float32 a, FloatRoundMode rmode, int scale,
                                   float_status *s)
 {
-    return round_to_uint_and_pack(float32_unpack_canonical(a, s),
-                                  rmode, scale, UINT64_MAX, s);
+    FloatParts64 p;
+
+    float32_unpack_canonical(&p, a, s);
+    return round_to_uint_and_pack(p, rmode, scale, UINT64_MAX, s);
 }
 
 uint16_t float64_to_uint16_scalbn(float64 a, FloatRoundMode rmode, int scale,
                                   float_status *s)
 {
-    return round_to_uint_and_pack(float64_unpack_canonical(a, s),
-                                  rmode, scale, UINT16_MAX, s);
+    FloatParts64 p;
+
+    float64_unpack_canonical(&p, a, s);
+    return round_to_uint_and_pack(p, rmode, scale, UINT16_MAX, s);
 }
 
 uint32_t float64_to_uint32_scalbn(float64 a, FloatRoundMode rmode, int scale,
                                   float_status *s)
 {
-    return round_to_uint_and_pack(float64_unpack_canonical(a, s),
-                                  rmode, scale, UINT32_MAX, s);
+    FloatParts64 p;
+
+    float64_unpack_canonical(&p, a, s);
+    return round_to_uint_and_pack(p, rmode, scale, UINT32_MAX, s);
 }
 
 uint64_t float64_to_uint64_scalbn(float64 a, FloatRoundMode rmode, int scale,
                                   float_status *s)
 {
-    return round_to_uint_and_pack(float64_unpack_canonical(a, s),
-                                  rmode, scale, UINT64_MAX, s);
+    FloatParts64 p;
+
+    float64_unpack_canonical(&p, a, s);
+    return round_to_uint_and_pack(p, rmode, scale, UINT64_MAX, s);
 }
 
 uint8_t float16_to_uint8(float16 a, float_status *s)
@@ -2702,22 +2808,28 @@ uint64_t float64_to_uint64_round_to_zero(float64 a, float_status *s)
 uint16_t bfloat16_to_uint16_scalbn(bfloat16 a, FloatRoundMode rmode,
                                    int scale, float_status *s)
 {
-    return round_to_uint_and_pack(bfloat16_unpack_canonical(a, s),
-                                  rmode, scale, UINT16_MAX, s);
+    FloatParts64 p;
+
+    bfloat16_unpack_canonical(&p, a, s);
+    return round_to_uint_and_pack(p, rmode, scale, UINT16_MAX, s);
 }
 
 uint32_t bfloat16_to_uint32_scalbn(bfloat16 a, FloatRoundMode rmode,
                                    int scale, float_status *s)
 {
-    return round_to_uint_and_pack(bfloat16_unpack_canonical(a, s),
-                                  rmode, scale, UINT32_MAX, s);
+    FloatParts64 p;
+
+    bfloat16_unpack_canonical(&p, a, s);
+    return round_to_uint_and_pack(p, rmode, scale, UINT32_MAX, s);
 }
 
 uint64_t bfloat16_to_uint64_scalbn(bfloat16 a, FloatRoundMode rmode,
                                    int scale, float_status *s)
 {
-    return round_to_uint_and_pack(bfloat16_unpack_canonical(a, s),
-                                  rmode, scale, UINT64_MAX, s);
+    FloatParts64 p;
+
+    bfloat16_unpack_canonical(&p, a, s);
+    return round_to_uint_and_pack(p, rmode, scale, UINT64_MAX, s);
 }
 
 uint16_t bfloat16_to_uint16(bfloat16 a, float_status *s)
@@ -3168,10 +3280,10 @@ static FloatParts64 minmax_floats(FloatParts64 a, FloatParts64 b, bool ismin,
 float ## sz float ## sz ## _ ## name(float ## sz a, float ## sz b,      \
                                      float_status *s)                   \
 {                                                                       \
-    FloatParts64 pa = float ## sz ## _unpack_canonical(a, s);             \
-    FloatParts64 pb = float ## sz ## _unpack_canonical(b, s);             \
-    FloatParts64 pr = minmax_floats(pa, pb, ismin, isiee, ismag, s);      \
-                                                                        \
+    FloatParts64 pa, pb, pr;                                            \
+    float ## sz ## _unpack_canonical(&pa, a, s);                        \
+    float ## sz ## _unpack_canonical(&pb, b, s);                        \
+    pr = minmax_floats(pa, pb, ismin, isiee, ismag, s);                 \
     return float ## sz ## _round_pack_canonical(pr, s);                 \
 }
 
@@ -3201,10 +3313,10 @@ MINMAX(64, maxnummag, false, true, true)
 #define BF16_MINMAX(name, ismin, isiee, ismag)                          \
 bfloat16 bfloat16_ ## name(bfloat16 a, bfloat16 b, float_status *s)     \
 {                                                                       \
-    FloatParts64 pa = bfloat16_unpack_canonical(a, s);                    \
-    FloatParts64 pb = bfloat16_unpack_canonical(b, s);                    \
-    FloatParts64 pr = minmax_floats(pa, pb, ismin, isiee, ismag, s);      \
-                                                                        \
+    FloatParts64 pa, pb, pr;                                            \
+    bfloat16_unpack_canonical(&pa, a, s);                               \
+    bfloat16_unpack_canonical(&pb, b, s);                               \
+    pr = minmax_floats(pa, pb, ismin, isiee, ismag, s);                 \
     return bfloat16_round_pack_canonical(pr, s);                        \
 }
 
@@ -3279,8 +3391,9 @@ static FloatRelation compare_floats(FloatParts64 a, FloatParts64 b, bool is_quie
 static int attr                                                         \
 name(float ## sz a, float ## sz b, bool is_quiet, float_status *s)      \
 {                                                                       \
-    FloatParts64 pa = float ## sz ## _unpack_canonical(a, s);             \
-    FloatParts64 pb = float ## sz ## _unpack_canonical(b, s);             \
+    FloatParts64 pa, pb;                                                \
+    float ## sz ## _unpack_canonical(&pa, a, s);                        \
+    float ## sz ## _unpack_canonical(&pb, b, s);                        \
     return compare_floats(pa, pb, is_quiet, s);                         \
 }
 
@@ -3381,8 +3494,10 @@ FloatRelation float64_compare_quiet(float64 a, float64 b, float_status *s)
 static FloatRelation QEMU_FLATTEN
 soft_bf16_compare(bfloat16 a, bfloat16 b, bool is_quiet, float_status *s)
 {
-    FloatParts64 pa = bfloat16_unpack_canonical(a, s);
-    FloatParts64 pb = bfloat16_unpack_canonical(b, s);
+    FloatParts64 pa, pb;
+
+    bfloat16_unpack_canonical(&pa, a, s);
+    bfloat16_unpack_canonical(&pb, b, s);
     return compare_floats(pa, pb, is_quiet, s);
 }
 
@@ -3416,29 +3531,37 @@ static FloatParts64 scalbn_decomposed(FloatParts64 a, int n, float_status *s)
 
 float16 float16_scalbn(float16 a, int n, float_status *status)
 {
-    FloatParts64 pa = float16_unpack_canonical(a, status);
-    FloatParts64 pr = scalbn_decomposed(pa, n, status);
+    FloatParts64 pa, pr;
+
+    float16_unpack_canonical(&pa, a, status);
+    pr = scalbn_decomposed(pa, n, status);
     return float16_round_pack_canonical(pr, status);
 }
 
 float32 float32_scalbn(float32 a, int n, float_status *status)
 {
-    FloatParts64 pa = float32_unpack_canonical(a, status);
-    FloatParts64 pr = scalbn_decomposed(pa, n, status);
+    FloatParts64 pa, pr;
+
+    float32_unpack_canonical(&pa, a, status);
+    pr = scalbn_decomposed(pa, n, status);
     return float32_round_pack_canonical(pr, status);
 }
 
 float64 float64_scalbn(float64 a, int n, float_status *status)
 {
-    FloatParts64 pa = float64_unpack_canonical(a, status);
-    FloatParts64 pr = scalbn_decomposed(pa, n, status);
+    FloatParts64 pa, pr;
+
+    float64_unpack_canonical(&pa, a, status);
+    pr = scalbn_decomposed(pa, n, status);
     return float64_round_pack_canonical(pr, status);
 }
 
 bfloat16 bfloat16_scalbn(bfloat16 a, int n, float_status *status)
 {
-    FloatParts64 pa = bfloat16_unpack_canonical(a, status);
-    FloatParts64 pr = scalbn_decomposed(pa, n, status);
+    FloatParts64 pa, pr;
+
+    bfloat16_unpack_canonical(&pa, a, status);
+    pr = scalbn_decomposed(pa, n, status);
     return bfloat16_round_pack_canonical(pr, status);
 }
 
@@ -3515,24 +3638,30 @@ static FloatParts64 sqrt_float(FloatParts64 a, float_status *s, const FloatFmt *
 
 float16 QEMU_FLATTEN float16_sqrt(float16 a, float_status *status)
 {
-    FloatParts64 pa = float16_unpack_canonical(a, status);
-    FloatParts64 pr = sqrt_float(pa, status, &float16_params);
+    FloatParts64 pa, pr;
+
+    float16_unpack_canonical(&pa, a, status);
+    pr = sqrt_float(pa, status, &float16_params);
     return float16_round_pack_canonical(pr, status);
 }
 
 static float32 QEMU_SOFTFLOAT_ATTR
 soft_f32_sqrt(float32 a, float_status *status)
 {
-    FloatParts64 pa = float32_unpack_canonical(a, status);
-    FloatParts64 pr = sqrt_float(pa, status, &float32_params);
+    FloatParts64 pa, pr;
+
+    float32_unpack_canonical(&pa, a, status);
+    pr = sqrt_float(pa, status, &float32_params);
     return float32_round_pack_canonical(pr, status);
 }
 
 static float64 QEMU_SOFTFLOAT_ATTR
 soft_f64_sqrt(float64 a, float_status *status)
 {
-    FloatParts64 pa = float64_unpack_canonical(a, status);
-    FloatParts64 pr = sqrt_float(pa, status, &float64_params);
+    FloatParts64 pa, pr;
+
+    float64_unpack_canonical(&pa, a, status);
+    pr = sqrt_float(pa, status, &float64_params);
     return float64_round_pack_canonical(pr, status);
 }
 
@@ -3592,8 +3721,10 @@ float64 QEMU_FLATTEN float64_sqrt(float64 xa, float_status *s)
 
 bfloat16 QEMU_FLATTEN bfloat16_sqrt(bfloat16 a, float_status *status)
 {
-    FloatParts64 pa = bfloat16_unpack_canonical(a, status);
-    FloatParts64 pr = sqrt_float(pa, status, &bfloat16_params);
+    FloatParts64 pa, pr;
+
+    bfloat16_unpack_canonical(&pa, a, status);
+    pr = sqrt_float(pa, status, &bfloat16_params);
     return bfloat16_round_pack_canonical(pr, status);
 }
 
-- 
2.25.1


