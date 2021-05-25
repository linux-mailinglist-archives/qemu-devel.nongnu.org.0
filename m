Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D734A38F7BB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:52:48 +0200 (CEST)
Received: from localhost ([::1]:33468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMFT-0002eG-H1
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLY1-0008BI-Tf
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:07:55 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:34562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXo-00045C-Jn
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:07:53 -0400
Received: by mail-pg1-x529.google.com with SMTP id l70so21418163pga.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sKUb502aLLms8bMUPiVbrKDD4PCp/jOA6YF9RrGlUsg=;
 b=uN3j1aN6vmiCzUe+e0RpQRTUfw47xD8xZvGH7eVCNbnRSKbj35Q1tNO8m6p4mnoIMo
 6E6nalTW+Jm5nUQ5zPHhoG0aPffpnmSZD/qsNTVRTYqXzki8iYuCzeJEjxZM81XkjGXB
 2khavWsPoMYFVsZCdvhTiBmI3dYSf5pxpp0U5kQPgo/zj2Ct+TSU7GHIbdvk4hUuui7/
 Am7EXeiNow/6cHfW9uob2X93ieYAbJpMlW8Es9NvNpOtOWVngv3g2nLYvDguH9STUKGp
 q+bKeXmhqUTTSGre3ZGduHt8deEqcPFuLUKQmdr4A/5p4Q8WLikkVSB7cihC0+uir0/b
 6e0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sKUb502aLLms8bMUPiVbrKDD4PCp/jOA6YF9RrGlUsg=;
 b=ltuVwd2g8VTkPXqQd8uRYD9wP4ffMa3y7d6zKiLnerQFR7s+VXbjyf/XqJdOrxw21x
 iAe+gW1MrBr9Ui7Y0Vt3PEv33m9IQibbmeezGRkxdzE/0GFcRfZEekWzmh6tpyTjjEL3
 Hp6SjjzCeG3hEazo8HHdye2TAe4GXNUBiL5Yj1jd5fHteRu2tcanpZmHtqTfBTWMUFuM
 GKEzQFTTyfbS8zGfj3UW9A1iy/gJ4FU9bfjTcQOJZVti14auT5zvv84lx3N2yFOpYE4z
 jpy/LIERGnIMEVkUWnyrIqpHtMvUNOZk8jjOs5mZx9mD12bEkaoV0vg+bMppmb8y1MSv
 o27A==
X-Gm-Message-State: AOAM532zaNJPQUCcjYV5wJHMrJudr9gBUHsbvbKbuX6KqZukVScCO9Ss
 IjQDQv4J9ShRRMU5hRr0ApKDnT+TCWEIFg==
X-Google-Smtp-Source: ABdhPJz30ouL901ifXb3MpJ0v2dW85LW/7UZjElOrkqPyft5NX1hlE0nd0nWClTJ+ajUIyRQCWvz7Q==
X-Received: by 2002:a65:6256:: with SMTP id q22mr16428981pgv.391.1621904855991; 
 Mon, 24 May 2021 18:07:35 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 59/92] target/arm: Implement SVE2 saturating multiply high
 (indexed)
Date: Mon, 24 May 2021 18:03:25 -0700
Message-Id: <20210525010358.152808-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        | 14 ++++++
 target/arm/sve.decode      |  8 ++++
 target/arm/translate-sve.c |  8 ++++
 target/arm/vec_helper.c    | 88 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 118 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index eb94b6b1e6..e7c463fff5 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -967,6 +967,20 @@ DEF_HELPER_FLAGS_4(sve2_sqrdmulh_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqrdmulh_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqrdmulh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(gvec_xar_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 #ifdef TARGET_AARCH64
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 407d3019d1..35010d755f 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -829,6 +829,14 @@ SQDMULLB_zzx_d  01000100 11 1 ..... 1110.0 ..... .....   @rrx_2a esz=3
 SQDMULLT_zzx_s  01000100 10 1 ..... 1110.1 ..... .....   @rrx_3a esz=2
 SQDMULLT_zzx_d  01000100 11 1 ..... 1110.1 ..... .....   @rrx_2a esz=3
 
+# SVE2 saturating multiply high (indexed)
+SQDMULH_zzx_h   01000100 0. 1 ..... 111100 ..... .....   @rrx_3 esz=1
+SQDMULH_zzx_s   01000100 10 1 ..... 111100 ..... .....   @rrx_2 esz=2
+SQDMULH_zzx_d   01000100 11 1 ..... 111100 ..... .....   @rrx_1 esz=3
+SQRDMULH_zzx_h  01000100 0. 1 ..... 111101 ..... .....   @rrx_3 esz=1
+SQRDMULH_zzx_s  01000100 10 1 ..... 111101 ..... .....   @rrx_2 esz=2
+SQRDMULH_zzx_d  01000100 11 1 ..... 111101 ..... .....   @rrx_1 esz=3
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 0. 1 ..... 111110 ..... .....   @rrx_3 esz=1
 MUL_zzx_s       01000100 10 1 ..... 111110 ..... .....   @rrx_2 esz=2
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 001432eccc..a03fce003e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3864,6 +3864,14 @@ DO_SVE2_RRX(trans_MUL_zzx_h, gen_helper_gvec_mul_idx_h)
 DO_SVE2_RRX(trans_MUL_zzx_s, gen_helper_gvec_mul_idx_s)
 DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
 
+DO_SVE2_RRX(trans_SQDMULH_zzx_h, gen_helper_sve2_sqdmulh_idx_h)
+DO_SVE2_RRX(trans_SQDMULH_zzx_s, gen_helper_sve2_sqdmulh_idx_s)
+DO_SVE2_RRX(trans_SQDMULH_zzx_d, gen_helper_sve2_sqdmulh_idx_d)
+
+DO_SVE2_RRX(trans_SQRDMULH_zzx_h, gen_helper_sve2_sqrdmulh_idx_h)
+DO_SVE2_RRX(trans_SQRDMULH_zzx_s, gen_helper_sve2_sqrdmulh_idx_s)
+DO_SVE2_RRX(trans_SQRDMULH_zzx_d, gen_helper_sve2_sqrdmulh_idx_d)
+
 #undef DO_SVE2_RRX
 
 #define DO_SVE2_RRX_TB(NAME, FUNC, TOP) \
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 25061c15e1..8b7269d8e1 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -240,6 +240,36 @@ void HELPER(sve2_sqrdmulh_h)(void *vd, void *vn, void *vm, uint32_t desc)
     }
 }
 
