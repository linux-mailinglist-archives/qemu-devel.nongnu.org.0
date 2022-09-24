Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35435E8D92
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 16:52:36 +0200 (CEST)
Received: from localhost ([::1]:58476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc6WB-0006oF-If
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 10:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oc6SK-0002YS-8H; Sat, 24 Sep 2022 10:48:37 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:39615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oc6SF-0004r4-Dr; Sat, 24 Sep 2022 10:48:33 -0400
Received: by mail-pg1-x533.google.com with SMTP id b5so2784683pgb.6;
 Sat, 24 Sep 2022 07:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=QCqFAp51VAgZdd1W3Nyc28rA1Oj191ulWzVZjEEzsFY=;
 b=ewQZdQv51ccxtdplDREYxUzuGuk6KMwtpjnps/Tw7tLu0ImgZOWxQb2u8lAQa6d6bR
 00R5aXPbd7fV9ysATvyt8f4vAWy68Sj1KaX3i9UOb4e0b0PVRrpNbYMmbGzhyfJigJVd
 +vrnth6Ead1ZClkW/uMxx67qSJJp6VSWFippgeNVhmGOHuHLk6GBsYFG6hp07EAgfvVK
 ZJsIGdlFUehDl46z/Go1rKPvTHOeMrRzvuHbECOWQkT/mPiHDyG6X5aG83+dsyps/gTi
 Hgki/Fe43ZoQ8W3yNu5zqqEQkh22Yy/GeeuAEIQRVdC0PZKFrBV7YsJ3mYdxON6kMTme
 yh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=QCqFAp51VAgZdd1W3Nyc28rA1Oj191ulWzVZjEEzsFY=;
 b=f4nWAUyJulZO4hgDOcwLwKFVJPvdiaK6Xd1zkI3pF6tHEcCETzzns6GrjWx/6htjvB
 XPPpOE+472t7rIbZOFZk8G3J6NIhTNmOwwlN2T5x6BuZbhVbgAFbrpV48rKl6It2SBR0
 A7y/2Hz2wu/nBgE/8Zn59DwXvjOZX8+qXxxGZxpj7ZOuM4Eo8kMWUB1orLGNp1PCU9x5
 BFh/tGV23TGnqnptkXJlIN+4O1iD7ssq9yWSblBivOB4NrCnswRlkrPtCGlMh3cypWmb
 ysQGxBDHuVKM6aoYVt/l1t/PqdHpW2rbZr0yMxbIix15bIE2kQo6Gaz1VPJwVut4i4Us
 AUUg==
X-Gm-Message-State: ACrzQf3S6woj1ZK8VlZW8yvjPO741UyXsq6uKZtvTzCaMzgIcabsyz6R
 42R6Tn0o6JqJrwVQ+19ZcKYPKnjgqe247oVX/ZU=
X-Google-Smtp-Source: AMsMyM4/DwiGisVy0ZgrGxWpll92w1g3TVUNgZ75hbfT9MW3ljDEDgHc09tHzT4RSYTlUxE9kEzr3A==
X-Received: by 2002:a63:a51e:0:b0:439:857:2758 with SMTP id
 n30-20020a63a51e000000b0043908572758mr12086523pgf.105.1664030909037; 
 Sat, 24 Sep 2022 07:48:29 -0700 (PDT)
Received: from roots.. ([112.44.202.252]) by smtp.gmail.com with ESMTPSA id
 jc6-20020a17090325c600b00176b63535adsm7839024plb.260.2022.09.24.07.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 07:48:28 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Julia Suvorova <jusual@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH] block/io_uring: revert "Use io_uring_register_ring_fd() to
 skip fd operations"
Date: Sat, 24 Sep 2022 22:48:15 +0800
Message-Id: <20220924144815.5591-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1193

The commit "Use io_uring_register_ring_fd() to skip fd operations" broke
when booting a guest with iothread and io_uring. That is because the
io_uring_register_ring_fd() call is made from the main thread instead of
IOThread where io_uring_submit() is called. It can not be guaranteed
to register the ring fd in the correct thread or unregister the same ring
fd if the IOThread is disabled. This optimization is not critical so we
will revert previous commit.

This reverts commit e2848bc574fe2715c694bf8fe9a1ba7f78a1125a
and 77e3f038af1764983087e3551a0fde9951952c4d.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/io_uring.c | 13 +------------
 meson.build      |  1 -
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/block/io_uring.c b/block/io_uring.c
index a1760152e0..973e15d876 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -11,7 +11,6 @@
 #include "qemu/osdep.h"
 #include <liburing.h>
 #include "block/aio.h"
-#include "qemu/error-report.h"
 #include "qemu/queue.h"
 #include "block/block.h"
 #include "block/raw-aio.h"
@@ -19,7 +18,6 @@
 #include "qapi/error.h"
 #include "trace.h"
 
-
 /* io_uring ring size */
 #define MAX_ENTRIES 128
 
@@ -432,17 +430,8 @@ LuringState *luring_init(Error **errp)
     }
 
     ioq_init(&s->io_q);
-#ifdef CONFIG_LIBURING_REGISTER_RING_FD
-    if (io_uring_register_ring_fd(&s->ring) < 0) {
-        /*
-         * Only warn about this error: we will fallback to the non-optimized
-         * io_uring operations.
-         */
-        warn_report("failed to register linux io_uring ring file descriptor");
-    }
-#endif
-
     return s;
+
 }
 
 void luring_cleanup(LuringState *s)
diff --git a/meson.build b/meson.build
index 3885fc1076..63cfb844cf 100644
--- a/meson.build
+++ b/meson.build
@@ -1793,7 +1793,6 @@ config_host_data.set('CONFIG_LIBNFS', libnfs.found())
 config_host_data.set('CONFIG_LIBSSH', libssh.found())
 config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
 config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
-config_host_data.set('CONFIG_LIBURING_REGISTER_RING_FD', cc.has_function('io_uring_register_ring_fd', prefix: '#include <liburing.h>', dependencies:linux_io_uring))
 config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
 config_host_data.set('CONFIG_NUMA', numa.found())
 config_host_data.set('CONFIG_OPENGL', opengl.found())
-- 
2.37.3


