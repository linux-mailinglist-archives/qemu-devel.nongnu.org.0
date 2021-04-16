Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3187362C2A
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 02:02:15 +0200 (CEST)
Received: from localhost ([::1]:32894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXYPe-0008Py-UG
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 20:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYNE-0005VN-I0
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:44 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYNB-0005iY-KU
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:44 -0400
Received: by mail-pg1-x530.google.com with SMTP id z16so20219115pga.1
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 16:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gt+d8J8/Jeqw9COlXsH+/eB2+q3ZGydi93ujUMo44n4=;
 b=nTxDb1C3/Aj0+G0+UZI87ScCA7g9YnYfKaasUIeveuH1+OkDJTFXIrr0VDpmpj879o
 yh+dYeaEYfoR+ZN9REIrQwmgri43EBPmGGWpJV4vPTYwleIXlfXrAuFT6sAljTCx80tz
 3SzsgLHObOAq0wfgUEpO/BOIan3GWVV/XkPg6+YKmn9fyI+BExQzEsQW/zXdc8HZqq1b
 geJNLtXbScTGJB7X++ox6GMvPuqyiZcYiNCbgI8gmS7iuBI8Hr4KZFsShfGN1dTqSAmA
 MxZoaaKb3K9+OZxRDmiKBLJMq8n/9ObvaWDjRAbPzOXuh3TQ2X29TrjpFzCxhWOyTWqU
 qu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gt+d8J8/Jeqw9COlXsH+/eB2+q3ZGydi93ujUMo44n4=;
 b=X7n8mG3Cdzqlzfln9uGAlS35SrS/kXaqjeE9GetPMxCx8CecEJ1vTRJ7vyWqFId7vj
 hL4ZW06UyWZ2Qc1bPIx1/692dS+7PBIwhR5n2kbU6gKHwLqY0Aldb8zoXVu7UgQIcV10
 ywss1SQBBLSVYet+SzQOipxv3mbvpOteP9TvIyAzA2hcEZYcyeZPD1jGYhx3efpmwBwv
 kA+uJXYiJO48fqbYE7mlgOq9DRoTtrHOTrnCKvgTYP/PHD9neZVEEQHFzZ4+ws2CylKK
 XHdy40kVqQwX4FEqNvfXWvEjDhOeoi/yFxudJqyAo/8PtvYmT1iips7uHootXSEOpTOX
 BCxQ==
X-Gm-Message-State: AOAM5324O30GG7Y4kbo6VIqIZ3n4L5rUDhPF+CjpoOv0BG8isJS5sUS9
 8anpyd4pZMotXeVUukrVrqoF9BnGyLBRag==
X-Google-Smtp-Source: ABdhPJwyObesdKPkl/njvW5J/SswArEAmN19p18ed1mUh4Z8ibqMh6rx01vP+sR59UkgSuRQR/XQJg==
X-Received: by 2002:a65:560d:: with SMTP id l13mr1298302pgs.49.1618617580273; 
 Fri, 16 Apr 2021 16:59:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d71sm560853pfd.83.2021.04.16.16.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 16:59:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 10/11] target/arm: Implement bfloat widening fma (indexed)
Date: Fri, 16 Apr 2021 16:59:27 -0700
Message-Id: <20210416235928.1631788-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416235928.1631788-1-richard.henderson@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is BFMLAL{B,T} for both AArch64 AdvSIMD and SVE,
and VFMA{B,T}.BF16 for AArch32 NEON.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             |  2 ++
 target/arm/neon-shared.decode   |  2 ++
 target/arm/sve.decode           |  2 ++
 target/arm/translate-a64.c      | 15 ++++++++++++++-
 target/arm/translate-sve.c      | 30 ++++++++++++++++++++++++++++++
 target/arm/vec_helper.c         | 22 ++++++++++++++++++++++
 target/arm/translate-neon.c.inc | 10 ++++++++++
 7 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 2c6f0cecfa..cbcaab2ce0 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1013,6 +1013,8 @@ DEF_HELPER_FLAGS_5(gvec_bfmmla, TCG_CALL_NO_RWG,
 
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
index 322bef24cf..69f979fb47 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1589,6 +1589,8 @@ FMLALB_zzxw     01100100 10 1 ..... 0100.0 ..... .....     @rrxr_3a esz=2
 FMLALT_zzxw     01100100 10 1 ..... 0100.1 ..... .....     @rrxr_3a esz=2
 FMLSLB_zzxw     01100100 10 1 ..... 0110.0 ..... .....     @rrxr_3a esz=2
 FMLSLT_zzxw     01100100 10 1 ..... 0110.1 ..... .....     @rrxr_3a esz=2
+BFMLALB_zzxw    01100100 11 1 ..... 0100.0 ..... .....     @rrxr_3a esz=2
+BFMLALT_zzxw    01100100 11 1 ..... 0100.1 ..... .....     @rrxr_3a esz=2
 
 ### SVE2 floating-point bfloat16 dot-product (indexed)
 BFDOT_zzxz      01100100 01 1 ..... 010000 ..... .....     @rrxr_2 esz=2
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 74794e3da3..7842dd51be 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13480,18 +13480,27 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
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
@@ -13621,6 +13630,10 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
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
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3af980caba..7f33bc4682 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8652,3 +8652,33 @@ static bool trans_BFMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
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
index 646a364c94..0906c5c148 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2771,3 +2771,25 @@ void HELPER(gvec_bfmlal)(void *vd, void *vn, void *vm, void *va,
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
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index dd710c8450..bd1068e4d4 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -4135,3 +4135,13 @@ static bool trans_VFMA_b16(DisasContext *s, arg_VFMA_b16 *a)
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
-- 
2.25.1


