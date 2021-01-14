Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9702F573A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 03:29:42 +0100 (CET)
Received: from localhost ([::1]:40946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzsOL-0001MP-Ie
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 21:29:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCf-0003m9-B0
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:37 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:33549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCc-0003WG-5I
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:37 -0500
Received: by mail-pj1-x1034.google.com with SMTP id w1so3916930pjc.0
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 18:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n4Y1AVJg0zWvq5Giznzup81YTmaTrkJ+QjTkRk5gpqc=;
 b=QfRBrb54j2hOKreeNYKKU3jPKY3GHyu0wileE9XG9/TMjATdl3karBYt9pS9jQdqLx
 /m5R98xDyhblur2LzzG6EYV8NeCdobNrkMaApW9aL8rhNah0zxrYIXRSlRHz5cSffk7i
 fVbyceE53SsRou6ncwQnReTMx9/h1ycVgTKkMR0hDQibpR0rmpC0UE5Yi+qd10LRMtKF
 p+Z5wNi6dl0NA07kNsvme4aZp827z6eWG8tU8Lmm6VVyEPiX47TY0v/GJ2N1/oXXi+CR
 J0QjV6tIBXVpu5Kld/28kP+WKZY91LgSzr9WM/6UCGEla8NibGTCn27TsoJ1wzrS5oqF
 N4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n4Y1AVJg0zWvq5Giznzup81YTmaTrkJ+QjTkRk5gpqc=;
 b=b2ZeEkdp6urn+RwBSTYWoQ5r8rQ8TutOsBTOffRRl8+K5DSQ+x7a6aJ6ysjT/854Jk
 tZL8dC9MikQjkBiXfHg+8QJDXgmd1/nTQojrzrxVtOGvjlDI60xZsk3pSH04zmf6JwaR
 Nnaa9Lv2wX07Fa+jRF5YTRFD9y4HMNbQBnqIHTSH1iItmYKbjXGu26R40z4TFQd0yXX2
 bclvOFJtbLD15Qnz572XbW0HzsJSnaHPLeUsf9RM+Bp7CMBvL3b/08la/F+p0pNMz34S
 ehFTGIdZH/q1dF/SybCOCsnXbMM3fDizLhHue55SHDC+A8CNgjybzNBcwLD9Kydv4zfF
 S3Ig==
X-Gm-Message-State: AOAM532tj+QT5aXG2aBmgP/W9X1dUy/D6bCIo5h8aq3e/AyrlpRaLmM/
 8UhPsXkiCq2etrlDLnOMdjkCkePKksUA4g==
X-Google-Smtp-Source: ABdhPJzEWiKb0ksxuYWrhAjjUfaaaNW/ZtFKqoXK7kDA4SDRAyz12T5f0D2ps5B5zUZRMTJO3zxu3Q==
X-Received: by 2002:a17:90a:bb83:: with SMTP id
 v3mr2484171pjr.28.1610590651681; 
 Wed, 13 Jan 2021 18:17:31 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id i7sm3771687pfc.50.2021.01.13.18.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 18:17:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/24] tcg/i386: Use tcg_constant_vec with tcg vec expanders
