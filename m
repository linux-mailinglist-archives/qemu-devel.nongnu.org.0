Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FEE457263
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:07:56 +0100 (CET)
Received: from localhost ([::1]:55804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6Qc-0008BW-DK
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:07:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OA-0004p1-O4
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:22 -0500
Received: from [2a00:1450:4864:20::335] (port=45975
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6O6-00047U-HP
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:21 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so7875748wme.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nUHIq8C3W7MOmjDLyaRck8g09XD/atBRp2yVUGS0Fjs=;
 b=QHUuR4rWLnzLXAbBW950gra+6KWjcAZBRSc9/yO3KQwh1wbj1RXJdlpinRzVa/cTjf
 9UjNCk/wCjxWIy0g9QP/pkKlubsoCsiEn/3Kz1SneUWeG7ZdcUQufdS2q86dHey+zu6n
 Gmj6gZxSX9aRYg3MucFoKlkYMFCb2MkuVK9ehWgGywKS3JIr5cQB3FEmlbIcZY3cKARe
 gQVD/7eb59az63ckSxKO8Yq/LaaVM+nlr5XKCQoLfuVLzWCW8B0rMMmjFrFaEpypCGQU
 Sza9JdfqJthHgviJI3+AfQ3zHt4ZKFB3wHWnkG3dj0KB9Qnxj/VA0HJrWPR/bzVQUpjs
 +wUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nUHIq8C3W7MOmjDLyaRck8g09XD/atBRp2yVUGS0Fjs=;
 b=nclj4iiluU2RITzbQNSLETsQhRoD1bKtOEPaa4pltf5QjHhEpdOxGri1ZDaiU/Albq
 JmkbB52T2ZVkXxRp2+jTvoB8LwGIXqFweQaokEq9XdnOAHqx1qZ/g86/GH8pEVQIeIUG
 4wAs/R0lW2YyFYHFEcUO1cfa2pqkyyd+TdmrnzV7gUgOQqJBE2apUKOAFsmKyFBgK2uC
 n2n91Vkto9Pexdpc/H8fyhi1h77OOTpMAWCF3EIH1GhOc1KAM0cPnWWGbtKKhq/ITKrp
 U3vTtMVawuDcQyIq+Px9CcIbolkgTB1dO/+hYnlAfGLJ/BGB4mUsl4Rk8rsX8V5xtyEj
 Y4pg==
X-Gm-Message-State: AOAM530dScf14IQU1TzelYbHAFgHTiN88GpMlzeTwx9qL6CwwjUvNyTT
 lPH0cQ8U0TXadqFJl7HO1L398c386hJnaQsUiao=
X-Google-Smtp-Source: ABdhPJzbsUKQUC7/VMYIL+rQmTMYQ/6uvbhmzSIVzGS5J5e3SDkWlfIcBmIfanPWg3vw9U4Mum7w9A==
X-Received: by 2002:a1c:448b:: with SMTP id r133mr872160wma.85.1637337913570; 
 Fri, 19 Nov 2021 08:05:13 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/35] softfloat: Add flag specific to Inf * 0
Date: Fri, 19 Nov 2021 17:04:30 +0100
Message-Id: <20211119160502.17432-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PowerPC has this flag, and it's easier to compute it here
than after the fact.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-types.h  |  1 +
 fpu/softfloat-parts.c.inc      |  4 ++--
 fpu/softfloat-specialize.c.inc | 12 ++++++------
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index eaa12e1e00..56b4cf7835 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -153,6 +153,7 @@ enum {
     float_flag_input_denormal  = 0x0020,
     float_flag_output_denormal = 0x0040,
     float_flag_invalid_isi     = 0x0080,  /* inf - inf */
+    float_flag_invalid_imz     = 0x0100,  /* inf * 0 */
 };
 
 /*
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index eb2b475ca4..3ed793347b 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -423,7 +423,7 @@ static FloatPartsN *partsN(mul)(FloatPartsN *a, FloatPartsN *b,
 
     /* Inf * Zero == NaN */
     if (unlikely(ab_mask == float_cmask_infzero)) {
-        float_raise(float_flag_invalid, s);
+        float_raise(float_flag_invalid | float_flag_invalid_imz, s);
         parts_default_nan(a, s);
         return a;
     }
@@ -489,6 +489,7 @@ static FloatPartsN *partsN(muladd)(FloatPartsN *a, FloatPartsN *b,
 
     if (unlikely(ab_mask != float_cmask_normal)) {
         if (unlikely(ab_mask == float_cmask_infzero)) {
+            float_raise(float_flag_invalid | float_flag_invalid_imz, s);
             goto d_nan;
         }
 
@@ -567,7 +568,6 @@ static FloatPartsN *partsN(muladd)(FloatPartsN *a, FloatPartsN *b,
     goto finish_sign;
 
  d_nan:
-    float_raise(float_flag_invalid, s);
     parts_default_nan(a, s);
     return a;
 }
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index f2ad0f335e..943e3301d2 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -506,7 +506,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
      * the default NaN
      */
     if (infzero && is_qnan(c_cls)) {
-        float_raise(float_flag_invalid, status);
+        float_raise(float_flag_invalid | float_flag_invalid_imz, status);
         return 3;
     }
 
@@ -533,7 +533,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
          * case sets InvalidOp and returns the default NaN
          */
         if (infzero) {
-            float_raise(float_flag_invalid, status);
+            float_raise(float_flag_invalid | float_flag_invalid_imz, status);
             return 3;
         }
         /* Prefer sNaN over qNaN, in the a, b, c order. */
@@ -556,7 +556,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
          * case sets InvalidOp and returns the input value 'c'
          */
         if (infzero) {
-            float_raise(float_flag_invalid, status);
+            float_raise(float_flag_invalid | float_flag_invalid_imz, status);
             return 2;
         }
         /* Prefer sNaN over qNaN, in the c, a, b order. */
@@ -580,7 +580,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
      * a default NaN
      */
     if (infzero) {
-        float_raise(float_flag_invalid, status);
+        float_raise(float_flag_invalid | float_flag_invalid_imz, status);
         return 2;
     }
 
@@ -597,7 +597,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
 #elif defined(TARGET_RISCV)
     /* For RISC-V, InvalidOp is set when multiplicands are Inf and zero */
     if (infzero) {
-        float_raise(float_flag_invalid, status);
+        float_raise(float_flag_invalid | float_flag_invalid_imz, status);
     }
     return 3; /* default NaN */
 #elif defined(TARGET_XTENSA)
@@ -606,7 +606,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
      * an input NaN if we have one (ie c).
      */
     if (infzero) {
-        float_raise(float_flag_invalid, status);
+        float_raise(float_flag_invalid | float_flag_invalid_imz, status);
         return 2;
     }
     if (status->use_first_nan) {
-- 
2.25.1


