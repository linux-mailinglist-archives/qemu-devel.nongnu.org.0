Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E5A661C18
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 02:46:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEhBw-0000sK-73; Sun, 08 Jan 2023 20:43:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBt-0000rJ-Vg
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:09 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBs-0001aF-4f
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:09 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso11290503pjt.0
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 17:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Do4aEWMqG+Ov79EmLqFR2DzW1DBnRUUmODHZM3QbOyY=;
 b=Vok9Tv8ySnizXNuNZTkXprj6oA4OUhM0sTmwZDwBESDFy6XspgtZcfW/ljybJfq+kV
 ccT8IEFgfqWXA7I/XnE2WCo6Y1JIF9eg5HkcVC+mKe0oDlbzmBgPZJra+Vmy3MOm9ofC
 pP1ezkc2CDG6nTrM/uuRREinEakp2UB8cegmwZpOjnL/lTnU9VwWqG0vEQC3dhmB9KT1
 7S7RIT+NH447KSCpPuTy9O6eSpN6kgmSQlgkSV7DGQbThq02LnzNGh75SYB6bE/a6RQT
 DJqps1lv3NlbojgjtGzoQWyOcZuLou/krvMzCOatqtpuXkuC6Q8W9jRPuJiVqlIklF8d
 SpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Do4aEWMqG+Ov79EmLqFR2DzW1DBnRUUmODHZM3QbOyY=;
 b=sQasUNQDjEagazIkWEHEhaS5Hto+4QVWoUMkftYrT8AgLf9qvXOYBhJmNmq7zplgW6
 p6fgHcIRubGxAYyqkpZIF6BfcA7splaX4iCyzZcZicFldJ2uzZyjbDAudHaYGfqnJCD1
 SZGltVzhoDN6fuTyoeGyYU8UZzYld0Xfx22cvSyUzM71H3KnGqdY0lzpt4pCXjo7rycY
 8vJn5Qv54pZBT4xR08ZZhMN1bhX/98E58dz7QQ9jMUvmvjWjCsIYHQs7Wa8xxn3mrjZ0
 soWLPng01T5SjDsPdoaQnlrEuOsJsy5sLafkWhc+/7ioa41+uxU0jNSwvxHSmBoGIMhV
 u3jg==
X-Gm-Message-State: AFqh2kqj1px6qon/EnZFESP1c2FHmeBcM4deF6gSSPgt+bN7REABi5+Q
 wMLMpzNYr04OWJgN7jnEfbCzAuk1Cp4AGrxf
X-Google-Smtp-Source: AMrXdXuCbkId92BHddcKG+OIFD2aOSObIudMJww3OUQRHAkN8Y8xhbWbLk8g/9MMFKiVhPgByuOcTQ==
X-Received: by 2002:a17:902:7404:b0:189:b0fe:d70f with SMTP id
 g4-20020a170902740400b00189b0fed70fmr64743627pll.60.1673228586790; 
 Sun, 08 Jan 2023 17:43:06 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902ca0d00b00178b77b7e71sm4743617pld.188.2023.01.08.17.43.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 17:43:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/22] tcg/sparc64: Reorg goto_tb implementation
Date: Sun,  8 Jan 2023 17:42:45 -0800
Message-Id: <20230109014248.2894281-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109014248.2894281-1-richard.henderson@linaro.org>
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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

The old sparc64 implementation may replace two insns, which leaves
a race condition in which a thread could be stopped at a PC in the
middle of the sequence, and when restarted does not see the complete
address computation and branches to nowhere.

The new implemetation replaces only one insn, swapping between a
direct branch and a direct call.  The TCG_REG_TB register is loaded
from tb->jmp_target_addr[] in the delay slot.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 87 +++++++++++++++---------------------
 1 file changed, 37 insertions(+), 50 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index e0b3957149..dd406bc065 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1436,33 +1436,56 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 
 static void tcg_out_goto_tb(TCGContext *s, int which)
 {
-    int c;
+    ptrdiff_t off = tcg_tbrel_diff(s, (void *)get_jmp_target_addr(s, which));
 
-    /* Direct jump. */
-    /* make sure the patch is 8-byte aligned.  */
-    if ((intptr_t)s->code_ptr & 4) {
-        tcg_out_nop(s);
-    }
+    /* Direct branch will be patched by tb_target_set_jmp_target. */
     set_jmp_insn_offset(s, which);
-    tcg_out_sethi(s, TCG_REG_T1, 0);
-    tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 0, ARITH_OR);
-    tcg_out_arith(s, TCG_REG_G0, TCG_REG_TB, TCG_REG_T1, JMPL);
-    tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB, TCG_REG_T1, ARITH_ADD);
+    tcg_out32(s, CALL);
+    /* delay slot */
+    tcg_debug_assert(check_fit_ptr(off, 13));
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TB, TCG_REG_TB, off);
     set_jmp_reset_offset(s, which);
 
     /*
      * For the unlinked path of goto_tb, we need to reset TCG_REG_TB
      * to the beginning of this TB.
      */
