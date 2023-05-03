Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18496F5220
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:45:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6rW-0005oI-Ng; Wed, 03 May 2023 03:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qH-0002QD-Tb
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:24:01 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qE-0001lB-WE
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:24:01 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f1950f5628so46333055e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098637; x=1685690637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gdz4HmC+GKna2rGIQTlEZxrDC8e6GeaP4aVBJCKCHO0=;
 b=lC2Q/d6XORm/JIDFS4nACxA/pfoxobTQ6jZT/ji1FAICZKkhP6dkMJFlUrz4Viheuc
 aWDX1gn12QEBZFeV0cwYElhmVJlc7fBGCv0d5orSK/oXNnh6l4TeoVuHWsWSrKWdoNME
 aj/xrBb7sacgN7khKbgvy398Fm2vEs6eFd1woc1i3OgsVaRCjNCXzjD/Cv/wzOgdyp7M
 7URUlzqPWwhYzLBtqxwxzbLkuJJysUkmT4SA2RIUccLsU6LVS8XfniYErtcJkzqVzZT6
 Z+K/IuKVj6epVLRO9egtrrAYRpHQSLiHqB5RMK6Lk44VwXSD3UTbNgv4QZiDOL9HWgDC
 kgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098637; x=1685690637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gdz4HmC+GKna2rGIQTlEZxrDC8e6GeaP4aVBJCKCHO0=;
 b=MjryoVWQlqOoH1h3ijREB/HZDK+/J3eOU/+TcqBQsLpywmpycSZ9uLdoHW2kL/XxD+
 vG9Z43PvmdMU16rtTTq4fYUM4keeTgZt/SbLhpt9kM054q4Oo0IZXGHUf/bKPFQbq2Vk
 mKjtCS8u5WGyAvce9u3ILao1wZShRvK3auLco8XTqwwYRlLq8rhMickYDaIHuh/7Y9ff
 lqvkux1gxOu7v/SENRGJWFJEsYt3nDVfuK4mpo+r4wdmFxLwSZimcf/yfxF9uZeeHBeb
 TI/4Y7wmPwBnrSF8KIc1lbwd6iVUXCeqkNtDTrioqGNthBPEFhmeanIyrhlrF3PUqAvO
 akIg==
X-Gm-Message-State: AC+VfDxTooXKgcCF/drYvutUCBaIsuSHGAm5DU9VQ+m+6u4DZL+obiow
 fsdHzaRYYXcS7UqKsf39rfRuYl+/2J7BRE7/5tldZg==
X-Google-Smtp-Source: ACHHUZ6PPQJPfzCHc1wXvQ0JnWjRi1RjmkXLIgmo65F1RualRYfgofhbjFSwlv5jzVXqjOBqQo4z3A==
X-Received: by 2002:a1c:6a14:0:b0:3f1:7324:c81d with SMTP id
 f20-20020a1c6a14000000b003f17324c81dmr15063516wmc.14.1683098637120; 
 Wed, 03 May 2023 00:23:57 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 31/84] tcg: Add page_bits and page_mask to TCGContext
Date: Wed,  3 May 2023 08:22:38 +0100
Message-Id: <20230503072331.1747057-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
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

Disconnect guest page size from TCG compilation.
While this could be done via exec/target_page.h, we want to cache
the value across multiple memory access operations, so we might
as well initialize this early.

