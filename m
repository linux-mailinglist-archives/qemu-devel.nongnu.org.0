Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD35A30E9B7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 02:54:33 +0100 (CET)
Received: from localhost ([::1]:51596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Tqq-0005en-PY
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 20:54:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiH-0004g6-Et
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:45 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:34559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiC-0003gN-Sw
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:41 -0500
Received: by mail-pl1-x62c.google.com with SMTP id u15so903537plf.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WvF+amzq1Ily9oj+9g5vZaVj1S2ujChoxYC/fno/cGA=;
 b=VefMLW0RzdlXgxXLhstmgppJN7lToGqgdjD63svg2OleeE7WJWwYht90Yqm36wPqbC
 FkI/GGW8DPAtGW/r3bfeN2XupMmB9aQr/p6zv9KtD9uPp/2fd20//IwsOnJZ3dgi7oMx
 HFkiYaumOLRpBvZAt9YaXnTYsH9dlSE9a3oO+GldDKtxlV3lAQyUEA0ktdFhH3V9KOmM
 4KxPYK/A5MAJ/DQNerYzkw0m36S6HJ5B06TZ0kYfb6/egRXywBaayUpfIav0vIkdufYX
 7l1r93N8AIvkf3fnMIVadNUzCLeE9XSjZVcpLsIjTsdx7OzWc8Iff+Ci/VP24bZXuUw0
 ubrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WvF+amzq1Ily9oj+9g5vZaVj1S2ujChoxYC/fno/cGA=;
 b=BdJpI/jqx6aJWKT0KCublf1mc8EBpCsFi8FebmDuKbR8ogTzLtVSoGbEvbOdynEksu
 x1yijUljtp40CqJh406PF9oMmJw5/PGV1gCOKH3fS4T0LBxczxuUjRCvztc6mJKf9i2t
 VlTUld6Tipt99GPhTAqbgax2RdnTYLUg761QUFDxAs16ko68bDmuDXw5kZ9JoE4+RR+e
 34SKbVbjFpMNb8HonM1jedrbCIIII6NQV7EM0y4tq+am62w0M1tAX/FqKzkepLuFpzqL
 PUQ/ef/6kmmNYnU+b5yc1N854O0DoZZ61my4Tg5n/XihXY5ghMgAzfKbIxXX7Ze7++hn
 Ysgw==
X-Gm-Message-State: AOAM533AWbp6ocIOJb7v1InrYQva3BdBfM6Tq/nKP550TtmwgRvQyIdd
 vR5hnVTvFyCR6beP92WowSJDtb8my/dzgv/B
X-Google-Smtp-Source: ABdhPJzav12R3/Nwq8D26Zyt92jfIyhDjVn0O16zjiySQiFt2A0VJmZ3cq2asZhpAcCuNfx9JtA9Zg==
X-Received: by 2002:a17:902:ce8b:b029:e2:9905:db5a with SMTP id
 f11-20020a170902ce8bb02900e29905db5amr2598380plg.77.1612403135156; 
 Wed, 03 Feb 2021 17:45:35 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/93] tcg/tci: Inline tci_write_reg32 into all callers
Date: Wed,  3 Feb 2021 15:43:47 -1000
Message-Id: <20210204014509.882821-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: sw@weilnetz.de, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For a 64-bit TCI, the upper bits of a 32-bit operation are
undefined (much like a native ppc64 32-bit operation).  It
simplifies everything if we don't force-extend the result.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 66 +++++++++++++++++++++++++------------------------------
 1 file changed, 30 insertions(+), 36 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 005d2946c4..39ad00663f 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -117,12 +117,6 @@ tci_write_reg(tcg_target_ulong *regs, TCGReg index, tcg_target_ulong value)
     regs[index] = value;
 }
 
-static void
-tci_write_reg32(tcg_target_ulong *regs, TCGReg index, uint32_t value)
-{
-    tci_write_reg(regs, index, value);
-}
-
 #if TCG_TARGET_REG_BITS == 32
 static void tci_write_reg64(tcg_target_ulong *regs, uint32_t high_index,
                             uint32_t low_index, uint64_t value)
@@ -549,7 +543,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t1 = tci_read_r32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
             condition = *tb_ptr++;
-            tci_write_reg32(regs, t0, tci_compare32(t1, t2, condition));
+            tci_write_reg(regs, t0, tci_compare32(t1, t2, condition));
             break;
 #if TCG_TARGET_REG_BITS == 32
         case INDEX_op_setcond2_i32:
@@ -557,7 +551,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tmp64 = tci_read_r64(regs, &tb_ptr);
             v64 = tci_read_ri64(regs, &tb_ptr);
             condition = *tb_ptr++;
-            tci_write_reg32(regs, t0, tci_compare64(tmp64, v64, condition));
+            tci_write_reg(regs, t0, tci_compare64(tmp64, v64, condition));
             break;
 #elif TCG_TARGET_REG_BITS == 64
         case INDEX_op_setcond_i64:
