Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD7843D9A9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:07:52 +0200 (CEST)
Received: from localhost ([::1]:45738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvlf-0002tB-Dp
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMf-0004sr-UL
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:42:03 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:35331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMb-0003k6-4t
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:42:01 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 n11-20020a17090a2bcb00b001a1e7a0a6a6so6806787pje.0
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3jpxULOVdIgL0Mnirkv2EuUv8fHOKVVpG1kUJouTiHI=;
 b=GlvuVap9y9oMWV+Wvfo59OlElogk3Iihe5zdtzUO5u59nn9WpZmCJQjdNlQOgiVWAe
 p/BENFFp5hpfh3MPD1/7SArt6Zgw6ohbgt2zsnfmx0TnADm+0/BFZ+hSDagP3Z6og/c4
 NQT1pLvTgVD7DP2sgmd4Jpb9sRaEnM0niBYlotQF4C9nZ9moebxq/Qb+yBg7is06Vx2B
 miS51X8zeGvAroT72yX/BphEQPWHD/9uOUEPp1guTR3tGPHsPOuXb2V/HFC0dqj2nhTd
 tpZePiN5blfoJB5MVbUOGyb2Ztbxm8EME3DdWQTg+dk4pSVSs9t7Ez5XcsICK1kjOY8S
 aKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3jpxULOVdIgL0Mnirkv2EuUv8fHOKVVpG1kUJouTiHI=;
 b=YdWv0FdziYl4EdEcA9HooAN+d2HXPylSbzzq+Lo1xI3uif86JibNJKBRgi10y7gowc
 u60rI62LFQ7aAB94mOShvBuauPs2egJFEELNdWfOag97EZj5aIcxrmvxrrQV/F99sToN
 I5B3Cr8VIsTu/nz8uVCLLMRW3MspLGtPKuEoUT084Dp6ezLJ2XplawjZbYpcegjK3CiU
 C2oSDEQN8Rhg8/tkQ7NmHQfxL9lA6U0AT/5LBxYyA7VQjUH7MtH3MGFdJfW7HRgToCvy
 OcOUxWCdW0eC660OdRoY4EaJL+ZeC6NcdiW3ZdWeKzgwnuUqneMqfTkkYnPh3js1bz4F
 nvyA==
X-Gm-Message-State: AOAM533p4/Y9m4M5Evm2ohRW7dc3ADFg/hys8ipQCqFZnmFypPLbyRzS
 2JMEmH3E13lJ5Md8jRaW000H1d8y8nwJNw==
X-Google-Smtp-Source: ABdhPJwCwJpOnGe0WTEVIOiP2/ukG5HdqjSWXorWUSbmlmgLQl0bxffTJTRHLlku9WdLkEha/sIk1Q==
X-Received: by 2002:a17:90b:1e05:: with SMTP id
 pg5mr1594209pjb.173.1635388915060; 
 Wed, 27 Oct 2021 19:41:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/56] tcg/optimize: Split out fold_mov
Date: Wed, 27 Oct 2021 19:41:09 -0700
Message-Id: <20211028024131.1492790-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the final entry in the main switch that was in a
different form.  After this, we have the option to convert
the switch into a function dispatch table.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 8524fe1f8a..5f1bd7cd78 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1015,6 +1015,11 @@ static bool fold_mb(OptContext *ctx, TCGOp *op)
     return true;
 }
 
+static bool fold_mov(OptContext *ctx, TCGOp *op)
+{
+    return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[1]);
+}
+
 static bool fold_movcond(OptContext *ctx, TCGOp *op)
 {
     TCGOpcode opc = op->opc;
@@ -1748,20 +1753,11 @@ void tcg_optimize(TCGContext *s)
             break;
         }
 
-        /* Propagate constants through copy operations and do constant
-           folding.  Constants will be substituted to arguments by register
-           allocator where needed and possible.  Also detect copies. */
+        /*
+         * Process each opcode.
+         * Sorted alphabetically by opcode as much as possible.
+         */
         switch (opc) {
-        CASE_OP_32_64_VEC(mov):
-            done = tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
-            break;
-
-        default:
-            break;
-
-        /* ---------------------------------------------------------- */
-        /* Sorted alphabetically by opcode as much as possible. */
-
         CASE_OP_32_64_VEC(add):
             done = fold_add(&ctx, op);
             break;
@@ -1831,6 +1827,9 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_mb:
             done = fold_mb(&ctx, op);
             break;
+        CASE_OP_32_64_VEC(mov):
+            done = fold_mov(&ctx, op);
+            break;
         CASE_OP_32_64(movcond):
             done = fold_movcond(&ctx, op);
             break;
@@ -1900,6 +1899,8 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(xor):
             done = fold_xor(&ctx, op);
             break;
+        default:
+            break;
         }
 
         if (!done) {
-- 
2.25.1


