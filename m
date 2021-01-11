Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9652F1CE3
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:45:57 +0100 (CET)
Received: from localhost ([::1]:36910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1GL-000552-Uh
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:45:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rt-0003N7-P7
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:42 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:33516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rg-0000Kz-QP
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:37 -0500
Received: by mail-pg1-x52b.google.com with SMTP id n25so109528pgb.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n4Y1AVJg0zWvq5Giznzup81YTmaTrkJ+QjTkRk5gpqc=;
 b=HRfb0utnJtM/NFaTQB2eQrNyKgKz149OKWFVJqlcwbhAhWeLovTP78Oe0fwfGPHjeL
 6XY28n1cY1Hnabm8DQJ5Z3BrLZ8UAC61WBB5Ez61gfxoCCIhNnuLMHzISc0pG4s3gm6r
 y0LwaXDzmSdA7pMWdfQgrtcIy3VA9eUtvBg80+Xr7cjC1AX94vOcginFKBCNa705fy93
 jUjCLef4p6wZJu1cnhPs5KMsmKacCBCVSO6xY/+4scIZ59j2c1Hl5oQDillejCzy/4RX
 npa3jht3lAvsBPMG2wK2ZVsTArmYcdjksHN7lG+oSuQCdLmqwuGeSoHjX7FrEtapSfLT
 zoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n4Y1AVJg0zWvq5Giznzup81YTmaTrkJ+QjTkRk5gpqc=;
 b=nafbKdxnwRQS7KfXw/y7EkcM5epZKn3y3DweV6jXEv44B5VqaJ2WZGRZw5/icjlp1H
 u+TmR+mWRt9O6d6JRJymYgvNEMnmn3bobS/TH9c72eIUZ6rrC8VN9Fx436Y3qrwMsXNR
 JdZ2mUif0+chswWtreUA7qeU5nInzLd0q7t2kkqkptS1WgjZKLASLBWh0V4pZyP9aY4L
 wtA0CFCFRvf0JPnVV8cxRsofz7XriAlALArdlLNt/RqOpu0ux/YgTT7L6BLC1FkKAQee
 KHcA5lGYRzrk7Z9ucuTJqk39IzEewWrdSSZRqC9X0DLUq1bkUj1dPy6H1wrA+hKP4ALo
 yTTw==
X-Gm-Message-State: AOAM531muHO5vHS8kKmuhj9zJXKxGvBH64cWswtCG6ebOJKqq/GhhpRL
 gTYfH+4Qql57pM7Uk9C3dGJVOJqmoibzcA==
X-Google-Smtp-Source: ABdhPJzFefeMAtufSnBBhtULKHn2P2txLqqIaizRvnGe4SpNW5kkk7sBRy5K586LyJUS4A8dtjjPOw==
X-Received: by 2002:a62:19cc:0:b029:19e:321b:a22e with SMTP id
 195-20020a6219cc0000b029019e321ba22emr355255pfz.73.1610385623070; 
 Mon, 11 Jan 2021 09:20:23 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k64sm206666pfd.75.2021.01.11.09.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:20:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 20/23] tcg/i386: Use tcg_constant_vec with tcg vec expanders
Date: Mon, 11 Jan 2021 07:19:43 -1000
Message-Id: <20210111171946.219469-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111171946.219469-1-richard.henderson@linaro.org>
References: <20210111171946.219469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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


