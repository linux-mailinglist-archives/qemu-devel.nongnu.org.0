Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AE0332D52
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:32:49 +0100 (CET)
Received: from localhost ([::1]:50814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJgDw-0002jG-Eg
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:32:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6d-00079O-4s
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:11 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:45925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6O-0002R3-8n
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:10 -0500
Received: by mail-oi1-x233.google.com with SMTP id t83so5550481oih.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ALuD3u4vRQ1W3ilZFnOTMRI40+P7noMwmrau2Rl0oOs=;
 b=VA+lmLkLyJ7OOnHoHD0nTuRs+/4t6k53adCvz0cl5yr9GwOqyjhIlNptMmMU6E+Eqp
 cEgdabQ221LwL9oGZZcMaX1Rt7Vu4MrRotqDCRv7//oJUCs217c2IEWe+wLkT+fAifoy
 dgR8vPkuLsPAgwpdYfUIwPTuEtY9iHkVeKbObn/64wjuEkVZVWVkPXz3DDMe+jmHQiBC
 b21K21S87FLCdagT7hqAG050j/D98oYJ7q8GMas3YrKa6cjO+96b3dWS+WPw5FWwir2I
 ed2IimXcsl6aK7w3n72snfOBGGwykg2OopgdSIibdv2bow1KQ4HMNqaryN3/v93voLgz
 3rZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ALuD3u4vRQ1W3ilZFnOTMRI40+P7noMwmrau2Rl0oOs=;
 b=LKx4ZnuCRWYnWPyttUNVGyXKcj9scoKuu7KeyQA0nXsqCSOVfczcytq8BGqrR4jcvd
 bRFdOAucNkZwUrnrhTeIZjWIIkTes0fgEEEeqEi1JGg5W5UeAguhhVjBz/9VxhNwpOph
 WBUoWquxGIUbsr/9JBRf6dxMi5CNkcAYZRtsopCq3bCrqaPpXGYHjPhXrKmTZLFA8wIQ
 iYGLsKSBZITuhiHNqOW4dYx9llNGilELsknkO27d4Fwu4JI8Sm8waLkDJM7fUr4TZajE
 Y+Ig+vLmk157HvQvBqDfyFWZt7GUZl7MV5pwKLpYSm/qEHgtwutoShHDrFasTMn6H4S3
 4PvA==
X-Gm-Message-State: AOAM532aNEurpBf62fO0EpdXohVPsrqmmZe2sUiHmL/pAqvt0uTV7Llx
 GOc2rbrZs1x9T198VHr/LtV+BZenPCK0Zq0H
X-Google-Smtp-Source: ABdhPJzB2eNliMpD8PDhfiuf6cxrWjsDRuyVuIb40uaJPjUPfji7WTGS5/Xy+UTfmrrPN2+Kp1IIIA==
X-Received: by 2002:a54:4494:: with SMTP id v20mr3492740oiv.147.1615306854731; 
 Tue, 09 Mar 2021 08:20:54 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:20:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/78] target/arm: Implement SVE2 integer add/subtract long
