Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449B96F8B13
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:30:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2yR-0006mN-S5; Fri, 05 May 2023 17:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2yO-0006bm-R2
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:28:16 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2yL-0005SE-OO
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:28:16 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f19b9d5358so22961625e9.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683322092; x=1685914092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yu6T1N8rjMDvjcqVloIbI64DCiKYMAX1Jvlpvr4G/Zc=;
 b=mdheJA/Gwu2S4s+zM7DrfAwI0C+a3YjIS3/Q2E8eusWP7QbcQFEKenicfBjcwI+VV/
 hAbHKcU1izwfho4yCeVbdG9x9Pn5R/EYf2lpbUFhatdi+LtJDuKZMQA8hDOkiOt+hSDN
 Cx0bTl/2BE3UhM+0Tk6uoE0FUs3Kd1Q2FSd6alzOE6czspQdPYLLN5xkYa0NO4qv59PX
 owXmrRsXDRy6iASD+F7C5FO64B34BJKQBrFvEqQCjxLyl4c+gk9IfojwOT5eLBOFCmV0
 gOxaPDvCpDaQHaq/qf4bRuuugwKrmHCLx1ua3lQajzyzz6Gf965ObbJs664ftl35olj4
 t5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683322092; x=1685914092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yu6T1N8rjMDvjcqVloIbI64DCiKYMAX1Jvlpvr4G/Zc=;
 b=e7lRA50h8gG6Gd++pvnDEyJV26q+cpPXvz6p9lw4N1TGJiT2giDt81heZcnL5SXTG/
 zr28wqw3cbXAyyiZfUKp1Sl5J4R11JkLH7afmotVZAdWC5A8aLgi+oCaeHfoYGe5gqep
 6gnNyn038IhRSwywfCAI5J1XJhcT28JJ1pHonXn6nXoLr9u3hnZ9cDNCuk0KyFj5B4QV
 vzsezeJhi/9ElqEuCnOibqWcgAUcdk7s0JGw66vLMdOnvxvIFIkkBOs6UIyT1OYt+Vn1
 bCwp6Mh2li4YQt2HU7BbEDU38l6H/j5fAqRRZER9izG1sXzKsH5/KOcBJZAcmvfSysNO
 aXZQ==
X-Gm-Message-State: AC+VfDxzjzg6u1lIzDFSHJ4sy3HeibhvIwM1TosqkDljaNuJkj7XXpTm
 pm+kXdlBYVPs46HithNs1OEapabOMlqtwQag3tiKMQ==
X-Google-Smtp-Source: ACHHUZ5S9DsPZofiXQjo1H6G76XHwh6U3E+/qnIGRKwOkHhqKpWw2L/gCFU9xXbGnotvtF/LnK8HaQ==
X-Received: by 2002:a5d:470b:0:b0:306:2ddb:47ab with SMTP id
 y11-20020a5d470b000000b003062ddb47abmr2397988wrq.39.1683322092209; 
 Fri, 05 May 2023 14:28:12 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c220a00b003f171234a08sm9009001wml.20.2023.05.05.14.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:28:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 41/42] tcg: Introduce arg_slot_stk_ofs
Date: Fri,  5 May 2023 22:24:46 +0100
Message-Id: <20230505212447.374546-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
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

Unify all computation of argument stack offset in one function.
This requires that we adjust ref_slot to be in the same units,
by adding max_reg_slots during init_call_layout.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index fa28db0188..057423c121 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -816,6 +816,15 @@ static inline bool arg_slot_reg_p(unsigned arg_slot)
     return arg_slot < nreg;
 }
 
