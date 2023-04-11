Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D59EB6DE1FB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:12:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmHWS-00045i-Gq; Tue, 11 Apr 2023 13:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVs-0003qZ-6n
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:37 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVn-00068F-O8
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:34 -0400
Received: by mail-il1-x12a.google.com with SMTP id j28so3888071ila.0
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 10:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681233029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jwIHVc41F1vGdAlrXUv6Uz16Se8rtJQuutqsrYhY8XA=;
 b=La3vSUs5iC5tB7EzN2mizJAN09znFJdbWUOSmkCVMUy8Aw8s4L0Le+/pt5f/0A6NFp
 w+w/3bTCAwChkLSwhEgnrWJ8lngnJds2iirEe++jLo7yervsfZ4SANpoMjlUtmJ8PBcz
 IgvY7QxISKLWes/5+bT1qFokawLUuoh6CI2qlI59GSFbbMA4HpuCM03XMYa28fXnuakR
 jvP09qIiRzyNTmWgRjPVCK/YHcZcxLA/qxmEL8Uce1WJpIPmp/JXyaxmwGuMMNuZzGC2
 76oFwqj7jnn0T5q+KbSSvpm4+YqwCXKeehReGzarEMFWKukFwiw4JvG3+NOWqVm4XOtE
 Cztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681233029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jwIHVc41F1vGdAlrXUv6Uz16Se8rtJQuutqsrYhY8XA=;
 b=BEIRAwJ8PHYuLSOc8f3Cu/g43SBPJMG7/ZSFIlWqCVoF3KA8fwCQQYY2hXYlPCEFXv
 HEWbGFwsuSTR5lbXRyvtwv5vxY0j2O2+ZS1dcQSDm7QW6PjiLMDr2dQ/fQq6ts8ahzln
 zEVbUxCv0j4WNU1wqs5eyTjFp9zrkGncA2rMFFwpeZEMOybRb4/kHIJlQ8CxncHdlzUx
 hAjb8J72F70jBb3r56hWW8dRDyADtbBZ1LQFpqKhBvN+k9S6HBpWmkm32hVb0zXEgZll
 11qZ48aVpA9Se5+RRHQpIhvTZxD9/WXxic+057TlA7kJV/siRpz2St8eclpeEFGFYb1E
 7AHQ==
X-Gm-Message-State: AAQBX9fYsL/yU2vi8y+x0PLKlEwgIhYNGMYqjWxAqHfBwx42b/0LBtN9
 h3OZ+SXB770UoF9gT3HfAhuVyL+NehYOQTvqhmQ=
X-Google-Smtp-Source: AKy350b4+G3QknlhYDreK2CJk6eDVFjfYc+vI+ohvaCYijV5pgLIahJqjDxjxKpLpCeTsc7TXpaMTQ==
X-Received: by 2002:a92:ce0a:0:b0:328:95de:3549 with SMTP id
 b10-20020a92ce0a000000b0032895de3549mr6069109ilo.9.1681233029514; 
 Tue, 11 Apr 2023 10:10:29 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 d36-20020a0285a7000000b0040b11b7ef54sm4140942jai.39.2023.04.11.10.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 10:10:29 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: ryoon@netbsd.org, kevans@freebsd.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, riastradh@netbsd.org, brad@comstyle.com,
 reinoud@netbsd.org, jrtc27@jrtc27.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 07/20] bsd-user: Move system call include to os-syscall.h
Date: Tue, 11 Apr 2023 11:09:42 -0600
Message-Id: <20230411170955.17358-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230411170955.17358-1-imp@bsdimp.com>
References: <20230411170955.17358-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
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


