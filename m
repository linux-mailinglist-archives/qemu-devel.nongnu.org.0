Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEF46063A5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:58:15 +0200 (CEST)
Received: from localhost ([::1]:52846 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWzj-0007at-VF
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:58:05 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWio-000333-SG
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU89-0005Xx-K3
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:54 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:39832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU87-00018n-Hq
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:33 -0400
Received: by mail-pg1-x533.google.com with SMTP id b5so18994967pgb.6
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VOKmoswrOKS7Hg0NdJ/RYFv+IzYKkD11gmIxifqiy40=;
 b=ztJMQVWSVQpPIQPY9i0xBaT7jxrGUOhMFfWbE8VtPPDDRQVdSpvLU9Zk3WFteLa8DZ
 HIsKaK2dzTcDrXUh7HFuNh1fV4aYMwYSI+gEZhvmNhBjdBbNJm/+dfl8VbqZESLQRllM
 QnPULF2SetD8aEoZrbK38i6gFm1w+uws11nPescqll+9Q+q8f1dOYCEEGpCGvrbJStds
 GnofaF2hjDtvyztNS4221+/jBfiUv2/bhbbDWm4Fr4Gh75mM9+AYtJHsetrXlzQ2ioj3
 fwosjmti/ikaStGr27TJRgaOT/MO3Wga6868oC2kgmyfbQeUyB+wuZeBysraSP28tdmN
 OBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VOKmoswrOKS7Hg0NdJ/RYFv+IzYKkD11gmIxifqiy40=;
 b=8QnMS37lGNKzhxIpPFDmX4xfRTtOr4saYfeRtf2Zd/CnZyN0V00ZxHLcseD4MZws2e
 tc3cBiCYdDuEjYepNfF+nbP3KBwIvInhA/tVZeAqw39+FLhvnB57fPq472nn1RTpBltf
 WbO5l/dRowbo/EM8/VLlEmi5jGV6C3LwC6aZ3737YVAfIj/I6ecH7CeFfzYYK/Srp/Nm
 wc3s6fTkScUj4RNGUFHd6WI7LzAOchkxP/199Irc9xD43+Vn6RaytgQyV0h4jddwCtps
 9pA26XSu6dwsFtT7MLZRqhdiqvcN7A3KjzbYWddolmx82iPWPKdMiZmgieoqC7Sxef3V
 P05Q==
X-Gm-Message-State: ACrzQf1CdVE1OLez1z9t4y2BHqOfZLRHrLM5CvNl1w1R6fisr+cqkNFw
 vktaP/S8YgvEuqwH63AziQ+6kThO5zC7WUtB
X-Google-Smtp-Source: AMsMyM5/eqo3I+OJDxU0HJONn7telgXloDlnFGCaKNQ/KpymBmJlDCl3ZvijN8xw7MM2JTD63t8Xdg==
X-Received: by 2002:aa7:86d4:0:b0:562:c5e2:a986 with SMTP id
 h20-20020aa786d4000000b00562c5e2a986mr13529852pfo.61.1666266869897; 
 Thu, 20 Oct 2022 04:54:29 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.54.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:54:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/31] tcg: Introduce tcg_target_call_oarg_reg
Date: Thu, 20 Oct 2022 21:52:37 +1000
Message-Id: <20221020115242.2301066-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace the flat array tcg_target_call_oarg_regs[] with
a function call including the TCGCallReturnKind.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        | 14 ++++++++------
 tcg/aarch64/tcg-target.c.inc     | 10 +++++++---
 tcg/arm/tcg-target.c.inc         |  9 ++++++---
 tcg/i386/tcg-target.c.inc        | 22 ++++++++++++++++------
 tcg/loongarch64/tcg-target.c.inc | 10 ++++++----
 tcg/mips/tcg-target.c.inc        | 10 ++++++----
 tcg/ppc/tcg-target.c.inc         | 10 ++++++----
 tcg/riscv/tcg-target.c.inc       | 10 ++++++----
 tcg/s390x/tcg-target.c.inc       |  9 ++++++---
 tcg/sparc64/tcg-target.c.inc     | 12 ++++++------
 tcg/tci/tcg-target.c.inc         | 11 +++++------
 11 files changed, 78 insertions(+), 49 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index c664e3b18d..47f1f906fd 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -148,6 +148,7 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
                         TCGReg base, intptr_t ofs);
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target,
                          const TCGHelperInfo *info);
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot);
 static bool tcg_target_const_match(int64_t val, TCGType type, int ct);
 #ifdef TCG_TARGET_NEED_LDST_LABELS
 static int tcg_out_ldst_finalize(TCGContext *s);
