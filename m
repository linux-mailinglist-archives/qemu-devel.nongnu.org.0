Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 810612F8748
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:13:51 +0100 (CET)
Received: from localhost ([::1]:35460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0WPm-0004HQ-Fj
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHU-0003qI-To
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:16 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:42544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHT-0004Eu-1U
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:16 -0500
Received: by mail-pg1-x52f.google.com with SMTP id g15so6787096pgu.9
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 13:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UU/yDjvd+GDgaLEC+K14B7cRv73ENJkF9JbfvTefbRk=;
 b=WeW8f4MK5SUr8WYarRsPujtatYRJwVeBloqTHZqRBEzzmKLrNC/pK+O+jt1IDOWuW9
 O1lcXtUT3NXgrzVh7ZaySsMg2gRs4SqBbAO0a25sy9WYUjCxu2ksxlt4w60AtKdhldso
 sbtEIC2ynQYpaj6usDzCPGEfYso8rkvUuEYHEcP4O+Tw283RRRXC5Ecn8rCxaSzHGH2C
 +wR1xqId+1GFWnbzwAU4uu1VgA9XayQSlwzy+ENq8XAAZRcaMmK/Siem9dGE1HwbRO1q
 ApfczZigV6K3yhy92CVKTkMgep5I0O+03wtsm69dHeum0/tkzxVIldyCtlQhisFXhDon
 a3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UU/yDjvd+GDgaLEC+K14B7cRv73ENJkF9JbfvTefbRk=;
 b=rnWEDTFi99RydtoYDzqUrGnEh8vrwFhympeQ8FULV8Qs4Vpuj9sJNnWhUYcMjNPm6t
 8hCDqBv2wvBKCPVTidiOaEjg44yzer5rEAjC8jkdJxnGKKsz1lsvG2vtRRCPLGWF8W88
 iI6GeRw3QmT3jlNIHwgD+Q3qajYBvPfhBPjnlXtiGbjOIQNf3hGkCEXyUA2bXEbKeO87
 PBAxPPp33hPmxyDa+gvkHOu3nyn9P2H8aRK31FuRu+rdF1jSQSdvGdu61yBIJIhJP0Te
 G7ThK1902nV2xVmcyMFiEx7FAfnlckJmNNS2Pp9O8QAoZfG5fPiAi7c9kNK2q1JTnsC8
 2ffQ==
X-Gm-Message-State: AOAM533dcJEih4utho1wEdkYBhHQlwHSUqTqtSU/szEYut//jgsMnLsT
 kjTC9ZebmhfncJyQP88WNrIzuWF4rF3LYlRF
X-Google-Smtp-Source: ABdhPJyM1YfUjukn/e47WbVC3BOchI005pODM2VlOD4w8XvC3zq7swnxsdGAO9fgXYcVJAqjcLpC0Q==
X-Received: by 2002:a63:2cd:: with SMTP id 196mr14475462pgc.398.1610744713769; 
 Fri, 15 Jan 2021 13:05:13 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id h15sm8920221pfo.71.2021.01.15.13.05.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 13:05:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/22] tcg/s390: Split out target constraints to
 tcg-target-con-str.h
Date: Fri, 15 Jan 2021 11:04:44 -1000
Message-Id: <20210115210456.1053477-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115210456.1053477-1-richard.henderson@linaro.org>
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
 tcg/s390/tcg-target-con-str.h | 23 ++++++++++++++++++++
 tcg/s390/tcg-target.h         |  1 +
 tcg/s390/tcg-target.c.inc     | 40 -----------------------------------
 3 files changed, 24 insertions(+), 40 deletions(-)
 create mode 100644 tcg/s390/tcg-target-con-str.h

diff --git a/tcg/s390/tcg-target-con-str.h b/tcg/s390/tcg-target-con-str.h
new file mode 100644
index 0000000000..f905b357c3
--- /dev/null
+++ b/tcg/s390/tcg-target-con-str.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define S390 target-specific operand constraints.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * Define constraint letters for register sets:
+ * REGS(letter, register_mask)
+ */
+REGS('r', 0xffff)
+REGS('L', 0xffff & ~((1 << TCG_REG_R2) | (1 << TCG_REG_R3) | (1 << TCG_REG_R4)))
+REGS('a', 1u << TCG_REG_R2)
+REGS('b', 1u << TCG_REG_R3)
+
+/*
+ * Define constraint letters for constants:
+ * CONST(letter, TCG_CT_CONST_* bit set)
+ */
+CONST('A', TCG_CT_CONST_S33)
+CONST('I', TCG_CT_CONST_S16)
+CONST('J', TCG_CT_CONST_S32)
+CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index 641464eea4..c43d6aba84 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -159,5 +159,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CON_STR_H
 
 #endif
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index 8517e55232..616bcfafc8 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -403,46 +403,6 @@ static bool patch_reloc(tcg_insn_unit *src_rw, int type,
     return false;
 }
 
-/* parse target specific constraints */
-static const char *target_parse_constraint(TCGArgConstraint *ct,
-                                           const char *ct_str, TCGType type)
-{
-    switch (*ct_str++) {
-    case 'r':                  /* all registers */
-        ct->regs = 0xffff;
-        break;
-    case 'L':                  /* qemu_ld/st constraint */
-        ct->regs = 0xffff;
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R2);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R3);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R4);
-        break;
-    case 'a':                  /* force R2 for division */
-        ct->regs = 0;
-        tcg_regset_set_reg(ct->regs, TCG_REG_R2);
-        break;
-    case 'b':                  /* force R3 for division */
-        ct->regs = 0;
-        tcg_regset_set_reg(ct->regs, TCG_REG_R3);
-        break;
-    case 'A':
-        ct->ct |= TCG_CT_CONST_S33;
-        break;
-    case 'I':
-        ct->ct |= TCG_CT_CONST_S16;
-        break;
-    case 'J':
-        ct->ct |= TCG_CT_CONST_S32;
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
 /* Test if a constant matches the constraint. */
 static int tcg_target_const_match(tcg_target_long val, TCGType type,
                                   const TCGArgConstraint *arg_ct)
-- 
2.25.1


