Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B586F51AD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:34:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6rU-0005H3-RE; Wed, 03 May 2023 03:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q9-0001y8-4M
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:53 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q3-0001gT-9H
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:52 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f19a7f9424so47047015e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098626; x=1685690626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EnOEi55JTS7k82/BAszU6pdnQx/lYPmPCCOT/pL2kjY=;
 b=Bm+wgXnHe7k00/AuiCz9E7rUw+J00V3w+7zm7BvzWOWnOqcAJH5OaKRdYgDT5inE0i
 i1f9NxCmGAbODYzhrrC8Jtr1u3WsHPDhSoINrqSeQwEyOXHt2mt3M+fPphX8ctp02DRf
 eklFrUWSpOEtZssJZn5Spl1Q7Xs031MOzEa+VdiR/1/1CehbIuuvmyuCyjXOeqTfq8/N
 OIR76HZ/TyZR+3tzDU5tbYaHx7NJR30qtaCyM9yM9mjDZNrIS0JnLyuJ16c3hC3qU65D
 PilOcXhvxXBnwrd7uOil0iA/NuKcg+OU92jFYzYJKDb6yx4ed9xHZlaUbUx8x40KswRj
 FIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098626; x=1685690626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EnOEi55JTS7k82/BAszU6pdnQx/lYPmPCCOT/pL2kjY=;
 b=BpEblAOw4YEOvgfKPmn9LDyHpMtqVf7xWifODZcoDqnHhgbXiCiZHGaHr39oMjrXvw
 E3roQLqEEx1GYswjHvHIxhuwlXUiV0MBnilMhmjPSerWY2eoyG4LSABh/R3B/Law6DTj
 A2mPR+tH/9m6X0jqKmLZbNcITAq5IU6eneG4OqvBtYTaKhfsy+lhcRblBVXyNiISwD0X
 BvKLO9FGhbg69kXYSGSYlyP4b8rmqgelFmoLtzxXovBV9J8vAkPrazqutQsp3LRr0M+N
 fC36phEL60K4pzL1zPKv6R9YAHbvW8prMLurxnOzoq9pMpIZVPkurxYTZqPKKW9HBylm
 AFJA==
X-Gm-Message-State: AC+VfDx+cWkkjdTrR/T5ha213Zmkxxvtv5csduNOPToNE33V5mzntSsK
 5RbQ8wUqyy725Y7OJKDa+XZAYe807K5KM/2Nh79TbA==
X-Google-Smtp-Source: ACHHUZ5c8kB3fTjgIzpBLcyY54ZzDkA1X6G/WRUPTI9km/c4FOmcjl7/xA+fDlfvB0AoCa0lNlY5jg==
X-Received: by 2002:a05:6000:509:b0:2e8:b9bb:f969 with SMTP id
 a9-20020a056000050900b002e8b9bbf969mr14073978wrf.0.1683098625537; 
 Wed, 03 May 2023 00:23:45 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 14/84] tcg: Split INDEX_op_qemu_{ld,
 st}* for guest address size
Date: Wed,  3 May 2023 08:22:21 +0100
Message-Id: <20230503072331.1747057-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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

For 32-bit hosts, we cannot simply rely on TCGContext.addr_bits,
as we need one or two host registers to represent the guest address.

Create the new opcodes and update all users.  Since we have not
yet eliminated TARGET_LONG_BITS, only one of the two opcodes will
ever be used, so we can get away with treating them the same in
the backends.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-opc.h            | 35 ++++++++----
 tcg/optimize.c                   | 19 +++++--
 tcg/tcg-op-ldst.c                | 83 ++++++++++++++++++++++-------
 tcg/tcg.c                        | 40 +++++++++-----
 tcg/tci.c                        | 32 +++++++----
 tcg/aarch64/tcg-target.c.inc     | 36 ++++++++-----
 tcg/arm/tcg-target.c.inc         | 83 +++++++++++++++--------------
 tcg/i386/tcg-target.c.inc        | 91 ++++++++++++++++++++------------
 tcg/loongarch64/tcg-target.c.inc | 24 ++++++---
 tcg/mips/tcg-target.c.inc        | 66 ++++++++++++++---------
 tcg/ppc/tcg-target.c.inc         | 91 +++++++++++++++++++-------------
 tcg/riscv/tcg-target.c.inc       | 24 ++++++---
 tcg/s390x/tcg-target.c.inc       | 36 ++++++++-----
 tcg/sparc64/tcg-target.c.inc     | 24 ++++++---
 tcg/tci/tcg-target.c.inc         | 44 ++++++++-------
 15 files changed, 468 insertions(+), 260 deletions(-)

diff --git a/include/tcg/tcg-opc.h b/include/tcg/tcg-opc.h
index 29216366d2..21594c1590 100644
--- a/include/tcg/tcg-opc.h
+++ b/include/tcg/tcg-opc.h
@@ -186,7 +186,6 @@ DEF(muls2_i64, 2, 2, 0, IMPL64 | IMPL(TCG_TARGET_HAS_muls2_i64))
 DEF(muluh_i64, 1, 2, 0, IMPL64 | IMPL(TCG_TARGET_HAS_muluh_i64))
 DEF(mulsh_i64, 1, 2, 0, IMPL64 | IMPL(TCG_TARGET_HAS_mulsh_i64))
 
-#define TLADDR_ARGS  (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? 1 : 2)
 #define DATA64_ARGS  (TCG_TARGET_REG_BITS == 64 ? 1 : 2)
 
 /* QEMU specific */
@@ -199,25 +198,44 @@ DEF(goto_ptr, 0, 1, 0, TCG_OPF_BB_EXIT | TCG_OPF_BB_END)
 DEF(plugin_cb_start, 0, 0, 3, TCG_OPF_NOT_PRESENT)
 DEF(plugin_cb_end, 0, 0, 0, TCG_OPF_NOT_PRESENT)
 
