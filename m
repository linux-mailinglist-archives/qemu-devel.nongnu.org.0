Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77A9312969
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:34:37 +0100 (CET)
Received: from localhost ([::1]:41864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xJs-0000Yn-UK
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:34:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZN-0003mS-3g
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:33 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZL-0008Vu-A8
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:32 -0500
Received: by mail-pl1-x636.google.com with SMTP id b8so7011595plh.12
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9bijHvwBQCD14g7ZYkVUD/H8VwEqKYEjAl6bbEzCNaE=;
 b=hxdxnbLiLpfzxsjOC26i7Ae+oEYcniiarqUCQwyYnyXnHTZTjDQI5rvN7MeM921gOi
 vG5UYXCOWG3CwaGA2TrRMDJ8No9gN1Ov68yyAJXYtaHxZ3U00tu4Td2kaZb1cr3z+Kuy
 8hmGrRKcpwv60YE8yjvoUh5jHM3eM8DU/bqLTwkwABNxLdXL49IZUe/EWSN8G4GYGj9/
 m/ZJkGJv3kPRp0BB5btAMQKydYioREirBLZc1qOkm7SdIQnvTmkN+zC1yccJrP4qST9W
 OwaSDccZt4cU3fdxz/QaIh4p6NKz1hfFw4CzHY2qiSXo+MLB7CyYglGi0M9HBe19G74N
 EC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9bijHvwBQCD14g7ZYkVUD/H8VwEqKYEjAl6bbEzCNaE=;
 b=NK9vqOaK0BYQsf/t3oqjibplRZWzLYtgkCGhh2IqThKKIQDoqTBREcLQP1utd9vhCr
 MSsIJ8/6LDnMVBQ1A3J04l8sseFQiXQUECVLA0otvzObggEfgWz04gK1nPPd5zPIMnLs
 AyTE79mly9yqyJo1EGHiOZq8fTse+HxSDnVA8CSVVCmkO1fb6TNU7c+EYlnRAgcayxUY
 WOOddFhvJMpAIV21Vi6W1JETgCHQA8zMehRonwShb8zdus9dlk7wGjHJVYEYOAAcKUnf
 tJLDDQJoVrCSQH3dwEnRiJapQ+PJoEzI6JhUZPrth2K8HuGX3ssjajAYYZnUGOzv4nSJ
 3Wlw==
X-Gm-Message-State: AOAM531poN73YmgmCjCNWhCUmGSB6Nc5rE3Fq76pH4oeKB2LTLu6ggPp
 6BVPRLcwe4Ug4Xd6QzTAnFz1GFWtgGdxCA==
X-Google-Smtp-Source: ABdhPJwnZZ5BmZjn7RoHzrVlT4S4xsqtwarfg26Kj5rUVZOL+yA4GA7u3rL4p6DjF43FK0z4Kv7Zkw==
X-Received: by 2002:a17:902:724c:b029:e1:4aae:c72 with SMTP id
 c12-20020a170902724cb02900e14aae0c72mr14193565pll.81.1612752389825; 
 Sun, 07 Feb 2021 18:46:29 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id h8sm8966092pfv.154.2021.02.07.18.46.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:46:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/15] tcg/arm: Implement tcg_out_ld/st for vector types
Date: Sun,  7 Feb 2021 18:46:13 -0800
Message-Id: <20210208024625.271018-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208024625.271018-1-richard.henderson@linaro.org>
References: <20210208024625.271018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
 tcg/arm/tcg-target.c.inc | 70 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 64 insertions(+), 6 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 9bb354abce..ca9a71ca64 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -175,6 +175,9 @@ typedef enum {
     INSN_NOP_v6k   = 0xe320f000,
     /* Otherwise the assembler uses mov r0,r0 */
     INSN_NOP_v4    = (COND_AL << 28) | ARITH_MOV,
+
+    INSN_VLD1      = 0xf4200000,  /* VLD1 (multiple single elements) */
+    INSN_VST1      = 0xf4000000,  /* VST1 (multiple single elements) */
 } ARMInsn;
 
 #define INSN_NOP   (use_armv7_instructions ? INSN_NOP_v6k : INSN_NOP_v4)
@@ -1096,6 +1099,33 @@ static TCGCond tcg_out_cmp2(TCGContext *s, const TCGArg *args,
     }
 }
 
+/*
+ * Note that TCGReg references Q-registers.
+ * Q-regno = 2 * D-regno, so shift left by 1 whlie inserting.
+ */
+static uint32_t encode_vd(TCGReg rd)
+{
+    tcg_debug_assert(rd >= TCG_REG_Q0);
+    return (extract32(rd, 3, 1) << 22) | (extract32(rd, 0, 3) << 13);
+}
+
+static void tcg_out_vldst(TCGContext *s, ARMInsn insn,
+                          TCGReg rd, TCGReg rn, int offset)
+{
+    if (offset != 0) {
+        if (check_fit_imm(offset) || check_fit_imm(-offset)) {
+            tcg_out_dat_rIN(s, COND_AL, ARITH_ADD, ARITH_SUB,
+                            TCG_REG_TMP, rn, offset, true);
+        } else {
+            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP, offset);
+            tcg_out_dat_reg(s, COND_AL, ARITH_ADD,
+                            TCG_REG_TMP, TCG_REG_TMP, rn, 0);
+        }
+        rn = TCG_REG_TMP;
+    }
+    tcg_out32(s, insn | (rn << 16) | encode_vd(rd) | 0xf);
+}
+
 #ifdef CONFIG_SOFTMMU
 #include "../tcg-ldst.c.inc"
 
@@ -2207,16 +2237,44 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(s->reserved_regs, TCG_VEC_TMP);
 }
 
-static inline void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
-                              TCGReg arg1, intptr_t arg2)
+static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
+                       TCGReg arg1, intptr_t arg2)
 {
-    tcg_out_ld32u(s, COND_AL, arg, arg1, arg2);
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_out_ld32u(s, COND_AL, arg, arg1, arg2);
+        return;
+    case TCG_TYPE_V64:
+        /* regs 1; size 8; align 8 */
+        tcg_out_vldst(s, INSN_VLD1 | 0x7d0, arg, arg1, arg2);
+        return;
+    case TCG_TYPE_V128:
+        /* regs 2; size 8; align 16 */
+        tcg_out_vldst(s, INSN_VLD1 | 0xae0, arg, arg1, arg2);
+        return;
+    default:
+        g_assert_not_reached();
+    }
 }
 
-static inline void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
-                              TCGReg arg1, intptr_t arg2)
+static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
+                       TCGReg arg1, intptr_t arg2)
 {
-    tcg_out_st32(s, COND_AL, arg, arg1, arg2);
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_out_st32(s, COND_AL, arg, arg1, arg2);
+        return;
+    case TCG_TYPE_V64:
+        /* regs 1; size 8; align 8 */
+        tcg_out_vldst(s, INSN_VST1 | 0x7d0, arg, arg1, arg2);
+        return;
+    case TCG_TYPE_V128:
+        /* regs 2; size 8; align 16 */
+        tcg_out_vldst(s, INSN_VST1 | 0xae0, arg, arg1, arg2);
+        return;
+    default:
+        g_assert_not_reached();
+    }
 }
 
 static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
-- 
2.25.1


