Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F80E3ACD43
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 16:13:36 +0200 (CEST)
Received: from localhost ([::1]:56428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luFFX-0001uu-E3
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 10:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCZ-0007Pj-JA
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:10:31 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCV-00020D-96
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:10:31 -0400
Received: by mail-wr1-x42e.google.com with SMTP id a11so10941371wrt.13
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 07:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aTfR1HT9DaXFfl1KAFLCshDh3G+k5LtBMroZMj4avHE=;
 b=C3vcTF1DzANCoVSt8aXcq1XROVLjxqmF4P0ErvPUYysy/hnHVLwT/28834EGwqxgCL
 Q7jd8QOUoflFRqMfxskBMPFGR6WBNXF6YBVETiFFZmVvLS0hcf0ZDdd2f9iVfwiIxSoM
 agXzILFmrsdCQJE+Wk5O98YcChmJYy2WA4nNbDTBh/IETjJtCmTKH/TlS7Rvtu9HXlST
 Nyj1t30SNSjo75aSk/IB51oCqRJWunT2eID2w37AWzqHQRslu2js5U585hULLC2Gp16K
 EbRlGWEtYV1E4lyXkfmEdbJQIoOD//6esFAM+n6bNlItEuXEhaToDpXYqzLJZZkFAP0Y
 ctVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aTfR1HT9DaXFfl1KAFLCshDh3G+k5LtBMroZMj4avHE=;
 b=M8w97Ym/t4JhV5VTNjgXgrAAylAn1l4ED1tuevMF3oR/MAJ73NHONHqhdnqnsekjlb
 a3ExzfE1pkNYkR7dBqcajBNAmWxmGRUrCcO38/+eHYS+YAbD1MCPbT5aosGSWLgTAoWE
 XDUZpB+74dgEl6hgE1CE2CNNBwJ5W6EhstxAG2aY5+GXQozgSRbzquoM5o90EYFyPsbT
 QTVvb5pUv7rbQ83BEQmLgcBhLjRqCmRFfBt4475h6cODwf5e50E8cHepOuZ0ZYhwSHMM
 mWxZN/K4aEQkHdMlOqXr017VijThrEEjxAe+xyjhdnEfkWCaZa2x/Sqe1/myRk+hGD0d
 FgPA==
X-Gm-Message-State: AOAM532+JN/M6xjzq+VbX33y0Mzaq205+mw5UNk+P6PbFkXOpSR5FsBO
 2Zfp5RZsxIcU4vZq4XJzd/jCdw==
X-Google-Smtp-Source: ABdhPJyn2t6G85xOJXQ+ve2CFT3U+R4rYUxqq1bX468SYkHPL7fe2LQ77bGvyHWQ99VKoU8QFptpzg==
X-Received: by 2002:a05:6000:1c1:: with SMTP id
 t1mr12456873wrx.282.1624025425280; 
 Fri, 18 Jun 2021 07:10:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j11sm7751661wmq.4.2021.06.18.07.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 07:10:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/7] target/arm: Handle writeback in VLDR/VSTR sysreg with no
 memory access
Date: Fri, 18 Jun 2021 15:10:16 +0100
Message-Id: <20210618141019.10671-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210618141019.10671-1-peter.maydell@linaro.org>
References: <20210618141019.10671-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

A few subcases of VLDR/VSTR sysreg succeed but do not perform a
memory access:
 * VSTR of VPR when unprivileged
 * VLDR to VPR when unprivileged
 * VLDR to FPCXT_NS when fpInactive

In these cases, even though we don't do the memory access we should
still update the base register and perform the stack limit check if
the insn's addressing mode specifies writeback.  Our implementation
failed to do this, because we handle these side-effects inside the
memory_to_fp_sysreg() and fp_sysreg_to_memory() callback functions,
which are only called if there's something to load or store.

Fix this by adding an extra argument to the callbacks which is set to
true to actually perform the access and false to only do side effects
like writeback, and calling the callback with do_access = false
for the three cases listed above.

