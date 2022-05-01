Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B553251621B
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 08:04:53 +0200 (CEST)
Received: from localhost ([::1]:55530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl2hQ-0008OC-7Q
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 02:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tf-0006oy-6X
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:39 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:40492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tc-0001F2-LC
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:38 -0400
Received: by mail-pf1-x429.google.com with SMTP id i24so10060158pfa.7
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Jy4lKNsi/GmAwKF8EkIwL7sXr4vu9r6V+LNjfDB8TI=;
 b=Tp+hSzokrxeKUmHFrVkD+SLzuiST0fHFv46BCR3ibeqZK07xyemlNk5+rfS1Cd4G22
 TCr382uzoQmsqi7K2R1wU+Xf8EMYue7soOP57b/vajWdjRvewb47kp6oLb0t+lt9DetL
 UlxZO86xFmFTcd8hkaZmL7dRm7LZRGT8JR3hpbaSRLvI/DCVnw7z7Y9U8rPMXX2L5IPh
 T55Gs7zI5cwn1cmYvJ1hX7wCl+cLYJ+Rm6TSXVqTCyliADd7vD5dFKKn+Anxf44N6GRB
 5sqDwakl1Zhw50cwwSto52LETuxQ6/7kvYVQEW7htAj3wkxHtrttdvsaw+BxSiH9unr2
 J5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Jy4lKNsi/GmAwKF8EkIwL7sXr4vu9r6V+LNjfDB8TI=;
 b=UxcII0efG8aH9nbC62hcuqKhKBxxBHKKEXWpoK4v1+X0WivyUSQuTSklcjqHMr+sSt
 fimx1+G3rLcYa9yqtAOjeOc/IeCGnJhCN76teNK92wJFwm4flb0oFV2wo6bEoCyCRaL6
 Ze7Dvz3AmP7OWcrwEA0ROudNd07/Dyy/jzhROcouaL9wBd49Wg4ENL7d0kw6KFYn9zTs
 FpBKR40nCdn5v3cbtN40gU4wS5jZhx5JjoF/jQ2p0Mwc27HTPz+R0+1a1wgXVE+K27+v
 f82TUOpDNRbOnnbEuk1BAQ3IeNdGOzRrOGtZV5NtmevqNQcq08XUek8x0or8H9rBQURu
 X2/w==
X-Gm-Message-State: AOAM531hMsUR5qn8945K8YVUJsAhBvLUwWOPdz4+EUPrkPDQ0cVW5FKo
 W9x7/wqzZrwZpuSQRk+njNq7MxmkZ6DxAQ==
X-Google-Smtp-Source: ABdhPJzF6xrxM63g1wza8+eovLAOOGwhVKhp2dpSEQYMaecsOMONjc/V1Lh0iExIzAbCulAScJ2ViA==
X-Received: by 2002:a05:6a00:2310:b0:505:a8ac:40e7 with SMTP id
 h16-20020a056a00231000b00505a8ac40e7mr6291405pfh.11.1651384235168; 
 Sat, 30 Apr 2022 22:50:35 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/45] target/arm: Reorg ARMCPRegInfo type field bits