Date: Tue,  9 Mar 2021 08:19:33 -0800
Message-Id: <20210309162041.23124-11-richard.henderson@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
v2: Fix select offsets (laurent desnogues).
---
 target/arm/helper-sve.h    | 24 ++++++++++++++++++++
 target/arm/sve.decode      | 19 ++++++++++++++++
 target/arm/sve_helper.c    | 43 +++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 46 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 132 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 37461c9927..a81297b387 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1367,6 +1367,30 @@ DEF_HELPER_FLAGS_5(sve_ftmad_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_ftmad_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_ftmad_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_saddl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_saddl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_saddl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_ssubl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_ssubl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_ssubl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sabdl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sabdl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sabdl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_uaddl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uaddl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uaddl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_usubl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_usubl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_usubl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_uabdl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uabdl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uabdl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve_ld1bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld2bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld3bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index cd4f73265f..fbfd57b23a 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1159,3 +1159,22 @@ SUQADD          01000100 .. 011 100 100 ... ..... .....  @rdn_pg_rm
 USQADD          01000100 .. 011 101 100 ... ..... .....  @rdn_pg_rm
 SQSUB_zpzz      01000100 .. 011 110 100 ... ..... .....  @rdm_pg_rn # SQSUBR
 UQSUB_zpzz      01000100 .. 011 111 100 ... ..... .....  @rdm_pg_rn # UQSUBR
+
+#### SVE2 Widening Integer Arithmetic
+
+## SVE2 integer add/subtract long
+
+SADDLB          01000101 .. 0 ..... 00 0000 ..... .....  @rd_rn_rm
+SADDLT          01000101 .. 0 ..... 00 0001 ..... .....  @rd_rn_rm
+UADDLB          01000101 .. 0 ..... 00 0010 ..... .....  @rd_rn_rm
+UADDLT          01000101 .. 0 ..... 00 0011 ..... .....  @rd_rn_rm
+
+SSUBLB          01000101 .. 0 ..... 00 0100 ..... .....  @rd_rn_rm
+SSUBLT          01000101 .. 0 ..... 00 0101 ..... .....  @rd_rn_rm
+USUBLB          01000101 .. 0 ..... 00 0110 ..... .....  @rd_rn_rm
+USUBLT          01000101 .. 0 ..... 00 0111 ..... .....  @rd_rn_rm
+
+SABDLB          01000101 .. 0 ..... 00 1100 ..... .....  @rd_rn_rm
+SABDLT          01000101 .. 0 ..... 00 1101 ..... .....  @rd_rn_rm
+UABDLB          01000101 .. 0 ..... 00 1110 ..... .....  @rd_rn_rm
+UABDLT          01000101 .. 0 ..... 00 1111 ..... .....  @rd_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 009d49e81d..8f22e025e6 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1113,6 +1113,49 @@ DO_ZZW(sve_lsl_zzw_s, uint32_t, uint64_t, H1_4, DO_LSL)
 #undef DO_ZPZ
 #undef DO_ZPZ_D
 
+/*
+ * Three-operand expander, unpredicated, in which the two inputs are
+ * selected from the top or bottom half of the wide column.
+ */
+#define DO_ZZZ_TB(NAME, TYPEW, TYPEN, HW, HN, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)          \
+{                                                                       \
+    intptr_t i, opr_sz = simd_oprsz(desc);                              \
+    int sel1 = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN);     \
+    int sel2 = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(TYPEN); \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                       \
+        TYPEW nn = *(TYPEN *)(vn + HN(i + sel1));                       \
+        TYPEW mm = *(TYPEN *)(vm + HN(i + sel2));                       \
+        *(TYPEW *)(vd + HW(i)) = OP(nn, mm);                            \
+    }                                                                   \
+}
+
+DO_ZZZ_TB(sve2_saddl_h, int16_t, int8_t, H1_2, H1, DO_ADD)
+DO_ZZZ_TB(sve2_saddl_s, int32_t, int16_t, H1_4, H1_2, DO_ADD)
+DO_ZZZ_TB(sve2_saddl_d, int64_t, int32_t,     , H1_4, DO_ADD)
+
+DO_ZZZ_TB(sve2_ssubl_h, int16_t, int8_t, H1_2, H1, DO_SUB)
+DO_ZZZ_TB(sve2_ssubl_s, int32_t, int16_t, H1_4, H1_2, DO_SUB)
+DO_ZZZ_TB(sve2_ssubl_d, int64_t, int32_t,     , H1_4, DO_SUB)
+
+DO_ZZZ_TB(sve2_sabdl_h, int16_t, int8_t, H1_2, H1, DO_ABD)
+DO_ZZZ_TB(sve2_sabdl_s, int32_t, int16_t, H1_4, H1_2, DO_ABD)
+DO_ZZZ_TB(sve2_sabdl_d, int64_t, int32_t,     , H1_4, DO_ABD)
+
+DO_ZZZ_TB(sve2_uaddl_h, uint16_t, uint8_t, H1_2, H1, DO_ADD)
+DO_ZZZ_TB(sve2_uaddl_s, uint32_t, uint16_t, H1_4, H1_2, DO_ADD)
+DO_ZZZ_TB(sve2_uaddl_d, uint64_t, uint32_t,     , H1_4, DO_ADD)
+
+DO_ZZZ_TB(sve2_usubl_h, uint16_t, uint8_t, H1_2, H1, DO_SUB)
+DO_ZZZ_TB(sve2_usubl_s, uint32_t, uint16_t, H1_4, H1_2, DO_SUB)
+DO_ZZZ_TB(sve2_usubl_d, uint64_t, uint32_t,     , H1_4, DO_SUB)
+
+DO_ZZZ_TB(sve2_uabdl_h, uint16_t, uint8_t, H1_2, H1, DO_ABD)
+DO_ZZZ_TB(sve2_uabdl_s, uint32_t, uint16_t, H1_4, H1_2, DO_ABD)
+DO_ZZZ_TB(sve2_uabdl_d, uint64_t, uint32_t,     , H1_4, DO_ABD)
+
+#undef DO_ZZZ_TB
+
 /* Two-operand reduction expander, controlled by a predicate.
  * The difference between TYPERED and TYPERET has to do with
  * sign-extension.  E.g. for SMAX, TYPERED must be signed,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index fc8e2a84f2..b94561b92b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5971,3 +5971,49 @@ DO_SVE2_ZPZZ(SQSUB_zpzz, sqsub)
 DO_SVE2_ZPZZ(UQSUB_zpzz, uqsub)
 DO_SVE2_ZPZZ(SUQADD, suqadd)
 DO_SVE2_ZPZZ(USQADD, usqadd)
+
+/*
+ * SVE2 Widening Integer Arithmetic
+ */
+
+static bool do_sve2_zzw_ool(DisasContext *s, arg_rrr_esz *a,
+                            gen_helper_gvec_3 *fn, int data)
+{
+    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vsz, vsz, data, fn);
+    }
+    return true;
+}
+
+#define DO_SVE2_ZZZ_TB(NAME, name, SEL1, SEL2) \
+static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)               \
+{                                                                       \
+    static gen_helper_gvec_3 * const fns[4] = {                         \
+        NULL,                       gen_helper_sve2_##name##_h,         \
+        gen_helper_sve2_##name##_s, gen_helper_sve2_##name##_d,         \
+    };                                                                  \
+    return do_sve2_zzw_ool(s, a, fns[a->esz], (SEL2 << 1) | SEL1);      \
+}
+
+DO_SVE2_ZZZ_TB(SADDLB, saddl, false, false)
+DO_SVE2_ZZZ_TB(SSUBLB, ssubl, false, false)
+DO_SVE2_ZZZ_TB(SABDLB, sabdl, false, false)
+
+DO_SVE2_ZZZ_TB(UADDLB, uaddl, false, false)
+DO_SVE2_ZZZ_TB(USUBLB, usubl, false, false)
+DO_SVE2_ZZZ_TB(UABDLB, uabdl, false, false)
+
+DO_SVE2_ZZZ_TB(SADDLT, saddl, true, true)
+DO_SVE2_ZZZ_TB(SSUBLT, ssubl, true, true)
+DO_SVE2_ZZZ_TB(SABDLT, sabdl, true, true)
+
+DO_SVE2_ZZZ_TB(UADDLT, uaddl, true, true)
+DO_SVE2_ZZZ_TB(USUBLT, usubl, true, true)
+DO_SVE2_ZZZ_TB(UABDLT, uabdl, true, true)
-- 
2.25.1


