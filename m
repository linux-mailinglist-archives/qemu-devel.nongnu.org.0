Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 690973C717B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:53:00 +0200 (CEST)
Received: from localhost ([::1]:36778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3IqJ-0002QH-Co
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbZ-0008W1-Eo
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:49 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbT-0003ff-J5
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:45 -0400
Received: by mail-wr1-x429.google.com with SMTP id d2so30571830wrn.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lF5a95h+76qUaqN85b2/xOD4AS8PIdYh9+rcTl/1F90=;
 b=oucua9Qn6TDUxkvokKcKOMGAZjyqS8NEWD9tNvIzQhDM8i+xQl7xGmP7Aj3eNscREs
 98ejT5S4MsdhsBZeU2wc9ZVcgEXX0KjN/CxOr22iJ/s2hrJK36D0DzboJo3eO2UhFCk4
 Zjw1wLQb57+D50FNECKK8TzObYgH0+mgDp5IKIaytP73fEBjgyeN8QOvlxTRWLrpjp7g
 pH5/D5KcM7QP00qg5g4Lnm1V7IRZus+EzMuFhj+DPa6i4TJFAr+b0d8WKliWO8t4gsXY
 3QcWLfdKEGXj6OOnkbLAxcfK4HgU0Xfrs+/fjOe15r5mNc6Qsowr9kfz7XxB8/zmZZUs
 ri5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lF5a95h+76qUaqN85b2/xOD4AS8PIdYh9+rcTl/1F90=;
 b=bfbs+hAmfxSP5ESbmfsTJ8Frwsz+QQ4eMztpiWvuUbHs54807FdH45mmPmUSQ8ScUS
 oJavtHMAN4IT+pgXSD5SToWakHyo7OZjKeeV6oV8weBVT+gE0AkK1Un+reT7L/vk5ZHi
 AJXmn7YZPew+wKGVWEpuWIDxqA2aIA4t/+udjnNcTAgS/tb8F8YSAVZkJGbCTARUM5MW
 mSyDgiILeVPSnU0KEOkKBXP4Y8fZvwQhNYaWTe+OY6c7TInXyUS6R/0jBB/KIQQjUY0N
 0Z3zYXQu+9vdqSjOw4RKr0ZlnugWRVoAnda6wP5p3VDERlxaWHVeJNvLgRaH8GW5TXk7
 C+dg==
X-Gm-Message-State: AOAM531W0r2lynlPgAtlMzZoJhDg3Pcw4/hRQyDMOYRWqMJJNtHftVDS
 V6sbCzBuVS9FD9/HdByY3wTZbQ==
X-Google-Smtp-Source: ABdhPJzB1LiwuLZ9A2SiEBcEpJeiaBJ7NBqI1auxUBRHw0r5yVwFU/eu+K5wI90vHnSXKZs7Zur6gA==
X-Received: by 2002:adf:e3cf:: with SMTP id k15mr5738030wrm.60.1626183458182; 
 Tue, 13 Jul 2021 06:37:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 12/34] target/arm: Implement MVE
 incrementing/decrementing dup insns
Date: Tue, 13 Jul 2021 14:37:04 +0100
Message-Id: <20210713133726.26842-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
---
 target/arm/helper-mve.h    |  16 +++++
 target/arm/mve.decode      |  25 ++++++++
 target/arm/mve_helper.c    |  64 ++++++++++++++++++++
 target/arm/translate-mve.c | 118 +++++++++++++++++++++++++++++++++++++
 4 files changed, 223 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 84adfb21517..54b252e98af 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -35,6 +35,22 @@ DEF_HELPER_FLAGS_3(mve_vstrh_w, TCG_CALL_NO_WG, void, env, ptr, i32)
 
 DEF_HELPER_FLAGS_3(mve_vdup, TCG_CALL_NO_WG, void, env, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vidupb, TCG_CALL_NO_WG, i32, env, ptr, i32, i32)
+DEF_HELPER_FLAGS_4(mve_viduph, TCG_CALL_NO_WG, i32, env, ptr, i32, i32)
+DEF_HELPER_FLAGS_4(mve_vidupw, TCG_CALL_NO_WG, i32, env, ptr, i32, i32)
+
+DEF_HELPER_FLAGS_4(mve_vddupb, TCG_CALL_NO_WG, i32, env, ptr, i32, i32)
+DEF_HELPER_FLAGS_4(mve_vdduph, TCG_CALL_NO_WG, i32, env, ptr, i32, i32)
+DEF_HELPER_FLAGS_4(mve_vddupw, TCG_CALL_NO_WG, i32, env, ptr, i32, i32)
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
index db5ec9266d1..0ef5f5d8871 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1698,3 +1698,67 @@ uint32_t HELPER(mve_sqrshr)(CPUARMState *env, uint32_t n, uint32_t shift)
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
+DO_VIDUP_ALL(vddup, DO_SUB)
+DO_VIWDUP_ALL(viwdup, do_add_wrap)
+DO_VIWDUP_ALL(vdwdup, do_sub_wrap)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index d318f34b2bc..52400864692 100644
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
@@ -1059,3 +1066,114 @@ static bool trans_VSHLC(DisasContext *s, arg_VSHLC *a)
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
+        gen_helper_mve_vddupb,
+        gen_helper_mve_vdduph,
+        gen_helper_mve_vddupw,
+        NULL,
+    };
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


