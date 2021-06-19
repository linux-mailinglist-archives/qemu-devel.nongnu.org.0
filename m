Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE133ADB42
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:20:00 +0200 (CEST)
Received: from localhost ([::1]:42048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufZX-0000v6-KB
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUm-0000nS-UC
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:05 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:42935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUj-0002H9-3K
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:04 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 13-20020a17090a08cdb029016eed209ca4so7788166pjn.1
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=enag5t9ucLqzxU+wgX9ngItIHENTMN1ScQ87ee6B1uY=;
 b=MnSM+TuFngCLx/H8lP1H31sOo8KLoJNfKQRgNcFwpWUhhukIKqCi3IxjQ2lolOmiB+
 9aDiQ/cHrPywgnf+iyJjClf/SK2aq5QkQUIESzoMYiZDD5zOaibKCHiOlGyV+O+obLvx
 Xzz53xH84pBMFtWBrh/LWJGoy9cV19m9TObP9RgST6ktRlBJcz4wEuRbXPeKbVqMFrV3
 u3EiwPx6bJDYYXOKvusgf0qm16OSjC8QZUfyjkk61AXq6X4M2E09P4htVZ2lRpqKAmdO
 PmynpTcallO6iOvdJbdJrNA8km7KSz2aT8q75BbIGz0uhygo5mhzHRM4S/j/2kFCyd9F
 /oFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=enag5t9ucLqzxU+wgX9ngItIHENTMN1ScQ87ee6B1uY=;
 b=Cw/LkmUtV2a3CJMzqByjqYw1m8FZV8/Cn0VLe4PVNXno43ljSrRHfWRvXnEkwTEEZa
 FWbp6c80dDkW2W2OEMGy5sUEsVjTXeQiT0Hpbp7X2iH+yWCzRp5BLROY52+fuSTQI4NH
 f9tiW/Mg3Nn73yyaF1WDOAAgYh0qCPnuRgzMeu49HJ9oi/tkb9Nr5VkYVJRcnjX/QH7x
 JE+L+V5fCJUHt34JjdDbJw8jKiWHMMitO5wPfBSZW11fSfLs31aIp68urqhgj65jII7d
 aRTa4aXeIlCX3tu95/Z/mOni2OHD9JL9uo8z3iMT752uE2GA2W89a1EXmGdYj2gs2pIj
 mX3g==
X-Gm-Message-State: AOAM532AodIu8hD2xlSbudWdNymNd8/JFV7pyPXmgluPm5fI59v4IO62
 EoSOLtW4jVGBPEPKiugblCRdkvroy0S4NQ==
X-Google-Smtp-Source: ABdhPJyip/1KEOzx6et4ij0YFYFexQB3MmLBgS1kJH3djOM/BHL7gW55OSrLVcBmOniprk6G4UV88Q==
X-Received: by 2002:a17:90a:9f8f:: with SMTP id
 o15mr17569219pjp.55.1624126499782; 
 Sat, 19 Jun 2021 11:14:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:14:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/33] tcg/tci: Use ffi for calls
Date: Sat, 19 Jun 2021 11:14:30 -0700
Message-Id: <20210619181452.877683-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This requires adjusting where arguments are stored.
Place them on the stack at left-aligned positions.
Adjust the stack frame to be at entirely positive offsets.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h        |   1 +
 tcg/tci/tcg-target.h     |   2 +-
 tcg/tcg.c                |  64 +++++++++++++-----
 tcg/tci.c                | 142 ++++++++++++++++++++++-----------------
 tcg/tci/tcg-target.c.inc |  50 +++++++-------
 5 files changed, 153 insertions(+), 106 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 064dab383b..236315b682 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -52,6 +52,7 @@
 #define MAX_OPC_PARAM (4 + (MAX_OPC_PARAM_PER_ARG * MAX_OPC_PARAM_ARGS))
 
 #define CPU_TEMP_BUF_NLONGS 128
