Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3256DCAB5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 20:24:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plw91-0002mc-Pf; Mon, 10 Apr 2023 14:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8p-0002h5-15
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:23 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8n-0000if-FH
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:22 -0400
Received: by mail-il1-x12e.google.com with SMTP id t5so14780836ilu.5
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 11:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681150879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eKTshgyJue2IZsMB5Fao8NJgZMXSVIaxyIPYq4hYHh0=;
 b=IgH4Kg7/8XzNbfp1riKrulyhCPQL951X5tGe8Kx7+U2tm+delh8nmXrndT68Tpy5wb
 qnRT4TOmbYg1TIxYS8OExowJ6nu53s7ZPsxlUKQldU62L0LE9UviJ6bxzqWcoD3x5VMv
 Uyct7u4c21tIe1NNNqZIttcMe9ky+eFf/h3v63+snclmCnzC6Caz3y6Lml9rEkAylMRM
 uc/C6Q2sUVzcqZ30FFa9yfBMVOJAgpmAhoUpbRev63ltTlXGW3/NiVM85wTrNvfEzKL5
 X/9AYDvAQ4rpXwTqP4KSUk+GLaXkpZnumHZE7rjEl+5Klbb1RbfNkq8BnhBhCJ30ubmi
 a6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681150879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eKTshgyJue2IZsMB5Fao8NJgZMXSVIaxyIPYq4hYHh0=;
 b=fFr4PSXKBjY0xbT6iFfzwEYvsXqIyrViW7e/r1E/WeaEC3E0TJw09480UmSu0iW93e
 pss6Ae7wZtOkRlgEaKzKNzFX4XKbD/2D9JJHtPgEKcd6E84sTllu/O8PY4t8O8CsR0ge
 q97vivNgogo5wXNQflZkZk1pV6pzC/p49zcu/eSB7MRpeVNWKdbiWmmuWNbY6MpUUCJA
 MtsMACBSuoMwb0hCt4yQPNP9T1MD8EQCx5TtIThM37bMpIHjdI8IpOUuTKDOionEBbMx
 fOWIabXIpcDHrQ5FxonUvJHNLCUAalw2jXs+Gw0isBMFkm+syP/+AaBu6pWvt3vsevYw
 SdEA==
X-Gm-Message-State: AAQBX9f5u2kEyUG7UHHmLzPOl7cIwSJC5L22yp6iLlkh7lp8ImfDqOck
 CoIH+K/qXJDeLZHYDwSEraP2aJT1NV4/4Pa4j3Y=
X-Google-Smtp-Source: AKy350bPOX2lRwtk+gq8H8IbDOU8dKECkrdCJjhnYiE69tRmUzRyZKIryRg98Yh+JUnSKWJ7e84FHg==
X-Received: by 2002:a05:6e02:1608:b0:315:6f9d:e75 with SMTP id
 t8-20020a056e02160800b003156f9d0e75mr13116778ilu.7.1681150878911; 
 Mon, 10 Apr 2023 11:21:18 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 a15-20020a056e02120f00b00313b281ecd2sm3104314ilq.70.2023.04.10.11.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 11:21:18 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@jrtc27.com, riastradh@netbsd.org, Kyle Evans <kevans@freebsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, reinoud@netbsd.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 15/19] bsd-user: Add SIGSYS to core dump signals.
Date: Mon, 10 Apr 2023 12:20:52 -0600
Message-Id: <20230410182056.320-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410182056.320-1-imp@bsdimp.com>
References: <20230410182056.320-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SIGSYS creates a core by default if uncaught. Follow that here. Sort
with the same order as is in the kernel.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/signal.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index f4e078ee1da..4301595cc2f 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -330,17 +330,22 @@ int block_signals(void)
     return qatomic_xchg(&ts->signal_pending, 1);
 }
 
-/* Returns 1 if given signal should dump core if not handled. */
+/*
+ * Returns 1 if given signal should dump core if not handled.
+ * Compare with kern_sig.c sigproptbl[].
+ */
 static int core_dump_signal(int sig)
 {
     switch (sig) {
+    case TARGET_SIGQUIT:
+    case TARGET_SIGILL:
+    case TARGET_SIGTRAP:
     case TARGET_SIGABRT:
+    case TARGET_SIGEMT:
     case TARGET_SIGFPE:
-    case TARGET_SIGILL:
-    case TARGET_SIGQUIT:
     case TARGET_SIGSEGV:
-    case TARGET_SIGTRAP:
     case TARGET_SIGBUS:
+    case TARGET_SIGSYS:
         return 1;
     default:
         return 0;
-- 
2.40.0


