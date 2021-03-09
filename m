Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE5E332D7F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:43:46 +0100 (CET)
Received: from localhost ([::1]:47074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJgOX-0005Fz-5Z
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:43:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf71-0007RH-32
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:35 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:41366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6d-0002UI-VT
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:34 -0500
Received: by mail-oi1-x233.google.com with SMTP id y131so12654434oia.8
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hzN4bO1Q9kWzjd+yXsPtlaqCNoI3movNX0neMlD42A0=;
 b=i5KJQKN9bkqEcjBqGiOCWwGMjhmab9bcMrL4qpn5XJJJhlqqhHKg1eMmBqWvWg5MMb
 RsRFl0gFyiMZCRzLZ09L8A5BpaEgUVDEM1E9vQJ1LzJ1WMLIHbex/L0VkPDD15vo/nq9
 Sct5eqCgZwzfPOErepBVkVs6+8VwW7oJe1/KV76tl4n5kfYomUEBFDkNT32ChGSYjQdN
 hq3maIX4uV2QVTU3Us9pjYgYaqBrMt0UVZ2LrvcuQ+rNWseqs5Mz+s8wAiI8o8/DTGbp
 taQpJ00aLC/ayqbtivTa1JAvUDzcMSW+I3R8adao6YEgyPHdSBUXH/Ezdv7ZISc0HVY7
 rwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hzN4bO1Q9kWzjd+yXsPtlaqCNoI3movNX0neMlD42A0=;
 b=Nbe9jVlm4UHN1d13uqQF7A+CouQDqiua0Fk+UY27XauOXi4uGtzVDuToXMP+cah3kN
 r1xOPgKv4saJV8yuESf3fygvTaMO8A5MWZMQY9qdwrnr7T0fIsq2OSgG7t1LIwnuFHUZ
 npTasGQvVERDmqA/uBxcTS6tZex6KHDjwkA3CyYTXos1HzAr0P3zKN16BP5FzJkQbgCC
 f3s9hbpUJ8HZQeOQdK6MBg6Jk79ac2+sTB07QTllo6Phz3+dGUQR0YNYN5+gmIdQVLIZ
 aGIKiOp7sEQeXjPQtK9RVTnCC8xyAKh3/S+4ff7TRS7ga3hNZnVgGDKFYRJ6nf9Ivcbf
 ahoQ==
X-Gm-Message-State: AOAM530FPDCs9QnH4AZjNNzNjnnczLEt7RdcSQkQuQ6qlReDreJxXl1m
 YcYjRwj4ouUKBWo3SKAzxcf2jcjkBPbVvfgg
X-Google-Smtp-Source: ABdhPJwuX1kzhmj+ezufPD5xjm9TIFl/AgkFnFcCeU9K4wBTEtvwvuK/iGf4TQibtfMQ1mKQlFoh4w==
X-Received: by 2002:aca:d6d3:: with SMTP id n202mr3548714oig.175.1615306871020; 
 Tue, 09 Mar 2021 08:21:11 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:21:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 25/78] target/arm: Implement SVE2 floating-point pairwise
Date: Tue,  9 Mar 2021 08:19:48 -0800
Message-Id: <20210309162041.23124-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Long <steplong@quicinc.com>

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
index 115daa50a5..6da734e7b4 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -890,6 +890,52 @@ DO_ZPZZ_PAIR_D(sve2_sminp_zpzz_d, int64_t, DO_MIN)
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
index 65f1b11848..ae2ac20302 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6698,3 +6698,28 @@ static bool trans_SQXTUNT(DisasContext *s, arg_rri_esz *a)
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


