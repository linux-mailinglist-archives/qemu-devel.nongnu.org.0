Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A60943D99A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:00:58 +0200 (CEST)
Received: from localhost ([::1]:56866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvex-00086E-Ty
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMO-0004ch-1x
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:44 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:52898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvML-0003Bo-SX
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:43 -0400
Received: by mail-pj1-x102d.google.com with SMTP id oa4so3581549pjb.2
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=apxi4gdi/2+dlekZiDFnJhG83/VEpB6pYIdUYdxg0AQ=;
 b=YtyCY2IpfsVy4T9Bz2+0NHWyydATr7/lpeQdxak7Y48imrH/UArxdAs/V8NeM+tky4
 D7uV76FKpQfR5JkaPnLAK6vKdjvl9B7LWcDRv253TL7Zq/5AHzZX/L3QukSfquaZctom
 qEoK/MAnLXpYvpQbELxQdC7KhW3nvdEF2Jxah3D04ErCoyBMHR+Gjt1cJP7CeuprlSVn
 J51raVwz55MXGKWmMkei2d6oHJBR6jVpdu1+6fiJKZU/uoObZKTFtuojqr8FUMGgP1dm
 F2BQ2Hzu98iv6OxhvraSMi5JFd4wAc2PUSl1URaWQM2EryGV9RraOLc5lZ0DL3kJkb5i
 w99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=apxi4gdi/2+dlekZiDFnJhG83/VEpB6pYIdUYdxg0AQ=;
 b=3h/l69/1RKjgb+lpOaucL6ioMsRoh7BWw4EdTzMipoJJCZKDtPlb8WG8umQRctH/1M
 w6qYp/h5VI7BuHiTvPuXiE+f6Ur6R162JWCzMiOe3kBkCkVnJom6dhRTheX1MHOR+Zgo
 AXpNeKQeTpoN75tRiEZsyA1ALf5O/taGHGBL8F1s4/C8uShEQapHcpgznMNyTEQEy99D
 F6tALwt+Jx7yWnOi3/Jl3aI23NGOSpf2up13ewGUysDRNqVesoGbsWdAmReEcVLILV6I
 cuK/KOrPT61G/OyoJEKlpfte3LM/xLYXapni7wpNQBkUdSXXbhNWvAvzKBjYkYk0ukWS
 GcKA==
X-Gm-Message-State: AOAM533AyHIRZnQ9uEuhyijgaNKgIIHSUT5WPGRgMKx+7wXInFtNhXEa
 73TVrz85cowhtSOzEF+V5F6nD7x5cCU1bw==
X-Google-Smtp-Source: ABdhPJwJTbCqECFeEDaeyMjewwipmFZfbGUga8U9Sivau5hd7DM9DJLADSUQ3hwlwDs0dUQpTv5/GA==
X-Received: by 2002:a17:90b:1bd1:: with SMTP id
 oa17mr1565939pjb.26.1635388900528; 
 Wed, 27 Oct 2021 19:41:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/56] tcg/optimize: Split out copy_propagate
Date: Wed, 27 Oct 2021 19:40:47 -0700
Message-Id: <20211028024131.1492790-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
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


