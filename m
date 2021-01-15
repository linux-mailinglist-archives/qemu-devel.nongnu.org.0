Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF58C2F8731
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:08:27 +0100 (CET)
Received: from localhost ([::1]:46376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0WKZ-0005ai-1R
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:08:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHO-0003hx-9Q
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:10 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:34659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHK-0004Bq-Hn
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:10 -0500
Received: by mail-pf1-x435.google.com with SMTP id m6so6264691pfk.1
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 13:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=e5+fhrfw5IKBV4X5/BEFOr/+/vpYaQ4zboLQ+utP1o4=;
 b=Vu/8zqrz8dLq//XmjNG0fANZ93gGrZMFoTZk5GhOyhEJIywaMcDJIY8kwBI2D6/SBu
 Sw4fciAJrRcCk0XMo+TI57SSfrFdMFrsaCt/wxH2yHodKDQF5oJ16251VJQKeveIdbhL
 RmpgzE4U/pjFixBYBhp37GeZZnqJOKs0fKK0MY3dPNT4xtBIG9N/sEY6JghdGGqoc5ji
 g7UBEIZVTjtHSJqACUMB5nghiLtQMKZJENmqcnu+VJx8Iqo9ARLvT177+OoAdtW3MX1g
 WVUzioKdwxd1AAKp5VZOAbS/7TbfGe1W1NG2G4DpotTixwDQ2jjlesJ+yceqQwlwB5Ly
 O00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e5+fhrfw5IKBV4X5/BEFOr/+/vpYaQ4zboLQ+utP1o4=;
 b=HRN/JJxsvJjFOC6MyjIAtihqngchE7szhpmcdpf4FmOvdHl1NFXGK9o9AWaJkOSrJU
 JC9h0VUVc9Qax6x1aUaq95FwjLK34XkBoxFet5y4PyPd5qZ2LSywBQSHnNKapC2XrWZa
 T02oolrRHO38i4GFBGmgyJZqu2MF8ZO8fNmyJI5CPADZob0M1L86S1I1WcpjrLX95Itq
 EMLAwbkrUs85Nx7tu21gydecI1fy7W8FRx4G5nTQ/CGKKN6nGk0j3/tiP49liDQ7p75i
 cXbQ0f28o2XN0UBM2bZE67X3jCUP8KutXJ1spsLtohRoofB/XsqI0pvw6HvErP/uHF4a
 Gy9A==
X-Gm-Message-State: AOAM533g/io23gunlMbiblPM8NY1ZkDweFlfVejo/yUjhJNh3OhHhypC
 JfBLcso5yPRY6ShvQ2+I12JQpHCmCs2wtK9u
X-Google-Smtp-Source: ABdhPJzMfNFjBlwiV6YqwFjpkMgIwU8tWqQQLlr6nEVu8bZmcGdl9HM0DhGkw3m1a+sbJTd5n34iWw==
X-Received: by 2002:a63:480f:: with SMTP id v15mr14463971pga.341.1610744704193; 
 Fri, 15 Jan 2021 13:05:04 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id h15sm8920221pfo.71.2021.01.15.13.05.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 13:05:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/22] tcg/i386: Split out target constraints to
 tcg-target-con-str.h
Date: Fri, 15 Jan 2021 11:04:37 -1000
Message-Id: <20210115210456.1053477-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115210456.1053477-1-richard.henderson@linaro.org>
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

This eliminates the target-specific function target_parse_constraint
and folds it into the single caller, process_op_defs.  Since this is
done directly into the switch statement, duplicates are compilation
errors rather than silently ignored at runtime.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target-con-str.h |  33 +++++++++++
 tcg/i386/tcg-target.h         |   1 +
 tcg/tcg.c                     |  33 +++++++++--
 tcg/i386/tcg-target.c.inc     | 101 ++++++----------------------------
 4 files changed, 78 insertions(+), 90 deletions(-)
 create mode 100644 tcg/i386/tcg-target-con-str.h

