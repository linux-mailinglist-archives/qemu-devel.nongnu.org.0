Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E11BB376EE5
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:41:32 +0200 (CEST)
Received: from localhost ([::1]:50218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCuJ-0002bf-W1
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8F-0003U6-N6
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:52 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:37557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC86-0005WB-Bp
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:51 -0400
Received: by mail-pf1-x431.google.com with SMTP id b15so9156311pfl.4
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LZ3EVpA+stFdeEBoSATKDS13Onp/VeKXwMPd01vcHvM=;
 b=MLzGjO4a0NXTWKyzbgVeKknWmmPhCJ5AnX4t979Rdmtlf74ekRu8shyfCi9IGu2wqK
 9coqGBUCa9/fpwBV1yvbbNaFdNhqskGsMR6fmgyLMvMpEvb/ic/j2JXsAvN2rhvAd+2/
 +UlIbNzJwbuMbJB3c7haMLAiBGQB2qD9olF8lH2dIBq4/Mjc8gghK4jG0/bL/f3LuElb
 jRj/QyGJlvoHAcNHSOmi/9aV6bbpWGyzn2/3xd7bav2l0nBg9WnNVOclNn4ii2eOspoX
 N8OwoTklzK4ZL5f9EO3FMazQh0mjC2H9dTOeaaQjF480nQHpkq3bwvLYnyAUP+usGfxg
 /qBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LZ3EVpA+stFdeEBoSATKDS13Onp/VeKXwMPd01vcHvM=;
 b=jvLGCpPYY0LQgF4nl+H5NCYEC0jNzMne0OCGry3oEbkAa1zzV8Q6yALr4daf2H9VCs
 mJYvVDQniYR13MYXl9hPuTrEvJjqSIdiXZEcsRra+nj96Jg6C3JKwtYbZy7dmAmrObzy
 twyV7kgQKfMMPLcerCm/3dJLDescb5ikjwpAW00IygyCkdF5IxJF1D5vrf7vuvshAb+u
 f9iIMjs8qov4siZQGcTbvzRZ5CNYhnBO6lP/Q20/m8qEB8WxjvmPnSoY7kVQTwhtxVrJ
 RMyjD8W/YPYJT3WFOPDsUHE+DicgCBRDcrMZmi/ed55Kwi0jgnVhhYQyaGeesT2zSzx2
 OC4A==
X-Gm-Message-State: AOAM531fUptlNiHJ4RLZ76UB3OKaUYXZtwlGCsVMh6ai5in9/KoirycF
 nRs17D/hwxjYxyR0w3M1OzUBv8zZCvI32A==
X-Google-Smtp-Source: ABdhPJyC6bkzxb3nVPG6p5WVgVNQhj+UGZ4ZQUlVz7j1hCyf0eK23d0jQGx9KEAPj4DuiwSg0GGt5A==
X-Received: by 2002:a63:2115:: with SMTP id h21mr13288716pgh.191.1620438701044; 
 Fri, 07 May 2021 18:51:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 57/72] softfloat: Adjust parts_uncanon_normal for floatx80
Date: Fri,  7 May 2021 18:47:47 -0700
Message-Id: <20210508014802.892561-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
index 3ee6552d5a..c18f77f2cf 100644
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


