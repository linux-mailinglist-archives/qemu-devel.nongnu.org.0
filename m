Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE2756BCF8
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:38:57 +0200 (CEST)
Received: from localhost ([::1]:48592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9q4F-0002AM-Uv
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piq-0002zQ-1M
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:48 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:40939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pin-00028w-GP
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:47 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so2219817pjl.5
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FIJZTJDsU3bwgxqkNI4PQQPdcbVgY9UEzpNtvLgVDjw=;
 b=QhM4tWZf/oA0nuWtfa++/biM8vIVag09ndJrhygQYNwfDf3VuXYXantnOf+XS79/nU
 ql+EB17xFQjNCKf2qzhfbA0MIA8vqOqUluW7ztTQC9+eTBFDHosGftQ+aFSVA7Aa9w2z
 ZKTG3lyTdLAekmlW+cZnC6sCA/qF0ksTyS/ThGQew14pZUU05dW3jtFDEqDiy8PWrymK
 +KIIGfZbpm0ZRJAO7NZgdHZks0doA86GY0e8gSJUYFIhW3jttaAzt5xSdYPRBj9ntBuH
 akEKa/yPnzcdG95AI6VL3oJLmMSzQg/DayntwtBsEvP/fjvkZYmBiBJTK6DaC+OY9rC8
 46/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FIJZTJDsU3bwgxqkNI4PQQPdcbVgY9UEzpNtvLgVDjw=;
 b=veivWArH2Oee/QD0Zu/l1ORVYrvkkmnAoKdZPH/XkWuxT/R2bLezNJaehUKP/QIdmM
 29HL72uuHFNgae6xlT7308SBbGdjMRF6Q2FYG/VYqytMpISNbSNrLnZjYcJPtNMvwlz/
 WdcRxKoqv8fcR9FzWaS3dsmNvYNjUUPL8RgFWzMx9UOiHOqxT4tmem7ABi4hb2E4jOqU
 fMvuXt2medI6fSe9n4ImAq4TbSqGdEtAlb2VLTv0xRTl7EOrAhL0y1WM0s9THzyjsf5u
 Ywrh/HSJ8FY7MnOABxK7GiGV4CKMqTYrP/XMnWAkvauppbaNb9/hO23qb4NWKMpm5MwG
 eqVA==
X-Gm-Message-State: AJIora9UHilWUIbxnffLu2NB2KbynuOmJFGY6fu8lyntU+zzS9OFh0Je
 IpqOAbpv6KzIZ1hzzouXxCTac1LBkriUn926
X-Google-Smtp-Source: AGRyM1s4rgcwRSPpItFxnuDBWHytQeV4DRsp5pgfExVfsprJ/qRcj83cJU5mJMF+XVP9gw0eip9TVg==
X-Received: by 2002:a17:90a:e7c6:b0:1ee:fed1:60a4 with SMTP id
 kb6-20020a17090ae7c600b001eefed160a4mr376174pjb.100.1657293404536; 
 Fri, 08 Jul 2022 08:16:44 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 19/45] target/arm: Implement SME MOVA
Date: Fri,  8 Jul 2022 20:45:14 +0530
Message-Id: <20220708151540.18136-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

We can reuse the SVE functions for implementing moves to/from
horizontal tile slices, but we need new ones for moves to/from
vertical tile slices.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    |  12 +++
 target/arm/helper-sve.h    |   2 +
 target/arm/translate-a64.h |   8 ++
 target/arm/translate.h     |   5 ++
 target/arm/sme.decode      |  15 ++++
 target/arm/sme_helper.c    | 151 ++++++++++++++++++++++++++++++++++++-
 target/arm/sve_helper.c    |  12 +++
 target/arm/translate-sme.c | 127 +++++++++++++++++++++++++++++++
 8 files changed, 331 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index c4ee1f09e4..154bc73d2e 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -21,3 +21,15 @@ DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
 
 DEF_HELPER_FLAGS_3(sme_zero, TCG_CALL_NO_RWG, void, env, i32, i32)