-DEF(qemu_ld_i32, 1, TLADDR_ARGS, 1,
+/* Replicate ld/st ops for 32 and 64-bit guest addresses. */
+DEF(qemu_ld_a32_i32, 1, 1, 1,
     TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS)
-DEF(qemu_st_i32, 0, TLADDR_ARGS + 1, 1,
+DEF(qemu_st_a32_i32, 0, 1 + 1, 1,
     TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS)
-DEF(qemu_ld_i64, DATA64_ARGS, TLADDR_ARGS, 1,
+DEF(qemu_ld_a32_i64, DATA64_ARGS, 1, 1,
     TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS | TCG_OPF_64BIT)
-DEF(qemu_st_i64, 0, TLADDR_ARGS + DATA64_ARGS, 1,
+DEF(qemu_st_a32_i64, 0, DATA64_ARGS + 1, 1,
+    TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS | TCG_OPF_64BIT)
+
+DEF(qemu_ld_a64_i32, 1, DATA64_ARGS, 1,
+    TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS)
+DEF(qemu_st_a64_i32, 0, 1 + DATA64_ARGS, 1,
+    TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS)
+DEF(qemu_ld_a64_i64, DATA64_ARGS, DATA64_ARGS, 1,
+    TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS | TCG_OPF_64BIT)
+DEF(qemu_st_a64_i64, 0, DATA64_ARGS + DATA64_ARGS, 1,
     TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS | TCG_OPF_64BIT)
 
 /* Only used by i386 to cope with stupid register constraints. */
-DEF(qemu_st8_i32, 0, TLADDR_ARGS + 1, 1,
+DEF(qemu_st8_a32_i32, 0, 1 + 1, 1,
+    TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS |
+    IMPL(TCG_TARGET_HAS_qemu_st8_i32))
+DEF(qemu_st8_a64_i32, 0, 1 + DATA64_ARGS, 1,
     TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS |
     IMPL(TCG_TARGET_HAS_qemu_st8_i32))
 
 /* Only for 64-bit hosts at the moment. */
-DEF(qemu_ld_i128, 2, 1, 1,
+DEF(qemu_ld_a32_i128, 2, 1, 1,
     TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS | TCG_OPF_64BIT |
     IMPL(TCG_TARGET_HAS_qemu_ldst_i128))
-DEF(qemu_st_i128, 0, 3, 1,
+DEF(qemu_ld_a64_i128, 2, 1, 1,
+    TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS | TCG_OPF_64BIT |
+    IMPL(TCG_TARGET_HAS_qemu_ldst_i128))
+DEF(qemu_st_a32_i128, 0, 3, 1,
+    TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS | TCG_OPF_64BIT |
+    IMPL(TCG_TARGET_HAS_qemu_ldst_i128))
+DEF(qemu_st_a64_i128, 0, 3, 1,
     TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS | TCG_OPF_64BIT |
     IMPL(TCG_TARGET_HAS_qemu_ldst_i128))
 
@@ -291,7 +309,6 @@ DEF(tci_movi, 1, 0, 1, TCG_OPF_NOT_PRESENT)
 DEF(tci_movl, 1, 0, 1, TCG_OPF_NOT_PRESENT)
 #endif
 
-#undef TLADDR_ARGS
 #undef DATA64_ARGS
 #undef IMPL
 #undef IMPL64
diff --git a/tcg/optimize.c b/tcg/optimize.c
index 37d46f2a1f..59daf3c779 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -2193,13 +2193,22 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(orc):
             done = fold_orc(&ctx, op);
             break;
-        case INDEX_op_qemu_ld_i32:
-        case INDEX_op_qemu_ld_i64:
+        case INDEX_op_qemu_ld_a32_i32:
+        case INDEX_op_qemu_ld_a64_i32:
+        case INDEX_op_qemu_ld_a32_i64:
+        case INDEX_op_qemu_ld_a64_i64:
+        case INDEX_op_qemu_ld_a32_i128:
+        case INDEX_op_qemu_ld_a64_i128:
             done = fold_qemu_ld(&ctx, op);
             break;
-        case INDEX_op_qemu_st_i32:
-        case INDEX_op_qemu_st8_i32:
-        case INDEX_op_qemu_st_i64:
+        case INDEX_op_qemu_st8_a32_i32:
+        case INDEX_op_qemu_st8_a64_i32:
+        case INDEX_op_qemu_st_a32_i32:
+        case INDEX_op_qemu_st_a64_i32:
+        case INDEX_op_qemu_st_a32_i64:
+        case INDEX_op_qemu_st_a64_i64:
+        case INDEX_op_qemu_st_a32_i128:
+        case INDEX_op_qemu_st_a64_i128:
             done = fold_qemu_st(&ctx, op);
             break;
         CASE_OP_32_64(rem):
diff --git a/tcg/tcg-op-ldst.c b/tcg/tcg-op-ldst.c
index 4624b0a25b..eb9ad75cae 100644
--- a/tcg/tcg-op-ldst.c
+++ b/tcg/tcg-op-ldst.c
@@ -164,6 +164,7 @@ static void tcg_gen_qemu_ld_i32_int(TCGv_i32 val, TCGTemp *addr,
     MemOp orig_memop;
     MemOpIdx orig_oi, oi;
     TCGv_i64 copy_addr;
+    TCGOpcode opc;
 
     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     orig_memop = memop = tcg_canonicalize_memop(memop, 0, 0);
@@ -179,7 +180,12 @@ static void tcg_gen_qemu_ld_i32_int(TCGv_i32 val, TCGTemp *addr,
     }
 
     copy_addr = plugin_maybe_preserve_addr(addr);
-    gen_ldst(INDEX_op_qemu_ld_i32, tcgv_i32_temp(val), NULL, addr, oi);
+    if (tcg_ctx->addr_type == TCG_TYPE_I32) {
+        opc = INDEX_op_qemu_ld_a32_i32;
+    } else {
+        opc = INDEX_op_qemu_ld_a64_i32;
+    }
+    gen_ldst(opc, tcgv_i32_temp(val), NULL, addr, oi);
     plugin_gen_mem_callbacks(copy_addr, addr, orig_oi, QEMU_PLUGIN_MEM_R);
 
     if ((orig_memop ^ memop) & MO_BSWAP) {
@@ -235,9 +241,17 @@ static void tcg_gen_qemu_st_i32_int(TCGv_i32 val, TCGTemp *addr,
     }
 
     if (TCG_TARGET_HAS_qemu_st8_i32 && (memop & MO_SIZE) == MO_8) {
-        opc = INDEX_op_qemu_st8_i32;
+        if (tcg_ctx->addr_type == TCG_TYPE_I32) {
+            opc = INDEX_op_qemu_st8_a32_i32;
+        } else {
+            opc = INDEX_op_qemu_st8_a64_i32;
+        }
     } else {
-        opc = INDEX_op_qemu_st_i32;
+        if (tcg_ctx->addr_type == TCG_TYPE_I32) {
+            opc = INDEX_op_qemu_st_a32_i32;
+        } else {
+            opc = INDEX_op_qemu_st_a64_i32;
+        }
     }
     gen_ldst(opc, tcgv_i32_temp(val), NULL, addr, oi);
     plugin_gen_mem_callbacks(NULL, addr, orig_oi, QEMU_PLUGIN_MEM_W);
@@ -261,6 +275,7 @@ static void tcg_gen_qemu_ld_i64_int(TCGv_i64 val, TCGTemp *addr,
     MemOp orig_memop;
     MemOpIdx orig_oi, oi;
     TCGv_i64 copy_addr;
+    TCGOpcode opc;
 
     if (TCG_TARGET_REG_BITS == 32 && (memop & MO_SIZE) < MO_64) {
         tcg_gen_qemu_ld_i32_int(TCGV_LOW(val), addr, idx, memop);
@@ -286,7 +301,12 @@ static void tcg_gen_qemu_ld_i64_int(TCGv_i64 val, TCGTemp *addr,
     }
 
     copy_addr = plugin_maybe_preserve_addr(addr);
-    gen_ldst_i64(INDEX_op_qemu_ld_i64, val, addr, oi);
+    if (tcg_ctx->addr_type == TCG_TYPE_I32) {
+        opc = INDEX_op_qemu_ld_a32_i64;
+    } else {
+        opc = INDEX_op_qemu_ld_a64_i64;
+    }
+    gen_ldst_i64(opc, val, addr, oi);
     plugin_gen_mem_callbacks(copy_addr, addr, orig_oi, QEMU_PLUGIN_MEM_R);
 
     if ((orig_memop ^ memop) & MO_BSWAP) {
@@ -322,6 +342,7 @@ static void tcg_gen_qemu_st_i64_int(TCGv_i64 val, TCGTemp *addr,
 {
     TCGv_i64 swap = NULL;
     MemOpIdx orig_oi, oi;
+    TCGOpcode opc;
 
     if (TCG_TARGET_REG_BITS == 32 && (memop & MO_SIZE) < MO_64) {
         tcg_gen_qemu_st_i32_int(TCGV_LOW(val), addr, idx, memop);
@@ -352,7 +373,12 @@ static void tcg_gen_qemu_st_i64_int(TCGv_i64 val, TCGTemp *addr,
         oi = make_memop_idx(memop, idx);
     }
 
-    gen_ldst_i64(INDEX_op_qemu_st_i64, val, addr, oi);
+    if (tcg_ctx->addr_type == TCG_TYPE_I32) {
+        opc = INDEX_op_qemu_st_a32_i64;
+    } else {
+        opc = INDEX_op_qemu_st_a64_i64;
+    }
+    gen_ldst_i64(opc, val, addr, oi);
     plugin_gen_mem_callbacks(NULL, addr, orig_oi, QEMU_PLUGIN_MEM_W);
 
     if (swap) {
@@ -476,6 +502,7 @@ static void tcg_gen_qemu_ld_i128_int(TCGv_i128 val, TCGTemp *addr,
 {
     const MemOpIdx orig_oi = make_memop_idx(memop, idx);
     TCGv_i64 ext_addr = NULL;
+    TCGOpcode opc;
 
     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
 
@@ -495,8 +522,12 @@ static void tcg_gen_qemu_ld_i128_int(TCGv_i128 val, TCGTemp *addr,
             hi = TCGV128_HIGH(val);
         }
 
-        gen_ldst(INDEX_op_qemu_ld_i128, tcgv_i64_temp(lo),
-                 tcgv_i64_temp(hi), addr, oi);
+        if (tcg_ctx->addr_type == TCG_TYPE_I32) {
+            opc = INDEX_op_qemu_ld_a32_i128;
+        } else {
+            opc = INDEX_op_qemu_ld_a64_i128;
+        }
+        gen_ldst(opc, tcgv_i64_temp(lo), tcgv_i64_temp(hi), addr, oi);
 
         if (need_bswap) {
             tcg_gen_bswap64_i64(lo, lo);
@@ -512,6 +543,12 @@ static void tcg_gen_qemu_ld_i128_int(TCGv_i128 val, TCGTemp *addr,
         canonicalize_memop_i128_as_i64(mop, memop);
         need_bswap = (mop[0] ^ memop) & MO_BSWAP;
 
+        if (tcg_ctx->addr_type == TCG_TYPE_I32) {
+            opc = INDEX_op_qemu_ld_a32_i64;
+        } else {
+            opc = INDEX_op_qemu_ld_a64_i64;
+        }
+
         /*
          * Since there are no global TCGv_i128, there is no visible state
          * changed if the second load faults.  Load directly into the two
@@ -526,7 +563,7 @@ static void tcg_gen_qemu_ld_i128_int(TCGv_i128 val, TCGTemp *addr,
         }
 
         oi = make_memop_idx(mop[0], idx);
-        gen_ldst_i64(INDEX_op_qemu_ld_i64, x, addr, oi);
+        gen_ldst_i64(opc, x, addr, oi);
 
         if (need_bswap) {
             tcg_gen_bswap64_i64(x, x);
@@ -542,7 +579,7 @@ static void tcg_gen_qemu_ld_i128_int(TCGv_i128 val, TCGTemp *addr,
             addr_p8 = tcgv_i64_temp(t);
         }
 
-        gen_ldst_i64(INDEX_op_qemu_ld_i64, y, addr_p8, oi);
+        gen_ldst_i64(opc, y, addr_p8, oi);
         tcg_temp_free_internal(addr_p8);
 
         if (need_bswap) {
@@ -575,6 +612,7 @@ static void tcg_gen_qemu_st_i128_int(TCGv_i128 val, TCGTemp *addr,
 {
     const MemOpIdx orig_oi = make_memop_idx(memop, idx);
     TCGv_i64 ext_addr = NULL;
+    TCGOpcode opc;
 
     tcg_gen_req_mo(TCG_MO_ST_LD | TCG_MO_ST_ST);
 
@@ -597,8 +635,12 @@ static void tcg_gen_qemu_st_i128_int(TCGv_i128 val, TCGTemp *addr,
             hi = TCGV128_HIGH(val);
         }
 
-        gen_ldst(INDEX_op_qemu_st_i128, tcgv_i64_temp(lo),
-                 tcgv_i64_temp(hi), addr, oi);
+        if (tcg_ctx->addr_type == TCG_TYPE_I32) {
+            opc = INDEX_op_qemu_st_a32_i128;
+        } else {
+            opc = INDEX_op_qemu_st_a64_i128;
+        }
+        gen_ldst(opc, tcgv_i64_temp(lo), tcgv_i64_temp(hi), addr, oi);
 
         if (need_bswap) {
             tcg_temp_free_i64(lo);
@@ -611,6 +653,12 @@ static void tcg_gen_qemu_st_i128_int(TCGv_i128 val, TCGTemp *addr,
 
         canonicalize_memop_i128_as_i64(mop, memop);
 
+        if (tcg_ctx->addr_type == TCG_TYPE_I32) {
+            opc = INDEX_op_qemu_st_a32_i64;
+        } else {
+            opc = INDEX_op_qemu_st_a64_i64;
+        }
+
         if ((memop & MO_BSWAP) == MO_LE) {
             x = TCGV128_LOW(val);
             y = TCGV128_HIGH(val);
@@ -624,8 +672,8 @@ static void tcg_gen_qemu_st_i128_int(TCGv_i128 val, TCGTemp *addr,
             tcg_gen_bswap64_i64(b, x);
             x = b;
         }
-        gen_ldst_i64(INDEX_op_qemu_st_i64, x, addr,
-                     make_memop_idx(mop[0], idx));
+
+        gen_ldst_i64(opc, x, addr, make_memop_idx(mop[0], idx));
 
         if (tcg_ctx->addr_type == TCG_TYPE_I32) {
             TCGv_i32 t = tcg_temp_ebb_new_i32();
@@ -639,13 +687,10 @@ static void tcg_gen_qemu_st_i128_int(TCGv_i128 val, TCGTemp *addr,
 
         if (b) {
             tcg_gen_bswap64_i64(b, y);
-            y = b;
-        }
-        gen_ldst_i64(INDEX_op_qemu_st_i64, y, addr_p8,
-                     make_memop_idx(mop[1], idx));
-
-        if (b) {
+            gen_ldst_i64(opc, b, addr_p8, make_memop_idx(mop[1], idx));
             tcg_temp_free_i64(b);
+        } else {
+            gen_ldst_i64(opc, y, addr_p8, make_memop_idx(mop[1], idx));
         }
         tcg_temp_free_internal(addr_p8);
     } else {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index ce92336eec..45f5ce0fa1 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1742,17 +1742,24 @@ bool tcg_op_supported(TCGOpcode op)
     case INDEX_op_exit_tb:
     case INDEX_op_goto_tb:
     case INDEX_op_goto_ptr:
-    case INDEX_op_qemu_ld_i32:
-    case INDEX_op_qemu_st_i32:
-    case INDEX_op_qemu_ld_i64:
-    case INDEX_op_qemu_st_i64:
+    case INDEX_op_qemu_ld_a32_i32:
+    case INDEX_op_qemu_ld_a64_i32:
+    case INDEX_op_qemu_st_a32_i32:
+    case INDEX_op_qemu_st_a64_i32:
+    case INDEX_op_qemu_ld_a32_i64:
+    case INDEX_op_qemu_ld_a64_i64:
+    case INDEX_op_qemu_st_a32_i64:
+    case INDEX_op_qemu_st_a64_i64:
         return true;
 
-    case INDEX_op_qemu_st8_i32:
+    case INDEX_op_qemu_st8_a32_i32:
+    case INDEX_op_qemu_st8_a64_i32:
         return TCG_TARGET_HAS_qemu_st8_i32;
 
-    case INDEX_op_qemu_ld_i128:
-    case INDEX_op_qemu_st_i128:
+    case INDEX_op_qemu_ld_a32_i128:
+    case INDEX_op_qemu_ld_a64_i128:
+    case INDEX_op_qemu_st_a32_i128:
+    case INDEX_op_qemu_st_a64_i128:
         return TCG_TARGET_HAS_qemu_ldst_i128;
 
     case INDEX_op_mov_i32:
@@ -2358,11 +2365,20 @@ static void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
                 }
                 i = 1;
                 break;
-            case INDEX_op_qemu_ld_i32:
-            case INDEX_op_qemu_st_i32:
-            case INDEX_op_qemu_st8_i32:
-            case INDEX_op_qemu_ld_i64:
-            case INDEX_op_qemu_st_i64:
+            case INDEX_op_qemu_ld_a32_i32:
+            case INDEX_op_qemu_ld_a64_i32:
+            case INDEX_op_qemu_st_a32_i32:
+            case INDEX_op_qemu_st_a64_i32:
+            case INDEX_op_qemu_st8_a32_i32:
+            case INDEX_op_qemu_st8_a64_i32:
+            case INDEX_op_qemu_ld_a32_i64:
+            case INDEX_op_qemu_ld_a64_i64:
+            case INDEX_op_qemu_st_a32_i64:
+            case INDEX_op_qemu_st_a64_i64:
+            case INDEX_op_qemu_ld_a32_i128:
+            case INDEX_op_qemu_ld_a64_i128:
+            case INDEX_op_qemu_st_a32_i128:
+            case INDEX_op_qemu_st_a64_i128:
                 {
                     MemOpIdx oi = op->args[k++];
                     MemOp op = get_memop(oi);
diff --git a/tcg/tci.c b/tcg/tci.c
index 15f2f8c463..742c791726 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -922,7 +922,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tb_ptr = ptr;
             break;
 
-        case INDEX_op_qemu_ld_i32:
+        case INDEX_op_qemu_ld_a32_i32:
+        case INDEX_op_qemu_ld_a64_i32:
             if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
                 tci_args_rrm(insn, &r0, &r1, &oi);
                 taddr = regs[r1];
@@ -934,7 +935,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             regs[r0] = tmp32;
             break;
 
-        case INDEX_op_qemu_ld_i64:
+        case INDEX_op_qemu_ld_a32_i64:
+        case INDEX_op_qemu_ld_a64_i64:
             if (TCG_TARGET_REG_BITS == 64) {
                 tci_args_rrm(insn, &r0, &r1, &oi);
                 taddr = regs[r1];
@@ -954,7 +956,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             }
             break;
 
-        case INDEX_op_qemu_st_i32:
+        case INDEX_op_qemu_st_a32_i32:
+        case INDEX_op_qemu_st_a64_i32:
             if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
                 tci_args_rrm(insn, &r0, &r1, &oi);
                 taddr = regs[r1];
@@ -966,7 +969,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_qemu_st(env, taddr, tmp32, oi, tb_ptr);
             break;
 
-        case INDEX_op_qemu_st_i64:
+        case INDEX_op_qemu_st_a32_i64:
+        case INDEX_op_qemu_st_a64_i64:
             if (TCG_TARGET_REG_BITS == 64) {
                 tci_args_rrm(insn, &r0, &r1, &oi);
                 taddr = regs[r1];
@@ -1251,15 +1255,21 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
                            str_r(r3), str_r(r4), str_r(r5));
         break;
 
-    case INDEX_op_qemu_ld_i64:
-    case INDEX_op_qemu_st_i64:
-        len = DIV_ROUND_UP(64, TCG_TARGET_REG_BITS);
+    case INDEX_op_qemu_ld_a32_i32:
+    case INDEX_op_qemu_st_a32_i32:
+        len = 1 + 1;
+        goto do_qemu_ldst;
+    case INDEX_op_qemu_ld_a32_i64:
+    case INDEX_op_qemu_st_a32_i64:
+    case INDEX_op_qemu_ld_a64_i32:
+    case INDEX_op_qemu_st_a64_i32:
+        len = 1 + DIV_ROUND_UP(64, TCG_TARGET_REG_BITS);
+        goto do_qemu_ldst;
+    case INDEX_op_qemu_ld_a64_i64:
+    case INDEX_op_qemu_st_a64_i64:
+        len = 2 * DIV_ROUND_UP(64, TCG_TARGET_REG_BITS);
         goto do_qemu_ldst;
-    case INDEX_op_qemu_ld_i32:
-    case INDEX_op_qemu_st_i32:
-        len = 1;
     do_qemu_ldst:
-        len += DIV_ROUND_UP(TARGET_LONG_BITS, TCG_TARGET_REG_BITS);
         switch (len) {
         case 2:
             tci_args_rrm(insn, &r0, &r1, &oi);
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index f1627cb96d..dc448f3f4b 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -2332,18 +2332,24 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_insn(s, 3506, CSEL, ext, a0, REG0(3), REG0(4), args[5]);
         break;
 
-    case INDEX_op_qemu_ld_i32:
-    case INDEX_op_qemu_ld_i64:
+    case INDEX_op_qemu_ld_a32_i32:
+    case INDEX_op_qemu_ld_a64_i32:
+    case INDEX_op_qemu_ld_a32_i64:
+    case INDEX_op_qemu_ld_a64_i64:
         tcg_out_qemu_ld(s, a0, a1, a2, ext);
         break;
-    case INDEX_op_qemu_st_i32:
-    case INDEX_op_qemu_st_i64:
+    case INDEX_op_qemu_st_a32_i32:
+    case INDEX_op_qemu_st_a64_i32:
+    case INDEX_op_qemu_st_a32_i64:
+    case INDEX_op_qemu_st_a64_i64:
         tcg_out_qemu_st(s, REG0(0), a1, a2, ext);
         break;
-    case INDEX_op_qemu_ld_i128:
+    case INDEX_op_qemu_ld_a32_i128:
+    case INDEX_op_qemu_ld_a64_i128:
         tcg_out_qemu_ld128(s, a0, a1, a2, args[3]);
         break;
-    case INDEX_op_qemu_st_i128:
+    case INDEX_op_qemu_st_a32_i128:
+    case INDEX_op_qemu_st_a64_i128:
         tcg_out_qemu_st128(s, REG0(0), REG0(1), a2, args[3]);
         break;
 
@@ -2980,15 +2986,21 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_movcond_i64:
         return C_O1_I4(r, r, rA, rZ, rZ);
 
-    case INDEX_op_qemu_ld_i32:
-    case INDEX_op_qemu_ld_i64:
+    case INDEX_op_qemu_ld_a32_i32:
+    case INDEX_op_qemu_ld_a64_i32:
+    case INDEX_op_qemu_ld_a32_i64:
+    case INDEX_op_qemu_ld_a64_i64:
         return C_O1_I1(r, l);
-    case INDEX_op_qemu_ld_i128:
+    case INDEX_op_qemu_ld_a32_i128:
+    case INDEX_op_qemu_ld_a64_i128:
         return C_O2_I1(r, r, l);
-    case INDEX_op_qemu_st_i32:
-    case INDEX_op_qemu_st_i64:
+    case INDEX_op_qemu_st_a32_i32:
+    case INDEX_op_qemu_st_a64_i32:
+    case INDEX_op_qemu_st_a32_i64:
+    case INDEX_op_qemu_st_a64_i64:
         return C_O0_I2(lZ, l);
-    case INDEX_op_qemu_st_i128:
+    case INDEX_op_qemu_st_a32_i128:
+    case INDEX_op_qemu_st_a64_i128:
         return C_O0_I3(lZ, lZ, l);
 
     case INDEX_op_deposit_i32:
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index edd995e04f..a4c3240b3f 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1989,41 +1989,36 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                         ARITH_MOV, args[0], 0, 0);
         break;
 
-    case INDEX_op_qemu_ld_i32:
-        if (TARGET_LONG_BITS == 32) {
-            tcg_out_qemu_ld(s, args[0], -1, args[1], -1,
-                            args[2], TCG_TYPE_I32);
-        } else {
-            tcg_out_qemu_ld(s, args[0], -1, args[1], args[2],
-                            args[3], TCG_TYPE_I32);
-        }
+    case INDEX_op_qemu_ld_a32_i32:
+        tcg_out_qemu_ld(s, args[0], -1, args[1], -1, args[2], TCG_TYPE_I32);
         break;
-    case INDEX_op_qemu_ld_i64:
-        if (TARGET_LONG_BITS == 32) {
-            tcg_out_qemu_ld(s, args[0], args[1], args[2], -1,
-                            args[3], TCG_TYPE_I64);
-        } else {
-            tcg_out_qemu_ld(s, args[0], args[1], args[2], args[3],
-                            args[4], TCG_TYPE_I64);
-        }
+    case INDEX_op_qemu_ld_a64_i32:
+        tcg_out_qemu_ld(s, args[0], -1, args[1], args[2],
+                        args[3], TCG_TYPE_I32);
         break;
-    case INDEX_op_qemu_st_i32:
-        if (TARGET_LONG_BITS == 32) {
-            tcg_out_qemu_st(s, args[0], -1, args[1], -1,
-                            args[2], TCG_TYPE_I32);
-        } else {
-            tcg_out_qemu_st(s, args[0], -1, args[1], args[2],
-                            args[3], TCG_TYPE_I32);
-        }
+    case INDEX_op_qemu_ld_a32_i64:
+        tcg_out_qemu_ld(s, args[0], args[1], args[2], -1,
+                        args[3], TCG_TYPE_I64);
         break;
-    case INDEX_op_qemu_st_i64:
-        if (TARGET_LONG_BITS == 32) {
-            tcg_out_qemu_st(s, args[0], args[1], args[2], -1,
-                            args[3], TCG_TYPE_I64);
-        } else {
-            tcg_out_qemu_st(s, args[0], args[1], args[2], args[3],
-                            args[4], TCG_TYPE_I64);
-        }
+    case INDEX_op_qemu_ld_a64_i64:
+        tcg_out_qemu_ld(s, args[0], args[1], args[2], args[3],
+                        args[4], TCG_TYPE_I64);
+        break;
+
+    case INDEX_op_qemu_st_a32_i32:
+        tcg_out_qemu_st(s, args[0], -1, args[1], -1, args[2], TCG_TYPE_I32);
+        break;
+    case INDEX_op_qemu_st_a64_i32:
+        tcg_out_qemu_st(s, args[0], -1, args[1], args[2],
+                        args[3], TCG_TYPE_I32);
+        break;
+    case INDEX_op_qemu_st_a32_i64:
+        tcg_out_qemu_st(s, args[0], args[1], args[2], -1,
+                        args[3], TCG_TYPE_I64);
+        break;
+    case INDEX_op_qemu_st_a64_i64:
+        tcg_out_qemu_st(s, args[0], args[1], args[2], args[3],
+                        args[4], TCG_TYPE_I64);
         break;
 
     case INDEX_op_bswap16_i32:
@@ -2164,14 +2159,22 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_setcond2_i32:
         return C_O1_I4(r, r, r, rI, rI);
 
-    case INDEX_op_qemu_ld_i32:
-        return TARGET_LONG_BITS == 32 ? C_O1_I1(r, q) : C_O1_I2(r, q, q);
-    case INDEX_op_qemu_ld_i64:
-        return TARGET_LONG_BITS == 32 ? C_O2_I1(e, p, q) : C_O2_I2(e, p, q, q);
-    case INDEX_op_qemu_st_i32:
-        return TARGET_LONG_BITS == 32 ? C_O0_I2(q, q) : C_O0_I3(q, q, q);
-    case INDEX_op_qemu_st_i64:
-        return TARGET_LONG_BITS == 32 ? C_O0_I3(Q, p, q) : C_O0_I4(Q, p, q, q);
+    case INDEX_op_qemu_ld_a32_i32:
+        return C_O1_I1(r, q);
+    case INDEX_op_qemu_ld_a64_i32:
+        return C_O1_I2(r, q, q);
+    case INDEX_op_qemu_ld_a32_i64:
+        return C_O2_I1(e, p, q);
+    case INDEX_op_qemu_ld_a64_i64:
+        return C_O2_I2(e, p, q, q);
+    case INDEX_op_qemu_st_a32_i32:
+        return C_O0_I2(q, q);
+    case INDEX_op_qemu_st_a64_i32:
+        return C_O0_I3(q, q, q);
+    case INDEX_op_qemu_st_a32_i64:
+        return C_O0_I3(Q, p, q);
+    case INDEX_op_qemu_st_a64_i64:
+        return C_O0_I4(Q, p, q, q);
 
     case INDEX_op_st_vec:
         return C_O0_I2(w, r);
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index a2739977a6..85fdea42b9 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2672,44 +2672,62 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_modrm(s, OPC_GRP3_Ev + rexw, EXT3_NOT, a0);
         break;
 
-    case INDEX_op_qemu_ld_i32:
-        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
-            tcg_out_qemu_ld(s, a0, -1, a1, -1, a2, TCG_TYPE_I32);
-        } else {
+    case INDEX_op_qemu_ld_a64_i32:
+        if (TCG_TARGET_REG_BITS == 32) {
             tcg_out_qemu_ld(s, a0, -1, a1, a2, args[3], TCG_TYPE_I32);
+            break;
         }
+        /* fall through */
+    case INDEX_op_qemu_ld_a32_i32:
+        tcg_out_qemu_ld(s, a0, -1, a1, -1, a2, TCG_TYPE_I32);
         break;
-    case INDEX_op_qemu_ld_i64:
+    case INDEX_op_qemu_ld_a32_i64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_qemu_ld(s, a0, -1, a1, -1, a2, TCG_TYPE_I64);
-        } else if (TARGET_LONG_BITS == 32) {
+        } else {
             tcg_out_qemu_ld(s, a0, a1, a2, -1, args[3], TCG_TYPE_I64);
+        }
+        break;
+    case INDEX_op_qemu_ld_a64_i64:
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_ld(s, a0, -1, a1, -1, a2, TCG_TYPE_I64);
         } else {
             tcg_out_qemu_ld(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
         }
         break;
-    case INDEX_op_qemu_ld_i128:
+    case INDEX_op_qemu_ld_a32_i128:
+    case INDEX_op_qemu_ld_a64_i128:
         tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
         tcg_out_qemu_ld(s, a0, a1, a2, -1, args[3], TCG_TYPE_I128);
         break;
-    case INDEX_op_qemu_st_i32:
-    case INDEX_op_qemu_st8_i32:
-        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
-            tcg_out_qemu_st(s, a0, -1, a1, -1, a2, TCG_TYPE_I32);
-        } else {
+
+    case INDEX_op_qemu_st_a64_i32:
+    case INDEX_op_qemu_st8_a64_i32:
+        if (TCG_TARGET_REG_BITS == 32) {
             tcg_out_qemu_st(s, a0, -1, a1, a2, args[3], TCG_TYPE_I32);
+            break;
         }
+        /* fall through */
+    case INDEX_op_qemu_st_a32_i32:
+    case INDEX_op_qemu_st8_a32_i32:
+        tcg_out_qemu_st(s, a0, -1, a1, -1, a2, TCG_TYPE_I32);
         break;
-    case INDEX_op_qemu_st_i64:
+    case INDEX_op_qemu_st_a32_i64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_qemu_st(s, a0, -1, a1, -1, a2, TCG_TYPE_I64);
-        } else if (TARGET_LONG_BITS == 32) {
+        } else {
             tcg_out_qemu_st(s, a0, a1, a2, -1, args[3], TCG_TYPE_I64);
+        }
+        break;
+    case INDEX_op_qemu_st_a64_i64:
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_st(s, a0, -1, a1, -1, a2, TCG_TYPE_I64);
         } else {
             tcg_out_qemu_st(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
         }
         break;
-    case INDEX_op_qemu_st_i128:
+    case INDEX_op_qemu_st_a32_i128:
+    case INDEX_op_qemu_st_a64_i128:
         tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
         tcg_out_qemu_st(s, a0, a1, a2, -1, args[3], TCG_TYPE_I128);
         break;
@@ -3386,31 +3404,36 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_clz_i64:
         return have_lzcnt ? C_N1_I2(r, r, rW) : C_N1_I2(r, r, r);
 
-    case INDEX_op_qemu_ld_i32:
-        return (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
-                ? C_O1_I1(r, L) : C_O1_I2(r, L, L));
+    case INDEX_op_qemu_ld_a32_i32:
+        return C_O1_I1(r, L);
+    case INDEX_op_qemu_ld_a64_i32:
+        return TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, L) : C_O1_I2(r, L, L);
 
-    case INDEX_op_qemu_st_i32:
-        return (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
-                ? C_O0_I2(L, L) : C_O0_I3(L, L, L));
-    case INDEX_op_qemu_st8_i32:
-        return (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
-                ? C_O0_I2(s, L) : C_O0_I3(s, L, L));
+    case INDEX_op_qemu_st_a32_i32:
+        return C_O0_I2(L, L);
+    case INDEX_op_qemu_st_a64_i32:
+        return TCG_TARGET_REG_BITS == 64 ? C_O0_I2(L, L) : C_O0_I3(L, L, L);
+    case INDEX_op_qemu_st8_a32_i32:
+        return C_O0_I2(s, L);
+    case INDEX_op_qemu_st8_a64_i32:
+        return TCG_TARGET_REG_BITS == 64 ? C_O0_I2(s, L) : C_O0_I3(s, L, L);
 
-    case INDEX_op_qemu_ld_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, L)
-                : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? C_O2_I1(r, r, L)
-                : C_O2_I2(r, r, L, L));
+    case INDEX_op_qemu_ld_a32_i64:
+        return TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, L) : C_O2_I1(r, r, L);
+    case INDEX_op_qemu_ld_a64_i64:
+        return TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, L) : C_O2_I2(r, r, L, L);
 
-    case INDEX_op_qemu_st_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(L, L)
-                : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? C_O0_I3(L, L, L)
-                : C_O0_I4(L, L, L, L));
+    case INDEX_op_qemu_st_a32_i64:
+        return TCG_TARGET_REG_BITS == 64 ? C_O0_I2(L, L) : C_O0_I3(L, L, L);
+    case INDEX_op_qemu_st_a64_i64:
+        return TCG_TARGET_REG_BITS == 64 ? C_O0_I2(L, L) : C_O0_I4(L, L, L, L);
 
-    case INDEX_op_qemu_ld_i128:
+    case INDEX_op_qemu_ld_a32_i128:
+    case INDEX_op_qemu_ld_a64_i128:
         tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
         return C_O2_I1(r, r, L);
-    case INDEX_op_qemu_st_i128:
+    case INDEX_op_qemu_st_a32_i128:
+    case INDEX_op_qemu_st_a64_i128:
         tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
         return C_O0_I3(L, L, L);
 
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 43341524f2..ea5f2a8f00 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1445,16 +1445,20 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_ldst(s, OPC_ST_D, a0, a1, a2);
         break;
 
-    case INDEX_op_qemu_ld_i32:
+    case INDEX_op_qemu_ld_a32_i32:
+    case INDEX_op_qemu_ld_a64_i32:
         tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I32);
         break;
-    case INDEX_op_qemu_ld_i64:
+    case INDEX_op_qemu_ld_a32_i64:
+    case INDEX_op_qemu_ld_a64_i64:
         tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I64);
         break;
-    case INDEX_op_qemu_st_i32:
+    case INDEX_op_qemu_st_a32_i32:
+    case INDEX_op_qemu_st_a64_i32:
         tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I32);
         break;
-    case INDEX_op_qemu_st_i64:
+    case INDEX_op_qemu_st_a32_i64:
+    case INDEX_op_qemu_st_a64_i64:
         tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I64);
         break;
 
@@ -1494,8 +1498,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_st32_i64:
     case INDEX_op_st_i32:
     case INDEX_op_st_i64:
-    case INDEX_op_qemu_st_i32:
-    case INDEX_op_qemu_st_i64:
+    case INDEX_op_qemu_st_a32_i32:
+    case INDEX_op_qemu_st_a64_i32:
+    case INDEX_op_qemu_st_a32_i64:
+    case INDEX_op_qemu_st_a64_i64:
         return C_O0_I2(rZ, r);
 
     case INDEX_op_brcond_i32:
@@ -1537,8 +1543,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ld32u_i64:
     case INDEX_op_ld_i32:
     case INDEX_op_ld_i64:
-    case INDEX_op_qemu_ld_i32:
-    case INDEX_op_qemu_ld_i64:
+    case INDEX_op_qemu_ld_a32_i32:
+    case INDEX_op_qemu_ld_a64_i32:
+    case INDEX_op_qemu_ld_a32_i64:
+    case INDEX_op_qemu_ld_a64_i64:
         return C_O1_I1(r, r);
 
     case INDEX_op_andc_i32:
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 43a8ffac17..901fe023d9 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1956,34 +1956,49 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_setcond2(s, args[5], a0, a1, a2, args[3], args[4]);
         break;
 
-    case INDEX_op_qemu_ld_i32:
-        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
-            tcg_out_qemu_ld(s, a0, 0, a1, 0, a2, TCG_TYPE_I32);
-        } else {
+    case INDEX_op_qemu_ld_a64_i32:
+        if (TCG_TARGET_REG_BITS == 32) {
             tcg_out_qemu_ld(s, a0, 0, a1, a2, args[3], TCG_TYPE_I32);
+            break;
         }
+        /* fall through */
+    case INDEX_op_qemu_ld_a32_i32:
+        tcg_out_qemu_ld(s, a0, 0, a1, 0, a2, TCG_TYPE_I32);
         break;
-    case INDEX_op_qemu_ld_i64:
+    case INDEX_op_qemu_ld_a32_i64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_qemu_ld(s, a0, 0, a1, 0, a2, TCG_TYPE_I64);
-        } else if (TARGET_LONG_BITS == 32) {
+        } else {
             tcg_out_qemu_ld(s, a0, a1, a2, 0, args[3], TCG_TYPE_I64);
+        }
+        break;
+    case INDEX_op_qemu_ld_a64_i64:
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_ld(s, a0, 0, a1, 0, a2, TCG_TYPE_I64);
         } else {
             tcg_out_qemu_ld(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
         }
         break;
-    case INDEX_op_qemu_st_i32:
-        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
-            tcg_out_qemu_st(s, a0, 0, a1, 0, a2, TCG_TYPE_I32);
-        } else {
+
+    case INDEX_op_qemu_st_a64_i32:
+        if (TCG_TARGET_REG_BITS == 32) {
             tcg_out_qemu_st(s, a0, 0, a1, a2, args[3], TCG_TYPE_I32);
+            break;
         }
+        /* fall through */
+    case INDEX_op_qemu_st_a32_i32:
+        tcg_out_qemu_st(s, a0, 0, a1, 0, a2, TCG_TYPE_I32);
         break;
-    case INDEX_op_qemu_st_i64:
+    case INDEX_op_qemu_st_a32_i64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_qemu_st(s, a0, 0, a1, 0, a2, TCG_TYPE_I64);
-        } else if (TARGET_LONG_BITS == 32) {
+        } else {
             tcg_out_qemu_st(s, a0, a1, a2, 0, args[3], TCG_TYPE_I64);
+        }
+        break;
+    case INDEX_op_qemu_st_a64_i64:
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_st(s, a0, 0, a1, 0, a2, TCG_TYPE_I64);
         } else {
             tcg_out_qemu_st(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
         }
@@ -2142,19 +2157,22 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_brcond2_i32:
         return C_O0_I4(rZ, rZ, rZ, rZ);
 
-    case INDEX_op_qemu_ld_i32:
-        return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O1_I1(r, r) : C_O1_I2(r, r, r));
-    case INDEX_op_qemu_st_i32:
-        return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O0_I2(rZ, r) : C_O0_I3(rZ, r, r));
-    case INDEX_op_qemu_ld_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r)
-                : TARGET_LONG_BITS == 32 ? C_O2_I1(r, r, r)
-                : C_O2_I2(r, r, r, r));
-    case INDEX_op_qemu_st_i64:
+    case INDEX_op_qemu_ld_a32_i32:
+        return C_O1_I1(r, r);
+    case INDEX_op_qemu_ld_a64_i32:
+        return TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r) : C_O1_I2(r, r, r);
+    case INDEX_op_qemu_st_a32_i32:
+        return C_O0_I2(rZ, r);
+    case INDEX_op_qemu_st_a64_i32:
+        return TCG_TARGET_REG_BITS == 64 ? C_O0_I2(rZ, r) : C_O0_I3(rZ, r, r);
+    case INDEX_op_qemu_ld_a32_i64:
+        return TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r) : C_O2_I1(r, r, r);
+    case INDEX_op_qemu_ld_a64_i64:
+        return TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r) : C_O2_I2(r, r, r, r);
+    case INDEX_op_qemu_st_a32_i64:
+        return TCG_TARGET_REG_BITS == 64 ? C_O0_I2(rZ, r) : C_O0_I3(rZ, rZ, r);
+    case INDEX_op_qemu_st_a64_i64:
         return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(rZ, r)
