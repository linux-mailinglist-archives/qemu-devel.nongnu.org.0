Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B91670CE9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:13:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHv72-0003qq-Tg; Tue, 17 Jan 2023 18:11:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv71-0003nS-23
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:27 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6z-0001Rg-9z
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:26 -0500
Received: by mail-pf1-x430.google.com with SMTP id w2so9402770pfc.11
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 15:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z7ciK8ak48icXeOFQ3QD9/gIlEDG3afqs757WTK0YzA=;
 b=AiGXtOaalhPery6IPqk86QfyGq2CLgmjWcfJdzFXac1P698YeJBt4ETi6wJF7Jluqa
 +vd+p+LycO6CddhKPj9H7nsUmdfSiBs0xjZv3cImQSCufjriP5sAqy88Aq0Iv0/QNmg0
 zfo9UR5J+9q/VxBf/9l8s07FfPBCO8j33nJ+0Cvs+3nyEBcLRr3ePoDkVVM2e7inP+kn
 F2OAXmmU6ItGBMRPv4vBzfdYRr1S8XZ1HJuBN4RI1nR6CnCPUQp7fJ2tiy7elFyBVRR3
 OilQfYIrEn8TQqtDLAIDHdnmOH9hYLwtefa8IdQAzW25v2a+u5BSc0DSTADa/MOO/JbG
 9ixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z7ciK8ak48icXeOFQ3QD9/gIlEDG3afqs757WTK0YzA=;
 b=JRCokxMgKtME8bXUL4OuJJLWTxq0EXMSx2HQSyqU6iw7cONDtTBL4MSoWNykK4/MUv
 3h1WL6DPMMgOstBhY1QMnNBPOha97tz3ZR1nxFPJ6ow5UKa2CLd47239gw0KDJNeSkzF
 YnQRWtc+BcAJi8k2hYc0aPPGBmLFNqRuShsgPGpfuHvmyGeZh8VGx31l47axTUeiX9LE
 eIMlcUi1LN87QmF41wE0hVkUsdaCL2l0Mlf4ct+nah3EYygePtK/GxRJR0E4pDGqCp6r
 Apze8NmKmC51dqXd5Pdi6bZI18UCgJ+UUF2YhJT03mGHVNzVGYtbgRs33oPyqHOee/zS
 ipxw==
X-Gm-Message-State: AFqh2kodaip4MosQo5SXKCBhqGA65rVM1ZbKAd9vH99Hr+bAu5M4XU3U
 op6BXZ9J7hixE/05CU/JAvHpiYCJyWAga/N0
X-Google-Smtp-Source: AMrXdXuGhB4YVIuN3znYVUvDHyZ1AdsleRCFneNvYrMYQGEMbjQjv2PAneK/ed4uTwoKp2/sdg5Csg==
X-Received: by 2002:a05:6a00:f07:b0:581:61a7:c8f0 with SMTP id
 cr7-20020a056a000f0700b0058161a7c8f0mr5669612pfb.4.1673997084011; 
 Tue, 17 Jan 2023 15:11:24 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm20747070pfb.0.2023.01.17.15.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:11:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 18/22] tcg/sparc64: Remove USE_REG_TB
Date: Tue, 17 Jan 2023 13:10:47 -1000
Message-Id: <20230117231051.354444-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117231051.354444-1-richard.henderson@linaro.org>
References: <20230117231051.354444-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

This is always true for sparc64, so this is dead since 3a5f6805c7ca.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 62 ++++++++++++------------------------
 1 file changed, 21 insertions(+), 41 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index fdb711bdf6..e0b3957149 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -92,7 +92,6 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 #endif
 
 #define TCG_REG_TB  TCG_REG_I1
-#define USE_REG_TB  (sizeof(void *) > 4)
 
 static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_L0,
@@ -439,7 +438,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     }
 
     /* A 13-bit constant relative to the TB.  */
