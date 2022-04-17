Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C89F5048C0
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:02:55 +0200 (CEST)
Received: from localhost ([::1]:36790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9Ec-0001Xb-Os
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xI-0001DF-9V
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:00 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:38739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xD-0003Nu-Pz
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:59 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so15525130pjn.3
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CZCDzfeb570yxQzv9X4suIogFVnxMMmltWWaLeklfQM=;
 b=VruFN/U1NQfnq457nOEpP+acnNZSJwhJjXQH1yiZe8pGXG/sPD7F/GeEz4QjGb9/Gw
 zxf/LnzFpFw9Y+CWrSXk5CUtEWRx6+HU8V37RQsrUv7S+iK2EFyLk2FEzy8IiYPuttDd
 3tM0IYdDxzzG1u/ju+SsF436LLNcjq2HFrzj8+aJ6lWbZsKRgJCmv64MjUotqPQ0Wuik
 hObf+NiF5yReCV3lw7n0/ytMtuOkS+G+QhCM+ipqpMvx1HWEwUDTB4VJb9w8Ylj8zxWT
 sSxfTPVKioCYb6x5zrSdnvcQ/QMqoQDbb0HkReDrlV9/I7jfooTdXvzmircctKBLCK1r
 kgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CZCDzfeb570yxQzv9X4suIogFVnxMMmltWWaLeklfQM=;
 b=b2szmSn1dLV7c/u1uUWMYUb9tEKp/wvmrB5yDjuibVP+T0GQyZ52WMvrBYIZ5RwwF2
 cXKNCs8k552fIX+3j8WdVuT/A+nWdU5zNwSyvqMshtPv+7KdA+gKAj5YzJfHtSjMa7hd
 WL0YVd49sVNlw7Zf/o0Z+zicorUsuMSDc/5gU72Q4GafJb9c+rW3cVjb8eI5TmFpP1WM
 s5zaPHS3uB78FfTFOvnpYOvOuMGzFRO5MbEvpGBJ2bfq5RkCQVNLQYn/1sb7a5+iQaeU
 QMdId/cYEdoirig2UdZbhXoM6r7LHkBt5ciwxYk9RRJdrvrowPM2N18O/xJywtRxCg8T
 WS2Q==
X-Gm-Message-State: AOAM530ua07MFWkokocOBelLEpkOMPBUNqwH7L/Oxos/k8BDGKbpaKeb
 UyiSqE2Ifqb4OHrkk8qwQ1Q6qFR/0SUWzw==
X-Google-Smtp-Source: ABdhPJxonUU6Yy9RDBLwuZt98Aq0hukwYuyBPOZ5PUAOxkV2UA+NP3X5RJq32knU9k8BHI8GwWLdiw==
X-Received: by 2002:a17:902:9308:b0:158:da34:ab55 with SMTP id
 bc8-20020a170902930800b00158da34ab55mr7767123plb.84.1650217494365; 
 Sun, 17 Apr 2022 10:44:54 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 28/60] target/arm: Reorg ARMCPRegInfo type field bits
Date: Sun, 17 Apr 2022 10:43:54 -0700
Message-Id: <20220417174426.711829-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of defining ARM_CP_FLAG_MASK to remove flags,
define ARM_CP_SPECIAL_MASK to isolate special cases.
Sort the specials to the low bits. Use an enum.

