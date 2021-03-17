Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7B733F4F3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:04:52 +0100 (CET)
Received: from localhost ([::1]:50374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYfB-0003bG-JW
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCc-0005Ii-7A
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:19 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:41578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCY-0007GE-5f
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:17 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 l23-20020a05683004b7b02901b529d1a2fdso2165422otd.8
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kaB/usyGMCTopUHUsqMJlKWSU0ljEaKqjVTihcu+D7c=;
 b=PoVBWjkgUukh7r4zYlruwVUzuT19JEDuT6fklEW0T4Ti7zGuYcA36BLvV9tvbZcdRI
 GC4k6Hph27F2YEaHBnvbSt9SpaUBKcsgBkhW5HYeMrGWu17jcATW17eC+LvaLpwmrhTO
 A9uamqp7YNnUhn1RDjFCvbp5uF0rZhIBEbo9J7sEJJoduGQazmErG91kVNLSXJQSbjhg
 dX+tCcDB/+pWtuuCgGBAy/mF7bbeomxP8oI30B81oIGd28M2rQR3qGlqDfYIL0En8Dc1
 0FJ7IYLlOdKF3rlociECfiKmTFFjrw5oG1kTm0mj5iHebaMEOkXmZ/pzkoUBv2dQbXlx
 1OXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kaB/usyGMCTopUHUsqMJlKWSU0ljEaKqjVTihcu+D7c=;
 b=ewlwXZROx2TDHH1Uo9XiJgaKgdy1RHUfWtUxrEme/+jmIZj/Km3C0AhaPAr09cNwMx
 RNS7ZklFfMF9U9g1SJ4pmDt22dUVqZavFsrugql/4sNgCgEzurPJL7G6q8+gd6NH93lk
 HpZjO98PoQSdHOhnAcwPnHSV4t0qyO9tzZyrxRmNbo2KJzhO5unGj6tzNHj+Bae4f/3o
 FX/5qB7IITKEjG4PhAEHxY6fonqoXW3RDfMnp9LFt9/7oGsbU5a+yuvR+YtE2hT73l0d
 e6T0v9cx/gxaYCQOy87l7895O3fTE6K9hlEsOmpANLfGt8jiFNpYhXoF5Rxq/2LIEHc0
 ebSg==
X-Gm-Message-State: AOAM533iWCgLeyFUnSjpRylehrukUsX27j0SoXqfiMBBZxQGQjWRZBM4
 J66eXf68hRi8kIZ4ZMkjHYpgRmZcVB6CUtT7
X-Google-Smtp-Source: ABdhPJw4EHOvc/BDmTCvLqM2eY4jZrB/+sPtebrW4U0kD+PWH6KNQQsw4boXDC9GSfYYZdH00YYTuQ==
X-Received: by 2002:a9d:6013:: with SMTP id h19mr3805134otj.72.1615995312501; 
 Wed, 17 Mar 2021 08:35:12 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/38] tcg/tci: Split out tcg_out_op_rr
Date: Wed, 17 Mar 2021 09:34:32 -0600
Message-Id: <20210317153444.310566-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the same time, validate the type argument in tcg_out_mov.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 85c5ab5a08..322627811b 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -317,6 +317,17 @@ static void tcg_out_op_p(TCGContext *s, TCGOpcode op, void *p0)
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
                            TCGReg r0, TCGReg r1, intptr_t i2)
 {
@@ -351,16 +362,18 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
 
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
-    tcg_debug_assert(ret != arg);
-#if TCG_TARGET_REG_BITS == 32
-    tcg_out_op_t(s, INDEX_op_mov_i32);
-#else
-    tcg_out_op_t(s, INDEX_op_mov_i64);
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_out_op_rr(s, INDEX_op_mov_i32, ret, arg);
+        break;
+#if TCG_TARGET_REG_BITS == 64
+    case TCG_TYPE_I64:
+        tcg_out_op_rr(s, INDEX_op_mov_i64, ret, arg);
+        break;
 #endif
-    tcg_out_r(s, ret);
-    tcg_out_r(s, arg);
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    default:
+        g_assert_not_reached();
+    }
     return true;
 }
 
@@ -534,10 +547,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     CASE_32_64(bswap16)  /* Optional (TCG_TARGET_HAS_bswap16_*). */
     CASE_32_64(bswap32)  /* Optional (TCG_TARGET_HAS_bswap32_*). */
     CASE_64(bswap64)     /* Optional (TCG_TARGET_HAS_bswap64_i64). */
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rr(s, opc, args[0], args[1]);
         break;
 
 #if TCG_TARGET_REG_BITS == 32
-- 
2.25.1


