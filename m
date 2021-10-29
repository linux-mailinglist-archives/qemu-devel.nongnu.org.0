Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0C543F63D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:43:15 +0200 (CEST)
Received: from localhost ([::1]:35144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJjW-0001J6-B9
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaJ-0003mJ-DD
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:43 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:47029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaH-0007ua-B2
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:43 -0400
Received: by mail-pl1-x629.google.com with SMTP id p18so2700321plf.13
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WL784dDelb2n11jVqBh0M/kFnuIJJZnBgr5d6GB5NwI=;
 b=hxG+4Xr1GYgoqSWs9JnCPYsq2lLSPh9qKvcNj8GJ/CTmUqOJM+MIsZu0Esfmla8e5g
 8CoASsDn7df6YZyfG8m5tmA3ADKQALbovmv8UheaFPZE91u+xBMJvdrNqQgl8y1rVo6y
 6jgrzVKNTWKcIVTRGbTxcqDW+1kx0HwJEA0kr7yFprlGwPySMnclMA3hotUz4Ug2hvsw
 oLIyMDKcUHtesj68zc4Xm4WbL0QyulbTvNAsmmwnV/EdrEf7oIeJDcqOJFwn760ewFAp
 RxbhGcMUeSt9jwCN4gMs2EfjDlQ2xsNr9TUMlZPHs9sbzyz6TcnunxnU7qH/c/H4pQ2L
 xslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WL784dDelb2n11jVqBh0M/kFnuIJJZnBgr5d6GB5NwI=;
 b=y4kw5E5PjD+9uJAfVA7a3N2tCcOzjaYY8XXEzkoQK/3Hze2fAPGj+YyD8KpvCSwTKY
 lytwWkcFv87Y9I6eDohMzub7rN3EatIhrTgOxyT7vcOeRKTXXIxVtXKzjFv7Y1F0v39J
 sMaXNXhAcNfMMgAqAzStL1PfTOMw2NbGtWS9aaSWBHCWsVrB4IYeRqZPLyORJGN6zYYK
 HrL32Q8MVSoGw3x9OtnlUHgd2xqSnbX2P070y5I2C/f54tWBfNd3+AGh2hBFRTVQZ/6k
 RQuetdNupDW8GLok0NEkRtrFfIjXQYCYuKMvpefZfjMOjpv/loIoA7R6Ra5fE2Q8WKO3
 FcfQ==
X-Gm-Message-State: AOAM532OeHKHBJLkS7wPrPT1s+23FZN74It127XfaiqYWDXBau5kkYEt
 /YZtUN4qwp/DIOELXL0C9juQQ1bSWidbAA==
X-Google-Smtp-Source: ABdhPJyGkGFsqQdj0hEfxXX/W/qumiU2RSMMAKj4InFRFNGURqeLErHWbPaoeQ993JYtx39Fk3gtCg==
X-Received: by 2002:a17:90b:1a84:: with SMTP id
 ng4mr9172669pjb.80.1635482019933; 
 Thu, 28 Oct 2021 21:33:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 11/60] tcg/optimize: Split out init_arguments
Date: Thu, 28 Oct 2021 21:32:40 -0700
Message-Id: <20211029043329.1518029-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There was no real reason for calls to have separate code here.
Unify init for calls vs non-calls using the call path, which
handles TCG_CALL_DUMMY_ARG.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
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


