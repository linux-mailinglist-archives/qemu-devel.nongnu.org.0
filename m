Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AEB2E18C8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:12:02 +0100 (CET)
Received: from localhost ([::1]:43178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxNR-0000Wi-1F
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxEC-0008RS-8E
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:34 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:43798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxE0-0000MI-Nx
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:27 -0500
Received: by mail-pl1-x62f.google.com with SMTP id x12so8589706plr.10
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=G/axsKwIG6T95QPg/jBLY9DS0jhAHEEiPneseNdvWWM=;
 b=kaiq0ERQx/+EJlrpuuO91ERJ2WAxm/0DD2cLD9eGxVBZeQEueUzAa7KfPwnAJsK74k
 vbxNd46ufuhPlVf08EBLBGmhBdlhLmcRuS7BSyDVBMvGrd/7HcS2zn8n9eIaK6AwkL0B
 Stqf9+q9hA4/FATl4hQM6d3dG5YP46SCoZluk8gYS/C7xp1V+3hXLMBtbO0BEdZtXNxi
 xUYg+AU1kbo3Rqo2Hgyr0zTHgAnhoW6BSGKywZTExNRRBpuxWauqvcaNiofT64yNQl1n
 qmgsCS8XOUgsUADZGqTgWLLjIwJmreZqGzDT+Oe1SL/0xKWmTaAzIvB2G+S+r/xnUjpf
 fSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G/axsKwIG6T95QPg/jBLY9DS0jhAHEEiPneseNdvWWM=;
 b=g8PYOHmMgZD/hOMe0+Pa03ZpK+HJyDQPU4XYDKEwvxlWllgMsDC/tZorDDhm1AUZa3
 rJtNFO9hrTnjr1FqibPPVIBB9mvLj9+8RzCl4HdLi6oBmoYVjvb9wEloua+iiYMaiq/d
 CIMUQJSCe+qME8EZ9Ai/pXhFmDXJT0inUyUUDHgGdHrJ1zU6zsMGM240khBdTfHtge2F
 0squrkJpftvw+AZLWVpPApoSK+IzHrZam0qGGJYKoYJ7acYXksgw+WzLM9Ks7CoAO0hH
 +Yps7vjBHifGetoN2pXgrZYxAmLAgeAn8MNzbdM/lkxGpO3jdA1Khas9oJrXCUhw8aS6
 1gtw==
X-Gm-Message-State: AOAM530hdHnYmF2StSCvK6qIaibNmUocOvBJXAjjlJWs3MxyqR7vrZ8F
 Xoy1JOk04sn+m8l5aMUqEvoHnjothQp/CQ==
X-Google-Smtp-Source: ABdhPJzr1mYkFSyGVbwDL4I30WBcTCITe8CrCTCKISvbZVJbEGoN1FpvYXchTj5HvnFlJ4F5Xs/GOg==
X-Received: by 2002:a17:902:b706:b029:dc:3817:4da5 with SMTP id
 d6-20020a170902b706b02900dc38174da5mr1072119pls.23.1608703333687; 
 Tue, 22 Dec 2020 22:02:13 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/22] tcg/ppc: Convert to tcg-target-constr.h
Date: Tue, 22 Dec 2020 22:01:48 -0800
Message-Id: <20201223060204.576856-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223060204.576856-1-richard.henderson@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
 tcg/ppc/tcg-target-constr.h | 37 +++++++++++++++++++++++
 tcg/ppc/tcg-target.h        |  1 +
 tcg/ppc/tcg-target.c.inc    | 58 -------------------------------------
 3 files changed, 38 insertions(+), 58 deletions(-)
 create mode 100644 tcg/ppc/tcg-target-constr.h

diff --git a/tcg/ppc/tcg-target-constr.h b/tcg/ppc/tcg-target-constr.h
new file mode 100644
index 0000000000..b4937f37f7
--- /dev/null
+++ b/tcg/ppc/tcg-target-constr.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * PowerPC target-specific operand constaints.
+ * Copyright (c) 2020 Linaro
+ */
+
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
+REGS('r', ALL_GENERAL_REGS)
+REGS('v', ALL_VECTOR_REGS)
+REGS('A', 1u << TCG_REG_R3)
+REGS('B', 1u << TCG_REG_R4)
+REGS('C', 1u << TCG_REG_R5)
+REGS('D', 1u << TCG_REG_R6)
+REGS('L', ALL_QLOAD_REGS)
+REGS('S', ALL_QSTORE_REGS)
+
+CONST('I', TCG_CT_CONST_S16)
+CONST('J', TCG_CT_CONST_U16)
+CONST('M', TCG_CT_CONST_MONE)
+CONST('T', TCG_CT_CONST_S32)
+CONST('U', TCG_CT_CONST_U32)
+CONST('W', TCG_CT_CONST_WSZ)
+CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index be10363956..78d3470f3c 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -185,5 +185,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CONSTR_H
 
 #endif
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 18ee989f95..c97f95f3cf 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -218,64 +218,6 @@ static bool reloc_pc14(tcg_insn_unit *pc, tcg_insn_unit *target)
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