The changes within tcg/ are entirely mechanical:

    sed -i s/TARGET_PAGE_BITS/s->page_bits/g
    sed -i s/TARGET_PAGE_MASK/s->page_mask/g

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h                |  5 +++++
 accel/tcg/translate-all.c        |  4 ++++
 tcg/aarch64/tcg-target.c.inc     |  6 +++---
 tcg/arm/tcg-target.c.inc         | 10 +++++-----
 tcg/i386/tcg-target.c.inc        |  6 +++---
 tcg/loongarch64/tcg-target.c.inc |  4 ++--
 tcg/mips/tcg-target.c.inc        |  6 +++---
 tcg/ppc/tcg-target.c.inc         | 14 +++++++-------
 tcg/riscv/tcg-target.c.inc       |  4 ++--
 tcg/s390x/tcg-target.c.inc       |  4 ++--
 tcg/sparc64/tcg-target.c.inc     |  4 ++--
 11 files changed, 38 insertions(+), 29 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 4e55efe0cf..c507b0d653 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -553,6 +553,11 @@ struct TCGContext {
     int nb_ops;
     TCGType addr_type;            /* TCG_TYPE_I32 or TCG_TYPE_I64 */
 
+#ifdef CONFIG_SOFTMMU
+    int page_mask;
+    uint8_t page_bits;
+#endif
+
     TCGRegSet reserved_regs;
     intptr_t current_frame_offset;
     intptr_t frame_start;
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ac27487106..12d7febfee 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -357,6 +357,10 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tb_set_page_addr1(tb, -1);
     tcg_ctx->gen_tb = tb;
     tcg_ctx->addr_type = TARGET_LONG_BITS == 32 ? TCG_TYPE_I32 : TCG_TYPE_I64;
+#ifdef CONFIG_SOFTMMU
+    tcg_ctx->page_bits = TARGET_PAGE_BITS;
+    tcg_ctx->page_mask = TARGET_PAGE_MASK;
+#endif
 
  tb_overflow:
 
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index c68d863c50..3819d15563 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1687,7 +1687,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     ldst->oi = oi;
     ldst->addrlo_reg = addr_reg;
 
-    mask_type = (TARGET_PAGE_BITS + CPU_TLB_DYN_MAX_BITS > 32
+    mask_type = (s->page_bits + CPU_TLB_DYN_MAX_BITS > 32
                  ? TCG_TYPE_I64 : TCG_TYPE_I32);
 
     /* Load env_tlb(env)->f[mmu_idx].{mask,table} into {x0,x1}.  */
@@ -1701,7 +1701,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     /* Extract the TLB index from the address into X0.  */
     tcg_out_insn(s, 3502S, AND_LSR, mask_type == TCG_TYPE_I64,
                  TCG_REG_X0, TCG_REG_X0, addr_reg,
-                 TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+                 s->page_bits - CPU_TLB_ENTRY_BITS);
 
     /* Add the tlb_table pointer, creating the CPUTLBEntry address into X1.  */
     tcg_out_insn(s, 3502, ADD, 1, TCG_REG_X1, TCG_REG_X1, TCG_REG_X0);
@@ -1725,7 +1725,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
                      TCG_REG_X3, addr_reg, s_mask - a_mask);
         x3 = TCG_REG_X3;
     }
-    compare_mask = (uint64_t)TARGET_PAGE_MASK | a_mask;
+    compare_mask = (uint64_t)s->page_mask | a_mask;
 
     /* Store the page mask part of the address into X3.  */
     tcg_out_logicali(s, I3404_ANDI, addr_type, TCG_REG_X3, x3, compare_mask);
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 3bbb846b76..b6e3a4c902 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1411,7 +1411,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 
     /* Extract the tlb index from the address into R0.  */
     tcg_out_dat_reg(s, COND_AL, ARITH_AND, TCG_REG_R0, TCG_REG_R0, addrlo,
-                    SHIFT_IMM_LSR(TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS));
+                    SHIFT_IMM_LSR(s->page_bits - CPU_TLB_ENTRY_BITS));
 
     /*
      * Add the tlb_table pointer, creating the CPUTLBEntry address in R1.
@@ -1455,8 +1455,8 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         tcg_out_dat_imm(s, COND_AL, ARITH_ADD, t_addr,
                         addrlo, s_mask - a_mask);
     }
-    if (use_armv7_instructions && TARGET_PAGE_BITS <= 16) {
-        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, ~(TARGET_PAGE_MASK | a_mask));
+    if (use_armv7_instructions && s->page_bits <= 16) {
+        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, ~(s->page_mask | a_mask));
         tcg_out_dat_reg(s, COND_AL, ARITH_BIC, TCG_REG_TMP,
                         t_addr, TCG_REG_TMP, 0);
         tcg_out_dat_reg(s, COND_AL, ARITH_CMP, 0, TCG_REG_R2, TCG_REG_TMP, 0);
@@ -1466,10 +1466,10 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
             tcg_out_dat_imm(s, COND_AL, ARITH_TST, 0, addrlo, a_mask);
         }
         tcg_out_dat_reg(s, COND_AL, ARITH_MOV, TCG_REG_TMP, 0, t_addr,
-                        SHIFT_IMM_LSR(TARGET_PAGE_BITS));
+                        SHIFT_IMM_LSR(s->page_bits));
         tcg_out_dat_reg(s, (a_mask ? COND_EQ : COND_AL), ARITH_CMP,
                         0, TCG_REG_R2, TCG_REG_TMP,
-                        SHIFT_IMM_LSL(TARGET_PAGE_BITS));
+                        SHIFT_IMM_LSL(s->page_bits));
     }
 
     if (s->addr_type != TCG_TYPE_I32) {
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 1a01520983..5f1c23b2a5 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1975,7 +1975,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         trexw = (ttype == TCG_TYPE_I32 ? 0 : P_REXW);
         if (TCG_TYPE_PTR == TCG_TYPE_I64) {
             hrexw = P_REXW;
-            if (TARGET_PAGE_BITS + CPU_TLB_DYN_MAX_BITS > 32) {
+            if (s->page_bits + CPU_TLB_DYN_MAX_BITS > 32) {
                 tlbtype = TCG_TYPE_I64;
                 tlbrexw = P_REXW;
             }
@@ -1984,7 +1984,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 
     tcg_out_mov(s, tlbtype, TCG_REG_L0, addrlo);
     tcg_out_shifti(s, SHIFT_SHR + tlbrexw, TCG_REG_L0,
-                   TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+                   s->page_bits - CPU_TLB_ENTRY_BITS);
 
     tcg_out_modrm_offset(s, OPC_AND_GvEv + trexw, TCG_REG_L0, TCG_AREG0,
                          TLB_MASK_TABLE_OFS(mem_index) +
@@ -2005,7 +2005,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         tcg_out_modrm_offset(s, OPC_LEA + trexw, TCG_REG_L1,
                              addrlo, s_mask - a_mask);
     }
-    tlb_mask = TARGET_PAGE_MASK | a_mask;
+    tlb_mask = s->page_mask | a_mask;
     tgen_arithi(s, ARITH_AND + trexw, TCG_REG_L1, tlb_mask, 0);
 
     /* cmp 0(TCG_REG_L0), TCG_REG_L1 */
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 2e2428bc30..04d1e0f24d 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -872,7 +872,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_AREG0, table_ofs);
 
     tcg_out_opc_srli_d(s, TCG_REG_TMP2, addr_reg,
-                    TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+                    s->page_bits - CPU_TLB_ENTRY_BITS);
     tcg_out_opc_and(s, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP0);
     tcg_out_opc_add_d(s, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP1);
 
