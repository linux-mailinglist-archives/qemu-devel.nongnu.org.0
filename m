Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06423FB154
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:45:05 +0200 (CEST)
Received: from localhost ([::1]:52202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKb2W-0004Ne-P6
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajE-0003zX-8N
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:08 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajC-0007Xr-RF
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:08 -0400
Received: by mail-pl1-x62e.google.com with SMTP id c4so7921481plh.7
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0DoFoew0hKEmbikaFApG2+9yC/XMW8EHMmAnrdKl4KA=;
 b=oyVEH537hQWAh9QSiwrdGQiP6s+mo31f63Whrul/MG58ikeUa0BfVGeDDw+xp4sIls
 jRZ48tlV+7xwpGvGscLnZfOMNd2+hrG774F05ufbTHGDaiwAq8TwzuLvaK4/gdGKxU7y
 z56fTMaCLp/2jUYPlWaStRfXwvK1mu0HWH170Ija/st6Lb5R8Uwl1s/6p0ttyO9wncv3
 j998WAZnSTfk9oBSilnAYij8V/G2m3zxGdzfEAMTpBepwRV90h8/qpOXxuMeAZsWs8IL
 i+9oUrZEcviWLXv7EKaV3vw46TG7k4LTVQcqqnbteYbmzsl5dk8TdFtXw2yf0P7zCkuV
 +d2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0DoFoew0hKEmbikaFApG2+9yC/XMW8EHMmAnrdKl4KA=;
 b=IW8e9SAnbYsgbjLEbXBClviyk96wSs6QqIbyDYFNfmHUzfaTaj3WtffXrqqG80mHBS
 7Nef2tVZ3K0ggFihaXQRkIw4PKlFVoM30+k8xoaEXIXPF7wx4uQ+jlPf+LjrsijKiGd/
 rFVbp1C4dsXRMh2/1hecP95/aZOp+N0QuOXkibfeBOMF3zamuoB8lHThLfHvRDvL6gt1
 YvagfbMO+ba6vF0JTvGX7kEShAKxlBN4bvAUld/42FqedN2/Ke/9BCp7f4hMgNmJXgUi
 O4sNLZqWCg+WhihyaW0SPkRMUMAJHqT3H7qp3ckb+Ngv3j03soEQf55G87h60WW8kJlL
 sM7A==
X-Gm-Message-State: AOAM530Ja+ZXfEBvimLJkItGy7o/aZwPm1JPpwjMhEl0pgR8BOjfCtkG
 OF8laDDlRuDletIiOVxFMfauv3VhwaLXeg==
X-Google-Smtp-Source: ABdhPJxuW8oq3yUuSQDHwusHs7C3xbbWkFNKD4g/fY2LrBQ2fAMasbv8Qk1T+39+3dDFWTmivE7MSw==
X-Received: by 2002:a17:90b:a4b:: with SMTP id
 gw11mr38372490pjb.227.1630304705448; 
 Sun, 29 Aug 2021 23:25:05 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/48] tcg/optimize: Split out fold_setcond
Date: Sun, 29 Aug 2021 23:24:22 -0700
Message-Id: <20210830062451.639572-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
 tcg/optimize.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 9dfd172a34..58f03737d2 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -935,6 +935,17 @@ static bool fold_qemu_st(OptContext *ctx, TCGOp *op)
     return false;
 }
 
+static bool fold_setcond(OptContext *ctx, TCGOp *op)
+{
+    TCGCond cond = op->args[3];
+    int i = do_constant_folding_cond(op->opc, op->args[1], op->args[2], cond);
+
+    if (i >= 0) {
+        return tcg_opt_gen_movi(ctx, op, op->args[0], i);
+    }
+    return false;
+}
+
 static bool fold_setcond2(OptContext *ctx, TCGOp *op)
 {
     TCGCond cond = op->args[5];
@@ -1635,15 +1646,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(setcond):
-            i = do_constant_folding_cond(opc, op->args[1],
-                                         op->args[2], op->args[3]);
-            if (i >= 0) {
-                tcg_opt_gen_movi(&ctx, op, op->args[0], i);
-                continue;
-            }
-            break;
-
         CASE_OP_32_64(movcond):
             i = do_constant_folding_cond(opc, op->args[1],
                                          op->args[2], op->args[5]);
@@ -1802,6 +1804,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(shr):
             done = fold_shift(&ctx, op);
             break;
+        CASE_OP_32_64(setcond):
+            done = fold_setcond(&ctx, op);
+            break;
         case INDEX_op_setcond2_i32:
             done = fold_setcond2(&ctx, op);
             break;
-- 
2.25.1


