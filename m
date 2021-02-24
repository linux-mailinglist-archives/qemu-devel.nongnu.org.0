Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D60B532475A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 00:07:09 +0100 (CET)
Received: from localhost ([::1]:50450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF3FM-0007ad-UG
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 18:07:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF3Dw-0006zz-1c
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 18:05:41 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:40268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF3Ds-0005Sf-Fv
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 18:05:39 -0500
Received: by mail-pg1-x532.google.com with SMTP id b21so2505870pgk.7
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 15:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G+U3+xyXvuvb5HIYJD9KrdFuXROyDlUGX9LLmbyMuXE=;
 b=PVI7kmdKLDhwHu/jacyw6BeHLmyLTvZd43sYih5AV7r1b9AWdJrgkX9k/nlgIc8VCt
 3gA1xHQZZA6dAlHoNKQ41ckiHvCXgCYg+y6Mg6p1JiZQbep4tL0dRkNt7wEWQc3Xs4Kr
 jZV8lFVInh5jGw2qpfYF1MmqrS0HjvOp9o3QJ33sdd8JjxwJPDFRpZmKyO0Tgh5eoTVn
 z+4d/7QgZ3NAoHL3Jsm/VCvoVnXda9TPCWzKGMxiAVpz4rfpOzujGmivzaRzqk4gHNuy
 ujh1ZarLxH/lqHeOGBrT/46nchTVXMQkbhwzFILUDLWjgLc2iio81dA6fMfucKitwnGG
 ci4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G+U3+xyXvuvb5HIYJD9KrdFuXROyDlUGX9LLmbyMuXE=;
 b=orOgEGVqdXh2u+hXkJtjY1CfU8VtGN3ojM6b/NxMDjGE9scyzp7t2tyvnu1xPXKbH0
 qLuq2U13TIqCgYZBHK+9Cv9wzO7RadBoscILgauRjQ/lmZMN31PiuarVD5hcmJUW4qPn
 TugqVy93D5bZauNd5RAVk7PuInzIP8Ys7kVguO9Ge0/1FYfG4rrhfgINYl0sPaOdk+d3
 CVOpKOK/XUFAwpo3Bi3hz2IO0jY9zMgSbvUTDmtln6vECEPnnV9vu5Sdpd+C9P+fwVI4
 3dDsk/0hf+TRvfVT3gXmKxKtPjr2FbArWcOdg/QXDznbEFOdVcOyGQSxYjXTa5Vn8JOt
 lp0Q==
X-Gm-Message-State: AOAM530z1Iqt6gXSkItEPLYJI0aqxLnkoPlyGED6PPMakRxWTtdI2K3y
 z7aPeTV/gZBYBTU0BKHy1fI8/MLYfxiTcQ==
X-Google-Smtp-Source: ABdhPJzKEIaTwtQgtr/bJBcMdnRVAvrQtjJgl22X0d80OZ0GavxbQTjz2AacjjkJmGRh8lynXTnnpQ==
X-Received: by 2002:a62:8051:0:b029:1ed:d704:1f11 with SMTP id
 j78-20020a6280510000b02901edd7041f11mr285309pfd.41.1614207934396; 
 Wed, 24 Feb 2021 15:05:34 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id j125sm4145231pfd.27.2021.02.24.15.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 15:05:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/arm: Speed up aarch64 TBL/TBX
Date: Wed, 24 Feb 2021 15:05:32 -0800
Message-Id: <20210224230532.276878-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Always perform one call instead of two for 16-byte operands.
Use byte loads/stores directly into the vector register file
instead of extractions and deposits to a 64-bit local variable.

In order to easily receive pointers into the vector register file,
convert the helper to the gvec out-of-line signature.  Move the
helper into vec_helper.c, where it can make use of H1 and clear_tail.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Alex, as briefly discussed on IRC today, streamline the TBL/TBX
implementation.  Would you run this through whatever benchmark
you were experimenting with today?  This is unmeasureable in RISU
(exactly one perf hit in the helper through the entire run).

And for version 2, use memcpy/memset, which get turned into host
vector instructions with gcc-9, and is perhaps slightly clearer.


r~

---
 target/arm/helper-a64.h    |  2 +-
 target/arm/helper-a64.c    | 32 ---------------------
 target/arm/translate-a64.c | 58 +++++---------------------------------
 target/arm/vec_helper.c    | 48 +++++++++++++++++++++++++++++++
 4 files changed, 56 insertions(+), 84 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 7bd6aed659..c139fa81f9 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -28,7 +28,7 @@ DEF_HELPER_3(vfp_cmps_a64, i64, f32, f32, ptr)
 DEF_HELPER_3(vfp_cmpes_a64, i64, f32, f32, ptr)
 DEF_HELPER_3(vfp_cmpd_a64, i64, f64, f64, ptr)
 DEF_HELPER_3(vfp_cmped_a64, i64, f64, f64, ptr)
-DEF_HELPER_FLAGS_5(simd_tbl, TCG_CALL_NO_RWG_SE, i64, env, i64, i64, i32, i32)
+DEF_HELPER_FLAGS_4(simd_tblx, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(vfp_mulxs, TCG_CALL_NO_RWG, f32, f32, f32, ptr)
 DEF_HELPER_FLAGS_3(vfp_mulxd, TCG_CALL_NO_RWG, f64, f64, f64, ptr)
 DEF_HELPER_FLAGS_3(neon_ceq_f64, TCG_CALL_NO_RWG, i64, i64, i64, ptr)
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 7f56c78fa6..061c8ff846 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -179,38 +179,6 @@ float64 HELPER(vfp_mulxd)(float64 a, float64 b, void *fpstp)
     return float64_mul(a, b, fpst);
 }
 
-uint64_t HELPER(simd_tbl)(CPUARMState *env, uint64_t result, uint64_t indices,
-                          uint32_t rn, uint32_t numregs)
-{
-    /* Helper function for SIMD TBL and TBX. We have to do the table
-     * lookup part for the 64 bits worth of indices we're passed in.
-     * result is the initial results vector (either zeroes for TBL
-     * or some guest values for TBX), rn the register number where
-     * the table starts, and numregs the number of registers in the table.
-     * We return the results of the lookups.
-     */
-    int shift;
-
-    for (shift = 0; shift < 64; shift += 8) {
-        int index = extract64(indices, shift, 8);
-        if (index < 16 * numregs) {
-            /* Convert index (a byte offset into the virtual table
-             * which is a series of 128-bit vectors concatenated)
-             * into the correct register element plus a bit offset
-             * into that element, bearing in mind that the table
-             * can wrap around from V31 to V0.
-             */
-            int elt = (rn * 2 + (index >> 3)) % 64;
-            int bitidx = (index & 7) * 8;
-            uint64_t *q = aa64_vfp_qreg(env, elt >> 1);
-            uint64_t val = extract64(q[elt & 1], bitidx, 8);
-
-            result = deposit64(result, shift, 8, val);
-        }
-    }
-    return result;
-}
-
 /* 64bit/double versions of the neon float compare functions */
 uint64_t HELPER(neon_ceq_f64)(float64 a, float64 b, void *fpstp)
 {
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b23a8975d5..496e14688a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -7520,10 +7520,8 @@ static void disas_simd_tb(DisasContext *s, uint32_t insn)
     int rm = extract32(insn, 16, 5);
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
-    int is_tblx = extract32(insn, 12, 1);
-    int len = extract32(insn, 13, 2);
-    TCGv_i64 tcg_resl, tcg_resh, tcg_idx;
-    TCGv_i32 tcg_regno, tcg_numregs;
+    int is_tbx = extract32(insn, 12, 1);
+    int len = (extract32(insn, 13, 2) + 1) * 16;
 
     if (op2 != 0) {
         unallocated_encoding(s);
@@ -7534,53 +7532,11 @@ static void disas_simd_tb(DisasContext *s, uint32_t insn)
         return;
     }
 
-    /* This does a table lookup: for every byte element in the input
-     * we index into a table formed from up to four vector registers,
-     * and then the output is the result of the lookups. Our helper
-     * function does the lookup operation for a single 64 bit part of
-     * the input.
-     */
-    tcg_resl = tcg_temp_new_i64();
-    tcg_resh = NULL;
-
-    if (is_tblx) {
-        read_vec_element(s, tcg_resl, rd, 0, MO_64);
-    } else {
-        tcg_gen_movi_i64(tcg_resl, 0);
-    }
-
-    if (is_q) {
-        tcg_resh = tcg_temp_new_i64();
-        if (is_tblx) {
-            read_vec_element(s, tcg_resh, rd, 1, MO_64);
-        } else {
-            tcg_gen_movi_i64(tcg_resh, 0);
-        }
-    }
-
-    tcg_idx = tcg_temp_new_i64();
-    tcg_regno = tcg_const_i32(rn);
-    tcg_numregs = tcg_const_i32(len + 1);
-    read_vec_element(s, tcg_idx, rm, 0, MO_64);
-    gen_helper_simd_tbl(tcg_resl, cpu_env, tcg_resl, tcg_idx,
-                        tcg_regno, tcg_numregs);
-    if (is_q) {
-        read_vec_element(s, tcg_idx, rm, 1, MO_64);
-        gen_helper_simd_tbl(tcg_resh, cpu_env, tcg_resh, tcg_idx,
-                            tcg_regno, tcg_numregs);
-    }
-    tcg_temp_free_i64(tcg_idx);
-    tcg_temp_free_i32(tcg_regno);
-    tcg_temp_free_i32(tcg_numregs);
-
-    write_vec_element(s, tcg_resl, rd, 0, MO_64);
-    tcg_temp_free_i64(tcg_resl);
-
-    if (is_q) {
-        write_vec_element(s, tcg_resh, rd, 1, MO_64);
-        tcg_temp_free_i64(tcg_resh);
-    }
-    clear_vec_high(s, is_q, rd);
+    tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, rd),
+                       vec_full_reg_offset(s, rm), cpu_env,
+                       is_q ? 16 : 8, vec_full_reg_size(s),
+                       (len << 6) | (is_tbx << 5) | rn,
+                       gen_helper_simd_tblx);
 }
 
 /* ZIP/UZP/TRN
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 7174030377..3fbeae87cb 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -1937,3 +1937,51 @@ DO_VRINT_RMODE(gvec_vrint_rm_h, helper_rinth, uint16_t)
 DO_VRINT_RMODE(gvec_vrint_rm_s, helper_rints, uint32_t)
 
 #undef DO_VRINT_RMODE
+
+#ifdef TARGET_AARCH64
+void HELPER(simd_tblx)(void *vd, void *vm, void *venv, uint32_t desc)
+{
+    const uint8_t *indices = vm;
+    CPUARMState *env = venv;
+    size_t oprsz = simd_oprsz(desc);
+    uint32_t rn = extract32(desc, SIMD_DATA_SHIFT, 5);
+    bool is_tbx = extract32(desc, SIMD_DATA_SHIFT + 5, 1);
+    uint32_t table_len = desc >> (SIMD_DATA_SHIFT + 6);
+    union {
+        uint8_t b[16];
+        uint64_t d[2];
+    } result;
+
+    /*
+     * We must construct the final result in a temp, lest the output
+     * overlaps the input table.  For TBL, begin with zero; for TBX,
+     * begin with the original register contents.  Note that we always
+     * copy 16 bytes here to avoid an extra branch; clearing the high
+     * bits of the register for oprsz == 8 is handled below.
+     */
+    if (is_tbx) {
+        memcpy(&result, vd, 16);
+    } else {
+        memset(&result, 0, 16);
+    }
+
+    for (size_t i = 0; i < oprsz; ++i) {
+        uint32_t index = indices[H1(i)];
+
+        if (index < table_len) {
+            /*
+             * Convert index (a byte offset into the virtual table
+             * which is a series of 128-bit vectors concatenated)
+             * into the correct register element, bearing in mind
+             * that the table can wrap around from V31 to V0.
+             */
+            const uint8_t *table = (const uint8_t *)
+                aa64_vfp_qreg(env, (rn + (index >> 4)) % 32);
+            result.b[H1(i)] = table[H1(index % 16)];
+        }
+    }
+
+    memcpy(vd, &result, 16);
+    clear_tail(vd, oprsz, simd_maxsz(desc));
+}
+#endif
-- 
2.25.1


