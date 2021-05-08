Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DEA376E5B
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:04:23 +0200 (CEST)
Received: from localhost ([::1]:53450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCKM-0004xL-7M
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4t-0004CB-2u
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:25 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:47034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4l-0003b3-Ga
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:22 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 fa21-20020a17090af0d5b0290157eb6b590fso6550635pjb.5
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xqvkg+W3wH0GkWZg6UWOmCKSDuII9kx3s2LTFE/X5bg=;
 b=rFmQJRP7tJjCtQZTYUUCResa8Vhu5cvHiw6TDa3YD/bjjqSuXmvMWuYZHZ/RENZjjy
 cvq4XaNhVhyMyWTjk9B1WkhKfPX5pbwp7ZuNa5pdKL10+kD1jZn0sCCeR8X+IKzURTyn
 pMTffdHFJf6TfiX19JPBY7+VQSPtVzDrXRQ/PjR24Z3WW9CVu+zAio3DN1dIZfAWd0Vo
 zk7DmHm3p2PgP2ZZTcg+Rz4P2mIVyjHu+lZPB4URX5gevMnbYBoZNbp8lvJbfuqVrpfI
 4QkzfX9iDUyrPbr0skFA+obPcTwdysHiFktUMdQdN7aPlkYJI55Q/HjYLiFN6hOk87Ml
 X2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xqvkg+W3wH0GkWZg6UWOmCKSDuII9kx3s2LTFE/X5bg=;
 b=HZ1+mrrV5VOZuYE0hNGndonrfS47Tv62FHHEsDa+A1lG9CGB9Y172yQRbnQWaW8uf2
 +UinApCcWkxKxe2K88URN9+fGX2eVx40RsgJ+NImowf3x/mbcHrLq3F22rGnVrfSeEn7
 ysUoRm1UL5ImMinkmKCwIK1hb+W2/jTiZgwmdhDsoCdv9ytnxxHmpi3K9bNzdWQGbvNN
 vf2eSMUdNTi2vchePAnsngfECPuuL2X97nkGiRzc9Te3rCGvRnKcVNyZDX9MVVLkHFOY
 z4mPVYZIrOEM/EGA+tq0XAIyLpZMl0cGreHjmBxNtz/nztu5v6vmIZ7JlB3s6Ynppdbk
 pIGg==
X-Gm-Message-State: AOAM5317HzyzeYBwEpl8OUHl2sSVz9nUV+HmRKtPbl4xjQXb2M6Afl+1
 27d2anPEeDNiEAIEHZMF0K9q8Vp0AAw19g==
X-Google-Smtp-Source: ABdhPJzRSt8brr5y7LNscqMCnPc24/uiDKGUSuSPAW/Mc4SvCCvrOMhhE88smN9gaL0/DlxDDFl6ZQ==
X-Received: by 2002:a17:902:a58b:b029:ee:d13a:2642 with SMTP id
 az11-20020a170902a58bb02900eed13a2642mr13181176plb.35.1620438494215; 
 Fri, 07 May 2021 18:48:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/72] softfloat: Move type-specific pack/unpack routines
Date: Fri,  7 May 2021 18:47:06 -0700
Message-Id: <20210508014802.892561-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

In preparation from moving sf_canonicalize.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 109 +++++++++++++++++++++++++-----------------------
 1 file changed, 56 insertions(+), 53 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 27b51659c9..398a068b58 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -837,59 +837,6 @@ static FloatParts64 round_canonical(FloatParts64 p, float_status *s,
     return p;
 }
 
