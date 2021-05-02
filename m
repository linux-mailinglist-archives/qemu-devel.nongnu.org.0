Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062E8371001
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 02:09:58 +0200 (CEST)
Received: from localhost ([::1]:59152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldM9t-0005B7-44
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 20:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLy1-0007gH-3Q
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:41 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:36681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxy-0000bY-IO
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:40 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so4753205pjh.1
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vhc/GKP7y/qsiSl5PMb5FZmO7ZoNGxOsPQ3ohDHs7rw=;
 b=fnYD/VL5Wy97uIgZow00J3cUMCT+mjOO5oZaH7qQG4xwmw+F+Jz1gc7XAz3Bd1aNJf
 7879rg+VYk0cmexAJyFu59B/5fTRbQ84EmYeSBZ1DCKcNVnWasQs6/SrpfAq3HZvRjeK
 9rn1X0kSJ18PD1sbBWmjZhdtv/GaicK0K6s8vAUnZXwVoknR5rSn87JOPUtqbFVG3f73
 w3+4JqPwmL3bmL/1wUPIFukFL9mcq0cz6oIGGYUyhDqL8a9EiVnA02m7BG+TMFsmBc0Z
 hfjqRZwx+exHnOJHoLw3B/RwVoKRfIUaukL0p+qSgYLkBHH4vESTylo92fzvcD+QDyXa
 y/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vhc/GKP7y/qsiSl5PMb5FZmO7ZoNGxOsPQ3ohDHs7rw=;
 b=AODlonYKynatiwXclWNePMohNsrEjCfynxNq4sGd67O7FbgjnKYyZWSqiE7qST2J8N
 c41JNHe2sUdC7aH5EoBnoQbfyfqb5cFj1F6cS2vWxGfiko8hGIhjxVIxQmI3WZ1l7G1H
 9yrJIOwdir6Mm08W6xhlNGfTSVpFpjV2Lh3AZfRabcXi68wOVW/3vpuHieTJI8PHcMMa
 DXXthIphALjwWUjQeNU7T9WtGXQrknOJuG3wnx0kIYDR7XVUjS3MOybgD4JeKGKXKZr9
 44UeeXlwFTRrqyF/gNZw8dSU/jRX3TQWHJ0zswoT72TXFC/0/DUHAHUqrIrdKilFHRXW
 42yA==
X-Gm-Message-State: AOAM531S6EqAnoSiKefPINph59p4yprchCJoJEO3yn7tgALnjm2BaBhQ
 97z4w2C5g1cJmPef+Zxf7I4RvJRg4yhxoA==
X-Google-Smtp-Source: ABdhPJxZyZADtzTDnJHQQbwc/BCJmRk+RknTX35daGFQ/UIjPMQqKsbEGEyHP/rnFNYSL4q3e90G7w==
X-Received: by 2002:a17:90b:148c:: with SMTP id
 js12mr27896068pjb.147.1619999857137; 
 Sun, 02 May 2021 16:57:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 11/26] tcg/tci: Use ffi for calls
Date: Sun,  2 May 2021 16:57:12 -0700
Message-Id: <20210502235727.1979457-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

This requires adjusting where arguments are stored.
Place them on the stack at left-aligned positions.
Adjust the stack frame to be at entirely positive offsets.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h        |   1 +
 tcg/tci/tcg-target.h     |   2 +-
 tcg/tcg.c                |  64 +++++++++++++------
 tcg/tci.c                | 135 ++++++++++++++++++++++-----------------
 tcg/tci/tcg-target.c.inc |  50 +++++++--------
 5 files changed, 148 insertions(+), 104 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 0f0695e90d..e5573a9877 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -53,6 +53,7 @@
 #define MAX_OPC_PARAM (4 + (MAX_OPC_PARAM_PER_ARG * MAX_OPC_PARAM_ARGS))
 
 #define CPU_TEMP_BUF_NLONGS 128
