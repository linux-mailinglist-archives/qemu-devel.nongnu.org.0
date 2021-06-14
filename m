Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2E63A5E80
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:42:56 +0200 (CEST)
Received: from localhost ([::1]:49814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiBL-0001N9-3X
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6t-0002FN-GC
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:19 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:45739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6l-0003ZV-6t
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:19 -0400
Received: by mail-pl1-x62e.google.com with SMTP id 11so6147011plk.12
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2lV8vgJYRzkBj6vA6hwqKERA8bZrmR1z2r1Kt2NYFM8=;
 b=YUv8rmXQuk0IU0YxJOXKjhF4gjJsptl0msePKlTxWAgfPk/7sUUNWV1SxUDqDdpG8f
 ZSjRIq0Xze5uPCUUybMH4b64JatfHMLpQsNP4FXoTav7UllOaRTMW6eiHgq1Jg/xDkzP
 nx1giEFn1tfcTUiNRc5y6uyxiJYAIWqv/ei5/A6F7MQIK4W41yb53e5jexJsr/16vsrz
 fsscrRFH6P5qnUYbVonv8AgcBV/Kj32rVxk58v3fl3LlArQyJPw+8e2Wa4Pl3isqQR0h
 CTP/c7apC9wEdkgt4JZK3rqIvfAf2wtixy1WSwwCzNOXKslCEOyrQoyLM/WDL5a26+rS
 xfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2lV8vgJYRzkBj6vA6hwqKERA8bZrmR1z2r1Kt2NYFM8=;
 b=RD77VucPXsolyEDQbPEuodCDH6IX6524Zhnq5gfzSDvJWahiPP6K1qodGkUmM1r9sg
 4/bKnz2TKiAD/T0zHz0qmuveNp+/xBxqTPzTUTJipujc3/KABYKMvzZNOvzFNHtNTWhB
 7k9IAPQStxosMd0X6hpu74PGOqq+/uOQUQd7ynuKNoljmZwmPfsLx9aQAk9z3/Ztgmx/
 XvCfIn+sD+4GWKU/4ggwHnavR0bPGyZ9wjsUYIy0y5qn46DPWcz3XfQhyi26S1MNXevy
 4Z6awmezH0Ayj9uL8or/hy/PcRFuuVDDp9vE4rBvhO08bpVUeoRmnJTA2kXTVJYX1xGY
 xkNA==
X-Gm-Message-State: AOAM533SL+yF8MpXv5ihDtBNFxcHGzNJNM4QCROgMpmtsCwDzNVDGEXb
 1QVLUzMSAYC0Bzw0WCtcp33P6quyguCPJw==
X-Google-Smtp-Source: ABdhPJxdpmzOYkNeXE1JJ0jSSmSGjHgv5JnWQYMitglxCgq1H6oC2NWID+90sJfkCipvLs38Nz4kAQ==
X-Received: by 2002:a17:90a:ea8c:: with SMTP id
 h12mr21632542pjz.149.1623659889335; 
 Mon, 14 Jun 2021 01:38:09 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/28] tcg/mips: Support bswap flags in tcg_out_bswap16
Date: Mon, 14 Jun 2021 01:37:45 -0700
Message-Id: <20210614083800.1166166-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Merge tcg_out_bswap16 and tcg_out_bswap16s.  Use the flags
in the internal uses for loads and stores.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 60 ++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 32 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 5944448b2a..7a5634419c 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -540,39 +540,36 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     }
 }
 
