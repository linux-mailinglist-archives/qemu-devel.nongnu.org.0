Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098C831E08F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:35:57 +0100 (CET)
Received: from localhost ([::1]:48426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTYC-00038A-1I
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:35:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLL-00082E-Ue
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:40 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:34028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLK-0007I9-5D
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:39 -0500
Received: by mail-pg1-x532.google.com with SMTP id o7so9226715pgl.1
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=37vrLTjOf1a+ywG8JRaN/eT08mH7//Hhw6kYDqN5YOo=;
 b=Ygca+fC9eoeyVIyDE2xIp1nK5GOPDLMBwVJ7QaFDeIDHki9uyjaLrim2ZM6b02/qpi
 lDQwRFxJbcXTdZz/flWu697teKwtDuvkawoFeYXR1wp3FBsWn0RpDY2aF/YQLVjQRRWQ
 yJv4CFxu9Y0gLUdSaPqFU6vKCPpp1wc/WrTEjdZ37a6vl+I50H0aGUQETZknMYQ55blh
 8jI6AZFXeaIXi55sj/KaocU0EHb8Us31bV+tl06Rqp+YDsr9v2DoefKsKjVy7KVmxO8x
 OBW7EFfWG5YZptJ4pH4E8b2yEQu8MjumyZ8r73VmdrGVu5YrVhiMNJ9xRx1m94DTeiQC
 JVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=37vrLTjOf1a+ywG8JRaN/eT08mH7//Hhw6kYDqN5YOo=;
 b=GHneAvqfPvV9trtW09lacv+9lA4a8rCqa35Vhlz+WcxpfH/ze6OJYnL3H5d1ZiCGP2
 SLiRvhtT49AL2WC3anv7M3hlIG0GZOQecBoDDXErtDyFVMBUKjw1RnZccFpXK4LUPD6o
 VqxMfAZNDIqNXp300IqNH2kEiXR2M3XPGN4n+XtSv8oCbRFqJu5u8ZIYjxRDETmWkPeg
 pdy/qIZcTMA1uMIzmzIoADSd8hI6BEhqfg8XW54tW/QBbKXdgo3rrLevY7W9uD+hSul4
 THWwDM6Bkb7xLlxXPxMPW6WsUB67gcaj+bPWU5LtR9tRuVd36l7jWlMwOjWmcKccW8cX
 TGdA==
X-Gm-Message-State: AOAM532rKVfdQSr1q8MeAVYdk57h/TtZBaBz2fbKvP7ewUkHMcRHIcOZ
 qrfevVU9LJpVhxEIUFOvea/G9L5nxBS9VQ==
X-Google-Smtp-Source: ABdhPJzdvIedwJYlkdcw8rYsKrEZVlJodUiBxnv4DeTJmF9CkXQe/TTlD/MycJ5rwZw/nNiFqY7QBQ==
X-Received: by 2002:a63:da03:: with SMTP id c3mr947623pgh.176.1613593356862;
 Wed, 17 Feb 2021 12:22:36 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/71] tcg/tci: Split out tci_args_rrs
Date: Wed, 17 Feb 2021 12:19:43 -0800
Message-Id: <20210217202036.1724901-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
index 6d6a5510da..5acf5c38c3 100644
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
@@ -311,6 +342,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint8_t op_size = tb_ptr[1];
         const uint8_t *old_code_ptr = tb_ptr;
 #endif
+        TCGReg r0, r1;
         tcg_target_ulong t0;
         tcg_target_ulong t1;
         tcg_target_ulong t2;
@@ -325,6 +357,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint64_t v64;
 #endif
         TCGMemOpIdx oi;
+        int32_t ofs;
+        void *ptr;
 
         /* Skip opcode and size entry. */
         tb_ptr += 2;
@@ -401,54 +435,46 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -673,22 +699,19 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


