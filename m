Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98918332E0A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:17:12 +0100 (CET)
Received: from localhost ([::1]:56262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJgut-00021z-KH
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:17:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7F-0007pq-0c
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:49 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:35201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6t-0002Yc-AU
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:48 -0500
Received: by mail-oi1-x22f.google.com with SMTP id u6so8190384oic.2
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UzDsHngEWpbjz3McPd9SBlyGKK1l5sx+C92oFmNJwrM=;
 b=qPtbruXaIDR7lLBJEqaV/LWzw3uECdp285rUPfN1o2gZ9KwJxMpNbKHIGSeFU5r4Mz
 ePIwa0osuWXH+N0I+x77qplRTjwqBQlmAVlCxQ9BC1rWAhaI7pIzUhMiw8MhhaAPjOLo
 7upPCUmaHUT8iB9Of43wS1Z20/rJFKOaJZRFdUJnNntQcHErA5ZeCGKFHl1m9v8Hxbrp
 cZurqBle+w+QZWKbxjflwDYoxIFd928Nt0PmRunspQiT4GuEe2IXDNo8LRSGIxy8OOcP
 3N0zoAtZltR2MeuS46ZW1uGb98HmOSb0JEVQaHqQMvXvTWeD8Txo3MDQQQaXq5y4ZXgD
 ZuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UzDsHngEWpbjz3McPd9SBlyGKK1l5sx+C92oFmNJwrM=;
 b=ems4NAc8HQ3Utla1wfuv4msIJ94IlMv9Vn4YAiY0hhRJ24blH7h5aDd6cJHahB18fT
 Kc3pVz7D4WEiZApIAh2WcliyRKEIbROMxS1m+9tuu8JPUYeQQ8wddwhRXBfjWFWY4Ih5
 pHW6XHXQsYpz6fqd18zkYmcv31nx2x8ISTA7HmGHQDa3D98LKk6CgJ3/fNhbUL2vDNtS
 lPn+5GsL2WBju0tQ1tjt8RvKcbKVaqrao/3V7jdOGwpBWxf0prh/AYxfNAlOAejfP/38
 MFPS7zb5ahMOJX4ffhnXEzh0Iteiyau16AhWJL+Gx2CpEqxoX009WkpxX1ftz1JGuFHR
 3IKQ==
X-Gm-Message-State: AOAM532GfxPxgLtF718LPheDveQzMK7Qv4cV9uG+J2g8xrqWtr6cCw60
 wb0IFJ3SaMFFhyzBSPxR+TrY8v6aUPUcpVCs
X-Google-Smtp-Source: ABdhPJwZ80/NsYLDEhVYPw8h4LuuYfTXAwbf9+lxRhywD7H+UHYJJ2dr/yiewyMbQKZuzTQ6x1CNow==
X-Received: by 2002:aca:fc11:: with SMTP id a17mr1348034oii.68.1615306885533; 
 Tue, 09 Mar 2021 08:21:25 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:21:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 37/78] target/arm: Implement SVE2 complex integer
 multiply-add
Date: Tue,  9 Mar 2021 08:20:00 -0800
Message-Id: <20210309162041.23124-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
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
index 61903cded6..3bf81d96ae 100644
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
index c112548db4..29d33389c2 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7657,3 +7657,35 @@ static bool trans_UMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
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


