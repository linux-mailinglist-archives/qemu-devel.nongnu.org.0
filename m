Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5F43F7373
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:38:51 +0200 (CEST)
Received: from localhost ([::1]:48466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqJ0-0002tg-6T
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqG5-00037P-9p
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:49 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqG2-0005MF-W9
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:49 -0400
Received: by mail-wr1-x435.google.com with SMTP id q14so1524262wrp.3
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sBt+Er2ORY6pTVXoQlImPIKKZV4cWhSFl3FktQ7/5BI=;
 b=iTb8HlsD8UjuMuHWal30LixJro95RcJe0k/+nB/SoE5kR7GwM3XDmCLFzh0tjhBUm6
 y1R6G2kUr4HFXotvVX69RkmTtGNk/AaGTdRrvBrDf+fSDJ7nLMxCSlhOnvUGpdVv9evn
 p1F3U18QKVpvlCUwRp3ortbqyiqY3wyNlP80HXZsn8BPneUFz512cTNr70ADjAgd5haV
 84DZ5LnH6xzPr7CjBXoqnsWBBHL2KACT3XOeYT98DRM2hruswMbmA2D57rOHu/+HD9HA
 O/bXikRA4XWymfT4F1a7se6dORRcaMO18XYSoMNj2f0ZW3W4P9tQC45/Lsvr8Ckp1aay
 OyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sBt+Er2ORY6pTVXoQlImPIKKZV4cWhSFl3FktQ7/5BI=;
 b=sGxjglcNukNoRa4+D/HR/pLDFs6QCm3oFlnXb5Bft30Qr7MrNzzSnr1dPg8X8P9h3Y
 XlKb4/RSIXrdygPdlYBvzJhkBUK0RPWuzXTyAwnBe9rPyOvwKSVDX3TCNpCf81skCCzn
 a0nK7+MjimvZbkdGjtfCwplt7pNTDrf24MiG4kUW8HFmLeAQL0kW99u+UI62cmcB1G+v
 qJia5fouzlbUP1yV8KXdsXXFo7FOUndUlWRcT6mYeHdVsCjbk+1O2PsOiEuCMcI3dk44
 xT0L4aXkgKjzZaOQbsfe/AT9OCisbfL0aVUOH7jBqnxez818GP8OojH/Ecl4miH/XNWS
 8TUg==
X-Gm-Message-State: AOAM532owcBUbClowgaqfEpK3157+jDLr+hTtR+y07n3fRxcOvHZJz05
 mdeqP8UjrKs+WyYHQlO3fVIE+AwB7FV6Eg==
X-Google-Smtp-Source: ABdhPJzGrcTpnESnKrheK7diQmHOjWesloKUyNSme8I7XGrZUZ8dtr0KK9t2S8PmKR3Vm5pzNK4u5Q==
X-Received: by 2002:a5d:490d:: with SMTP id x13mr22970924wrq.412.1629887745469; 
 Wed, 25 Aug 2021 03:35:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/44] target/arm: Implement MVE incrementing/decrementing dup
 insns
Date: Wed, 25 Aug 2021 11:35:03 +0100
Message-Id: <20210825103534.6936-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
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