diff --git a/tcg/i386/tcg-target-con-str.h b/tcg/i386/tcg-target-con-str.h
new file mode 100644
index 0000000000..24e6bcb80d
--- /dev/null
+++ b/tcg/i386/tcg-target-con-str.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define i386 target-specific operand constraints.
+ * Copyright (c) 2021 Linaro
+ *
+ */
+
+/*
+ * Define constraint letters for register sets:
+ * REGS(letter, register_mask)
+ */
+REGS('a', 1u << TCG_REG_EAX)
+REGS('b', 1u << TCG_REG_EBX)
+REGS('c', 1u << TCG_REG_ECX)
+REGS('d', 1u << TCG_REG_EDX)
+REGS('S', 1u << TCG_REG_ESI)
+REGS('D', 1u << TCG_REG_EDI)
+
+REGS('r', ALL_GENERAL_REGS)
+REGS('x', ALL_VECTOR_REGS)
+REGS('q', ALL_BYTEL_REGS)     /* regs that can be used as a byte operand */
+REGS('Q', ALL_BYTEH_REGS)     /* regs with a second byte (e.g. %ah) */
+REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)  /* qemu_ld/st */
+REGS('s', ALL_BYTEL_REGS & ~SOFTMMU_RESERVE_REGS)    /* qemu_st8_i32 data */
+
+/*
+ * Define constraint letters for constants:
+ * CONST(letter, TCG_CT_CONST_* bit set)
+ */
+CONST('e', TCG_CT_CONST_S32)
+CONST('I', TCG_CT_CONST_I32)
+CONST('W', TCG_CT_CONST_WSZ)
+CONST('Z', TCG_CT_CONST_U32)
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index b693d3692d..77693e13ea 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -235,5 +235,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CON_STR_H
 
 #endif
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 8f8badb61c..2a85532589 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -103,8 +103,10 @@ static void tcg_register_jit_int(const void *buf, size_t size,
     __attribute__((unused));
 
 /* Forward declarations for functions declared and used in tcg-target.c.inc. */
+#ifndef TCG_TARGET_CON_STR_H
 static const char *target_parse_constraint(TCGArgConstraint *ct,
                                            const char *ct_str, TCGType type);
+#endif
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
                        intptr_t arg2);
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
@@ -2409,7 +2411,6 @@ static void process_op_defs(TCGContext *s)
     for (op = 0; op < NB_OPS; op++) {
         TCGOpDef *def = &tcg_op_defs[op];
         const TCGTargetOpDef *tdefs;
-        TCGType type;
         int i, nb_args;
 
         if (def->flags & TCG_OPF_NOT_PRESENT) {
@@ -2425,7 +2426,6 @@ static void process_op_defs(TCGContext *s)
         /* Missing TCGTargetOpDef entry. */
         tcg_debug_assert(tdefs != NULL);
 
-        type = (def->flags & TCG_OPF_64BIT ? TCG_TYPE_I64 : TCG_TYPE_I32);
         for (i = 0; i < nb_args; i++) {
             const char *ct_str = tdefs->args_ct_str[i];
             /* Incomplete TCGTargetOpDef entry. */
@@ -2457,11 +2457,34 @@ static void process_op_defs(TCGContext *s)
                     def->args_ct[i].ct |= TCG_CT_CONST;
                     ct_str++;
                     break;
+
+#ifdef TCG_TARGET_CON_STR_H
+                /* Include all of the target-specific constraints. */
+
+#undef CONST
+#define CONST(CASE, MASK) \
+    case CASE: def->args_ct[i].ct |= MASK; ct_str++; break;
+#define REGS(CASE, MASK) \
+    case CASE: def->args_ct[i].regs |= MASK; ct_str++; break;
+
+#include "tcg-target-con-str.h"
+
+#undef REGS
+#undef CONST
                 default:
-                    ct_str = target_parse_constraint(&def->args_ct[i],
-                                                     ct_str, type);
                     /* Typo in TCGTargetOpDef constraint. */
-                    tcg_debug_assert(ct_str != NULL);
+                    g_assert_not_reached();
+#else
+                default:
+                    {
+                        TCGType type = (def->flags & TCG_OPF_64BIT
+                                        ? TCG_TYPE_I64 : TCG_TYPE_I32);
+                        ct_str = target_parse_constraint(&def->args_ct[i],
+                                                         ct_str, type);
+                        /* Typo in TCGTargetOpDef constraint. */
+                        tcg_debug_assert(ct_str != NULL);
+                    }
+#endif
                 }
             }
         }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 74637f654a..c4b0b6bfca 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -132,6 +132,22 @@ static const int tcg_target_call_oarg_regs[] = {
 # define TCG_REG_L1 TCG_REG_EDX
 #endif
 
+#define ALL_BYTEH_REGS         0x0000000fu
+#if TCG_TARGET_REG_BITS == 64
+# define ALL_GENERAL_REGS      0x0000ffffu
+# define ALL_VECTOR_REGS       0xffff0000u
+# define ALL_BYTEL_REGS        ALL_GENERAL_REGS
+#else
+# define ALL_GENERAL_REGS      0x000000ffu
+# define ALL_VECTOR_REGS       0x00ff0000u
+# define ALL_BYTEL_REGS        ALL_BYTEH_REGS
+#endif
+#ifdef CONFIG_SOFTMMU
+# define SOFTMMU_RESERVE_REGS  ((1 << TCG_REG_L0) | (1 << TCG_REG_L1))
+#else
+# define SOFTMMU_RESERVE_REGS  0
+#endif
+
 /* The host compiler should supply <cpuid.h> to enable runtime features
    detection, as we're not going to go so far as our own inline assembly.
    If not available, default values will be assumed.  */
@@ -193,91 +209,6 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
     return true;
 }
 
