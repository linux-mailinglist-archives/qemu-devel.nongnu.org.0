Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E185E33A846
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:39:09 +0100 (CET)
Received: from localhost ([::1]:58842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYS4-0002VG-Gi
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYGt-0005tP-0p
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:35 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:45926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYGr-00089e-H2
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:34 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id t16so6881752qvr.12
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=36uzHkl7+IX2hopk8rVzdZIi+gPh2gDVUz4jl8wQF7M=;
 b=NblCIYGL4F97OVV0KPQiR7R0WSN8wmrKTT0kI4G2r0H/NcZfZbHmh2qTndV5Q4NWz8
 mpSbs59ur1pptviRTTGyMeXHBBfAs6gudiZIxFlMU3M56n08SyjC30u1Yg8ay9MUPIv2
 HCtXh/N6wRTspVJ895sMGecY6gAFWooCtrEhj8kfbC8jFx4yzI/LWuki/a87Z5UcF8XQ
 X8FhIXNqVyzq1lSAAGTRidEFA2KTI1xa7nVp6o6Tg9j5tr9YjNY8z2Qb4ejUoZG+oBiA
 cRwwak/PWo7LpAvZOPNtW4cQNrIzByKHJtFhcbyHer9QGQ4Mr5RX7jwaf+GH3gC1PBlw
 hCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=36uzHkl7+IX2hopk8rVzdZIi+gPh2gDVUz4jl8wQF7M=;
 b=tgjaco2dkRdIyCul/t9L2bv/kY00jRRhzzVQXs+JVbGNd1igVvlPKBfp2rUjJDnQay
 jYqFWpFgtXydlKk+90NOgiMC6ZwxS5jkb876W3XCb4wtDIo1soXYFxagCigtIeE4VR3e
 roBZY2akk0CkagVtrX7HG6gKhqUpOrgTwoe7euVB1eIht+4kXCPFlxb5wtlsgWHQ1Zaa
 yvPE3lOHVWDQe/nGzNkz/NYbBq+8wr8gokSKhxGQDV3BJfkc3ZI1eoVzgJl9jZueXEWf
 dl7ozFMdYjvgPY7fHZZwg/o1tyfoOi0vgM2Q+CQaSaPpjPNQjA3XF7TDowzCBwxGXy6z
 y47Q==
X-Gm-Message-State: AOAM531zGX3KL+l15vNBGJUD79Gigh0OYnZRXKXTptLTtdvg7WG0/J1E
 IU2Ahe1AGq3SrB9rMT1VdA8lEW4L5wNnA1jR
X-Google-Smtp-Source: ABdhPJzTHPxy5upymFNolcpvQefbrmqy58YpOGQrX6C8P8qGs8MHME8uGZVw7Ry3OWkCd7rath/VZQ==
X-Received: by 2002:ad4:5d47:: with SMTP id jk7mr1718768qvb.38.1615757252684; 
 Sun, 14 Mar 2021 14:27:32 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/29] tcg: Split out tcg_region_initial_alloc
Date: Sun, 14 Mar 2021 15:27:00 -0600
Message-Id: <20210314212724.1917075-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2a.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This has only one user, and currently needs an ifdef,
but will make more sense after some code motion.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 2b631fccdf..3316a22bde 100644
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
@@ -957,9 +966,7 @@ void tcg_register_thread(void)
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


