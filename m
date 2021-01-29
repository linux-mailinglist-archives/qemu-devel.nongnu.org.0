Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AD3308E80
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:33:52 +0100 (CET)
Received: from localhost ([::1]:42444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5aSl-0007Fc-BG
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:33:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6s-0007ER-A6
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:11:14 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:42976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6q-0008En-9L
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:11:14 -0500
Received: by mail-pg1-x531.google.com with SMTP id g15so7404405pgu.9
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y1lw80f1qkFn4X3t7T1lgV932l1h1eTxnNcDp/G7l10=;
 b=nJmSouER6cNH4iHcoTCn+ZZjMCNUV191PmKleFP8GpEqQ4g0mA8WYWI//Mc1YGA4gX
 KGZfrPgToycN8k4pGK2mXzIs4cr0DrTMmd1xwDmNckLSfVfpdtw6UAjiw9CYLspeRWcY
 nRUsVcWoomv0Qy3SMUx13rHAVRhw2xKq+svLFu0/qKfV6dB/erUtiI5FG5/yU+fyR1Un
 e8xG25ioutlNY2II75iq3vvESnBRWc1tgE/lDTKkxJPr8YfnQy7aHg7HyBPssoCzD3rR
 GORPNkPhOepzKkeGP7Az7rZu4VXWUVU2BYvbqT5c0ajF2YVYpqJUkEcfMOtu+FJJlmPv
 lHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y1lw80f1qkFn4X3t7T1lgV932l1h1eTxnNcDp/G7l10=;
 b=XGFi3VhHbS/u4VLitxbjaGVjQXe9BwqCwkD/HW2neoeefQ6k+qvUoOYni2Ma7wuCKL
 FQTYKyxtECKHnodeGhIuzwRwrbsBY2F6SKhRhi9yjusl8rv/g0snKje+laAfJ7kWtF4f
 DbbyCMKnyB6rt8C4pIR4UMkk9twSY6zUikXmREvqiQxL7t+FeRfiOr+ePCcdGXD1X6Fr
 Y6ctsTNL3ECX6OmIGnjU0Wp/FPfoeBYSrEXqTnQnS+uoDdsQvnkKFMaUOJlZEZ3SYEKD
 Aolrenx9OoqqD497RbXV/INTG62HG2MBT1tktrCHg3X8slX2MrWBtuQT5QsNijlMvMFu
 skUA==
X-Gm-Message-State: AOAM531T7LvVgOt4Qk4crW5flBUvNDF2OSjeh/k8wz6pMDl7yDuVEmvA
 pOb/CKNg2dTHYjBR0rAzodnLBGaytF/8CJv5
X-Google-Smtp-Source: ABdhPJyC4C7Zq/1on4LBKr6cXqaRK6T0lWrSJL9vowteBwz8Z/fPlIyn6u8R8T9kzEc4uNifXVjdkA==
X-Received: by 2002:a62:ae0c:0:b029:1bc:a0b9:f0aa with SMTP id
 q12-20020a62ae0c0000b02901bca0b9f0aamr5799665pff.78.1611951070892; 
 Fri, 29 Jan 2021 12:11:10 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d133sm9247265pfd.6.2021.01.29.12.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 12:11:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/24] tcg: Remove TCG_TARGET_CON_SET_H
