Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCD9332D0F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:17:44 +0100 (CET)
Received: from localhost ([::1]:50740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfzL-0006La-6i
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:17:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6e-0007A5-2D
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:12 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:37260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6P-0002RW-Qw
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:11 -0500
Received: by mail-oi1-x232.google.com with SMTP id u198so10576768oia.4
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mipsCScn6r1g4sWz6wUddE3d54Z8gTngCu5kJItzM9c=;
 b=jtAOYkEWezcMR+4TsfAsGTYDhc4LRXxHX70yqEFjEFmBo4PXALLUQSKk1cEHQcoBrQ
 XSTq4zLpN/rAV6dLHHKRMGLWthhw/FfT2+OOPPN+ltoiwgNcorJBJJVQsgxjVXdGiaxt
 niWHPBMPh2Uy6zMpqGwhxAu/yIWL1hewkJPcb6smJMOvV2T2760SJqsI2ZrM5/nR0WAu
 gxueUol4juZhm3vYwSoLT0yty5mxzTrGCNfgLUQSZ2fFl865R3+GLbpJXvpOKfsVmrSS
 K8+60lsLN1JTEu85gNkWo9fGSZnD8jLPthCm24SgcJaCC5Npxuaij1MXG3/GVtl8Df3A
 CDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mipsCScn6r1g4sWz6wUddE3d54Z8gTngCu5kJItzM9c=;
 b=cAFxvTbfuBUL2F5E75GwdMGz9mF0epYL6oVaPU4LWD92mawArKg90nB/RqGaZk6RVD
 JN+zRbfkg9ZdBZJV/xBKWAZ/eGihm3/3WD1r03rv2iZMEE63b9ok0p954PeCPoLzRfmP
 i6vc+/E63fzZ1mXP78xySr34w0Iv2k0Qumuikibmf1+5i5fYyeCtunl9HCzC27KO3urw
 /hElnyjNaUSXp2G3rul0HdfkKcG7vYO2hralaXy0LskWma8bhTJ0hpbVOjaeZ9OAaYyG
 hUkI52qtp4ejZQUOdQyyJJzjia6pKW8ANh3q9DzyPiYOiez/BrGGypeDp8BEUJprJpGx
 uIFQ==
X-Gm-Message-State: AOAM533wH+3+CUFjAbaOKZZOd638iU+Mj4wo6cTpwswKgWaM+XUDzgEb
 3ghpTTq7Z5eYfdTt837DHavK6AFq8Hh2VAZd
X-Google-Smtp-Source: ABdhPJyDdlhOPKu3Iw5ycRSFlevRLXO0foGSjQ2kW4OjkJJsvAAeZy8zOlbR14MKZIWGC9MYwFrBfQ==
X-Received: by 2002:aca:b787:: with SMTP id h129mr2391453oif.58.1615306856885; 
 Tue, 09 Mar 2021 08:20:56 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:20:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/78] target/arm: Implement SVE2 integer add/subtract wide
