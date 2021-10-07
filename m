Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E048425CDE
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:04:37 +0200 (CEST)
Received: from localhost ([::1]:47116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZd5-0008M9-PU
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZU8-0000NZ-H7
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:23 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:33331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZTs-00074r-0Z
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:18 -0400
Received: by mail-pf1-x42b.google.com with SMTP id s16so6285513pfk.0
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sFg/bPoIgY9SnPKHZvYfCYYREfzlMzqsSqKnPi8OcM0=;
 b=afAOQSCQZY62rvWYkJFSi/+nCPrRGfBgglAG1gr8mMBBuLOBoWnjKIrIdvNJZNnadW
 PMy9UJfJ6sx40lhQ25vnp04IqKVndgRVAcFztFo3zzTUUfDUOj/lloB5x6K5Wl6+VDEE
 ajuFc9H3RrKI7SoDwbRTQ82JEBQkWQBN60sv7g1/vMnXDqRCGQWnBshdv9CwiFYBOnST
 cCZGJQHYkqAPgrGoqLSS3xJsY3HR/AyvgYIQV3H0IhFMKEzxcIw5am+1vFio8dCfIvNX
 rfRjKUC1rkYxuBnTFI0TDZX4Zp2cQLNGFyrkL5sZdQUQSwKJzpx7EjXphRoiuCUVo5NA
 6D+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sFg/bPoIgY9SnPKHZvYfCYYREfzlMzqsSqKnPi8OcM0=;
 b=GlIqEumW2HOPA47C6FwW1RnU5bSJ/jOqIHUzqN3X3biMk/FdyCHxwtPFTipeIaFxxo
 +SmxVLBATWd4tV/bYxbtCPwSfDeNYJdJcZo5tYGnbbAjT6LdgARFoZTLXeBeOgUfV26f
 Tpy7k5UJSIedPEXQdURmokUikRKB0bKYHQHaGZRHhjwXNOx3i6v3841KuYaADCYC3qKZ
 +Fr6IIIgJUDoaFrWhtsUGGu36sVeSYLfY+9zNWpIYCi2XNpCFRp+a/x9c41Ew7g/Gmw/
 skyADymS8GURJEwK/z0BkiQEdEKZtN2pfzMneLLl7xWxm7DJPLd7Hjt9ABpWehRgOSad
 YoSQ==
X-Gm-Message-State: AOAM533XXdaA1tXXemGMOAHWGXJJXlh2nGBLs4A8hJB3W5io8vWH3Aid
 YB4tRzEqMEKA6hZFRPQBRsRxArQjf2hNFg==
X-Google-Smtp-Source: ABdhPJyXRopDNwvdy9I86DnuZGGeD5htvybhyzhPk6y+U+BkW3vy2MJLJ67tdA6GwXZuvRR933E1Sw==
X-Received: by 2002:aa7:8198:0:b0:44b:e191:7058 with SMTP id
 g24-20020aa78198000000b0044be1917058mr6012878pfi.39.1633636501995; 
 Thu, 07 Oct 2021 12:55:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/48] tcg/optimize: Split out init_arguments
Date: Thu,  7 Oct 2021 12:54:14 -0700
Message-Id: <20211007195456.1168070-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There was no real reason for calls to have separate code here.
Unify init for calls vs non-calls using the call path, which
handles TCG_CALL_DUMMY_ARG.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index b875d76354..019c5aaf81 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -128,11 +128,6 @@ static void init_ts_info(OptContext *ctx, TCGTemp *ts)
     }
 }
 
-static void init_arg_info(OptContext *ctx, TCGArg arg)
-{
-    init_ts_info(ctx, arg_temp(arg));
-}
-
 static TCGTemp *find_better_copy(TCGContext *s, TCGTemp *ts)
 {
     TCGTemp *i, *g, *l;
@@ -606,6 +601,16 @@ static bool swap_commutative2(TCGArg *p1, TCGArg *p2)
     return false;
 }
 
+static void init_arguments(OptContext *ctx, TCGOp *op, int nb_args)
+{
+    for (int i = 0; i < nb_args; i++) {
+        TCGTemp *ts = arg_temp(op->args[i]);
+        if (ts) {
+            init_ts_info(ctx, ts);
+        }
+    }
+}
+
 /* Propagate constants and copies, fold constant expressions. */
 void tcg_optimize(TCGContext *s)
 {
@@ -636,19 +641,11 @@ void tcg_optimize(TCGContext *s)
         if (opc == INDEX_op_call) {
             nb_oargs = TCGOP_CALLO(op);
             nb_iargs = TCGOP_CALLI(op);
-            for (i = 0; i < nb_oargs + nb_iargs; i++) {
-                TCGTemp *ts = arg_temp(op->args[i]);
-                if (ts) {
-                    init_ts_info(&ctx, ts);
-                }
-            }
         } else {
             nb_oargs = def->nb_oargs;
             nb_iargs = def->nb_iargs;
-            for (i = 0; i < nb_oargs + nb_iargs; i++) {
-                init_arg_info(&ctx, op->args[i]);
-            }
         }
+        init_arguments(&ctx, op, nb_oargs + nb_iargs);
 
         /* Do copy propagation */
         for (i = nb_oargs; i < nb_oargs + nb_iargs; i++) {
-- 
2.25.1


