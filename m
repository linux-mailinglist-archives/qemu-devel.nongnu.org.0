Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D8040A1DE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:24:37 +0200 (CEST)
Received: from localhost ([::1]:40368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwFY-0007vB-RI
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6u-0001vF-AG
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:40 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6i-0007uE-Ms
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:39 -0400
Received: by mail-pf1-x431.google.com with SMTP id w19so6051963pfn.12
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Qz6TS9bkb4hPtKbSCAubGI8bElA2mkZHtsqGfzV7T8=;
 b=dVG0sVmSKFSRrDMNZHTH52M5IAo5sW6sPQ+FDA12ZkfbJ5cIAgiTmqhH6JNV3SM2ME
 7JRAPgi4Sec2ZbgrSn4g4uNzm/M+6roo/vSTVp01IV+iZqnFeq/MlksVzxJ0Xa8eK51t
 zPpcx1YhGNKlzbLM63jciuK1QctfiKen30QlspNyZHXMs3ldzX8qhUTjwRiVYxgBqtxU
 NnUn0AdN7PUOaGCYUp90Dd40Pl12nii1OiZ9i4RESARBykl2G4l7qdhviNZSCfpOKyiV
 jxsUt5jFUNFoFEjO5MadBqXOmKyPDvLpBCDDf+WK049UbXdVBl9zd4U0Bg6n/9cvQVq+
 G5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Qz6TS9bkb4hPtKbSCAubGI8bElA2mkZHtsqGfzV7T8=;
 b=FSd8uEvULBOyq+kcSeS9DmtaDylfIGbDSERdkDJ0KOcVM+oLarMMhwyY/sFvxjfZQA
 IqnqO1o3pLehijaDYxeFoNO62JoBv4JQWPYiB2uyZKI4lRC56HS8ugM7NiNVRkwarRTw
 szwro9RD3jz/1tWRnTuC5LEWhXfbP5n/Gwx9ymX0OGf3X1/5ssIEzVskLWfkU0kgSssq
 46oe0yXdlRfEjRBrsGUWF2CXis7/POyFxu26OsjZy/ZkEu96UIHRByHFwOZmnP1k5Mek
 pgVCL/G/eEoCTs4YF7HEqSUH/HHIHMBV26pJ71LRg088mLvE82zPzox9XJXa/W/dmowd
 4NIQ==
X-Gm-Message-State: AOAM533+NR4lSavbJG34NtHAbfRGLqSWUkRv1rvEbG7WSIxXKFGJYLtq
 AyGcYejt4LrdkGJqccEFwaJVMCsTAB7aPw==
X-Google-Smtp-Source: ABdhPJwsimPT8eAJiTORxhqaaBTMc44WW8+iSC8GX1PcoNLw6oGDKOOZKTHcxBUD8VDlE+FGw/uAsA==
X-Received: by 2002:a63:517:: with SMTP id 23mr13289624pgf.245.1631578523903; 
 Mon, 13 Sep 2021 17:15:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/44] tcg/arm: Standardize on tcg_out_<branch>_{reg,imm}
Date: Mon, 13 Sep 2021 17:14:48 -0700
Message-Id: <20210914001456.793490-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some of the functions specified _reg, some _imm, and some
left it blank.  Make it clearer to which we are referring.

Split tcg_out_b_reg from tcg_out_bx_reg, to indicate when
we do not actually require BX semantics.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index e5b4f86841..7d15c36f85 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -525,19 +525,19 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
     return 0;
 }
 
-static inline void tcg_out_b(TCGContext *s, int cond, int32_t offset)
+static inline void tcg_out_b_imm(TCGContext *s, int cond, int32_t offset)
 {
     tcg_out32(s, (cond << 28) | 0x0a000000 |
                     (((offset - 8) >> 2) & 0x00ffffff));
 }
 
-static inline void tcg_out_bl(TCGContext *s, int cond, int32_t offset)
+static inline void tcg_out_bl_imm(TCGContext *s, int cond, int32_t offset)
 {
     tcg_out32(s, (cond << 28) | 0x0b000000 |
                     (((offset - 8) >> 2) & 0x00ffffff));
 }
 
-static inline void tcg_out_blx(TCGContext *s, int cond, int rn)
+static inline void tcg_out_blx_reg(TCGContext *s, int cond, int rn)
 {
     tcg_out32(s, (cond << 28) | 0x012fff30 | rn);
 }
