Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54945523BE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:19:47 +0200 (CEST)
Received: from localhost ([::1]:56694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3M02-0003Tf-Tc
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaB-0006Jk-GI
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:53:04 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:36772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La9-0001Vd-7g
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:53:03 -0400
Received: by mail-pg1-x536.google.com with SMTP id s185so5157830pgs.3
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H4JeAgXdoqC5B2bEPB4xTGgBWrKrKe7IaKBd6/z4JTs=;
 b=xS1x+bcGpe5rUF/wCzsV830IV2cp6tT0r7bEwRtqKjILs+4K+pcgKJ55OKfrLIi7f9
 1K8naKbA0Zh6zlBtj1zIGt/8U6g3CsCKdeEQQwuYuxHoH9nGLawiy7UmNqQVLz70eiSR
 IDC8RUho8w8pZUr3i7EzcJV71126vHr0lra3RKTMxjbTUtW7sFQoiNmFQafwVHNytfn0
 KEP4MkKB/1Yy2aj9KwHiZtrXv4rtKQSklsH8zNDX5CrUyvTpwGEToQZb06bR5RVZU300
 m3jUbYmRHTDMhq9WpA4/gq71RBAXTo8YH5GuRqBdk/LQ3wmTvALNM1n3yt7dEOu49faq
 5arA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H4JeAgXdoqC5B2bEPB4xTGgBWrKrKe7IaKBd6/z4JTs=;
 b=DoVutfT4rW1IlI6k4+Ai9ELqN7rtRHZ/BLJ5sm7Qmp2zUxFgB0ZMXaxHgxOYIiDImj
 hvpYr3Jpo8yPxtmBP4RBU1gHhOyRRda0jH9SrKhFeUuajJOo5y0xlIJD5iLW2POIDeNj
 S4v7osxj6c560cowTsJhizluaMtM6xlq4DWd/erqJVNBknICR/IyHSKSw83caFpVUp78
 YZ0wxOexgPRfB09ePqV6YtSilMlt+oUKOG2VG8cEztS6BxnEJEeoF8pCtk7vLMPOOd6D
 fL5wb1rrOG0XixgnKR1KBW6zzND8FnACo6NEjFA5mfpO+CBaqgybjCpV6xuT89hGaPP+
 FcqQ==
X-Gm-Message-State: AJIora94gTTiRvN6BhAxX3KQa3IQWrQ3yvKXN+Ym0taPQbKA9UYuIGIJ
 XShv62kF1yLgHT4w6KbWhW9uCBuCb42PVA==
X-Google-Smtp-Source: AGRyM1sKQmf+XC5q/K8rUziLIC92sP6LfQdu8D8/Ush6dYFJMiq1IFvQN15gACpmtMEqAAyImu0CMQ==
X-Received: by 2002:a05:6a00:114e:b0:51b:8ff5:e05a with SMTP id
 b14-20020a056a00114e00b0051b8ff5e05amr25786598pfm.37.1655747578239; 
 Mon, 20 Jun 2022 10:52:58 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 25/51] target/arm: Implement SME MOVA
Date: Mon, 20 Jun 2022 10:52:09 -0700
Message-Id: <20220620175235.60881-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    |  11 ++++
 target/arm/helper-sve.h    |   2 +
 target/arm/translate-a64.h |   9 +++
 target/arm/translate.h     |   5 ++
 target/arm/sme.decode      |  15 +++++
 target/arm/sme_helper.c    | 110 ++++++++++++++++++++++++++++++++++++-
 target/arm/sve_helper.c    |  12 ++++
 target/arm/translate-a64.c |  19 +++++++
 target/arm/translate-sme.c | 105 +++++++++++++++++++++++++++++++++++
 9 files changed, 287 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index c4ee1f09e4..600346e08c 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -21,3 +21,14 @@ DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
 
 DEF_HELPER_FLAGS_3(sme_zero, TCG_CALL_NO_RWG, void, env, i32, i32)
+
+DEF_HELPER_FLAGS_4(sme_mova_avz_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_zav_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_avz_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_zav_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_avz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_zav_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_avz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_zav_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_avz_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_zav_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
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
index ec5d580ba0..c341c95582 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -31,6 +31,7 @@ bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
 bool sve_access_check(DisasContext *s);
 bool sme_enabled_check(DisasContext *s);
 bool sme_za_enabled_check(DisasContext *s);
+bool sme_smza_enabled_check(DisasContext *s);
 TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int log2_size);
