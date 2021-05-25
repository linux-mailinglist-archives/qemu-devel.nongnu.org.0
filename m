Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16721390619
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:01:54 +0200 (CEST)
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZVB-0008TF-12
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYc0-0004R7-6N
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:52 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbq-0004mi-I1
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:51 -0400
Received: by mail-wr1-x431.google.com with SMTP id q5so32591102wrs.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=A1QSGAAUBXTAZWWs6h43vZvuiEmluAAjc8E2kaYeyGM=;
 b=IXUHM4YlXKW6PkjMrFEv9vxdbVbwasGSyYFaa2U8nG/VU1VfN96icV2ov3lVm1Ksuk
 EO/qrXIy5n4NRVG7UH8gUHs/iFHjQxbuBkssxISMzjn0Pup0BmV+CKdOyst6sBpvFeko
 muSs+W6zhZsg0J8tcVVzLxFLfk7ekE0OgWwaWojXq0Keq4JdBZ5aieD9YWTYnlmhYEMm
 mOyh6GhLupZhINPdz2OaE1maJ1nhozT5Ywy5g226iSYabDpduKNYI9KZ19prIu42rT4I
 V9cLC5GE71EP9gzh/8rDbpY4l5zU8yzuGTt4TbzTiWx9Dzv7hoPPVJ5VrSEuO5jqUKzF
 WGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A1QSGAAUBXTAZWWs6h43vZvuiEmluAAjc8E2kaYeyGM=;
 b=MpKPZD0IN3P2ij4rwGZ6O0OJ5u9e/qWvR0nFbnoKw1Gm2i6APZmoLnZQ9VrqKWM6yz
 z3/MRH2MKpePYGk8D5C6IrhTCw5YPDjJombUG4F+j1t8YOr8uK4tvv28/eVQdXkdmepl
 NtVqIt31E+cb8I0HCgKvqqJrWgsKKa1rate3/VkJq4aQNAQBB6OYs6IvE926n+FHV0Sp
 0+LDYs3bc4EluA73HE3kgdRn8Zp9YObs3hfvxYXb53VhLDOuHlx+5j/KVsNol1rAqji6
 cc+AB+cGrPWwgru3frQgww/CV3HaKzgOTZlKgdamPsQWLf1q7ixFGRlTt0TO6Hdua26h
 aqLQ==
X-Gm-Message-State: AOAM532PieCwu3oxN4w1xG9fugBMDj5MyQnJd8PxrabyJoBEbHl7QmEd
 HQBw9x6aNS0j4xfPAfjt6rVqCeEABJLLC33M
X-Google-Smtp-Source: ABdhPJxozdjDLK2f4P+cF/D24ps/EaO+82l1H4zFU2kr4rH7qApGu0WMZv7VoQAX45jSJfUQe+vItg==
X-Received: by 2002:a5d:5257:: with SMTP id k23mr27720887wrc.328.1621955080880; 
 Tue, 25 May 2021 08:04:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 077/114] target/arm: Implement SVE2 saturating multiply-add
 high (indexed)