@@ -571,12 +565,12 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_mov_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
         case INDEX_op_tci_movi_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_i32(&tb_ptr);
-            tci_write_reg32(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 
             /* Load/store operations (32 bit). */
@@ -603,7 +597,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg32(regs, t0, *(uint32_t *)(t1 + t2));
+            tci_write_reg(regs, t0, *(uint32_t *)(t1 + t2));
             break;
         case INDEX_op_st8_i32:
             t0 = tci_read_r8(regs, &tb_ptr);
@@ -631,44 +625,44 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1 + t2);
+            tci_write_reg(regs, t0, t1 + t2);
             break;
         case INDEX_op_sub_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1 - t2);
+            tci_write_reg(regs, t0, t1 - t2);
             break;
         case INDEX_op_mul_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1 * t2);
+            tci_write_reg(regs, t0, t1 * t2);
             break;
 #if TCG_TARGET_HAS_div_i32
         case INDEX_op_div_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, (int32_t)t1 / (int32_t)t2);
+            tci_write_reg(regs, t0, (int32_t)t1 / (int32_t)t2);
             break;
         case INDEX_op_divu_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1 / t2);
+            tci_write_reg(regs, t0, t1 / t2);
             break;
         case INDEX_op_rem_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, (int32_t)t1 % (int32_t)t2);
+            tci_write_reg(regs, t0, (int32_t)t1 % (int32_t)t2);
             break;
         case INDEX_op_remu_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1 % t2);
+            tci_write_reg(regs, t0, t1 % t2);
             break;
 #elif TCG_TARGET_HAS_div2_i32
         case INDEX_op_div2_i32:
@@ -680,19 +674,19 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1 & t2);
+            tci_write_reg(regs, t0, t1 & t2);
             break;
         case INDEX_op_or_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1 | t2);
+            tci_write_reg(regs, t0, t1 | t2);
             break;
         case INDEX_op_xor_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1 ^ t2);
+            tci_write_reg(regs, t0, t1 ^ t2);
             break;
 
             /* Shift/rotate operations (32 bit). */
@@ -701,32 +695,32 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1 << (t2 & 31));
+            tci_write_reg(regs, t0, t1 << (t2 & 31));
             break;
         case INDEX_op_shr_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1 >> (t2 & 31));
+            tci_write_reg(regs, t0, t1 >> (t2 & 31));
             break;
         case INDEX_op_sar_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, ((int32_t)t1 >> (t2 & 31)));
+            tci_write_reg(regs, t0, ((int32_t)t1 >> (t2 & 31)));
             break;
 #if TCG_TARGET_HAS_rot_i32
         case INDEX_op_rotl_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, rol32(t1, t2 & 31));
+            tci_write_reg(regs, t0, rol32(t1, t2 & 31));
             break;
         case INDEX_op_rotr_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, ror32(t1, t2 & 31));
+            tci_write_reg(regs, t0, ror32(t1, t2 & 31));
             break;
 #endif
 #if TCG_TARGET_HAS_deposit_i32
@@ -737,7 +731,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tmp16 = *tb_ptr++;
             tmp8 = *tb_ptr++;
             tmp32 = (((1 << tmp8) - 1) << tmp16);
-            tci_write_reg32(regs, t0, (t1 & ~tmp32) | ((t2 << tmp16) & tmp32));
+            tci_write_reg(regs, t0, (t1 & ~tmp32) | ((t2 << tmp16) & tmp32));
             break;
 #endif
         case INDEX_op_brcond_i32:
@@ -789,56 +783,56 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_ext8s_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r8s(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16s_i32
         case INDEX_op_ext16s_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r16s(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext8u_i32
         case INDEX_op_ext8u_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r8(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16u_i32
         case INDEX_op_ext16u_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r16(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 #endif
 #if TCG_TARGET_HAS_bswap16_i32
         case INDEX_op_bswap16_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r16(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, bswap16(t1));
+            tci_write_reg(regs, t0, bswap16(t1));
             break;
 #endif
 #if TCG_TARGET_HAS_bswap32_i32
         case INDEX_op_bswap32_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, bswap32(t1));
+            tci_write_reg(regs, t0, bswap32(t1));
             break;
 #endif
 #if TCG_TARGET_HAS_not_i32
         case INDEX_op_not_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, ~t1);
+            tci_write_reg(regs, t0, ~t1);
             break;
 #endif
 #if TCG_TARGET_HAS_neg_i32
         case INDEX_op_neg_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, -t1);
+            tci_write_reg(regs, t0, -t1);
             break;
 #endif
 #if TCG_TARGET_REG_BITS == 64
@@ -880,7 +874,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg32(regs, t0, *(uint32_t *)(t1 + t2));
+            tci_write_reg(regs, t0, *(uint32_t *)(t1 + t2));
             break;
         case INDEX_op_ld32s_i64:
             t0 = *tb_ptr++;
-- 
2.25.1


