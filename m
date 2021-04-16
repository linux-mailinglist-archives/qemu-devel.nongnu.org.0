Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB68362C3B
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 02:05:43 +0200 (CEST)
Received: from localhost ([::1]:46306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXYT0-0005VL-Ep
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 20:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYND-0005RK-0l
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:43 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN8-0005gC-G1
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:42 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 e8-20020a17090a7288b029014e51f5a6baso10231716pjg.2
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 16:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/PkbqLegCo8bMrZ94sGp7SVbjSmm25utWP6wUjeAjjU=;
 b=z8e1r8Z2IhJqGbH0vHVkeT7GQmTYPO/x7qXn6P1nDOVXkHob/WnS0d7MwWyTAoT/Er
 PYMGJ8Y58Dv/2ygpJFhGBu/78qqQQ6ShPTL5FdRy2MH46QwYxdEPEcwXeDygHZvl1OSk
 wSoMAezAh7Mxrz9VgE5aZd8SLwLk2VAgdA1+u8ZAA7Q9XrhObUtEgTZLINJU3JZjOkiF
 ZJbdvfnWdPZMUxGs92542iLvCK1NjfTmbmX5w99zSe117AxIyHI9zA6/obtoG+p2D84T
 AtfxvHIQY2qUL8y9bO/zyHQdVUUhKIPu483Y3VtQoEiOSTKEWXqRYpCjU3ybB35IFqwk
 wLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/PkbqLegCo8bMrZ94sGp7SVbjSmm25utWP6wUjeAjjU=;
 b=oGv6sW2zmeqgGmaptI08GT4au8GYe5zogUxphiRqthNdcD2vW/36LcuKeOcyYGeYZB
 OHrXZx2upA76aR0OfJI/70bB1+Xua3MVwJQ2lkcoiX2EftNkkO2bVZhyPeea9BdX7XFJ
 GxS9U9lROtKT2tklJ3y6jpH8Owj6VfxFz/lttAwrAOepE/pe5Cq1LZ8L1Bhl29Ox0MbQ
 c3Y1TQp9EBL0FszlKMaP1x2QT3qc633qkjUlc1dRHrKpG/2SdeJzdT1gmKT6j3RAyT/B
 fjjanXCWSYUjmnwFYyIF+lJtwsMlk3xI9hotKmf7rpzjw+E5u4Ehwp764o4v2j6jE4RE
 bpKg==
X-Gm-Message-State: AOAM5335cjVwcXgRCXdjGZg+QSPfwMVK0SLNq2j4RzGacaP4KIjvwXk/
 /5Wf0B93lS3ID+iCZ5y5Z55g3cRKnnC28A==
X-Google-Smtp-Source: ABdhPJyafcEVuKDdy6zsYM1f0WSdb3kJ3pzbJWIJ22RSHWOzTGHBkeXcey/0s8jPc5dKUwsxzTzr0A==
X-Received: by 2002:a17:902:122:b029:e8:bde2:7f6c with SMTP id
 31-20020a1709020122b02900e8bde27f6cmr12055573plb.29.1618617576175; 
 Fri, 16 Apr 2021 16:59:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d71sm560853pfd.83.2021.04.16.16.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 16:59:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 06/11] target/arm: Implement bfloat16 dot product (vector)
Date: Fri, 16 Apr 2021 16:59:23 -0700
Message-Id: <20210416235928.1631788-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416235928.1631788-1-richard.henderson@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is BFDOT for both AArch64 AdvSIMD and SVE,
and VDOT.BF16 for AArch32 NEON.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             |  3 +++
 target/arm/neon-shared.decode   |  2 ++
 target/arm/sve.decode           |  3 +++
 target/arm/translate-a64.c      | 20 +++++++++++++++++
 target/arm/translate-sve.c      | 12 ++++++++++
 target/arm/vec_helper.c         | 40 +++++++++++++++++++++++++++++++++
 target/arm/translate-neon.c.inc |  9 ++++++++
 7 files changed, 89 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 0b52ee6256..eb4cb2b65b 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1003,6 +1003,9 @@ DEF_HELPER_FLAGS_5(gvec_ummla_b, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_usmmla_b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_bfdot, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index cc9f4cdd85..31a0839bbb 100644
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
index bad81580c5..523140ca56 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1576,6 +1576,9 @@ FMLALT_zzzw     01100100 10 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_e0
 FMLSLB_zzzw     01100100 10 1 ..... 10 1 00 0 ..... .....  @rda_rn_rm_e0
 FMLSLT_zzzw     01100100 10 1 ..... 10 1 00 1 ..... .....  @rda_rn_rm_e0
 
+### SVE2 floating-point bfloat16 dot-product
+BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_e0
+
 ### SVE2 floating-point multiply-add long (indexed)
 FMLALB_zzxw     01100100 10 1 ..... 0100.0 ..... .....     @rrxr_3a esz=2
 FMLALT_zzxw     01100100 10 1 ..... 0100.1 ..... .....     @rrxr_3a esz=2
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c528fb2cf0..fc16e0a126 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12243,6 +12243,16 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
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
@@ -12326,6 +12336,16 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
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
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index aacbabd11e..3527430c1a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8586,3 +8586,15 @@ static bool trans_UMMLA(DisasContext *s, arg_rrrr_esz *a)
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
index 6c9f1e5146..e227ba6590 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2655,3 +2655,43 @@ static void do_mmla_b(void *vd, void *vn, void *vm, void *va, uint32_t desc,
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
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 8cc53892d6..aed8a565e0 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -287,6 +287,15 @@ static bool trans_VUSDOT(DisasContext *s, arg_VUSDOT *a)
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
-- 
2.25.1


