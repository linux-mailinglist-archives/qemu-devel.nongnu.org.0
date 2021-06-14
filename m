Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB303A6A77
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:33:31 +0200 (CEST)
Received: from localhost ([::1]:55486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoag-0002UI-DS
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEn-0001f5-0y
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:54 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:42689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEX-0000S4-GD
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:52 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso186980wms.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XcLiqshci/qgVWWyT19kVjzaw+hWxC2MG3DaYu8C+ro=;
 b=t0STMcQyt823VVWhNHcMA7UGHm9luV+AWtaY3SxJIA81PQhk8/mbnEmCR3ytlY3wJt
 XWBj8jADI/8jxqk3/fsZhxwJs9i+NITbncWGf+DCNTMTiiH9IPOXZZrOgxw5xe22YW+b
 OhnCScQ2a/v+p8IVtN2JMiDYqNVB3swI7u5ZDndspvi7n9qlDvRjGR5ROnU8spA1roFv
 zRoSjA/nFozyou3S6SKJd/u/JTt+NtwyRBuZXQvFPCFbB8B9ytjGq4b5/CZ01dtotrvJ
 Sy9+VN1tKfTi57dCLhR6V64FSYE1YWbOedEsVhJ5PV/nZQiPw0UOUmOlU6m363woIzHs
 H++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XcLiqshci/qgVWWyT19kVjzaw+hWxC2MG3DaYu8C+ro=;
 b=qadGgMLxqm38JLoKp1BCUF2MrFwzZ5EPkSMTXTHna6erLTiZjAzEu5B3kOfpdKaGdN
 qroPNx12FCdBAuyadITh9abv0jc5S2MgHY60YmnDXJNWpwXV9bKqbC0nFG9fDg6qVJT2
 j2ZifDHP/XPtSCfNu4x+RhEw7NEKAnLj7IANz8ACOvVfInMN5cwsX1pia9whtTTZSMUE
 /h7Z2AhuEWTKUQjrRhV5pNjI8afdo5gxfkOrDgYM+h85l7v92BXwDK3hPBINoHmuPtB7
 xTgFJKecJbhJH5Teo2VFlpeQJnlE77lvEV1tgtiu3V6daFZ31FTkQ1PTFNZLGIBzorwC
 NMaA==
X-Gm-Message-State: AOAM530RsIuWl2aqUSUV9SIi40k2nC0/YIGNqDlqS+gaJWVoh20cgKkf
 VEvyyGtnKqUjXvorzlbkXUZiVg==
X-Google-Smtp-Source: ABdhPJzF2cOLMCZdod3/W6GSDoGDvaonAxilhb/R8VdirFVt4WygclJo2GZe2nKwiN6HWpwZ1QR1CQ==
X-Received: by 2002:a1c:f60f:: with SMTP id w15mr16869197wmc.71.1623683436006; 
 Mon, 14 Jun 2021 08:10:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 31/57] target/arm: Implement MVE VMLALDAV
Date: Mon, 14 Jun 2021 16:09:41 +0100
Message-Id: <20210614151007.4545-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VMLALDAV insn, which multiplies pairs of integer
elements, accumulating them into a 64-bit result in a pair of
general-purpose registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++
 target/arm/translate.h     | 10 ++++
 target/arm/mve.decode      | 15 ++++++
 target/arm/mve_helper.c    | 34 ++++++++++++++
 target/arm/translate-mve.c | 96 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 163 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 9bbeb7ec49d..0138e28278a 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -144,3 +144,11 @@ DEF_HELPER_FLAGS_4(mve_vmulltsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulltub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulltuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulltuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vmlaldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vmlaldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vmlaldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vmlaldavxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+
+DEF_HELPER_FLAGS_4(mve_vmlaldavuh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vmlaldavuw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 2821b325e33..99c917c571a 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -136,6 +136,11 @@ static inline int negate(DisasContext *s, int x)
     return -x;
 }
 
+static inline int plus_1(DisasContext *s, int x)
+{
+    return x + 1;
+}
+
 static inline int plus_2(DisasContext *s, int x)
 {
     return x + 2;
@@ -151,6 +156,11 @@ static inline int times_4(DisasContext *s, int x)
     return x * 4;
 }
 
+static inline int times_2_plus_1(DisasContext *s, int x)
+{
+    return x * 2 + 1;
+}
+
 static inline int arm_dc_feature(DisasContext *dc, int feature)
 {
     return (dc->features & (1ULL << feature)) != 0;
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 5a480d61cd6..bde54d05bb9 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -130,3 +130,18 @@ VNEG_fp          1111 1111 1 . 11 .. 01 ... 0 0111 11 . 0 ... 0 @1op
 VDUP             1110 1110 1 1 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=0
 VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 1 1 0000 @vdup size=1
 VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=2
+
+# multiply-add long dual accumulate
+# rdahi: bits [3:1] from insn, bit 0 is 1
+# rdalo: bits [3:1] from insn, bit 0 is 0
+%rdahi 20:3 !function=times_2_plus_1
+%rdalo 13:3 !function=times_2
+# size bit is 0 for 16 bit, 1 for 32 bit
+%size_16 16:1 !function=plus_1
+
+&vmlaldav rdahi rdalo size qn qm x a
+
+@vmlaldav        .... .... . ... ... . ... . .... .... qm:3 . \
+                 qn=%qn rdahi=%rdahi rdalo=%rdalo size=%size_16 &vmlaldav
+VMLALDAV_S       1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
+VMLALDAV_U       1111 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 8a6cb39bbff..84c67f153ee 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -503,3 +503,37 @@ DO_2OP_S(vhadds, do_vhadd_s)
 DO_2OP_U(vhaddu, do_vhadd_u)
 DO_2OP_S(vhsubs, do_vhsub_s)
 DO_2OP_U(vhsubu, do_vhsub_u)
+
+
+/*
+ * Multiply add long dual accumulate ops.
+ */
+#define DO_LDAV(OP, ESIZE, TYPE, XCHG, EVENACC, ODDACC)                 \
+    uint64_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vn,         \
+                                    void *vm, uint64_t a)               \
+    {                                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        TYPE *n = vn, *m = vm;                                          \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            if (mask & 1) {                                             \
+                if (e & 1) {                                            \
+                    a ODDACC                                            \
+                        (int64_t)n[H##ESIZE(e - 1 * XCHG)] * m[H##ESIZE(e)]; \
+                } else {                                                \
+                    a EVENACC                                           \
+                        (int64_t)n[H##ESIZE(e + 1 * XCHG)] * m[H##ESIZE(e)]; \
+                }                                                       \
+            }                                                           \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+        return a;                                                       \
+    }
+
+DO_LDAV(vmlaldavsh, 2, int16_t, false, +=, +=)
+DO_LDAV(vmlaldavxsh, 2, int16_t, true, +=, +=)
+DO_LDAV(vmlaldavsw, 4, int32_t, false, +=, +=)
+DO_LDAV(vmlaldavxsw, 4, int32_t, true, +=, +=)
+
+DO_LDAV(vmlaldavuh, 2, uint16_t, false, +=, +=)
+DO_LDAV(vmlaldavuw, 4, uint32_t, false, +=, +=)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index e4ed118cdc6..7052a4219a0 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -31,6 +31,7 @@
 typedef void MVEGenLdStFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenOneOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr);
+typedef void MVEGenDualAccOpFn(TCGv_i64, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i64);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -88,6 +89,22 @@ static void mve_update_eci(DisasContext *s)
     }
 }
 
