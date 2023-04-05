Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D346D89AC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 23:37:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkAoJ-0005QL-2Z; Wed, 05 Apr 2023 17:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAnz-0005Ie-Py
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:36 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAny-0005b5-2J
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:35 -0400
Received: by mail-il1-x133.google.com with SMTP id v5so16952228ilj.4
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 14:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680730592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YADKy9wq15UL6Z5a2q0MBYrk4ZKu0ScqB+QGx/cMSLI=;
 b=8AbaC8/FojNZ8e98gcQbZ4t35sDnzOa3U/1oFsHGXweV7VumnlnvR++4LXyCpG0bQu
 phA8FvCDWveOVyy7KsbKMQXZJ9n1zE5AWa6Y58vmRXmRu3PQJ/C7C//G3iNUi8Fz+/Yf
 cYIfzPJc/elzS4NcoUfHrLlSgZq1u9j5ZL0+fnO/LhVl6EXo5XWafPEHYqVJI4HrRVu3
 BuohtpMqgoQsSKLRmoSS2M0foNW24SBfwMyAPwPKmPHHqccLU35wVPxPMCvTyBa2zBXT
 b+cyotejBOyYs/9UQiUDE2w2WJ1QiIemhMUaWK0QeQxmKhH3DEA52gqc1yOIYObSZTg/
 GVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680730592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YADKy9wq15UL6Z5a2q0MBYrk4ZKu0ScqB+QGx/cMSLI=;
 b=L65zPBxWdwYJ3pIB3zZobdUHrknpRGQ9iyuao5yiNk3Xp7xp022WlZ6VH5RPzFrgdY
 TIn6GiKDrtB0Yon8WNEPLUBCs3NbpxlwKRD+krgcNJvvH9Jz2Q/emV0n57cTn4hikau2
 x1mVrSPOwen41GMbWFA3JRnDKOqGTD4SpI8FK6wiTIYM4tqpiJSvm0gPNxVfe2PNSRO8
 cg9lk2rJNE4EZR90zHFxFpe5xUmD5oTjXaISHhBDaoxaXQocHl6aTO8ebKL/iC5ds7Hq
 dm6NrEABLEhqMeSaUpBYn/uOPlntW+q1vgU4sHaNoQUPJfT8nveDTqBbXoaFTpcqXs9s
 4RAA==
X-Gm-Message-State: AAQBX9eKVzalBKCR+wvInGuUrRLhFyMJgmSo9v6/iXJ7foF7lAgj9geK
 ZZDXafd7gpKWC9rkEbxbu3DZwL/sr0AMt8rHJKg=
X-Google-Smtp-Source: AKy350aRE+9ZHrGzmw5uOGD9gSstaa3NX+8MAnfyBhFxy2voYoRNIWraPw5V3ecE0avwNl+tX0A/AA==
X-Received: by 2002:a92:db10:0:b0:315:3d99:bbd3 with SMTP id
 b16-20020a92db10000000b003153d99bbd3mr5084008iln.8.1680730592478; 
 Wed, 05 Apr 2023 14:36:32 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 i18-20020a926d12000000b003261b6acc8asm4110473ilc.79.2023.04.05.14.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 14:36:32 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, Warner Losh <imp@bsdimp.com>, kevans@freebsd.org,
 Brad Smith <brad@comstyle.com>
Subject: [PATCH 07/16] bsd-user: Move system call include to os-syscall.h
Date: Wed,  5 Apr 2023 15:36:03 -0600
Message-Id: <20230405213612.15942-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405213612.15942-1-imp@bsdimp.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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

Move the include of the system calls to os-syscall.h. Include that from
syscall_defs.h. Use target_time_t and target_suseconds_t instead of the
variant that has _freebsd_ in the name. Define these for OpenBSD and
NetBSD based on comments in the file.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-syscall.h | 21 +++++++++++++++++++++
 bsd-user/netbsd/os-syscall.h  | 16 ++++++++++++++++
 bsd-user/openbsd/os-syscall.h | 16 ++++++++++++++++
 bsd-user/syscall_defs.h       | 33 ++++-----------------------------
 4 files changed, 57 insertions(+), 29 deletions(-)
 create mode 100644 bsd-user/freebsd/os-syscall.h
 create mode 100644 bsd-user/netbsd/os-syscall.h
 create mode 100644 bsd-user/openbsd/os-syscall.h

