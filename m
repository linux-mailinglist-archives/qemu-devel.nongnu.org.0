Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC1E3A7284
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 01:34:37 +0200 (CEST)
Received: from localhost ([::1]:38334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsw6G-00052G-Dj
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 19:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsw3a-0006Ff-9w
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:31:50 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:38517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsw3X-0007hm-CO
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:31:49 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so600544pjz.3
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 16:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lYciPGzXuNLmupEwVLTG4nR3oyS5g6fM/oOmMdD5hp4=;
 b=XVk1EtWgRuuJxhfhUx84qF284B1yLJDOlVfeBrLFFIwz09Jz4/h2lT/0nvvTzqy20H
 F2K+DPhQcMVtuCYUXQ+RNJWf3lpeQpBKHYaQihZLm0h8Te9RzUKELWWR/TijUCX5saz9
 iYTLZs8hXBPpkDQMC2ZNi/WXs3eXQy7cdkMIoCsdDhCDzfpYnjAdXKDK9ouhWJbmtKpl
 GMmZ8t4OgZtXf4aDbOsIznRt6aiOOKku4SeQ3IqCMKw7FlG+p6WeZKmHUIc9uECG/vza
 9fJDPs3uu/jPLeJwBIe2Vd/sZRp2XXYkKzlq7AgB0wh5OpVSPYitnXQw+63dxJDSnMG6
 vAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lYciPGzXuNLmupEwVLTG4nR3oyS5g6fM/oOmMdD5hp4=;
 b=FBxSehI+J2aHouJPU0GAd/0nGRL8pl6kEaAAS8oghGeQsQYww0PAzsseSvbXRGUCVy
 xxF9Iq2SpbvJNZvTCWdVxT8ngQpINfM9ASmVPjyHfvV5BdgXARpzEzN9ny3dLdLLn/a2
 LToOOdQ6lUtdFxvyi1xf9fj9y5b/rplawvCYJl2kDHuminugkmcDQM9MDK6QbpVsbnfr
 u5wzAuSm6Y5NfcXjxjHrDzTvGW6i17oLszCLD1EPUBYLkDym8PO152eok/Iv8I1G8wxn
 OCaZ1uuuvpbkk9EidylF8JxcCL58au81jm/mV3HYRa8Flal0mmNdlnM/arGR4xuLKhnS
 w/Og==
X-Gm-Message-State: AOAM531UScaVazL2yBQwtQ9XPgRWCkjfFj5zUJ1of6LMvhfbskzf+voU
 h74xZGReakqintiXPmrpQCFCjbiTE1SyMQ==
X-Google-Smtp-Source: ABdhPJxNutebnioRN4Mk97bIHb+olXUj6+iWGZbPMQEl3r9uf0w4IG83QckUOqG0DYeeGr0zAL/4jg==
X-Received: by 2002:a17:902:14b:b029:119:ef6b:8039 with SMTP id
 69-20020a170902014bb0290119ef6b8039mr1418246plb.84.1623713506164; 
 Mon, 14 Jun 2021 16:31:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id gl13sm488113pjb.5.2021.06.14.16.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 16:31:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] softfloat: Use _Generic instead of QEMU_GENERIC
Date: Mon, 14 Jun 2021 16:31:37 -0700
Message-Id: <20210614233143.1221879-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614233143.1221879-1-richard.henderson@linaro.org>
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: pbonzini@redhat.com, thuth@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 4d0160fe9c..6e769f990c 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -686,11 +686,13 @@ static float128 float128_pack_raw(const FloatParts128 *p)
 #include "softfloat-specialize.c.inc"
 
 #define PARTS_GENERIC_64_128(NAME, P) \
-    QEMU_GENERIC(P, (FloatParts128 *, parts128_##NAME), parts64_##NAME)
+    _Generic((P), FloatParts64 *: parts64_##NAME, \
+                  FloatParts128 *: parts128_##NAME)
 
 #define PARTS_GENERIC_64_128_256(NAME, P) \
-    QEMU_GENERIC(P, (FloatParts256 *, parts256_##NAME), \
-                 (FloatParts128 *, parts128_##NAME), parts64_##NAME)
+    _Generic((P), FloatParts64 *: parts64_##NAME, \
+                  FloatParts128 *: parts128_##NAME, \
+                  FloatParts256 *: parts256_##NAME)
 
 #define parts_default_nan(P, S)    PARTS_GENERIC_64_128(default_nan, P)(P, S)
 #define parts_silence_nan(P, S)    PARTS_GENERIC_64_128(silence_nan, P)(P, S)
@@ -892,11 +894,13 @@ static void parts128_log2(FloatParts128 *a, float_status *s, const FloatFmt *f);
  */
 
 #define FRAC_GENERIC_64_128(NAME, P) \
-    QEMU_GENERIC(P, (FloatParts128 *, frac128_##NAME), frac64_##NAME)
+    _Generic((P), FloatParts64 *: frac64_##NAME, \
+                  FloatParts128 *: frac128_##NAME)
 
 #define FRAC_GENERIC_64_128_256(NAME, P) \
-    QEMU_GENERIC(P, (FloatParts256 *, frac256_##NAME), \
-                 (FloatParts128 *, frac128_##NAME), frac64_##NAME)
+    _Generic((P), FloatParts64 *: frac64_##NAME, \
+                  FloatParts128 *: frac128_##NAME, \
+                  FloatParts256 *: frac256_##NAME)
 
 static bool frac64_add(FloatParts64 *r, FloatParts64 *a, FloatParts64 *b)
 {
-- 
2.25.1