Make ARM_CP_CONST a special case, and ARM_CP_NOP an alias.
Split the large comment block so as to document each
value separately.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h        | 134 +++++++++++++++++++++++--------------
 target/arm/cpu.c           |   4 +-
 target/arm/helper.c        |   4 +-
 target/arm/translate-a64.c |  21 +++---
 target/arm/translate.c     |  27 ++++----
 5 files changed, 111 insertions(+), 79 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index bd321d6d23..031e4b7ec8 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -22,57 +22,89 @@
 #define TARGET_ARM_CPREGS_H 1
 
 /*
- * ARMCPRegInfo type field bits. If the SPECIAL bit is set this is a
- * special-behaviour cp reg and bits [11..8] indicate what behaviour
- * it has. Otherwise it is a simple cp reg, where CONST indicates that
- * TCG can assume the value to be constant (ie load at translate time)
- * and 64BIT indicates a 64 bit wide coprocessor register. SUPPRESS_TB_END
- * indicates that the TB should not be ended after a write to this register
- * (the default is that the TB ends after cp writes). OVERRIDE permits
- * a register definition to override a previous definition for the
- * same (cp, is64, crn, crm, opc1, opc2) tuple: either the new or the
- * old must have the OVERRIDE bit set.
- * ALIAS indicates that this register is an alias view of some underlying
- * state which is also visible via another register, and that the other
- * register is handling migration and reset; registers marked ALIAS will not be
- * migrated but may have their state set by syncing of register state from KVM.
- * NO_RAW indicates that this register has no underlying state and does not
- * support raw access for state saving/loading; it will not be used for either
- * migration or KVM state synchronization. (Typically this is for "registers"
- * which are actually used as instructions for cache maintenance and so on.)
- * IO indicates that this register does I/O and therefore its accesses
- * need to be marked with gen_io_start() and also end the TB. In particular,
- * registers which implement clocks or timers require this.
- * RAISES_EXC is for when the read or write hook might raise an exception;
- * the generated code will synchronize the CPU state before calling the hook
- * so that it is safe for the hook to call raise_exception().
- * NEWEL is for writes to registers that might change the exception
- * level - typically on older ARM chips. For those cases we need to
- * re-read the new el when recomputing the translation flags.
+ * ARMCPRegInfo type field bits:
  */
-#define ARM_CP_SPECIAL           0x0001
-#define ARM_CP_CONST             0x0002
-#define ARM_CP_64BIT             0x0004
-#define ARM_CP_SUPPRESS_TB_END   0x0008
-#define ARM_CP_OVERRIDE          0x0010
-#define ARM_CP_ALIAS             0x0020
-#define ARM_CP_IO                0x0040
-#define ARM_CP_NO_RAW            0x0080
-#define ARM_CP_NOP               (ARM_CP_SPECIAL | 0x0100)
-#define ARM_CP_WFI               (ARM_CP_SPECIAL | 0x0200)
-#define ARM_CP_NZCV              (ARM_CP_SPECIAL | 0x0300)
-#define ARM_CP_CURRENTEL         (ARM_CP_SPECIAL | 0x0400)
-#define ARM_CP_DC_ZVA            (ARM_CP_SPECIAL | 0x0500)
-#define ARM_CP_DC_GVA            (ARM_CP_SPECIAL | 0x0600)
-#define ARM_CP_DC_GZVA           (ARM_CP_SPECIAL | 0x0700)
-#define ARM_LAST_SPECIAL         ARM_CP_DC_GZVA
-#define ARM_CP_FPU               0x1000
-#define ARM_CP_SVE               0x2000
-#define ARM_CP_NO_GDB            0x4000
-#define ARM_CP_RAISES_EXC        0x8000
-#define ARM_CP_NEWEL             0x10000
-/* Mask of only the flag bits in a type field */
-#define ARM_CP_FLAG_MASK         0x1f0ff
+enum {
+    /*
+     * Register must be handled specially during translation.
+     * The method is one of the values below:
+     */
+    ARM_CP_SPECIAL_MASK          = 0x000f,
+    /*
+     * Special: sysreg with constant value, writes ignored.
+     * The nop alias is slightly clearer for describing write-only sysregs.
+     */
+    ARM_CP_CONST                 = 0x0001,
+    ARM_CP_NOP                   = ARM_CP_CONST,
+    /* Special: sysreg is WFI, for v5 and v6. */
+    ARM_CP_WFI                   = 0x0002,
+    /* Special: sysreg is NZCV. */
+    ARM_CP_NZCV                  = 0x0003,
+    /* Special: sysreg is CURRENTEL. */
+    ARM_CP_CURRENTEL             = 0x0004,
+    /* Special: sysreg is DC ZVA or similar. */
+    ARM_CP_DC_ZVA                = 0x0005,
+    ARM_CP_DC_GVA                = 0x0006,
+    ARM_CP_DC_GZVA               = 0x0007,
+
+    /* Flag: For ARM_CP_STATE_AA32, sysreg is 64-bit. */
+    ARM_CP_64BIT                 = 1 << 4,
+    /*
+     * Flag: TB should not be ended after a write to this register
+     * (the default is that the TB ends after cp writes).
+     */
+    ARM_CP_SUPPRESS_TB_END       = 1 << 5,
+    /*
+     * Flag: Permit a register definition to override a previous definition
+     * for the same (cp, is64, crn, crm, opc1, opc2) tuple: either the new
+     * or the old must have the ARM_CP_OVERRIDE bit set.
+     */
+    ARM_CP_OVERRIDE              = 1 << 6,
+    /*
+     * Flag: Register is an alias view of some underlying state which is also
+     * visible via another register, and that the other register is handling
+     * migration and reset; registers marked ARM_CP_ALIAS will not be migrated
+     * but may have their state set by syncing of register state from KVM.
+     */
+    ARM_CP_ALIAS                 = 1 << 7,
+    /*
+     * Flag: Register does I/O and therefore its accesses need to be marked
+     * with gen_io_start() and also end the TB. In particular, registers which
+     * implement clocks or timers require this.
+     */
+    ARM_CP_IO                    = 1 << 8,
+    /*
+     * Flag: Register has no underlying state and does not support raw access
+     * for state saving/loading; it will not be used for either migration or
+     * KVM state synchronization. Typically this is for "registers" which are
+     * actually used as instructions for cache maintenance and so on.
+     */
+    ARM_CP_NO_RAW                = 1 << 9,
+    /*
+     * Flag: The read or write hook might raise an exception; the generated
+     * code will synchronize the CPU state before calling the hook so that it
+     * is safe for the hook to call raise_exception().
+     */
+    ARM_CP_RAISES_EXC            = 1 << 10,
+    /*
+     * Flag: Writes to the sysreg might change the exception level - typically
+     * on older ARM chips. For those cases we need to re-read the new el when
+     * recomputing the translation flags.
+     */
+    ARM_CP_NEWEL                 = 1 << 11,
+    /*
+     * Flag: Access check for this sysreg is identical to accessing FPU state
+     * from an instruction: use translation fp_access_check().
+     */
+    ARM_CP_FPU                   = 1 << 12,
+    /*
+     * Flag: Access check for this sysreg is identical to accessing SVE state
+     * from an instruction: use translation sve_access_check().
+     */
+    ARM_CP_SVE                   = 1 << 13,
+    /* Flag: Do not expose in gdb sysreg xml. */
+    ARM_CP_NO_GDB                = 1 << 14,
+};
 
 /*
  * Valid values for ARMCPRegInfo state field, indicating which of
@@ -249,7 +281,7 @@ struct ARMCPRegInfo {
     /*
      * Offset of the field in CPUARMState for this register.
      * This is not needed if either:
-     *  1. type is ARM_CP_CONST or one of the ARM_CP_SPECIALs
+     *  1. type has ARM_CP_SPECIAL_MASK non-zero
      *  2. both readfn and writefn are specified
      */
     ptrdiff_t fieldoffset; /* offsetof(CPUARMState, field) */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 066fe6250a..92fc75b2bf 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -117,7 +117,7 @@ static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque)
     ARMCPRegInfo *ri = value;
     ARMCPU *cpu = opaque;
 