-                : TARGET_LONG_BITS == 32 ? C_O0_I3(rZ, rZ, r)
                 : C_O0_I4(rZ, rZ, r, r));
 
     default:
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 682743a466..6bda1358ef 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2947,54 +2947,70 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out32(s, MODUD | TAB(args[0], args[1], args[2]));
         break;
 
-    case INDEX_op_qemu_ld_i32:
-        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
-            tcg_out_qemu_ld(s, args[0], -1, args[1], -1,
-                            args[2], TCG_TYPE_I32);
-        } else {
+    case INDEX_op_qemu_ld_a64_i32:
+        if (TCG_TARGET_REG_BITS == 32) {
             tcg_out_qemu_ld(s, args[0], -1, args[1], args[2],
                             args[3], TCG_TYPE_I32);
+            break;
         }
+        /* fall through */
+    case INDEX_op_qemu_ld_a32_i32:
+        tcg_out_qemu_ld(s, args[0], -1, args[1], -1, args[2], TCG_TYPE_I32);
         break;
-    case INDEX_op_qemu_ld_i64:
+    case INDEX_op_qemu_ld_a32_i64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_qemu_ld(s, args[0], -1, args[1], -1,
                             args[2], TCG_TYPE_I64);
-        } else if (TARGET_LONG_BITS == 32) {
+        } else {
             tcg_out_qemu_ld(s, args[0], args[1], args[2], -1,
                             args[3], TCG_TYPE_I64);
+        }
+        break;
+    case INDEX_op_qemu_ld_a64_i64:
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_ld(s, args[0], -1, args[1], -1,
+                            args[2], TCG_TYPE_I64);
         } else {
             tcg_out_qemu_ld(s, args[0], args[1], args[2], args[3],
                             args[4], TCG_TYPE_I64);
         }
         break;
