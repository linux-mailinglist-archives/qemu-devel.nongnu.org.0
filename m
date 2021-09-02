Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44E73FF850
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 02:19:33 +0200 (CEST)
Received: from localhost ([::1]:35658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwvc-0003ce-Qx
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 20:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRV-0007M6-DS
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:25 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:44659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRT-0003HL-Fo
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:24 -0400
Received: by mail-io1-xd2e.google.com with SMTP id g9so4710971ioq.11
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VjKTwP+Tya/NjgChJqeOOFB7vrXue/PKxfjbjPPEGCg=;
 b=QNKFdqkqrDBMVXEMmCEmghSQVA/a8UCJugWUccKvr48MX2YyW4j29SLwXWENaksjHE
 G+70nBd/g6ABe2hVJhCiRRPhiBmZnwLt3przAMvko81+016rAqrpmz3xSQQVSMPE9ygM
 hMHL//1CSHYGkpyRBcgfTo9W11iBRWkmGnqvc0xb37AcxqspFevKATvK/mE5CoX04aMV
 cHQtJ0wFG9HKkyua4paFJI1pG+03w0dTuLb+W2IAoOItgX5h/kgv+Zd68P//KbMW59W9
 A9u7esNOTXPtg4HSdWlYLRfUn/KhfL+q5Tnv8UJswcRYkZ95FggEwN7gdDO3cSR07WDj
 2LbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VjKTwP+Tya/NjgChJqeOOFB7vrXue/PKxfjbjPPEGCg=;
 b=ARdLIX4DNZizEB14mJ+ifjTKdlyPecuXUepOEtIYFGvV9TgIqT/yTa39UMaEp1+G3/
 pMruh5mqEi4JX70j8b+j1Ut+UeQiFckevrS04NbaWu3fsZhgZcjSxwF6WWREN9Dy3It2
 jO/f/IeQPnVKhOu65eXlsgcB4bz422RCk5zcN4aCTGeLZ5QdOMc4O46aRAeRp2aWQfh/
 fQIS0tuhaoKCQb4h5N6Dgv1UYyL8njuQoGElr8dQgJz8Vg7tLJIBFhzYpEAn/tiD2RWj
 YHJ8AcojW+tQz4yCnD/aWtdFi98/5t51R4XMY4dRAuiFONBEl2cJzqpsVFt5e0JrPkuO
 Eh5g==
X-Gm-Message-State: AOAM531SF1Vy8BUe1vncm1k0z6nVy/LvDFs2O9JoXf7JU2PK8mHRiLnX
 cKL5JctVYJsun2ZRVmq4TjyTMlY0cwFZ0w==
X-Google-Smtp-Source: ABdhPJx02Wmvjag1KkFCRCPnMisT9KDu8DJ/OIMZUd65aqTPtegjW1mCaS4Js5aSrA1ZCu0eXLoJQQ==
X-Received: by 2002:a05:6602:340a:: with SMTP id
 n10mr748364ioz.188.1630626502318; 
 Thu, 02 Sep 2021 16:48:22 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:48:21 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 40/43] bsd-user: move qemu_log to later in the file
Date: Thu,  2 Sep 2021 17:47:26 -0600
Message-Id: <20210902234729.76141-41-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 50c8fdc1e2..1de86ae493 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -71,14 +71,6 @@ unsigned long target_dflssiz = TARGET_DFLSSIZ;   /* initial data size limit */
 unsigned long target_maxssiz = TARGET_MAXSSIZ;   /* max stack size */
 unsigned long target_sgrowsiz = TARGET_SGROWSIZ; /* amount to grow stack */
 
-void gemu_log(const char *fmt, ...)
-{
-    va_list ap;
-
-    va_start(ap, fmt);
-    vfprintf(stderr, fmt, ap);
-    va_end(ap);
-}
 
 void fork_start(void)
 {
@@ -167,6 +159,15 @@ void init_task_state(TaskState *ts)
     ts->sigqueue_table[i].next = NULL;
 }
 
+void gemu_log(const char *fmt, ...)
+{
+    va_list ap;
+
+    va_start(ap, fmt);
+    vfprintf(stderr, fmt, ap);
+    va_end(ap);
+}
+
 static void
 adjust_ssize(void)
 {
-- 
2.32.0


