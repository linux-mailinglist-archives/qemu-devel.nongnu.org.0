Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 187094BD8D2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:59:56 +0100 (CET)
Received: from localhost ([::1]:37946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5U3-0003bX-5r
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:59:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zZ-0008Jp-Fx
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:25 -0500
Received: from [2a00:1450:4864:20::32b] (port=46857
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zQ-00012V-S1
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:19 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so1664211wmp.5
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2qmZ+jadiCTJxwUfXjizFQ9g4vcYxHdDX3ngiXpe96w=;
 b=OU2xvp+tZ9i0pKLIZJGiq9fBMKeEvl+n75ygpeF5R23sb3KvhioWK7e+upNklUiawv
 ib1FN/PhdgKjrypOj4zkIgZddbsUdfPizLgcFZx/Oejs16C3tujtvETMXDd2Xzw9XWKM
 LwZaSXjJ3+W3xIoAPgI8jI5AJ4adndYMYX0QQyhl19czGKjHsjFdx9v/KsN3ExmSr/RS
 YTLo1t8UF3u/55zGha5lrKyd2IYuZiiBtdaJxe/OajHKXuvQxFu8E6QEGib2UIPNIZrV
 XQbSGHFY7Qic1CMXr9QZaXXWpp0KXWTTZVyTfs0mWUdDLM/m8/oyl4fsZdlWNgZzIRFU
 /iOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2qmZ+jadiCTJxwUfXjizFQ9g4vcYxHdDX3ngiXpe96w=;
 b=C5hwJLxjtAO17gpd/p4uJ15c7xriJd12SuBAgLRlIshJjTdJ3myf8VufruWxYfFS+E
 3WlM2gtvERhyAPOXnNajg8XYulhf2J5Fcrc/o6uKU8F/Oj8Thyj3Cp4iPLas+vgCIFW8
 nJca2z21pukyf4pDFNeuZiNVoSVQgXcC349E5Pqt4vzGOBjDQprQD/NW6c+wGVWYFslS
 CIZPQ1N8PB5pHHto0LB+3l8BhQRDn81lEr33HgZlUTwK/bJdw7vG4yzTXxzsJVySqJ8K
 YLDtD3ddWr3UrwyJ/HqMnYFz5UCeVoKmcZ5LfUh+jVilc8jMk1QwAJPyXgB2ihxfx4KC
 wytA==
X-Gm-Message-State: AOAM531omXayBT0fL99X5jkW6/0DuN5Ef5a0fdcmpCQACdIEHh2x62PE
 ucLSZ9njTzJu47T1uyvBGYyZt+R1pouHNQ==
X-Google-Smtp-Source: ABdhPJw48NLykVIZ5b63QIzbr0Dvt9a+69Nqy1ZV6j8Y5S577vCZhL9GNWNRfNPC0r62DtedsFyLyg==
X-Received: by 2002:a05:600c:14d5:b0:37c:2f5d:a396 with SMTP id
 i21-20020a05600c14d500b0037c2f5da396mr19863687wmh.77.1645435695545; 
 Mon, 21 Feb 2022 01:28:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/26] include: Move qemu_madvise() and related #defines to new
 qemu/madvise.h
Date: Mon, 21 Feb 2022 09:27:50 +0000
Message-Id: <20220221092800.404870-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The function qemu_madvise() and the QEMU_MADV_* constants associated
with it are used in only 10 files.  Move them out of osdep.h to a new
qemu/madvise.h header that is included where it is needed.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220208200856.3558249-2-peter.maydell@linaro.org
---
 include/qemu/madvise.h     | 95 ++++++++++++++++++++++++++++++++++++++
 include/qemu/osdep.h       | 82 --------------------------------
 backends/hostmem-file.c    |  1 +
 backends/hostmem.c         |  1 +
 hw/virtio/virtio-balloon.c |  1 +
 migration/postcopy-ram.c   |  1 +
 migration/qemu-file.c      |  1 +
 migration/ram.c            |  1 +
 softmmu/physmem.c          |  1 +
 tcg/region.c               |  1 +
 util/osdep.c               |  1 +
 util/oslib-posix.c         |  1 +
 12 files changed, 105 insertions(+), 82 deletions(-)
 create mode 100644 include/qemu/madvise.h

diff --git a/include/qemu/madvise.h b/include/qemu/madvise.h
new file mode 100644
index 00000000000..e155f59a0df
--- /dev/null
+++ b/include/qemu/madvise.h
@@ -0,0 +1,95 @@
+/*
+ * QEMU madvise wrapper functions
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_MADVISE_H
+#define QEMU_MADVISE_H
+
+#define QEMU_MADV_INVALID -1
+
+#if defined(CONFIG_MADVISE)
+
+#define QEMU_MADV_WILLNEED  MADV_WILLNEED
+#define QEMU_MADV_DONTNEED  MADV_DONTNEED
+#ifdef MADV_DONTFORK
+#define QEMU_MADV_DONTFORK  MADV_DONTFORK
+#else
+#define QEMU_MADV_DONTFORK  QEMU_MADV_INVALID
+#endif
+#ifdef MADV_MERGEABLE
+#define QEMU_MADV_MERGEABLE MADV_MERGEABLE
+#else
+#define QEMU_MADV_MERGEABLE QEMU_MADV_INVALID
+#endif
+#ifdef MADV_UNMERGEABLE
+#define QEMU_MADV_UNMERGEABLE MADV_UNMERGEABLE
+#else
+#define QEMU_MADV_UNMERGEABLE QEMU_MADV_INVALID
+#endif
+#ifdef MADV_DODUMP
+#define QEMU_MADV_DODUMP MADV_DODUMP
+#else
+#define QEMU_MADV_DODUMP QEMU_MADV_INVALID
+#endif
+#ifdef MADV_DONTDUMP
+#define QEMU_MADV_DONTDUMP MADV_DONTDUMP
+#else
+#define QEMU_MADV_DONTDUMP QEMU_MADV_INVALID
+#endif
+#ifdef MADV_HUGEPAGE
+#define QEMU_MADV_HUGEPAGE MADV_HUGEPAGE
+#else
+#define QEMU_MADV_HUGEPAGE QEMU_MADV_INVALID
+#endif
+#ifdef MADV_NOHUGEPAGE
+#define QEMU_MADV_NOHUGEPAGE MADV_NOHUGEPAGE
+#else
+#define QEMU_MADV_NOHUGEPAGE QEMU_MADV_INVALID
+#endif
+#ifdef MADV_REMOVE
+#define QEMU_MADV_REMOVE MADV_REMOVE
+#else
+#define QEMU_MADV_REMOVE QEMU_MADV_DONTNEED
+#endif
+#ifdef MADV_POPULATE_WRITE
+#define QEMU_MADV_POPULATE_WRITE MADV_POPULATE_WRITE
+#else
+#define QEMU_MADV_POPULATE_WRITE QEMU_MADV_INVALID
+#endif
+
+#elif defined(CONFIG_POSIX_MADVISE)
+
+#define QEMU_MADV_WILLNEED  POSIX_MADV_WILLNEED
+#define QEMU_MADV_DONTNEED  POSIX_MADV_DONTNEED
+#define QEMU_MADV_DONTFORK  QEMU_MADV_INVALID
+#define QEMU_MADV_MERGEABLE QEMU_MADV_INVALID
+#define QEMU_MADV_UNMERGEABLE QEMU_MADV_INVALID
+#define QEMU_MADV_DODUMP QEMU_MADV_INVALID
+#define QEMU_MADV_DONTDUMP QEMU_MADV_INVALID
+#define QEMU_MADV_HUGEPAGE  QEMU_MADV_INVALID
+#define QEMU_MADV_NOHUGEPAGE  QEMU_MADV_INVALID
+#define QEMU_MADV_REMOVE QEMU_MADV_DONTNEED
+#define QEMU_MADV_POPULATE_WRITE QEMU_MADV_INVALID
+
+#else /* no-op */
+
+#define QEMU_MADV_WILLNEED  QEMU_MADV_INVALID
+#define QEMU_MADV_DONTNEED  QEMU_MADV_INVALID
+#define QEMU_MADV_DONTFORK  QEMU_MADV_INVALID
+#define QEMU_MADV_MERGEABLE QEMU_MADV_INVALID
+#define QEMU_MADV_UNMERGEABLE QEMU_MADV_INVALID
+#define QEMU_MADV_DODUMP QEMU_MADV_INVALID
+#define QEMU_MADV_DONTDUMP QEMU_MADV_INVALID
+#define QEMU_MADV_HUGEPAGE  QEMU_MADV_INVALID
+#define QEMU_MADV_NOHUGEPAGE  QEMU_MADV_INVALID
+#define QEMU_MADV_REMOVE QEMU_MADV_INVALID
+#define QEMU_MADV_POPULATE_WRITE QEMU_MADV_INVALID
+
+#endif
+
+int qemu_madvise(void *addr, size_t len, int advice);
+
+#endif
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index ce12f64853e..5ebd737aebb 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -425,87 +425,6 @@ static inline void qemu_cleanup_generic_vfree(void *p)
 #define QEMU_MAP_NORESERVE  (1 << 3)
 
 
-#define QEMU_MADV_INVALID -1
-
-#if defined(CONFIG_MADVISE)
-
-#define QEMU_MADV_WILLNEED  MADV_WILLNEED
-#define QEMU_MADV_DONTNEED  MADV_DONTNEED
-#ifdef MADV_DONTFORK
-#define QEMU_MADV_DONTFORK  MADV_DONTFORK
-#else
-#define QEMU_MADV_DONTFORK  QEMU_MADV_INVALID
-#endif
-#ifdef MADV_MERGEABLE
-#define QEMU_MADV_MERGEABLE MADV_MERGEABLE
-#else
-#define QEMU_MADV_MERGEABLE QEMU_MADV_INVALID
-#endif
-#ifdef MADV_UNMERGEABLE
-#define QEMU_MADV_UNMERGEABLE MADV_UNMERGEABLE
-#else
-#define QEMU_MADV_UNMERGEABLE QEMU_MADV_INVALID
-#endif
-#ifdef MADV_DODUMP
-#define QEMU_MADV_DODUMP MADV_DODUMP
-#else
-#define QEMU_MADV_DODUMP QEMU_MADV_INVALID
-#endif
-#ifdef MADV_DONTDUMP
-#define QEMU_MADV_DONTDUMP MADV_DONTDUMP
-#else
-#define QEMU_MADV_DONTDUMP QEMU_MADV_INVALID
-#endif
-#ifdef MADV_HUGEPAGE
-#define QEMU_MADV_HUGEPAGE MADV_HUGEPAGE
-#else
-#define QEMU_MADV_HUGEPAGE QEMU_MADV_INVALID
-#endif
-#ifdef MADV_NOHUGEPAGE
-#define QEMU_MADV_NOHUGEPAGE MADV_NOHUGEPAGE
-#else
-#define QEMU_MADV_NOHUGEPAGE QEMU_MADV_INVALID
-#endif
-#ifdef MADV_REMOVE
-#define QEMU_MADV_REMOVE MADV_REMOVE
-#else
-#define QEMU_MADV_REMOVE QEMU_MADV_DONTNEED
-#endif
-#ifdef MADV_POPULATE_WRITE
-#define QEMU_MADV_POPULATE_WRITE MADV_POPULATE_WRITE
-#else
-#define QEMU_MADV_POPULATE_WRITE QEMU_MADV_INVALID
-#endif
-
-#elif defined(CONFIG_POSIX_MADVISE)
-
-#define QEMU_MADV_WILLNEED  POSIX_MADV_WILLNEED
-#define QEMU_MADV_DONTNEED  POSIX_MADV_DONTNEED
-#define QEMU_MADV_DONTFORK  QEMU_MADV_INVALID
-#define QEMU_MADV_MERGEABLE QEMU_MADV_INVALID
-#define QEMU_MADV_UNMERGEABLE QEMU_MADV_INVALID
-#define QEMU_MADV_DODUMP QEMU_MADV_INVALID
-#define QEMU_MADV_DONTDUMP QEMU_MADV_INVALID
-#define QEMU_MADV_HUGEPAGE  QEMU_MADV_INVALID
-#define QEMU_MADV_NOHUGEPAGE  QEMU_MADV_INVALID
-#define QEMU_MADV_REMOVE QEMU_MADV_DONTNEED
-#define QEMU_MADV_POPULATE_WRITE QEMU_MADV_INVALID
-
-#else /* no-op */
-
-#define QEMU_MADV_WILLNEED  QEMU_MADV_INVALID
-#define QEMU_MADV_DONTNEED  QEMU_MADV_INVALID
-#define QEMU_MADV_DONTFORK  QEMU_MADV_INVALID
-#define QEMU_MADV_MERGEABLE QEMU_MADV_INVALID
-#define QEMU_MADV_UNMERGEABLE QEMU_MADV_INVALID
-#define QEMU_MADV_DODUMP QEMU_MADV_INVALID
-#define QEMU_MADV_DONTDUMP QEMU_MADV_INVALID
-#define QEMU_MADV_HUGEPAGE  QEMU_MADV_INVALID
-#define QEMU_MADV_NOHUGEPAGE  QEMU_MADV_INVALID
-#define QEMU_MADV_REMOVE QEMU_MADV_INVALID
-#define QEMU_MADV_POPULATE_WRITE QEMU_MADV_INVALID
-
-#endif
 
 #ifdef _WIN32
 #define HAVE_CHARDEV_SERIAL 1
@@ -577,7 +496,6 @@ void sigaction_invoke(struct sigaction *action,
                       struct qemu_signalfd_siginfo *info);
 #endif
 
-int qemu_madvise(void *addr, size_t len, int advice);
 int qemu_mprotect_rw(void *addr, size_t size);
 int qemu_mprotect_rwx(void *addr, size_t size);
 int qemu_mprotect_none(void *addr, size_t size);
diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index cd038024fae..25141283c4a 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -14,6 +14,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "qemu/madvise.h"
 #include "sysemu/hostmem.h"
 #include "qom/object_interfaces.h"
 #include "qom/object.h"
diff --git a/backends/hostmem.c b/backends/hostmem.c
index 4c05862ed5a..b2a5e905e86 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -19,6 +19,7 @@
 #include "qemu/config-file.h"
 #include "qom/object_interfaces.h"
 #include "qemu/mmap-alloc.h"
+#include "qemu/madvise.h"
 
 #ifdef CONFIG_NUMA
 #include <numaif.h>
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 9a4f491b54d..e6c1b0aa46f 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -17,6 +17,7 @@
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
+#include "qemu/madvise.h"
 #include "hw/virtio/virtio.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/qdev-properties.h"
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index e662dd05ccf..2a2cc5faf8f 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -18,6 +18,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/rcu.h"
+#include "qemu/madvise.h"
 #include "exec/target_page.h"
 #include "migration.h"
 #include "qemu-file.h"
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 6338d8e2ff5..1479cddad94 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -23,6 +23,7 @@
  */
 #include "qemu/osdep.h"
 #include <zlib.h>
+#include "qemu/madvise.h"
 #include "qemu/error-report.h"
 #include "qemu/iov.h"
 #include "migration.h"
diff --git a/migration/ram.c b/migration/ram.c
index 91ca743ac88..781f0745dc0 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -30,6 +30,7 @@
 #include "qemu/cutils.h"
 #include "qemu/bitops.h"
 #include "qemu/bitmap.h"
+#include "qemu/madvise.h"
 #include "qemu/main-loop.h"
 #include "xbzrle.h"
 #include "ram.h"
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index dddf70edf5d..a13289a594a 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -23,6 +23,7 @@
 
 #include "qemu/cutils.h"
 #include "qemu/cacheflush.h"
+#include "qemu/madvise.h"
 
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
diff --git a/tcg/region.c b/tcg/region.c
index 9cc30d49225..c46021d1604 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/madvise.h"
 #include "qapi/error.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
diff --git a/util/osdep.c b/util/osdep.c
index 67fbf227789..8c5cd6e4316 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -38,6 +38,7 @@ extern int madvise(char *, size_t, int);
 #include "qemu/cutils.h"
 #include "qemu/sockets.h"
 #include "qemu/error-report.h"
+#include "qemu/madvise.h"
 #include "monitor/monitor.h"
 
 static bool fips_enabled = false;
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index ac0dbc2adc2..f2be7321c59 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -36,6 +36,7 @@
 #include "trace.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
+#include "qemu/madvise.h"
 #include "qemu/sockets.h"
 #include "qemu/thread.h"
 #include <libgen.h>
-- 
2.25.1


