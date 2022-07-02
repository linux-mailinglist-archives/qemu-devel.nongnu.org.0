Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17920563EC2
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 08:09:09 +0200 (CEST)
Received: from localhost ([::1]:37770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7WJY-0000tC-6I
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 02:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7WDP-00035e-KO
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:02:47 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7WDN-0004sM-SJ
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:02:47 -0400
Received: by mail-pl1-x634.google.com with SMTP id r1so4173536plo.10
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 23:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eHKkLzGG0Agc+EIiK5URkE6gZDnUx3WL+56oJZ1cu3c=;
 b=df68vIYdQLczovEaQQJf8gS/7y0fV/8tKo+oqOf7iTKgHxnHb6S7VApso7YBguPNcQ
 UvhTpIvW/yPFwrLoWVzIOEkJWB6w2vSNsPea/cGhUGt5G5W4qzQ9kb9Fne13jD4ltHmv
 zdtULHgfVwygA6z8vAfQHL80GB1nw0BTVLzF+1j36AITRskNi5TZiCbRK+GVQVjjMbHU
 aHJm1Xn84nKyFJ9ITnJZLeui1Lh6KQ262301g8u2r8iAdn2u23NL22hx8IWm74Yeq13k
 Ja2qVp8tbkH2yE/EETbw5U3Rp0jElwcUyukpUKl6VwLs1av3l9Pfe8EvlLkAv8r9Vl4M
 gYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eHKkLzGG0Agc+EIiK5URkE6gZDnUx3WL+56oJZ1cu3c=;
 b=LtxYmj6QMTKAfx6Yi7b2nRUb9iTGAa/aioZ+thGW4CBufPqWk0Ev8Cvnj1Sbhzs7cL
 w7WWoA4iFGGyfkKySQdUxGLIgBHy41svIQmgQioAZkoKht1LAa2b8H/rYk9YwwTR2wDO
 Rnz/+r8Em7wTUfc+MfTtSBsEI5Pkz55kJgmm1o53TShqRdIdoMP7s89hpExOGjGSQ1Zh
 r1tm0dR+asjaJDX4mB6y1txPjZJPgIjrYktfHF0u3x+ofRDwpXDkasQeJ5F65icpeKX8
 qjTy7CNh0znVIw5PRc5TeKo+11+BuYGKILX4uDrZvfy2sMBtILoUh/rac6HTl8C6Nyze
 ep1Q==
X-Gm-Message-State: AJIora/0ZCQkohL0ksljgMqhJwpqe4Y1ZmODwljUX04r5D/XmYlZafIE
 g32dBvOoBydAHlPegagmYJTSJoVrXnwDl4iA
X-Google-Smtp-Source: AGRyM1tS/CQLvw0bVhzR0v5o0Sjc/hM2+nmEN3DCuoEF1wdv2boRmmqR7QtjnCHB33GE1GNwZZkwCw==
X-Received: by 2002:a17:90b:218:b0:1ef:1440:ebe1 with SMTP id
 fy24-20020a17090b021800b001ef1440ebe1mr22466975pjb.166.1656741764447; 
 Fri, 01 Jul 2022 23:02:44 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z2-20020a17090a66c200b001ece55b938asm5232178pjl.32.2022.07.01.23.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 23:02:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: svens@linux.ibm.com,
	qemu-s390x@nongnu.org
Subject: [PATCH v2 3/4] target/s390x: Remove DISAS_PC_STALE_NOCHAIN
Date: Sat,  2 Jul 2022 11:32:27 +0530
Message-Id: <20220702060228.420454-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220702060228.420454-1-richard.henderson@linaro.org>
References: <20220702060228.420454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace this with a flag: exit_to_mainloop.
We can now control the exit for each of DISAS_TOO_MANY,
DISAS_PC_UPDATED, and DISAS_PC_CC_UPDATED, and fold in
the check for PER.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index a3422c0eb0..eac59c3dd1 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -149,6 +149,7 @@ struct DisasContext {
     uint64_t pc_tmp;
     uint32_t ilen;
     enum cc_op cc_op;
+    bool exit_to_mainloop;
 };
 
 /* Information carried about a condition to be evaluated.  */
@@ -1126,9 +1127,6 @@ typedef struct {
 /* We have updated the PC and CC values.  */
 #define DISAS_PC_CC_UPDATED     DISAS_TARGET_2
 
-/* We are exiting the TB to the main loop.  */
-#define DISAS_PC_STALE_NOCHAIN  DISAS_TARGET_4
-
 
 /* Instruction flags */
 #define IF_AFP1     0x0001      /* r1 is a fp reg for HFP/FPS instructions */
@@ -3022,7 +3020,8 @@ static DisasJumpType op_lctl(DisasContext *s, DisasOps *o)
     tcg_temp_free_i32(r1);
     tcg_temp_free_i32(r3);
     /* Exit to main loop to reevaluate s390_cpu_exec_interrupt.  */
-    return DISAS_PC_STALE_NOCHAIN;
+    s->exit_to_mainloop = true;
+    return DISAS_TOO_MANY;
 }
 
 static DisasJumpType op_lctlg(DisasContext *s, DisasOps *o)
@@ -3033,7 +3032,8 @@ static DisasJumpType op_lctlg(DisasContext *s, DisasOps *o)
     tcg_temp_free_i32(r1);
     tcg_temp_free_i32(r3);
     /* Exit to main loop to reevaluate s390_cpu_exec_interrupt.  */
-    return DISAS_PC_STALE_NOCHAIN;
+    s->exit_to_mainloop = true;
+    return DISAS_TOO_MANY;
 }
 
 static DisasJumpType op_lra(DisasContext *s, DisasOps *o)
