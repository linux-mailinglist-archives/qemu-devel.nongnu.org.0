Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA507488AAA
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:48:04 +0100 (CET)
Received: from localhost ([::1]:53412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6bMS-0005GG-0G
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:48:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avC-00061p-HD
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:54 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=42913
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avA-00079l-Jm
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:53 -0500
Received: by mail-io1-xd2a.google.com with SMTP id o7so14344666ioo.9
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9sjpK/1Q5swTBppTUsP0f41/QFdeOShmYIkZ4Qj7tck=;
 b=Ax16X5REnQTCoZ3Oh3iBUty7PP15pgH5lS9JpPmPHHCW55hgolBRRVM/U36A3Q1uFi
 GH9tOLXYJIOvl73xRV3k9zOd+ZYPeTEYLcPJnVD1ZTgQFRTwUhRcaHIOTm55CnMwaBpe
 u+MgvvuJqM0y2np9dNt1eWR+4WCuloaU6rPlKj8IL5EqpuJWNutZDEu3IEwFn8E7dznY
 faWhvuHfmuGXX3c2nVceKSvJ2f984zMDh32zNVkBM7nQolJE4h/hJTJPo4HdD0TPglls
 rQWC2UCM8kGg84pl2P4n4LJcIerHB6ryzwhZONOzXVBNgNbPxhV8IrMDeUgHIIHzCLn4
 4hFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9sjpK/1Q5swTBppTUsP0f41/QFdeOShmYIkZ4Qj7tck=;
 b=jm6fyVkfg6lKQDFzJPdjYNngGiVLrkd7lf/QO3kiGPuhdWvRvw8hhvR4o3uar2GDgq
 iX5uAJnt7xt8baTnvW/ZUpHNuFZe2M4uKTE7M6y8M8kM5/pTdS/p2CKctsDZ8nFqQ7M8
 1CFXOxHDsK3GxLr5itKe3hCjSDJ4FOENrdkzUhIHnMEjqpgUFY1KqrPff899oCmbdxll
 PJWgJmP0dbT1R8ZmcUpeUlDE6iPupgF4+tBBrI5Pe5HvkoqtB3ATTwiBAjKLUmRR7uAr
 8i9mS7v1xRyZ1sMJZhk90VLUJ/FIyKHHyQsM6z4J3joaoAZ1Oi0/nw78xhiY4t80j3lA
 HFOg==
X-Gm-Message-State: AOAM5306MZY5RjRyBIvSLFCQVxl5eSgMr3090R+AP3ruAyUhMThG5rTN
 7ZpgMVxYoxl5CmNEVGQu7Wog32ApmS0Mpyul
X-Google-Smtp-Source: ABdhPJybV1bTcaWslZ5uXs8kbM/JY2OUJgUpFIakDGBq1n4u2NHW8u+dBaNUSa2yaGUp9Em5Slzc0Q==
X-Received: by 2002:a05:6638:418a:: with SMTP id
 az10mr34763800jab.179.1641745191316; 
 Sun, 09 Jan 2022 08:19:51 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:51 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/30] bsd-user/signal.c: core_dump_signal
Date: Sun,  9 Jan 2022 09:19:13 -0700
Message-Id: <20220109161923.85683-21-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Returns 1 for signals that cause core files.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/signal.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index a6e07277fb2..824535be8b8 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -92,6 +92,23 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
     }
 }
 
+/* Returns 1 if given signal should dump core if not handled. */
+static int core_dump_signal(int sig)
+{
+    switch (sig) {
+    case TARGET_SIGABRT:
+    case TARGET_SIGFPE:
+    case TARGET_SIGILL:
+    case TARGET_SIGQUIT:
+    case TARGET_SIGSEGV:
+    case TARGET_SIGTRAP:
+    case TARGET_SIGBUS:
+        return 1;
+    default:
+        return 0;
+    }
+}
+
 /*
  * Queue a signal so that it will be send to the virtual CPU as soon as
  * possible.
-- 
2.33.1


