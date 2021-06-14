Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA0F3A5EB5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:58:46 +0200 (CEST)
Received: from localhost ([::1]:37496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiQf-0005bd-Op
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6v-0002LV-CV
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:21 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:33737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6l-0003Zg-Ky
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:21 -0400
Received: by mail-pf1-x430.google.com with SMTP id p13so10045940pfw.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LgKd1kr+0l/T/EU54OtdSbM7ljWVi4b0faE3cCGA0EQ=;
 b=q28oC+Q8oDgeJAJ5kz2qU/XA1uzu+NmyHnaLv6/x/1TW99+KiTUjvMK/Z2hkz5bK+s
 hIYqAhO7DOuN92+JGrZgfHUh1PONkJxknvqVINefP/nPffAE26clM8Wx8cgr4Gllmab+
 Ijc3IDACBhVivmjiJV6axUmJpW9KOeLcu1M71htrRHLFg1CDmSy02sbzY0mDHD+kBxR2
 hnxUpTkzqJj/6jFlnW5FckuHVG3QVMVKnYCQ2ZyNMv9yNQQ9nwGLBSmbuRmy6UCmJ5GS
 7tmv6Ac2e+sNpvJojYkBNrPrOBxMul8rZZ+MFamFmU200It+8q2/QGQoa7Ul621RsceK
 CQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LgKd1kr+0l/T/EU54OtdSbM7ljWVi4b0faE3cCGA0EQ=;
 b=ERjQmXFRft6ktt52VaSXpNUBL2aCaib9TD/IY+GGc0ZSmaOIrnkqNOvDgeT9FzUq7f
 nBWoCS4E52Oz9l01L01nzGtJD/TIq48oDdMEg9vXvv0srVuY/GNN74x/i1LNGV84wDXf
 sLVXpnU9e/WkN1eu2zmDzsn1Xede6gpzLH9TzwujegyCMJqb7U7dD7/XL0WAcdqvE+8b
 jxS4tYmeLYCGafaqUPreAtWFsQeS0zcyV1DthScxjqvo9HHJCaiGON5JG2B9M6cNiifu
 F8/MKCYqfp6mxNqlR9rHIEisZcaTdxCNSJuV9CJWrqJ5HJCKIx3AGFPEvNVkRuVytA/H
 oAFg==
X-Gm-Message-State: AOAM532tNICCkxsHZi4jpkiCTU75ltidO1zYquuSYpO+Iv/fIwqWiNI5
 CY3ezuyuvFvrxl/U36+lYu/aRSeFv7wvJA==
X-Google-Smtp-Source: ABdhPJwSlBqIFUGou0sc5/2ZkS7XuLMqddtjIwUolxm1FOG1oAnhJSjIs+FopQex1tWTVyAERVE/Mw==
X-Received: by 2002:a05:6a00:a17:b029:2f9:a2bb:e126 with SMTP id
 p23-20020a056a000a17b02902f9a2bbe126mr4750977pfh.30.1623659889904; 
 Mon, 14 Jun 2021 01:38:09 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/28] tcg/mips: Support bswap flags in tcg_out_bswap32
Date: Mon, 14 Jun 2021 01:37:46 -0700
Message-Id: <20210614083800.1166166-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Merge tcg_out_bswap32 and tcg_out_bswap32s.  Use the flags
in the internal uses for loads and stores.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 39 ++++++++++++++++-----------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 7a5634419c..e3698274eb 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -578,27 +578,20 @@ static void tcg_out_bswap_subr(TCGContext *s, const tcg_insn_unit *sub)
     tcg_debug_assert(ok);
 }
 
