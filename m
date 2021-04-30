Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C883702DE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:19:18 +0200 (CEST)
Received: from localhost ([::1]:35282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcaXd-0004LQ-L8
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZms-00056F-JI
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:31:00 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:51131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlx-0007o9-3L
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:57 -0400
Received: by mail-pj1-x1034.google.com with SMTP id md17so9641461pjb.0
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+CI3rO2/fAJr6W/cC9qBjDDasv8sl2L3ez2hfNlA2z8=;
 b=ejxOchp0ei3LtUgMBNG3+Ii3fWt7NG4uw9uqApZG2ezFScQffUGwQqbzk9i9v0NU8u
 DVylHcA9wmsWP2XNkRfo6bZLlVqnYKsL4ffEgvEhsA9Ch19LBQM1mQ6lZHtAwqINSyhA
 Dv2WA7vWpv8HbrGDQkWgn52tTmpl3CgprLDyY5p+amzd37tYv8Ye9k5mxZStypwvJdXl
 i0lysohQhf9uW+RYuiWGjA9ZFXN51W4kPu0/t8LX6QmcETsflQcqdpnqPO7RMSLDwrrs
 tJ12GX5ES/BFYd5SDnWLu06SlMCrff8kmKrudmPvOY0PDxkptFjHX3Olkv3LAIsYpQPv
 +f5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+CI3rO2/fAJr6W/cC9qBjDDasv8sl2L3ez2hfNlA2z8=;
 b=OHVp6KkL/hczg9aq3yxja7nnPoMoEiH3Lk9oPFJcLp+vXXFDbioUyQr2gB6ISxcW3j
 up4QaInF9R+HT+KAF96UBhMwVRgfox00ZdMdZmZJoL1qrb53Hyl0dX5wlUhUktMdRVvo
 V30OHWKxh0ZmLGsBbvbMsRP84aAiM+3AtIF9lTCXAyRjAlE9S3P6C+y9GG6afPNhMJ4G
 7sJE4rv+ynQHkaTeFSmWSXc5T55zJFNFPrlPejtRHYyGKArrEyG5OQa2YDfgTkaw6WZk
 U1mcPTSs14/r6pKw3q7T9Dgda6ytLXw31MmxMAw6bCwdw9PGhnnjWxMwKxgjh7NgZD5W
 tHQg==
X-Gm-Message-State: AOAM533cwUp13mrKihpF50Wf1wlj32S2W1b1vTZbz8xkbrS5oitRaUqs
 M7Tw/PbvdyVRTERadCRx0K+9sZuMoKMv6A==
X-Google-Smtp-Source: ABdhPJzvfLIKx0ov1fmyl/VclwX0+8xh7Uh8+eH1qqoTvkpP97hZ++03inlU4yWjWaT8WKkKGux6nA==
X-Received: by 2002:a17:90a:650c:: with SMTP id
 i12mr17031182pjj.204.1619814596450; 
 Fri, 30 Apr 2021 13:29:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 73/82] target/arm: Implement SVE2 fp multiply-add long
Date: Fri, 30 Apr 2021 13:26:01 -0700
Message-Id: <20210430202610.1136687-74-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Long <steplong@quicinc.com>

