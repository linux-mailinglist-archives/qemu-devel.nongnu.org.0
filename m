Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DC068AB52
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:37:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLTz-00054Q-4s; Sat, 04 Feb 2023 11:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTt-00051x-KW
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:40 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTr-0002WZ-Mj
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:37 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 c10-20020a17090a1d0a00b0022e63a94799so11532206pjd.2
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UINX1+4mTGhBQ4AmVP+ze4bhVPphjXby5Wh4M6lnB3A=;
 b=nZLFupi4cUFAhj9n1hbzK4LmasenQbiqeWeh1T+aepFGtamot6RvaBgO3xwmk0VbX7
 GNvhkBGcB/qsUA0zprI7DMlpLn9XEERG2y4lVcQQ/BBTAP3ozJaHA9WtKV7IIGz7b5Vl
 B3wH0gGrDBRevIoxFmJb7zx68PUscOpwjRx72sidRPkUZlMJims5gHMG4nuIc/K/Hyg8
 DQg0PWWhm/pyi38Lo6W8ryXyjPMCRz6+GiK3M/NZQmF0h+mAlBrFnnK7LG7So3qs/SIr
 JdB1RBKpwWQkW/cOxSnvYEwMcb98TpJN677npVRCl//oj+JsmcfyX6pxLGXQxlQDUAQL
 7zXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UINX1+4mTGhBQ4AmVP+ze4bhVPphjXby5Wh4M6lnB3A=;
 b=PFJkoOe4bNQDgBY9b0KEFqb7PIkmxstivwo6jlM9A8CVuc+xZF1b5jSLQ1kcOs/EHM
 EL0T3b2jgaLTzkSDoSkX5Mlc9OLTavU62Q/Zc0rc5tjQG3//TyQdjO3tdUKi8CElf+Gi
 dxlZ3NXG5LOQlbDQCDTUfMyxF0Tt2O3HjkaBGzo4qGBn/uOPO7gmxrW94/EreUbiznmu
 H0xXlAlSSskpgsCCnUQ+HWdEQ9UAYVKhYewAfUVmPMIQVd2stsR3GI/CXlMq36+iOq3k
 fyqlsuCt+GJmf3BnogC+bkKwHSWU4tx2zCbdlFPLnc2LsYxVFbS0PMVOJazkom/CHLzu
 Z3zg==
X-Gm-Message-State: AO0yUKX9VtazendGhuVCH00o2g50nsjRzzO9KMm8qxjNHLe8sCU9GsPI
 pvf/9PImMP9pic//rRJ+tSfpbmfAlUa5Duhq
X-Google-Smtp-Source: AK7set/eZGnFEoGJfhQI1D5aGOu+b4GVoOBiJNsasfCVpCwvPuZbZa9ChF07tJqQFMe+pw4+e5V/wA==
X-Received: by 2002:a17:902:d508:b0:198:b945:4107 with SMTP id
 b8-20020a170902d50800b00198b9454107mr13404734plg.65.1675528414313; 
 Sat, 04 Feb 2023 08:33:34 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:33:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 13/40] tcg/tci: Add TCG_TARGET_CALL_{RET,ARG}_I128
Date: Sat,  4 Feb 2023 06:32:43 -1000
Message-Id: <20230204163310.815536-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Fill in the parameters for libffi for Int128.
Adjust the interpreter to allow for 16-byte return values.
Adjust tcg_out_call to record the return value length.

