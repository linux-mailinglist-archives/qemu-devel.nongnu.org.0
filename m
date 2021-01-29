Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6AA308E59
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:24:50 +0100 (CET)
Received: from localhost ([::1]:45402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5aK1-00055n-FD
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6a-0006Y2-Mi
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:56 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:54709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6Y-00086K-7C
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:56 -0500
Received: by mail-pj1-x102e.google.com with SMTP id s23so71512pjz.4
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mc+ASukmT1uZXl4fvbEnBIBoVZRpInvW/7vs/PLRqwk=;
 b=JzLyQRfMWmHxdy0QKcZXnMp0EB/zGWle+N4MrkeZ5N5qFvwFODLWtAt1kSP478lAO5
 tj3MxK18jokfK79XIVFHdKETCZ/kHABZW0TnNerJJyLEtzOQ28jD//6C394u2mAuqWIN
 R4xIA+XOlXCRSgL2fgTnrZAxIwfwu3ZT2bwkvhgqtnj/VBdPlgbFztuw/I9SPmIwDl9N
 dUkKiBlRqlOaZsL4RpuQUYilh+yixrd0sjuBXqRs1zZ/SybYbqiTMruFum73KBMQ29zb
 RBa/opc4gHmEI5C4pidAqbFQAzpO5bmX7oneMDidMJHvCEbSftYb23lTwW2VJiJiDYvQ
 4I+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mc+ASukmT1uZXl4fvbEnBIBoVZRpInvW/7vs/PLRqwk=;
 b=IXlSLjKE7RgKEVlhddoLjDuito5AhvItU5hvhunUWq9U3N/Xgv7lgOqQPj9M3C41WA
 LcNcK1xpiNJTmy3BMvPHBmpxuzSA48Rmr5uvJd+cG0IAgNBLjTGjmFonwv2lWUYTXk+9
 tBSp2CkaMKA56Hk/DxT2uTZxvBKKE+WF/9A4hkBTrFgn08wljN1WEqKwLA88OFKpSYp5
 k6jL2Xlr1AuJR/Hgx4XqMmVf/QM4wt7FjOKZYppdIhv01uzxJPCnwmFOeA+iyKQWy+TC
 lEOVYLAM/I8glhfzK6D2b5utaCu2t4k5C78EztmLHSEoTJqZ8OOPF1x0LqNzbxLkKvF/
 QUTQ==
X-Gm-Message-State: AOAM533aZ28/ySR2ESghiCRetPrkXs48jFu+NTnzkMy0wAi5R6kO4nVD
 Rdv7wnbvq5d0Du7r0Fc6cnmxVFVmZZtttF4b
X-Google-Smtp-Source: ABdhPJzz/ROAg8+8ZbDytO8zebhRaUOCuL1urTMn6mPkwxit/XaSU4ol5kEVGToy0zdRVY+U6kPhmw==
X-Received: by 2002:a17:90a:6bc3:: with SMTP id
 w61mr6221715pjj.214.1611951052800; 
 Fri, 29 Jan 2021 12:10:52 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d133sm9247265pfd.6.2021.01.29.12.10.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 12:10:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/24] tcg/sparc: Split out target constraints to
 tcg-target-con-str.h
Date: Fri, 29 Jan 2021 10:10:17 -1000
Message-Id: <20210129201028.787853-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129201028.787853-1-richard.henderson@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
 tcg/sparc/tcg-target-con-str.h | 23 ++++++++++
 tcg/sparc/tcg-target.h         |  5 +--
 tcg/sparc/tcg-target.c.inc     | 81 +++++++++++++---------------------
 3 files changed, 55 insertions(+), 54 deletions(-)
 create mode 100644 tcg/sparc/tcg-target-con-str.h

