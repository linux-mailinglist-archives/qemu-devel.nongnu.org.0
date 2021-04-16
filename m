Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7063C362AC8
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 00:08:53 +0200 (CEST)
Received: from localhost ([::1]:38022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWdw-0001iH-E6
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 18:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVrf-0000Dm-7I
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:18:59 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVrd-0001OA-0S
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:18:58 -0400
Received: by mail-pf1-x42d.google.com with SMTP id d124so19127929pfa.13
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l2DdQUpZAAYz/+QgM/RAZaDAb6uzfP9zN/oGnx1vuJ0=;
 b=d6S/D6mahlOitw85J2YwwWMKTyowdfSdr+eBMmK9uYpxajtdSzqExbKEzCcGaEAx7x
 Y0/Dj1PqLe/eSQofsorTFC599rtbvWXQVlMKaEHo4vPldg9wqdi5O6zb0C40HAvWWHST
 9VV1Z3cb4RQutvrJnIhIg8L0GudKMJyE2CUr3aq+B8UnCAAu9R8cHSRk2E3RacBYoLgV
 +kEspkZqX7pSgRBLEuhoWYQsbC2Ea1+loJiIla7adtj2b04JnajiV7vOAwQuP001OMrF
 hv8dYp4fA/At130fCNayF6RV95eWrx/3YCC4CwuCj4JEts4HIf+okKhGIlu7vwK/YHHM
 wKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l2DdQUpZAAYz/+QgM/RAZaDAb6uzfP9zN/oGnx1vuJ0=;
 b=f5qyKB9Z1PI0SVZsZ5rmb4rGtSs0vPz9YCll8DNhSUEq7dHjxUQGvT7AvE8lwawSyT
 MH9lrGH90ZLy+3cZJFBVMmyUOLc7xj4E8m9yHvydcPZ76EANs7q1BYw1RpO1AElfQ55H
 OdIs1tZ9L8h14yHSCSi+vyMiyYGioULP6tWKMUgfPf4bSQhR/1HpNCnQt/+kCRxlf1qV
 /nzk4Cm3xYwpvPfXw3L4lRhPG13mYHeuCftVC55I2y8eguKC98uMwMFBW1y+fDYKREBa
 6WamBpUib4SQAzZFMd3geCUGXUA2XRzRVmLI7IokZwRX28Eows3uzifqdsIocLW4H8U8
 gX+A==
X-Gm-Message-State: AOAM53128CFhbbOmee+keZ29xuGn7/+JygyWx5UarCaxeO/TGOk2RkUp
 zQTSnm4K3U43QYvn5bojwx8L9uUk/uPI7A==
X-Google-Smtp-Source: ABdhPJyUESujCi5JjD8ZLZ45NNLlH+nMjyB5E1WlIq8jlrDKTeG6ZCMYvoaSstZtWP0zSAAoovxfSA==
X-Received: by 2002:a63:c042:: with SMTP id z2mr909471pgi.136.1618607935267;
 Fri, 16 Apr 2021 14:18:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r127sm5586266pfr.163.2021.04.16.14.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:18:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 80/81] target/arm: Implement integer matrix multiply
 accumulate
Date: Fri, 16 Apr 2021 14:18:53 -0700
Message-Id: <20210416211853.1591708-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

