Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19254362C39
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 02:04:12 +0200 (CEST)
Received: from localhost ([::1]:41750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXYRX-0003Yx-41
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 20:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN8-0005Fg-8r
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:38 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:43621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN6-0005dU-I9
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:38 -0400
Received: by mail-pg1-x531.google.com with SMTP id p12so20224138pgj.10
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 16:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=doLgHy4UzU3or1oUi8sNNPd0558SCSQfVTW0p961kLw=;
 b=EZeWxHLvTsBDaWu7zXTaKI89eMrv/T79BdmHiBX3R5TaCyO5XBy7KJKmLklC9XXEt4
 i3JC8BB2eCJU73BQM2RndbYyZPyYCE8yifnNGtVQW2vD5CisAxRYKfJ6/pf11OMKxsxm
 ki+PA8SsiHU1w5qpDRF5zxJE7AIzgUmsFJ/jESKGaVmMmG3TJnBsaB5CfGvPJ1qU1RgB
 aJ5JYD+2oKyec4NX48KY/nI/ozWMJ5gMpaerqK45B5gstnm6bOxJPb+qw2+NFHnCScp2
 orsWMe4k0LGZiQnZcc94cuOwgkBUXnEe5gX3K+wW7ZrKsBPKzORtALAXHIFk8/3kiYM9
 hkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=doLgHy4UzU3or1oUi8sNNPd0558SCSQfVTW0p961kLw=;
 b=OUHZjmJ8M2FZMAhJ3N/TbRrPiCCJxFoOZEATn5pp0UkNVJCGtS5hF/KbPv61nr6ipp
 CPd+YIlxwF9mrNzH7krbZJDhm1B9yaH8bpGAwweSRUe4Wiw82MxMy36opj5qJ6RXBtT3
 Ygs2++gGOR7+ESrdWbUHO70ZEO6jGOwrhz9AQCysTBol5ejAYcoBpRFw03JPM0zbxoez
 L2bAq6pfWCrJUTxyid4Mh4QfbLXZQGHYo3eXiNgkQRoEuoef+t/S7NJDGvI4w02bIPw+
 kVs9giZF+V6KxNAqTBMfzHOXaM2pBi8neXyAC6ZPjIJOlxbR2mBqXlArPDjAotMAxkzc
 NGxA==
X-Gm-Message-State: AOAM530lnWtZqvJrra1JIkYfW0Lt47jPQ9j1Uuhx4pIBcNyILSPakOCf
 LPiJvgOH/jqU7fZUuTA+9uvXEic+bZQdOw==
X-Google-Smtp-Source: ABdhPJw5MHZQ9NGLeRxxtdEVy9XgG3INpbvlKnq8ic5rFtHhqp+wozK2rwv3ZbEJVDrjXP3Xs/o+CQ==
X-Received: by 2002:a62:52c7:0:b029:255:e78e:5069 with SMTP id
 g190-20020a6252c70000b0290255e78e5069mr9612330pfb.45.1618617575158; 
 Fri, 16 Apr 2021 16:59:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d71sm560853pfd.83.2021.04.16.16.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 16:59:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 05/11] fpu: Add float_round_to_odd_inf
Date: Fri, 16 Apr 2021 16:59:22 -0700
Message-Id: <20210416235928.1631788-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416235928.1631788-1-richard.henderson@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For Arm BFDOT and BFMMLA, we need a version of round-to-odd
that overflows to infinity, instead of the max normal number.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-types.h | 4 +++-
 fpu/softfloat.c               | 8 ++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 8a3f20fae9..3b757c3d6a 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -134,8 +134,10 @@ typedef enum __attribute__((__packed__)) {
     float_round_up           = 2,
     float_round_to_zero      = 3,
     float_round_ties_away    = 4,
-    /* Not an IEEE rounding mode: round to the closest odd mantissa value */
+    /* Not an IEEE rounding mode: round to closest odd, overflow to max */
     float_round_to_odd       = 5,
+    /* Not an IEEE rounding mode: round to closest odd, overflow to inf */
+    float_round_to_odd_inf   = 6,
 } FloatRoundMode;
 
 /*
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 67cfa0fd82..76097679b0 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -694,13 +694,12 @@ static FloatParts round_canonical(FloatParts p, float_status *s,
 
     switch (p.cls) {
     case float_class_normal:
+        overflow_norm = false;
         switch (s->float_rounding_mode) {
         case float_round_nearest_even:
-            overflow_norm = false;
             inc = ((frac & roundeven_mask) != frac_lsbm1 ? frac_lsbm1 : 0);
             break;
         case float_round_ties_away:
-            overflow_norm = false;
             inc = frac_lsbm1;
             break;
         case float_round_to_zero:
@@ -717,6 +716,8 @@ static FloatParts round_canonical(FloatParts p, float_status *s,
             break;
         case float_round_to_odd:
             overflow_norm = true;
+            /* fall through */
+        case float_round_to_odd_inf:
             inc = frac & frac_lsb ? 0 : round_mask;
             break;
         default:
@@ -771,6 +772,7 @@ static FloatParts round_canonical(FloatParts p, float_status *s,
                            ? frac_lsbm1 : 0);
                     break;
                 case float_round_to_odd:
+                case float_round_to_odd_inf:
                     inc = frac & frac_lsb ? 0 : round_mask;
                     break;
                 default:
@@ -6860,6 +6862,8 @@ float128 float128_round_to_int(float128 a, float_status *status)
 
             case float_round_to_zero:
                 break;
+            default:
+                g_assert_not_reached();
             }
             return packFloat128( aSign, 0, 0, 0 );
         }
-- 
2.25.1


