Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10930312920
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:59:41 +0100 (CET)
Received: from localhost ([::1]:55386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wm4-0000cs-1Y
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRn-0001eB-Co
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:43 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:44120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRf-0005sT-GD
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:43 -0500
Received: by mail-pf1-x432.google.com with SMTP id t29so8739554pfg.11
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fkXespGLacfat/Oc2ATzIf/ZqfIgEJ0vqqLFj00td/k=;
 b=jnyhXBjL7SsXxqCxxTeOCUnsXsj16nxluFPCHJSXeUgsY/WJtGr4ApvW3fvlPEU+cq
 2S9eW1LoqCjxZ4XoOmWO1K3K5wacSCo4MgAC8ASbakEliKwag5oZfP952Hgmyu9ya0/i
 /wjdlvICzUoqVd3AIO+lKNYnPAZMG84e9xlzL2jwUdeB6dCD1ta1eAps7vZfuOohKokX
 VAhCOY+OpX+AJap8EoCxxwnCJetvN/RH33wPDorodyPL5Grw9qdzd8v2HeegZ0ANurmD
 F54wrNg6QfWwpJxBdCp+O8jSogB+iU8tBuqOVJlJhkN17Zs4mC9mr2vbXBhYSqwYMfii
 rQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fkXespGLacfat/Oc2ATzIf/ZqfIgEJ0vqqLFj00td/k=;
 b=Rwaq4A2OoIpAjtSs3wKb5PHZB8wd52Btx0M3tT7rEXFMB7EswWgrReAAxTLSytfQ/8
 /d1TeqD9kMnGxpU/26hAZ5aRCAzZYpt3wFXyffJl5loiHr0fEbZl+w5+HwqQb6bsrMlJ
 udUsPJdLobOXZNFiv1Bclex5mbAvVpmShOpHlL5d0fH0IE/Kdk7M6tyg4QQemOXKwZ+/
 OGDOwL3dPA8F/ddt6U+eaPbLmhG/+dzLtvjIUvJKT/4B6wlgmnEwmkoxZ+ljZw28s3Ul
 q0VL0NJPQvPA9X+KUFqO6a/eMhYn7j2x99+oR1my2XDoCk9d9NprRyFqH6Nl2QQ1Mh5O
 i2tA==
X-Gm-Message-State: AOAM531DiGVTmgaKEb+YueAQrSjFq6Ml9ZuUCGG8AlGEnHZ9pgWrlITP
 amXrKqDeObFku1uolR/ANPun+ms3ScuofQ==
X-Google-Smtp-Source: ABdhPJzkhFPa1foaPe5kX+LuiNp6DlBPo5w2LTXxB9Qss6mW6qoS5yL1gEQHPDUMbY8NNmBJ1usSbg==
X-Received: by 2002:a62:76d3:0:b029:1d9:8e88:9276 with SMTP id
 r202-20020a6276d30000b02901d98e889276mr10334499pfc.71.1612751913704; 
 Sun, 07 Feb 2021 18:38:33 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 32/70] tcg/tci: Reduce qemu_ld/st TCGMemOpIdx operand to
 32-bits
Date: Sun,  7 Feb 2021 18:37:14 -0800
Message-Id: <20210208023752.270606-33-richard.henderson@linaro.org>
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


