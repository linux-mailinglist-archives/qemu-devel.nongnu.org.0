Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94643AB0C6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:00:19 +0200 (CEST)
Received: from localhost ([::1]:39940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoos-0004r6-Pb
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNb-0003Ay-9s
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:07 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:35406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNZ-0006Ob-GC
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:06 -0400
Received: by mail-ed1-x530.google.com with SMTP id df12so568673edb.2
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wBL1fkSPUK79ExHBJomnE+g34nGDCbvEomLmRGvHvzU=;
 b=pmGtN9CeLs+MuzNQms8ZXkK+91w2TTEQ5onBoJ0ygQH9cpDwM9cACJElzoYlqUp2kU
 sZ1LHj9ZoWvY3ICNWJSybT20uAEo7f/KXluK/tbnCVvPl+iNIY2MxqJBxb2YTOX+V4ZR
 +XWQvi5EzBqtEG3OvXxxrZ56cTU+46Kse+4K30BPJWTa9DdP8iHjE3/sR/ItsIfjHtN9
 dP83FBEcZcw2T8WO/7Jgj/cP2uUalXr5ofbenWBo1v4AtjoB+vCjmBDabZ3LVu6tl+Ew
 0e0jhAfHZvD3T16UkOjLymc1EgEYwPKoteKp2BCNt7DVtpn2ERvaAS4A7tQNxhbbBPmb
 c6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wBL1fkSPUK79ExHBJomnE+g34nGDCbvEomLmRGvHvzU=;
 b=lpM1wnpW/eAFpBpH8mW1ZZZb4tMxBOURux3SvLZb/66XY9jaMRRLcXoDgzfBJ/D6JZ
 YjGPtbDvMT9WGj8/4K3yDcCZwvNk5/M8+K3oKVWpT7tZzKQlMMZLMgHu0wynm25ilrwC
 32A1idqf8/ksQFXV5l5oKHBw8xlw59NR5N0kPWC3tYxPUHasovaUqzBvjyV4NxNPsBwv
 VXY21jv/HQSmymnhBYhDqyfLLUUFFZR8pWNT23JBMW6s84EHDYE3wTIuffJDM/KZ6dd3
 OVjUZWzeIOjtx7Pn/rVHnwBx6ErOun33cxnpWcUq+1SgFWX2anWFIQFyitbBu1eIy7lw
 4FtA==
X-Gm-Message-State: AOAM533rTb/j7/cLxQIxuD0Tg/wkMgGN8HqEqQ7sWJwhlfP+qHsWPXOI
 w9UhZFESdib4er2ULwO/i9ZmRl78mUw=
X-Google-Smtp-Source: ABdhPJzJ2vyY2ms50HEE0D9kn/lKfo6O9gILkanR0LlHGzA+8M19aSrda7uK3ELh3Cv3scnJ0ZjAFg==
X-Received: by 2002:a05:6402:5244:: with SMTP id
 t4mr5315829edd.254.1623922324203; 
 Thu, 17 Jun 2021 02:32:04 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:32:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 39/45] softfloat: Use _Generic instead of QEMU_GENERIC
Date: Thu, 17 Jun 2021 11:31:28 +0200
Message-Id: <20210617093134.900014-40-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210614233143.1221879-3-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
2.31.1