-    if (!in_prologue && USE_REG_TB) {
+    if (!in_prologue) {
         test = tcg_tbrel_diff(s, (void *)arg);
         if (check_fit_ptr(test, 13)) {
             tcg_out_arithi(s, ret, TCG_REG_TB, test, ARITH_ADD);
@@ -468,7 +467,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     }
 
     /* Use the constant pool, if possible. */
-    if (!in_prologue && USE_REG_TB) {
+    if (!in_prologue) {
         new_pool_label(s, arg, R_SPARC_13, s->code_ptr,
                        tcg_tbrel_diff(s, NULL));
         tcg_out32(s, LDX | INSN_RD(ret) | INSN_RS1(TCG_REG_TB));
@@ -1015,10 +1014,8 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 #endif
 
     /* We choose TCG_REG_TB such that no move is required.  */
-    if (USE_REG_TB) {
-        QEMU_BUILD_BUG_ON(TCG_REG_TB != TCG_REG_I1);
-        tcg_regset_set_reg(s->reserved_regs, TCG_REG_TB);
-    }
+    QEMU_BUILD_BUG_ON(TCG_REG_TB != TCG_REG_I1);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TB);
 
     tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I1, 0, JMPL);
     /* delay slot */
@@ -1423,7 +1420,7 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
         tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
         tcg_out_movi_imm13(s, TCG_REG_O0, a0);
         return;
-    } else if (USE_REG_TB) {
+    } else {
         intptr_t tb_diff = tcg_tbrel_diff(s, (void *)a0);
         if (check_fit_ptr(tb_diff, 13)) {
             tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
@@ -1439,36 +1436,30 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 
 static void tcg_out_goto_tb(TCGContext *s, int which)
 {
+    int c;
+
     /* Direct jump. */
-    if (USE_REG_TB) {
-        /* make sure the patch is 8-byte aligned.  */
-        if ((intptr_t)s->code_ptr & 4) {
-            tcg_out_nop(s);
-        }
-        set_jmp_insn_offset(s, which);
-        tcg_out_sethi(s, TCG_REG_T1, 0);
-        tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 0, ARITH_OR);
-        tcg_out_arith(s, TCG_REG_G0, TCG_REG_TB, TCG_REG_T1, JMPL);
-        tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB, TCG_REG_T1, ARITH_ADD);
-    } else {
-        set_jmp_insn_offset(s, which);
-        tcg_out32(s, CALL);
+    /* make sure the patch is 8-byte aligned.  */
+    if ((intptr_t)s->code_ptr & 4) {
         tcg_out_nop(s);
     }
+    set_jmp_insn_offset(s, which);
+    tcg_out_sethi(s, TCG_REG_T1, 0);
+    tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 0, ARITH_OR);
+    tcg_out_arith(s, TCG_REG_G0, TCG_REG_TB, TCG_REG_T1, JMPL);
+    tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB, TCG_REG_T1, ARITH_ADD);
     set_jmp_reset_offset(s, which);
 
     /*
      * For the unlinked path of goto_tb, we need to reset TCG_REG_TB
      * to the beginning of this TB.
      */
-    if (USE_REG_TB) {
-        int c = -tcg_current_code_size(s);
-        if (check_fit_i32(c, 13)) {
-            tcg_out_arithi(s, TCG_REG_TB, TCG_REG_TB, c, ARITH_ADD);
-        } else {
-            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_T1, c);
-            tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB, TCG_REG_T1, ARITH_ADD);
-        }
+    c = -tcg_current_code_size(s);
+    if (check_fit_i32(c, 13)) {
+        tcg_out_arithi(s, TCG_REG_TB, TCG_REG_TB, c, ARITH_ADD);
+    } else {
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_T1, c);
+        tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB, TCG_REG_T1, ARITH_ADD);
     }
 }
 
@@ -1488,11 +1479,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     switch (opc) {
     case INDEX_op_goto_ptr:
         tcg_out_arithi(s, TCG_REG_G0, a0, 0, JMPL);
-        if (USE_REG_TB) {
-            tcg_out_mov_delay(s, TCG_REG_TB, a0);
-        } else {
-            tcg_out_nop(s);
-        }
+        tcg_out_mov_delay(s, TCG_REG_TB, a0);
         break;
     case INDEX_op_br:
         tcg_out_bpcc(s, COND_A, BPCC_PT, arg_label(a0));
@@ -1898,13 +1885,6 @@ void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
     tcg_debug_assert(tb_disp == (int32_t)tb_disp);
     tcg_debug_assert(br_disp == (int32_t)br_disp);
 
-    if (!USE_REG_TB) {
-        qatomic_set((uint32_t *)jmp_rw,
-		    deposit32(CALL, 0, 30, br_disp >> 2));
-        flush_idcache_range(jmp_rx, jmp_rw, 4);
-        return;
-    }
-
     /* This does not exercise the range of the branch, but we do
        still need to be able to load the new value of TCG_REG_TB.
        But this does still happen quite often.  */
-- 
2.34.1


