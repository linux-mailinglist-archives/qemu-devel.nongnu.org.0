Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F18370FB5
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:21:10 +0200 (CEST)
Received: from localhost ([::1]:34864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLOf-0001d3-L3
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMT-0008By-1O
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:18:53 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:35386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMR-0002rP-8b
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:18:52 -0400
Received: by mail-pf1-x429.google.com with SMTP id i13so2965587pfu.2
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=T+bwWhG2aXu2Jmbr5CuBFk282uxjI9dQD6yjHdIosCw=;
 b=Ev9Mj1jtE97HX4Ltzg1fVGHCDILy2H4SUI9bO1k/z5GJC+oUK7BUDQkRedHF8b4uWt
 hpBCMbQtJ0CKL7blMr3YZxhzB8G/jJ1R2I4gczBdVnO4VLiCreApO4xyHdXbrD8eK4gw
 +gIyRaCL0PBBJnCJxvimw0jC1fhlbRx5JPECLrYxalD85kwZ3yum64vKmzu7bgnh6Rr4
 hWwunu7kwEfEt5EX/3S0XgP20i320t1sN5s2t8BRw146bM6hNUE6NimJj6niyDSDkRDK
 Yx/aIy9vBQbxdTPkATLFP5Z2/HN6ZVTNANC+nWnltSu98vatoUo8BhJG/9AejYn66h/Z
 ZM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T+bwWhG2aXu2Jmbr5CuBFk282uxjI9dQD6yjHdIosCw=;
 b=al70vKO0/Mt/MEJf24iPtCzG+uvkPlS2D86FCzVP4urULz0w1vzlE/08Bv2bLqI0jY
 2ai50wAxL8Kb4NIFPT619aHh0DxNVOAav5cFDuoyjLv3s2P2Mm699HUC6B06qxAYvnrV
 wm1+Z+MGjfnGc1sjPrctkYf7dpF3kQpRiSJ4F8ePKIB9C4HcW+mnUhDAGH/ybuOGQq0/
 z7dMKmy5eMtUX8QAhZV+qNqfI5KA5J1wfhqv11pvgDhqJZjy1l5AG5zSFYu4j7MshaqY
 e9LWeK1mxpno4h/i7mzEnSN+gf61ywNL1sOpNUJzBhQooufKG6FyorBS6a5DYHWqcyDz
 X68w==
X-Gm-Message-State: AOAM530wllLvBF36akNK5zBwU0uIws0YcIUR8dt72tdTUNIQCbf9YEg/
 W0Q+a5oM+B+xC0LMrhXqywIByn1D7ULE3A==
X-Google-Smtp-Source: ABdhPJwE2kPbFSa9PL0QZcABUt0ICTNwGXpBne+nBIxtxvZNDCnIjWmKMOx0n6y0Cye5mqqhdiauFQ==
X-Received: by 2002:a65:4548:: with SMTP id x8mr15532509pgr.413.1619997529870; 
 Sun, 02 May 2021 16:18:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.18.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:18:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/28] tcg: Split out tcg_region_initial_alloc
Date: Sun,  2 May 2021 16:18:21 -0700
Message-Id: <20210502231844.1977630-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

This has only one user, and currently needs an ifdef,
but will make more sense after some code motion.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 8b57e93ca2..df78c89673 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -729,6 +729,15 @@ static void tcg_region_initial_alloc__locked(TCGContext *s)
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
@@ -962,9 +971,7 @@ void tcg_register_thread(void)
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


