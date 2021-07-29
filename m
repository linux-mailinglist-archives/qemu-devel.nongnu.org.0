Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881CD3DA22E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:31:21 +0200 (CEST)
Received: from localhost ([::1]:35948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94Fz-0005yN-T3
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940q-0000XM-Cj
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:41 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940c-000162-NL
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:40 -0400
Received: by mail-wr1-x431.google.com with SMTP id d8so6455673wrm.4
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sBt+Er2ORY6pTVXoQlImPIKKZV4cWhSFl3FktQ7/5BI=;
 b=AcMOi2C5CfADuaZnCMB9BcZR/jt4w/D0ZvfONy3AryOpPQoQEeKAzY1HFjP8d3gQQx
 skwthkb/ObIbKc0nSu1x6JFCapZwTHuiaHXRb8zojl5Hu/RNnm0Fioi7cpWvxmSxpfSQ
 1DTaEETLI3/9/iEThLrfqeJif0K071cLcszfXFgMla3shPKTjsroHTKvVVZdqoJy9C3/
 fGhk3um3ckDLZLo0XlLHYQlWgRVrbBX4Ct1oXxY3X/I/pbNgeADDqIhRdMLFXMNHBFPp
 Ip+Ba+kS7x6LlQrshHp7bJYmgbl7R0Dh9fb8IKAfCdfWHQ9sIxelgwy6pCAas7xXk7rO
 WR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sBt+Er2ORY6pTVXoQlImPIKKZV4cWhSFl3FktQ7/5BI=;
 b=jMZCEsyJUMeYogXR3ryJnhDP1AmOTZxl+E12ORsL9s9gTGIIF3XH4Qn8RZt2+LhbRj
 gKIXIjonb4unek8gWgzbRYNQyVPtnKipHHdblwN9ZEJJxmq8qKY+NPhv+T1ucqqR2S/X
 OypLau4J+3xjYyvQNDXt4a29y0Myh+wLhTTOtgJEVTQHgRVA5pToxWvGRRvn21tI4QGp
 Yioi/tVt/huk4eFD5mzGkNL8gKnT3tzvO8E6H014H8J2mMwS6nWF/galO04/hXBUjFKR
 Aepeh8JqCJk4K3zJRv0fAeL6DFBfiHXTfBPCuNRA+4/IcBDi1tm9pSfI3VaXyBClLlnL
 9QPA==
X-Gm-Message-State: AOAM531ta9nm4cFv4t9okXeCAd4ummDFkSk4zl6vPNqjhSKTRq9GnsZQ
 mhYCO/jxiK/hJ6KW4xRE4gmuEg+JuK0Ptw==
X-Google-Smtp-Source: ABdhPJwMLYVnloh0Ik6lnqPjroCuwX0icmgkVBDr4lLUbitSOERx6HO6Reg2rjXilQpD4cjUsDHbZA==
X-Received: by 2002:a05:6000:548:: with SMTP id
 b8mr4373825wrf.159.1627557325386; 
 Thu, 29 Jul 2021 04:15:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 13/53] target/arm: Implement MVE
 incrementing/decrementing dup insns
Date: Thu, 29 Jul 2021 12:14:32 +0100
Message-Id: <20210729111512.16541-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Implement the MVE incrementing/decrementing dup insns VIDUP, VDDUP,
VIWDUP and VDWDUP.  These fill the elements of a vector with
successively incrementing values, starting at the offset specified in
a general purpose register.  The final value of the offset is written
back to this register.  The wrapping variants take a second general
purpose register which specifies the point where the count should
wrap back to 0.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  12 ++++
 target/arm/mve.decode      |  25 ++++++++
 target/arm/mve_helper.c    |  63 +++++++++++++++++++
 target/arm/translate-mve.c | 120 +++++++++++++++++++++++++++++++++++++
 4 files changed, 220 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 84adfb21517..b9af03cc03b 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -35,6 +35,18 @@ DEF_HELPER_FLAGS_3(mve_vstrh_w, TCG_CALL_NO_WG, void, env, ptr, i32)
 
 DEF_HELPER_FLAGS_3(mve_vdup, TCG_CALL_NO_WG, void, env, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vidupb, TCG_CALL_NO_WG, i32, env, ptr, i32, i32)
