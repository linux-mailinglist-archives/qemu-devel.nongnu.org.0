Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3686362A9F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:54:58 +0200 (CEST)
Received: from localhost ([::1]:55094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWQT-00025J-N2
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdL-0005hn-42
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:12 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:37684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVd6-0001dP-RO
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:07 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 e8-20020a17090a7288b029014e51f5a6baso10051713pjg.2
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XIEcP0v1PbaDwLB9Hxg+FIEYQexZwgPZLsPGPjMPLII=;
 b=iIMOHsaH8aO9qyypSQxWW3AkMjS624ifoFXhGC/Qge3V4tKyS8ZjsIxMbD2W1jWO7l
 s9X9JyolQ15Vk1AmUyqG7k5efkUEtuA5zRaSqXuqk6RfkUT1G4Nbb9pSJztAxnJkixY6
 sU7oSKmKU1NtNNqbCZYGhZlcWV/+g1W8QEQfUOBIHDBhU007ReX0kYYDFfBDPwmCXM0l
 4dW1kv3Dz9Y5WgCfFlYUk1KyIzwYV0LbmJcMpfDWzoBp7hEs6q4E8yovTbV84Eg0bkry
 9uwzfvxPVwd1rg+oRw2YTBER15g09BMCk5Iyn4rcUWaOmpgDc9Q+k5DYONDE+1TlyQ8a
 RRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XIEcP0v1PbaDwLB9Hxg+FIEYQexZwgPZLsPGPjMPLII=;
 b=nu12LQPcwdVWp8ck6PPNwK0wKk1FM2rDb5wV3A8YyoKbIi4gzR+XC7yjbzhXy6mbPA
 oyLuwkRg8CDVDdzyiM7/s6N64XF3pB6jxite9iDLYaRGGmiktlTmkOLrJkkK/dEU4Wxa
 0M+PS9pJtXxqAUK36S9TefnbOi1Pi9T/gpsesDHKWZ5Pf42PJqLrAyio+AN/w/LoWmSf
 GZlZIgQwLqF5rqZ4YhX62PsO/cYVi0KOHNrKp6srDQUzlj27rWrlmAjQQsOXNNzPWCWB
 UldetB6d6giotnMiuNr+mRysb7MtOedQOoU148NiBWwUB7sIcsw1WUB9zd2O+8KHZKoI
 2SuQ==
X-Gm-Message-State: AOAM532cXhINEGLkoi6rFcm7OjV1gJPD1rn5S+PdORuHGDxYvzsKp+HE
 xNmmZ5/H7Jq54ngOB+OT0buLUuKGYAHHNQ==
X-Google-Smtp-Source: ABdhPJxXu07f34PdPanfoApIa9pG1Z8lzmpNY1g7JZFZvRGsqVzso1aelxGlmzWi8sbrOufideT5zA==
X-Received: by 2002:a17:90a:9f8c:: with SMTP id
 o12mr11439384pjp.215.1618607035511; 
 Fri, 16 Apr 2021 14:03:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 43/81] target/arm: Implement SVE2 XAR
Date: Fri, 16 Apr 2021 14:02:02 -0700
Message-Id: <20210416210240.1591291-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

