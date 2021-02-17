Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DB731E0A0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:40:50 +0100 (CET)
Received: from localhost ([::1]:33340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTcv-0000Cl-Ko
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:40:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTKw-000785-DB
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:14 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:42713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTKu-00079h-JX
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:14 -0500
Received: by mail-pg1-x529.google.com with SMTP id o38so9191486pgm.9
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eg77pQQlLC4zBnjShq/Ox8hKnBoPA3tCVlP/vVaohvk=;
 b=In9u7mHMyXe2EG6Fs88jIzDoIewGtcK4znuZW0Npwa5nUgTSut/SraMvIQbUGKXwjS
 M46sixawv8hymftWDP/9Ii+LkV4tH1hGbhrWeh+RKPlNKYu3uAOGfMxNXAmK0Mv7bUOa
 +c4B1Xx0OOive2v04RAVbJSthX40ZqvqlhxbuIMHRrQ10dxgIS0zmWFtCicK2M3+cM8F
 Kqw4vILGuNLoOcDcALo3r/iMylJuWp7ru+XPlJqy32uqcF1KFN5uWGCJopv5KdsgmC8H
 IJzdG8JvT1R5LAYa5lP2nC92HHuPirnhZMOkvfZrStaAVvFMXe7ntBKUXzNFzZ874W1Y
 uDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eg77pQQlLC4zBnjShq/Ox8hKnBoPA3tCVlP/vVaohvk=;
 b=UfVBcupHNw93AejKIGaZc2KQqbHr3jl+Pfq/VwUZcXEyZiK2naHRlyvdxU6mNjZQ9s
 Z6BnbPIKs8uapsynQt0xeP4e3b9631erAhuWRZ+FwPQg4ZWoG3qKnXCh8AprIAGCQ+7u
 unpOfIcBpaKdaoLzQo6yDYLcMeNqUeELI0rNA5I+xQZriFyQSR2z6anVTacU3Tqj6zZB
 E2TPVoDHVSN0n/FMRbHB63NPW4o0OGK7JspcX61Z+EPgo4vT4wLXjUQnfF9/LrDer/tu
 KBer8KXEOzUllSKdWsmyOdwnyYY1ZuiPOhKTLOp1fIp0C8dxEHoJXeHq9udoIoFG5LYo
 ZjmQ==
X-Gm-Message-State: AOAM532ksrfpoOF4adzQ0n2M6HpRRqX9hD26Ar8D2I6BbDnC6ixgQ9zq
 pNJHw2/dHBuZ8X4Zjs67wwm0xA31sRaIlw==
X-Google-Smtp-Source: ABdhPJzGquwiQQeU32hMzJeGrgcnLWYjt9odmWf5EzpK7OzoMf259tHJEQiKeksgnCr96JxowinbgA==
X-Received: by 2002:a63:5f11:: with SMTP id t17mr946817pgb.391.1613593331356; 
 Wed, 17 Feb 2021 12:22:11 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/71] tcg/tci: Remove tci_read_r32s
Date: Wed, 17 Feb 2021 12:19:35 -0800
Message-Id: <20210217202036.1724901-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use explicit casts for ext32s opcodes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index a5aaa763f8..cef12f263d 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -57,13 +57,6 @@ static tcg_target_ulong tci_read_reg(const tcg_target_ulong *regs, TCGReg index)
     return regs[index];
 }
 
-#if TCG_TARGET_REG_BITS == 64
-static int32_t tci_read_reg32s(const tcg_target_ulong *regs, TCGReg index)
-{
-    return (int32_t)tci_read_reg(regs, index);
-}
-#endif
-
 #if TCG_TARGET_REG_BITS == 64
 static uint64_t tci_read_reg64(const tcg_target_ulong *regs, TCGReg index)
 {
@@ -149,15 +142,6 @@ static uint64_t tci_read_r64(const tcg_target_ulong *regs,
     return tci_uint64(tci_read_r(regs, tb_ptr), low);
 }
 #elif TCG_TARGET_REG_BITS == 64
-/* Read indexed register (32 bit signed) from bytecode. */
-static int32_t tci_read_r32s(const tcg_target_ulong *regs,
-                             const uint8_t **tb_ptr)
-{
-    int32_t value = tci_read_reg32s(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
-}
-
 /* Read indexed register (64 bit) from bytecode. */
 static uint64_t tci_read_r64(const tcg_target_ulong *regs,
                              const uint8_t **tb_ptr)
@@ -870,8 +854,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
         case INDEX_op_ext_i32_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32s(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int32_t)t1);
             break;
 #if TCG_TARGET_HAS_ext32u_i64
         case INDEX_op_ext32u_i64:
-- 
2.25.1


