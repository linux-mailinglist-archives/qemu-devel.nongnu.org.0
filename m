Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CE03906C9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:40:29 +0200 (CEST)
Received: from localhost ([::1]:34234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lla6W-0003Gs-Ai
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeh-0001zs-9q
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:39 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:36532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeQ-0006kx-WC
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:38 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 27so21669979pgy.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2avWxXahubZ/o5oT70KgFRqpsBXSFNH/Xke7KM6cuMA=;
 b=Em9r4PRlDFRSDkqXeXPAwGjl2ne5ZDxYhGOCvwdesdsoZLz40VrS4/qpMTaTR7D28T
 zvb5x/UmhiUdxmJW/tD6Lmy4to6NLI7FJz2e6aYagZTj5zvWESzG/om2aR2BxWFMwr7A
 VLZMIue2VNiVGFklFwkTr3+TLW9SbEMBGRsGtJnGS4qLR2gDKkQZ4VZHYag01rJM5mJh
 UxOsx9ql05D+PIMbQH5BDVvG0O9uSIjycSqWrjjojfS/o5nVFVVwyyHmGeaWlBXlkcPa
 yKztmPls4bApMkNmNu5uhVDQvSZTIhL6TDsWaSDkRrVd3K76uwcSaxXL4ufEDILpg7Y8
 j0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2avWxXahubZ/o5oT70KgFRqpsBXSFNH/Xke7KM6cuMA=;
 b=KiFF3KTqGepo1nhr7YkrHvCaJaXfnvO4RR6krMJS9EgyhMA1zrXcbTinnCtx2nIG67
 s5VKkpqGu49XGTWszStU9/yFjEGzdwmESd7GPvt7YEYmBOuMTLAYA3J112Vt/aLsTtUI
 UDwL2t2heCdrP47izOOEYir/4Zo25NhLU6VSe4F9s2ot1X4qNElMyHrtjoC4Enea68NX
 NrCwt9P40apccDFsz7OgILQqH89MhMedokf993bDvBR3rE7mKKs/7O/5f7DjZHPFEo3p
 OGROTnbbw/V6wugL+L1Ai5rYoQ1uxa4n+obdgf/fa4kXKTqIli0ZeLdGn44d8LJyEbIQ
 pysQ==
X-Gm-Message-State: AOAM532ebBJ8Z1uqZdPTo9US9OG3F1fGm9vVYrw4YgkE9O23J5Fqba6m
 9x8G8GS5HkIHqzCwlkTN6D4OeO/tLKSQWQ==
X-Google-Smtp-Source: ABdhPJy6cDtWCdcIjYLiaV0WwekLMiP5sU8q004PI1LiOzJ0Mzdv5Z0RxYw6ZJxOLpN+c1zqi6n4sA==
X-Received: by 2002:a63:1953:: with SMTP id 19mr19377649pgz.273.1621955241568; 
 Tue, 25 May 2021 08:07:21 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id z19sm2231943pjq.11.2021.05.25.08.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/28] softfloat: Convert floatx80_scalbn to FloatParts
Date: Tue, 25 May 2021 08:07:00 -0700
Message-Id: <20210525150706.294968-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525150706.294968-1-richard.henderson@linaro.org>
References: <20210525150706.294968-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
 fpu/softfloat.c | 50 +++++++++++--------------------------------------
 1 file changed, 11 insertions(+), 39 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 52a9aa1837..0d1d9df70d 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3914,6 +3914,17 @@ float128 float128_scalbn(float128 a, int n, float_status *status)
     return float128_round_pack_canonical(&p, status);
 }
 
+floatx80 floatx80_scalbn(floatx80 a, int n, float_status *status)
+{
+    FloatParts128 p;
+
+    if (!floatx80_unpack_canonical(&p, a, status)) {
+        return floatx80_default_nan(status);
+    }
+    parts_scalbn(&p, n, status);
+    return floatx80_round_pack_canonical(&p, status);
+}
+
 /*
  * Square Root
  */
@@ -5748,45 +5759,6 @@ FloatRelation floatx80_compare_quiet(floatx80 a, floatx80 b,
     return floatx80_compare_internal(a, b, 1, status);
 }
 
-floatx80 floatx80_scalbn(floatx80 a, int n, float_status *status)
-{
-    bool aSign;
-    int32_t aExp;
-    uint64_t aSig;
-
-    if (floatx80_invalid_encoding(a)) {
-        float_raise(float_flag_invalid, status);
-        return floatx80_default_nan(status);
-    }
-    aSig = extractFloatx80Frac( a );
-    aExp = extractFloatx80Exp( a );
-    aSign = extractFloatx80Sign( a );
-
-    if ( aExp == 0x7FFF ) {
-        if ( aSig<<1 ) {
-            return propagateFloatx80NaN(a, a, status);
-        }
-        return a;
-    }
-
-    if (aExp == 0) {
-        if (aSig == 0) {
-            return a;
-        }
-        aExp++;
-    }
-
-    if (n > 0x10000) {
-        n = 0x10000;
-    } else if (n < -0x10000) {
-        n = -0x10000;
-    }
-
-    aExp += n;
-    return normalizeRoundAndPackFloatx80(status->floatx80_rounding_precision,
-                                         aSign, aExp, aSig, 0, status);
-}
-
 static void __attribute__((constructor)) softfloat_init(void)
 {
     union_float64 ua, ub, uc, ur;
-- 
2.25.1