-    case INDEX_op_qemu_ld_i128:
+    case INDEX_op_qemu_ld_a32_i128:
+    case INDEX_op_qemu_ld_a64_i128:
         tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
         tcg_out_qemu_ld128(s, args[0], args[1], args[2], args[3]);
         break;
 
-    case INDEX_op_qemu_st_i32:
-        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
-            tcg_out_qemu_st(s, args[0], -1, args[1], -1,
-                            args[2], TCG_TYPE_I32);
-        } else {
+    case INDEX_op_qemu_st_a64_i32:
+        if (TCG_TARGET_REG_BITS == 32) {
             tcg_out_qemu_st(s, args[0], -1, args[1], args[2],
                             args[3], TCG_TYPE_I32);
+            break;
         }
+        /* fall through */
+    case INDEX_op_qemu_st_a32_i32:
+        tcg_out_qemu_st(s, args[0], -1, args[1], -1, args[2], TCG_TYPE_I32);
         break;
-    case INDEX_op_qemu_st_i64:
+    case INDEX_op_qemu_st_a32_i64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_qemu_st(s, args[0], -1, args[1], -1,
                             args[2], TCG_TYPE_I64);
-        } else if (TARGET_LONG_BITS == 32) {
+        } else {
             tcg_out_qemu_st(s, args[0], args[1], args[2], -1,
                             args[3], TCG_TYPE_I64);
+        }
+        break;
+    case INDEX_op_qemu_st_a64_i64:
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_st(s, args[0], -1, args[1], -1,
+                            args[2], TCG_TYPE_I64);
         } else {
             tcg_out_qemu_st(s, args[0], args[1], args[2], args[3],
                             args[4], TCG_TYPE_I64);
         }
         break;