@@ -147,6 +148,14 @@ static inline int pred_gvec_reg_size(DisasContext *s)
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
index ef158a75c6..0c0c6641bb 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -155,6 +155,11 @@ static inline int plus_2(DisasContext *s, int x)
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
index e5b5723a15..99524ead4d 100644
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
@@ -84,3 +86,109 @@ void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
         }
     }
 }
+
+#define DO_MOVA_A(NAME, TYPE, H)                                        \
+void HELPER(NAME)(void *za, void *vn, void *vg, uint32_t desc)          \
+{                                                                       \
+    int i, oprsz = simd_oprsz(desc);                                    \
+    for (i = 0; i < oprsz; ) {                                          \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
+        do {                                                            \
+            if (pg & 1) {                                               \
+                *(TYPE *)za = *(TYPE *)(vn + H(i));                     \
+            }                                                           \
+            za += sizeof(ARMVectorReg) * sizeof(TYPE);                  \
+            i += sizeof(TYPE);                                          \
+            pg >>= sizeof(TYPE);                                        \
+        } while (i & 15);                                               \
+    }                                                                   \
+}
+
+#define DO_MOVA_Z(NAME, TYPE, H)                                        \
+void HELPER(NAME)(void *vd, void *za, void *vg, uint32_t desc)          \
+{                                                                       \
+    int i, oprsz = simd_oprsz(desc);                                    \
+    for (i = 0; i < oprsz; ) {                                          \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
+        do {                                                            \
+            if (pg & 1) {                                               \
+                *(TYPE *)(vd + H(i)) = *(TYPE *)za;                     \
+            }                                                           \
+            za += sizeof(ARMVectorReg) * sizeof(TYPE);                  \
+            i += sizeof(TYPE);                                          \
+            pg >>= sizeof(TYPE);                                        \
+        } while (i & 15);                                               \
+    }                                                                   \
+}
+
+DO_MOVA_A(sme_mova_avz_b, uint8_t, H1)
+DO_MOVA_A(sme_mova_avz_h, uint16_t, H2)
+DO_MOVA_A(sme_mova_avz_s, uint32_t, H4)
+
+DO_MOVA_Z(sme_mova_zav_b, uint8_t, H1)
+DO_MOVA_Z(sme_mova_zav_h, uint16_t, H2)
+DO_MOVA_Z(sme_mova_zav_s, uint32_t, H4)
+
+void HELPER(sme_mova_avz_d)(void *za, void *vn, void *vg, uint32_t desc)
+{
+    int i, oprsz = simd_oprsz(desc) / 8;
+    uint8_t *pg = vg;
+    uint64_t *n = vn;
+    uint64_t *a = za;
+
+    /*
+     * Note that the rows of the ZAV.D tile are 8 absolute rows apart,
+     * so while the address arithmetic below looks funny, it is right.
+     */
+    for (i = 0; i < oprsz; i++) {
+        if (pg[H1_2(i)] & 1) {
+            a[i * sizeof(ARMVectorReg)] = n[i];
+        }
+    }
+}
+
+void HELPER(sme_mova_zav_d)(void *vd, void *za, void *vg, uint32_t desc)
+{
+    int i, oprsz = simd_oprsz(desc) / 8;
+    uint8_t *pg = vg;
+    uint64_t *d = vd;
+    uint64_t *a = za;
+
+    for (i = 0; i < oprsz; i++) {
+        if (pg[H1_2(i)] & 1) {
+            d[i] = a[i * sizeof(ARMVectorReg)];
+        }
+    }
+}
+
+void HELPER(sme_mova_avz_q)(void *za, void *vn, void *vg, uint32_t desc)
+{
+    int i, oprsz = simd_oprsz(desc) / 16;
+    uint16_t *pg = vg;
+    Int128 *n = vn;
+    Int128 *a = za;
+
+    /*
+     * Note that the rows of the ZAV.Q tile are 16 absolute rows apart,
+     * so while the address arithmetic below looks funny, it is right.
+     */
+    for (i = 0; i < oprsz; i++) {
+        if (pg[H2(i)] & 1) {
+            a[i * sizeof(ARMVectorReg)] = n[i];
+        }
+    }
+}
+
+void HELPER(sme_mova_zav_q)(void *za, void *vn, void *vg, uint32_t desc)
+{
+    int i, oprsz = simd_oprsz(desc) / 16;
+    uint16_t *pg = vg;
+    Int128 *n = vn;
+    Int128 *a = za;
+
+    for (i = 0; i < oprsz; i++, za += sizeof(ARMVectorReg)) {
+        if (pg[H2(i)] & 1) {
+            n[i] = a[i * sizeof(ARMVectorReg)];
+        }
+    }
+}
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 1654c0bbf9..9a26f253e0 100644
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
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index df9fc42635..b629e02ade 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1245,6 +1245,25 @@ bool sme_za_enabled_check(DisasContext *s)
     return true;
 }
 
