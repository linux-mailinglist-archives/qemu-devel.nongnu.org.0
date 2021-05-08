Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882F4376E61
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:07:10 +0200 (CEST)
Received: from localhost ([::1]:33702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCN3-0002FH-Ie
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4x-0004Ci-6d
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:29 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:39673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4n-0003cA-EL
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:24 -0400
Received: by mail-pf1-x436.google.com with SMTP id c17so9137443pfn.6
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K1gA4ou0gWluj4i3I5ZQAgi8eRSRO7pa0sBtkx8u1fc=;
 b=z42ci9DKdk7XZpVKF4ADmluDu/782dp1kS97M9O+ck20TGbtaNknYr+QUd8hlXdxbB
 x2W/E39IOiW6sWFY3ex9rdUTYaKUFTHIiGs/kDb7myA653R4BN3mefoPr+WwFzE+Uu40
 RjyIkjS9E5azfkXjwK9vil6n13S25dgjb/01NBPnJl/kJJeKlKCT0i7q/t4fSBCmSOol
 4Giy/FDu6j9XRZfzaJ8m3xR0Y1pyQ/rPt0jc0QEX6JrwJtiSY3LHNpArnEKSJJSo+8Oy
 9BW3d2qrpVfthdVqkX3mcGsiHbLJnDQvCtoNtvfP5j96rFn+ZgWkX6OwE1jJChzJZZ7g
 AuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K1gA4ou0gWluj4i3I5ZQAgi8eRSRO7pa0sBtkx8u1fc=;
 b=ECPspFq/Uo32ouMXRevcYdLZQNr7MZz9vWcF5DC4NUXmlLpGzIXuAycALq7nNEof4H
 j883VdQTHTze1Lajnkg/IBfhYj4Dav/N1PH0vJ/zMOqL+jF7obrmIFi3/UBpXXCkI726
 IbVx9XAoH9MbTxVH1z9BsgwFl4NYaDe8awc3fgJBzIApI6y74kklS9JqYL1icTgBh7VS
 0zsHkDkAA1xZCgIa1q+Qqhd+nf6RVbuoRacxPmNaFBS3agNwLdXxCEFUIBVdgaiAeSGU
 WuUouSTUmxjOxpXwbGKDUQIR7nj811wNDO+RzYFT4dZmpa0ya40Cg1VkITacuQHexneI
 z9PQ==
X-Gm-Message-State: AOAM531RYee6lsgNAyqWYgwyei2and9vBu5T2OHG7euCaDxn5eMOgtO2
 HBddkA5iPNHJddKhU3QimcirQblqJadw1w==
X-Google-Smtp-Source: ABdhPJw2gR1G61xnK1tbD+738dj9itIaFmbU/txRIkWG7rLqxitYTntB7R6+6R69cclBCe9NoUgcdw==
X-Received: by 2002:a63:ed17:: with SMTP id d23mr13309278pgi.107.1620438495432; 
 Fri, 07 May 2021 18:48:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/72] softfloat: Use pointers with unpack_raw
Date: Fri,  7 May 2021 18:47:08 -0700
Message-Id: <20210508014802.892561-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

At the same time, rename to unpack_raw64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index c7f95961cf..5ff9368012 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -580,36 +580,45 @@ static const FloatFmt float64_params = {
 };
 
 /* Unpack a float to parts, but do not canonicalize.  */
-static inline FloatParts64 unpack_raw(FloatFmt fmt, uint64_t raw)
+static void unpack_raw64(FloatParts64 *r, const FloatFmt *fmt, uint64_t raw)
 {
-    const int sign_pos = fmt.frac_size + fmt.exp_size;
+    const int f_size = fmt->frac_size;
+    const int e_size = fmt->exp_size;
 
-    return (FloatParts64) {
+    *r = (FloatParts64) {
         .cls = float_class_unclassified,
-        .sign = extract64(raw, sign_pos, 1),
-        .exp = extract64(raw, fmt.frac_size, fmt.exp_size),
-        .frac = extract64(raw, 0, fmt.frac_size),
+        .sign = extract64(raw, f_size + e_size, 1),
+        .exp = extract64(raw, f_size, e_size),
+        .frac = extract64(raw, 0, f_size)
     };
 }
 
 static inline FloatParts64 float16_unpack_raw(float16 f)
 {
-    return unpack_raw(float16_params, f);
+    FloatParts64 p;
+    unpack_raw64(&p, &float16_params, f);
+    return p;
 }
 
 static inline FloatParts64 bfloat16_unpack_raw(bfloat16 f)
 {
-    return unpack_raw(bfloat16_params, f);
+    FloatParts64 p;
+    unpack_raw64(&p, &bfloat16_params, f);
+    return p;
 }
 
 static inline FloatParts64 float32_unpack_raw(float32 f)
 {
-    return unpack_raw(float32_params, f);
+    FloatParts64 p;
+    unpack_raw64(&p, &float32_params, f);
+    return p;
 }
 
 static inline FloatParts64 float64_unpack_raw(float64 f)
 {
-    return unpack_raw(float64_params, f);
+    FloatParts64 p;
+    unpack_raw64(&p, &float64_params, f);
+    return p;
 }
 
 /* Pack a float from parts, but do not canonicalize.  */
-- 
2.25.1


