Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E1639A56E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:09:41 +0200 (CEST)
Received: from localhost ([::1]:51424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lopue-00041F-8W
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkm-0000U3-GS
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:28 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:43879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkk-00072u-4u
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:28 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso4003466wmj.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DbowXcdu9vOd8m84UlV9CpOz43bP7gTR7Ye+RlDD208=;
 b=SDibF8LOnI9UJjin5yTnDpmJ2QSyIv/XvyADnyxxNxTBT4/SE8oOGlHWeYj3YRowpK
 7+BLzIeHfCKAgSCk3WdZEUnA/aM9tOklWbMKAPD7jjH0vdQktJZ7H4OQxjiRT4MYgXaW
 jXxbNDYkcAcKVRpV4BkdJK+UM98JBvI0ao25T1U2eRQRU87gborHi/MRNZ/5S5u6E+iA
 CS21MSxC+38mT1wLveGCuEfnn/uzUuktUj41/bhbPeprHRvKlmqAw/1c5D+wx0Fmu4T5
 42wbOK4MRTcyvbr8O6Js2CRnKWO2h5A0unBOtZqT2j4kqKjtRI3NwrX5InKil4Yn5tia
 tDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DbowXcdu9vOd8m84UlV9CpOz43bP7gTR7Ye+RlDD208=;
 b=fGCfwrZuYKe/txCWEnjyPgH5opKhVYzARgNSrb+365SFCdggSyuZoEx8K9FBGwrT7C
 b7bDBXkRYP4oAoyVdyz3fRNJy6E19uPAdqA0BQfbtuIuda738AW7k5J09VKIIveHqyFy
 IzxqjHKrg8Z0Xlkez7RT7IxCoQcGfQ/S8SRxMX9zKAXuxrGu98UVXcTvmYcKvv34diPS
 Pbi3700MkRpFu8W1s3oDTKdLlCpao+Hc9kiZ1cOR3xSboyZUstjxcBddY9K7oonjoG/V
 00flVtHa4/rLclEi1JSfXBoBKGnpiCMGIEfy0FZI84AZSbKD3BtyLVh1AZXiNoJH2rgV
 fbcQ==
X-Gm-Message-State: AOAM530iR00F4h4nmadhLgyoiE5bKjH7BeKC3u+POCRJqSNKlWaNMi8L
 ARDa4tfTSLIeCS4lAtaqPjwzzH7LFoYIvAK2
X-Google-Smtp-Source: ABdhPJysjiLpeGmP27Fxw/Ee8GIOuTrDVHA8U+Uaf3fmkgZNEY7l0OeEgNu4qQ5dCMRO5ERWTv06JQ==
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr29618146wmc.12.1622735964788; 
 Thu, 03 Jun 2021 08:59:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/45] target/arm: Implement bfloat16 dot product (indexed)
