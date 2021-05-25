Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29C9390CC9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 01:10:17 +0200 (CEST)
Received: from localhost ([::1]:57690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llgBk-0006Uh-Su
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 19:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0b-00036n-3c
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:45 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:39784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0M-0004qT-Lo
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:44 -0400
Received: by mail-pl1-x632.google.com with SMTP id q16so1356830pls.6
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 15:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iK+XC+NPEYKT5rI0LnO1hobdxUpyLx+ID3I1KyJc/L4=;
 b=U7OdEOOSOdyh1H/Q1I8/NRxARRDXAREGO+3hha4eHty++9lom0tRt3OBUqD3gZwZ7n
 5C4XuVDJUA0cyaFhoStZd5hiy2shKxjtB9pyTdPcUlNNqOAw5CG+YI2rmrhO0KUBw2H+
 cVvItRawOFNffoDa3ExBu8tVNnaPG4BB+jc5D09wIxnRj3pIM0KkNqWtljRcbnfKJhi4
 Dp0Of4msWJg4ZCEeyqTdDd/E0EGxOX2/xxcRotgh1OY3H1iYWkrZ5dgjxk+SIU/q6+tM
 JRQmEoxA7SV7BMTmLC8EJCWuaEcoJfQYyH52F5ZeZVovep5JmhBDCFyVjNMBWgYpZMAA
 inbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iK+XC+NPEYKT5rI0LnO1hobdxUpyLx+ID3I1KyJc/L4=;
 b=hYyuGqNKv/DMpJzwgswzy4Ktyp1RaEqnXgaq/x6SAUgkXnG6R7deJtmRoZPChG5WNm
 Crwmky1XXo2pWzQlF+W4bmKfhP1OAX8aWe6E+klUvDmTQpRVKBUBmRfFrPMrq6muow7t
 FDOciWono0AFrU6aKZFbUhHY3d6fRk0gjEdExgOylXefHI6zHwSoS2ElI/s1r/IDCa9p
 C/dq39OTatEqL4B2m8Es8qgVxlqM+XOw277xrgkfnz8LKKHA5k5jMvcUn2MUpkwgLCDd
 ORBzSF+ifsXheP0GcS/OBVmC81/Cvl3nKZxk8IOkyOV/TXNcnNIqAwROPgXccXibDWKn
 e8IQ==
X-Gm-Message-State: AOAM533LuiBtbZ0h6nSMegFnvZMeg9US1WcfzLXLUrtfXgtEsSahQzZu
 yIBNm35QXrHh4Je8t5Tg049iweSVJES+Zg==
X-Google-Smtp-Source: ABdhPJz3FDxyyhZcO+0UVzRYXd3L3mBZ7fzXUnK/4hUmJLz4ZzrEa91Vn+xnFwO1a/DLa+UtAvaSpQ==
X-Received: by 2002:a17:902:d48b:b029:f4:4a28:43e5 with SMTP id
 c11-20020a170902d48bb02900f44a2843e5mr33098427plg.19.1621983505016; 
 Tue, 25 May 2021 15:58:25 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id l6sm1669928pjf.28.2021.05.25.15.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 15:58:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/12] target/arm: Implement bfloat widening fma (indexed)
