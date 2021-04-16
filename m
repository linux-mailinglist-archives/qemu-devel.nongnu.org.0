Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E11362A99
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:52:49 +0200 (CEST)
Received: from localhost ([::1]:44088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWOO-00069A-BX
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcp-0004zQ-RL
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:39 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:54213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcW-0001Lh-52
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:39 -0400
Received: by mail-pj1-x102f.google.com with SMTP id nk8so1510844pjb.3
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W45GPMZZVBfCUkRw+wO8T3FyCeab3ADQB7NYg/wbXMs=;
 b=X//tLQZph5I8XN8zp2pUcW9bQ87S2TuVEtp4GuEOOhsD5uGlZ47AxPDNuurBvDdKSW
 PZoGAZrr89D+biUy3/3ahXFI2Dg3R73o4xbCX0tsc8W+767h7OzbUbffZg1CoDHbbL8s
 BoV7962avGjiFjm/KMg5vfRSJHRFpFVJ11QAM1a6j9BAjJ8jNuEW2v4Vork78Wl9TBRl
 i74YS4eZdSJVdKHv86yKuDHymzN9y1kSDo2JlMtFxZTxUpUDG3TfRqAWwto7Q3Rekrpr
 DxLknScU1W/+t3tjCFyt/RHjltOa+nlfji3VaY450t/InNLkRIpF7w4YhZCfh7OXtCRQ
 MReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W45GPMZZVBfCUkRw+wO8T3FyCeab3ADQB7NYg/wbXMs=;
 b=XzHHY15jXJD7a8rm6nXUmQ7gWcOlcIJSaIpk1K92gB5m2mR7VRy7iTj0DNS9DCQnru
 Ezay2edqvxZsBqwGUT8ywyrwC/T8J2v/+KmviPeKkT6xGzWvFgrM+bOAG9sCGe59HcG1
 yIpooQaOfhENAcfSQEZ5GbMYvIUQaA+/2nmBj5ZmJ2+vkbCTV9yidE5NzskIcXqrcgZK
 Q1ZU0kcROWq2CdBXQlgGzmutczGviw2Mv5upyNuKwH4NR8cndl42T7yI6yYFMqeb2RK2
 hrfj17jFy1ppmo7IBeKkgXByjHUDI1Cb8RGvL+xd07jpkK5Gh2CzO5BWOn7pETWxyRW0
 cYYg==
X-Gm-Message-State: AOAM531tIREyW/vv9qBK4ZG4XputBr103mBtFldFyEhbn3bNVBMYzOnA
 N5BGBk1X1+zcFUAQXUzXdzw/44ciI+CdNQ==
X-Google-Smtp-Source: ABdhPJzCA5ORXePcnjpqa3WaLbTEzvTLNkWOLXL7W49fnfTr3T+kXEA0QQlal3J6gLhkDcc/QMR+dw==
X-Received: by 2002:a17:90a:ee95:: with SMTP id
 i21mr12159726pjz.160.1618606998856; 
 Fri, 16 Apr 2021 14:03:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 37/81] target/arm: Implement SVE2 complex integer
 multiply-add
