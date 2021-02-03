Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDAB30D162
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:21:19 +0100 (CET)
Received: from localhost ([::1]:36344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l77nC-0004QB-CD
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:21:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77i8-0007fS-RB
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:05 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:45744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77i6-0000zY-U7
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:04 -0500
Received: by mail-pl1-x62c.google.com with SMTP id b8so13581299plh.12
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=adyjT1MKLgfsNCv+2k+wTR8lkNy7iVmXoGafJi08tDA=;
 b=LSPld3RxRRAHVN0kQvzHs1JsXRWb8dp3Gds46oWWkmdTjxwY2vLxffxaQ43v51NzJP
 7LjeqNJAmzjy/6tqRCdONCubU1huREMvr+kQ/8IA4dZG2EBfTSfn0YyxZ+nik5clviRs
 E696zZipGXFpkJaevZx6dfPfttv14JuKq/WRW1qRhcqJwfvHzteMs68inFK7uVptUPNg
 oLGDeZpk26LOCbIAEfBhA+URgaDKf53Ynd1LKs2NtMTtdXPpGIJ9aj4joJp8Dk8YYNEW
 ZMWYNcTlhebupGi+9VnIuNJXMGXWLjlLoOXhuTOKtr0KOaPO38YfgEYdz9eV4HvJuHkt
 S8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=adyjT1MKLgfsNCv+2k+wTR8lkNy7iVmXoGafJi08tDA=;
 b=qXc/1CMCsk+US9l19osZQGA9jpopdvJnug1AxHjoS7VDunoD9e+CSHIZFOpXSSKr4B
 gputLotn0+N40h2C3cOZcVeiHFcyy4RBYDMdW37uCr/fy0+bYId2mH39sxLGHGysT/Id
 kaC8fNkNjBwsvaHIYp7hj/Iew26wH3BN3Dm/y/OohgRwueaX3EoL3byLigIs3zZStqGR
 eC4vNAhGqRGVl+wOV68A+xx0xT5y2N0E2uUZixTYGH0JU/BqKXVIwTONkb5bL5invYrr
 CoOn2av3JDdNqOBET6SgF0+KuEdUpTALwtCzEVL06SkvN+q+yMquPLfQ7fiF/0jQNck7
 uTHw==
X-Gm-Message-State: AOAM533Kup1DadGUJ3sf8e4pg94cvc7z0D4tBHN3OpZ/XVbXW8Dy3G5U
 CkN2/t3s+uObXvMp9HH+1YPeAGGlv06b0JJi
X-Google-Smtp-Source: ABdhPJyLqhqYkWwbJy5PnHq9rz6E1o4Fd1iRkXl0o8vHdyDBchtwQDlvqaRNt2ABPXF0Zh/D0VGvOA==
X-Received: by 2002:a17:90a:7887:: with SMTP id x7mr848622pjk.69.1612318561608; 
 Tue, 02 Feb 2021 18:16:01 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x1sm270301pgj.37.2021.02.02.18.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:16:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/24] tcg/i386: Split out target constraints to
 tcg-target-con-str.h
Date: Tue,  2 Feb 2021 16:15:31 -1000
Message-Id: <20210203021550.375058-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203021550.375058-1-richard.henderson@linaro.org>
References: <20210203021550.375058-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This eliminates the target-specific function target_parse_constraint
and folds it into the single caller, process_op_defs.  Since this is
done directly into the switch statement, duplicates are compilation
errors rather than silently ignored at runtime.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target-con-str.h | 33 +++++++++++++++++
 tcg/i386/tcg-target.h         |  1 +
 tcg/tcg.c                     | 33 ++++++++++++++---
 tcg/i386/tcg-target.c.inc     | 69 -----------------------------------
 4 files changed, 62 insertions(+), 74 deletions(-)
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
index 9e1b0d73c7..8cfa28ed84 100644
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
@@ -2415,7 +2417,6 @@ static void process_op_defs(TCGContext *s)
     for (op = 0; op < NB_OPS; op++) {
         TCGOpDef *def = &tcg_op_defs[op];
         const TCGTargetOpDef *tdefs;
-        TCGType type;
         int i, nb_args;
 
         if (def->flags & TCG_OPF_NOT_PRESENT) {
@@ -2431,7 +2432,6 @@ static void process_op_defs(TCGContext *s)
         /* Missing TCGTargetOpDef entry. */
         tcg_debug_assert(tdefs != NULL);
 
-        type = (def->flags & TCG_OPF_64BIT ? TCG_TYPE_I64 : TCG_TYPE_I32);
         for (i = 0; i < nb_args; i++) {
             const char *ct_str = tdefs->args_ct_str[i];
             /* Incomplete TCGTargetOpDef entry. */
@@ -2463,11 +2463,34 @@ static void process_op_defs(TCGContext *s)
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
index 4feb7e2aa1..d3cf97748a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -209,75 +209,6 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
     return true;
 }
 
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
-        ct->regs |= ALL_BYTEL_REGS;
-        break;
-    case 'Q':
-        /* A register with an addressable second byte (e.g. %ah).  */
-        ct->regs |= ALL_BYTEH_REGS;
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
-        ct->regs |= ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS;
-        break;
-    case 's':
-        /* qemu_st8_i32 data constraint */
-        ct->regs |= ALL_BYTEL_REGS & ~SOFTMMU_RESERVE_REGS;
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


