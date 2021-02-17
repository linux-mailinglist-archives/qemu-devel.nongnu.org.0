Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A398131E0E7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:58:40 +0100 (CET)
Received: from localhost ([::1]:48282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTuB-0001Tl-N6
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:58:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLf-0008GA-Sl
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:59 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLe-0007NQ-4t
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:59 -0500
Received: by mail-pl1-x635.google.com with SMTP id a24so8019964plm.11
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e1N26oOEBH/mKZCKJR62A/M2uXOOm6+5WQ72+nFodnM=;
 b=J7Af9yOH18dARi2PcdpBtXXYHttHlEam0mx213NtewSO5V6NGeJYi/Hf9wimR8tJ+8
 vqwu9+ujj6Ii0/zJ8QGXOcs6xpnaO7C6/JtQ4EEQEWa84VCCn36rIZUbrcmleWMPTNa0
 WbKDx0DFD9ytVc93EPvd9H9jBQ9CqZCCj+zkTLBodwlcGh0f8g+MCmlCvHPmyIytC5t2
 PWUBVXU02fjr5WWuwk07YoJbBE7Kz1fjujx1grEQf5O95jNOKBijHAusIG2AHeWUJeRs
 DwztLRqo+9vCTGINpESlLtJmXkFQ6iyiBbYTaFrFz0cbRQYjn00KwRiRMtJOYt1akAl5
 HeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e1N26oOEBH/mKZCKJR62A/M2uXOOm6+5WQ72+nFodnM=;
 b=tP+vVrSOFf743Rq+hVO83vTZlQdJtot0Dz/cmDvZGdcX2EhZnL5tMuI4Oc0JF2zsfN
 2D7WXscdTy0hdFGR2+qAknW4PU2es+JD8LM8FgDGQHjRHBrvz6z37Zq9wZKiifkckBNW
 ZdIdIlrWkAIEciwJX3B0PyMG37gJa4n8EWpVwGF7k4CeAx//M+ZGfsCxk+2sLJibnnwk
 wVQuSfo7GD2cfetQzrPG/TKmubx/D7SyUjHrWs42o9x1r1XYQBdfGuiuQoMyIxiKW/TG
 Wo3ccj4TQI+FpnJkL+wsg56WqngJYvJKxXPsLhVgaAUdFJecYfYgqglrJplogQfG4XIu
 EVTA==
X-Gm-Message-State: AOAM5333ZGPjcprj61e586oB0V8sQ2Jj16mbAy6UN37T2jmZMQjeBsap
 Nu1lGw425j2zh181Y+kKVeIGQ+qQefgLJQ==
X-Google-Smtp-Source: ABdhPJxBh1QANrGY1LRuXQnGPOIpv/rpNNUy4/jrnlygjCw0q6akZL7KGGqQueLtDPNc1/H/CsuviQ==
X-Received: by 2002:a17:903:18c:b029:e1:f4f0:dc26 with SMTP id
 z12-20020a170903018cb02900e1f4f0dc26mr768272plg.22.1613593376863; 
 Wed, 17 Feb 2021 12:22:56 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 31/71] tcg/tci: Clean up deposit operations
Date: Wed, 17 Feb 2021 12:19:56 -0800
Message-Id: <20210217202036.1724901-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
index 10f58e4f25..3ce2b72316 100644
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
@@ -432,11 +443,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -627,13 +636,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -789,13 +793,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


