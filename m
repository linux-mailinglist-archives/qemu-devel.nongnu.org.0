Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF90E2E18C2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:08:46 +0100 (CET)
Received: from localhost ([::1]:34520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxKH-0005JH-VN
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:08:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxEG-0008RY-0S
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:34 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:39002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxE5-0000Np-En
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:29 -0500
Received: by mail-pl1-x62c.google.com with SMTP id x18so8605180pln.6
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7XC/DQ4TKJStS0mIx8J53BbElxWGv8f6A8Dnpnd7zCA=;
 b=hQiMlJZXhFSdWAIjHfUfg9GWRAX9klPZxJtqc774iHFxgtoL33f3YklwqgxOC45S6A
 UTtLMZcZ07ym9yaDmKCn5nWBUJjzqXpOGC8aEaHp+xdi6TwQQFVS8quDLVeKB7u/1HM0
 4wMNUiUNg5kOz1DCM+NAjsHudsJ3BqPbnakXzEtXMY2bBbwu1SiLtm73DTbBEiQrOPo/
 M6m1xjAAJEmek8vWKSjgKFy/fiVLjefYozcdO8VDFpB3A9i87senhHUP9az7JGLUdDXD
 2g9fdDLOhpfzdrz5CZ0u9i6z/+t3WGzRIG+ekw8wTtc9aKZRxm67+6EiVGk9mM3W39Bs
 BJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7XC/DQ4TKJStS0mIx8J53BbElxWGv8f6A8Dnpnd7zCA=;
 b=kBc3N+MjnWoQ2nF75Z1nUijz1GPiriJqpKaQ9u/ASuS7OoQeOzXeoaa/an/6QpWmHY
 icw8u7CX4NPW5VFcJuSgxoBftcgI85jwY4rOInlR4f77L4JqxfKZWz3gUro7w1eeG8ZD
 8uYYD0vjlR5vKZuZnoq7LXCGdl8wPmjluYD6mT99Fu4lipqzrRFDjwHMAWXTiLS9T1kb
 fC9rgp7pC5yhKu4p8p4rpmXaYPfHfppI21EqaJJqFCremzpkgbfQqF5eA3POkELuGmNk
 qtv6DtjGDpRRAxaNILAhXMtue33gzLkZVSt5DkN5JntEMIjZ9eIn6RyREW6c49jPaU88
 EQPg==
X-Gm-Message-State: AOAM530ZV9ARHTNbje+ALG+lwtUc6a6U0VGxljCftnXBjuyp/vuLRrPg
 zyGB7GyLefehm9AhL728mPHQm+gpDL997Q==
X-Google-Smtp-Source: ABdhPJzRyfWRNkQdI1hhezcCOYylzVFwjoZUPZXizOGahr5TdDyvG8q/x/gMFxjPYEGTI5IJkVMcqw==
X-Received: by 2002:a17:90a:1bc7:: with SMTP id
 r7mr25893779pjr.33.1608703339458; 
 Tue, 22 Dec 2020 22:02:19 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/22] tcg/sparc: Convert to tcg-target-constr.h
Date: Tue, 22 Dec 2020 22:01:53 -0800
Message-Id: <20201223060204.576856-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223060204.576856-1-richard.henderson@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target-constr.h | 16 ++++++++++++++
 tcg/sparc/tcg-target.h        |  1 +
 tcg/sparc/tcg-target.c.inc    | 39 -----------------------------------
 3 files changed, 17 insertions(+), 39 deletions(-)
 create mode 100644 tcg/sparc/tcg-target-constr.h

diff --git a/tcg/sparc/tcg-target-constr.h b/tcg/sparc/tcg-target-constr.h
new file mode 100644
index 0000000000..379eb83ca4
--- /dev/null
+++ b/tcg/sparc/tcg-target-constr.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Sparc target-specific operand constaints.
+ * Copyright (c) 2020 Linaro
+ */
+
+#define RESERVE_QLDST  (7u << TCG_REG_O0)  /* O0, O1, O2 */
+
+REGS('r', 0xffffffff)
+REGS('R', ALL_64)
+REGS('s', 0xffffffff & ~RESERVE_QLDST)
+REGS('S', ALL_64 & ~RESERVE_QLDST)
+
+CONST('I', TCG_CT_CONST_S11)
+CONST('J', TCG_CT_CONST_S13)
+CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index 633841ebf2..bfee6191b3 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -179,5 +179,6 @@ static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CONSTR_H
 
 #endif
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 6775bd30fc..c92742aaec 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -319,45 +319,6 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
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