Date: Wed, 13 Jan 2021 16:16:50 -1000
Message-Id: <20210114021654.647242-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114021654.647242-1-richard.henderson@linaro.org>
References: <20210114021654.647242-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 1706b7c776..050f3cb0b1 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -3486,7 +3486,7 @@ static void expand_vec_rotv(TCGType type, unsigned vece, TCGv_vec v0,
 static void expand_vec_mul(TCGType type, unsigned vece,
                            TCGv_vec v0, TCGv_vec v1, TCGv_vec v2)
 {
-    TCGv_vec t1, t2, t3, t4;
+    TCGv_vec t1, t2, t3, t4, zero;
 
     tcg_debug_assert(vece == MO_8);
 
@@ -3504,11 +3504,11 @@ static void expand_vec_mul(TCGType type, unsigned vece,
     case TCG_TYPE_V64:
         t1 = tcg_temp_new_vec(TCG_TYPE_V128);
         t2 = tcg_temp_new_vec(TCG_TYPE_V128);
-        tcg_gen_dup16i_vec(t2, 0);
+        zero = tcg_constant_vec(TCG_TYPE_V128, MO_8, 0);
         vec_gen_3(INDEX_op_x86_punpckl_vec, TCG_TYPE_V128, MO_8,
-                  tcgv_vec_arg(t1), tcgv_vec_arg(v1), tcgv_vec_arg(t2));
+                  tcgv_vec_arg(t1), tcgv_vec_arg(v1), tcgv_vec_arg(zero));
         vec_gen_3(INDEX_op_x86_punpckl_vec, TCG_TYPE_V128, MO_8,
-                  tcgv_vec_arg(t2), tcgv_vec_arg(t2), tcgv_vec_arg(v2));
+                  tcgv_vec_arg(t2), tcgv_vec_arg(zero), tcgv_vec_arg(v2));
         tcg_gen_mul_vec(MO_16, t1, t1, t2);
         tcg_gen_shri_vec(MO_16, t1, t1, 8);
         vec_gen_3(INDEX_op_x86_packus_vec, TCG_TYPE_V128, MO_8,
@@ -3523,15 +3523,15 @@ static void expand_vec_mul(TCGType type, unsigned vece,
         t2 = tcg_temp_new_vec(type);
         t3 = tcg_temp_new_vec(type);
         t4 = tcg_temp_new_vec(type);
-        tcg_gen_dup16i_vec(t4, 0);
+        zero = tcg_constant_vec(TCG_TYPE_V128, MO_8, 0);
         vec_gen_3(INDEX_op_x86_punpckl_vec, type, MO_8,
-                  tcgv_vec_arg(t1), tcgv_vec_arg(v1), tcgv_vec_arg(t4));
+                  tcgv_vec_arg(t1), tcgv_vec_arg(v1), tcgv_vec_arg(zero));
         vec_gen_3(INDEX_op_x86_punpckl_vec, type, MO_8,
-                  tcgv_vec_arg(t2), tcgv_vec_arg(t4), tcgv_vec_arg(v2));
+                  tcgv_vec_arg(t2), tcgv_vec_arg(zero), tcgv_vec_arg(v2));
         vec_gen_3(INDEX_op_x86_punpckh_vec, type, MO_8,
-                  tcgv_vec_arg(t3), tcgv_vec_arg(v1), tcgv_vec_arg(t4));
+                  tcgv_vec_arg(t3), tcgv_vec_arg(v1), tcgv_vec_arg(zero));
         vec_gen_3(INDEX_op_x86_punpckh_vec, type, MO_8,
-                  tcgv_vec_arg(t4), tcgv_vec_arg(t4), tcgv_vec_arg(v2));
+                  tcgv_vec_arg(t4), tcgv_vec_arg(zero), tcgv_vec_arg(v2));
         tcg_gen_mul_vec(MO_16, t1, t1, t2);
         tcg_gen_mul_vec(MO_16, t3, t3, t4);
         tcg_gen_shri_vec(MO_16, t1, t1, 8);
@@ -3559,7 +3559,7 @@ static bool expand_vec_cmp_noinv(TCGType type, unsigned vece, TCGv_vec v0,
         NEED_UMIN = 8,
         NEED_UMAX = 16,
     };
-    TCGv_vec t1, t2;
+    TCGv_vec t1, t2, t3;
     uint8_t fixup;
 
     switch (cond) {
@@ -3630,9 +3630,9 @@ static bool expand_vec_cmp_noinv(TCGType type, unsigned vece, TCGv_vec v0,
     } else if (fixup & NEED_BIAS) {
         t1 = tcg_temp_new_vec(type);
         t2 = tcg_temp_new_vec(type);
-        tcg_gen_dupi_vec(vece, t2, 1ull << ((8 << vece) - 1));
-        tcg_gen_sub_vec(vece, t1, v1, t2);
-        tcg_gen_sub_vec(vece, t2, v2, t2);
+        t3 = tcg_constant_vec(type, vece, 1ull << ((8 << vece) - 1));
+        tcg_gen_sub_vec(vece, t1, v1, t3);
+        tcg_gen_sub_vec(vece, t2, v2, t3);
         v1 = t1;
         v2 = t2;
         cond = tcg_signed_cond(cond);
-- 
2.25.1


