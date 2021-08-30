Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 084963FB167
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:52:06 +0200 (CEST)
Received: from localhost ([::1]:44628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKb9J-0001RW-1m
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKamQ-0003Dh-0E
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:28:27 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKamN-0001pU-RJ
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:28:25 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so6122987pjc.3
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EU5QVxDJXidEi6LSQvrHayoUBWhjiHDNI1Ev0O1Ed3c=;
 b=a9UaUErIfpGlafHnOweUAAASzX4I4KY1EKsEY+exZoustWWC5AbFYtCF8riBk8yRtf
 RaWrYDo3+I48pffNfREIHJh46JH98JtEaMOxv95905CSXVkUGt5RGyUat/Bx46BK2XdJ
 FGKpyLvV51iqiMzOkS4M68cfOCry0MB1UAlfjYt+Mpz82IHqDe9wt7UNEp41uUQJZyVy
 zBNJ1CY660vOl1xlCY9soqbwMYHYtyn5ZOou17VXT10XYP0639c00Qh+hbX1FjfR0xYV
 8l/nG1sjrWtKylu0KkXtWy3Ig5/2ZVnjjyvr43MTs1KK72Ephr5av5PzQO3YtRmKykAx
 jBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EU5QVxDJXidEi6LSQvrHayoUBWhjiHDNI1Ev0O1Ed3c=;
 b=M3oavTDUhGJvaE4sABHSFju6XqH49kckJ7ZU90nHyqHkyc1zRpgjNbrBgKe8B8leyA
 YLYamCzuJBjQwy3iQMOkG3pW+y74/Hgq6pATIdyjeTQBRHI37RrbZeeaFA/0LKX+3vvb
 rkt/8AU1QFVmhxiYCP/NLpKVwIz+krGuNoj/6QC50eZuOCwwtmDEbXdFl//JBu8qtZoU
 7+Pn2yFBu71s324aXCzexV4SvXq3RN8bwmX1kMoqZUv60PKXtcxiQkZ6e9l3LBE1HG91
 2zJbrn+eW0TBCGkCP5gay6+qjjMFKleej58hJ1VakootyWTsB2iC+NynT/ygGF5uYLu7
 gHDQ==
X-Gm-Message-State: AOAM531U17nTDbVBqXJB7yZAhVadIPdh5E+8TFCkXQQ5opvf4X/TgfWP
 LdRPAYCcwBox8mS4CqFmHLFTpVpTJLPxeQ==
X-Google-Smtp-Source: ABdhPJzGZMIOsepc9FQeqwskxgss5rJvRMxaAZqVg2bPC7RNU+5SArd+Hk0VHLh6tvJatMppHt7OqA==
X-Received: by 2002:a17:90a:4306:: with SMTP id
 q6mr36895113pjg.202.1630304901960; 
 Sun, 29 Aug 2021 23:28:21 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id o6sm13337072pjk.4.2021.08.29.23.28.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:28:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 45/48] tcg/optimize: Propagate sign info for logical operations
Date: Sun, 29 Aug 2021 23:24:48 -0700
Message-Id: <20210830062451.639572-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Sign repetitions are perforce all identical, whether they are 1 or 0.
Bitwise operations preserve the relative quantity of the repetitions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 9a752fbe29..cbb5700f44 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -952,6 +952,13 @@ static bool fold_and(OptContext *ctx, TCGOp *op)
     z2 = arg_info(op->args[2])->z_mask;
     ctx->z_mask = z1 & z2;
 
+    /*
+     * Sign repetitions are perforce all identical, whether they are 1 or 0.
+     * Bitwise operations preserve the relative quantity of the repetitions.
+     */
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
+
     /*
      * Known-zeros does not imply known-ones.  Therefore unless
      * arg2 is constant, we can't infer affected bits from it.
@@ -987,6 +994,8 @@ static bool fold_andc(OptContext *ctx, TCGOp *op)
     }
     ctx->z_mask = z1;
 
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return fold_masks(ctx, op);
 }
 
@@ -1278,6 +1287,9 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
+
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return false;
 }
 
@@ -1466,6 +1478,8 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
 
     ctx->z_mask = arg_info(op->args[3])->z_mask
                 | arg_info(op->args[4])->z_mask;
+    ctx->s_mask = arg_info(op->args[3])->s_mask
+                & arg_info(op->args[4])->s_mask;
 
     if (arg_is_const(op->args[3]) && arg_is_const(op->args[4])) {
         uint64_t tv = arg_info(op->args[3])->val;
@@ -1545,6 +1559,9 @@ static bool fold_nand(OptContext *ctx, TCGOp *op)
         fold_xi_to_not(ctx, op, -1)) {
         return true;
     }
+
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return false;
 }
 
@@ -1574,6 +1591,9 @@ static bool fold_nor(OptContext *ctx, TCGOp *op)
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
+
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return false;
 }
 
@@ -1583,6 +1603,8 @@ static bool fold_not(OptContext *ctx, TCGOp *op)
         return true;
     }
 
+    ctx->s_mask = arg_info(op->args[1])->s_mask;
+
     /* Because of fold_to_not, we want to always return true, via finish. */
     finish_folding(ctx, op);
     return true;
@@ -1598,6 +1620,8 @@ static bool fold_or(OptContext *ctx, TCGOp *op)
 
     ctx->z_mask = arg_info(op->args[1])->z_mask
                 | arg_info(op->args[2])->z_mask;
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return fold_masks(ctx, op);
 }
 
@@ -1609,6 +1633,9 @@ static bool fold_orc(OptContext *ctx, TCGOp *op)
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
+
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return false;
 }
 
@@ -1873,6 +1900,8 @@ static bool fold_xor(OptContext *ctx, TCGOp *op)
 
     ctx->z_mask = arg_info(op->args[1])->z_mask
                 | arg_info(op->args[2])->z_mask;
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return fold_masks(ctx, op);
 }
 
-- 
2.25.1


