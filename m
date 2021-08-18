Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC363F0D89
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:40:52 +0200 (CEST)
Received: from localhost ([::1]:39616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTIp-0007HZ-5r
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7h-0005mW-KX
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:21 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:36519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7d-0005hU-MT
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:21 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so9893009pjr.1
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jvTjQd8+KKu37EfaBk52Wctzm/Jsx7FXZmS8XohP8ks=;
 b=i5JRD8RjOtedHY2l5ucOq8S93XZQIA+jScVu+sJQzuJ3FXl7JzrCiuhTLddHyylfg+
 ew9GI9538RvxG1n4OTv54WPQH9eR1LP36ZTUUprw3gCX0eBjBAt3iYjeLaPXxTlSbT7r
 wGxhJzMsrGFZj5imm5siJBwduwokim6al4NW2Dl5vWu+YHL/+W5u3JRcyo5DMB0OG9ym
 HQTzkiJl57xlvY2iJ7QlYWWOf66YM8PRYVH7Ba6u+lXnqH+tYoi0yXeSXOt1yognxUzb
 Rpot6HJ6ErhVWzeXdM3tS4F/F1yuezmaOp72y2WZ9DIGd1gtLk6YHX22N9brlYJu36wZ
 /AkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jvTjQd8+KKu37EfaBk52Wctzm/Jsx7FXZmS8XohP8ks=;
 b=ryIHX2p2FdEbKgJcys1NVtkNHdrIO/P9FQZBgrAxy3GomW/B7wIvbe77lIzLrKhEIA
 nVp+i93wOeTuk3NRf/7yWW6CpxG4favvZuAnhedvUXDwldi/Qtogm03lyyqu6TWCR4T2
 kL0sspn2B9rhMT2RMa2gYC+V5Kw6HGEMUEfd/DM+4Cgn7yn6bUn5RAdWJOPSZyaKrHep
 yiP/brXVhkrakeuAidfFEM/w3lWOONhhJTalwSH98bMrTm8hMmKRq51kdVsNxO2jEpZL
 CLL61XCuogpo66b3YP9MIO9HPbHMK4tiG0oORBa7th7dWloETyXzNUd1csCi2DhMxDDI
 nDZQ==
X-Gm-Message-State: AOAM530jqyT4yMeINmCmmW7hYkr+d0bPEHOnmmtnCbQbvGkKLgwuCuYb
 rxh3zead1uA5Q/RyinRayn6GjQf0W/Vdgg==
X-Google-Smtp-Source: ABdhPJyVvk9+7+UYuKsG6+Up85jPFr1HfWT0/RxczKvT3jcb4ls5bV0o1qVmn9PJcejJgQpJaEUimQ==
X-Received: by 2002:a17:902:e84f:b0:12d:830c:97a1 with SMTP id
 t15-20020a170902e84f00b0012d830c97a1mr8882077plg.27.1629322156413; 
 Wed, 18 Aug 2021 14:29:16 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id y19sm751965pfe.71.2021.08.18.14.29.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:29:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/14] tcg/arm: Standardize on tcg_out_<branch>_{reg,imm}
Date: Wed, 18 Aug 2021 11:29:00 -1000
Message-Id: <20210818212912.396794-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818212912.396794-1-richard.henderson@linaro.org>
References: <20210818212912.396794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some of the functions specified _reg, some _imm, and some
left it blank.  Make it clearer to which we are referring.

Split tcg_out_b_reg from tcg_out_bx_reg, to indicate when
we do not actually require BX semantics.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index cbe3057a9d..0578f9749b 100644
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
@@ -3065,7 +3071,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
     tcg_out_mov(s, TCG_TYPE_PTR, TCG_AREG0, tcg_target_call_iarg_regs[0]);
 
-    tcg_out_bx(s, COND_AL, tcg_target_call_iarg_regs[1]);
+    tcg_out_b_reg(s, COND_AL, tcg_target_call_iarg_regs[1]);
 
     /*
      * Return path for goto_ptr. Set return value to 0, a-la exit_tb,
-- 
2.25.1


