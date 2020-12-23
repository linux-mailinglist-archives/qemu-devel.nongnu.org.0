Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6EE2E18C3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:08:48 +0100 (CET)
Received: from localhost ([::1]:34614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxKJ-0005LY-44
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:08:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxE5-0008Py-Np
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:21 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxDv-0000Lc-LG
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:21 -0500
Received: by mail-pj1-x102d.google.com with SMTP id b5so2623339pjl.0
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jwoUkFYPLhkV44osybn2ygv0a2eAfyC9vW2c8OoHcPA=;
 b=EkExbet/bnqnfCskGFgS7wb90LR0EK+/NfVqjr4l/S1jUmp0y7bAg5LMyvzrnFWIq6
 jbg/KGppeVRiqBzamW0SDeVgqcqUTI6QWQxmZLgI2aQU2XhDqQ7QRpeoP+gkomF+Qz6O
 22DhLKuBEMUSUD/3iUbTea53NSfuNyfWkKy8LuNAeS+bG0JnxLvQCRoqddPlZXRHhgp8
 YjPGR6EOa2z+QWTGNogUm4owEGHvuA7NvfPL4G0zRUEZdYrhf7ppKMGGFrQvjE2iWMbM
 ZYZPY1JXr81Mx2WiBIkpDbOwUv2EFQAJYMvCNfp5iWu1bnGZ4XkgtEaCr7J9RtER8Ns7
 OXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jwoUkFYPLhkV44osybn2ygv0a2eAfyC9vW2c8OoHcPA=;
 b=hDw5ankmyDFxiMm1HWwcRq/6qr8w7Plud3PWsI/JC67/3ilVeuBRlO0FH8PvrnyN58
 6fJUBrbryTaCuTgJ01kAXzEVTw5uP9g/fjgUndGOUNYFUx+JLNM3LyxuzWHDmERPm2t+
 a8+Dv7bbJ11RqLw367gDV0hONLYlsY3fxNA/9i0eoLlbkn++LXoMCJcygbgyAK+VJybX
 BBJ4Kg6RUNSSW7AfHVr7Li1ca9O1YeVMnVwxtko4toT3UBILPskl9XvfMdtfO6GY5bC9
 tYYJcbAWsckkxiqz2undThNVCDA27zCLe5ValMXC0zUpl+X9Kn/UmPQ9s0+fGA4nYxe8
 aNmQ==
X-Gm-Message-State: AOAM530+wdx6jdpBTR2qtMHUb/pBqvjfkx60RSBHvzULXxjDH2yqUgcM
 tXPI8iBPe5Mt+8X2g1TLBiKSkDrqHBenVw==
X-Google-Smtp-Source: ABdhPJwtaojV4esCYm0nr5++giclTfsXUBPuyMKcKATcuYF3T6KiXFNWR8mLSJjnsoLLuMMBB8Arog==
X-Received: by 2002:a17:902:7592:b029:dc:3c87:1c63 with SMTP id
 j18-20020a1709027592b02900dc3c871c63mr13075102pll.47.1608703329575; 
 Tue, 22 Dec 2020 22:02:09 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/22] tcg: Split out target constraints to tcg-target-constr.h
Date: Tue, 22 Dec 2020 22:01:45 -0800
Message-Id: <20201223060204.576856-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223060204.576856-1-richard.henderson@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
 tcg/i386/tcg-target-constr.h | 26 ++++++++++++++
 tcg/i386/tcg-target.h        |  1 +
 tcg/tcg.c                    | 33 ++++++++++++++---
 tcg/i386/tcg-target.c.inc    | 70 ++----------------------------------
 4 files changed, 58 insertions(+), 72 deletions(-)
 create mode 100644 tcg/i386/tcg-target-constr.h