@@ -568,13 +568,19 @@ static inline void tcg_out_mov_reg(TCGContext *s, int cond, int rd, int rm)
     }
 }
 
-static inline void tcg_out_bx(TCGContext *s, int cond, TCGReg rn)
+static void tcg_out_bx_reg(TCGContext *s, int cond, TCGReg rn)
 {
-    /* Unless the C portion of QEMU is compiled as thumb, we don't
-       actually need true BX semantics; merely a branch to an address
-       held in a register.  */
+    tcg_out32(s, (cond << 28) | 0x012fff10 | rn);
+}
+
+static void tcg_out_b_reg(TCGContext *s, int cond, TCGReg rn)
+{
+    /*
+     * Unless the C portion of QEMU is compiled as thumb, we don't need
+     * true BX semantics; merely a branch to an address held in a register.
+     */
     if (use_armv5t_instructions) {
-        tcg_out32(s, (cond << 28) | 0x012fff10 | rn);
+        tcg_out_bx_reg(s, cond, rn);
     } else {
         tcg_out_mov_reg(s, cond, TCG_REG_PC, rn);
     }
@@ -1215,7 +1221,7 @@ static void tcg_out_goto(TCGContext *s, int cond, const tcg_insn_unit *addr)
     ptrdiff_t disp = tcg_pcrel_diff(s, addr);
 
     if ((addri & 1) == 0 && disp - 8 < 0x01fffffd && disp - 8 > -0x01fffffd) {
-        tcg_out_b(s, cond, disp);
+        tcg_out_b_imm(s, cond, disp);
         return;
     }
     tcg_out_movi_pool(s, cond, TCG_REG_PC, addri);
@@ -1236,11 +1242,11 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *addr)
             }
             tcg_out_blx_imm(s, disp);
         } else {
-            tcg_out_bl(s, COND_AL, disp);
+            tcg_out_bl_imm(s, COND_AL, disp);
         }
     } else if (use_armv7_instructions) {
         tcg_out_movi32(s, COND_AL, TCG_REG_TMP, addri);
-        tcg_out_blx(s, COND_AL, TCG_REG_TMP);
+        tcg_out_blx_reg(s, COND_AL, TCG_REG_TMP);
     } else {
         /* ??? Know that movi_pool emits exactly 1 insn.  */
         tcg_out_dat_imm(s, COND_AL, ARITH_ADD, TCG_REG_R14, TCG_REG_PC, 0);
@@ -1254,7 +1260,7 @@ static inline void tcg_out_goto_label(TCGContext *s, int cond, TCGLabel *l)
         tcg_out_goto(s, cond, l->u.value_ptr);
     } else {
         tcg_out_reloc(s, s->code_ptr, R_ARM_PC24, l, 0);
-        tcg_out_b(s, cond, 0);
+        tcg_out_b_imm(s, cond, 0);
     }
 }
 
@@ -1823,7 +1829,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
     /* This a conditional BL only to load a pointer within this opcode into LR
        for the slow path.  We will not be using the value for a tail call.  */
     label_ptr = s->code_ptr;
-    tcg_out_bl(s, COND_NE, 0);
+    tcg_out_bl_imm(s, COND_NE, 0);
 
     tcg_out_qemu_ld_index(s, opc, datalo, datahi, addrlo, addend);
 
@@ -1929,7 +1935,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 
     /* The conditional call must come last, as we're going to return here.  */
     label_ptr = s->code_ptr;
-    tcg_out_bl(s, COND_NE, 0);
+    tcg_out_bl_imm(s, COND_NE, 0);
 
     add_qemu_ldst_label(s, false, oi, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
@@ -1982,7 +1988,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
     case INDEX_op_goto_ptr:
-        tcg_out_bx(s, COND_AL, args[0]);
+        tcg_out_b_reg(s, COND_AL, args[0]);
         break;
     case INDEX_op_br:
         tcg_out_goto_label(s, COND_AL, arg_label(args[0]));
@@ -3066,7 +3072,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
     tcg_out_mov(s, TCG_TYPE_PTR, TCG_AREG0, tcg_target_call_iarg_regs[0]);
 
-    tcg_out_bx(s, COND_AL, tcg_target_call_iarg_regs[1]);
+    tcg_out_b_reg(s, COND_AL, tcg_target_call_iarg_regs[1]);
 
     /*
      * Return path for goto_ptr. Set return value to 0, a-la exit_tb,
-- 
2.25.1


