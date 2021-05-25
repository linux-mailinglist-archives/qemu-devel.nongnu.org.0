Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E3E3906CF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:42:45 +0200 (CEST)
Received: from localhost ([::1]:41026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lla8h-000840-Md
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYf3-0003J4-VP
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:08:01 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYex-00079g-LW
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:08:01 -0400
Received: by mail-wr1-x433.google.com with SMTP id x8so32616945wrq.9
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=L0r73QGVQUtSVFAL+IfKWqZITIaxU2ZQVaBDJJLhCFY=;
 b=LtRAuaYGRFP7xDQ5QisjFMMhJCU24JTmV51gczDVISI1GLowMa0UwV91ahIwQj24C/
 MBGhM32Me2XphVATR7znLrHzeNV+sC7UOD1UVtRHgCuzg/AnmDUWjjHd9Ji/SX++LtTK
 K5CpS3WU4uqaCTZBvkduc+S0JuUCJ6du1pHsJAZf1Gy+76u7ktNBMWWgI5kghz19Uihk
 8d31mIM6Iamr5Vl6uDCpHrrWU0WyBurYAUW7pHcjQvl2lEhAsc5RVsY7l2ZlELc53WGH
 VBeO9gLxYxFRAsbfQ0vCf5S/Ps9OJ1SwLNNKr6qq0CGbw7iQcedA4GlZMNmnKbWUgsbI
 AnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L0r73QGVQUtSVFAL+IfKWqZITIaxU2ZQVaBDJJLhCFY=;
 b=b5Mg+OIrbq1T/audGVfMeP9Q1NveQqUCUxFlygOZjnRw8XpmATlq8fEuxhdCrQqsyz
 ONEdHj6HqxemF/Ncqj7ph2GMC/NZuoqqfQ9VQck5+ds6/0RKN1Njr5I4jcN+z6hH74vh
 rZymLB9toMPDZq6GHkaGRzf3nkHz1ORUwZjpwnU8pVM+v5OayoDohiXXJ5ZwmZFPJtfh
 h+XYrFr61/sKXYhDy+ZljJQEfya8VdGxuxlH+3MST1zx57JX6Nh2tTDt6aToWoUZzW1K
 3TGp74Ae8xwQFsLQFUFXZWa5D5eSW47vp63lh/gLZBSiLurv0VW2bwTv+044VJv9FxWi
 knJg==
X-Gm-Message-State: AOAM532r5CJuoHliWF0H8n4Ss4/0vfZvyDL6qukq02BGuh8hkE49GXF5
 75v6KBhFSloqpWQFzrFAGiOP75mNr6RENHBJ
X-Google-Smtp-Source: ABdhPJx61kljaT4Lc7GNyfop1SD35rYU+gHMUbH9a0C9u1DoWcvYHxt3J92eyxsRC6SSIEZSxq5yYw==
X-Received: by 2002:adf:fe8e:: with SMTP id l14mr28239636wrr.305.1621955273597; 
 Tue, 25 May 2021 08:07:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a11sm16643357wrr.48.2021.05.25.08.07.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 112/114] target/arm: Implement integer matrix multiply
 accumulate
Date: Tue, 25 May 2021 16:07:34 +0100
Message-Id: <20210525150736.32695-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150736.32695-1-peter.maydell@linaro.org>
References: <20210525150736.32695-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This is {S,U,US}MMLA for both AArch64 AdvSIMD and SVE,
and V{S,U,US}MMLA.S8 for AArch32 NEON.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-91-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h           |  7 ++++
 target/arm/neon-shared.decode |  7 ++++
 target/arm/sve.decode         |  6 +++
 target/arm/translate-a64.c    | 18 ++++++++
 target/arm/translate-neon.c   | 27 ++++++++++++
 target/arm/translate-sve.c    | 27 ++++++++++++
 target/arm/vec_helper.c       | 77 +++++++++++++++++++++++++++++++++++
 7 files changed, 169 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 92b81bbabe4..23ccb0f72f6 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -993,6 +993,13 @@ DEF_HELPER_FLAGS_6(sve2_fmlal_zzxw_s, TCG_CALL_NO_RWG,
 
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
index 5befaec87b1..cc9f4cdd85b 100644
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
index 78a2a31ab19..cb077bfde90 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1413,6 +1413,12 @@ USHLLT          01000101 .. 0 ..... 1010 11 ..... .....  @rd_rn_tszimm_shl
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
index c8754817842..ceac0ee2bd6 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12182,6 +12182,15 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
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
@@ -12226,6 +12235,15 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
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
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index b6ca29c25ca..9e990b41eda 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -4036,3 +4036,30 @@ static bool trans_VTRN(DisasContext *s, arg_2misc *a)
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
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 428ae018a35..9574efe9578 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8610,3 +8610,30 @@ static bool trans_FMLSLT_zzxw(DisasContext *s, arg_rrxr_esz *a)
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
index 19c4ba1bdf5..e84b438340e 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2335,3 +2335,80 @@ void HELPER(gvec_xar_d)(void *vd, void *vn, void *vm, uint32_t desc)
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
-- 
2.20.1


