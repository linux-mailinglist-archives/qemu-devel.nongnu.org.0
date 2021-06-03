Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F364C39A5AE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:25:49 +0200 (CEST)
Received: from localhost ([::1]:47224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqAG-0000SW-Uz
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkl-0000Nn-5b
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:27 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:39452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkj-00072T-3D
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:26 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso6212312wmh.4
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0+RSwT/M706THEo6qExc/FLr5Pmb3+OcBuvoHO4Dy10=;
 b=p49SvcRtaVHwE+SkRUyHOS+Zhvc/8RejrLFWYx3KIVw5fNuyTU9jyVP6h89vWcqwx6
 gsmsnNYSV+TkACv5jssbENHbSLlHzGcAmGlmsNUQdWkNISbrSKhcUC6w8lEsA5f2KC9g
 K+51nW87DBLqOkkt4GOfLa/p8xfFbUKZjX2u/6NEQHOwIqkMHs9mdqbbemzpwJQUCpO4
 bluikou2OaCcnnpE845oVN0ww25bT3IQw+tGq/Fix0bRe/o6Ku/Wla4mAd6k/o0rcWT8
 GydhryddsgCiqw6cxfNr6lLWerKsQNAb+waRqNMefK0JGihwk3mTQppXgk8b3UvIcLeD
 nCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0+RSwT/M706THEo6qExc/FLr5Pmb3+OcBuvoHO4Dy10=;
 b=jAW32vq6pio9y/8Ptba+MZKQwzOoJzsLe3hPD/eQr4TkxAahM5ngA/iu6xC2lPr3b1
 ru/Ts01i4BDytUjCUmlhnlWKTLUp6QOA76DM4SimKFNhA4um6fx/f89ZY8ruCpJ1F7mE
 8jpN2xvS5bYwnKv1D+sjKIM0DYmZOPAxTRFXw01RzZCSXOxREg4YP2lcWC1gP78m/GxA
 gdfh6vTrUn65L+qolQVCXa5+CTec0R4iWLrYx4UeDkPI29jTeYOf3bW5PN6/zE0F+bKZ
 oSfCLmYbDof4X7DPMj4nMmLhBOYGGQ4dsNIEpSIk/Ps1vFXLPTJDwIKI+ltDV176GiOj
 Aj7A==
X-Gm-Message-State: AOAM5309walrDhne1vHT2tBrXLGuTHcevDIukiryABTDnAGtCfK14N2i
 pbWHF8xzNWxHrpZSsyG2/DxQCXLkClKox/qB
X-Google-Smtp-Source: ABdhPJzewl+e4N4RCHDtRDBclkizM8BwtZble+rxQp2Ux68zm66yZbhpsufBHR3nDKXTRAHgIuN28A==
X-Received: by 2002:a1c:a516:: with SMTP id o22mr11053728wme.136.1622735963620; 
 Thu, 03 Jun 2021 08:59:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/45] target/arm: Implement bfloat16 dot product (vector)