Date: Fri, 29 Jan 2021 10:10:28 -1000
Message-Id: <20210129201028.787853-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129201028.787853-1-richard.henderson@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All backends have now been converted to tcg-target-con-set.h,
so we can remove the fallback code.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h |  1 -
 tcg/arm/tcg-target.h     |  1 -
 tcg/i386/tcg-target.h    |  1 -
 tcg/mips/tcg-target.h    |  1 -
 tcg/ppc/tcg-target.h     |  1 -
 tcg/riscv/tcg-target.h   |  1 -
 tcg/s390/tcg-target.h    |  1 -
 tcg/sparc/tcg-target.h   |  1 -
 tcg/tci/tcg-target.h     |  2 --
 tcg/tcg.c                | 12 ------------
 10 files changed, 22 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 200e9b5e0e..5ec30dba25 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -155,6 +155,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CON_SET_H
 
 #endif /* AARCH64_TCG_TARGET_H */
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 4d201b1216..8d1fee6327 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -142,6 +142,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CON_SET_H
 
 #endif
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 48a6f2a336..b693d3692d 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -235,6 +235,5 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CON_SET_H
 
 #endif
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index e520a9d6e3..c2c32fb38f 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -207,6 +207,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
-#define TCG_TARGET_CON_SET_H
 
 #endif
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 551f8d0fc9..d1339afc66 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -185,6 +185,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CON_SET_H
 
 #endif
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index a998b951e4..727c8df418 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -171,6 +171,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP 0
-#define TCG_TARGET_CON_SET_H
 
 #endif
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index 7aafd25a46..641464eea4 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -159,6 +159,5 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CON_SET_H
 
 #endif
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index f50e8d50ee..f66f5d07dc 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -168,6 +168,5 @@ extern bool use_vis3_instructions;
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CON_SET_H
 
 #endif
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 1efd8c4fb0..bb784e018e 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -207,6 +207,4 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
     /* no need to flush icache explicitly */
 }
 
-#define TCG_TARGET_CON_SET_H
-
 #endif /* TCG_TARGET_H */
diff --git a/tcg/tcg.c b/tcg/tcg.c
index df9f32763e..63a12b197b 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -69,9 +69,6 @@
 /* Forward declarations for functions declared in tcg-target.c.inc and
    used here. */
 static void tcg_target_init(TCGContext *s);
-#ifndef TCG_TARGET_CON_SET_H
-static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode);
-#endif
 static void tcg_target_qemu_prologue(TCGContext *s);
 static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
                         intptr_t value, intptr_t addend);
@@ -349,7 +346,6 @@ static void set_jmp_reset_offset(TCGContext *s, int which)
     s->tb_jmp_reset_offset[which] = tcg_current_code_size(s);
 }
 
-#ifdef TCG_TARGET_CON_SET_H
 #define C_PFX1(P, A)                    P##A
 #define C_PFX2(P, A, B)                 P##A##_##B
 #define C_PFX3(P, A, B, C)              P##A##_##B##_##C
@@ -453,8 +449,6 @@ static const TCGTargetOpDef constraint_sets[] = {
 #define C_O2_I3(O1, O2, I1, I2, I3)     C_PFX5(c_o2_i3_, O1, O2, I1, I2, I3)
 #define C_O2_I4(O1, O2, I1, I2, I3, I4) C_PFX6(c_o2_i4_, O1, O2, I1, I2, I3, I4)
 
-#endif /* TCG_TARGET_CON_SET_H */
-
 #include "tcg-target.c.inc"
 
 /* compare a pointer @ptr and a tb_tc @s */
@@ -2532,7 +2526,6 @@ static void process_op_defs(TCGContext *s)
             continue;
         }
 
-#ifdef TCG_TARGET_CON_SET_H
         /*
          * Macro magic should make it impossible, but double-check that
          * the array index is in range.  Since the signness of an enum
@@ -2541,11 +2534,6 @@ static void process_op_defs(TCGContext *s)
         unsigned con_set = tcg_target_op_def(op);
         tcg_debug_assert(con_set < ARRAY_SIZE(constraint_sets));
         tdefs = &constraint_sets[con_set];
-#else
-        tdefs = tcg_target_op_def(op);
-        /* Missing TCGTargetOpDef entry. */
-        tcg_debug_assert(tdefs != NULL);
-#endif
 
         for (i = 0; i < nb_args; i++) {
             const char *ct_str = tdefs->args_ct_str[i];
-- 
2.25.1


