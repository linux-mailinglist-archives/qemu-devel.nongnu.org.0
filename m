Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDAB33764C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:59:06 +0100 (CET)
Received: from localhost ([::1]:44386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMmH-0003ub-6x
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:59:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUD-0003Ni-RS
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:25 -0500
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:42556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUA-0006NI-8f
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:25 -0500
Received: by mail-qv1-xf2f.google.com with SMTP id 30so2635387qva.9
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NtYy7CVHSUTsrLhd0g6enXEgT6j0TcJMSjVB1gNIEaI=;
 b=v2CJCwAYSkbIChPQ/aL+vZ9Vh4m+ODwgVhkrjXCsIKZpgkadg61BDJY7kcQjEt4U5e
 2GoUFP44j2a5o6rkndxkF3lawr3GBulElbRIG9dbIDMonXNp0VOgI66o6cbcEeuyLwl/
 Xl4HgQguFVMwP+ql9FBz3UYNeXWSzyKjiiEOYP9joAd5ulLyyTCSg9gYJC4vAlubepUm
 IrI4F6hWHEnQ493W1v0AOQKld0hmLPnuZdBzyYnGiC49VZcly8gwI6S1e0JxEPjApuzH
 Zpdg8wyRlt7cFqtOJGdlUa4AedNKyuSV3T75jHkU3q2e0n9O+4zXCgye5rBHWmeYPEqf
 HL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NtYy7CVHSUTsrLhd0g6enXEgT6j0TcJMSjVB1gNIEaI=;
 b=nA4hMHybDloAjmSM1TrCHLx4cMW9ZPKQYQzMKtsvdb8INHlWfiWcm05G4tmYuK88BN
 M5ka3pqDzqocG9Htn9lj1E7G1j0fNXbpRUrgLnuyNwY4tVGCBOJT9n3YGJ+WAR6sE9ed
 m5QwZum/vgk2AmuCYKn+SE9p2wHxTjG+kPeYOYIc/o/oUDJf97LUoKru1TQclVCJNNYe
 30JWYDRK8xF3FQobSJ61AHc0EPpd97sgaEGkyGtTyHScm6plRG25/YVbYvjfdwRg7IQw
 Vpv9A4lsGo61spSjMmh9eHOi4AHzNOnPysbD0/Ha/yhXRRjtJ0sbLc3wyMXr8vOyYYPf
 vLEg==
X-Gm-Message-State: AOAM530FD/cxqfm2407zIsYdTBbrfQldn4/hCZmAWGfZLLrJIz0MEjsZ
 j2EhPvmUWxqoaekVxJWM2Fd1CDHvpFAYiA2v
X-Google-Smtp-Source: ABdhPJya9DFfLF9vjW6wY4/LHI1r3E3xxdWA7mLZceO/nCzaY+n4IWLiHt7V5swPApsbLA+XHaodCQ==
X-Received: by 2002:a05:6214:1103:: with SMTP id
 e3mr8069970qvs.12.1615473621378; 
 Thu, 11 Mar 2021 06:40:21 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 17/57] tcg/tci: Reduce qemu_ld/st TCGMemOpIdx operand to
 32-bits
Date: Thu, 11 Mar 2021 08:39:18 -0600
Message-Id: <20210311143958.562625-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
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

We are currently using the "natural" size routine, which
uses 64-bits on a 64-bit host.  The TCGMemOpIdx operand
has 11 bits, so we can safely reduce to 32-bits.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c                | 8 ++++----
 tcg/tci/tcg-target.c.inc | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 3ce2b72316..583059f319 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -838,7 +838,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_qemu_ld_i32:
             t0 = *tb_ptr++;
             taddr = tci_read_ulong(regs, &tb_ptr);
-            oi = tci_read_i(&tb_ptr);
+            oi = tci_read_i32(&tb_ptr);
             switch (get_memop(oi) & (MO_BSWAP | MO_SSIZE)) {
             case MO_UB:
                 tmp32 = qemu_ld_ub;
@@ -875,7 +875,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 t1 = *tb_ptr++;
             }
             taddr = tci_read_ulong(regs, &tb_ptr);
-            oi = tci_read_i(&tb_ptr);
+            oi = tci_read_i32(&tb_ptr);
             switch (get_memop(oi) & (MO_BSWAP | MO_SSIZE)) {
             case MO_UB:
                 tmp64 = qemu_ld_ub;
@@ -924,7 +924,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_qemu_st_i32:
             t0 = tci_read_rval(regs, &tb_ptr);
             taddr = tci_read_ulong(regs, &tb_ptr);
-            oi = tci_read_i(&tb_ptr);
+            oi = tci_read_i32(&tb_ptr);
             switch (get_memop(oi) & (MO_BSWAP | MO_SIZE)) {
             case MO_UB:
                 qemu_st_b(t0);
@@ -948,7 +948,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_qemu_st_i64:
             tmp64 = tci_read_r64(regs, &tb_ptr);
             taddr = tci_read_ulong(regs, &tb_ptr);
-            oi = tci_read_i(&tb_ptr);
+            oi = tci_read_i32(&tb_ptr);
             switch (get_memop(oi) & (MO_BSWAP | MO_SIZE)) {
             case MO_UB:
                 qemu_st_b(tmp64);
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 640407b4a8..6c187a25cc 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -550,7 +550,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
             tcg_out_r(s, *args++);
         }
-        tcg_out_i(s, *args++);
+        tcg_out32(s, *args++);
         break;
 
     case INDEX_op_qemu_ld_i64:
@@ -563,7 +563,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
             tcg_out_r(s, *args++);
         }
-        tcg_out_i(s, *args++);
+        tcg_out32(s, *args++);
         break;
 
     case INDEX_op_mb:
-- 
2.25.1


