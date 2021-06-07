Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B18C39E52F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:20:27 +0200 (CEST)
Received: from localhost ([::1]:38124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIvG-00044u-ED
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIb3-0007we-La
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:29 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaX-00080I-S8
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:29 -0400
Received: by mail-wr1-x435.google.com with SMTP id i94so13389939wri.4
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s95am2RS5wuKuDufDPVA8xoCCTBnZq6S8YI67WY9T8o=;
 b=kXrgKgVVM5k5n+hixEgchF7AhXmzWlVK3j6aJbgnqe1xyCd/BNIPyqoC+gx4Rj9f43
 10Q4jz42FvkjLlkktOX0PhRhDOlZ+QU+aDntgJjPFYQdp4fJEXQnyWqHqYAq8mRQIVbS
 YH4G/OAoaeHZoeuhPvo59YryL00SLVvnltfOziqe4NVaUdiX+0ieUxhtRjnCjT0M/R5F
 yQShXpCHLH9+VjIcF5VNZmjSaWtrHbTiWohi/rOdDDBwL/uuEeEsGNBkqRslgoH/QZOy
 cn6RIjswzjoILAXF7ann2WOi241vuts1L0caKgdcRY2v8SKTX66BB1+K7vX/1UJqrFVM
 Vcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s95am2RS5wuKuDufDPVA8xoCCTBnZq6S8YI67WY9T8o=;
 b=FAva+YnALHhMDJaMkiKa9kv91i6e5XJVOFkXt/RU8wz7B0GMjMQxJIiuyojvq1m2Ye
 9FQO44oQFVew4Z1YL/ewTNI2nD0mBd14PWWBX93np9L/JdYH3P4LwEuTNQ+qvK96jozR
 yQxV39LYglkv4gboCCootuDAFnGgC1e5Xk3x6xtilN++9ec0pAJyJPNgi8RF++3fL0Bg
 a/Uagtb8YY2FsmUNFqaRyiCPn8bP38e9h/KduW37OV1I8DeERtFF5MEFyZ/yieE3MstC
 ya5eHHAY9pHRmp/nxgv6rqhCjk3plz+LDz60XtyZ2sh4uYEukeUpqqpSTOb67WWjHa3j
 tcew==
X-Gm-Message-State: AOAM532LNa+eSJfSI5c+oBXYBueUCjOJeLgZaq+t2pAYl4oCGV0PQJQD
 zuEU1xnlQb0r53/KAC7nhXZIxBG0uODj3pL4
X-Google-Smtp-Source: ABdhPJzndyevAyN671Il90xRzKgDw8JclPAm5KjI+mvrqsFdUSPePUD50Tfj0SonoL45cjmcplACTA==
X-Received: by 2002:adf:8bc7:: with SMTP id w7mr18995999wra.198.1623085126876; 
 Mon, 07 Jun 2021 09:58:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 29/55] target/arm: Implement MVE VMLALDAV
Date: Mon,  7 Jun 2021 17:57:55 +0100
Message-Id: <20210607165821.9892-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
---
 target/arm/helper-mve.h    |   8 +++
 target/arm/translate.h     |  10 ++++
 target/arm/mve.decode      |  15 ++++++
 target/arm/mve_helper.c    |  32 ++++++++++++
 target/arm/translate-mve.c | 100 +++++++++++++++++++++++++++++++++++++
 5 files changed, 165 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 66d31633cef..1013f6912da 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -146,3 +146,11 @@ DEF_HELPER_FLAGS_4(mve_vmulltsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
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
index 2d0c6998caa..3c7a0bac3c7 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -475,3 +475,35 @@ DO_2OP_S(vhadds, do_vhadd_s)
 DO_2OP_U(vhaddu, do_vhadd_u)
 DO_2OP_S(vhsubs, do_vhsub_s)
 DO_2OP_U(vhsubu, do_vhsub_u)
+
+
+/*
+ * Multiply add long dual accumulate ops.
+ */
+#define DO_LDAV(OP, ESIZE, TYPE, H, XCHG, EVENACC, ODDACC)              \
+    uint64_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vn,         \
+                                    void *vm, uint64_t a)               \
+    {                                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        TYPE *n = vn, *m = vm;                                          \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            if (mask & 1) {                                             \
+                if (e & 1) {                                            \
+                    a ODDACC (int64_t)n[H(e - 1 * XCHG)] * m[H(e)];     \
+                } else {                                                \
+                    a EVENACC (int64_t)n[H(e + 1 * XCHG)] * m[H(e)];    \
+                }                                                       \
+            }                                                           \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+        return a;                                                       \
+    }
+
+DO_LDAV(vmlaldavsh, 2, int16_t, H2, false, +=, +=)
+DO_LDAV(vmlaldavxsh, 2, int16_t, H2, true, +=, +=)
+DO_LDAV(vmlaldavsw, 4, int32_t, H4, false, +=, +=)
+DO_LDAV(vmlaldavxsw, 4, int32_t, H4, true, +=, +=)
+
+DO_LDAV(vmlaldavuh, 2, uint16_t, H2, false, +=, +=)
+DO_LDAV(vmlaldavuw, 4, uint32_t, H4, false, +=, +=)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index ccff7fc0ecf..03d9496f17d 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -31,6 +31,7 @@
 typedef void MVEGenLdStFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenOneOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr);
+typedef void MVEGenDualAccOpFn(TCGv_i64, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i64);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -79,6 +80,22 @@ static void mve_update_eci(DisasContext *s)
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
@@ -397,3 +414,86 @@ DO_2OP(VMULL_BS, vmullbs)
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
+    if (!fn || !dc_isar_feature(aa32_mve, s)) {
+        return false;
+    }
+    /*
+     * rdahi == 13 is UNPREDICTABLE; rdahi == 15 is a related
+     * encoding; rdalo always has bit 0 clear so cannot be 13 or 15.
+     */
+    if (a->rdahi == 13 || a->rdahi == 15) {
+        return false;
+    }
+    if (a->qn > 7 || a->qm > 7) {
+        return false;
+    }
+    if (!mve_eci_check(s)) {
+        return true;
+    }
+    if (!vfp_access_check(s)) {
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
+    MVEGenDualAccOpFn *fns[4][2] = {
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
+    MVEGenDualAccOpFn *fns[4][2] = {
+        { NULL, NULL },
+        { gen_helper_mve_vmlaldavuh, NULL },
+        { gen_helper_mve_vmlaldavuw, NULL },
+        { NULL, NULL },
+    };
+    return do_long_dual_acc(s, a, fns[a->size][a->x]);
+}
-- 
2.20.1