+
+/* Move to/from vertical array slices, i.e. columns, so 'c'.  */
+DEF_HELPER_FLAGS_4(sme_mova_cz_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_zc_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_cz_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_zc_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_cz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_zc_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_cz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_zc_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_cz_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_zc_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index dc629f851a..ab0333400f 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -325,6 +325,8 @@ DEF_HELPER_FLAGS_5(sve_sel_zpzz_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_sel_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_sel_zpzz_q, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(sve2_addp_zpzz_b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 099d3d11d6..2a7fe6e9e7 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -178,6 +178,14 @@ static inline int pred_gvec_reg_size(DisasContext *s)
     return size_for_gvec(pred_full_reg_size(s));
 }
 
+/* Return a newly allocated pointer to the predicate register.  */
+static inline TCGv_ptr pred_full_reg_ptr(DisasContext *s, int regno)
+{
+    TCGv_ptr ret = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(ret, cpu_env, pred_full_reg_offset(s, regno));
+    return ret;
+}
+
 bool disas_sve(DisasContext *, uint32_t);
 bool disas_sme(DisasContext *, uint32_t);
 
diff --git a/target/arm/translate.h b/target/arm/translate.h
index e2e619dab2..af5d4a7086 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -156,6 +156,11 @@ static inline int plus_2(DisasContext *s, int x)
     return x + 2;
 }
 
+static inline int plus_12(DisasContext *s, int x)
+{
+    return x + 12;
+}
+
 static inline int times_2(DisasContext *s, int x)
 {
     return x * 2;
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index 6e4483fdce..241b4895b7 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -22,3 +22,18 @@
 ### SME Misc
 
 ZERO            11000000 00 001 00000000000 imm:8
+
+### SME Move into/from Array
+
+%mova_rs        13:2 !function=plus_12
+&mova           esz rs pg zr za_imm v:bool to_vec:bool
+
+MOVA            11000000 esz:2 00000 0 v:1 .. pg:3 zr:5 0 za_imm:4  \
+                &mova to_vec=0 rs=%mova_rs
+MOVA            11000000 11    00000 1 v:1 .. pg:3 zr:5 0 za_imm:4  \
+                &mova to_vec=0 rs=%mova_rs esz=4
+
+MOVA            11000000 esz:2 00001 0 v:1 .. pg:3 0 za_imm:4 zr:5  \
+                &mova to_vec=1 rs=%mova_rs
+MOVA            11000000 11    00001 1 v:1 .. pg:3 0 za_imm:4 zr:5  \
+                &mova to_vec=1 rs=%mova_rs esz=4
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index eef2df73e1..e88244423d 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -19,8 +19,10 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internals.h"
+#include "tcg/tcg-gvec-desc.h"
 #include "exec/helper-proto.h"
+#include "qemu/int128.h"
+#include "vec_internal.h"
 
 /* ResetSVEState */
 void arm_reset_sve_state(CPUARMState *env)
@@ -84,3 +86,150 @@ void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
         }
     }
 }
