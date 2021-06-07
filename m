Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B85A639E4FE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:10:47 +0200 (CEST)
Received: from localhost ([::1]:34850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIly-0008Aa-Oq
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaS-0007Ua-4H
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:54 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaA-0007uc-N0
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:48 -0400
Received: by mail-wr1-x436.google.com with SMTP id o3so38696wri.8
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B/ouubpcq2OKp6jcrkf6PegX0zSxS4BaQ07JU1gDbks=;
 b=K50uImrFhNC8jNJtQkQfKKNRfyC39VUKzlUix8tteXHc37NOX9s0HLCit2ziL5RDkc
 +9Xpy5tXFu3aaT5g2rF8nffz8ICDA7PRrPCMO5lGdR58ygsvC0NIKDphfV4HW2AN8MJJ
 61A0mBH8WUo9kOewVjSmNmaz1lkh4cJD+F1s+pTNwzB0eHF/wQ58j4mKrmS2FqVtj4Bh
 YleMPBmmUENvF2q9MqOPbRKuMCsJWg+9yEHRqya+npQe+AVr8Gu2M8Gr72GJc64ykGtH
 SKn9wc2CyS9+H+MYMC+FsUDCPtvzU7cG+7OMV5rqyYBiQUPYJTFu83+/N/SlilV0XNme
 +vIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B/ouubpcq2OKp6jcrkf6PegX0zSxS4BaQ07JU1gDbks=;
 b=eQQNwHSOJEPHT2oPctxEOedtz0x437/Zb+CGoz6EGifxZQz3o1Am4JpWfu4KQ8k7hp
 YQeWeh0rncqj1KpSWLMJVeAkWLDN3fDS6E6zYHR5a6EzwkPvZ5yLwG1kZhpZGMTZUmpi
 WPMuDCsQSaX3wD8XTyzuy35TaRCUL/WGjeEwLj3UYNDwrCCD4SYk3Mv3ccJT00wuvxAH
 jWlNQNWIxVuX7pJJhtzwVRJDvxhmvcEMWS3K4e24YTdi1qSTB3fkeEXy7WWzIKZfo+UL
 RCW2QPyNwGj9nmgdePg7UMI+hezMCUjbywRpz3lbIdqHnMzJd5zBifyjC1OnJkSkbCcK
 WSWg==
X-Gm-Message-State: AOAM530kcdXYKktbkmJbeaqR7uqwCaAMEMtI5RAhq4kKjprkCjZCg90y
 3oHcOwFhiO2M5JXv3/CccTm0RA==
X-Google-Smtp-Source: ABdhPJzewPct13W0rUU972oRbST1avchhyGT0P5ayTbS76n5u2quZ6rh3xpDdkNno1qK/OHQ50m8fg==
X-Received: by 2002:adf:8bc7:: with SMTP id w7mr18995192wra.198.1623085113248; 
 Mon, 07 Jun 2021 09:58:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/55] target/arm: Implement MVE VLDR/VSTR (non-widening forms)
Date: Mon,  7 Jun 2021 17:57:37 +0100
Message-Id: <20210607165821.9892-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Implement the forms of the MVE VLDR and VSTR insns which perform
non-widening loads of bytes, halfwords or words from memory into
vector elements of the same width (encodings T5, T6, T7).

