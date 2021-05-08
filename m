Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB23376EDA
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:35:59 +0200 (CEST)
Received: from localhost ([::1]:60798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCow-0007jR-4r
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8J-0003WI-Aq
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:56 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:45653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8D-0005a3-EJ
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:55 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so6554457pjb.4
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xRrqi4bmOzILqgbF3ktlxWwTxarrZ6yzbdF4Z3f3EcY=;
 b=R0VdEcuYvGSwPmn4ZC+beqk+4LmEWBbCcCQReNSHiCKyVIJ4bea5KwfgXo7L1bmrho
 pBpG5rvvQFm+8uXmtIjaEmrXx7NWdEYOAYnDweVszNq+lVA5DS8SHLqfdopRXZ8rcglX
 /Y6nmlyYGznv+CLKoFXgcIeN6MJmSzAwX33BtEojRJK9O+nxDlqn2vxfpbH+dX9/PTaR
 xA9Hst/ov7fYdCw4Ii5p6+St5a+CgW3dLepWGOx3DEz9vHKKm69+Zy+hikH8NphXbFy4
 +YUlgm93ttRUt/HkJzPxXa5Ot10PacUOmWO3QaTxHMxinV2m3OeKy7Sfed8Jg6RSk5ir
 yxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xRrqi4bmOzILqgbF3ktlxWwTxarrZ6yzbdF4Z3f3EcY=;
 b=WGBWVT2GL5X2yYX+EjsOQGbhhknPEYUnQJQX4nR/Mn8ji/Y09786eZ+4M94jEMmFs+
 KHKZYzxsd45cHmJRlHFA8+BtgFMAXKKEDDR1MDa1M5RfZVQefaKD5gBsHH1Xg3eePxyg
 17plQ4tQDCeuX2YgwozG2WuB8UhZzwUnQMjOOEPjk7jmCBrw3+rvkMbBB+1R8SDcwrxY
 g560GInACK64Xoz+4W93dNkZ7T4HOYwZpLUhAOhgLxulCNWo+fJbcBCHkifTJHQ8SGMc
 +mQc77Jt5Vamx4pGqioSmec1jZ8AqU5Ug4E6I3uz3ZjI3p/NaxnlXpiaL8lzbEU/XB65
 V5fw==
X-Gm-Message-State: AOAM5335DDwJeAK5HOjosH5FU08mCIueAqztB/S/bgD/7BD8iOlXZJiO
 zf09fWDL+Cv64WrBaP7cGtkk/g9EEOA6zQ==
X-Google-Smtp-Source: ABdhPJwXqlgVi7cmOXW0vlZ1l0+/MWgOWFEOkPdBGEZShnJOHON+f0YCJKojW/ljdXx8Z9uBpD2SrQ==
X-Received: by 2002:a17:90a:950c:: with SMTP id
 t12mr26393204pjo.135.1620438707794; 
 Fri, 07 May 2021 18:51:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 68/72] softfloat: Convert floatx80_scalbn to FloatParts
Date: Fri,  7 May 2021 18:47:58 -0700
Message-Id: <20210508014802.892561-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
index 9f28c5c058..81ff563dc0 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3913,6 +3913,17 @@ float128 float128_scalbn(float128 a, int n, float_status *status)
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
@@ -5747,45 +5758,6 @@ FloatRelation floatx80_compare_quiet(floatx80 a, floatx80 b,
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


