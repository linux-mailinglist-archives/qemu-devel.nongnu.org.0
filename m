Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FA939066D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:17:50 +0200 (CEST)
Received: from localhost ([::1]:53488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZkb-0008Oe-HF
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYen-0002Fc-DI
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:45 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:40498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeW-0006nR-Gh
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:45 -0400
Received: by mail-pf1-x42e.google.com with SMTP id x188so23833956pfd.7
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jPESxkdne1pl9qKkpnJVzbPwFkDrkEve1zwqkORGLuk=;
 b=NrGyYqhvhZuyBq9Zo6J0tCtHCQFS5Dic6ht7OBRcJpUL99xtoCLqUw+nf6qYU3/EiA
 AFP4Yr8iNVTAoEn5J4jEeEArpqakV69lObkYY6tE/hWD+6Vl0Qc+hfA2KEghP4R64r3L
 uoCze7IGdYVFmpShAO6IAUzCElRAQvJl6V/6xJ+f9fQLRb5fPDj43oHjriUYrkqDnrdS
 qgAWzLYrAZW/16yd9BWmwVKz95LNiBIU8Bjm4fqMgtBczjk64OGgbMECOSo8q3IjDJqJ
 ovImFwKwg7Cn4RxzIQ85RTwIkaWRRjOSd+qHPKRnffAt0WPg7AygbbbLCIS0ORe6//HT
 a88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jPESxkdne1pl9qKkpnJVzbPwFkDrkEve1zwqkORGLuk=;
 b=m4HXz0Fg35VCMLIqD8/mfmwe0uXlXZidt+nkCbCnXEEcKlM+xIldIjEje+7WjuJTlm
 Uq9fF2t7nMvsjGCMZ8kFFZ3rWpRCxNul3sv1kO4+1UluI95fzXza5Jf8ijuUqygvOBk2
 yY8nLHjz61IuPGAxUHwJr40E7fWxldGAxCfIk79IT/WZIf1ubyK6CLcZxOe//YXa4Kxc
 C9Qee6CrFXIq7VkJquRGU12JGDNLKYj0OLxW8SOrvKf33djS1dH4sXbccet45VnVyiXc
 XLaziyKsSq5/f6DXJ3UaEpCdKpq01RuWP5mmM/fsk16UhcPQjRlJs4nPmczZwHStj6Yu
 7s0Q==
X-Gm-Message-State: AOAM531ILG13iAa7mMKldsSbav75jBuzoPQGTECYJ0Gi9JZ5rWo2dQfg
 0P0Q9pzij0Et1IlBMnDBUwhIVURUYAnnJw==
X-Google-Smtp-Source: ABdhPJweyp9UkGj20z6Z7ile+Zoy0L+9BRFNy465G+TwlfgiQAvKKjzXCI8M/98KpbVaEH7pQXw58g==
X-Received: by 2002:a63:5c1:: with SMTP id 184mr19617387pgf.75.1621955246013; 
 Tue, 25 May 2021 08:07:26 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id z19sm2231943pjq.11.2021.05.25.08.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/28] softfloat: Use hard-float for {u}int64_to_float{32,
 64}
Date: Tue, 25 May 2021 08:07:06 -0700
Message-Id: <20210525150706.294968-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525150706.294968-1-richard.henderson@linaro.org>
References: <20210525150706.294968-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

For the normal case of no additional scaling, this reduces the
profile contribution of int64_to_float64 to the testcase in the
linked issue from 0.81% to 0.04%.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/134
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index b0df5b6dc5..79b2205070 100644
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


