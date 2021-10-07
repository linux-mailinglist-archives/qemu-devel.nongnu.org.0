Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC14425CD1
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:01:07 +0200 (CEST)
Received: from localhost ([::1]:35590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZZi-0000cV-0R
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZU4-0000Mc-R7
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:18 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:39434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZU1-0007EB-Bt
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:16 -0400
Received: by mail-pf1-x42c.google.com with SMTP id g2so6237483pfc.6
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PRHLPoY02S4XZD3bq10a9ta1bGfUklUSCV+j3lP1M1o=;
 b=ViR7f0g+6GLxPKhy95sHBhgD0e4srHfiCHESXAdFbzVJDLnot7PNrH4JeacxGZuhSM
 m1rMofmjyy8J9v5cSI3V8O2qW57YDdWn4XC/8fxKaYzGSBWRXh3J5hkf5iThFvNazja/
 SqUHMYn9kT/NJxsINrt/e4H6frivSuxs0Mb5nJ2A42etgZChnjAqtHH5GtRyb2TGyXLj
 wUg6aP8mzawE1GNYZbyXmS3urOSCdwbBZrmxpUbV1QiYdE1cvbFuXKa3prM5C0j7U+xH
 XyV6H4Nx/VBBo5KkjurWsM7GCxmTuKtK26VAcaTtX9R/Rrhbw6mMaKesfntobZzxsiiD
 wrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PRHLPoY02S4XZD3bq10a9ta1bGfUklUSCV+j3lP1M1o=;
 b=COq89gKf+EjZTuBuIVO5oGP/0dJDnfgkl1AomHnASY8nPVurMMocR0lG8i2dgq9zPM
 LZImbvqDqjMLv9l+n/FbQBl9k8iI+UB6EIgFw+mGaJXuXoyEgVPIeVOOn++PaINNnHcH
 3ZXcsDF4zyeyTTFmfm2/FeKI0Ljjr3Yr2rhHeIzRT96If2rRNNHJuHXvhmNYFow/A5Pj
 xn7IIgIp0E1D/PQEEOWoHx7i1sApg+UDjwksGm5qZq5Nyew0NPAvv5yvSXtzyiJiESQY
 tk7YMWH5RJ6j5mcO8xPjwkEwiueFpE+lluLwjM4G5XfNSrt9MCFRCnS5r3KZsFJVXSnP
 WSRQ==
X-Gm-Message-State: AOAM5336kW7/bBPALCEL7CHuD/+hgBXLV9rz4GD+kbwcx8GMYDqfuagy
 Yu8ajvCg9cJrCYxE5sDHTnbTt67+vFWsvA==
X-Google-Smtp-Source: ABdhPJygXoD9ZgijKVF8h6mvzVzZYDDL+jNCbGkuERLyt6KsK7geONpibhi4Wswrt6ud9e0mXsPwCg==
X-Received: by 2002:a05:6a00:15c8:b0:441:b4f1:652e with SMTP id
 o8-20020a056a0015c800b00441b4f1652emr6059288pfu.74.1633636511754; 
 Thu, 07 Oct 2021 12:55:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/48] tcg/optimize: Split out fold_setcond
Date: Thu,  7 Oct 2021 12:54:27 -0700
Message-Id: <20211007195456.1168070-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
index 786d46ed66..6bb5e19e55 100644
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


