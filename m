Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AF4488A90
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:31:39 +0100 (CET)
Received: from localhost ([::1]:52380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6b6Y-0000Na-5o
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:31:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avA-0005xJ-L3
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:52 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=39641
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6av9-00079N-05
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:52 -0500
Received: by mail-io1-xd2a.google.com with SMTP id y11so14357391iod.6
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t/ddjl6cauPiUQiB6NQmi9s5X3E+m4nw8GVj1ngqf4I=;
 b=P7MIXVCNd+zhIp3BrORauPsxXaaaaTwM+yY2YXZJojHu8jCa1e7MPH9GNPWqlbq4jj
 fwLKqygQBhVjWUVEnYcwWSYbLgM98PCKLF78hBR9jpkjhz44Jm15e+ZqyLbhFfx4W/gT
 2GuOjk6OiK+cS9b3l2N+RCd6AdI2Ys2aVFuWYJy2uT520QgV3AX4+5rk2vbis+eVIzcY
 uyxBJV4SsFeZ18NZJDKEaYHbJTdAZn1NAAaqC/tizd0xYhMf5hH16c11JiB771786XpV
 m2QIxGnJaksB05xCnoO59ihZhbWKn1GZzGwZpgAq3/T9yyCFvrqdpQB2ji6UqUUO3AXS
 doHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t/ddjl6cauPiUQiB6NQmi9s5X3E+m4nw8GVj1ngqf4I=;
 b=7Y0jZhvsa7IcGEPICIYHDnjMHXdpaLmtHxS/7g3W1pbfpP2bhmBkPxUSdBI2Rc3T+3
 l0xq7kJF5U1AqmOCLZQnYGSggGbRYLCqvx2SDcMjGu+cJwo4iMLZ5vwvsCOB7iCblH0q
 ndFQonUa0YV6vTfjH2SElLGHO77iryLQXaLXhbKB9O4Z9RgZd3xwLVHhrS/4yNkHCrJR
 AYFKG5COXTI0M+JxsdhqkpCKQFr6QagPOhRp19EVsZNdms/BVUR0XZbGOmSwujkh+Jkc
 PSlqXsFHnaEWYPZq6e0uhM3LfoKNP9fQX0pxjPyMEKt5Wnf+uqATd9CUj+CmThk4NBnk
 tmVQ==
X-Gm-Message-State: AOAM531J75796Ht0hPWwVqAY2Izdr0MdOEsxdtwARETRr4+NO0i/Pc4u
 5g/o8r6GxhBEneSobjJ42u7ojY6ms0YYlXmb
X-Google-Smtp-Source: ABdhPJx0XGZ+e6zVGFPp5pJuKntWNc62jKYkg9BxscoOyZHNfBYeyX+VRltoKL1hfZfl4mvujnnsgg==
X-Received: by 2002:a05:6602:2c09:: with SMTP id
 w9mr33728215iov.89.1641745188735; 
 Sun, 09 Jan 2022 08:19:48 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:48 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/30] bsd-user/signal.c: Implement rewind_if_in_safe_syscall
Date: Sun,  9 Jan 2022 09:19:10 -0700
Message-Id: <20220109161923.85683-18-imp@bsdimp.com>
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h   |  2 ++
 bsd-user/signal.c | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 0e0b8db708b..e5e97632c82 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -454,4 +454,6 @@ static inline void *lock_user_string(abi_ulong guest_addr)
 
 #include <pthread.h>
 
+#include "user/safe-syscall.h"
+
 #endif /* QEMU_H */
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 3fe8b2d9898..b1331f63d61 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -43,6 +43,18 @@ int target_to_host_signal(int sig)
     return sig;
 }
 
+/* Adjust the signal context to rewind out of safe-syscall if we're in it */
+static inline void rewind_if_in_safe_syscall(void *puc)
+{
+    ucontext_t *uc = (ucontext_t *)puc;
+    uintptr_t pcreg = host_signal_pc(uc);
+
+    if (pcreg > (uintptr_t)safe_syscall_start
+        && pcreg < (uintptr_t)safe_syscall_end) {
+        host_signal_set_pc(uc, (uintptr_t)safe_syscall_start);
+    }
+}
+
 /* Siginfo conversion. */
 static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
         const siginfo_t *info)
-- 
2.33.1


