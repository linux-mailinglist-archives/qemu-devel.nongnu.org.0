Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CF330D16A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:23:58 +0100 (CET)
Received: from localhost ([::1]:44786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l77pl-00081j-60
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:23:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iB-0007ho-DX
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:07 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:45993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77i9-00010e-L3
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:07 -0500
Received: by mail-pg1-x534.google.com with SMTP id v19so16212715pgj.12
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h5y6ZYWFF1duKN4B3w6W+tnJz7us/4nIL76bMWBTaac=;
 b=AXBPCUtl5/3mXCgg0FCLFrlhyS1LTOwcoEwWEKcmLe08ckw/ybmk6ZAXsYtGPWp/1A
 JU2Z4xI1GjPvt66O5Fgx/BaRIST8PznVmeA86b4Gl5bXeMrjKVhxQ4GkOKSnVpv6E3BO
 buU3kuii7WAVWUhFGeeO2iyuTfovaBNpMnO5Wa8ROg65UZzAInsps5BmRaQYJAEuS4Tn
 QAx6NvgJ9DbdP97OhEgVijrOU5zpQJPAfcMCU+Zk4CTiuclb12gIHGN8j0dtHeBI7M0s
 nTOpCkRbdQbRUiW+lbYTHktnjymmlcvHWKtfpWvc1L40d1Cr8CPOvTL4tQkvL2HdqRFm
 OBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h5y6ZYWFF1duKN4B3w6W+tnJz7us/4nIL76bMWBTaac=;
 b=Fk12FEdeZTDHDNJn6s2R+luHpTEiXqOP1Eg7xRCp9t67Yivp6/Q4bxNF2PShiY4HQz
 o0M675VDXu+4UR0Frc+dTUXKnmsKH3VVX2CMJNw6lXgq4YuQRq/SfFUasiLcZYVMsoP/
 LKIkqYQueeKdH7Ai2ScwQFdttEwdoSzYLlafF7C1rP8EgRNefrUpo5ggaBl5UExw1R7r
 LnTNaM6+NHnUOIzON4XXSyOoXDQjyTN2AgTeer5VXAGGTmcxq08LkvWXf4o4ad5jUAj5
 fqQ3gTWGN5U8UK83oZfOreklh6j7hj2y8pwvRAUzqHQ31BEYlIMF2fTnj7tCFdk19YLH
 PvwQ==
X-Gm-Message-State: AOAM532zKmotPI+IPEgHVnWaKj0A3fpPzaV/ZzVlmt47aUdn/RILCayQ
 /Rp5hbg6G+AbLPNJOCnWLzdiThkabI510ma6
X-Google-Smtp-Source: ABdhPJzZ6Mkyb0O2AYCtxTT8RzWLiswbfs9lY/wjjJhugpOFTmJzaLgLDmZDwpebsR/7N9tlaENWig==
X-Received: by 2002:a62:88cf:0:b029:1c0:d4fb:1e62 with SMTP id
 l198-20020a6288cf0000b02901c0d4fb1e62mr895968pfd.58.1612318564423; 
 Tue, 02 Feb 2021 18:16:04 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x1sm270301pgj.37.2021.02.02.18.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:16:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/24] tcg/aarch64: Split out target constraints to
 tcg-target-con-str.h
Date: Tue,  2 Feb 2021 16:15:33 -1000
Message-Id: <20210203021550.375058-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203021550.375058-1-richard.henderson@linaro.org>
References: <20210203021550.375058-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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


