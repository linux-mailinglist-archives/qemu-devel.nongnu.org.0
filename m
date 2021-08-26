Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 359623F9057
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:53:35 +0200 (CEST)
Received: from localhost ([::1]:37074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJNJM-0007BP-9R
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMgH-0006fk-Dx
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:13:01 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:35464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMgF-00073i-6F
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:13:01 -0400
Received: by mail-il1-x135.google.com with SMTP id h29so4750661ila.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QXmbdWSn2dAzeHU9DkZBmKXIBM2aegHE9VWnw2Q7EWw=;
 b=Hy9gtKy+L+DBomevEH/yW/U+dwiejPODfBFy5CsC9GOvaKVssvHS702NMA/WwPp8GU
 UxSGNU3PrSzdk+A2Es0Zi35dQqjQHqxNsV49/bl4Bp3FxL0iTR4TV63zAGANGDYRdqmS
 tDOO1gzv3nq+f4pdOeAtmcBCchzbd8f+ufeDNIfk6eU8PCSaz3XRqRQwqBZIhpu8CIBX
 tGD4ywhFINVTBjt9r/drZod/6b97HwQCpXS5/tHEQXwb8FtZh0QqeHuWwVZyzbffqB6/
 W+Rl4eTIFvMe0EjyL4dZu0ruw3KOGEgawz/AwJ4YRQ5UCp1sRlLsgwtlnKx5yCkdsO1i
 nPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QXmbdWSn2dAzeHU9DkZBmKXIBM2aegHE9VWnw2Q7EWw=;
 b=kcvH6CEJ4cnUYqnuE2W1l/iaf/4sWaS6P7YJA/HPJzKRpOR3685Aji6ABULWTssz1w
 nA8m/ONYz+1kS8mxjh/9SBTkFk9ovXc6WvvqZ4wYmPuXKJUxQtsNihGtE/Z0s5dJOC6f
 s933FaGJ+FY/RUx5rFgWBJZTfGSNBSb+2kJc+y54TS95VUrIphjiVpczsfznORa7I0SM
 Dflkfz46vOushrjeRvbARMCPe7ydK0c6QXXhuntHAHysd+iPs1zphSuXph0VQGikkcWa
 ufeDre9e97E1F5He6aNwp20ULZGKrkXIdIc7EzuxA44uLmbQDt0xiYxT5jTh0m4yDwt7
 1dNQ==
X-Gm-Message-State: AOAM5330b1c6mxem44KqIVXavuy37568P+vFPSnFfTD5bxQb+gfAacIL
 7/29LQpFGr1chZf4Bb1tk9BYG3G2Q1kF97nl
X-Google-Smtp-Source: ABdhPJzBkTbf6MYRQ4EMLhvt3u3PDsxBV4oM4W69/aFbHWw9GBh7NKetjr6+war8zR9Jvrm58eUt1w==
X-Received: by 2002:a92:c808:: with SMTP id v8mr4091352iln.110.1630012377346; 
 Thu, 26 Aug 2021 14:12:57 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:56 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 39/43] bsd-user: move qemu_log to later in the file
Date: Thu, 26 Aug 2021 15:11:57 -0600
Message-Id: <20210826211201.98877-40-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
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
index 57669ad7b7..d60a0a7ee2 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -69,14 +69,6 @@ unsigned long target_dflssiz = TARGET_DFLSSIZ;   /* initial data size limit */
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
@@ -165,6 +157,15 @@ void init_task_state(TaskState *ts)
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


