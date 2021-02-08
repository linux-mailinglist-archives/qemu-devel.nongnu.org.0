Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67576312932
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:11:16 +0100 (CET)
Received: from localhost ([::1]:49000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wxH-0002J4-G7
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRn-0001dK-2c
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:43 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRe-0005sO-Gh
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:42 -0500
Received: by mail-pg1-x529.google.com with SMTP id j5so452313pgb.11
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wOvkZ0sAbeq0kMMHx/GBq6hm2tymswKeRwzIJ0G9jzI=;
 b=DgcCHug/M2uULdTogyMNGY0ZQNznIvwJcHVmw1Fs2SHZPByN8VIdjNK0dfP0M4J1Kl
 Z1lYqbRv973FShU8dux2pYUnKy8gvsNBn+krckSMKVQUEbxlK99d20gBV27dvWwUWQYU
 495nU7rXqG+goRCZnss9pPlMXPab/QVfD7pUC7KqHGQU41lhcPLXPWa4lBK0lhOxEM7s
 iELrF3jfci1/w7xRLRY64AzdfqJVxx1OMuKcgPKHiXBpn1t4czuevzxsb8tjlcgwgddZ
 GK6pUmBck5YAq0qya/+3eu3IhBJc2fOqEslL+Md1TUMoYCiymqVQpnfxJqEC9WEHycYr
 U/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wOvkZ0sAbeq0kMMHx/GBq6hm2tymswKeRwzIJ0G9jzI=;
 b=AxKsoevgC4fAxosqEklxM9nGdG+Vdp8JFwlMa9WbYzJ1O26D5YXRzDY8r5qpJU9wxQ
 ScHLQiyIn7E+r/C/nmWWxSguIHy8yc/czveoYoECVhtjuH/DmfBXop4XlTSPTYJVBBGM
 AXIblpUZx0eDId1xgYcxtCTKl15YtKQAa4nSC11NYTQ4wV1rDGVz6zaqxjTml6zlaWBr
 gKps3tnDEWU4Q8kI7nCHNf5y+DDsL6kNxWGVWGx8Ys7Jy3SSr1pH7FPTbVz/ZnxCEJ1T
 QDoPHpEVK/wbkomTHuwcJKoqkLAzSeIjDjWSOjR7AN/Kz1F3DOnqa59SRUAtmxCrgGbE
 r6TQ==
X-Gm-Message-State: AOAM5320MS8Eacxap1nIYk6iWlejiNH6+OPNZXI/c2pYXzbu4/AL9Pbi
 v208W1sPH4UYQsfSB2IFcM/IQEb/cJBg0A==
X-Google-Smtp-Source: ABdhPJwLJvMgLrsxc/UL0di9ZvMODpTIAXZuTk3KE5Loe14m7WvTRmMqlwq8HOZ+PWk08Mn36Wa7gw==
X-Received: by 2002:a63:fc48:: with SMTP id r8mr14659281pgk.300.1612751912535; 
 Sun, 07 Feb 2021 18:38:32 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 31/70] tcg/tci: Clean up deposit operations
Date: Sun,  7 Feb 2021 18:37:13 -0800
Message-Id: <20210208023752.270606-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
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


