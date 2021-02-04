Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260AB30EA41
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:36:00 +0100 (CET)
Received: from localhost ([::1]:52644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UUx-0003Zd-3X
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:35:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjS-0005gZ-Ss
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:54 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:38328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjQ-00043Z-UM
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:54 -0500
Received: by mail-pf1-x42d.google.com with SMTP id y205so1076050pfc.5
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wOvkZ0sAbeq0kMMHx/GBq6hm2tymswKeRwzIJ0G9jzI=;
 b=D+WNkqjAdin8oWFhpTBepHLSSnPH+QAFj3X8tEoS4dFbup/c5O9E3kygGkX40u/Msu
 cK34j2gbriB3VJ9Q7hiQ/4MOjDIgoihXcIVoitFHhW82Ll/AGvP4ID/Mt9y7/glhrnIA
 6JRa9fPas5iUqbutKWJrhM9MjRUP7a1y/1WbUaLqo7O1gRSae7MuuQ9L7azGoE6+JnOL
 CDcUtALWUH/ujZM7yPz9eO9vK/JBbQWrgTsDI70gJs7+ACFCfrlck5Wu/xv2FwJjdcjR
 qnLR29aye2h1+1cRHp9aITiEppGDCLxaKuhQZplU+vl/Ja6mdKhVbRndnj5AwTTEjHek
 ZlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wOvkZ0sAbeq0kMMHx/GBq6hm2tymswKeRwzIJ0G9jzI=;
 b=CNOlB4z7fVKyBauTpnYdhiSFdbng16C61pe4y5ESWHpJ3O8vNq1TCQ1IsaSBcIONpK
 bPc3mSU9u1pMUkO2oNGc54oBA2haDiZszivnNvgBHfQCuPnWg56i4bsRDm2MgHPfp6X0
 vCA5pJ25dicIq1nFR39X6TSOMcgqBpmPMNHwCVwLyDJss6Rdcs9/Y2asR2oqRIaoSoBH
 aIP5hcSBZ7c38fGij4zD0Wga5Kt1O7622IlxZyNOZwoingEQ39fHA0MXV5tusNay0J8J
 Pn7ivZWIqNVdFvNfR0rlND7+5bONSySJe7VZJIF43YVFCK3YE4Xui7g3KbuG9hfZgij/
 aGvQ==
X-Gm-Message-State: AOAM531sqvuF9FE9N6jMbrZXO1h9hPH5AvB/t8q27D3e5CyCQwkUGTN1
 nTPwBPRABAEBmMp4OuTkwPEWkRrbDZUqmJIO
X-Google-Smtp-Source: ABdhPJwuQoVwJIx4Rp69YMcRonNu81A48PcCVmFSnaEUkg66gN2UuLoeAacz+fTbQHjx6GStEJmHSA==
X-Received: by 2002:a63:d855:: with SMTP id k21mr6417323pgj.399.1612403211710; 
 Wed, 03 Feb 2021 17:46:51 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 56/93] tcg/tci: Clean up deposit operations
Date: Wed,  3 Feb 2021 15:44:32 -1000
Message-Id: <20210204014509.882821-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

Use the correct set of asserts during code generation.
We do not require the first input to overlap the output;
the existing interpreter already supported that.

Split out tci_args_rrrbb in the translator.
Use the deposit32/64 functions rather than inline expansion.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target-con-set.h |  1 -
 tcg/tci.c                    | 33 ++++++++++++++++-----------------
 tcg/tci/tcg-target.c.inc     | 24 ++++++++++++++----------
 3 files changed, 30 insertions(+), 28 deletions(-)

diff --git a/tcg/tci/tcg-target-con-set.h b/tcg/tci/tcg-target-con-set.h
index f51b7bcb13..316730f32c 100644
--- a/tcg/tci/tcg-target-con-set.h
+++ b/tcg/tci/tcg-target-con-set.h
@@ -13,7 +13,6 @@ C_O0_I2(r, r)
 C_O0_I3(r, r, r)
 C_O0_I4(r, r, r, r)
 C_O1_I1(r, r)
