Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEBD42742F
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 01:27:44 +0200 (CEST)
Received: from localhost ([::1]:45974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYzHD-0005G7-Me
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 19:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5W-0000Hj-Kc
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:40 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:34713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5R-0006sN-NG
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:37 -0400
Received: by mail-il1-x12d.google.com with SMTP id g2so10428808ild.1
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 16:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RsH2uGQG+H5kNjUvUvYqnVTq0HxSNPvaGumcXkHmkA4=;
 b=IVVV0Bt/4uxAgY2Apkk92ai52h8DHM1WXCmmFvB6N4Jj1ph9SYVE2STgTKVyJAV0UR
 Sgs0GD6eDclNt5lGhnLDKhy1rnQ1/ma8o57R6PK8j/69/mH5yK1XnpDAvh/FeB99ppWN
 +bZymFjbxtYSSFQp9AbIKMncN5uwxBEbCfOovyA3Z33sRz4F2jYUYBSjnn2aHNlCB1qK
 euVG/+gU15AtlqnbeLxGEZi8RXN+r4QwzJyZoxaFFy/MeW25kSB9ejC1Cd9Q8H8xixOM
 NBGXjwF7yo69fjwQ77qQHuYh2WaQHJhe+TvLtnPlc3gJzs+A+3hYDVCUBzWuiK2d3XwG
 APhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RsH2uGQG+H5kNjUvUvYqnVTq0HxSNPvaGumcXkHmkA4=;
 b=X2gHahKv3TbA/KMYltW4Gpp6kF4Do1NK4GK2Xgzh82FGPW+7orxEfJkmyLyhQOM4lH
 N6g2maNwQflZ28XlxXKZZGue3PC8exazahb7iRSXnDYBIzzkxQb79vvkqs60LXhLlWeQ
 zkrAm6p0xihEqT0MAP+crEFL1iBr2YhFFJPrNMLCHkFvv5T/huKcRRo0oOujUIL0HryF
 90BOCuuJ2eoz1/8/b2BiN6oB69j+zCtgcaPv0Bp89Ovklx1VGzW8rLyAFaxLV2Lwdzax
 oTAwKdk0LhJSVQZ20fwqPgs8vvZ3NB2q+5kU4+lfd5Z6QJnj2BquKhcbIK/mRcmBQXkG
 4w/g==
X-Gm-Message-State: AOAM532Ad7bV2oUl670bCjWWDM3O1od3bvSIRmq1QB14VETc5zTsny+2
 B3Mn+T7YcJ8UUOdrIK0m6fdcudGO5nG0eg==
X-Google-Smtp-Source: ABdhPJxuszGg4KOWIoXSfiQd9KT/xMGH4uDWkEt2DZt8QEAuXaenweo4r38IKTsvBhF1ZROZMcmqOw==
X-Received: by 2002:a92:1a08:: with SMTP id a8mr9844819ila.301.1633734932417; 
 Fri, 08 Oct 2021 16:15:32 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id b15sm293628ion.8.2021.10.08.16.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:15:32 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/15] bsd-user: Rename sigqueue to qemu_sigqueue
Date: Fri,  8 Oct 2021 17:15:05 -0600
Message-Id: <20211008231506.17471-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008231506.17471-1-imp@bsdimp.com>
References: <20211008231506.17471-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To avoid a name clash with FreeBSD's sigqueue data structure in
signalvar.h, rename sigqueue to qemu_sigqueue. This sturcture
is currently defined, but unused.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 bsd-user/qemu.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index e65e41d53d..5b815c3a23 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -73,15 +73,15 @@ struct image_info {
 
 #define MAX_SIGQUEUE_SIZE 1024
 
-struct sigqueue {
-    struct sigqueue *next;
+struct qemu_sigqueue {
+    struct qemu_sigqueue *next;
+    target_siginfo_t info;
 };
 
 struct emulated_sigtable {
     int pending; /* true if signal is pending */
-    struct sigqueue *first;
-    /* in order to always have memory for the first signal, we put it here */
-    struct sigqueue info;
+    struct qemu_sigqueue *first;
+    struct qemu_sigqueue info;	/* Put first signal info here */
 };
 
 /*
@@ -95,8 +95,8 @@ typedef struct TaskState {
     struct image_info *info;
 
     struct emulated_sigtable sigtab[TARGET_NSIG];
-    struct sigqueue sigqueue_table[MAX_SIGQUEUE_SIZE]; /* siginfo queue */
-    struct sigqueue *first_free; /* first free siginfo queue entry */
+    struct qemu_sigqueue sigqueue_table[MAX_SIGQUEUE_SIZE]; /* siginfo queue */
+    struct qemu_sigqueue *first_free; /* first free siginfo queue entry */
     int signal_pending; /* non zero if a signal may be pending */
 
     uint8_t stack[];
-- 
2.32.0


