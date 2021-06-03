Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF6739AD51
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:57:14 +0200 (CEST)
Received: from localhost ([::1]:53034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lovKz-0002vi-Aw
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov6I-00031Q-0E
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:42:02 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:51717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov68-0001BK-SU
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:42:01 -0400
Received: by mail-pj1-x1032.google.com with SMTP id k5so4450753pjj.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ori3kQInJnhP2zXvcphOploFKdQaCYd2KPPI3jAHsoY=;
 b=boTVXF1OxYGm20ZWUQdw9ZBqE2YGnoJKqBela9vUfdP4AYOsE9cY88A5iCOH3Fnk2M
 jWbQILkygqIMezBp+y5BSlIOT/11JUrd9Ureos/H1mAodpYk6CRctGsgVb6pLK6lGmgk
 2Cy7bnaEKAwqWsXDKpsQdh2SSNS3Vk3ll/CYE6rcKFZtP20EYBJPIPQ/Of+smOzzPpsD
 g++gC6JTD79V2cXM8Fmf39Di4sGfwioFZGyu8fHBaZcE9koC+t+3l3AwcN58hF12s9qE
 5A1L1FYjrpFsL0QlJ76OdbW6oQcXA5gewI6BnljBP6aTLjfcsaW40m6AFM/GFhIJJ5/q
 WsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ori3kQInJnhP2zXvcphOploFKdQaCYd2KPPI3jAHsoY=;
 b=JcdkqNKDs3iyAe3LK7dryiSE+tRCw683MWakRw/MRHSbxzQSjZ7sj2Zvhcjq8rZLRl
 KkPwOcQ8Sw0162ylDT7s7BTs3X1zaL6XhujwVesJ76nWyfG3Sce2KIKT+iYvH/YE4+CI
 6yzuCE+eX4KNb+FdTMt2XzD1Cj54xj7IAkzYLYnlspeYK/eBDb66F04Fomhsx3VgiCS8
 Iau0osdBshx8P8+TkvU1hPjRXw/7wlUz3U6182Va4cwRBotUdVcOrjYvEudVcP9GNv6R
 KjbcTtdVP9IWItbVtbswIc+9/rOAf42XNKYZm5TT3sy3q7WvORpZor2c+JJxKWgTvVeU
 PX1g==
X-Gm-Message-State: AOAM532X7ik+5TEE1PUrLbdq6giudb0e2ZewHxX5OSmOdG4DfgTkQXpf
 ZcsoICeapHKiRujgrJaWq2YItnqyJSmMaw==
X-Google-Smtp-Source: ABdhPJwP0jiS65FvNqN3nklSu9UEclf5lNONEo4sEynz1e3LINbd2gcfoXXLBhukbYqQAyirw/EdbQ==
X-Received: by 2002:a17:90a:b885:: with SMTP id
 o5mr13366707pjr.91.1622756511533; 
 Thu, 03 Jun 2021 14:41:51 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/29] softfloat: Use hard-float for {u}int64_to_float{32,64}
Date: Thu,  3 Jun 2021 14:41:31 -0700
Message-Id: <20210603214131.629841-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

For the normal case of no additional scaling, this reduces the
profile contribution of int64_to_float64 to the testcase in the
linked issue from 0.81% to 0.04%.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/134
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 5026f518b0..1cb162882b 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3559,6 +3559,13 @@ float32 int64_to_float32_scalbn(int64_t a, int scale, float_status *status)
 {
     FloatParts64 p;
 
+    /* Without scaling, there are no overflow concerns. */
+    if (likely(scale == 0) && can_use_fpu(status)) {
+        union_float32 ur;
+        ur.h = a;
+        return ur.s;
+    }
+
     parts64_sint_to_float(&p, a, scale, status);
     return float32_round_pack_canonical(&p, status);
 }
@@ -3592,6 +3599,13 @@ float64 int64_to_float64_scalbn(int64_t a, int scale, float_status *status)
 {
     FloatParts64 p;
 
+    /* Without scaling, there are no overflow concerns. */
+    if (likely(scale == 0) && can_use_fpu(status)) {
+        union_float64 ur;
+        ur.h = a;
+        return ur.s;
+    }
+
     parts_sint_to_float(&p, a, scale, status);
     return float64_round_pack_canonical(&p, status);
 }
@@ -3726,6 +3740,13 @@ float32 uint64_to_float32_scalbn(uint64_t a, int scale, float_status *status)
 {
     FloatParts64 p;
 
+    /* Without scaling, there are no overflow concerns. */
+    if (likely(scale == 0) && can_use_fpu(status)) {
+        union_float32 ur;
+        ur.h = a;
+        return ur.s;
+    }
+
     parts_uint_to_float(&p, a, scale, status);
     return float32_round_pack_canonical(&p, status);
 }
@@ -3759,6 +3780,13 @@ float64 uint64_to_float64_scalbn(uint64_t a, int scale, float_status *status)
 {
     FloatParts64 p;
 
+    /* Without scaling, there are no overflow concerns. */
+    if (likely(scale == 0) && can_use_fpu(status)) {
+        union_float64 ur;
+        ur.h = a;
+        return ur.s;
+    }
+
     parts_uint_to_float(&p, a, scale, status);
     return float64_round_pack_canonical(&p, status);
 }
-- 
2.25.1


