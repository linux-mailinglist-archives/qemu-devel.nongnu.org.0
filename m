Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CBD3FB14E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:40:49 +0200 (CEST)
Received: from localhost ([::1]:43850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKayN-000727-7n
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajD-0003yL-TK
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:07 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:46026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajC-0007XF-B8
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:07 -0400
Received: by mail-pl1-x62b.google.com with SMTP id d17so7915921plr.12
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qbW4VpjE9MbutpbgnWYnm2S01dHzMdGYJQJnh5A4i/Y=;
 b=lFp62LUZ+/Mm3QWL+0vcReiEFOh6vc6ZAmEWKAHVbXCPZIZ85UBIPsjLi3l+clw7my
 4C2qx0LVSOw+A9FeQDdwwdG6KNk/FP2FKcl6pxEv7lI0pHxOufHOBA1+XfOX1TZVTh0m
 kRTsOsHSxuwI5rPT7sLxzIM7CC5f8SglumDxG2TTMr/erOTlkMCBmaSgWAToBfGR9eU/
 9sgbnR6AsnLCf33ieo9DaJoMo2/5uyADGudqnx1iyKRYmqOaa+LSWTU7Ve1EeCi8YBxf
 Uoqoil5/U/7WTmqBgYIp81B+D0RxujL4xS+m6UZJDLJp1LGV55aEyFZXNlHdwScI7ZII
 bFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qbW4VpjE9MbutpbgnWYnm2S01dHzMdGYJQJnh5A4i/Y=;
 b=V+BDwRq+dCE3eQz+IADP2G+8gm/0mPJUTQL5QWgeAHBtBcYN9YeO2ushRYWrIB3cQL
 73pHRirQabh9OqRalSMH12/v3HMM4zflDp+hTH425ZYN+TAlQ8cedxjiDlXsZdqXa+Eu
 Ie+y9/U5C8zgAXasXWieRWLtupUL01sz4zIkMoMNtCY1TP3VT6lYHpi+bUtgF+z0Hk6j
 XXKgDwYYKlwFWCdStrzMWoN9cqdfSujbTh03WmMK/ps7Ir6VOMuyzbS5WPCEsaaup2pZ
 OAdcS8mRPhlSaeabQssM9ItYyiOZFcMnVoL4rWddGMleP4ZsBmRVhfE8ajY84JZnIEO3
 NQ/A==
X-Gm-Message-State: AOAM531C1V1ck87gKdVmfzKmwpWjeqteQ1tUgUpQwRyZAbYwKHjVN6EC
 qr9P7+ty1EI/Bqm+k2TS5QxzUCRLcJX4jg==
X-Google-Smtp-Source: ABdhPJxzuLbWNY6JTOG6TRS4TqYA1B2g/Jt3Yz5pk4Q5P1F0p/Mxy2HcfOq09KknHYksgg/83+TXIA==
X-Received: by 2002:a17:902:7882:b0:131:2e12:c928 with SMTP id
 q2-20020a170902788200b001312e12c928mr20475939pll.74.1630304704917; 
 Sun, 29 Aug 2021 23:25:04 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/48] tcg/optimize: Split out fold_brcond
Date: Sun, 29 Aug 2021 23:24:21 -0700
Message-Id: <20210830062451.639572-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 0ddeaf7e4f..9dfd172a34 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -714,6 +714,22 @@ static bool fold_andc(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_brcond(OptContext *ctx, TCGOp *op)
+{
+    TCGCond cond = op->args[2];
+    int i = do_constant_folding_cond(op->opc, op->args[0], op->args[1], cond);
+
+    if (i == 0) {
+        tcg_op_remove(ctx->tcg, op);
+        return true;
+    }
+    if (i > 0) {
+        op->opc = INDEX_op_br;
+        op->args[0] = op->args[3];
+    }
+    return false;
+}
+
 static bool fold_brcond2(OptContext *ctx, TCGOp *op)
 {
     TCGCond cond = op->args[4];
@@ -1628,20 +1644,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(brcond):
-            i = do_constant_folding_cond(opc, op->args[0],
-                                         op->args[1], op->args[2]);
-            if (i == 0) {
-                tcg_op_remove(s, op);
-                continue;
-            } else if (i > 0) {
-                memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
-                op->opc = opc = INDEX_op_br;
-                op->args[0] = op->args[3];
-                break;
-            }
-            break;
-
         CASE_OP_32_64(movcond):
             i = do_constant_folding_cond(opc, op->args[1],
                                          op->args[2], op->args[5]);
@@ -1724,6 +1726,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(andc):
             done = fold_andc(&ctx, op);
             break;
+        CASE_OP_32_64(brcond):
+            done = fold_brcond(&ctx, op);
+            break;
         case INDEX_op_brcond2_i32:
             done = fold_brcond2(&ctx, op);
             break;
-- 
2.25.1


