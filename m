Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782B831E0DE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:55:05 +0100 (CET)
Received: from localhost ([::1]:39662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTqi-0006IV-Ec
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMQ-0000xx-M6
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:46 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMO-0007b6-RW
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:46 -0500
Received: by mail-pf1-x432.google.com with SMTP id c11so9143115pfp.10
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=akuogNqTsRbdFKyineyOU7+0wNNNt+eZ2/k7lVk1LqY=;
 b=raMcAiBmtMJDK7ZiSlDOHI2KrAo3JSbjWZ+jSM25rOEkM33vGZLcfa2qxvUk0xcaLS
 76lwbzLvi65MdNAKJC27U7XfzYDJjYaHiBy/RMq7LmI2vQVr7LKrL1FbbpC356yLBJsn
 1/ztYpRdRFMtFyTccYyUPyqd4VELKT918PfGLcZ9tj+vh+BLfcoTlQXAdeDIVpaR+nmS
 mh5VJhQbW+2ei2BQj6h8YT6E2HmqobKgVEMaAHInd4ie62vNpcoPkB9Vk3avjwwfXEZd
 ev2EWbLo34gutZjtZ1aj9ZgjF87TmGZjgIoEQoCOZfRg4lqrhO11lbiPKb9of/jDsWHd
 kaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=akuogNqTsRbdFKyineyOU7+0wNNNt+eZ2/k7lVk1LqY=;
 b=GNWEQQa8uqGYOXgmFL+PBKEnW5/TjSqw6LlgV6qsdE2KFmcD1xF/MSJCOBBoxfkGgC
 kZKGfoIe/Ytxyoz+QdiZLW5Ho6R5TUPFFYuePvFPZSfnLM3y+rsGscgMtEwLr1QXugBN
 +tmOU1lD6dzIYMV8W/+2uN0sLJJYcqbvFLgxV44AB4romiv9b6Bj2hd1yE8fdrRfit0B
 74Q5+uBStXy9AE7V/OjDa/RpF+fje+8Det6K31IRzIy+q5+p8bwXtP3tcB1LVr1IcEIQ
 ikGDff/QojVHrIYZ0rfocCGjGJxeQHliHqhkWgxam3T9OffK1t6dIp23/x3bEQUclkLm
 yddA==
X-Gm-Message-State: AOAM530UO6pSDxWrhGnmowkUV/yqCF37tfzu4PGoFaTixziM8quNVgWe
 q1pSmU+YxMaenKSv544qIx3V7RnOii/uZg==
X-Google-Smtp-Source: ABdhPJx1vYNhk7OuM5bT/RPcTVYvxbeGL88fgfUcx8QEL0YIWUsFzKcAl3yPOEFD/oC2wWf32dpURQ==
X-Received: by 2002:a62:8fca:0:b029:1a9:39bc:ed37 with SMTP id
 n193-20020a628fca0000b02901a939bced37mr836135pfd.61.1613593423285; 
 Wed, 17 Feb 2021 12:23:43 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:23:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 41/71] tcg/tci: Push opcode emit into each case
Date: Wed, 17 Feb 2021 12:20:06 -0800
Message-Id: <20210217202036.1724901-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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


