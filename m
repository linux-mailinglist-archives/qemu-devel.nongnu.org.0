Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E672E18CB
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:15:03 +0100 (CET)
Received: from localhost ([::1]:51408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxQM-0003wH-44
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:15:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxEE-0008RV-1E
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:34 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxE2-0000NZ-RR
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:28 -0500
Received: by mail-pl1-x629.google.com with SMTP id t6so8614650plq.1
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1Y85WkunXwYTbEnJROwkrffmDCY/UpF3UWrZcQqlD/E=;
 b=PjjK3AYMoheYlh8Onx724Ybsuc879EHOlx9y8DnoKGQOFQraamYPAMF2WwxbHvWlPQ
 QaIvM/s8dokW6DTHwqV4yQBsC7Y5sXWH7VuIx8+IgPipcMU21P9QMXip2GAynmAMYc2P
 3tNBi6k4/LL1MBh7KUw2A/L225uo5J+DpdXIRN3YO5yDWVKWixPZVhsQ9VFleSb4zJBY
 RxWTQUy0Vp0O4vuB3nMfycvedUZ+ubqWoDBPkiW0cTxfyGc8MtkJ/O93iF86kpXDPUf3
 jCGEpMoq2WanRHTXDVGlPfYGZMDncktAZh728ARx2VHniTVjV0t8lpS4iYlQdtpEzSqp
 Um0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Y85WkunXwYTbEnJROwkrffmDCY/UpF3UWrZcQqlD/E=;
 b=ttsCbuRQYwmZdKu4YJ2i2FWsMCvbePhNn3AXZoPXXjImtpCUtjGsKSOk7U212Dm4aK
 E0kUqHq0H+o+XZ3m9r2YbYqmjdfSpAdbDVxc+sQ8H1YusTWpA4aoVAH4OZ+olt+Mh2cz
 F16/a3yb9TzTxoESZstgQ66Hj86dG3O0vpqB/7GN6HPVMRYvELnAf3D+zO1eJJZip7Iz
 nd3Rk5l5zr8HyXwDyfixozqBMyUPuNcb6ONy2p6I5d72o+4bzW4JAgIXHoBP3tgoRP7e
 BJWwAqGW4I+YADC3WGmxKUbwPqPqyE32Idk/UMu53jV4JKkHK8MnI/shphhHloKBnMj4
 uaHQ==
X-Gm-Message-State: AOAM533/YJ6/DdoWiXj2OoGo/CWrQXZ1svK22BI5x5I2gx6i16L+/Syq
 qSYyZsvSuArbFLkKF6llkAk88IefgmcJlQ==
X-Google-Smtp-Source: ABdhPJyWRh0yqQtckeqta5jGiPEOHaGqQf9lOqq/WOIiKUaYTG3dCvAIt+nYpeJW2nyTX2cgA90Hgg==
X-Received: by 2002:a17:902:6947:b029:db:c7fd:9db3 with SMTP id
 k7-20020a1709026947b02900dbc7fd9db3mr24051073plt.56.1608703337207; 
 Tue, 22 Dec 2020 22:02:17 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/22] tcg/riscv: Convert to tcg-target-constr.h
Date: Tue, 22 Dec 2020 22:01:51 -0800
Message-Id: <20201223060204.576856-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223060204.576856-1-richard.henderson@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
 tcg/riscv/tcg-target-constr.h | 24 +++++++++++++++++++++
 tcg/riscv/tcg-target.h        |  1 +
 tcg/riscv/tcg-target.c.inc    | 39 -----------------------------------
 3 files changed, 25 insertions(+), 39 deletions(-)
 create mode 100644 tcg/riscv/tcg-target-constr.h

diff --git a/tcg/riscv/tcg-target-constr.h b/tcg/riscv/tcg-target-constr.h
new file mode 100644
index 0000000000..5daf2e6a5b
--- /dev/null
+++ b/tcg/riscv/tcg-target-constr.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * RISC-V target-specific operand constaints.
+ * Copyright (c) 2020 Linaro
+ */
+
+#define ALL_GENERAL_REGS  0xffffffffu
+
+#ifdef CONFIG_SOFTMMU
+#define ALL_QLDST_REGS \
+    (ALL_GENERAL_REGS & ~((1 << TCG_REG_A0) | (1 << TCG_REG_A1) | \
+                          (1 << TCG_REG_A2) | (1 << TCG_REG_A3) | \
+                          (1 << TCG_REG_A5)))
+#else
+#define ALL_QLDST_REGS   ALL_GENERAL_REGS
+#endif
+
+REGS('r', ALL_GENERAL_REGS)
+REGS('L', ALL_QLDST_REGS)
+
+CONST('I', TCG_CT_CONST_S12)
+CONST('N', TCG_CT_CONST_N12)
+CONST('M', TCG_CT_CONST_M12)
+CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 032439d806..ff8ff43a46 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -175,5 +175,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP 0
+#define TCG_TARGET_CONSTR_H
 
 #endif
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index d536f3ccc1..33047c1951 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -131,45 +131,6 @@ static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
     }
 }
 
-/* parse target specific constraints */
-static const char *target_parse_constraint(TCGArgConstraint *ct,
-                                           const char *ct_str, TCGType type)
-{
-    switch (*ct_str++) {
-    case 'r':
-        ct->regs = 0xffffffff;
-        break;
-    case 'L':
-        /* qemu_ld/qemu_st constraint */
-        ct->regs = 0xffffffff;
-        /* qemu_ld/qemu_st uses TCG_REG_TMP0 */
-#if defined(CONFIG_SOFTMMU)
-        tcg_regset_reset_reg(ct->regs, tcg_target_call_iarg_regs[0]);
-        tcg_regset_reset_reg(ct->regs, tcg_target_call_iarg_regs[1]);
-        tcg_regset_reset_reg(ct->regs, tcg_target_call_iarg_regs[2]);
-        tcg_regset_reset_reg(ct->regs, tcg_target_call_iarg_regs[3]);
-        tcg_regset_reset_reg(ct->regs, tcg_target_call_iarg_regs[4]);
-#endif
-        break;
-    case 'I':
-        ct->ct |= TCG_CT_CONST_S12;
-        break;
-    case 'N':
-        ct->ct |= TCG_CT_CONST_N12;
-        break;
-    case 'M':
-        ct->ct |= TCG_CT_CONST_M12;
-        break;
-    case 'Z':
-        /* we can use a zero immediate as a zero register argument. */
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