+
+
+/*
+ * When considering the ZA storage as an array of elements of
+ * type T, the index within that array of the Nth element of
+ * a vertical slice of a tile can be calculated like this,
+ * regardless of the size of type T. This is because the tiles
+ * are interleaved, so if type T is size N bytes then row 1 of
+ * the tile is N rows away from row 0. The division by N to
+ * convert a byte offset into an array index and the multiplication
+ * by N to convert from vslice-index-within-the-tile to
+ * the index within the ZA storage cancel out.
+ */
+#define tile_vslice_index(i) ((i) * sizeof(ARMVectorReg))
+
+/*
+ * When doing byte arithmetic on the ZA storage, the element
+ * byteoff bytes away in a tile vertical slice is always this
+ * many bytes away in the ZA storage, regardless of the
+ * size of the tile element, assuming that byteoff is a multiple
+ * of the element size. Again this is because of the interleaving
+ * of the tiles. For instance if we have 1 byte per element then
+ * each row of the ZA storage has one byte of the vslice data,
+ * and (counting from 0) byte 8 goes in row 8 of the storage
+ * at offset (8 * row-size-in-bytes).
+ * If we have 8 bytes per element then each row of the ZA storage
+ * has 8 bytes of the data, but there are 8 interleaved tiles and
+ * so byte 8 of the data goes into row 1 of the tile,
+ * which is again row 8 of the storage, so the offset is still
+ * (8 * row-size-in-bytes). Similarly for other element sizes.
+ */
+#define tile_vslice_offset(byteoff) ((byteoff) * sizeof(ARMVectorReg))
+
+
+/*
+ * Move Zreg vector to ZArray column.
+ */
+#define DO_MOVA_C(NAME, TYPE, H)                                        \
+void HELPER(NAME)(void *za, void *vn, void *vg, uint32_t desc)          \
+{                                                                       \
+    int i, oprsz = simd_oprsz(desc);                                    \
+    for (i = 0; i < oprsz; ) {                                          \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
+        do {                                                            \
+            if (pg & 1) {                                               \
+                *(TYPE *)(za + tile_vslice_offset(i)) = *(TYPE *)(vn + H(i)); \
+            }                                                           \
+            i += sizeof(TYPE);                                          \
+            pg >>= sizeof(TYPE);                                        \
+        } while (i & 15);                                               \
+    }                                                                   \
+}
+
+DO_MOVA_C(sme_mova_cz_b, uint8_t, H1)
+DO_MOVA_C(sme_mova_cz_h, uint16_t, H1_2)
+DO_MOVA_C(sme_mova_cz_s, uint32_t, H1_4)
+
+void HELPER(sme_mova_cz_d)(void *za, void *vn, void *vg, uint32_t desc)
+{
+    int i, oprsz = simd_oprsz(desc) / 8;
+    uint8_t *pg = vg;
+    uint64_t *n = vn;
+    uint64_t *a = za;
+
+    for (i = 0; i < oprsz; i++) {
+        if (pg[H1(i)] & 1) {
+            a[tile_vslice_index(i)] = n[i];
+        }
+    }
+}
+
+void HELPER(sme_mova_cz_q)(void *za, void *vn, void *vg, uint32_t desc)
+{
+    int i, oprsz = simd_oprsz(desc) / 16;
+    uint16_t *pg = vg;
+    Int128 *n = vn;
+    Int128 *a = za;
+
+    /*
+     * Int128 is used here simply to copy 16 bytes, and to simplify
+     * the address arithmetic.
+     */
+    for (i = 0; i < oprsz; i++) {
+        if (pg[H2(i)] & 1) {
+            a[tile_vslice_index(i)] = n[i];
+        }
+    }
+}
+
+#undef DO_MOVA_C
+
+/*
+ * Move ZArray column to Zreg vector.
+ */
+#define DO_MOVA_Z(NAME, TYPE, H)                                        \
+void HELPER(NAME)(void *vd, void *za, void *vg, uint32_t desc)          \
+{                                                                       \
+    int i, oprsz = simd_oprsz(desc);                                    \
+    for (i = 0; i < oprsz; ) {                                          \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
+        do {                                                            \
+            if (pg & 1) {                                               \
+                *(TYPE *)(vd + H(i)) = *(TYPE *)(za + tile_vslice_offset(i)); \
+            }                                                           \
+            i += sizeof(TYPE);                                          \
+            pg >>= sizeof(TYPE);                                        \
+        } while (i & 15);                                               \
+    }                                                                   \
+}
+
+DO_MOVA_Z(sme_mova_zc_b, uint8_t, H1)
+DO_MOVA_Z(sme_mova_zc_h, uint16_t, H1_2)
+DO_MOVA_Z(sme_mova_zc_s, uint32_t, H1_4)
+
+void HELPER(sme_mova_zc_d)(void *vd, void *za, void *vg, uint32_t desc)
+{
+    int i, oprsz = simd_oprsz(desc) / 8;
+    uint8_t *pg = vg;
+    uint64_t *d = vd;
+    uint64_t *a = za;
+
+    for (i = 0; i < oprsz; i++) {
+        if (pg[H1(i)] & 1) {
+            d[i] = a[tile_vslice_index(i)];
+        }
+    }
+}
+
+void HELPER(sme_mova_zc_q)(void *vd, void *za, void *vg, uint32_t desc)
+{
+    int i, oprsz = simd_oprsz(desc) / 16;
+    uint16_t *pg = vg;
+    Int128 *d = vd;
+    Int128 *a = za;
+
+    /*
+     * Int128 is used here simply to copy 16 bytes, and to simplify
+     * the address arithmetic.
+     */
+    for (i = 0; i < oprsz; i++, za += sizeof(ARMVectorReg)) {
+        if (pg[H2(i)] & 1) {
+            d[i] = a[tile_vslice_index(i)];
+        }
+    }
+}
+
+#undef DO_MOVA_Z
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 0c6379e6e8..df16170469 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3565,6 +3565,18 @@ void HELPER(sve_sel_zpzz_d)(void *vd, void *vn, void *vm,
     }
 }
 