Date: Tue, 25 May 2021 16:02:47 +0100
Message-Id: <20210525150324.32370-78-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-56-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h    | 14 ++++++++++++++
 target/arm/sve.decode      |  8 ++++++++
 target/arm/sve_helper.c    | 36 ++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  8 ++++++++
 4 files changed, 66 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 7e99dcd1192..fe67574741f 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2665,3 +2665,17 @@ DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_zzzz_d, TCG_CALL_NO_RWG,
 
 DEF_HELPER_FLAGS_6(fmmla_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(fmmla_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqrdmlah_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlah_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlah_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 9bfaf737b7f..1956d96ad54 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -791,6 +791,14 @@ MLS_zzxz_h      01000100 0. 1 ..... 000011 ..... .....   @rrxr_3 esz=1
 MLS_zzxz_s      01000100 10 1 ..... 000011 ..... .....   @rrxr_2 esz=2
 MLS_zzxz_d      01000100 11 1 ..... 000011 ..... .....   @rrxr_1 esz=3
 
+# SVE2 saturating multiply-add high (indexed)
+SQRDMLAH_zzxz_h 01000100 0. 1 ..... 000100 ..... .....   @rrxr_3 esz=1
+SQRDMLAH_zzxz_s 01000100 10 1 ..... 000100 ..... .....   @rrxr_2 esz=2
+SQRDMLAH_zzxz_d 01000100 11 1 ..... 000100 ..... .....   @rrxr_1 esz=3
+SQRDMLSH_zzxz_h 01000100 0. 1 ..... 000101 ..... .....   @rrxr_3 esz=1
+SQRDMLSH_zzxz_s 01000100 10 1 ..... 000101 ..... .....   @rrxr_2 esz=2
+SQRDMLSH_zzxz_d 01000100 11 1 ..... 000101 ..... .....   @rrxr_1 esz=3
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 0. 1 ..... 111110 ..... .....   @rrx_3 esz=1
 MUL_zzx_s       01000100 10 1 ..... 111110 ..... .....   @rrx_2 esz=2
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index fa96e286393..11d4a2a7228 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1499,6 +1499,42 @@ DO_CMLA_FUNC(sve2_sqrdcmlah_zzzz_d, int64_t,   , DO_SQRDMLAH_D)
 #undef DO_SQRDMLAH_S
 #undef DO_SQRDMLAH_D
 
+#define DO_ZZXZ(NAME, TYPE, H, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc) \
+{                                                                       \
+    intptr_t oprsz = simd_oprsz(desc), segment = 16 / sizeof(TYPE);     \
+    intptr_t i, j, idx = simd_data(desc);                               \
+    TYPE *d = vd, *a = va, *n = vn, *m = (TYPE *)vm + H(idx);           \
+    for (i = 0; i < oprsz / sizeof(TYPE); i += segment) {               \
+        TYPE mm = m[i];                                                 \
+        for (j = 0; j < segment; j++) {                                 \
+            d[i + j] = OP(n[i + j], mm, a[i + j]);                      \
+        }                                                               \
+    }                                                                   \
+}
+
+#define DO_SQRDMLAH_H(N, M, A) \
+    ({ uint32_t discard; do_sqrdmlah_h(N, M, A, false, true, &discard); })
+#define DO_SQRDMLAH_S(N, M, A) \
+    ({ uint32_t discard; do_sqrdmlah_s(N, M, A, false, true, &discard); })
+#define DO_SQRDMLAH_D(N, M, A) do_sqrdmlah_d(N, M, A, false, true)
+
+DO_ZZXZ(sve2_sqrdmlah_idx_h, int16_t, H2, DO_SQRDMLAH_H)
+DO_ZZXZ(sve2_sqrdmlah_idx_s, int32_t, H4, DO_SQRDMLAH_S)
+DO_ZZXZ(sve2_sqrdmlah_idx_d, int64_t,   , DO_SQRDMLAH_D)
+
+#define DO_SQRDMLSH_H(N, M, A) \
+    ({ uint32_t discard; do_sqrdmlah_h(N, M, A, true, true, &discard); })
+#define DO_SQRDMLSH_S(N, M, A) \
+    ({ uint32_t discard; do_sqrdmlah_s(N, M, A, true, true, &discard); })
+#define DO_SQRDMLSH_D(N, M, A) do_sqrdmlah_d(N, M, A, true, true)
+
+DO_ZZXZ(sve2_sqrdmlsh_idx_h, int16_t, H2, DO_SQRDMLSH_H)
+DO_ZZXZ(sve2_sqrdmlsh_idx_s, int32_t, H4, DO_SQRDMLSH_S)
+DO_ZZXZ(sve2_sqrdmlsh_idx_d, int64_t,   , DO_SQRDMLSH_D)
+
+#undef DO_ZZXZ
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 39a6839de41..b31a4d1fb24 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3895,6 +3895,14 @@ DO_SVE2_RRXR(trans_MLS_zzxz_h, gen_helper_gvec_mls_idx_h)
 DO_SVE2_RRXR(trans_MLS_zzxz_s, gen_helper_gvec_mls_idx_s)
 DO_SVE2_RRXR(trans_MLS_zzxz_d, gen_helper_gvec_mls_idx_d)
 
+DO_SVE2_RRXR(trans_SQRDMLAH_zzxz_h, gen_helper_sve2_sqrdmlah_idx_h)
+DO_SVE2_RRXR(trans_SQRDMLAH_zzxz_s, gen_helper_sve2_sqrdmlah_idx_s)
+DO_SVE2_RRXR(trans_SQRDMLAH_zzxz_d, gen_helper_sve2_sqrdmlah_idx_d)
+
+DO_SVE2_RRXR(trans_SQRDMLSH_zzxz_h, gen_helper_sve2_sqrdmlsh_idx_h)
+DO_SVE2_RRXR(trans_SQRDMLSH_zzxz_s, gen_helper_sve2_sqrdmlsh_idx_s)
+DO_SVE2_RRXR(trans_SQRDMLSH_zzxz_d, gen_helper_sve2_sqrdmlsh_idx_d)
+
 #undef DO_SVE2_RRXR
 
 /*
-- 
2.20.1


