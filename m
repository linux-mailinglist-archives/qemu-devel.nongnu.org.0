Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3DF2E18CE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:15:14 +0100 (CET)
Received: from localhost ([::1]:52204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxQX-0004Ga-Hq
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:15:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxEK-0008Rx-9v
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:37 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:38948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxE5-0000Ne-En
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:34 -0500
Received: by mail-pf1-x42f.google.com with SMTP id m6so9764911pfm.6
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7fPp15AvNr8ncHk6m17FiqZ/DKj2/dk6PNRZ0EnN4Pc=;
 b=UmCh3f9VIPVcHlW5/BlE7xypRWo1QUi2YK5VlWMiF5L50Phi8U9t302nJGDRnEYcEA
 cdx+6UNt4FkvYBrqAXSKulnfAgx56KdnTdFViWErYQ3e8b9JSmA9TVbMML6sriks6qfl
 53JocaCyE4AFHcWfOUq2h91JIRLFatseUaVwthBeCSKnYfSudJh9/LM74ceBOs6uiBst
 YCD2Ek4f8wYDTT8x2eibzKWb+P2lAZqSuB9EPA33ipiLhYTQBrFKSpHOUnVkel4wtLCI
 CtF27oK0lKqa9FLAw4qm1yTh6Uu6R+xbjVymp/6QFZCU6SKpNRsu6OJLSP6B4JCK5+pk
 Gl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7fPp15AvNr8ncHk6m17FiqZ/DKj2/dk6PNRZ0EnN4Pc=;
 b=ivveW3/Aj1vcMAqFfYwaWXHALfr6SIabUAwOP3t6QNQIMK4vbtWSoWNkUmaYl9jGFm
 yFf0HjwVT+GP4L2Msk8dB2l183K0SzHxMAXbmK6q2VCzjaL3Nxoh4vj9tSs/QlmxvWov
 PP3vTleXzVqJd2HJcnkfWdPF0u133LGD0i+N6zmeNpFCBN9rI+o5/oVKtSawELB9G8Xa
 XnBFDGlxFSoe4xD6HUG3Sd2qw0yMf+vEhdWix2sVyVACcTXDOYMDPJXCS0xi23ewfBm9
 kW4n/PYYoDoUKZy6jiF+/cOV/Ekz7scqHcVU/VaUanvVNbF37mBVAzZRV4DCaOIuDstR
 AxhA==
X-Gm-Message-State: AOAM532Gr+83jZ9SpyV392ulpyj3aEggB/FlfwMzHdn/mloOgd4El6jN
 rjDRSXjbekOdrO51cAHJLTQFF44bqqRlWQ==
X-Google-Smtp-Source: ABdhPJyRf9Mgeu6U2i8HAqRShG1PNrnsyvYTvaMt4m8bexUTJ9AyR8DUG/r/lUNwmPu24unL5MKw1w==
X-Received: by 2002:a65:689a:: with SMTP id e26mr23188707pgt.413.1608703338284; 
 Tue, 22 Dec 2020 22:02:18 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/22] tcg/s390: Convert to tcg-target-constr.h
Date: Tue, 22 Dec 2020 22:01:52 -0800
Message-Id: <20201223060204.576856-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223060204.576856-1-richard.henderson@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 tcg/s390/tcg-target-constr.h | 15 ++++++++++++++
 tcg/s390/tcg-target.h        |  1 +
 tcg/s390/tcg-target.c.inc    | 40 ------------------------------------
 3 files changed, 16 insertions(+), 40 deletions(-)
 create mode 100644 tcg/s390/tcg-target-constr.h

diff --git a/tcg/s390/tcg-target-constr.h b/tcg/s390/tcg-target-constr.h
new file mode 100644
index 0000000000..885e91e19b
--- /dev/null
+++ b/tcg/s390/tcg-target-constr.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * S390 target-specific operand constaints.
+ * Copyright (c) 2020 Linaro
+ */
+
+REGS('r', 0xffff)
+REGS('L', 0xffff & ~((1 << TCG_REG_R2) | (1 << TCG_REG_R3) | (1 << TCG_REG_R4)))
+REGS('a', 1u << TCG_REG_R2)
+REGS('b', 1u << TCG_REG_R3)
+
+CONST('A', TCG_CT_CONST_S33)
+CONST('I', TCG_CT_CONST_S16)
+CONST('J', TCG_CT_CONST_S32)
+CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index 63c8797bd3..3aff3cc572 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -162,5 +162,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CONSTR_H
 
 #endif
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index c5e096449b..d00d78f0b9 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -402,46 +402,6 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
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


