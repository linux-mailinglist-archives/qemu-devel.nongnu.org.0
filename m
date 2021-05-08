Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFB1376ED1
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:33:19 +0200 (CEST)
Received: from localhost ([::1]:51974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCmM-0001t7-BF
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8I-0003VH-NV
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:55 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:42837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8B-0005Zl-Jy
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:53 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so6549244pjv.1
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j0n+VHMEDjMKtgDcOQxDeJHVUUgoF67rvW1U9FdzS+U=;
 b=pYXZ4IdrMGqt3aSziGerRLzFWs/EfXAH5BATiLiNcsOB+JAdtmOZEbD585de7itdjf
 XdkxZM2Z2k4D+fkHrSNwva6D0N0N4ZbCDIUw/poCW3/9QET5ojznHR0VDrTbRDML1J32
 lQfDVSEnr/Ye6bGTXp2kr1ogf9RK5KljE1FlT6xeMRHBuwDRVCyyjJ6uY9mYiH6Ylzsb
 okO26VP/6dERdhH8i09PVf51dT1jZm7UujiJXxR+/6jESA7//U/XsjAJAJBZk7+GeRUW
 rHGzmEz5thb1pvYGSV3Zmm7KFO0747tE4UMwREDZdFeDZ1IlQqiabeJFpOTealWH2eFA
 RRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j0n+VHMEDjMKtgDcOQxDeJHVUUgoF67rvW1U9FdzS+U=;
 b=fGZwim5aUac0MTIXPz96MLhgk1ibtxSBXexbPxnEXbbhrHs9u7SfZLpb+KXZWDGeAf
 Ryt3cpSdT3RX4TKIaFHoeXkwwyBndmKHDXAItZUMus3DnSSMaHRb1TzSzh6m8TxIDrkk
 GBtyY5VKTaXoiu0kgDQFAlEDPDWM8Pf4/TybxlZJnShl8gBfvAYyxVMr7VAbNYaETESB
 oj4X+rSfF48JFNtzvFxVFYDQ5W+paQKyw4EqmRdLF7tu75bRYqfNF69jiAbcldY7Egp8
 xUI7LvJvMA0SwptaD7WKChDa4T3wHRvvBLEDn8NKFiC0Y1OK+NNIlL1+vSiIR9GGkDnn
 27rw==
X-Gm-Message-State: AOAM532YslYT8FtwyP+yGn3Wq0977s9AtaHWFLLvqx6SGWU2kQxgSKpW
 VkkEfIds/ZIl/+0FldfUBAoNypoZCW2olQ==
X-Google-Smtp-Source: ABdhPJx7FQyCmrNe1XaL7vIo1a88tzP66fj7Ae2drZoiMzmNs/gA6tPGYDfbzGWK30753RjvwpcsYg==
X-Received: by 2002:a17:90a:be10:: with SMTP id
 a16mr25054610pjs.112.1620438705955; 
 Fri, 07 May 2021 18:51:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 65/72] softfloat: Convert integer to floatx80 to FloatParts
Date: Fri,  7 May 2021 18:47:55 -0700
Message-Id: <20210508014802.892561-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
 fpu/softfloat.c | 58 +++++++++++--------------------------------------
 1 file changed, 13 insertions(+), 45 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 914cf2688c..82f71896ac 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3344,6 +3344,19 @@ float128 int32_to_float128(int32_t a, float_status *status)
     return int64_to_float128(a, status);
 }
 
+floatx80 int64_to_floatx80(int64_t a, float_status *status)
+{
+    FloatParts128 p;
+
+    parts_sint_to_float(&p, a, 0, status);
+    return floatx80_round_pack_canonical(&p, status);
+}
+
+floatx80 int32_to_floatx80(int32_t a, float_status *status)
+{
+    return int64_to_floatx80(a, status);
+}
+
 /*
  * Unsigned Integer to floating-point conversions
  */
@@ -5035,51 +5048,6 @@ static float128 normalizeRoundAndPackFloat128(bool zSign, int32_t zExp,
 
 }
 
-
-/*----------------------------------------------------------------------------
-| Returns the result of converting the 32-bit two's complement integer `a'
-| to the extended double-precision floating-point format.  The conversion
-| is performed according to the IEC/IEEE Standard for Binary Floating-Point
-| Arithmetic.
-*----------------------------------------------------------------------------*/
-
-floatx80 int32_to_floatx80(int32_t a, float_status *status)
-{
-    bool zSign;
-    uint32_t absA;
-    int8_t shiftCount;
-    uint64_t zSig;
-
-    if ( a == 0 ) return packFloatx80( 0, 0, 0 );
-    zSign = ( a < 0 );
-    absA = zSign ? - a : a;
-    shiftCount = clz32(absA) + 32;
-    zSig = absA;
-    return packFloatx80( zSign, 0x403E - shiftCount, zSig<<shiftCount );
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of converting the 64-bit two's complement integer `a'
-| to the extended double-precision floating-point format.  The conversion
-| is performed according to the IEC/IEEE Standard for Binary Floating-Point
-| Arithmetic.
-*----------------------------------------------------------------------------*/
-
-floatx80 int64_to_floatx80(int64_t a, float_status *status)
-{
-    bool zSign;
-    uint64_t absA;
-    int8_t shiftCount;
-
-    if ( a == 0 ) return packFloatx80( 0, 0, 0 );
-    zSign = ( a < 0 );
-    absA = zSign ? - a : a;
-    shiftCount = clz64(absA);
-    return packFloatx80( zSign, 0x403E - shiftCount, absA<<shiftCount );
-
-}
-
 /*----------------------------------------------------------------------------
 | Returns the result of converting the single-precision floating-point value
 | `a' to the extended double-precision floating-point format.  The conversion
-- 
2.25.1