+#define TCG_STATIC_FRAME_SIZE  (CPU_TEMP_BUF_NLONGS * sizeof(long))
 
 /* Default target word size to pointer size.  */
 #ifndef TCG_TARGET_REG_BITS
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index d0b5f3fa64..f2e5cba539 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -162,7 +162,7 @@ typedef enum {
 
 /* Used for function call generation. */
 #define TCG_TARGET_CALL_STACK_OFFSET    0
-#define TCG_TARGET_STACK_ALIGN          16
+#define TCG_TARGET_STACK_ALIGN          8
 
 #define HAVE_TCG_QEMU_TB_EXEC
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index de1a593ce7..6472c6a8f4 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -147,7 +147,12 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg, TCGReg arg1,
                        intptr_t arg2);
 static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
                         TCGReg base, intptr_t ofs);
+#ifdef CONFIG_TCG_INTERPRETER
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target,
+                         ffi_cif *cif);
+#else
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target);
+#endif
 static bool tcg_target_const_match(int64_t val, TCGType type, int ct);
 #ifdef TCG_TARGET_NEED_LDST_LABELS
 static int tcg_out_ldst_finalize(TCGContext *s);
@@ -1554,25 +1559,37 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
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
+            /*
+             * If stack grows up, then we will be placing successive
+             * arguments at lower addresses, which means we need to
+             * reverse the order compared to how we would normally
+             * treat either big or little-endian.  For those arguments
+             * that will wind up in registers, this still works for
+             * HPPA (the only current STACK_GROWSUP target) since the
+             * argument registers are *also* allocated in decreasing
+             * order.  If another such target is added, this logic may
+             * have to get more complicated to differentiate between
+             * stack arguments and register arguments.
+             */
 #if defined(HOST_WORDS_BIGENDIAN) != defined(TCG_TARGET_STACK_GROWSUP)
             op->args[pi++] = temp_arg(args[i] + 1);
             op->args[pi++] = temp_arg(args[i]);
@@ -3836,6 +3853,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     const int nb_oargs = TCGOP_CALLO(op);
     const int nb_iargs = TCGOP_CALLI(op);
     const TCGLifeData arg_life = op->life;
+    const TCGHelperInfo *info;
     int flags, nb_regs, i;
     TCGReg reg;
     TCGArg arg;
@@ -3847,7 +3865,8 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     TCGRegSet allocated_regs;
 
     func_addr = tcg_call_func(op);
-    flags = tcg_call_flags(op);
+    info = tcg_call_info(op);
+    flags = info->flags;
 
     nb_regs = ARRAY_SIZE(tcg_target_call_iarg_regs);
     if (nb_regs > nb_iargs) {
@@ -3939,7 +3958,16 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
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
index d68c5a4e55..a3d23514cc 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -18,45 +18,26 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "tcg/tcg.h"           /* MAX_OPC_PARAM_IARGS */
+#include "exec/cpu_ldst.h"
+#include "tcg/tcg-op.h"
+#include "qemu/compiler.h"
+#include <ffi.h>
 
-/* Enable TCI assertions only when debugging TCG (and without NDEBUG defined).
- * Without assertions, the interpreter runs much faster. */
+
+/*
+ * Enable TCI assertions only when debugging TCG (and without NDEBUG defined).
+ * Without assertions, the interpreter runs much faster.
+ */
 #if defined(CONFIG_DEBUG_TCG)
 # define tci_assert(cond) assert(cond)
 #else
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
@@ -133,6 +114,7 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   I = immediate (tcg_target_ulong)
  *   l = label or pointer
  *   m = immediate (TCGMemOpIdx)
+ *   n = immediate (call return length)
  *   r = register
  *   s = signed ldst offset
  */
@@ -153,6 +135,18 @@ static void tci_args_l(const uint8_t **tb_ptr, void **l0)
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
@@ -487,11 +481,14 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
+    /* Other call_slots entries initialized at first use (see below). */
+    call_slots[0] = NULL;
     tci_assert(tb_ptr);
 
     for (;;) {
@@ -509,40 +506,58 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -1119,7 +1134,7 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
     TCGCond c;
     TCGMemOpIdx oi;
     uint8_t pos, len;
-    void *ptr;
+    void *ptr, *cif;
     const uint8_t *tb_ptr;
 
     status = info->read_memory_func(addr, buf, 2, info);
@@ -1147,13 +1162,18 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
 
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
index d54c01b9de..fa3de99445 100644
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
 
@@ -822,11 +822,9 @@ static void tcg_target_init(TCGContext *s)
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


