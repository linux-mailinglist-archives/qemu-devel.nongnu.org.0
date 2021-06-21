Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8850C3AF948
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:26:25 +0200 (CEST)
Received: from localhost ([::1]:51210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTJA-0008Vx-Hk
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC4-0000qH-Tu
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:04 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC2-0005zG-KZ
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:04 -0400
Received: by mail-pj1-x102c.google.com with SMTP id h16so10886229pjv.2
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7EQJoFBdjdiE+zNRxauFeYkPJcHdyjHqE5CsIUBDDL8=;
 b=F3h0AtidcwQ89LR63MGIkvMPkhobY4HWIHC065KMqq6YAVUZnXQc7seWCuUZZTIhBJ
 CwdTIjq2jE6bR0QonKxkNO4LdPgK5iMEm7ntt9neQLiwuSV/hW+8OGrutBWY1duuzJFa
 eSsdmKWQy9cVTDiLc76Twjh5Jib2LEJ1s8MQvbtcNFx1HjxgKL0gVx4rdU658OiY+2Rm
 GACsUh7QF8IIFEpyepf8bXhiGT1KUQcdQgEh8xRQ5qnL/MlrvdvKDVBG4zCJehoHxORk
 dgrbNolMwO32RPgUnZooEEj5w4oJn5LTzIYEXsJ9LJEB+MKOEG48fPJm+7kkJ9GZ1U5t
 DUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7EQJoFBdjdiE+zNRxauFeYkPJcHdyjHqE5CsIUBDDL8=;
 b=OzsiYAba/a1MmEmIBU+fjJFc8jcdnqWPUSrnOoX93s71lcRO1/kRcVIf14//s1DBQS
 TuX2cY2ankxIWAuU/yBfpkZvaqgEcb+3umSOlAouj7WvPrI6cjL/5u+9ahq5KBJ1BSvQ
 hDPn0Lxj31qakooGJpUx84IgoUsEY8+qL9VUjYR9q7bVUe5BrCFg3S0VA/5FNs5ge6DL
 CcgMrEGO5EUvVXC7ot0Divv/MbR5P/NeFKpbZyoPUbAo3l6khxyOeTmtb5dz7UX/7GLt
 FiiV3JG/pB0Hglnk+o7cS7hc8XCnjmhgiYe+4Y9fsVKTJzyBp7gSVSY78sHn1JMr1s2S
 /mWg==
X-Gm-Message-State: AOAM531YwNVx5ycACsszkfPV12Rb2LAEIdkA46qqgx++pKmLoLkiSx4v
 f17mGOdabJN1+63t6n8ZUVsZE3uiIVTCRw==
X-Google-Smtp-Source: ABdhPJyYdnU3G8Qlc6YQY+Bd3iPzdC96NlJ8wHGewHAdKGtjo8YiR5uAgMXyAAx2Olutni99AzJ3dQ==
X-Received: by 2002:a17:90a:5401:: with SMTP id z1mr471491pjh.7.1624317541220; 
 Mon, 21 Jun 2021 16:19:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:19:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/29] tcg/tci: Support bswap flags
Date: Mon, 21 Jun 2021 16:18:36 -0700
Message-Id: <20210621231849.1871164-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
index d68c5a4e55..109522a865 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -733,7 +733,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             regs[r0] = (int8_t)regs[r1];
             break;
 #endif
-#if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
+#if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64 || \
+    TCG_TARGET_HAS_bswap16_i32 || TCG_TARGET_HAS_bswap16_i64
         CASE_32_64(ext16s)
             tci_args_rr(&tb_ptr, &r0, &r1);
             regs[r0] = (int16_t)regs[r1];
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 823ecd5d35..1e92688dca 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -617,6 +617,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
 {
+    TCGOpcode exts;
+
     switch (opc) {
     case INDEX_op_exit_tb:
         tcg_out_op_p(s, opc, (void *)args[0]);
@@ -710,12 +712,27 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     CASE_64(ext32u)      /* Optional (TCG_TARGET_HAS_ext32u_i64). */
     CASE_64(ext_i32)
     CASE_64(extu_i32)
-    CASE_32_64(bswap16)  /* Optional (TCG_TARGET_HAS_bswap16_*). */
-    CASE_32_64(bswap32)  /* Optional (TCG_TARGET_HAS_bswap32_*). */
-    CASE_64(bswap64)     /* Optional (TCG_TARGET_HAS_bswap64_i64). */
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
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
-- 
2.25.1


