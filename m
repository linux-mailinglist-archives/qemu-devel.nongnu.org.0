Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D156B376E42
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 03:54:50 +0200 (CEST)
Received: from localhost ([::1]:59084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCB7-0006OW-SR
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 21:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC50-0004DZ-Ch
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:30 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:37540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4o-0003cp-PK
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:30 -0400
Received: by mail-pf1-x42f.google.com with SMTP id b15so9152549pfl.4
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=klq5tF3eUBw1b5IWfv55EAVbPnpG6rjwX1EUfobNPG4=;
 b=i7+FYbFJMuMbv0ziZxqpsGiVZn6ZcKiHKvHBRzZGGnUSLqyYmdH8dwGTJQr5/7eRei
 C9ZFSylbeGgmUQqUVZpKiZgD0ns8DNP5blGbqUReofGtkv3qOZ9Q9z8Dw7X0rZOcJuRy
 zS+gokkR6QfqOuKYZz+rfT1sGMptuKMYJg+H5YEcQOkyQ1YECBztyRrEiPWZtNz+XoYv
 pxMFpxRmC7vv/+C5zSQO/SXjyWER9twYVOjmeaHvIxJco5v91KcUoEkYSbpNBMGulZPQ
 WJaWHsBIB+BGfSIuhcMJG9Q3Hz92SHqPGlGx+DFtrQy5X23J85THjotpLTxTEhOX18wK
 2Ciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=klq5tF3eUBw1b5IWfv55EAVbPnpG6rjwX1EUfobNPG4=;
 b=teYQ3+0wTx8jglBJOmiqm/aoqQsPF00CNZiD7hnGYbK8BnIOwwWmMTjwlgS9k04i7d
 11Wd6GscSSmPhZ+YJ4iKWVFRU+bGrwj9mGKAanVBwhL/zhE1DTkxyKqqfNlkNUSbem6i
 MS8qYq1UXIYRSvyESD6rJ2DzxeCzuZHWwdcsja1g7/tMBNIguulHzqvHuQBmYC/0oVbj
 TxtcTAMCh8ow6yt8cibMkipOx/RwS1DyEV5bXfZJizl4aYJgNFJ7jX5sYrlAJd4hGXKo
 UUyf7ADYSwd+fBxFr0zkbny1Jon2rSx12BjYkm+4xO9KaX7xztErjIsjUPMe93FUGCw3
 MXsw==
X-Gm-Message-State: AOAM531z8KPMD+kDNrhG5oJoRG2uoSpxJ1qJ0Y/slwyxEUwA/Mt9/CMN
 L6w6h9K4r12yJ9Y/epmAuHreZD8hCbCd/Q==
X-Google-Smtp-Source: ABdhPJxf9byzv0Ga2fuS+KMDNBSIpQ/IeCMOxzeHbOb3/SSd5yzzjf9LNWF0HSvCSqtAwN6Uwxlv+g==
X-Received: by 2002:a63:4512:: with SMTP id s18mr13227249pga.275.1620438497274; 
 Fri, 07 May 2021 18:48:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/72] softfloat: Use pointers with ftype_pack_raw
Date: Fri,  7 May 2021 18:47:11 -0700
Message-Id: <20210508014802.892561-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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


