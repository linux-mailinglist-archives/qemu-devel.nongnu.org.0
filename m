Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D696FED82
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:07:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1JB-0007Hp-45; Thu, 11 May 2023 04:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1In-0006hx-Sh
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:30 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Ib-00013R-Bg
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:29 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50db7f0a1b4so4809924a12.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792316; x=1686384316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YsEP/yJKwRseCt1X5kVWTrfw+UMz9PZRzJRXfMcyJV8=;
 b=EHxdL+/Zp4j8jQobbL+UE3dnjSUOvI/eaFYeRm+RUmfGBX3jP68BoXb1qrEfbEGC4Z
 +Ufjp2AEvpBW8GGHUk3XbRWnF0rulqVWNg6MozIqw3F8UnsEMIP4zUyNzZjWmlUqpr7r
 kVVOu6WTEQ5F3Of3P2h5UsHzJI/tgTX/+ilb7/a3/z/S2GuS4imnlXI9sZC8vOus35aF
 WHU53+iIaSzg+JnghnetvnJBEJThXw+WSIBqHEOSffFq54X8BNDXNfVDeulsWb+yiWde
 vcONq6I9er4gpp6A8MOOCJZhsu+CwwLlCxvmMPBpTQ9RQKoSRPusl8JgfTwbUir241fO
 CdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792316; x=1686384316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YsEP/yJKwRseCt1X5kVWTrfw+UMz9PZRzJRXfMcyJV8=;
 b=J6uEOvXIpbreR96yo+u5rQyqdRoY1S45QPKSnc3EfOxhrKw2b3jRkQwmapBfbE/n1s
 Hx9EMAI/+zLL2xWLCGjSftDMVZuUCTexTVNLTAH8kQsTAY3xdFkWyeiBTN/+3Pxmih/b
 QIJ7rbp3UeKHGGlLFOs3g51LaIEfd5Xts7ind7pBim05L9rUGIEWrN86Lvolmee93N0p
 YE4/2q5Frt696BCCb+pdYBq3OmPz9UKHuCGwhzCjQHTJPOIUurw/H807L97P2v6vPeH9
 5qPArDA4JPuCyKs15gZK+LcHMKQovSoWxewTDyW1hDOyTq9xXcSeFeKGxrURkChnDUk8
 j7JA==
X-Gm-Message-State: AC+VfDyP7SPhuZLnacztrefuorjSruI6uQ7Il50r/xBoJgZ7cqRaB8eP
 NsRjkfFrHDSAviM+oJOd//YmZi4SL+TG/0UWCUjZRQ==
X-Google-Smtp-Source: ACHHUZ7KQHpKfYVvCXVhUmElB7sSbtT9iYKsHH0wRJbt+f8hn9kf68xe/TnC7rcV1dbLBqkb6wTYNg==
X-Received: by 2002:a50:ee0f:0:b0:504:9349:7901 with SMTP id
 g15-20020a50ee0f000000b0050493497901mr15162896eds.38.1683792315828; 
 Thu, 11 May 2023 01:05:15 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:05:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 38/53] tcg/riscv: Simplify constraints on qemu_ld/st
Date: Thu, 11 May 2023 09:04:35 +0100
Message-Id: <20230511080450.860923-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52e.google.com
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
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target-con-set.h |  2 --
 tcg/riscv/tcg-target-con-str.h |  1 -
 tcg/riscv/tcg-target.c.inc     | 16 +++-------------
 3 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/tcg/riscv/tcg-target-con-set.h b/tcg/riscv/tcg-target-con-set.h
index d4cff673b0..d88888d3ac 100644
--- a/tcg/riscv/tcg-target-con-set.h
+++ b/tcg/riscv/tcg-target-con-set.h
@@ -10,10 +10,8 @@
  * tcg-target-con-str.h; the constraint combination is inclusive or.
  */
 C_O0_I1(r)
-C_O0_I2(LZ, L)
 C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
-C_O1_I1(r, L)
 C_O1_I1(r, r)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
diff --git a/tcg/riscv/tcg-target-con-str.h b/tcg/riscv/tcg-target-con-str.h
index 8d8afaee53..6f1cfb976c 100644
--- a/tcg/riscv/tcg-target-con-str.h
+++ b/tcg/riscv/tcg-target-con-str.h
@@ -9,7 +9,6 @@
  * REGS(letter, register_mask)
  */
 REGS('r', ALL_GENERAL_REGS)
-REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index c22d1e35ac..d12b824d8c 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -125,17 +125,7 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
 #define TCG_CT_CONST_N12   0x400
 #define TCG_CT_CONST_M12   0x800
 
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
+#define ALL_GENERAL_REGS   MAKE_64BIT_MASK(0, 32)
 
 #define sextreg  sextract64
 
@@ -1600,10 +1590,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_qemu_ld_i32:
     case INDEX_op_qemu_ld_i64:
-        return C_O1_I1(r, L);
+        return C_O1_I1(r, r);
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st_i64:
-        return C_O0_I2(LZ, L);
+        return C_O0_I2(rZ, r);
 
     default:
         g_assert_not_reached();
-- 
2.34.1


