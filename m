Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 350F830D163
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:21:55 +0100 (CET)
Received: from localhost ([::1]:36874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l77nk-0004dT-NX
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iD-0007jB-Pe
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:12 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:42016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iB-00010m-1G
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:09 -0500
Received: by mail-pg1-x536.google.com with SMTP id g15so16218143pgu.9
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XGfh414c63a3dPyZNddXaSBenVIz6c16myIzk/I+W7I=;
 b=CPqHCj0LJ4uGRHANLyu0558P8Abbr/uQY7i1R2Qp8wJ00ym7KkKVZfjafiO6RVdlQT
 7cmOFGV1Mm9EapbY1D5ZguTw9gMoRqoZwyHF4uNkD39Z3+W8xgCu9yvRSeER7I2qdp34
 PGScoBus5u3qaWXHWHjeO13JjhzpFs1/3pLi7YLaf/DRhA0ZIc60mdWnJTaxmlJDQvZ0
 ufxjPAB0tBd3GbZYDZTcndmUaBnKek7GR/CCIVqc4R0oGCqCS7tT7N6FZ9j1+eB/a6Vu
 uBEEOCCGMi53riVTAyuZvCVl2eD0dhwmfOp1KBO54HZ1FPYoDAZlk/szw5ld7T3cWT3k
 R5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XGfh414c63a3dPyZNddXaSBenVIz6c16myIzk/I+W7I=;
 b=AurBbnCrguPjDTE+W9xHeMiDaGxEV5zZO4OEckbM5kSnijZ5SB7Ro1Cv5k/1DOQSCB
 SBW+Iq6T4jggcEzgk8ul7Ly1siI3XXOZUpkBzR4lY3m3zhkRR0jVRSMavUxII1gOAycD
 pTAxq8dylOE/KxQtC2ZVvhPz9swjjj5bYp8MMyA6oPMQ8OjMh4rQy0j4Hhrf8I1jHKdr
 6pcCxLSnqudhStqL7o4gDgyYEhby48KeqttX755d+bniulK6PI2eu6N+lC2GKtdLtdrZ
 uDIyk7iM9dXhOP92dJZrAZJD7du0JPlWNSGwNT/avJ76MO+QSR6AZHZRHC5XXpNJh3HP
 0RYQ==
X-Gm-Message-State: AOAM533zotHuQcF7urwYMCHCLmtqht/nD7InrP97t6iBDq6wOXpi10Ys
 bRz10kCjYoBY0frkH9G/oVzkJHAu5/hSmlLn
X-Google-Smtp-Source: ABdhPJz++t5uexkzyhgEn2rKHaBznkVGWoShsNd8Gjv6Erj4TFbrAPVh+PpYT0T79upTmD9QY0YUSA==
X-Received: by 2002:a62:8803:0:b029:1d0:6910:7b07 with SMTP id
 l3-20020a6288030000b02901d069107b07mr939542pfd.71.1612318565761; 
 Tue, 02 Feb 2021 18:16:05 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x1sm270301pgj.37.2021.02.02.18.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:16:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/24] tcg/ppc: Split out target constraints to
 tcg-target-con-str.h
Date: Tue,  2 Feb 2021 16:15:34 -1000
Message-Id: <20210203021550.375058-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203021550.375058-1-richard.henderson@linaro.org>
References: <20210203021550.375058-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-str.h | 30 +++++++++++++++
 tcg/ppc/tcg-target.h         |  1 +
 tcg/ppc/tcg-target.c.inc     | 73 ++++++++----------------------------
 3 files changed, 46 insertions(+), 58 deletions(-)
 create mode 100644 tcg/ppc/tcg-target-con-str.h

diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
new file mode 100644
index 0000000000..298ca20d5b
--- /dev/null
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define PowerPC target-specific operand constraints.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * Define constraint letters for register sets:
+ * REGS(letter, register_mask)
+ */
+REGS('r', ALL_GENERAL_REGS)
+REGS('v', ALL_VECTOR_REGS)
+REGS('A', 1u << TCG_REG_R3)
+REGS('B', 1u << TCG_REG_R4)
+REGS('C', 1u << TCG_REG_R5)
+REGS('D', 1u << TCG_REG_R6)
+REGS('L', ALL_QLOAD_REGS)
+REGS('S', ALL_QSTORE_REGS)
+
+/*
+ * Define constraint letters for constants:
+ * CONST(letter, TCG_CT_CONST_* bit set)
+ */
+CONST('I', TCG_CT_CONST_S16)
+CONST('J', TCG_CT_CONST_U16)
+CONST('M', TCG_CT_CONST_MONE)
+CONST('T', TCG_CT_CONST_S32)
+CONST('U', TCG_CT_CONST_U32)
+CONST('W', TCG_CT_CONST_WSZ)
+CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index d1339afc66..40ed4b82dd 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -185,5 +185,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CON_STR_H
 
 #endif
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index cf64892295..e5aa8d2d10 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -62,6 +62,21 @@
 #define TCG_CT_CONST_MONE 0x2000
 #define TCG_CT_CONST_WSZ  0x4000
 
+#define ALL_GENERAL_REGS  0xffffffffu
+#define ALL_VECTOR_REGS   0xffffffff00000000ull
+
+#ifdef CONFIG_SOFTMMU
+#define ALL_QLOAD_REGS \
+    (ALL_GENERAL_REGS & \
+     ~((1 << TCG_REG_R3) | (1 << TCG_REG_R4) | (1 << TCG_REG_R5)))
+#define ALL_QSTORE_REGS \
+    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R3) | (1 << TCG_REG_R4) | \
+                          (1 << TCG_REG_R5) | (1 << TCG_REG_R6)))
+#else
+#define ALL_QLOAD_REGS  (ALL_GENERAL_REGS & ~(1 << TCG_REG_R3))
+#define ALL_QSTORE_REGS ALL_QLOAD_REGS
+#endif
+
 TCGPowerISA have_isa;
 static bool have_isel;
 bool have_altivec;
@@ -222,64 +237,6 @@ static bool reloc_pc14(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
     return false;
 }
 
-/* parse target specific constraints */
-static const char *target_parse_constraint(TCGArgConstraint *ct,
-                                           const char *ct_str, TCGType type)
-{
-    switch (*ct_str++) {
-    case 'A': case 'B': case 'C': case 'D':
-        tcg_regset_set_reg(ct->regs, 3 + ct_str[0] - 'A');
-        break;
-    case 'r':
-        ct->regs = 0xffffffff;
-        break;
-    case 'v':
-        ct->regs = 0xffffffff00000000ull;
-        break;
-    case 'L':                   /* qemu_ld constraint */
-        ct->regs = 0xffffffff;
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R3);
-#ifdef CONFIG_SOFTMMU
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R4);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R5);
-#endif
-        break;
-    case 'S':                   /* qemu_st constraint */
-        ct->regs = 0xffffffff;
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R3);
-#ifdef CONFIG_SOFTMMU
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R4);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R5);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R6);
-#endif
-        break;
-    case 'I':
-        ct->ct |= TCG_CT_CONST_S16;
-        break;
-    case 'J':
-        ct->ct |= TCG_CT_CONST_U16;
-        break;
-    case 'M':
-        ct->ct |= TCG_CT_CONST_MONE;
-        break;
-    case 'T':
-        ct->ct |= TCG_CT_CONST_S32;
-        break;
-    case 'U':
-        ct->ct |= TCG_CT_CONST_U32;
-        break;
-    case 'W':
-        ct->ct |= TCG_CT_CONST_WSZ;
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
 static int tcg_target_const_match(tcg_target_long val, TCGType type,
                                   const TCGArgConstraint *arg_ct)
-- 
2.25.1


