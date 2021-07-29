Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9595C3DA25C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:44:01 +0200 (CEST)
Received: from localhost ([::1]:43972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94SG-0005aR-L3
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941P-0001IS-Sv
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:18 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940x-0001KS-0E
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:13 -0400
Received: by mail-wr1-x42f.google.com with SMTP id g15so6471764wrd.3
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=18c+niiJ2qq4FpsY7Q8PYylK5MV+mVE5cLUI6DQNoOs=;
 b=h2gNEgjx7rLVKscBQ79c85/cpjkTRX4cn4HBuvi2HOL9BCxvewpO1F0/FIGGP9+V77
 v/sSLP0guVWrwQDc1u/iJd8wZPdWzC3kkgWcwGa8971dvrsgkvEZ7Q4incL55J9tRCrY
 Lf4OKDkJWmdCYV76DpNIfTcc/mlCrpArcyZvTIoE7nlQa8Oas+wrHW2pgf4nbxBgPa1P
 Mc/BYLE4lH4gnt95m4Gx6tWzf8d9EWAzq0xQ1l8k+03zuk69FLyeBITOYYWSCE78da2k
 r/MoJYdH1FPhQ9H6GRdW4jMkXTinBqWL8gui+zsS5LH/Y0BAPXI+x5K4ZmOpsVzt1qAb
 iygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=18c+niiJ2qq4FpsY7Q8PYylK5MV+mVE5cLUI6DQNoOs=;
 b=ejOKyvDdQuVEfGrjHQ3crKUkO+QvnZW6CRGfC9qCsDlk56qDZEL4sGNO/N5EqvxLom
 CiB3wBCp4gQ2uFYfL0F9tcF0s09eLGuY6syqsMSATIEAA0XPVTyk3ZWpQj5ejV2VF+ia
 5BmHWXDlqYp1USgfWWFDRKpQdVQbpT8wNtKMB/2NRl+PPD8J5d2zjQHPmoYh12x2L1Fn
 QHjmtQMALIvV5y07fAdxl9XWUpHF6vorXSc7+/ejJiYIARFMEi5yFIkAaRB3v+oNVmpz
 jcXSVvQ5Se+rvnV7KPDWkorYBXWGmcfk7JqHkw+Mw+zN9m9D9VinSVtf/Neinqtc4dO9
 YCGw==
X-Gm-Message-State: AOAM532GMnbxuB2jRo8SklT1Qd/Y3UB2LRWZvlU1yBa+wCrjPoDBpvlD
 XLybHrWsFFHoBGNPWEvnncz9fbO/qyRH4g==
X-Google-Smtp-Source: ABdhPJwdYPgCO91Skk8SkRGVsgwH9sZ8bWRWXhsG3E9FeV1rRRAq5WzefA++oLYqsNZMsLlQ6EWQZQ==
X-Received: by 2002:a5d:6c63:: with SMTP id r3mr2821671wrz.405.1627557344275; 
 Thu, 29 Jul 2021 04:15:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 35/53] target/arm: Implement MVE interleaving
 loads/stores
Date: Thu, 29 Jul 2021 12:14:54 +0100
Message-Id: <20210729111512.16541-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE interleaving load/store functions VLD2, VLD4, VST2
and VST4.  VLD2 loads 16 bytes of data from memory and writes to 2
consecutive Qregs; VLD4 loads 16 bytes of data from memory and writes
to 4 consecutive Qregs.  The 'pattern' field in the encoding
determines the offset into memory which is accessed and also which
elements in the Qregs are written to.  (The intention is that a
sequence of four consecutive VLD4 with different pattern values
performs a complete de-interleaving load of 64 bytes into all
elements of the 4 Qregs.) VST2 and VST4 do the same, but for stores.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
I found the pseudocode description of these instructions pretty
hard to follow, because (1) it is written to be generic over all
sizes and pattern values and beat counts and (2) it accesses
the vector elements by (Qreg number, beat within Qreg, element
within beat). I ended up writing a little program to print out the
various intermediate numbers and also calculate "index of element
within the whole Qreg", which is what QEMU wants to access
elements by. You can find that here:
  https://people.linaro.org/~peter.maydell/ldinter.c
