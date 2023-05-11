Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026656FEDC4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:17:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Ir-0006tb-3e; Thu, 11 May 2023 04:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Ih-0006RQ-UB
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:25 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IW-00010s-Hr
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:23 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50bc4ba28cbso14721119a12.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792311; x=1686384311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GVV1vYv+cOyGCa7huWy4GqRL3D/sT7PIBjJ5kRdmWHQ=;
 b=rdKnzMh/nOd1RGaSYvMqUyIFnn1Cda2RZMYckjgoxzRgm/XfMgaOCKprC29gi+E7Jm
 9RyoVz72lf5G8wBhY/ijIck60V+3EmJ1/NUeXjyaLybN/iRwqlr8o1JCYHqaYlk5rYBh
 leeOBbUx1U9DsPu8QEZCZqDGBSOdbW4tIwd+Qrc1SGQVdTAf+2vcm8/sl5GcpPRGAqRt
 ok2QSgHJyaRh3mmuynYG5qn1YUU8MGJeQ81HYRFLeNdfWK75Twuw8V1lMyUKtbepqIns
 KxUFOJl8ZhSZjribnW8xxsw3YA4wu/GfgPx3rnmBsXk21UN55mOLcJKub/KwxeTC/+tk
 u4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792311; x=1686384311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GVV1vYv+cOyGCa7huWy4GqRL3D/sT7PIBjJ5kRdmWHQ=;
 b=ZZS5cOM/LktR0OshNqgI5ztBB4PZYX0AKA0Q7/qsvWFyrnxjBLsm+NBWBFjy8gnWJD
 qvJZTIifs12ml7r8QdLkadBwmqdDNm/NyxYIjhlDTWvu05VbX4CqRgVcn5FXkH+neQzB
 +tNoiJFt0gp9+jjvUnrlLRhcOQfdZth6eKNXD9+8XOym42/wqIchQGG2gwrGnGsewHx0
 4VMBNocC9xT5BUHLsD2vVEjOQSqoKZ1Bobbcfla1+LnR9QoZu8WwizxcpXGwiXof5355
 6M39yAmrWRvPqXA/iLtoEw8QOhbPUBwTX2kk3untacsKscruwzhybQNJYm3MaoMJVOqQ
 Qu2Q==
X-Gm-Message-State: AC+VfDz2XQNk8qTru0FlrjX4gTakotOJlTiLrszxGo5S+d8gygM1FfBZ
 4hwYqa6SHI/YsJLbSEcokV3KXjzMBIKIVnnh0UpeZw==
X-Google-Smtp-Source: ACHHUZ7SG5h7bALI6d7F5laJBfFZ09W4PNb6IVllXTf93BUiK0ZKatOjT3FMnjtZrUQinYBe1XilIQ==
X-Received: by 2002:a05:6402:886:b0:50d:b7e5:fde8 with SMTP id
 e6-20020a056402088600b0050db7e5fde8mr6478535edy.26.1683792311046; 
 Thu, 11 May 2023 01:05:11 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:05:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 30/53] tcg/loongarch64: Simplify constraints on qemu_ld/st
Date: Thu, 11 May 2023 09:04:27 +0100
Message-Id: <20230511080450.860923-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The softmmu tlb uses TCG_REG_TMP[0-2], not any of the normally available
registers.  Now that we handle overlap betwen inputs and helper arguments,
we can allow any allocatable reg.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h |  2 --
 tcg/loongarch64/tcg-target-con-str.h |  1 -
 tcg/loongarch64/tcg-target.c.inc     | 23 ++++-------------------
 3 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index 172c107289..c2bde44613 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -17,9 +17,7 @@
 C_O0_I1(r)
 C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
-C_O0_I2(LZ, L)
 C_O1_I1(r, r)
-C_O1_I1(r, L)
 C_O1_I2(r, r, rC)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
diff --git a/tcg/loongarch64/tcg-target-con-str.h b/tcg/loongarch64/tcg-target-con-str.h
index 541ff47fa9..6e9ccca3ad 100644
--- a/tcg/loongarch64/tcg-target-con-str.h
+++ b/tcg/loongarch64/tcg-target-con-str.h
@@ -14,7 +14,6 @@
  * REGS(letter, register_mask)
  */
 REGS('r', ALL_GENERAL_REGS)
-REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 60d2c904dd..83fa45c802 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -133,18 +133,7 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
 #define TCG_CT_CONST_C12   0x1000
 #define TCG_CT_CONST_WSZ   0x2000
 
-#define ALL_GENERAL_REGS      MAKE_64BIT_MASK(0, 32)
-/*
- * For softmmu, we need to avoid conflicts with the first 5
- * argument registers to call the helper.  Some of these are
- * also used for the tlb lookup.
- */
-#ifdef CONFIG_SOFTMMU
-#define SOFTMMU_RESERVE_REGS  MAKE_64BIT_MASK(TCG_REG_A0, 5)
-#else
-#define SOFTMMU_RESERVE_REGS  0
-#endif
-
+#define ALL_GENERAL_REGS   MAKE_64BIT_MASK(0, 32)
 
 static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
 {
@@ -1541,16 +1530,14 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_st32_i64:
     case INDEX_op_st_i32:
     case INDEX_op_st_i64:
+    case INDEX_op_qemu_st_i32:
+    case INDEX_op_qemu_st_i64:
         return C_O0_I2(rZ, r);
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
         return C_O0_I2(rZ, rZ);
 
-    case INDEX_op_qemu_st_i32:
-    case INDEX_op_qemu_st_i64:
-        return C_O0_I2(LZ, L);
-
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
@@ -1586,11 +1573,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ld32u_i64:
     case INDEX_op_ld_i32:
     case INDEX_op_ld_i64:
-        return C_O1_I1(r, r);
-
     case INDEX_op_qemu_ld_i32:
     case INDEX_op_qemu_ld_i64:
-        return C_O1_I1(r, L);
+        return C_O1_I1(r, r);
 
     case INDEX_op_andc_i32:
     case INDEX_op_andc_i64:
-- 
2.34.1