+static bool mve_skip_first_beat(DisasContext *s)
+{
+    /* Return true if PSR.ECI says we must skip the first beat of this insn */
+    switch (s->eci) {
+    case ECI_NONE:
+        return false;
+    case ECI_A0:
+    case ECI_A0A1:
+    case ECI_A0A1A2:
+    case ECI_A0A1A2B0:
+        return true;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static bool do_ldst(DisasContext *s, arg_VLDR_VSTR *a, MVEGenLdStFn *fn)
 {
     TCGv_i32 addr;
@@ -365,3 +382,82 @@ DO_2OP(VMULL_BS, vmullbs)
 DO_2OP(VMULL_BU, vmullbu)
 DO_2OP(VMULL_TS, vmullts)
 DO_2OP(VMULL_TU, vmulltu)
+
+static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
+                             MVEGenDualAccOpFn *fn)
+{
+    TCGv_ptr qn, qm;
+    TCGv_i64 rda;
+    TCGv_i32 rdalo, rdahi;
+
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !mve_check_qreg_bank(s, a->qn | a->qm) ||
+        !fn) {
+        return false;
+    }
+    /*
+     * rdahi == 13 is UNPREDICTABLE; rdahi == 15 is a related
+     * encoding; rdalo always has bit 0 clear so cannot be 13 or 15.
+     */
+    if (a->rdahi == 13 || a->rdahi == 15) {
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qn = mve_qreg_ptr(a->qn);
+    qm = mve_qreg_ptr(a->qm);
+
+    /*
+     * This insn is subject to beat-wise execution. Partial execution
+     * of an A=0 (no-accumulate) insn which does not execute the first
+     * beat must start with the current rda value, not 0.
+     */
+    if (a->a || mve_skip_first_beat(s)) {
+        rda = tcg_temp_new_i64();
+        rdalo = load_reg(s, a->rdalo);
+        rdahi = load_reg(s, a->rdahi);
+        tcg_gen_concat_i32_i64(rda, rdalo, rdahi);
+        tcg_temp_free_i32(rdalo);
+        tcg_temp_free_i32(rdahi);
+    } else {
+        rda = tcg_const_i64(0);
+    }
+
+    fn(rda, cpu_env, qn, qm, rda);
+    tcg_temp_free_ptr(qn);
+    tcg_temp_free_ptr(qm);
+
+    rdalo = tcg_temp_new_i32();
+    rdahi = tcg_temp_new_i32();
+    tcg_gen_extrl_i64_i32(rdalo, rda);
+    tcg_gen_extrh_i64_i32(rdahi, rda);
+    store_reg(s, a->rdalo, rdalo);
+    store_reg(s, a->rdahi, rdahi);
+    tcg_temp_free_i64(rda);
+    mve_update_eci(s);
+    return true;
+}
+
+static bool trans_VMLALDAV_S(DisasContext *s, arg_vmlaldav *a)
+{
+    static MVEGenDualAccOpFn * const fns[4][2] = {
+        { NULL, NULL },
+        { gen_helper_mve_vmlaldavsh, gen_helper_mve_vmlaldavxsh },
+        { gen_helper_mve_vmlaldavsw, gen_helper_mve_vmlaldavxsw },
+        { NULL, NULL },
+    };
+    return do_long_dual_acc(s, a, fns[a->size][a->x]);
+}
+
+static bool trans_VMLALDAV_U(DisasContext *s, arg_vmlaldav *a)
+{
+    static MVEGenDualAccOpFn * const fns[4][2] = {
+        { NULL, NULL },
+        { gen_helper_mve_vmlaldavuh, NULL },
+        { gen_helper_mve_vmlaldavuw, NULL },
+        { NULL, NULL },
+    };
+    return do_long_dual_acc(s, a, fns[a->size][a->x]);
+}
-- 
2.20.1


