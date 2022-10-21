Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1090E60716B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 09:49:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmmp-00017i-2V
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:49:47 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmIF-0003gL-WD
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHo-0003Ml-M0
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:45 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHj-0005qy-Hk
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:42 -0400
Received: by mail-pf1-x436.google.com with SMTP id p14so1811154pfq.5
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vW1Lxg6CwvbDnPeTBg9Qp/nP+UFsiQKcS3I0rXp2/DI=;
 b=oGTG6l2ZqJ3yp4u7YloIjrC6+78p38fVJ5Kz9/aQfQNOb6z8k+pY3RYD0ChbYScr2I
 bJsM10GE2GQwqgPfzMc1yYvcmPGFG0E83aw8nRavpUE7T1sy84P440+/Bf36hk5eLJDO
 Eb+/zUTW0G4gGrX7RoMvotFtNLxMikT1wuc5apzF8MK9s04MC77ZvsWucOTmsUmSEips
 5mGMjqxwrIDOd/odq2GJ0z4DqrxWbGAeWpXZl5Dc6mKXtUOvaF0SqcucKdO1yEy2M9wy
 3TQDCv334Rkle7BVh5bSo6MeqeHJuilW9Oa1TT3NWiSBUTvkjvH4s3v8idGn+j1yigTL
 oMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vW1Lxg6CwvbDnPeTBg9Qp/nP+UFsiQKcS3I0rXp2/DI=;
 b=lLVJKe0dMtmXxLAJshxpqKnURwbvm8FUStZxsAhyWAOeDDMFq8MeccVFFM3z/wujyI
 BWOkoYvNFhOsqCU6Y0bDzCpuBoirRfO01c3oz5fxeHkU7/X1GQooGRTerwedq9YOdgC4
 DX+F9p17FULctU2vIE3S89YfGRWwXjTIL9xAmCD+N7vexrHZqnDTIVEVqNbLpdd4JImY
 Hr7aMBn2PuFBTqrGAiX6tNJQaHBbljHDjwLtT1Yq4WVR6URp4xXH7q35s9HgklsMOP8h
 U9UDbO5jxjVPCzMi14zJAZ9dIn5FsaMv7itnjcUgd7NQ71gC+caoWPMZ6tGGy82Y/OjQ
 ud+w==
X-Gm-Message-State: ACrzQf2XLpbDvMqcggZTv7+b7uo3pZqRYSTRQNthUYCzy5ZRb19s/gbl
 PzD5LXDi9nQ7BBMrqpYH+A+aZjUTax9wPb5u
X-Google-Smtp-Source: AMsMyM67mfLxZXTln6htvhcTy3lmaguG5I+6JjxgdNyDSdEcDKXt882aCOPmkcRt1ir1+U0IsMhbxA==
X-Received: by 2002:a05:6a00:148a:b0:566:10d8:9404 with SMTP id
 v10-20020a056a00148a00b0056610d89404mr17969202pfu.84.1666336656289; 
 Fri, 21 Oct 2022 00:17:36 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.17.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:17:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/36] tcg: Introduce tcg_out_addi_ptr
Date: Fri, 21 Oct 2022 17:15:39 +1000
Message-Id: <20221021071549.2398137-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

Implement the function for arm, i386, and s390x, which will use it.
Add stubs for all other backends.

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
index a3538edffa..10d239d15c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -103,6 +103,8 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg);
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long)
+    __attribute__((unused));
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS]);
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index e8184fe001..f089a74f0e 100644
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
index e82749a602..2950a29d49 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2548,6 +2548,26 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
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
index 58bd5873f5..6a021dda8b 100644
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
index 98da264f16..967bf307b8 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -389,6 +389,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
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
index 292e490b5c..22b5463f0f 100644
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
index f561a3492f..d9e4ba8883 100644
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
index aa017d665a..6072945ccb 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -545,6 +545,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
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
index c3c0bcc3eb..8663a963a6 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1020,6 +1020,13 @@ static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
     return false;
 }
 
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
+                             tcg_target_long imm)
+{
+    /* This function is only used for passing structs by reference. */
+    tcg_out_mem(s, RX_LA, RXY_LAY, rd, rs, TCG_REG_NONE, imm);
+}
+
 /* load data from an absolute host address */
 static void tcg_out_ld_abs(TCGContext *s, TCGType type,
                            TCGReg dest, const void *abs)
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index eb913f33c8..f6a8a8e605 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -497,6 +497,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
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
index b07b30b9fc..8bf02a96e9 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -561,6 +561,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
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