-    case INDEX_op_qemu_st_i128:
+    case INDEX_op_qemu_st_a32_i128:
+    case INDEX_op_qemu_st_a64_i128:
         tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
         tcg_out_qemu_st128(s, args[0], args[1], args[2], args[3]);
         break;
@@ -3813,29 +3829,28 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_sub2_i32:
         return C_O2_I4(r, r, rI, rZM, r, r);
 
-    case INDEX_op_qemu_ld_i32:
-        return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O1_I1(r, r)
-                : C_O1_I2(r, r, r));
-
-    case INDEX_op_qemu_st_i32:
-        return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O0_I2(r, r)
-                : C_O0_I3(r, r, r));
-
-    case INDEX_op_qemu_ld_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r)
-                : TARGET_LONG_BITS == 32 ? C_O2_I1(r, r, r)
-                : C_O2_I2(r, r, r, r));
-
-    case INDEX_op_qemu_st_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(r, r)
-                : TARGET_LONG_BITS == 32 ? C_O0_I3(r, r, r)
-                : C_O0_I4(r, r, r, r));
-
-    case INDEX_op_qemu_ld_i128:
+    case INDEX_op_qemu_ld_a32_i32:
+        return C_O1_I1(r, r);
+    case INDEX_op_qemu_ld_a64_i32:
+        return TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r) : C_O1_I2(r, r, r);
+    case INDEX_op_qemu_ld_a32_i64:
+        return TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r) : C_O2_I1(r, r, r);
+    case INDEX_op_qemu_ld_a64_i64:
+        return TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r) : C_O2_I2(r, r, r, r);
+    case INDEX_op_qemu_ld_a32_i128:
+    case INDEX_op_qemu_ld_a64_i128:
         return C_O2_I1(o, m, r);
