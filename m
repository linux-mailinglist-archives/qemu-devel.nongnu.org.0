Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AF93FB16C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:52:36 +0200 (CEST)
Received: from localhost ([::1]:46070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKb9n-0002Na-AJ
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajH-0004AL-Bk
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:11 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:43877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajF-0007a2-7A
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:11 -0400
Received: by mail-pl1-x62c.google.com with SMTP id n12so7917416plk.10
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eFn8VYNy5JB8QTntlTx/kL2yqILva3xhQJXfO7PIA4w=;
 b=QdcSUalCp+pPjQBR2Ds1qAW0050W+i5FIDh4uXGp4J7Wkq0yeNKJvgkJztWh6r9Zep
 8U9vYvMg7T1/CJ6J2inkVUM6fZY7XbnENg3va3i8dyfKgOb6PapLe8BHyop2ZBx4z1ft
 QdWW9UOw0eCKvlHfzrW+h5cWfaKqdVZhA3bKHE7MIntJRYyK2cOYYvWU8WZ02t2cVoOP
 RbMhvV5EA1GJyfg+HR+0yrClIcDGJKOKeUsENw1pBt/WZGk31kTrW/DxPpDop4o4mJkX
 clTNAmVn1cc+Ve1r8L8Je2t0kDkjeUZfjkzbbrGV28HulECpp1NsAfrH2xxyAhCWORvW
 LxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eFn8VYNy5JB8QTntlTx/kL2yqILva3xhQJXfO7PIA4w=;
 b=d8Br2UW9JZHSkiNFkpHpMRuMy4koG/xr2+S6ykHMGmD5Yogv2fpZH0Oknx/UGJeyZ/
 5CuaYlPTcBmyt/R8/f/bA/nYQM3GLlw9kQIKxc1bJEl96qK3mk6IFydUqHuMHNC/Wkg4
 hLbiRFvljTnNGwqth4TkWqc3s4oTAAxBKl/NCComWPfEnk5hzHSyE2ISPvLRE4ccukxh
 U59mmjfzoI0+OGSCSshOAtfTeHdr1jeji092nKTvJGDz9PSy64O8j7oi2UjZ3FgF9pUw
 6g2yaLXwNfFjl8gkNpLVOwFdsdFuOtb0oAmNyUC5nyB+mY15M3uSiHc+gU74YyaQi2VA
 RbNQ==
X-Gm-Message-State: AOAM530EIqgOx5BKd5p5lviJWo2eanqCPgePKr0CYKI1Z2EtsNPfSDhN
 iu6e2JCYlUMR7M0g/TlILPaYVBAXpo8itw==
X-Google-Smtp-Source: ABdhPJxP7zljKvJKyo/btbQZ9DAkif/cZU1HfwYY6q/Wtzd3Xea2UrwTqo8OJkIXdh54iKkBZNZf6Q==
X-Received: by 2002:a17:90b:691:: with SMTP id
 m17mr5498516pjz.217.1630304707887; 
 Sun, 29 Aug 2021 23:25:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/48] tcg/optimize: Split out fold_extract2
Date: Sun, 29 Aug 2021 23:24:26 -0700
Message-Id: <20210830062451.639572-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index d9592a039c..866b77dad8 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -885,6 +885,25 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_extract2(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
+        uint64_t v1 = arg_info(op->args[1])->val;
+        uint64_t v2 = arg_info(op->args[2])->val;
+        int shr = op->args[3];
+
+        if (op->opc == INDEX_op_extract2_i64) {
+            v1 >>= shr;
+            v2 <<= 64 - shr;
+        } else {
+            v1 = (uint32_t)v1 >> shr;
+            v2 = (int32_t)v2 << (32 - shr);
+        }
+        return tcg_opt_gen_movi(ctx, op, op->args[0], v1 | v2);
+    }
+    return false;
+}
+
 static bool fold_exts(OptContext *ctx, TCGOp *op)
 {
     return fold_const1(ctx, op);
@@ -1713,23 +1732,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(extract2):
-            if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
-                uint64_t v1 = arg_info(op->args[1])->val;
-                uint64_t v2 = arg_info(op->args[2])->val;
-                int shr = op->args[3];
-
-                if (opc == INDEX_op_extract2_i64) {
-                    tmp = (v1 >> shr) | (v2 << (64 - shr));
-                } else {
-                    tmp = (int32_t)(((uint32_t)v1 >> shr) |
-                                    ((uint32_t)v2 << (32 - shr)));
-                }
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1764,6 +1766,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(eqv):
             done = fold_eqv(&ctx, op);
             break;
+        CASE_OP_32_64(extract2):
+            done = fold_extract2(&ctx, op);
+            break;
         CASE_OP_32_64(ext8s):
         CASE_OP_32_64(ext16s):
         case INDEX_op_ext32s_i64:
-- 
2.25.1


