Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A8139AD40
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:54:49 +0200 (CEST)
Received: from localhost ([::1]:43896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lovIe-0005DX-I7
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov6G-0002w7-PQ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:42:00 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:41935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov65-0001A1-GA
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:42:00 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso4725539pji.0
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yd4dLoXzc3PD/+c2UeVfTupk0478G5r8aHb9S8Vv7U0=;
 b=VOBzVp+d9NYSWRstBYsOl3BRTKMl8Mh5bkXe9gZH8VAg6dAPYLOjKol/tgt6T8Q2W8
 gMufoTuZLiH2NlwbGTIji/9EHaMJdkhl7PwvW6UfXUsCbyDJI/fpb0Cphpd7mPyp7Azw
 VwJa3KynxdlIFNdrqL/WM3gre4MFtnVvljF/X4I82zy3OyccBjx+/TCxr57jEJNDlCpL
 2gpyg0MQtlLzRKYBF7xLy8BoGkpzuV2/KRNBQkqFM5MHjdZtukx96PEgmm58RrItQRJm
 zkIC2975eEkuObacqN6SnpJ0T48cd6MIH7DInOuefe9KgQ8RMwZUN8Ef1O9XBP2ZKvC1
 4Lpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yd4dLoXzc3PD/+c2UeVfTupk0478G5r8aHb9S8Vv7U0=;
 b=XAqVR7m4K1vITlZ7TnyXJjMkpT6+5cvQiav0glqOB2pq5ULK40wgUum6OKIJlQX9Hy
 rHXy9TbbgxuPVBVXMGFCloSA40na5t8ircg+y6M2nss5gOOWf+oliSKJXQAqe69r9vwE
 vC7qKEsBEe1IzQnVFXCxiocB6ffR1Z6MY/LJsoSTQHmkbXWqEg71TCHqMFKI1XTu9G8p
 sgaD+doWOpcodQWtwIoHWhEc+4l9cixNK4fnA8+rYrozYMaIwAewFjL3WxJOkWOqE5t1
 48Ae52lONtHW0ML8QbmBMOwP7DJhycVIyo+AGttEA3/nhRsxWEcVhEwmuF8XP0zdN/qu
 9ruw==
X-Gm-Message-State: AOAM533Zt/HquJfwAg0m7TiheYxVWftkih4TrJt4Y3+ZJVF2t+Jr5/4+
 c18SMrsXhPNZRazm4gcqfefsHSNbTrkG8w==
X-Google-Smtp-Source: ABdhPJxffu3kZmgSiRscWmPCZnlEuJ+q71Ukazk9lIQATwblqKQlwBb9agNkdBfP+LwQmwOI6+5New==
X-Received: by 2002:a17:90a:6285:: with SMTP id
 d5mr13892385pjj.4.1622756507861; 
 Thu, 03 Jun 2021 14:41:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/29] softfloat: Convert floatx80_scalbn to FloatParts
Date: Thu,  3 Jun 2021 14:41:25 -0700
Message-Id: <20210603214131.629841-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
 fpu/softfloat.c | 50 +++++++++++--------------------------------------
 1 file changed, 11 insertions(+), 39 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 5a2a872408..770badd447 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3911,6 +3911,17 @@ float128 float128_scalbn(float128 a, int n, float_status *status)
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
@@ -5745,45 +5756,6 @@ FloatRelation floatx80_compare_quiet(floatx80 a, floatx80 b,
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