+DEF_HELPER_FLAGS_4(mve_viduph, TCG_CALL_NO_WG, i32, env, ptr, i32, i32)
+DEF_HELPER_FLAGS_4(mve_vidupw, TCG_CALL_NO_WG, i32, env, ptr, i32, i32)
+
+DEF_HELPER_FLAGS_5(mve_viwdupb, TCG_CALL_NO_WG, i32, env, ptr, i32, i32, i32)
+DEF_HELPER_FLAGS_5(mve_viwduph, TCG_CALL_NO_WG, i32, env, ptr, i32, i32, i32)
+DEF_HELPER_FLAGS_5(mve_viwdupw, TCG_CALL_NO_WG, i32, env, ptr, i32, i32, i32)
+
+DEF_HELPER_FLAGS_5(mve_vdwdupb, TCG_CALL_NO_WG, i32, env, ptr, i32, i32, i32)
+DEF_HELPER_FLAGS_5(mve_vdwduph, TCG_CALL_NO_WG, i32, env, ptr, i32, i32, i32)
+DEF_HELPER_FLAGS_5(mve_vdwdupw, TCG_CALL_NO_WG, i32, env, ptr, i32, i32, i32)
+
 DEF_HELPER_FLAGS_3(mve_vclsb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index de079ec517d..88c9c18ebf1 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -35,6 +35,8 @@
 &2scalar qd qn rm size
 &1imm qd imm cmode op
 &2shift qd qm shift size
+&vidup qd rn size imm
+&viwdup qd rn rm size imm
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
@@ -259,6 +261,29 @@ VDUP             1110 1110 1 1 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=0
 VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 1 1 0000 @vdup size=1
 VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=2
 
+# Incrementing and decrementing dup
+
+# VIDUP, VDDUP format immediate: 1 << (immh:imml)
+%imm_vidup 7:1 0:1 !function=vidup_imm
+
+# VIDUP, VDDUP registers: Rm bits [3:1] from insn, bit 0 is 1;
+# Rn bits [3:1] from insn, bit 0 is 0
+%vidup_rm 1:3 !function=times_2_plus_1
+%vidup_rn 17:3 !function=times_2
+
+@vidup           .... .... . . size:2 .... .... .... .... .... \
+                 qd=%qd imm=%imm_vidup rn=%vidup_rn &vidup
+@viwdup          .... .... . . size:2 .... .... .... .... .... \
+                 qd=%qd imm=%imm_vidup rm=%vidup_rm rn=%vidup_rn &viwdup
+{
+  VIDUP          1110 1110 0 . .. ... 1 ... 0 1111 . 110 111 . @vidup
+  VIWDUP         1110 1110 0 . .. ... 1 ... 0 1111 . 110 ... . @viwdup
+}
+{
+  VDDUP          1110 1110 0 . .. ... 1 ... 1 1111 . 110 111 . @vidup
+  VDWDUP         1110 1110 0 . .. ... 1 ... 1 1111 . 110 ... . @viwdup
+}
+
 # multiply-add long dual accumulate
 # rdahi: bits [3:1] from insn, bit 0 is 1
 # rdalo: bits [3:1] from insn, bit 0 is 0
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 91fb346d7e5..38b4181db2a 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1695,3 +1695,66 @@ uint32_t HELPER(mve_sqrshr)(CPUARMState *env, uint32_t n, uint32_t shift)
 {
     return do_sqrshl_bhs(n, -(int8_t)shift, 32, true, &env->QF);
 }
+
+#define DO_VIDUP(OP, ESIZE, TYPE, FN)                           \
+    uint32_t HELPER(mve_##OP)(CPUARMState *env, void *vd,       \
+                           uint32_t offset, uint32_t imm)       \
+    {                                                           \
+        TYPE *d = vd;                                           \
+        uint16_t mask = mve_element_mask(env);                  \
+        unsigned e;                                             \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
+            mergemask(&d[H##ESIZE(e)], offset, mask);           \
+            offset = FN(offset, imm);                           \
+        }                                                       \
+        mve_advance_vpt(env);                                   \
+        return offset;                                          \
+    }
+
+#define DO_VIWDUP(OP, ESIZE, TYPE, FN)                          \
+    uint32_t HELPER(mve_##OP)(CPUARMState *env, void *vd,       \
+                              uint32_t offset, uint32_t wrap,   \
+                              uint32_t imm)                     \
+    {                                                           \
+        TYPE *d = vd;                                           \
+        uint16_t mask = mve_element_mask(env);                  \
+        unsigned e;                                             \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
+            mergemask(&d[H##ESIZE(e)], offset, mask);           \
+            offset = FN(offset, wrap, imm);                     \
+        }                                                       \
+        mve_advance_vpt(env);                                   \
+        return offset;                                          \
+    }
+
+#define DO_VIDUP_ALL(OP, FN)                    \
+    DO_VIDUP(OP##b, 1, int8_t, FN)              \
+    DO_VIDUP(OP##h, 2, int16_t, FN)             \
+    DO_VIDUP(OP##w, 4, int32_t, FN)
+
+#define DO_VIWDUP_ALL(OP, FN)                   \
+    DO_VIWDUP(OP##b, 1, int8_t, FN)             \
+    DO_VIWDUP(OP##h, 2, int16_t, FN)            \
+    DO_VIWDUP(OP##w, 4, int32_t, FN)
+
+static uint32_t do_add_wrap(uint32_t offset, uint32_t wrap, uint32_t imm)
+{
+    offset += imm;
+    if (offset == wrap) {
+        offset = 0;
+    }
+    return offset;
+}
+
+static uint32_t do_sub_wrap(uint32_t offset, uint32_t wrap, uint32_t imm)
+{
+    if (offset == 0) {
+        offset = wrap;
+    }
+    offset -= imm;
+    return offset;
+}
+
+DO_VIDUP_ALL(vidup, DO_ADD)
+DO_VIWDUP_ALL(viwdup, do_add_wrap)
+DO_VIWDUP_ALL(vdwdup, do_sub_wrap)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index d318f34b2bc..a220521c00b 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -25,6 +25,11 @@
 #include "translate.h"
 #include "translate-a32.h"
 
+static inline int vidup_imm(DisasContext *s, int x)
+{
+    return 1 << x;
+}
+
 /* Include the generated decoder */
 #include "decode-mve.c.inc"
 
@@ -36,6 +41,8 @@ typedef void MVEGenTwoOpShiftFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenDualAccOpFn(TCGv_i64, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i64);
 typedef void MVEGenVADDVFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenOneOpImmFn(TCGv_ptr, TCGv_ptr, TCGv_i64);
+typedef void MVEGenVIDUPFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32, TCGv_i32);
+typedef void MVEGenVIWDUPFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -1059,3 +1066,116 @@ static bool trans_VSHLC(DisasContext *s, arg_VSHLC *a)
     mve_update_eci(s);
     return true;
 }
+
+static bool do_vidup(DisasContext *s, arg_vidup *a, MVEGenVIDUPFn *fn)
+{
+    TCGv_ptr qd;
+    TCGv_i32 rn;
+
+    /*
+     * Vector increment/decrement with wrap and duplicate (VIDUP, VDDUP).
+     * This fills the vector with elements of successively increasing
+     * or decreasing values, starting from Rn.
+     */
+    if (!dc_isar_feature(aa32_mve, s) || !mve_check_qreg_bank(s, a->qd)) {
+        return false;
+    }
+    if (a->size == MO_64) {
+        /* size 0b11 is another encoding */
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qd = mve_qreg_ptr(a->qd);
+    rn = load_reg(s, a->rn);
+    fn(rn, cpu_env, qd, rn, tcg_constant_i32(a->imm));
+    store_reg(s, a->rn, rn);
+    tcg_temp_free_ptr(qd);
+    mve_update_eci(s);
+    return true;
+}
+
+static bool do_viwdup(DisasContext *s, arg_viwdup *a, MVEGenVIWDUPFn *fn)
+{
+    TCGv_ptr qd;
+    TCGv_i32 rn, rm;
+
+    /*
+     * Vector increment/decrement with wrap and duplicate (VIWDUp, VDWDUP)
+     * This fills the vector with elements of successively increasing
+     * or decreasing values, starting from Rn. Rm specifies a point where
+     * the count wraps back around to 0. The updated offset is written back
+     * to Rn.
+     */
+    if (!dc_isar_feature(aa32_mve, s) || !mve_check_qreg_bank(s, a->qd)) {
+        return false;
+    }
+    if (!fn || a->rm == 13 || a->rm == 15) {
+        /*
+         * size 0b11 is another encoding; Rm == 13 is UNPREDICTABLE;
+         * Rm == 13 is VIWDUP, VDWDUP.
+         */
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qd = mve_qreg_ptr(a->qd);
+    rn = load_reg(s, a->rn);
+    rm = load_reg(s, a->rm);
+    fn(rn, cpu_env, qd, rn, rm, tcg_constant_i32(a->imm));
+    store_reg(s, a->rn, rn);
+    tcg_temp_free_ptr(qd);
+    tcg_temp_free_i32(rm);
+    mve_update_eci(s);
+    return true;
+}
+
+static bool trans_VIDUP(DisasContext *s, arg_vidup *a)
+{
+    static MVEGenVIDUPFn * const fns[] = {
+        gen_helper_mve_vidupb,
+        gen_helper_mve_viduph,
+        gen_helper_mve_vidupw,
+        NULL,
+    };
+    return do_vidup(s, a, fns[a->size]);
+}
+
+static bool trans_VDDUP(DisasContext *s, arg_vidup *a)
+{
+    static MVEGenVIDUPFn * const fns[] = {
+        gen_helper_mve_vidupb,
+        gen_helper_mve_viduph,
+        gen_helper_mve_vidupw,
+        NULL,
+    };
+    /* VDDUP is just like VIDUP but with a negative immediate */
+    a->imm = -a->imm;
+    return do_vidup(s, a, fns[a->size]);
+}
+
+static bool trans_VIWDUP(DisasContext *s, arg_viwdup *a)
+{
+    static MVEGenVIWDUPFn * const fns[] = {
+        gen_helper_mve_viwdupb,
+        gen_helper_mve_viwduph,
+        gen_helper_mve_viwdupw,
+        NULL,
+    };
+    return do_viwdup(s, a, fns[a->size]);
+}
+
+static bool trans_VDWDUP(DisasContext *s, arg_viwdup *a)
+{
+    static MVEGenVIWDUPFn * const fns[] = {
+        gen_helper_mve_vdwdupb,
+        gen_helper_mve_vdwduph,
+        gen_helper_mve_vdwdupw,
+        NULL,
+    };
+    return do_viwdup(s, a, fns[a->size]);
+}
-- 
2.20.1


