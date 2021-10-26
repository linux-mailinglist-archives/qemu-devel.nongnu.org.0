Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD9843BDC1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:21:12 +0200 (CEST)
Received: from localhost ([::1]:53954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVkl-0006IK-PZ
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZo-0002nM-V6
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:09:53 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:45835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZn-0001vv-Gn
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:09:52 -0400
Received: by mail-pl1-x62f.google.com with SMTP id f8so617772plo.12
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WL784dDelb2n11jVqBh0M/kFnuIJJZnBgr5d6GB5NwI=;
 b=vZhr/9LXtW4qWcPeY6duuF4Qh7wp3+y7p+wmPVM7duBPAnFQUk/BAq266s6wrLFb8G
 n0A5KahyPYFh07CgkOu2sDmLBxVccYBa8P5AQgubpk2TpoAgwAQiDBMRjw7t8xbgNWYI
 im2mnWz+D7Xwy2696A8w7NLCKQX9+/o/cZf8eA+lBF+wk5fM6IXks5MvSv1/LWaMmZma
 At+DwGeggbE9qcMwxbIQmycdCILVSjDWViW7oxxVW9aljQKpGvhrXvMmPoU7hQ5S1png
 LxX8gCjc93LyrtMAEDTNVZxpl09kqVoAwpDKRZ6Al6YVKUrcNojHjGcnnBbhgqzbqVar
 HHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WL784dDelb2n11jVqBh0M/kFnuIJJZnBgr5d6GB5NwI=;
 b=wfX6caVKwJHkQeYj8rgQjNAuA0/5mw3NgO/UOx7D+QGkpmBgz/Qss5Gj5rJXNahxjD
 1AF6Wd/TT7zwRVw0mMkuvjn0aEjueld4IfrTl8AnIgNwrNO0vy5oNqN3v4b5y8uZ97Er
 wUfMr2qxiWS5XmdjDIcLpvhA3XTxw3uRBg8Dljr/EAo1NpmyLYoIN/CmB87scWTndR55
 xDgi6bkVH1ruwzF3gIJA68fDwiJPZEIIa+oPiOkGVaD2UOf5+x3x215cB4fJWFOJwzkC
 fFT0ym+Fq9AM1t4MnXEhAMjAAf3fpVGrH/Bs+xyGCvBGOo9jsl6bBF6qWQX2DfMAZRK1
 YOQQ==
X-Gm-Message-State: AOAM532AWWTDYtXReIe7b75252iUU4Aljg1GoQ59DNXmNs//VEfP8NIC
 IIm6v8fJIgYdAlyOMLhc/1bGhQmPucYfHg==
X-Google-Smtp-Source: ABdhPJx6aYCkNMNGlqdrExwLZgmDj0v3QXhyK+7zd4yt3egoYGf81xhnX0+/zBxpS7zofNMm7K1u7g==
X-Received: by 2002:a17:902:70cb:b0:13e:91f3:641a with SMTP id
 l11-20020a17090270cb00b0013e91f3641amr24463507plt.13.1635289790141; 
 Tue, 26 Oct 2021 16:09:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:09:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/51] tcg/optimize: Split out init_arguments
Date: Tue, 26 Oct 2021 16:08:58 -0700
Message-Id: <20211026230943.1225890-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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


