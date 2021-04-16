Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBB6362A80
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:43:41 +0200 (CEST)
Received: from localhost ([::1]:49508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWFY-0005A3-9x
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdV-0005k0-PO
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:21 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdB-0001gC-Ed
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:21 -0400
Received: by mail-pf1-x431.google.com with SMTP id h15so1450604pfv.2
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8zgKYnfxZBw0Kr430/mX7qtdsnSyYLs5XMO3Y50nXxM=;
 b=qDgzQCLFjeB4D60hHJyBZd31B4bV7w/gn23am5OC3YFUb1rdniisC1gwyWlT05fcRu
 9HezJenVAmXhXc9R23BJOXbJDxD0beJMwARUQvsiot7hT86B0dSHz35eLdRnydt+XfTs
 O/fhWZKbIXTyTEMEw5zfdCas7juduhYF3WKUXE8c9Ud1tK5mUI5reYhQEOgIzbrNBjfK
 ic6o2GUUqLcqk3QdpMbHyjuxf3N6EbMZXZJOXxMK1WtEJcHsTf7ax8LQ7xzZaYtaYsx2
 Y2BRsS5r0FK3ni/xJwNkT+AgLZtlsD+pGbmR6rZoqpYNZxi0DEaPq3qGqc0MjajHsu5Z
 Xjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8zgKYnfxZBw0Kr430/mX7qtdsnSyYLs5XMO3Y50nXxM=;
 b=miVDpl4Km3WpC8iVU0ly79eJv/Z9L3UDOKsXZWAnyAMLAekJk6Fm299cHbc5G1ixhW
 2BuXSLuRNb9KtNMXhfbo9EUD+3hebC/f+dsasAELUO67qbNkz7YhaDHKUZ+/o9I4XQeV
 aI/zGfUD9R6SpVOvIlYIK57wCM0z01BoSgeqhjCFK/M7hr7C5VEm5e/aCUf2EMAaOhFk
 Y/9+aR5lf2Jz7qNZcN50SpHyj1sz/6lMIHGZ1z4y7CFFa0ypkgH7T+cuyLALoU62eeBU
 u8VBDNWjR7C4eCuuuChukZVWSbU61FzpscX9KrHYy05Ca1w0jZlnp163rQHuWq757sU8
 57YQ==
X-Gm-Message-State: AOAM533ImsAAo+JhaK8CB8bwTqwcHXCUWgM1SNn0Kgb9WbBk0lBx96jO
 oE/8iQE9b63Rqe4+e2eEPB/2gPIxM27QWg==
X-Google-Smtp-Source: ABdhPJxrKq/EWZFsnNjnlNgblCHoyMIJg6bwgwNP7VJkHffVWe9rWV4gIz+yKWjLYXY2QnlKJrRoQw==
X-Received: by 2002:a65:5c42:: with SMTP id v2mr839163pgr.339.1618607040041;
 Fri, 16 Apr 2021 14:04:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 48/81] target/arm: Pass separate addend to {U, S}DOT helpers
Date: Fri, 16 Apr 2021 14:02:07 -0700
Message-Id: <20210416210240.1591291-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

For SVE, we potentially have a 4th argument coming from the
movprfx instruction.  Currently we do not optimize movprfx,
so the problem is not visible.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Fix double addition (zhiwei).
---
 target/arm/helper.h             |  20 +++---
 target/arm/sve.decode           |   7 +-
 target/arm/translate-a64.c      |  15 +++-
 target/arm/translate-sve.c      |  13 ++--
 target/arm/vec_helper.c         | 120 ++++++++++++++++++--------------
 target/arm/translate-neon.c.inc |  10 +--
 6 files changed, 109 insertions(+), 76 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 23a7ec5638..f4b092ee1c 100644
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
index 67b6466a1e..04ef38f148 100644
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
index cd8408e84c..004ff8c019 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -698,6 +698,17 @@ static void gen_gvec_op3_qc(DisasContext *s, bool is_q, int rd, int rn,
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
@@ -12198,7 +12209,7 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         return;
 
     case 0x2: /* SDOT / UDOT */
-        gen_gvec_op3_ool(s, is_q, rd, rn, rm, 0,
+        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0,
                          u ? gen_helper_gvec_udot_b : gen_helper_gvec_sdot_b);
         return;
 
@@ -13457,7 +13468,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     switch (16 * u + opcode) {
     case 0x0e: /* SDOT */
     case 0x1e: /* UDOT */
-        gen_gvec_op3_ool(s, is_q, rd, rn, rm, index,
+        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
                          u ? gen_helper_gvec_udot_idx_b
                          : gen_helper_gvec_sdot_idx_b);
         return;
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e9feb05da3..0317d5386a 100644
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
index a3d80ecad0..f88e572132 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -375,71 +375,76 @@ void HELPER(sve2_sqrdmlsh_d)(void *vd, void *vn, void *vm,
  * All elements are treated equally, no matter where they are.
  */
 
-void HELPER(gvec_sdot_b)(void *vd, void *vn, void *vm, uint32_t desc)
+void HELPER(gvec_sdot_b)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-    uint32_t *d = vd;
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
-    uint64_t *d = vd;
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
-    uint32_t *d = vd;
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
-    uint64_t *d = vd;
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
 
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index a02b8369a1..8ecfef1567 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -221,7 +221,7 @@ static bool trans_VCADD(DisasContext *s, arg_VCADD *a)
 static bool trans_VDOT(DisasContext *s, arg_VDOT *a)
 {
     int opr_sz;
-    gen_helper_gvec_3 *fn_gvec;
+    gen_helper_gvec_4 *fn_gvec;
 
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
@@ -243,9 +243,10 @@ static bool trans_VDOT(DisasContext *s, arg_VDOT *a)
 
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
@@ -323,7 +324,7 @@ static bool trans_VCMLA_scalar(DisasContext *s, arg_VCMLA_scalar *a)
 
 static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
 {
-    gen_helper_gvec_3 *fn_gvec;
+    gen_helper_gvec_4 *fn_gvec;
     int opr_sz;
     TCGv_ptr fpst;
 
@@ -348,9 +349,10 @@ static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
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
-- 
2.25.1


