Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDA368AB46
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:36:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLU1-00056C-1v; Sat, 04 Feb 2023 11:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTl-000516-Rq
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:39 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTh-0002Ug-CV
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:28 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 l4-20020a17090a850400b0023013402671so11503511pjn.5
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uTUI5NPJi2HVXTCnEya9QxMkhZXdzYVdxv5Bf9XLZnM=;
 b=tsoGHLaDJ5tLISsgan4ft9+WZgy9Pfem7VWdnYl1f5iBdmJt7l6OhTfUVIzNtTVnIX
 K406CkunXwMduePCvBmACt6nlPHKsEL5dkz0iMkp8rQiwXPETus2qrccUK+m/dshMxnE
 QjIOZVqgaRnyZSvCTKHE4a+Mq/8nUJpgCvyENUVikQu2sr5p+HuywSIVle1FjBSjI0vG
 ZZ2AtdoTCPiyJSNVoxfibc2jMaWMN03E4lMGqBwXh/Sq54sZTO+kiuqk9tbYRwq5n7Do
 871PvW/if149wG4+6+0U0vsF+Np9Q3QiKf3+vefnnBg/7nUSCYFMadYJlMVmvwMcz6kq
 oM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uTUI5NPJi2HVXTCnEya9QxMkhZXdzYVdxv5Bf9XLZnM=;
 b=Hje0SeU+oWVvUpd7f3/tKFcS9bhirCx4k4C0KTgtF+pwV7+OSsHkuKRDPSvaqg+o0O
 JoxSePCblN0XmaIaUFgbmKPN1v9lAyoHRy3qR40cKpvIdaF0z7q+1geNvcExsm6QRSyH
 N+uoL6mQfErOyyxRUCXfxyRK/F88GNEycdVsx1l3y/vWX62S+3wGjj6mIu/zdW6vChSb
 KduqYxjcdefZmZ1RCnHD8r6p+3wOMEFYI5b+8JIgqQvh1SOX0kPZZdANAcJusiQeRZYR
 uanfhjwiPZyVpltnNYx3ZNy9TcxuUt6qn4MgX0xdG0z8HgpbDC4bLUKrfegCFhPI/Rju
 bHTA==
X-Gm-Message-State: AO0yUKXCDuP7mDlvkFQfEPcRCmpaLcQ7oinhWoisdDR+0MXtWAu938op
 2OFfrwVmvRw0waOoSPTFcoLM07qeT7uFot0g
X-Google-Smtp-Source: AK7set90d4Q59gsRPXDDfaybn/t84u8ChaDACTo/6xW3bl4t1Zf4K8AwPS70NRTIznFVClfTnGeOxA==
X-Received: by 2002:a17:902:ca92:b0:198:f027:5926 with SMTP id
 v18-20020a170902ca9200b00198f0275926mr2095640pld.67.1675528403359; 
 Sat, 04 Feb 2023 08:33:23 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:33:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 06/40] tcg: Introduce tcg_out_addi_ptr
