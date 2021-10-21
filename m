Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6C1436C7F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:13:24 +0200 (CEST)
Received: from localhost ([::1]:57846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfNL-0007ie-Jv
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfG2-0007ML-GP
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:05:50 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:39656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfFz-0004Ao-BI
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:05:50 -0400
Received: by mail-pl1-x62e.google.com with SMTP id t21so1283277plr.6
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=apxi4gdi/2+dlekZiDFnJhG83/VEpB6pYIdUYdxg0AQ=;
 b=vgFIiUdt/DRdcilDE7sblzULs6YOVnj7H+w1K/n355ViW6VLuVD0YykLxxTjjMQeVW
 NZOUGR/vvIZ+o+cfjOsM4TF0a6d2IeN/jZL+tWrG3TLEnOIU5Qwoap2fScszfshUXevh
 lu/Hbhk0Y6zuCFAYPIAg9fjpGFzZzAX5SOidj4rLv+SktkDdl9M0bPs+fT4bgyCEbMjt
 libIRkIqNI3nxMgvcArYJBA/klgNuRf+9sgVUXOJOhYNtB5qYnDq+/ksHq4h6Rs/aN5f
 chGB1vIllzvjUvaOVVwb/bEkwhg2c0DurZXfHNa1PjD791nVbCe6/hfDPSJpY49X0oq5
 WBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=apxi4gdi/2+dlekZiDFnJhG83/VEpB6pYIdUYdxg0AQ=;
 b=i+jTCaXvBhhdbH2dz2rRUJdpZRCf2/pD0z9zUtOb7zGCNQUbfQ2XOIUNaWdhK6dtor
 A4xLP1zB9eIZ36/uw2diBe/oeknTI98SP4hvPiQXsZ+qG4V04D1usYse3hDfeIOBic9v
 5+cTCndviJfEDcEQPSKtBGdY5AYWZMVoffzA4pSzJAsqSF6mYTvVSoQoIN7qya4ytzU+
 gLUnEF8eTI1JW7cLU/WtCKc8Zk2O8ttWWw+J5M04av0ecE1qZfZUUluzKHrIOYhoPjhk
 I6iZLrA6ULQwo1dB3Y6FaZIjonbksMf7mKqrIkPvVa/u2yT9mX2HONW8a9ulHgspXjUL
 JC0A==
X-Gm-Message-State: AOAM532w4iveUp7m1RLCeuKAZGzbQCYWrvt7ZproxBSLi3NQRkDfKsaf
 UVIvMHpSt/eM6JNdnIME4OgmExt8E8Bv8A==
X-Google-Smtp-Source: ABdhPJzqRJu1+LEqLnmaSRcH0d9kwBzCr1NCgHRGYIn0v6bCQu6VRCUi83ZeGXXvcmnx8fdG/0WB/w==
X-Received: by 2002:a17:90a:fb87:: with SMTP id
 cp7mr9545515pjb.114.1634850345687; 
 Thu, 21 Oct 2021 14:05:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:05:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/48] tcg/optimize: Split out copy_propagate
Date: Thu, 21 Oct 2021 14:04:58 -0700
Message-Id: <20211021210539.825582-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org,
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