@@ -896,7 +896,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         tcg_out_mov(s, addr_type, TCG_REG_TMP1, addr_reg);
     }
     tcg_out_opc_bstrins_d(s, TCG_REG_TMP1, TCG_REG_ZERO,
-                          a_bits, TARGET_PAGE_BITS - 1);
+                          a_bits, s->page_bits - 1);
 
     /* Compare masked address with the TLB entry.  */
     ldst->label_ptr[0] = s->code_ptr;
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index c7cc642a84..836ae58819 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1191,10 +1191,10 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     /* Extract the TLB index from the address into TMP3.  */
     if (TCG_TARGET_REG_BITS == 32 || addr_type == TCG_TYPE_I32) {
         tcg_out_opc_sa(s, OPC_SRL, TCG_TMP3, addrlo,
-                       TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+                       s->page_bits - CPU_TLB_ENTRY_BITS);
     } else {
         tcg_out_dsrl(s, TCG_TMP3, addrlo,
-                     TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+                     s->page_bits - CPU_TLB_ENTRY_BITS);
     }
     tcg_out_opc_reg(s, OPC_AND, TCG_TMP3, TCG_TMP3, TCG_TMP0);
 
@@ -1216,7 +1216,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * For unaligned accesses, compare against the end of the access to
      * verify that it does not cross a page boundary.
      */
