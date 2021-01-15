Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92C42F8747
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:13:46 +0100 (CET)
Received: from localhost ([::1]:35098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0WPh-00047y-SD
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHT-0003nw-2b
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:15 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:34656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHQ-0004DR-9s
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:14 -0500
Received: by mail-pf1-x431.google.com with SMTP id m6so6264866pfk.1
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 13:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=upWGFHr1rqqWj45h73HNrmcB4+8aHyHUtGJVoFlL0R4=;
 b=laArJVDJHGlrCWswXbF1vgzKYapbHk6RUbV/sMGtr/1xo431kCwh6EQDXFdPuUzLJ1
 jftea9EXeqM20n/QGWCfA0ztQQzbUdAAFRy+hlNj/PfQAcTU9J6CFE5uBz/jH3NaSbgD
 3kLbZrTSpTSHkkBN8WlBcJbXVPYMRKLuUyKXEaRHWfPq9X/58rvzcc3CPBN1MRz6cCcb
 e9QeKN8Zotk5C1ASBayl+euAyzwcc3uK4cVMI60wrmoImpG49oDRnK/6/eoyKVFB8yGc
 td9j9Dxgz3o6U1kKqsNZTE9ez8dmwDnKq81COTVhhs0F82F3T3qkUnz1Xh3QD836Ly5K
 ASpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=upWGFHr1rqqWj45h73HNrmcB4+8aHyHUtGJVoFlL0R4=;
 b=Oo3ogjiXYcgAX7j3fgLG2kYqSq51oVA+PSepr9QHJq5IP5qKpzBYcaBzpxlHdxVhP+
 T5QNOLwliSPKBMD9yDB6ph/5zYlvB/zmZhP1tbi9OllB9ecFi+4+1NzVeibF522Mz+Qc
 8cJ4P//20whJMjn5jpubxUCrzIQG7eHOdgYActrRskKn03sxG4FJytAwg+91sRhxHrFk
 IPXwjSdiH9ZEzGD1Y8qC6hiR0hQle4ZzJXint2gGMLX18QRb3btoviGQjuE1rWfBs3/9
 jc4jO1QqZnOF6Wa0bTSJkSdlCiK6KWDwGWpoM66QC+Tumuyk6o/L5ltFgDduyoaTezML
 I1xQ==
X-Gm-Message-State: AOAM532PWxikPcvdBDd0OGhUXa1faJyUKc6hfcII7k1X8wU1lFoD1Abe
 fsq4zsBMyRsZ3YEmFHPd9mo0mkFLLExXENrs
X-Google-Smtp-Source: ABdhPJzTNtx5I3txV3RuK+p5uS14BfS7Mi+jlXjomtV4SvelKlkThTCmYT6cWQf4uXjkki/GX1BVDQ==
X-Received: by 2002:a05:6a00:884:b029:1b4:440f:bce7 with SMTP id
 q4-20020a056a000884b02901b4440fbce7mr3287164pfj.20.1610744711025; 
 Fri, 15 Jan 2021 13:05:11 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id h15sm8920221pfo.71.2021.01.15.13.05.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 13:05:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/22] tcg/mips: Split out target constraints to
 tcg-target-con-str.h
Date: Fri, 15 Jan 2021 11:04:42 -1000
Message-Id: <20210115210456.1053477-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115210456.1053477-1-richard.henderson@linaro.org>
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
 tcg/mips/tcg-target-con-str.h | 24 ++++++++++++
 tcg/mips/tcg-target.h         |  1 +
 tcg/mips/tcg-target.c.inc     | 72 ++++++++---------------------------
 3 files changed, 41 insertions(+), 56 deletions(-)
 create mode 100644 tcg/mips/tcg-target-con-str.h

