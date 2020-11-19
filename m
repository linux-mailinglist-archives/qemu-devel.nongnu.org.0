Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619462B9D42
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:00:04 +0100 (CET)
Received: from localhost ([::1]:49556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfryF-0003sx-C1
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:00:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrup-0000hA-V4
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:31 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrun-00049a-Ip
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:31 -0500
Received: by mail-wr1-x429.google.com with SMTP id p8so8018714wrx.5
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ldCy4DDuaD1wPIoSnJu2ePFEefVEzvaqh++kwHOTnPk=;
 b=ghvHk2zN5ps4XzgRTRiPnV+I9VY0xcL3xMTUTqIKj2LD0HWYWhHznMa106OJyP+Tku
 YvZ+4gxylw7j7m9Pm9G5Z8AlHIt0SqcIYBPwY3PHuiQXiT06XL326DkApNrAQ2UMS3qS
 WIJUypz1ZhP6qGBCE1Ieyx0mEoT2SkG7moBNnWrJDZEe0j6Py+gnXGTO2E6AYChcpBiV
 QXaiqXgNV1q566SENiW4cRVvEqtAZtV/j9VnbDO6vBisZUoxkxtfTLnD26GD3JIyKcGe
 EjwmDNngkoQWVFaX8bElcgUc24GVhci4wBwC0q+ZgbTP6T8QU57r3BwSEtKb8MkahbKH
 1mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ldCy4DDuaD1wPIoSnJu2ePFEefVEzvaqh++kwHOTnPk=;
 b=oIYwWqW38CGUPzDCsO6/uZjLhzxr9u9fy95cyiutd2emxQicCI/1/mWJmQmgGv3KZN
 Hkj3eZ1nR+s6VHllKUCOK01B9XtNjumwoJSd0wJMZSYX4ymbfTN6B0J2Ew73+fOMHYks
 s8gTkbZikcjZQ2jHCrMKWabr0QleMiPApYsI3TEOsrHf80blWxXwpqbOIbTyjvbK0fby
 pAb/yTwr+LNnwQKIp1TfH4tFTFDr/3ZXAvDCiU4TarfogUAgoQi1Iv7Tkv4I+UXX0p4F
 vPzMOwu/bLPVA9+aLnwXWWevgpDHwT8UDlxIqujS74tNhjPuAwszGVD8Bci0vhxmEMtt
 QNgQ==
X-Gm-Message-State: AOAM532JEheN/cUICpa2NEwlFgvKaPlpFsbV5M1VnhBISE09cJjguMte
 PmV2Q1cirR1/ykS5xXRTNlyi+A==
X-Google-Smtp-Source: ABdhPJxrT3FK5gSxYnKMt6Ae78u/V9cZcFvPjMQ1uL+pGjASI6Kq1cPVuBEH9a8W/57Tucw56XcOEw==
X-Received: by 2002:adf:de12:: with SMTP id b18mr12890957wrm.187.1605822988219; 
 Thu, 19 Nov 2020 13:56:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 07/28] target/arm: Refactor M-profile VMSR/VMRS handling
Date: Thu, 19 Nov 2020 21:55:56 +0000
Message-Id: <20201119215617.29887-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
index e100182a32c..2d201ad0888 100644
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