-    tcg_out_movi(s, addr_type, TCG_TMP1, TARGET_PAGE_MASK | a_mask);
+    tcg_out_movi(s, addr_type, TCG_TMP1, s->page_mask | a_mask);
     if (a_mask < s_mask) {
         if (TCG_TARGET_REG_BITS == 32 || addr_type == TCG_TYPE_I32) {
             tcg_out_opc_imm(s, OPC_ADDIU, TCG_TMP2, addrlo, s_mask - a_mask);
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 33237368e4..a81241e799 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2100,10 +2100,10 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     /* Extract the page index, shifted into place for tlb index.  */
     if (TCG_TARGET_REG_BITS == 32) {
         tcg_out_shri32(s, TCG_REG_R0, addrlo,
-                       TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+                       s->page_bits - CPU_TLB_ENTRY_BITS);
     } else {
         tcg_out_shri64(s, TCG_REG_R0, addrlo,
-                       TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+                       s->page_bits - CPU_TLB_ENTRY_BITS);
     }
     tcg_out32(s, AND | SAB(TCG_REG_TMP1, TCG_REG_TMP1, TCG_REG_R0));
 
@@ -2135,7 +2135,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     /* Clear the non-page, non-alignment bits from the address in R0. */
     if (TCG_TARGET_REG_BITS == 32) {
         tcg_out_rlw(s, RLWINM, TCG_REG_R0, addrlo, 0,
-                    (32 - a_bits) & 31, 31 - TARGET_PAGE_BITS);
+                    (32 - a_bits) & 31, 31 - s->page_bits);
     } else {
         TCGReg t = addrlo;
 
@@ -2155,13 +2155,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         /* Mask the address for the requested alignment.  */
         if (addr_type == TCG_TYPE_I32) {
             tcg_out_rlw(s, RLWINM, TCG_REG_R0, t, 0,
-                        (32 - a_bits) & 31, 31 - TARGET_PAGE_BITS);
+                        (32 - a_bits) & 31, 31 - s->page_bits);
         } else if (a_bits == 0) {
-            tcg_out_rld(s, RLDICR, TCG_REG_R0, t, 0, 63 - TARGET_PAGE_BITS);
+            tcg_out_rld(s, RLDICR, TCG_REG_R0, t, 0, 63 - s->page_bits);
         } else {
             tcg_out_rld(s, RLDICL, TCG_REG_R0, t,
-                        64 - TARGET_PAGE_BITS, TARGET_PAGE_BITS - a_bits);
-            tcg_out_rld(s, RLDICL, TCG_REG_R0, TCG_REG_R0, TARGET_PAGE_BITS, 0);
+                        64 - s->page_bits, s->page_bits - a_bits);
+            tcg_out_rld(s, RLDICL, TCG_REG_R0, TCG_REG_R0, s->page_bits, 0);
         }
     }
 
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index fdc1faab1b..3f5437fa84 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -939,7 +939,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_AREG0, table_ofs);
 
     tcg_out_opc_imm(s, OPC_SRLI, TCG_REG_TMP2, addr_reg,
-                    TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+                    s->page_bits - CPU_TLB_ENTRY_BITS);
     tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP0);
     tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP1);
 
@@ -954,7 +954,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
         tcg_out_opc_imm(s, addr_type == TCG_TYPE_I32 ? OPC_ADDIW : OPC_ADDI,
                         addr_adj, addr_reg, s_mask - a_mask);
     }
-    compare_mask = TARGET_PAGE_MASK | a_mask;
+    compare_mask = s->page_mask | a_mask;
     if (compare_mask == sextreg(compare_mask, 0, 12)) {
         tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addr_adj, compare_mask);
     } else {
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 77f7919880..4898b01e6a 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1773,7 +1773,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     ldst->addrlo_reg = addr_reg;
 
     tcg_out_sh64(s, RSY_SRLG, TCG_TMP0, addr_reg, TCG_REG_NONE,
-                 TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+                 s->page_bits - CPU_TLB_ENTRY_BITS);
 
     QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
     QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 19));
@@ -1786,7 +1786,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * cross pages using the address of the last byte of the access.
      */
     a_off = (a_mask >= s_mask ? 0 : s_mask - a_mask);
-    tlb_mask = (uint64_t)TARGET_PAGE_MASK | a_mask;
+    tlb_mask = (uint64_t)s->page_mask | a_mask;
     if (a_off == 0) {
         tgen_andi_risbg(s, TCG_REG_R0, addr_reg, tlb_mask);
     } else {
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index ccbf4a179c..e00ecd2cf8 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1058,7 +1058,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 
     /* Extract the page index, shifted into place for tlb index.  */
     tcg_out_arithi(s, TCG_REG_T1, addr_reg,
-                   TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS, SHIFT_SRL);
+                   s->page_bits - CPU_TLB_ENTRY_BITS, SHIFT_SRL);
     tcg_out_arith(s, TCG_REG_T1, TCG_REG_T1, TCG_REG_T2, ARITH_AND);
 
     /* Add the tlb_table pointer, creating the CPUTLBEntry address into R2.  */
@@ -1070,7 +1070,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     h->base = TCG_REG_T1;
 
     /* Mask out the page offset, except for the required alignment. */
-    compare_mask = TARGET_PAGE_MASK | a_mask;
+    compare_mask = s->page_mask | a_mask;
     if (check_fit_tl(compare_mask, 13)) {
         tcg_out_arithi(s, TCG_REG_T3, addr_reg, compare_mask, ARITH_AND);
     } else {
-- 
2.34.1


