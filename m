Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE55B3AB3CE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:39:49 +0200 (CEST)
Received: from localhost ([::1]:35292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrJE-00038V-RZ
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx7-0001jq-5M
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:58 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:56160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqww-00072f-Qj
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:56 -0400
Received: by mail-wm1-x32f.google.com with SMTP id c84so3277599wme.5
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L9ko7SH/PB+d1uOcGU/YCMzkTYhWuj52Dt9sWI/NGHU=;
 b=wrfR34cjNiU0kvtW3cGyMNSMHLHQjsFS1i50RiLs2PL5uSuwbHiTGyaB/riJ0PoZAo
 ccDtqrlNrbsBPbytaCikaDgRNskG+DeIAIUO/rMtrYvYPdK/Oc5wJjfO04qtJybPDPuM
 UJH93OkkL6cc0QS9/2JWliCy6XyTu/6In9QwT8+qAgolhvLTixa3CrCcxCvGB2Rd94Xf
 ZNBR3oL1t9pOOEJ3unTcZGLGoaCv9oY3eWozd7/pctOgsB01cpw1PgOvxsB9eDJY4oDf
 NO26YTuuffYUma4Z5rWwE7mvUkNNzshoCZi6vO88wAl1t3t5MSamYhdq/qiiprQ8uvsl
 vG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L9ko7SH/PB+d1uOcGU/YCMzkTYhWuj52Dt9sWI/NGHU=;
 b=oeJIEqV0A8opyZl9y9Ld97I56p9z7j5ENZq5a94Rbr3yxzFj3N8+hMi+7FuzOsbFOd
 REajh8z7a/5FfxwSL9tH8NbHM+pKeghcQvUJxnRt5kq9lkKX6mzcXfmOEJGrk47dlOBu
 YZVSpNYgZKRtRtnQWb2/xklgZsSUje5NH1k7gIdW2jAu9AHn8sMCiZKZe/huKXG7YHeE
 xqDDg+O5Tl4s2Hc9dOxTsSJiArPgrytCZPI40/XsMwobO/t4Q+pHzaZZ6k8xbNoVo2Qk
 oFqTfG6m6SkCruAJUd+kiF9/NUuMfIRhC2GCOsklMpIAbfl85nVuo4e0DQv6ZJHbPCWB
 bLGw==
X-Gm-Message-State: AOAM530uxlBMDUpyZTSpVJX9zcjjlUd8ABRxfHrv9QBxuu3YffjEq3D9
 94/6ZeuhPDlcWGenAZ8g7C6DTA==
X-Google-Smtp-Source: ABdhPJxaJ5kUnsmF7WReV0AyIySQaqqWpxYsRmdNpf7JSPX62Ia8wgedudbrbyDcZ8YiRS3ddLTzAg==
X-Received: by 2002:a05:600c:2141:: with SMTP id
 v1mr4827923wml.68.1623932205277; 
 Thu, 17 Jun 2021 05:16:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 19/44] target/arm: Implement MVE VMLALDAV
Date: Thu, 17 Jun 2021 13:16:03 +0100
Message-Id: <20210617121628.20116-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
index 4bb4b6ce02e..0c8bf9232d6 100644
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
index 1cadc3b04da..f8ceeac5a4f 100644
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


