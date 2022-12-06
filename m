Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87AF643C3A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:24:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POs-0003T8-ED; Mon, 05 Dec 2022 23:17:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POp-0003SJ-Fz
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:43 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POn-0006wa-Os
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:43 -0500
Received: by mail-oi1-x234.google.com with SMTP id c129so15647967oia.0
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eHbWZNc2e37AaQzsCP2Rz1slFzFOy+tMFTM0BqvuSPQ=;
 b=gRu/lVnyATgEVBYnNYc02ey5JDwMPFgHnGt8TuaeAv6/RETNF1KSVoujWhjt9cafZ6
 WsErLl/qWG4xPeCapSxI4UuimM1j9q4LYzs6UeIqnrOP4BRfPL5NWNqDJlhr6xGHM7bp
 oSq9x+7aMKPutnO/IqT9vknRGCM2lOmtLTrHIQZqxwVyTWmjipvvEUyUnwVECLaa6JqS
 TCjCKq+JH3zN/P/vBqmMKD3ONNOfzNGan74qU4puDFZMnrzmKDXr/5cJeRh63GsWXT6g
 iRM37otQigdLFcR/ZVgiPB9mZpPTRBC8InwLJNwkpYWEMk8FmEeK/zDb8wtLxmVGY/Fl
 U6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eHbWZNc2e37AaQzsCP2Rz1slFzFOy+tMFTM0BqvuSPQ=;
 b=e+40tpcl02jSq35iDrQ5HJWxqPpXFxpglWBjBuRHkYBIp/GgES/ENKbwmkAn2L0wmH
 vOSTp+3X0nHYIh/xK3+rn/HuGjhPt9Adlh9eWMfPYPdAuSz7aLriX8JITUdv+MKEcqyx
 RKUjzfytGZI4ApSvLTqJ8KwyTVTO9bWU6KUL9bArJyCCRBDkUhY7wd+rwaCRqrIDXLPX
 RgA/nt+dM3LXwuLcPo5uR//2VYYyxLdI2Hb8tF7n40GRWU8SaqG5v/oUKdOZ5xSPVPRi
 +hvtbdt/bOPve7/x9cENvEeONhDybL/8Qk3VX8iNapa0nhp8Y5x52catdQs67fu+cUXF
 VEOQ==
X-Gm-Message-State: ANoB5plFjZLsi0/Ko8Adn1zie9FWdEC6HCzHGY67HPUBifp+8/qrqAjX
 iFO9ndgWkbUSuVLwQXjTecjP4vRMxxB92KDw7IY=
X-Google-Smtp-Source: AA0mqf7xp3Ij50GoWEI7tsbb+tfsR2tJwWH+Q6e/8nxcfY04Z1t/tb9rJsPIkDikZjv/kaY3R7NLQw==
X-Received: by 2002:aca:b504:0:b0:35b:4b8c:9f87 with SMTP id
 e4-20020acab504000000b0035b4b8c9f87mr31281939oif.188.1670300261017; 
 Mon, 05 Dec 2022 20:17:41 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 18/22] tcg/sparc64: Remove USE_REG_TB
Date: Mon,  5 Dec 2022 22:17:11 -0600
Message-Id: <20221206041715.314209-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206041715.314209-1-richard.henderson@linaro.org>
References: <20221206041715.314209-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 57 ++++++++++++++----------------------
 1 file changed, 22 insertions(+), 35 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 96d58f30b1..1ae9615ef0 100644
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
@@ -1014,10 +1013,8 @@ static void tcg_target_qemu_prologue(TCGContext *s)
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
@@ -1422,7 +1419,7 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
         tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
         tcg_out_movi_imm13(s, TCG_REG_O0, a0);
         return;
-    } else if (USE_REG_TB) {
+    } else {
         intptr_t tb_diff = tcg_tbrel_diff(s, (void *)a0);
         if (check_fit_ptr(tb_diff, 13)) {
             tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
@@ -1438,36 +1435,30 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 
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
 
@@ -1487,11 +1478,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
@@ -1897,7 +1884,7 @@ void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
     tcg_debug_assert(tb_disp == (int32_t)tb_disp);
     tcg_debug_assert(br_disp == (int32_t)br_disp);
 
-    if (!USE_REG_TB) {
+    if (0) {
         qatomic_set((uint32_t *)jmp_rw,
 		    deposit32(CALL, 0, 30, br_disp >> 2));
         flush_idcache_range(jmp_rx, jmp_rw, 4);
-- 
2.34.1