+void HELPER(sve_sel_zpzz_q)(void *vd, void *vn, void *vm,
+                            void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 16;
+    Int128 *d = vd, *n = vn, *m = vm;
+    uint16_t *pg = vg;
+
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] = (pg[H2(i)] & 1 ? n : m)[i];
+    }
+}
+
 /* Two operand comparison controlled by a predicate.
  * ??? It is very tempting to want to be able to expand this inline
  * with x86 instructions, e.g.
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 971504559b..79c33d35c2 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -35,6 +35,74 @@
 #include "decode-sme.c.inc"
 
 
+/*
+ * Resolve tile.size[index] to a host pointer, where tile and index
+ * are always decoded together, dependent on the element size.
+ */
+static TCGv_ptr get_tile_rowcol(DisasContext *s, int esz, int rs,
+                                int tile_index, bool vertical)
+{
+    int tile = tile_index >> (4 - esz);
+    int index = esz == MO_128 ? 0 : extract32(tile_index, 0, 4 - esz);
+    int pos, len, offset;
+    TCGv_i32 tmp;
+    TCGv_ptr addr;
+
+    /* Compute the final index, which is Rs+imm. */
+    tmp = tcg_temp_new_i32();
+    tcg_gen_trunc_tl_i32(tmp, cpu_reg(s, rs));
+    tcg_gen_addi_i32(tmp, tmp, index);
+
+    /* Prepare a power-of-two modulo via extraction of @len bits. */
+    len = ctz32(streaming_vec_reg_size(s)) - esz;
+
+    if (vertical) {
+        /*
+         * Compute the byte offset of the index within the tile:
+         *     (index % (svl / size)) * size
+         *   = (index % (svl >> esz)) << esz
+         * Perform the power-of-two modulo via extraction of the low @len bits.
+         * Perform the multiply by shifting left by @pos bits.
+         * Perform these operations simultaneously via deposit into zero.
+         */
+        pos = esz;
+        tcg_gen_deposit_z_i32(tmp, tmp, pos, len);
+
+        /*
+         * For big-endian, adjust the indexed column byte offset within
+         * the uint64_t host words that make up env->zarray[].
+         */
+        if (HOST_BIG_ENDIAN && esz < MO_64) {
+            tcg_gen_xori_i32(tmp, tmp, 8 - (1 << esz));
+        }
+    } else {
+        /*
+         * Compute the byte offset of the index within the tile:
+         *     (index % (svl / size)) * (size * sizeof(row))
+         *   = (index % (svl >> esz)) << (esz + log2(sizeof(row)))
+         */
+        pos = esz + ctz32(sizeof(ARMVectorReg));
+        tcg_gen_deposit_z_i32(tmp, tmp, pos, len);
+
+        /* Row slices are always aligned and need no endian adjustment. */
+    }
+
+    /* The tile byte offset within env->zarray is the row. */
+    offset = tile * sizeof(ARMVectorReg);
+
+    /* Include the byte offset of zarray to make this relative to env. */
+    offset += offsetof(CPUARMState, zarray);
+    tcg_gen_addi_i32(tmp, tmp, offset);
+
+    /* Add the byte offset to env to produce the final pointer. */
+    addr = tcg_temp_new_ptr();
+    tcg_gen_ext_i32_ptr(addr, tmp);
+    tcg_temp_free_i32(tmp);
+    tcg_gen_add_ptr(addr, addr, cpu_env);
+
+    return addr;
+}
+
 static bool trans_ZERO(DisasContext *s, arg_ZERO *a)
 {
     if (!dc_isar_feature(aa64_sme, s)) {
@@ -46,3 +114,62 @@ static bool trans_ZERO(DisasContext *s, arg_ZERO *a)
     }
     return true;
 }