In addition, use the same vector generator interface for AdvSIMD.
This fixes a bug in which the AdvSIMD insn failed to clear the
high bits of the SVE register.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |   4 ++
 target/arm/helper.h        |   2 +
 target/arm/translate-a64.h |   3 ++
 target/arm/sve.decode      |   4 ++
 target/arm/sve_helper.c    |  39 ++++++++++++++
 target/arm/translate-a64.c |  25 ++-------
 target/arm/translate-sve.c | 104 +++++++++++++++++++++++++++++++++++++
 target/arm/vec_helper.c    |  12 +++++
 8 files changed, 172 insertions(+), 21 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 507a2fea8e..28b8f00201 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2558,6 +2558,10 @@ DEF_HELPER_FLAGS_5(sve2_histcnt_d, TCG_CALL_NO_RWG,
 
 DEF_HELPER_FLAGS_4(sve2_histseg, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_xar_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_xar_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_xar_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 6bb0b0ddc0..23a7ec5638 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -953,6 +953,8 @@ DEF_HELPER_FLAGS_5(neon_sqrdmulh_h, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(neon_sqrdmulh_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(gvec_xar_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 868d355048..b4d391207f 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -122,5 +122,8 @@ bool disas_sve(DisasContext *, uint32_t);
 
 void gen_gvec_rax1(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                    uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_xar(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                  uint32_t rm_ofs, int64_t shift,
+                  uint32_t opr_sz, uint32_t max_sz);
 
 #endif /* TARGET_ARM_TRANSLATE_A64_H */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 8f501a083c..7645587469 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -65,6 +65,7 @@
 &rr_dbm         rd rn dbm
 &rrri           rd rn rm imm
 &rri_esz        rd rn imm esz
+&rrri_esz       rd rn rm imm esz
 &rrr_esz        rd rn rm esz
 &rpr_esz        rd pg rn esz
 &rpr_s          rd pg rn s
@@ -384,6 +385,9 @@ ORR_zzz         00000100 01 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
 EOR_zzz         00000100 10 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
 BIC_zzz         00000100 11 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
 
+XAR             00000100 .. 1 ..... 001 101 rm:5  rd:5   &rrri_esz \
+                rn=%reg_movprfx esz=%tszimm16_esz imm=%tszimm16_shr
+
 # SVE2 bitwise ternary operations
 EOR3            00000100 00 1 ..... 001 110 ..... .....         @rdn_ra_rm_e0
 BSL             00000100 00 1 ..... 001 111 ..... .....         @rdn_ra_rm_e0
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 8d002fdb65..c77003217e 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -7193,3 +7193,42 @@ void HELPER(sve2_histseg)(void *vd, void *vn, void *vm, uint32_t desc)
         *(uint64_t *)(vd + i + 8) = out1;
     }
 }
+
+void HELPER(sve2_xar_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    int shr = simd_data(desc);
+    int shl = 8 - shr;
+    uint64_t mask = dup_const(MO_8, 0xff >> shr);
+    uint64_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        uint64_t t = n[i] ^ m[i];
+        d[i] = ((t >> shr) & mask) | ((t << shl) & ~mask);
+    }
+}
+
+void HELPER(sve2_xar_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    int shr = simd_data(desc);
+    int shl = 16 - shr;
+    uint64_t mask = dup_const(MO_16, 0xffff >> shr);
+    uint64_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        uint64_t t = n[i] ^ m[i];
+        d[i] = ((t >> shr) & mask) | ((t << shl) & ~mask);
+    }
+}
+
+void HELPER(sve2_xar_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 4;
+    int shr = simd_data(desc);
+    uint32_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = ror32(n[i] ^ m[i], shr);
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 95897e63af..cd8408e84c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14364,8 +14364,6 @@ static void disas_crypto_xar(DisasContext *s, uint32_t insn)
     int imm6 = extract32(insn, 10, 6);
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
-    TCGv_i64 tcg_op1, tcg_op2, tcg_res[2];
-    int pass;
 
     if (!dc_isar_feature(aa64_sha3, s)) {
         unallocated_encoding(s);
@@ -14376,25 +14374,10 @@ static void disas_crypto_xar(DisasContext *s, uint32_t insn)
         return;
     }
 
-    tcg_op1 = tcg_temp_new_i64();
-    tcg_op2 = tcg_temp_new_i64();
-    tcg_res[0] = tcg_temp_new_i64();
-    tcg_res[1] = tcg_temp_new_i64();
-
-    for (pass = 0; pass < 2; pass++) {
-        read_vec_element(s, tcg_op1, rn, pass, MO_64);
-        read_vec_element(s, tcg_op2, rm, pass, MO_64);
-
-        tcg_gen_xor_i64(tcg_res[pass], tcg_op1, tcg_op2);
-        tcg_gen_rotri_i64(tcg_res[pass], tcg_res[pass], imm6);
-    }
-    write_vec_element(s, tcg_res[0], rd, 0, MO_64);
-    write_vec_element(s, tcg_res[1], rd, 1, MO_64);
-
-    tcg_temp_free_i64(tcg_op1);
-    tcg_temp_free_i64(tcg_op2);
-    tcg_temp_free_i64(tcg_res[0]);
-    tcg_temp_free_i64(tcg_res[1]);
+    gen_gvec_xar(MO_64, vec_full_reg_offset(s, rd),
+                 vec_full_reg_offset(s, rn),
+                 vec_full_reg_offset(s, rm), imm6, 16,
+                 vec_full_reg_size(s));
 }
 
 /* Crypto three-reg imm2
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0cbca8d715..eea8b6f1d0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -340,6 +340,110 @@ static bool trans_BIC_zzz(DisasContext *s, arg_rrr_esz *a)
     return do_zzz_fn(s, a, tcg_gen_gvec_andc);
 }
 
+static void gen_xar8_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, int64_t sh)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+    uint64_t mask = dup_const(MO_8, 0xff >> sh);
+
+    tcg_gen_xor_i64(t, n, m);
+    tcg_gen_shri_i64(d, t, sh);
+    tcg_gen_shli_i64(t, t, 8 - sh);
+    tcg_gen_andi_i64(d, d, mask);
+    tcg_gen_andi_i64(t, t, ~mask);
+    tcg_gen_or_i64(d, d, t);
+    tcg_temp_free_i64(t);
+}
+
+static void gen_xar16_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, int64_t sh)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+    uint64_t mask = dup_const(MO_16, 0xffff >> sh);
+
+    tcg_gen_xor_i64(t, n, m);
+    tcg_gen_shri_i64(d, t, sh);
+    tcg_gen_shli_i64(t, t, 16 - sh);
+    tcg_gen_andi_i64(d, d, mask);
+    tcg_gen_andi_i64(t, t, ~mask);
+    tcg_gen_or_i64(d, d, t);
+    tcg_temp_free_i64(t);
+}
+
+static void gen_xar_i32(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m, int32_t sh)
+{
+    tcg_gen_xor_i32(d, n, m);
+    tcg_gen_rotri_i32(d, d, sh);
+}
+
+static void gen_xar_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, int64_t sh)
+{
+    tcg_gen_xor_i64(d, n, m);
+    tcg_gen_rotri_i64(d, d, sh);
+}
+
+static void gen_xar_vec(unsigned vece, TCGv_vec d, TCGv_vec n,
+                        TCGv_vec m, int64_t sh)
+{
+    tcg_gen_xor_vec(vece, d, n, m);
+    tcg_gen_rotri_vec(vece, d, d, sh);
+}
+
+void gen_gvec_xar(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                  uint32_t rm_ofs, int64_t shift,
+                  uint32_t opr_sz, uint32_t max_sz)
+{
+    static const TCGOpcode vecop[] = { INDEX_op_rotli_vec, 0 };
+    static const GVecGen3i ops[4] = {
+        { .fni8 = gen_xar8_i64,
+          .fniv = gen_xar_vec,
+          .fno = gen_helper_sve2_xar_b,
+          .opt_opc = vecop,
+          .vece = MO_8 },
+        { .fni8 = gen_xar16_i64,
+          .fniv = gen_xar_vec,
+          .fno = gen_helper_sve2_xar_h,
+          .opt_opc = vecop,
+          .vece = MO_16 },
+        { .fni4 = gen_xar_i32,
+          .fniv = gen_xar_vec,
+          .fno = gen_helper_sve2_xar_s,
+          .opt_opc = vecop,
+          .vece = MO_32 },
+        { .fni8 = gen_xar_i64,
+          .fniv = gen_xar_vec,
+          .fno = gen_helper_gvec_xar_d,
+          .opt_opc = vecop,
+          .vece = MO_64 }
+    };
+    int esize = 8 << vece;
+
+    /* The SVE2 range is 1 .. esize; the AdvSIMD range is 0 .. esize-1. */
+    tcg_debug_assert(shift >= 0);
+    tcg_debug_assert(shift <= esize);
+    shift &= esize - 1;
+
+    if (shift == 0) {
+        /* xar with no rotate devolves to xor. */
+        tcg_gen_gvec_xor(vece, rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz);
+    } else {
+        tcg_gen_gvec_3i(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz,
+                        shift, &ops[vece]);
+    }
+}
+
+static bool trans_XAR(DisasContext *s, arg_rrri_esz *a)
+{
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        gen_gvec_xar(a->esz, vec_full_reg_offset(s, a->rd),
+                     vec_full_reg_offset(s, a->rn),
+                     vec_full_reg_offset(s, a->rm), a->imm, vsz, vsz);
+    }
+    return true;
+}
+
 static bool do_sve2_zzzz_fn(DisasContext *s, arg_rrrr_esz *a, GVecGen4Fn *fn)
 {
     if (!dc_isar_feature(aa64_sve2, s)) {
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 19006f50f7..a3d80ecad0 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2253,3 +2253,15 @@ void HELPER(gvec_umulh_d)(void *vd, void *vn, void *vm, uint32_t desc)
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_xar_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    int shr = simd_data(desc);
+    uint64_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = ror64(n[i] ^ m[i], shr);
+    }
+    clear_tail(d, opr_sz * 8, simd_maxsz(desc));
+}
-- 
2.25.1


