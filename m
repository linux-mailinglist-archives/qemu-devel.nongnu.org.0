Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A7C6DCAB2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 20:23:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plw8x-0002km-HM; Mon, 10 Apr 2023 14:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8g-0002fI-I6
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:16 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8e-0000h3-VW
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:14 -0400
Received: by mail-il1-x129.google.com with SMTP id b7so1324346ilm.4
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 11:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681150871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jwIHVc41F1vGdAlrXUv6Uz16Se8rtJQuutqsrYhY8XA=;
 b=fvbhl8vXqM6FIhTEfPcJfhKFBzZR3ayJJjO8MudSQPRKuu5FFIL3JI6F9rBUThjuVE
 7wBYV44HeoQI+NQX+ozUu5tv+kv0K3ghXvBNiZM/T4lgioNvwVDA0HAjrWGRtAqGoSj5
 NWDr6iaPF/i9IUgDvoDUz5/tgcszKjqEVMsJwKPuykGf0tXaTO+jJqRVqBbDqCOPD+wi
 fRUxEpurH3CuFIVvgZMnnK6EuZqeKGLvDh5JfldgunDIRu79QQn3W2HR6LHbwxn0+Dn/
 tLiQJ3jnnyqAW/WHLcLjqF+70CBnhu3t+Pznmj8SLHAMIFu0+pmLZcRpp7PNUkMF/3qU
 CkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681150871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jwIHVc41F1vGdAlrXUv6Uz16Se8rtJQuutqsrYhY8XA=;
 b=sOnjXtth0myJeFpKbAqxlAtpa7gjMKcYg8J3GOoClUjkBw/EkS0JvZaJwVVIyC1CxL
 ZhesEAKH7X8mfoKT/S5vuWOhFNjdOkmzDU7b+PmiuxhrHuVR0zMvCbWTRIU8e6hVtRTN
 BjoWdO6KCkAXhMLYrEQZwWpWKXC9UAjJ1cTYGIBKLfA0ZM3BKNNkhgk4wACsEpsH6vuh
 TyGnJKvEghDsTIRsEfx5iNF/IQJILrnoz5UowyQe2WDd5K9nCbLkJ1iAiPc4y9sNTOCr
 2fiM/EdZZZsnHM6cLUwA4JpI3Mp63RL4TsUePpyqUYbzHfSi/6I3jHpHOSTe+9VI2gvw
 BOCg==
X-Gm-Message-State: AAQBX9dNtRbQ3CZJIZTZfVxZeYOa6ywEfj0tmfyQajbhruHgQgYXAjM4
 ukf9nSrAcXfzy2O7Yx5HGNMq+Y7zdoAZ3F/gKMU=
X-Google-Smtp-Source: AKy350a7+aKeBoLhvzGushb7NonfJOF5ESOAh30XWgRY8mocwkavzGZj5kRw5OmN2dw6p0kI0AEIkQ==
X-Received: by 2002:a92:c501:0:b0:325:b96e:6709 with SMTP id
 r1-20020a92c501000000b00325b96e6709mr7475087ilg.11.1681150871392; 
 Mon, 10 Apr 2023 11:21:11 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 a15-20020a056e02120f00b00313b281ecd2sm3104314ilq.70.2023.04.10.11.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 11:21:11 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@jrtc27.com, riastradh@netbsd.org, Kyle Evans <kevans@freebsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, reinoud@netbsd.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 07/19] bsd-user: Move system call include to os-syscall.h
Date: Mon, 10 Apr 2023 12:20:44 -0600
Message-Id: <20230410182056.320-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410182056.320-1-imp@bsdimp.com>
References: <20230410182056.320-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


