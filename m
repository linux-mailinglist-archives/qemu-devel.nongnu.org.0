Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA85390625
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:04:06 +0200 (CEST)
Received: from localhost ([::1]:38770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZXJ-00033E-Lk
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYcG-0004tS-Fr
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:05:08 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYc9-00052Y-Lt
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:05:08 -0400
Received: by mail-wr1-x430.google.com with SMTP id j14so30854501wrq.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FQNhMVI+8b9PFV6PwjAmmX5OJEuiV+gOxNR5/dWmhtQ=;
 b=vmxQel1BFAJPEfw3LtslvZPU/9L62VZ4OcKD27hsBcnpwzWEm9gcU9tsEpsHJwXMGp
 8S01lPflnnE3/3ChfJVGl2iasKqCgJWOoVjX1KGAm7g+EeYXf0HNTSlkoYuKze6to6k1
 YkhMNAFZbVbP2JKDSZr+AO+Nmd8wqd5wSqf/prqvYaJnzvHZPmZbHf3jgjtQ3XvjiEoC
 4g+TSXKIi6X0E8pO+BLJqeYd0Tv1RgsGCmYBvTpfW7cO7Ya6EnQd8FM0rRiPW15Evy4Y
 M0ABBfK+LE+9EGgGXK5noIIR0zeImNoGM+0qBz7VHfM8PdVmHO8AoHTSvV2arvRqLHwA
 Lovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FQNhMVI+8b9PFV6PwjAmmX5OJEuiV+gOxNR5/dWmhtQ=;
 b=OzyMxDQQVxgBl2SFdkze3oq1nknqrUSKNMfLKq5tQrYeme+FQVXKtIlCXFizHD2Wdf
 5vvfQQWD0jdn3n+KyEFFDfMB82CHsGlCuNAOXqheXGJ/UzS6YUKafGZva185UXmj2cSV
 ETQfmXGYwSy79x7EOdG11mMjCG0uV7h+wvsfz2De408QzJ40rHv6XjYqDcLX790iztHu
 DJCb15ufEdfpaN5/K4EXq/7q8rFySLd16/nS9vGr3wCB3rxHvXvcA+ppcQrnslRdz/nO
 eSxncXAI4NrhKU7iKzkobIng2n2zbJW4NY1FMe291KOzlIODJT4ax744oCEA1BYC4ohI
 o4nA==
X-Gm-Message-State: AOAM533kaR/mL5SXke3AIMUVV7zHBbbuUYjE1+t86SRSPt6fMeL1ORNo
 5mOIBZfYF2qQB6ZkYdm9bJKPsuSgaeWd0KXo
X-Google-Smtp-Source: ABdhPJz0+ufROqf4lytXDI1jQeakiZ+TL1M7aN/ylddIk+N3A1/lHQajBDS++bl7eurI3n7xh0qDHg==
X-Received: by 2002:adf:e84a:: with SMTP id d10mr27833342wrn.132.1621955100082; 
 Tue, 25 May 2021 08:05:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 093/114] target/arm: Implement SVE2 TBL, TBX
Date: Tue, 25 May 2021 16:03:03 +0100
Message-Id: <20210525150324.32370-94-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

From: Stephen Long <steplong@quicinc.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stephen Long <steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-72-richard.henderson@linaro.org
Message-Id: <20200428144352.9275-1-steplong@quicinc.com>
[rth: rearrange the macros a little and rebase]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h    | 10 +++++
 target/arm/sve.decode      |  5 +++
 target/arm/sve_helper.c    | 90 ++++++++++++++++++++++++++++++--------
 target/arm/translate-sve.c | 33 ++++++++++++++
 4 files changed, 119 insertions(+), 19 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index efc9a7ccf18..cdff155ead4 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -661,6 +661,16 @@ DEF_HELPER_FLAGS_4(sve_tbl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_tbl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_tbl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_tbl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_tbl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_tbl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_tbl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_tbx_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_tbx_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_tbx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_tbx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(sve_sunpk_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_sunpk_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_sunpk_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 051a6399ac0..fdeb7b106b3 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -558,6 +558,11 @@ TBL             00000101 .. 1 ..... 001100 ..... .....          @rd_rn_rm
 # SVE unpack vector elements
 UNPK            00000101 esz:2 1100 u:1 h:1 001110 rn:5 rd:5
 
+# SVE2 Table Lookup (three sources)
+
+TBL_sve2        00000101 .. 1 ..... 001010 ..... .....          @rd_rn_rm
+TBX             00000101 .. 1 ..... 001011 ..... .....          @rd_rn_rm
+
 ### SVE Permute - Predicates Group
 
 # SVE permute predicate elements
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index f9c20612602..4b05e2e4276 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3069,28 +3069,80 @@ void HELPER(sve_rev_d)(void *vd, void *vn, uint32_t desc)
     }
 }
 
