Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 784DA362C43
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 02:08:40 +0200 (CEST)
Received: from localhost ([::1]:53710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXYVr-0000Qx-9f
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 20:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYND-0005TF-MW
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:43 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:34639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN8-0005gE-NR
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:43 -0400
Received: by mail-pf1-x42e.google.com with SMTP id 10so10477405pfl.1
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 16:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DIBFt/LCLxrjw+4C/O85MFKcqi0nnU8EEvk4pxFd2ic=;
 b=Icahff+1pWVKIyt5SA6kD0/DgQqpz3fJ6gL81IjFrr3BNKCGIL/sWcYvCW9rHzbqO7
 vV5x13ZYs/yNjrKy8nSnQsGtIQZJM+L92w5sa7crPyGanv/dw/E+9tSWUPoVh6FK0ssd
 eOHyGTYQsHI3xKntBZ3g4rxXRsSvXKovKSjM6LAL8B95lso/Ws1bZKFic8dzvN0cmgM4
 fq3zysKuyeyObV5PHJqBXxsdWnjkaX9f9U9gYh6jDfNi1kw0ayI40pCqgxs6HgwvW36j
 Vy26cyvo8MxVRmQRe2yhX7ldXSBJgZXZsrKw8XlRbD0upYqkp8TdsyttGL6VmyJrOFzJ
 Aw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DIBFt/LCLxrjw+4C/O85MFKcqi0nnU8EEvk4pxFd2ic=;
 b=ANimyD2UlKlOJGOKMjNfnM0/O0yyBZJGAkZlxGaPu7OgTssho7er7u7Ni3ud3KKtNL
 J952Gz82c5PQeJ/Yy5OFc+e61U/gNoYO7RFfUZVUMliQKrklRxAj27+dQa49590tWbEh
 0+ywZsnpJ61De9mYuhqKstjyGCMLZzw4hkh08XhDkb5Vo0NiwzH6Tz1/7/ojjz4xYkdo
 D2q7lXSAbLfYDO3Wyu7085jHV2MbDqXZt7XGJBiQZgn2+lK5PA6aRNdcSP4srjsREcti
 L6uNdlY6xE+l+DYgLtA+7cI94YhVb4gFzUItKePb8zniIu4MFO4CyMrl3n8YnwqtNKHj
 RpHw==
X-Gm-Message-State: AOAM532x27Xfui1pbJ+uOM+ybAGhSOGbAsav1RF3DTiFgfwFCIJ0CoOa
 d2Akq6xftCbEZkH98DG7/l5zLqP7UPs48w==
X-Google-Smtp-Source: ABdhPJy8GPnBQnw5PrXuiQRyhcLkGIjLXt1X09INFAlh+JmySVcTQRe/PYDEjCHDkZalTevPLTKUaA==
X-Received: by 2002:aa7:9a92:0:b029:24b:f852:34d8 with SMTP id
 w18-20020aa79a920000b029024bf85234d8mr10048203pfi.4.1618617577206; 
 Fri, 16 Apr 2021 16:59:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d71sm560853pfd.83.2021.04.16.16.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 16:59:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 07/11] target/arm: Implement bfloat16 dot product (indexed)
Date: Fri, 16 Apr 2021 16:59:24 -0700
Message-Id: <20210416235928.1631788-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416235928.1631788-1-richard.henderson@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

