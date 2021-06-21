Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C533AF96D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:32:50 +0200 (CEST)
Received: from localhost ([::1]:45102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTPN-0006Oc-Up
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC4-0000nO-1x
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:04 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:45823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC1-0005y2-Pp
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:03 -0400
Received: by mail-pf1-x42e.google.com with SMTP id k6so14835634pfk.12
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2lV8vgJYRzkBj6vA6hwqKERA8bZrmR1z2r1Kt2NYFM8=;
 b=pNEXcNKm6aptkswF3Q73rG9cI3JpXZwfoVSO8pQXypxuhKSlGyEJUoiLWQYz9+cEXx
 lSrN1R0LuzUxoDkqAnhSDBhXR6sar0/G3YQ75tZV1WY0gGxJ1h+e2zGLqNJwXZcgPwo+
 Duw4hkTkmI/CQkR83xBmKte6cR8y8YtNnstArvi4oQVw3qg3SzvC8nnNIb4Uqf6sR+K/
 5Q6TxWLLBQywfnwJcOjiwPQdsw9pUWoNlvHuYmd1s7YM9YZYnjXZAX0StELj/ynzLIAb
 i7/boKvEXPPCEx0kJA0MEdQjLgF+tQc4cnsZfUFj7oEjizyZlipAoES8i0zzLggKYAuL
 6PFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2lV8vgJYRzkBj6vA6hwqKERA8bZrmR1z2r1Kt2NYFM8=;
 b=R3UqHE9Voj5INpA8vuLkT27R7wla6GQCShaAW3uw0V3+xwAvuQlzPRu5sJM1/xXQ7E
 DjFuDWly9bO7+EXDgX/h8toKl7OEOsn3Ff2JqBEDJ0gVHWgwt78aknuXQt85pLzXy1tZ
 ZcdgYJvd0zzA+3RoBLldbho0yltk1yexAkiv8FBg8HqfGiYqpt8IjhMMIDRMAwd1/HjH
 17auZU7NatH4rDFfETUQJZekG+J0/rBV6ffCSXl7Wr1sVGwtuTh292Zo6NpqE7CtS2DG
 TNp/i6TxYw0jsnamQkOThrJ2wQYMVmj+EoO3VD2Plv9FPDosXq5nkGrSOKIruRwYbsvY
 supQ==
X-Gm-Message-State: AOAM530fCzgUedJ43GIwlHVFnVKcaL9CIcANrM6jXZZOCBf3Zxvs65M5
 dSKwwjMYPCQBNS3E7n6vaCYED0gFV81qDQ==
X-Google-Smtp-Source: ABdhPJw+Iafu50kVT5JoUaVvj0MDhlIzPtL+YSZk/P81+nYs70L+na4JLe2p6fa1kF5fZOpXKuKddQ==
X-Received: by 2002:a63:f20:: with SMTP id e32mr156047pgl.235.1624317540290;
 Mon, 21 Jun 2021 16:19:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.18.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:19:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/29] tcg/mips: Support bswap flags in tcg_out_bswap16
Date: Mon, 21 Jun 2021 16:18:34 -0700
Message-Id: <20210621231849.1871164-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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


