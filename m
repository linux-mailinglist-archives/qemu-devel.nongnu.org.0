Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E205F30D185
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:29:04 +0100 (CET)
Received: from localhost ([::1]:60268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l77uh-0006Ln-To
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:29:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iN-0007mG-8p
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:20 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iG-00011y-Pw
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:18 -0500
Received: by mail-pj1-x1035.google.com with SMTP id z9so3630700pjl.5
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RgaHnrXuHrfMPHQIYL9jLCUkdMj6l5Wx64YdF5w4N2M=;
 b=B/WW7SSGP1Rl/VohWw7w6QH/V/iqQfBvNXdhdY8apIiJSwPN51kMQOXqlEYBgc4h4X
 Lx1jmlNcMvc59QpoLKMiw0w1bzU3rXXnSkBI3tk1R2eYqksxqADyZAAzs0DSW68v7UMx
 8h+spN2Vp6Nb//8POLVqIzNgRXFg1IFyIqT049ZPnQbmyXRexHDaULMNT0FOnG6Fy7jF
 evV+n0J7l6LqfwVX9ii5oVegCSbKPSl/lfv+wb2i4DKLL7RooxgsDoLRLpGPoISs9oFE
 S56KlXpyckgek9r44YmV2whlL7Je48atKIRxJkpr2f2NgFiEF4pCJTdDcKCbRqbXTsbD
 LM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RgaHnrXuHrfMPHQIYL9jLCUkdMj6l5Wx64YdF5w4N2M=;
 b=qpOk815M8leFGBc5odfJBtv5eD6kYr86gIHaRV4wYlG+FpqxSJ56OqdHtLPN+R3g9a
 J9J0qmtXuOVHW7ILWjrcO5Edw5AAKxG2D6yRHQvGo9KbeIhz5I10AIbhJ1Wl/Gy2Friu
 Ah0ULTXwFNTaBC17O4chQNsnpR14lsBovxFaUi4CesWOBNg0WgmtttoMzlXVaMgk0iAm
 uSXQzQ4ScUMSCBJxAjTytzO0cEaeexUVNCpSfk8Cqus9Z5L5ow2P0o1ERTfo/qpIyy5r
 VCRORJyPBlAUolIQ8ZsH3mmjv0GHEcKKbWqIIj9F1FieQaBYXrbnIfHHlMpDyBz0My4B
 nyNA==
X-Gm-Message-State: AOAM530AwQIFejunqGQM337LVUjkTgYaVjRjRlXQZW+4pRmJ9pOaosKD
 S3iL2OK6PoU0CPMVNLjIHPLwOLNG/kmHNWng
X-Google-Smtp-Source: ABdhPJwxXWgD6+xHxY19m2fUUCYZ8EOvUGsGr5hPXhqUkxy6z6Ptm99CXqauZ8CJTGtq9n5A+1ddyA==
X-Received: by 2002:a17:90a:2848:: with SMTP id
 p8mr858751pjf.232.1612318570351; 
 Tue, 02 Feb 2021 18:16:10 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x1sm270301pgj.37.2021.02.02.18.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:16:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/24] tcg/riscv: Split out target constraints to
 tcg-target-con-str.h
Date: Tue,  2 Feb 2021 16:15:37 -1000
Message-Id: <20210203021550.375058-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203021550.375058-1-richard.henderson@linaro.org>
References: <20210203021550.375058-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
 tcg/riscv/tcg-target-con-str.h | 21 ++++++++++++++
 tcg/riscv/tcg-target.h         |  1 +
 tcg/riscv/tcg-target.c.inc     | 52 +++++++++-------------------------
 3 files changed, 35 insertions(+), 39 deletions(-)
 create mode 100644 tcg/riscv/tcg-target-con-str.h

diff --git a/tcg/riscv/tcg-target-con-str.h b/tcg/riscv/tcg-target-con-str.h
new file mode 100644
index 0000000000..8d8afaee53
--- /dev/null
+++ b/tcg/riscv/tcg-target-con-str.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define RISC-V target-specific operand constraints.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * Define constraint letters for register sets:
+ * REGS(letter, register_mask)
+ */
+REGS('r', ALL_GENERAL_REGS)
+REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
+
+/*
+ * Define constraint letters for constants:
+ * CONST(letter, TCG_CT_CONST_* bit set)
+ */
+CONST('I', TCG_CT_CONST_S12)
+CONST('N', TCG_CT_CONST_N12)
+CONST('M', TCG_CT_CONST_M12)
+CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 727c8df418..daf3ef7b5c 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -171,5 +171,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP 0
+#define TCG_TARGET_CON_STR_H
 
 #endif
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 71c0badc02..20d5b5ef01 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -122,6 +122,19 @@ static const int tcg_target_call_oarg_regs[] = {
 #define TCG_CT_CONST_N12   0x400
 #define TCG_CT_CONST_M12   0x800
 
+#define ALL_GENERAL_REGS      MAKE_64BIT_MASK(0, 32)
+/*
+ * For softmmu, we need to avoid conflicts with the first 5
+ * argument registers to call the helper.  Some of these are
+ * also used for the tlb lookup.
+ */
+#ifdef CONFIG_SOFTMMU
+#define SOFTMMU_RESERVE_REGS  MAKE_64BIT_MASK(TCG_REG_A0, 5)
+#else
+#define SOFTMMU_RESERVE_REGS  0
+#endif
+
+
 static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
 {
     if (TCG_TARGET_REG_BITS == 32) {
@@ -131,45 +144,6 @@ static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
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


