Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 268A133766D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:03:59 +0100 (CET)
Received: from localhost ([::1]:33516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMr0-0003C4-4X
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUU-0003kL-IA
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:47 -0500
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:40816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUR-0006ZJ-TP
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:42 -0500
Received: by mail-qk1-x731.google.com with SMTP id l132so20782345qke.7
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=akuogNqTsRbdFKyineyOU7+0wNNNt+eZ2/k7lVk1LqY=;
 b=TD5sfoMwi9HZhVYVL7CLcKKqV8L3KdWO9Ksz0SMPKl+40jJ6Te6T5zO2NzHQOQCktB
 3VOhmm26xnS42PnrA5dYwE0tthinuW/o8AWlY21cmcobspgGfRkKAzjPIeRSu+pkvcof
 WB4us0s4p8InsJ6zWwSIbpa7sW8Sc8wQMOh/UzoAXAa03Di9qvU2hW6ZC0zBppha4RJG
 O9s8YCuVbXuJ+4bRL0e4tn+U18yiEXTsmtibsFxy2FukXyiamEYMHYKOLreHacvpiK/g
 9IBu/OdQyRvUcx9Q3kxEinYPbT1PE5RnXg/il/fuz4nIaRlmk7DF2pKPaXNn6VdXQj1D
 Wuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=akuogNqTsRbdFKyineyOU7+0wNNNt+eZ2/k7lVk1LqY=;
 b=j7od8BOFUFx4MYQRLcjeyj/GuLyO8GiiGMEplB/2Ux84Hy+cDJQgsPI5NFvdiTr5HS
 isF+4C0QHLNz4IodVjsKmGb8YbBbOKr8Axu39Pss61jivbducDDLtgpm5/UhsxLZPqHo
 bT8yHNeqQvh9QfaCVr5Ra1yU0huFN4OXULU1JP06VK+jbxpSi+fKbq25dOyEZutZ+iZt
 4tMZ3XAJo50SfaCQ1uma1eEl+X7AUwQeqxTeauO9qHRIiSKrD1iDSgbdkX0EAlQGG9EH
 R+v8lD/QV2ra6mS+8wWPOfITfrFGaJP6zeWkIB3X4pj4iH33noUOrOz8pr8zk2Iks29y
 CYSw==
X-Gm-Message-State: AOAM530ZAHxOb4YxY80RYIYa0yPxeqYRV/wscBFgo+xwuO1RbD3vBJrN
 ZPXXv3ekCyK9hT+dUZXLLBbSjPZRu+H4rbMk
X-Google-Smtp-Source: ABdhPJzTsen1qpQ/qiS2T02Sm4J80Sy4LVad3FhUz8q9NiIk4AwGOaGL+swi+CLSz774/ACBgJ3fnw==
X-Received: by 2002:a37:8c1:: with SMTP id 184mr165437qki.472.1615473632630;
 Thu, 11 Mar 2021 06:40:32 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 26/57] tcg/tci: Push opcode emit into each case
