Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9BE38F7F3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:12:09 +0200 (CEST)
Received: from localhost ([::1]:45160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMYC-0005yV-8o
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLbA-0006T4-Bb
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:08 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLaz-0005uf-AB
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:08 -0400
Received: by mail-pl1-x635.google.com with SMTP id u7so6946738plq.4
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DX7CTp5EweNzeq/zxrwefxTe7CRateXrXF2rNVC4RlA=;
 b=YAfnwtSaJ/7rQazrG+hmfQueP3oficUrWcPZ/+BQY1ny6Kran0+rnyy/reeHYMqeny
 XSr/ABO1AS13dGdzrGJ+HfLmPPga9aqfJunxE5cSWQPlkCcNdNAMhJMASlxqVSvXT3+z
 HhmaiZ7HLGwsB0AQb9dvdYcaWDH9pBLktKIllC0F0oejsWQMXW1NaCMZ3UvTQugen8jD
 HIktsg93hHwydPoysZsta6TIB7dJy2SwzDbU2aL6pYR1XdQJcClZoiYl9VMntpUaJh1m
 3zUsqVfLUzwa6lRirnxMib8gLDESKirKltoxEf0zhNAM16Z8BaNqgbPvF4z5AyFf7uit
 qGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DX7CTp5EweNzeq/zxrwefxTe7CRateXrXF2rNVC4RlA=;
 b=CaCjvXiJTa/i5pXkn6kg6BpCa0VgArkJSLw++Fpas02X5S27S4+I2XiEK4O32tUYCt
 ejPLdoRQqKcTYaOElgFrC039z1f8YurYd3ZSUXMWr9VB4gtqUy8dWjNKx5Eax0RJxXIx
 hcYnzFLonAuT80wuHcxN764+5WeB2gVm2CEjRUu9EdxU0zCIctvu9qtFjhueFepU0jPc
 JtDN9/+BvLNO6E2omqFio9NnCUcebxOHxwjVMcWTHf3S4T6tD3xCyiZs4dCUQ8XLrzEW
 5q4iN1XmkkQ/ssDhw+oSawMyaWjin/SrxqjpOHlyoZJeOCYTZEx+UnSTbRAMjsFHXccS
 WyRw==
X-Gm-Message-State: AOAM532pR1N/ByIB4DP55KhU6yrro9Nbaq+hns93ZjeIbv8lTeAvTdYX
 iT01NoPk6H9qRNljSwjGy4n6f564ur2R0Q==
X-Google-Smtp-Source: ABdhPJxKoROolzZtPkJH6oAr2ZfMjQH9tJ9HwCVnXSNKOhRZ+rq/hcONLBxJRWTxNYN2IbNAm9E02g==
X-Received: by 2002:a17:902:720c:b029:ee:f427:91e9 with SMTP id
 ba12-20020a170902720cb02900eef42791e9mr28153520plb.72.1621905055865; 
 Mon, 24 May 2021 18:10:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id i8sm10614839pjs.54.2021.05.24.18.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:10:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 90/92] target/arm: Implement integer matrix multiply
 accumulate
Date: Mon, 24 May 2021 18:03:56 -0700
Message-Id: <20210525010358.152808-91-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is {S,U,US}MMLA for both AArch64 AdvSIMD and SVE,
and V{S,U,US}MMLA.S8 for AArch32 NEON.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
index 92b81bbabe..23ccb0f72f 100644
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
index 78a2a31ab1..cb077bfde9 100644
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
index c875481784..ceac0ee2bd 100644
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
index b6ca29c25c..9e990b41ed 100644
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
index 428ae018a3..9574efe957 100644
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
index 19c4ba1bdf..e84b438340 100644
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
2.25.1


