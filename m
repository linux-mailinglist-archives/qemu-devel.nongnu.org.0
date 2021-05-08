Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51060376E6B
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:13:05 +0200 (CEST)
Received: from localhost ([::1]:51316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCSm-0005ep-Ci
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC56-0004JQ-1d
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:36 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:35682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4s-0003dX-SS
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:35 -0400
Received: by mail-pf1-x42e.google.com with SMTP id i13so9253099pfu.2
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SKdfu6xWiwzxhHlapjrQcnT6V4WXORdkaCXE3ng4KsU=;
 b=xaWZXvI0Qb2y1e2in0lYZTgCfsK5fYUHg4r9c19C2tQdm1HW4snsqBNrjGf3TwziAL
 Q2rAk0KVpFStZtTp3uz2fR1CrwQA7Ci4tsHba4wGBrlGgiEbUZeoLPyJUPl0to8N93PJ
 9S4T4mexiByqUACurUMvx3f1k6lDsdfYZfmCZj4XAcq4Xl2as8yC7yrLPI5DwGxDSZOF
 mLsy29CW89s493IGmQCrOO+0ROAxviTBUL8Bcl8vaZ9yNP4XsMEvWsoCIvNbgYj2YBa6
 6UqsFgR/LWdmCs+ofySzDUM/+mhPgcQ/Jnx66mHSDM4f5xHuNMB9TXoh2DMa1HwAFVw7
 Dngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SKdfu6xWiwzxhHlapjrQcnT6V4WXORdkaCXE3ng4KsU=;
 b=YhviwqpN+ICHYDuGpIUomUBaRR8odIM3ZbWusZ4Fc2mDaE+e544j0UV7hwRFB95K4c
 PeJbIjnkl+g+jaf/n94wxM3iBhUludmRPW6TI6piwY2uk++ztdhjq43614DceraGi5K3
 3QTZw7U671dBNHB+9Zm/pKzJYZwRFkZBGrlahFFrVogMRlcblnBOI/kMHS5oF4FSVUbC
 p8smIuc91vNRBLpeM675B6R7Xt8AN5U9aVVyTfbeFN+nyU4JoElIlbGvD3erHz7Ra0Ku
 r5IvRNIt8FzMxHxXWCYHTDmtpScpAYWnGp7k6DlXzAm09UnD5IwENX201kdjL8wfIvWn
 KEHg==
X-Gm-Message-State: AOAM531mpBe86Wr6XPZOoW/NzQIdH/nCosqnbF+ph4h7RSvB2fOPOcty
 byw8W7lZIt4NxDA88fZNowOZVXoOkkHw8w==
X-Google-Smtp-Source: ABdhPJwxV9o1PFfntaZLqDHKSFTh0xXnLZ4wp17KYrL37zV0fnduUnL+FkGEli2soaAimO7KnO0ByQ==
X-Received: by 2002:a62:84d2:0:b029:27c:bbd5:6c0d with SMTP id
 k201-20020a6284d20000b029027cbbd56c0dmr13109766pfd.32.1620438501357; 
 Fri, 07 May 2021 18:48:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/72] softfloat: Convert float128_default_nan to parts
Date: Fri,  7 May 2021 18:47:17 -0700
Message-Id: <20210508014802.892561-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
 fpu/softfloat.c                | 17 ++++-------------
 fpu/softfloat-specialize.c.inc | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 073b80d502..6d5392aeab 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -705,7 +705,7 @@ static float128 float128_pack_raw(const FloatParts128 *p)
 #define PARTS_GENERIC_64_128(NAME, P) \
     QEMU_GENERIC(P, (FloatParts128 *, parts128_##NAME), parts64_##NAME)
 
-#define parts_default_nan  parts64_default_nan
+#define parts_default_nan(P, S)    PARTS_GENERIC_64_128(default_nan, P)(P, S)
 #define parts_silence_nan(P, S)    PARTS_GENERIC_64_128(silence_nan, P)(P, S)
 
 
@@ -3836,20 +3836,11 @@ float64 float64_default_nan(float_status *status)
 
 float128 float128_default_nan(float_status *status)
 {
-    FloatParts64 p;
-    float128 r;
+    FloatParts128 p;
 
     parts_default_nan(&p, status);
-    /* Extrapolate from the choices made by parts_default_nan to fill
-     * in the quad-floating format.  If the low bit is set, assume we
-     * want to set all non-snan bits.
-     */
-    r.low = -(p.frac & 1);
-    r.high = p.frac >> (DECOMPOSED_BINARY_POINT - 48);
-    r.high |= UINT64_C(0x7FFF000000000000);
-    r.high |= (uint64_t)p.sign << 63;
-
-    return r;
+    frac_shr(&p, float128_params.frac_shift);
+    return float128_pack_raw(&p);
 }
 
 bfloat16 bfloat16_default_nan(float_status *status)
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index d892016f0f..a0cf016b4f 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -172,6 +172,25 @@ static void parts64_default_nan(FloatParts64 *p, float_status *status)
     };
 }
 
+static void parts128_default_nan(FloatParts128 *p, float_status *status)
+{
+    /*
+     * Extrapolate from the choices made by parts64_default_nan to fill
+     * in the quad-floating format.  If the low bit is set, assume we
+     * want to set all non-snan bits.
+     */
+    FloatParts64 p64;
+    parts64_default_nan(&p64, status);
+
+    *p = (FloatParts128) {
+        .cls = float_class_qnan,
+        .sign = p64.sign,
+        .exp = INT_MAX,
+        .frac_hi = p64.frac,
+        .frac_lo = -(p64.frac & 1)
+    };
+}
+
 /*----------------------------------------------------------------------------
 | Returns a quiet NaN from a signalling NaN for the deconstructed
 | floating-point parts.
-- 
2.25.1


