Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6410038F787
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:29:03 +0200 (CEST)
Received: from localhost ([::1]:46470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llLsT-0005RJ-K2
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUz-0001xJ-Bn
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:46 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUW-0001pW-Bh
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:45 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 ne24-20020a17090b3758b029015f2dafecb0so11007146pjb.4
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9qiMCqX9xYtsQZuR9hfA+EDWfL1lJ5uuA+y3bAtpIkc=;
 b=a48WyMM6IqoeluhOQ2pjrzeok8lRmWavdHsOPE5Z1GisTiPIGdlXyT3ikr9oFcOhnY
 Qw+NsMBHY+LIXiLo+IF+Yk2JlSf5nLNwIQ2WOkS631cFM1Zc9c+SlOQCRP6ipeUJ7TPx
 kxndSJV1c/r9dnjp0H+g/mOckY62Pmb3PfqgNLmh9+i6PGfrn7UMOhpbUVwu660n6JmZ
 dOlnu5Q9ujbOdVj2ZeSlmrFBsm42m5YRcoPX6cpslclRP/kLiREXQa+gSUa0p18v2L3L
 XGExIjTqnl2z401c4ASOWXsLVQNCWNMuougprRp+WfLl7RfKrPxpXPjnsfoJSWOYo7Af
 uQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9qiMCqX9xYtsQZuR9hfA+EDWfL1lJ5uuA+y3bAtpIkc=;
 b=YC/fMKDeQ4KOz2n5Yn953vAVjEDfFb4UIxqF4sbWRb0JmegVY87jMuelIPBYOOfdop
 RVHxsBxKTujlDZV/fJHXMjBLodOgkVevvWFfL4/WXiKOPloWRfcsOrfDm+QganvfieVH
 b15dpEXYOqEpfJwNboaP8Pq8+ygU9VGhI+FZ1wZ85t6IucHzDU9HFPZgobzKYS6lJtef
 dQL2v7uGYR3W7AawXnoePq6S/Q6k+dRq45kRRfM57aK/QpTqkvgnJHTGZCrxNPBS0SdA
 oOR4KD7gVqQTmtZeH2SLg10tt5YvjYX3JaKzGQizZ7y1wCxd8uRnZzxGOl6p5IDUxvoc
 UUWQ==
X-Gm-Message-State: AOAM5330VBRqa6ZLo/CvSNP0MoF+anfX08zkN0qah6+KlwsPWDMxHFZH
 n3S2jw94L4bS5y1dYDcr9iEAkfgHQtdlGQ==
X-Google-Smtp-Source: ABdhPJymPrTUgDm7DXsMzwdrrC1LVKFIvLUFBM1EhH33vNV/9L1yny5PfMfAuMLmiIwxF2qKbkw0eQ==
X-Received: by 2002:a17:90b:3b92:: with SMTP id
 pc18mr27580607pjb.218.1621904655066; 
 Mon, 24 May 2021 18:04:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 25/92] target/arm: Implement SVE2 floating-point pairwise
