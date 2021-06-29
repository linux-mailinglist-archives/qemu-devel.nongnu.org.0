Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140E73B7888
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:22:48 +0200 (CEST)
Received: from localhost ([::1]:50808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJJn-0007UI-43
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItP-0008TE-LZ
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:31 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:38622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0000uX-6T
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:31 -0400
Received: by mail-pf1-x434.google.com with SMTP id c8so104363pfp.5
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p5LfB36r6i3yx5bOwYc8DmXqbz43Ns7565tCjIvpo+w=;
 b=l14gK2Py0dhAv0Ah5n4QDAfvu07JZ4Nnv8ExxeWD1YIBzrQSKJGXDela0Ozyi4PqGb
 lpDT5wfiWYuzn/i6bGeEwh/a5U7aaeHjQkvzBQblY+F6fYDm9zFlCGFfkk4qk1Y91dyf
 YZN3sJ8EhtlfFEsKKl7YC81/8z6L5TimFQp2MyXUpwkpTtgeDM0Uj6hXCMOD32Ys7Dq/
 2jTXlPduNYmCxXLxKCVRip9DD2jqqQkKdzGkJSXsN9a7aWjGRMIdvM67W1vwtVNoNO/6
 M2tZ2kdZDTtxkjR8YOH/5qvvmQbRkYoPZVdpDkWHdjgx8GncDtFcD6h2snENZdB4hW2i
 BdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p5LfB36r6i3yx5bOwYc8DmXqbz43Ns7565tCjIvpo+w=;
 b=fHT1rpnqID2xvR9aSshyTUDee35VvrLRxpa/uebOd8m879N8vqH5mbd5K5QNbggIv/
 a865qGJvTFHrCrcSjG+PJh1Q0odJVWuaY+iwb1NEGDVRBQ7QiuW+eqsF+cwBROeXDZo1
 OEHWAw2mf7HtjL6DNJ5obBYwtYVybup1NKiN8A2DRmfVJ3zWShttSDNMTDSb++XJHfDP
 0YPH3Do1Oq61RZucExQJGMibZplA3V8I9QLQtm9vnZROTse+my94VtLiwJ29A+OCGoW6
 nAcULQxgsUT+ko7XhN3+1hrKiHd9F4eZpI74gKXCWgNpSA+wBs3Rmrk2zLCjDsmnWpxf
 lzaw==
X-Gm-Message-State: AOAM53080hDZFgPwoAQhICNhE6Cipx1R1uUEYY7/aOq9LCCNzUi+koNw
 s2B6ysAF3ypPx0asBCv7BkNzqrGwij9Jiw==
X-Google-Smtp-Source: ABdhPJya0nNZbBOJ7Y1xAm7uYq2gMTBFCWmCLIymvI2w82XNRxB9qRsQmANIXD1DMgYrDV1K88diFw==
X-Received: by 2002:a63:fa11:: with SMTP id y17mr30095407pgh.128.1624992914711; 
 Tue, 29 Jun 2021 11:55:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/63] tcg: Add tcg_gen_vec_shl{shr}{sar}8i_i32
Date: Tue, 29 Jun 2021 11:54:24 -0700
Message-Id: <20210629185455.3131172-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Implement tcg_gen_vec_shl{shr}{sar}8i_tl by adding corresponging i32 OP.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-Id: <20210624105023.3852-5-zhiwei_liu@c-sky.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op-gvec.h | 10 ++++++++++
 tcg/tcg-op-gvec.c         | 28 ++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index e3c9f45926..e3b274502c 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -408,8 +408,11 @@ void tcg_gen_vec_add16_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 void tcg_gen_vec_sub8_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 void tcg_gen_vec_sub16_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 
+void tcg_gen_vec_shl8i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
 void tcg_gen_vec_shl16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
+void tcg_gen_vec_shr8i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
 void tcg_gen_vec_shr16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
+void tcg_gen_vec_sar8i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
 void tcg_gen_vec_sar16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
 
 #if TARGET_LONG_BITS == 64
