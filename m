Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AE430EA59
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:43:27 +0100 (CET)
Received: from localhost ([::1]:42150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UcA-0003B0-9K
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:43:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjf-0006Bn-Bf
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:07 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjc-00047i-DS
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:07 -0500
Received: by mail-pj1-x1034.google.com with SMTP id e9so831867pjj.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vBr7vhN4PGwbH1KaQVzNdMhftTOwE1A/EapiaKgFiUE=;
 b=CO9J7dL7EWXW/OBV9snxEJgzSf/GIUx2LVvCTNBerfGYfq7AKev9x8K1/6J2U25fBo
 7EvCGMBEl+BY+5RjjH2tie4ct03kphd74zCxe2O9nb3pZGSRMpoBiw0tetfIaJzVH2Gb
 pmJMRhGOTMrUbKjBabGjwojOjRGpNsTCxGrSfb5u/YN5BhQA1yuf75uWX9HpN4IM58gk
 mniAHjszYrvxKMFxR1Kg4tMaQAAHqY+VXIVmx8aC9vSx3trAMW57kWS4aRJZ+lu6s5bH
 YHAHC05gtZR7KF96YLyGsu64mdxtqwKOOFqITGpMPwruqRtFPzxM0qiuhysZLai4dIrA
 ancg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vBr7vhN4PGwbH1KaQVzNdMhftTOwE1A/EapiaKgFiUE=;
 b=tyXDHK3uqNDrNFhM4Z9PD5IBFlUsEkKQxDS3M9FGdpJActmeExuvPwNfLbd0fxuOh1
 XKpBdD7me5PI+qMSuOVGkrE4Qa+2Ajdn7CNyoN+Doqnvy1HmK7HQyo45iPs/6RGcrryJ
 PvYHmHsRWPWP2FZhzu6CsapVsWLUxj7AEzZ6yxW3lrO3Pw67uI/9zkAvnQxQNCtx+lBu
 EVBCUb9rZ01p7fFLmJRFQxbzEkPA1QZKN4/FK8gKYtWZ1RPS+fiBBOUVAY1G2oJo11X4
 aWcyqyiGppBX5ryAGG9GgKlHqE6mA/tnHBWdum8PH4P7ugVSoZ0Q7XOVJZfqiUbbMpvk
 Yjmg==
X-Gm-Message-State: AOAM532bBq/gAVp9HbWiEt+e1kAPfzhojx5uIPYagoWr1oajiAmHyDTO
 zwQO4h3c2aiNT9svj2oRMSrGhHEjAdGrJ2lh
X-Google-Smtp-Source: ABdhPJyZT1stBXcdfiogQkhz8tMwDgk+vUOOs7WC2hIP8UPuWM4Ml0LHXgxQkAjkBys4M0pJ7a3Fgw==
X-Received: by 2002:a17:902:be0e:b029:e0:5b2:659e with SMTP id
 r14-20020a170902be0eb02900e005b2659emr5693999pls.74.1612403222675; 
 Wed, 03 Feb 2021 17:47:02 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:47:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 63/93] tcg/tci: Use ffi for calls
Date: Wed,  3 Feb 2021 15:44:39 -1000
Message-Id: <20210204014509.882821-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This requires adjusting where arguments are stored.
Place them on the stack at left-aligned positions.
Adjust the stack frame to be at entirely positive offsets.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h        |   1 +
 tcg/tci/tcg-target.h     |   2 +-
 tcg/tcg.c                |  72 ++++++++++++---------
 tcg/tci.c                | 131 ++++++++++++++++++++++-----------------
 tcg/tci/tcg-target.c.inc |  50 +++++++--------
 5 files changed, 143 insertions(+), 113 deletions(-)

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
index 6382112215..92aec0d238 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -208,6 +208,18 @@ static size_t tree_size;
 static TCGRegSet tcg_target_available_regs[TCG_TYPE_COUNT];
 static TCGRegSet tcg_target_call_clobber_regs;
 
+typedef struct TCGHelperInfo {
+    void *func;
+#ifdef CONFIG_TCG_INTERPRETER
+    ffi_cif *cif;
+#endif
+    const char *name;
+    unsigned flags;
+    unsigned sizemask;
+} TCGHelperInfo;
+
+static GHashTable *helper_table;
+
 #if TCG_TARGET_INSN_UNIT_SIZE == 1
 static __attribute__((unused)) inline void tcg_out8(TCGContext *s, uint8_t v)
 {
@@ -1084,16 +1096,6 @@ void tcg_pool_reset(TCGContext *s)
     s->pool_current = NULL;
 }
 
-typedef struct TCGHelperInfo {
-    void *func;
-#ifdef CONFIG_TCG_INTERPRETER
-    ffi_cif *cif;
-#endif
-    const char *name;
-    unsigned flags;
-    unsigned sizemask;
-} TCGHelperInfo;
-
 #include "exec/helper-proto.h"
 
 #ifdef CONFIG_TCG_INTERPRETER