@@ -749,11 +750,11 @@ static void init_call_layout(TCGHelperInfo *info)
         switch (/* TODO */ TCG_CALL_RET_NORMAL) {
         case TCG_CALL_RET_NORMAL:
             if (TCG_TARGET_REG_BITS == 32) {
-                assert(ARRAY_SIZE(tcg_target_call_oarg_regs) >= 4);
                 info->out_kind = TCG_CALL_RET_NORMAL_4;
-            } else {
-                assert(ARRAY_SIZE(tcg_target_call_oarg_regs) >= 2);
             }
+            /* Query the register now to trigger any assert early. */
+            (void)tcg_target_call_oarg_reg(info->out_kind,
+                                           127 / TCG_TARGET_REG_BITS);
             break;
         case TCG_CALL_RET_BY_REF:
             /*
@@ -2826,7 +2827,7 @@ static void liveness_pass_1(TCGContext *s)
                     ts->state = TS_DEAD;
                     la_reset_pref(ts);
 
-                    /* Not used -- it will be tcg_target_call_oarg_regs[i].  */
+                    /* Not used -- it will be tcg_target_call_oarg_reg().  */
                     op->output_pref[i] = 0;
                 }
 
@@ -4640,7 +4641,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     case TCG_CALL_RET_NORMAL:
         for (i = 0; i < nb_oargs; i++) {
             TCGTemp *ts = arg_temp(op->args[i]);
-            TCGReg reg = tcg_target_call_oarg_regs[i];
+            TCGReg reg = tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, i);
 
             /* ENV should not be modified.  */
             tcg_debug_assert(!temp_readonly(ts));
@@ -4666,7 +4667,8 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
                 temp_allocate_frame(s, ts);
             }
             for (i = 0; i < 4; i++) {
-                tcg_out_st(s, TCG_TYPE_I32, tcg_target_call_oarg_regs[i],
+                tcg_out_st(s, TCG_TYPE_I32,
+                           tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL_4, i),
                            ts->mem_base->reg, ts->mem_offset + i * 4);
             }
             ts->val_type = TEMP_VAL_MEM;
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index f089a74f0e..dc99fa3257 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -63,9 +63,13 @@ static const int tcg_target_call_iarg_regs[8] = {
     TCG_REG_X0, TCG_REG_X1, TCG_REG_X2, TCG_REG_X3,
     TCG_REG_X4, TCG_REG_X5, TCG_REG_X6, TCG_REG_X7
 };
-static const int tcg_target_call_oarg_regs[1] = {
-    TCG_REG_X0
-};
+
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
+    tcg_debug_assert(slot >= 0 && slot <= 1);
+    return TCG_REG_X0 + slot;
+}
 
 #define TCG_REG_TMP TCG_REG_X30
 #define TCG_VEC_TMP TCG_REG_V31
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 2950a29d49..41d3af517d 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -79,9 +79,12 @@ static const int tcg_target_reg_alloc_order[] = {
 static const int tcg_target_call_iarg_regs[4] = {
     TCG_REG_R0, TCG_REG_R1, TCG_REG_R2, TCG_REG_R3
 };
-static const int tcg_target_call_oarg_regs[2] = {
-    TCG_REG_R0, TCG_REG_R1
-};
+
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    tcg_debug_assert(slot >= 0 && slot <= 3);
+    return TCG_REG_R0 + slot;
+}
 
 #define TCG_REG_TMP  TCG_REG_R12
 #define TCG_VEC_TMP  TCG_REG_Q15
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 6a021dda8b..82c8491152 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -109,12 +109,22 @@ static const int tcg_target_call_iarg_regs[] = {
 #endif
 };
 
