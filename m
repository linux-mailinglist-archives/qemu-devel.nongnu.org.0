Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F443FB166
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:50:58 +0200 (CEST)
Received: from localhost ([::1]:41006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKb83-0007NK-5V
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajI-0004Do-BB
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:12 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:43977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajF-0007aX-QP
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:12 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 d3-20020a17090ae28300b0019629c96f25so6355310pjz.2
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=f2QT45/ZsA0r+h9boohgTz+Sf/VySauzdb86Sejv5n4=;
 b=Pu85NODNSjqxzJfVKxTTecrRR89YSEtFBFOA9fPLsFWxPFkMcs2FqBYbbSE2yA2wj1
 GoD/s8E3idiA7HOATicmlkIKY9x7vueYEgBvoVepVlm6Bc/matZMq6zZo/HzDwHA9IEX
 E7RDWsyzFS0sDXAWfQTN5Z3KBUw8wa8YNdPp1jXQyhZwHi6oqNX1CIEnUo1OzGu8yjD3
 tDYK8mV16yi8zv2Eb/FNtRPz8MDssWxNPQxBGk33diBqncBow+p2sATRv8EMGuEmXS84
 K0LvQMH+G5dp1I55xkYtEVLJ2QoXVI8D3XK2+vpkFZcJ4cMqCTU/rl37mEMS57l9zqwz
 HW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f2QT45/ZsA0r+h9boohgTz+Sf/VySauzdb86Sejv5n4=;
 b=J3rYMUAKLhZKPenDIboAfNSkfIpASLrSE/C9oSLjl+LeSdDiwJQsNw4qGkV8hzvMNI
 kv8+XLnIfIDX92N0eNJrtqv+5AGJYLLmWWGgVsLATyUI87IFKYek7/IxWQL9BUAHgIJ6
 517E06OKaq9q+iSebvikBDnyDfzb1j3zWL/C6p04wl1zNqEBQKA7/+NU2AvooWrZvGZd
 NhFJUj9YhNE9vGAj+1qganlu9L/LHYiNJfwUoWqjRnZQ+N4WDUO012HlJx4N37xxyfeS
 7Z8Ei4NQxcIqjps7TjhwhjV5IGf+xmdBC45WOoHO3WTQ1x+nRMB1okzOoOmpeibDIwMx
 iRvA==
X-Gm-Message-State: AOAM532L1OjJrPB+eq/FRco/xlJHMCdQ0GlZcxyqBM6V67kPaUtKttkT
 PKBPIqgOjiE4Vg/13GghQeAvGVmG0Q6UWg==
X-Google-Smtp-Source: ABdhPJxcVcRxihNQd+qQ7UVWOQu+0DZqMcsEfp5c/CL2d5A/Rhw29Xl723Nk60Yv5WzKjx4JKh0TmQ==
X-Received: by 2002:a17:90a:6b4b:: with SMTP id
 x11mr25290498pjl.157.1630304708537; 
 Sun, 29 Aug 2021 23:25:08 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/48] tcg/optimize: Split out fold_extract, fold_sextract
Date: Sun, 29 Aug 2021 23:24:27 -0700
Message-Id: <20210830062451.639572-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 48 ++++++++++++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 18 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 866b77dad8..c3c66a949e 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -885,6 +885,18 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_extract(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t;
+
+        t = arg_info(op->args[1])->val;
+        t = extract64(t, op->args[2], op->args[3]);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+    return false;
+}
+
 static bool fold_extract2(OptContext *ctx, TCGOp *op)
 {
     if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
@@ -1113,6 +1125,18 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *op)
     return tcg_opt_gen_movi(ctx, op, op->args[0], i);
 }
 
+static bool fold_sextract(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t;
+
+        t = arg_info(op->args[1])->val;
+        t = sextract64(t, op->args[2], op->args[3]);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+    return false;
+}
+
 static bool fold_shift(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1714,24 +1738,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(extract):
-            if (arg_is_const(op->args[1])) {
-                tmp = extract64(arg_info(op->args[1])->val,
-                                op->args[2], op->args[3]);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
-        CASE_OP_32_64(sextract):
-            if (arg_is_const(op->args[1])) {
-                tmp = sextract64(arg_info(op->args[1])->val,
-                                 op->args[2], op->args[3]);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1766,6 +1772,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(eqv):
             done = fold_eqv(&ctx, op);
             break;
+        CASE_OP_32_64(extract):
+            done = fold_extract(&ctx, op);
+            break;
         CASE_OP_32_64(extract2):
             done = fold_extract2(&ctx, op);
             break;
@@ -1841,6 +1850,9 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_setcond2_i32:
             done = fold_setcond2(&ctx, op);
             break;
+        CASE_OP_32_64(sextract):
+            done = fold_sextract(&ctx, op);
+            break;
         CASE_OP_32_64_VEC(sub):
             done = fold_sub(&ctx, op);
             break;
-- 
2.25.1