@@ -1103,7 +1105,6 @@ typedef struct TCGHelperInfo {
 static const TCGHelperInfo all_helpers[] = {
 #include "exec/helper-tcg.h"
 };
-static GHashTable *helper_table;
 
 static int indirect_reg_alloc_order[ARRAY_SIZE(tcg_target_reg_alloc_order)];
 static void process_op_defs(TCGContext *s);
@@ -2081,25 +2082,38 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
 
     real_args = 0;
     for (i = 0; i < nargs; i++) {
-        int is_64bit = sizemask & (1 << (i+1)*2);
-        if (TCG_TARGET_REG_BITS < 64 && is_64bit) {
-#ifdef TCG_TARGET_CALL_ALIGN_ARGS
-            /* some targets want aligned 64 bit args */
-            if (real_args & 1) {
-                op->args[pi++] = TCG_CALL_DUMMY_ARG;
-                real_args++;
-            }
+        bool is_64bit = sizemask & (1 << (i+1)*2);
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
 #endif
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
+
+        if (TCG_TARGET_REG_BITS < 64 && want_align && (real_args & 1)) {
+            op->args[pi++] = TCG_CALL_DUMMY_ARG;
+            real_args++;
+        }
+
+        if (TCG_TARGET_REG_BITS < 64 && is_64bit) {
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
diff --git a/tcg/tci.c b/tcg/tci.c
index 6843e837ae..d27db9f720 100644
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
@@ -131,6 +110,7 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   i = immediate (uint32_t)
  *   I = immediate (tcg_target_ulong)
  *   m = immediate (TCGMemOpIdx)
+ *   n = immediate (call return length)
  *   r = register
  *   s = signed ldst offset
  */
@@ -151,6 +131,16 @@ static void tci_args_l(const uint8_t **tb_ptr, void **l0)
     check_size(start, tb_ptr);
 }
 
+static void tci_args_nl(const uint8_t **tb_ptr, uint8_t *n0, void **l1)
+{
+    const uint8_t *start = *tb_ptr;
+
+    *n0 = tci_read_b(tb_ptr);
+    *l1 = (void *)tci_read_label(tb_ptr);
+
+    check_size(start, tb_ptr);
+}
+
 static void tci_args_rr(const uint8_t **tb_ptr,
                         TCGReg *r0, TCGReg *r1)
 {
@@ -491,6 +481,7 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
 # define CASE_64(x)
 #endif
 
+
 /* Interpret pseudo code in tb. */
 /*
  * Disable CFI checks.
@@ -502,11 +493,13 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -531,33 +524,53 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         switch (opc) {
         case INDEX_op_call:
-            tci_args_l(&tb_ptr, &ptr);
+            /*
+             * We are passed a pointer to the TCGHelperInfo, which contains
+             * the function pointer followed by the ffi_cif pointer.
+             */
+            tci_args_nl(&tb_ptr, &len, &ptr);
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
+            /*
+             * Set up the ffi_avalue array once, delayed until now
+             * because many TB's do not make any calls. In tcg_gen_callN,
+             * we arranged for every real argument to be "left-aligned"
+             * in each 64-bit slot.
+             */
+            if (call_slots[0] == NULL) {
+                for (int i = 0; i < ARRAY_SIZE(call_slots); ++i) {
+                    call_slots[i] = &stack[i];
+                }
+            }
+
+            /*
+             * Call the helper function.  Any result winds up
+             * "left-aligned" in the stack[0] slot.
+             */
+            {
+                void **pptr = ptr;
+                ffi_call(pptr[1], pptr[0], stack, call_slots);
+            }
+            switch (len) {
+            case 0: /* void */
+                break;
+            case 1: /* uint32_t */
+                regs[TCG_REG_R0] = *(uint32_t *)stack;
+                break;
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
@@ -1162,13 +1175,17 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
 
     switch (op) {
     case INDEX_op_br:
-    case INDEX_op_call:
     case INDEX_op_exit_tb:
     case INDEX_op_goto_tb:
         tci_args_l(&tb_ptr, &ptr);
         info->fprintf_func(info->stream, "%-12s  %p", op_name, ptr);
         break;
 
+    case INDEX_op_call:
+        tci_args_nl(&tb_ptr, &len, &ptr);
+        info->fprintf_func(info->stream, "%-12s  %d,%p", op_name, len, ptr);
+        break;
+
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
         tci_args_rrcl(&tb_ptr, &r0, &r1, &c, &ptr);
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 7fb3b04eaf..8d75482546 100644
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
 
@@ -360,11 +346,25 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
-static inline void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
 {
     uint8_t *old_code_ptr = s->code_ptr;
+    const TCGHelperInfo *info;
+    uint8_t which;
+
+    info = g_hash_table_lookup(helper_table, (gpointer)arg);
+    if (info->cif->rtype == &ffi_type_void) {
+        which = 0;
+    } else if (info->cif->rtype->size == 4) {
+        which = 1;
+    } else {
+        tcg_debug_assert(info->cif->rtype->size == 8);
+        which = 2;
+    }
     tcg_out_op_t(s, INDEX_op_call);
-    tcg_out_i(s, (uintptr_t)arg);
+    tcg_out8(s, which);
+    tcg_out_i(s, (uintptr_t)info);
+
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
@@ -629,11 +629,9 @@ static void tcg_target_init(TCGContext *s)
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


