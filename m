Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A633A6A05
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:25:12 +0200 (CEST)
Received: from localhost ([::1]:49886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoSd-0004Nz-3M
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEU-0000jj-Fb
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:34 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEI-0000Ep-A5
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:34 -0400
Received: by mail-wr1-x42f.google.com with SMTP id z8so14940104wrp.12
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=etGdqOb1uW2xr0RaNdLpTFaCqymZ1zjpw7sTV4TbJRg=;
 b=goW30tvTCr685NHLjgkI7i8gJf1MRnpp29TdsmO0z2lQW/+Y0+vBTxb3JiJOI5ZxEJ
 V1Z8HetSxy2e24UbBr+9uH0f56544/siA3peyrQ4LfaMrr3IxJRaVN2uNOuK7gq63fz/
 fmW7ci5GuxpVeiNjVRDt92fYUh/8JsEPmLjWVgo8gKe/b2n4BqVMR4A8xjW/3Ie/E2LT
 kizaKj8iGPi6lmlOwYacGqvWZkrkEgkJViNeUTr0eEYGiTp26gXf3PP4ZfHqPjDimhpo
 Yn8/piJEuXwrmkD9kVMA8tfxHvy2RgU3/0gTvdRQZMLEvsuU96nAlJSAWdPX6DukERKt
 uJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=etGdqOb1uW2xr0RaNdLpTFaCqymZ1zjpw7sTV4TbJRg=;
 b=tes39NMYRpscp5ZyMm9Dij/LxknekVpzbcUIlM4hynPAsnB5830KZmT/EPJuFJJS9R
 ZX2ba/hvwm3WQtqMuldqhZpvq5ITYfSePe9RTSYRET/6oVYULcsHMMQGzrh0pqSlD2eU
 jglPjFZE3hDVvo3nCIFqLFEkq27n5xUAW/5mlDc3rvREE1weCMQNTHm8hOvBUHQKusCK
 HsOTQ4L+/w4dqTre+UubnKykkQmGDScVaw3ATno0B5m0utxB9IxalnUeKDvL+96LdEuC
 Vz2q1d5pTz0qa1kvVYrJrTxs09Eph9uVYd83+Owh3WcaZFPS5TBxMhAvAWpZu6VrXUob
 VQRA==
X-Gm-Message-State: AOAM532Az+XNm85ITtFfjhuhnqlFOeTya/mGxpS+7IXB16xeR7uE0u6j
 ulp/OTpXzgswD4eIJxyWP7r6dCixBPzgcg==
X-Google-Smtp-Source: ABdhPJwwNnXT6rfMHmAbPIlyp2Xp1DC0xso3N6g12EJsv7D5VHisgB1mcZIhZmm545cBkS+lL4yaAw==
X-Received: by 2002:a5d:67d2:: with SMTP id n18mr19257413wrw.158.1623683420663; 
 Mon, 14 Jun 2021 08:10:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 11/57] target/arm: Implement MVE VLDR/VSTR (non-widening
 forms)
Date: Mon, 14 Jun 2021 16:09:21 +0100
Message-Id: <20210614151007.4545-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

Implement the forms of the MVE VLDR and VSTR insns which perform
non-widening loads of bytes, halfwords or words from memory into
vector elements of the same width (encodings T5, T6, T7).

