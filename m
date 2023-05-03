Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9636F51CE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:36:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6qp-0003ZU-PE; Wed, 03 May 2023 03:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q7-0001rI-LG
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:51 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q3-0001gi-NS
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:51 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2fde2879eabso4443745f8f.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098626; x=1685690626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WJUr3MpSUvDxAIUv8x4KwNivrhfc+1BZ8xFfdPjBnMg=;
 b=MAFcxVg6ALEUm08AYET6qb2MN/gXeQYzolwJejTURW83cES1UNSxleE3Htoaikpufc
 CAb24GLa7jeok5m3jEeLRrkdicAoSl8SLB/KRtrkuPKv3ZwzE3Qh4Y8+aA4U4MgYEpx0
 JE8Jj+orGjf31BuXCJ4g1C6vpTxaDUJW75cuyfut+0zzkPDc9Axenu+H3Xhum3WvgAOv
 H4WlV+2vRBur1s4o15c1g0foHiwdLsdAOLVOKZVbO1GAXWJ/FRN1oV6j/Ak0GOQz5R1i
 lD5tDa5aVQWsSbaAOTSDn8C/QWCFpIzRzbun3spiNDUGWgTNIxr1K4dj4+J5y5y/R28p
 K5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098626; x=1685690626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WJUr3MpSUvDxAIUv8x4KwNivrhfc+1BZ8xFfdPjBnMg=;
 b=FiH5fzrDTYh7cyy4vB5GCYkz2a5z9A1Z1tyGIwKpkWKN1t3+EdJ99zPHImdrEWYZIu
 X2ilx0sR7mf4PMIo792k9z3wSKmS8X93pN/R363uCdYmfrFw0SV2JzrmwWjwLGLX3jzf
 jB05jNg6c/IAKmgaMIdhiLYaq8SEttuMN42K4YLBRoVZQg1MOiJRbUb3fmLT5i6Vp363
 Hvv7o7NbIJAbM432G3QiJIBiKyKQx2ouLh2PZfT2DJrTz526VU/wqEhtkGojMRfQ2VS2
 pxU32pQMGVUhk3Hin+3q7IdwpAxMNnNEYQbnm+8vQLmx3GXv28nyL0qpSK92Dl+CPBzK
 bG7g==
X-Gm-Message-State: AC+VfDx1JOa4gSQan5iQMLO5JdQuhvkjDaUwPBcllw7MU2+FJClVz0Ts
 xQWVh7/9lFSyZuNXACLESe+8aWpdF/8TBAyA46YpVQ==
X-Google-Smtp-Source: ACHHUZ7uggrH6D1PpfC1b6wxn1kMaueL3hkoooAIaDYkU6QC7IQBxLb9s3eJZJhzR9li1qDCGTLzoQ==
X-Received: by 2002:a5d:6a45:0:b0:2fe:fd61:6426 with SMTP id
 t5-20020a5d6a45000000b002fefd616426mr13460813wrw.11.1683098626185; 
 Wed, 03 May 2023 00:23:46 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 15/84] tcg/tci: Elimnate TARGET_LONG_BITS, target_ulong
Date: Wed,  3 May 2023 08:22:22 +0100
Message-Id: <20230503072331.1747057-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We now have the address size as part of the opcode, so
we no longer need to test TARGET_LONG_BITS.  We can use
uint64_t for target_ulong, as passed into load/store helpers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c                | 61 +++++++++++++++++++++++++---------------
 tcg/tci/tcg-target.c.inc | 15 +++++-----
 2 files changed, 46 insertions(+), 30 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 742c791726..bab4397bc5 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -286,7 +286,7 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
     return result;
 }
 
-static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
+static uint64_t tci_qemu_ld(CPUArchState *env, uint64_t taddr,
                             MemOpIdx oi, const void *tb_ptr)
 {
     MemOp mop = get_memop(oi);
@@ -312,7 +312,7 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
     }
 }
 
-static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
+static void tci_qemu_st(CPUArchState *env, uint64_t taddr, uint64_t val,
                         MemOpIdx oi, const void *tb_ptr)
 {
     MemOp mop = get_memop(oi);
@@ -372,10 +372,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         TCGReg r0, r1, r2, r3, r4, r5;
         tcg_target_ulong t1;
         TCGCond condition;
-        target_ulong taddr;
         uint8_t pos, len;
         uint32_t tmp32;
-        uint64_t tmp64;
+        uint64_t tmp64, taddr;
         uint64_t T1, T2;
         MemOpIdx oi;
         int32_t ofs;
@@ -923,31 +922,40 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 
         case INDEX_op_qemu_ld_a32_i32:
+            tci_args_rrm(insn, &r0, &r1, &oi);
+            taddr = (uint32_t)regs[r1];
+            goto do_ld_i32;
         case INDEX_op_qemu_ld_a64_i32:
-            if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
+            if (TCG_TARGET_REG_BITS == 64) {
                 tci_args_rrm(insn, &r0, &r1, &oi);
                 taddr = regs[r1];
             } else {
                 tci_args_rrrm(insn, &r0, &r1, &r2, &oi);
                 taddr = tci_uint64(regs[r2], regs[r1]);
             }
-            tmp32 = tci_qemu_ld(env, taddr, oi, tb_ptr);
-            regs[r0] = tmp32;
+        do_ld_i32:
+            regs[r0] = tci_qemu_ld(env, taddr, oi, tb_ptr);
             break;
 
         case INDEX_op_qemu_ld_a32_i64:
+            if (TCG_TARGET_REG_BITS == 64) {
+                tci_args_rrm(insn, &r0, &r1, &oi);
+                taddr = (uint32_t)regs[r1];
+            } else {
+                tci_args_rrrm(insn, &r0, &r1, &r2, &oi);
+                taddr = (uint32_t)regs[r2];
+            }
+            goto do_ld_i64;
         case INDEX_op_qemu_ld_a64_i64:
             if (TCG_TARGET_REG_BITS == 64) {
                 tci_args_rrm(insn, &r0, &r1, &oi);
                 taddr = regs[r1];
-            } else if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
-                tci_args_rrrm(insn, &r0, &r1, &r2, &oi);
-                taddr = regs[r2];
             } else {
                 tci_args_rrrrr(insn, &r0, &r1, &r2, &r3, &r4);
                 taddr = tci_uint64(regs[r3], regs[r2]);
                 oi = regs[r4];
             }
