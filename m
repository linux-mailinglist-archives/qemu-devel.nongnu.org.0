Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9904430E9F3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:08:15 +0100 (CET)
Received: from localhost ([::1]:37614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7U46-0006bS-K7
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:08:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tiv-0005EI-6W
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:24 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:36111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Til-0003uy-49
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:20 -0500
Received: by mail-pg1-x52a.google.com with SMTP id c132so1041014pga.3
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YWPrxfItN4c65pZ/52Q4dTydvUr4VWbYL6z0GHLhLqg=;
 b=UpeJHkCgV3/5jo1hf1cY8gdP8Ua+rSj+fkpc9e5QNzx1wwBMjQQ7UNCi0T0EM4Gjh3
 o1UnlpZq8bOI7967lE3iRadQ+KXQnDS/MPgEX253JL1Digf7BdryWm3Uy13Tch4u4oac
 RTXaFiMJLx6Mp/EBdr1VxBqDHeISmG3kYjRBxPQol1kZd8Pr91ZkXuri6k/nNPNLhHBs
 2xdlj8qmnens6tZvG1whtvx/UcdJNYX8hy0H7Ej72VsLOWVbr6fxyOdqEVUx38VevdFe
 yIkRlXNTlnE37M40cRIsvQpVCHQeeVLnl1zYqV4k//AYJ8u9J6UusXDEGfusxYwai8un
 XG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YWPrxfItN4c65pZ/52Q4dTydvUr4VWbYL6z0GHLhLqg=;
 b=Lp67mZaWp/fTHSdV8CFHYb53ejwAnZy/c1saJ1m5PUFaiDPDQD1wfnd55qyQSJ2SPT
 Au8eZIJYzvgW6HPYzIljuGUqiWMXp8nWJGaRbDU06dVZ1sORAwlSKrpdVjAWu88XcNT8
 MHDE5jUnBTlAf4r1p25Nc6nqY4IVw3+VesiAJTZfT5Ii6ZvpSGLezQdcy9+FrKpdcK9G
 219KEdGKbph9gic6oOmn0PK5OCbRwKt7S9pluzTdozVsETB3i6F+8rh68pI73g95uG6O
 tdwomimwQWm0wOOcXfsWeUPZO6t56qfwn6NsdLnPYcomWYdo4BsF+sv37iMhH6ey2EJG
 gdxA==
X-Gm-Message-State: AOAM532MF5EpaTUYuO2bVg10BKyMTv66kLbGTuduj1X26ZuFRpASwZuW
 NyqnrnbhhimxczsOJQMg5KbO4GB9Iz4cBn8b
X-Google-Smtp-Source: ABdhPJz1LqNue1aOI1vw1IqArOKAMRBn0eSAm8ofDTmvf9SAdFhSeHYtt3TFOmUAr2BaoQiIBjhdPA==
X-Received: by 2002:a62:7ac4:0:b029:1bc:309a:46d3 with SMTP id
 v187-20020a627ac40000b02901bc309a46d3mr5717481pfc.18.1612403168784; 
 Wed, 03 Feb 2021 17:46:08 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 31/93] tcg/tci: Remove tci_read_r8
Date: Wed,  3 Feb 2021 15:44:07 -1000
Message-Id: <20210204014509.882821-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use explicit casts for ext8u opcodes, and allow truncation
to happen with the store for st8 opcodes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index fb3c97aaf1..c44a4aec7b 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -78,11 +78,6 @@ static int32_t tci_read_reg32s(const tcg_target_ulong *regs, TCGReg index)
 }
 #endif
 
-static uint8_t tci_read_reg8(const tcg_target_ulong *regs, TCGReg index)
-{
-    return (uint8_t)tci_read_reg(regs, index);
-}
-
 static uint16_t tci_read_reg16(const tcg_target_ulong *regs, TCGReg index)
 {
     return (uint16_t)tci_read_reg(regs, index);
@@ -169,14 +164,6 @@ tci_read_r(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
     return value;
 }
 
-/* Read indexed register (8 bit) from bytecode. */
-static uint8_t tci_read_r8(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
-{
-    uint8_t value = tci_read_reg8(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
-}
-
 #if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
 /* Read indexed register (8 bit signed) from bytecode. */
 static int8_t tci_read_r8s(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
@@ -550,7 +537,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, *(uint32_t *)(t1 + t2));
             break;
         CASE_32_64(st8)
-            t0 = tci_read_r8(regs, &tb_ptr);
+            t0 = tci_read_r(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             *(uint8_t *)(t1 + t2) = t0;
@@ -739,8 +726,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext8u_i32
         case INDEX_op_ext8u_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r8(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint8_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16u_i32
@@ -933,8 +920,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext8u_i64
         case INDEX_op_ext8u_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r8(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint8_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext8s_i64
-- 
2.25.1