This is {S,U,US}MMLA for both AArch64 AdvSIMD and SVE,
and V{S,U,US}MMLA.S8 for AArch32 NEON.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             |  7 +++
 target/arm/neon-shared.decode   |  7 +++
 target/arm/sve.decode           |  6 +++
 target/arm/translate-a64.c      | 18 ++++++++
 target/arm/translate-sve.c      | 27 ++++++++++++
 target/arm/vec_helper.c         | 77 +++++++++++++++++++++++++++++++++
 target/arm/translate-neon.c.inc | 27 ++++++++++++
 7 files changed, 169 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index e8b16a401f..33df62f44d 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -994,6 +994,13 @@ DEF_HELPER_FLAGS_6(sve2_fmlal_zzxw_s, TCG_CALL_NO_RWG,
 
 DEF_HELPER_FLAGS_4(gvec_xar_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_smmla_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_ummla_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_usmmla_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index 5befaec87b..cc9f4cdd85 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -59,6 +59,13 @@ VFML           1111 110 0 s:1 . 10 .... .... 1000 . 0 . 1 .... \
 VFML           1111 110 0 s:1 . 10 .... .... 1000 . 1 . 1 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp q=1
 
+VSMMLA         1111 1100 0.10 .... .... 1100 .1.0 .... \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
+VUMMLA         1111 1100 0.10 .... .... 1100 .1.1 .... \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
+VUSMMLA        1111 1100 1.10 .... .... 1100 .1.0 .... \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
 VCMLA_scalar   1111 1110 0 . rot:2 .... .... 1000 . q:1 index:1 0 vm:4 \
                vn=%vn_dp vd=%vd_dp size=1
 VCMLA_scalar   1111 1110 1 . rot:2 .... .... 1000 . q:1 . 0 .... \
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 63870b7539..3d7c4fa6e5 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1364,6 +1364,12 @@ USHLLT          01000101 .. 0 ..... 1010 11 ..... .....  @rd_rn_tszimm_shl
 EORBT           01000101 .. 0 ..... 10010 0 ..... .....  @rd_rn_rm
 EORTB           01000101 .. 0 ..... 10010 1 ..... .....  @rd_rn_rm
 
+## SVE integer matrix multiply accumulate
+
+SMMLA           01000101 00 0 ..... 10011 0 ..... .....  @rda_rn_rm_e0
+USMMLA          01000101 10 0 ..... 10011 0 ..... .....  @rda_rn_rm_e0
+UMMLA           01000101 11 0 ..... 10011 0 ..... .....  @rda_rn_rm_e0
+
 ## SVE2 bitwise permute
 
 BEXT            01000101 .. 0 ..... 1011 00 ..... .....  @rd_rn_rm
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 0d45a44f51..668edf3a00 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12197,6 +12197,15 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         feature = dc_isar_feature(aa64_i8mm, s);
         break;
+    case 0x04: /* SMMLA */
+    case 0x14: /* UMMLA */
+    case 0x05: /* USMMLA */
+        if (!is_q || size != MO_32) {
+            unallocated_encoding(s);
+            return;
+        }
+        feature = dc_isar_feature(aa64_i8mm, s);
+        break;
     case 0x18: /* FCMLA, #0 */
     case 0x19: /* FCMLA, #90 */
     case 0x1a: /* FCMLA, #180 */
@@ -12241,6 +12250,15 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_usdot_b);
         return;
 
+    case 0x04: /* SMMLA, UMMLA */
+        gen_gvec_op4_ool(s, 1, rd, rn, rm, rd, 0,
+                         u ? gen_helper_gvec_ummla_b
+                         : gen_helper_gvec_smmla_b);
+        return;
+    case 0x05: /* USMMLA */
+        gen_gvec_op4_ool(s, 1, rd, rn, rm, rd, 0, gen_helper_gvec_usmmla_b);
+        return;
+
     case 0x8: /* FCMLA, #0 */
     case 0x9: /* FCMLA, #90 */
     case 0xa: /* FCMLA, #180 */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ae628968da..cb0e7a1f68 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8543,3 +8543,30 @@ static bool trans_FMLSLT_zzxw(DisasContext *s, arg_rrxr_esz *a)
 {
     return do_FMLAL_zzxw(s, a, true, true);
 }
+
+static bool do_i8mm_zzzz_ool(DisasContext *s, arg_rrrr_esz *a,
+                             gen_helper_gvec_4 *fn, int data)
+{
+    if (!dc_isar_feature(aa64_sve_i8mm, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
+    }
+    return true;
+}
+
+static bool trans_SMMLA(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_i8mm_zzzz_ool(s, a, gen_helper_gvec_smmla_b, 0);
+}
+
+static bool trans_USMMLA(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_i8mm_zzzz_ool(s, a, gen_helper_gvec_usmmla_b, 0);
+}
+
+static bool trans_UMMLA(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_i8mm_zzzz_ool(s, a, gen_helper_gvec_ummla_b, 0);
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index ea08b15c55..6c9f1e5146 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2578,3 +2578,80 @@ void HELPER(gvec_xar_d)(void *vd, void *vn, void *vm, uint32_t desc)
     }
     clear_tail(d, opr_sz * 8, simd_maxsz(desc));
 }
+
+/*
+ * Integer matrix-multiply accumulate
+ */
+
+static uint32_t do_smmla_b(uint32_t sum, void *vn, void *vm)
+{
+    int8_t *n = vn, *m = vm;
+
+    for (intptr_t k = 0; k < 8; ++k) {
+        sum += n[H1(k)] * m[H1(k)];
+    }
+    return sum;
+}
+
+static uint32_t do_ummla_b(uint32_t sum, void *vn, void *vm)
+{
+    uint8_t *n = vn, *m = vm;
+
+    for (intptr_t k = 0; k < 8; ++k) {
+        sum += n[H1(k)] * m[H1(k)];
+    }
+    return sum;
+}
+
+static uint32_t do_usmmla_b(uint32_t sum, void *vn, void *vm)
+{
+    uint8_t *n = vn;
+    int8_t *m = vm;
+
+    for (intptr_t k = 0; k < 8; ++k) {
+        sum += n[H1(k)] * m[H1(k)];
+    }
+    return sum;
+}
+
+static void do_mmla_b(void *vd, void *vn, void *vm, void *va, uint32_t desc,
+                      uint32_t (*inner_loop)(uint32_t, void *, void *))
+{
+    intptr_t seg, opr_sz = simd_oprsz(desc);
+
+    for (seg = 0; seg < opr_sz; seg += 16) {
+        uint32_t *d = vd + seg;
+        uint32_t *a = va + seg;
+        uint32_t sum0, sum1, sum2, sum3;
+
+        /*
+         * Process the entire segment at once, writing back the
+         * results only after we've consumed all of the inputs.
+         *
+         * Key to indicies by column:
+         *          i   j                  i             j
+         */
+        sum0 = a[H4(0 + 0)];
+        sum0 = inner_loop(sum0, vn + seg + 0, vm + seg + 0);
+        sum1 = a[H4(0 + 1)];
+        sum1 = inner_loop(sum1, vn + seg + 0, vm + seg + 8);
+        sum2 = a[H4(2 + 0)];
+        sum2 = inner_loop(sum2, vn + seg + 8, vm + seg + 0);
+        sum3 = a[H4(2 + 1)];
+        sum3 = inner_loop(sum3, vn + seg + 8, vm + seg + 8);
+
+        d[H4(0)] = sum0;
+        d[H4(1)] = sum1;
+        d[H4(2)] = sum2;
+        d[H4(3)] = sum3;
+    }
+    clear_tail(vd, opr_sz, simd_maxsz(desc));
+}
+
+#define DO_MMLA_B(NAME, INNER) \
+    void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc) \
+    { do_mmla_b(vd, vn, vm, va, desc, INNER); }
+
+DO_MMLA_B(gvec_smmla_b, do_smmla_b)
+DO_MMLA_B(gvec_ummla_b, do_ummla_b)
+DO_MMLA_B(gvec_usmmla_b, do_usmmla_b)
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index c322615915..f1893b1dc8 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -4027,3 +4027,30 @@ static bool trans_VTRN(DisasContext *s, arg_2misc *a)
     tcg_temp_free_i32(tmp2);
     return true;
 }
+
+static bool trans_VSMMLA(DisasContext *s, arg_VSMMLA *a)
+{
+    if (!dc_isar_feature(aa32_i8mm, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, 7, a->vd, a->vn, a->vm, 0,
+                        gen_helper_gvec_smmla_b);
+}
+
+static bool trans_VUMMLA(DisasContext *s, arg_VUMMLA *a)
+{
+    if (!dc_isar_feature(aa32_i8mm, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, 7, a->vd, a->vn, a->vm, 0,
+                        gen_helper_gvec_ummla_b);
+}
+
+static bool trans_VUSMMLA(DisasContext *s, arg_VUSMMLA *a)
+{
+    if (!dc_isar_feature(aa32_i8mm, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, 7, a->vd, a->vn, a->vm, 0,
+                        gen_helper_gvec_usmmla_b);
+}
-- 
2.25.1


