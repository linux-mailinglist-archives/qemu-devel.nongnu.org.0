Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B315D3905EF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:55:31 +0200 (CEST)
Received: from localhost ([::1]:41116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZP0-0002MH-OZ
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:55:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbv-000463-13
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:47 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:52736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbl-0004io-VV
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:46 -0400
Received: by mail-wm1-x32c.google.com with SMTP id z130so16945241wmg.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bP2ZYNAScjvWGdRxTW3riK0zstPS/GK6sQXJnNnLnOQ=;
 b=LVMmmMtHuIYD3Ud13pbYLB0WrXg3ObcTQjl2IYVm5WcnhUQDM/pilDI997I/cc7phe
 2jERFOQtMMIGpMQCjP/cUtlf5koHRoyeHoPFkaF/X31+5c83lrWJi9TJQdpN6DngYIOf
 5eJJxx0noTCNq6/pSIhyhFxrQ5q9Jcf319bWPOFw3XJHFnmUAUddVM4GfgM+hpqTCn0N
 p/wxPtzalAMBl7RyCcvwEW9bbzsFDy8wfZqLahd43Y24wluYG2oiLF7ZpTdG//dQTXVm
 mHBDRrSr6nRUEK2qoPrGw7VPEHmm2TX2eOcXzMnM1xhatZ/br9N+TqcLM/NKqTZeu0D0
 Q1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bP2ZYNAScjvWGdRxTW3riK0zstPS/GK6sQXJnNnLnOQ=;
 b=B9aWZc8v0xztA/2KQiKEvG/a4gbD+hP7Ji9yBMNcq00UPDMNn4HvOE3W+wcNKw2a6J
 s8qoTp8pFbhbd5ekxj65UIp8FzMvxcNcC1ZR53JCGBAh77RAgK9p1RCXoBW+eNC8fQ+t
 UH4cLIwPBS8Uqe5Q8mFtQegmAdRXLy0YnC53ek5UxtkCKWmaV/QKbRpRj/azv2xGJwTU
 Xn5M8VqIl5aI+fCz5CrTpY7XEwSfJ6hXkd3hU6YH1XqBsJPY0KuGUCiSmVtCA5fMnpF5
 kJAYTdVuRO5VUAWOO/TbkMl+SMA3PMI2IucqFhARfTQjSqTsb/pc3o+ESXU79/v6DTV2
 E/Ow==
X-Gm-Message-State: AOAM533sN1vTo7bT9XQ8MFd/cBRDjElu/Tsl1Jaq10TjN4z6/+sWJyGr
 fUmbuZoMBlMt6P7lFbLYQQKNh+zRfUgWKj9M
X-Google-Smtp-Source: ABdhPJzJ6wvjF53sv10D7OeMS4xiTQImpe/EttuU06/rO5jaEzSGhQPj1pE3c2Ouc/eV6aSbUfR6kQ==
X-Received: by 2002:a05:600c:246:: with SMTP id
 6mr24419107wmj.175.1621955076473; 
 Tue, 25 May 2021 08:04:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 071/114] target/arm: Pass separate addend to {U, S}DOT helpers
Date: Tue, 25 May 2021 16:02:41 +0100
Message-Id: <20210525150324.32370-72-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

