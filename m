Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0781B541A92
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:34:51 +0200 (CEST)
Received: from localhost ([::1]:53548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygqg-00042O-3u
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwe-0006S6-2G
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:36:56 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:42714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwY-0008EH-WE
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:36:55 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 d12-20020a17090abf8c00b001e2eb431ce4so16450321pjs.1
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cGWWtgQOmUC1oO416fCbKUBf9KcbSCbcFAMf9iiJDm0=;
 b=IQge3VyTEzK7Rir1imq7VeEYb4PmVDyv7Q1l4PZxw0/3ukWx+mhTRXuPGtAl8+IwdQ
 wOcOSgAHS//83b5LJwyGgLVF7iY4j62eOlTbE/o6t6h1XWPERJ5+sR/P69aIS/N2WOr5
 d4H7+wPKkyhwlrdI5gBsyz5kjAjcOt4ix1nqWYFKtpXOofKLffESiYxE7Ipif2pg+ZRg
 BUyRLJHQ4KLnubNRqPvrEKmdHy4Dot+Guy1JLWre/XWmn+0k4Vz/m9ZZiZuSnzhMmnfr
 i6+WnoaW7iHdbGxe3CFj6ujaHT5/oiB+ub4ULMSN16oHykOZRhax2tIzjtUoz9uAcoUa
 9cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cGWWtgQOmUC1oO416fCbKUBf9KcbSCbcFAMf9iiJDm0=;
 b=3AUjdefw6Vm6hjQfAgApWMjbpznIbSpnPa7AU7d2kqyVCTQPm/vyYd439SkzKWCm3K
 r4tTOTgB/8UoARZKnsGkVa3wPXqhlqqnD+XQ2FcAhurj+Pc8gPIcJNlL4gUfBvn0w4kb
 tX5Cox7RP5GKVasNvV8JOtVcA+xGC+xwiXgEfOzYUobKWgHribpCwGQM0mfg7VBISxeM
 5/+MF2Z8emaRusJ3jOsVDt1An10jofgtTNJh/yxnMtLcG6klJ+qOHJDXVDRBQKslcvvV
 /YCDFUQamv8veNCIR/iaeqlz0Lr2kxu46b1ccdTxFZSBuQfplm4nZEGn4vpWKi2wWfwk
 Unkg==
X-Gm-Message-State: AOAM533C2tkQJ0N/noLi5JdlCnaOLAOs58KR4mB8TJ/FkOTvMxxqZ8Q7
 zyq/+p+fcW6b+yO6WMZu3gMp2FanWUNOAQ==
X-Google-Smtp-Source: ABdhPJwOdX4/XkSdUTi0X/zyFzOFc8BC3faOMDp3QRpxq8VwVyYsUOf3CerQCuJWHJgyOFOdF8aLvA==
X-Received: by 2002:a17:902:d2c9:b0:163:bdee:b2df with SMTP id
 n9-20020a170902d2c900b00163bdeeb2dfmr30980748plc.98.1654634209383; 
 Tue, 07 Jun 2022 13:36:49 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:36:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 45/71] target/arm: Implement SME MOVA
Date: Tue,  7 Jun 2022 13:32:40 -0700
Message-Id: <20220607203306.657998-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    |  11 ++++
 target/arm/helper-sve.h    |   2 +
 target/arm/translate-a64.h |   9 +++
 target/arm/translate.h     |   5 ++
 target/arm/sme_helper.c    | 110 ++++++++++++++++++++++++++++++++++++-
 target/arm/sve_helper.c    |  12 ++++
 target/arm/translate-a64.c |  21 +++++++
 target/arm/translate-sme.c | 105 +++++++++++++++++++++++++++++++++++
 target/arm/sme.decode      |  15 +++++
 9 files changed, 289 insertions(+), 1 deletion(-)

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
index 775297aa40..d03afd0034 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -159,6 +159,11 @@ static inline int plus_2(DisasContext *s, int x)
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
index 660c5dbf5b..2b4baa2684 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1246,6 +1246,27 @@ bool sme_za_enabled_check(DisasContext *s)
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
+                           syn_smetrap(SME_ET_NotStreaming, false),
+                           default_exception_el(s));
+        return false;
+    }
+    if (!s->pstate_za) {
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_smetrap(SME_ET_InactiveZA, false),
+                           default_exception_el(s));
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
-- 
2.34.1


