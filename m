Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA5230EA13
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:21:40 +0100 (CET)
Received: from localhost ([::1]:41170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UH5-0003YT-Fa
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:21:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjV-0005lV-1D
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:57 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjS-00044d-K1
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:56 -0500
Received: by mail-pf1-x431.google.com with SMTP id q131so1057881pfq.10
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fkXespGLacfat/Oc2ATzIf/ZqfIgEJ0vqqLFj00td/k=;
 b=r6PYrn0ObFOVP9x9l/TTdhUh+ugROYzSwwYIrTiIG9RgyWimodhIkxi9o13hyFfyYj
 4iNAsz1Vrdfn2SUPwBKHh8sVG8v41ioLWTAuo3NgNRdM4DVZseJoFzgDeqxBl7s/ddCp
 ypTmoSCg2yvUdhoHrLe8QKUPC0neeYzcwXM1+no7t8KlHr77+ZY+mbHGPkRZT0zQpwkM
 qoQfrsXX6xqfmmcYpQLvX31KgFj3mPtJlL19UtvElvD8lalpLfLtb4pD1uwGuYI9Sv5z
 yua84T0A2l+3dM30WG9EFx0dZj3xTLsnqsbEbVzud9WPJOGCHgErXcAVWxCZuWloh/5u
 N1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fkXespGLacfat/Oc2ATzIf/ZqfIgEJ0vqqLFj00td/k=;
 b=X2F5mGOMRkDMQUPyExoiADoFmQGcvT0rcV/2vODYHzsg3NhitWWHf6ePb8Da0aa8cp
 7yiIsEY+Cr+PbkBs7nIEJaoCSrZgabO28BKzNCyQeN5GQtmAi06pJQ+1j+8XKFeumMLH
 Ktd6lbPc5GVKbLq1x2HI3NIqhOhbbwMN9Dfm3uTfu0fUH1mGXgtR1vwg9Wa3U2aiGRUi
 aNTWHZCAiBuMH/w/Dj3xUo0nUyurO+DVpjpl4QZMfCM+ZshB2j38ZIUYJEoKZE0Td+WO
 eP5TKaveYXnDE6nRyyEBe/cYj8ZgHI2/bpGAycDBDmCaXTgUxfzFlJco+LAcXH/RyVlT
 InJQ==
X-Gm-Message-State: AOAM532750lEhz3qD5aQm1CQQmkXaoxxhzTNYbLklvJjLfsGm5qxkZ4O
 sG1f4oIMMl0I90pVIKyUaHMGVf7hhWOrMKLe
X-Google-Smtp-Source: ABdhPJyEkHpuZH9Q7Q59HQSfoPbryO9oV3cu5iyl7iL06MiQ9M75w//P73zgO6S8bv88XlUxwP0RsQ==
X-Received: by 2002:a63:c1d:: with SMTP id b29mr6621757pgl.9.1612403213294;
 Wed, 03 Feb 2021 17:46:53 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 57/93] tcg/tci: Reduce qemu_ld/st TCGMemOpIdx operand to
 32-bits
Date: Wed,  3 Feb 2021 15:44:33 -1000
Message-Id: <20210204014509.882821-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

We are currently using the "natural" size routine, which
uses 64-bits on a 64-bit host.  The TCGMemOpIdx operand
has 11 bits, so we can safely reduce to 32-bits.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c                | 8 ++++----
 tcg/tci/tcg-target.c.inc | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index e10ccfc344..ddc138359b 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -855,7 +855,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_qemu_ld_i32:
             t0 = *tb_ptr++;
             taddr = tci_read_ulong(regs, &tb_ptr);
-            oi = tci_read_i(&tb_ptr);
+            oi = tci_read_i32(&tb_ptr);
             switch (get_memop(oi) & (MO_BSWAP | MO_SSIZE)) {
             case MO_UB:
                 tmp32 = qemu_ld_ub;
@@ -892,7 +892,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 t1 = *tb_ptr++;
             }
             taddr = tci_read_ulong(regs, &tb_ptr);
-            oi = tci_read_i(&tb_ptr);
+            oi = tci_read_i32(&tb_ptr);
             switch (get_memop(oi) & (MO_BSWAP | MO_SSIZE)) {
             case MO_UB:
                 tmp64 = qemu_ld_ub;
@@ -941,7 +941,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_qemu_st_i32:
             t0 = tci_read_rval(regs, &tb_ptr);
             taddr = tci_read_ulong(regs, &tb_ptr);
-            oi = tci_read_i(&tb_ptr);
+            oi = tci_read_i32(&tb_ptr);
             switch (get_memop(oi) & (MO_BSWAP | MO_SIZE)) {
             case MO_UB:
                 qemu_st_b(t0);
@@ -965,7 +965,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