diff --git a/tcg/mips/tcg-target-con-str.h b/tcg/mips/tcg-target-con-str.h
new file mode 100644
index 0000000000..e4b2965c72
--- /dev/null
+++ b/tcg/mips/tcg-target-con-str.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define MIPS target-specific operand constraints.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * Define constraint letters for register sets:
+ * REGS(letter, register_mask)
+ */
+REGS('r', ALL_GENERAL_REGS)
+REGS('L', ALL_QLOAD_REGS)
+REGS('S', ALL_QSTORE_REGS)
+
+/*
+ * Define constraint letters for constants:
+ * CONST(letter, TCG_CT_CONST_* bit set)
+ */
+CONST('I', TCG_CT_CONST_U16)
+CONST('J', TCG_CT_CONST_S16)
+CONST('K', TCG_CT_CONST_P2M1)
+CONST('N', TCG_CT_CONST_N16)
+CONST('W', TCG_CT_CONST_WSZ)
+CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index c2c32fb38f..d850200855 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -207,5 +207,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
+#define TCG_TARGET_CON_STR_H
 
 #endif
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 7293169ab2..61e8740012 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -171,67 +171,27 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #define TCG_CT_CONST_N16  0x1000   /* "Negatable" 16-bit: -32767 - 32767 */
 #define TCG_CT_CONST_WSZ  0x2000   /* word size */
 
+#define ALL_GENERAL_REGS  0xffffffffu
+#define NOA0_REGS         (ALL_GENERAL_REGS & ~(1 << TCG_REG_A0))
+
+#ifdef CONFIG_SOFTMMU
+#define ALL_QLOAD_REGS \
+    (NOA0_REGS & ~((TCG_TARGET_REG_BITS < TARGET_LONG_BITS) << TCG_REG_A2))
+#define ALL_QSTORE_REGS \
+    (NOA0_REGS & ~(TCG_TARGET_REG_BITS < TARGET_LONG_BITS   \
+                   ? (1 << TCG_REG_A2) | (1 << TCG_REG_A3)  \
+                   : (1 << TCG_REG_A1)))
+#else
+#define ALL_QLOAD_REGS   NOA0_REGS
+#define ALL_QSTORE_REGS  NOA0_REGS
+#endif
+
+
 static inline bool is_p2m1(tcg_target_long val)
 {
     return val && ((val + 1) & val) == 0;
 }
 
-/* parse target specific constraints */
-static const char *target_parse_constraint(TCGArgConstraint *ct,
-                                           const char *ct_str, TCGType type)
-{
-    switch(*ct_str++) {
-    case 'r':
-        ct->regs = 0xffffffff;
-        break;
-    case 'L': /* qemu_ld input arg constraint */
-        ct->regs = 0xffffffff;
-        tcg_regset_reset_reg(ct->regs, TCG_REG_A0);
-#if defined(CONFIG_SOFTMMU)
-        if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-            tcg_regset_reset_reg(ct->regs, TCG_REG_A2);
-        }
-#endif
-        break;
-    case 'S': /* qemu_st constraint */
-        ct->regs = 0xffffffff;
-        tcg_regset_reset_reg(ct->regs, TCG_REG_A0);
-#if defined(CONFIG_SOFTMMU)
-        if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-            tcg_regset_reset_reg(ct->regs, TCG_REG_A2);
-            tcg_regset_reset_reg(ct->regs, TCG_REG_A3);
-        } else {
-            tcg_regset_reset_reg(ct->regs, TCG_REG_A1);
-        }
-#endif
-        break;
-    case 'I':
-        ct->ct |= TCG_CT_CONST_U16;
-        break;
-    case 'J':
-        ct->ct |= TCG_CT_CONST_S16;
-        break;
-    case 'K':
-        ct->ct |= TCG_CT_CONST_P2M1;
-        break;
-    case 'N':
-        ct->ct |= TCG_CT_CONST_N16;
-        break;
-    case 'W':
-        ct->ct |= TCG_CT_CONST_WSZ;
-        break;
-    case 'Z':
-        /* We are cheating a bit here, using the fact that the register
-           ZERO is also the register number 0. Hence there is no need
-           to check for const_args in each instruction. */
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


