Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A1E6EC4FB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:44:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqozS-0000ZP-Ha; Mon, 24 Apr 2023 01:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxd-0005g7-6q
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:42:02 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowy-0004Nc-Tg
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:42:00 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3003b97fa12so2313232f8f.2
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314879; x=1684906879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KyKsoDmohPBZSp4W8unRK+Qo86bIZbr6mB+lGKIr14Y=;
 b=ZkPIe1wovs4N8UWsZQ0RO5snYb05/CoMB5vFLXUFytyTRadSObkl3zOfylCRBvwTGg
 S1pG7Ok8WPs8lBg8mNmFmtj9iJ8DSztrtec45TMZqxh95mLTenhG52Q0nOLt4ZpR71vR
 9bFkRbzlN5cwUPJb/F/zG/2s+Esr8vUSr1gJZo7/cOP+vuG8u7yv88zxU3XVHafvSnfi
 LTq5Yh2Ad0bFeCtpAFWXFl9FCx8JcDgF8jS1EkqFR03K9LEw8b+UXoZaQ7wwUWfgs6DU
 jPDGnfMgI1JrOHPgxOaDcCLRDuqBifhdB1hsVhEgGJH/7g3LKAK12op9LUODbp3W1Fp4
 yhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314879; x=1684906879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KyKsoDmohPBZSp4W8unRK+Qo86bIZbr6mB+lGKIr14Y=;
 b=KRyhELJBtKQCLntgPZLAA9O6OHqW46SGouHsnFNlLWwTODqZEONcywgI67InlTP4K5
 UIoe0v/sUBjdYQ8RYDnAqdbBzyTxb5t1Pn7KDeSULCABrG0z/RJikxeIfpf0mMkMaptx
 T+MjNDDVcXuawSPts8npKoAQLlamkYQTYVext39Mw1FaBgbquANlFCxq1Tjz6zr+c8Kl
 Q08Lzvd0gE3WIGKJ6MFn6yEkPNMBQomTY9sxNtMSNfCjNsnmnmbo+/d2aheSVM1uI3qR
 2WW1s0SZ6FAlgShJO7Y3BZYPoAWqB1k1paWliREDtmEyZT51EiDD2hwDlC6IhAKHpe1B
 EiCw==
X-Gm-Message-State: AAQBX9fNzCenoOsVYaNuL7a8+4fVkYVAUIsS6vcnVoCRV3XFevlHPhku
 4CFStksBxN/9raGp0rt/MVLHniHsTMR6bdClRSiItQ==
X-Google-Smtp-Source: AKy350Ym3IGd+b4GwL1cIXmNiuaGdJ3p6ncr1SHsAb87dRpVtbt9CfMvwWTgSrA2M0Y8KsROlXSU1w==
X-Received: by 2002:a5d:4882:0:b0:2ef:b8d1:9560 with SMTP id
 g2-20020a5d4882000000b002efb8d19560mr9186824wrq.30.1682314879440; 
 Sun, 23 Apr 2023 22:41:19 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 23/57] tcg/ppc: Rationalize args to tcg_out_qemu_{ld,st}
Date: Mon, 24 Apr 2023 06:40:31 +0100
Message-Id: <20230424054105.1579315-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Interpret the variable argument placement in the caller.  Pass data_type
instead of is64 -- there are several places where we already convert back
from bool to type.  Clean things up by using type throughout.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 110 +++++++++++++++++++++------------------
 1 file changed, 59 insertions(+), 51 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 77abb7d20c..d1aa2a9f53 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2118,7 +2118,8 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, MemOp opc,
 /* Record the context of a call to the out of line helper code for the slow
    path for a load or store, so that we can later generate the correct
    helper code.  */
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
+static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
+                                TCGType type, MemOpIdx oi,
                                 TCGReg datalo_reg, TCGReg datahi_reg,
                                 TCGReg addrlo_reg, TCGReg addrhi_reg,
                                 tcg_insn_unit *raddr, tcg_insn_unit *lptr)
@@ -2126,6 +2127,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
     TCGLabelQemuLdst *label = new_ldst_label(s);
 
     label->is_ld = is_ld;
+    label->type = type;
     label->oi = oi;
     label->datalo_reg = datalo_reg;
     label->datahi_reg = datahi_reg;