Date: Tue,  9 Mar 2021 08:19:35 -0800
Message-Id: <20210309162041.23124-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
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
 target/arm/helper-sve.h    | 16 ++++++++++++++++
 target/arm/sve.decode      | 12 ++++++++++++
 target/arm/sve_helper.c    | 30 ++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 20 ++++++++++++++++++++
 4 files changed, 78 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index a81297b387..3286a9c205 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1391,6 +1391,22 @@ DEF_HELPER_FLAGS_4(sve2_uabdl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_uabdl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_uabdl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_saddw_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_saddw_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_saddw_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_ssubw_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_ssubw_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_ssubw_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_uaddw_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uaddw_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uaddw_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_usubw_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_usubw_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_usubw_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve_ld1bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld2bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld3bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 12be0584a8..f6f21426ef 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1184,3 +1184,15 @@ UABDLT          01000101 .. 0 ..... 00 1111 ..... .....  @rd_rn_rm
 SADDLBT         01000101 .. 0 ..... 1000 00 ..... .....  @rd_rn_rm
 SSUBLBT         01000101 .. 0 ..... 1000 10 ..... .....  @rd_rn_rm
 SSUBLTB         01000101 .. 0 ..... 1000 11 ..... .....  @rd_rn_rm
+
+## SVE2 integer add/subtract wide
+
+SADDWB          01000101 .. 0 ..... 010 000 ..... .....  @rd_rn_rm
+SADDWT          01000101 .. 0 ..... 010 001 ..... .....  @rd_rn_rm
+UADDWB          01000101 .. 0 ..... 010 010 ..... .....  @rd_rn_rm
+UADDWT          01000101 .. 0 ..... 010 011 ..... .....  @rd_rn_rm
+
+SSUBWB          01000101 .. 0 ..... 010 100 ..... .....  @rd_rn_rm
+SSUBWT          01000101 .. 0 ..... 010 101 ..... .....  @rd_rn_rm
+USUBWB          01000101 .. 0 ..... 010 110 ..... .....  @rd_rn_rm
+USUBWT          01000101 .. 0 ..... 010 111 ..... .....  @rd_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 8f22e025e6..5b7b8d27b8 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1156,6 +1156,36 @@ DO_ZZZ_TB(sve2_uabdl_d, uint64_t, uint32_t,     , H1_4, DO_ABD)
 
 #undef DO_ZZZ_TB
 
+#define DO_ZZZ_WTB(NAME, TYPEW, TYPEN, HW, HN, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
+{                                                              \
+    intptr_t i, opr_sz = simd_oprsz(desc);                     \
+    int sel2 = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN); \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {              \
+        TYPEW nn = *(TYPEW *)(vn + HW(i));                     \
+        TYPEW mm = *(TYPEN *)(vm + HN(i + sel2));              \
+        *(TYPEW *)(vd + HW(i)) = OP(nn, mm);                   \
+    }                                                          \
+}
+
+DO_ZZZ_WTB(sve2_saddw_h, int16_t, int8_t, H1_2, H1, DO_ADD)
+DO_ZZZ_WTB(sve2_saddw_s, int32_t, int16_t, H1_4, H1_2, DO_ADD)
+DO_ZZZ_WTB(sve2_saddw_d, int64_t, int32_t,     , H1_4, DO_ADD)
+
+DO_ZZZ_WTB(sve2_ssubw_h, int16_t, int8_t, H1_2, H1, DO_SUB)
+DO_ZZZ_WTB(sve2_ssubw_s, int32_t, int16_t, H1_4, H1_2, DO_SUB)
+DO_ZZZ_WTB(sve2_ssubw_d, int64_t, int32_t,     , H1_4, DO_SUB)
+
+DO_ZZZ_WTB(sve2_uaddw_h, uint16_t, uint8_t, H1_2, H1, DO_ADD)
+DO_ZZZ_WTB(sve2_uaddw_s, uint32_t, uint16_t, H1_4, H1_2, DO_ADD)
+DO_ZZZ_WTB(sve2_uaddw_d, uint64_t, uint32_t,     , H1_4, DO_ADD)
+
+DO_ZZZ_WTB(sve2_usubw_h, uint16_t, uint8_t, H1_2, H1, DO_SUB)
+DO_ZZZ_WTB(sve2_usubw_s, uint32_t, uint16_t, H1_4, H1_2, DO_SUB)
+DO_ZZZ_WTB(sve2_usubw_d, uint64_t, uint32_t,     , H1_4, DO_SUB)
+
+#undef DO_ZZZ_WTB
+
 /* Two-operand reduction expander, controlled by a predicate.
  * The difference between TYPERED and TYPERET has to do with
  * sign-extension.  E.g. for SMAX, TYPERED must be signed,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 105c70dc8c..e88787318c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6021,3 +6021,23 @@ DO_SVE2_ZZZ_TB(UABDLT, uabdl, true, true)
 DO_SVE2_ZZZ_TB(SADDLBT, saddl, false, true)
 DO_SVE2_ZZZ_TB(SSUBLBT, ssubl, false, true)
 DO_SVE2_ZZZ_TB(SSUBLTB, ssubl, true, false)
+
+#define DO_SVE2_ZZZ_WTB(NAME, name, SEL2) \
+static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)       \
+{                                                               \
+    static gen_helper_gvec_3 * const fns[4] = {                 \
+        NULL,                       gen_helper_sve2_##name##_h, \
+        gen_helper_sve2_##name##_s, gen_helper_sve2_##name##_d, \
+    };                                                          \
+    return do_sve2_zzw_ool(s, a, fns[a->esz], SEL2);            \
+}
+
+DO_SVE2_ZZZ_WTB(SADDWB, saddw, false)
+DO_SVE2_ZZZ_WTB(SADDWT, saddw, true)
+DO_SVE2_ZZZ_WTB(SSUBWB, ssubw, false)
+DO_SVE2_ZZZ_WTB(SSUBWT, ssubw, true)
+
+DO_SVE2_ZZZ_WTB(UADDWB, uaddw, false)
+DO_SVE2_ZZZ_WTB(UADDWT, uaddw, true)
+DO_SVE2_ZZZ_WTB(USUBWB, usubw, false)
+DO_SVE2_ZZZ_WTB(USUBWT, usubw, true)
-- 
2.25.1


