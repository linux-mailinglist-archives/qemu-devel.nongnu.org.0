Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B153E375E
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 00:11:14 +0200 (CEST)
Received: from localhost ([::1]:60652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUXB-0006ia-CW
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 18:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6V-0000GF-Vz
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:40 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:37715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6U-0005T1-Eq
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:39 -0400
Received: by mail-io1-xd30.google.com with SMTP id l20so17749798iom.4
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6TEa87wBqKTP6vhIgK0R3rG57nCLcrb9WVGGCmCQqkk=;
 b=wamNaG7JqoqbEMD6BMAczlsarHECN2J4sFVwAkC0eDtKSCT5Nm4CrClEWyDRavO9+A
 pUvD+UdkvEBBUz9C4HFuyV8BbhDDcXn9RWKKO9jPZ0xLJ2GtUJYhmigdk2j3T2QGX9VB
 RFbDgcAoe8RjlV/f0CW6LnaNI8O8GuV2nt16m8MQoYrTTyVWTFQapXEIMOb54l/ptrva
 VyhS2XwXbGILSmtR58c0u45XNH72UUBx0pNuZyEFiCT2xVbUlph+BCc+ppRee8YcrEWf
 jOYAY/7nruGzlEjI+pCnn24hmuWNGx7xEEm6gkAzCv/aGBpXo+hH2JOZxlYPVKid64ui
 9CeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6TEa87wBqKTP6vhIgK0R3rG57nCLcrb9WVGGCmCQqkk=;
 b=jFLq4vezxKL+NbDacFtP0TUEbU0v97YQTcjz0BniQqMkeYpw0PW67jXnT8WqF04LMi
 Iove7LXIzdKhfUjlYHDI/LTnEBF7bnyDBx1V4s09SSPZvQvZdRNSCFVskC0Io5kKOBNY
 y21rp4+JDq2Go+CNNbxWoEGmVyE3kKMxvyZzqG6nfQKbPqLu/WZwaOCmXCTpTZxJqVaO
 PzxuWlPXW4qJVj/2cocRE6sW7l82gxzSJZmj3//U2zugW499ndomX18pa8chIs0sg0I2
 2bjv8/IjE4RKfEmw2FW5I8UfYWVYzne6KFN7KEmHmDi/b46ychdPytQWfXI40ZJh4IUh
 mF6Q==
X-Gm-Message-State: AOAM531FvRCvyt9IOH7CSdWMX6rHxEuUc2JKZQwp4LB16QsqJwgf73nC
 SGbTpnA5FK44lbIWWUG5IRiFcgKjwc/pM8cm
X-Google-Smtp-Source: ABdhPJzQ1RUB+FC0KfJ/YQfWqnbBwjTv8rtpgj1qUf7wi1L6y72ksEODO8JZNB+7zG2HdlVvNCWO0Q==
X-Received: by 2002:a05:6638:1928:: with SMTP id
 p40mr16003859jal.93.1628372617194; 
 Sat, 07 Aug 2021 14:43:37 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:36 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 46/49] bsd-user: move qemu_log to later in the file
Date: Sat,  7 Aug 2021 15:42:39 -0600
Message-Id: <20210807214242.82385-47-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index c8fafa78d0..7ba616a995 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -85,14 +85,6 @@ unsigned long target_dflssiz = TARGET_DFLSSIZ;   /* initial data size limit */
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
@@ -181,6 +173,15 @@ void init_task_state(TaskState *ts)
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