@@ -417,14 +420,21 @@ void tcg_gen_vec_sar16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
 #define tcg_gen_vec_sub8_tl  tcg_gen_vec_sub8_i64
 #define tcg_gen_vec_add16_tl tcg_gen_vec_add16_i64
 #define tcg_gen_vec_sub16_tl tcg_gen_vec_sub16_i64
+#define tcg_gen_vec_shl8i_tl tcg_gen_vec_shl8i_i64
+#define tcg_gen_vec_shr8i_tl tcg_gen_vec_shr8i_i64
+#define tcg_gen_vec_sar8i_tl tcg_gen_vec_sar8i_i64
 #define tcg_gen_vec_shl16i_tl tcg_gen_vec_shl16i_i64
 #define tcg_gen_vec_shr16i_tl tcg_gen_vec_shr16i_i64
 #define tcg_gen_vec_sar16i_tl tcg_gen_vec_sar16i_i64
+
 #else
 #define tcg_gen_vec_add8_tl  tcg_gen_vec_add8_i32
 #define tcg_gen_vec_sub8_tl  tcg_gen_vec_sub8_i32
 #define tcg_gen_vec_add16_tl tcg_gen_vec_add16_i32
 #define tcg_gen_vec_sub16_tl tcg_gen_vec_sub16_i32
+#define tcg_gen_vec_shl8i_tl tcg_gen_vec_shl8i_i32
+#define tcg_gen_vec_shr8i_tl tcg_gen_vec_shr8i_i32
+#define tcg_gen_vec_sar8i_tl tcg_gen_vec_sar8i_i32
 #define tcg_gen_vec_shl16i_tl tcg_gen_vec_shl16i_i32
 #define tcg_gen_vec_shr16i_tl tcg_gen_vec_shr16i_i32
 #define tcg_gen_vec_sar16i_tl tcg_gen_vec_sar16i_i32
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index c8fb403957..ffe55e908f 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -2678,6 +2678,13 @@ void tcg_gen_vec_shl16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
     tcg_gen_andi_i64(d, d, mask);
 }
 
+void tcg_gen_vec_shl8i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
+{
+    uint32_t mask = dup_const(MO_8, 0xff << c);
+    tcg_gen_shli_i32(d, a, c);
+    tcg_gen_andi_i32(d, d, mask);
+}
+
 void tcg_gen_vec_shl16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
 {
     uint32_t mask = dup_const(MO_16, 0xffff << c);
@@ -2736,6 +2743,13 @@ void tcg_gen_vec_shr16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
     tcg_gen_andi_i64(d, d, mask);
 }
 
+void tcg_gen_vec_shr8i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
+{
+    uint32_t mask = dup_const(MO_8, 0xff >> c);
+    tcg_gen_shri_i32(d, a, c);
+    tcg_gen_andi_i32(d, d, mask);
+}
+
 void tcg_gen_vec_shr16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
 {
     uint32_t mask = dup_const(MO_16, 0xffff >> c);
@@ -2808,6 +2822,20 @@ void tcg_gen_vec_sar16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
     tcg_temp_free_i64(s);
 }
 
+void tcg_gen_vec_sar8i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
+{
+    uint32_t s_mask = dup_const(MO_8, 0x80 >> c);
+    uint32_t c_mask = dup_const(MO_8, 0xff >> c);
+    TCGv_i32 s = tcg_temp_new_i32();
+
+    tcg_gen_shri_i32(d, a, c);
+    tcg_gen_andi_i32(s, d, s_mask);  /* isolate (shifted) sign bit */
+    tcg_gen_muli_i32(s, s, (2 << c) - 2); /* replicate isolated signs */
+    tcg_gen_andi_i32(d, d, c_mask);  /* clear out bits above sign  */
+    tcg_gen_or_i32(d, d, s);         /* include sign extension */
+    tcg_temp_free_i32(s);
+}
+
 void tcg_gen_vec_sar16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
 {
     uint32_t s_mask = dup_const(MO_16, 0x8000 >> c);
-- 
2.25.1


