Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779A23F0C13
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:49:15 +0200 (CEST)
Received: from localhost ([::1]:42438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRYi-0003v8-Ec
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGRA4-0008Aq-Uc
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:40 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:52085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGRA3-0002uv-CU
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:40 -0400
Received: by mail-pj1-x102e.google.com with SMTP id oa17so3326855pjb.1
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ytbtEBmPvSIrsYJSIkW37yTJbTx1Gu3iDRC/cX/jYac=;
 b=TA1lSmWOGoHu4H5ibO10qT0UEEeU1Y3B7PLpun+tJljqaWN6owztmnhY53zxkWKgX5
 fsQi8ET6ntHXpxgfYs+uMZ+ZqMejPY8kzjeuHc7GqOwr1GW9GlWLwQT4YByzQ18IvGgc
 ZOEIILkCOQPIDIrUTI5G67TffHGHaEH5x+wTIfzxvr7/I+Y4kwwkFMx6jKv97uvR0TUc
 0BxpqioWeqxttR87MoH1oiNeUxIqB2jVwu7zkAu/wVsZvFE/XvewZWdIyTTATvB167sj
 mUviKD6QmmKtuTPkiH/EX2h6IUayZXIXTiG0S1zqhXmLOHNNrfEINyeVYdYDatDPmns3
 Cngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ytbtEBmPvSIrsYJSIkW37yTJbTx1Gu3iDRC/cX/jYac=;
 b=PcRG+ff7Hb5UzUuFHcdYx3FuhjApnBhMz+7g5H7RnBzXFvP5oOl6XAlkEBqCrUdWwW
 zc7Q/P1Md5frIPLNKMrFVh9+A4PA+eCpKMXP/By/WXpZy9Z/lhFAy0TT/oSMQWJ/lo+Y
 q3NVfGplCUGhHetebDBoOFbow472Jfen8b+Lqo/KdeBujO99OkMMwdkQ7pKiJQOycM9u
 a7UnImfZVLW/+jT9CHspmUneSRSB0GWhClKtbaTUnIueiIonBqgaEckDdqFrZ7FOBaka
 m8ZHHSWAYxYY7AHLiBeO4WL5ohi+9dQx2CdgFU+sYzyebIWuiisPpcFKP6WuPwzQNTSD
 mdTA==
X-Gm-Message-State: AOAM531gO0kt1jQofRkwtfcG+TTh8q2EQ6rTLrL3iTnPtZrnFTjHU7Sc
 /z/0bTrPOuU7TY8nHZcKbgLy6PzWG/q+WA==
X-Google-Smtp-Source: ABdhPJzr+xV0Z0Hza9VR17oXcpZuW5jRDrLfCYTRm/cWeHJxcNn9negFrsEipYyZEFeIRwYamhaDxw==
X-Received: by 2002:a17:90b:350d:: with SMTP id
 ls13mr11028566pjb.196.1629314618098; 
 Wed, 18 Aug 2021 12:23:38 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 62/66] tcg/s390: Support raising sigbus for user-only
Date: Wed, 18 Aug 2021 09:19:16 -1000
Message-Id: <20210818191920.390759-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
 tcg/s390/tcg-target.h     |  2 --
 tcg/s390/tcg-target.c.inc | 63 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index 2e4ede2ea2..04b59f2537 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -157,9 +157,7 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
     /* no need to flush icache explicitly */
 }
 
-#ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
-#endif
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #endif
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index fd0b3316d2..849457e01f 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -29,6 +29,7 @@
 #error "unsupported code generation mode"
 #endif
 
+#include "../tcg-ldst.c.inc"
 #include "../tcg-pool.c.inc"
 #include "elf.h"
 
@@ -134,6 +135,7 @@ typedef enum S390Opcode {
     RI_OIHL     = 0xa509,
     RI_OILH     = 0xa50a,
     RI_OILL     = 0xa50b,
+    RI_TMLL     = 0xa701,
 
     RIE_CGIJ    = 0xec7c,
     RIE_CGRJ    = 0xec64,
@@ -1488,8 +1490,6 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg data,
 }
 
 #if defined(CONFIG_SOFTMMU)
-#include "../tcg-ldst.c.inc"
-
 /* We're expecting to use a 20-bit negative offset on the tlb memory ops.  */
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 19));
@@ -1626,6 +1626,57 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     return true;
 }
 #else
+static void tcg_out_test_alignment(TCGContext *s, bool is_ld,
+                                   TCGReg addrlo, unsigned a_bits)
+{
+    unsigned a_mask = (1 << a_bits) - 1;
+    TCGLabelQemuLdst *l = new_ldst_label(s);
+
+    l->is_ld = is_ld;
+    l->addrlo_reg = addrlo;
+
+    /* We are expecting a_bits to max out at 7, much lower than TMLL. */
+    tcg_debug_assert(a_bits < 16);
+    tcg_out_insn(s, RI, TMLL, addrlo, a_mask);
+
+    tcg_out16(s, RI_BRC | (7 << 4)); /* CC in {1,2,3} */
+    l->label_ptr[0] = s->code_ptr;
+    s->code_ptr += 1;
+
+    l->raddr = tcg_splitwx_to_rx(s->code_ptr);
+}
+
+static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    if (!patch_reloc(l->label_ptr[0], R_390_PC16DBL,
+                     (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 2)) {
+        return false;
+    }
+
+    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_R3, l->addrlo_reg);
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R2, TCG_AREG0);
+
+    /*
+     * "Tail call" to the helper, with the return address back inline,
+     * just for the clarity of the debugging traceback -- the helper
+     * cannot return.
+     */
+    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R14, (uintptr_t)l->raddr);
+    tgen_gotoi(s, S390_CC_ALWAYS, (const void *)(l->is_ld ? helper_unaligned_ld
+                                                 : helper_unaligned_st));
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
 static void tcg_prepare_user_ldst(TCGContext *s, TCGReg *addr_reg,
                                   TCGReg *index_reg, tcg_target_long *disp)
 {
@@ -1664,7 +1715,11 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 #else
     TCGReg index_reg;
     tcg_target_long disp;
+    unsigned a_bits = get_alignment_bits(opc);
 
+    if (a_bits) {
+        tcg_out_test_alignment(s, true, addr_reg, a_bits);
+    }
     tcg_prepare_user_ldst(s, &addr_reg, &index_reg, &disp);
     tcg_out_qemu_ld_direct(s, opc, data_reg, addr_reg, index_reg, disp);
 #endif
@@ -1691,7 +1746,11 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 #else
     TCGReg index_reg;
     tcg_target_long disp;
+    unsigned a_bits = get_alignment_bits(opc);
 
+    if (a_bits) {
+        tcg_out_test_alignment(s, false, addr_reg, a_bits);
+    }
     tcg_prepare_user_ldst(s, &addr_reg, &index_reg, &disp);
     tcg_out_qemu_st_direct(s, opc, data_reg, addr_reg, index_reg, disp);
 #endif
-- 
2.25.1


