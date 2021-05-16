Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3C3381EDB
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:46:30 +0200 (CEST)
Received: from localhost ([::1]:53950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGA9-0002BI-83
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz0-0007Pz-9d
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:58 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:37607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyl-0007kz-Ts
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:54 -0400
Received: by mail-qk1-x72d.google.com with SMTP id i67so3308675qkc.4
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J2jECUv0KB/VRaKbNWjXBjsVAbH6ZqCf4a3f43XZat8=;
 b=jwCh6rrfJbb1xV5SIS6Sij5OrpTm/g5qdLmso/I/C2kE/DEX7VAEfGHBmORiVbYhUh
 5pfiOltwC5sQrQifPv2zejAIhUfETlDYBT3b8OWA+yeJ9SkeEz57KBGr4UVM6A1CWA6N
 zWZQ1r7UUTQ1kPwFfXnvK6eFlta3opfWVmw2fW+OOloLwl7XN2PA06isxycxH/JsaqxF
 R5Wo+X20b08hubWE/RG8y886IR/bLEJawu7oXXb7k8qnbhI2h3jbBz0khexP3BRupGIn
 +NzRSssbCLktewDw1nUCey9bgfqtikz9kD9baI7OuJsPtjgj1WltfOBXJr6jke8FG1Jr
 RSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J2jECUv0KB/VRaKbNWjXBjsVAbH6ZqCf4a3f43XZat8=;
 b=VGsvnC2yLw2Qt60LcOgDlSEgnRZX8O5iJz4rWYdOjVvrUneW5Pi9y58Bh3qqKJ9o4V
 pky03ypAov1WqN54r1kByVZJ81Fxy9WHhV4ySR8gcX3gCFog7+y/VtDJlXzFSfWvSvRW
 KeyNBAevug/NPJdCxACxfzkf/NugPmbUVK2SaCuafI1KLCKLvfZ0wAbRoCuELYcF1ZZC
 gYX1BkLWTbxlt+4VWVMLn6A91Lwho827E1zYnaH2vsJrnvFEe/9oYFaSvLJYbGR2IkpO
 VZ5KZvAZa4M+djEq0yM+ImcNNOWGP7j0Pniasl10231/DAibMWwduvTNJFYMcRFtbavd
 4zqw==
X-Gm-Message-State: AOAM531pgBHhZT9YT4c5OcgagApqZlIZ4MjwJVGtj6ZzMoJxp7PTe8L7
 c0WXy5hE7p/dj7kRPjx7AsUkQJcSRQJMpqjDyzc=
X-Google-Smtp-Source: ABdhPJyWrxdR4n2RnESG15IEI+esRIZ/7THg3LCuXZhtCCkdaAkL4IEEPclTvhyKSjXNbFlFqW8Ltg==
X-Received: by 2002:a37:7306:: with SMTP id o6mr16495344qkc.38.1621168481391; 
 Sun, 16 May 2021 05:34:41 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/46] softfloat: Add float_cmask and constants
Date: Sun, 16 May 2021 07:33:55 -0500
Message-Id: <20210516123431.718318-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Testing more than one class at a time is better done with masks.
This reduces the static branch count.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index ee4b5073b6..64edb23793 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -469,6 +469,20 @@ typedef enum __attribute__ ((__packed__)) {
     float_class_snan,
 } FloatClass;
 
+#define float_cmask(bit)  (1u << (bit))
+
+enum {
+    float_cmask_zero    = float_cmask(float_class_zero),
+    float_cmask_normal  = float_cmask(float_class_normal),
+    float_cmask_inf     = float_cmask(float_class_inf),
+    float_cmask_qnan    = float_cmask(float_class_qnan),
+    float_cmask_snan    = float_cmask(float_class_snan),
+
+    float_cmask_infzero = float_cmask_zero | float_cmask_inf,
+    float_cmask_anynan  = float_cmask_qnan | float_cmask_snan,
+};
+
+
 /* Simple helpers for checking if, or what kind of, NaN we have */
 static inline __attribute__((unused)) bool is_nan(FloatClass c)
 {
@@ -1338,26 +1352,28 @@ bfloat16 QEMU_FLATTEN bfloat16_mul(bfloat16 a, bfloat16 b, float_status *status)
 static FloatParts muladd_floats(FloatParts a, FloatParts b, FloatParts c,
                                 int flags, float_status *s)
 {
-    bool inf_zero = ((1 << a.cls) | (1 << b.cls)) ==
-                    ((1 << float_class_inf) | (1 << float_class_zero));
-    bool p_sign;
+    bool inf_zero, p_sign;
     bool sign_flip = flags & float_muladd_negate_result;
     FloatClass p_class;
     uint64_t hi, lo;
     int p_exp;
+    int ab_mask, abc_mask;
+
+    ab_mask = float_cmask(a.cls) | float_cmask(b.cls);
+    abc_mask = float_cmask(c.cls) | ab_mask;
+    inf_zero = ab_mask == float_cmask_infzero;
 
     /* It is implementation-defined whether the cases of (0,inf,qnan)
      * and (inf,0,qnan) raise InvalidOperation or not (and what QNaN
      * they return if they do), so we have to hand this information
      * off to the target-specific pick-a-NaN routine.
      */
-    if (is_nan(a.cls) || is_nan(b.cls) || is_nan(c.cls)) {
+    if (unlikely(abc_mask & float_cmask_anynan)) {
         return pick_nan_muladd(a, b, c, inf_zero, s);
     }
 
     if (inf_zero) {
         float_raise(float_flag_invalid, s);
-        s->float_exception_flags |= float_flag_invalid;
         return parts_default_nan(s);
     }
 
@@ -1371,9 +1387,9 @@ static FloatParts muladd_floats(FloatParts a, FloatParts b, FloatParts c,
         p_sign ^= 1;
     }
 
-    if (a.cls == float_class_inf || b.cls == float_class_inf) {
+    if (ab_mask & float_cmask_inf) {
         p_class = float_class_inf;
-    } else if (a.cls == float_class_zero || b.cls == float_class_zero) {
+    } else if (ab_mask & float_cmask_zero) {
         p_class = float_class_zero;
     } else {
         p_class = float_class_normal;
-- 
2.25.1