This produces slightly suboptimal code for the case of a write
to FPCXT_NS when the FPU is inactive and the insn didn't have
side effects (ie no writeback, or via VMSR), in which case we'll
generate a conditional branch over an unconditional branch.
But this doesn't seem to be important enough to merit requiring
the callback to report back whether it generated any code or not.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-m-nocp.c | 102 ++++++++++++++++++++++++----------
 1 file changed, 72 insertions(+), 30 deletions(-)

diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
index 17fd2bf2fb9..312a25f0589 100644
--- a/target/arm/translate-m-nocp.c
+++ b/target/arm/translate-m-nocp.c
@@ -207,14 +207,20 @@ static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
 
 /*
  * Emit code to store the sysreg to its final destination; frees the
- * TCG temp 'value' it is passed.
+ * TCG temp 'value' it is passed. do_access is true to do the store,
+ * and false to skip it and only perform side-effects like base
+ * register writeback.
  */
-typedef void fp_sysreg_storefn(DisasContext *s, void *opaque, TCGv_i32 value);
+typedef void fp_sysreg_storefn(DisasContext *s, void *opaque, TCGv_i32 value,
+                               bool do_access);
 /*
  * Emit code to load the value to be copied to the sysreg; returns
- * a new TCG temporary
+ * a new TCG temporary. do_access is true to do the store,
+ * and false to skip it and only perform side-effects like base
+ * register writeback.
  */