-C_O1_I2(r, 0, r)
 C_O1_I2(r, r, r)
 C_O1_I4(r, r, r, r, r)
 C_O2_I1(r, r, r)
diff --git a/tcg/tci.c b/tcg/tci.c
index cb24295cd9..e10ccfc344 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -168,6 +168,7 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   tci_args_<arguments>
  * where arguments is a sequence of
  *
+ *   b = immediate (bit position)
  *   i = immediate (uint32_t)
  *   I = immediate (tcg_target_ulong)
  *   r = register
@@ -236,6 +237,16 @@ static void tci_args_rrrc(const uint8_t **tb_ptr,
     *c3 = tci_read_b(tb_ptr);
 }
 
+static void tci_args_rrrbb(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
+                           TCGReg *r2, uint8_t *i3, uint8_t *i4)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *i3 = tci_read_b(tb_ptr);
+    *i4 = tci_read_b(tb_ptr);
+}
+
 #if TCG_TARGET_REG_BITS == 32
 static void tci_args_rrrr(const uint8_t **tb_ptr,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGReg *r3)
@@ -449,11 +460,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         TCGReg r0, r1, r2;
         tcg_target_ulong t0;
         tcg_target_ulong t1;
-        tcg_target_ulong t2;
         TCGCond condition;
         target_ulong taddr;
-        uint8_t tmp8;
-        uint16_t tmp16;
+        uint8_t pos, len;
         uint32_t tmp32;
         uint64_t tmp64;
 #if TCG_TARGET_REG_BITS == 32
@@ -644,13 +653,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
 #if TCG_TARGET_HAS_deposit_i32
         case INDEX_op_deposit_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tmp16 = *tb_ptr++;
-            tmp8 = *tb_ptr++;
-            tmp32 = (((1 << tmp8) - 1) << tmp16);
-            tci_write_reg(regs, t0, (t1 & ~tmp32) | ((t2 << tmp16) & tmp32));
+            tci_args_rrrbb(&tb_ptr, &r0, &r1, &r2, &pos, &len);
+            regs[r0] = deposit32(regs[r1], pos, len, regs[r2]);
             break;
 #endif
         case INDEX_op_brcond_i32:
@@ -806,13 +810,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
 #if TCG_TARGET_HAS_deposit_i64
         case INDEX_op_deposit_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tmp16 = *tb_ptr++;
-            tmp8 = *tb_ptr++;
-            tmp64 = (((1ULL << tmp8) - 1) << tmp16);
-            tci_write_reg(regs, t0, (t1 & ~tmp64) | ((t2 << tmp16) & tmp64));
+            tci_args_rrrbb(&tb_ptr, &r0, &r1, &r2, &pos, &len);
+            regs[r0] = deposit64(regs[r1], pos, len, regs[r2]);
             break;
 #endif
         case INDEX_op_brcond_i64:
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 2c64b4f617..640407b4a8 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -126,11 +126,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_rotr_i64:
     case INDEX_op_setcond_i32:
     case INDEX_op_setcond_i64:
-        return C_O1_I2(r, r, r);
-
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
-        return C_O1_I2(r, 0, r);
+        return C_O1_I2(r, r, r);
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
@@ -480,13 +478,19 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     CASE_32_64(deposit)  /* Optional (TCG_TARGET_HAS_deposit_*). */
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_debug_assert(args[3] <= UINT8_MAX);
-        tcg_out8(s, args[3]);
-        tcg_debug_assert(args[4] <= UINT8_MAX);
-        tcg_out8(s, args[4]);
+        {
+            TCGArg pos = args[3], len = args[4];
+            TCGArg max = opc == INDEX_op_deposit_i32 ? 32 : 64;
+
+            tcg_debug_assert(pos < max);
+            tcg_debug_assert(pos + len <= max);
+
+            tcg_out_r(s, args[0]);
+            tcg_out_r(s, args[1]);
+            tcg_out_r(s, args[2]);
+            tcg_out8(s, pos);
+            tcg_out8(s, len);
+        }
         break;
 
     CASE_32_64(brcond)
-- 
2.25.1


