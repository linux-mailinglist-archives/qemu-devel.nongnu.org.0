Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528E23B78F3
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:57:55 +0200 (CEST)
Received: from localhost ([::1]:54386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJrm-0003Ha-B6
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwS-00043H-NA
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:41 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwJ-0002zo-0k
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:40 -0400
Received: by mail-pl1-x631.google.com with SMTP id f11so74081plg.0
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VBYbGg81Birrf/k2AeUwnxNTFGHz8b41b75J9mAcXO8=;
 b=ZphXCKvdoHS9BKxLsIMTfaJVU4yAfnMrDFaqXvUkzvK3EmiLfXMT+0cDgD9KbPlwSz
 A0HGyA84cKWHrt4hVVm87nNJfzMRWynSNhxxPVsc544CNWbQVoB1Mqozx7qLOeV7Vkwl
 FjuV8SWW9BisT5FO9+vvA/ZyIl+k1EliR8kc83Y1YakLNi/BO3TA2z8DTshIjx4eINDo
 sLas0Km9gYAw9sUE91R+LRdIahdpj0FmRZRxoxIjWvd+mmhZv2R/FAOf9QY2jn+BcDYu
 IqORXJlmTBtPiz8aiM2YHC/DjfVnKQO2oI4AfDyAzfCJkDm3Dc6r7udiz1v3kkx5xTWI
 TvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VBYbGg81Birrf/k2AeUwnxNTFGHz8b41b75J9mAcXO8=;
 b=XpaYDMx9Vd/jyHEgtjN7o0GH8ZEhVksEcA4mOFhONJEjaKPQ3K7DnhJM6iEsbjxm2F
 5acl8gUlfh091CwEyCHPgO5duzN0hDH+oyenxyy2VIq02YmUnN/6cybvstSYnH3DZdeG
 NZo0lWaFiuwM1NzNNGGc8rTAcNwQUrLCxLzDnFTDwTodzs2B4ENeugtDWWfZipETXxio
 qgQwjAB9do1yTJPuzmOMLelja+EZG9tL8ZBh9jWKyE3yaPPkDgRiTIAar77TC1AkXnYC
 OCypJ/He2q0jdAKHuQTN7BqSrCxFjOisbHOLaZxW8Eu0yFHb8z5IEObpOgbDm+0CSvkE
 7nWw==
X-Gm-Message-State: AOAM531PqO+B2ElmD0/GAowp+S7UW86aShRvMKgOkZ2jehqFU+z6K5xQ
 CM6U5lwQDOvYshnvhJN7JUp6+e9IzhLm6g==
X-Google-Smtp-Source: ABdhPJyAnoGSOI1a+wUblbjPsNvJQL26CsH1C7ush+K8hnFk1lzleg6BN2zzChmwS9OZTJUZ0DJzpQ==
X-Received: by 2002:a17:90b:38c3:: with SMTP id
 nn3mr335193pjb.92.1624993107332; 
 Tue, 29 Jun 2021 11:58:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm18002849pfh.103.2021.06.29.11.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:58:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 48/63] tcg/mips: Support bswap flags in tcg_out_bswap16
Date: Tue, 29 Jun 2021 11:54:40 -0700
Message-Id: <20210629185455.3131172-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Merge tcg_out_bswap16 and tcg_out_bswap16s.  Use the flags
in the internal uses for loads and stores.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 63 +++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 5944448b2a..a9f9f527f6 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -540,39 +540,37 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     }
 }
 
-static inline void tcg_out_bswap16(TCGContext *s, TCGReg ret, TCGReg arg)
+static void tcg_out_bswap16(TCGContext *s, TCGReg ret, TCGReg arg, int flags)
 {
+    /* ret and arg can't be register tmp0 */
+    tcg_debug_assert(ret != TCG_TMP0);
+    tcg_debug_assert(arg != TCG_TMP0);
+
+    /* With arg = abcd: */
     if (use_mips32r2_instructions) {
-        tcg_out_opc_reg(s, OPC_WSBH, ret, 0, arg);
-    } else {
-        /* ret and arg can't be register at */
-        if (ret == TCG_TMP0 || arg == TCG_TMP0) {
-            tcg_abort();
+        tcg_out_opc_reg(s, OPC_WSBH, ret, 0, arg);                 /* badc */
+        if (flags & TCG_BSWAP_OS) {
+            tcg_out_opc_reg(s, OPC_SEH, ret, 0, ret);              /* ssdc */
+        } else if ((flags & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            tcg_out_opc_imm(s, OPC_ANDI, ret, ret, 0xffff);        /* 00dc */
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
+    tcg_out_opc_sa(s, OPC_SRL, TCG_TMP0, arg, 8);                  /* 0abc */
+    if (!(flags & TCG_BSWAP_IZ)) {
+        tcg_out_opc_imm(s, OPC_ANDI, TCG_TMP0, TCG_TMP0, 0x00ff);  /* 000c */
+    }
+    if (flags & TCG_BSWAP_OS) {
+        tcg_out_opc_sa(s, OPC_SLL, ret, arg, 24);                  /* d000 */
+        tcg_out_opc_sa(s, OPC_SRA, ret, ret, 16);                  /* ssd0 */
     } else {
-        /* ret and arg can't be register at */
-        if (ret == TCG_TMP0 || arg == TCG_TMP0) {
-            tcg_abort();
+        tcg_out_opc_sa(s, OPC_SLL, ret, arg, 8);                   /* bcd0 */
+        if (flags & TCG_BSWAP_OZ) {
+            tcg_out_opc_imm(s, OPC_ANDI, ret, ret, 0xff00);        /* 00d0 */
         }
-
-        tcg_out_opc_sa(s, OPC_SRL, TCG_TMP0, arg, 8);
-        tcg_out_opc_sa(s, OPC_SLL, ret, arg, 24);
-        tcg_out_opc_sa(s, OPC_SRA, ret, ret, 16);
-        tcg_out_opc_reg(s, OPC_OR, ret, ret, TCG_TMP0);
     }
+    tcg_out_opc_reg(s, OPC_OR, ret, ret, TCG_TMP0);                /* ssdc */
 }
 
 static void tcg_out_bswap_subr(TCGContext *s, const tcg_insn_unit *sub)
@@ -1367,14 +1365,14 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
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
@@ -1514,8 +1512,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         break;
 
     case MO_16 | MO_BSWAP:
-        tcg_out_opc_imm(s, OPC_ANDI, TCG_TMP1, lo, 0xffff);
-        tcg_out_bswap16(s, TCG_TMP1, TCG_TMP1);
+        tcg_out_bswap16(s, TCG_TMP1, lo, 0);
         lo = TCG_TMP1;
         /* FALLTHRU */
     case MO_16:
@@ -1933,10 +1930,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
@@ -1948,6 +1941,10 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
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