(At the moment we know for MVE and M-profile in general that
vfp_access_check() can never return false, but we include the
conventional return-true-on-failure check for consistency
with non-M-profile translation code.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/{translate-mve.c => helper-mve.h} |  19 +-
 target/arm/helper.h                          |   2 +
 target/arm/internals.h                       |  11 ++
 target/arm/mve.decode                        |  22 +++
 target/arm/mve_helper.c                      | 172 +++++++++++++++++++
 target/arm/translate-mve.c                   | 119 +++++++++++++
 target/arm/meson.build                       |   1 +
 7 files changed, 334 insertions(+), 12 deletions(-)
 copy target/arm/{translate-mve.c => helper-mve.h} (61%)
 create mode 100644 target/arm/mve_helper.c

diff --git a/target/arm/translate-mve.c b/target/arm/helper-mve.h
similarity index 61%
copy from target/arm/translate-mve.c
copy to target/arm/helper-mve.h
index e91f526a1a8..9e3b0b09afd 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/helper-mve.h
@@ -1,5 +1,5 @@
 /*
- *  ARM translation: M-profile MVE instructions
+ *  M-profile MVE specific helper definitions
  *
  *  Copyright (c) 2021 Linaro, Ltd.
  *
@@ -16,14 +16,9 @@
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
-
-#include "qemu/osdep.h"
-#include "tcg/tcg-op.h"
-#include "tcg/tcg-op-gvec.h"
-#include "exec/exec-all.h"
-#include "exec/gen-icount.h"
-#include "translate.h"
-#include "translate-a32.h"
-
-/* Include the generated decoder */
-#include "decode-mve.c.inc"
+DEF_HELPER_FLAGS_3(mve_vldrb, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vldrh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vldrw, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vstrb, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vstrh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vstrw, TCG_CALL_NO_WG, void, env, ptr, i32)
diff --git a/target/arm/helper.h b/target/arm/helper.h
index dc6eb96d439..db87d7d5376 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1019,3 +1019,5 @@ DEF_HELPER_FLAGS_6(gvec_bfmlal_idx, TCG_CALL_NO_RWG,
 #include "helper-a64.h"
 #include "helper-sve.h"
 #endif
+
+#include "helper-mve.h"
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 886db56b580..3ba86e8af81 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1202,4 +1202,15 @@ static inline uint64_t useronly_maybe_clean_ptr(uint32_t desc, uint64_t ptr)
     return ptr;
 }
 
+/* Values for M-profile PSR.ECI for MVE insns */
+enum MVEECIState {
+    ECI_NONE = 0, /* No completed beats */
+    ECI_A0 = 1, /* Completed: A0 */
+    ECI_A0A1 = 2, /* Completed: A0, A1 */
+    /* 3 is reserved */
+    ECI_A0A1A2 = 4, /* Completed: A0, A1, A2 */
+    ECI_A0A1A2B0 = 5, /* Completed: A0, A1, A2, B0 */
+    /* All other values reserved */
+};
+
 #endif
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index c8492bb5763..858a161fd7e 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -18,3 +18,25 @@
 #
 # This file is processed by scripts/decodetree.py
 #
+
+%qd 22:1 13:3
+
+&vldr_vstr rn qd imm p a w size l
+
+@vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd
+
+# Vector loads and stores
+
+# Non-widening loads/stores (P=0 W=0 is 'related encoding')
+VLDR_VSTR        1110110 0 a:1 . 1   . .... ... 111100 .......   @vldr_vstr \
+                 size=0 p=0 w=1
+VLDR_VSTR        1110110 0 a:1 . 1   . .... ... 111101 .......   @vldr_vstr \
+                 size=1 p=0 w=1
+VLDR_VSTR        1110110 0 a:1 . 1   . .... ... 111110 .......   @vldr_vstr \
+                 size=2 p=0 w=1
+VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111100 .......   @vldr_vstr \
+                 size=0 p=1
+VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111101 .......   @vldr_vstr \
+                 size=1 p=1
+VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111110 .......   @vldr_vstr \
+                 size=2 p=1
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
new file mode 100644
index 00000000000..c07110a145b
--- /dev/null
+++ b/target/arm/mve_helper.c
@@ -0,0 +1,172 @@
+/*
+ * M-profile MVE Operations
+ *
+ * Copyright (c) 2021 Linaro, Ltd.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+#include "vec_internal.h"
+#include "exec/helper-proto.h"
+#include "exec/cpu_ldst.h"
+#include "exec/exec-all.h"
+
+static uint16_t mve_element_mask(CPUARMState *env)
+{
+    /*
+     * Return the mask of which elements in the MVE vector should be
+     * updated. This is a combination of multiple things:
+     *  (1) by default, we update every lane in the vector
+     *  (2) VPT predication stores its state in the VPR register;
+     *  (3) low-overhead-branch tail predication will mask out part
+     *      the vector on the final iteration of the loop
+     *  (4) if EPSR.ECI is set then we must execute only some beats
+     *      of the insn
+     * We combine all these into a 16-bit result with the same semantics
+     * as VPR.P0: 0 to mask the lane, 1 if it is active.
+     * 8-bit vector ops will look at all bits of the result;
+     * 16-bit ops will look at bits 0, 2, 4, ...;
+     * 32-bit ops will look at bits 0, 4, 8 and 12.
+     * Compare pseudocode GetCurInstrBeat(), though that only returns
+     * the 4-bit slice of the mask corresponding to a single beat.
+     */
+    uint16_t mask = FIELD_EX32(env->v7m.vpr, V7M_VPR, P0);
+
+    if (!(env->v7m.vpr & R_V7M_VPR_MASK01_MASK)) {
+        mask |= 0xff;
+    }
+    if (!(env->v7m.vpr & R_V7M_VPR_MASK23_MASK)) {
+        mask |= 0xff00;
+    }
+
+    if (env->v7m.ltpsize < 4 &&
+        env->regs[14] <= (1 << (4 - env->v7m.ltpsize))) {
+        /*
+         * Tail predication active, and this is the last loop iteration.
+         * The element size is (1 << ltpsize), and we only want to process
+         * loopcount elements, so we want to retain the least significant
+         * (loopcount * esize) predicate bits and zero out bits above that.
+         */
+        int masklen = env->regs[14] << env->v7m.ltpsize;
+        assert(masklen <= 16);
+        mask &= MAKE_64BIT_MASK(0, masklen);
+    }
+
+    if ((env->condexec_bits & 0xf) == 0) {
+        /*
+         * ECI bits indicate which beats are already executed;
+         * we handle this by effectively predicating them out.
+         */
+        int eci = env->condexec_bits >> 4;
+        switch (eci) {
+        case ECI_NONE:
+            break;
+        case ECI_A0:
+            mask &= 0xfff0;
+            break;
+        case ECI_A0A1:
+            mask &= 0xff00;
+            break;
+        case ECI_A0A1A2:
+        case ECI_A0A1A2B0:
+            mask &= 0xf000;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
+
+    return mask;
+}
+
+static void mve_advance_vpt(CPUARMState *env)
+{
+    /* Advance the VPT and ECI state if necessary */
+    uint32_t vpr = env->v7m.vpr;
+    unsigned mask01, mask23;
+
+    if ((env->condexec_bits & 0xf) == 0) {
+        env->condexec_bits = (env->condexec_bits == (ECI_A0A1A2B0 << 4)) ?
+            (ECI_A0 << 4) : (ECI_NONE << 4);
+    }
+
+    if (!(vpr & (R_V7M_VPR_MASK01_MASK | R_V7M_VPR_MASK23_MASK))) {
+        /* VPT not enabled, nothing to do */
+        return;
+    }
+
+    mask01 = FIELD_EX32(vpr, V7M_VPR, MASK01);
+    mask23 = FIELD_EX32(vpr, V7M_VPR, MASK23);
+    if (mask01 > 8) {
+        /* high bit set, but not 0b1000: invert the relevant half of P0 */
+        vpr ^= 0xff;
+    }
+    if (mask23 > 8) {
+        /* high bit set, but not 0b1000: invert the relevant half of P0 */
+        vpr ^= 0xff00;
+    }
+    vpr = FIELD_DP32(vpr, V7M_VPR, MASK01, mask01 << 1);
+    vpr = FIELD_DP32(vpr, V7M_VPR, MASK23, mask23 << 1);
+    env->v7m.vpr = vpr;
+}
+
+
+#define DO_VLDR(OP, LDTYPE, ESIZE, TYPE)                                \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, uint32_t addr)    \
+    {                                                                   \
+        TYPE *d = vd;                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned b, e;                                                  \
+        /*                                                              \
+         * R_SXTM allows the dest reg to become UNKNOWN for abandoned   \
+         * beats so we don't care if we update part of the dest and     \
+         * then take an exception.                                      \
+         */                                                             \
+        for (b = 0, e = 0; b < 16; b += ESIZE, e++) {                   \
+            if (mask & (1 << b)) {                                      \
+                d[H##ESIZE(e)] = cpu_##LDTYPE##_data_ra(env, addr, GETPC()); \
+                addr += ESIZE;                                          \
+            }                                                           \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_VSTR(OP, STTYPE, ESIZE, TYPE)                                \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, uint32_t addr)    \
+    {                                                                   \
+        TYPE *d = vd;                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned b, e;                                                  \
+        for (b = 0, e = 0; b < 16; b += ESIZE, e++) {                   \
+            if (mask & (1 << b)) {                                      \
+                cpu_##STTYPE##_data_ra(env, addr, d[H##ESIZE(e)], GETPC()); \
+                addr += ESIZE;                                          \
+            }                                                           \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_VLDR(vldrb, ldub, 1, uint8_t)
+DO_VLDR(vldrh, lduw, 2, uint16_t)
+DO_VLDR(vldrw, ldl, 4, uint32_t)
+
+DO_VSTR(vstrb, stb, 1, uint8_t)
+DO_VSTR(vstrh, stw, 2, uint16_t)
+DO_VSTR(vstrw, stl, 4, uint32_t)
+
+#undef DO_VLDR
+#undef DO_VSTR
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index e91f526a1a8..f98bd6d038d 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -27,3 +27,122 @@
 
 /* Include the generated decoder */
 #include "decode-mve.c.inc"
+
+typedef void MVEGenLdStFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
+
+/* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
+static inline long mve_qreg_offset(unsigned reg)
+{
+    return offsetof(CPUARMState, vfp.zregs[reg].d[0]);
+}
+
+static TCGv_ptr mve_qreg_ptr(unsigned reg)
+{
+    TCGv_ptr ret = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(ret, cpu_env, mve_qreg_offset(reg));
+    return ret;
+}
+
+static bool mve_check_qreg_bank(DisasContext *s, int qmask)
+{
+    /*
+     * Check whether Qregs are in range. For v8.1M only Q0..Q7
+     * are supported, see VFPSmallRegisterBank().
+     */
+    return qmask < 8;
+}
+
+static bool mve_eci_check(DisasContext *s)
+{
+    /*
+     * This is a beatwise insn: check that ECI is valid (not a
+     * reserved value) and note that we are handling it.
+     * Return true if OK, false if we generated an exception.
+     */
+    s->eci_handled = true;
+    switch (s->eci) {
+    case ECI_NONE:
+    case ECI_A0:
+    case ECI_A0A1:
+    case ECI_A0A1A2:
+    case ECI_A0A1A2B0:
+        return true;
+    default:
+        /* Reserved value: INVSTATE UsageFault */
+        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
+                           default_exception_el(s));
+        return false;
+    }
+}
+
+static void mve_update_eci(DisasContext *s)
+{
+    /*
+     * The helper function will always update the CPUState field,
+     * so we only need to update the DisasContext field.
+     */
+    if (s->eci) {
+        s->eci = (s->eci == ECI_A0A1A2B0) ? ECI_A0 : ECI_NONE;
+    }
+}
+
+static bool do_ldst(DisasContext *s, arg_VLDR_VSTR *a, MVEGenLdStFn *fn)
+{
+    TCGv_i32 addr;
+    uint32_t offset;
+    TCGv_ptr qreg;
+
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !mve_check_qreg_bank(s, a->qd) ||
+        !fn) {
+        return false;
+    }
+
+    /* CONSTRAINED UNPREDICTABLE: we choose to UNDEF */
+    if (a->rn == 15 || (a->rn == 13 && a->w)) {
+        return false;
+    }
+
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    offset = a->imm << a->size;
+    if (!a->a) {
+        offset = -offset;
+    }
+    addr = load_reg(s, a->rn);
+    if (a->p) {
+        tcg_gen_addi_i32(addr, addr, offset);
+    }
+
+    qreg = mve_qreg_ptr(a->qd);
+    fn(cpu_env, qreg, addr);
+    tcg_temp_free_ptr(qreg);
+
+    /*
+     * Writeback always happens after the last beat of the insn,
+     * regardless of predication
+     */
+    if (a->w) {
+        if (!a->p) {
+            tcg_gen_addi_i32(addr, addr, offset);
+        }
+        store_reg(s, a->rn, addr);
+    } else {
+        tcg_temp_free_i32(addr);
+    }
+    mve_update_eci(s);
+    return true;
+}
+
+static bool trans_VLDR_VSTR(DisasContext *s, arg_VLDR_VSTR *a)
+{
+    static MVEGenLdStFn * const ldstfns[4][2] = {
+        { gen_helper_mve_vstrb, gen_helper_mve_vldrb },
+        { gen_helper_mve_vstrh, gen_helper_mve_vldrh },
+        { gen_helper_mve_vstrw, gen_helper_mve_vldrw },
+        { NULL, NULL }
+    };
+    return do_ldst(s, a, ldstfns[a->size][a->l]);
+}
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 2b50be3f862..25a02bf2769 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -23,6 +23,7 @@ arm_ss.add(files(
   'helper.c',
   'iwmmxt_helper.c',
   'm_helper.c',
+  'mve_helper.c',
   'neon_helper.c',
   'op_helper.c',
   'tlb_helper.c',
-- 
2.20.1


