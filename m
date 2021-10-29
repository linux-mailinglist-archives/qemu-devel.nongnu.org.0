Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BD443F672
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:07:04 +0200 (CEST)
Received: from localhost ([::1]:57820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgK6Y-0002XR-7C
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJac-0004iy-Ja
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:34:02 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:41514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaa-0007zw-7P
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:34:02 -0400
Received: by mail-pg1-x535.google.com with SMTP id 83so8682625pgc.8
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3jpxULOVdIgL0Mnirkv2EuUv8fHOKVVpG1kUJouTiHI=;
 b=bZ8EvD0KB+36o5y0LdRjf8FBWFI+nvG8zBur/8BOe3+1r5VjcqDceOf4PX1cUjrFG0
 NLJ6mraMHo5gonRbrQ7rwsfTKrJoYBx+ZDmNJhM+pc90tMmbuALDoGMEIN1qIoTzPY33
 BJKOzhdHJ+OL6J3DU0B+8AXnr+x1CzSPEJsjWABF5I23kvrJv/Vcd3t8mfA7VT9JS+Qw
 iTLZlbdTreRIWt5d3rF4NTfvgaCEBbgeFmL/008kWLreG68FFH1W+rHZOQUj/LT8JeVD
 UWbenX5y7iC1nzZcX4gn/W7z9ntVgGdb27BmiG2FZ60P7DA7gAX0LVHFUkrUgVJk7zyM
 BDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3jpxULOVdIgL0Mnirkv2EuUv8fHOKVVpG1kUJouTiHI=;
 b=yYblZJdXMQZsz02funYZAWlaq0YI743nurUlW6T0jUJNPfxjLWkSA5lwk5PSzdzXJU
 72/5oKPukgdbp1tsL0CXy5UchHvewxIKsol3LvgqFBxLUyy/OMnaA0YfDRSV6cbmws6q
 EAO/3NLzWO4CmVSiffmRIpXxdeDClaXuB6vp0UPRUPwRYyxXMmo4J9rS9yVfc1OoLGQu
 w5ni6ZsQV+5R2F7pA48PLotCREktCmUarMrmze7eREOA6NgV1HYqERiKTfrkTXdcP/7q
 aLqXYRHlMHvP3Y8IlVU+CnCbZ3lo4/9xe2MyEzhzZ8U9zUrwT5ZlsnI1S5kpsL8e53xK
 noDQ==
X-Gm-Message-State: AOAM531K5VmWIX/uTYTl2n2C/3SVM1okkpcbKg95EbRMyXZC0643CLmz
 encjwW2bCHaRY/WnRwu2zJazfYNMYz1zrg==
X-Google-Smtp-Source: ABdhPJxLGoZ3/Z5TtBbZY4rGVyVEWILpdnKVmWUu/djXB/fWmC+tJIYanGNhL4PZxhdRQYvNbMZdgA==
X-Received: by 2002:a05:6a00:16d4:b0:44c:22c4:eb88 with SMTP id
 l20-20020a056a0016d400b0044c22c4eb88mr8647249pfc.75.1635482038968; 
 Thu, 28 Oct 2021 21:33:58 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 34/60] tcg/optimize: Split out fold_mov
Date: Thu, 28 Oct 2021 21:33:03 -0700
Message-Id: <20211029043329.1518029-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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