+#define TCG_STATIC_FRAME_SIZE  (CPU_TEMP_BUF_NLONGS * sizeof(long))
 
 /* Default target word size to pointer size.  */
 #ifndef TCG_TARGET_REG_BITS
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 52af6d8bc5..4df10e2e83 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -161,7 +161,7 @@ typedef enum {
 
 /* Used for function call generation. */
 #define TCG_TARGET_CALL_STACK_OFFSET    0
-#define TCG_TARGET_STACK_ALIGN          16
+#define TCG_TARGET_STACK_ALIGN          8
 
 #define HAVE_TCG_QEMU_TB_EXEC
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 8bb65ff1c6..7b9e31d15e 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -154,7 +154,12 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg, TCGReg arg1,
                        intptr_t arg2);
 static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
                         TCGReg base, intptr_t ofs);
+#ifdef CONFIG_TCG_INTERPRETER
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target,
+                         ffi_cif *cif);
+#else
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target);
+#endif
 static int tcg_target_const_match(tcg_target_long val, TCGType type,
                                   const TCGArgConstraint *arg_ct);
 #ifdef TCG_TARGET_NEED_LDST_LABELS
@@ -2124,25 +2129,37 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
     for (i = 0; i < nargs; i++) {
         int argtype = extract32(typemask, (i + 1) * 3, 3);
         bool is_64bit = (argtype & ~1) == dh_typecode_i64;
+        bool want_align = false;
+
+#if defined(CONFIG_TCG_INTERPRETER)
+        /*
+         * Align all arguments, so that they land in predictable places
+         * for passing off to ffi_call.
+         */
+        want_align = true;
+#elif defined(TCG_TARGET_CALL_ALIGN_ARGS)
+        /* Some targets want aligned 64 bit args */
+        want_align = is_64bit;
+#endif
+
+        if (TCG_TARGET_REG_BITS < 64 && want_align && (real_args & 1)) {
+            op->args[pi++] = TCG_CALL_DUMMY_ARG;
+            real_args++;
+        }
 
         if (TCG_TARGET_REG_BITS < 64 && is_64bit) {
-#ifdef TCG_TARGET_CALL_ALIGN_ARGS
-            /* some targets want aligned 64 bit args */
-            if (real_args & 1) {
-                op->args[pi++] = TCG_CALL_DUMMY_ARG;
-                real_args++;
-            }
-#endif
-           /* If stack grows up, then we will be placing successive
-              arguments at lower addresses, which means we need to
-              reverse the order compared to how we would normally
-              treat either big or little-endian.  For those arguments
-              that will wind up in registers, this still works for
-              HPPA (the only current STACK_GROWSUP target) since the
-              argument registers are *also* allocated in decreasing
-              order.  If another such target is added, this logic may
-              have to get more complicated to differentiate between
-              stack arguments and register arguments.  */
+           /*
+            * If stack grows up, then we will be placing successive
+            * arguments at lower addresses, which means we need to
+            * reverse the order compared to how we would normally
+            * treat either big or little-endian.  For those arguments
+            * that will wind up in registers, this still works for
+            * HPPA (the only current STACK_GROWSUP target) since the
+            * argument registers are *also* allocated in decreasing
+            * order.  If another such target is added, this logic may
+            * have to get more complicated to differentiate between
+            * stack arguments and register arguments.
+            */
 #if defined(HOST_WORDS_BIGENDIAN) != defined(TCG_TARGET_STACK_GROWSUP)
             op->args[pi++] = temp_arg(args[i] + 1);
             op->args[pi++] = temp_arg(args[i]);
@@ -4393,6 +4410,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     const int nb_oargs = TCGOP_CALLO(op);
     const int nb_iargs = TCGOP_CALLI(op);
     const TCGLifeData arg_life = op->life;
+    const TCGHelperInfo *info;
     int flags, nb_regs, i;
     TCGReg reg;
     TCGArg arg;
@@ -4404,7 +4422,8 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     TCGRegSet allocated_regs;
 
     func_addr = tcg_call_func(op);
-    flags = tcg_call_flags(op);
+    info = tcg_call_info(op);
+    flags = info->flags;
 
     nb_regs = ARRAY_SIZE(tcg_target_call_iarg_regs);
     if (nb_regs > nb_iargs) {
@@ -4496,7 +4515,16 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         save_globals(s, allocated_regs);
     }
 
+#ifdef CONFIG_TCG_INTERPRETER
+    {
+        gpointer hash = (gpointer)(uintptr_t)info->typemask;
+        ffi_cif *cif = g_hash_table_lookup(ffi_table, hash);
+        assert(cif != NULL);
+        tcg_out_call(s, func_addr, cif);
+    }
+#else
     tcg_out_call(s, func_addr);
+#endif
 
     /* assign output registers and emit moves if needed */
     for(i = 0; i < nb_oargs; i++) {
diff --git a/tcg/tci.c b/tcg/tci.c
index d68c5a4e55..743c12af67 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -18,6 +18,13 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "tcg/tcg.h"           /* MAX_OPC_PARAM_IARGS */
+#include "exec/cpu_ldst.h"
+#include "tcg/tcg-op.h"
+#include "qemu/compiler.h"
+#include <ffi.h>
+
 
 /* Enable TCI assertions only when debugging TCG (and without NDEBUG defined).
  * Without assertions, the interpreter runs much faster. */
@@ -27,36 +34,8 @@
 # define tci_assert(cond) ((void)(cond))
 #endif
 
-#include "qemu-common.h"
-#include "tcg/tcg.h"           /* MAX_OPC_PARAM_IARGS */
-#include "exec/cpu_ldst.h"
-#include "tcg/tcg-op.h"
-#include "qemu/compiler.h"
-
-#if MAX_OPC_PARAM_IARGS != 6
-# error Fix needed, number of supported input arguments changed!
-#endif
-#if TCG_TARGET_REG_BITS == 32
-typedef uint64_t (*helper_function)(tcg_target_ulong, tcg_target_ulong,
-                                    tcg_target_ulong, tcg_target_ulong,
-                                    tcg_target_ulong, tcg_target_ulong,
-                                    tcg_target_ulong, tcg_target_ulong,
-                                    tcg_target_ulong, tcg_target_ulong,
-                                    tcg_target_ulong, tcg_target_ulong);
-#else
-typedef uint64_t (*helper_function)(tcg_target_ulong, tcg_target_ulong,
-                                    tcg_target_ulong, tcg_target_ulong,
-                                    tcg_target_ulong, tcg_target_ulong);
-#endif
-
 __thread uintptr_t tci_tb_ptr;
 
-static tcg_target_ulong tci_read_reg(const tcg_target_ulong *regs, TCGReg index)
-{
-    tci_assert(index < TCG_TARGET_NB_REGS);
-    return regs[index];
-}
-
 static void
 tci_write_reg(tcg_target_ulong *regs, TCGReg index, tcg_target_ulong value)
 {
@@ -133,6 +112,7 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   I = immediate (tcg_target_ulong)
  *   l = label or pointer
  *   m = immediate (TCGMemOpIdx)
+ *   n = immediate (call return length)
  *   r = register
  *   s = signed ldst offset
  */
@@ -153,6 +133,18 @@ static void tci_args_l(const uint8_t **tb_ptr, void **l0)
     check_size(start, tb_ptr);
 }
 
+static void tci_args_nll(const uint8_t **tb_ptr, uint8_t *n0,
+                         void **l1, void **l2)
+{
+    const uint8_t *start = *tb_ptr;
+
+    *n0 = tci_read_b(tb_ptr);
+    *l1 = (void *)tci_read_label(tb_ptr);
+    *l2 = (void *)tci_read_label(tb_ptr);
+
+    check_size(start, tb_ptr);
+}
+
 static void tci_args_rr(const uint8_t **tb_ptr,
                         TCGReg *r0, TCGReg *r1)
 {
@@ -487,11 +479,13 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 {
     const uint8_t *tb_ptr = v_tb_ptr;
     tcg_target_ulong regs[TCG_TARGET_NB_REGS];
-    long tcg_temps[CPU_TEMP_BUF_NLONGS];
-    uintptr_t sp_value = (uintptr_t)(tcg_temps + CPU_TEMP_BUF_NLONGS);
+    uint64_t stack[(TCG_STATIC_CALL_ARGS_SIZE + TCG_STATIC_FRAME_SIZE)
+                   / sizeof(uint64_t)];
+    void *call_slots[TCG_STATIC_CALL_ARGS_SIZE / sizeof(uint64_t)];
 
     regs[TCG_AREG0] = (tcg_target_ulong)env;
-    regs[TCG_REG_CALL_STACK] = sp_value;
+    regs[TCG_REG_CALL_STACK] = (uintptr_t)stack;
+    call_slots[0] = NULL;
     tci_assert(tb_ptr);
 
     for (;;) {
@@ -509,40 +503,58 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
         TCGMemOpIdx oi;
         int32_t ofs;
-        void *ptr;
+        void *ptr, *cif;
 
         /* Skip opcode and size entry. */
         tb_ptr += 2;
 
         switch (opc) {
         case INDEX_op_call:
-            tci_args_l(&tb_ptr, &ptr);
+            /*
+             * Set up the ffi_avalue array once, delayed until now
+             * because many TB's do not make any calls. In tcg_gen_callN,
+             * we arranged for every real argument to be "left-aligned"
+             * in each 64-bit slot.
+             */
+            if (unlikely(call_slots[0] == NULL)) {
+                for (int i = 0; i < ARRAY_SIZE(call_slots); ++i) {
+                    call_slots[i] = &stack[i];
+                }
+            }
+
+            tci_args_nll(&tb_ptr, &len, &ptr, &cif);
+
+            /* Helper functions may need to access the "return address" */
             tci_tb_ptr = (uintptr_t)tb_ptr;
-#if TCG_TARGET_REG_BITS == 32
-            tmp64 = ((helper_function)ptr)(tci_read_reg(regs, TCG_REG_R0),
-                                           tci_read_reg(regs, TCG_REG_R1),
-                                           tci_read_reg(regs, TCG_REG_R2),
-                                           tci_read_reg(regs, TCG_REG_R3),
-                                           tci_read_reg(regs, TCG_REG_R4),
-                                           tci_read_reg(regs, TCG_REG_R5),
-                                           tci_read_reg(regs, TCG_REG_R6),
-                                           tci_read_reg(regs, TCG_REG_R7),
-                                           tci_read_reg(regs, TCG_REG_R8),
-                                           tci_read_reg(regs, TCG_REG_R9),
-                                           tci_read_reg(regs, TCG_REG_R10),
-                                           tci_read_reg(regs, TCG_REG_R11));
-            tci_write_reg(regs, TCG_REG_R0, tmp64);
-            tci_write_reg(regs, TCG_REG_R1, tmp64 >> 32);
-#else
-            tmp64 = ((helper_function)ptr)(tci_read_reg(regs, TCG_REG_R0),
-                                           tci_read_reg(regs, TCG_REG_R1),
-                                           tci_read_reg(regs, TCG_REG_R2),
-                                           tci_read_reg(regs, TCG_REG_R3),
-                                           tci_read_reg(regs, TCG_REG_R4),
-                                           tci_read_reg(regs, TCG_REG_R5));
-            tci_write_reg(regs, TCG_REG_R0, tmp64);
-#endif
+
+            ffi_call(cif, ptr, stack, call_slots);
+
+            /* Any result winds up "left-aligned" in the stack[0] slot. */
+            switch (len) {
+            case 0: /* void */
+                break;
+            case 1: /* uint32_t */
+                /*
+                 * Note that libffi has an odd special case in that it will
+                 * always widen an integral result to ffi_arg.
+                 */
+                if (sizeof(ffi_arg) == 4) {
+                    regs[TCG_REG_R0] = *(uint32_t *)stack;
+                    break;
+                }
+                /* fall through */
+            case 2: /* uint64_t */
+                if (TCG_TARGET_REG_BITS == 32) {
+                    tci_write_reg64(regs, TCG_REG_R1, TCG_REG_R0, stack[0]);
+                } else {
+                    regs[TCG_REG_R0] = stack[0];
+                }
+                break;
+            default:
+                g_assert_not_reached();
+            }
             break;
+
         case INDEX_op_br:
             tci_args_l(&tb_ptr, &ptr);
             tb_ptr = ptr;
@@ -1119,7 +1131,7 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
     TCGCond c;
     TCGMemOpIdx oi;
     uint8_t pos, len;
-    void *ptr;
+    void *ptr, *cif;
     const uint8_t *tb_ptr;
 
     status = info->read_memory_func(addr, buf, 2, info);
@@ -1147,13 +1159,18 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
 
     switch (op) {
     case INDEX_op_br:
-    case INDEX_op_call:
     case INDEX_op_exit_tb:
     case INDEX_op_goto_tb:
         tci_args_l(&tb_ptr, &ptr);
         info->fprintf_func(info->stream, "%-12s  %p", op_name, ptr);
         break;
 
+    case INDEX_op_call:
+        tci_args_nll(&tb_ptr, &len, &ptr, &cif);
+        info->fprintf_func(info->stream, "%-12s  %d, %p, %p",
+                           op_name, len, ptr, cif);
+        break;
+
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
         tci_args_rrcl(&tb_ptr, &r0, &r1, &c, &ptr);
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 288e945465..9ab7916300 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -192,23 +192,8 @@ static const int tcg_target_reg_alloc_order[] = {
 # error Fix needed, number of supported input arguments changed!
 #endif
 
-static const int tcg_target_call_iarg_regs[] = {
-    TCG_REG_R0,
-    TCG_REG_R1,
-    TCG_REG_R2,
-    TCG_REG_R3,
-    TCG_REG_R4,
-    TCG_REG_R5,
-#if TCG_TARGET_REG_BITS == 32
-    /* 32 bit hosts need 2 * MAX_OPC_PARAM_IARGS registers. */
-    TCG_REG_R6,
-    TCG_REG_R7,
-    TCG_REG_R8,
-    TCG_REG_R9,
-    TCG_REG_R10,
-    TCG_REG_R11,
-#endif
-};
+/* No call arguments via registers.  All will be stored on the "stack". */
+static const int tcg_target_call_iarg_regs[] = { };
 
 static const int tcg_target_call_oarg_regs[] = {
     TCG_REG_R0,
@@ -292,8 +277,9 @@ static void tci_out_label(TCGContext *s, TCGLabel *label)
 static void stack_bounds_check(TCGReg base, target_long offset)
 {
     if (base == TCG_REG_CALL_STACK) {
-        tcg_debug_assert(offset < 0);
-        tcg_debug_assert(offset >= -(CPU_TEMP_BUF_NLONGS * sizeof(long)));
+        tcg_debug_assert(offset >= 0);
+        tcg_debug_assert(offset < (TCG_STATIC_CALL_ARGS_SIZE +
+                                   TCG_STATIC_FRAME_SIZE));
     }
 }
 
@@ -593,11 +579,25 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     }
 }
 
-static inline void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *func,
+                         ffi_cif *cif)
 {
     uint8_t *old_code_ptr = s->code_ptr;
+    uint8_t which;
+
+    if (cif->rtype == &ffi_type_void) {
+        which = 0;
+    } else if (cif->rtype->size == 4) {
+        which = 1;
+    } else {
+        tcg_debug_assert(cif->rtype->size == 8);
+        which = 2;
+    }
     tcg_out_op_t(s, INDEX_op_call);
-    tcg_out_i(s, (uintptr_t)arg);
+    tcg_out8(s, which);
+    tcg_out_i(s, (uintptr_t)func);
+    tcg_out_i(s, (uintptr_t)cif);
+
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
@@ -824,11 +824,9 @@ static void tcg_target_init(TCGContext *s)
     s->reserved_regs = 0;
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
 
-    /* We use negative offsets from "sp" so that we can distinguish
-       stores that might pretend to be call arguments.  */
-    tcg_set_frame(s, TCG_REG_CALL_STACK,
-                  -CPU_TEMP_BUF_NLONGS * sizeof(long),
-                  CPU_TEMP_BUF_NLONGS * sizeof(long));
+    /* The call arguments come first, followed by the temp storage. */
+    tcg_set_frame(s, TCG_REG_CALL_STACK, TCG_STATIC_CALL_ARGS_SIZE,
+                  TCG_STATIC_FRAME_SIZE);
 }
 
 /* Generate global QEMU prologue and epilogue code. */
-- 
2.25.1


