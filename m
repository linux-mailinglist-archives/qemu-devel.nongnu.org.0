Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5AA3AF972
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:34:36 +0200 (CEST)
Received: from localhost ([::1]:51562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTR5-0002Ft-MS
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC5-0000rO-5b
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:05 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:35354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC2-0005yk-7C
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:04 -0400
Received: by mail-pg1-x532.google.com with SMTP id v7so15406549pgl.2
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R7vlWNJb0EvHWAgR6RBcIjajLTS1WBwQ0nnET9RwevY=;
 b=Oeg/eoeMbmnfpX5YDtCnsDREhGNKjgDwI7FWvYfBTlet3K2k44s+d/ThPEubRN0GJx
 YBKB7LE6Z4IrODXKjNtVHXpjfYkd+oYkuxciU1dN+80cGPO4ubAWqxI/E//xvCoDemw9
 QYq9J5M5APDXQBM0ZSOlcub7qjImaS6RUxFdwQfkK2ecz93xDv3637AHbM6y5xlhksC9
 zpg6JnLb8DQwrXlE1D7gUVhs64WrSx/lpUtQQogMcxiaOKOkK6ZDfb7QcK9u8Dojp9de
 mDAzW/5RrgSr8p0j2HyInQBaN0dB7AaYzdEbmT4AGO5FlGNXoL1oA/9MAzQ9cfGhBe8f
 6XMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R7vlWNJb0EvHWAgR6RBcIjajLTS1WBwQ0nnET9RwevY=;
 b=DD+CdegtHKw8X0t9jIXQQDBfLbjfjpSWhNYcSAXszxxi/HY8Hx0C7YW7bREHUBnHkU
 nQH36yJ5EsY+DRcqOeCZCcAad9Z38Lax1tVYzf6lsY0vv/QTtmcHwq91N5LlBS7q3qxB
 sK2w2hCUuRN4343Ruyt5fA+gILm0w2/PiAkoS3keH/htxMLBbKVz3ykrFCf7omWa1St2
 a9Ym34dJqoPl+1IDWQyDBvFxtegHtgY/mc5oV3tQIAbi9aMBE93ATQARKK8PVQsLe7xk
 mqf1AhJQMRVxkjzJVeUI+wpFae9nvaHfYHuGL8UZccYzN9s6YjbsJilLxAaF/8W6Y80i
 XpKg==
X-Gm-Message-State: AOAM531qMu2DIq3trNwZLC3DKSvLf6NM9xLEtT0+KMjQjXdYkZqJ48HM
 kvGjwpmFb64qURDs5VwEDOhRvbuuCPwm3g==
X-Google-Smtp-Source: ABdhPJxpmkxv11vM5diiC94OIjXkMuyfVGyOHoh54v4qFc2wxMSQ950OQNxLVkekR/81/UQITCzllA==
X-Received: by 2002:a05:6a00:1acd:b029:2fb:81a4:b06 with SMTP id
 f13-20020a056a001acdb02902fb81a40b06mr596029pfv.36.1624317540742; 
 Mon, 21 Jun 2021 16:19:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:19:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/29] tcg/mips: Support bswap flags in tcg_out_bswap32
Date: Mon, 21 Jun 2021 16:18:35 -0700
Message-Id: <20210621231849.1871164-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Merge tcg_out_bswap32 and tcg_out_bswap32s.
Use the flags in the internal uses for loads and stores.

For mips32r2 bswap32 with zero-extension, standardize on
WSBH+ROTR+DEXT.  This is the same number of insns as the
previous DSBH+DSHD+DSRL but fits in better with the flags check.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


