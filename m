Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63F52F8749
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:13:58 +0100 (CET)
Received: from localhost ([::1]:35498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0WPs-0004Ij-3d
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:13:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHW-0003sj-5c
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:20 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:46630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHU-0004FE-9k
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:17 -0500
Received: by mail-pf1-x435.google.com with SMTP id w2so6237188pfc.13
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 13:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aaFp/1lSSPP6WRQBD7tlB4PsGTqLnK3cNb0Bx6YGQzo=;
 b=Vz5x8Icv2XB//uRcuFkHy7ZIPribYvkbwPw4/eapTRgyno9GWCprf70REbPFk+V4Te
 8PH0/OG3u7VVvDArNzTHqsknjAD1RzgCvH79yrhJap2Cl2+21SQZqYoiXHBZLy4n5SIl
 oKPOf1QV9tOLXzzEp4BFnNOjLJmC8HO46GDrsKIUOwbr0dcAAjAYcxm1embwP+gqwR8t
 9RbLx6SAtPmCA+bQyiLtWVQK/wMjx4F1u7akrDyDsa+aGmIY9daitLIIzO9Xu0Usk920
 Rrbk8sD9t98qRhCjx+wNbfyMN5aAhU/3H8vuL4kLNcBo0gCrDG8cFQ1yoL73WviAdZSZ
 FAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aaFp/1lSSPP6WRQBD7tlB4PsGTqLnK3cNb0Bx6YGQzo=;
 b=lKduwJNQ7OE5tkIB2g/hZED7SJoBAEQo61uiVIyEXOjkEHDYhXFeMnNI/Spr43r2u0
 WdBt6bRKt3S9qCyjbx/PsTV1CNAZ6OZSvqtHPC451N7lAlTT8XV8bGCkE5B38ftUmdi+
 B41a3I1IwpXz28TCV6QEp4YDbfbrIOjxcBNP/SsIrjDqC0LWZJvIhcxOPmYGlaKgZ6LV
 IUaEOR+h/wawpX9+m6D1UM2d7YNGN8olZBfiDnMAJZoZLCDwRgu6Tj3aZlIzjRNYVY9L
 kN4zRNjAuzRfuCDxF8J3sC73pfuoxZYqhNP5IiezxDHQiKB5Hee7+iCDapT5/7o7iyy6
 VZZw==
X-Gm-Message-State: AOAM532QFIGNIwerFJjcCQZ5/UBYxcF1+qM6f0OMtZfmrLttl7j10eO6
 4j6uGwiH/6HfNf8wtBsamGw1ygU2ufakYejc
X-Google-Smtp-Source: ABdhPJzHond4siYsYpp9eaklz/HWtQmsA7tJ343KvM2T8qTaP3ohKkn9W/2oCr7Zz1SU7jmiKeAaGQ==
X-Received: by 2002:a63:fb54:: with SMTP id w20mr14342396pgj.419.1610744715101; 
 Fri, 15 Jan 2021 13:05:15 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id h15sm8920221pfo.71.2021.01.15.13.05.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 13:05:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/22] tcg/sparc: Split out target constraints to
 tcg-target-con-str.h
Date: Fri, 15 Jan 2021 11:04:45 -1000
Message-Id: <20210115210456.1053477-12-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target-con-str.h | 22 +++++++++++++++++
 tcg/sparc/tcg-target.h         |  5 +---
 tcg/sparc/tcg-target.c.inc     | 45 +++++-----------------------------
 3 files changed, 29 insertions(+), 43 deletions(-)
 create mode 100644 tcg/sparc/tcg-target-con-str.h

diff --git a/tcg/sparc/tcg-target-con-str.h b/tcg/sparc/tcg-target-con-str.h
new file mode 100644
index 0000000000..6dc5b95f33
--- /dev/null
+++ b/tcg/sparc/tcg-target-con-str.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define Sparc target-specific operand constraints.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * Define constraint letters for register sets:
+ * REGS(letter, register_mask)
+ */
+REGS('r', 0xffffffff)
+REGS('R', ALL_64)
+REGS('s', 0xffffffff & ~RESERVE_QLDST)
+REGS('S', ALL_64 & ~RESERVE_QLDST)
+
+/*
+ * Define constraint letters for constants:
+ * CONST(letter, TCG_CT_CONST_* bit set)
+ */
+CONST('I', TCG_CT_CONST_S11)
+CONST('J', TCG_CT_CONST_S13)
+CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index 95ab9af955..5185b00524 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -66,10 +66,6 @@ typedef enum {
     TCG_REG_I7,
 } TCGReg;
 
-#define TCG_CT_CONST_S11  0x100
-#define TCG_CT_CONST_S13  0x200
-#define TCG_CT_CONST_ZERO 0x400
-
 /* used for function call generation */
 #define TCG_REG_CALL_STACK TCG_REG_O6
 
@@ -172,5 +168,6 @@ extern bool use_vis3_instructions;
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CON_STR_H
 
 #endif
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 28b5b6559a..ea2b3274d4 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -67,6 +67,10 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 # define SPARC64 0
 #endif
 
+#define TCG_CT_CONST_S11  0x100
+#define TCG_CT_CONST_S13  0x200
+#define TCG_CT_CONST_ZERO 0x400
+
 /* Note that sparcv8plus can only hold 64 bit quantities in %g and %o
    registers.  These are saved manually by the kernel in full 64-bit
    slots.  The %i and %l registers are saved by the register window
@@ -79,6 +83,8 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 # define ALL_64  0xffffu
 #endif
 
+#define RESERVE_QLDST  (7u << TCG_REG_O0)  /* O0, O1, O2 */
+
 /* Define some temporary registers.  T2 is used for constant generation.  */
 #define TCG_REG_T1  TCG_REG_G1
 #define TCG_REG_T2  TCG_REG_O7
@@ -320,45 +326,6 @@ static bool patch_reloc(tcg_insn_unit *src_rw, int type,
     return true;
 }
 
-/* parse target specific constraints */
-static const char *target_parse_constraint(TCGArgConstraint *ct,
-                                           const char *ct_str, TCGType type)
-{
-    switch (*ct_str++) {
-    case 'r':
-        ct->regs = 0xffffffff;
-        break;
-    case 'R':
-        ct->regs = ALL_64;
-        break;
-    case 'A': /* qemu_ld/st address constraint */
-        ct->regs = TARGET_LONG_BITS == 64 ? ALL_64 : 0xffffffff;
-    reserve_helpers:
-        tcg_regset_reset_reg(ct->regs, TCG_REG_O0);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_O1);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_O2);
-        break;
-    case 's': /* qemu_st data 32-bit constraint */
-        ct->regs = 0xffffffff;
-        goto reserve_helpers;
-    case 'S': /* qemu_st data 64-bit constraint */
-        ct->regs = ALL_64;
-        goto reserve_helpers;
-    case 'I':
-        ct->ct |= TCG_CT_CONST_S11;
-        break;
-    case 'J':
-        ct->ct |= TCG_CT_CONST_S13;
-        break;
-    case 'Z':
-        ct->ct |= TCG_CT_CONST_ZERO;
-        break;
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