Date: Thu,  3 Jun 2021 16:58:40 +0100
Message-Id: <20210603155904.26021-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This is BFDOT for both AArch64 AdvSIMD and SVE,
and VDOT.BF16 for AArch32 NEON.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525225817.400336-7-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h           |  3 +++
 target/arm/neon-shared.decode |  2 ++
 target/arm/sve.decode         |  3 +++
 target/arm/translate-a64.c    | 20 ++++++++++++++++++
 target/arm/translate-neon.c   |  9 ++++++++
 target/arm/translate-sve.c    | 12 +++++++++++
 target/arm/vec_helper.c       | 40 +++++++++++++++++++++++++++++++++++
 7 files changed, 89 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 8b4b7d92f36..de2f5331dcc 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1002,6 +1002,9 @@ DEF_HELPER_FLAGS_5(gvec_ummla_b, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_usmmla_b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_bfdot, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index cc9f4cdd85b..31a0839bbb0 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -52,6 +52,8 @@ VUDOT          1111 110 00 . 10 .... .... 1101 . q:1 . 1 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
 VUSDOT         1111 110 01 . 10 .... .... 1101 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
+VDOT_b16       1111 110 00 . 00 .... .... 1101 . q:1 . 0 .... \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
 
 # VFM[AS]L
 VFML           1111 110 0 s:1 . 10 .... .... 1000 . 0 . 1 .... \
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 18d1a0eecc5..a7429b293fe 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1625,6 +1625,9 @@ FMLALT_zzzw     01100100 10 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_e0
 FMLSLB_zzzw     01100100 10 1 ..... 10 1 00 0 ..... .....  @rda_rn_rm_e0
 FMLSLT_zzzw     01100100 10 1 ..... 10 1 00 1 ..... .....  @rda_rn_rm_e0
 
+### SVE2 floating-point bfloat16 dot-product
+BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_e0
+
 ### SVE2 floating-point multiply-add long (indexed)
 FMLALB_zzxw     01100100 10 1 ..... 0100.0 ..... .....     @rrxr_3a esz=2
 FMLALT_zzxw     01100100 10 1 ..... 0100.1 ..... .....     @rrxr_3a esz=2
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 0f15fa42fc3..3c36de3df20 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12235,6 +12235,16 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         feature = dc_isar_feature(aa64_fcma, s);
         break;
+    case 0x1f: /* BFDOT */
+        switch (size) {
+        case 1:
+            feature = dc_isar_feature(aa64_bf16, s);
+            break;
+        default:
+            unallocated_encoding(s);
+            return;
+        }
+        break;
     default:
         unallocated_encoding(s);
         return;
@@ -12318,6 +12328,16 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         return;
 
+    case 0xf: /* BFDOT */
+        switch (size) {
+        case 1:
+            gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_bfdot);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        return;
+
     default:
         g_assert_not_reached();
     }
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 6d94229c691..9460857b2ad 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -296,6 +296,15 @@ static bool trans_VUSDOT(DisasContext *s, arg_VUSDOT *a)
                         gen_helper_gvec_usdot_b);
 }
 
+static bool trans_VDOT_b16(DisasContext *s, arg_VDOT_b16 *a)
+{
+    if (!dc_isar_feature(aa32_bf16, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
+                        gen_helper_gvec_bfdot);
+}
+
 static bool trans_VFML(DisasContext *s, arg_VFML *a)
 {
     int opr_sz;
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index fb692a18351..ed290827ad2 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8653,3 +8653,15 @@ static bool trans_UMMLA(DisasContext *s, arg_rrrr_esz *a)
 {
     return do_i8mm_zzzz_ool(s, a, gen_helper_gvec_ummla_b, 0);
 }
+
+static bool trans_BFDOT_zzzz(DisasContext *s, arg_rrrr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve_bf16, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzz(s, gen_helper_gvec_bfdot,
+                          a->rd, a->rn, a->rm, a->ra, 0);
+    }
+    return true;
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index e84b438340e..7eefcd06eae 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2412,3 +2412,43 @@ static void do_mmla_b(void *vd, void *vn, void *vm, void *va, uint32_t desc,
 DO_MMLA_B(gvec_smmla_b, do_smmla_b)
 DO_MMLA_B(gvec_ummla_b, do_ummla_b)
 DO_MMLA_B(gvec_usmmla_b, do_usmmla_b)
+
+/*
+ * BFloat16 Dot Product
+ */
+
+static float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2)
+{
+    /* FPCR is ignored for BFDOT and BFMMLA. */
+    float_status bf_status = {
+        .tininess_before_rounding = float_tininess_before_rounding,
+        .float_rounding_mode = float_round_to_odd_inf,
+        .flush_to_zero = true,
+        .flush_inputs_to_zero = true,
+        .default_nan_mode = true,
+    };
+    float32 t1, t2;
+
+    /*
+     * Extract each BFloat16 from the element pair, and shift
+     * them such that they become float32.
+     */
+    t1 = float32_mul(e1 << 16, e2 << 16, &bf_status);
+    t2 = float32_mul(e1 & 0xffff0000u, e2 & 0xffff0000u, &bf_status);
+    t1 = float32_add(t1, t2, &bf_status);
+    t1 = float32_add(sum, t1, &bf_status);
+
+    return t1;
+}
+
+void HELPER(gvec_bfdot)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    float32 *d = vd, *a = va;
+    uint32_t *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = bfdotadd(a[i], n[i], m[i]);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
-- 
2.20.1


