Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B3A690057
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 07:26:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ0MC-0000yc-NK; Thu, 09 Feb 2023 01:24:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0MB-0000yL-25
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 01:24:31 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0M7-0007yx-LJ
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 01:24:30 -0500
Received: by mail-pg1-x52a.google.com with SMTP id 7so951082pga.1
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 22:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Jpx55XSl5ZxIppesj8mRIonMpJl9Kp5E0HS//vv/Ps=;
 b=CJVkXhOLgYgzGFyL5IfUUgpDwEeAmesCZ/oOPz7PpUuykh2iMfqubcl+9cZiCVjdHF
 X1HUy98yVFY4CYqb9KUo770P7H9ypT9Yy62ID2TAxYgkAg27iJWUWIxoFWfvFC0237Gr
 39wXYWR1gs+0yHS3FHdJVYevz79LdUGcaX2bki35cJ0pqcXspCrHK/ZjJ/kA7NKDv/Pm
 KKipBGuxC5HmytODtGlqpUeCXLHRuIFbP5kx37cq1RppaX9opqRxdG7lQkEbIKfHWaVv
 Iq3bQjYGuqvi+hLQNmQYqA6opXaCy6z6iamuc+zMygPR7LKi3QLFaIb52nLU0bpKKLyz
 PiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Jpx55XSl5ZxIppesj8mRIonMpJl9Kp5E0HS//vv/Ps=;
 b=pRIcyXdPr8NAon5ZmpZGdi2hcGqWV8zhSxYLBO/7+zSkpD5n5lEunaDR82Y7yS49Us
 nlrpLbhMV11N98PRi7X0y6ZOQnd2GZzxen7Ygj4yF4syo27HwPt7BME8Be5c77whzVzR
 538FtdK0l4Dvr7za9A8rvFYh99scdpr5/1FyHUW2Qn372+4PII8F+bCvfMZTjJrcYd9R
 0+e/2+/nAHHOtyjFbfBiHWaXUWX12XrnUcEOz0h4JTW7UHwVSt/VdfPqibunO+azSLO4
 E61tHtnJG7obGHadQgRdE4nvJUzZjK8OZLlGEYME0yBwLxOa1hGmwDwj9PQ9Cmi+ZsZy
 nmmw==
X-Gm-Message-State: AO0yUKUBgfwCr/788Tav12GP2JCPADPKSrzx89cE5XbROyFrygx3MaOU
 Z1P5hwDcwjY7NwXvKjKqw2Lv9Q==
X-Google-Smtp-Source: AK7set/5zeNrv4L3yx/k4jfB7Xcf9MxbK2H2kZiXzgjS/+wKi39ZkBJcy0JpdeCsmtrISF/KgBo4gg==
X-Received: by 2002:a62:1c58:0:b0:5a8:5101:d667 with SMTP id
 c85-20020a621c58000000b005a85101d667mr2141542pfc.22.1675923866000; 
 Wed, 08 Feb 2023 22:24:26 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7800e000000b00571cdbd0771sm521919pfi.102.2023.02.08.22.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 22:24:25 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v1 RFC Zisslpcfi 8/9] target/riscv: Instructions encodings,
 implementation and handlers
Date: Wed,  8 Feb 2023 22:24:03 -0800
Message-Id: <20230209062404.3582018-9-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209062404.3582018-1-debug@rivosinc.com>
References: <20230209062404.3582018-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=debug@rivosinc.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This patch implements instruction encodings for zisslpcfi instructions.
Additionally this patch implements zimops encodings as well. If Zisslpcfi
is supported by CPU but not enabled then all Zisslpcfi instructions
default to Zimops instuction behavior i.e. mov 0 to rd.

zisslpcfi defines following instructions.
- Backward control flow
    - sspush x1/x5 : Decrement shadow stack pointer and pushes x1 or x5
                     on shadow stack.
    - sspop x1/x5 : Pops from shadow stack into x1 or x5. Increments
                    shadow stack pointer.
    - ssprr : Reads current shadow stack pointer into a destination
              register.
    - sscheckra : Compares x1 with x5. Raises illegal instr fault if
                x1 != x5
    - ssamoswap : Atomically swaps value on top of shadow stack

