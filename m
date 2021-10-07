Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCD2425CD6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:03:09 +0200 (CEST)
Received: from localhost ([::1]:43698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZbf-00065i-VP
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZTy-0000K2-Oi
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:10 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:46626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZTt-00076f-Qv
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:10 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so6005278pjb.5
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9LSSL1fK8gHyFxNWGcE8fASpw4qPl5Wv54F/J5LK5dE=;
 b=QOc75qNtBrVszWqmTt0ZYx/Uqjq8YFoyDqtofbhjYsAftsJLidg+bYI2B/Vt7enmCv
 EmO9O91mpjoPE/P930Pv9bIAGCoTrLILij+ZCrC06aZAtu1JUpPXEFXGHk34TolOflzc
 NkhJPBzOzW/JgVR5mLr68KN9ZACyY05Mw+7jIu0kM49kHsKkReFbPA/Bkovqx2ELO/CM
 REQ5pMSNxhtOB4JEM4PV+aL7McR9nUNDv2WaLlvJXHmYTlq1Li7XsBqdVmEpwL2apGSG
 H3nzJoxak0L1UouFyi8TZS1j0wsArkzOi5JJZ3+cNNggfMMUS9UZ9you/yrexrki+rPz
 Ok4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9LSSL1fK8gHyFxNWGcE8fASpw4qPl5Wv54F/J5LK5dE=;
 b=KRpRWZmLKjF277XOir8Ms5cgQwxZmZIiMjpldbDRCvIOdU8HpRjDWXnsmSnZ010P3l
 62imE/0yx0bGobIDoftPogWwyV+ScdVnb6XdjtBdsJZyIYgIpWHlcwqr8N7zJ6WQiEYw
 iVnso3leaFm5QhrFg5AYoUmoAoMBsoFtJ0S+vFlXrffP9tvTNGJvhw2B+jB/mQOh3MYV
 hGrDYqMeEwAI1lqE0mBHpdDon5CTpdOtSzvcDav3qGDeqJEOzA1a7HAJsaSYYM/Vxeii
 7vdmtzp8LECJwCEJ0NvqOOS6DUAdDZ4XI2zmZGcas0L/pCfaieUE1pmJ/DW7l1zm5XDo
 D8Pg==
X-Gm-Message-State: AOAM531/WDgGQ/LxgbJYt3Qs2dySCApdRg0Vdpe5UvVe3s4JF9fen4xa
 BgH9zre626HNU+f/BNSVGpWtXN9QOTafGQ==
X-Google-Smtp-Source: ABdhPJwO4iYHJNxKDip+2Odxztbyr/pOKzq8MrOxjQwHhXQrkqSH6JY25jAiFmwVMxlRe/Qmz9449g==
X-Received: by 2002:a17:902:bb01:b0:13e:a6e6:9a53 with SMTP id
 im1-20020a170902bb0100b0013ea6e69a53mr5556553plb.4.1633636502803; 
 Thu, 07 Oct 2021 12:55:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/48] tcg/optimize: Split out copy_propagate
Date: Thu,  7 Oct 2021 12:54:15 -0700
Message-Id: <20211007195456.1168070-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Continue splitting tcg_optimize.

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


