Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EAD67C3FD
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:43:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKu2A-00009h-U0; Wed, 25 Jan 2023 23:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu27-00007k-7x
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:38:43 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu22-0004Om-Kl
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:38:42 -0500
Received: by mail-pl1-x62e.google.com with SMTP id d9so896446pll.9
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HtofnOjW26HEs26DUdRP/wQozgYxE2HJ6TDjGcvyj3E=;
 b=vopGOk79IRE+FcWMcndRFzRuZ8Q2GTUOxxAw5Byz35WYY1PKwNC62H9SpvF6xNlyZg
 pIwtLLijnOUm3KOeqg13TXvATqK3FJcHiFUE5RkQaCukyxfIWrGmkdUDu9cdnIGZ3NdP
 8LlRMsXxogOUTKk3BkwHFJjk8nsAKF3XqLH4H5LEoBLX7DPp5C8Fpf+rughwKWe+BbhI
 S0A1ppfGpUtQkyy1iTu/li3io3wS1hVzrj5TQi0MCBk53ufbOvgkDkV0rHVlOk6IMIsE
 +h8l7u8YMziCYZioev4/a8cImmf+b8dmvgkMXdM+oQ2G9aSGFgG6fRrwliRyJQS7k9mg
 S1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HtofnOjW26HEs26DUdRP/wQozgYxE2HJ6TDjGcvyj3E=;
 b=sLm7i/t7tj2GZxfDpMDY2WLyec4Kn6KEm8T154GlQsvyh5YUVv0FQRPhEZl9KJV6pF
 Qd8YpxBJWB0OigShfV8VCQAgisPL4UTF+O/YEXNqkvP37OJ/9mzrt6Iq4ZbZOmBlK8hC
 Nwuo/6XSpzBrUFoU16q6wCbtVzGH7An9mxeYMqfYaxoWZ4c61ladvsYwciAlgGMEpCig
 48HHlEjxTRSqe+TSLKZ4PAOyzwfoHEhVJNFIbadb2AFJHZAe9S2GWzWBOZjpeS58essm
 4YYOPBQm6dGx20QkqYLpBP5Tof1S6ITitmj77ny6xjzpyTXOs+vZkrp76UTjIo5efQ0A
 0M7g==
X-Gm-Message-State: AO0yUKUAOkuzjeKtqHQ5NA03rZm2CWqmKR13vOHvDYJmlXJtPkor4rM5
 WQQUAkz3vQYK+Z77MBNvI8b2ZeVXXzivnAIEUCk=
X-Google-Smtp-Source: AK7set+DfQ4owLmqHqHj7WOI5bTr/uT5sRXQI5D99b/pdR6lpdm0Ic3uBWZqGbYMJDXXrrAH/bJFbQ==
X-Received: by 2002:a17:90b:1d08:b0:22c:1331:9c53 with SMTP id
 on8-20020a17090b1d0800b0022c13319c53mr3120257pjb.14.1674707917157; 
 Wed, 25 Jan 2023 20:38:37 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a17090a69c400b00228e56d375asm233376pjj.33.2023.01.25.20.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:38:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v5 06/36] tcg: Introduce tcg_target_call_oarg_reg
Date: Wed, 25 Jan 2023 18:37:54 -1000
Message-Id: <20230126043824.54819-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126043824.54819-1-richard.henderson@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Replace the flat array tcg_target_call_oarg_regs[] with
a function call including the TCGCallReturnKind.

Extend the set of registers for ARM to r0-r3 to match the ABI:
https://github.com/ARM-software/abi-aa/blob/main/aapcs32/aapcs32.rst#result-return

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        |  9 ++++++---
 tcg/aarch64/tcg-target.c.inc     | 10 +++++++---
 tcg/arm/tcg-target.c.inc         | 10 +++++++---
 tcg/i386/tcg-target.c.inc        | 16 ++++++++++------
 tcg/loongarch64/tcg-target.c.inc | 10 ++++++----
 tcg/mips/tcg-target.c.inc        | 10 ++++++----
 tcg/ppc/tcg-target.c.inc         | 10 ++++++----
 tcg/riscv/tcg-target.c.inc       | 10 ++++++----
 tcg/s390x/tcg-target.c.inc       |  9 ++++++---
 tcg/sparc64/tcg-target.c.inc     | 12 ++++++------
 tcg/tci/tcg-target.c.inc         | 12 ++++++------
 11 files changed, 72 insertions(+), 46 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 644dc53196..72ac76926a 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -151,6 +151,7 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
                         TCGReg base, intptr_t ofs);
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target,
                          const TCGHelperInfo *info);
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot);
 static bool tcg_target_const_match(int64_t val, TCGType type, int ct);
 #ifdef TCG_TARGET_NEED_LDST_LABELS
 static int tcg_out_ldst_finalize(TCGContext *s);