Implements both vectored and indexed FMLALB, FMLALT, FMLSLB, FMLSLT

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200504171240.11220-1-steplong@quicinc.com>
[rth: Rearrange to use float16_to_float32_by_bits.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  5 +++
 target/arm/sve.decode      | 14 +++++++
 target/arm/translate-sve.c | 75 ++++++++++++++++++++++++++++++++++++++
 target/arm/vec_helper.c    | 51 ++++++++++++++++++++++++++
 4 files changed, 145 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 86f938c938..e8b16a401f 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -987,6 +987,11 @@ DEF_HELPER_FLAGS_4(sve2_sqrdmulh_idx_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_4(sve2_sqrdmulh_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_6(sve2_fmlal_zzzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fmlal_zzxw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(gvec_xar_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 #ifdef TARGET_AARCH64
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index cfdee8955b..63870b7539 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -132,6 +132,8 @@
                 &rrrr_esz ra=%reg_movprfx
 
 # Four operand with unused vector element size
+@rda_rn_rm_e0   ........ ... rm:5 ... ... rn:5 rd:5 \
+                &rrrr_esz esz=0 ra=%reg_movprfx
 @rdn_ra_rm_e0   ........ ... rm:5 ... ... ra:5 rd:5 \
                 &rrrr_esz esz=0 rn=%reg_movprfx
 
@@ -1559,3 +1561,15 @@ FCVTLT_sd       01100100 11 0010 11 101 ... ..... .....  @rd_pg_rn_e0
 
 ### SVE2 floating-point convert to integer
 FLOGB           01100101 00 011 esz:2 0101 pg:3 rn:5 rd:5  &rpr_esz
+
+### SVE2 floating-point multiply-add long (vectors)
+FMLALB_zzzw     01100100 10 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_e0
+FMLALT_zzzw     01100100 10 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_e0
+FMLSLB_zzzw     01100100 10 1 ..... 10 1 00 0 ..... .....  @rda_rn_rm_e0
+FMLSLT_zzzw     01100100 10 1 ..... 10 1 00 1 ..... .....  @rda_rn_rm_e0
+
+### SVE2 floating-point multiply-add long (indexed)
+FMLALB_zzxw     01100100 10 1 ..... 0100.0 ..... .....     @rrxr_3a esz=2
+FMLALT_zzxw     01100100 10 1 ..... 0100.1 ..... .....     @rrxr_3a esz=2
+FMLSLB_zzxw     01100100 10 1 ..... 0110.0 ..... .....     @rrxr_3a esz=2
+FMLSLT_zzxw     01100100 10 1 ..... 0110.1 ..... .....     @rrxr_3a esz=2
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1421e892d4..acb8603418 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8468,3 +8468,78 @@ static bool trans_FLOGB(DisasContext *s, arg_rpr_esz *a)
     }
     return true;
 }
+
+static bool do_FMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sub, bool sel)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vec_full_reg_offset(s, a->ra),
+                           cpu_env, vsz, vsz, (sel << 1) | sub,
+                           gen_helper_sve2_fmlal_zzzw_s);
+    }
+    return true;
+}
+
+static bool trans_FMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_FMLAL_zzzw(s, a, false, false);
+}
+
+static bool trans_FMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_FMLAL_zzzw(s, a, false, true);
+}
+
+static bool trans_FMLSLB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_FMLAL_zzzw(s, a, true, false);
+}
+
+static bool trans_FMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_FMLAL_zzzw(s, a, true, true);
+}
+
+static bool do_FMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sub, bool sel)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vec_full_reg_offset(s, a->ra),
+                           cpu_env, vsz, vsz,
+                           (a->index << 2) | (sel << 1) | sub,
+                           gen_helper_sve2_fmlal_zzxw_s);
+    }
+    return true;
+}
+
+static bool trans_FMLALB_zzxw(DisasContext *s, arg_rrxr_esz *a)
+{
+    return do_FMLAL_zzxw(s, a, false, false);
+}
+
+static bool trans_FMLALT_zzxw(DisasContext *s, arg_rrxr_esz *a)
+{
+    return do_FMLAL_zzxw(s, a, false, true);
+}
+
+static bool trans_FMLSLB_zzxw(DisasContext *s, arg_rrxr_esz *a)
+{
+    return do_FMLAL_zzxw(s, a, true, false);
+}
+
+static bool trans_FMLSLT_zzxw(DisasContext *s, arg_rrxr_esz *a)
+{
+    return do_FMLAL_zzxw(s, a, true, true);
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 9b2a4d5b7e..ea08b15c55 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -29,10 +29,14 @@
    so addressing units smaller than that needs a host-endian fixup.  */
 #ifdef HOST_WORDS_BIGENDIAN
 #define H1(x)  ((x) ^ 7)
+#define H1_2(x) ((x) ^ 6)
+#define H1_4(x) ((x) ^ 4)
 #define H2(x)  ((x) ^ 3)
 #define H4(x)  ((x) ^ 1)
 #else
 #define H1(x)  (x)
+#define H1_2(x) (x)
+#define H1_4(x) (x)
 #define H2(x)  (x)
 #define H4(x)  (x)
 #endif
@@ -1907,6 +1911,27 @@ void HELPER(gvec_fmlal_a64)(void *vd, void *vn, void *vm,
              get_flush_inputs_to_zero(&env->vfp.fp_status_f16));
 }
 
+void HELPER(sve2_fmlal_zzzw_s)(void *vd, void *vn, void *vm, void *va,
+                               void *venv, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_oprsz(desc);
+    uint16_t negn = extract32(desc, SIMD_DATA_SHIFT, 1) << 15;
+    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(float16);
+    CPUARMState *env = venv;
+    float_status *status = &env->vfp.fp_status;
+    bool fz16 = get_flush_inputs_to_zero(&env->vfp.fp_status_f16);
+
+    for (i = 0; i < oprsz; i += sizeof(float32)) {
+        float16 nn_16 = *(float16 *)(vn + H1_2(i + sel)) ^ negn;
+        float16 mm_16 = *(float16 *)(vm + H1_2(i + sel));
+        float32 nn = float16_to_float32_by_bits(nn_16, fz16);
+        float32 mm = float16_to_float32_by_bits(mm_16, fz16);
+        float32 aa = *(float32 *)(va + H1_4(i));
+
+        *(float32 *)(vd + H1_4(i)) = float32_muladd(nn, mm, aa, 0, status);
+    }
+}
+
 static void do_fmlal_idx(float32 *d, void *vn, void *vm, float_status *fpst,
                          uint32_t desc, bool fz16)
 {
@@ -1951,6 +1976,32 @@ void HELPER(gvec_fmlal_idx_a64)(void *vd, void *vn, void *vm,
                  get_flush_inputs_to_zero(&env->vfp.fp_status_f16));
 }
 
+void HELPER(sve2_fmlal_zzxw_s)(void *vd, void *vn, void *vm, void *va,
+                               void *venv, uint32_t desc)
+{
+    intptr_t i, j, oprsz = simd_oprsz(desc);
+    uint16_t negn = extract32(desc, SIMD_DATA_SHIFT, 1) << 15;
+    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(float16);
+    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 2, 3) * sizeof(float16);
+    CPUARMState *env = venv;
+    float_status *status = &env->vfp.fp_status;
+    bool fz16 = get_flush_inputs_to_zero(&env->vfp.fp_status_f16);
+
+    for (i = 0; i < oprsz; i += 16) {
+        float16 mm_16 = *(float16 *)(vm + i + idx);
+        float32 mm = float16_to_float32_by_bits(mm_16, fz16);
+
+        for (j = 0; j < 16; j += sizeof(float32)) {
+            float16 nn_16 = *(float16 *)(vn + H1_2(i + j + sel)) ^ negn;
+            float32 nn = float16_to_float32_by_bits(nn_16, fz16);
+            float32 aa = *(float32 *)(va + H1_4(i + j));
+
+            *(float32 *)(vd + H1_4(i + j)) =
+                float32_muladd(nn, mm, aa, 0, status);
+        }
+    }
+}
+
 void HELPER(gvec_sshl_b)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-- 
2.25.1


