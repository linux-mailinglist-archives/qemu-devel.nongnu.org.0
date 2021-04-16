Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD35362A5E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:34:08 +0200 (CEST)
Received: from localhost ([::1]:48112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXW6J-0000bT-LD
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVco-0004yX-HF
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:38 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcT-0001KP-U7
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:36 -0400
Received: by mail-pl1-x634.google.com with SMTP id n10so3492259plc.0
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HrscdamrL4xnD14xZwWaM1FKNhEcxGneRJZ//b9WX/E=;
 b=v7GywaSKzaeWtafFyRSU/qKsasVzPMf550Gr/rPU4Rn/zRQKYL3xTv2E+7Fatez8g1
 gSiTO8rv0MthjUHSHA1QyA8Z/D39PEu84MyU30eGqwre6d/J1Rrsxk3kol0FrOcOqZfe
 0XbSXwgaTpjNzdcj8NnPLfn+eK52Ei4p2Fi4MGbUAEUuyNAAMcxRaf2gLydv+WVk8SL6
 7YeRKmGaByO4M5o22Ij0mzy6K616iC9y946MFutz2Yj0k9+v2hRyD0c6ghW4/UDKK02d
 ScF66qT6cnu7Mlm/rAq1HefOyv6sT06H+f1Cjgz3XlbVuiyXFMUm/r98UxDFYhFcNMei
 Q9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HrscdamrL4xnD14xZwWaM1FKNhEcxGneRJZ//b9WX/E=;
 b=S7lFh1V4r73unZg3idH68x8ffvW4OtkVRJTx1EzQOVJbWmqU8Df01BwdzHuvpmlt5Y
 6r4NnzRMyWeVZDa+1zCua1QTS5ucz/WgBNiptPo/tEYBHnT2bPW0FUAgFZOR3eXiBLRL
 upkIhxm8Luc7QFCdoY6AIeeLpgzzFH1PfRdnBs20K7qzK+Bpp+ZOnxSuaoXBgoLAo9Dc
 fU2zYtHYoh+pxYTsLHuMPxIbSVbI76ZWH9oHDBeD2qPYBTkNUBQGO8adPvBgJvl0wwHg
 LdlS9vlJtG/FVQkJ8dYnkA38n11zLNGTjwGnWtjAI+Naioj/9wa8Xg70Fxmxj9q51AXc
 /d8A==
X-Gm-Message-State: AOAM531iyb3Bq4pm6UX6TkLzW6CzOhXmJJS6Y8+pY73YHVcS7ftFNXQ8
 TVVYMmBUgHBBJeFmnE+Zb9X87dyToDsvBw==
X-Google-Smtp-Source: ABdhPJyIUVI9+BZcWR92e0L5AnTqQrso608Bf5McZNK2nL0+t+2BOcw7dcNokF84vnx6MwXUKXfkuA==
X-Received: by 2002:a17:902:106:b029:e8:de25:4a1d with SMTP id
 6-20020a1709020106b02900e8de254a1dmr11460689plb.7.1618606996570; 
 Fri, 16 Apr 2021 14:03:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 35/81] target/arm: Implement SVE2 saturating multiply-add
 high
Date: Fri, 16 Apr 2021 14:01:54 -0700
Message-Id: <20210416210240.1591291-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

SVE2 has two additional sizes of the operation and unlike NEON,
there is no saturation flag.  Create new entry points for SVE2
that do not set QC.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  17 ++++
 target/arm/sve.decode      |   5 ++
 target/arm/translate-sve.c |  18 +++++
 target/arm/vec_helper.c    | 161 +++++++++++++++++++++++++++++++++++--
 4 files changed, 195 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 2c412ffd3b..6bb0b0ddc0 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -591,6 +591,23 @@ DEF_HELPER_FLAGS_5(gvec_qrdmlah_s32, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_qrdmlsh_s32, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_sqrdmlah_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlah_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlah_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlah_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(gvec_sdot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_udot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_sdot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 52f615b39e..8308c9238a 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1346,3 +1346,8 @@ SQDMLSLT_zzzw   01000100 .. 0 ..... 0110 11 ..... .....  @rda_rn_rm
 
 SQDMLALBT       01000100 .. 0 ..... 00001 0 ..... .....  @rda_rn_rm
 SQDMLSLBT       01000100 .. 0 ..... 00001 1 ..... .....  @rda_rn_rm
+
+## SVE2 saturating multiply-add high
+
+SQRDMLAH_zzzz   01000100 .. 0 ..... 01110 0 ..... .....  @rda_rn_rm
+SQRDMLSH_zzzz   01000100 .. 0 ..... 01110 1 ..... .....  @rda_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 27f9cdb891..4326b597e6 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7562,3 +7562,21 @@ static bool trans_SQDMLSLBT(DisasContext *s, arg_rrrr_esz *a)
 {
     return do_sqdmlsl_zzzw(s, a, false, true);
 }
+
+static bool trans_SQRDMLAH_zzzz(DisasContext *s, arg_rrrr_esz *a)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        gen_helper_sve2_sqrdmlah_b, gen_helper_sve2_sqrdmlah_h,
+        gen_helper_sve2_sqrdmlah_s, gen_helper_sve2_sqrdmlah_d,
+    };
+    return do_sve2_zzzz_ool(s, a, fns[a->esz], 0);
+}
+
+static bool trans_SQRDMLSH_zzzz(DisasContext *s, arg_rrrr_esz *a)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        gen_helper_sve2_sqrdmlsh_b, gen_helper_sve2_sqrdmlsh_h,
+        gen_helper_sve2_sqrdmlsh_s, gen_helper_sve2_sqrdmlsh_d,
+    };
+    return do_sve2_zzzz_ool(s, a, fns[a->esz], 0);
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index b0ce597060..c56337e724 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -22,6 +22,7 @@
 #include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "fpu/softfloat.h"