-/* Explicit FloatFmt version */
-static FloatParts64 float16a_unpack_canonical(float16 f, float_status *s,
-                                            const FloatFmt *params)
-{
-    return sf_canonicalize(float16_unpack_raw(f), params, s);
-}
-
-static FloatParts64 float16_unpack_canonical(float16 f, float_status *s)
-{
-    return float16a_unpack_canonical(f, s, &float16_params);
-}
-
-static FloatParts64 bfloat16_unpack_canonical(bfloat16 f, float_status *s)
-{
-    return sf_canonicalize(bfloat16_unpack_raw(f), &bfloat16_params, s);
-}
-
-static float16 float16a_round_pack_canonical(FloatParts64 p, float_status *s,
-                                             const FloatFmt *params)
-{
-    return float16_pack_raw(round_canonical(p, s, params));
-}
-
-static float16 float16_round_pack_canonical(FloatParts64 p, float_status *s)
-{
-    return float16a_round_pack_canonical(p, s, &float16_params);
-}
-
-static bfloat16 bfloat16_round_pack_canonical(FloatParts64 p, float_status *s)
-{
-    return bfloat16_pack_raw(round_canonical(p, s, &bfloat16_params));
-}
-
-static FloatParts64 float32_unpack_canonical(float32 f, float_status *s)
-{
-    return sf_canonicalize(float32_unpack_raw(f), &float32_params, s);
-}
-
-static float32 float32_round_pack_canonical(FloatParts64 p, float_status *s)
-{
-    return float32_pack_raw(round_canonical(p, s, &float32_params));
-}
-
-static FloatParts64 float64_unpack_canonical(float64 f, float_status *s)
-{
-    return sf_canonicalize(float64_unpack_raw(f), &float64_params, s);
-}
-
-static float64 float64_round_pack_canonical(FloatParts64 p, float_status *s)
-{
-    return float64_pack_raw(round_canonical(p, s, &float64_params));
-}
-
 static FloatParts64 return_nan(FloatParts64 a, float_status *s)
 {
     g_assert(is_nan(a.cls));
@@ -964,6 +911,62 @@ static FloatParts64 pick_nan_muladd(FloatParts64 a, FloatParts64 b, FloatParts64
     return a;
 }
 
+/*
+ * Pack/unpack routines with a specific FloatFmt.
+ */
+
+static FloatParts64 float16a_unpack_canonical(float16 f, float_status *s,
+                                            const FloatFmt *params)
+{
+    return sf_canonicalize(float16_unpack_raw(f), params, s);
+}
+
+static FloatParts64 float16_unpack_canonical(float16 f, float_status *s)
+{
+    return float16a_unpack_canonical(f, s, &float16_params);
+}
+
+static FloatParts64 bfloat16_unpack_canonical(bfloat16 f, float_status *s)
+{
+    return sf_canonicalize(bfloat16_unpack_raw(f), &bfloat16_params, s);
+}
+
+static float16 float16a_round_pack_canonical(FloatParts64 p, float_status *s,
+                                             const FloatFmt *params)
+{
+    return float16_pack_raw(round_canonical(p, s, params));
+}
+
+static float16 float16_round_pack_canonical(FloatParts64 p, float_status *s)
+{
+    return float16a_round_pack_canonical(p, s, &float16_params);
+}
+
+static bfloat16 bfloat16_round_pack_canonical(FloatParts64 p, float_status *s)
+{
+    return bfloat16_pack_raw(round_canonical(p, s, &bfloat16_params));
+}
+
+static FloatParts64 float32_unpack_canonical(float32 f, float_status *s)
+{
+    return sf_canonicalize(float32_unpack_raw(f), &float32_params, s);
+}
+
+static float32 float32_round_pack_canonical(FloatParts64 p, float_status *s)
+{
+    return float32_pack_raw(round_canonical(p, s, &float32_params));
+}
+
+static FloatParts64 float64_unpack_canonical(float64 f, float_status *s)
+{
+    return sf_canonicalize(float64_unpack_raw(f), &float64_params, s);
+}
+
+static float64 float64_round_pack_canonical(FloatParts64 p, float_status *s)
+{
+    return float64_pack_raw(round_canonical(p, s, &float64_params));
+}
+
 /*
  * Returns the result of adding or subtracting the values of the
  * floating-point values `a' and `b'. The operation is performed
-- 
2.25.1