+        do_ld_i64:
             tmp64 = tci_qemu_ld(env, taddr, oi, tb_ptr);
             if (TCG_TARGET_REG_BITS == 32) {
                 tci_write_reg64(regs, r1, r0, tmp64);
@@ -957,35 +965,44 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 
         case INDEX_op_qemu_st_a32_i32:
+            tci_args_rrm(insn, &r0, &r1, &oi);
+            taddr = (uint32_t)regs[r1];
+            goto do_st_i32;
         case INDEX_op_qemu_st_a64_i32:
-            if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
+            if (TCG_TARGET_REG_BITS == 64) {
                 tci_args_rrm(insn, &r0, &r1, &oi);
                 taddr = regs[r1];
             } else {
                 tci_args_rrrm(insn, &r0, &r1, &r2, &oi);
                 taddr = tci_uint64(regs[r2], regs[r1]);
             }
-            tmp32 = regs[r0];
-            tci_qemu_st(env, taddr, tmp32, oi, tb_ptr);
+        do_st_i32:
+            tci_qemu_st(env, taddr, regs[r0], oi, tb_ptr);
             break;
 
         case INDEX_op_qemu_st_a32_i64:
+            if (TCG_TARGET_REG_BITS == 64) {
+                tci_args_rrm(insn, &r0, &r1, &oi);
+                tmp64 = regs[r0];
+                taddr = (uint32_t)regs[r1];
+            } else {
+                tci_args_rrrm(insn, &r0, &r1, &r2, &oi);
+                tmp64 = tci_uint64(regs[r1], regs[r0]);
+                taddr = (uint32_t)regs[r2];
+            }
+            goto do_st_i64;
         case INDEX_op_qemu_st_a64_i64:
             if (TCG_TARGET_REG_BITS == 64) {
                 tci_args_rrm(insn, &r0, &r1, &oi);
-                taddr = regs[r1];
                 tmp64 = regs[r0];
+                taddr = regs[r1];
             } else {
-                if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
-                    tci_args_rrrm(insn, &r0, &r1, &r2, &oi);
-                    taddr = regs[r2];
-                } else {
-                    tci_args_rrrrr(insn, &r0, &r1, &r2, &r3, &r4);
-                    taddr = tci_uint64(regs[r3], regs[r2]);
-                    oi = regs[r4];
-                }
+                tci_args_rrrrr(insn, &r0, &r1, &r2, &r3, &r4);
                 tmp64 = tci_uint64(regs[r1], regs[r0]);
+                taddr = tci_uint64(regs[r3], regs[r2]);
+                oi = regs[r4];
             }
+        do_st_i64:
             tci_qemu_st(env, taddr, tmp64, oi, tb_ptr);
             break;
 
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index b9d1f492b3..e8072ca1bd 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -243,7 +243,7 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
     return false;
 }
 
-static void stack_bounds_check(TCGReg base, target_long offset)
+static void stack_bounds_check(TCGReg base, intptr_t offset)
 {
     if (base == TCG_REG_CALL_STACK) {
         tcg_debug_assert(offset >= 0);
@@ -851,24 +851,23 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_a32_i32:
-    case INDEX_op_qemu_ld_a64_i32:
     case INDEX_op_qemu_st_a32_i32:
+        tcg_out_op_rrm(s, opc, args[0], args[1], args[2]);
+        break;
+    case INDEX_op_qemu_ld_a64_i32:
     case INDEX_op_qemu_st_a64_i32:
-        if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
+    case INDEX_op_qemu_ld_a32_i64:
+    case INDEX_op_qemu_st_a32_i64:
+        if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_op_rrm(s, opc, args[0], args[1], args[2]);
         } else {
             tcg_out_op_rrrm(s, opc, args[0], args[1], args[2], args[3]);
         }
         break;
-
-    case INDEX_op_qemu_ld_a32_i64:
     case INDEX_op_qemu_ld_a64_i64:
-    case INDEX_op_qemu_st_a32_i64:
     case INDEX_op_qemu_st_a64_i64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_op_rrm(s, opc, args[0], args[1], args[2]);
-        } else if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
-            tcg_out_op_rrrm(s, opc, args[0], args[1], args[2], args[3]);
         } else {
             tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_TMP, args[4]);
             tcg_out_op_rrrrr(s, opc, args[0], args[1],
-- 
2.34.1