This is BFDOT for both AArch64 AdvSIMD and SVE,
and VDOT.BF16 for AArch32 NEON.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             |  2 ++
 target/arm/neon-shared.decode   |  2 ++
 target/arm/sve.decode           |  3 +++
 target/arm/translate-a64.c      | 41 +++++++++++++++++++++++++--------
 target/arm/translate-sve.c      | 12 ++++++++++
 target/arm/vec_helper.c         | 20 ++++++++++++++++
 target/arm/translate-neon.c.inc |  9 ++++++++
 7 files changed, 80 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index eb4cb2b65b..af0ee8f693 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1005,6 +1005,8 @@ DEF_HELPER_FLAGS_5(gvec_usmmla_b, TCG_CALL_NO_RWG,
 
 DEF_HELPER_FLAGS_5(gvec_bfdot, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_bfdot_idx, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
 
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index 31a0839bbb..fa3cf14e3a 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -81,6 +81,8 @@ VUSDOT_scalar  1111 1110 1 . 00 .... .... 1101 . q:1 index:1 0 vm:4 \
                vn=%vn_dp vd=%vd_dp
 VSUDOT_scalar  1111 1110 1 . 00 .... .... 1101 . q:1 index:1 1 vm:4 \
                vn=%vn_dp vd=%vd_dp
+VDOT_b16_scal  1111 1110 0 . 00 .... .... 1101 . q:1 index:1 0 vm:4 \
+               vn=%vn_dp vd=%vd_dp
 
 %vfml_scalar_q0_rm 0:3 5:1
 %vfml_scalar_q1_index 5:1 3:1
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 523140ca56..d5e1e5d400 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1584,3 +1584,6 @@ FMLALB_zzxw     01100100 10 1 ..... 0100.0 ..... .....     @rrxr_3a esz=2
 FMLALT_zzxw     01100100 10 1 ..... 0100.1 ..... .....     @rrxr_3a esz=2
 FMLSLB_zzxw     01100100 10 1 ..... 0110.0 ..... .....     @rrxr_3a esz=2
 FMLSLT_zzxw     01100100 10 1 ..... 0110.1 ..... .....     @rrxr_3a esz=2
+
+### SVE2 floating-point bfloat16 dot-product (indexed)
+BFDOT_zzxz      01100100 01 1 ..... 010000 ..... .....     @rrxr_2 esz=2
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index fc16e0a126..f60afbbd06 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13457,8 +13457,22 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             return;
         }
         break;
-    case 0x0f: /* SUDOT, USDOT */
-        if (is_scalar || (size & 1) || !dc_isar_feature(aa64_i8mm, s)) {
+    case 0x0f:
+        switch (size) {
+        case 0: /* SUDOT */
+        case 2: /* USDOT */
+            if (is_scalar || !dc_isar_feature(aa64_i8mm, s)) {
+                unallocated_encoding(s);
+                return;
+            }
+            break;
+        case 1: /* BFDOT */
+            if (is_scalar || !dc_isar_feature(aa64_bf16, s)) {
+                unallocated_encoding(s);
+                return;
+            }
+            break;
+        default:
             unallocated_encoding(s);
             return;
         }
@@ -13578,13 +13592,22 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                          u ? gen_helper_gvec_udot_idx_b
                          : gen_helper_gvec_sdot_idx_b);
         return;
-    case 0x0f: /* SUDOT, USDOT */
-        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
-                         extract32(insn, 23, 1)
-                         ? gen_helper_gvec_usdot_idx_b
-                         : gen_helper_gvec_sudot_idx_b);
-        return;
-
+    case 0x0f:
+        switch (extract32(insn, 22, 2)) {
+        case 0: /* SUDOT */
+            gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
+                             gen_helper_gvec_sudot_idx_b);
+            return;
+        case 1: /* BFDOT */
+            gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
+                             gen_helper_gvec_bfdot_idx);
+            return;
+        case 2: /* USDOT */
+            gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
+                             gen_helper_gvec_usdot_idx_b);
+            return;
+        }
+        g_assert_not_reached();
     case 0x11: /* FCMLA #0 */
     case 0x13: /* FCMLA #90 */
     case 0x15: /* FCMLA #180 */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3527430c1a..ef6828c632 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8598,3 +8598,15 @@ static bool trans_BFDOT_zzzz(DisasContext *s, arg_rrrr_esz *a)
     }
     return true;
 }
+
+static bool trans_BFDOT_zzxz(DisasContext *s, arg_rrxr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve_bf16, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzz(s, gen_helper_gvec_bfdot_idx,
+                          a->rd, a->rn, a->rm, a->ra, a->index);
+    }
+    return true;
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index e227ba6590..3e26fb0e5f 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2695,3 +2695,23 @@ void HELPER(gvec_bfdot)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_bfdot_idx)(void *vd, void *vn, void *vm,
+                            void *va, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    intptr_t index = simd_data(desc);
+    intptr_t elements = opr_sz / 4;
+    intptr_t eltspersegment = MIN(16 / 4, elements);
+    float32 *d = vd, *a = va;
+    uint32_t *n = vn, *m = vm;
+
+    for (i = 0; i < elements; i += eltspersegment) {
+        uint32_t m_idx = m[i + H4(index)];
+
+        for (j = i; j < i + eltspersegment; j++) {
+            d[j] = bfdotadd(a[j], n[j], m_idx);
+        }
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index aed8a565e0..bb0adf4756 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -381,6 +381,15 @@ static bool trans_VSUDOT_scalar(DisasContext *s, arg_VSUDOT_scalar *a)
                         gen_helper_gvec_sudot_idx_b);
 }
 
+static bool trans_VDOT_b16_scal(DisasContext *s, arg_VDOT_b16_scal *a)
+{
+    if (!dc_isar_feature(aa32_bf16, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
+                        gen_helper_gvec_bfdot_idx);
+}
+
 static bool trans_VFML_scalar(DisasContext *s, arg_VFML_scalar *a)
 {
     int opr_sz;
-- 
2.25.1