+
+static bool trans_MOVA(DisasContext *s, arg_MOVA *a)
+{
+    static gen_helper_gvec_4 * const h_fns[5] = {
+        gen_helper_sve_sel_zpzz_b, gen_helper_sve_sel_zpzz_h,
+        gen_helper_sve_sel_zpzz_s, gen_helper_sve_sel_zpzz_d,
+        gen_helper_sve_sel_zpzz_q
+    };
+    static gen_helper_gvec_3 * const cz_fns[5] = {
+        gen_helper_sme_mova_cz_b, gen_helper_sme_mova_cz_h,
+        gen_helper_sme_mova_cz_s, gen_helper_sme_mova_cz_d,
+        gen_helper_sme_mova_cz_q,
+    };
+    static gen_helper_gvec_3 * const zc_fns[5] = {
+        gen_helper_sme_mova_zc_b, gen_helper_sme_mova_zc_h,
+        gen_helper_sme_mova_zc_s, gen_helper_sme_mova_zc_d,
+        gen_helper_sme_mova_zc_q,
+    };
+
+    TCGv_ptr t_za, t_zr, t_pg;
+    TCGv_i32 t_desc;
+    int svl;
+
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (!sme_smza_enabled_check(s)) {
+        return true;
+    }
+
+    t_za = get_tile_rowcol(s, a->esz, a->rs, a->za_imm, a->v);
+    t_zr = vec_full_reg_ptr(s, a->zr);
+    t_pg = pred_full_reg_ptr(s, a->pg);
+
+    svl = streaming_vec_reg_size(s);
+    t_desc = tcg_constant_i32(simd_desc(svl, svl, 0));
+
+    if (a->v) {
+        /* Vertical slice -- use sme mova helpers. */
+        if (a->to_vec) {
+            zc_fns[a->esz](t_zr, t_za, t_pg, t_desc);
+        } else {
+            cz_fns[a->esz](t_za, t_zr, t_pg, t_desc);
+        }
+    } else {
+        /* Horizontal slice -- reuse sve sel helpers. */
+        if (a->to_vec) {
+            h_fns[a->esz](t_zr, t_za, t_zr, t_pg, t_desc);
+        } else {
+            h_fns[a->esz](t_za, t_zr, t_za, t_pg, t_desc);
+        }
+    }
+
+    tcg_temp_free_ptr(t_za);
+    tcg_temp_free_ptr(t_zr);
+    tcg_temp_free_ptr(t_pg);
+
+    return true;
+}
-- 
2.34.1


