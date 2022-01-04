Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D67483A87
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 03:19:30 +0100 (CET)
Received: from localhost ([::1]:53694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ZQ9-0008FE-N1
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 21:19:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4ZMb-0002hA-93
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 21:15:49 -0500
Received: from [2607:f8b0:4864:20::535] (port=37733
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4ZMZ-00089u-FA
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 21:15:48 -0500
Received: by mail-pg1-x535.google.com with SMTP id x194so8224532pgx.4
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 18:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z9ajubKXxmD3iBvNRXK8ngdOfUUHM9YOJvnd1B/bzEU=;
 b=T3IbVifRixhABYpIPfroB06y6d95fuWbeX6kFejyyUxZUCrJ49DXyUunLaAyT/alr/
 VBNgQM5vyZuSZYqwBF0xNBL2TcO/JOzBWROFwmjpIjH2+m3jkfvpS/WUlm61KOua0UxB
 Or6ILQVYlqi2JhrQ9jnLr69FH00rnVCXa/nsOHMJUbJK4jlmyUKL3wWNZe/h7M/UE6Lx
 tYiX/q47ZrHC3r7739J7dOQb1yHg1cfw+Us6z6B85xVtVkv6zWKfUD26c0nOvVSvynZ+
 EA0YZ4fFyaSBgfajpO1AEwWLC+81NiPmjMcm2gxYKvLyn39GFIe2FSKp4Vnu1hzQTse7
 moYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z9ajubKXxmD3iBvNRXK8ngdOfUUHM9YOJvnd1B/bzEU=;
 b=qq9kx0ItAm8BApmoTqMo+ensK5eNqFLCgTrk5LY/XTxt2jnD2SxGnxBAz3vD8m7X3/
 Fp7GjYeIgOsMGoGnoTeCOZG9QdnH7f9I44aZrK+rTXp172Lqu/KKQQ8hmsf3cCrjHin2
 ir39JIAOEko5uiykLIxIIodZn7g2WD5d6qScRFT2e4SJZHybt6vmK43829+/3gS5XlqT
 LNOMnHF8qk2GBbMMsxp3Vs/jS+notzuqyJXjBp4bFIZ8Pl1KOABxdsvpTaUqdfDdyOPz
 eVTk3nGbT0KUfVQXLjDIRwkjNG7zypKzCuYCSC21c6GsHxY23P3/JA0tRJ57EgsyXJCs
 ga/w==
X-Gm-Message-State: AOAM532Vvsj6k8aAJm4MezyQxVc/cF4I9WybWh0xcrR/kzFbKKD4qGze
 t+jLhsyRPEJ5c+P8w8GICCE5tTxg7eQ+xg==
X-Google-Smtp-Source: ABdhPJw35fYZihOkk0NzCLfgpA4yBiJTM7hMO7bQRcHHDxD3SJHi91fX61l+AMKc58D1veJAy05gfQ==
X-Received: by 2002:a63:751b:: with SMTP id q27mr42547961pgc.184.1641262546092; 
 Mon, 03 Jan 2022 18:15:46 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b4sm37395501pjm.17.2022.01.03.18.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 18:15:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/7] tcg/ppc: Support raising sigbus for user-only
Date: Mon,  3 Jan 2022 18:15:39 -0800
Message-Id: <20220104021543.396571-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220104021543.396571-1-richard.henderson@linaro.org>
References: <20220104021543.396571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: git@xen0n.name, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.h     |  2 -
 tcg/ppc/tcg-target.c.inc | 98 ++++++++++++++++++++++++++++++++++++----
 2 files changed, 90 insertions(+), 10 deletions(-)

diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 0943192cde..c775c97b61 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -182,9 +182,7 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-#ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
-#endif
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #endif
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 3e4ca2be88..8a117e0665 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -24,6 +24,7 @@
 
 #include "elf.h"
 #include "../tcg-pool.c.inc"
+#include "../tcg-ldst.c.inc"
 
 /*
  * Standardize on the _CALL_FOO symbols used by GCC:
@@ -1881,7 +1882,8 @@ void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
     }
 }
 
-static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
+static void tcg_out_call_int(TCGContext *s, int lk,
+                             const tcg_insn_unit *target)
 {
 #ifdef _CALL_AIX
     /* Look through the descriptor.  If the branch is in range, and we
@@ -1892,7 +1894,7 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
 
     if (in_range_b(diff) && toc == (uint32_t)toc) {
         tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP1, toc);
-        tcg_out_b(s, LK, tgt);
+        tcg_out_b(s, lk, tgt);
     } else {
         /* Fold the low bits of the constant into the addresses below.  */
         intptr_t arg = (intptr_t)target;
@@ -1907,7 +1909,7 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
         tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R0, TCG_REG_TMP1, ofs);
         tcg_out32(s, MTSPR | RA(TCG_REG_R0) | CTR);
         tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R2, TCG_REG_TMP1, ofs + SZP);
-        tcg_out32(s, BCCTR | BO_ALWAYS | LK);
+        tcg_out32(s, BCCTR | BO_ALWAYS | lk);
     }
 #elif defined(_CALL_ELF) && _CALL_ELF == 2
     intptr_t diff;
