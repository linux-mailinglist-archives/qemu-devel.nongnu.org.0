Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F28422D99E7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:28:58 +0100 (CET)
Received: from localhost ([::1]:59152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kooqQ-0006kQ-1n
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:28:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSO-00024g-Mj
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:10 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:42597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSM-00040Y-Ga
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:08 -0500
Received: by mail-oi1-x242.google.com with SMTP id l200so19211265oig.9
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=etR78lk9NSenLd9LAIcHz8gvX9UzEYAUELnLLKVO9+E=;
 b=hi8HltkAdRDsqlVzkN6O4522QDVqOJqdg1wJpy2WIF2ioy3bFl7id4JCmHDan2Bbvq
 JDFzk0dPjF6Xy9tLqnBY9PQVag1RI/xI7yOiwgrSDD+WnNxpLc59mZ+7vpaF6JYvcE6H
 wQsBNdk8mvTXWfV0EKsk6oVbYAMiSxq/9Q0DYD/87th7y+rhmeXNFM/my6Zmiv0HwrhD
 rD8SG2OkY28LUVfUdvc1wyd8VmS4ZjY47ATwz2o0FdDLWWCmX4JUuRevDyGCH6WXz+2Z
 2eAYbJNRn3GIVqiRboyXoFUA3Dl3SLnvDH8Aar+YuLS3ype46AiYozJDBCDNf04+OBNi
 JYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=etR78lk9NSenLd9LAIcHz8gvX9UzEYAUELnLLKVO9+E=;
 b=L0jJqCYb6nNw+HwaXXzvNX4GEmsLvkfPhwWIScKfy2x5+uiBTKRYw1QKmP3+Vg/ZgM
 PZLqYF0e+urigJmEy4t5/AtNCq9iORKkpUpmEjZNYB7VrrCOKsi5urEchkVS7I5Jncc2
 MsmvxKrCdOPwsQCfN9M7Y9ZZVFH94hrprN/Yx8uChuNlkymxcqf3tUlBgK6awupZvhuA
 4fSTJZkZZiz8GAlmt6jGJM4HeXsB/Z8wn+Z0/R12/Qr7tFDehXwyfDagwSoGD+bqQnpL
 rbyFXI+AtOTsIcpzfGW8MAs3lp0RfKO/lJfWnJ62EURMj2kAuXw9SmhIXS4FaWzpgA2W
 v91A==
X-Gm-Message-State: AOAM530cTaEtGtBfmlx/RZXqb2N8tY/f7BoamtpTnT6TgAsfJ1k46Z53
 9IGakhZekrtnvkO5wpUXYtFcQEKtTwtO5QaF
X-Google-Smtp-Source: ABdhPJxeFSvYtFytobEkrZJnbs3rQjwYRsMDx6mVlYFQAEuiB78BFJYQimyx9PecUB4c8wEnaNYYqg==
X-Received: by 2002:aca:410:: with SMTP id 16mr18326899oie.97.1607954643859;
 Mon, 14 Dec 2020 06:04:03 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.04.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:04:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 29/43] tcg/ppc: Support split-wx code generation
Date: Mon, 14 Dec 2020 08:03:00 -0600
Message-Id: <20201214140314.18544-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
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
 tcg/ppc/tcg-target.h     |  2 +-
 tcg/ppc/tcg-target.c.inc | 53 +++++++++++++++++++++++-----------------
 2 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 8fc2672bf0..b3361b8abc 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -184,6 +184,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_SUPPORT_MIRROR       0
+#define TCG_TARGET_SUPPORT_MIRROR       1
 
 #endif
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 1f8a446b90..33b5915005 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -62,8 +62,6 @@
 #define TCG_CT_CONST_MONE 0x2000
 #define TCG_CT_CONST_WSZ  0x4000
 
-static tcg_insn_unit *tb_ret_addr;
-
 TCGPowerISA have_isa;
 static bool have_isel;
 bool have_altivec;
@@ -184,35 +182,41 @@ static inline bool in_range_b(tcg_target_long target)
     return target == sextract64(target, 0, 26);
 }
 
-static uint32_t reloc_pc24_val(tcg_insn_unit *pc, const tcg_insn_unit *target)
+static uint32_t reloc_pc24_val(const tcg_insn_unit *pc,
+			       const tcg_insn_unit *target)
 {
     ptrdiff_t disp = tcg_ptr_byte_diff(target, pc);
     tcg_debug_assert(in_range_b(disp));
     return disp & 0x3fffffc;
 }
 
