Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C46A3B78CC
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:42:56 +0200 (CEST)
Received: from localhost ([::1]:36580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJdH-0005W7-F7
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItP-0008Sh-7F
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:31 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:44906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0000uT-5T
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:30 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so3080065pjo.3
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UCyT6Sp8EBenir7CdpDEblAqtnl7+66OyhKqBXjwbpE=;
 b=dJsRkeBD6WT/23tWYpS8yXYqkBt4hi2jZsnKGVWlHYJoJIQc2VLEWhHqUEqM9gAT/J
 lZNfJzBGzJRmwT6+x5D91PSlXqJO1tWg6MKWgk/o6ItstdfQ8hlrPhO70K79wTZ6U7w3
 KZroIAsxv2pxbt9VJEpde23hxfNqEPhQnUxOoFKI480bfjGeyZiZJ9ELH4Venug8EXFG
 pGpgV4bA2HGDGdtH663wgozfaQ8D2U9Z9q2GNONefPAQI08ZgBs7SLLklq9y+Wzi785P
 i9fWAJhKuh/48IYeQ6dBi+H5qlX4QK1qZk7GFzscM5uAKcaZVhIwBGqt8vUeD5gVUMaW
 sZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UCyT6Sp8EBenir7CdpDEblAqtnl7+66OyhKqBXjwbpE=;
 b=eKU6BhSg8vK/JtQ7eLiNUFHBHjuxx9miJaYD1Dh+RtouG5fE5Iot+PX+5XDb2FfpVG
 GBehH++SgtB2AbYozeIJd9GPm5WHTxB/SCa+SO3AZ6iqNPqOdG2onZnTrsrFcekfW794
 nXgeBqC5j5HDutofL7Ptsq+QNxbRI8tGnRr0BKuIv7BJX4/inoN77o80ccWW8GdJg7Nn
 COMmEpWtoel9hdEBDogDtHI7Q1tmCp8k8/lXte1Qan49v1Onmo6NKJVyuBA2c+QgEXGH
 CZuyNLewZ+QWcnK2mRMUJQED/2tws7L05sAEdgc8PvDF4b5Y/QYMKu9g+I1CzpTHuY+9
 oncA==
X-Gm-Message-State: AOAM533GLmSI3kh8UmIfuzsmrnGtKV0OaZYyRTspBPEb4Rr2jTGc2z9V
 A6XesxJmrhYrW/y+0whYQCdLEHvE1TiV9w==
X-Google-Smtp-Source: ABdhPJy9vN10+nmOw3Ds+/XG9cjbCrIh4iguV7/tscQXQNBNMTrhwS+Ys9cuDn6r45ArRZR5l4XQ9Q==
X-Received: by 2002:a17:902:b188:b029:11b:1549:da31 with SMTP id
 s8-20020a170902b188b029011b1549da31mr28475290plr.7.1624992914126; 
 Tue, 29 Jun 2021 11:55:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/63] tcg: Add tcg_gen_vec_shl{shr}{sar}16i_i32
Date: Tue, 29 Jun 2021 11:54:23 -0700
Message-Id: <20210629185455.3131172-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

Implement tcg_gen_vec_shl{shr}{sar}16i_tl by adding corresponging i32 OP.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-Id: <20210624105023.3852-4-zhiwei_liu@c-sky.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op-gvec.h | 10 ++++++++++
 tcg/tcg-op-gvec.c         | 28 ++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index 2d5ad6ce12..e3c9f45926 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -408,16 +408,26 @@ void tcg_gen_vec_add16_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 void tcg_gen_vec_sub8_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 void tcg_gen_vec_sub16_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 
+void tcg_gen_vec_shl16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
+void tcg_gen_vec_shr16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
+void tcg_gen_vec_sar16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
+
 #if TARGET_LONG_BITS == 64
 #define tcg_gen_vec_add8_tl  tcg_gen_vec_add8_i64
 #define tcg_gen_vec_sub8_tl  tcg_gen_vec_sub8_i64
 #define tcg_gen_vec_add16_tl tcg_gen_vec_add16_i64
 #define tcg_gen_vec_sub16_tl tcg_gen_vec_sub16_i64
+#define tcg_gen_vec_shl16i_tl tcg_gen_vec_shl16i_i64
+#define tcg_gen_vec_shr16i_tl tcg_gen_vec_shr16i_i64
+#define tcg_gen_vec_sar16i_tl tcg_gen_vec_sar16i_i64
 #else
 #define tcg_gen_vec_add8_tl  tcg_gen_vec_add8_i32
 #define tcg_gen_vec_sub8_tl  tcg_gen_vec_sub8_i32
 #define tcg_gen_vec_add16_tl tcg_gen_vec_add16_i32
 #define tcg_gen_vec_sub16_tl tcg_gen_vec_sub16_i32
+#define tcg_gen_vec_shl16i_tl tcg_gen_vec_shl16i_i32
+#define tcg_gen_vec_shr16i_tl tcg_gen_vec_shr16i_i32
+#define tcg_gen_vec_sar16i_tl tcg_gen_vec_sar16i_i32
 #endif
 
 #endif
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 6d9a0aed62..c8fb403957 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -2678,6 +2678,13 @@ void tcg_gen_vec_shl16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
     tcg_gen_andi_i64(d, d, mask);
 }
 
+void tcg_gen_vec_shl16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
+{
+    uint32_t mask = dup_const(MO_16, 0xffff << c);
+    tcg_gen_shli_i32(d, a, c);
+    tcg_gen_andi_i32(d, d, mask);
+}
+
 void tcg_gen_gvec_shli(unsigned vece, uint32_t dofs, uint32_t aofs,
                        int64_t shift, uint32_t oprsz, uint32_t maxsz)
 {
@@ -2729,6 +2736,13 @@ void tcg_gen_vec_shr16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
     tcg_gen_andi_i64(d, d, mask);
 }
 
+void tcg_gen_vec_shr16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
+{
+    uint32_t mask = dup_const(MO_16, 0xffff >> c);
+    tcg_gen_shri_i32(d, a, c);
+    tcg_gen_andi_i32(d, d, mask);
+}
+
 void tcg_gen_gvec_shri(unsigned vece, uint32_t dofs, uint32_t aofs,
                        int64_t shift, uint32_t oprsz, uint32_t maxsz)
 {
@@ -2794,6 +2808,20 @@ void tcg_gen_vec_sar16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
     tcg_temp_free_i64(s);
 }
 
+void tcg_gen_vec_sar16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
+{
+    uint32_t s_mask = dup_const(MO_16, 0x8000 >> c);
+    uint32_t c_mask = dup_const(MO_16, 0xffff >> c);
+    TCGv_i32 s = tcg_temp_new_i32();
+
+    tcg_gen_shri_i32(d, a, c);
+    tcg_gen_andi_i32(s, d, s_mask);  /* isolate (shifted) sign bit */
+    tcg_gen_andi_i32(d, d, c_mask);  /* clear out bits above sign  */
+    tcg_gen_muli_i32(s, s, (2 << c) - 2); /* replicate isolated signs */
+    tcg_gen_or_i32(d, d, s);         /* include sign extension */
+    tcg_temp_free_i32(s);
+}
+
 void tcg_gen_gvec_sari(unsigned vece, uint32_t dofs, uint32_t aofs,
                        int64_t shift, uint32_t oprsz, uint32_t maxsz)
 {
-- 
2.25.1