diff --git a/tcg/i386/tcg-target-constr.h b/tcg/i386/tcg-target-constr.h
new file mode 100644
index 0000000000..e4a4886b6c
--- /dev/null
+++ b/tcg/i386/tcg-target-constr.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * i386 target-specific operand constaints.
+ * Copyright (c) 2020 Linaro
+ */
+
+REGS('a', 1u << TCG_REG_EAX)
+REGS('b', 1u << TCG_REG_EBX)
+REGS('c', 1u << TCG_REG_ECX)
+REGS('d', 1u << TCG_REG_EDX)
+REGS('S', 1u << TCG_REG_ESI)
+REGS('D', 1u << TCG_REG_EDI)
+
+REGS('r', ALL_GENERAL_REGS)
+REGS('x', ALL_VECTOR_REGS)
+/* A register that can be used as a byte operand.  */
+REGS('q', ALL_BYTEL_REGS)
+/* A register with an addressable second byte (e.g. %ah).  */
+REGS('Q', ALL_BYTEH_REGS)
+/* qemu_ld/st address constraint */
+REGS('L', ALL_GENERAL_REGS & ~((1 << TCG_REG_L0) | (1 << TCG_REG_L1)))
+
+CONST('e', TCG_CT_CONST_S32)
+CONST('I', TCG_CT_CONST_I32)
+CONST('W', TCG_CT_CONST_WSZ)
+CONST('Z', TCG_CT_CONST_U32)
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index abd4ac7fc0..7c405e166d 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -235,5 +235,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CONSTR_H
 
 #endif
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 43c6cf8f52..f5b53d739e 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -102,8 +102,10 @@ static void tcg_register_jit_int(void *buf, size_t size,
     __attribute__((unused));
 
 /* Forward declarations for functions declared and used in tcg-target.c.inc. */
+#ifndef TCG_TARGET_CONSTR_H
 static const char *target_parse_constraint(TCGArgConstraint *ct,
                                            const char *ct_str, TCGType type);
+#endif
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
                        intptr_t arg2);
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
@@ -2239,7 +2241,6 @@ static void process_op_defs(TCGContext *s)
     for (op = 0; op < NB_OPS; op++) {
         TCGOpDef *def = &tcg_op_defs[op];
         const TCGTargetOpDef *tdefs;
-        TCGType type;
         int i, nb_args;
 
         if (def->flags & TCG_OPF_NOT_PRESENT) {
@@ -2255,7 +2256,6 @@ static void process_op_defs(TCGContext *s)
         /* Missing TCGTargetOpDef entry. */
         tcg_debug_assert(tdefs != NULL);
 
-        type = (def->flags & TCG_OPF_64BIT ? TCG_TYPE_I64 : TCG_TYPE_I32);
         for (i = 0; i < nb_args; i++) {
             const char *ct_str = tdefs->args_ct_str[i];
             /* Incomplete TCGTargetOpDef entry. */
@@ -2287,11 +2287,34 @@ static void process_op_defs(TCGContext *s)
                     def->args_ct[i].ct |= TCG_CT_CONST;
                     ct_str++;
                     break;
+
+#ifdef TCG_TARGET_CONSTR_H
+                /* Include all of the target-specific constraints. */
+
+#undef CONST
+#define CONST(CASE, MASK) \
+    case CASE: def->args_ct[i].ct |= MASK; ct_str++; break;
+#define REGS(CASE, MASK) \
+    case CASE: def->args_ct[i].regs |= MASK; ct_str++; break;
+
+#include "tcg-target-constr.h"
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
index b73873f715..981dd9aca4 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -194,81 +194,17 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
     return true;
 }
 
+#define ALL_BYTEH_REGS     0x0000000fu
 #if TCG_TARGET_REG_BITS == 64
 #define ALL_GENERAL_REGS   0x0000ffffu
 #define ALL_VECTOR_REGS    0xffff0000u
+#define ALL_BYTEL_REGS     ALL_GENERAL_REGS
 #else
 #define ALL_GENERAL_REGS   0x000000ffu
 #define ALL_VECTOR_REGS    0x00ff0000u
+#define ALL_BYTEL_REGS     ALL_BYTEH_REGS
 #endif
 
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
-        /* qemu_ld/st address constraint */
-    case 'L':
-        ct->regs = TCG_TARGET_REG_BITS == 64 ? 0xffff : 0xff;
-        tcg_regset_reset_reg(ct->regs, TCG_REG_L0);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_L1);
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