-#if TCG_TARGET_REG_BITS == 64
-#define ALL_GENERAL_REGS   0x0000ffffu
-#define ALL_VECTOR_REGS    0xffff0000u
-#else
-#define ALL_GENERAL_REGS   0x000000ffu
-#define ALL_VECTOR_REGS    0x00ff0000u
-#endif
-
-/* parse target specific constraints */
-static const char *target_parse_constraint(TCGArgConstraint *ct,
-                                           const char *ct_str, TCGType type)
-{
-    switch(*ct_str++) {
-    case 'a':
-        tcg_regset_set_reg(ct->regs, TCG_REG_EAX);
-        break;
-    case 'b':
-        tcg_regset_set_reg(ct->regs, TCG_REG_EBX);
-        break;
-    case 'c':
-        tcg_regset_set_reg(ct->regs, TCG_REG_ECX);
-        break;
-    case 'd':
-        tcg_regset_set_reg(ct->regs, TCG_REG_EDX);
-        break;
-    case 'S':
-        tcg_regset_set_reg(ct->regs, TCG_REG_ESI);
-        break;
-    case 'D':
-        tcg_regset_set_reg(ct->regs, TCG_REG_EDI);
-        break;
-    case 'q':
-        /* A register that can be used as a byte operand.  */
-        ct->regs = TCG_TARGET_REG_BITS == 64 ? 0xffff : 0xf;
-        break;
-    case 'Q':
-        /* A register with an addressable second byte (e.g. %ah).  */
-        ct->regs = 0xf;
-        break;
-    case 'r':
-        /* A general register.  */
-        ct->regs |= ALL_GENERAL_REGS;
-        break;
-    case 'W':
-        /* With TZCNT/LZCNT, we can have operand-size as an input.  */
-        ct->ct |= TCG_CT_CONST_WSZ;
-        break;
-    case 'x':
-        /* A vector register.  */
-        ct->regs |= ALL_VECTOR_REGS;
-        break;
-
-    case 'L':
-        /* qemu_ld/st data+address constraint */
-        ct->regs = TCG_TARGET_REG_BITS == 64 ? 0xffff : 0xff;
-#ifdef CONFIG_SOFTMMU
-        tcg_regset_reset_reg(ct->regs, TCG_REG_L0);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_L1);
-#endif
-        break;
-    case 's':
-        /* qemu_st8_i32 data constraint */
-        ct->regs = 0xf;
-#ifdef CONFIG_SOFTMMU
-        tcg_regset_reset_reg(ct->regs, TCG_REG_L0);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_L1);
-#endif
-        break;
-
-    case 'e':
-        ct->ct |= TCG_CT_CONST_S32;
-        break;
-    case 'Z':
-        ct->ct |= TCG_CT_CONST_U32;
-        break;
-    case 'I':
-        ct->ct |= TCG_CT_CONST_I32;
-        break;
-
-    default:
-        return NULL;
-    }
-    return ct_str;
-}
-
 /* test if a constant matches the constraint */
 static inline int tcg_target_const_match(tcg_target_long val, TCGType type,
                                          const TCGArgConstraint *arg_ct)
-- 
2.25.1


