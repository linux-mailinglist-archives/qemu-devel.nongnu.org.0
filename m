Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17116DB871
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 05:05:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkysL-0004A0-1u; Fri, 07 Apr 2023 23:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys7-00046c-5b
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:12 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys3-0004Wr-Tw
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:09 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-62e026c026fso273861b3a.0
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 20:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680923046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e/k0JGlbcsqGMaHltbL7Xp0AwaOGu40VP+SK9t+4TaA=;
 b=kzt3BqEeQcEofufPrw3vrT2rNOSw+xy4ch54VhPcozeJoLidfTxyloyPlNGyrge1oY
 sI81VPPzXbgco8goiZk67CDDJQV+lmBegLd1K1lGZmHpaB9ppVOA+sbxoUTJD+ioAW5/
 b4DCfpLfzAQa+Ir6dMFt3OCWAAzwYVGWEErm/T8Atzf5BSzCi34dIqVW94wd82KMP7Pi
 iMveu793cHi/Jh3+aMclxEvca7K3w8d0yoiT3Cdfk+mb/La/LsNFQYStO4Zzece43jWH
 bRGwPUeZv1jyqN7VDMVAGEaS+JE18Q7cPdVrrKRrh4+aFDyKjulww1dzYxV48+bXxlbP
 nmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680923046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e/k0JGlbcsqGMaHltbL7Xp0AwaOGu40VP+SK9t+4TaA=;
 b=ON8SDfVIhGzBgod/PG8zLHPqjtxLQQ6BAS7LHUbfOMg6TlPkjDeHp2IlgzckyHWGy+
 p5vlLnYB7Dvulx7D+6vi8QL0dYWIc+GKtpaX0ByyXl2yQKHi9T8lG4u5+wMVkVGNMlL7
 21A4F7LC2VPIxCannXryJjCwQDYL5dOUN9JGnnkrfIHVl+ZqnbYvO3frt4cMX7Hrq6/G
 GzxLhAcoEn7KDbp4WGB0Fv1SMOiM5l8mRxn/um6rQlE+/ETKVISJ7HFoRA5nKbS3QJwB
 dnF8i2azcBI+28kPw7WhoEitppndx73t4ZxO16x6tQ624loXedzEi/2sAWj4976kE5hb
 R/AQ==
X-Gm-Message-State: AAQBX9eYhTDcAUN4TIEINLQ2rBKy1edvBXeKoovzbNjvkd7vM6UlL1Dd
 +6F3AV1he3wZaCI9SFVMR2e83nz9D9uZb/xTicw=
X-Google-Smtp-Source: AKy350bXzSmuzcedjDJGOKXHtrWV26w7Wevq0oDMya1NelVncj5HXQQc/uC/mu/M/FRcdSgCRSu8Sg==
X-Received: by 2002:aa7:956b:0:b0:623:5880:98cd with SMTP id
 x11-20020aa7956b000000b00623588098cdmr940927pfq.5.1680923046508; 
 Fri, 07 Apr 2023 20:04:06 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 c12-20020aa78e0c000000b0062b5a55835dsm3687025pfr.213.2023.04.07.20.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 20:04:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org
Subject: [PATCH 07/12] tcg/mips: Use the constant pool for 64-bit constants
Date: Fri,  7 Apr 2023 20:03:54 -0700
Message-Id: <20230408030359.3368868-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408030359.3368868-1-richard.henderson@linaro.org>
References: <20230408030359.3368868-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

During normal processing, the constant pool is accessible via
TCG_REG_TB.  During the prologue, it is accessible via TCG_REG_T9.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.h     |  1 +
 tcg/mips/tcg-target.c.inc | 65 +++++++++++++++++++++++++++++----------
 2 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 8cdc803523..88a8137bcc 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -207,5 +207,6 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
 #define TCG_TARGET_NEED_LDST_LABELS
+#define TCG_TARGET_NEED_POOL_LABELS
 
 #endif
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 78710a25bf..235295c689 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -25,6 +25,7 @@
  */
 
 #include "../tcg-ldst.c.inc"
+#include "../tcg-pool.c.inc"
 
 #if HOST_BIG_ENDIAN
 # define MIPS_BE  1
@@ -168,9 +169,18 @@ static bool reloc_pc16(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
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
@@ -490,6 +500,11 @@ static void tcg_out_nop(TCGContext *s)
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
@@ -547,8 +562,15 @@ static bool tcg_out_movi_two(TCGContext *s, TCGReg ret, tcg_target_long arg)
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
@@ -558,18 +580,17 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
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
 
 static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
@@ -2693,10 +2714,20 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
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
2.34.1


