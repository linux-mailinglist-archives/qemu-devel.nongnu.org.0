Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE04B3F0C0A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:45:44 +0200 (CEST)
Received: from localhost ([::1]:34322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRVP-0006fP-NJ
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:45:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGRA3-000879-Uy
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:39 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:36399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGRA2-0002uO-3s
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:39 -0400
Received: by mail-pg1-x52b.google.com with SMTP id t1so3327794pgv.3
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DwAz4IncEdHErJ/5AHQ9hcYWYdIbFwU1WRqON6L7UJ0=;
 b=PWUlwBA2xhBEALDBGqy7Zl/YhytYTxd8sBRh+KjlI1UnT+Qw1jd9hSyGp8sQ2GLz1u
 er55Elm+CUx9Ddk1ju22DWpiMzNKqP9vhtu2kmdldP+rrmGqQspaRWBWueKs4o5a3p4j
 CuXPZmUC3Q3OM+lQC8U7qjc6rOmswpD6E9HWomkrQpZNzhTz74bk6frCGrmU97yWTnjo
 15y/iUAeW3A3GFTPVhd6ccW/RaUYLLoH0rrocgsPKQj3eraScmR6dHvn/5hvYYYwZqDh
 R4+gVwHsQAOvuG+7TsXn5XGzPhnXRuqnOk15Oy03T0lnqpZEGXm/AC7UvEu6CS5mrsS6
 y1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DwAz4IncEdHErJ/5AHQ9hcYWYdIbFwU1WRqON6L7UJ0=;
 b=GgbdJC0DWVLWM/fFYSLAebvqwU7OXoS7K4cJtG2yKSvm/Ts41DZK5fSmD7Gq5qSQYL
 d6icBeyMYBR7gmS4AYWXp6nyLrX+1xQKbmfZILmGZjjcIQzcLliDp/BmMY4Gwx4NawXn
 akoN+qz6UrNL9eENO0QI/eRfXQPAdhBjUH4knd41Bzz7lWVtUrEKGA50dNg/31/ogr9E
 9VK8HwMx2waV+f20ITlMjxyUY2jHov8yxNMRWPR7GjpszA1omnqAHEaOjw1EZD8774GZ
 n8VCNOCCts2q92X7I9e5cot/6Mix5iStn2NI6zyxSXUy4nkVthK7uDzcMKf0TD+P1Mm9
 EpyQ==
X-Gm-Message-State: AOAM533KQ8mrAsqgL1CwbJmJ18jtDUuBv35o2GEmyvpu3RWqQ5T5GGLf
 FgjP/Uocv+/Oa0+cibqeqldrK2Luflrdkg==
X-Google-Smtp-Source: ABdhPJxyhSsI7kPOTKjw6Qdwm06UzIhVkC9kw0AhxrdT3gIsWR3LK97zWUwv2bvyPE9MIA1WbBYMDQ==
X-Received: by 2002:a63:4f54:: with SMTP id p20mr10338852pgl.437.1629314616911; 
 Wed, 18 Aug 2021 12:23:36 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 61/66] tcg/ppc: Support raising sigbus for user-only
Date: Wed, 18 Aug 2021 09:19:15 -1000
Message-Id: <20210818191920.390759-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.h     |   2 -
 tcg/ppc/tcg-target.c.inc | 102 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 94 insertions(+), 10 deletions(-)

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
index 2d4ca1f445..aa77cff09a 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -24,6 +24,7 @@
 
 #include "elf.h"
 #include "../tcg-pool.c.inc"
+#include "../tcg-ldst.c.inc"
 
 #if defined _CALL_DARWIN || defined __APPLE__
 #define TCG_TARGET_CALL_DARWIN
@@ -1866,7 +1867,8 @@ void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
     }
 }
 
-static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
+static void tcg_out_call_int(TCGContext *s, int lk,
+                             const tcg_insn_unit *target)
 {
 #ifdef _CALL_AIX
     /* Look through the descriptor.  If the branch is in range, and we
@@ -1877,7 +1879,7 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
 
     if (in_range_b(diff) && toc == (uint32_t)toc) {
         tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP1, toc);
-        tcg_out_b(s, LK, tgt);
+        tcg_out_b(s, lk, tgt);
     } else {
         /* Fold the low bits of the constant into the addresses below.  */
         intptr_t arg = (intptr_t)target;
@@ -1892,7 +1894,7 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
         tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R0, TCG_REG_TMP1, ofs);
         tcg_out32(s, MTSPR | RA(TCG_REG_R0) | CTR);
         tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R2, TCG_REG_TMP1, ofs + SZP);
-        tcg_out32(s, BCCTR | BO_ALWAYS | LK);
+        tcg_out32(s, BCCTR | BO_ALWAYS | lk);
     }
 #elif defined(_CALL_ELF) && _CALL_ELF == 2
     intptr_t diff;
@@ -1906,16 +1908,21 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
 
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
@@ -1945,8 +1952,6 @@ static const uint32_t qemu_exts_opc[4] = {
 };
 
 #if defined (CONFIG_SOFTMMU)
-#include "../tcg-ldst.c.inc"
-
 /* helper signature: helper_ld_mmu(CPUState *env, target_ulong addr,
  *                                 int mmu_idx, uintptr_t ra)
  */
@@ -2212,6 +2217,75 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
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
+    /*
+     * "Tail call" to the helper, with the return address back inline,
+     * just for the clarity of the debugging traceback -- the helper
+     * cannot return.
+     */
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
@@ -2223,6 +2297,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 #ifdef CONFIG_SOFTMMU
     int mem_index;
     tcg_insn_unit *label_ptr;
+#else
+    unsigned a_bits;
 #endif
 
     datalo = *args++;
@@ -2243,6 +2319,10 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 
     rbase = TCG_REG_R3;
 #else  /* !CONFIG_SOFTMMU */
+    a_bits = get_alignment_bits(opc);
+    if (a_bits) {
+        tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
+    }
     rbase = guest_base ? TCG_GUEST_BASE_REG : 0;
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
         tcg_out_ext32u(s, TCG_REG_TMP1, addrlo);
@@ -2298,6 +2378,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 #ifdef CONFIG_SOFTMMU
     int mem_index;
     tcg_insn_unit *label_ptr;
+#else
+    unsigned a_bits;
 #endif
 
     datalo = *args++;
@@ -2318,6 +2400,10 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 
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