-#define DO_TBL(NAME, TYPE, H) \
-void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
-{                                                              \
-    intptr_t i, opr_sz = simd_oprsz(desc);                     \
-    uintptr_t elem = opr_sz / sizeof(TYPE);                    \
-    TYPE *d = vd, *n = vn, *m = vm;                            \
-    ARMVectorReg tmp;                                          \
-    if (unlikely(vd == vn)) {                                  \
-        n = memcpy(&tmp, vn, opr_sz);                          \
-    }                                                          \
-    for (i = 0; i < elem; i++) {                               \
-        TYPE j = m[H(i)];                                      \
-        d[H(i)] = j < elem ? n[H(j)] : 0;                      \
-    }                                                          \
+typedef void tb_impl_fn(void *, void *, void *, void *, uintptr_t, bool);
+
+static inline void do_tbl1(void *vd, void *vn, void *vm, uint32_t desc,
+                           bool is_tbx, tb_impl_fn *fn)
+{
+    ARMVectorReg scratch;
+    uintptr_t oprsz = simd_oprsz(desc);
+
+    if (unlikely(vd == vn)) {
+        vn = memcpy(&scratch, vn, oprsz);
+    }
+
+    fn(vd, vn, NULL, vm, oprsz, is_tbx);
 }
 
-DO_TBL(sve_tbl_b, uint8_t, H1)
-DO_TBL(sve_tbl_h, uint16_t, H2)
-DO_TBL(sve_tbl_s, uint32_t, H4)
-DO_TBL(sve_tbl_d, uint64_t, )
+static inline void do_tbl2(void *vd, void *vn0, void *vn1, void *vm,
+                           uint32_t desc, bool is_tbx, tb_impl_fn *fn)
+{
+    ARMVectorReg scratch;
+    uintptr_t oprsz = simd_oprsz(desc);
 
-#undef TBL
+    if (unlikely(vd == vn0)) {
+        vn0 = memcpy(&scratch, vn0, oprsz);
+        if (vd == vn1) {
+            vn1 = vn0;
+        }
+    } else if (unlikely(vd == vn1)) {
+        vn1 = memcpy(&scratch, vn1, oprsz);
+    }
+
+    fn(vd, vn0, vn1, vm, oprsz, is_tbx);
+}
+
+#define DO_TB(SUFF, TYPE, H)                                            \
+static inline void do_tb_##SUFF(void *vd, void *vt0, void *vt1,         \
+                                void *vm, uintptr_t oprsz, bool is_tbx) \
+{                                                                       \
+    TYPE *d = vd, *tbl0 = vt0, *tbl1 = vt1, *indexes = vm;              \
+    uintptr_t i, nelem = oprsz / sizeof(TYPE);                          \
+    for (i = 0; i < nelem; ++i) {                                       \
+        TYPE index = indexes[H1(i)], val = 0;                           \
+        if (index < nelem) {                                            \
+            val = tbl0[H(index)];                                       \
+        } else {                                                        \
+            index -= nelem;                                             \
+            if (tbl1 && index < nelem) {                                \
+                val = tbl1[H(index)];                                   \
+            } else if (is_tbx) {                                        \
+                continue;                                               \
+            }                                                           \
+        }                                                               \
+        d[H(i)] = val;                                                  \
+    }                                                                   \
+}                                                                       \
+void HELPER(sve_tbl_##SUFF)(void *vd, void *vn, void *vm, uint32_t desc) \
+{                                                                       \
+    do_tbl1(vd, vn, vm, desc, false, do_tb_##SUFF);                     \
+}                                                                       \
+void HELPER(sve2_tbl_##SUFF)(void *vd, void *vn0, void *vn1,            \
+                             void *vm, uint32_t desc)                   \
+{                                                                       \
+    do_tbl2(vd, vn0, vn1, vm, desc, false, do_tb_##SUFF);               \
+}                                                                       \
+void HELPER(sve2_tbx_##SUFF)(void *vd, void *vn, void *vm, uint32_t desc) \
+{                                                                       \
+    do_tbl1(vd, vn, vm, desc, true, do_tb_##SUFF);                      \
+}
+
+DO_TB(b, uint8_t, H1)
+DO_TB(h, uint16_t, H2)
+DO_TB(s, uint32_t, H4)
+DO_TB(d, uint64_t,   )
+
+#undef DO_TB
 
 #define DO_UNPK(NAME, TYPED, TYPES, HD, HS) \
 void HELPER(NAME)(void *vd, void *vn, uint32_t desc)           \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2136a410945..9a6f7c87c1e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2417,6 +2417,39 @@ static bool trans_TBL(DisasContext *s, arg_rrr_esz *a)
     return true;
 }
 
+static bool trans_TBL_sve2(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_4 * const fns[4] = {
+        gen_helper_sve2_tbl_b, gen_helper_sve2_tbl_h,
+        gen_helper_sve2_tbl_s, gen_helper_sve2_tbl_d
+    };
+
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
+                          (a->rn + 1) % 32, a->rm, 0);
+    }
+    return true;
+}
+
+static bool trans_TBX(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_tbx_b, gen_helper_sve2_tbx_h,
+        gen_helper_sve2_tbx_s, gen_helper_sve2_tbx_d
+    };
+
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
+    }
+    return true;
+}
+
 static bool trans_UNPK(DisasContext *s, arg_UNPK *a)
 {
     static gen_helper_gvec_2 * const fns[4][2] = {
-- 
2.20.1


