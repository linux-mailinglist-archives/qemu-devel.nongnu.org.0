Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEA039AD33
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:49:26 +0200 (CEST)
Received: from localhost ([::1]:46880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lovDQ-0005Gd-WD
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov61-0002L8-Pq
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:45 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5y-00015o-0B
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:45 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so6260034pjz.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j87cuN4oaVGPOQrr81JQNoweh6RR6j9zmHwWvD1f2qc=;
 b=p++rPMhXyzBlFbk7pzdg7LIjaJw0oMzMDfr+VOHY9KCQo+pI2EP+5cjPY1M78LcIo6
 TPP7pSq2L/3dPLXOGL0BJU1/2jEW5uOEo3bG6VzwF/Ru5b213cZOwYgwSzsm/dDqsict
 7EdKwClekqJB5s+v8AUPQQZNyXKHZc/mY3g3yAruSuJI7hq8v6vASbwhxOchPEgTb7Id
 Q4k8XH6t1Sp3tXNoiGP3eDvxxMsBPAlRT9DBTPFnxgCxu1xYneSL4LZO7mp7FqgAp3nV
 Kww8lUFEsWDzPjuYxetpbYbSdLLYFELQk0HwriI8c+eAAbqkiULiFDex9Km6HnTFpike
 FNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j87cuN4oaVGPOQrr81JQNoweh6RR6j9zmHwWvD1f2qc=;
 b=jrax/S20T4csW60x3NTmn0oBZP4Z+TLyjIy2JApHVB1Uf9o4vH061RS1Ajx/XSH4+Q
 oUV8lzqni+105JDhZJwvgDknZEypbKOyti3gIcFS2Fx9e2TZweGX+MJqiZUKjRvkDBkQ
 S7V5DifHuzkIRGFQax+jqYI5vTIIst0vHhTVG6Vh2I0zsBwIdu+k6uC8/z/Z5AAKgKe5
 MphsZL7XKeEnG5XO+5R3ysRWwFYQCjsdIzF5mOijNXgqkuD5hgNhX49qphh11VP4Zi4i
 6zxlVFU4KFyQsjFevmM1WPnGDkDjLkKrn4mmzyb2JyuBmfZWE0+97H3AhVLcdiriIQ4R
 d+0w==
X-Gm-Message-State: AOAM533463Xsok7BynInarns27lFGLkNlgmxiGvv/m//0b6op//69dHP
 bRi8L1pp6TrgG/vG1k5P/AYK6a5hElT5Rw==
X-Google-Smtp-Source: ABdhPJz56gmEMK6RPtDkPVXpBJKmFpvPAamDApmxN+npMK09FHZvD5g8L9BotBp2dPkvuOQDyEBYCw==
X-Received: by 2002:a17:90a:1150:: with SMTP id
 d16mr1346065pje.180.1622756500644; 
 Thu, 03 Jun 2021 14:41:40 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/29] softfloat: Adjust parts_uncanon_normal for floatx80
Date: Thu,  3 Jun 2021 14:41:14 -0700
Message-Id: <20210603214131.629841-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With floatx80_precision_x, the rounding happens across
the break between words.  Notice this case with

  frac_lsb = round_mask + 1 -> 0

and check the bits in frac_hi as needed.

In addition, since frac_shift == 0, we won't implicitly clear
round_mask via the right-shift, so explicitly clear those bits.
This fixes rounding for floatx80_precision_[sd].

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat-parts.c.inc | 36 ++++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index a026581c33..efb81bbebe 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -155,7 +155,13 @@ static void partsN(uncanon_normal)(FloatPartsN *p, float_status *s,
 
     switch (s->float_rounding_mode) {
     case float_round_nearest_even:
-        inc = ((p->frac_lo & roundeven_mask) != frac_lsbm1 ? frac_lsbm1 : 0);
+        if (N > 64 && frac_lsb == 0) {
+            inc = ((p->frac_hi & 1) || (p->frac_lo & round_mask) != frac_lsbm1
+                   ? frac_lsbm1 : 0);
+        } else {
+            inc = ((p->frac_lo & roundeven_mask) != frac_lsbm1
+                   ? frac_lsbm1 : 0);
+        }
         break;
     case float_round_ties_away:
         inc = frac_lsbm1;
@@ -176,7 +182,11 @@ static void partsN(uncanon_normal)(FloatPartsN *p, float_status *s,
         overflow_norm = true;
         /* fall through */
     case float_round_to_odd_inf:
-        inc = p->frac_lo & frac_lsb ? 0 : round_mask;
+        if (N > 64 && frac_lsb == 0) {
+            inc = p->frac_hi & 1 ? 0 : round_mask;
+        } else {
+            inc = p->frac_lo & frac_lsb ? 0 : round_mask;
+        }
         break;
     default:
         g_assert_not_reached();
@@ -191,8 +201,8 @@ static void partsN(uncanon_normal)(FloatPartsN *p, float_status *s,
                 p->frac_hi |= DECOMPOSED_IMPLICIT_BIT;
                 exp++;
             }
+            p->frac_lo &= ~round_mask;
         }
-        frac_shr(p, frac_shift);
 
         if (fmt->arm_althp) {
             /* ARM Alt HP eschews Inf and NaN for a wider exponent.  */
@@ -201,18 +211,21 @@ static void partsN(uncanon_normal)(FloatPartsN *p, float_status *s,
                 flags = float_flag_invalid;
                 exp = exp_max;
                 frac_allones(p);
+                p->frac_lo &= ~round_mask;
             }
         } else if (unlikely(exp >= exp_max)) {
             flags |= float_flag_overflow | float_flag_inexact;
             if (overflow_norm) {
                 exp = exp_max - 1;
                 frac_allones(p);
+                p->frac_lo &= ~round_mask;
             } else {
                 p->cls = float_class_inf;
                 exp = exp_max;
                 frac_clear(p);
             }
         }
+        frac_shr(p, frac_shift);
     } else if (s->flush_to_zero) {
         flags |= float_flag_output_denormal;
         p->cls = float_class_zero;
@@ -232,18 +245,29 @@ static void partsN(uncanon_normal)(FloatPartsN *p, float_status *s,
             /* Need to recompute round-to-even/round-to-odd. */
             switch (s->float_rounding_mode) {
             case float_round_nearest_even:
-                inc = ((p->frac_lo & roundeven_mask) != frac_lsbm1
-                       ? frac_lsbm1 : 0);
+                if (N > 64 && frac_lsb == 0) {
+                    inc = ((p->frac_hi & 1) ||
+                           (p->frac_lo & round_mask) != frac_lsbm1
+                           ? frac_lsbm1 : 0);
+                } else {
+                    inc = ((p->frac_lo & roundeven_mask) != frac_lsbm1
+                           ? frac_lsbm1 : 0);
+                }
                 break;
             case float_round_to_odd:
             case float_round_to_odd_inf:
-                inc = p->frac_lo & frac_lsb ? 0 : round_mask;
+                if (N > 64 && frac_lsb == 0) {
+                    inc = p->frac_hi & 1 ? 0 : round_mask;
+                } else {
+                    inc = p->frac_lo & frac_lsb ? 0 : round_mask;
+                }
                 break;
             default:
                 break;
             }
             flags |= float_flag_inexact;
             frac_addi(p, p, inc);
+            p->frac_lo &= ~round_mask;
         }
 
         exp = (p->frac_hi & DECOMPOSED_IMPLICIT_BIT) != 0;
-- 
2.25.1


