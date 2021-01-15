Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330BC2F8732
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:08:28 +0100 (CET)
Received: from localhost ([::1]:46444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0WKZ-0005cF-8S
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:08:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHQ-0003jZ-I7
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:12 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:46627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHM-0004CC-AG
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:12 -0500
Received: by mail-pf1-x433.google.com with SMTP id w2so6236979pfc.13
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 13:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QLsm0yx9Ns2p8cUrK7nr7/jCO8zCZLXhdLVtS/DP2MQ=;
 b=NIRJ8YyRrWXgmr7qaU/+b4QXEvWpTNxtNN3dRxdzoPb5HH0A8lKL/m1j8RW4dYxdfB
 I9hWTSSihVI5cWXYESCdy9vyuMTgC4eygk9/mB3TXY3+GwumDSugGIVwUbeMCLnGlaSz
 r+/F+DrCGD2rregsxyuu6mACET5W29cV/OXh9AsfPD++mIHj28UrU+M7859iX9ncVbME
 ctdu3DXfN8AsTdvcqciICOjXuEPjD928EO5NCoWiTDneso4geC2+swF0vOWOeV/COn7q
 VF91vEiwRM/8XvdZbxgcGabgzQYM9SrPIxNdU12sc52v/+ifl+7yv8exFL845dKEeGY0
 vM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QLsm0yx9Ns2p8cUrK7nr7/jCO8zCZLXhdLVtS/DP2MQ=;
 b=G18In8DsNUSYPyR9M/GcG+28eXtvgJyVjdyDk1WJg/wJByyMqHIMSBbX56qnqf1TDO
 PUHGqekHVGprQNUkNcGBUYtA32yx89nE5vfS1Y3w/Aw9auRAMAqZi0Z6fJefpTHPu1AF
 +eQV9jiJm7oPCJbhGOLdurELrlVKcvoVk6GvCh8E7bZCvvcNFozhpic+xhSv+f8UxrBq
 hm70VMBsarXQUEdWXe5t3QsEjattcZp5+p6k2978xiy63vyYaibbdWdTiVpVrxQ6JBWh
 cpalOWQa6mNpS6PBVljkP/gpzKWXZS/TzFLZNyQQj0lW6r1rhQvsBdFdxWP8OUuhwKzY
 1/sQ==
X-Gm-Message-State: AOAM530d9MgIP7g0lyw3A5dYS42neBO+NmosonT1v7escjdKppT7AlBW
 o5a6QdsN3FmMHQAi9+F0tH8QKD+lcRlgVq1y
X-Google-Smtp-Source: ABdhPJyiWJ5GxaN+uu5x57zbf7E4uKVJ+4EvEkhPpj9HAqbFKMg95S/45yQj4k1fQh5FzO62KqumhQ==
X-Received: by 2002:a62:cd49:0:b029:1b5:4e48:6f1a with SMTP id
 o70-20020a62cd490000b02901b54e486f1amr996938pfg.14.1610744706935; 
 Fri, 15 Jan 2021 13:05:06 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id h15sm8920221pfo.71.2021.01.15.13.05.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 13:05:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/22] tcg/aarch64: Split out target constraints to
 tcg-target-con-str.h
Date: Fri, 15 Jan 2021 11:04:39 -1000
Message-Id: <20210115210456.1053477-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115210456.1053477-1-richard.henderson@linaro.org>
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
 tcg/aarch64/tcg-target-con-str.h | 24 +++++++++++++++
 tcg/aarch64/tcg-target.h         |  1 +
 tcg/aarch64/tcg-target.c.inc     | 51 +++++---------------------------
 3 files changed, 33 insertions(+), 43 deletions(-)
 create mode 100644 tcg/aarch64/tcg-target-con-str.h

diff --git a/tcg/aarch64/tcg-target-con-str.h b/tcg/aarch64/tcg-target-con-str.h
new file mode 100644
index 0000000000..00adb64594
--- /dev/null
+++ b/tcg/aarch64/tcg-target-con-str.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Define AArch64 target-specific operand constraints.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * Define constraint letters for register sets:
+ * REGS(letter, register_mask)
+ */
+REGS('r', ALL_GENERAL_REGS)
+REGS('l', ALL_QLDST_REGS)
+REGS('w', ALL_VECTOR_REGS)
+
+/*
+ * Define constraint letters for constants:
+ * CONST(letter, TCG_CT_CONST_* bit set)
+ */
+CONST('A', TCG_CT_CONST_AIMM)
+CONST('L', TCG_CT_CONST_LIMM)
+CONST('M', TCG_CT_CONST_MONE)
+CONST('O', TCG_CT_CONST_ORRI)
+CONST('N', TCG_CT_CONST_ANDI)
+CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 5ec30dba25..4fc20b58ec 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -155,5 +155,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CON_STR_H
 
 #endif /* AARCH64_TCG_TARGET_H */
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 23954ec7cf..42037c98fa 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -126,51 +126,16 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #define TCG_CT_CONST_ORRI 0x1000
 #define TCG_CT_CONST_ANDI 0x2000
 
-/* parse target specific constraints */
-static const char *target_parse_constraint(TCGArgConstraint *ct,
-                                           const char *ct_str, TCGType type)
-{
-    switch (*ct_str++) {
-    case 'r': /* general registers */
-        ct->regs |= 0xffffffffu;
-        break;
-    case 'w': /* advsimd registers */
-        ct->regs |= 0xffffffff00000000ull;
-        break;
-    case 'l': /* qemu_ld / qemu_st address, data_reg */
-        ct->regs = 0xffffffffu;
+#define ALL_GENERAL_REGS  0xffffffffu
+#define ALL_VECTOR_REGS   0xffffffff00000000ull
+
 #ifdef CONFIG_SOFTMMU
-        /* x0 and x1 will be overwritten when reading the tlb entry,
-           and x2, and x3 for helper args, better to avoid using them. */
-        tcg_regset_reset_reg(ct->regs, TCG_REG_X0);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_X1);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_X2);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_X3);
+#define ALL_QLDST_REGS \
+    (ALL_GENERAL_REGS & ~((1 << TCG_REG_X0) | (1 << TCG_REG_X1) | \
+                          (1 << TCG_REG_X2) | (1 << TCG_REG_X3)))
+#else
+#define ALL_QLDST_REGS   ALL_GENERAL_REGS
 #endif
-        break;
-    case 'A': /* Valid for arithmetic immediate (positive or negative).  */
-        ct->ct |= TCG_CT_CONST_AIMM;
-        break;
-    case 'L': /* Valid for logical immediate.  */
-        ct->ct |= TCG_CT_CONST_LIMM;
-        break;
-    case 'M': /* minus one */
-        ct->ct |= TCG_CT_CONST_MONE;
-        break;
-    case 'O': /* vector orr/bic immediate */
-        ct->ct |= TCG_CT_CONST_ORRI;
-        break;
-    case 'N': /* vector orr/bic immediate, inverted */
-        ct->ct |= TCG_CT_CONST_ANDI;
-        break;
-    case 'Z': /* zero */
-        ct->ct |= TCG_CT_CONST_ZERO;
-        break;
-    default:
-        return NULL;
-    }
-    return ct_str;
-}
 
 /* Match a constant valid for addition (12-bit, optionally shifted).  */
 static inline bool is_aimm(uint64_t val)
-- 
2.25.1