@@ -2288,30 +2290,18 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
 #endif /* SOFTMMU */
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
+static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                            TCGReg addrlo, TCGReg addrhi,
+                            MemOpIdx oi, TCGType data_type)
 {
-    TCGReg datalo, datahi, addrlo, rbase;
-    TCGReg addrhi __attribute__((unused));
-    MemOpIdx oi;
-    MemOp opc, s_bits;
+    MemOp opc = get_memop(oi);
+    MemOp s_bits = opc & MO_SIZE;
+    TCGReg rbase;
+
 #ifdef CONFIG_SOFTMMU
-    int mem_index;
     tcg_insn_unit *label_ptr;
-#else
-    unsigned a_bits;
-#endif
 
-    datalo = *args++;
-    datahi = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
-    addrlo = *args++;
-    addrhi = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
-    s_bits = opc & MO_SIZE;
-
-#ifdef CONFIG_SOFTMMU
-    mem_index = get_mmuidx(oi);
-    addrlo = tcg_out_tlb_read(s, opc, addrlo, addrhi, mem_index, true);
+    addrlo = tcg_out_tlb_read(s, opc, addrlo, addrhi, get_mmuidx(oi), true);
 
     /* Load a pointer into the current opcode w/conditional branch-link. */
     label_ptr = s->code_ptr;
@@ -2319,7 +2309,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 
     rbase = TCG_REG_R3;
 #else  /* !CONFIG_SOFTMMU */
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
     }
@@ -2364,35 +2354,23 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
     }
 
 #ifdef CONFIG_SOFTMMU
-    add_qemu_ldst_label(s, true, oi, datalo, datahi, addrlo, addrhi,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, true, data_type, oi, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #endif
 }
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
+static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                            TCGReg addrlo, TCGReg addrhi,
+                            MemOpIdx oi, TCGType data_type)
 {
-    TCGReg datalo, datahi, addrlo, rbase;
-    TCGReg addrhi __attribute__((unused));
-    MemOpIdx oi;
-    MemOp opc, s_bits;
+    MemOp opc = get_memop(oi);
+    MemOp s_bits = opc & MO_SIZE;
+    TCGReg rbase;
+
 #ifdef CONFIG_SOFTMMU
-    int mem_index;
     tcg_insn_unit *label_ptr;
-#else
-    unsigned a_bits;
-#endif
 
-    datalo = *args++;
-    datahi = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
-    addrlo = *args++;
-    addrhi = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
-    s_bits = opc & MO_SIZE;
-
-#ifdef CONFIG_SOFTMMU
-    mem_index = get_mmuidx(oi);
-    addrlo = tcg_out_tlb_read(s, opc, addrlo, addrhi, mem_index, false);
+    addrlo = tcg_out_tlb_read(s, opc, addrlo, addrhi, get_mmuidx(oi), false);
 
     /* Load a pointer into the current opcode w/conditional branch-link. */
     label_ptr = s->code_ptr;
@@ -2400,7 +2378,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 
     rbase = TCG_REG_R3;
 #else  /* !CONFIG_SOFTMMU */
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
     }
@@ -2437,8 +2415,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
     }
 
 #ifdef CONFIG_SOFTMMU
-    add_qemu_ldst_label(s, false, oi, datalo, datahi, addrlo, addrhi,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, false, data_type, oi, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #endif
 }
 
@@ -2972,16 +2950,46 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, false);
+        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+            tcg_out_qemu_ld(s, args[0], -1, args[1], -1,
+                            args[2], TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_ld(s, args[0], -1, args[1], args[2],
+                            args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, true);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_ld(s, args[0], -1, args[1], -1,
+                            args[2], TCG_TYPE_I64);
+        } else if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_ld(s, args[0], args[1], args[2], -1,
+                            args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_ld(s, args[0], args[1], args[2], args[3],
+                            args[4], TCG_TYPE_I64);
+        }
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, args, false);
+        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+            tcg_out_qemu_st(s, args[0], -1, args[1], -1,
+                            args[2], TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_st(s, args[0], -1, args[1], args[2],
+                            args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, true);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_st(s, args[0], -1, args[1], -1,
+                            args[2], TCG_TYPE_I64);
+        } else if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_st(s, args[0], args[1], args[2], -1,
+                            args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_st(s, args[0], args[1], args[2], args[3],
+                            args[4], TCG_TYPE_I64);
+        }
         break;
 
     case INDEX_op_setcond_i32:
-- 
2.34.1