Date: Sat,  4 Feb 2023 06:32:36 -1000
Message-Id: <20230204163310.815536-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Implement the function for arm, i386, and s390x, which will use it.
Add stubs for all other backends.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        |  2 ++
 tcg/aarch64/tcg-target.c.inc     |  7 +++++++
 tcg/arm/tcg-target.c.inc         | 20 ++++++++++++++++++++
 tcg/i386/tcg-target.c.inc        |  8 ++++++++
 tcg/loongarch64/tcg-target.c.inc |  7 +++++++
 tcg/mips/tcg-target.c.inc        |  7 +++++++
 tcg/ppc/tcg-target.c.inc         |  7 +++++++
 tcg/riscv/tcg-target.c.inc       |  7 +++++++
 tcg/s390x/tcg-target.c.inc       |  7 +++++++
 tcg/sparc64/tcg-target.c.inc     |  7 +++++++
 tcg/tci/tcg-target.c.inc         |  7 +++++++
 11 files changed, 86 insertions(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index cdfc50b164..8923b52044 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -104,6 +104,8 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg);
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long)
+    __attribute__((unused));
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_goto_tb(TCGContext *s, int which);
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 330d26b395..bd6da72678 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1102,6 +1102,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
     tcg_out_insn(s, 3305, LDR, 0, rd);
 }
 
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
+                             tcg_target_long imm)
+{
+    /* This function is only used for passing structs by reference. */
+    g_assert_not_reached();
+}
+
 /* Define something more legible for general use.  */
 #define tcg_out_ldst_r  tcg_out_insn_3310
 
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 0f5f9f4925..6e9e9b9b3f 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2581,6 +2581,26 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     tcg_out_movi32(s, COND_AL, ret, arg);
 }
 
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
+                             tcg_target_long imm)
+{
+    int enc, opc = ARITH_ADD;
+
+    /* All of the easiest immediates to encode are positive. */
+    if (imm < 0) {
+        imm = -imm;
+        opc = ARITH_SUB;
+    }
+    enc = encode_imm(imm);
+    if (enc >= 0) {
+        tcg_out_dat_imm(s, COND_AL, opc, rd, rs, enc);
+    } else {
+        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, imm);
+        tcg_out_dat_reg(s, COND_AL, opc, rd, rs,
+                        TCG_REG_TMP, SHIFT_IMM_LSL(0));
+    }
+}
+
 /* Type is always V128, with I64 elements.  */
 static void tcg_out_dup2_vec(TCGContext *s, TCGReg rd, TCGReg rl, TCGReg rh)
 {
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index c71c3e664d..7b573bd287 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1069,6 +1069,14 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     }
 }
 
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
+                             tcg_target_long imm)
+{
+    /* This function is only used for passing structs by reference. */
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
+    tcg_out_modrm_offset(s, OPC_LEA, rd, rs, imm);
+}
+
 static inline void tcg_out_pushi(TCGContext *s, tcg_target_long val)
 {
     if (val == (int8_t)val) {
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index ce4a153887..b6e2ff6213 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -417,6 +417,13 @@ static void tcg_out_addi(TCGContext *s, TCGType type, TCGReg rd,
     }
 }
 
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
+                             tcg_target_long imm)
+{
+    /* This function is only used for passing structs by reference. */
+    g_assert_not_reached();
+}
+
 static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg)
 {
     tcg_out_opc_andi(s, ret, arg, 0xff);
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 6e000d8e69..d419c4c1fc 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -550,6 +550,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     }
 }
 
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
+                             tcg_target_long imm)
+{
+    /* This function is only used for passing structs by reference. */
+    g_assert_not_reached();
+}
+
 static void tcg_out_bswap16(TCGContext *s, TCGReg ret, TCGReg arg, int flags)
 {
     /* ret and arg can't be register tmp0 */
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 8d6899cf40..85f84fe59e 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1125,6 +1125,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg ret,
     }
 }
 
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
+                             tcg_target_long imm)
+{
+    /* This function is only used for passing structs by reference. */
+    g_assert_not_reached();
+}
+
 static bool mask_operand(uint32_t c, int *mb, int *me)
 {
     uint32_t lsb, test;
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 01cb67ef7b..383331025a 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -559,6 +559,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
     tcg_out_opc_imm(s, OPC_LD, rd, rd, 0);
 }
 
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
+                             tcg_target_long imm)
+{
+    /* This function is only used for passing structs by reference. */
+    g_assert_not_reached();
+}
+
 static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg)
 {
     tcg_out_opc_imm(s, OPC_ANDI, ret, arg, 0xff);
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 218318feb2..d8fd755ef0 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1073,6 +1073,13 @@ static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
     return false;
 }
 
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
+                             tcg_target_long imm)
+{
+    /* This function is only used for passing structs by reference. */
+    tcg_out_mem(s, RX_LA, RXY_LAY, rd, rs, TCG_REG_NONE, imm);
+}
+
 static inline void tcg_out_risbg(TCGContext *s, TCGReg dest, TCGReg src,
                                  int msb, int lsb, int ofs, int z)
 {
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index dd406bc065..4b834f3f1e 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -496,6 +496,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T2);
 }
 
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
+                             tcg_target_long imm)
+{
+    /* This function is only used for passing structs by reference. */
+    g_assert_not_reached();
+}
+
 static void tcg_out_ldst_rr(TCGContext *s, TCGReg data, TCGReg a1,
                             TCGReg a2, int op)
 {
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index bc452007c6..33551b43dc 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -557,6 +557,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     }
 }
 
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
+                             tcg_target_long imm)
+{
+    /* This function is only used for passing structs by reference. */
+    g_assert_not_reached();
+}
+
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *func,
                          const TCGHelperInfo *info)
 {
-- 
2.34.1


