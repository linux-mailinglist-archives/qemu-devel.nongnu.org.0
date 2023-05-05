Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 022136F8B0B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:29:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vT-0000m9-A2; Fri, 05 May 2023 17:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vN-0000iq-H9
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:11 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vJ-0004ZQ-B0
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:09 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f1950f5628so23133275e9.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321903; x=1685913903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/LNx4AQ8LEDs2bqV5zvn6xWFsTqqlF00MmHmvqgX6b8=;
 b=bO5309AlG6qM7HIvTzwKgZzR+vqsFbNgoYSHRjgCv84HjB6Fv7P/H17LNOBshUocfp
 N4dE9sPztx87MWgh2ML2X+j35nJjD74IVdHy2d6DIVt9v8pGxaEOBp8dw3Q+O+X28H3w
 hR4CFBSvIUldeQeZssDSG5R7Du/5Xwi2J3IbrrsJFZtm7AJVIg8PATF2A5Wi42B7UMzE
 JJkccV2ASr6NKG0mmrATbUjANuW19yM4FC+8m0mPLX3MvNPenI6SXINesqIL43qi8Lau
 TK2VcFqJ2qzbS6vMoUORm3mlZgzBYS9pl1BiIygbPaeApZ+7ZJkKRSBrOWyxDKpENzZl
 Mwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321903; x=1685913903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/LNx4AQ8LEDs2bqV5zvn6xWFsTqqlF00MmHmvqgX6b8=;
 b=bz4NK7xKLfgBKevpsAYtWaTCrUO4tKL+l1dosQ+y4itoClKaiOcaUR60gM0SYMrIv5
 hION2ZLXQVp+RqjOXvG+aCyREArGCSdiqLLcbiUhjIhCAuQoR2rF2YgoQsxlCQsqfRyW
 HCDrUdnV4Q+UpVxof3t3sA3fTgV/Ta+d9fJNXixtsgEfEIfJ/FiClLDxKcrEpdgBlLQj
 c76Uv13inRxqIzZ71vXwcCRv85BKv1kzhdNkjhJj4SAYymTZwIRw+JyStDz3+4kRuQ/6
 1QVqUOBI7wdiR+XfkJP6duDqssI0FUQ070cX29PrvnkpIf4bk8oCL7RvNPMmw2NExsFn
 boqw==
X-Gm-Message-State: AC+VfDxuLZb6QOtaBEKuRwHELfvTBcoztqcHntcJ3N446P1LL2vgqzx/
 vjpmPFiNWQQGEy6dFsIhhcQvIpATZ0PZs0YmrEjupg==
X-Google-Smtp-Source: ACHHUZ56T/3D+ifZCU07fWYGdDlWFe+0HQlY8QMdudJtbW3DGg8hgG/D6RJpM7165gC4rJtKZN4BRA==
X-Received: by 2002:a1c:4b19:0:b0:3f1:78d0:fc4e with SMTP id
 y25-20020a1c4b19000000b003f178d0fc4emr2111817wma.32.1683321903079; 
 Fri, 05 May 2023 14:25:03 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:25:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 26/42] tcg/arm: Rationalize args to tcg_out_qemu_{ld,st}
