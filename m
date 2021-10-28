Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEA643D9A3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:04:53 +0200 (CEST)
Received: from localhost ([::1]:38688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvim-0006Xw-Sg
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMN-0004ai-2w
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:43 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:38548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvML-00038T-4N
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:42 -0400
Received: by mail-pg1-x52e.google.com with SMTP id e65so4930456pgc.5
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WL784dDelb2n11jVqBh0M/kFnuIJJZnBgr5d6GB5NwI=;
 b=L9EtfrIyr1CKBSXTQYr2PTvrFe+czLPyrI8cdX6TDpn8TssBJY0WYn1IkpO/x0uRYf
 aZcgQmaX1O3epS4+3NOb5jjAH2RA97JrIoPuBgUPCwfbZD2O1f1gsr6hJVKHQGZNuRT8
 wb4P8xq63T/qnDLSMU3/eI3ae4PVku+AQWlHKII43jf2BWNcDXGuhtuHot16a9Yo9YMI
 XPnKiWXxeJRCwNtxXWcA8ITG2XYXDL5NHPVbVn0r1oLVK/GOk+NE9fYqk0aIHO2sxnzl
 eJulfeTVbyk8zwEdYi4Z/XqVDYiGuTodof+CKlSAmid+qdf2F6qcrO9o46Ex+gVf5X9A
 3F4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WL784dDelb2n11jVqBh0M/kFnuIJJZnBgr5d6GB5NwI=;
 b=O6GtII7dN2EF4+ZR54ZprcoQq+6D5y98tysO/DnOwJR806SRK2mtfn4cdgXEBl7TWx
 70rnN+3B0j/ClYT2TEPvSwkW+X+jB4omC3Lcj4CAKGxGlGhI90fYCQnLTnJwljDvEsDv
 jN0kU0+CBqDI7CNMfO3kqyTITmnYZDIDTmvjTNoMaDfjnkbbWCBVFUox+eZQ2YSLtkxM
 xG93D9Ib0edVWoBzUXJRGe5XSEROp3UahkHt78qp6acnfrCzcBWCvJQZ0PmuoyJmpxKI
 6DejDcCQWIf14jBBzq5CMdyCja9qlFx7Okjw0NaLO8cob2mKVJwusRRtOgqkj00j7hWB
 tbDQ==
X-Gm-Message-State: AOAM531W4iXmR2HTmSmuGW7eVGaqdRKy//zc9SNqBVrTu/bgyYuuklx+
 dAL67cwHeRJdJBvJLhJtLgIWufPfPlYlRg==
X-Google-Smtp-Source: ABdhPJwabmbJy9NjrTnkg5aEL6VHOzDi3XWPRMRzrFrw8I5LUmD/CIQ9VQqi2ePNxJ1qexNGXQD78A==
X-Received: by 2002:a63:d2:: with SMTP id 201mr1188729pga.400.1635388899905;
 Wed, 27 Oct 2021 19:41:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/56] tcg/optimize: Split out init_arguments
Date: Wed, 27 Oct 2021 19:40:46 -0700
Message-Id: <20211028024131.1492790-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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


