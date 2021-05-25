Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E36390CBE
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 01:07:52 +0200 (CEST)
Received: from localhost ([::1]:53060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llg9P-0003M7-RM
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 19:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0V-0002pt-OB
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:39 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:33404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0H-0004pF-08
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:39 -0400
Received: by mail-pg1-x535.google.com with SMTP id i5so23986229pgm.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 15:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HHnHU44uTwaOtmMM1YViwvbfCM9UrBF9Z6IjsBhP0z4=;
 b=i/EsRwdHaa0OWJ57R0Jhyv96ESj3h3oXj35TuyS1y/zdxcPrKSu61H1mVPxJpUv+C1
 /pWdEl322TFUZenE1C9FFO121HNrC/jzUVP7IuHV3orx6vfdlLwL2l3BM8+Y6Q3yTIK8
 5Do/3EReUOosvl45Sm8r5U8LNSaIbhtQKoel340D6l9pDW7LR13fQflQJV9Ssj/OCWIv
 +YlFO9NuUApmT5ZzGw1AfbHfKIxGub2RK/yGNZvG+dgJpBDqJwyQiXHjZaCmVkbZ9Cbm
 7Eqnch6oA7KxtnFPXm3gp4ZuVL8j8bLsxKXVVbTNYiNrg6pnKYMlEmL6ARHHY+0aBvG8
 o8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HHnHU44uTwaOtmMM1YViwvbfCM9UrBF9Z6IjsBhP0z4=;
 b=pi3wJbMqyov3vQ5MW9GeLwKfxh+MlLHHAW3Sc90ekNuDhDH5IAXXti6RVMm4SLl1Ho
 Z/udmOMCMmihexyTlCYa9a8alZv9zqaHHQFKEReQQhF6DPdXDnV8ojP3tHlkpnOR8VZ5
 9F/3k06zHwlfrkbSqDchILOzKFojYkgdEgrgdRpqstKL39ewsz0iYDh6dpRVr0TmBGeq
 b87vtIobr8OGlAecwgQ6QMzyYV03xpoJlqAy/L8wXxCiOSLbfh8Yc7Hn1PKut/jtv1zl
 k3glLcZ1nHDxdiMnlE5eLLzZq24innRjKke7VJVEZr6TBGL+2fs3awsUY5VUBIeE133F
 dlLg==
X-Gm-Message-State: AOAM531zin55eBztEMcH4m5/Td0R6Gqdk8ZBb3qCNpFcmbKyR3H7qZtK
 qDWAgTSsQW+gCUMGDLdK2frRVr85ROoPRg==
X-Google-Smtp-Source: ABdhPJzdnZXGt0VLzUnz/hBHQlk083azzjCJ5bYbN4gc4reVEGhRMiubKiSSg+ANuEgYrlMtKwoXWA==
X-Received: by 2002:a62:30c2:0:b029:289:116c:ec81 with SMTP id
 w185-20020a6230c20000b0290289116cec81mr32657277pfw.42.1621983502264; 
 Tue, 25 May 2021 15:58:22 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id l6sm1669928pjf.28.2021.05.25.15.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 15:58:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/12] target/arm: Implement bfloat16 dot product (vector)
Date: Tue, 25 May 2021 15:58:11 -0700
Message-Id: <20210525225817.400336-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525225817.400336-1-richard.henderson@linaro.org>
References: <20210525225817.400336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
 target/arm/helper.h           |  3 +++
 target/arm/neon-shared.decode |  2 ++
 target/arm/sve.decode         |  3 +++
 target/arm/translate-a64.c    | 20 ++++++++++++++++++
 target/arm/translate-neon.c   |  9 ++++++++
 target/arm/translate-sve.c    | 12 +++++++++++
 target/arm/vec_helper.c       | 40 +++++++++++++++++++++++++++++++++++
 7 files changed, 89 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 8b4b7d92f3..de2f5331dc 100644
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
index 18d1a0eecc..a7429b293f 100644
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
index 5a96523b9f..127c8d8e9d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12228,6 +12228,16 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
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
@@ -12311,6 +12321,16 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
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
index 6d94229c69..9460857b2a 100644
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
index fb692a1835..ed290827ad 100644
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
index e84b438340..7eefcd06ea 100644
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
2.25.1


