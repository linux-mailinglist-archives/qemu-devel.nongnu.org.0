Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBBB362AB7
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 00:05:37 +0200 (CEST)
Received: from localhost ([::1]:57696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWam-0006Ao-Dm
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 18:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVda-0005uY-IQ
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:26 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:37616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdF-0001gs-97
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:26 -0400
Received: by mail-pg1-x532.google.com with SMTP id p2so4545670pgh.4
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tTGUPYLRanHesNN2/5sC3VdhU409Nhotte30zMeHJNQ=;
 b=VvfzCxDHgpuyrRpWx5frnhwPwDwGxtlX9BWY2U9WXQq7SDg9hMYr7wpZOoTK5WjwPm
 9EaIfX7CGDxv6afqo7wsmH6sbXMCprZXCWNZVPRug9xDjeZzN0XHdxtXKx2tYl1KwV0w
 W+juRNrYYm3ZloeJrvdrHBjvngW3CUzxfvOTO7tX5C1jNErinlnGj6TlxHNUNEzliu1u
 3GKN8lCMg96I1qMxgFG6yBTtBuIMgKp0bKzXvK8mOaIXHFo0oC9/BeAU6G1O9HjEVRgG
 wSonUF8RpcKAv818udkob+7LzXv0Ty+z7kEuFgznz3Y9XsjjSsdhk0qfCimqQBZUAE1m
 oooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tTGUPYLRanHesNN2/5sC3VdhU409Nhotte30zMeHJNQ=;
 b=OynowGZFPbnqptEoPG/8dbeeAyWt+2KD3XkNQOpYtXh779klbEoxFuIbrl0wn6nJmO
 tT7JHDNgA6ZV0pF8ptUY8dgGEcFhujdCRKg8r+USSMS1vOMpePro/RDMwzFSxYEmGcB9
 WbUYAMmOnGVYdOVbwa2vJAKPY5O1OvOZWAz7Mg3V0kO0lMasIG/1IJLEYoyEHd56Cneo
 25GCr6tFxRDZ/ecUGLrKnpl010ad0EquJS8/Wz8RQvEPMem51kIFiHYUKg/b5Bf6mfoe
 vXrJij1UUiz4W9Pts23GbeVjdtwZ1py7UVM3nlIUGTBqARDJBE2byOvjNt6njgdJ1g60
 vxPw==
X-Gm-Message-State: AOAM5338Au1M6veyWVKuSEQCBfIgzcP7rF7Kj34LsI21FchvPdLFCHGN
 Jw/+XIN7H5ktI5jLFl64sXd63k7Tcvgu1Q==
X-Google-Smtp-Source: ABdhPJxRcOMjjDMuHCUj6fDxgFyHo9IdEyWl6cE3g4NRbGjQN941b14ncscUo+pbE0kuYcSuTLN+8A==
X-Received: by 2002:aa7:904e:0:b029:25a:4469:222a with SMTP id
 n14-20020aa7904e0000b029025a4469222amr3746101pfo.72.1618607041111; 
 Fri, 16 Apr 2021 14:04:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 49/81] target/arm: Pass separate addend to FCMLA helpers
Date: Fri, 16 Apr 2021 14:02:08 -0700
Message-Id: <20210416210240.1591291-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

For SVE, we potentially have a 4th argument coming from the
movprfx instruction.  Currently we do not optimize movprfx,
so the problem is not visible.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             | 20 ++++++-------
 target/arm/translate-a64.c      | 28 ++++++++++++++----
 target/arm/translate-sve.c      |  5 ++--
 target/arm/vec_helper.c         | 50 +++++++++++++--------------------
 target/arm/translate-neon.c.inc | 10 ++++---
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
index 004ff8c019..f45b81e56d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -709,6 +709,23 @@ static void gen_gvec_op4_ool(DisasContext *s, bool is_q, int rd, int rn,
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
@@ -12220,15 +12237,15 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
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
@@ -13479,9 +13496,10 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
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
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0317d5386a..ffae6884d2 100644
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
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 8ecfef1567..6f418bd8de 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -146,7 +146,7 @@ static bool trans_VCMLA(DisasContext *s, arg_VCMLA *a)
 {
     int opr_sz;
     TCGv_ptr fpst;
-    gen_helper_gvec_3_ptr *fn_gvec_ptr;
+    gen_helper_gvec_4_ptr *fn_gvec_ptr;
 
     if (!dc_isar_feature(aa32_vcma, s)
         || (a->size == MO_16 && !dc_isar_feature(aa32_fp16_arith, s))) {
@@ -171,9 +171,10 @@ static bool trans_VCMLA(DisasContext *s, arg_VCMLA *a)
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
@@ -284,7 +285,7 @@ static bool trans_VFML(DisasContext *s, arg_VFML *a)
 
 static bool trans_VCMLA_scalar(DisasContext *s, arg_VCMLA_scalar *a)
 {
-    gen_helper_gvec_3_ptr *fn_gvec_ptr;
+    gen_helper_gvec_4_ptr *fn_gvec_ptr;
     int opr_sz;
     TCGv_ptr fpst;
 
@@ -313,9 +314,10 @@ static bool trans_VCMLA_scalar(DisasContext *s, arg_VCMLA_scalar *a)
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
-- 
2.25.1


