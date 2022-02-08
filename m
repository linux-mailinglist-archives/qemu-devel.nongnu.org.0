Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0690C4AE2A3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 21:42:44 +0100 (CET)
Received: from localhost ([::1]:38020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHXJx-00055d-4E
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 15:42:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHWna-00033B-5R
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 15:09:18 -0500
Received: from [2a00:1450:4864:20::32e] (port=54789
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHWnT-00066j-5X
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 15:09:12 -0500
Received: by mail-wm1-x32e.google.com with SMTP id c192so47564wma.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 12:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ETqgvEp+BK5IeQcaommUlEe8fKOhJ00KVNdgTbqltH8=;
 b=U1VpaWHhRQNMbt1U6lyGf2VMPrnhc7HKy3/HXFDyPRLDCCvck1COXPz4picyc/6I5i
 oxUL64BXGVvUz0UoSi+8VyNXiKvd4Rtdqu+zg0ryXqD4zECjWEweAPstt2IPNBtxejpP
 LqErd5ngjHAMXCdi6TaR2tQNBH37BWVQH9X52vMw2i+L24V+g0oh2bCqmiCexq5UyTF/
 Pxg3V3voL1cYQa7uM0MM8xlYb72IR+VbMDEYnCvqLK9SMtLYvwTZuVVnyQhhXO19G6cL
 Ih55fv+UOMgo6DwOaNmATOw8lObSuoGXrmepMUW3rdRkM4cfig6kPP0iaR2XQG3GCkJ5
 BSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ETqgvEp+BK5IeQcaommUlEe8fKOhJ00KVNdgTbqltH8=;
 b=1aH2WQUxEIucEubPb66J9P6tdF/wUTz03/g28kCDOTI1UGKd5aYL9TjHBPn4hV9UvE
 ZJgbLSqvNaY4aohZS4fC1nylQaCcsf464Zvl0uZtVNnx3TLW3CCkA7Zy/KAokG9VtHRS
 90lhOPGJyhXW+5Gui2QcKjdpOPXa00bRKkqVUfCfLGwWVRWkXXQZtiPtDv7GOvf44tMQ
 obDvLH+luunk9va+jff4lsjKj8T6e4XuFGp2ChvU9zYeYyt5SVVv5NKcCG5XCN6GC64s
 /tXdWXCaorwcHaOx+JplcBJrjYf6fK9g/EMQwzeIUTDaBUBfpdSy02dy/h0tlkjO4LbN
 nggA==
X-Gm-Message-State: AOAM532mVqma78uGv3p2muHZX82CfyVTYANkpooGoberKbszinUoTKMV
 tNgHD6u5iI/oX9qRjotq1AZGJD/PJpGs2w==
X-Google-Smtp-Source: ABdhPJz9jMpb2BOJE5cXPc7WJBGVbogPcti26APqZcSNzEkx3cohu9a5YM43ejVmQ9gs2lcD9IFvVg==
X-Received: by 2002:a05:600c:3488:: with SMTP id
 a8mr2400179wmq.173.1644350941348; 
 Tue, 08 Feb 2022 12:09:01 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r2sm4098170wmq.24.2022.02.08.12.09.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 12:09:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] include: Move qemu_[id]cache_* declarations to new
 qemu/cacheinfo.h
Date: Tue,  8 Feb 2022 20:08:55 +0000
Message-Id: <20220208200856.3558249-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208200856.3558249-1-peter.maydell@linaro.org>
References: <20220208200856.3558249-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

The qemu_icache_linesize, qemu_icache_linesize_log,
qemu_dcache_linesize, and qemu_dcache_linesize_log variables are not
used in many files.  Move them out of osdep.h to a new
qemu/cacheinfo.h, and document them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/cacheinfo.h  | 21 +++++++++++++++++++++
 include/qemu/osdep.h      |  5 -----
 accel/tcg/translate-all.c |  1 +
 plugins/loader.c          |  1 +
 tcg/region.c              |  1 +
 tcg/tcg.c                 |  1 +
 util/atomic64.c           |  1 +
 util/cacheflush.c         |  1 +
 util/cacheinfo.c          |  1 +
 9 files changed, 28 insertions(+), 5 deletions(-)
 create mode 100644 include/qemu/cacheinfo.h

diff --git a/include/qemu/cacheinfo.h b/include/qemu/cacheinfo.h
new file mode 100644
index 00000000000..019a157ea08
--- /dev/null
+++ b/include/qemu/cacheinfo.h
@@ -0,0 +1,21 @@
+/*
+ * QEMU host cacheinfo information
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QEMU_CACHEINFO_H
+#define QEMU_CACHEINFO_H
+
+/*
+ * These variables represent our best guess at the host icache and
+ * dcache sizes, expressed both as the size in bytes and as the
+ * base-2 log of the size in bytes. They are initialized at startup
+ * (via an attribute 'constructor' function).
+ */
+extern int qemu_icache_linesize;
+extern int qemu_icache_linesize_log;
+extern int qemu_dcache_linesize;
+extern int qemu_dcache_linesize_log;
+
+#endif
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 0715d6b4509..e36f62a254e 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -616,11 +616,6 @@ pid_t qemu_fork(Error **errp);
 extern uintptr_t qemu_real_host_page_size;
 extern intptr_t qemu_real_host_page_mask;
 
-extern int qemu_icache_linesize;
-extern int qemu_icache_linesize_log;
-extern int qemu_dcache_linesize;
-extern int qemu_dcache_linesize_log;
-
 /*
  * After using getopt or getopt_long, if you need to parse another set
  * of options, then you must reset optind.  Unfortunately the way to
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index bd71db59a9a..5971cd53ab9 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -51,6 +51,7 @@
 #include "qemu/qemu-print.h"
 #include "qemu/timer.h"
 #include "qemu/main-loop.h"
+#include "qemu/cacheinfo.h"
 #include "exec/log.h"
 #include "sysemu/cpus.h"
 #include "sysemu/cpu-timers.h"
diff --git a/plugins/loader.c b/plugins/loader.c
index a4ec2816922..4883b0a1cbc 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -24,6 +24,7 @@
 #include "qemu/rcu_queue.h"
 #include "qemu/qht.h"
 #include "qemu/bitmap.h"
+#include "qemu/cacheinfo.h"
 #include "qemu/xxhash.h"
 #include "qemu/plugin.h"
 #include "hw/core/cpu.h"
diff --git a/tcg/region.c b/tcg/region.c
index 7b4e65a52e8..72afb357389 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -26,6 +26,7 @@
 #include "qemu/units.h"
 #include "qemu/madvise.h"
 #include "qemu/mprotect.h"
+#include "qemu/cacheinfo.h"
 #include "qapi/error.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5d2f0d8b103..528277d1d3c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -36,6 +36,7 @@
 #include "qemu/qemu-print.h"
 #include "qemu/timer.h"
 #include "qemu/cacheflush.h"
+#include "qemu/cacheinfo.h"
 
 /* Note: the long term plan is to reduce the dependencies on the QEMU
    CPU definitions. Currently they are used for qemu_ld/st
diff --git a/util/atomic64.c b/util/atomic64.c
index 93037d5b116..db2c7f0fd0e 100644
--- a/util/atomic64.c
+++ b/util/atomic64.c
@@ -7,6 +7,7 @@
 #include "qemu/osdep.h"
 #include "qemu/atomic.h"
 #include "qemu/thread.h"
+#include "qemu/cacehinfo.h"
 
 #ifdef CONFIG_ATOMIC64
 #error This file must only be compiled if !CONFIG_ATOMIC64
diff --git a/util/cacheflush.c b/util/cacheflush.c
index 933355b0c99..4b57186d89c 100644
--- a/util/cacheflush.c
+++ b/util/cacheflush.c
@@ -7,6 +7,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/cacheflush.h"
+#include "qemu/cacheinfo.h"
 #include "qemu/bitops.h"
 
 
diff --git a/util/cacheinfo.c b/util/cacheinfo.c
index b182f0b6936..ab1644d490f 100644
--- a/util/cacheinfo.c
+++ b/util/cacheinfo.c
@@ -9,6 +9,7 @@
 #include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "qemu/atomic.h"
+#include "qemu/cacheinfo.h"
 
 int qemu_icache_linesize = 0;
 int qemu_icache_linesize_log;
-- 
2.25.1


