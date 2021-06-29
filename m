Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43F33B78FD
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:58:48 +0200 (CEST)
Received: from localhost ([::1]:57288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJsd-0005DM-U2
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwb-00046l-2e
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:50 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:36394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwK-0002zy-Rl
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:48 -0400
Received: by mail-pf1-x42b.google.com with SMTP id 21so119958pfp.3
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/npoOom83BV+ZhnOrJwhtUPiftxFqKz5+wNoXW0RQ8w=;
 b=TXpjedbHiYbADufJtqaWRQFYzcCb4zI7ER2uNitrp38ZjK57k4FTr1q6Tqf1EB8xmc
 h2mNTf1fr0dYZp7aMx64qJ5/VAcFfP7n3KnqhGySyQtmywCr3umqlMxXfLmo7Lvq24v+
 yCsmRjKj8VuxjVVqFJfZvsydTyUiSg+vunMxPkyF8tehi9SABb70qbDVW6YINGxPmDcL
 REoaFvERZVs5/yypbSL/6VqHItgnyksOi+hxx0KvO/hxo1nxWwAQTizW0D8apj0cxD3W
 Va8FmcyrhEmjp+9s2wtU4mBY3wNuFwpcWsMZ8oCCQLdxc12yK2rLgHjGA75WDcDP7Cx8
 ebkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/npoOom83BV+ZhnOrJwhtUPiftxFqKz5+wNoXW0RQ8w=;
 b=BSTuWFYXyjLDZBCHeVUGtHmL1KJ4CJJ3yVu2tTxpHA6lb9s6uzo87uFtdKfMsjMSb5
 zLxkRtg9jIBsufICGW80bD7yzqXIweWoWCRE/SpI81MuV0wiSZyCWOI47ePWh1p7oQcW
 18PtAs1zRYHDWBZpywXqay19u6gLJpSy/qFiOuZp863tjIAsI66MMfFNWXov3KWhTEBC
 bbqomqropJYIogU3E8okSluIPCbMPv5Wm0MA2O9TdupcdckZsdPgUE0WX6KeezfDDRmH
 ozT1n3QCUmhB2xz7tJdAoGwGIXBxfLWYYf6j7CFqBko4XKnyWBaREdlG8oSzM+2gLkQj
 nceg==
X-Gm-Message-State: AOAM5332KWqlFotDsT2A/0IbLkzyLkHtMR0ikkQPLftbV5QZlcXOcThq
 jQ7wtRWufXIMmZR9+97iPhnu95GNqlnHuA==
X-Google-Smtp-Source: ABdhPJw4cV0WCRLHtUdXfgfFtxjmnWtwEnFtGdaKTnFv2OI/VSjtS7FGT4IxJfQPxQuvJlyHUKNv3w==
X-Received: by 2002:a65:4c4d:: with SMTP id l13mr29333603pgr.114.1624993110492; 
 Tue, 29 Jun 2021 11:58:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm18002849pfh.103.2021.06.29.11.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:58:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 50/63] tcg/tci: Support bswap flags
Date: Tue, 29 Jun 2021 11:54:42 -0700
Message-Id: <20210629185455.3131172-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The existing interpreter zero-extends, ignoring high bits.
Simply add a separate sign-extension opcode if required.
Ensure that the interpreter supports ext16s when bswap16 is enabled.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c                |  3 ++-
 tcg/tci/tcg-target.c.inc | 23 ++++++++++++++++++++---
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 71689d4a40..b672c7cae5 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -808,7 +808,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             regs[r0] = (int8_t)regs[r1];
             break;
 #endif
-#if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
+#if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64 || \
+    TCG_TARGET_HAS_bswap16_i32 || TCG_TARGET_HAS_bswap16_i64
         CASE_32_64(ext16s)
             tci_args_rr(insn, &r0, &r1);
             regs[r0] = (int16_t)regs[r1];
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 9651e7a8f1..0cb16aaa81 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -597,6 +597,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
 {
+    TCGOpcode exts;
+
     switch (opc) {
     case INDEX_op_exit_tb:
         tcg_out_op_p(s, opc, (void *)args[0]);
@@ -710,13 +712,28 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     CASE_64(ext32u)      /* Optional (TCG_TARGET_HAS_ext32u_i64). */
     CASE_64(ext_i32)
     CASE_64(extu_i32)
-    CASE_32_64(bswap16)  /* Optional (TCG_TARGET_HAS_bswap16_*). */
-    CASE_32_64(bswap32)  /* Optional (TCG_TARGET_HAS_bswap32_*). */
-    CASE_64(bswap64)     /* Optional (TCG_TARGET_HAS_bswap64_i64). */
     CASE_32_64(ctpop)    /* Optional (TCG_TARGET_HAS_ctpop_*). */
+    case INDEX_op_bswap32_i32: /* Optional (TCG_TARGET_HAS_bswap32_i32). */
+    case INDEX_op_bswap64_i64: /* Optional (TCG_TARGET_HAS_bswap64_i64). */
         tcg_out_op_rr(s, opc, args[0], args[1]);
         break;
 
+    case INDEX_op_bswap16_i32: /* Optional (TCG_TARGET_HAS_bswap16_i32). */
+        exts = INDEX_op_ext16s_i32;
+        goto do_bswap;
+    case INDEX_op_bswap16_i64: /* Optional (TCG_TARGET_HAS_bswap16_i64). */
+        exts = INDEX_op_ext16s_i64;
+        goto do_bswap;
+    case INDEX_op_bswap32_i64: /* Optional (TCG_TARGET_HAS_bswap32_i64). */
+        exts = INDEX_op_ext32s_i64;
+    do_bswap:
+        /* The base tci bswaps zero-extend, and ignore high bits. */
+        tcg_out_op_rr(s, opc, args[0], args[1]);
+        if (args[2] & TCG_BSWAP_OS) {
+            tcg_out_op_rr(s, exts, args[0], args[0]);
+        }
+        break;
+
     CASE_32_64(add2)
     CASE_32_64(sub2)
         tcg_out_op_rrrrrr(s, opc, args[0], args[1], args[2],
-- 
2.25.1


