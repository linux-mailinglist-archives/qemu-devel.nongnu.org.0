Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42194312947
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:20:08 +0100 (CET)
Received: from localhost ([::1]:50166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8x5m-00062n-1Z
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:20:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSL-0002Hl-MQ
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:17 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:35893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSJ-00065Q-SJ
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:17 -0500
Received: by mail-pl1-x62a.google.com with SMTP id e9so7029480plh.3
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=akuogNqTsRbdFKyineyOU7+0wNNNt+eZ2/k7lVk1LqY=;
 b=Fj5U1zneqN1qiULdpE1elJx5/4nCGZJReVOf4YKyuDE1dS5vE/jyfz4BKY2u0JA4x9
 QRc14V3ZM1HoVqAbcQ+cJfvO91nLqp8fSiJiYrImtMxfmjSp3GAKpbRYe10tdQrLhcWp
 NkbNV/YVgEfPbvuBcVrZHZJ1fNj9QELiZLg9r8M+EnKBbKGo5pcwHF+OSAljv31ouqEc
 vF58flh5ltugEqlUx05W3sJFIvQuN5LM+M3ds0y7TVhi1TygDe2sA0jCxA1XKqL0CbmS
 6aAWNEV/8NS3QaDmP/SxejA9XYKxJCt7wamguPRFR6MWp+WCKrTkRsQD6hT/9oZsABV0
 GM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=akuogNqTsRbdFKyineyOU7+0wNNNt+eZ2/k7lVk1LqY=;
 b=GHxsbkj0h7rpruSUv1KLLrq7A0LF9b4+w+ahuNAAGta2v8YCSsqIrkQ/EKVgip4B8h
 z5TdE1mjFwAsEdW9QdWOv3rlZ9aEusfgKM3RTLcEg5SLWtbx2+okFl3mduvD0KWNO7oh
 t7yEMcpZe+ut9cstSUGMlo8Sszek2EAOMJo+cWb5f1+RheBPeYWZYzaN+Ek9WSRJYX8t
 kjoHCz3ikmlPzmCNv2Ij1aJc01Sfiq1bSHZRkrTTz1SQd1bds/s/IwOsUeA+oxwWmGrc
 Ggu6g3++ijWfMCmrnprbdpfL6lTcUoyHudO7Tx+lJamXSuAwRCfe5h7wMDisVnqhb4+m
 GKOQ==
X-Gm-Message-State: AOAM5321Za9/i0YEgfAI/GhSxSnElsLTsg8jWZfk7SrPfogt8siiPZ+4
 uDBp+iMhuXVvgPtajspHk26vuMSkmligbQ==
X-Google-Smtp-Source: ABdhPJwNzslcns1l/qLnNsUwqnwQkYIsJt3fxpgtALIJFvMqMTzqV40KirXjQqlmDaA4YDcEQDwr+g==
X-Received: by 2002:a17:902:ced2:b029:e2:8db8:266f with SMTP id
 d18-20020a170902ced2b02900e28db8266fmr14596207plg.34.1612751954631; 
 Sun, 07 Feb 2021 18:39:14 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 41/70] tcg/tci: Push opcode emit into each case
Date: Sun,  7 Feb 2021 18:37:23 -0800
Message-Id: <20210208023752.270606-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: sw@weilnetz.de
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


