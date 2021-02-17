Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D413331E0F5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:02:35 +0100 (CET)
Received: from localhost ([::1]:56906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTxy-00055c-4C
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLh-0008Il-5D
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:01 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:38267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLf-0007Np-LP
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:00 -0500
Received: by mail-pf1-x432.google.com with SMTP id y25so5879415pfp.5
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NtYy7CVHSUTsrLhd0g6enXEgT6j0TcJMSjVB1gNIEaI=;
 b=gR7aFSjHpQmAgj2FZQrKghYvA5B5AYdngNW8sro1XAHNpuTqSGxQ5AxWlGBAm16ctT
 6nT8h4xD9xiPSls1nTqbOkqn4gSUNYZdxubgj+MPzOVJY35yTzq3UtZ3RkUOIQdUuDeO
 c+KkMwxmxgWYJkO1m91lkcnH1urflFdlqW7ymsTR8LSvs3R8LSf93t8wCBxoNKKGDsD5
 Qr/1D1MgP8oXI7zx41cvHOhRQJT2KppnJ+XFazZ3iZYdM33gjEnf07Cygeou5Rxo1xBu
 Qe3gCHXnhZtEbnbHtmzx4kOja8xrty/Qn6NdyBlx4wtDA4+8PGBglQfsTM9ebX6n/4jT
 BOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NtYy7CVHSUTsrLhd0g6enXEgT6j0TcJMSjVB1gNIEaI=;
 b=F1FAVvtY1UkDnvN6UQV2hI/0UBhUrQJxagQXe8IhhSmsHCV/paAkkBWir95mYA6G9h
 to/scQWd7cByEXH3rTJVIdA0f7JS5qowX3VPVm524bnxaWwL6QmZgt5Xy64F7YKV8Eq8
 kQ0U5iPtW36XEu3LdUFXMt49XOQxTTRruAgtZiZ4xHp373hO0dpoAX0QYJ6067bFnvzY
 pdiKqRu9/yi/rgIbpgcNdHDp4VDHPk9qnHlE44+j0j5LDkS4uoYnTmivhNGT7dSTmRK5
 qhLleBWoQ1v/WYAuTFwCZbdOhv3Cz+LP5MJUmeB7iHLlqZ9ucXXotysZ/XeL7vIIfq6t
 +JNg==
X-Gm-Message-State: AOAM530mUUTyd3sNUiIq/VIPAxFmRcw7lVmO8J79j5FY40UpFHi0ov3Z
 XdDnCMNP8nV1L1O8HwrVE4wHZ9EcKpF1Sw==
X-Google-Smtp-Source: ABdhPJzPDW2xUOsMYYBhKicHL3+O5O3ghnX2St8GAj8SovGAbhJ3yEYupsTUscgX+crAGWGGCrhL/g==
X-Received: by 2002:a05:6a00:16c7:b029:1b6:68a6:985a with SMTP id
 l7-20020a056a0016c7b02901b668a6985amr967103pfc.44.1613593378447; 
 Wed, 17 Feb 2021 12:22:58 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 32/71] tcg/tci: Reduce qemu_ld/st TCGMemOpIdx operand to
 32-bits
Date: Wed, 17 Feb 2021 12:19:57 -0800
Message-Id: <20210217202036.1724901-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
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


