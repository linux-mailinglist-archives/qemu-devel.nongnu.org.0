Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014AC2E2911
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 23:47:20 +0100 (CET)
Received: from localhost ([::1]:59738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksZOB-0003bJ-2Q
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 17:47:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMI-0001q2-VN
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:23 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMG-0008II-CZ
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:22 -0500
Received: by mail-pj1-x1035.google.com with SMTP id iq13so1689788pjb.3
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 14:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZxnxrEch73n44hSgG+hf+ifeWy6oZuCkZecOY5agIjs=;
 b=Sf+bICKGInCgVFzj7eH6ia+j4xeF/NW8WkkJi1pDiVLBzhvp9Dn5qSWFFxlABWGEEi
 N08olB3yyJYZc0gxl1AwYyY+nSyYmvmUfH0MUcvWqxJuFZwyvhCXjzMOk5ykYIITC+d7
 QShW72wlERp+HhQHeaP9IZXPmpbzoD/wTv9cGuzDS+BJ8LWwxnI7KfRgq9ftlVNfjqWw
 MCN6Saiirqgu0a6qkKROrzLvzrPHZpP7SYsaReskuHRUdTGZRpxfeh/zJx7KeuJMnzD1
 M7lIw54n2sC5KZ+UloDrqapM2CYjDO5H2ydSFlcIfiVstYLwNpAmIbxDcSHu7lQpak+8
 kIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZxnxrEch73n44hSgG+hf+ifeWy6oZuCkZecOY5agIjs=;
 b=aUQVaAzZu33YFpyamp7VSwLH7h4uxMlCz7vnsZkttyOAfncKYnZUfWQzW88iZIf21a
 n6e5lG9pa44ejOYbfEk1PnoonWVcR/rtJqjT2hSKpYPcYD6G2U0S5kDwNcCkCk+bGB0m
 yhbqXXIwOXvCdMLtGyOlU86xTrBn4vc20Rq8axahUPBm25Wbye+Mn/qj7NPaPTnjh+8s
 Tul2uZeiyZkeFfEyfIH9DX+s+l/oB+OQ3NtmqQVwWyOVwMy1kRNNM+F9Xtny+UYZ7JX1
 3Wrl2Psz9acjiW/mxtqjxczuGbDRVV7uUCPYiVb4Yu50Rh2OX2JIzBx0K2B1cKYgtEXB
 o0eA==
X-Gm-Message-State: AOAM530nzG+eHCTrNx34HZsW30tczRDloNWzMMlGF2YPj1JwTnsssNJY
 JQh0EqViybwNuXFGRd0H+SIVAP/U13g/GA==
X-Google-Smtp-Source: ABdhPJwARmAI2+hw5bP26doW2djWpcwZuOCI3tLifGruhcmKUotAhCn4POyCFweLlDF28JxoRj9/tQ==
X-Received: by 2002:a17:90b:3687:: with SMTP id
 mj7mr6043376pjb.76.1608849918058; 
 Thu, 24 Dec 2020 14:45:18 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id w11sm11844123pge.28.2020.12.24.14.45.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 14:45:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/15] tcg/arm: Implement tcg_out_ld/st for vector types
Date: Thu, 24 Dec 2020 14:45:01 -0800
Message-Id: <20201224224514.626561-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224224514.626561-1-richard.henderson@linaro.org>
References: <20201224224514.626561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
index 48966da12f..7122d5f390 100644
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
@@ -1073,6 +1076,33 @@ static TCGCond tcg_out_cmp2(TCGContext *s, const TCGArg *args,
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
 
@@ -2184,16 +2214,44 @@ static void tcg_target_init(TCGContext *s)
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


