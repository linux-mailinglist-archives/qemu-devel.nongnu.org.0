Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79985337603
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:45:04 +0100 (CET)
Received: from localhost ([::1]:53576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMYh-00007B-87
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:45:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMTw-000324-Ey
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:08 -0500
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:38979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMTt-0006Av-FI
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:08 -0500
Received: by mail-qk1-x736.google.com with SMTP id g185so20786356qkf.6
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=37vrLTjOf1a+ywG8JRaN/eT08mH7//Hhw6kYDqN5YOo=;
 b=dNG2YDn/1miDCPrYKmOuDh9d2GqYsi1XZoshQB8o/CbS0v6t2KhMapuhRKlce9bTZS
 Ms2AEB/UsFN1LY9z/X+HAa5OunK3/yb8tXH6UdyhB5evOLEDM9KKhz/pVHyYCzuxrQZP
 ZzzEnYNvisr6wEnbF1caHRYNn5J4RmzDdC8NHZUw/YsQzodhb8E3w/viTuF/N5EI+5Ob
 9+QZXvNuQOAFwhG6p6lYH+MbJDBXdUwuYj4UVn8+I5Otb/2Dh74SPZ34+a+UycFMs11F
 d+yGmh1+wrU5iQMs8PSN4f399NM+mAAs/bKt8stl5YtB143QKPTTX+Ht0Pa152jbmi/A
 uMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=37vrLTjOf1a+ywG8JRaN/eT08mH7//Hhw6kYDqN5YOo=;
 b=DZwKXsFMDZCiDWr2pK88QHHk8vqzRIrrPQmo/iPpaicjK8LTl4SvhtnfD9Xp4lH6GD
 0eHrGFnEjGV/ef+26N3R85NShlTOSMr3vvXyDzfUKzuCn1oaVrG+gjD1zb24FIK2Voac
 2X2xKTj+RWogXM2T707MWZ4v0J0m7S797YYu7Jl1jnmWEVJ0rfY+bZRXjk1c0wQtf2im
 QV5+S/NChTWr/A6LmdCn8hCtgqY7v8zfjJV4X7c5PEF18MQKeqtXHcs0Xrbf2iLg52zs
 v9KCLRQJtuaF33QOXhUeE8RVy1d9njDFOOjg5Yu6KlIWLWkb4ehlXyxAyEtwkZS3XJFc
 O/ww==
X-Gm-Message-State: AOAM53366vSt4b0hYXQHqohpKmSlerj3N3kBy7VOZNZP1PpcsQ2/nCVA
 ERGsq7fdE/U7BRIo1J+CDp2drCkGcDqp02Op
X-Google-Smtp-Source: ABdhPJzZxCC9H9AyJMeJE7wYWu2W+PDW7oThrgUYb5lPj8qYxrTEvK03YbRw4PwIAcZ6PqYe5kDhTw==
X-Received: by 2002:a37:9c13:: with SMTP id f19mr7928505qke.31.1615473604548; 
 Thu, 11 Mar 2021 06:40:04 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/57] tcg/tci: Split out tci_args_rrs
Date: Thu, 11 Mar 2021 08:39:04 -0600
Message-Id: <20210311143958.562625-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
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