Date: Fri,  5 May 2023 22:24:31 +0100
Message-Id: <20230505212447.374546-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Interpret the variable argument placement in the caller.
Pass data_type instead of is_64.  We need to set this in
TCGLabelQemuLdst, so plumb this all the way through from tcg_out_op.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 113 +++++++++++++++++++--------------------
 1 file changed, 56 insertions(+), 57 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 83c818a58b..6ce52b9612 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1526,15 +1526,18 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
 /* Record the context of a call to the out of line helper code for the slow
    path for a load or store, so that we can later generate the correct
    helper code.  */
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
-                                TCGReg datalo, TCGReg datahi, TCGReg addrlo,
-                                TCGReg addrhi, tcg_insn_unit *raddr,
+static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
+                                MemOpIdx oi, TCGType type,
+                                TCGReg datalo, TCGReg datahi,
+                                TCGReg addrlo, TCGReg addrhi,
+                                tcg_insn_unit *raddr,
                                 tcg_insn_unit *label_ptr)
 {
     TCGLabelQemuLdst *label = new_ldst_label(s);
 
     label->is_ld = is_ld;
     label->oi = oi;
+    label->type = type;
     label->datalo_reg = datalo;
     label->datahi_reg = datahi;
     label->addrlo_reg = addrlo;
@@ -1796,41 +1799,28 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
 }
 #endif
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                            TCGReg addrlo, TCGReg addrhi,
+                            MemOpIdx oi, TCGType data_type)
 {
-    TCGReg addrlo, datalo, datahi, addrhi __attribute__((unused));
-    MemOpIdx oi;
-    MemOp opc;
-#ifdef CONFIG_SOFTMMU
-    int mem_index;
-    TCGReg addend;
-    tcg_insn_unit *label_ptr;
-#else
-    unsigned a_bits;
-#endif
-
-    datalo = *args++;
-    datahi = (is64 ? *args++ : 0);
-    addrlo = *args++;
-    addrhi = (TARGET_LONG_BITS == 64 ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
+    MemOp opc = get_memop(oi);
 
 #ifdef CONFIG_SOFTMMU
-    mem_index = get_mmuidx(oi);
-    addend = tcg_out_tlb_read(s, addrlo, addrhi, opc, mem_index, 1);
+    TCGReg addend= tcg_out_tlb_read(s, addrlo, addrhi, opc, get_mmuidx(oi), 1);
 
-    /* This a conditional BL only to load a pointer within this opcode into LR
-       for the slow path.  We will not be using the value for a tail call.  */
-    label_ptr = s->code_ptr;
+    /*
+     * This a conditional BL only to load a pointer within this opcode into
+     * LR for the slow path.  We will not be using the value for a tail call.
+     */
+    tcg_insn_unit *label_ptr = s->code_ptr;
     tcg_out_bl_imm(s, COND_NE, 0);
 
     tcg_out_qemu_ld_index(s, opc, datalo, datahi, addrlo, addend, true);
 
-    add_qemu_ldst_label(s, true, oi, datalo, datahi, addrlo, addrhi,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, true, oi, data_type, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
     }
@@ -1918,41 +1908,26 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
 }
 #endif
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                            TCGReg addrlo, TCGReg addrhi,
+                            MemOpIdx oi, TCGType data_type)
 {
-    TCGReg addrlo, datalo, datahi, addrhi __attribute__((unused));
-    MemOpIdx oi;
-    MemOp opc;
-#ifdef CONFIG_SOFTMMU
-    int mem_index;
-    TCGReg addend;
-    tcg_insn_unit *label_ptr;
-#else
-    unsigned a_bits;
-#endif
-
-    datalo = *args++;
-    datahi = (is64 ? *args++ : 0);
-    addrlo = *args++;
-    addrhi = (TARGET_LONG_BITS == 64 ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
+    MemOp opc = get_memop(oi);
 
 #ifdef CONFIG_SOFTMMU
-    mem_index = get_mmuidx(oi);
-    addend = tcg_out_tlb_read(s, addrlo, addrhi, opc, mem_index, 0);
+    TCGReg addend = tcg_out_tlb_read(s, addrlo, addrhi, opc, get_mmuidx(oi), 0);
 
     tcg_out_qemu_st_index(s, COND_EQ, opc, datalo, datahi,
                           addrlo, addend, true);
 
     /* The conditional call must come last, as we're going to return here.  */
-    label_ptr = s->code_ptr;
+    tcg_insn_unit *label_ptr = s->code_ptr;
     tcg_out_bl_imm(s, COND_NE, 0);
 
-    add_qemu_ldst_label(s, false, oi, datalo, datahi, addrlo, addrhi,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, false, oi, data_type, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
     }
@@ -2245,16 +2220,40 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, 0);
+        if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_ld(s, args[0], -1, args[1], -1,
+                            args[2], TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_ld(s, args[0], -1, args[1], args[2],
+                            args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, 1);
+        if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_ld(s, args[0], args[1], args[2], -1,
+                            args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_ld(s, args[0], args[1], args[2], args[3],
+                            args[4], TCG_TYPE_I64);
+        }
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, args, 0);
+        if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_st(s, args[0], -1, args[1], -1,
+                            args[2], TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_st(s, args[0], -1, args[1], args[2],
+                            args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, 1);
+        if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_st(s, args[0], args[1], args[2], -1,
+                            args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_st(s, args[0], args[1], args[2], args[3],
+                            args[4], TCG_TYPE_I64);
+        }
         break;
 
     case INDEX_op_bswap16_i32:
-- 
2.34.1


