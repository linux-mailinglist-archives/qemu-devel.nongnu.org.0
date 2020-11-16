Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303382B4AF4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:26:14 +0100 (CET)
Received: from localhost ([::1]:38044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehKX-0007cU-8r
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:26:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3e-0008VU-RS
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:46 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:51364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3b-0007qU-OW
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:46 -0500
Received: by mail-wm1-x336.google.com with SMTP id 19so24228634wmf.1
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 08:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nnPwlADakN+vC7KEmeazFxm2/dI86B7xYLVrWaaPTLY=;
 b=DWXIAOo6ygWWa4TVTErfiMF1QJB1Na0Xk0tq9Xk+59/KY3FQ2HOJJyLKf1NbqRtqAa
 VC6PcA23NppDqJRgq6LEaJo/XI78BumArxC3pwaoNVJyb7WOt1XP4nVzOtEvi2IDEF9h
 19MDQ04qCNoam28Rqs9Fl4xHwqaaXioJUsmQAZ1G2N6TFQgrv8/ub5wfMrTAwhcmuung
 1OPtPv1srCe9XAhQiB4y7sF7rZYIfiNDl2U+VFd3F79gdWBv2+S2TyKxvj2vq3GIVImr
 KHdO6+9o7Y5BoKaKfKlqF1blMvaOsI2IJAJEe6mvfb+w2BRhPkwgaboX2EcuA313LeOC
 yiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nnPwlADakN+vC7KEmeazFxm2/dI86B7xYLVrWaaPTLY=;
 b=X8PStCcj7NgfLgBnB9xSzVoBUm2h4exCeJTXYK8HXPjga6nkwhCT99Bt2iOK1TLQSi
 a3oavqZYn7GqLSun1VH0LtGVychjItMqyuLItXY4BgUFQEo4AQE0zJc6hGzdSb1vih+S
 L9uThOMnAZafnYcPDznAr95Ic+25SjTUDb+dXa0K4f9sZpAu7/hSNA65rWDgeEGDY1D7
 8ETi6UDQLNs0MsvYauAXK1k/JyGJAWoOTH2TyxdO57qmMRpUxrEIAj01SIyfqkzdrUL6
 z43jnKX6ILAOJlnjxhZ0SBi93/355lUyyxo3U7qyJiTZj+q3NM8fSklm7JNsuyUY00AU
 e6Lw==
X-Gm-Message-State: AOAM532d2bRjsyiyf1L6jUPajlOoLQz4KewPi3QUngwbA5yla/H2kuG+
 ZWzdKXagNpokhNrSo4wDamQuaw==
X-Google-Smtp-Source: ABdhPJz9AXKVEioh2zlvQpXKjEJMzEFFu80a5px+aML5EWUJmg6tvs0vCbjiKKSjS0l2Lhs3tEUxhg==
X-Received: by 2002:a1c:b18a:: with SMTP id a132mr16399651wmf.95.1605542922217; 
 Mon, 16 Nov 2020 08:08:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/15] target/arm: Refactor M-profile VMSR/VMRS handling
Date: Mon, 16 Nov 2020 16:08:23 +0000
Message-Id: <20201116160831.31000-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
---
 target/arm/cpu.h               |   3 +
 target/arm/translate-vfp.c.inc | 181 ++++++++++++++++++++++++++++++---
 2 files changed, 170 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 806c18a499f..3b20f935174 100644
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
index aee60ff98b3..5d880d12116 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -607,27 +607,180 @@ static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
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
+typedef enum fp_sysreg_check_result {
+    fp_sysreg_check_failed, /* caller should return false */
+    fp_sysreg_check_done, /* caller should return true */
+    fp_sysreg_check_continue, /* caller should continue generating code */
+} fp_sysreg_check_result;
+
+static fp_sysreg_check_result fp_sysreg_checks(DisasContext *s, int regno)
+{
+    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
+        return fp_sysreg_check_failed;
+    }
+
+    switch (regno) {
+    case ARM_VFP_FPSCR:
+    case QEMU_VFP_FPSCR_NZCV:
+        break;
+    default:
+        return fp_sysreg_check_failed;
+    }
+
+    if (!vfp_access_check(s)) {
+        return fp_sysreg_check_done;
+    }
+
+    return fp_sysreg_check_continue;
+}
+
+static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
+                                 fp_sysreg_loadfn *loadfn,
+                                 void *opaque)
+{
+    /* Do a write to an M-profile floating point system register */
+    TCGv_i32 tmp;
+
+    switch (fp_sysreg_checks(s, regno)) {
+    case fp_sysreg_check_failed:
+        return false;
+    case fp_sysreg_check_done:
+        return true;
+    case fp_sysreg_check_continue:
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
+    case fp_sysreg_check_failed:
+        return false;
+    case fp_sysreg_check_done:
+        return true;
+    case fp_sysreg_check_continue:
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