-    case INDEX_op_qemu_st_i128:
+
+    case INDEX_op_qemu_st_a32_i32:
+        return C_O0_I2(r, r);
+    case INDEX_op_qemu_st_a64_i32:
+        return TCG_TARGET_REG_BITS == 64 ? C_O0_I2(r, r) : C_O0_I3(r, r, r);
+    case INDEX_op_qemu_st_a32_i64:
+        return TCG_TARGET_REG_BITS == 64 ? C_O0_I2(r, r) : C_O0_I3(r, r, r);
+    case INDEX_op_qemu_st_a64_i64:
+        return TCG_TARGET_REG_BITS == 64 ? C_O0_I2(r, r) : C_O0_I4(r, r, r, r);
+    case INDEX_op_qemu_st_a32_i128:
+    case INDEX_op_qemu_st_a64_i128:
         return C_O0_I3(o, m, r);
 
     case INDEX_op_add_vec:
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 4dd33c73e8..16e35ea6a6 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1383,16 +1383,20 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_setcond(s, args[3], a0, a1, a2);
         break;
 
-    case INDEX_op_qemu_ld_i32:
+    case INDEX_op_qemu_ld_a32_i32:
+    case INDEX_op_qemu_ld_a64_i32:
         tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I32);
         break;
-    case INDEX_op_qemu_ld_i64:
+    case INDEX_op_qemu_ld_a32_i64:
+    case INDEX_op_qemu_ld_a64_i64:
         tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I64);
         break;