Date: Mon, 24 May 2021 18:02:51 -0700
Message-Id: <20210525010358.152808-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Long <steplong@quicinc.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stephen Long <steplong@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Load all inputs before writing any output (laurent desnogues)
---
 target/arm/helper-sve.h    | 35 +++++++++++++++++++++++++++++
 target/arm/sve.decode      |  8 +++++++
 target/arm/sve_helper.c    | 46 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 25 +++++++++++++++++++++
 4 files changed, 114 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index b302203ce8..a033b5f6b2 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2443,3 +2443,38 @@ DEF_HELPER_FLAGS_3(sve2_uqxtnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqxtunt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqxtunt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqxtunt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve2_fmaxnmp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fmaxnmp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fmaxnmp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve2_fminnmp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fminnmp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fminnmp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve2_fmaxp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fmaxp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fmaxp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve2_fminp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fminp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fminp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 19866ec4c6..9c75ac94c0 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1284,3 +1284,11 @@ UQXTNB          01000101 .. 1 ..... 010 010 ..... .....  @rd_rn_tszimm_shl
 UQXTNT          01000101 .. 1 ..... 010 011 ..... .....  @rd_rn_tszimm_shl
 SQXTUNB         01000101 .. 1 ..... 010 100 ..... .....  @rd_rn_tszimm_shl
 SQXTUNT         01000101 .. 1 ..... 010 101 ..... .....  @rd_rn_tszimm_shl
+
+## SVE2 floating-point pairwise operations
+
+FADDP           01100100 .. 010 00 0 100 ... ..... ..... @rdn_pg_rm
+FMAXNMP         01100100 .. 010 10 0 100 ... ..... ..... @rdn_pg_rm
+FMINNMP         01100100 .. 010 10 1 100 ... ..... ..... @rdn_pg_rm
+FMAXP           01100100 .. 010 11 0 100 ... ..... ..... @rdn_pg_rm
+FMINP           01100100 .. 010 11 1 100 ... ..... ..... @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 1ca71e367d..16604a424f 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -895,6 +895,52 @@ DO_ZPZZ_PAIR_D(sve2_sminp_zpzz_d, int64_t, DO_MIN)
 #undef DO_ZPZZ_PAIR
 #undef DO_ZPZZ_PAIR_D
 
+#define DO_ZPZZ_PAIR_FP(NAME, TYPE, H, OP)                              \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg,               \
+                  void *status, uint32_t desc)                          \
+{                                                                       \
+    intptr_t i, opr_sz = simd_oprsz(desc);                              \
+    for (i = 0; i < opr_sz; ) {                                         \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
+        do {                                                            \
+            TYPE n0 = *(TYPE *)(vn + H(i));                             \
+            TYPE m0 = *(TYPE *)(vm + H(i));                             \
+            TYPE n1 = *(TYPE *)(vn + H(i + sizeof(TYPE)));              \
+            TYPE m1 = *(TYPE *)(vm + H(i + sizeof(TYPE)));              \
+            if (pg & 1) {                                               \
+                *(TYPE *)(vd + H(i)) = OP(n0, n1, status);              \
+            }                                                           \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);                     \
+            if (pg & 1) {                                               \
+                *(TYPE *)(vd + H(i)) = OP(m0, m1, status);              \
+            }                                                           \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);                     \
+        } while (i & 15);                                               \
+    }                                                                   \
+}
+
+DO_ZPZZ_PAIR_FP(sve2_faddp_zpzz_h, float16, H1_2, float16_add)
+DO_ZPZZ_PAIR_FP(sve2_faddp_zpzz_s, float32, H1_4, float32_add)
+DO_ZPZZ_PAIR_FP(sve2_faddp_zpzz_d, float64,     , float64_add)
+
+DO_ZPZZ_PAIR_FP(sve2_fmaxnmp_zpzz_h, float16, H1_2, float16_maxnum)
+DO_ZPZZ_PAIR_FP(sve2_fmaxnmp_zpzz_s, float32, H1_4, float32_maxnum)
+DO_ZPZZ_PAIR_FP(sve2_fmaxnmp_zpzz_d, float64,     , float64_maxnum)
+
+DO_ZPZZ_PAIR_FP(sve2_fminnmp_zpzz_h, float16, H1_2, float16_minnum)
+DO_ZPZZ_PAIR_FP(sve2_fminnmp_zpzz_s, float32, H1_4, float32_minnum)
+DO_ZPZZ_PAIR_FP(sve2_fminnmp_zpzz_d, float64,     , float64_minnum)
+
+DO_ZPZZ_PAIR_FP(sve2_fmaxp_zpzz_h, float16, H1_2, float16_max)
+DO_ZPZZ_PAIR_FP(sve2_fmaxp_zpzz_s, float32, H1_4, float32_max)
+DO_ZPZZ_PAIR_FP(sve2_fmaxp_zpzz_d, float64,     , float64_max)
+
+DO_ZPZZ_PAIR_FP(sve2_fminp_zpzz_h, float16, H1_2, float16_min)
+DO_ZPZZ_PAIR_FP(sve2_fminp_zpzz_s, float32, H1_4, float32_min)
+DO_ZPZZ_PAIR_FP(sve2_fminp_zpzz_d, float64,     , float64_min)
+
+#undef DO_ZPZZ_PAIR_FP
+
 /* Three-operand expander, controlled by a predicate, in which the
  * third operand is "wide".  That is, for D = N op M, the same 64-bit
  * value of M is used with all of the narrower values of N.
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c77df3dbeb..faf94b304a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6697,3 +6697,28 @@ static bool trans_SQXTUNT(DisasContext *s, arg_rri_esz *a)
     };
     return do_sve2_narrow_extract(s, a, ops);
 }
+
+static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
+                            gen_helper_gvec_4_ptr *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpzz_fp(s, a, fn);
+}
+
+#define DO_SVE2_ZPZZ_FP(NAME, name)                                         \
+static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)                  \
+{                                                                           \
+    static gen_helper_gvec_4_ptr * const fns[4] = {                         \
+        NULL,                            gen_helper_sve2_##name##_zpzz_h,   \
+        gen_helper_sve2_##name##_zpzz_s, gen_helper_sve2_##name##_zpzz_d    \
+    };                                                                      \
+    return do_sve2_zpzz_fp(s, a, fns[a->esz]);                              \
+}
+
+DO_SVE2_ZPZZ_FP(FADDP, faddp)
+DO_SVE2_ZPZZ_FP(FMAXNMP, fmaxnmp)
+DO_SVE2_ZPZZ_FP(FMINNMP, fminnmp)
+DO_SVE2_ZPZZ_FP(FMAXP, fmaxp)
+DO_SVE2_ZPZZ_FP(FMINP, fminp)
-- 
2.25.1


