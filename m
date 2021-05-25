Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF51390CA9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 01:03:05 +0200 (CEST)
Received: from localhost ([::1]:41446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llg4m-00041x-ES
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 19:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0T-0002gD-Dd
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:37 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:43798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0F-0004oR-4M
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:37 -0400
Received: by mail-pf1-x429.google.com with SMTP id d78so23904593pfd.10
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 15:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=inUd/h721Ne/1vYYmFZwK9UzqSXV6+upNZJZePrYay4=;
 b=kL1vkKxmskvj6qxDLY8hIJ4NVkoE5oaGfjbkYvLOufs7Thtk8meRcnifD9J0Iwcc8w
 nrhL8OPEnLrHYW4JXj12TaKF3LQlCpDFjpk19HbleG6cyx3WwZTCc/0BgsDaK8zpW9rW
 FqWenm6jLPDerA8czIVjTk94szmN8pi6ZjDNPrrT5UlGtn1Yw0Jqvjkh7Hz2C9sewiSL
 1l1osvFEQ9+FS4vx2fYxJzw7QZ0ItEp7E6xj+SH3LmdfyuWd5+AFzikss1q1Vff30438
 pcGS9UNtU0uxv+EKt26dHLojff+8z78fVybOp0pm3YJETUxAIRiRcc/a5SMgc9ww1RxA
 Tw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=inUd/h721Ne/1vYYmFZwK9UzqSXV6+upNZJZePrYay4=;
 b=OnE8aipQCwk4PR8Pnrb8Viy8bt28a1Dr0apGb5gir2gX7HwAo89xrfYRpozgmCsLqi
 tl7SJn3CN+5RJkx3BjbqtqX+iNTyitIfplMU2jDeDG6Z6l4WC0nSGsOGnCXk40p1TTh4
 0oWpGNFbud5OLTGurshjAxMr+rhTv9k7BWiY1TmNgWOixnXFBIrxX1ZplEP6oy0iIqX8
 rtxYgXv6pNaaiVjyvyXOyorFzH9w5wIQSYOSN6BL43CDH+ZvDcqBvfbUEwA0sqlY/o1r
 TObrLcsWPFKbUMpojSwEBDTYj01WCT451/+Awkfx5di0bvdPx7jN4Sy2R2XeXUJElUT3
 c+bw==
X-Gm-Message-State: AOAM532obiWHACSTeUGAGN0t0/fvn25rCrxzLVDbEBQ4hSu89LFaFcCw
 9yLBHSJkENo/9cO19Hj1wPIBII71PXZE4w==
X-Google-Smtp-Source: ABdhPJwFfIykPwZf/JlIChQFe3tqGtkIRQecHD5MsrcZQ18ISCwtP+bvyARRM60I8gm0phQvyJNfQg==
X-Received: by 2002:a05:6a00:cd4:b029:2e1:b937:77e8 with SMTP id
 b20-20020a056a000cd4b02902e1b93777e8mr31316925pfv.43.1621983501679; 
 Tue, 25 May 2021 15:58:21 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id l6sm1669928pjf.28.2021.05.25.15.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 15:58:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/12] softfpu: Add float_round_to_odd_inf
Date: Tue, 25 May 2021 15:58:10 -0700
Message-Id: <20210525225817.400336-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525225817.400336-1-richard.henderson@linaro.org>
References: <20210525225817.400336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For Arm BFDOT and BFMMLA, we need a version of round-to-odd
that overflows to infinity, instead of the max normal number.

Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-types.h | 4 +++-
 fpu/softfloat-parts.c.inc     | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

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
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index a897a5a743..7f69da1d8f 100644
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
2.25.1