-    case INDEX_op_qemu_st_i32:
+    case INDEX_op_qemu_st_a32_i32:
+    case INDEX_op_qemu_st_a64_i32:
         tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I32);
         break;
-    case INDEX_op_qemu_st_i64:
+    case INDEX_op_qemu_st_a32_i64:
+    case INDEX_op_qemu_st_a64_i64:
         tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I64);
         break;
 
@@ -1534,11 +1538,15 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_sub2_i64:
         return C_O2_I4(r, r, rZ, rZ, rM, rM);
 
-    case INDEX_op_qemu_ld_i32:
-    case INDEX_op_qemu_ld_i64:
+    case INDEX_op_qemu_ld_a32_i32:
+    case INDEX_op_qemu_ld_a64_i32:
+    case INDEX_op_qemu_ld_a32_i64:
+    case INDEX_op_qemu_ld_a64_i64:
         return C_O1_I1(r, r);
-    case INDEX_op_qemu_st_i32:
-    case INDEX_op_qemu_st_i64:
+    case INDEX_op_qemu_st_a32_i32:
+    case INDEX_op_qemu_st_a64_i32:
+    case INDEX_op_qemu_st_a32_i64:
+    case INDEX_op_qemu_st_a64_i64:
         return C_O0_I2(rZ, r);
 
     default:
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 91fecfc51b..000c2f66db 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2301,22 +2301,28 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
                      args[2], const_args[2], args[3], const_args[3], args[4]);
         break;
 