-typedef TCGv_i32 fp_sysreg_loadfn(DisasContext *s, void *opaque);
+typedef TCGv_i32 fp_sysreg_loadfn(DisasContext *s, void *opaque,
+                                  bool do_access);
 
 /* Common decode/access checks for fp sysreg read/write */
 typedef enum FPSysRegCheckResult {
@@ -318,7 +324,7 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
 
     switch (regno) {
     case ARM_VFP_FPSCR:
-        tmp = loadfn(s, opaque);
+        tmp = loadfn(s, opaque, true);
         gen_helper_vfp_set_fpscr(cpu_env, tmp);
         tcg_temp_free_i32(tmp);
         gen_lookup_tb(s);
@@ -326,7 +332,7 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
     case ARM_VFP_FPSCR_NZCVQC:
     {
         TCGv_i32 fpscr;
-        tmp = loadfn(s, opaque);
+        tmp = loadfn(s, opaque, true);
         if (dc_isar_feature(aa32_mve, s)) {
             /* QC is only present for MVE; otherwise RES0 */
             TCGv_i32 qc = tcg_temp_new_i32();
@@ -347,9 +353,19 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         break;
     }
     case ARM_VFP_FPCXT_NS:
+    {
+        TCGLabel *lab_active = gen_new_label();
+
         lab_end = gen_new_label();
-        /* fpInactive case: write is a NOP, so branch to end */
-        gen_branch_fpInactive(s, TCG_COND_NE, lab_end);
+        gen_branch_fpInactive(s, TCG_COND_EQ, lab_active);
+        /*
+         * fpInactive case: write is a NOP, so only do side effects
+         * like register writeback before we branch to end
+         */
+        loadfn(s, opaque, false);
+        tcg_gen_br(lab_end);
+
+        gen_set_label(lab_active);
         /*
          * !fpInactive: if FPU disabled, take NOCP exception;
          * otherwise PreserveFPState(), and then FPCXT_NS writes
@@ -366,7 +382,8 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
             break;
         }
         gen_preserve_fp_state(s);
-        /* fall through */
+    }
+    /* fall through */
     case ARM_VFP_FPCXT_S:
     {
         TCGv_i32 sfpa, control;
@@ -374,7 +391,7 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
          * Set FPSCR and CONTROL.SFPA from value; the new FPSCR takes
          * bits [27:0] from value and zeroes bits [31:28].
          */
-        tmp = loadfn(s, opaque);
+        tmp = loadfn(s, opaque, true);
         sfpa = tcg_temp_new_i32();
         tcg_gen_shri_i32(sfpa, tmp, 31);
         control = load_cpu_field(v7m.control[M_REG_S]);
@@ -390,15 +407,16 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
     case ARM_VFP_VPR:
         /* Behaves as NOP if not privileged */
         if (IS_USER(s)) {
+            loadfn(s, opaque, false);
             break;
         }
-        tmp = loadfn(s, opaque);
+        tmp = loadfn(s, opaque, true);
         store_cpu_field(tmp, v7m.vpr);
         break;
     case ARM_VFP_P0:
     {
         TCGv_i32 vpr;
-        tmp = loadfn(s, opaque);
+        tmp = loadfn(s, opaque, true);
         vpr = load_cpu_field(v7m.vpr);
         tcg_gen_deposit_i32(vpr, vpr, tmp,
                             R_V7M_VPR_P0_SHIFT, R_V7M_VPR_P0_LENGTH);
@@ -442,13 +460,13 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
     case ARM_VFP_FPSCR:
         tmp = tcg_temp_new_i32();
         gen_helper_vfp_get_fpscr(tmp, cpu_env);
-        storefn(s, opaque, tmp);
+        storefn(s, opaque, tmp, true);
         break;
     case ARM_VFP_FPSCR_NZCVQC:
         tmp = tcg_temp_new_i32();
         gen_helper_vfp_get_fpscr(tmp, cpu_env);
         tcg_gen_andi_i32(tmp, tmp, FPCR_NZCVQC_MASK);
-        storefn(s, opaque, tmp);
+        storefn(s, opaque, tmp, true);
         break;
     case QEMU_VFP_FPSCR_NZCV:
         /*
@@ -457,7 +475,7 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
          */
         tmp = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
         tcg_gen_andi_i32(tmp, tmp, FPCR_NZCV_MASK);
-        storefn(s, opaque, tmp);
+        storefn(s, opaque, tmp, true);
         break;
     case ARM_VFP_FPCXT_S:
     {
@@ -476,7 +494,7 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
          * Store result before updating FPSCR etc, in case
          * it is a memory write which causes an exception.
          */
-        storefn(s, opaque, tmp);
+        storefn(s, opaque, tmp, true);
         /*
          * Now we must reset FPSCR from FPDSCR_NS, and clear
          * CONTROL.SFPA; so we'll end the TB here.
@@ -499,7 +517,7 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         gen_branch_fpInactive(s, TCG_COND_EQ, lab_active);
         /* fpInactive case: reads as FPDSCR_NS */
         TCGv_i32 tmp = load_cpu_field(v7m.fpdscr[M_REG_NS]);
-        storefn(s, opaque, tmp);
+        storefn(s, opaque, tmp, true);
         lab_end = gen_new_label();
         tcg_gen_br(lab_end);
 
@@ -531,7 +549,7 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         tcg_gen_or_i32(tmp, tmp, sfpa);
         tcg_temp_free_i32(control);
         /* Store result before updating FPSCR, in case it faults */
-        storefn(s, opaque, tmp);
+        storefn(s, opaque, tmp, true);
         /* If SFPA is zero then set FPSCR from FPDSCR_NS */
         fpdscr = load_cpu_field(v7m.fpdscr[M_REG_NS]);
         zero = tcg_const_i32(0);
@@ -546,15 +564,16 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
     case ARM_VFP_VPR:
         /* Behaves as NOP if not privileged */
         if (IS_USER(s)) {
+            storefn(s, opaque, NULL, false);
             break;
         }
         tmp = load_cpu_field(v7m.vpr);
-        storefn(s, opaque, tmp);
+        storefn(s, opaque, tmp, true);
         break;
     case ARM_VFP_P0:
         tmp = load_cpu_field(v7m.vpr);
         tcg_gen_extract_i32(tmp, tmp, R_V7M_VPR_P0_SHIFT, R_V7M_VPR_P0_LENGTH);
-        storefn(s, opaque, tmp);
+        storefn(s, opaque, tmp, true);
         break;
     default:
         g_assert_not_reached();
@@ -569,10 +588,15 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
     return true;
 }
 
-static void fp_sysreg_to_gpr(DisasContext *s, void *opaque, TCGv_i32 value)
+static void fp_sysreg_to_gpr(DisasContext *s, void *opaque, TCGv_i32 value,
+                             bool do_access)
 {
     arg_VMSR_VMRS *a = opaque;
 
+    if (!do_access) {
+        return;
+    }
+
     if (a->rt == 15) {
         /* Set the 4 flag bits in the CPSR */
         gen_set_nzcv(value);
@@ -582,10 +606,13 @@ static void fp_sysreg_to_gpr(DisasContext *s, void *opaque, TCGv_i32 value)
     }
 }
 
-static TCGv_i32 gpr_to_fp_sysreg(DisasContext *s, void *opaque)
+static TCGv_i32 gpr_to_fp_sysreg(DisasContext *s, void *opaque, bool do_access)
 {
     arg_VMSR_VMRS *a = opaque;
 
+    if (!do_access) {
+        return NULL;
+    }
     return load_reg(s, a->rt);
 }
 
@@ -614,7 +641,8 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
     }
 }
 
-static void fp_sysreg_to_memory(DisasContext *s, void *opaque, TCGv_i32 value)
+static void fp_sysreg_to_memory(DisasContext *s, void *opaque, TCGv_i32 value,
+                                bool do_access)
 {
     arg_vldr_sysreg *a = opaque;
     uint32_t offset = a->imm;
@@ -624,6 +652,10 @@ static void fp_sysreg_to_memory(DisasContext *s, void *opaque, TCGv_i32 value)
         offset = -offset;
     }
 
+    if (!do_access && !a->w) {
+        return;
+    }
+
     addr = load_reg(s, a->rn);
     if (a->p) {
         tcg_gen_addi_i32(addr, addr, offset);
@@ -633,9 +665,11 @@ static void fp_sysreg_to_memory(DisasContext *s, void *opaque, TCGv_i32 value)
         gen_helper_v8m_stackcheck(cpu_env, addr);
     }
 
-    gen_aa32_st_i32(s, value, addr, get_mem_index(s),
-                    MO_UL | MO_ALIGN | s->be_data);
-    tcg_temp_free_i32(value);
+    if (do_access) {
+        gen_aa32_st_i32(s, value, addr, get_mem_index(s),
+                        MO_UL | MO_ALIGN | s->be_data);
+        tcg_temp_free_i32(value);
+    }
 
     if (a->w) {
         /* writeback */
@@ -648,17 +682,22 @@ static void fp_sysreg_to_memory(DisasContext *s, void *opaque, TCGv_i32 value)
     }
 }
 
-static TCGv_i32 memory_to_fp_sysreg(DisasContext *s, void *opaque)
+static TCGv_i32 memory_to_fp_sysreg(DisasContext *s, void *opaque,
+                                    bool do_access)
 {
     arg_vldr_sysreg *a = opaque;
     uint32_t offset = a->imm;
     TCGv_i32 addr;
-    TCGv_i32 value = tcg_temp_new_i32();
+    TCGv_i32 value = NULL;
 
     if (!a->a) {
         offset = -offset;
     }
 
+    if (!do_access && !a->w) {
+        return NULL;
+    }
+
     addr = load_reg(s, a->rn);
     if (a->p) {
         tcg_gen_addi_i32(addr, addr, offset);
@@ -668,8 +707,11 @@ static TCGv_i32 memory_to_fp_sysreg(DisasContext *s, void *opaque)
         gen_helper_v8m_stackcheck(cpu_env, addr);
     }
 
-    gen_aa32_ld_i32(s, value, addr, get_mem_index(s),
-                    MO_UL | MO_ALIGN | s->be_data);
+    if (do_access) {
+        value = tcg_temp_new_i32();
+        gen_aa32_ld_i32(s, value, addr, get_mem_index(s),
+                        MO_UL | MO_ALIGN | s->be_data);
+    }
 
     if (a->w) {
         /* writeback */
-- 
2.20.1


