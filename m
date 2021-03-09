Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D09332E63
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:38:29 +0100 (CET)
Received: from localhost ([::1]:56364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhFU-0001ES-E3
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:38:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7y-0000Qb-1F
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:39 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:41373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7j-0002oY-IB
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:33 -0500
Received: by mail-oi1-x22e.google.com with SMTP id y131so12658601oia.8
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gAITA8fVumfgJ7BWNimYNqBynCeOl0cQ9txvmPBZezA=;
 b=Y9D4dGUjAu1wb98gLhfsbm1/jkqbWR2PIVsHfHeOs2hREjuZqpjqrATb+PS8aDu7oI
 53uOgm9jETIlm578QCwp8oW8l1LjhR5J8axvykjMpWjfKawFR+wS8mpr9tRiiTBBf83Z
 FYAENDYDd3jAYVxc9v6vS9C+5FxzZe//qkB/nLriMkMyeoWT0P8FUfkkAa4MS7MwKDc8
 9l7XnXslOPr31+WRGVauqGSs8gFQ/eWuHk6q5wrhJGac/dCSnvsY6+si1Xwi4Bxw97qU
 22W5bsk0D8yXFesxHruum9qqA9SoEWhdvLO+BfD6gfjOAj1oKbTr8r5o6Q+ZQwp2r1q1
 WSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gAITA8fVumfgJ7BWNimYNqBynCeOl0cQ9txvmPBZezA=;
 b=q0KE+gTLmADFSw8sUdSyuyTIyHW38BMUOdB19xpKkmm2KaTRQbL4zvJjGIQGehPjQw
 BWxTZIKG6LI1wp0x68/rotkH1kRXoM7IHkOXXLjV41Ht4EOaWdQd+L/Xrr7iu6TXLH2J
 k+1TzD74354Bd8AIAg2SPDgaKj65ncjfF+YeTYa8U20l30MHsIIJh1nFqa0JcxP0NAde
 X+XP4njEzsIBv2Rp95zRu0/AUjTKl6sy/+4apbkt06yZ11ZMRvbiXvnmBpPoNz8mMTD2
 KG+czMKSBPwcG+iNGfNnLBBXyDoKrCE8TthRNBc3SpIxTRhGjNrBheW0ivz8u0vZYvjC
 R8Cg==
X-Gm-Message-State: AOAM533GjvplWiTbaL8D8ygm7uNlNES4zT50Rgk2wcUauK/mC+88EcDG
 h+WmzyHAT+MeiHnON5rns0YcVql+2iiKhD1O
X-Google-Smtp-Source: ABdhPJwj2uKemrPl1uorT8yUOhER+Yhn0v6BB82E1Y3Rw33JmF2Twt8kJYN5CnRoYm8gcl3Melwh4w==
X-Received: by 2002:aca:c2d7:: with SMTP id s206mr3317786oif.95.1615306937661; 
 Tue, 09 Mar 2021 08:22:17 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:22:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 56/78] target/arm: Implement SVE2 integer multiply long
 (indexed)
