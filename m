Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197DB3A4B5C
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:45:04 +0200 (CEST)
Received: from localhost ([::1]:55168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqpj-0007EI-13
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmd-0002K2-BG
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:51 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:41926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmb-0002ZS-KM
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:51 -0400
Received: by mail-pg1-x531.google.com with SMTP id l184so3666643pgd.8
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NXkVHH+0m+9DTaglRp9AWRxTZMLmg8AZ8T8ieoPznkg=;
 b=tVBlvmyC7AMuZWyWFtIR05OHgy+kZjx2oCs1E561qzo8NeaeLo2c4Qcr72jpYolIa9
 /4U747DQIE7a3m0Av51qzX0Zta4az6zjIW79oTt0162MvkZqw8MyYtcIkSq7WQO+Piu5
 tgwGtLEg1GgF0qe6v6pl7KHEQFO2p8c/d/+h+vZrBk26gNEXUwU+Y/gpILEPLIuY96a2
 T1he5SWRMRyGdFCkgktozTMYxX+ezsYPcieKY09NqZB5vQi5oLc+Xy4opH46GJO5u3xj
 kjBivzSXsleNs/lBiWptQyB64SKisc2XM9wmZ4IoggVW4TGHR+YrVp0ONarK6Icu4Pzj
 iO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NXkVHH+0m+9DTaglRp9AWRxTZMLmg8AZ8T8ieoPznkg=;
 b=jpvf+UZNiXtfiMrbxkdqilzn4SfapeXOSI/BhGZ/awakhcp8exuT1miWMEb8xFFZvr
 DB4Z/sOqXQOIRSsEGD8P4CosIav+bGv0IbAcci8ELFXCjwRHaXgaiMO7pez99oZEINw6
 Vwjt20NcYD/sGmrUQFT9+oPa9vNtcAUUcL/gMXnXub2wfD/5dLySrf9wbVPlvyjJeIlT
 8hWhe8p7AjjV/meDlIpyloD+1T9Si4tnJmVfDVwqqbTt8ScH5jW7Nu2OpCcX8KRyZc8/
 4xo1+B7+VhJnsTOeNme+CBKcXbJ/IRdw7ZLrR1RqIEX8Sumji5rYw5gd9z2MbjFzfyn1
 yANg==
X-Gm-Message-State: AOAM531kzvVjtVyNzALz0mGUQ7R1vFf+l3vd2JzpHVWISKpOdNt5Omsr
 wFQpkmAUsNXwg8+Q282D1vci+9aNIqIMHg==
X-Google-Smtp-Source: ABdhPJwp9ntAKUqW/WqnGki5KnL2ycL4A7MYngSv8wOD7cp4f2u68Ok7bnXTXiProqAPhw0QLtzLnA==
X-Received: by 2002:a05:6a00:1794:b029:2ee:c59c:56bf with SMTP id
 s20-20020a056a001794b02902eec59c56bfmr10584276pfg.2.1623454908355; 
 Fri, 11 Jun 2021 16:41:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/34] tcg: Split out tcg_region_initial_alloc
Date: Fri, 11 Jun 2021 16:41:15 -0700
Message-Id: <20210611234144.653682-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This has only one user, and currently needs an ifdef,
but will make more sense after some code motion.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index ba690e0483..36ea21d596 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -726,6 +726,15 @@ static void tcg_region_initial_alloc__locked(TCGContext *s)
     g_assert(!err);
 }
 
+#ifndef CONFIG_USER_ONLY
+static void tcg_region_initial_alloc(TCGContext *s)
+{
+    qemu_mutex_lock(&region.lock);
+    tcg_region_initial_alloc__locked(s);
+    qemu_mutex_unlock(&region.lock);
+}
+#endif
+
 /* Call from a safe-work context */
 void tcg_region_reset_all(void)
 {
@@ -959,9 +968,7 @@ void tcg_register_thread(void)
     }
 
     tcg_ctx = s;
-    qemu_mutex_lock(&region.lock);
-    tcg_region_initial_alloc__locked(s);
-    qemu_mutex_unlock(&region.lock);
+    tcg_region_initial_alloc(s);
 }
 #endif /* !CONFIG_USER_ONLY */
 
-- 
2.25.1