-static bool reloc_pc24(tcg_insn_unit *pc, tcg_insn_unit *target)
+static bool reloc_pc24(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
 {
-    ptrdiff_t disp = tcg_ptr_byte_diff(target, pc);
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    ptrdiff_t disp = tcg_ptr_byte_diff(target, src_rx);
+
     if (in_range_b(disp)) {
-        *pc = (*pc & ~0x3fffffc) | (disp & 0x3fffffc);
+        *src_rw = (*src_rw & ~0x3fffffc) | (disp & 0x3fffffc);
         return true;
     }
     return false;
 }
 
-static uint16_t reloc_pc14_val(tcg_insn_unit *pc, const tcg_insn_unit *target)
+static uint16_t reloc_pc14_val(const tcg_insn_unit *pc,
+			       const tcg_insn_unit *target)
 {
     ptrdiff_t disp = tcg_ptr_byte_diff(target, pc);
     tcg_debug_assert(disp == (int16_t) disp);
     return disp & 0xfffc;
 }
 
-static bool reloc_pc14(tcg_insn_unit *pc, tcg_insn_unit *target)
+static bool reloc_pc14(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
 {
-    ptrdiff_t disp = tcg_ptr_byte_diff(target, pc);
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    ptrdiff_t disp = tcg_ptr_byte_diff(target, src_rx);
+
     if (disp == (int16_t) disp) {
-        *pc = (*pc & ~0xfffc) | (disp & 0xfffc);
+        *src_rw = (*src_rw & ~0xfffc) | (disp & 0xfffc);
         return true;
     }
     return false;
@@ -673,12 +677,12 @@ static const uint32_t tcg_to_isel[] = {
 static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
                         intptr_t value, intptr_t addend)
 {
-    tcg_insn_unit *target;
+    const tcg_insn_unit *target;
     int16_t lo;
     int32_t hi;
 
     value += addend;
-    target = (tcg_insn_unit *)value;
+    target = (const tcg_insn_unit *)value;
 
     switch (type) {
     case R_PPC_REL14:
@@ -1544,7 +1548,7 @@ static void tcg_out_setcond(TCGContext *s, TCGType type, TCGCond cond,
 static void tcg_out_bc(TCGContext *s, int bc, TCGLabel *l)
 {
     if (l->has_value) {
-        bc |= reloc_pc14_val(s->code_ptr, l->u.value_ptr);
+        bc |= reloc_pc14_val(tcg_splitwx_to_rx(s->code_ptr), l->u.value_ptr);
     } else {
         tcg_out_reloc(s, s->code_ptr, R_PPC_REL14, l, 0);
     }
@@ -1997,7 +2001,8 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, TCGMemOpIdx oi,
     label->datahi_reg = datahi_reg;
     label->addrlo_reg = addrlo_reg;
     label->addrhi_reg = addrhi_reg;
-    label->raddr = raddr;
+    /* TODO: Cast goes away when all hosts converted */
+    label->raddr = (void *)tcg_splitwx_to_rx(raddr);
     label->label_ptr[0] = lptr;
 }
 
@@ -2007,7 +2012,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     MemOp opc = get_memop(oi);
     TCGReg hi, lo, arg = TCG_REG_R3;
 
-    if (!reloc_pc14(lb->label_ptr[0], s->code_ptr)) {
+    if (!reloc_pc14(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
@@ -2055,7 +2060,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     MemOp s_bits = opc & MO_SIZE;
     TCGReg hi, lo, arg = TCG_REG_R3;
 
-    if (!reloc_pc14(lb->label_ptr[0], s->code_ptr)) {
+    if (!reloc_pc14(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
@@ -2306,10 +2311,10 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     int i;
 
 #ifdef _CALL_AIX
-    void **desc = (void **)s->code_ptr;
-    desc[0] = desc + 2;                   /* entry point */
-    desc[1] = 0;                          /* environment pointer */
-    s->code_ptr = (void *)(desc + 2);     /* skip over descriptor */
+    const void **desc = (const void **)s->code_ptr;
+    desc[0] = tcg_splitwx_to_rx(desc + 2);  /* entry point */
+    desc[1] = 0;                            /* environment pointer */
+    s->code_ptr = (void *)(desc + 2);       /* skip over descriptor */
 #endif
 
     tcg_set_frame(s, TCG_REG_CALL_STACK, REG_SAVE_BOT - CPU_TEMP_BUF_SIZE,
@@ -2341,7 +2346,8 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_out32(s, BCCTR | BO_ALWAYS);
 
     /* Epilogue */
-    tcg_code_gen_epilogue = tb_ret_addr = s->code_ptr;
+    /* TODO: Cast goes away when all hosts converted */
+    tcg_code_gen_epilogue = (void *)tcg_splitwx_to_rx(s->code_ptr);
 
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R0, TCG_REG_R1, FRAME_SIZE+LR_OFFSET);
     for (i = 0; i < ARRAY_SIZE(tcg_target_callee_save_regs); ++i) {
@@ -2362,7 +2368,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     switch (opc) {
     case INDEX_op_exit_tb:
         tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R3, args[0]);
-        tcg_out_b(s, 0, tb_ret_addr);
+        tcg_out_b(s, 0, tcg_code_gen_epilogue);
         break;
     case INDEX_op_goto_tb:
         if (s->tb_jmp_insn_offset) {
@@ -2410,7 +2416,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
             uint32_t insn = B;
 
             if (l->has_value) {
-                insn |= reloc_pc24_val(s->code_ptr, l->u.value_ptr);
+                insn |= reloc_pc24_val(tcg_splitwx_to_rx(s->code_ptr),
+                                       l->u.value_ptr);
             } else {
                 tcg_out_reloc(s, s->code_ptr, R_PPC_REL24, l, 0);
             }
-- 
2.25.1