Date: Tue,  9 Mar 2021 08:20:19 -0800
Message-Id: <20210309162041.23124-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      | 16 ++++++++++++++++
 target/arm/sve_helper.c    | 23 +++++++++++++++++++++++
 target/arm/translate-sve.c | 24 ++++++++++++++++++++----
 4 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 08398800bd..a3690082af 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2688,3 +2688,8 @@ DEF_HELPER_FLAGS_5(sve2_sqdmlsl_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_sqdmlsl_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_smull_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_smull_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_umull_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_umull_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 6900e79492..ebb892748b 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -257,6 +257,12 @@
 @rrx_d          ........ 11 . index:1 rm:4 ...... rn:5 rd:5 \
                 &rrx_esz esz=3
 
+# Two registers and a scalar by index, wide
+@rrxl_s         ........ 10 ... rm:3 ...... rn:5 rd:5 \
+                &rrx_esz index=%index3_19_11 esz=2
+@rrxl_d         ........ 11 ..  rm:4 ...... rn:5 rd:5 \
+                &rrx_esz index=%index2_20_11 esz=3
+
 # Three registers and a scalar by index
 @rrxr_h         ........ 0. . ..      rm:3 ...... rn:5 rd:5 \
                 &rrxr_esz ra=%reg_movprfx index=%index3_22_19 esz=1
@@ -819,6 +825,16 @@ SQDMLSLB_zzxw_d 01000100 .. 1 ..... 0011.0 ..... .....          @rrxw_d
 SQDMLSLT_zzxw_s 01000100 .. 1 ..... 0011.1 ..... .....          @rrxw_s
 SQDMLSLT_zzxw_d 01000100 .. 1 ..... 0011.1 ..... .....          @rrxw_d
 
+# SVE2 integer multiply long (indexed)
+SMULLB_zzx_s    01000100 .. 1 ..... 1100.0 ..... .....          @rrxl_s
+SMULLB_zzx_d    01000100 .. 1 ..... 1100.0 ..... .....          @rrxl_d
+SMULLT_zzx_s    01000100 .. 1 ..... 1100.1 ..... .....          @rrxl_s
+SMULLT_zzx_d    01000100 .. 1 ..... 1100.1 ..... .....          @rrxl_d
+UMULLB_zzx_s    01000100 .. 1 ..... 1101.0 ..... .....          @rrxl_s
+UMULLB_zzx_d    01000100 .. 1 ..... 1101.0 ..... .....          @rrxl_d
+UMULLT_zzx_s    01000100 .. 1 ..... 1101.1 ..... .....          @rrxl_s
+UMULLT_zzx_d    01000100 .. 1 ..... 1101.1 ..... .....          @rrxl_d
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 .. 1 ..... 111110 ..... .....          @rrx_h
 MUL_zzx_s       01000100 .. 1 ..... 111110 ..... .....          @rrx_s
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 6ad1158455..b64e1f243d 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1560,6 +1560,29 @@ DO_ZZXW(sve2_sqdmlsl_idx_d, int64_t, int32_t,     , H1_4, DO_SQDMLSL_D)
 
 #undef DO_ZZXW
 
+#define DO_ZZX(NAME, TYPEW, TYPEN, HW, HN, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)            \
+{                                                                         \
+    intptr_t i, j, oprsz = simd_oprsz(desc);                              \
+    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN);   \
+    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 1, 3) * sizeof(TYPEN); \
+    for (i = 0; i < oprsz; i += 16) {                                     \
+        TYPEW mm = *(TYPEN *)(vm + i + idx);                              \
+        for (j = 0; j < 16; j += sizeof(TYPEW)) {                         \
+            TYPEW nn = *(TYPEN *)(vn + HN(i + j + sel));                  \
+            *(TYPEW *)(vd + HW(i + j)) = OP(nn, mm);                      \
+        }                                                                 \
+    }                                                                     \
+}
+
+DO_ZZX(sve2_smull_idx_s, int32_t, int16_t, H1_4, H1_2, DO_MUL)
+DO_ZZX(sve2_smull_idx_d, int64_t, int32_t,     , H1_4, DO_MUL)
+
+DO_ZZX(sve2_umull_idx_s, uint32_t, uint16_t, H1_4, H1_2, DO_MUL)
+DO_ZZX(sve2_umull_idx_d, uint64_t, uint32_t,     , H1_4, DO_MUL)
+
+#undef DO_ZZX
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a3261561c0..6376a21b98 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3840,8 +3840,8 @@ DO_RRXR(trans_UDOT_zzxw_d, gen_helper_gvec_udot_idx_h)
 
 #undef DO_RRXR
 
-static bool do_sve2_zzx_ool(DisasContext *s, arg_rrx_esz *a,
-                            gen_helper_gvec_3 *fn)
+static bool do_sve2_zzx_data(DisasContext *s, arg_rrx_esz *a,
+                             gen_helper_gvec_3 *fn, int data)
 {
     if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
         return false;
@@ -3851,14 +3851,14 @@ static bool do_sve2_zzx_ool(DisasContext *s, arg_rrx_esz *a,
         tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
                            vec_full_reg_offset(s, a->rn),
                            vec_full_reg_offset(s, a->rm),
-                           vsz, vsz, a->index, fn);
+                           vsz, vsz, data, fn);
     }
     return true;
 }
 
 #define DO_SVE2_RRX(NAME, FUNC) \
     static bool NAME(DisasContext *s, arg_rrx_esz *a)  \
-    { return do_sve2_zzx_ool(s, a, FUNC); }
+    { return do_sve2_zzx_data(s, a, FUNC, a->index); }
 
 DO_SVE2_RRX(trans_MUL_zzx_h, gen_helper_gvec_mul_idx_h)
 DO_SVE2_RRX(trans_MUL_zzx_s, gen_helper_gvec_mul_idx_s)
@@ -3866,6 +3866,22 @@ DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
 
 #undef DO_SVE2_RRX
 
+#define DO_SVE2_RRX_TB(NAME, FUNC, TOP) \
+    static bool NAME(DisasContext *s, arg_rrx_esz *a)  \
+    { return do_sve2_zzx_data(s, a, FUNC, (a->index << 1) | TOP); }
+
+DO_SVE2_RRX_TB(trans_SMULLB_zzx_s, gen_helper_sve2_smull_idx_s, false)
+DO_SVE2_RRX_TB(trans_SMULLB_zzx_d, gen_helper_sve2_smull_idx_d, false)
+DO_SVE2_RRX_TB(trans_SMULLT_zzx_s, gen_helper_sve2_smull_idx_s, true)
+DO_SVE2_RRX_TB(trans_SMULLT_zzx_d, gen_helper_sve2_smull_idx_d, true)
+
+DO_SVE2_RRX_TB(trans_UMULLB_zzx_s, gen_helper_sve2_umull_idx_s, false)
+DO_SVE2_RRX_TB(trans_UMULLB_zzx_d, gen_helper_sve2_umull_idx_d, false)
+DO_SVE2_RRX_TB(trans_UMULLT_zzx_s, gen_helper_sve2_umull_idx_s, true)
+DO_SVE2_RRX_TB(trans_UMULLT_zzx_d, gen_helper_sve2_umull_idx_d, true)
+
+#undef DO_SVE2_RRX_TB
+
 static bool do_sve2_zzxz_data(DisasContext *s, arg_rrxr_esz *a,
                               gen_helper_gvec_4 *fn, int data)
 {
-- 
2.25.1


