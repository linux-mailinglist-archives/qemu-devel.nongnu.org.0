Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97559308E55
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:23:12 +0100 (CET)
Received: from localhost ([::1]:37118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5aIR-0001fc-J5
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:23:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6S-0006CT-9R
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:48 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:38350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6Q-00082a-8Z
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:47 -0500
Received: by mail-pf1-x431.google.com with SMTP id y205so6914862pfc.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XGfh414c63a3dPyZNddXaSBenVIz6c16myIzk/I+W7I=;
 b=rh11VKe7L75fdbsrMtUvhX5VjKYGtUA0/6ezCDUtYyIgtAdVEsIsgrQLAzkcs9CZg0
 7KwXJksVfobjh32Z995Dl1rHW4qmQ+I0dbcTSTMKgzlHUWu/qWP6p7AZngPcZf/X0yEO
 W05LFJzPyZOT9yg2qw/len2vAP91FtuexxPdtobwXVx+GJQf2pg2R2gx3krDQ0dezeIN
 /vIlkDV2D9Gmz0Yk1YXumWLLCNNsh+GX7Em74YYr3ZmFme0q+YOhhP11Tpl78/meKYoy
 in8bQpZmprOcfCm5EPmAfaIybB+oepbf4kgekIB2zmIEqM7mEkjKrFpsD409vTg9uRIP
 xIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XGfh414c63a3dPyZNddXaSBenVIz6c16myIzk/I+W7I=;
 b=ci2vK4dQ86hxRyoMSzfZcT7jqcN5l+Do5DVydcuZTXMJg0yXgCZmFRgOaPJ9hFOLxW
 +MraYpLLfsxxNJIU1etby+RZTZ7KxREcWDWVodIbjS04XO4e2HeDzB6JTcLbIqRxl51o
 VxZIVsZPmLcQWuis0Wosvqimp3xwMRvzLvMuBRFe16WQXqACbXbLp+07s74pHRhNruAz
 7P6x5Pa4/rX3KzHI4+oQhYiJJr53m3XP4+5IN6H5cVVakGCEJBRDgkJywKF+ltbe5nQq
 X1YyD9lke9un/wDEDXqHkWIpQO7ZJ4Cw0SJEGjB8JTjaBzA7goLvcwG8oNxZ2ZnJe0vZ
 9cKg==
X-Gm-Message-State: AOAM531QCFLOjLyQRVHVmd19ChpD6MDu1gARwid6GCuRyjJAauLuaQu7
 iu1CHRQx/jGsPDA5wJEX0RZXnAsGUxgEr3Bn
X-Google-Smtp-Source: ABdhPJwFE5GIGUoLd+/xVy/K5zReDrqZ2X8E+GFroJTcqjV2c85b/9x8MTVfWbJh6xYVO35ZpYGxaQ==
X-Received: by 2002:a63:fe13:: with SMTP id p19mr6233224pgh.119.1611951044791; 
 Fri, 29 Jan 2021 12:10:44 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d133sm9247265pfd.6.2021.01.29.12.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 12:10:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/24] tcg/ppc: Split out target constraints to
 tcg-target-con-str.h
Date: Fri, 29 Jan 2021 10:10:12 -1000
Message-Id: <20210129201028.787853-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129201028.787853-1-richard.henderson@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>
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