@@ -4283,7 +4283,8 @@ static DisasJumpType op_ssm(DisasContext *s, DisasOps *o)
 {
     tcg_gen_deposit_i64(psw_mask, psw_mask, o->in2, 56, 8);
     /* Exit to main loop to reevaluate s390_cpu_exec_interrupt.  */
-    return DISAS_PC_STALE_NOCHAIN;
+    s->exit_to_mainloop = true;
+    return DISAS_TOO_MANY;
 }
 
 static DisasJumpType op_stap(DisasContext *s, DisasOps *o)
@@ -4548,7 +4549,8 @@ static DisasJumpType op_stnosm(DisasContext *s, DisasOps *o)
     }
 
     /* Exit to main loop to reevaluate s390_cpu_exec_interrupt.  */
-    return DISAS_PC_STALE_NOCHAIN;
+    s->exit_to_mainloop = true;
+    return DISAS_TOO_MANY;
 }
 
 static DisasJumpType op_stura(DisasContext *s, DisasOps *o)
@@ -6591,6 +6593,7 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     dc->cc_op = CC_OP_DYNAMIC;
     dc->ex_value = dc->base.tb->cs_base;
+    dc->exit_to_mainloop = (dc->base.tb->flags & FLAG_MASK_PER);
 }
 
 static void s390x_tr_tb_start(DisasContextBase *db, CPUState *cs)
@@ -6630,7 +6633,6 @@ static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     case DISAS_NORETURN:
         break;
     case DISAS_TOO_MANY:
-    case DISAS_PC_STALE_NOCHAIN:
         update_psw_addr(dc);
         /* FALLTHRU */
     case DISAS_PC_UPDATED:
@@ -6640,8 +6642,7 @@ static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         /* FALLTHRU */
     case DISAS_PC_CC_UPDATED:
         /* Exit the TB, either by raising a debug exception or by return.  */
-        if ((dc->base.tb->flags & FLAG_MASK_PER) ||
-             dc->base.is_jmp == DISAS_PC_STALE_NOCHAIN) {
+        if (dc->exit_to_mainloop) {
             tcg_gen_exit_tb(NULL, 0);
         } else {
             tcg_gen_lookup_and_goto_ptr();
-- 
2.34.1


