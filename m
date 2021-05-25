Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC2039065F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:15:13 +0200 (CEST)
Received: from localhost ([::1]:44634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZhy-00022k-TB
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeb-0001vf-0h
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:33 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:40496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeP-0006iw-M1
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:32 -0400
Received: by mail-pf1-x42d.google.com with SMTP id x188so23833633pfd.7
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eShFDpUU2i7h7h2qJCMIyadlLFYSgvTlWNlSA4tKpjQ=;
 b=JD4frM17eA0L6XmHj72nPg82VKQiJe8SOtDPh8Ai3hy+3d+99PiAu2FnbCIOqdEoks
 4hZOhBpKeW81ZjYVStZ0MoZAy9ibhF4+AoCxqmP0V4Ao0+ZJ52C+xP27U1x0SmbhTMiV
 n4GqiUMaCI4tNrsm57NwL1puj8qJ0KXlRu0f4wDPLKVBhBmBRtkBWuH2ibPxvhgANyEL
 aq5qtkCHDpFH0yZXA+/mJORs/Gs4LizbQkbz7VOER7jYGsCyfnV1M+DauQu0Sp2utQOp
 f3+yxvUWvU0dLnVYCGhzxcrIX8ZRy2qvnLhqmC2fS/iVbFY8bOV78QLf8tiuUkScyFSl
 +YUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eShFDpUU2i7h7h2qJCMIyadlLFYSgvTlWNlSA4tKpjQ=;
 b=H8udtCFSTIUAHX7C9OeSj1lhJUu9iDr3Tb2vJpKU+sMPjYxFgY2b0CjkdWvuIT9gxC
 JEbCL3iIhEj87QDC65IPNiXy/dnZoiez9QYu0SUJ8KgFxKSZBK7cfvvTI1oxZkZ6ZoB2
 FcKgf+A4EAnLe3mAZLyvwi/3goi7SE9b2X5i1w+spPWplg1FJ5bNy92RhfACmEdjIIwm
 2DPSP9LxcYVwOJOYZoD59ZGg57H3uGkaR5dSS5VyhOXuIhcM4E/ZZb4sfR2kWJxLjT78
 DKTh7mg8rGm9u8UgUvkv2XjlyfI/klk8W+I2oebeBpkaqyNmAd/0dhNj+xbo+TOROEUe
 7qxA==
X-Gm-Message-State: AOAM532lfd2CHTosFidld6PtlLmLFrR0oWpDkJqMmUV/f5zy1HVs/93G
 20P1c3b9vm2aZgYEHUh369jqC6vxf1q7YA==
X-Google-Smtp-Source: ABdhPJwtuF4aPsILG0UhMxuAdIfjp4DoDPmRJ2rrGENAbH5bj+g7/lXkGXvr6vYtPx/0FX6FZ0+hgg==
X-Received: by 2002:a63:1559:: with SMTP id 25mr16141721pgv.384.1621955238532; 
 Tue, 25 May 2021 08:07:18 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id z19sm2231943pjq.11.2021.05.25.08.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/28] softfloat: Convert floatx80_round to FloatParts
Date: Tue, 25 May 2021 08:06:55 -0700
Message-Id: <20210525150706.294968-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525150706.294968-1-richard.henderson@linaro.org>
References: <20210525150706.294968-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index d7beb27982..1f7260caec 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -5795,10 +5795,12 @@ float128 floatx80_to_float128(floatx80 a, float_status *status)
 
 floatx80 floatx80_round(floatx80 a, float_status *status)
 {
-    return roundAndPackFloatx80(status->floatx80_rounding_precision,
-                                extractFloatx80Sign(a),
-                                extractFloatx80Exp(a),
-                                extractFloatx80Frac(a), 0, status);
+    FloatParts128 p;
+
+    if (!floatx80_unpack_canonical(&p, a, status)) {
+        return floatx80_default_nan(status);
+    }
+    return floatx80_round_pack_canonical(&p, status);
 }
 
 /*----------------------------------------------------------------------------
-- 
2.25.1