I then just stared at the numbers for each (pattern, esize)
specialization and tried to come up with something that does
less gluing together of random bits from curBeat, pattern and
e than the pseudocode...
---
 target/arm/helper-mve.h    |  48 ++++++
 target/arm/mve.decode      |  11 ++
 target/arm/mve_helper.c    | 342 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  94 ++++++++++
 4 files changed, 495 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index a85a7e1b75d..3db9b15f121 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -70,6 +70,54 @@ DEF_HELPER_FLAGS_4(mve_vldrd_sg_wb_ud, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vstrw_sg_wb_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vstrd_sg_wb_ud, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(mve_vld20b, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vld20h, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vld20w, TCG_CALL_NO_WG, void, env, i32, i32)
+
+DEF_HELPER_FLAGS_3(mve_vld21b, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vld21h, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vld21w, TCG_CALL_NO_WG, void, env, i32, i32)
+
+DEF_HELPER_FLAGS_3(mve_vld40b, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vld40h, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vld40w, TCG_CALL_NO_WG, void, env, i32, i32)
+
+DEF_HELPER_FLAGS_3(mve_vld41b, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vld41h, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vld41w, TCG_CALL_NO_WG, void, env, i32, i32)
+
+DEF_HELPER_FLAGS_3(mve_vld42b, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vld42h, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vld42w, TCG_CALL_NO_WG, void, env, i32, i32)
+
+DEF_HELPER_FLAGS_3(mve_vld43b, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vld43h, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vld43w, TCG_CALL_NO_WG, void, env, i32, i32)
+
+DEF_HELPER_FLAGS_3(mve_vst20b, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vst20h, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vst20w, TCG_CALL_NO_WG, void, env, i32, i32)
+
+DEF_HELPER_FLAGS_3(mve_vst21b, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vst21h, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vst21w, TCG_CALL_NO_WG, void, env, i32, i32)
+
+DEF_HELPER_FLAGS_3(mve_vst40b, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vst40h, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vst40w, TCG_CALL_NO_WG, void, env, i32, i32)
+
+DEF_HELPER_FLAGS_3(mve_vst41b, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vst41h, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vst41w, TCG_CALL_NO_WG, void, env, i32, i32)
+
+DEF_HELPER_FLAGS_3(mve_vst42b, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vst42h, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vst42w, TCG_CALL_NO_WG, void, env, i32, i32)
+
+DEF_HELPER_FLAGS_3(mve_vst43b, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vst43h, TCG_CALL_NO_WG, void, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_vst43w, TCG_CALL_NO_WG, void, env, i32, i32)
+
 DEF_HELPER_FLAGS_3(mve_vdup, TCG_CALL_NO_WG, void, env, ptr, i32)
 
 DEF_HELPER_FLAGS_4(mve_vidupb, TCG_CALL_NO_WG, i32, env, ptr, i32, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 48882dd7f38..87446816293 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -44,6 +44,7 @@
 &vabav qn qm rda size
 &vldst_sg qd qm rn size msize os
 &vldst_sg_imm qd qm a w imm
+&vldst_il qd rn size pat w
 
 # scatter-gather memory size is in bits 6:4
 %sg_msize 6:1 4:1
@@ -59,6 +60,10 @@
 @vldst_sg_imm .... .... a:1 . w:1 . .... .... .... . imm:7 &vldst_sg_imm \
               qd=%qd qm=%qn
 
+# Deinterleaving load/interleaving store
+@vldst_il .... .... .. w:1 . rn:4 .... ... size:2 pat:2 ..... &vldst_il \
+          qd=%qd
+
 @1op .... .... .... size:2 .. .... .... .... .... &1op qd=%qd qm=%qm
 @1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
 @2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
@@ -158,6 +163,12 @@ VLDRD_sg_imm     111 1 1101 ... 1 ... 0 ... 1 1111 .... .... @vldst_sg_imm
 VSTRW_sg_imm     111 1 1101 ... 0 ... 0 ... 1 1110 .... .... @vldst_sg_imm
 VSTRD_sg_imm     111 1 1101 ... 0 ... 0 ... 1 1111 .... .... @vldst_sg_imm
 
+# deinterleaving loads/interleaving stores
+VLD2             1111 1100 1 .. 1 .... ... 1 111 .. .. 00000 @vldst_il
+VLD4             1111 1100 1 .. 1 .... ... 1 111 .. .. 00001 @vldst_il
+VST2             1111 1100 1 .. 0 .... ... 1 111 .. .. 00000 @vldst_il
+VST4             1111 1100 1 .. 0 .... ... 1 111 .. .. 00001 @vldst_il
+
 # Moves between 2 32-bit vector lanes and 2 general purpose registers
 VMOV_to_2gp      1110 1100 0 . 00 rt2:4 ... 0 1111 000 idx:1 rt:4 qd=%qd
 VMOV_from_2gp    1110 1100 0 . 01 rt2:4 ... 0 1111 000 idx:1 rt:4 qd=%qd
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index bbbaa538074..c2826eb5f9f 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -362,6 +362,348 @@ DO_VLDR64_SG(vldrd_sg_wb_ud, ADDR_ADD, true)
 DO_VSTR_SG(vstrw_sg_wb_uw, stl, 4, uint32_t, ADDR_ADD, true)
 DO_VSTR64_SG(vstrd_sg_wb_ud, ADDR_ADD, true)
 
+/*
+ * Deinterleaving loads/interleaving stores.
+ *
+ * For these helpers we are passed the index of the first Qreg
+ * (VLD2/VST2 will also access Qn+1, VLD4/VST4 access Qn .. Qn+3)
+ * and the value of the base address register Rn.
+ * The helpers are specialized for pattern and element size, so
+ * for instance vld42h is VLD4 with pattern 2, element size MO_16.
+ *
+ * These insns are beatwise but not predicated, so we must honour ECI,
+ * but need not look at mve_element_mask().
+ *
+ * The pseudocode implements these insns with multiple memory accesses
+ * of the element size, but rules R_VVVG and R_FXDM permit us to make
+ * one 32-bit memory access per beat.
+ */
+#define DO_VLD4B(OP, O1, O2, O3, O4)                                    \
+    void HELPER(mve_##OP)(CPUARMState *env, uint32_t qnidx,             \
+                          uint32_t base)                                \
+    {                                                                   \
+        int beat, e;                                                    \
+        uint16_t mask = mve_eci_mask(env);                              \
+        static const uint8_t off[4] = { O1, O2, O3, O4 };               \
+        uint32_t addr, data;                                            \
+        for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
+            if ((mask & 1) == 0) {                                      \
+                /* ECI says skip this beat */                           \
+                continue;                                               \
+            }                                                           \
+            addr = base + off[beat] * 4;                                \
+            data = cpu_ldl_le_data_ra(env, addr, GETPC());              \
+            for (e = 0; e < 4; e++, data >>= 8) {                       \
+                uint8_t *qd = (uint8_t *)aa32_vfp_qreg(env, qnidx + e); \
+                qd[H1(off[beat])] = data;                               \
+            }                                                           \
+        }                                                               \
+    }
+
+#define DO_VLD4H(OP, O1, O2)                                            \
+    void HELPER(mve_##OP)(CPUARMState *env, uint32_t qnidx,             \
+                          uint32_t base)                                \
+    {                                                                   \
+        int beat;                                                       \
+        uint16_t mask = mve_eci_mask(env);                              \
+        static const uint8_t off[4] = { O1, O1, O2, O2 };               \
+        uint32_t addr, data;                                            \
+        int y; /* y counts 0 2 0 2 */                                   \
+        uint16_t *qd;                                                   \
+        for (beat = 0, y = 0; beat < 4; beat++, mask >>= 4, y ^= 2) {   \
+            if ((mask & 1) == 0) {                                      \
+                /* ECI says skip this beat */                           \
+                continue;                                               \
+            }                                                           \
+            addr = base + off[beat] * 8 + (beat & 1) * 4;               \
+            data = cpu_ldl_le_data_ra(env, addr, GETPC());              \
+            qd = (uint16_t *)aa32_vfp_qreg(env, qnidx + y);             \
+            qd[H2(off[beat])] = data;                                   \
+            data >>= 16;                                                \
+            qd = (uint16_t *)aa32_vfp_qreg(env, qnidx + y + 1);         \
+            qd[H2(off[beat])] = data;                                   \
+        }                                                               \
+    }
+
+#define DO_VLD4W(OP, O1, O2, O3, O4)                                    \
+    void HELPER(mve_##OP)(CPUARMState *env, uint32_t qnidx,             \
+                          uint32_t base)                                \
+    {                                                                   \
+        int beat;                                                       \
+        uint16_t mask = mve_eci_mask(env);                              \
+        static const uint8_t off[4] = { O1, O2, O3, O4 };               \
+        uint32_t addr, data;                                            \
+        uint32_t *qd;                                                   \
+        int y;                                                          \
+        for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
+            if ((mask & 1) == 0) {                                      \
+                /* ECI says skip this beat */                           \
+                continue;                                               \
+            }                                                           \
+            addr = base + off[beat] * 4;                                \
+            data = cpu_ldl_le_data_ra(env, addr, GETPC());              \
+            y = (beat + (O1 & 2)) & 3;                                  \
+            qd = (uint32_t *)aa32_vfp_qreg(env, qnidx + y);             \
+            qd[H4(off[beat] >> 2)] = data;                              \
+        }                                                               \
+    }
+
+DO_VLD4B(vld40b, 0, 1, 10, 11)
+DO_VLD4B(vld41b, 2, 3, 12, 13)
+DO_VLD4B(vld42b, 4, 5, 14, 15)
+DO_VLD4B(vld43b, 6, 7, 8, 9)
+
+DO_VLD4H(vld40h, 0, 5)
+DO_VLD4H(vld41h, 1, 6)
+DO_VLD4H(vld42h, 2, 7)
+DO_VLD4H(vld43h, 3, 4)
+
+DO_VLD4W(vld40w, 0, 1, 10, 11)
+DO_VLD4W(vld41w, 2, 3, 12, 13)
+DO_VLD4W(vld42w, 4, 5, 14, 15)
+DO_VLD4W(vld43w, 6, 7, 8, 9)
+
+#define DO_VLD2B(OP, O1, O2, O3, O4)                                    \
+    void HELPER(mve_##OP)(CPUARMState *env, uint32_t qnidx,             \
+                          uint32_t base)                                \
+    {                                                                   \
+        int beat, e;                                                    \
+        uint16_t mask = mve_eci_mask(env);                              \
+        static const uint8_t off[4] = { O1, O2, O3, O4 };               \
+        uint32_t addr, data;                                            \
+        uint8_t *qd;                                                    \
+        for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
+            if ((mask & 1) == 0) {                                      \
+                /* ECI says skip this beat */                           \
+                continue;                                               \
+            }                                                           \
+            addr = base + off[beat] * 2;                                \
+            data = cpu_ldl_le_data_ra(env, addr, GETPC());              \
+            for (e = 0; e < 4; e++, data >>= 8) {                       \
+                qd = (uint8_t *)aa32_vfp_qreg(env, qnidx + (e & 1));    \
+                qd[H1(off[beat] + (e >> 1))] = data;                    \
+            }                                                           \
+        }                                                               \
+    }
+
+#define DO_VLD2H(OP, O1, O2, O3, O4)                                    \
+    void HELPER(mve_##OP)(CPUARMState *env, uint32_t qnidx,             \
+                          uint32_t base)                                \
+    {                                                                   \
+        int beat;                                                       \
+        uint16_t mask = mve_eci_mask(env);                              \
+        static const uint8_t off[4] = { O1, O2, O3, O4 };               \
+        uint32_t addr, data;                                            \
+        int e;                                                          \
+        uint16_t *qd;                                                   \
+        for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
+            if ((mask & 1) == 0) {                                      \
+                /* ECI says skip this beat */                           \
+                continue;                                               \
+            }                                                           \
+            addr = base + off[beat] * 4;                                \
+            data = cpu_ldl_le_data_ra(env, addr, GETPC());              \
+            for (e = 0; e < 2; e++, data >>= 16) {                      \
+                qd = (uint16_t *)aa32_vfp_qreg(env, qnidx + e);         \
+                qd[H2(off[beat])] = data;                               \
+            }                                                           \
+        }                                                               \
+    }
+
+#define DO_VLD2W(OP, O1, O2, O3, O4)                                    \
+    void HELPER(mve_##OP)(CPUARMState *env, uint32_t qnidx,             \
+                          uint32_t base)                                \
+    {                                                                   \
+        int beat;                                                       \
+        uint16_t mask = mve_eci_mask(env);                              \
+        static const uint8_t off[4] = { O1, O2, O3, O4 };               \
+        uint32_t addr, data;                                            \
+        uint32_t *qd;                                                   \
+        for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
+            if ((mask & 1) == 0) {                                      \
+                /* ECI says skip this beat */                           \
+                continue;                                               \
+            }                                                           \
+            addr = base + off[beat];                                    \
+            data = cpu_ldl_le_data_ra(env, addr, GETPC());              \
+            qd = (uint32_t *)aa32_vfp_qreg(env, qnidx + (beat & 1));    \
+            qd[H4(off[beat] >> 3)] = data;                              \
+        }                                                               \
+    }
+
+DO_VLD2B(vld20b, 0, 2, 12, 14)
+DO_VLD2B(vld21b, 4, 6, 8, 10)
+
+DO_VLD2H(vld20h, 0, 1, 6, 7)
+DO_VLD2H(vld21h, 2, 3, 4, 5)
+
+DO_VLD2W(vld20w, 0, 4, 24, 28)
+DO_VLD2W(vld21w, 8, 12, 16, 20)
+
+#define DO_VST4B(OP, O1, O2, O3, O4)                                    \
+    void HELPER(mve_##OP)(CPUARMState *env, uint32_t qnidx,             \
+                          uint32_t base)                                \
+    {                                                                   \
+        int beat, e;                                                    \
+        uint16_t mask = mve_eci_mask(env);                              \
+        static const uint8_t off[4] = { O1, O2, O3, O4 };               \
+        uint32_t addr, data;                                            \
+        for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
+            if ((mask & 1) == 0) {                                      \
+                /* ECI says skip this beat */                           \
+                continue;                                               \
+            }                                                           \
+            addr = base + off[beat] * 4;                                \
+            data = 0;                                                   \
+            for (e = 3; e >= 0; e--) {                                  \
+                uint8_t *qd = (uint8_t *)aa32_vfp_qreg(env, qnidx + e); \
+                data = (data << 8) | qd[H1(off[beat])];                 \
+            }                                                           \
+            cpu_stl_le_data_ra(env, addr, data, GETPC());               \
+        }                                                               \
+    }
+
+#define DO_VST4H(OP, O1, O2)                                            \
+    void HELPER(mve_##OP)(CPUARMState *env, uint32_t qnidx,             \
+                          uint32_t base)                                \
+    {                                                                   \
+        int beat;                                                       \
+        uint16_t mask = mve_eci_mask(env);                              \
+        static const uint8_t off[4] = { O1, O1, O2, O2 };               \
+        uint32_t addr, data;                                            \
+        int y; /* y counts 0 2 0 2 */                                   \
+        uint16_t *qd;                                                   \
+        for (beat = 0, y = 0; beat < 4; beat++, mask >>= 4, y ^= 2) {   \
+            if ((mask & 1) == 0) {                                      \
+                /* ECI says skip this beat */                           \
+                continue;                                               \
+            }                                                           \
+            addr = base + off[beat] * 8 + (beat & 1) * 4;               \
+            qd = (uint16_t *)aa32_vfp_qreg(env, qnidx + y);             \
+            data = qd[H2(off[beat])];                                   \
+            qd = (uint16_t *)aa32_vfp_qreg(env, qnidx + y + 1);         \
+            data |= qd[H2(off[beat])] << 16;                            \
+            cpu_stl_le_data_ra(env, addr, data, GETPC());               \
+        }                                                               \
+    }
+
+#define DO_VST4W(OP, O1, O2, O3, O4)                                    \
+    void HELPER(mve_##OP)(CPUARMState *env, uint32_t qnidx,             \
+                          uint32_t base)                                \
+    {                                                                   \
+        int beat;                                                       \
+        uint16_t mask = mve_eci_mask(env);                              \
+        static const uint8_t off[4] = { O1, O2, O3, O4 };               \
+        uint32_t addr, data;                                            \
+        uint32_t *qd;                                                   \
+        int y;                                                          \
+        for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
+            if ((mask & 1) == 0) {                                      \
+                /* ECI says skip this beat */                           \
+                continue;                                               \
+            }                                                           \
+            addr = base + off[beat] * 4;                                \
+            y = (beat + (O1 & 2)) & 3;                                  \
+            qd = (uint32_t *)aa32_vfp_qreg(env, qnidx + y);             \
+            data = qd[H4(off[beat] >> 2)];                              \
+            cpu_stl_le_data_ra(env, addr, data, GETPC());               \
+        }                                                               \
+    }
+
+DO_VST4B(vst40b, 0, 1, 10, 11)
+DO_VST4B(vst41b, 2, 3, 12, 13)
+DO_VST4B(vst42b, 4, 5, 14, 15)
+DO_VST4B(vst43b, 6, 7, 8, 9)
+
+DO_VST4H(vst40h, 0, 5)
+DO_VST4H(vst41h, 1, 6)
+DO_VST4H(vst42h, 2, 7)
+DO_VST4H(vst43h, 3, 4)
+
+DO_VST4W(vst40w, 0, 1, 10, 11)
+DO_VST4W(vst41w, 2, 3, 12, 13)
+DO_VST4W(vst42w, 4, 5, 14, 15)
+DO_VST4W(vst43w, 6, 7, 8, 9)
+
+#define DO_VST2B(OP, O1, O2, O3, O4)                                    \
+    void HELPER(mve_##OP)(CPUARMState *env, uint32_t qnidx,             \
+                          uint32_t base)                                \
+    {                                                                   \
+        int beat, e;                                                    \
+        uint16_t mask = mve_eci_mask(env);                              \
+        static const uint8_t off[4] = { O1, O2, O3, O4 };               \
+        uint32_t addr, data;                                            \
+        uint8_t *qd;                                                    \
+        for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
+            if ((mask & 1) == 0) {                                      \
+                /* ECI says skip this beat */                           \
+                continue;                                               \
+            }                                                           \
+            addr = base + off[beat] * 2;                                \
+            data = 0;                                                   \
+            for (e = 3; e >= 0; e--) {                                  \
+                qd = (uint8_t *)aa32_vfp_qreg(env, qnidx + (e & 1));    \
+                data = (data << 8) | qd[H1(off[beat] + (e >> 1))];      \
+            }                                                           \
+            cpu_stl_le_data_ra(env, addr, data, GETPC());               \
+        }                                                               \
+    }
+
+#define DO_VST2H(OP, O1, O2, O3, O4)                                    \
+    void HELPER(mve_##OP)(CPUARMState *env, uint32_t qnidx,             \
+                          uint32_t base)                                \
+    {                                                                   \
+        int beat;                                                       \
+        uint16_t mask = mve_eci_mask(env);                              \
+        static const uint8_t off[4] = { O1, O2, O3, O4 };               \
+        uint32_t addr, data;                                            \
+        int e;                                                          \
+        uint16_t *qd;                                                   \
+        for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
+            if ((mask & 1) == 0) {                                      \
+                /* ECI says skip this beat */                           \
+                continue;                                               \
+            }                                                           \
+            addr = base + off[beat] * 4;                                \
+            data = 0;                                                   \
+            for (e = 1; e >= 0; e--) {                                  \
+                qd = (uint16_t *)aa32_vfp_qreg(env, qnidx + e);         \
+                data = (data << 16) | qd[H2(off[beat])];                \
+            }                                                           \
+            cpu_stl_le_data_ra(env, addr, data, GETPC());               \
+        }                                                               \
+    }
+
+#define DO_VST2W(OP, O1, O2, O3, O4)                                    \
+    void HELPER(mve_##OP)(CPUARMState *env, uint32_t qnidx,             \
+                          uint32_t base)                                \
+    {                                                                   \
+        int beat;                                                       \
+        uint16_t mask = mve_eci_mask(env);                              \
+        static const uint8_t off[4] = { O1, O2, O3, O4 };               \
+        uint32_t addr, data;                                            \
+        uint32_t *qd;                                                   \
+        for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
+            if ((mask & 1) == 0) {                                      \
+                /* ECI says skip this beat */                           \
+                continue;                                               \
+            }                                                           \
+            addr = base + off[beat];                                    \
+            qd = (uint32_t *)aa32_vfp_qreg(env, qnidx + (beat & 1));    \
+            data = qd[H4(off[beat] >> 3)];                              \
+            cpu_stl_le_data_ra(env, addr, data, GETPC());               \
+        }                                                               \
+    }
+
+DO_VST2B(vst20b, 0, 2, 12, 14)
+DO_VST2B(vst21b, 4, 6, 8, 10)
+
+DO_VST2H(vst20h, 0, 1, 6, 7)
+DO_VST2H(vst21h, 2, 3, 4, 5)
+
+DO_VST2W(vst20w, 0, 4, 24, 28)
+DO_VST2W(vst21w, 8, 12, 16, 20)
+
 /*
  * The mergemask(D, R, M) macro performs the operation "*D = R" but
  * storing only the bytes which correspond to 1 bits in M,
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index d3cb3396863..78229c44c68 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -35,6 +35,7 @@ static inline int vidup_imm(DisasContext *s, int x)
 
 typedef void MVEGenLdStFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenLdStSGFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
+typedef void MVEGenLdStIlFn(TCGv_ptr, TCGv_i32, TCGv_i32);
 typedef void MVEGenOneOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpScalarFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
@@ -378,6 +379,99 @@ static bool trans_VSTRD_sg_imm(DisasContext *s, arg_vldst_sg_imm *a)
     return do_ldst_sg_imm(s, a, fns[a->w], MO_64);
 }
 
+static bool do_vldst_il(DisasContext *s, arg_vldst_il *a, MVEGenLdStIlFn *fn,
+                        int addrinc)
+{
+    TCGv_i32 rn;
+
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !mve_check_qreg_bank(s, a->qd) ||
+        !fn || (a->rn == 13 && a->w) || a->rn == 15) {
+        /* Variously UNPREDICTABLE or UNDEF or related-encoding */
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    rn = load_reg(s, a->rn);
+    /*
+     * We pass the index of Qd, not a pointer, because the helper must
+     * access multiple Q registers starting at Qd and working up.
+     */
+    fn(cpu_env, tcg_constant_i32(a->qd), rn);
+
+    if (a->w) {
+        tcg_gen_addi_i32(rn, rn, addrinc);
+        store_reg(s, a->rn, rn);
+    } else {
+        tcg_temp_free_i32(rn);
+    }
+    mve_update_and_store_eci(s);
+    return true;
+}
+
+/* This macro is just to make the arrays more compact in these functions */
+#define F(N) gen_helper_mve_##N
+
+static bool trans_VLD2(DisasContext *s, arg_vldst_il *a)
+{
+    static MVEGenLdStIlFn * const fns[4][4] = {
+        { F(vld20b), F(vld20h), F(vld20w), NULL, },
+        { F(vld21b), F(vld21h), F(vld21w), NULL, },
+        { NULL, NULL, NULL, NULL },
+        { NULL, NULL, NULL, NULL },
+    };
+    if (a->qd > 6) {
+        return false;
+    }
+    return do_vldst_il(s, a, fns[a->pat][a->size], 32);
+}
+
+static bool trans_VLD4(DisasContext *s, arg_vldst_il *a)
+{
+    static MVEGenLdStIlFn * const fns[4][4] = {
+        { F(vld40b), F(vld40h), F(vld40w), NULL, },
+        { F(vld41b), F(vld41h), F(vld41w), NULL, },
+        { F(vld42b), F(vld42h), F(vld42w), NULL, },
+        { F(vld43b), F(vld43h), F(vld43w), NULL, },
+    };
+    if (a->qd > 4) {
+        return false;
+    }
+    return do_vldst_il(s, a, fns[a->pat][a->size], 64);
+}
+
+static bool trans_VST2(DisasContext *s, arg_vldst_il *a)
+{
+    static MVEGenLdStIlFn * const fns[4][4] = {
+        { F(vst20b), F(vst20h), F(vst20w), NULL, },
+        { F(vst21b), F(vst21h), F(vst21w), NULL, },
+        { NULL, NULL, NULL, NULL },
+        { NULL, NULL, NULL, NULL },
+    };
+    if (a->qd > 6) {
+        return false;
+    }
+    return do_vldst_il(s, a, fns[a->pat][a->size], 32);
+}
+
+static bool trans_VST4(DisasContext *s, arg_vldst_il *a)
+{
+    static MVEGenLdStIlFn * const fns[4][4] = {
+        { F(vst40b), F(vst40h), F(vst40w), NULL, },
+        { F(vst41b), F(vst41h), F(vst41w), NULL, },
+        { F(vst42b), F(vst42h), F(vst42w), NULL, },
+        { F(vst43b), F(vst43h), F(vst43w), NULL, },
+    };
+    if (a->qd > 4) {
+        return false;
+    }
+    return do_vldst_il(s, a, fns[a->pat][a->size], 64);
+}
+
+#undef F
+
 static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
 {
     TCGv_ptr qd;
-- 
2.20.1


