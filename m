Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 150EC436CBF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:34:20 +0200 (CEST)
Received: from localhost ([::1]:60388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfhb-00064s-3d
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:34:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGJ-0007eI-R0
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:09 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:46019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGF-0004TX-Mh
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:07 -0400
Received: by mail-pl1-x62b.google.com with SMTP id s1so1262642plg.12
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5OACwzIys5FSfqLiabf12PLbwCKC1OcUot8fvYXFvzw=;
 b=Af6vtGcu8BkQW8Vjw4XX3q0Lv8BmqmRa9T1WbJxVEBKefMyk9M8VJfAGzVUXJOU/id
 qoCEjMecYb/sTWiPB6TjIQlUpZ7x+P4fSKtWtSLylf2Nhd2Qb5ozfvsvMpiQzFsj57sP
 A72t8TEFoLlvMP2pLe76AFIfa8Xy8jaGOnM4bwXJ6jsKRCQvGQV2E9VWx/241C0/PT0R
 xuR2Ym8ZGAaQKWj7VygVOZTRAQmZb1BOip4ytd0KwLEp8c3b1TWERMccaVMMaIqwO6Yr
 ty/plZ8MIDhc5ORSZDsqqrhQuehunCmXUHTgRPAm64peCOhQOcRbzYUwJoFjcpHohyf/
 ix2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5OACwzIys5FSfqLiabf12PLbwCKC1OcUot8fvYXFvzw=;
 b=N9O4Y3UNLtMPSVgOr8hXBz5WBMajbtji6iLb548ILuZPOB+zPwr+j+xvHcdHzT5cj0
 F0dH+flk+r/zYdM2QGxofYCechHGAkoAGCW3K8oCuNl/BjsAT0Blk+D6e+1/HdWgP+YN
 sZ1ojQVoxo+B949+M7Vo6dQqbZXI3KA2aKJLlvdu0ivkHr9sLSyyjEzVwSxi/5PiVUaP
 hd4NXXGLqLUhb7micn4r7cs57aRfpv4tb7jkoi7NnIHbKsjdr2aJY8SFhyQ4sLHWEXls
 nt6m1Gtirj1byv5Y6+sXN07YAnK5at6bWeqJrpqtA9nQMeYeV/SQUbADyL1YgwcF+Lgi
 vteg==
X-Gm-Message-State: AOAM530xAMWqOdBhVjts8GalDIQmELRPtSHcXkYA6etKI+YP79jI9mf6
 6+1MmE3NWmvrWNnJzc3RbwfTXRC2lG5lDQ==
X-Google-Smtp-Source: ABdhPJyrZOIQ7MuNdD8BGtyvs/DwwC4QCc0WMAECSUzUxO13qggZMWiwlsU7Y8E3b6YmIskTfhU1rA==
X-Received: by 2002:a17:902:d501:b0:13f:f3c0:20a1 with SMTP id
 b1-20020a170902d50100b0013ff3c020a1mr6644163plg.39.1634850361916; 
 Thu, 21 Oct 2021 14:06:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:06:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 29/48] tcg/optimize: Split out fold_mov
Date: Thu, 21 Oct 2021 14:05:20 -0700
Message-Id: <20211021210539.825582-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the final entry in the main switch that was in a
different form.  After this, we have the option to convert
the switch into a function dispatch table.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 2d626c604a..af055f05d3 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1010,6 +1010,11 @@ static bool fold_mb(OptContext *ctx, TCGOp *op)
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
@@ -1733,20 +1738,11 @@ void tcg_optimize(TCGContext *s)
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
@@ -1816,6 +1812,9 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_mb:
             done = fold_mb(&ctx, op);
             break;
+        CASE_OP_32_64_VEC(mov):
+            done = fold_mov(&ctx, op);
+            break;
         CASE_OP_32_64(movcond):
             done = fold_movcond(&ctx, op);
             break;
@@ -1883,6 +1882,8 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(xor):
             done = fold_xor(&ctx, op);
             break;
+        default:
+            break;
         }
 
         if (!done) {
-- 
2.25.1