Call parameters are no longer all the same size, so we
cannot reuse the same call_slots array for every function.
Compute it each time now, but only fill in slots required
for the call we're about to make.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     |  3 +++
 tcg/tcg.c                | 19 +++++++++++++++++
 tcg/tci.c                | 44 ++++++++++++++++++++--------------------
 tcg/tci/tcg-target.c.inc | 10 ++++-----
 4 files changed, 49 insertions(+), 27 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 1414ab4d5b..7140a76a73 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -160,10 +160,13 @@ typedef enum {
 #if TCG_TARGET_REG_BITS == 32
 # define TCG_TARGET_CALL_ARG_I32        TCG_CALL_ARG_EVEN
 # define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_EVEN
+# define TCG_TARGET_CALL_ARG_I128       TCG_CALL_ARG_EVEN
 #else
 # define TCG_TARGET_CALL_ARG_I32        TCG_CALL_ARG_NORMAL
 # define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_NORMAL
+# define TCG_TARGET_CALL_ARG_I128       TCG_CALL_ARG_NORMAL
 #endif
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
 #define HAVE_TCG_QEMU_TB_EXEC
 #define TCG_TARGET_NEED_POOL_LABELS
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 098be83b00..865ed5ea0f 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -570,6 +570,22 @@ static GHashTable *helper_table;
 #ifdef CONFIG_TCG_INTERPRETER
 static ffi_type *typecode_to_ffi(int argmask)
 {
+    /*
+     * libffi does not support __int128_t, so we have forced Int128
+     * to use the structure definition instead of the builtin type.
+     */
+    static ffi_type *ffi_type_i128_elements[3] = {
+        &ffi_type_uint64,
+        &ffi_type_uint64,
+        NULL
+    };
+    static ffi_type ffi_type_i128 = {
+        .size = 16,
+        .alignment = __alignof__(Int128),
+        .type = FFI_TYPE_STRUCT,
+        .elements = ffi_type_i128_elements,
+    };
+
     switch (argmask) {
     case dh_typecode_void:
         return &ffi_type_void;
@@ -583,6 +599,8 @@ static ffi_type *typecode_to_ffi(int argmask)
         return &ffi_type_sint64;
     case dh_typecode_ptr:
         return &ffi_type_pointer;
+    case dh_typecode_i128:
+        return &ffi_type_i128;
     }
     g_assert_not_reached();
 }
@@ -613,6 +631,7 @@ static void init_ffi_layouts(void)
         /* Ignoring the return type, find the last non-zero field. */
         nargs = 32 - clz32(typemask >> 3);
         nargs = DIV_ROUND_UP(nargs, 3);
+        assert(nargs <= MAX_CALL_IARGS);
 
         ca = g_malloc0(sizeof(*ca) + nargs * sizeof(ffi_type *));
         ca->cif.rtype = typecode_to_ffi(typemask & 7);
diff --git a/tcg/tci.c b/tcg/tci.c
index eeccdde8bc..022fe9d0f8 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -470,12 +470,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
     tcg_target_ulong regs[TCG_TARGET_NB_REGS];
     uint64_t stack[(TCG_STATIC_CALL_ARGS_SIZE + TCG_STATIC_FRAME_SIZE)
                    / sizeof(uint64_t)];
-    void *call_slots[TCG_STATIC_CALL_ARGS_SIZE / sizeof(uint64_t)];
 
     regs[TCG_AREG0] = (tcg_target_ulong)env;
     regs[TCG_REG_CALL_STACK] = (uintptr_t)stack;
-    /* Other call_slots entries initialized at first use (see below). */
-    call_slots[0] = NULL;
     tci_assert(tb_ptr);
 
     for (;;) {
@@ -498,26 +495,26 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         switch (opc) {
         case INDEX_op_call:
-            /*
-             * Set up the ffi_avalue array once, delayed until now
-             * because many TB's do not make any calls. In tcg_gen_callN,
-             * we arranged for every real argument to be "left-aligned"
-             * in each 64-bit slot.
-             */
-            if (unlikely(call_slots[0] == NULL)) {
-                for (int i = 0; i < ARRAY_SIZE(call_slots); ++i) {
-                    call_slots[i] = &stack[i];
-                }
-            }
-
-            tci_args_nl(insn, tb_ptr, &len, &ptr);
-
-            /* Helper functions may need to access the "return address" */
-            tci_tb_ptr = (uintptr_t)tb_ptr;
-
             {
-                void **pptr = ptr;
-                ffi_call(pptr[1], pptr[0], stack, call_slots);
+                void *call_slots[MAX_CALL_IARGS];
+                ffi_cif *cif;
+                void *func;
+                unsigned i, s, n;
+
+                tci_args_nl(insn, tb_ptr, &len, &ptr);
+                func = ((void **)ptr)[0];
+                cif = ((void **)ptr)[1];
+
+                n = cif->nargs;
+                for (i = s = 0; i < n; ++i) {
+                    ffi_type *t = cif->arg_types[i];
+                    call_slots[i] = &stack[s];
+                    s += DIV_ROUND_UP(t->size, 8);
+                }
+
+                /* Helper functions may need to access the "return address" */
+                tci_tb_ptr = (uintptr_t)tb_ptr;
+                ffi_call(cif, func, stack, call_slots);
             }
 
             switch (len) {
@@ -542,6 +539,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                  */
                 memcpy(&regs[TCG_REG_R0], stack, 8);
                 break;
+            case 3: /* Int128 */
+                memcpy(&regs[TCG_REG_R0], stack, 16);
+                break;
             default:
                 g_assert_not_reached();
             }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index e3b0ff303f..c1d34d7bd1 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -203,7 +203,7 @@ static const int tcg_target_call_iarg_regs[] = { };
 static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
 {
     tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
-    tcg_debug_assert(slot >= 0 && slot < 64 / TCG_TARGET_REG_BITS);
+    tcg_debug_assert(slot >= 0 && slot < 128 / TCG_TARGET_REG_BITS);
     return TCG_REG_R0 + slot;
 }
 
@@ -573,11 +573,11 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *func,
 
     if (cif->rtype == &ffi_type_void) {
         which = 0;
-    } else if (cif->rtype->size == 4) {
-        which = 1;
     } else {
-        tcg_debug_assert(cif->rtype->size == 8);
-        which = 2;
+        tcg_debug_assert(cif->rtype->size == 4 ||
+                         cif->rtype->size == 8 ||
+                         cif->rtype->size == 16);
+        which = ctz32(cif->rtype->size) - 1;
     }
     new_pool_l2(s, 20, s->code_ptr, 0, (uintptr_t)func, (uintptr_t)cif);
     insn = deposit32(insn, 0, 8, INDEX_op_call);
-- 
2.34.1


