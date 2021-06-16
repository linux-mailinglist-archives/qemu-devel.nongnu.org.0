Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF65F3A8E7A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:39:00 +0200 (CEST)
Received: from localhost ([::1]:58988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKWB-0002mk-PK
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltKTr-0008Pw-EF
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:36:35 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:35336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltKTp-0005bM-9A
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:36:35 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 fy24-20020a17090b0218b029016c5a59021fso3013059pjb.0
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wj8nbktnS3Cds2QIKMNmDpFap8ymbqZ5pXLd4Gca9Xw=;
 b=gvmw9isz6VXpNdcl0Qe+pNodDzBX8QNL2bWGXfx/4x66MVXIzhp4HM0UKGCb16RxV2
 PIyKSW7wwpm/J+z1fZeNYCZp0xGc4h95x+nDC9Qz4dHzZug6ZmulJFo+xUoWuXVPUKu5
 Bmc4OXF/rrqX6LVPkRERESY+U15rT9gMNFTkWx+Ju/HZFpTiLshUyU4c+chJ08q/v2hu
 nPI/abLEJEX9rkBAUYBVp+tVzQaAdUj04Xt/BmKo+ts3zf+V5ShtWGTe9Ef66v51Dp0j
 A9jlJV5d9dlgQim9q1j7Gxf54OaXmmer9B9IfNUUQJd/Kt5YPb39URP+F+yLY+JlMtdb
 3aIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wj8nbktnS3Cds2QIKMNmDpFap8ymbqZ5pXLd4Gca9Xw=;
 b=eZgzabsUnkYdelDXc1K6rjK/pl+2dyOLwfOnbhjMK+7Twf22HU9EU4qhcWQ18U8eZ0
 m6i4fHKbDA0UR0x31INbqTsIL8fb+yAvCkwz6EwnSsFrWgA8EAMJSvLh8440EVRqnrqw
 Un6BeZZtkYwEDHeuD4Vu1zG0ImlzLhCet2JYylhTOlBEVRQXbceyld0DwyEw5ICO2o0R
 O9YRXBKJjljkgprH8NgfEb7nui9apEykztQvuNQUDMrhGQwzyWaTS9i8Jp2tn5/WFppl
 EN5oGTxJ2vAxPegskF8ca7hvs11azmlTl8A5S+5w9mwGJRu3XxSYELHRhMUrkkdrKdzz
 BTSQ==
X-Gm-Message-State: AOAM533fIdDmpTxZWAtSG59AvGH6FCo9unLcG83n6uUquPExTSMi+lTg
 X9/Dd7rhpYQVSEmGuBJV5fAR0tsFeO5M7A==
X-Google-Smtp-Source: ABdhPJxK76ukNUEuU2J241qxA1NYhvkf7nfn4StHl78FXlZuCZeiLX0DdonLQdVbMBpaSbvdmueRgw==
X-Received: by 2002:a17:90b:1489:: with SMTP id
 js9mr2171321pjb.227.1623807391881; 
 Tue, 15 Jun 2021 18:36:31 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id o1sm321595pjf.56.2021.06.15.18.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:36:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/8] softfloat: Use _Generic instead of QEMU_GENERIC
Date: Tue, 15 Jun 2021 18:36:23 -0700
Message-Id: <20210616013629.1458790-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616013629.1458790-1-richard.henderson@linaro.org>
References: <20210616013629.1458790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210614233143.1221879-3-richard.henderson@linaro.org>
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