-static void tcg_out_bswap32(TCGContext *s, TCGReg ret, TCGReg arg)
+static void tcg_out_bswap32(TCGContext *s, TCGReg ret, TCGReg arg, int flags)
 {
     if (use_mips32r2_instructions) {
         tcg_out_opc_reg(s, OPC_WSBH, ret, 0, arg);
         tcg_out_opc_sa(s, OPC_ROTR, ret, ret, 16);
+        if (flags & TCG_BSWAP_OZ) {
+            tcg_out_opc_bf(s, OPC_DEXT, ret, ret, 31, 0);
+        }
     } else {
-        tcg_out_bswap_subr(s, bswap32_addr);
-        /* delay slot -- never omit the insn, like tcg_out_mov might.  */
-        tcg_out_opc_reg(s, OPC_OR, TCG_TMP0, arg, TCG_REG_ZERO);
-        tcg_out_mov(s, TCG_TYPE_I32, ret, TCG_TMP3);
-    }
-}
-
-static void tcg_out_bswap32u(TCGContext *s, TCGReg ret, TCGReg arg)
-{
-    if (use_mips32r2_instructions) {
-        tcg_out_opc_reg(s, OPC_DSBH, ret, 0, arg);
-        tcg_out_opc_reg(s, OPC_DSHD, ret, 0, ret);
-        tcg_out_dsrl(s, ret, ret, 32);
-    } else {
-        tcg_out_bswap_subr(s, bswap32u_addr);
+        if (flags & TCG_BSWAP_OZ) {
+            tcg_out_bswap_subr(s, bswap32u_addr);
+        } else {
+            tcg_out_bswap_subr(s, bswap32_addr);
+        }
         /* delay slot -- never omit the insn, like tcg_out_mov might.  */
         tcg_out_opc_reg(s, OPC_OR, TCG_TMP0, arg, TCG_REG_ZERO);
         tcg_out_mov(s, TCG_TYPE_I32, ret, TCG_TMP3);
@@ -1380,7 +1373,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         if (TCG_TARGET_REG_BITS == 64 && is_64) {
             if (use_mips32r2_instructions) {
                 tcg_out_opc_imm(s, OPC_LWU, lo, base, 0);
-                tcg_out_bswap32u(s, lo, lo);
+                tcg_out_bswap32(s, lo, lo, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
             } else {
                 tcg_out_bswap_subr(s, bswap32u_addr);
                 /* delay slot */
@@ -1393,7 +1386,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
     case MO_SL | MO_BSWAP:
         if (use_mips32r2_instructions) {
             tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
-            tcg_out_bswap32(s, lo, lo);
+            tcg_out_bswap32(s, lo, lo, 0);
         } else {
             tcg_out_bswap_subr(s, bswap32_addr);
             /* delay slot */
@@ -1519,7 +1512,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         break;
 
     case MO_32 | MO_BSWAP:
-        tcg_out_bswap32(s, TCG_TMP3, lo);
+        tcg_out_bswap32(s, TCG_TMP3, lo, 0);
         lo = TCG_TMP3;
         /* FALLTHRU */
     case MO_32:
@@ -1538,9 +1531,9 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
             tcg_out_opc_imm(s, OPC_SW, TCG_TMP0, base, 0);
             tcg_out_opc_imm(s, OPC_SW, TCG_TMP1, base, 4);
         } else {
-            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? lo : hi);
+            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? lo : hi, 0);
             tcg_out_opc_imm(s, OPC_SW, TCG_TMP3, base, 0);
-            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? hi : lo);
+            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? hi : lo, 0);
             tcg_out_opc_imm(s, OPC_SW, TCG_TMP3, base, 4);
         }
         break;
@@ -1945,10 +1938,10 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_bswap16(s, a0, a1, a2);
         break;
     case INDEX_op_bswap32_i32:
-        tcg_out_bswap32(s, a0, a1);
+        tcg_out_bswap32(s, a0, a1, 0);
         break;
     case INDEX_op_bswap32_i64:
-        tcg_out_bswap32u(s, a0, a1);
+        tcg_out_bswap32(s, a0, a1, a2);
         break;
     case INDEX_op_bswap64_i64:
         tcg_out_bswap64(s, a0, a1);
-- 
2.25.1


