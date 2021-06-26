Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 154C93B4D2C
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:43:45 +0200 (CEST)
Received: from localhost ([::1]:41442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx22a-00038C-3s
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vq-0002A1-Ok
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:46 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:46684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vm-0000Lp-Bs
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:46 -0400
Received: by mail-pg1-x52a.google.com with SMTP id w15so5574526pgk.13
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VBYbGg81Birrf/k2AeUwnxNTFGHz8b41b75J9mAcXO8=;
 b=npRQyr4/ueE2cERwF2LYyK3n2N5pzgJnmHqAS69tJmzJkHg/iaEw1aPUppt/uooI5d
 JUJJjP+duZVItoMyOQi9XWsoJGwFZk/aiAeyo2Bw8V0xQF/y3jWOywpROgCH81loXGIx
 Rb68YndmuiFsPYSXEVs4PTEG6BQQznhwfo1IADB+9z2bIsHQRhJ1A09ikTspMeOulex3
 LnVRtz280UJxfDOFCrAGsVDllOm3UqamZOFJQ+HzjIJB27HSpJsYYU9MDEDkS2F6rCCH
 xnTJxSt60TK1+oagIbrZ9tHJOGygTn7F/0kMkBxXaFcPa2dePFCQR/j2K6NUUROhGYwT
 X/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VBYbGg81Birrf/k2AeUwnxNTFGHz8b41b75J9mAcXO8=;
 b=rHjDdO0c2gNzGeH0iNP5zubJV5SgzQkDbbxICpuHZG441f3iTBg2CGDr58HiQTrhep
 tOxdu5leAy6wj5N7bpT9Ta4VjXShEiX/ixcWbwgQZu28+bwVP3G5WtElpzvf6SeNcmPI
 GfmaNxPSb7NslnOBOgMOthJpjwSF03VewJPHhpEhqMzP/S829hmNemHk/8SSwy8E2NBM
 Kk95a1bBUrD0jDK4Gxjj+KOCEUWa8Ia+Kj76Pj9qIDHxcgSWfDnq2UHLsXIjNXnbH0Cm
 DfFLvCoLUAnvjkCKPx2Zh2L8/xBVtOKPfRqvfSdUh3ytk6/K+qK3xwiIn0ktDezRgsIm
 4Esw==
X-Gm-Message-State: AOAM532cuzzn7bway1KueCUCgNEdVunaaoWZGoP5j2Gh7Mz+ulHcEmV/
 m/kmi1S06OZYel7YxLs4ainsQtatQOHZPA==
X-Google-Smtp-Source: ABdhPJzx1b2KmVADu784PFerHi5HdFzVxM9Tg1KKvOrL5cEuPpfE586yfHQPACWieKAH2FEY3mt7nQ==
X-Received: by 2002:a62:2646:0:b029:2fe:f613:5e39 with SMTP id
 m67-20020a6226460000b02902fef6135e39mr13973040pfm.78.1624689400990; 
 Fri, 25 Jun 2021 23:36:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/29] tcg/mips: Support bswap flags in tcg_out_bswap16
Date: Fri, 25 Jun 2021 23:36:16 -0700
Message-Id: <20210626063631.2411938-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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