(At the moment we know for MVE and M-profile in general that
vfp_access_check() can never return false, but we include the
conventional return-true-on-failure check for consistency
with non-M-profile translation code.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/{translate-mve.c => helper-mve.h} |  21 +--
 target/arm/helper.h                          |   2 +
 target/arm/internals.h                       |  11 ++
 target/arm/mve.decode                        |  22 +++
 target/arm/mve_helper.c                      | 188 +++++++++++++++++++
 target/arm/translate-mve.c                   | 124 +++++++++++-
 target/arm/meson.build                       |   1 +
 7 files changed, 355 insertions(+), 14 deletions(-)
 copy target/arm/{translate-mve.c => helper-mve.h} (61%)
 create mode 100644 target/arm/mve_helper.c

diff --git a/target/arm/translate-mve.c b/target/arm/helper-mve.h
similarity index 61%
copy from target/arm/translate-mve.c
copy to target/arm/helper-mve.h
index c54d5cb7305..9e3b0b09afd 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/helper-mve.h
@@ -1,6 +1,6 @@
 /*
- *  ARM translation: M-profile MVE instructions
-
+ *  M-profile MVE specific helper definitions
+ *
  *  Copyright (c) 2021 Linaro, Ltd.
  *
  * This library is free software; you can redistribute it and/or
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
index 00000000000..575afce8fee
--- /dev/null
+++ b/target/arm/mve_helper.c
@@ -0,0 +1,188 @@
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
+#include "exec/helper-proto.h"
+#include "exec/cpu_ldst.h"
+#include "exec/exec-all.h"
+
+/*
+ * Note that vector data is stored in host-endian 64-bit chunks,
+ * so addressing units smaller than that needs a host-endian fixup.
+ */
+#ifdef HOST_WORDS_BIGENDIAN
+#define H1(x)  ((x) ^ 7)
+#define H2(x)  ((x) ^ 3)
+#define H4(x)  ((x) ^ 1)
+#else
+#define H1(x)  (x)
+#define H2(x)  (x)
+#define H4(x)  (x)
+#endif
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
+    uint16_t mask = extract32(env->v7m.vpr, R_V7M_VPR_P0_SHIFT,
+                              R_V7M_VPR_P0_LENGTH);
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
+    mask01 = extract32(vpr, R_V7M_VPR_MASK01_SHIFT, R_V7M_VPR_MASK01_LENGTH);
+    mask23 = extract32(vpr, R_V7M_VPR_MASK23_SHIFT, R_V7M_VPR_MASK23_LENGTH);
+    if (mask01 > 8) {
+        /* high bit set, but not 0b1000: invert the relevant half of P0 */
+        vpr ^= 0xff;
+    }
+    if (mask23 > 8) {
+        /* high bit set, but not 0b1000: invert the relevant half of P0 */
+        vpr ^= 0xff00;
+    }
+    vpr = deposit32(vpr, R_V7M_VPR_MASK01_SHIFT, R_V7M_VPR_MASK01_LENGTH,
+                    mask01 << 1);
+    vpr = deposit32(vpr, R_V7M_VPR_MASK23_SHIFT, R_V7M_VPR_MASK23_LENGTH,
+                    mask23 << 1);
+    env->v7m.vpr = vpr;
+}
+
+
+#define DO_VLDR(OP, ESIZE, LDTYPE, TYPE, H)                             \
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
+                d[H(e)] = cpu_##LDTYPE##_data_ra(env, addr, GETPC());   \
+                addr += ESIZE;                                          \
+            }                                                           \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_VSTR(OP, ESIZE, STTYPE, TYPE, H)                             \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, uint32_t addr)    \
+    {                                                                   \
+        TYPE *d = vd;                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned b, e;                                                  \
+        for (b = 0, e = 0; b < 16; b += ESIZE, e++) {                   \
+            if (mask & (1 << b)) {                                      \
+                cpu_##STTYPE##_data_ra(env, addr, d[H(e)], GETPC());    \
+                addr += ESIZE;                                          \
+            }                                                           \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_VLDR(vldrb, 1, ldub, uint8_t, H1)
+DO_VLDR(vldrh, 2, lduw, uint16_t, H2)
+DO_VLDR(vldrw, 4, ldl, uint32_t, H4)
+
+DO_VSTR(vstrb, 1, stb, uint8_t, H1)
+DO_VSTR(vstrh, 2, stw, uint16_t, H2)
+DO_VSTR(vstrw, 4, stl, uint32_t, H4)
+
+#undef DO_VLDR
+#undef DO_VSTR
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index c54d5cb7305..e8bb2372ad9 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -1,6 +1,6 @@
 /*
  *  ARM translation: M-profile MVE instructions
-
+ *
  *  Copyright (c) 2021 Linaro, Ltd.
  *
  * This library is free software; you can redistribute it and/or
@@ -27,3 +27,125 @@
 
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
+    if (!dc_isar_feature(aa32_mve, s)) {
+        return false;
+    }
+
+    if (a->qd > 7 || !fn) {
+        return false;
+    }
+
+    /* CONSTRAINED UNPREDICTABLE: we choose to UNDEF */
+    if (a->rn == 15 || (a->rn == 13 && a->w)) {
+        return false;
+    }
+
+    if (!mve_eci_check(s)) {
+        return true;
+    }
+
+    if (!vfp_access_check(s)) {
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
+    MVEGenLdStFn *ldfns[] = {
+        gen_helper_mve_vldrb,
+        gen_helper_mve_vldrh,
+        gen_helper_mve_vldrw,
+        NULL,
+    };
+    MVEGenLdStFn *stfns[] = {
+        gen_helper_mve_vstrb,
+        gen_helper_mve_vstrh,
+        gen_helper_mve_vstrw,
+        NULL,
+    };
+    return do_ldst(s, a, a->l ? ldfns[a->size] : stfns[a->size]);
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


