Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33270381EEA
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:56:50 +0200 (CEST)
Received: from localhost ([::1]:51554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGK9-00033w-3W
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFzW-0007ig-Hu
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:30 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:44691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz1-0007ob-Em
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:24 -0400
Received: by mail-qt1-x82e.google.com with SMTP id y12so2987501qtx.11
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2MqvZurasxzpgYGu9FWNV4B+meV5FVHuhb0YtHOgOVE=;
 b=LqysAjKbIoO561yWMLKO33058BU8DJWwP75hlPtt/S/7iClnpEXt8VTvYTBv/6t2os
 DfFRU3pbZD3gS3O+9TSqxx0wQVgl45aeYF+FUBqBh1DStyNfgLjg/1fHX/Y/HkxNE27Y
 6vNg16RQnqTJKkur7trisP+4a7/O5rYCz5oSZdxYus3BUac5aukElwEeAXFrY1tI1sfT
 zqs9u1IKIevQcpL/JLnBSNrRx1EhoGLv0JY+CWAdfVcy015YSluB+VQ/zrc7QA9MU+ut
 PZ/U4buUDe56IIM02AII123A1l6HGGcCZGothhAxmKpU2fDJaUER2XT3MoAiN0veVBmL
 N5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2MqvZurasxzpgYGu9FWNV4B+meV5FVHuhb0YtHOgOVE=;
 b=Hq7wOpqpOfa+rsHGaAMgpRceJknKaf8kSTf1J7KSBiz/T66ZShKZz9X0eK+uheI5lN
 k9At6W+XP3HpB4RjVqFwHrxLvO15DoarSFi9onZhPF/ENl8ERs/4LET+CkqhA+TLTpRI
 Qm4kvbMH4STJMtMRagod7TLk0hPc2tIWLv2pQmuzIuVcjtOVTa+F/IGRm7h/QpFE5nk4
 hNdJYdJjJ3OmdHfhQ7bHcnJwnRxr6uLXucmOlmgnJFIoT8Bt7ygEbcxf/ZqObceoTo4x
 T9KIm7wSkO24lhlssQ1LCRpcB7FuHkjfaO8tvF1WtBE+buICOi08scdKOa1Q+hoaz0HM
 Jw9w==
X-Gm-Message-State: AOAM530rmDmpMtxH2SMqinCISpJVX2fthbO28RvMeTV6zol6aEwg8jFh
 o2pTN7x859wuEPef8HUPBgqragxdnAMc9ZpCj3A=
X-Google-Smtp-Source: ABdhPJwUw8Hd6O+0hL9HwOlQrFG2z9jklZKISL6OIK2TwUHRLapHtD+jkySAXeqTy5ts1/NGOWWtiA==
X-Received: by 2002:ac8:12c5:: with SMTP id b5mr52251432qtj.203.1621168495195; 
 Sun, 16 May 2021 05:34:55 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/46] softfloat: Convert float128_default_nan to parts
Date: Sun, 16 May 2021 07:34:12 -0500
Message-Id: <20210516123431.718318-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
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
 fpu/softfloat.c                | 17 ++++-------------
 fpu/softfloat-specialize.c.inc | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index f8f4ef51e8..08fd812ea0 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -706,7 +706,7 @@ static float128 float128_pack_raw(const FloatParts128 *p)
 #define PARTS_GENERIC_64_128(NAME, P) \
     QEMU_GENERIC(P, (FloatParts128 *, parts128_##NAME), parts64_##NAME)
 
-#define parts_default_nan  parts64_default_nan
+#define parts_default_nan(P, S)    PARTS_GENERIC_64_128(default_nan, P)(P, S)
 #define parts_silence_nan(P, S)    PARTS_GENERIC_64_128(silence_nan, P)(P, S)
 
 
@@ -3837,20 +3837,11 @@ float64 float64_default_nan(float_status *status)
 
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
index 5b85b843c2..c895733e79 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -171,6 +171,25 @@ static void parts64_default_nan(FloatParts64 *p, float_status *status)
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