-    case INDEX_op_qemu_ld_i32:
+    case INDEX_op_qemu_ld_a32_i32:
+    case INDEX_op_qemu_ld_a64_i32:
         tcg_out_qemu_ld(s, args[0], args[1], args[2], TCG_TYPE_I32);
         break;
-    case INDEX_op_qemu_ld_i64:
+    case INDEX_op_qemu_ld_a32_i64:
+    case INDEX_op_qemu_ld_a64_i64:
         tcg_out_qemu_ld(s, args[0], args[1], args[2], TCG_TYPE_I64);
         break;
-    case INDEX_op_qemu_st_i32:
+    case INDEX_op_qemu_st_a32_i32:
+    case INDEX_op_qemu_st_a64_i32:
         tcg_out_qemu_st(s, args[0], args[1], args[2], TCG_TYPE_I32);
         break;
-    case INDEX_op_qemu_st_i64:
+    case INDEX_op_qemu_st_a32_i64:
+    case INDEX_op_qemu_st_a64_i64:
         tcg_out_qemu_st(s, args[0], args[1], args[2], TCG_TYPE_I64);
         break;
-    case INDEX_op_qemu_ld_i128:
+    case INDEX_op_qemu_ld_a32_i128:
+    case INDEX_op_qemu_ld_a64_i128:
         tcg_out_qemu_ldst_i128(s, args[0], args[1], args[2], args[3], true);
         break;
-    case INDEX_op_qemu_st_i128:
+    case INDEX_op_qemu_st_a32_i128:
+    case INDEX_op_qemu_st_a64_i128:
         tcg_out_qemu_ldst_i128(s, args[0], args[1], args[2], args[3], false);
         break;
 
@@ -3190,15 +3196,21 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ctpop_i64:
         return C_O1_I1(r, r);
 
-    case INDEX_op_qemu_ld_i32:
-    case INDEX_op_qemu_ld_i64:
+    case INDEX_op_qemu_ld_a32_i32:
+    case INDEX_op_qemu_ld_a64_i32:
+    case INDEX_op_qemu_ld_a32_i64:
+    case INDEX_op_qemu_ld_a64_i64:
         return C_O1_I1(r, r);
-    case INDEX_op_qemu_st_i64:
-    case INDEX_op_qemu_st_i32:
+    case INDEX_op_qemu_st_a32_i64:
+    case INDEX_op_qemu_st_a64_i64:
+    case INDEX_op_qemu_st_a32_i32:
+    case INDEX_op_qemu_st_a64_i32:
         return C_O0_I2(r, r);
-    case INDEX_op_qemu_ld_i128:
+    case INDEX_op_qemu_ld_a32_i128:
+    case INDEX_op_qemu_ld_a64_i128:
         return C_O2_I1(o, m, r);
-    case INDEX_op_qemu_st_i128:
+    case INDEX_op_qemu_st_a32_i128:
+    case INDEX_op_qemu_st_a64_i128:
         return C_O0_I3(o, m, r);
 
     case INDEX_op_deposit_i32:
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 4f9ec02b1f..79ca667559 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1375,16 +1375,20 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_arithi(s, a1, a0, 32, SHIFT_SRLX);
         break;
 
-    case INDEX_op_qemu_ld_i32:
+    case INDEX_op_qemu_ld_a32_i32:
+    case INDEX_op_qemu_ld_a64_i32:
         tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I32);
         break;
-    case INDEX_op_qemu_ld_i64:
+    case INDEX_op_qemu_ld_a32_i64:
+    case INDEX_op_qemu_ld_a64_i64:
         tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I64);
         break;
-    case INDEX_op_qemu_st_i32:
+    case INDEX_op_qemu_st_a32_i32:
+    case INDEX_op_qemu_st_a64_i32:
         tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I32);
         break;
-    case INDEX_op_qemu_st_i64:
+    case INDEX_op_qemu_st_a32_i64:
+    case INDEX_op_qemu_st_a64_i64:
         tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I64);
         break;
 
@@ -1506,8 +1510,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_extu_i32_i64:
     case INDEX_op_extrl_i64_i32:
     case INDEX_op_extrh_i64_i32:
-    case INDEX_op_qemu_ld_i32:
-    case INDEX_op_qemu_ld_i64:
+    case INDEX_op_qemu_ld_a32_i32:
+    case INDEX_op_qemu_ld_a64_i32:
+    case INDEX_op_qemu_ld_a32_i64:
+    case INDEX_op_qemu_ld_a64_i64:
         return C_O1_I1(r, r);
 
     case INDEX_op_st8_i32:
@@ -1517,8 +1523,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_st_i32:
     case INDEX_op_st32_i64:
     case INDEX_op_st_i64:
-    case INDEX_op_qemu_st_i32:
-    case INDEX_op_qemu_st_i64:
+    case INDEX_op_qemu_st_a32_i32:
+    case INDEX_op_qemu_st_a64_i32:
+    case INDEX_op_qemu_st_a32_i64:
+    case INDEX_op_qemu_st_a64_i64:
         return C_O0_I2(rZ, r);
 
     case INDEX_op_add_i32:
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 89f693050c..b9d1f492b3 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -156,22 +156,22 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_setcond2_i32:
         return C_O1_I4(r, r, r, r, r);
 
-    case INDEX_op_qemu_ld_i32:
-        return (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
-                ? C_O1_I1(r, r)
-                : C_O1_I2(r, r, r));
-    case INDEX_op_qemu_ld_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r)
-                : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? C_O2_I1(r, r, r)
-                : C_O2_I2(r, r, r, r));
-    case INDEX_op_qemu_st_i32:
-        return (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
-                ? C_O0_I2(r, r)
-                : C_O0_I3(r, r, r));
-    case INDEX_op_qemu_st_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(r, r)
-                : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? C_O0_I3(r, r, r)
-                : C_O0_I4(r, r, r, r));
+    case INDEX_op_qemu_ld_a32_i32:
+        return C_O1_I1(r, r);
+    case INDEX_op_qemu_ld_a64_i32:
+        return TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r) : C_O1_I2(r, r, r);
+    case INDEX_op_qemu_ld_a32_i64:
+        return TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r) : C_O2_I1(r, r, r);
+    case INDEX_op_qemu_ld_a64_i64:
+        return TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r) : C_O2_I2(r, r, r, r);
+    case INDEX_op_qemu_st_a32_i32:
+        return C_O0_I2(r, r);
+    case INDEX_op_qemu_st_a64_i32:
+        return TCG_TARGET_REG_BITS == 64 ? C_O0_I2(r, r) : C_O0_I3(r, r, r);
+    case INDEX_op_qemu_st_a32_i64:
+        return TCG_TARGET_REG_BITS == 64 ? C_O0_I2(r, r) : C_O0_I3(r, r, r);
+    case INDEX_op_qemu_st_a64_i64:
+        return TCG_TARGET_REG_BITS == 64 ? C_O0_I2(r, r) : C_O0_I4(r, r, r, r);
 
     default:
         g_assert_not_reached();
@@ -850,8 +850,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_op_rrrr(s, opc, args[0], args[1], args[2], args[3]);
         break;
 
-    case INDEX_op_qemu_ld_i32:
-    case INDEX_op_qemu_st_i32:
+    case INDEX_op_qemu_ld_a32_i32:
+    case INDEX_op_qemu_ld_a64_i32:
+    case INDEX_op_qemu_st_a32_i32:
+    case INDEX_op_qemu_st_a64_i32:
         if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
             tcg_out_op_rrm(s, opc, args[0], args[1], args[2]);
         } else {
@@ -859,8 +861,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
-    case INDEX_op_qemu_ld_i64:
-    case INDEX_op_qemu_st_i64:
+    case INDEX_op_qemu_ld_a32_i64:
+    case INDEX_op_qemu_ld_a64_i64:
+    case INDEX_op_qemu_st_a32_i64:
+    case INDEX_op_qemu_st_a64_i64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_op_rrm(s, opc, args[0], args[1], args[2]);
         } else if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
-- 
2.34.1


