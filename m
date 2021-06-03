Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982B039AD20
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:48:05 +0200 (CEST)
Received: from localhost ([::1]:41602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lovC8-0001je-HV
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov67-0002Xq-Ey
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:51 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:40745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov62-00019F-0m
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:51 -0400
Received: by mail-pg1-x533.google.com with SMTP id j12so6159930pgh.7
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xiaeGJWLl6eo+VnxnfAKjpi1RICpcWro/dd/W10uCac=;
 b=SkOxuTcJFwIo33ri2Ti2wRBTizyCiXTNfoBj+UmEySa9YiitHYXbtDr6y+YSUNBjja
 ssEH/DjqRHZl77xBzubgnPGP7e16lTMUmhq/aZY90hM5ZBaaxt+zgVK29I01CcobfLBT
 QxsMrGpHpUVZs6U8b3e9sT7uWHn1r6hvWMGViFyZwJWejkVnr2Q1roqQ50HUPrza3dDR
 NpAgTAdY8AQJwlcM8DYSTs/RzYK4EGv0q4xded1qevTeA/lhr7CbinzkRJe3DQqj0ues
 6GN6KIf9+tjgVMXI/XGVJu18/ZVEjzq3Knlk//Y2NSStZ2qMUxDT4W7334UtQPWSVpHJ
 ACYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xiaeGJWLl6eo+VnxnfAKjpi1RICpcWro/dd/W10uCac=;
 b=RvsRhikAu4iFCFM724ovjZxzHllhB8r/r+OlcBS3g2yLFyEYFIOrKSorp4qvOcCJj1
 orlNuwwHwFMxBnpTZI4ro5Go6NxiluhTm9vx6rhPdeHv9VCtoxtuJVNK1SGUkxYD3wYg
 1pJIbG2QB1ajnJZI7Oa5UsG0e8Ov6Vu+2Jk00ofNi3aNx9sPOLCuzC2JE6RSrrhxzU+M
 yorbCg/2lj7GuT8bYMWEW6GJ0oJzADx3DsD5t7/pjyeqNQgl8BTnK7lw8tlp9gvuxhz5
 6yrnx7fBJI/cQ0x0+2JweGXjZbaqP4Wux3yJOZ/v7ZFnnXlL7z4jY6nkVMH8dyLSqhKv
 nMWw==
X-Gm-Message-State: AOAM533/Zh9IDeu7Wts5gmsHwjl8cBd0oiFQCvkaajOpQHNDXxsUwLnj
 4w0Fx790iaZQ86Qk6dWJZEjYPaAapVqWqA==
X-Google-Smtp-Source: ABdhPJz2ZqIqmIojysHNs4aR37Zz0MAFQELGxQhI9sWndScQtjNZ6lNn4l9F1bXJdYBt94dsUhUwkQ==
X-Received: by 2002:a63:2dc4:: with SMTP id t187mr1537722pgt.80.1622756504356; 
 Thu, 03 Jun 2021 14:41:44 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/29] softfloat: Convert floatx80_round to FloatParts
Date: Thu,  3 Jun 2021 14:41:20 -0700
Message-Id: <20210603214131.629841-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 5a320e5302..74787d5a6e 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -5792,10 +5792,12 @@ float128 floatx80_to_float128(floatx80 a, float_status *status)
 
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