Date: Thu, 11 Mar 2021 08:39:27 -0600
Message-Id: <20210311143958.562625-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to split out bytecode output into helpers, but
we can't do that one at a time if tcg_out_op_t is being done
outside of the switch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 53edc50a3b..050d514853 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -385,40 +385,48 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 {
     uint8_t *old_code_ptr = s->code_ptr;
 
-    tcg_out_op_t(s, opc);
-
     switch (opc) {
     case INDEX_op_exit_tb:
+        tcg_out_op_t(s, opc);
         tcg_out_i(s, args[0]);
+        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
 
     case INDEX_op_goto_tb:
         tcg_debug_assert(s->tb_jmp_insn_offset == 0);
         /* indirect jump method. */
+        tcg_out_op_t(s, opc);
         tcg_out_i(s, (uintptr_t)(s->tb_jmp_target_addr + args[0]));
+        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         set_jmp_reset_offset(s, args[0]);
         break;
 
     case INDEX_op_br:
+        tcg_out_op_t(s, opc);
         tci_out_label(s, arg_label(args[0]));
+        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
 
     CASE_32_64(setcond)
+        tcg_out_op_t(s, opc);
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out_r(s, args[2]);
         tcg_out8(s, args[3]);   /* condition */
+        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
 
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_setcond2_i32:
         /* setcond2_i32 cond, t0, t1_low, t1_high, t2_low, t2_high */
+        tcg_out_op_t(s, opc);
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out_r(s, args[2]);
         tcg_out_r(s, args[3]);
         tcg_out_r(s, args[4]);
         tcg_out8(s, args[5]);   /* condition */
+        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
 #endif
 
@@ -436,10 +444,12 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     CASE_64(st32)
     CASE_64(st)
         stack_bounds_check(args[1], args[2]);
+        tcg_out_op_t(s, opc);
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_debug_assert(args[2] == (int32_t)args[2]);
         tcg_out32(s, args[2]);
+        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
 
     CASE_32_64(add)
@@ -462,12 +472,15 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     CASE_32_64(divu)     /* Optional (TCG_TARGET_HAS_div_*). */
     CASE_32_64(rem)      /* Optional (TCG_TARGET_HAS_div_*). */
     CASE_32_64(remu)     /* Optional (TCG_TARGET_HAS_div_*). */
+        tcg_out_op_t(s, opc);
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out_r(s, args[2]);
+        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
 
     CASE_32_64(deposit)  /* Optional (TCG_TARGET_HAS_deposit_*). */
+        tcg_out_op_t(s, opc);
         {
             TCGArg pos = args[3], len = args[4];
             TCGArg max = opc == INDEX_op_deposit_i32 ? 32 : 64;
@@ -481,13 +494,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
             tcg_out8(s, pos);
             tcg_out8(s, len);
         }
+        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
 
     CASE_32_64(brcond)
+        tcg_out_op_t(s, opc);
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out8(s, args[2]);           /* condition */
         tci_out_label(s, arg_label(args[3]));
+        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
@@ -503,48 +519,59 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     CASE_32_64(bswap16)  /* Optional (TCG_TARGET_HAS_bswap16_*). */
     CASE_32_64(bswap32)  /* Optional (TCG_TARGET_HAS_bswap32_*). */
     CASE_64(bswap64)     /* Optional (TCG_TARGET_HAS_bswap64_i64). */
+        tcg_out_op_t(s, opc);
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
+        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
 
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
+        tcg_out_op_t(s, opc);
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out_r(s, args[2]);
         tcg_out_r(s, args[3]);
         tcg_out_r(s, args[4]);
         tcg_out_r(s, args[5]);
+        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
     case INDEX_op_brcond2_i32:
+        tcg_out_op_t(s, opc);
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out_r(s, args[2]);
         tcg_out_r(s, args[3]);
         tcg_out8(s, args[4]);           /* condition */
         tci_out_label(s, arg_label(args[5]));
+        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
     case INDEX_op_mulu2_i32:
+        tcg_out_op_t(s, opc);
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out_r(s, args[2]);
         tcg_out_r(s, args[3]);
+        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
 #endif
 
     case INDEX_op_qemu_ld_i32:
     case INDEX_op_qemu_st_i32:
+        tcg_out_op_t(s, opc);
         tcg_out_r(s, *args++);
         tcg_out_r(s, *args++);
         if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
             tcg_out_r(s, *args++);
         }
         tcg_out32(s, *args++);
+        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
 
     case INDEX_op_qemu_ld_i64:
     case INDEX_op_qemu_st_i64:
+        tcg_out_op_t(s, opc);
         tcg_out_r(s, *args++);
         if (TCG_TARGET_REG_BITS == 32) {
             tcg_out_r(s, *args++);
@@ -554,9 +581,12 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
             tcg_out_r(s, *args++);
         }
         tcg_out32(s, *args++);
+        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
 
     case INDEX_op_mb:
+        tcg_out_op_t(s, opc);
+        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
@@ -565,7 +595,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     default:
         tcg_abort();
     }
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
 static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg, TCGReg arg1,
-- 
2.25.1


