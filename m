Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31FC681D36
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:50:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc1Q-0001u8-8a; Mon, 30 Jan 2023 16:49:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1O-0001tM-K4
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:02 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1M-0005bL-HT
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:02 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 cq16-20020a17090af99000b0022c9791ac39so4585562pjb.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+MGF5fY7CpzMCha1QCJz5b5ZUtyWP+UPCXR4xqFsxtY=;
 b=LySnqB4TkC0+PAm6nils1l05yu3Crs0zHeeXXbOrEV2i7Y8/zsqih5QWqrpWVcxc/5
 8QuT14+BxFq7N+tQIKpSS1xqkanBPjOU8Qxii0z90coSDPLwXyTIYD5kQ8lzKdbwKgcC
 JLvQBN+1alYp8AW5LiF+kqdGlBo4akjM+8R4TDFyqEzu/xWL16OlYld0JzNRJg99/iSC
 PUkxdRXSkwveipn1q/U4sML4kvp6SkPplTFOCblo+JYgbQjwDD1TFXb7kWJAfSoEWqBe
 4B2bVkfuY9psGsgKvmgRIdA66Ao8hh6eZ1dy7c6K1btlwniKlOjLP3QrpTl3XowzSk8x
 g5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+MGF5fY7CpzMCha1QCJz5b5ZUtyWP+UPCXR4xqFsxtY=;
 b=IUJTGL7Y2Kmo+b99f/6J5bHOp4QwKPyqYQKodqLxKJ6BfhPgZdafZe3T42VGX6N/aG
 MKwtih4TWnnXjIGKwg+5WQXzyRyf9cwbOT2N8aNDWsWU+OpnuJ1DPnO7LxyUBMwIZUKB
 g+ggCuihtKoYziBx8nr19rHKpkxeRIABbD3aNTZMczbACPftz1ZbUrwtW3WZnXghGx+R
 ti+ASm6MfTBSk9+xWQ2pyYSIb8WMzwXnSUotk96nqYQR/sdQV6CKPa+pkrVtX5IWBVoX
 5neWgk/GtNH9n26TVyPv8M/qH1RH/m9bIbRnOJpEKvjvELju7TSjTHGuq1SM6O7X960T
 tg2Q==
X-Gm-Message-State: AFqh2krbtPYJ37krj2e3qXoAiqYYq/gJ9dC50AiSVXzqsJ308b09BqJh
 VrsOsmmXgoEfQ0m2f3NgJUcsgFZqlo0q31Ep
X-Google-Smtp-Source: AMrXdXv1zzl2AhH99tHxXgGasowtNXaApnO2INZne2xHFZYUEeTbRMDuw3z0B7axotQf/jKJvIH0uQ==
X-Received: by 2002:a17:90a:b798:b0:229:d641:9ef2 with SMTP id
 m24-20020a17090ab79800b00229d6419ef2mr45754229pjr.40.1675115339009; 
 Mon, 30 Jan 2023 13:48:59 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090ad14400b00219220edf0dsm7451215pjw.48.2023.01.30.13.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:48:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v6 06/36] tcg: Introduce tcg_target_call_oarg_reg
Date: Mon, 30 Jan 2023 11:48:14 -1000
Message-Id: <20230130214844.1158612-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130214844.1158612-1-richard.henderson@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
index 7db48f3305..5d321e7e82 100644
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
@@ -4589,7 +4592,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
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


