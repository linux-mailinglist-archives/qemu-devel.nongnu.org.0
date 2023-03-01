Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46636A6629
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:03:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCin-0003ic-7z; Tue, 28 Feb 2023 22:01:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCia-0002Vg-Ou
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:24 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCiD-0004G4-I2
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:03 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso10554526pjs.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 19:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VjZP4LY1Wxefy+0rLrks1q4QR8IjH+TMsA5bjteWWKA=;
 b=RlQ8Ff8aq2HCK/GevMBICcuE/8UzeBx3WZRF6EmpKWnwL7RC8/L1mTiivpVSkqwDB6
 J5R0+SqXBIb7qTvaqHJEpK2rZiEOBPRvcn9H4xz6nBBroVc4d6UfN6T0pxMQPqfZad0I
 YQ6t9M4KneGoRlLazf0+aqw4morBHLBBloozcpQOtvQ/Mdb6UpG49AMCVLzfGVn9nkGu
 3CNDCdE0DS0U1/VjaRrAWxu7eS4m77+rJAmlGRLLCe9D8ACmwt5CRmRem0baHjC2imkw
 HVrPoDcUKjfagJ6kN7dy1J9Q20hx4vUyagOY6gk8qtNzvU3PsvVxANAS6Q+9I997bq0k
 rS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VjZP4LY1Wxefy+0rLrks1q4QR8IjH+TMsA5bjteWWKA=;
 b=lqBAYouB91o9b5WxkYpNpLox/ue6mnGhJgTfxavwc2Ye82QzMYOPHNmw+PfXiEezIx
 0onFXMgs5voTFITZQdGd5gA6OQItibfsZWMHHz+q9klXM8aIYw6ot28EY7L2Nm6C7J68
 69ROrNmb1kxRIS6Hk9MMBrW9Qqg4DJj/gDPzlU/TXqViwJNNcWNldEr5q/TCY4AB3Af2
 rZDl6aisdG1i2vZ4nlfX8QNNroCZXKQnAj6iUH5c6TLquuEXf4VhrZ9oKY2SWgv/ZssT
 Vo7ITZvw6pCR0p2XBd9LftuYbNwXaMJ8Cq2EhgdHXEWRgyaaGv9+NCyEJveW/s5f4Res
 m9Pg==
X-Gm-Message-State: AO0yUKUKcn/89Gn8qWn6fWvsjZtktYTkXNKg84Rxurea+o54ah08keUa
 09lISQ5Tn2JhDxE76VP6hjDlQEn1OiEAkVHRjfs=
X-Google-Smtp-Source: AK7set9wY8Z1NMjQn5zfvCX0/Qrfy4VZpvvx8wALG6SSn88GdOHNEyQ5EFCN6Z5gGC15dYHU6e9CbA==
X-Received: by 2002:a17:903:27d0:b0:19e:21d0:5b95 with SMTP id
 km16-20020a17090327d000b0019e21d05b95mr4547491plb.10.1677639660001; 
 Tue, 28 Feb 2023 19:01:00 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170902be0b00b0019aca830869sm7181444pls.238.2023.02.28.19.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 19:00:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 43/62] tcg: Add tcg_temp_ebb_new_{i32,i64,ptr}
Date: Tue, 28 Feb 2023 16:56:24 -1000
Message-Id: <20230301025643.1227244-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FUZZY_BITCOIN=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

TCG internals will want to be able to allocate and reuse
explicitly life-limited temporaries.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 8d896bcbf4..0c2041bcf7 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -892,6 +892,13 @@ static inline TCGv_i32 tcg_global_mem_new_i32(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_i32(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_i32 tcg_temp_ebb_new_i32(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
+    return temp_tcgv_i32(t);
+}
+
 static inline TCGv_i32 tcg_temp_new_i32(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
@@ -911,6 +918,13 @@ static inline TCGv_i64 tcg_global_mem_new_i64(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_i64(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_i64 tcg_temp_ebb_new_i64(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
+    return temp_tcgv_i64(t);
+}
+
 static inline TCGv_i64 tcg_temp_new_i64(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
@@ -923,6 +937,13 @@ static inline TCGv_i64 tcg_temp_local_new_i64(void)
     return temp_tcgv_i64(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_i128 tcg_temp_ebb_new_i128(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
+    return temp_tcgv_i128(t);
+}
+
 static inline TCGv_i128 tcg_temp_new_i128(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
@@ -942,6 +963,13 @@ static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_ptr(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_ptr tcg_temp_ebb_new_ptr(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
+    return temp_tcgv_ptr(t);
+}
+
 static inline TCGv_ptr tcg_temp_new_ptr(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
-- 
2.34.1


