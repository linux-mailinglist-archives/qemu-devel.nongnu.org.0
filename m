Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B374A2F8799
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:24:13 +0100 (CET)
Received: from localhost ([::1]:59976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0WZo-0006Xg-OI
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:24:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHm-0004G9-MF
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:34 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:44776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHk-0004KM-DB
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:34 -0500
Received: by mail-pf1-x42b.google.com with SMTP id t29so1137317pfg.11
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 13:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M+mEimshrpDmW7dShVzEOTUVx8FhHmR6OQKgf+xqsf0=;
 b=i/19yCOc5ecJLPct8EX0sI2dVKOLhArkzXFcj+3HXXHId8kZHBwIPKL9zsYLiP3RFA
 sPo456klZ7Fiml6VvvJVzXSjjiOdXMy5JBOrqvXzzKZdAshgB4WfNEOx2FTctwrhS0cS
 uEkijaBpwZkBPLorko8ljSvvEhBHnT5UpI+Bn8IF3dvcEpfYdAHuvhAw/SeEaSGHSNJy
 QzYYUJV3EXwiaO52fHF63PIDH69SFby9aqVNpDCs7XULJKBChq2ahTKx2FhI7/cZYX2l
 jznKQfMFEXWUpEQdLQM5kO8rEBkIuA6e6BEBXgIS6Ns7GUp735OukpdydDVbIf+Iq1J9
 QcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M+mEimshrpDmW7dShVzEOTUVx8FhHmR6OQKgf+xqsf0=;
 b=psq/xj636ZIRD0uaj2xLcd0heNelqrM9g39aKY7huSExKZCtLuzqLCe6WjktKQ0NO9
 Vkd244faKFRRBaO5L1SEYYcfVBTHVXL6M91pc8X/n1JWP+URGZNNBWYJvUXS3Lno1vFA
 mAVeHWR9JxUixVfMbxAB5uihZH0j0URBz6GG3sXh/+txiEhuAitUk4rlrwR7SWN203J6
 e9Cc0xHIli8sFj8S2VOicCMj35ntkjERZ8tNHH5U0HPKfi+Gd5I5kDsfBLkOSBKid83V
 r7bi1kS9D4uMSl25wrhw+6yUulF6OCPFBhtJ5XzSV+b/voXsL4xts86HP0ErIeXMaJ7u
 /ZVQ==
X-Gm-Message-State: AOAM532ZDBx2x1DIIV6uXFESjsTY0njKy30bEcCm6drqOFkVYnpI0cBj
 o++8Uu3fG+3G7LrFlsym6QGB4R9tz30zpc8P
X-Google-Smtp-Source: ABdhPJxST8YzTX3IhyWjVSMNZl3v0EMlZ1eBEBbyLkNXouC4Mi8zF6YpCZYmDbdUr6K6i5U9g1qM+Q==
X-Received: by 2002:a62:6845:0:b029:1ae:2731:8a89 with SMTP id
 d66-20020a6268450000b02901ae27318a89mr14863722pfc.73.1610744730880; 
 Fri, 15 Jan 2021 13:05:30 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id h15sm8920221pfo.71.2021.01.15.13.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 13:05:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/22] tcg: Remove TCG_TARGET_CON_SET_H
Date: Fri, 15 Jan 2021 11:04:56 -1000
Message-Id: <20210115210456.1053477-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115210456.1053477-1-richard.henderson@linaro.org>
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All backends have now been converted to tcg-target-con-set.h,
so we can remove the fallback code.

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
index 36fdeef10f..4d4f4e9b71 100644
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
@@ -463,8 +459,6 @@ static const TCGTargetOpDef constraint_sets[] = {
 #define C_O2_I4(O1, O2, I1, I2, I3, I4) \
     C_PFX6(c_o2_i4_, O1, O2, I1, I2, I3, I4)
 
-#endif /* TCG_TARGET_CON_SET_H */
-
 #include "tcg-target.c.inc"
 
 /* compare a pointer @ptr and a tb_tc @s */
@@ -2536,13 +2530,7 @@ static void process_op_defs(TCGContext *s)
             continue;
         }
 
-#ifdef TCG_TARGET_CON_SET_H
         tdefs = &constraint_sets[tcg_target_op_def(op)];
-#else
-        tdefs = tcg_target_op_def(op);
-        /* Missing TCGTargetOpDef entry. */
-        tcg_debug_assert(tdefs != NULL);
-#endif
 
         for (i = 0; i < nb_args; i++) {
             const char *ct_str = tdefs->args_ct_str[i];
-- 
2.25.1


