Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCE831290F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:49:46 +0100 (CET)
Received: from localhost ([::1]:55558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wcT-0005VE-Tv
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRP-0001Tf-T2
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:20 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:39392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRN-0005o9-Jz
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:19 -0500
Received: by mail-pf1-x432.google.com with SMTP id x23so7259188pfn.6
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6L5nwfntHiBbAqZT7vmSHngxEhaJDXVbwdQCQHJ8TTo=;
 b=e9Q5xk4jmSZ/9Mdafdi3C561NRDVb/Jxq2EuD8W9AzzzocjX4Govg57GB9xwEp3LFh
 DmVU8dxLWzd/noyqAzgo6Ihw3ExkXjWovEtxDt/efB0PLqi5EQfWyJZ8pBindjwr3QKC
 66qS4SWiMCWK+xltN2GS8avig5tBwex6emJR/Dhy9X2wQUY0/zbPQcZKRkYSHbg2bvwY
 TOJj+jVIgalYq1wFcnfbtcOIwYJ6BLgCqb4G5hHpuZN6gmybg81AUx+3XOAqMKDDti6U
 IIgBDpCegxz8vGvMQrMcuo583do0hc29XgrIJp7UMzwJb2AkssEa7wrkIDN7X4y/xNQ4
 v+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6L5nwfntHiBbAqZT7vmSHngxEhaJDXVbwdQCQHJ8TTo=;
 b=C78zkXVBD4wafOxZSz55CyPqv1mISqbDy4O10xC8FMllcC6BdLBEXT50KnwRkwvrla
 AdbRb9bnjfeMsY99Bz331JInh/MviFUJ1IAAJ8FFTg1StmenFJiB9kglGXhDZsWY8648
 F8w6vws0SpLzz/xxJsY2qvrpjWjjG0gd8e9NLCPDjuX9ABvC/iXx9f76eEtpurgi7efw
 f/oUIGsrDrJtCYkz3VzHM/fnZJK2U7RnMV4Pe/nnhMBDvEJMgXWKFnQzcuoFGTCHfIRe
 w5lZr/Kj0aiDYIEAie4PV1IbJBfIUCEEUFmq01WpEBk6Yj8OAfHI9kbc3vRJFRBUAyar
 Kiug==
X-Gm-Message-State: AOAM530paD3Rte5KDmdjnXcKYKS+XJMfwXLZGXGXmlKDTzKo/kWU7spK
 5aUk9e3gJZkl0mv6GqUap8mfAxm+W2Z6sA==
X-Google-Smtp-Source: ABdhPJzov+RCLVYD2gU5JwR4c3j46d0/cOujgmBvvV3iYfTK9JtlEsGTS+4RqI1LoePokMYw61KmfQ==
X-Received: by 2002:aa7:9356:0:b029:1dd:644a:d904 with SMTP id
 22-20020aa793560000b02901dd644ad904mr2893382pfn.18.1612751896377; 
 Sun, 07 Feb 2021 18:38:16 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/70] tcg/tci: Split out tci_args_rrs
Date: Sun,  7 Feb 2021 18:37:00 -0800
Message-Id: <20210208023752.270606-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

Begin splitting out functions that do pure argument decode,
without actually loading values from the register set.

This means that decoding need not concern itself between
input and output registers.  We can assert that the register
number is in range during decode, so that it is safe to
simply dereference from regs[] later.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 111 ++++++++++++++++++++++++++++++++----------------------
 1 file changed, 67 insertions(+), 44 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 20aaaca959..be298ae39d 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -83,6 +83,20 @@ static uint64_t tci_uint64(uint32_t high, uint32_t low)
 }
 #endif
 
+/* Read constant byte from bytecode. */
+static uint8_t tci_read_b(const uint8_t **tb_ptr)
+{
+    return *(tb_ptr[0]++);
+}
+
+/* Read register number from bytecode. */
+static TCGReg tci_read_r(const uint8_t **tb_ptr)
+{
+    uint8_t regno = tci_read_b(tb_ptr);
+    tci_assert(regno < TCG_TARGET_NB_REGS);
+    return regno;
+}
+
 /* Read constant (native size) from bytecode. */
 static tcg_target_ulong tci_read_i(const uint8_t **tb_ptr)
 {
@@ -161,6 +175,23 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
     return label;
 }
 
+/*
+ * Load sets of arguments all at once.  The naming convention is:
+ *   tci_args_<arguments>
+ * where arguments is a sequence of
+ *
+ *   r = register
+ *   s = signed ldst offset
+ */
+
+static void tci_args_rrs(const uint8_t **tb_ptr,
+                         TCGReg *r0, TCGReg *r1, int32_t *i2)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *i2 = tci_read_s32(tb_ptr);
+}
+
 static bool tci_compare32(uint32_t u0, uint32_t u1, TCGCond condition)
 {
     bool result = false;
@@ -328,6 +359,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint8_t op_size = tb_ptr[1];
         const uint8_t *old_code_ptr = tb_ptr;
 #endif
+        TCGReg r0, r1;
         tcg_target_ulong t0;
         tcg_target_ulong t1;
         tcg_target_ulong t2;
@@ -342,6 +374,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint64_t v64;
 #endif
         TCGMemOpIdx oi;
+        int32_t ofs;
+        void *ptr;
 
         /* Skip opcode and size entry. */
         tb_ptr += 2;
@@ -418,54 +452,46 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             /* Load/store operations (32 bit). */
 
         CASE_32_64(ld8u)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(uint8_t *)(t1 + t2));
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            regs[r0] = *(uint8_t *)ptr;
             break;
         CASE_32_64(ld8s)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(int8_t *)(t1 + t2));
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            regs[r0] = *(int8_t *)ptr;
             break;
         CASE_32_64(ld16u)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(uint16_t *)(t1 + t2));
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            regs[r0] = *(uint16_t *)ptr;
             break;
         CASE_32_64(ld16s)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(int16_t *)(t1 + t2));
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            regs[r0] = *(int16_t *)ptr;
             break;
         case INDEX_op_ld_i32:
         CASE_64(ld32u)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(uint32_t *)(t1 + t2));
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            regs[r0] = *(uint32_t *)ptr;
             break;
         CASE_32_64(st8)
-            t0 = tci_read_rval(regs, &tb_ptr);
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            *(uint8_t *)(t1 + t2) = t0;
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            *(uint8_t *)ptr = regs[r0];
             break;
         CASE_32_64(st16)
-            t0 = tci_read_rval(regs, &tb_ptr);
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            *(uint16_t *)(t1 + t2) = t0;
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            *(uint16_t *)ptr = regs[r0];
             break;
         case INDEX_op_st_i32:
         CASE_64(st32)
-            t0 = tci_read_rval(regs, &tb_ptr);
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            *(uint32_t *)(t1 + t2) = t0;
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            *(uint32_t *)ptr = regs[r0];
             break;
 
             /* Arithmetic operations (mixed 32/64 bit). */
@@ -690,22 +716,19 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             /* Load/store operations (64 bit). */
 
         case INDEX_op_ld32s_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(int32_t *)(t1 + t2));
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            regs[r0] = *(int32_t *)ptr;
             break;
         case INDEX_op_ld_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(uint64_t *)(t1 + t2));
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            regs[r0] = *(uint64_t *)ptr;
             break;
         case INDEX_op_st_i64:
-            t0 = tci_read_rval(regs, &tb_ptr);
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            *(uint64_t *)(t1 + t2) = t0;
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            *(uint64_t *)ptr = regs[r0];
             break;
 
             /* Arithmetic operations (64 bit). */
-- 
2.25.1


