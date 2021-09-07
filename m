Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34704030F3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:24:19 +0200 (CEST)
Received: from localhost ([::1]:53888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjVq-0004PI-U5
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2m-0006VL-Ks
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:16 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:42834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2k-0001A5-Hh
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:16 -0400
Received: by mail-io1-xd33.google.com with SMTP id b10so448406ioq.9
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ckTKsGW/QnQijAk34vZp6jDIsYDaGSbM0MJQvmd7lmk=;
 b=0G+gPREqkLCSrbNsTKDHliojlX4XrJBFI6Iichfpyu+T9z1YXO1z8GZQzf/qgZX/DW
 wHoNDGdgmtSGAX2F/c5PyH6NS2u8sOEU1EHr7hOSTJujfcNUtjiylJbHFIGISYlo1fLS
 ToJ7daAKPuXqaQIoibnI5UyKLB0wb6fLREe/RuqfR6XcPD6HsYPfZc0I4Kj1PQe7P7kT
 hYkxqEnEb96y3Sn1tNlabeM4oh6Zr0rhJcd5rVayrbpigoNOUDmGXZty1jL07exIqwJ5
 zV50SEjtlcSN6Dt8xIXPGJ78sMxgcj7lNTrSyL1RypbNu/YrTfp4yT5IWZDgQOAG0r+E
 1p9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ckTKsGW/QnQijAk34vZp6jDIsYDaGSbM0MJQvmd7lmk=;
 b=HAX+90kdnHFyJ6qqRagwaa3P/fgKX8ezpnqjs7QPhC/amaoiWa6WW2tvcn/cMelul6
 yuATj2ztoqIV3bB14vPWdtKPFJ5HXqpYbhCr69duX9W33BtjU91DZO1TCpTmpX910HrM
 dwpbqOS+w62b2qqViopohY8m/bQ6rTsSKYMXH4VoJlBvzSowvlS9eLAXnbu+m+wfaU5L
 vHS8o3hIRYh9qoeTcnrro9vGAUfLOPEwQIyE5S1CEynlv3+wgFuP2x513kskLwlz/k8C
 bJfBncRaJMisIouVF5Y0Ibt3Xqh/mgv9XWI9OOJuEnO+XpxMTYn2yAUIBcOcs9QzkQji
 j+TA==
X-Gm-Message-State: AOAM532rxdOP17m9zu+236WkgG6Kn8yY5fCa58gOeyG/I7U1mx56/yy+
 hHD6Bt2QpE4Jz2FF+Wz8TKEV34CWJoxXKwUn9sk=
X-Google-Smtp-Source: ABdhPJxcaxmLjwhaoC8o4t+QAbd9nSeW0qTdrYHHPTOvglD5LpIIdIcz+1+hsAHuWDvRyYM5u6KP+w==
X-Received: by 2002:a6b:be02:: with SMTP id o2mr275060iof.103.1631051653162;
 Tue, 07 Sep 2021 14:54:13 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:54:12 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 39/42] bsd-user: move gemu_log to later in the file
Date: Tue,  7 Sep 2021 15:53:29 -0600
Message-Id: <20210907215332.30737-40-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/main.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 71fd9d5aba..768f4ee41e 100644
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