-    if (ri->type & (ARM_CP_SPECIAL | ARM_CP_ALIAS)) {
+    if (ri->type & (ARM_CP_SPECIAL_MASK | ARM_CP_ALIAS)) {
         return;
     }
 
@@ -153,7 +153,7 @@ static void cp_reg_check_reset(gpointer key, gpointer value,  gpointer opaque)
     ARMCPU *cpu = opaque;
     uint64_t oldvalue, newvalue;
 
-    if (ri->type & (ARM_CP_SPECIAL | ARM_CP_ALIAS | ARM_CP_NO_RAW)) {
+    if (ri->type & (ARM_CP_SPECIAL_MASK | ARM_CP_ALIAS | ARM_CP_NO_RAW)) {
         return;
     }
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 94b41c7e88..1bbaf0a3af 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8601,7 +8601,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
      * multiple times. Special registers (ie NOP/WFI) are
      * never migratable and not even raw-accessible.
      */
-    if ((r->type & ARM_CP_SPECIAL)) {
+    if (r->type & ARM_CP_SPECIAL_MASK) {
         r2->type |= ARM_CP_NO_RAW;
     }
     if (((r->crm == CP_ANY) && crm != 0) ||
@@ -8751,7 +8751,7 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
     /* Check that the register definition has enough info to handle
      * reads and writes if they are permitted.
      */
-    if (!(r->type & (ARM_CP_SPECIAL|ARM_CP_CONST))) {
+    if (!(r->type & (ARM_CP_SPECIAL_MASK | ARM_CP_CONST))) {
         if (r->access & PL3_R) {
             assert((r->fieldoffset ||
                    (r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1])) ||
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 92b91f0307..98dbc8203f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1833,8 +1833,14 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
     }
 
     /* Handle special cases first */
-    switch (ri->type & ~(ARM_CP_FLAG_MASK & ~ARM_CP_SPECIAL)) {
-    case ARM_CP_NOP:
+    switch (ri->type & ARM_CP_SPECIAL_MASK) {
+    case 0:
+        break;
+    case ARM_CP_CONST:
+        if (isread) {
+            tcg_rt = cpu_reg(s, rt);
+            tcg_gen_movi_i64(tcg_rt, ri->resetvalue);
+        }
         return;
     case ARM_CP_NZCV:
         tcg_rt = cpu_reg(s, rt);
@@ -1908,7 +1914,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         }
         return;
     default:
-        break;
+        g_assert_not_reached();
     }
     if ((ri->type & ARM_CP_FPU) && !fp_access_check(s)) {
         return;
@@ -1923,18 +1929,13 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
     tcg_rt = cpu_reg(s, rt);
 
     if (isread) {
-        if (ri->type & ARM_CP_CONST) {
-            tcg_gen_movi_i64(tcg_rt, ri->resetvalue);
-        } else if (ri->readfn) {
+        if (ri->readfn) {
             gen_helper_get_cp_reg64(tcg_rt, cpu_env, tcg_constant_ptr(ri));
         } else {
             tcg_gen_ld_i64(tcg_rt, cpu_env, ri->fieldoffset);
         }
     } else {
-        if (ri->type & ARM_CP_CONST) {
-            /* If not forbidden by access permissions, treat as WI */
-            return;
-        } else if (ri->writefn) {
+        if (ri->writefn) {
             gen_helper_set_cp_reg64(cpu_env, tcg_constant_ptr(ri), tcg_rt);
         } else {
             tcg_gen_st_i64(tcg_rt, cpu_env, ri->fieldoffset);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1fe48e4e1c..9370b44707 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4744,8 +4744,16 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
         }
 
         /* Handle special cases first */
-        switch (ri->type & ~(ARM_CP_FLAG_MASK & ~ARM_CP_SPECIAL)) {
-        case ARM_CP_NOP:
+        switch (ri->type & ARM_CP_SPECIAL_MASK) {
+        case 0:
+            break;
+        case ARM_CP_CONST:
+            if (isread) {
+                store_reg(s, rt, tcg_constant_i32(ri->resetvalue));
+                if (is64) {
+                    store_reg(s, rt2, tcg_constant_i32(ri->resetvalue >> 32));
+                }
+            }
             return;
         case ARM_CP_WFI:
             if (isread) {
@@ -4756,7 +4764,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             s->base.is_jmp = DISAS_WFI;
             return;
         default:
-            break;
+            g_assert_not_reached();
         }
 
         if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
@@ -4768,9 +4776,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             if (is64) {
                 TCGv_i64 tmp64;
                 TCGv_i32 tmp;
-                if (ri->type & ARM_CP_CONST) {
-                    tmp64 = tcg_constant_i64(ri->resetvalue);
-                } else if (ri->readfn) {
+                if (ri->readfn) {
                     tmp64 = tcg_temp_new_i64();
                     gen_helper_get_cp_reg64(tmp64, cpu_env,
                                             tcg_constant_ptr(ri));
@@ -4787,9 +4793,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
                 store_reg(s, rt2, tmp);
             } else {
                 TCGv_i32 tmp;
-                if (ri->type & ARM_CP_CONST) {
-                    tmp = tcg_constant_i32(ri->resetvalue);
-                } else if (ri->readfn) {
+                if (ri->readfn) {
                     tmp = tcg_temp_new_i32();
                     gen_helper_get_cp_reg(tmp, cpu_env, tcg_constant_ptr(ri));
                 } else {
@@ -4807,11 +4811,6 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             }
         } else {
             /* Write */
-            if (ri->type & ARM_CP_CONST) {
-                /* If not forbidden by access permissions, treat as WI */
-                return;
-            }
-
             if (is64) {
                 TCGv_i32 tmplo, tmphi;
                 TCGv_i64 tmp64 = tcg_temp_new_i64();
-- 
2.25.1