+/* Note that this function corresponds to CheckStreamingSVEAndZAEnabled. */
+bool sme_smza_enabled_check(DisasContext *s)
+{
+    if (!sme_enabled_check(s)) {
+        return false;
+    }
+    if (!s->pstate_sm) {
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_smetrap(SME_ET_NotStreaming, false));
+        return false;
+    }
+    if (!s->pstate_za) {
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_smetrap(SME_ET_InactiveZA, false));
+        return false;
+    }
+    return true;
+}
+
 /*
  * This utility function is for doing register extension with an
  * optional shift. You will likely want to pass a temporary for the
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index d526c74456..d2a7232491 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -35,6 +35,54 @@
 #include "decode-sme.c.inc"
 
 
+static TCGv_ptr get_tile_rowcol(DisasContext *s, int esz, int rs,
+                                int tile_index, bool vertical)
+{
+    int tile = tile_index >> (4 - esz);
+    int index = esz == MO_128 ? 0 : extract32(tile_index, 0, 4 - esz);
+    int pos, len, offset;
+    TCGv_i32 t_index;
+    TCGv_ptr addr;
+
+    /* Resolve tile.size[index] to an untyped ZA slice index. */
+    t_index = tcg_temp_new_i32();
+    tcg_gen_trunc_tl_i32(t_index, cpu_reg(s, rs));
+    tcg_gen_addi_i32(t_index, t_index, index);
+
+    len = ctz32(s->svl) - esz;
+    pos = esz;
+    offset = tile;
+
+    /*
+     * Horizontal slice.  Index row N, column 0.
+     * The helper will iterate by the element size.
+     */
+    if (!vertical) {
+        pos += ctz32(sizeof(ARMVectorReg));
+        offset *= sizeof(ARMVectorReg);
+    }
+    offset += offsetof(CPUARMState, zarray);
+
+    tcg_gen_deposit_z_i32(t_index, t_index, pos, len);
+    tcg_gen_addi_i32(t_index, t_index, offset);
+
+    /*
+     * Vertical tile slice.  Index row 0, column N.
+     * The helper will iterate by the row spacing in the array.
+     * Need to adjust addressing for elements smaller than uint64_t for BE.
+     */
+    if (HOST_BIG_ENDIAN && vertical && esz < MO_64) {
+        tcg_gen_xori_i32(t_index, t_index, 8 - (1 << esz));
+    }
+
+    addr = tcg_temp_new_ptr();
+    tcg_gen_ext_i32_ptr(addr, t_index);
+    tcg_temp_free_i32(t_index);
+    tcg_gen_add_ptr(addr, addr, cpu_env);
+
+    return addr;
+}
+
 static bool trans_ZERO(DisasContext *s, arg_ZERO *a)
 {
     if (!dc_isar_feature(aa64_sme, s)) {
@@ -46,3 +94,60 @@ static bool trans_ZERO(DisasContext *s, arg_ZERO *a)
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
+    static gen_helper_gvec_3 * const avz_fns[5] = {
+        gen_helper_sme_mova_avz_b, gen_helper_sme_mova_avz_h,
+        gen_helper_sme_mova_avz_s, gen_helper_sme_mova_avz_d,
+        gen_helper_sme_mova_avz_q,
+    };
+    static gen_helper_gvec_3 * const zav_fns[5] = {
+        gen_helper_sme_mova_zav_b, gen_helper_sme_mova_zav_h,
+        gen_helper_sme_mova_zav_s, gen_helper_sme_mova_zav_d,
+        gen_helper_sme_mova_zav_q,
+    };
+
+    TCGv_ptr t_za, t_zr, t_pg;
+    TCGv_i32 t_desc;
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
+    t_desc = tcg_constant_i32(simd_desc(s->svl, s->svl, 0));
+
+    if (a->v) {
+        /* Vertical slice -- use sme mova helpers. */
+        if (a->to_vec) {
+            zav_fns[a->esz](t_za, t_zr, t_pg, t_desc);
+        } else {
+            avz_fns[a->esz](t_zr, t_za, t_pg, t_desc);
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


