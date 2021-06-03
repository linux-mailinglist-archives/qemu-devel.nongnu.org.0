Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9CC39A578
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:11:35 +0200 (CEST)
Received: from localhost ([::1]:55780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lopwT-00070g-Sv
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkj-0000Ek-DD
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:25 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkh-0006zx-Ej
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:25 -0400
Received: by mail-wr1-x436.google.com with SMTP id u7so938697wrs.10
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sDoUJAYn0yIc6w7KX8ASaLZmx5h0oxVG9cXFpdPESQk=;
 b=A/fGlAUgazC5srhZmgdLJm/JgP9pveOOe4+IMkcFBMV1bZ1Dyf3n4dJvetVV6xH2hL
 Tma7W4HpAbkwoEVeMhujEdwK/nEz4ktfqrBf0oRsmwkSEDjpiJFU39bWUo4q9GPBrP4e
 wwHW67eIfv6pS5a1RTMNfxYKr3hOqsUg150jgej0sYuKr85INEAo0ogqLuuDMKjVd0tu
 +r6L6IBGiAC+ea9TIPIH+3iMUOMXEIkuDkrXAVc/9khOXcaUYn5E+txfediBZC8OW8Cp
 LNPqC+Gi319dpIvex+EgdyBV6UwKuOudatemtPpECkSp1mp639wZzyabpTQis9E6H5Za
 CcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sDoUJAYn0yIc6w7KX8ASaLZmx5h0oxVG9cXFpdPESQk=;
 b=Z9sl6D+Owu5iNsxyPxrVJhcTJ/BeixrFfhGFZGuNdM2+ux5NIJ0WQzW54Jpls3CwcK
 yqXYENp8G+2WisVLYBbE0SL3LtgDKVgsR8AWzFRloGhIUt79DQ1vuoVV5iLgiu7+igkZ
 cOmKG6JyJ1hbWW/uBlvkKdxKKIQDgMVrL9F7705b9OvY4A+MR5o1P9Nlb6MKxuJu4Kiw
 XanxG+sJvwNVfR55ZTkUrUIVuVFGPBFciglyA06a/mbfj+R0mKp7fVmbBcJp/Bl0a1Cg
 Q0xAysovTJvA1PTe1/K3b3+/w4yGv8qvW4WBrFUiIpwnz2i0l3E1w8Xp01iM2av+vaxJ
 xSgw==
X-Gm-Message-State: AOAM532c382f4et/G5rPpqukx/H3ebmUFjcU+iTjFqBSyCQWY1S/bvQ3
 XTceVAO0AoPABGLupOMEdrxFLkuYdRc31BkZ
X-Google-Smtp-Source: ABdhPJyVdXIGA/r1MnlzZwZmfkm6z1/ydsWqbBpTdN+Fq552nbkHtH25+XxVp0Nm08bbclC665aMgA==
X-Received: by 2002:a5d:4dd0:: with SMTP id f16mr668000wru.192.1622735962170; 
 Thu, 03 Jun 2021 08:59:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/45] softfpu: Add float_round_to_odd_inf
Date: Thu,  3 Jun 2021 16:58:39 +0100
Message-Id: <20210603155904.26021-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

For Arm BFDOT and BFMMLA, we need a version of round-to-odd
that overflows to infinity, instead of the max normal number.

Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525225817.400336-6-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/fpu/softfloat-types.h | 4 +++-
 fpu/softfloat-parts.c.inc     | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 8a3f20fae9e..3b757c3d6a6 100644
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
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index a897a5a743d..7f69da1d8fa 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -176,13 +176,12 @@ static void partsN(uncanon)(FloatPartsN *p, float_status *s,
         g_assert_not_reached();
     }
 
+    overflow_norm = false;
     switch (s->float_rounding_mode) {
     case float_round_nearest_even:
-        overflow_norm = false;
         inc = ((p->frac_lo & roundeven_mask) != frac_lsbm1 ? frac_lsbm1 : 0);
         break;
     case float_round_ties_away:
-        overflow_norm = false;
         inc = frac_lsbm1;
         break;
     case float_round_to_zero:
@@ -199,6 +198,8 @@ static void partsN(uncanon)(FloatPartsN *p, float_status *s,
         break;
     case float_round_to_odd:
         overflow_norm = true;
+        /* fall through */
+    case float_round_to_odd_inf:
         inc = p->frac_lo & frac_lsb ? 0 : round_mask;
         break;
     default:
@@ -259,6 +260,7 @@ static void partsN(uncanon)(FloatPartsN *p, float_status *s,
                        ? frac_lsbm1 : 0);
                 break;
             case float_round_to_odd:
+            case float_round_to_odd_inf:
                 inc = p->frac_lo & frac_lsb ? 0 : round_mask;
                 break;
             default:
-- 
2.20.1


