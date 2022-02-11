Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374D84B1BC9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 03:01:25 +0100 (CET)
Received: from localhost ([::1]:45244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nILFU-0000bB-Ap
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 21:01:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnb-0004wY-RJ
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:37 -0500
Received: from [2607:f8b0:4864:20::432] (port=35345
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnZ-0007SL-FW
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:35 -0500
Received: by mail-pf1-x432.google.com with SMTP id l19so7682055pfu.2
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h3OMhMoGTS9ir2j1MNRjTZSgTM6ppy0sE7+1oijotYw=;
 b=QKktmBhFmbrELOKhrH47e4RUl8v2v1cL56u7N5IYxLQ5BBhVlHU8i8G1mjCZKnVs2U
 PBkiXUutDHPKDbULchwpjy775GkTa1v3qtIdBwv1B2e7TBipAOvi0g2ht17cZcPv89pE
 wTKTD6L314ZfsO+tDjeCvYs7DyXrV6g2mj+ZjxHNIpPzfMqzGWL7thoDGLH6hDg/J04c
 osXfv2ZkNIizbTYa8EZZQQ1qn5G+SN++q82Cg4804OJ1RUY1WzdH3uepB5wxFzQOJrIm
 gnw19ezdqcVqzv2769wjxV/ngWrgqc47cRs4++FYLOAApUglC/8GqpuEU6nDiQmuAaSO
 sGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h3OMhMoGTS9ir2j1MNRjTZSgTM6ppy0sE7+1oijotYw=;
 b=eGvpO5NjP6kWLCNVr0X9/bNtowSYjG/LnTL0PMnentEgXUtV7+FFRXYPp+boUE9+hW
 wEMCqHL5NQNzRqNABM7pAhP+cf6MMM4LVC7JVASBcCF7mlCzz9/xmhGHCiAr6H3yIJYv
 cHDWP74gWjDWsQZEy1qJMljJGuAcB+931g9pteuKHhb7Totb6ttl0tgqlytmVnXIXY7+
 XNkcbsgWJmEi4+FcCvMivHsDahm/9afPwQ9aoeGlUX4Dye4Onzp+aYyVZthfHWFSsFO0
 Z+dYqUeL5VcvExFywxbAST3jh5kN7LdanVU2L4W+bz4OiYTysxzs5/SvAygJAlRogEyq
 CBMg==
X-Gm-Message-State: AOAM530muwvlFYNItwoF9SWfyhBjIJxs6I2E5GO4AsXF8WpD3bQf4UH9
 hIiNYpfLiMZxjiJL0ugyfkknNP1MQ97Qd8Sy
X-Google-Smtp-Source: ABdhPJyvQuFMVVyhAPS6Lyh8zpG2rbgPex6pdotseteZx9JYf0sFKKY0vQarcPwVcTCY2kb+yN4hAA==
X-Received: by 2002:a63:86:: with SMTP id 128mr8265499pga.13.1644543152271;
 Thu, 10 Feb 2022 17:32:32 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:32:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/34] tcg/arm: Support raising sigbus for user-only
Date: Fri, 11 Feb 2022 12:30:48 +1100
Message-Id: <20220211013059.17994-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.h     |  2 -
 tcg/arm/tcg-target.c.inc | 83 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 81 insertions(+), 4 deletions(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 1dd4cd5377..27c27a1f14 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -151,9 +151,7 @@ extern bool use_neon_instructions;
 /* not defined -- call should be eliminated at compile time */
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
-#ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
-#endif
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #endif
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 7eebbfaf02..e1ea69669c 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -23,6 +23,7 @@
  */
 
 #include "elf.h"
+#include "../tcg-ldst.c.inc"
 #include "../tcg-pool.c.inc"
 
 int arm_arch = __ARM_ARCH;
@@ -1289,8 +1290,6 @@ static void tcg_out_vldst(TCGContext *s, ARMInsn insn,
 }
 
 #ifdef CONFIG_SOFTMMU
-#include "../tcg-ldst.c.inc"
-
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     int mmu_idx, uintptr_t ra)
  */
@@ -1592,6 +1591,74 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_goto(s, COND_AL, qemu_st_helpers[opc & MO_SIZE]);
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
+    /* We are expecting a_bits to max out at 7, and can easily support 8. */
+    tcg_debug_assert(a_mask <= 0xff);
+    /* tst addr, #mask */
+    tcg_out_dat_imm(s, COND_AL, ARITH_TST, 0, addrlo, a_mask);
+
+    /* blne slow_path */
+    label->label_ptr[0] = s->code_ptr;
+    tcg_out_bl_imm(s, COND_NE, 0);
+
+    label->raddr = tcg_splitwx_to_rx(s->code_ptr);
+}
+
+static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    if (!reloc_pc24(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
+        return false;
+    }
+
+    if (TARGET_LONG_BITS == 64) {
+        /* 64-bit target address is aligned into R2:R3. */
+        if (l->addrhi_reg != TCG_REG_R2) {
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R2, l->addrlo_reg);
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R3, l->addrhi_reg);
+        } else if (l->addrlo_reg != TCG_REG_R3) {
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R3, l->addrhi_reg);
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R2, l->addrlo_reg);
+        } else {
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R1, TCG_REG_R2);
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R2, TCG_REG_R3);
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R3, TCG_REG_R1);
+        }
+    } else {
+        tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R1, l->addrlo_reg);
+    }
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R0, TCG_AREG0);
+
+    /*
+     * Tail call to the helper, with the return address back inline,
+     * just for the clarity of the debugging traceback -- the helper
+     * cannot return.  We have used BLNE to arrive here, so LR is
+     * already set.
+     */
+    tcg_out_goto(s, COND_AL, (const void *)
+                 (l->is_ld ? helper_unaligned_ld : helper_unaligned_st));
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
 #endif /* SOFTMMU */
 
 static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
@@ -1689,6 +1756,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
     int mem_index;
     TCGReg addend;
     tcg_insn_unit *label_ptr;
+#else
+    unsigned a_bits;
 #endif
 
     datalo = *args++;
@@ -1712,6 +1781,10 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
     add_qemu_ldst_label(s, true, oi, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
+    a_bits = get_alignment_bits(opc);
+    if (a_bits) {
+        tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
+    }
     if (guest_base) {
         tcg_out_qemu_ld_index(s, opc, datalo, datahi,
                               addrlo, TCG_REG_GUEST_BASE, false);
@@ -1801,6 +1874,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
     int mem_index;
     TCGReg addend;
     tcg_insn_unit *label_ptr;
+#else
+    unsigned a_bits;
 #endif
 
     datalo = *args++;
@@ -1824,6 +1899,10 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
     add_qemu_ldst_label(s, false, oi, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
+    a_bits = get_alignment_bits(opc);
+    if (a_bits) {
+        tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
+    }
     if (guest_base) {
         tcg_out_qemu_st_index(s, COND_AL, opc, datalo, datahi,
                               addrlo, TCG_REG_GUEST_BASE, false);
-- 
2.25.1


