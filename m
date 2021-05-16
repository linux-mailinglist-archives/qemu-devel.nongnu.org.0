Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730FB381EE2
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:49:53 +0200 (CEST)
Received: from localhost ([::1]:34398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGDQ-0008Iq-Hr
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz8-0007V8-BV
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:06 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:44620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyp-0007mN-O1
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:06 -0400
Received: by mail-qk1-x72a.google.com with SMTP id a2so3284599qkh.11
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ox0xEuSw27UkSWdR6GqHPFeB67qrzPm+Gy+AAkd2bwg=;
 b=xEOZir6y03yEKESVlN4eCYHotoCmXNZmoA6+ixH0s7vjvf6mZUe1zMcGxQ31GXnfbH
 bwFmGOUyz8TjnU9fh6hDh5F/1/30owZAgEF9KhWC9NoInslvcsmEJ2zIYc30TPXrhhkJ
 egPel322GVdAlnfgf57YYbIgUHJkwJemYibTJZkX0+CrMOPFCcl/Y3gyEZzjUt1uxih3
 JYn084uopxBt0We922T18myyl+VuiwAACN1HFZNf6XkRVORYtuJnOQdE1gmREgLPKZf9
 b2EGYJ17sZnwRlEEgLsRFexkHg3+Wv7ACiT2/qPl9Uv/v9z6e4iSNaPTON6v/7h3pY44
 y/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ox0xEuSw27UkSWdR6GqHPFeB67qrzPm+Gy+AAkd2bwg=;
 b=rqH/evXn/8tOAs/tgihz0l90PLuOFfxEQTXTWA5Ml7cyOclFRn62yV9AUZK3x7w1BN
 JwL/cXD89SphOVbOiGOQjBHuhLhPnTDwOMS8fnEKbaFhAeBADbO6Z0rndH7hM/FR5eH2
 yV113lSvFelDAyQnWZAKgttJCZBcDyprlpgCViQ9lpQVy9htloucrfRoc0DYx+4k7WQa
 GkhsRZwYD1u2eCVSMffiialwF7uZFubX7wR1qyrOUnQcVLhI5vak71fyWCsqSXexJJ32
 ZyW0OU28Ly9EoeTqs4wmj6Ntn6VZHqMBfuqQ3n0a+SUL6rDnXpmVz8WX5zl2UvZ8vA8D
 s7HQ==
X-Gm-Message-State: AOAM533YQiS9qhAvoMATGem1sxiSMNERf/+MoGrMNGFaZR+LA2pKQFuY
 uuUUqyRVSsz3Xiz3Mbuc034s6hUPPvDhvipJv+E=
X-Google-Smtp-Source: ABdhPJxa8KVTt/Dsnj9reXd8Yxsh84rYR273waQL/20y0GVNvKUCSFOVCdku+e179Yvu1aZjTdkPXQ==
X-Received: by 2002:a05:620a:1223:: with SMTP id
 v3mr51814430qkj.470.1621168486547; 
 Sun, 16 May 2021 05:34:46 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/46] softfloat: Move type-specific pack/unpack routines
Date: Sun, 16 May 2021 07:34:01 -0500
Message-Id: <20210516123431.718318-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation from moving sf_canonicalize.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
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


