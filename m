Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B94C9509297
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:20:50 +0200 (CEST)
Received: from localhost ([::1]:39616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhIgr-00037z-I6
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIdt-0000Gx-Ra; Wed, 20 Apr 2022 18:17:45 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:40863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIds-00069R-96; Wed, 20 Apr 2022 18:17:45 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so3507072fac.7; 
 Wed, 20 Apr 2022 15:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uLEows8ElpUPEu0Dp5/Ve6fXJtHn/egXZspKjLI5Trc=;
 b=h4ntE4vl/E3/jkqVPmEYw4paG+GDstbkzEGRc2Ih107sbIA1ofD3mo7/3D6yBAxVZf
 DQ4Ps6ODvkxt1ldAnMddONxBaIUw/laurBBKffSfTOwWimjbqEUjnmstooNkwWx+NAAD
 PaLsKgNUeSZ2YN5NWDtobYmBVP5Yh4Ya9/+CcIrwfIxdwQmlWM4mNkbR1hxeg0idDHDQ
 EP8CxMC24qrDuUI+NXjqUBmUp2TCB9Ds3y+Bh+QhLn9hkyOLEHy21JAfjiqRkP0wqAOH
 ah+Na8iGTZLe9Z4YS9222PbtQ+u1ai7Z6BeDl9+ayul5e5MZCXJJF4QUisJIkN09HFmG
 fohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uLEows8ElpUPEu0Dp5/Ve6fXJtHn/egXZspKjLI5Trc=;
 b=o/slDFWgRtL5XBlXAEbJpEd/w9w2DuoOLXhCsYJNX82xmEb8e9+qrz6OSUfmHIZaqN
 XSGkEvwbeSSE86gFD9qhiiWQNn4Bd8yGC/3F1xL/kddudvy27L3OMt9Hpr6iB83yPIbD
 7M5wpEMM6A0Atps68ejuqwOuTdeZPz7e6C5NB3yu0y/A2cmJ+HNQP+aQV7+d3kuP31Ch
 h1ErHgP+Nt6slKuM4tiNMO0HBT6F4U8IQjLBeBzXEVrKQT7SCIzku4QzykGMjCQdTaSh
 SD08RI4M8PHhsYLR/IemmMU+IX1qB6EJuQkdVlb70RjqujyTkuaItW8e5fG9ZQbyMenV
 KQiw==
X-Gm-Message-State: AOAM531sGotzTZor/gW5CNVXE8mntwSfYJuvEa1sInRmpJbEvpiQnvWa
 CRL+dc1VpgWeg1MlqSNVM60STFHNGTc=
X-Google-Smtp-Source: ABdhPJzu5Pr7+duRxPtaXudjqONtLx5s9RFHbErXgSIwwr3VSMw5ew4J0gsABQNYeJWA5gQZUjWIYA==
X-Received: by 2002:a05:6870:438d:b0:e6:6665:3180 with SMTP id
 r13-20020a056870438d00b000e666653180mr813302oah.81.1650493062372; 
 Wed, 20 Apr 2022 15:17:42 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:17:42 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/23] softfloat: add uint128_to_float128
Date: Wed, 20 Apr 2022 19:13:18 -0300
Message-Id: <20220420221329.169755-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 danielhb413@gmail.com, qemu-ppc@nongnu.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Based on parts_uint_to_float, implements uint128_to_float128 to convert
an unsigned 128-bit value received through an Int128 argument.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220330175932.6995-4-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 fpu/softfloat.c         | 25 +++++++++++++++++++++++++
 include/fpu/softfloat.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 7f524d4377..57445b36e7 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3969,6 +3969,31 @@ float128 uint64_to_float128(uint64_t a, float_status *status)
     return float128_round_pack_canonical(&p, status);
 }
 
+float128 uint128_to_float128(Int128 a, float_status *status)
+{
+    FloatParts128 p = { };
+    int shift;
+
+    if (int128_nz(a)) {
+        p.cls = float_class_normal;
+
+        shift = clz64(int128_gethi(a));
+        if (shift == 64) {
+            shift += clz64(int128_getlo(a));
+        }
+
+        p.exp = 127 - shift;
+        a = int128_lshift(a, shift);
+
+        p.frac_hi = int128_gethi(a);
+        p.frac_lo = int128_getlo(a);
+    } else {
+        p.cls = float_class_zero;
+    }
+
+    return float128_round_pack_canonical(&p, status);
+}
+
 /*
  * Minimum and maximum
  */
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index d34b2c44d2..8e026e5610 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -95,6 +95,7 @@ typedef enum {
 
 #include "fpu/softfloat-types.h"
 #include "fpu/softfloat-helpers.h"
+#include "qemu/int128.h"
 
 /*----------------------------------------------------------------------------
 | Routine to raise any or all of the software IEC/IEEE floating-point
@@ -183,6 +184,7 @@ floatx80 int64_to_floatx80(int64_t, float_status *status);
 float128 int32_to_float128(int32_t, float_status *status);
 float128 int64_to_float128(int64_t, float_status *status);
 float128 uint64_to_float128(uint64_t, float_status *status);
+float128 uint128_to_float128(Int128, float_status *status);
 
 /*----------------------------------------------------------------------------
 | Software half-precision conversion routines.
-- 
2.35.1