-static const int tcg_target_call_oarg_regs[] = {
-    TCG_REG_EAX,
-#if TCG_TARGET_REG_BITS == 32
-    TCG_REG_EDX
-#endif
-};
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    switch (kind) {
+    case TCG_CALL_RET_NORMAL:
+        switch (slot) {
+        case 0:
+            return TCG_REG_EAX;
+        case 1:
+            return TCG_REG_EDX;
+        }
+        break;
+    default:
+        break;
+    }
+    g_assert_not_reached();
+}
 
 /* Constants we accept.  */
 #define TCG_CT_CONST_S32 0x100
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 967bf307b8..2efefe863e 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -114,10 +114,12 @@ static const int tcg_target_call_iarg_regs[] = {
     TCG_REG_A7,
 };
 
-static const int tcg_target_call_oarg_regs[] = {
-    TCG_REG_A0,
-    TCG_REG_A1,
-};
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
+    tcg_debug_assert(slot >= 0 && slot <= 1);
+    return TCG_REG_A0 + slot;
+}
 
 #ifndef CONFIG_SOFTMMU
 #define USE_GUEST_BASE     (guest_base != 0)
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 22b5463f0f..92883176c6 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -136,10 +136,12 @@ static const TCGReg tcg_target_call_iarg_regs[] = {
 #endif
 };
 
-static const TCGReg tcg_target_call_oarg_regs[2] = {
-    TCG_REG_V0,
-    TCG_REG_V1
-};
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
+    tcg_debug_assert(slot >= 0 && slot <= 1);
+    return TCG_REG_V0 + slot;
+}
 
 static const tcg_insn_unit *tb_ret_addr;
 static const tcg_insn_unit *bswap32_addr;
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index d9e4ba8883..781ecfe161 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -186,10 +186,12 @@ static const int tcg_target_call_iarg_regs[] = {
     TCG_REG_R10
 };
 
-static const int tcg_target_call_oarg_regs[] = {
-    TCG_REG_R3,
-    TCG_REG_R4
-};
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
+    tcg_debug_assert(slot >= 0 && slot <= 1);
+    return TCG_REG_R3 + slot;
+}
 
 static const int tcg_target_callee_save_regs[] = {
 #ifdef _CALL_DARWIN
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 6072945ccb..417736cae7 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -113,10 +113,12 @@ static const int tcg_target_call_iarg_regs[] = {
     TCG_REG_A7,
 };
 
-static const int tcg_target_call_oarg_regs[] = {
-    TCG_REG_A0,
-    TCG_REG_A1,
-};
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
+    tcg_debug_assert(slot >= 0 && slot <= 1);
+    return TCG_REG_A0 + slot;
+}
 
 #define TCG_CT_CONST_ZERO  0x100
 #define TCG_CT_CONST_S12   0x200
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 8663a963a6..50655e9d1d 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -390,9 +390,12 @@ static const int tcg_target_call_iarg_regs[] = {
     TCG_REG_R6,
 };
 
-static const int tcg_target_call_oarg_regs[] = {
-    TCG_REG_R2,
-};
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
+    tcg_debug_assert(slot == 0);
+    return TCG_REG_R2;
+}
 
 #define S390_CC_EQ      8
 #define S390_CC_LT      4
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index f6a8a8e605..9b5afb8248 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -133,12 +133,12 @@ static const int tcg_target_call_iarg_regs[6] = {
     TCG_REG_O5,
 };
 
-static const int tcg_target_call_oarg_regs[] = {
-    TCG_REG_O0,
-    TCG_REG_O1,
-    TCG_REG_O2,
-    TCG_REG_O3,
-};
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
+    tcg_debug_assert(slot >= 0 && slot <= 3);
+    return TCG_REG_O0 + slot;
+}
 
 #define INSN_OP(x)  ((x) << 30)
 #define INSN_OP2(x) ((x) << 22)
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 8bf02a96e9..914806c216 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -204,12 +204,11 @@ static const int tcg_target_reg_alloc_order[] = {
 /* No call arguments via registers.  All will be stored on the "stack". */
 static const int tcg_target_call_iarg_regs[] = { };
 
-static const int tcg_target_call_oarg_regs[] = {
-    TCG_REG_R0,
-#if TCG_TARGET_REG_BITS == 32
-    TCG_REG_R1
-#endif
-};
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    tcg_debug_assert(slot >= 0 && slot <= 3);
+    return TCG_REG_R0 + slot;
+}
 
 #ifdef CONFIG_DEBUG_TCG
 static const char *const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
-- 
2.34.1


