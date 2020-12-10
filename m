Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036EC2D59EB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:02:08 +0100 (CET)
Received: from localhost ([::1]:33930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKe7-0005Fm-0L
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR3-0001Xe-UC
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:37 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:52155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQo-00076v-DE
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:37 -0500
Received: by mail-wm1-x334.google.com with SMTP id v14so4386918wml.1
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Kf6SvkRVMY6oZcYZ8wg1EY7jkVpy7B/pu1pTCaT3ND4=;
 b=Bv+cP1u2W7RsEhwXTHdJhMb15PzcFSbUwTCo+iP6L6Xe4NazBtKkM5Ji3d+CXLQQIj
 kHdvmCTGCC71aZit2LPb9rMZ1YoqNwX+cS0uPMot2XLHRA3WniYcqIAUqSBcV7D0LaNY
 Tr2NiaVwvEvdYu2tWQ8DIZgu2ofwu/X5MLm5ysDkJ6e6MLNZdzqIq1kbwyCxd2qr+IS+
 sQx6811GbgH9XMMvut2GIL0+NgF4/HLYFNF0UhUPXREr5chhZqAvdXyyB7z/zkqbq05c
 XUoGg7Ul4o1wt8dGyPCbzUdkK8OKlLHv7JaU0sC/ur01QtdDkDktyiJSTna61rX8F63Z
 9zSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kf6SvkRVMY6oZcYZ8wg1EY7jkVpy7B/pu1pTCaT3ND4=;
 b=IGYcUwJNDo4UbOPp4H22hUaEuW/KsN3mIe7sg2iY2tPs8caGPhG0xxy/1trSRCTNod
 Jxg+Eg7lCREho+D3v0Qbvo//KPdDlSwwJRVLprg4fAGD27KrOZoULBwjJvoAXgYYsuNH
 F3TzxvdfA8H7DPB9Gt6S88YkSLL9tenUoWS7J7DvBadA+IkeIUJFX55i/UjUqE0vswJx
 R2uzHTS4dDAK55qu1nB5efXl4n3RA9oAGJdtBnyobewAV5FSMUbhJq3LNpFYCQGRiSG5
 Q8DoGMuDnwMwXD8DEMCEsRSV5MRaaRBAb6Xe7tW/PgGNi81c+KGPzIbzDzcAXaONSr8W
 CBYQ==
X-Gm-Message-State: AOAM530p/f6W0VoudApT5prC8Cpo1C3wFJB7tzzZ1uVfyPHpZuZ830kx
 Cg16ofInfkupdYwERy7H+/mLnm0ym4y77w==
X-Google-Smtp-Source: ABdhPJzeM6QElKzQ90muv8N1rVXqjuh7fGc52F82QWVO7KJe9o4HGmFmvjyC7BdX5re/GghNgS6eVA==
X-Received: by 2002:a1c:f002:: with SMTP id a2mr7703264wmb.101.1607600899699; 
 Thu, 10 Dec 2020 03:48:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/36] target/arm: Refactor M-profile VMSR/VMRS handling
Date: Thu, 10 Dec 2020 11:47:38 +0000
Message-Id: <20201210114756.16501-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

Currently M-profile borrows the A-profile code for VMSR and VMRS
(access to the FP system registers), because all it needs to support
is the FPSCR.  In v8.1M things become significantly more complicated
in two ways:

 * there are several new FP system registers; some have side effects
   on read, and one (FPCXT_NS) needs to avoid the usual
   vfp_access_check() and the "only if FPU implemented" check

 * all sysregs are now accessible both by VMRS/VMSR (which
   reads/writes a general purpose register) and also by VLDR/VSTR
   (which reads/writes them directly to memory)

Refactor the structure of how we handle VMSR/VMRS to cope with this:

 * keep the M-profile code entirely separate from the A-profile code

 * abstract out the "read or write the general purpose register" part
   of the code into a loadfn or storefn function pointer, so we can
   reuse it for VLDR/VSTR.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-8-peter.maydell@linaro.org
---
 target/arm/cpu.h               |   3 +
 target/arm/translate-vfp.c.inc | 182 ++++++++++++++++++++++++++++++---
 2 files changed, 171 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 11400a9d248..ad8b80c667d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1569,6 +1569,9 @@ enum arm_cpu_mode {
 #define ARM_VFP_FPINST  9
 #define ARM_VFP_FPINST2 10
 
+/* QEMU-internal value meaning "FPSCR, but we care only about NZCV" */
+#define QEMU_VFP_FPSCR_NZCV 0xffff
+
 /* iwMMXt coprocessor control registers.  */
 #define ARM_IWMMXT_wCID  0
 #define ARM_IWMMXT_wCon  1
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index e100182a32c..7a0cbca6640 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -607,27 +607,181 @@ static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
     return true;
 }
 