For SVE, we potentially have a 4th argument coming from the
movprfx instruction.  Currently we do not optimize movprfx,
so the problem is not visible.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-50-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h         |  20 +++---
 target/arm/sve.decode       |   7 ++-
 target/arm/translate-a64.c  |  15 ++++-
 target/arm/translate-neon.c |  10 +--
 target/arm/translate-sve.c  |  13 ++--
 target/arm/vec_helper.c     | 120 ++++++++++++++++++++----------------
 6 files changed, 109 insertions(+), 76 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 23a7ec56384..f4b092ee1c1 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -608,15 +608,19 @@ DEF_HELPER_FLAGS_5(sve2_sqrdmlah_d, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_4(gvec_sdot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(gvec_udot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(gvec_sdot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(gvec_udot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sdot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_udot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sdot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_udot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_4(gvec_sdot_idx_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(gvec_udot_idx_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(gvec_sdot_idx_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(gvec_udot_idx_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sdot_idx_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_udot_idx_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sdot_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_udot_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fcaddh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 67b6466a1e9..04ef38f1480 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -756,12 +756,13 @@ UMIN_zzi        00100101 .. 101 011 110 ........ .....          @rdn_i8u
 MUL_zzi         00100101 .. 110 000 110 ........ .....          @rdn_i8s
 
 # SVE integer dot product (unpredicated)
-DOT_zzz         01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5      ra=%reg_movprfx
+DOT_zzzz        01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5 \
+                ra=%reg_movprfx
 
 # SVE integer dot product (indexed)
-DOT_zzx         01000100 101 index:2 rm:3 00000 u:1 rn:5 rd:5 \
+DOT_zzxw        01000100 101 index:2 rm:3 00000 u:1 rn:5 rd:5 \
                 sz=0 ra=%reg_movprfx
-DOT_zzx         01000100 111 index:1 rm:4 00000 u:1 rn:5 rd:5 \
+DOT_zzxw        01000100 111 index:1 rm:4 00000 u:1 rn:5 rd:5 \
                 sz=1 ra=%reg_movprfx
 
 # SVE floating-point complex add (predicated)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index bdd47208b15..61c5fa96567 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -683,6 +683,17 @@ static void gen_gvec_op3_qc(DisasContext *s, bool is_q, int rd, int rn,
     tcg_temp_free_ptr(qc_ptr);
 }
 
+/* Expand a 4-operand operation using an out-of-line helper.  */
+static void gen_gvec_op4_ool(DisasContext *s, bool is_q, int rd, int rn,
+                             int rm, int ra, int data, gen_helper_gvec_4 *fn)
+{
+    tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
+                       vec_full_reg_offset(s, rn),
+                       vec_full_reg_offset(s, rm),
+                       vec_full_reg_offset(s, ra),
+                       is_q ? 16 : 8, vec_full_reg_size(s), data, fn);
+}
+
 /* Set ZF and NF based on a 64 bit result. This is alas fiddlier
  * than the 32 bit equivalent.
  */
@@ -12183,7 +12194,7 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         return;
 
     case 0x2: /* SDOT / UDOT */
-        gen_gvec_op3_ool(s, is_q, rd, rn, rm, 0,
+        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0,
                          u ? gen_helper_gvec_udot_b : gen_helper_gvec_sdot_b);
         return;
 
@@ -13442,7 +13453,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     switch (16 * u + opcode) {
     case 0x0e: /* SDOT */
     case 0x1e: /* UDOT */
-        gen_gvec_op3_ool(s, is_q, rd, rn, rm, index,
+        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
                          u ? gen_helper_gvec_udot_idx_b
                          : gen_helper_gvec_sdot_idx_b);
         return;
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 658bd275dac..fa67605fdc4 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -230,7 +230,7 @@ static bool trans_VCADD(DisasContext *s, arg_VCADD *a)
 static bool trans_VDOT(DisasContext *s, arg_VDOT *a)
 {
     int opr_sz;
-    gen_helper_gvec_3 *fn_gvec;
+    gen_helper_gvec_4 *fn_gvec;
 
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
@@ -252,9 +252,10 @@ static bool trans_VDOT(DisasContext *s, arg_VDOT *a)
 
     opr_sz = (1 + a->q) * 8;
     fn_gvec = a->u ? gen_helper_gvec_udot_b : gen_helper_gvec_sdot_b;
-    tcg_gen_gvec_3_ool(vfp_reg_offset(1, a->vd),
+    tcg_gen_gvec_4_ool(vfp_reg_offset(1, a->vd),
                        vfp_reg_offset(1, a->vn),
                        vfp_reg_offset(1, a->vm),
+                       vfp_reg_offset(1, a->vd),
                        opr_sz, opr_sz, 0, fn_gvec);
     return true;
 }
@@ -332,7 +333,7 @@ static bool trans_VCMLA_scalar(DisasContext *s, arg_VCMLA_scalar *a)
 
 static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
 {
-    gen_helper_gvec_3 *fn_gvec;
+    gen_helper_gvec_4 *fn_gvec;
     int opr_sz;
     TCGv_ptr fpst;
 
@@ -357,9 +358,10 @@ static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
     fn_gvec = a->u ? gen_helper_gvec_udot_idx_b : gen_helper_gvec_sdot_idx_b;
     opr_sz = (1 + a->q) * 8;
     fpst = fpstatus_ptr(FPST_STD);
-    tcg_gen_gvec_3_ool(vfp_reg_offset(1, a->vd),
+    tcg_gen_gvec_4_ool(vfp_reg_offset(1, a->vd),
                        vfp_reg_offset(1, a->vn),
                        vfp_reg_offset(1, a->rm),
+                       vfp_reg_offset(1, a->vd),
                        opr_sz, opr_sz, a->index, fn_gvec);
     tcg_temp_free_ptr(fpst);
     return true;
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 46f87ee259e..2864c3a3cfa 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3800,28 +3800,29 @@ DO_ZZI(UMIN, umin)
 
 #undef DO_ZZI
 
-static bool trans_DOT_zzz(DisasContext *s, arg_DOT_zzz *a)
+static bool trans_DOT_zzzz(DisasContext *s, arg_DOT_zzzz *a)
 {
-    static gen_helper_gvec_3 * const fns[2][2] = {
+    static gen_helper_gvec_4 * const fns[2][2] = {
         { gen_helper_gvec_sdot_b, gen_helper_gvec_sdot_h },
         { gen_helper_gvec_udot_b, gen_helper_gvec_udot_h }
     };
 
     if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, fns[a->u][a->sz], a->rd, a->rn, a->rm, 0);
+        gen_gvec_ool_zzzz(s, fns[a->u][a->sz], a->rd, a->rn, a->rm, a->ra, 0);
     }
     return true;
 }
 
-static bool trans_DOT_zzx(DisasContext *s, arg_DOT_zzx *a)
+static bool trans_DOT_zzxw(DisasContext *s, arg_DOT_zzxw *a)
 {
-    static gen_helper_gvec_3 * const fns[2][2] = {
+    static gen_helper_gvec_4 * const fns[2][2] = {
         { gen_helper_gvec_sdot_idx_b, gen_helper_gvec_sdot_idx_h },
         { gen_helper_gvec_udot_idx_b, gen_helper_gvec_udot_idx_h }
     };
 
     if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, fns[a->u][a->sz], a->rd, a->rn, a->rm, a->index);
+        gen_gvec_ool_zzzz(s, fns[a->u][a->sz], a->rd, a->rn, a->rm,
+                          a->ra, a->index);
     }
     return true;
 }
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 48e3addd814..f88e5721321 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -375,71 +375,76 @@ void HELPER(sve2_sqrdmlsh_d)(void *vd, void *vn, void *vm,
  * All elements are treated equally, no matter where they are.
  */
 
-void HELPER(gvec_sdot_b)(void *vd, void *vn, void *vm, uint32_t desc)
+void HELPER(gvec_sdot_b)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-    int32_t *d = vd;
+    int32_t *d = vd, *a = va;
     int8_t *n = vn, *m = vm;
 
     for (i = 0; i < opr_sz / 4; ++i) {
-        d[i] += n[i * 4 + 0] * m[i * 4 + 0]
-              + n[i * 4 + 1] * m[i * 4 + 1]
-              + n[i * 4 + 2] * m[i * 4 + 2]
-              + n[i * 4 + 3] * m[i * 4 + 3];
+        d[i] = (a[i] +
+                n[i * 4 + 0] * m[i * 4 + 0] +
+                n[i * 4 + 1] * m[i * 4 + 1] +
+                n[i * 4 + 2] * m[i * 4 + 2] +
+                n[i * 4 + 3] * m[i * 4 + 3]);
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_udot_b)(void *vd, void *vn, void *vm, uint32_t desc)
+void HELPER(gvec_udot_b)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-    uint32_t *d = vd;
+    uint32_t *d = vd, *a = va;
     uint8_t *n = vn, *m = vm;
 
     for (i = 0; i < opr_sz / 4; ++i) {
-        d[i] += n[i * 4 + 0] * m[i * 4 + 0]
-              + n[i * 4 + 1] * m[i * 4 + 1]
-              + n[i * 4 + 2] * m[i * 4 + 2]
-              + n[i * 4 + 3] * m[i * 4 + 3];
+        d[i] = (a[i] +
+                n[i * 4 + 0] * m[i * 4 + 0] +
+                n[i * 4 + 1] * m[i * 4 + 1] +
+                n[i * 4 + 2] * m[i * 4 + 2] +
+                n[i * 4 + 3] * m[i * 4 + 3]);
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_sdot_h)(void *vd, void *vn, void *vm, uint32_t desc)
+void HELPER(gvec_sdot_h)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-    int64_t *d = vd;
+    int64_t *d = vd, *a = va;
     int16_t *n = vn, *m = vm;
 
     for (i = 0; i < opr_sz / 8; ++i) {
-        d[i] += (int64_t)n[i * 4 + 0] * m[i * 4 + 0]
-              + (int64_t)n[i * 4 + 1] * m[i * 4 + 1]
-              + (int64_t)n[i * 4 + 2] * m[i * 4 + 2]
-              + (int64_t)n[i * 4 + 3] * m[i * 4 + 3];
+        d[i] = (a[i] +
+                (int64_t)n[i * 4 + 0] * m[i * 4 + 0] +
+                (int64_t)n[i * 4 + 1] * m[i * 4 + 1] +
+                (int64_t)n[i * 4 + 2] * m[i * 4 + 2] +
+                (int64_t)n[i * 4 + 3] * m[i * 4 + 3]);
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_udot_h)(void *vd, void *vn, void *vm, uint32_t desc)
+void HELPER(gvec_udot_h)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-    uint64_t *d = vd;
+    uint64_t *d = vd, *a = va;
     uint16_t *n = vn, *m = vm;
 
     for (i = 0; i < opr_sz / 8; ++i) {
-        d[i] += (uint64_t)n[i * 4 + 0] * m[i * 4 + 0]
-              + (uint64_t)n[i * 4 + 1] * m[i * 4 + 1]
-              + (uint64_t)n[i * 4 + 2] * m[i * 4 + 2]
-              + (uint64_t)n[i * 4 + 3] * m[i * 4 + 3];
+        d[i] = (a[i] +
+                (uint64_t)n[i * 4 + 0] * m[i * 4 + 0] +
+                (uint64_t)n[i * 4 + 1] * m[i * 4 + 1] +
+                (uint64_t)n[i * 4 + 2] * m[i * 4 + 2] +
+                (uint64_t)n[i * 4 + 3] * m[i * 4 + 3]);
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_sdot_idx_b)(void *vd, void *vn, void *vm, uint32_t desc)
+void HELPER(gvec_sdot_idx_b)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
 {
     intptr_t i, segend, opr_sz = simd_oprsz(desc), opr_sz_4 = opr_sz / 4;
     intptr_t index = simd_data(desc);
-    int32_t *d = vd;
+    int32_t *d = vd, *a = va;
     int8_t *n = vn;
     int8_t *m_indexed = (int8_t *)vm + H4(index) * 4;
 
@@ -455,10 +460,11 @@ void HELPER(gvec_sdot_idx_b)(void *vd, void *vn, void *vm, uint32_t desc)
         int8_t m3 = m_indexed[i * 4 + 3];
 
         do {
-            d[i] += n[i * 4 + 0] * m0
-                  + n[i * 4 + 1] * m1
-                  + n[i * 4 + 2] * m2
-                  + n[i * 4 + 3] * m3;
+            d[i] = (a[i] +
+                    n[i * 4 + 0] * m0 +
+                    n[i * 4 + 1] * m1 +
+                    n[i * 4 + 2] * m2 +
+                    n[i * 4 + 3] * m3);
         } while (++i < segend);
         segend = i + 4;
     } while (i < opr_sz_4);
@@ -466,11 +472,12 @@ void HELPER(gvec_sdot_idx_b)(void *vd, void *vn, void *vm, uint32_t desc)
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_udot_idx_b)(void *vd, void *vn, void *vm, uint32_t desc)
+void HELPER(gvec_udot_idx_b)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
 {
     intptr_t i, segend, opr_sz = simd_oprsz(desc), opr_sz_4 = opr_sz / 4;
     intptr_t index = simd_data(desc);
-    uint32_t *d = vd;
+    uint32_t *d = vd, *a = va;
     uint8_t *n = vn;
     uint8_t *m_indexed = (uint8_t *)vm + H4(index) * 4;
 
@@ -486,10 +493,11 @@ void HELPER(gvec_udot_idx_b)(void *vd, void *vn, void *vm, uint32_t desc)
         uint8_t m3 = m_indexed[i * 4 + 3];
 
         do {
-            d[i] += n[i * 4 + 0] * m0
-                  + n[i * 4 + 1] * m1
-                  + n[i * 4 + 2] * m2
-                  + n[i * 4 + 3] * m3;
+            d[i] = (a[i] +
+                    n[i * 4 + 0] * m0 +
+                    n[i * 4 + 1] * m1 +
+                    n[i * 4 + 2] * m2 +
+                    n[i * 4 + 3] * m3);
         } while (++i < segend);
         segend = i + 4;
     } while (i < opr_sz_4);
@@ -497,11 +505,12 @@ void HELPER(gvec_udot_idx_b)(void *vd, void *vn, void *vm, uint32_t desc)
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_sdot_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
+void HELPER(gvec_sdot_idx_h)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc), opr_sz_8 = opr_sz / 8;
     intptr_t index = simd_data(desc);
-    int64_t *d = vd;
+    int64_t *d = vd, *a = va;
     int16_t *n = vn;
     int16_t *m_indexed = (int16_t *)vm + index * 4;
 
@@ -509,30 +518,33 @@ void HELPER(gvec_sdot_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
      * Process the entire segment all at once, writing back the results
      * only after we've consumed all of the inputs.
      */
-    for (i = 0; i < opr_sz_8 ; i += 2) {
-        uint64_t d0, d1;
+    for (i = 0; i < opr_sz_8; i += 2) {
+        int64_t d0, d1;
 
-        d0  = n[i * 4 + 0] * (int64_t)m_indexed[i * 4 + 0];
+        d0  = a[i + 0];
+        d0 += n[i * 4 + 0] * (int64_t)m_indexed[i * 4 + 0];
         d0 += n[i * 4 + 1] * (int64_t)m_indexed[i * 4 + 1];
         d0 += n[i * 4 + 2] * (int64_t)m_indexed[i * 4 + 2];
         d0 += n[i * 4 + 3] * (int64_t)m_indexed[i * 4 + 3];
-        d1  = n[i * 4 + 4] * (int64_t)m_indexed[i * 4 + 0];
+
+        d1  = a[i + 1];
+        d1 += n[i * 4 + 4] * (int64_t)m_indexed[i * 4 + 0];
         d1 += n[i * 4 + 5] * (int64_t)m_indexed[i * 4 + 1];
         d1 += n[i * 4 + 6] * (int64_t)m_indexed[i * 4 + 2];
         d1 += n[i * 4 + 7] * (int64_t)m_indexed[i * 4 + 3];
 
-        d[i + 0] += d0;
-        d[i + 1] += d1;
+        d[i + 0] = d0;
+        d[i + 1] = d1;
     }
-
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_udot_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
+void HELPER(gvec_udot_idx_h)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc), opr_sz_8 = opr_sz / 8;
     intptr_t index = simd_data(desc);
-    uint64_t *d = vd;
+    uint64_t *d = vd, *a = va;
     uint16_t *n = vn;
     uint16_t *m_indexed = (uint16_t *)vm + index * 4;
 
@@ -540,22 +552,24 @@ void HELPER(gvec_udot_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
      * Process the entire segment all at once, writing back the results
      * only after we've consumed all of the inputs.
      */
-    for (i = 0; i < opr_sz_8 ; i += 2) {
+    for (i = 0; i < opr_sz_8; i += 2) {
         uint64_t d0, d1;
 
-        d0  = n[i * 4 + 0] * (uint64_t)m_indexed[i * 4 + 0];
+        d0  = a[i + 0];
+        d0 += n[i * 4 + 0] * (uint64_t)m_indexed[i * 4 + 0];
         d0 += n[i * 4 + 1] * (uint64_t)m_indexed[i * 4 + 1];
         d0 += n[i * 4 + 2] * (uint64_t)m_indexed[i * 4 + 2];
         d0 += n[i * 4 + 3] * (uint64_t)m_indexed[i * 4 + 3];
-        d1  = n[i * 4 + 4] * (uint64_t)m_indexed[i * 4 + 0];
+
+        d1  = a[i + 1];
+        d1 += n[i * 4 + 4] * (uint64_t)m_indexed[i * 4 + 0];
         d1 += n[i * 4 + 5] * (uint64_t)m_indexed[i * 4 + 1];
         d1 += n[i * 4 + 6] * (uint64_t)m_indexed[i * 4 + 2];
         d1 += n[i * 4 + 7] * (uint64_t)m_indexed[i * 4 + 3];
 
-        d[i + 0] += d0;
-        d[i + 1] += d1;
+        d[i + 0] = d0;
+        d[i + 1] = d1;
     }
-
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-- 
2.20.1


