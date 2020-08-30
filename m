Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DF1256B33
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Aug 2020 04:35:43 +0200 (CEST)
Received: from localhost ([::1]:50656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCDC2-0000RE-Tj
	for lists+qemu-devel@lfdr.de; Sat, 29 Aug 2020 22:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCD8j-0002mx-G2
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 22:32:17 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:44177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCD8h-0002Yw-HR
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 22:32:17 -0400
Received: by mail-pf1-x430.google.com with SMTP id p11so2657809pfn.11
 for <qemu-devel@nongnu.org>; Sat, 29 Aug 2020 19:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3gEElP2a5vebEo0iaIMnucOEoCEL2rO6ZaUClQLywK4=;
 b=KehiPrltMJt52trF3WbZQSxKjq72WC4JVASEj+d/4nyxgqlp9/efQQzZfLKfE4+ttV
 p2IkOjGuSogn6IdwONn4GcYfNeHGFTxBMF5FXN8xdgxVvOM3apyf7Rq4EPMbMkARBynD
 UROD7lqXNyvV8J6ZWtkNb8DiSb8qkpnDlv/7wNBbsMXqbXVUqeA2EIgI0Nfxo5pAySzK
 2lZeauFlZKTGPOFwmM+B/n33vT2rinzVeWxPlQuZxk1xCeENjHO/deus9n2JCqggXuok
 i7uc7EwvlI09N8Q+FM34kBOh8LCLTsKLAvNRftsb5BzflDSPPgZTIXrC558UUy70DJhg
 JBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3gEElP2a5vebEo0iaIMnucOEoCEL2rO6ZaUClQLywK4=;
 b=cNOsP0qZthetvh1KLfXSXDk35e1Eve3KWQKkSA2uzO+CH6jaV3qYRzBU+GNu3UAs6b
 VL8HyyRuvFKSNmNB/QsxvkWCfG8tEE49kR1F6snkno6J1QU+mubc42akjSppfiitpr9F
 0VWiq9600o23551cnBvQi4y/Su+ew6ibej+gxPdtzGm4f2DDwcJRKcVk49lJqhUmZDsx
 j1fL+mVKp0V+f+ymXs16piSHB5REEIGj19crB+GjNx9k5iL19zROcCagBLAjqTO5Ts8E
 8kzu8j5p34F9qAeoBezJJ5UXIuw+uikD6U5vK+fbyQE/oCk1nnUErIFXXHDN8ewWu685
 Bh+Q==
X-Gm-Message-State: AOAM530MZ9/HWPHAcz9dfFLq9/6Jy4Q77+Zl2kNPAkNgFtXicxsSoHeg
 hi1bVagQmBaE/cQ5srGV8hRhe5BOhl3Y9g==
X-Google-Smtp-Source: ABdhPJyYsS+Qgua3u29wfKmFJ12gRFGAGKxFfZs6EUG+84uUdB1pGTJO3n9PrLBQHoimvnZVMfAZ5Q==
X-Received: by 2002:a63:60e:: with SMTP id 14mr3964956pgg.343.1598754733833;
 Sat, 29 Aug 2020 19:32:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id l23sm3546269pgt.16.2020.08.29.19.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Aug 2020 19:32:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] softfloat: Define misc operations for bfloat16
