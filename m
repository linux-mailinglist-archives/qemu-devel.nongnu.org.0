Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEE138F7CA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:59:09 +0200 (CEST)
Received: from localhost ([::1]:54568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMLc-0008BR-Ty
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYQ-0000bZ-AP
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:18 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:38808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXs-00043I-0R
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:17 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 cu11-20020a17090afa8bb029015d5d5d2175so12260153pjb.3
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cBhzZYMHQj2yvOM4vvz9Jmebb2oW8LX0Xxyx5R1ATzY=;
 b=jJhMpmT8ATTzoX2rg6v+FAPY/zY8Hz8UgZJGCgn2se0YaeS78B2RPGeIEhKxjn4Enr
 UlkjZKICO5U/BY0GvtlSQg2Q+AvmPzaEYgFZ07evcbqqciX2rn4wS9yaCx4eW02nRoOG
 AKYbWbA9GBrcGhXtcqomb9hRfsadfseQXJfpiuqYBl69EwL1amQjZeoVOu/zRj6tOMsN
 cxPX8+Onn5zS/LEB9BDlsQ72vbMQLj5UpZ/BCCj8IuqMI7ri8tjnrRaSGcs7Xt8a2DJg
 HEHulct8/plaCATQrJS0D/dBe0+HrmrJmLKMjHJkLYD9a0ujOemzVlRtsJteKtTKBx4X
 ZkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cBhzZYMHQj2yvOM4vvz9Jmebb2oW8LX0Xxyx5R1ATzY=;
 b=FePNkkrTcMes1hUTqI7ooBEgPju57vYMj3y3+XSitNy5Nrn2VFN0eEqKNiNVYXuvRe
 Pu+LRYRWVYs6jKZ6WXZTyZqrNj93wra+ovTbYQXQKpjTk5n5fDBwrYzz3MUxjBmV1JSh
 phAkhFjVEyruYUSueL/5L8BCCAp8m4jNN4Fnvn2C59klJe+c703Io/B7B9vY98AbMQqu
 WxoChP95carI6AX3WyePMRfyIXmiFAa26qGWvMoiL2dbF87BlomKc6SGgeUANUzph8q2
 J37+WlRfcbs680nM68JIzABxoGuvB4wvcL5++zhe761cayMh/KzXq/ZIrBDdtDVaO3j6
 Ucnw==
X-Gm-Message-State: AOAM531iI7HdDRBF3S4x2NJLcHTKoNGklMoHUMxa9U41H6DdCtfyyL+s
 kkXZjw/BqKjwwFVKiRNHdHI7jFZ72HCzCA==
X-Google-Smtp-Source: ABdhPJzmJy4lNnRvCwvnM13sR5uVZOQWtzcgbkjBqbOhGs3CRIZwNRzUCGYcWdd3Qs/tWJIinD5mnw==
X-Received: by 2002:a17:902:7b8e:b029:ec:982d:7a7e with SMTP id
 w14-20020a1709027b8eb02900ec982d7a7emr27932411pll.55.1621904850481; 
 Mon, 24 May 2021 18:07:30 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 50/92] target/arm: Pass separate addend to FCMLA helpers
Date: Mon, 24 May 2021 18:03:16 -0700
Message-Id: <20210525010358.152808-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