- Forward control flow
    - lpsll, lpsml, lpsul : sets lower (9bit), mid (8bit) and upper
                            (8bit) label values in CSR_ULLP respectively.
    - lpcll, lpcml, lpcul : checks lower (9bit), mid (8bit) and upper
                            (8bit) label values with CSR_ULLP
                            respectively.
    Check label instructions raise illegal instruction fault when labels
    mismatch.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Kip Walker  <kip@rivosinc.com>
---
 target/riscv/cpu_bits.h                       |  10 +
 target/riscv/helper.h                         |   7 +
 target/riscv/insn32.decode                    |  29 ++
 target/riscv/insn_trans/trans_rvi.c.inc       |  14 +
 target/riscv/insn_trans/trans_zimops.c.inc    |  53 +++
 target/riscv/insn_trans/trans_zisslpcfi.c.inc | 310 ++++++++++++++++++
 target/riscv/op_helper.c                      |  67 ++++
 target/riscv/translate.c                      |   2 +
 8 files changed, 492 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_zimops.c.inc
 create mode 100644 target/riscv/insn_trans/trans_zisslpcfi.c.inc

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 37100ec8f6..b2d527c626 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -600,6 +600,16 @@ typedef enum {
     LP_EXPECTED = 1,
 } cfi_elp;
 
+#define LPLR_UL            (((1 << 8) - 1) << 17)
+#define LPLR_ML            (((1 << 8) - 1) << 9)
+#define LPLR_LL            ((1 << 9) - 1)
+
+typedef enum {
+    FCFI_LPLL = 0,
+    FCFI_ML = 1,
+    FCFI_UL = 2,
+} cfi_label_inst;
+
 /* hstatus CSR bits */
 #define HSTATUS_VSBE         0x00000020
 #define HSTATUS_GVA          0x00000040
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 227c7122ef..6484415612 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -97,6 +97,11 @@ DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fclass_h, TCG_CALL_NO_RWG_SE, tl, env, i64)
 
+/* Forward CFI label checking */
+DEF_HELPER_2(cfi_jalr, void, env, int)
+DEF_HELPER_3(cfi_check_landing_pad, void, env, int, int)
+DEF_HELPER_3(cfi_set_landing_pad, void, env, int, int)
+
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
 DEF_HELPER_3(csrw, void, env, int, tl)
@@ -112,6 +117,8 @@ DEF_HELPER_1(tlb_flush, void, env)
 /* Native Debug */
 DEF_HELPER_1(itrigger_match, void, env)
 #endif
+/* helper for back cfi mismatch */
+DEF_HELPER_1(sschkra_mismatch, void, env)
 
 /* Hypervisor functions */
 #ifndef CONFIG_USER_ONLY
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b7e7613ea2..cd734f03ae 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -37,6 +37,8 @@
 %imm_u    12:s20                 !function=ex_shift_12
 %imm_bs   30:2                   !function=ex_shift_3
 %imm_rnum 20:4
+%imm_cfi9  15:9
+%imm_cfi8  15:8
 
 # Argument sets:
 &empty
@@ -163,6 +165,33 @@ csrrwi   ............     ..... 101 ..... 1110011 @csr
 csrrsi   ............     ..... 110 ..... 1110011 @csr
 csrrci   ............     ..... 111 ..... 1110011 @csr
 
+# zimops (unpriv integer may be operations) instructions with system opcode
+# These're superset of for cfi encodings. zimops_r and zimops_rr should be last
+# entry in below overlapping patterns so that it acts as final sink for overlapping patterns.
+# Any new encoding that can be used should be placed above mop.r and mop.rr
+
+# cfi instructions carved out of mop.r
+{
+  sspush    100000 0 11100     ..... 100 00000 1110011 %rs1
+  sspop     100000 0 11100     00000 100 ..... 1110011 %rd
+  ssprr     100000 0 11101     00000 100 ..... 1110011 %rd
+  zimops_r  1-00-- 0 111--     ----- 100 ..... 1110011 %rd
+}
+
+# cfi instructions carved out of mop.rr
+{
+  sschckra  100010 1 00001     00101 100 00000 1110011
+  ssamoswap 100000 1 .....     ..... 100 ..... 1110011 @r
+
+  lpsll     100000 1 0 .........    100 00000 1110011 %imm_cfi9
+  lpcll     100000 1 1 .........    100 00000 1110011 %imm_cfi9
+  lpsml     100001 1 0 0........    100 00000 1110011 %imm_cfi8
+  lpcml     100001 1 0 1........    100 00000 1110011 %imm_cfi8
+  lpsul     100010 1 1 0........    100 00000 1110011 %imm_cfi8
+  lpcul     100010 1 1 1........    100 00000 1110011 %imm_cfi8
+  zimops_rr 1-00-- 1 - ---------    100 ..... 1110011 %rd
+}
+
 # *** RV64I Base Instruction Set (in addition to RV32I) ***
 lwu      ............   ..... 110 ..... 0000011 @i
 ld       ............   ..... 011 ..... 0000011 @i
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 5c69b88d1e..4a4f1ca778 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -66,6 +66,20 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     }
 
     gen_set_gpri(ctx, a->rd, ctx->pc_succ_insn);