@@ -1921,16 +1923,21 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
 
     diff = tcg_pcrel_diff(s, target);
     if (in_range_b(diff)) {
-        tcg_out_b(s, LK, target);
+        tcg_out_b(s, lk, target);
     } else {
         tcg_out32(s, MTSPR | RS(TCG_REG_R12) | CTR);
-        tcg_out32(s, BCCTR | BO_ALWAYS | LK);
+        tcg_out32(s, BCCTR | BO_ALWAYS | lk);
     }
 #else
-    tcg_out_b(s, LK, target);
+    tcg_out_b(s, lk, target);
 #endif
 }
 
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
+{
+    tcg_out_call_int(s, LK, target);
+}
+
 static const uint32_t qemu_ldx_opc[(MO_SSIZE + MO_BSWAP) + 1] = {
     [MO_UB] = LBZX,
     [MO_UW] = LHZX,
@@ -1960,8 +1967,6 @@ static const uint32_t qemu_exts_opc[4] = {
 };
 
 #if defined (CONFIG_SOFTMMU)
-#include "../tcg-ldst.c.inc"
-
 /* helper signature: helper_ld_mmu(CPUState *env, target_ulong addr,
  *                                 int mmu_idx, uintptr_t ra)
  */
@@ -2227,6 +2232,71 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_b(s, 0, lb->raddr);
     return true;
 }
+#else
+
+static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addrlo,
+                                   TCGReg addrhi, unsigned a_bits)
+{
+    unsigned a_mask = (1 << a_bits) - 1;
+    TCGLabelQemuLdst *label = new_ldst_label(s);
+
+    label->is_ld = is_ld;
+    label->addrlo_reg = addrlo;
+    label->addrhi_reg = addrhi;
+
+    /* We are expecting a_bits to max out at 7, much lower than ANDI. */
+    tcg_debug_assert(a_bits < 16);
+    tcg_out32(s, ANDI | SAI(addrlo, TCG_REG_R0, a_mask));
+
+    label->label_ptr[0] = s->code_ptr;
+    tcg_out32(s, BC | BI(0, CR_EQ) | BO_COND_FALSE | LK);
+
+    label->raddr = tcg_splitwx_to_rx(s->code_ptr);
+}
+
+static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    if (!reloc_pc14(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
+        return false;
+    }
+
+    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
+        TCGReg arg = TCG_REG_R4;
+#ifdef TCG_TARGET_CALL_ALIGN_ARGS
+        arg |= 1;
+#endif
+        if (l->addrlo_reg != arg) {
+            tcg_out_mov(s, TCG_TYPE_I32, arg, l->addrhi_reg);
+            tcg_out_mov(s, TCG_TYPE_I32, arg + 1, l->addrlo_reg);
+        } else if (l->addrhi_reg != arg + 1) {
+            tcg_out_mov(s, TCG_TYPE_I32, arg + 1, l->addrlo_reg);
+            tcg_out_mov(s, TCG_TYPE_I32, arg, l->addrhi_reg);
+        } else {
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R0, arg);
+            tcg_out_mov(s, TCG_TYPE_I32, arg, arg + 1);
+            tcg_out_mov(s, TCG_TYPE_I32, arg + 1, TCG_REG_R0);
+        }
+    } else {
+        tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_R4, l->addrlo_reg);
+    }
+    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_R3, TCG_AREG0);
+
+    /* "Tail call" to the helper, with the return address back inline. */
+    tcg_out_call_int(s, 0, (const void *)(l->is_ld ? helper_unaligned_ld
+                                          : helper_unaligned_st));
+    return true;
+}
+
+static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    return tcg_out_fail_alignment(s, l);
+}
+
+static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    return tcg_out_fail_alignment(s, l);
+}
+
 #endif /* SOFTMMU */
 
 static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
@@ -2238,6 +2308,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 #ifdef CONFIG_SOFTMMU
     int mem_index;
     tcg_insn_unit *label_ptr;
+#else
+    unsigned a_bits;
 #endif
 
     datalo = *args++;
@@ -2258,6 +2330,10 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 
     rbase = TCG_REG_R3;
 #else  /* !CONFIG_SOFTMMU */
+    a_bits = get_alignment_bits(opc);
+    if (a_bits) {
+        tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
+    }
     rbase = guest_base ? TCG_GUEST_BASE_REG : 0;
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
         tcg_out_ext32u(s, TCG_REG_TMP1, addrlo);
@@ -2313,6 +2389,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 #ifdef CONFIG_SOFTMMU
     int mem_index;
     tcg_insn_unit *label_ptr;
+#else
+    unsigned a_bits;
 #endif
 
     datalo = *args++;
@@ -2333,6 +2411,10 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 
     rbase = TCG_REG_R3;
 #else  /* !CONFIG_SOFTMMU */
+    a_bits = get_alignment_bits(opc);
+    if (a_bits) {
+        tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
+    }
     rbase = guest_base ? TCG_GUEST_BASE_REG : 0;
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
         tcg_out_ext32u(s, TCG_REG_TMP1, addrlo);
-- 
2.25.1