Date: Sat, 30 Apr 2022 22:49:47 -0700
Message-Id: <20220501055028.646596-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Split the large comment block so as to document each
value separately.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Revert merge of ARM_CP_CONST with ARM_CP_NOP.
---
 target/arm/cpregs.h        | 130 +++++++++++++++++++++++--------------
 target/arm/cpu.c           |   4 +-
 target/arm/helper.c        |   4 +-
 target/arm/translate-a64.c |   6 +-
 target/arm/translate.c     |   6 +-
 5 files changed, 92 insertions(+), 58 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index a5231504d5..ff3817decb 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -22,57 +22,87 @@
 #define TARGET_ARM_CPREGS_H
 
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
+    /* Special: no change to PE state: writes ignored, reads ignored. */
+    ARM_CP_NOP                   = 0x0001,
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
+    /* Flag: reads produce resetvalue; writes ignored. */
+    ARM_CP_CONST                 = 1 << 4,
+    /* Flag: For ARM_CP_STATE_AA32, sysreg is 64-bit. */
+    ARM_CP_64BIT                 = 1 << 5,
+    /*
+     * Flag: TB should not be ended after a write to this register
+     * (the default is that the TB ends after cp writes).
+     */
+    ARM_CP_SUPPRESS_TB_END       = 1 << 6,
+    /*
+     * Flag: Permit a register definition to override a previous definition
+     * for the same (cp, is64, crn, crm, opc1, opc2) tuple: either the new
+     * or the old must have the ARM_CP_OVERRIDE bit set.
+     */
+    ARM_CP_OVERRIDE              = 1 << 7,
+    /*
+     * Flag: Register is an alias view of some underlying state which is also
+     * visible via another register, and that the other register is handling
+     * migration and reset; registers marked ARM_CP_ALIAS will not be migrated
+     * but may have their state set by syncing of register state from KVM.
+     */
+    ARM_CP_ALIAS                 = 1 << 8,
+    /*
+     * Flag: Register does I/O and therefore its accesses need to be marked
+     * with gen_io_start() and also end the TB. In particular, registers which
+     * implement clocks or timers require this.
+     */
+    ARM_CP_IO                    = 1 << 9,
+    /*
+     * Flag: Register has no underlying state and does not support raw access
+     * for state saving/loading; it will not be used for either migration or
+     * KVM state synchronization. Typically this is for "registers" which are
+     * actually used as instructions for cache maintenance and so on.
+     */
+    ARM_CP_NO_RAW                = 1 << 10,
+    /*
+     * Flag: The read or write hook might raise an exception; the generated
+     * code will synchronize the CPU state before calling the hook so that it
+     * is safe for the hook to call raise_exception().
+     */
+    ARM_CP_RAISES_EXC            = 1 << 11,
+    /*
+     * Flag: Writes to the sysreg might change the exception level - typically
+     * on older ARM chips. For those cases we need to re-read the new el when
+     * recomputing the translation flags.
+     */
+    ARM_CP_NEWEL                 = 1 << 12,
+    /*
+     * Flag: Access check for this sysreg is identical to accessing FPU state
+     * from an instruction: use translation fp_access_check().
+     */
+    ARM_CP_FPU                   = 1 << 13,
+    /*
+     * Flag: Access check for this sysreg is identical to accessing SVE state
+     * from an instruction: use translation sve_access_check().
+     */
+    ARM_CP_SVE                   = 1 << 14,
+    /* Flag: Do not expose in gdb sysreg xml. */
+    ARM_CP_NO_GDB                = 1 << 15,
+};
 
 /*
  * Valid values for ARMCPRegInfo state field, indicating which of
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 815add74fa..268274ce89 100644
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
index ca6ba9bd82..f84377babe 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8600,7 +8600,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
      * multiple times. Special registers (ie NOP/WFI) are
      * never migratable and not even raw-accessible.
      */
-    if ((r->type & ARM_CP_SPECIAL)) {
+    if (r->type & ARM_CP_SPECIAL_MASK) {
         r2->type |= ARM_CP_NO_RAW;
     }
     if (((r->crm == CP_ANY) && crm != 0) ||
@@ -8750,7 +8750,7 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
     /* Check that the register definition has enough info to handle
      * reads and writes if they are permitted.
      */
-    if (!(r->type & (ARM_CP_SPECIAL|ARM_CP_CONST))) {
+    if (!(r->type & (ARM_CP_SPECIAL_MASK | ARM_CP_CONST))) {
         if (r->access & PL3_R) {
             assert((r->fieldoffset ||
                    (r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1])) ||
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 348a638c5c..a82f5d5984 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1833,7 +1833,9 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
     }
 
     /* Handle special cases first */
-    switch (ri->type & ~(ARM_CP_FLAG_MASK & ~ARM_CP_SPECIAL)) {
+    switch (ri->type & ARM_CP_SPECIAL_MASK) {
+    case 0:
+        break;
     case ARM_CP_NOP:
         return;
     case ARM_CP_NZCV:
@@ -1908,7 +1910,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         }
         return;
     default:
-        break;
+        g_assert_not_reached();
     }
     if ((ri->type & ARM_CP_FPU) && !fp_access_check(s)) {
         return;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index fc7917cdf4..050c237b07 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4744,7 +4744,9 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
         }
 
         /* Handle special cases first */
-        switch (ri->type & ~(ARM_CP_FLAG_MASK & ~ARM_CP_SPECIAL)) {
+        switch (ri->type & ARM_CP_SPECIAL_MASK) {
+        case 0:
+            break;
         case ARM_CP_NOP:
             return;
         case ARM_CP_WFI:
@@ -4756,7 +4758,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             s->base.is_jmp = DISAS_WFI;
             return;
         default:
-            break;
+            g_assert_not_reached();
         }
 
         if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
-- 
2.34.1


