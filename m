Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E792E18C9
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:12:38 +0100 (CET)
Received: from localhost ([::1]:43780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxO1-0000n8-KG
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxE5-0008Q8-SA
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:22 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxE2-0000Mv-Pz
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:21 -0500
Received: by mail-pl1-x62b.google.com with SMTP id x18so8605105pln.6
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CtwhY3hIgVrDdc8+WsDSaNPBuzHJliRzCFCUKzXl3IE=;
 b=fBmI1DRdRV4MIZWBG/BYZ/tecK/nmTWnWwfp98toic37VCWkRJyYElfLGR9iTuzDq4
 bwhQRf+aXFKyDSQjWuoclCo18GpYudZo+LvKTBwGa0RYfh0Ao+vWVss5rFREkvE7Bm8C
 DA9EY+mpufSfLGc511Wfnnu8u40puwUoJQdPb0tZZZN4ElcahY/jfmVgCahCKSEfejeb
 AOXE3c2T11MA4UA6l85HRSZ1Q517QiNn4czWqNjYreIFxlW7vT6WihdkLVYo4PcJhUK+
 swLGPHlljLyML4/lyfa6ixKZ2EE3T2gUWSmocFfQqwCKlhWSj8D6b5RZukZdFxMNdJ8z
 FVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CtwhY3hIgVrDdc8+WsDSaNPBuzHJliRzCFCUKzXl3IE=;
 b=OrYU6ddUhlVw3cEG3Uli5vAWNhsoRMks+722BkV38GILjh9FSwZ1VMNhf+NTBjB1G+
 C//qJfRirVwjiy+DlDHGRXAOWDMuNWqvvM1loWB2wjlpttL7UFAxlGIrEaHTklFs/D/d
 au59KruWDaz1wCn/h7vgmTPNCAhyGPJYCEIoPRhTTqkGytdrszgjwsFKFKjJ2SIZ4idD
 NdhhclJ6HvfpOYVaT6f5nAASjKeujUDYymsNYvagVNsWXfX5b09+L20SgSeytwCNfwkO
 awq6T/giCc6XhHkIX34GRFY0fgGZfiWjDi7cPmbqm/7uVaj1fyzVot4p9IGfbRpdW7mh
 mCpw==
X-Gm-Message-State: AOAM531si/tmDPTCTaB2Hr/Id8DjYhFwFn6+uPRgmyCstdAyBYfX5Tec
 a1hIuNlEfDfhuy+uoMBWGXc5jOQaCyFlzA==
X-Google-Smtp-Source: ABdhPJxwMK/Mcot+pGx6tgyekqLD2Ix87oolvHD8e/9JZ8VO1jP/l7P6M4NZF44mLT3eAdadOdtq4w==
X-Received: by 2002:a17:902:aa43:b029:dc:26a7:7391 with SMTP id
 c3-20020a170902aa43b02900dc26a77391mr24280121plr.51.1608703336118; 
 Tue, 22 Dec 2020 22:02:16 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/22] tcg/mips: Convert to tcg-target-constr.h
Date: Tue, 22 Dec 2020 22:01:50 -0800
Message-Id: <20201223060204.576856-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223060204.576856-1-richard.henderson@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
 tcg/mips/tcg-target-constr.h | 31 ++++++++++++++++++++
 tcg/mips/tcg-target.h        |  1 +
 tcg/mips/tcg-target.c.inc    | 56 ------------------------------------
 3 files changed, 32 insertions(+), 56 deletions(-)
 create mode 100644 tcg/mips/tcg-target-constr.h

diff --git a/tcg/mips/tcg-target-constr.h b/tcg/mips/tcg-target-constr.h
new file mode 100644
index 0000000000..22f6df0806
--- /dev/null
+++ b/tcg/mips/tcg-target-constr.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * MIPS target-specific operand constaints.
+ * Copyright (c) 2020 Linaro
+ */
+
+#define ALL_GENERAL_REGS  0xffffffffu
+#define NOA0_REGS         (ALL_GENERAL_REGS & ~(1 << TCG_REG_A0))
+
+#ifdef CONFIG_SOFTMMU
+#define ALL_QLOAD_REGS \
+    (NOA0_REGS & ~((TCG_TARGET_REG_BITS < TARGET_LONG_BITS) << TCG_REG_A2))
+#define ALL_QSTORE_REGS \
+    (NOA0_REGS & ~(TCG_TARGET_REG_BITS < TARGET_LONG_BITS   \
+                   ? (1 << TCG_REG_A2) | (1 << TCG_REG_A3)  \
+                   : (1 << TCG_REG_A1)))
+#else
+#define ALL_QLOAD_REGS   NOA0_REGS
+#define ALL_QSTORE_REGS  NOA0_REGS
+#endif
+
+REGS('r', ALL_GENERAL_REGS)
+REGS('L', ALL_QLOAD_REGS)
+REGS('S', ALL_QSTORE_REGS)
+
+CONST('I', TCG_CT_CONST_U16)
+CONST('J', TCG_CT_CONST_S16)
+CONST('K', TCG_CT_CONST_P2M1)
+CONST('N', TCG_CT_CONST_N16)
+CONST('W', TCG_CT_CONST_WSZ)
+CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index c6b091d849..f4a79bcad1 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -217,5 +217,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 #ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
+#define TCG_TARGET_CONSTR_H
 
 #endif
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 41be574e89..d0b674582a 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -189,62 +189,6 @@ static inline bool is_p2m1(tcg_target_long val)
     return val && ((val + 1) & val) == 0;
 }
 
-/* parse target specific constraints */
-static const char *target_parse_constraint(TCGArgConstraint *ct,
-                                           const char *ct_str, TCGType type)
-{
-    switch(*ct_str++) {
-    case 'r':
-        ct->regs = 0xffffffff;
-        break;
-    case 'L': /* qemu_ld input arg constraint */
-        ct->regs = 0xffffffff;
-        tcg_regset_reset_reg(ct->regs, TCG_REG_A0);
-#if defined(CONFIG_SOFTMMU)
-        if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-            tcg_regset_reset_reg(ct->regs, TCG_REG_A2);
-        }
-#endif
-        break;
-    case 'S': /* qemu_st constraint */
-        ct->regs = 0xffffffff;
-        tcg_regset_reset_reg(ct->regs, TCG_REG_A0);
-#if defined(CONFIG_SOFTMMU)
-        if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-            tcg_regset_reset_reg(ct->regs, TCG_REG_A2);
-            tcg_regset_reset_reg(ct->regs, TCG_REG_A3);
-        } else {
-            tcg_regset_reset_reg(ct->regs, TCG_REG_A1);
-        }
-#endif
-        break;
-    case 'I':
-        ct->ct |= TCG_CT_CONST_U16;
-        break;
-    case 'J':
-        ct->ct |= TCG_CT_CONST_S16;
-        break;
-    case 'K':
-        ct->ct |= TCG_CT_CONST_P2M1;
-        break;
-    case 'N':
-        ct->ct |= TCG_CT_CONST_N16;
-        break;
-    case 'W':
-        ct->ct |= TCG_CT_CONST_WSZ;
-        break;
-    case 'Z':
-        /* We are cheating a bit here, using the fact that the register
-           ZERO is also the register number 0. Hence there is no need
-           to check for const_args in each instruction. */
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