Date: Thu,  3 Jun 2021 16:58:41 +0100
Message-Id: <20210603155904.26021-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Message-id: 20210525225817.400336-8-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h           |  2 ++
 target/arm/neon-shared.decode |  2 ++
 target/arm/sve.decode         |  3 +++
 target/arm/translate-a64.c    | 41 +++++++++++++++++++++++++++--------
 target/arm/translate-neon.c   |  9 ++++++++
 target/arm/translate-sve.c    | 12 ++++++++++
 target/arm/vec_helper.c       | 20 +++++++++++++++++
 7 files changed, 80 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index de2f5331dcc..376c1cef0f6 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1004,6 +1004,8 @@ DEF_HELPER_FLAGS_5(gvec_usmmla_b, TCG_CALL_NO_RWG,
 
 DEF_HELPER_FLAGS_5(gvec_bfdot, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_bfdot_idx, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
 
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index 31a0839bbb0..fa3cf14e3a6 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -81,6 +81,8 @@ VUSDOT_scalar  1111 1110 1 . 00 .... .... 1101 . q:1 index:1 0 vm:4 \
                vn=%vn_dp vd=%vd_dp
 VSUDOT_scalar  1111 1110 1 . 00 .... .... 1101 . q:1 index:1 1 vm:4 \
                vn=%vn_dp vd=%vd_dp
+VDOT_b16_scal  1111 1110 0 . 00 .... .... 1101 . q:1 index:1 0 vm:4 \
+               vn=%vn_dp vd=%vd_dp
 
 %vfml_scalar_q0_rm 0:3 5:1
 %vfml_scalar_q1_index 5:1 3:1
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a7429b293fe..51f87e8937e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1633,3 +1633,6 @@ FMLALB_zzxw     01100100 10 1 ..... 0100.0 ..... .....     @rrxr_3a esz=2
 FMLALT_zzxw     01100100 10 1 ..... 0100.1 ..... .....     @rrxr_3a esz=2
 FMLSLB_zzxw     01100100 10 1 ..... 0110.0 ..... .....     @rrxr_3a esz=2
 FMLSLT_zzxw     01100100 10 1 ..... 0110.1 ..... .....     @rrxr_3a esz=2
+
+### SVE2 floating-point bfloat16 dot-product (indexed)
+BFDOT_zzxz      01100100 01 1 ..... 010000 ..... .....     @rrxr_2 esz=2
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 3c36de3df20..71de75e568b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13449,8 +13449,22 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             return;
         }
         break;
-    case 0x0f: /* SUDOT, USDOT */
-        if (is_scalar || (size & 1) || !dc_isar_feature(aa64_i8mm, s)) {
+    case 0x0f:
+        switch (size) {
+        case 0: /* SUDOT */
+        case 2: /* USDOT */
+            if (is_scalar || !dc_isar_feature(aa64_i8mm, s)) {
+                unallocated_encoding(s);
+                return;
+            }
+            break;
+        case 1: /* BFDOT */
+            if (is_scalar || !dc_isar_feature(aa64_bf16, s)) {
+                unallocated_encoding(s);
+                return;
+            }
+            break;
+        default:
             unallocated_encoding(s);
             return;
         }
@@ -13570,13 +13584,22 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                          u ? gen_helper_gvec_udot_idx_b
                          : gen_helper_gvec_sdot_idx_b);
         return;
-    case 0x0f: /* SUDOT, USDOT */
-        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
-                         extract32(insn, 23, 1)
-                         ? gen_helper_gvec_usdot_idx_b
-                         : gen_helper_gvec_sudot_idx_b);
-        return;
-
+    case 0x0f:
+        switch (extract32(insn, 22, 2)) {
+        case 0: /* SUDOT */
+            gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
+                             gen_helper_gvec_sudot_idx_b);
+            return;
+        case 1: /* BFDOT */
+            gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
+                             gen_helper_gvec_bfdot_idx);
+            return;
+        case 2: /* USDOT */
+            gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
+                             gen_helper_gvec_usdot_idx_b);
+            return;
+        }
+        g_assert_not_reached();
     case 0x11: /* FCMLA #0 */
     case 0x13: /* FCMLA #90 */
     case 0x15: /* FCMLA #180 */
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 9460857b2ad..8099767792b 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -390,6 +390,15 @@ static bool trans_VSUDOT_scalar(DisasContext *s, arg_VSUDOT_scalar *a)
                         gen_helper_gvec_sudot_idx_b);
 }
 
+static bool trans_VDOT_b16_scal(DisasContext *s, arg_VDOT_b16_scal *a)
+{
+    if (!dc_isar_feature(aa32_bf16, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
+                        gen_helper_gvec_bfdot_idx);
+}
+
 static bool trans_VFML_scalar(DisasContext *s, arg_VFML_scalar *a)
 {
     int opr_sz;
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ed290827ad2..6f020306357 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8665,3 +8665,15 @@ static bool trans_BFDOT_zzzz(DisasContext *s, arg_rrrr_esz *a)
     }
     return true;
 }
+
+static bool trans_BFDOT_zzxz(DisasContext *s, arg_rrxr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve_bf16, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzz(s, gen_helper_gvec_bfdot_idx,
+                          a->rd, a->rn, a->rm, a->ra, a->index);
+    }
+    return true;
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 7eefcd06eae..74a497f38ca 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2452,3 +2452,23 @@ void HELPER(gvec_bfdot)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_bfdot_idx)(void *vd, void *vn, void *vm,
+                            void *va, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    intptr_t index = simd_data(desc);
+    intptr_t elements = opr_sz / 4;
+    intptr_t eltspersegment = MIN(16 / 4, elements);
+    float32 *d = vd, *a = va;
+    uint32_t *n = vn, *m = vm;
+
+    for (i = 0; i < elements; i += eltspersegment) {
+        uint32_t m_idx = m[i + H4(index)];
+
+        for (j = i; j < i + eltspersegment; j++) {
+            d[j] = bfdotadd(a[j], n[j], m_idx);
+        }
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
-- 
2.20.1


