Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECE648829B
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:50:04 +0100 (CET)
Received: from localhost ([::1]:54814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n66aG-00084n-V1
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:56:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65Lf-0005iB-9f
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:37:09 -0500
Received: from [2607:f8b0:4864:20::529] (port=33755
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65Lc-000493-Pi
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:37:07 -0500
Received: by mail-pg1-x529.google.com with SMTP id i30so7711793pgl.0
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 22:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JsQkGFvS1Fhc2RIvE2HvJnqLrbMFFGBcon9lp8/VH2c=;
 b=tsbKgldvf6L+GXkKXTi8v2C2D159nx4nVJKDlZhbfqvgQjflbcKJGrcGGjupWPXvTy
 +cHiiTW6gKSGl8XkMt2Kjbc8hcqpYvxSq+b+lRZR2OZRrU0BT97v0VZl/mAgtPOg2VeP
 D0fzkq1vfakGDFf//UB7QJJXC8TEg9J9a6mkL2hC+cV0Sfq0A+aOIrGl5r7RY6SvHyDx
 YfBT6+4oEzeFJDlAM27LZ8PezN/fbbijzHe3auKsyU0NqfzEawVNBonev/LzxoE7SPN+
 mqaD6lYkyttaDuydegcKaDvDAm2DOHJIkEFlm+McORLGSyahsOiEhypwL5PF/IogxUMm
 hs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JsQkGFvS1Fhc2RIvE2HvJnqLrbMFFGBcon9lp8/VH2c=;
 b=uBPlylTZXWzW+rxCdyugh9EbDltHyY/Fjcn+PUNVvPRNy+ksZCrALZkNfQYORNdXv1
 h2aZpgMBXArlvDMmgZPfcZckB0MGd2K6hEE0O9wrE4JpFyPhW7cUI4bIUOcExXPuSYTW
 ZVBTrMPiHqvf2DqDdCqx30X+2J1U8bD3q8nW/pfARcrOG0Nt8gtTxXnrF/jv7FT8sD/P
 9gOVUC9QihzrVVBlG18CBbVEgVJJqMEylqOpoK5WDaDxkkAlqqokr1D1tB47fXClu3a5
 ICvTdTIyv/jAFD1LGw/u8kLKp+KNJ7IaiyKBewWbd4vDmHYRKbr0fEh8qbG3tJc043+E
 62Xg==
X-Gm-Message-State: AOAM533ugn/7xaGhABDDHrhLhcpF3/FweXXlZ+B6ImjE65htxJgLLduj
 XRF03N2heb7Fcer9kAAWcWh4xYQ7eva+yw==
X-Google-Smtp-Source: ABdhPJzsqLHw6UcLlkycKzDD9jPQ4PWQ6kSjTuug8BYdz7eygXJ582MhV6EabJ9AR4M0TAlGc7iPpA==
X-Received: by 2002:a63:7250:: with SMTP id c16mr1438071pgn.359.1641623820213; 
 Fri, 07 Jan 2022 22:37:00 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z4sm840954pfh.215.2022.01.07.22.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 22:36:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/12] tcg/mips: Use the constant pool for 64-bit constants
Date: Fri,  7 Jan 2022 22:36:41 -0800
Message-Id: <20220108063644.478043-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220108063644.478043-1-richard.henderson@linaro.org>
References: <20220108063644.478043-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During normal processing, the constant pool is accessible via
TCG_REG_TB.  During the prologue, it is accessible via TCG_REG_T9.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.h     |  1 +
 tcg/mips/tcg-target.c.inc | 65 +++++++++++++++++++++++++++++----------
 2 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 28c42e23e1..839364b493 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -208,5 +208,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t)
     QEMU_ERROR("code path is reachable");
 
 #define TCG_TARGET_NEED_LDST_LABELS
+#define TCG_TARGET_NEED_POOL_LABELS
 
 #endif
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 142583b613..41cb155eb0 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -25,6 +25,7 @@
  */
 
 #include "../tcg-ldst.c.inc"
+#include "../tcg-pool.c.inc"
 
 #ifdef HOST_WORDS_BIGENDIAN
 # define MIPS_BE  1
