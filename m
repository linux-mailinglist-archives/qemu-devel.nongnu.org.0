Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BCB43F651
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:53:00 +0200 (CEST)
Received: from localhost ([::1]:54972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJsx-0006Vl-GL
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaK-0003oh-8p
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:44 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:33615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaI-0007up-CH
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:43 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 x1-20020a17090a530100b001a1efa4ebe6so6638970pjh.0
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=apxi4gdi/2+dlekZiDFnJhG83/VEpB6pYIdUYdxg0AQ=;
 b=ubkBkqY1TLhVgEsNpILT9YaPuDc68UYulNYaQ2nsFQnGnbiv1qDUKJMnDSPO/7iHDf
 ibASunAUMLdy4xSAsvW5y3Rw4V2fsX9Sjswhv9PY6QxbOozTErMotg6kFX5hgh+dx+zu
 jUVyhJoPHziCrb8DvVKztPeevqZxksEdVqTkmo2twMEpAHiivEzLiLGmr/aH6+L/it4q
 ok0/IALzebwvFajLv3/W2+lvyo+gK4AZhEwwVxB9APJwzw9SiWWwF0HQTS/wx1AC41yo
 eLdONVyZoKYKJattr5SaNuD0fWGFD2apXpLfrNsVy0PA7MmRcJJXcP8Y1iN3Fveq66VL
 D07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=apxi4gdi/2+dlekZiDFnJhG83/VEpB6pYIdUYdxg0AQ=;
 b=ObTGj5kZmQevLZvS4qFUKtqNLqPA34J0jVLRmq5KINw4jjrd9JS5sk2ybS35Ehl3mI
 hYx4hiEoVc0gpxuxkz9e+xvlkTaVKB5GTuCltGweIR+Yqb7MKxuz3nHuRJXhxFTnFovI
 8TkvSMy0p2D+PCIJLkR/MxwT81n2uXB4bH/cW/4ZHcT+uHyUURpmq/3RiGQsYd/HHfw1
 UFpeIzHplqdm+BC/d4N998NYW7UDo7hF82iUNJzifS6NO6VXkNT8NtWEfDPmfQ0EJzeY
 iqmSlByEIQk5LhcZgCjV9lM03qTbHH7YU+A1TPf/k1djFq6tGr6gei5TdZCBozedABGy
 zGAw==
X-Gm-Message-State: AOAM533+DyuGhxBXE7k7O0GJ6EsvfjtpdlmPNYVnnUwxVoHoc/BS9A2D
 vN089vM3ZTYqi0K+E4aDpXWtoBJK7jVC+g==
X-Google-Smtp-Source: ABdhPJw2HdZY1x2XR/wtaqqgcEPwj3sr2+QzyMxF5sBezqkqrizsxpA4d5XUrqNuksq9q6P9xIypAg==
X-Received: by 2002:a17:90a:c297:: with SMTP id
 f23mr1593398pjt.138.1635482020909; 
 Thu, 28 Oct 2021 21:33:40 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 12/60] tcg/optimize: Split out copy_propagate
Date: Thu, 28 Oct 2021 21:32:41 -0700
Message-Id: <20211029043329.1518029-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Continue splitting tcg_optimize.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 019c5aaf81..fad6f5de1f 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -611,6 +611,19 @@ static void init_arguments(OptContext *ctx, TCGOp *op, int nb_args)
     }
 }
 
+static void copy_propagate(OptContext *ctx, TCGOp *op,
+                           int nb_oargs, int nb_iargs)
+{
+    TCGContext *s = ctx->tcg;
+
+    for (int i = nb_oargs; i < nb_oargs + nb_iargs; i++) {
+        TCGTemp *ts = arg_temp(op->args[i]);
+        if (ts && ts_is_copy(ts)) {
+            op->args[i] = temp_arg(find_better_copy(s, ts));
+        }
+    }
+}
+
 /* Propagate constants and copies, fold constant expressions. */
 void tcg_optimize(TCGContext *s)
 {
@@ -646,14 +659,7 @@ void tcg_optimize(TCGContext *s)
             nb_iargs = def->nb_iargs;
         }
         init_arguments(&ctx, op, nb_oargs + nb_iargs);
-
-        /* Do copy propagation */
-        for (i = nb_oargs; i < nb_oargs + nb_iargs; i++) {
-            TCGTemp *ts = arg_temp(op->args[i]);
-            if (ts && ts_is_copy(ts)) {
-                op->args[i] = temp_arg(find_better_copy(s, ts));
-            }
-        }
+        copy_propagate(&ctx, op, nb_oargs, nb_iargs);
 
         /* For commutative operations make constant second argument */
         switch (opc) {
-- 
2.25.1


