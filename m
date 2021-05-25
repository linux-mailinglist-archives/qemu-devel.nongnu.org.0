Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2BF38F80F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:24:06 +0200 (CEST)
Received: from localhost ([::1]:51362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMjm-0004L1-2L
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLb1-00067a-Hk
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:10:59 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLat-0005rp-Re
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:10:58 -0400
Received: by mail-pl1-x631.google.com with SMTP id s4so13954797plg.12
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gBzNAdSJ3IF4Sl+NJ02Wycw36cBTOxrQMQhhGPhDwm4=;
 b=K0nQrOs//wf4bCnYirphrVf87mTU7MVlsZ425B1jTCe5Jzeb395rHcb4n8FJOizJ8U
 CIm/S5PK+MJfHyHta9GuYogZa0b9PdhW/7ebRZv23qRbt3PfUTZjsNvRw7FuD02QxBHh
 WiPose/v2fRbtueboiEX20ppviMKBOWf27Ym4ipPKSzb0CTUQ8AIhsBF7ZlrA4SRT5kk
 1IV8xiE1pzF2Iiun4b5P1GmSzXr8804vnMF4eMsE5w1/h+6EObdtOiRPWphle78Hd1be
 p5Rjs1lrYbZTpf1AdMksa0m/DI8C2i9QnKzdo6xPi+pBbFGfSkbPDOhiffZjezmvlJXC
 1ztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gBzNAdSJ3IF4Sl+NJ02Wycw36cBTOxrQMQhhGPhDwm4=;
 b=AKhSDhQZvg3N/ozD5IdoTKY19c9dXtWjSnB+INY8UQOQ7xw+iarxSqgrMIFzjCaNs6
 kUepJnVuQ02MAbF+1H1L3s6qIkGgduf1qLgxYQ572vVIFncO9G2A4T5a2xmNncgP70gv
 6OiL59VSaeC2TneP8RxAqU45tVRx7XqPyA0Z1SAWPOoLlDfBk8/IXk+r1+9g9cikJXHL
 vLxFmRLa1YE5aCA7zdanWzHrMh8QYzC1yoHtDltIpuc4xsixK/IJy2POTlK36c0dg6ef
 xo0O1I6dQkhnTcpKFPW1zhGajNGoPiBYt3h7LvqWmKIkRpI6CxTPYlBR+VAudYIx6/G7
 d3OQ==
X-Gm-Message-State: AOAM531xSfWUr+UgDMtora6VTP3JzHeCtiFqHs+WDghUd8wmF7V7DZN8
 r4NlFuC9KE1N2RhZP7JxC2wch0lUGQW5ng==
X-Google-Smtp-Source: ABdhPJzd8tr0w6DPiwxEnPJ7/CuwSwv4jV9yyH/oat7ejxY4xsu6Uj0Sh9iVCSKP3E0reY36SDp1gg==
X-Received: by 2002:a17:90b:209:: with SMTP id
 fy9mr2068249pjb.92.1621905050614; 
 Mon, 24 May 2021 18:10:50 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id i8sm10614839pjs.54.2021.05.24.18.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:10:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 82/92] target/arm: Implement SVE2 fp multiply-add long
Date: Mon, 24 May 2021 18:03:48 -0700
Message-Id: <20210525010358.152808-83-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Long <steplong@quicinc.com>

Implements both vectored and indexed FMLALB, FMLALT, FMLSLB, FMLSLT

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200504171240.11220-1-steplong@quicinc.com>
[rth: Rearrange to use float16_to_float32_by_bits.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  5 +++
 target/arm/sve.decode      | 14 +++++++
 target/arm/translate-sve.c | 75 ++++++++++++++++++++++++++++++++++++++
 target/arm/vec_helper.c    | 47 ++++++++++++++++++++++++
 4 files changed, 141 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 2e212ae96b..92b81bbabe 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -986,6 +986,11 @@ DEF_HELPER_FLAGS_4(sve2_sqrdmulh_idx_s, TCG_CALL_NO_RWG,
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
index ea98508cdd..78a2a31ab1 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -132,6 +132,8 @@
                 &rrrr_esz ra=%reg_movprfx
 
 # Four operand with unused vector element size
+@rda_rn_rm_e0   ........ ... rm:5 ... ... rn:5 rd:5 \
+                &rrrr_esz esz=0 ra=%reg_movprfx
 @rdn_ra_rm_e0   ........ ... rm:5 ... ... ra:5 rd:5 \
                 &rrrr_esz esz=0 rn=%reg_movprfx
 
@@ -1608,3 +1610,15 @@ FCVTLT_sd       01100100 11 0010 11 101 ... ..... .....  @rd_pg_rn_e0
 
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
index 92c0620bc8..428ae018a3 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8535,3 +8535,78 @@ static bool trans_FLOGB(DisasContext *s, arg_rpr_esz *a)
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
index f5af45375d..19c4ba1bdf 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -1668,6 +1668,27 @@ void HELPER(gvec_fmlal_a64)(void *vd, void *vn, void *vm,
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
@@ -1712,6 +1733,32 @@ void HELPER(gvec_fmlal_idx_a64)(void *vd, void *vn, void *vm,
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