+#include "qemu/int128.h"
 #include "vec_internal.h"
 
 /* Note that vector data is stored in host-endian 64-bit chunks,
@@ -36,15 +37,55 @@
 #define H4(x)  (x)
 #endif
 
+/* Signed saturating rounding doubling multiply-accumulate high half, 8-bit */
+static int8_t do_sqrdmlah_b(int8_t src1, int8_t src2, int8_t src3,
+                            bool neg, bool round)
+{
+    /*
+     * Simplify:
+     * = ((a3 << 8) + ((e1 * e2) << 1) + (round << 7)) >> 8
+     * = ((a3 << 7) + (e1 * e2) + (round << 6)) >> 7
+     */
+    int32_t ret = (int32_t)src1 * src2;
+    if (neg) {
+        ret = -ret;
+    }
+    ret += ((int32_t)src3 << 7) + (round << 6);
+    ret >>= 7;
+
+    if (ret != (int8_t)ret) {
+        ret = (ret < 0 ? INT8_MIN : INT8_MAX);
+    }
+    return ret;
+}
+
+void HELPER(sve2_sqrdmlah_b)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int8_t *d = vd, *n = vn, *m = vm, *a = va;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = do_sqrdmlah_b(n[i], m[i], a[i], false, true);
+    }
+}
+
+void HELPER(sve2_sqrdmlsh_b)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int8_t *d = vd, *n = vn, *m = vm, *a = va;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = do_sqrdmlah_b(n[i], m[i], a[i], true, true);
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 16-bit */
 static int16_t do_sqrdmlah_h(int16_t src1, int16_t src2, int16_t src3,
                              bool neg, bool round, uint32_t *sat)
 {
-    /*
-     * Simplify:
-     * = ((a3 << 16) + ((e1 * e2) << 1) + (1 << 15)) >> 16
-     * = ((a3 << 15) + (e1 * e2) + (1 << 14)) >> 15
-     */
+    /* Simplify similarly to do_sqrdmlah_b above.  */
     int32_t ret = (int32_t)src1 * src2;
     if (neg) {
         ret = -ret;
@@ -133,11 +174,35 @@ void HELPER(neon_sqrdmulh_h)(void *vd, void *vn, void *vm,
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
+void HELPER(sve2_sqrdmlah_h)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int16_t *d = vd, *n = vn, *m = vm, *a = va;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 2; ++i) {
+        d[i] = do_sqrdmlah_h(n[i], m[i], a[i], false, true, &discard);
+    }
+}
+
+void HELPER(sve2_sqrdmlsh_h)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int16_t *d = vd, *n = vn, *m = vm, *a = va;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 2; ++i) {
+        d[i] = do_sqrdmlah_h(n[i], m[i], a[i], true, true, &discard);
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 32-bit */
 static int32_t do_sqrdmlah_s(int32_t src1, int32_t src2, int32_t src3,
                              bool neg, bool round, uint32_t *sat)
 {
-    /* Simplify similarly to int_qrdmlah_s16 above.  */
+    /* Simplify similarly to do_sqrdmlah_b above.  */
     int64_t ret = (int64_t)src1 * src2;
     if (neg) {
         ret = -ret;
@@ -220,6 +285,90 @@ void HELPER(neon_sqrdmulh_s)(void *vd, void *vn, void *vm,
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
+void HELPER(sve2_sqrdmlah_s)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int32_t *d = vd, *n = vn, *m = vm, *a = va;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = do_sqrdmlah_s(n[i], m[i], a[i], false, true, &discard);
+    }
+}
+
+void HELPER(sve2_sqrdmlsh_s)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int32_t *d = vd, *n = vn, *m = vm, *a = va;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = do_sqrdmlah_s(n[i], m[i], a[i], true, true, &discard);
+    }
+}
+
+/* Signed saturating rounding doubling multiply-accumulate high half, 64-bit */
+static int64_t do_sat128_d(Int128 r)
+{
+    int64_t ls = int128_getlo(r);
+    int64_t hs = int128_gethi(r);
+
+    if (unlikely(hs != (ls >> 63))) {
+        return hs < 0 ? INT64_MIN : INT64_MAX;
+    }
+    return ls;
+}
+
+static int64_t do_sqrdmlah_d(int64_t n, int64_t m, int64_t a,
+                             bool neg, bool round)
+{
+    uint64_t l, h;
+    Int128 r, t;
+
+    /* As in do_sqrdmlah_b, but with 128-bit arithmetic. */
+    muls64(&l, &h, m, n);
+    r = int128_make128(l, h);
+    if (neg) {
+        r = int128_neg(r);
+    }
+    if (a) {
+        t = int128_exts64(a);
+        t = int128_lshift(t, 63);
+        r = int128_add(r, t);
+    }
+    if (round) {
+        t = int128_exts64(1ll << 62);
+        r = int128_add(r, t);
+    }
+    r = int128_rshift(r, 63);
+
+    return do_sat128_d(r);
+}
+
+void HELPER(sve2_sqrdmlah_d)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int64_t *d = vd, *n = vn, *m = vm, *a = va;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        d[i] = do_sqrdmlah_d(n[i], m[i], a[i], false, true);
+    }
+}
+
+void HELPER(sve2_sqrdmlsh_d)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int64_t *d = vd, *n = vn, *m = vm, *a = va;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        d[i] = do_sqrdmlah_d(n[i], m[i], a[i], true, true);
+    }
+}
+
 /* Integer 8 and 16-bit dot-product.
  *
  * Note that for the loops herein, host endianness does not matter
-- 
2.25.1


