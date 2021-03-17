Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5646E33F42D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:48:19 +0100 (CET)
Received: from localhost ([::1]:33322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYPC-0001C3-AC
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCf-0005J7-Cl
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:24 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:44939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCU-0007Fi-BZ
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:20 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 y19-20020a0568301d93b02901b9f88a238eso2156609oti.11
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jxlf9j4i3P6aWFIN0pGtiPy9SuEouipzz5x6uws4lSA=;
 b=mVw9aZ+AWtQP2M3KkbIzO8plZC4q8rMJ0AuAKOZIW3BEVnIyO0Emi1qnH+o8wRmb6n
 IkdbJc6nrVNm4Cw/SXkOt1MXJ5yQ4EB/GCnUzpzz8DiWpCpAFRzAyoHg2W5hlruKKFEe
 vlfvflQhlW6paLAa4p6aA4k1tSose36amezxf1GV/NGIvrkCcoMcjxmhuGvApzC+LjyR
 C8vxaORLskNAcFzz/3k/IrbJ3lWcFhJeY/jI5KU25r1Ejhr7lB+C1d5FLSv31sGZX9ez
 dTRk6VMtt1/b7VXJlUUyzfOjy0sXDZ+SpOWnWZmTe1nzmHjhGzQr3nLrIxtbYLFw0PCM
 6d0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jxlf9j4i3P6aWFIN0pGtiPy9SuEouipzz5x6uws4lSA=;
 b=WXFddFULoJIqgyNln35uwSFQ9QP9PyglZ4k7EqV5UmJYmWsFDJxo+HsDWJAk2/yrJE
 ebM+LVYpjJzrOYHqkeSNtMsHpFSp7z9RaIq8DK5a8vAv51KQhWpbQx7Oyag2tRG5CvPh
 a6Em+BqaPsudi3swxnpurlZSJwuozChBVwu5cEkv7GaUWBnPL5ZlcKvNnV7hmw/Qafh/
 WhW5Os8dSyyNpyrU2CYXLeqsxiwS9pOx72rCmB+nxHZORSgY+PC8m2xcS4zN1754Z9dV
 6J0GgH2oXrXHfZBSTFmwAqyqVSOLjY9HnuzsUFTwp6S6cQ1o/mcWkqqskZ6mJyhBqRjC
 cbig==
X-Gm-Message-State: AOAM531JpLhpZXyLkQnr4ezIVIyS28/fszHjU4GmuOSLyBmAxhatO6dC
 TAqXTTizYhtm5Ncl4X7tuTXJm45wa0C3A4s/
X-Google-Smtp-Source: ABdhPJw9qbSNSIIBUuIceUz8umhlwz3ogKSDwzFZmypJFjmzgsIaBJ1ekzHGnTXuuHS8AySruvMVYQ==
X-Received: by 2002:a9d:24c7:: with SMTP id z65mr3856678ota.243.1615995308213; 
 Wed, 17 Mar 2021 08:35:08 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/38] tcg/tci: Push opcode emit into each case
Date: Wed, 17 Mar 2021 09:34:28 -0600
Message-Id: <20210317153444.310566-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to split out bytecode output into helpers, but
we can't do that one at a time if tcg_out_op_t is being done
outside of the switch.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 7fb3b04eaf..c5b061fe76 100644
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


