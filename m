Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0047C31291D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:59:12 +0100 (CET)
Received: from localhost ([::1]:52784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wlc-0007vt-1c
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRb-0001Yh-3t
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:32 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:41665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRW-0005qf-1S
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:29 -0500
Received: by mail-pg1-x52a.google.com with SMTP id t11so5570378pgu.8
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KzQlyAD9k/hiBg8OA6mTnZcwGe7ZwxIZNF3j/mJP4ic=;
 b=pWL7H9hEEv0rCPdlXxCLhRke4wA+OnIBdCisMs5kdmtNjjndI2jOUdvGeNE7TYHvTT
 dZyYKxHv15NrUFW7jN48jTR0DGHdMNw7CmKJLtEkP42EMbvv971GU+59RPf6f+lwqXgv
 iuD9xGDs7lpz2WCwKMGObX9bPOv3fc2CZi6NWNTFUeuMICAC/8a3M34u6dR5KeM2sGW+
 UMuNcAi3F1+QgoV41rijpWNMpIL2U+rhLQSB400VC686U2wl/iaYQUX9FGvCq1oY8jwP
 BqJPb5dCLB4cVKN0Z5miRIAcqJYJfmO0Yh7TDN+3BZhhsNGgbh5DXVFBglqCWi4EUN1P
 f8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KzQlyAD9k/hiBg8OA6mTnZcwGe7ZwxIZNF3j/mJP4ic=;
 b=nkxJdFDY98vSStdRmhTAN/RAuPgpJl4DoV0Qhwl1CTDMSZ069opiIRULwbHYtYCRRV
 IYxodotYa7XF3AYvJ8lg90b1ZXKV/2LLqFK7i0xMSdLv4Gjlse7r01iIsu617pZ5xrgm
 0CURxQrMsydXfLXzEna3wJbwu5q1PBYV/Kj1dR9jFvzd9HDrEPu+UI8L7MRayklQLuU9
 55TQrRHF85phIwYR/X1Vu9842L+ORtiWAiFjfdYw/Mezl3FlBU1XDecIs4ply2sIW1nW
 UeT8P5D7hcNh3bYZzvfZS7n4LA7CQ4HXKtZ7qMWv5YSht/Ud8YjunAuvAodRHH/CfwUk
 xZ+g==
X-Gm-Message-State: AOAM53168bbfWQohxRFUb7F173M2S7B83Ddm9z4kqPBs5Sur9BEPztd4
 yTy8Jka9YqOnXuUXoLcSCgC46hRNX863fw==
X-Google-Smtp-Source: ABdhPJxdT3g3ZrCOrTaG+gvuaLZFuALKsQiZyJG5rvQ7/RuaG2+zdFUOpewgMAgBOi7qmAsb+VOfrw==
X-Received: by 2002:a62:92d7:0:b029:1d9:1591:e1fe with SMTP id
 o206-20020a6292d70000b02901d91591e1femr11541574pfd.72.1612751903934; 
 Sun, 07 Feb 2021 18:38:23 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/70] tcg/tci: Split out tci_args_rrcl and tci_args_rrrrcl
Date: Sun,  7 Feb 2021 18:37:06 -0800
Message-Id: <20210208023752.270606-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 52 ++++++++++++++++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 692b95b5c2..1e2f78a9f9 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -212,6 +212,15 @@ static void tci_args_rrs(const uint8_t **tb_ptr,
     *i2 = tci_read_s32(tb_ptr);
 }
 
+static void tci_args_rrcl(const uint8_t **tb_ptr,
+                          TCGReg *r0, TCGReg *r1, TCGCond *c2, void **l3)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *c2 = tci_read_b(tb_ptr);
+    *l3 = (void *)tci_read_label(tb_ptr);
+}
+
 static void tci_args_rrrc(const uint8_t **tb_ptr,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGCond *c3)
 {
@@ -222,6 +231,17 @@ static void tci_args_rrrc(const uint8_t **tb_ptr,
 }
 
 #if TCG_TARGET_REG_BITS == 32
+static void tci_args_rrrrcl(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
+                            TCGReg *r2, TCGReg *r3, TCGCond *c4, void **l5)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *r3 = tci_read_r(tb_ptr);
+    *c4 = tci_read_b(tb_ptr);
+    *l5 = (void *)tci_read_label(tb_ptr);
+}
+
 static void tci_args_rrrrrc(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGCond *c5)
 {
@@ -405,7 +425,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         tcg_target_ulong t0;
         tcg_target_ulong t1;
         tcg_target_ulong t2;
-        tcg_target_ulong label;
         TCGCond condition;
         target_ulong taddr;
         uint8_t tmp8;
@@ -414,7 +433,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint64_t tmp64;
 #if TCG_TARGET_REG_BITS == 32
         TCGReg r3, r4;
-        uint64_t v64, T1, T2;
+        uint64_t T1, T2;
 #endif
         TCGMemOpIdx oi;
         int32_t ofs;
@@ -611,13 +630,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         case INDEX_op_brcond_i32:
-            t0 = tci_read_rval(regs, &tb_ptr);
-            t1 = tci_read_rval(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            label = tci_read_label(&tb_ptr);
-            if (tci_compare32(t0, t1, condition)) {
+            tci_args_rrcl(&tb_ptr, &r0, &r1, &condition, &ptr);
+            if (tci_compare32(regs[r0], regs[r1], condition)) {
                 tci_assert(tb_ptr == old_code_ptr + op_size);
-                tb_ptr = (uint8_t *)label;
+                tb_ptr = ptr;
                 continue;
             }
             break;
@@ -637,13 +653,12 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg64(regs, t1, t0, tmp64);
             break;
         case INDEX_op_brcond2_i32:
-            tmp64 = tci_read_r64(regs, &tb_ptr);
-            v64 = tci_read_r64(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            label = tci_read_label(&tb_ptr);
-            if (tci_compare64(tmp64, v64, condition)) {
+            tci_args_rrrrcl(&tb_ptr, &r0, &r1, &r2, &r3, &condition, &ptr);
+            T1 = tci_uint64(regs[r1], regs[r0]);
+            T2 = tci_uint64(regs[r3], regs[r2]);
+            if (tci_compare64(T1, T2, condition)) {
                 tci_assert(tb_ptr == old_code_ptr + op_size);
-                tb_ptr = (uint8_t *)label;
+                tb_ptr = ptr;
                 continue;
             }
             break;
@@ -783,13 +798,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         case INDEX_op_brcond_i64:
-            t0 = tci_read_rval(regs, &tb_ptr);
-            t1 = tci_read_rval(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            label = tci_read_label(&tb_ptr);
-            if (tci_compare64(t0, t1, condition)) {
+            tci_args_rrcl(&tb_ptr, &r0, &r1, &condition, &ptr);
+            if (tci_compare64(regs[r0], regs[r1], condition)) {
                 tci_assert(tb_ptr == old_code_ptr + op_size);
-                tb_ptr = (uint8_t *)label;
+                tb_ptr = ptr;
                 continue;
             }
             break;
-- 
2.25.1


