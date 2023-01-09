Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714D5661C1C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 02:50:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEhBv-0000sI-N6; Sun, 08 Jan 2023 20:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBt-0000qh-2H
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:09 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBr-0001Zh-7l
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:08 -0500
Received: by mail-pl1-x634.google.com with SMTP id 17so8004360pll.0
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 17:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KSp22loacyuOjJO3M7+ZxWFYwNHKL7tMHgm5GLt2Nj4=;
 b=lH35ryC5/4oPMmWm6b3ZiBbksR31kblEChr9megPpfZaB2Ow4qQDBaPU8WDM4GTEti
 Zg4WuAwnM/pDjTdO5zV9gAZlXE4ANvf5wVJ8d/xUkyFXgeLeCN7NwG5EEi6MDbliHxJS
 AV1nS9/T8m8r0OFJe7SCBExm2SkgO+K1TWfAAYl7vvQ1lDEQswnK9AN7UmcO7wJn/rLu
 jIJU2oGh9y7CXOwDv6zV/l6oTryPNNTD07XHMkasRBfY5CIZ9veMSxMnW2QSA7yzK7+L
 GCMvQtL/aBThGdZlvJfzAn5FJMlpelpDprgzigR7YCuLqXli8sGwgZI8bSiHzKoz8laS
 rA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KSp22loacyuOjJO3M7+ZxWFYwNHKL7tMHgm5GLt2Nj4=;
 b=wA8dy8n+KMr9kXmiY3Jc2sE31siMJsLHFQzAEZLMP5WLYhM3wjTAPA2lVstRLGga0q
 gtrXKLk6OZe4gfb4c1/zPtR3mqj2pZuAwzfDZCD7fxXWMddnTPe8N3JEmB7fp+57xmrl
 5uWXIFGd+79E13f6ZM3YvEIqppippdHQko9K60yo+DDmMdvNH0ihHdOTKqvVqdSXN/cC
 q2xZJWC3zwQx83jzagflO0OMt3dHdn1xe/KpEgqJ5wAorTbjypjnMQCj6CmPx2p7g+8s
 vREDUKOTyJMIY0LHsrZWf+3frzAU9WrftwS1xy4rdab4wOlpFbW3Gg+DTQuS/Jm0Vc3E
 MDJA==
X-Gm-Message-State: AFqh2kpozsv2Q/bV1OlXQB32iydcv5np1oeTk/rQ03oPxMuXoWpbR6Gm
 7ahAA+1x9VDkRF5u+I6QnWfIDp9DQy9SrrHw
X-Google-Smtp-Source: AMrXdXuDYp1D/tl4ImmHdQKmCDHg/8IclGgGpO6oDeTExAWGiViKoCvSuhePn6f2DJ7Q8n3l49iXKg==
X-Received: by 2002:a05:6a20:7d95:b0:b0:1051:30a0 with SMTP id
 v21-20020a056a207d9500b000b0105130a0mr98408325pzj.51.1673228585820; 
 Sun, 08 Jan 2023 17:43:05 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902ca0d00b00178b77b7e71sm4743617pld.188.2023.01.08.17.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 17:43:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 18/22] tcg/sparc64: Remove USE_REG_TB
Date: Sun,  8 Jan 2023 17:42:44 -0800
Message-Id: <20230109014248.2894281-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109014248.2894281-1-richard.henderson@linaro.org>
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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


