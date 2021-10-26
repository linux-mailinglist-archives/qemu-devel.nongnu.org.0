Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3A543BDAA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:15:11 +0200 (CEST)
Received: from localhost ([::1]:36368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVew-0002tv-B6
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZq-0002oW-1D
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:09:54 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZo-0001w7-Fw
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:09:53 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 n11-20020a17090a2bcb00b001a1e7a0a6a6so3597421pje.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=apxi4gdi/2+dlekZiDFnJhG83/VEpB6pYIdUYdxg0AQ=;
 b=Zlqn8ZEtUiesxXdbRwKyPohvMFlID3t7vj9+O0m5D6ZylBHSQ17hCii0P+FoLLHAnp
 URScYrNeVuQf1K+6AfbmxHM1SZv/DxTB/bZuO8/LMnlMfTEDK3nQMFdr2z+8QGDaMpdh
 udqCP/K3oHZNZVWPTkxIvZPVF4OGUGHqNYtBbzjmfYMBlCGGVtwdEFx10VLaIR+BNC+y
 vYANOqop/eKl5JstaOKYic0p7Um9Ax3umDgctDs1nSdh/EI8d5z6qN4RmxCc6uE0bVFZ
 1M+u7HLxr2usSLnysdAOM2EcOQQojG6tgKWmTqn2GhtgI6Apeab91xlAm85QyWvWzx9N
 pgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=apxi4gdi/2+dlekZiDFnJhG83/VEpB6pYIdUYdxg0AQ=;
 b=sPfAtQns7CqQzWkO8Ro6FZfiTL2dL580xPynGxHKqr78kA82vehCdYAZ1pB/6GMMh6
 GoEEOD/YfFJX/Fp6EQoHyAXv8/kaR9JB+4wlfUyC4zPIEhhGs+pkbqK9bh/xm8I3+zs/
 DkF2QNhE5+oNAhKQHO7qUjjIREYRZ9DPSkRhek7U22mP3gHVfOzIqasgCjRlFtyTZdTx
 kuSjMplPt6YJLd3Cw3nfiHYTnMRPeNRMkVbbw+2OeepPxdc7DHPgPkSGISUcljzVJXjn
 Ztr9J5wZMGiJKOsQjW1sEzuTRh9/VzCh1gM0FnR5WiuRTkAJiF9gJTEqEYzc2Y1SLRtw
 qFdg==
X-Gm-Message-State: AOAM533U9UvHKF3gAag1sMbsohVhMq1ZAvr1bgmJkDDejzpjgHQMVvXd
 eTe1AYtcOHs/g+yBd99LDH3FodMR7xmYJA==
X-Google-Smtp-Source: ABdhPJwVMXik70yYtYToYMoAP1QU6EOAsk4kDxAtdGF9+1sfIpW2RpZfB4gJePQlDlov/TQ2AOKbYw==
X-Received: by 2002:a17:90a:8006:: with SMTP id
 b6mr1864217pjn.185.1635289791210; 
 Tue, 26 Oct 2021 16:09:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:09:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/51] tcg/optimize: Split out copy_propagate
Date: Tue, 26 Oct 2021 16:08:59 -0700
Message-Id: <20211026230943.1225890-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
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