@@ -166,9 +167,18 @@ static bool reloc_pc16(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
 static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
                         intptr_t value, intptr_t addend)
 {
-    tcg_debug_assert(type == R_MIPS_PC16);
-    tcg_debug_assert(addend == 0);
-    return reloc_pc16(code_ptr, (const tcg_insn_unit *)value);
+    value += addend;
+    switch (type) {
+    case R_MIPS_PC16:
+        return reloc_pc16(code_ptr, (const tcg_insn_unit *)value);
+    case R_MIPS_16:
+        if (value != (int16_t)value) {
+            return false;
+        }
+        *code_ptr = deposit32(*code_ptr, 0, 16, value);
+        return true;
+    }
+    g_assert_not_reached();
 }
 
 #define TCG_CT_CONST_ZERO 0x100
@@ -500,6 +510,11 @@ static void tcg_out_nop(TCGContext *s)
     tcg_out32(s, 0);
 }
 
+static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
+{
+    memset(p, 0, count * sizeof(tcg_insn_unit));
+}
+
 static void tcg_out_dsll(TCGContext *s, TCGReg rd, TCGReg rt, TCGArg sa)
 {
     tcg_out_opc_sa64(s, OPC_DSLL, OPC_DSLL32, rd, rt, sa);
@@ -557,8 +572,15 @@ static bool tcg_out_movi_two(TCGContext *s, TCGReg ret, tcg_target_long arg)
     return false;
 }
 
-static void tcg_out_movi(TCGContext *s, TCGType type,
-                         TCGReg ret, tcg_target_long arg)
+static void tcg_out_movi_pool(TCGContext *s, TCGReg ret,
+                              tcg_target_long arg, TCGReg tbreg)
+{
+    new_pool_label(s, arg, R_MIPS_16, s->code_ptr, tcg_tbrel_diff(s, NULL));
+    tcg_out_opc_imm(s, OPC_LD, ret, tbreg, 0);
+}
+
+static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
+                             tcg_target_long arg, TCGReg tbreg)
 {
     if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I32) {
         arg = (int32_t)arg;
@@ -568,18 +590,17 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     if (tcg_out_movi_two(s, ret, arg)) {
         return;
     }
+    assert(TCG_TARGET_REG_BITS == 64);
 
-    tcg_out_movi(s, TCG_TYPE_I32, ret, arg >> 31 >> 1);
-    if (arg & 0xffff0000ull) {
-        tcg_out_dsll(s, ret, ret, 16);
-        tcg_out_opc_imm(s, OPC_ORI, ret, ret, arg >> 16);
-        tcg_out_dsll(s, ret, ret, 16);
-    } else {
-        tcg_out_dsll(s, ret, ret, 32);
-    }
-    if (arg & 0xffff) {
-        tcg_out_opc_imm(s, OPC_ORI, ret, ret, arg & 0xffff);
-    }
+    /* Otherwise, put 64-bit constants into the constant pool. */
+    tcg_out_movi_pool(s, ret, arg, tbreg);
+}
+
+static void tcg_out_movi(TCGContext *s, TCGType type,
+                         TCGReg ret, tcg_target_long arg)
+{
+    TCGReg tbreg = TCG_TARGET_REG_BITS == 64 ? TCG_REG_TB : 0;
+    tcg_out_movi_int(s, type, ret, arg, tbreg);
 }
 
 static void tcg_out_bswap16(TCGContext *s, TCGReg ret, TCGReg arg, int flags)
@@ -2748,10 +2769,20 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
 #ifndef CONFIG_SOFTMMU
     if (guest_base != (int16_t)guest_base) {
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base);
+        /*
+         * The function call abi for n32 and n64 will have loaded $25 (t9)
+         * with the address of the prologue, so we can use that instead
+         * of TCG_REG_TB.
+         */
+#if TCG_TARGET_REG_BITS == 64 && !defined(__mips_abicalls)
+# error "Unknown mips abi"
+#endif
+        tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base,
+                         TCG_TARGET_REG_BITS == 64 ? TCG_REG_T9 : 0);
         tcg_regset_set_reg(s->reserved_regs, TCG_GUEST_BASE_REG);
     }
 #endif
+
     if (TCG_TARGET_REG_BITS == 64) {
         tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_TB, tcg_target_call_iarg_regs[1]);
     }
-- 
2.25.1