Date: Sat, 29 Aug 2020 19:32:02 -0700
Message-Id: <20200830023203.612312-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200830023203.612312-1-richard.henderson@linaro.org>
References: <20200830023203.612312-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: peter.maydell@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200813071421.2509-4-zhiwei_liu@c-sky.com>
[rth: Fix merge conflict with NO_SIGNALING_NANS; use bool for predicates.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat.h        | 48 ++++++++++++++++++++++++++++++++++
 fpu/softfloat-specialize.c.inc | 38 +++++++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 95f0789a92..1233f98014 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -423,9 +423,57 @@ bfloat16 bfloat16_sqrt(bfloat16, float_status *status);
 FloatRelation bfloat16_compare(bfloat16, bfloat16, float_status *status);
 FloatRelation bfloat16_compare_quiet(bfloat16, bfloat16, float_status *status);
 
+bool bfloat16_is_quiet_nan(bfloat16, float_status *status);
+bool bfloat16_is_signaling_nan(bfloat16, float_status *status);
 bfloat16 bfloat16_silence_nan(bfloat16, float_status *status);
 bfloat16 bfloat16_default_nan(float_status *status);
 
+static inline bool bfloat16_is_any_nan(bfloat16 a)
+{
+    return ((a & ~0x8000) > 0x7F80);
+}
+
+static inline bool bfloat16_is_neg(bfloat16 a)
+{
+    return a >> 15;
+}
+
+static inline bool bfloat16_is_infinity(bfloat16 a)
+{
+    return (a & 0x7fff) == 0x7F80;
+}
+
+static inline bool bfloat16_is_zero(bfloat16 a)
+{
+    return (a & 0x7fff) == 0;
+}
+
+static inline bool bfloat16_is_zero_or_denormal(bfloat16 a)
+{
+    return (a & 0x7F80) == 0;
+}
+
+static inline bool bfloat16_is_normal(bfloat16 a)
+{
+    return (((a >> 7) + 1) & 0xff) >= 2;
+}
+
+static inline bfloat16 bfloat16_abs(bfloat16 a)
+{
+    /* Note that abs does *not* handle NaN specially, nor does
+     * it flush denormal inputs to zero.
+     */
+    return a & 0x7fff;
+}
+
+static inline bfloat16 bfloat16_chs(bfloat16 a)
+{
+    /* Note that chs does *not* handle NaN specially, nor does
+     * it flush denormal inputs to zero.
+     */
+    return a ^ 0x8000;
+}
+
 static inline bfloat16 bfloat16_set_sign(bfloat16 a, int sign)
 {
     return (a & 0x7fff) | (sign << 15);
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index dc4ea33c09..c2f87addb2 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -265,6 +265,25 @@ bool float16_is_quiet_nan(float16 a_, float_status *status)
     }
 }
 
+/*----------------------------------------------------------------------------
+| Returns 1 if the bfloat16 value `a' is a quiet
+| NaN; otherwise returns 0.
+*----------------------------------------------------------------------------*/
+
+bool bfloat16_is_quiet_nan(bfloat16 a_, float_status *status)
+{
+    if (no_signaling_nans(status)) {
+        return bfloat16_is_any_nan(a_);
+    } else {
+        uint16_t a = a_;
+        if (snan_bit_is_one(status)) {
+            return (((a >> 6) & 0x1FF) == 0x1FE) && (a & 0x3F);
+        } else {
+            return ((a >> 6) & 0x1FF) == 0x1FF;
+        }
+    }
+}
+
 /*----------------------------------------------------------------------------
 | Returns 1 if the half-precision floating-point value `a' is a signaling
 | NaN; otherwise returns 0.
@@ -284,6 +303,25 @@ bool float16_is_signaling_nan(float16 a_, float_status *status)
     }
 }
 
+/*----------------------------------------------------------------------------
+| Returns 1 if the bfloat16 value `a' is a signaling
+| NaN; otherwise returns 0.
+*----------------------------------------------------------------------------*/
+
+bool bfloat16_is_signaling_nan(bfloat16 a_, float_status *status)
+{
+    if (no_signaling_nans(status)) {
+        return 0;
+    } else {
+        uint16_t a = a_;
+        if (snan_bit_is_one(status)) {
+            return ((a >> 6) & 0x1FF) == 0x1FF;
+        } else {
+            return (((a >> 6) & 0x1FF) == 0x1FE) && (a & 0x3F);
+        }
+    }
+}
+
 /*----------------------------------------------------------------------------
 | Returns 1 if the single-precision floating-point value `a' is a quiet
 | NaN; otherwise returns 0.
-- 
2.25.1