+/*
+ * M-profile provides two different sets of instructions that can
+ * access floating point system registers: VMSR/VMRS (which move
+ * to/from a general purpose register) and VLDR/VSTR sysreg (which
+ * move directly to/from memory). In some cases there are also side
+ * effects which must happen after any write to memory (which could
+ * cause an exception). So we implement the common logic for the
+ * sysreg access in gen_M_fp_sysreg_write() and gen_M_fp_sysreg_read(),
+ * which take pointers to callback functions which will perform the
+ * actual "read/write general purpose register" and "read/write
+ * memory" operations.
+ */
+
+/*
+ * Emit code to store the sysreg to its final destination; frees the
+ * TCG temp 'value' it is passed.
+ */
+typedef void fp_sysreg_storefn(DisasContext *s, void *opaque, TCGv_i32 value);
+/*
+ * Emit code to load the value to be copied to the sysreg; returns
+ * a new TCG temporary
+ */
+typedef TCGv_i32 fp_sysreg_loadfn(DisasContext *s, void *opaque);
+
+/* Common decode/access checks for fp sysreg read/write */
+typedef enum FPSysRegCheckResult {
+    FPSysRegCheckFailed, /* caller should return false */
+    FPSysRegCheckDone, /* caller should return true */
+    FPSysRegCheckContinue, /* caller should continue generating code */
+} FPSysRegCheckResult;
+
+static FPSysRegCheckResult fp_sysreg_checks(DisasContext *s, int regno)
+{
+    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
+        return FPSysRegCheckFailed;
+    }
+
+    switch (regno) {
+    case ARM_VFP_FPSCR:
+    case QEMU_VFP_FPSCR_NZCV:
+        break;
+    default:
+        return FPSysRegCheckFailed;
+    }
+
+    if (!vfp_access_check(s)) {
+        return FPSysRegCheckDone;
+    }
+
+    return FPSysRegCheckContinue;
+}
+
+static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
+
+                                  fp_sysreg_loadfn *loadfn,
+                                 void *opaque)
+{
+    /* Do a write to an M-profile floating point system register */
+    TCGv_i32 tmp;
+
+    switch (fp_sysreg_checks(s, regno)) {
+    case FPSysRegCheckFailed:
+        return false;
+    case FPSysRegCheckDone:
+        return true;
+    case FPSysRegCheckContinue:
+        break;
+    }
+
+    switch (regno) {
+    case ARM_VFP_FPSCR:
+        tmp = loadfn(s, opaque);
+        gen_helper_vfp_set_fpscr(cpu_env, tmp);
+        tcg_temp_free_i32(tmp);
+        gen_lookup_tb(s);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    return true;
+}
+
+static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
+                                fp_sysreg_storefn *storefn,
+                                void *opaque)
+{
+    /* Do a read from an M-profile floating point system register */
+    TCGv_i32 tmp;
+
+    switch (fp_sysreg_checks(s, regno)) {
+    case FPSysRegCheckFailed:
+        return false;
+    case FPSysRegCheckDone:
+        return true;
+    case FPSysRegCheckContinue:
+        break;
+    }
+
+    switch (regno) {
+    case ARM_VFP_FPSCR:
+        tmp = tcg_temp_new_i32();
+        gen_helper_vfp_get_fpscr(tmp, cpu_env);
+        storefn(s, opaque, tmp);
+        break;
+    case QEMU_VFP_FPSCR_NZCV:
+        /*
+         * Read just NZCV; this is a special case to avoid the
+         * helper call for the "VMRS to CPSR.NZCV" insn.
+         */
+        tmp = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
+        tcg_gen_andi_i32(tmp, tmp, 0xf0000000);
+        storefn(s, opaque, tmp);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    return true;
+}
+
+static void fp_sysreg_to_gpr(DisasContext *s, void *opaque, TCGv_i32 value)
+{
+    arg_VMSR_VMRS *a = opaque;
+
+    if (a->rt == 15) {
+        /* Set the 4 flag bits in the CPSR */
+        gen_set_nzcv(value);
+        tcg_temp_free_i32(value);
+    } else {
+        store_reg(s, a->rt, value);
+    }
+}
+
+static TCGv_i32 gpr_to_fp_sysreg(DisasContext *s, void *opaque)
+{
+    arg_VMSR_VMRS *a = opaque;
+
+    return load_reg(s, a->rt);
+}
+
+static bool gen_M_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
+{
+    /*
+     * Accesses to R15 are UNPREDICTABLE; we choose to undef.
+     * FPSCR -> r15 is a special case which writes to the PSR flags;
+     * set a->reg to a special value to tell gen_M_fp_sysreg_read()
+     * we only care about the top 4 bits of FPSCR there.
+     */
+    if (a->rt == 15) {
+        if (a->l && a->reg == ARM_VFP_FPSCR) {
+            a->reg = QEMU_VFP_FPSCR_NZCV;
+        } else {
+            return false;
+        }
+    }
+
+    if (a->l) {
+        /* VMRS, move FP system register to gp register */
+        return gen_M_fp_sysreg_read(s, a->reg, fp_sysreg_to_gpr, a);
+    } else {
+        /* VMSR, move gp register to FP system register */
+        return gen_M_fp_sysreg_write(s, a->reg, gpr_to_fp_sysreg, a);
+    }
+}
+
 static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
 {
     TCGv_i32 tmp;
     bool ignore_vfp_enabled = false;
 
-    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
-        return false;
+    if (arm_dc_feature(s, ARM_FEATURE_M)) {
+        return gen_M_VMSR_VMRS(s, a);
     }
 
-    if (arm_dc_feature(s, ARM_FEATURE_M)) {
-        /*
-         * The only M-profile VFP vmrs/vmsr sysreg is FPSCR.
-         * Accesses to R15 are UNPREDICTABLE; we choose to undef.
-         * (FPSCR -> r15 is a special case which writes to the PSR flags.)
-         */
-        if (a->reg != ARM_VFP_FPSCR) {
-            return false;
-        }
-        if (a->rt == 15 && !a->l) {
-            return false;
-        }
+    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
+        return false;
     }
 
     switch (a->reg) {
-- 
2.20.1