Date: Tue, 25 May 2021 15:58:15 -0700
Message-Id: <20210525225817.400336-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525225817.400336-1-richard.henderson@linaro.org>
References: <20210525225817.400336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is BFMLAL{B,T} for both AArch64 AdvSIMD and SVE,
and VFMA{B,T}.BF16 for AArch32 NEON.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h           |  2 ++
 target/arm/neon-shared.decode |  2 ++
 target/arm/sve.decode         |  2 ++
 target/arm/translate-a64.c    | 15 ++++++++++++++-
 target/arm/translate-neon.c   | 10 ++++++++++
 target/arm/translate-sve.c    | 30 ++++++++++++++++++++++++++++++
 target/arm/vec_helper.c       | 22 ++++++++++++++++++++++
 7 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 36b3c9dd2d..dc6eb96d43 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1012,6 +1012,8 @@ DEF_HELPER_FLAGS_5(gvec_bfmmla, TCG_CALL_NO_RWG,
 
 DEF_HELPER_FLAGS_6(gvec_bfmlal, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(gvec_bfmlal_idx, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
 
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index b61addd98b..df80e6ebf6 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -95,3 +95,5 @@ VFML_scalar    1111 1110 0 . 0 s:1 .... .... 1000 . 0 . 1 index:1 ... \
                rm=%vfml_scalar_q0_rm vn=%vn_sp vd=%vd_dp q=0
 VFML_scalar    1111 1110 0 . 0 s:1 .... .... 1000 . 1 . 1 . rm:3 \
                index=%vfml_scalar_q1_index vn=%vn_dp vd=%vd_dp q=1
+VFMA_b16_scal  1111 1110 0.11 .... .... 1000 . q:1 . 1 . vm:3 \
+               index=%vfml_scalar_q1_index vn=%vn_dp vd=%vd_dp
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5281164eea..a62c169f1a 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1638,6 +1638,8 @@ FMLALB_zzxw     01100100 10 1 ..... 0100.0 ..... .....     @rrxr_3a esz=2
 FMLALT_zzxw     01100100 10 1 ..... 0100.1 ..... .....     @rrxr_3a esz=2
 FMLSLB_zzxw     01100100 10 1 ..... 0110.0 ..... .....     @rrxr_3a esz=2
 FMLSLT_zzxw     01100100 10 1 ..... 0110.1 ..... .....     @rrxr_3a esz=2
+BFMLALB_zzxw    01100100 11 1 ..... 0100.0 ..... .....     @rrxr_3a esz=2
+BFMLALT_zzxw    01100100 11 1 ..... 0100.1 ..... .....     @rrxr_3a esz=2
 
 ### SVE2 floating-point bfloat16 dot-product (indexed)
 BFDOT_zzxz      01100100 01 1 ..... 010000 ..... .....     @rrxr_2 esz=2
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2a99e015ca..d1dc9401d5 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13465,18 +13465,27 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                 unallocated_encoding(s);
                 return;
             }
+            size = MO_32;
             break;
         case 1: /* BFDOT */
             if (is_scalar || !dc_isar_feature(aa64_bf16, s)) {
                 unallocated_encoding(s);
                 return;
             }
+            size = MO_32;
+            break;
+        case 3: /* BFMLAL{B,T} */
+            if (is_scalar || !dc_isar_feature(aa64_bf16, s)) {
+                unallocated_encoding(s);
+                return;
+            }
+            /* can't set is_fp without other incorrect size checks */
+            size = MO_16;
             break;
         default:
             unallocated_encoding(s);
             return;
         }
-        size = MO_32;
         break;
     case 0x11: /* FCMLA #0 */
     case 0x13: /* FCMLA #90 */
@@ -13606,6 +13615,10 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
                              gen_helper_gvec_usdot_idx_b);
             return;
+        case 3: /* BFMLAL{B,T} */
+            gen_gvec_op4_fpst(s, 1, rd, rn, rm, rd, 0, (index << 1) | is_q,
+                              gen_helper_gvec_bfmlal_idx);
+            return;
         }
         g_assert_not_reached();
     case 0x11: /* FCMLA #0 */
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 4d0c2494dc..633fef3bf7 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -4144,3 +4144,13 @@ static bool trans_VFMA_b16(DisasContext *s, arg_VFMA_b16 *a)
     return do_neon_ddda_fpst(s, 7, a->vd, a->vn, a->vm, a->q, FPST_STD,
                              gen_helper_gvec_bfmlal);
 }
+
+static bool trans_VFMA_b16_scal(DisasContext *s, arg_VFMA_b16_scal *a)
+{
+    if (!dc_isar_feature(aa32_bf16, s)) {
+        return false;
+    }
+    return do_neon_ddda_fpst(s, 6, a->vd, a->vn, a->vm,
+                             (a->index << 1) | a->q, FPST_STD,
+                             gen_helper_gvec_bfmlal_idx);
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ba8f5d7b7d..46210eb696 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8719,3 +8719,33 @@ static bool trans_BFMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
 {
     return do_BFMLAL_zzzw(s, a, true);
 }
+
+static bool do_BFMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sel)
+{
+    if (!dc_isar_feature(aa64_sve_bf16, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        TCGv_ptr status = fpstatus_ptr(FPST_FPCR);
+        unsigned vsz = vec_full_reg_size(s);
+
+        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vec_full_reg_offset(s, a->ra),
+                           status, vsz, vsz, (a->index << 1) | sel,
+                           gen_helper_gvec_bfmlal_idx);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
+static bool trans_BFMLALB_zzxw(DisasContext *s, arg_rrxr_esz *a)
+{
+    return do_BFMLAL_zzxw(s, a, false);
+}
+
+static bool trans_BFMLALT_zzxw(DisasContext *s, arg_rrxr_esz *a)
+{
+    return do_BFMLAL_zzxw(s, a, true);
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index d82736b5e6..5862f187cd 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2528,3 +2528,25 @@ void HELPER(gvec_bfmlal)(void *vd, void *vn, void *vm, void *va,
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_bfmlal_idx)(void *vd, void *vn, void *vm,
+                             void *va, void *stat, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT, 1);
+    intptr_t index = extract32(desc, SIMD_DATA_SHIFT + 1, 3);
+    intptr_t elements = opr_sz / 4;
+    intptr_t eltspersegment = MIN(16 / 4, elements);
+    float32 *d = vd, *a = va;
+    bfloat16 *n = vn, *m = vm;
+
+    for (i = 0; i < elements; i += eltspersegment) {
+        float32 m_idx = m[H2(2 * i + index)] << 16;
+
+        for (j = i; j < i + eltspersegment; j++) {
+            float32 n_j = n[H2(2 * j + sel)] << 16;
+            d[H4(j)] = float32_muladd(n_j, m_idx, a[H4(j)], 0, stat);
+        }
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
-- 
2.25.1