Date: Fri, 16 Apr 2021 14:01:56 -0700
Message-Id: <20210416210240.1591291-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix do_sqrdmlah_d (laurent desnogues)
---
 target/arm/helper-sve.h    | 18 ++++++++++++++++
 target/arm/vec_internal.h  |  5 +++++
 target/arm/sve.decode      |  5 +++++
 target/arm/sve_helper.c    | 42 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 32 +++++++++++++++++++++++++++++
 target/arm/vec_helper.c    | 15 +++++++-------
 6 files changed, 109 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 457a421455..d154218452 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2601,3 +2601,21 @@ DEF_HELPER_FLAGS_5(sve2_umlsl_zzzw_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_umlsl_zzzw_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_cmla_zzzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_cmla_zzzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_cmla_zzzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_cmla_zzzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_zzzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_zzzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_zzzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_zzzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index 0102547a10..200fb55909 100644
--- a/target/arm/vec_internal.h
+++ b/target/arm/vec_internal.h
@@ -168,4 +168,9 @@ static inline int64_t do_suqrshl_d(int64_t src, int64_t shift,
     return do_uqrshl_d(src, shift, round, sat);
 }
 
+int8_t do_sqrdmlah_b(int8_t, int8_t, int8_t, bool, bool);
+int16_t do_sqrdmlah_h(int16_t, int16_t, int16_t, bool, bool, uint32_t *);
+int32_t do_sqrdmlah_s(int32_t, int32_t, int32_t, bool, bool, uint32_t *);
+int64_t do_sqrdmlah_d(int64_t, int64_t, int64_t, bool, bool);
+
 #endif /* TARGET_ARM_VEC_INTERNALS_H */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index b28b50e05c..936977eacb 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1362,3 +1362,8 @@ SMLSLB_zzzw     01000100 .. 0 ..... 010 100 ..... .....  @rda_rn_rm
 SMLSLT_zzzw     01000100 .. 0 ..... 010 101 ..... .....  @rda_rn_rm
 UMLSLB_zzzw     01000100 .. 0 ..... 010 110 ..... .....  @rda_rn_rm
 UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
+
+## SVE2 complex integer multiply-add
+
+CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
+SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 8b86e7ecd6..572d41a26c 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1448,6 +1448,48 @@ DO_SQDMLAL(sve2_sqdmlsl_zzzw_d, int64_t, int32_t,     , H1_4,
 
 #undef DO_SQDMLAL
 
+#define DO_CMLA(NAME, TYPE, H, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc) \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc) / sizeof(TYPE);       \
+    int rot = simd_data(desc);                                  \
+    int sel_a = rot & 1, sel_b = sel_a ^ 1;                     \
+    bool sub_r = rot == 1 || rot == 2;                          \
+    bool sub_i = rot >= 2;                                      \
+    TYPE *d = vd, *n = vn, *m = vm, *a = va;                    \
+    for (i = 0; i < opr_sz; i += 2) {                           \
+        TYPE elt1_a = n[H(i + sel_a)];                          \
+        TYPE elt2_a = m[H(i + sel_a)];                          \
+        TYPE elt2_b = m[H(i + sel_b)];                          \
+        d[H(i)] = OP(elt1_a, elt2_a, a[H(i)], sub_r);           \
+        d[H(i + 1)] = OP(elt1_a, elt2_b, a[H(i + 1)], sub_i);   \
+    }                                                           \
+}
+
+#define do_cmla(N, M, A, S) (A + (N * M) * (S ? -1 : 1))
+
+DO_CMLA(sve2_cmla_zzzz_b, uint8_t, H1, do_cmla)
+DO_CMLA(sve2_cmla_zzzz_h, uint16_t, H2, do_cmla)
+DO_CMLA(sve2_cmla_zzzz_s, uint32_t, H4, do_cmla)
+DO_CMLA(sve2_cmla_zzzz_d, uint64_t,   , do_cmla)
+
+#define DO_SQRDMLAH_B(N, M, A, S) \
+    do_sqrdmlah_b(N, M, A, S, true)
+#define DO_SQRDMLAH_H(N, M, A, S) \
+    ({ uint32_t discard; do_sqrdmlah_h(N, M, A, S, true, &discard); })
+#define DO_SQRDMLAH_S(N, M, A, S) \
+    ({ uint32_t discard; do_sqrdmlah_s(N, M, A, S, true, &discard); })
+#define DO_SQRDMLAH_D(N, M, A, S) \
+    do_sqrdmlah_d(N, M, A, S, true)
+
+DO_CMLA(sve2_sqrdcmlah_zzzz_b, int8_t, H1, DO_SQRDMLAH_B)
+DO_CMLA(sve2_sqrdcmlah_zzzz_h, int16_t, H2, DO_SQRDMLAH_H)
+DO_CMLA(sve2_sqrdcmlah_zzzz_s, int32_t, H4, DO_SQRDMLAH_S)
+DO_CMLA(sve2_sqrdcmlah_zzzz_d, int64_t,   , DO_SQRDMLAH_D)
+
+#undef do_cmla
+#undef DO_CMLA
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0fdfd1e9e0..6e92abbd8f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7656,3 +7656,35 @@ static bool trans_UMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
 {
     return do_umlsl_zzzw(s, a, true);
 }
+
+static bool trans_CMLA_zzzz(DisasContext *s, arg_CMLA_zzzz *a)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        gen_helper_sve2_cmla_zzzz_b, gen_helper_sve2_cmla_zzzz_h,
+        gen_helper_sve2_cmla_zzzz_s, gen_helper_sve2_cmla_zzzz_d,
+    };
+
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot);
+    }
+    return true;
+}
+
+static bool trans_SQRDCMLAH_zzzz(DisasContext *s, arg_SQRDCMLAH_zzzz *a)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        gen_helper_sve2_sqrdcmlah_zzzz_b, gen_helper_sve2_sqrdcmlah_zzzz_h,
+        gen_helper_sve2_sqrdcmlah_zzzz_s, gen_helper_sve2_sqrdcmlah_zzzz_d,
+    };
+
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot);
+    }
+    return true;
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index c56337e724..19006f50f7 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -38,8 +38,8 @@
 #endif
 
 /* Signed saturating rounding doubling multiply-accumulate high half, 8-bit */
-static int8_t do_sqrdmlah_b(int8_t src1, int8_t src2, int8_t src3,
-                            bool neg, bool round)
+int8_t do_sqrdmlah_b(int8_t src1, int8_t src2, int8_t src3,
+                     bool neg, bool round)
 {
     /*
      * Simplify:
@@ -82,8 +82,8 @@ void HELPER(sve2_sqrdmlsh_b)(void *vd, void *vn, void *vm,
 }
 
 /* Signed saturating rounding doubling multiply-accumulate high half, 16-bit */
-static int16_t do_sqrdmlah_h(int16_t src1, int16_t src2, int16_t src3,
-                             bool neg, bool round, uint32_t *sat)
+int16_t do_sqrdmlah_h(int16_t src1, int16_t src2, int16_t src3,
+                      bool neg, bool round, uint32_t *sat)
 {
     /* Simplify similarly to do_sqrdmlah_b above.  */
     int32_t ret = (int32_t)src1 * src2;
@@ -199,8 +199,8 @@ void HELPER(sve2_sqrdmlsh_h)(void *vd, void *vn, void *vm,
 }
 
 /* Signed saturating rounding doubling multiply-accumulate high half, 32-bit */
-static int32_t do_sqrdmlah_s(int32_t src1, int32_t src2, int32_t src3,
-                             bool neg, bool round, uint32_t *sat)
+int32_t do_sqrdmlah_s(int32_t src1, int32_t src2, int32_t src3,
+                      bool neg, bool round, uint32_t *sat)
 {
     /* Simplify similarly to do_sqrdmlah_b above.  */
     int64_t ret = (int64_t)src1 * src2;
@@ -321,8 +321,7 @@ static int64_t do_sat128_d(Int128 r)
     return ls;
 }
 
-static int64_t do_sqrdmlah_d(int64_t n, int64_t m, int64_t a,
-                             bool neg, bool round)
+int64_t do_sqrdmlah_d(int64_t n, int64_t m, int64_t a, bool neg, bool round)
 {
     uint64_t l, h;
     Int128 r, t;
-- 
2.25.1