-static inline void tcg_out_bswap16(TCGContext *s, TCGReg ret, TCGReg arg)
+static void tcg_out_bswap16(TCGContext *s, TCGReg ret, TCGReg arg, int flags)
 {
+    /* ret and arg can't be register tmp0 */
+    tcg_debug_assert(ret != TCG_TMP0);
+    tcg_debug_assert(arg != TCG_TMP0);
+
     if (use_mips32r2_instructions) {
         tcg_out_opc_reg(s, OPC_WSBH, ret, 0, arg);
-    } else {
-        /* ret and arg can't be register at */
-        if (ret == TCG_TMP0 || arg == TCG_TMP0) {
-            tcg_abort();
+        if (flags & TCG_BSWAP_OS) {
+            tcg_out_opc_reg(s, OPC_SEH, ret, 0, ret);
+        } else if ((flags & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            tcg_out_opc_imm(s, OPC_ANDI, ret, ret, 0xffff);
         }
-
-        tcg_out_opc_sa(s, OPC_SRL, TCG_TMP0, arg, 8);
-        tcg_out_opc_sa(s, OPC_SLL, ret, arg, 8);
-        tcg_out_opc_imm(s, OPC_ANDI, ret, ret, 0xff00);
-        tcg_out_opc_reg(s, OPC_OR, ret, ret, TCG_TMP0);
+        return;
     }
-}
 
-static inline void tcg_out_bswap16s(TCGContext *s, TCGReg ret, TCGReg arg)
-{
-    if (use_mips32r2_instructions) {
-        tcg_out_opc_reg(s, OPC_WSBH, ret, 0, arg);
-        tcg_out_opc_reg(s, OPC_SEH, ret, 0, ret);
-    } else {
-        /* ret and arg can't be register at */
-        if (ret == TCG_TMP0 || arg == TCG_TMP0) {
-            tcg_abort();
-        }
-
-        tcg_out_opc_sa(s, OPC_SRL, TCG_TMP0, arg, 8);
+    tcg_out_opc_sa(s, OPC_SRL, TCG_TMP0, arg, 8);
+    if (!(flags & TCG_BSWAP_IZ)) {
+        tcg_out_opc_imm(s, OPC_ANDI, TCG_TMP0, TCG_TMP0, 0x00ff);
+    }
+    if (flags & TCG_BSWAP_OS) {
         tcg_out_opc_sa(s, OPC_SLL, ret, arg, 24);
         tcg_out_opc_sa(s, OPC_SRA, ret, ret, 16);
-        tcg_out_opc_reg(s, OPC_OR, ret, ret, TCG_TMP0);
+    } else {
+        tcg_out_opc_sa(s, OPC_SLL, ret, arg, 8);
+        if (flags & TCG_BSWAP_OZ) {
+            tcg_out_opc_imm(s, OPC_ANDI, ret, ret, 0xff00);
+        }
     }
+    tcg_out_opc_reg(s, OPC_OR, ret, ret, TCG_TMP0);
 }
 
 static void tcg_out_bswap_subr(TCGContext *s, const tcg_insn_unit *sub)
@@ -1367,14 +1364,14 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         break;
     case MO_UW | MO_BSWAP:
         tcg_out_opc_imm(s, OPC_LHU, TCG_TMP1, base, 0);
-        tcg_out_bswap16(s, lo, TCG_TMP1);
+        tcg_out_bswap16(s, lo, TCG_TMP1, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
         break;
     case MO_UW:
         tcg_out_opc_imm(s, OPC_LHU, lo, base, 0);
         break;
     case MO_SW | MO_BSWAP:
         tcg_out_opc_imm(s, OPC_LHU, TCG_TMP1, base, 0);
-        tcg_out_bswap16s(s, lo, TCG_TMP1);
+        tcg_out_bswap16(s, lo, TCG_TMP1, TCG_BSWAP_IZ | TCG_BSWAP_OS);
         break;
     case MO_SW:
         tcg_out_opc_imm(s, OPC_LH, lo, base, 0);
@@ -1514,8 +1511,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         break;
 
     case MO_16 | MO_BSWAP:
-        tcg_out_opc_imm(s, OPC_ANDI, TCG_TMP1, lo, 0xffff);
-        tcg_out_bswap16(s, TCG_TMP1, TCG_TMP1);
+        tcg_out_bswap16(s, TCG_TMP1, lo, 0);
         lo = TCG_TMP1;
         /* FALLTHRU */
     case MO_16:
@@ -1933,10 +1929,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_not_i64:
         i1 = OPC_NOR;
         goto do_unary;
-    case INDEX_op_bswap16_i32:
-    case INDEX_op_bswap16_i64:
-        i1 = OPC_WSBH;
-        goto do_unary;
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
         i1 = OPC_SEB;
@@ -1948,6 +1940,10 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_opc_reg(s, i1, a0, TCG_REG_ZERO, a1);
         break;
 
+    case INDEX_op_bswap16_i32:
+    case INDEX_op_bswap16_i64:
+        tcg_out_bswap16(s, a0, a1, a2);
+        break;
     case INDEX_op_bswap32_i32:
         tcg_out_bswap32(s, a0, a1);
         break;
-- 
2.25.1