+
+    if (ctx->cfg_ptr->ext_cfi) {
+        /*
+         * Rely on a helper to check the forward CFI enable for the
+         * current process mode. The alternatives would be (1) include
+         * "fcfi enabled" in the cflags or (2) maintain a "fcfi
+         * currently enabled" in cpu_env and emit TCG code to access
+         * and test it.
+         */
+        if (a->rd == xRA || a->rd == xT0 || (a->rs1 != xRA && a->rs1 != xT0)) {
+            gen_helper_cfi_jalr(cpu_env, tcg_constant_i32(LP_EXPECTED));
+        }
+    }
+
     lookup_and_goto_ptr(ctx);
 
     if (misaligned) {
diff --git a/target/riscv/insn_trans/trans_zimops.c.inc b/target/riscv/insn_trans/trans_zimops.c.inc
new file mode 100644
index 0000000000..51748637b9
--- /dev/null
+++ b/target/riscv/insn_trans/trans_zimops.c.inc
@@ -0,0 +1,53 @@
+/*
+ * RISC-V translation routines for the Control-Flow Integrity Extension
+ *
+ * Copyright (c) 2022-2023 Rivos Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+ static bool trans_zimops_r(DisasContext *ctx, arg_zimops_r * a)
+ {
+      /* zimops not implemented, raise illegal instruction & return true */
+      if (!ctx->cfg_ptr->ext_zimops) {
+            gen_exception_illegal(ctx);
+            return true;
+      }
+
+      /*
+       * zimops implemented, simply grab destination and mov zero.
+       * return true
+       */
+      TCGv dest = dest_gpr(ctx, a->rd);
+      dest = tcg_const_tl(0);
+      gen_set_gpr(ctx, a->rd, dest);
+      return true;
+ }
+
+ static bool trans_zimops_rr(DisasContext *ctx, arg_zimops_rr * a)
+ {
+      /* zimops not implemented, raise illegal instruction & return true */
+      if (!ctx->cfg_ptr->ext_zimops) {
+            gen_exception_illegal(ctx);
+            return true;
+      }
+
+      /*
+       * zimops implemented, simply grab destination and mov zero.
+       * return true
+       */
+      TCGv dest = dest_gpr(ctx, a->rd);
+      dest = tcg_const_tl(0);
+      gen_set_gpr(ctx, a->rd, dest);
+      return true;
+ }
diff --git a/target/riscv/insn_trans/trans_zisslpcfi.c.inc b/target/riscv/insn_trans/trans_zisslpcfi.c.inc
new file mode 100644
index 0000000000..fe27bb73f6
--- /dev/null
+++ b/target/riscv/insn_trans/trans_zisslpcfi.c.inc
@@ -0,0 +1,310 @@
+/*
+ * RISC-V translation routines for the Control-Flow Integrity Extension
+ *
+ * Copyright (c) 2022-2023 Rivos Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+static MemOp mxl_memop(DisasContext *ctx)
+{
+    switch (get_xl(ctx)) {
+    case MXL_RV32:
+        return MO_TEUL;
+
+    case MXL_RV64:
+        return MO_TEUQ;
+
+    case MXL_RV128:
+        return MO_TEUO;
+
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static bool trans_sspop(DisasContext *ctx, arg_sspop *a)
+{
+    /* cfi only supported on 32bit and 64bit */
+    if (get_xl(ctx) != MXL_RV32 && get_xl(ctx) != MXL_RV64) {
+        return false;
+    }
+
+    /* back cfi not enabled, should go to trans_zimops. return false */
+    if (!ctx->bcfi_enabled) {
+        return false;
+    }
+
+    /* sspop can only load into x1 or x5. Everything else defaults to zimops */
+    if (a->rd != 1 && a->rd != 5) {
+        return false;
+    }
+
+    /*
+     * get data in TCGv using get_gpr
+     * get addr in TCGv using gen_helper_csrr on CSR_SSP
+     * use some tcg subtract arithmetic (subtract by XLEN) on addr
+     * perform ss store on computed address
+     */
+
+    TCGv addr = tcg_temp_new();
+    int tmp = (get_xl(ctx) == MXL_RV64) ? 8 : 4;
+    TCGv_i32 ssp_csr = tcg_constant_i32(CSR_SSP);
+    TCGv data = get_gpr(ctx, a->rd, EXT_NONE);
+    gen_helper_csrr(addr, cpu_env, ssp_csr);
+    tcg_gen_qemu_ld_tl(data, addr, MMU_IDX_SS_ACCESS,
+                       mxl_memop(ctx) | MO_ALIGN);
+
+    /*
+     * add XLEN/bitwidth to addr, align to XLEN . How do i do that? Is below
+     * the right way
+     */
+    tcg_gen_addi_tl(addr, addr, tmp);
+    gen_set_gpr(ctx, a->rd, data);
+    gen_helper_csrw(cpu_env, ssp_csr, addr);
+
+    return true;
+}
+
+static bool trans_sspush(DisasContext *ctx, arg_sspush *a)
+{
+    /* cfi only supported on 32bit and 64bit */
+    if (get_xl(ctx) != MXL_RV32 && get_xl(ctx) != MXL_RV64) {
+        return false;
+    }
+
+    /* back cfi not enabled, should go to trans_zimops. return false */
+    if (!ctx->bcfi_enabled) {
+        return false;
+    }
+
+    /*
+     * sspush can only push from x1 or x5. Everything else defaults to zimops
+     */
+    if (a->rs1 != 1 && a->rs1 != 5) {
+        return false;
+    }
+
+    /*
+     * get data in TCGv using get_gpr
+     * get addr in TCGv using gen_helper_csrr on CSR_SSP
+     * use some tcg subtract arithmetic (subtract by XLEN) on addr
+     * perform ss store on computed address
+     */
+
+    TCGv addr = tcg_temp_new();
+    int tmp = (get_xl(ctx) == MXL_RV64) ? -8 : -4;
+    TCGv_i32 ssp_csr = tcg_constant_i32(CSR_SSP);
+    TCGv data = get_gpr(ctx, a->rs1, EXT_NONE);
+    gen_helper_csrr(addr, cpu_env, ssp_csr);
+
+    /*
+     * subtract XLEN from addr, align to XLEN . How do i do that? Is below the
+     * right way
+     */
+    tcg_gen_addi_tl(addr, addr, tmp);
+    tcg_gen_qemu_st_tl(data, addr, MMU_IDX_SS_ACCESS,
+                       mxl_memop(ctx) | MO_ALIGN);
+
+    gen_helper_csrw(cpu_env, ssp_csr, addr);
+
+    return true;
+}
+
+static bool trans_sschckra(DisasContext *ctx, arg_sschckra *a)
+{
+    /* cfi only supported on 32bit and 64bit */
+    if (get_xl(ctx) != MXL_RV32 && get_xl(ctx) != MXL_RV64) {
+        return false;
+    }
+
+    /* back cfi not enabled, should go to trans_zimops. return false */
+    if (!ctx->bcfi_enabled) {
+        return false;
+    }
+
+    gen_helper_sschkra_mismatch(cpu_env);
+
+    return true;
+}
+
+static bool trans_ssprr(DisasContext *ctx, arg_ssprr *a)
+{
+    /* cfi only supported on 32bit and 64bit */
+    if (get_xl(ctx) != MXL_RV32 && get_xl(ctx) != MXL_RV64) {
+        return false;
+    }
+
+    /* back cfi not enabled, should go to trans_zimops. return false */
+    if (!ctx->bcfi_enabled) {
+        return false;
+    }
+
+    TCGv dest = get_gpr(ctx, a->rd, EXT_NONE);
+    TCGv_i32 ssp_csr = tcg_constant_i32(CSR_SSP);
+    gen_helper_csrr(dest, cpu_env, ssp_csr);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_ssamoswap(DisasContext *ctx, arg_ssamoswap *a)
+{
+    /* cfi only supported on 32bit and 64bit */
+    if (get_xl(ctx) != MXL_RV32 && get_xl(ctx) != MXL_RV64) {
+        return false;
+    }
+
+    /* back cfi not enabled, should go to trans_zimops. return false */
+    if (!ctx->bcfi_enabled) {
+        return false;
+    }
+
+    /* If cfi is enabled then, then rd must be != 0 */
+
+    if (a->rd == 0) {
+        return false;
+    }
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_address(ctx, a->rs1, 0);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+    MemOp mop = (MO_ALIGN | ((get_xl(ctx) == MXL_RV32) ? MO_TESL : MO_TESQ));
+
+    tcg_gen_atomic_xchg_tl(dest, src1, src2, MMU_IDX_SS_ACCESS, mop);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_lpcll(DisasContext *ctx, arg_lpcll *a)
+{
+    /* cfi only supported on 32bit and 64bit */
+    if (get_xl(ctx) != MXL_RV32 && get_xl(ctx) != MXL_RV64) {
+        return false;
+    }
+
+    /*
+     * If this is the first instruction of the TB, let the translator
+     * know the landing pad requirement was satisfied. No need to bother
+     * checking for CFI feature or enablement.
+     */
+
+    if (ctx->base.pc_next == ctx->base.pc_first) {
+        ctx->fcfi_lp_expected = false;
+        /* PC must be 4 byte aligned */
+        if (ctx->fcfi_enabled && ((ctx->base.pc_next) & 0x3)) {
+            /*
+             * misaligned, according to spec we should raise illegal instead
+             * of mis-aligned
+             */
+            gen_exception_illegal(ctx);
+        }
+    }
+
+    /* forward cfi not enabled, should go to trans_zimops. return false */
+    if (!ctx->fcfi_enabled) {
+        return false;
+    }
+
+    gen_helper_cfi_check_landing_pad(cpu_env, tcg_constant_i32(a->imm_cfi9),
+                               tcg_constant_i32(FCFI_LPLL));
+    return true;
+}
+
+static bool trans_lpcml(DisasContext *ctx, arg_lpcml *a)
+{
+    /* cfi only supported on 32bit and 64bit */
+    if (get_xl(ctx) != MXL_RV32 && get_xl(ctx) != MXL_RV64) {
+        return false;
+    }
+
+    /* forward cfi not enabled, should go to trans_zimops. return false */
+    if (!ctx->fcfi_enabled) {
+        return false;
+    }
+
+    gen_helper_cfi_check_landing_pad(cpu_env, tcg_constant_i32(a->imm_cfi8),
+                               tcg_constant_i32(FCFI_ML));
+    return true;
+}
+
+static bool trans_lpcul(DisasContext *ctx, arg_lpcul *a)
+{
+    /* cfi only supported on 32bit and 64bit */
+    if (get_xl(ctx) != MXL_RV32 && get_xl(ctx) != MXL_RV64) {
+        return false;
+    }
+
+    /* forward cfi not enabled, should go to trans_zimops. return false */
+    if (!ctx->fcfi_enabled) {
+        return false;
+    }
+
+    gen_helper_cfi_check_landing_pad(cpu_env, tcg_constant_i32(a->imm_cfi8),
+                               tcg_constant_i32(FCFI_UL));
+    return true;
+}
+
+static bool trans_lpsll(DisasContext *ctx, arg_lpsll *a)
+{
+    /* cfi only supported on 32bit and 64bit */
+    if (get_xl(ctx) != MXL_RV32 && get_xl(ctx) != MXL_RV64) {
+        return false;
+    }
+
+    /* forward cfi not enabled, should go to trans_zimops. return false */
+    if (!ctx->fcfi_enabled) {
+        return false;
+    }
+
+    gen_helper_cfi_set_landing_pad(cpu_env, tcg_constant_i32(a->imm_cfi9),
+                                   tcg_constant_i32(FCFI_LPLL));
+
+    return true;
+}
+
+static bool trans_lpsml(DisasContext *ctx, arg_lpsml *a)
+{
+    /* cfi only supported on 32bit and 64bit */
+    if (get_xl(ctx) != MXL_RV32 && get_xl(ctx) != MXL_RV64) {
+        return false;
+    }
+
+    /* forward cfi not enabled, should go to trans_zimops. return false */
+    if (!ctx->fcfi_enabled) {
+        return false;
+    }
+
+    gen_helper_cfi_set_landing_pad(cpu_env, tcg_constant_i32(a->imm_cfi8),
+                                   tcg_constant_i32(FCFI_ML));
+
+    return true;
+}
+
+static bool trans_lpsul(DisasContext *ctx, arg_lpsul *a)
+{
+    /* cfi only supported on 32bit and 64bit */
+    if (get_xl(ctx) != MXL_RV32 && get_xl(ctx) != MXL_RV64) {
+        return false;
+    }
+
+    /* forward cfi not enabled, should go to trans_zimops. return false */
+    if (!ctx->fcfi_enabled) {
+        return false;
+    }
+
+    gen_helper_cfi_set_landing_pad(cpu_env, tcg_constant_i32(a->imm_cfi8),
+                                   tcg_constant_i32(FCFI_UL));
+
+    return true;
+}
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index d15893aa82..c14b76aabb 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -123,6 +123,73 @@ target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
     return int128_getlo(rv);
 }
 
+void helper_sschkra_mismatch(CPURISCVState *env)
+{
+    if (env->gpr[xRA] != env->gpr[xT0]) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+}
+
+void helper_cfi_jalr(CPURISCVState *env, int elp)
+{
+    /*
+     * The translation routine doesn't know if forward CFI is enabled
+     * in the current processor mode or not. It's not worth burning a
+     * cflags bit to encode this, or tracking the current-mode-fcfi
+     * enable in a dedicated member of 'env'. Just come out to a helper
+     * for jump/call on a core with CFI.
+     */
+    if (cpu_get_fcfien(env)) {
+        env->elp = elp;
+    }
+}
+
+void helper_cfi_check_landing_pad(CPURISCVState *env, int lbl, int inst_type)
+{
+    if (cpu_get_fcfien(env)) {
+        switch (inst_type) {
+        case FCFI_LPLL:
+            /*
+             * Check for a lower label match. We already checked 4 byte
+             * alignment in tcg
+             */
+            if (lbl != get_field(env->lplr, LPLR_LL)) {
+                riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+            }
+            env->elp = NO_LP_EXPECTED;
+            break;
+        case FCFI_ML:
+            if (lbl != get_field(env->lplr,  LPLR_ML)) {
+                riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+            }
+            break;
+        case FCFI_UL:
+            if (lbl != get_field(env->lplr,  LPLR_UL)) {
+                riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+            }
+        }
+    }
+}
+
+void helper_cfi_set_landing_pad(CPURISCVState *env, int lbl, int inst_type)
+{
+    if (cpu_get_fcfien(env)) {
+        switch (inst_type) {
+        case FCFI_LPLL:
+            /* setting lower label always clears up entire field */
+            env->lplr = 0;
+            env->lplr = set_field(env->lplr, LPLR_LL, lbl);
+            break;
+        case FCFI_ML:
+            env->lplr = set_field(env->lplr, LPLR_ML, lbl);
+            break;
+        case FCFI_UL:
+            env->lplr = set_field(env->lplr, LPLR_UL, lbl);
+            break;
+        }
+    }
+}
+
 #ifndef CONFIG_USER_ONLY
 
 target_ulong helper_sret(CPURISCVState *env)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 7d43d20fc3..b1a965d192 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1071,6 +1071,8 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_privileged.c.inc"
 #include "insn_trans/trans_svinval.c.inc"
 #include "insn_trans/trans_xventanacondops.c.inc"
+#include "insn_trans/trans_zisslpcfi.c.inc"
+#include "insn_trans/trans_zimops.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
 #include "decode-insn16.c.inc"
-- 
2.25.1


