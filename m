Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E2C1F9E17
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 19:06:30 +0200 (CEST)
Received: from localhost ([::1]:59730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jksZ3-0006VG-UT
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 13:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1jksYK-0005yA-0w; Mon, 15 Jun 2020 13:05:44 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:41569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1jksYI-0006Yo-HX; Mon, 15 Jun 2020 13:05:43 -0400
Received: by mail-ed1-x544.google.com with SMTP id x25so5120526edr.8;
 Mon, 15 Jun 2020 10:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=wOFPU+2ze1PD4h8pKn/rWIR1exdq9e8XBAvpN4+pICw=;
 b=ot1oWSzF+kRr0X/SoPzbDMbE6vtpe7eJMitn+Au+B/jPlLhFzBczvafYqteR5aPOiW
 NV2aH4QTqi1mczsT+HvxnwBGglwRSj59UXDpB4Ewd/SopiYpiEQfz0H3NjuEVGKZh8Yl
 3AoXn8cBC70Y/KGpiP7tPSONqquU89EF1yvr5QuczZYEctpakzi2PIrJiu5hflJpaJDe
 /mUiT5g03LkDejYi3xpTFPp6iZJgbW61MmUxc75m8Eo6bfEoL9gjkDXg3BSkQE+2txZ4
 eR0VNK2XYxln4a+WyzNdte1tc4XUyKrcq/MUsUZ/LnwZwd8GlKyxaKE9pTInNzfWtgpZ
 oeag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wOFPU+2ze1PD4h8pKn/rWIR1exdq9e8XBAvpN4+pICw=;
 b=gdTMc0sMPqBc+47CjeQunGfMCLLjs/Y8Yoa8ba/x6dosr52wNqwbokWQL+I3y71Mei
 r+wJHo6iQ6rHzU4GaK+8DwmEfBrChFQlxFHzPyDjcExD4GZmKLKUMg/rw4RG4A+UwyCy
 FEsh9jVkslOelubfWTCOjnZTD/0qxspl+WUu5FMTj+iYdw37kVVoSrlNQkLsVRqILK4c
 Dg9H94JcwVfmPMMwTHMbPfe9J0WWSQ1hlRs0Lb5I9SCz5TPe4Ds8W89mhgpTwuQ+momV
 4VXi4b7rSlVJa8EB5jLIc+az32Me55JSjYaB9M5EUTzYuEbCVe+Q+FVuJizYr5g2q/lX
 hP5Q==
X-Gm-Message-State: AOAM533Em0FAJTz+tr9KWB0qnr0reQkaPQcbrzQD16mXWEo7a5v7hWhw
 5oXq/5+hf/22i7FH2TLo9M8Nc+DuGMiLYUnl8iHyNMCCDZPYBg==
X-Google-Smtp-Source: ABdhPJxio5O57s1sif86VHzeZNwu5OOjv+pk43yhraG64BhQ3FKpJGdjOtD2mVllL5afyMEoPwGgTvCwzlAEZz8zQro=
X-Received: by 2002:aa7:dad1:: with SMTP id x17mr23701088eds.49.1592240739536; 
 Mon, 15 Jun 2020 10:05:39 -0700 (PDT)
MIME-Version: 1.0
From: David CARLIER <devnexen@gmail.com>
Date: Mon, 15 Jun 2020 18:05:28 +0100
Message-ID: <CA+XhMqyzW=ah4Q=OCE9KP6DYpiQN18oQpVWjqFCvzQfH3MvQFA@mail.gmail.com>
Subject: [PATCH v3] util/oslib-posix: : qemu_init_exec_dir implementation for
 Mac
To: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=devnexen@gmail.com; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

From dfa1e900dd950f4d3fca17fbf5d3dfb5725c83fa Mon Sep 17 00:00:00 2001
From: David Carlier <devnexen@gmail.com>
Date: Tue, 26 May 2020 21:35:27 +0100
Subject: [PATCH] util/oslib-posix : qemu_init_exec_dir implementation for Mac

Using dyld API to get the full path of the current process.

Signed-off-by: David Carlier <devnexen@gmail.com>
---
 util/oslib-posix.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 916f1be224..0aeaed2fa4 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -57,6 +57,10 @@
 #include <lwp.h>
 #endif

+#ifdef __APPLE__
+#include <mach-o/dyld.h>
+#endif
+
 #include "qemu/mmap-alloc.h"

 #ifdef CONFIG_DEBUG_STACK_USAGE
@@ -375,6 +379,14 @@ void qemu_init_exec_dir(const char *argv0)
             p = buf;
         }
     }
+#elif defined(__APPLE__)
+    {
+        uint32_t len = (uint32_t)sizeof(buf);
+        if (_NSGetExecutablePath(buf, &len) == 0) {
+            buf[len - 1] = 0;
+            p = buf;
+        }
+    }
 #endif
     /* If we don't have any way of figuring out the actual executable
        location then try argv[0].  */
-- 
2.27.0

