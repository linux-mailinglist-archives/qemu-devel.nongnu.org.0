Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDB542B350
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:21:36 +0200 (CEST)
Received: from localhost ([::1]:55126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUpj-0005K5-7X
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUL6-0005ZU-3t
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:49:56 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUL4-000198-03
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:49:55 -0400
Received: by mail-pj1-x1034.google.com with SMTP id kk10so1088392pjb.1
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z9ajubKXxmD3iBvNRXK8ngdOfUUHM9YOJvnd1B/bzEU=;
 b=zCyjVORqo4qwRwxOzi4ijoeopQmwG2DPcyJ4nDPSpgREayF2jAOU+aYTq2t90tcqfJ
 3Zn41UAHwsJ2vQUcS7N5IevHhBxRtZFcjukI4nTqMFJ4EgquyJg7DeoViOpGqN6ad6V/
 40c4nvUfqNjutuZN68yU0eCWYk5UKzQXCXLOLfUr3QkY16mJeuG0BxfiDU5THUhC0L2n
 F9QSO4vdALBMJNANVSKi4CIDtxkGK2VCZUZropy6pD1BLNn/hSfMk2nebyxCoV/VxF+x
 AjB/CQof7qJgc8rVVYhjSX1S29AsjS2tSvyOF3+NnTwxa5mk8UcXkd8tfk3rZ10QuO3w
 JeuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z9ajubKXxmD3iBvNRXK8ngdOfUUHM9YOJvnd1B/bzEU=;
 b=iAY5+s0uhnmvKSVsC5B/hcuPbQiWKDsR7p+Peh4EO+Esy6BJIWqVgv01MXpYOwli53
 H27dFEQIZT7FNjr4xy6tmkAsORHfsNjNJO/+YrcnlfsJjnS/6Jmj4WMTwQKLgC8LvqE4
 4HZkYoHzWb8L1FUXvV+SSYfya7G+i/ZW5kcpJ1RrdDpOd/KKGLTTuvmMB1ECpRNmcZBa
 kGxzpmjntcvSFIueo7Ze4IyDiFRWrlWcvAMphec8Wje6ZEOBsh5m80zUI5dV12mR8ZeD
 vRtBLg9ksVDxl7USpaRjABWk5l9xGOA53UDvrN+wMzSHa4E6NjxNCdQarklaJJZkW+30
 jWKw==
X-Gm-Message-State: AOAM531sAsLUIL0CdTcm+icaWP4iGgcNkFyXijOh9PgXdNrLJxLIEurU
 9PhshOlNoOzw3rUzIRXah9lc/pHxAk0=
X-Google-Smtp-Source: ABdhPJz3/MGcKFxg4WCG6OMTP+9Reeb4300XvTswV5XGGmPwj8DNSKYMmYrfAfZTKuqM70adUSqnVg==
X-Received: by 2002:a17:902:e0d5:b0:13f:25a0:d26b with SMTP id
 e21-20020a170902e0d500b0013f25a0d26bmr21037811pla.53.1634093392607; 
 Tue, 12 Oct 2021 19:49:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y20sm12579610pfp.68.2021.10.12.19.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:49:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 44/48] tcg/ppc: Support raising sigbus for user-only
Date: Tue, 12 Oct 2021 19:46:03 -0700
Message-Id: <20211013024607.731881-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
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