+static inline int arg_slot_stk_ofs(unsigned arg_slot)
+{
+    unsigned max = TCG_STATIC_CALL_ARGS_SIZE / sizeof(tcg_target_long);
+    unsigned stk_slot = arg_slot - ARRAY_SIZE(tcg_target_call_iarg_regs);
+
+    tcg_debug_assert(stk_slot < max);
+    return TCG_TARGET_CALL_STACK_OFFSET + stk_slot * sizeof(tcg_target_long);
+}
+
 typedef struct TCGCumulativeArgs {
     int arg_idx;                /* tcg_gen_callN args[] */
     int info_in_idx;            /* TCGHelperInfo in[] */
@@ -1055,6 +1064,7 @@ static void init_call_layout(TCGHelperInfo *info)
             }
         }
         assert(ref_base + cum.ref_slot <= max_stk_slots);
+        ref_base += max_reg_slots;
 
         if (ref_base != 0) {
             for (int i = cum.info_in_idx - 1; i >= 0; --i) {
@@ -4826,7 +4836,7 @@ static void load_arg_reg(TCGContext *s, TCGReg reg, TCGTemp *ts,
     }
 }
 
-static void load_arg_stk(TCGContext *s, int stk_slot, TCGTemp *ts,
+static void load_arg_stk(TCGContext *s, unsigned arg_slot, TCGTemp *ts,
                          TCGRegSet allocated_regs)
 {
     /*
@@ -4836,8 +4846,7 @@ static void load_arg_stk(TCGContext *s, int stk_slot, TCGTemp *ts,
      */
     temp_load(s, ts, tcg_target_available_regs[ts->type], allocated_regs, 0);
     tcg_out_st(s, ts->type, ts->reg, TCG_REG_CALL_STACK,
-               TCG_TARGET_CALL_STACK_OFFSET +
-               stk_slot * sizeof(tcg_target_long));
+               arg_slot_stk_ofs(arg_slot));
 }
 
 static void load_arg_normal(TCGContext *s, const TCGCallArgumentLoc *l,
@@ -4848,18 +4857,16 @@ static void load_arg_normal(TCGContext *s, const TCGCallArgumentLoc *l,
         load_arg_reg(s, reg, ts, *allocated_regs);
         tcg_regset_set_reg(*allocated_regs, reg);
     } else {
-        load_arg_stk(s, l->arg_slot - ARRAY_SIZE(tcg_target_call_iarg_regs),
-                     ts, *allocated_regs);
+        load_arg_stk(s, l->arg_slot, ts, *allocated_regs);
     }
 }
 
-static void load_arg_ref(TCGContext *s, int arg_slot, TCGReg ref_base,
+static void load_arg_ref(TCGContext *s, unsigned arg_slot, TCGReg ref_base,
                          intptr_t ref_off, TCGRegSet *allocated_regs)
 {
     TCGReg reg;
-    int stk_slot = arg_slot - ARRAY_SIZE(tcg_target_call_iarg_regs);
 
-    if (stk_slot < 0) {
+    if (arg_slot_reg_p(arg_slot)) {
         reg = tcg_target_call_iarg_regs[arg_slot];
         tcg_reg_free(s, reg, *allocated_regs);
         tcg_out_addi_ptr(s, reg, ref_base, ref_off);
@@ -4869,8 +4876,7 @@ static void load_arg_ref(TCGContext *s, int arg_slot, TCGReg ref_base,
                             *allocated_regs, 0, false);
         tcg_out_addi_ptr(s, reg, ref_base, ref_off);
         tcg_out_st(s, TCG_TYPE_PTR, reg, TCG_REG_CALL_STACK,
-                   TCG_TARGET_CALL_STACK_OFFSET
-                   + stk_slot * sizeof(tcg_target_long));
+                   arg_slot_stk_ofs(arg_slot));
     }
 }
 
@@ -4900,8 +4906,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         case TCG_CALL_ARG_BY_REF:
             load_arg_stk(s, loc->ref_slot, ts, allocated_regs);
             load_arg_ref(s, loc->arg_slot, TCG_REG_CALL_STACK,
-                         TCG_TARGET_CALL_STACK_OFFSET
-                         + loc->ref_slot * sizeof(tcg_target_long),
+                         arg_slot_stk_ofs(loc->ref_slot),
                          &allocated_regs);
             break;
         case TCG_CALL_ARG_BY_REF_N:
-- 
2.34.1


