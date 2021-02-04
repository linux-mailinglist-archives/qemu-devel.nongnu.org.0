Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB6330EA3B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:34:14 +0100 (CET)
Received: from localhost ([::1]:46710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UTF-0001Am-QO
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjm-0006DL-33
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:16 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjg-00049e-Ic
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:13 -0500
Received: by mail-pg1-x532.google.com with SMTP id n10so1017256pgl.10
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=akuogNqTsRbdFKyineyOU7+0wNNNt+eZ2/k7lVk1LqY=;
 b=sIm0cUPbbgveHZSAfIhqybZBzqYbIspHWJnBiFvzKaPhf7QiH1NFM6mT3byN2HvB9K
 fua2Pc3InkRp2epkA30w7Td5kQMoVd0Jd0vhqhO8R3X5i+2D/6ZylG9yhAr88LOBYlxv
 OLaV3mDS5JHQOnpqtPd1k3V3/1xStT6gTFT9lIlD/ELwDoywmnsrv/JvxmHkmg993SbL
 X2ew7alHZnUFS076Cohm9YFmz45QO7ws9liy2RS4caRzNLTUyKnp862ItobhpMjUtfdD
 nBKhzewpnsb7nHdzWIAATiMkspxm+PQywKy9vSXpMS1Y2Y4vggeIiiqtRvP/lwvdU1aC
 fPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=akuogNqTsRbdFKyineyOU7+0wNNNt+eZ2/k7lVk1LqY=;
 b=PlrOkUUn48iMdj9iAHskrS66A/AyLfZlKkA83W6y5QZaTAoKcEv7DzcnpyzESNhiIC
 IQESTRo5hQ9PGfR8LL7U2gESwbDkii36oUzshqA+K0cd/RMSuYZzsmv+gzqX6YoyZXfs
 earQHASURNgim3ZiXGmbcx6eCjJWe3HwkzhPlIc7WuaVtsiWummTPOgF4L+eF2yyFZID
 LwHlhn0z4UHFwng9621wL0vfiDHNt4o3p9iAq8mdP7Baf+y/biXODJfF33LuzH0lsLgJ
 Jqv/9/5nJbopsFp8q8dYqon21oJ+0rNYn7AJgx0/sqgGwHr6IpofqiKHfMY8MYdlCNqy
 KgRQ==
X-Gm-Message-State: AOAM531WPt3MRPORW+3DI+RzXWTuZdSfB2OYmYkYlPxZdkhnSWqPIgkt
 y8F+UFysw1YX9H8EzhFjpxehRKq4PAMhFvZU
X-Google-Smtp-Source: ABdhPJxJJSq9W8skWn67Cr1yv0/DVWMPwwDr3v/O/WBxTGdkRDcB7KJrrOFwoF679TYa3FfjoVS1hQ==
X-Received: by 2002:aa7:80ca:0:b029:1c1:b636:ecc2 with SMTP id
 a10-20020aa780ca0000b02901c1b636ecc2mr5841449pfn.20.1612403227117; 
 Wed, 03 Feb 2021 17:47:07 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:47:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 66/93] tcg/tci: Push opcode emit into each case
Date: Wed,  3 Feb 2021 15:44:42 -1000
Message-Id: <20210204014509.882821-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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