+void HELPER(sve2_sqdmulh_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    int idx = simd_data(desc);
+    int16_t *d = vd, *n = vn, *m = (int16_t *)vm + H2(idx);
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 2; i += 16 / 2) {
+        int16_t mm = m[i];
+        for (j = 0; j < 16 / 2; ++j) {
+            d[i + j] = do_sqrdmlah_h(n[i + j], mm, 0, false, false, &discard);
+        }
+    }
+}
+
+void HELPER(sve2_sqrdmulh_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    int idx = simd_data(desc);
+    int16_t *d = vd, *n = vn, *m = (int16_t *)vm + H2(idx);
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 2; i += 16 / 2) {
+        int16_t mm = m[i];
+        for (j = 0; j < 16 / 2; ++j) {
+            d[i + j] = do_sqrdmlah_h(n[i + j], mm, 0, false, true, &discard);
+        }
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 32-bit */
 int32_t do_sqrdmlah_s(int32_t src1, int32_t src2, int32_t src3,
                       bool neg, bool round, uint32_t *sat)
@@ -373,6 +403,36 @@ void HELPER(sve2_sqrdmulh_s)(void *vd, void *vn, void *vm, uint32_t desc)
     }
 }
 
+void HELPER(sve2_sqdmulh_idx_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    int idx = simd_data(desc);
+    int32_t *d = vd, *n = vn, *m = (int32_t *)vm + H4(idx);
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 4; i += 16 / 4) {
+        int32_t mm = m[i];
+        for (j = 0; j < 16 / 4; ++j) {
+            d[i + j] = do_sqrdmlah_s(n[i + j], mm, 0, false, false, &discard);
+        }
+    }
+}
+
+void HELPER(sve2_sqrdmulh_idx_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    int idx = simd_data(desc);
+    int32_t *d = vd, *n = vn, *m = (int32_t *)vm + H4(idx);
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 4; i += 16 / 4) {
+        int32_t mm = m[i];
+        for (j = 0; j < 16 / 4; ++j) {
+            d[i + j] = do_sqrdmlah_s(n[i + j], mm, 0, false, true, &discard);
+        }
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 64-bit */
 static int64_t do_sat128_d(Int128 r)
 {
@@ -452,6 +512,34 @@ void HELPER(sve2_sqrdmulh_d)(void *vd, void *vn, void *vm, uint32_t desc)
     }
 }
 
+void HELPER(sve2_sqdmulh_idx_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    int idx = simd_data(desc);
+    int64_t *d = vd, *n = vn, *m = (int64_t *)vm + idx;
+
+    for (i = 0; i < opr_sz / 8; i += 16 / 8) {
+        int64_t mm = m[i];
+        for (j = 0; j < 16 / 8; ++j) {
+            d[i + j] = do_sqrdmlah_d(n[i + j], mm, 0, false, false);
+        }
+    }
+}
+
+void HELPER(sve2_sqrdmulh_idx_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    int idx = simd_data(desc);
+    int64_t *d = vd, *n = vn, *m = (int64_t *)vm + idx;
+
+    for (i = 0; i < opr_sz / 8; i += 16 / 8) {
+        int64_t mm = m[i];
+        for (j = 0; j < 16 / 8; ++j) {
+            d[i + j] = do_sqrdmlah_d(n[i + j], mm, 0, false, true);
+        }
+    }
+}
+
 /* Integer 8 and 16-bit dot-product.
  *
  * Note that for the loops herein, host endianness does not matter
-- 
2.25.1


