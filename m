Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F6D3FB145
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:36:38 +0200 (CEST)
Received: from localhost ([::1]:60518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKauL-0007bp-O1
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKaj6-0003aq-Cr
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:00 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:33782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKaj4-0007Q8-Kr
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:00 -0400
Received: by mail-pg1-x52e.google.com with SMTP id c17so12473066pgc.0
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2EfP401+oKK/BT8GAuF1m4dvvh+53+sjFVE7rzdniuM=;
 b=XdGE+iOfoH3j289/MCgqmsHGUcjO9mCiqbwkQyA+i8o+joavIpFJIGJcht4SiWqVUu
 qw6pRMATTTso++zB69wmLKBLCId7AIdeZTjCOquT8p5sB+Xs26qClSzojULPHSWaJxrN
 hcNPr9bG184r5i1bXg3RRpwmv3REP/Kz4Sxv2Kjc0Q+2WSj3lS41QokHocFbu+ev0rcr
 Y4y+1vaF2lHAt0jDS4GDEwRBqLqP9OWbvvwbnSt6huXuaED3mjnox/g6rNjDa/RmSbY0
 U8lROgPQ/7xQyz5p0ngFxLz2TvEq5ukFXZi9x5xLru8W+XiV2m1in9niq1tSUwTQiOit
 QmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2EfP401+oKK/BT8GAuF1m4dvvh+53+sjFVE7rzdniuM=;
 b=r84lobc3EvtRe6xKZ2c5S4oexw4RIBMK/HIXcS1D6T/wGoYK/nvf1xXXVVwe/FmrWy
 upu7haXBxTxojeSMdF3P5Ijz4P52mNWPlt4YryolDWG4KuIZRhFumA/fj4vrGsV5Ryr0
 2uoeg5lyj137Vx1HTTqcDZWaPL9bheXYWIM3rAQ1d2HP3S4jqS3d5Mw+7/EECLCuTrF2
 GLHVn+nW1jQEAQWp29OLCGLmHk9s/zLX/jzg5ivVN/eVhmtZB4Y6b06zoTKXuoqjnfbd
 K6D7EpHqepLYVbU9WqgEWmleZ0le8oxCWId+ek/OZAgtpxRAcx1gzr+j1WG+y4B8KslS
 FnMA==
X-Gm-Message-State: AOAM531yiy4m/1c20qk1m6Qq1+7o7vfXQcZaw5yEcYmABN7nreX415GL
 Df218dkgnv5QxBehFxWn91p5R61qjJR/Ww==
X-Google-Smtp-Source: ABdhPJyvgvk0+qS7QjnadDcxVC1H0Fwjt2mQ0o1t7q7jgCB890hqbWnFFpOhCUQwSdxqN9Qqx3gAJw==
X-Received: by 2002:a63:1309:: with SMTP id i9mr13245489pgl.192.1630304697271; 
 Sun, 29 Aug 2021 23:24:57 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.24.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:24:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/48] tcg/optimize: Split out init_arguments
Date: Sun, 29 Aug 2021 23:24:09 -0700
Message-Id: <20210830062451.639572-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

There was no real reason for calls to have separate code here.
Unify init for calls vs non-calls using the call path, which
handles TCG_CALL_DUMMY_ARG.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 87f33521ad..b1b5096a9d 100644
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


