Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33783FB183
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:59:56 +0200 (CEST)
Received: from localhost ([::1]:38424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbGt-0007na-Ps
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajQ-0004Sg-9P
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:22 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:51784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajO-0007i5-37
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:20 -0400
Received: by mail-pj1-x1035.google.com with SMTP id oa17so8765058pjb.1
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JMN+jgjbqzyFfx1kKgY9/hqg7NPVZxlqOppkdWbMcfE=;
 b=T0LZ7+Eol6eEgWRp3enpHKJp/eoPHEy9TjGiG5H+DnAFeR50i+zHVMstQu2quUeylw
 mgreptkcQHXZueqGSNF2eMKzBj3BljwZCpNIXZydtkazfUpXWI/THyY47/ErnzjfsVIx
 /eK3lNDLYVeUg8mhjXLvRRTmkOKd+KvD4+cP5a0GOd0qTGQUUVLG7ee2bDjbWVTNWGmr
 3xfMBIkQsOcRsw1TNsui0Ems1P6rRpaV+xJMBVoEh6y2rW/FTzPYb1BIap29Yehqx2T3
 nZvcEFkNPDvz8flJXb7LjzWlWG81Y9nLBNPT/L4gcc56PKW2sp/bDmoyorRQ1e0ZhDD3
 bl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JMN+jgjbqzyFfx1kKgY9/hqg7NPVZxlqOppkdWbMcfE=;
 b=BJyZXK4p6V34MXwU+eZj3q6zzhqdADJBnqOVrIWJMw9JQ2cLywdYTBt/FvQ+6FRrQ0
 CZi2GLOckhKETDGQH+/fr6SODyl3LYla0WOH9DUYKiMn27JOGn4EhgB7YSIRsMc5MPvS
 uIZULyRjmGAsShM2VIGyBgjLmq7bTgdFqaK1/6AXoWGQxc97TEKq++PgEbgbH6ThML84
 iUZuhSaH3Xr4I78SXV9PrF0uPnGCAwWXn0S+8mvHU3OiMlrkZFLSp8MoBZ/d1cy0DHJl
 T+SaCHkI1zXqAK5aJRuJmuuDvXWArsp0MknouSQnIP5Fz3F+D/DSHeUVoJDs0y2giIoa
 iZyQ==
X-Gm-Message-State: AOAM532My2mv4+XJmIyyKfCofaJOQQ4qRWWRVwlgMjRhDllRr1Gu6ajj
 sYW3g4yxAeb+f/jTbHCYUx0ZaXJ2qjGbEg==
X-Google-Smtp-Source: ABdhPJxxwK5q1dUoCFJzBjmM856FjFIMJiu4xf5fEz+aW1V0yAqj2LFmu5ObQEHntGbFORViHxKFCw==
X-Received: by 2002:a17:90a:44:: with SMTP id 4mr24609943pjb.130.1630304716712; 
 Sun, 29 Aug 2021 23:25:16 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 37/48] tcg/optimize: Split out fold_ix_to_i
Date: Sun, 29 Aug 2021 23:24:40 -0700
Message-Id: <20210830062451.639572-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull the "op r, 0, b => movi r, 0" optimization into a function,
and use it in fold_shift.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 3b0be1c4e1..69367ddc8d 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -731,6 +731,15 @@ static bool fold_to_not(OptContext *ctx, TCGOp *op, int idx)
     return false;
 }
 
+/* If the binary operation has first argument @i, fold to @i. */
+static bool fold_ix_to_i(OptContext *ctx, TCGOp *op, uint64_t i)
+{
+    if (arg_is_const(op->args[1]) && arg_info(op->args[1])->val == i) {
+        return tcg_opt_gen_movi(ctx, op, op->args[0], i);
+    }
+    return false;
+}
+
 /* If the binary operation has first argument @i, fold to NOT. */
 static bool fold_ix_to_not(OptContext *ctx, TCGOp *op, uint64_t i)
 {
@@ -1358,6 +1367,7 @@ static bool fold_sextract(OptContext *ctx, TCGOp *op)
 static bool fold_shift(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_ix_to_i(ctx, op, 0) ||
         fold_xi_to_x(ctx, op, 0)) {
         return true;
     }
@@ -1526,24 +1536,6 @@ void tcg_optimize(TCGContext *s)
             break;
         }
 
-        /* Simplify expressions for "shift/rot r, 0, a => movi r, 0",
-           and "sub r, 0, a => neg r, a" case.  */
-        switch (opc) {
-        CASE_OP_32_64(shl):
-        CASE_OP_32_64(shr):
-        CASE_OP_32_64(sar):
-        CASE_OP_32_64(rotl):
-        CASE_OP_32_64(rotr):
-            if (arg_is_const(op->args[1])
-                && arg_info(op->args[1])->val == 0) {
-                tcg_opt_gen_movi(&ctx, op, op->args[0], 0);
-                continue;
-            }
-            break;
-        default:
-            break;
-        }
-
         /* Simplify using known-zero bits. Currently only ops with a single
            output argument is supported. */
         z_mask = -1;
-- 
2.25.1