diff --git a/bsd-user/freebsd/os-syscall.h b/bsd-user/freebsd/os-syscall.h
new file mode 100644
index 00000000000..1f2c0acb1c5
--- /dev/null
+++ b/bsd-user/freebsd/os-syscall.h
@@ -0,0 +1,21 @@
+/*
+ * Copyright (c) 2023 Warner Losh <imp@bsdimp.com>
+ *
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * OS-Specific portion of syscall_defs.h
+ */
+
+#include "freebsd/syscall_nr.h"
+
+/*
+ * FreeBSD uses a 64bits time_t except on i386 so we have to add a special case
+ * here.
+ */
+#if (!defined(TARGET_I386))
+typedef int64_t target_time_t;
+#else
+typedef int32_t target_time_t;
+#endif
+
+typedef abi_long target_suseconds_t;
diff --git a/bsd-user/netbsd/os-syscall.h b/bsd-user/netbsd/os-syscall.h
new file mode 100644
index 00000000000..7507350d8d2
--- /dev/null
+++ b/bsd-user/netbsd/os-syscall.h
@@ -0,0 +1,16 @@
+/*
+ * Copyright (c) 2023 Warner Losh <imp@bsdimp.com>
+ *
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * OS-Specific portion of syscall_defs.h
+ */
+
+#include "netbsd/syscall_nr.h"
+
+/*
+ * time_t seems to be very inconsistly defined for the different *BSD's...
+ *
+ * NetBSD always uses int64_t.
+ */
+typedef int64_t target_time_t;
diff --git a/bsd-user/openbsd/os-syscall.h b/bsd-user/openbsd/os-syscall.h
new file mode 100644
index 00000000000..191a76fa935
--- /dev/null
+++ b/bsd-user/openbsd/os-syscall.h
@@ -0,0 +1,16 @@
+/*
+ * Copyright (c) 2023 Warner Losh <imp@bsdimp.com>
+ *
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * OS-Specific portion of syscall_defs.h
+ */
+
+#include "openbsd/syscall_nr.h"
+
+/*
+ * time_t seems to be very inconsistly defined for the different *BSD's...
+ *
+ * OpenBSD always uses int.
+ */
+typedef int target_time_t;
diff --git a/bsd-user/syscall_defs.h b/bsd-user/syscall_defs.h
index b6d113d24a7..489d3a2e292 100644
--- a/bsd-user/syscall_defs.h
+++ b/bsd-user/syscall_defs.h
@@ -25,30 +25,7 @@
 
 #include "errno_defs.h"
 
-#include "freebsd/syscall_nr.h"
-#include "netbsd/syscall_nr.h"
-#include "openbsd/syscall_nr.h"
-
-/*
- * machine/_types.h
- * or x86/_types.h
- */
-
-/*
- * time_t seems to be very inconsistly defined for the different *BSD's...
- *
- * FreeBSD uses a 64bits time_t except on i386
- * so we have to add a special case here.
- *
- * On NetBSD time_t is always defined as an int64_t.  On OpenBSD time_t
- * is always defined as an int.
- *
- */
-#if (!defined(TARGET_I386))
-typedef int64_t target_freebsd_time_t;
-#else
-typedef int32_t target_freebsd_time_t;
-#endif
+#include "os-syscall.h"
 
 struct target_iovec {
     abi_long iov_base;   /* Starting address */
@@ -98,11 +75,9 @@ struct target_iovec {
  * sys/timex.h
  */
 
-typedef abi_long target_freebsd_suseconds_t;
-
 /* compare to sys/timespec.h */
 struct target_freebsd_timespec {
-    target_freebsd_time_t   tv_sec;     /* seconds */
+    target_time_t   tv_sec;     /* seconds */
     abi_long                tv_nsec;    /* and nanoseconds */
 #if !defined(TARGET_I386) && TARGET_ABI_BITS == 32
     abi_long _pad;
@@ -120,8 +95,8 @@ struct target_freebsd__umtx_time {
 };
 
 struct target_freebsd_timeval {
-    target_freebsd_time_t       tv_sec; /* seconds */
-    target_freebsd_suseconds_t  tv_usec;/* and microseconds */
+    target_time_t       tv_sec; /* seconds */
+    target_suseconds_t  tv_usec;/* and microseconds */
 #if !defined(TARGET_I386) && TARGET_ABI_BITS == 32
     abi_long _pad;
 #endif
-- 
2.40.0