@@ -740,14 +741,16 @@ static void init_call_layout(TCGHelperInfo *info)
     case dh_typecode_s64:
         info->nr_out = 64 / TCG_TARGET_REG_BITS;
         info->out_kind = TCG_CALL_RET_NORMAL;
-        assert(info->nr_out <= ARRAY_SIZE(tcg_target_call_oarg_regs));
+        /* Query the last register now to trigger any assert early. */
+        tcg_target_call_oarg_reg(info->out_kind, info->nr_out - 1);
         break;
     case dh_typecode_i128:
         info->nr_out = 128 / TCG_TARGET_REG_BITS;
         info->out_kind = TCG_CALL_RET_NORMAL; /* TODO */
         switch (/* TODO */ TCG_CALL_RET_NORMAL) {
         case TCG_CALL_RET_NORMAL:
-            assert(info->nr_out <= ARRAY_SIZE(tcg_target_call_oarg_regs));
+            /* Query the last register now to trigger any assert early. */
+            tcg_target_call_oarg_reg(info->out_kind, info->nr_out - 1);
             break;
         case TCG_CALL_RET_BY_REF:
             /*
@@ -4585,7 +4588,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     case TCG_CALL_RET_NORMAL:
         for (i = 0; i < nb_oargs; i++) {
             TCGTemp *ts = arg_temp(op->args[i]);
-            TCGReg reg = tcg_target_call_oarg_regs[i];
+            TCGReg reg = tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, i);
 
             /* ENV should not be modified.  */
             tcg_debug_assert(!temp_readonly(ts));
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index bd6da72678..fde3b30ad1 100644
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
index 6e9e9b9b3f..d06ac60c15 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -79,9 +79,13 @@ static const int tcg_target_reg_alloc_order[] = {
 static const int tcg_target_call_iarg_regs[4] = {
     TCG_REG_R0, TCG_REG_R1, TCG_REG_R2, TCG_REG_R3
 };
-static const int tcg_target_call_oarg_regs[2] = {
-    TCG_REG_R0, TCG_REG_R1
-};
+
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
+    tcg_debug_assert(slot >= 0 && slot <= 3);
+    return TCG_REG_R0 + slot;
+}
 
 #define TCG_REG_TMP  TCG_REG_R12
 #define TCG_VEC_TMP  TCG_REG_Q15
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 7b573bd287..2f0a9521bf 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -109,12 +109,16 @@ static const int tcg_target_call_iarg_regs[] = {
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
+        tcg_debug_assert(slot >= 0 && slot <= 1);
+        return slot ? TCG_REG_EDX : TCG_REG_EAX;
+    default:
+        g_assert_not_reached();
+    }
+}
 
 /* Constants we accept.  */
 #define TCG_CT_CONST_S32 0x100
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index b6e2ff6213..c5f55afd68 100644
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
index d419c4c1fc..80748d892e 100644
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
index 85f84fe59e..f3fec14118 100644
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
index 383331025a..558de127ef 100644
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
index d8fd755ef0..844532156b 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -402,9 +402,12 @@ static const int tcg_target_call_iarg_regs[] = {
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
index 4b834f3f1e..ccc4144f7c 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -132,12 +132,12 @@ static const int tcg_target_call_iarg_regs[6] = {
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
index 33551b43dc..e3b0ff303f 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -200,12 +200,12 @@ static const int tcg_target_reg_alloc_order[] = {
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
+    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
+    tcg_debug_assert(slot >= 0 && slot < 64 / TCG_TARGET_REG_BITS);
+    return TCG_REG_R0 + slot;
+}
 
 #ifdef CONFIG_DEBUG_TCG
 static const char *const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
-- 
2.34.1