For SVE, we potentially have a 4th argument coming from the
movprfx instruction.  Currently we do not optimize movprfx,
so the problem is not visible.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h         | 20 +++++++--------
 target/arm/translate-a64.c  | 28 +++++++++++++++++----
 target/arm/translate-neon.c | 10 +++++---
 target/arm/translate-sve.c  |  5 ++--
 target/arm/vec_helper.c     | 50 +++++++++++++++----------------------
 5 files changed, 62 insertions(+), 51 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index f4b092ee1c..72c5bf6aca 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -629,16 +629,16 @@ DEF_HELPER_FLAGS_5(gvec_fcadds, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_fcaddd, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_5(gvec_fcmlah, TCG_CALL_NO_RWG,
-                   void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(gvec_fcmlah_idx, TCG_CALL_NO_RWG,
-                   void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(gvec_fcmlas, TCG_CALL_NO_RWG,
-                   void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(gvec_fcmlas_idx, TCG_CALL_NO_RWG,
-                   void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(gvec_fcmlad, TCG_CALL_NO_RWG,
-                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(gvec_fcmlah, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(gvec_fcmlah_idx, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(gvec_fcmlas, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(gvec_fcmlas_idx, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(gvec_fcmlad, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(neon_paddh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(neon_pmaxh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 61c5fa9656..a8edd2d281 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -694,6 +694,23 @@ static void gen_gvec_op4_ool(DisasContext *s, bool is_q, int rd, int rn,
                        is_q ? 16 : 8, vec_full_reg_size(s), data, fn);
 }
 
+/*
+ * Expand a 4-operand + fpstatus pointer + simd data value operation using
+ * an out-of-line helper.
+ */
+static void gen_gvec_op4_fpst(DisasContext *s, bool is_q, int rd, int rn,
+                              int rm, int ra, bool is_fp16, int data,
+                              gen_helper_gvec_4_ptr *fn)
+{
+    TCGv_ptr fpst = fpstatus_ptr(is_fp16 ? FPST_FPCR_F16 : FPST_FPCR);
+    tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, rd),
+                       vec_full_reg_offset(s, rn),
+                       vec_full_reg_offset(s, rm),
+                       vec_full_reg_offset(s, ra), fpst,
+                       is_q ? 16 : 8, vec_full_reg_size(s), data, fn);
+    tcg_temp_free_ptr(fpst);
+}
+
 /* Set ZF and NF based on a 64 bit result. This is alas fiddlier
  * than the 32 bit equivalent.
  */
@@ -12205,15 +12222,15 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         rot = extract32(opcode, 0, 2);
         switch (size) {
         case 1:
-            gen_gvec_op3_fpst(s, is_q, rd, rn, rm, true, rot,
+            gen_gvec_op4_fpst(s, is_q, rd, rn, rm, rd, true, rot,
                               gen_helper_gvec_fcmlah);
             break;
         case 2:
-            gen_gvec_op3_fpst(s, is_q, rd, rn, rm, false, rot,
+            gen_gvec_op4_fpst(s, is_q, rd, rn, rm, rd, false, rot,
                               gen_helper_gvec_fcmlas);
             break;
         case 3:
-            gen_gvec_op3_fpst(s, is_q, rd, rn, rm, false, rot,
+            gen_gvec_op4_fpst(s, is_q, rd, rn, rm, rd, false, rot,
                               gen_helper_gvec_fcmlad);
             break;
         default:
@@ -13464,9 +13481,10 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         {
             int rot = extract32(insn, 13, 2);
             int data = (index << 2) | rot;
-            tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
+            tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, rd),
                                vec_full_reg_offset(s, rn),
-                               vec_full_reg_offset(s, rm), fpst,
+                               vec_full_reg_offset(s, rm),
+                               vec_full_reg_offset(s, rd), fpst,
                                is_q ? 16 : 8, vec_full_reg_size(s), data,
                                size == MO_64
                                ? gen_helper_gvec_fcmlas_idx
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index fa67605fdc..45fa5166f3 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -155,7 +155,7 @@ static bool trans_VCMLA(DisasContext *s, arg_VCMLA *a)
 {
     int opr_sz;
     TCGv_ptr fpst;
-    gen_helper_gvec_3_ptr *fn_gvec_ptr;
+    gen_helper_gvec_4_ptr *fn_gvec_ptr;
 
     if (!dc_isar_feature(aa32_vcma, s)
         || (a->size == MO_16 && !dc_isar_feature(aa32_fp16_arith, s))) {
@@ -180,9 +180,10 @@ static bool trans_VCMLA(DisasContext *s, arg_VCMLA *a)
     fpst = fpstatus_ptr(a->size == MO_16 ? FPST_STD_F16 : FPST_STD);
     fn_gvec_ptr = (a->size == MO_16) ?
         gen_helper_gvec_fcmlah : gen_helper_gvec_fcmlas;
-    tcg_gen_gvec_3_ptr(vfp_reg_offset(1, a->vd),
+    tcg_gen_gvec_4_ptr(vfp_reg_offset(1, a->vd),
                        vfp_reg_offset(1, a->vn),
                        vfp_reg_offset(1, a->vm),
+                       vfp_reg_offset(1, a->vd),
                        fpst, opr_sz, opr_sz, a->rot,
                        fn_gvec_ptr);
     tcg_temp_free_ptr(fpst);
@@ -293,7 +294,7 @@ static bool trans_VFML(DisasContext *s, arg_VFML *a)
 
 static bool trans_VCMLA_scalar(DisasContext *s, arg_VCMLA_scalar *a)
 {
-    gen_helper_gvec_3_ptr *fn_gvec_ptr;
+    gen_helper_gvec_4_ptr *fn_gvec_ptr;
     int opr_sz;
     TCGv_ptr fpst;
 
@@ -322,9 +323,10 @@ static bool trans_VCMLA_scalar(DisasContext *s, arg_VCMLA_scalar *a)
         gen_helper_gvec_fcmlah_idx : gen_helper_gvec_fcmlas_idx;
     opr_sz = (1 + a->q) * 8;
     fpst = fpstatus_ptr(a->size == MO_16 ? FPST_STD_F16 : FPST_STD);
-    tcg_gen_gvec_3_ptr(vfp_reg_offset(1, a->vd),
+    tcg_gen_gvec_4_ptr(vfp_reg_offset(1, a->vd),
                        vfp_reg_offset(1, a->vn),
                        vfp_reg_offset(1, a->vm),
+                       vfp_reg_offset(1, a->vd),
                        fpst, opr_sz, opr_sz,
                        (a->index << 2) | a->rot, fn_gvec_ptr);
     tcg_temp_free_ptr(fpst);
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2864c3a3cf..4f4b383e52 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4383,7 +4383,7 @@ static bool trans_FCMLA_zpzzz(DisasContext *s, arg_FCMLA_zpzzz *a)
 
 static bool trans_FCMLA_zzxz(DisasContext *s, arg_FCMLA_zzxz *a)
 {
-    static gen_helper_gvec_3_ptr * const fns[2] = {
+    static gen_helper_gvec_4_ptr * const fns[2] = {
         gen_helper_gvec_fcmlah_idx,
         gen_helper_gvec_fcmlas_idx,
     };
@@ -4393,9 +4393,10 @@ static bool trans_FCMLA_zzxz(DisasContext *s, arg_FCMLA_zzxz *a)
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
         TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
                            vec_full_reg_offset(s, a->rn),
                            vec_full_reg_offset(s, a->rm),
+                           vec_full_reg_offset(s, a->ra),
                            status, vsz, vsz,
                            a->index * 4 + a->rot,
                            fns[a->esz - 1]);
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index f88e572132..b19877e0d3 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -657,13 +657,11 @@ void HELPER(gvec_fcaddd)(void *vd, void *vn, void *vm,
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_fcmlah)(void *vd, void *vn, void *vm,
+void HELPER(gvec_fcmlah)(void *vd, void *vn, void *vm, void *va,
                          void *vfpst, uint32_t desc)
 {
     uintptr_t opr_sz = simd_oprsz(desc);
-    float16 *d = vd;
-    float16 *n = vn;
-    float16 *m = vm;
+    float16 *d = vd, *n = vn, *m = vm, *a = va;
     float_status *fpst = vfpst;
     intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
     uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
@@ -680,19 +678,17 @@ void HELPER(gvec_fcmlah)(void *vd, void *vn, void *vm,
         float16 e4 = e2;
         float16 e3 = m[H2(i + 1 - flip)] ^ neg_imag;
 
-        d[H2(i)] = float16_muladd(e2, e1, d[H2(i)], 0, fpst);
-        d[H2(i + 1)] = float16_muladd(e4, e3, d[H2(i + 1)], 0, fpst);
+        d[H2(i)] = float16_muladd(e2, e1, a[H2(i)], 0, fpst);
+        d[H2(i + 1)] = float16_muladd(e4, e3, a[H2(i + 1)], 0, fpst);
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_fcmlah_idx)(void *vd, void *vn, void *vm,
+void HELPER(gvec_fcmlah_idx)(void *vd, void *vn, void *vm, void *va,
                              void *vfpst, uint32_t desc)
 {
     uintptr_t opr_sz = simd_oprsz(desc);
-    float16 *d = vd;
-    float16 *n = vn;
-    float16 *m = vm;
+    float16 *d = vd, *n = vn, *m = vm, *a = va;
     float_status *fpst = vfpst;
     intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
     uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
@@ -716,20 +712,18 @@ void HELPER(gvec_fcmlah_idx)(void *vd, void *vn, void *vm,
             float16 e2 = n[H2(j + flip)];
             float16 e4 = e2;
 
-            d[H2(j)] = float16_muladd(e2, e1, d[H2(j)], 0, fpst);
-            d[H2(j + 1)] = float16_muladd(e4, e3, d[H2(j + 1)], 0, fpst);
+            d[H2(j)] = float16_muladd(e2, e1, a[H2(j)], 0, fpst);
+            d[H2(j + 1)] = float16_muladd(e4, e3, a[H2(j + 1)], 0, fpst);
         }
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_fcmlas)(void *vd, void *vn, void *vm,
+void HELPER(gvec_fcmlas)(void *vd, void *vn, void *vm, void *va,
                          void *vfpst, uint32_t desc)
 {
     uintptr_t opr_sz = simd_oprsz(desc);
-    float32 *d = vd;
-    float32 *n = vn;
-    float32 *m = vm;
+    float32 *d = vd, *n = vn, *m = vm, *a = va;
     float_status *fpst = vfpst;
     intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
     uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
@@ -746,19 +740,17 @@ void HELPER(gvec_fcmlas)(void *vd, void *vn, void *vm,
         float32 e4 = e2;
         float32 e3 = m[H4(i + 1 - flip)] ^ neg_imag;
 
-        d[H4(i)] = float32_muladd(e2, e1, d[H4(i)], 0, fpst);
-        d[H4(i + 1)] = float32_muladd(e4, e3, d[H4(i + 1)], 0, fpst);
+        d[H4(i)] = float32_muladd(e2, e1, a[H4(i)], 0, fpst);
+        d[H4(i + 1)] = float32_muladd(e4, e3, a[H4(i + 1)], 0, fpst);
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_fcmlas_idx)(void *vd, void *vn, void *vm,
+void HELPER(gvec_fcmlas_idx)(void *vd, void *vn, void *vm, void *va,
                              void *vfpst, uint32_t desc)
 {
     uintptr_t opr_sz = simd_oprsz(desc);
-    float32 *d = vd;
-    float32 *n = vn;
-    float32 *m = vm;
+    float32 *d = vd, *n = vn, *m = vm, *a = va;
     float_status *fpst = vfpst;
     intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
     uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
@@ -782,20 +774,18 @@ void HELPER(gvec_fcmlas_idx)(void *vd, void *vn, void *vm,
             float32 e2 = n[H4(j + flip)];
             float32 e4 = e2;
 
-            d[H4(j)] = float32_muladd(e2, e1, d[H4(j)], 0, fpst);
-            d[H4(j + 1)] = float32_muladd(e4, e3, d[H4(j + 1)], 0, fpst);
+            d[H4(j)] = float32_muladd(e2, e1, a[H4(j)], 0, fpst);
+            d[H4(j + 1)] = float32_muladd(e4, e3, a[H4(j + 1)], 0, fpst);
         }
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_fcmlad)(void *vd, void *vn, void *vm,
+void HELPER(gvec_fcmlad)(void *vd, void *vn, void *vm, void *va,
                          void *vfpst, uint32_t desc)
 {
     uintptr_t opr_sz = simd_oprsz(desc);
-    float64 *d = vd;
-    float64 *n = vn;
-    float64 *m = vm;
+    float64 *d = vd, *n = vn, *m = vm, *a = va;
     float_status *fpst = vfpst;
     intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
     uint64_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
@@ -812,8 +802,8 @@ void HELPER(gvec_fcmlad)(void *vd, void *vn, void *vm,
         float64 e4 = e2;
         float64 e3 = m[i + 1 - flip] ^ neg_imag;
 
-        d[i] = float64_muladd(e2, e1, d[i], 0, fpst);
-        d[i + 1] = float64_muladd(e4, e3, d[i + 1], 0, fpst);
+        d[i] = float64_muladd(e2, e1, a[i], 0, fpst);
+        d[i + 1] = float64_muladd(e4, e3, a[i + 1], 0, fpst);
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
-- 
2.25.1


