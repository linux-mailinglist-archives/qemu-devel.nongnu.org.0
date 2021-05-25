Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A91390643
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:12:32 +0200 (CEST)
Received: from localhost ([::1]:37082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZfT-00051M-41
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeR-0001go-Mj
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:23 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:42880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeK-0006go-3m
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:23 -0400
Received: by mail-pl1-x62c.google.com with SMTP id v13so16483479ple.9
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hRoARebbIM30+5QjLTpQyHKZOtTassCJ5Yf1wssASeE=;
 b=bAAI/GPx7i7Cv+CE5CxC9LxUX8N/E9378LDG81oB7pd0dn6kFP9IgLTvbi4s07JwSj
 vsPsfGa2d6M4jK8m03e/rp9DqUeeMGD8houhXP7CEzFiSi0yJWx0CNVyGnZS7R9tyWhG
 ITxNpt98GmxRLuHw7yHjXWtqnh5Q+pchncHNl9MkMWDEaGJApXbbwdzyQOV97h+v1Qx3
 +TTU0IAqxFeMxxZvT92zD5cpeLY7eajYxMSvZrtBkizxjrCq4bBLeHLlj+o0v9QneW5n
 iSXJ6ogjIKQuxn+pp+Qmp5wA0jC1K0J+iTvVEP958vul+g88/L3+yJ9vwkwOSNPhPwRG
 pdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hRoARebbIM30+5QjLTpQyHKZOtTassCJ5Yf1wssASeE=;
 b=EF6M0D/IgvNpJhoSgZG/Efwtm/S5YuOt0x5OB65gk9WEGZxPjWJlIfZh47PBpp9OLF
 C0U/tUDdU8N/lQZ63iGneb1nduHsy8iEaI7SQvsvQsCTTDDAWFKfG309BSqQRHgUuMJ0
 PNzAOOuE/KwyxBX2N80kA477VLnXJ6uQ5b0/BhKJ228flm2Nyrkk9su9KTVS/1W4Z5rL
 cRKdgljfcL2qFoBcTM6/KM7+12EKYCGLN2xKuN9hztMmfqc5lmn0kIefEduFO55gXKuW
 jUI9Akqvl4S2WMytb80qxtV2g+VEHxg/mqy07JcWVJ1sSe1megZQQwTC6lEU57BZelih
 UE3Q==
X-Gm-Message-State: AOAM533RmKfrBd0yvYugfS/eR+umS3YNrGTFHlewqrfYOlGZSvMVe4VJ
 R9JpWqVJ7NMtC7hZPJnPWM+5BGF+sepkoQ==
X-Google-Smtp-Source: ABdhPJyYkibfLE6BjxFSBO+yPcPZKgpg4CxHpZbbhp30W6Ym5QF52OM2jJqwP1l00rvwG79MsLDIRQ==
X-Received: by 2002:a17:90a:4a89:: with SMTP id
 f9mr5324280pjh.50.1621955234822; 
 Tue, 25 May 2021 08:07:14 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id z19sm2231943pjq.11.2021.05.25.08.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/28] softfloat: Adjust parts_uncanon_normal for floatx80
Date: Tue, 25 May 2021 08:06:49 -0700
Message-Id: <20210525150706.294968-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525150706.294968-1-richard.henderson@linaro.org>
References: <20210525150706.294968-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

With floatx80_precision_x, the rounding happens across
the break between words.  Notice this case with

  frac_lsb = round_mask + 1 -> 0

and check the bits in frac_hi as needed.

In addition, since frac_shift == 0, we won't implicitly clear
round_mask via the right-shift, so explicitly clear those bits.
This fixes rounding for floatx80_precision_[sd].

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat-parts.c.inc | 36 ++++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index b456c1c30c..8a7f22d6b5 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -156,7 +156,13 @@ static void partsN(uncanon_normal)(FloatPartsN *p, float_status *s,
     switch (s->float_rounding_mode) {
     case float_round_nearest_even:
         overflow_norm = false;
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
         overflow_norm = false;
@@ -176,7 +182,11 @@ static void partsN(uncanon_normal)(FloatPartsN *p, float_status *s,
         break;
     case float_round_to_odd:
         overflow_norm = true;
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
@@ -232,17 +245,28 @@ static void partsN(uncanon_normal)(FloatPartsN *p, float_status *s,
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