diff --git a/tcg/sparc/tcg-target-con-str.h b/tcg/sparc/tcg-target-con-str.h
new file mode 100644
index 0000000000..fdb25d9313
--- /dev/null
+++ b/tcg/sparc/tcg-target-con-str.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define Sparc target-specific operand constraints.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * Define constraint letters for register sets:
+ * REGS(letter, register_mask)
+ */
+REGS('r', ALL_GENERAL_REGS)
+REGS('R', ALL_GENERAL_REGS64)
+REGS('s', ALL_QLDST_REGS)
+REGS('S', ALL_QLDST_REGS64)
+REGS('A', TARGET_LONG_BITS == 64 ? ALL_QLDST_REGS64 : ALL_QLDST_REGS)
+
+/*
+ * Define constraint letters for constants:
+ * CONST(letter, TCG_CT_CONST_* bit set)
+ */
+CONST('I', TCG_CT_CONST_S11)
+CONST('J', TCG_CT_CONST_S13)
+CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index 95ab9af955..5185b00524 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -66,10 +66,6 @@ typedef enum {
     TCG_REG_I7,
 } TCGReg;
 
-#define TCG_CT_CONST_S11  0x100
-#define TCG_CT_CONST_S13  0x200
-#define TCG_CT_CONST_ZERO 0x400
-
 /* used for function call generation */
 #define TCG_REG_CALL_STACK TCG_REG_O6
 
@@ -172,5 +168,6 @@ extern bool use_vis3_instructions;
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CON_STR_H
 
 #endif
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 28b5b6559a..e291eb0b95 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -67,18 +67,38 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 # define SPARC64 0
 #endif
 
-/* Note that sparcv8plus can only hold 64 bit quantities in %g and %o
-   registers.  These are saved manually by the kernel in full 64-bit
-   slots.  The %i and %l registers are saved by the register window
-   mechanism, which only allocates space for 32 bits.  Given that this
-   window spill/fill can happen on any signal, we must consider the
-   high bits of the %i and %l registers garbage at all times.  */
-#if SPARC64
-# define ALL_64  0xffffffffu
+#define TCG_CT_CONST_S11  0x100
+#define TCG_CT_CONST_S13  0x200
+#define TCG_CT_CONST_ZERO 0x400
+
+/*
+ * For softmmu, we need to avoid conflicts with the first 3
+ * argument registers to perform the tlb lookup, and to call
+ * the helper function.
+ */
+#ifdef CONFIG_SOFTMMU
+#define SOFTMMU_RESERVE_REGS MAKE_64BIT_MASK(TCG_REG_O0, 3)
 #else
-# define ALL_64  0xffffu
+#define SOFTMMU_RESERVE_REGS 0
 #endif
 
+/*
+ * Note that sparcv8plus can only hold 64 bit quantities in %g and %o
+ * registers.  These are saved manually by the kernel in full 64-bit
+ * slots.  The %i and %l registers are saved by the register window
+ * mechanism, which only allocates space for 32 bits.  Given that this
+ * window spill/fill can happen on any signal, we must consider the
+ * high bits of the %i and %l registers garbage at all times.
+ */
+#define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 32)
+#if SPARC64
+# define ALL_GENERAL_REGS64  ALL_GENERAL_REGS
+#else
+# define ALL_GENERAL_REGS64  MAKE_64BIT_MASK(0, 16)
+#endif
+#define ALL_QLDST_REGS       (ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
+#define ALL_QLDST_REGS64     (ALL_GENERAL_REGS64 & ~SOFTMMU_RESERVE_REGS)
+
 /* Define some temporary registers.  T2 is used for constant generation.  */
 #define TCG_REG_T1  TCG_REG_G1
 #define TCG_REG_T2  TCG_REG_O7
@@ -320,45 +340,6 @@ static bool patch_reloc(tcg_insn_unit *src_rw, int type,
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
@@ -1746,8 +1727,8 @@ static void tcg_target_init(TCGContext *s)
     }
 #endif
 
-    tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffff;
-    tcg_target_available_regs[TCG_TYPE_I64] = ALL_64;
+    tcg_target_available_regs[TCG_TYPE_I32] = ALL_GENERAL_REGS;
+    tcg_target_available_regs[TCG_TYPE_I64] = ALL_GENERAL_REGS64;
 
     tcg_target_call_clobber_regs = 0;
     tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_G1);
-- 
2.25.1