-    c = -tcg_current_code_size(s);
-    if (check_fit_i32(c, 13)) {
-        tcg_out_arithi(s, TCG_REG_TB, TCG_REG_TB, c, ARITH_ADD);
+    off = -tcg_current_code_size(s);
+    if (check_fit_i32(off, 13)) {
+        tcg_out_arithi(s, TCG_REG_TB, TCG_REG_TB, off, ARITH_ADD);
     } else {
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_T1, c);
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_T1, off);
         tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB, TCG_REG_T1, ARITH_ADD);
     }
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    uintptr_t addr = tb->jmp_target_addr[n];
+    intptr_t br_disp = (intptr_t)(addr - jmp_rx) >> 2;
+    tcg_insn_unit insn;
+
+    br_disp >>= 2;
+    if (check_fit_ptr(br_disp, 19)) {
+        /* ba,pt %icc, addr */
+        insn = deposit32(INSN_OP(0) | INSN_OP2(1) | INSN_COND(COND_A)
+                         | BPCC_ICC | BPCC_PT, 0, 19, br_disp);
+    } else if (check_fit_ptr(br_disp, 22)) {
+        /* ba addr */
+        insn = deposit32(INSN_OP(0) | INSN_OP2(2) | INSN_COND(COND_A),
+                         0, 22, br_disp);
+    } else {
+        /* The code_gen_buffer can't be larger than 2GB.  */
+        tcg_debug_assert(check_fit_ptr(br_disp, 30));
+        /* call addr */
+        insn = deposit32(CALL, 0, 30, br_disp);
+    }
+
+    qatomic_set((uint32_t *)jmp_rw, insn);
+    flush_idcache_range(jmp_rx, jmp_rw, 4);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1871,39 +1894,3 @@ void tcg_register_jit(const void *buf, size_t buf_size)
 {
     tcg_register_jit_int(buf, buf_size, &debug_frame, sizeof(debug_frame));
 }
-
-void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
-                              uintptr_t jmp_rx, uintptr_t jmp_rw)
-{
-    uintptr_t addr = tb->jmp_target_addr[n];
-    intptr_t tb_disp = addr - (uintptr_t)tb->tc.ptr;
-    intptr_t br_disp = addr - jmp_rx;
-    tcg_insn_unit i1, i2;
-
-    /* We can reach the entire address space for ILP32.
-       For LP64, the code_gen_buffer can't be larger than 2GB.  */
-    tcg_debug_assert(tb_disp == (int32_t)tb_disp);
-    tcg_debug_assert(br_disp == (int32_t)br_disp);
-
-    /* This does not exercise the range of the branch, but we do
-       still need to be able to load the new value of TCG_REG_TB.
-       But this does still happen quite often.  */
-    if (check_fit_ptr(tb_disp, 13)) {
-        /* ba,pt %icc, addr */
-        i1 = (INSN_OP(0) | INSN_OP2(1) | INSN_COND(COND_A)
-              | BPCC_ICC | BPCC_PT | INSN_OFF19(br_disp));
-        i2 = (ARITH_ADD | INSN_RD(TCG_REG_TB) | INSN_RS1(TCG_REG_TB)
-              | INSN_IMM13(tb_disp));
-    } else if (tb_disp >= 0) {
-        i1 = SETHI | INSN_RD(TCG_REG_T1) | ((tb_disp & 0xfffffc00) >> 10);
-        i2 = (ARITH_OR | INSN_RD(TCG_REG_T1) | INSN_RS1(TCG_REG_T1)
-              | INSN_IMM13(tb_disp & 0x3ff));
-    } else {
-        i1 = SETHI | INSN_RD(TCG_REG_T1) | ((~tb_disp & 0xfffffc00) >> 10);
-        i2 = (ARITH_XOR | INSN_RD(TCG_REG_T1) | INSN_RS1(TCG_REG_T1)
-              | INSN_IMM13((tb_disp & 0x3ff) | -0x400));
-    }
-
-    qatomic_set((uint64_t *)jmp_rw, deposit64(i2, 32, 32, i1));
-    flush_idcache_range(jmp_rx, jmp_rw, 8);
-}
-- 
2.34.1


