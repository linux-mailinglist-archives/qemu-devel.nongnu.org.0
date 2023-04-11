Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C139E6DE1FF
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:12:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmHW2-0003rv-Ly; Tue, 11 Apr 2023 13:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVs-0003qa-75
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:37 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVp-00068f-53
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:35 -0400
Received: by mail-io1-xd30.google.com with SMTP id x3so15802743iov.3
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 10:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681233031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yuaGwqi8yehJHqn9QWm7paJs7txwchU6M9DMK57E1Ps=;
 b=0+GsBIZsYmNWHWWk410dUKkZXzs5nBeMkIRgdykQFxMmV9MVHnkGWIVlE0ZVuzehFM
 TUijoMncMIphLinh4bZlpbp3XFB8PN7nvHgYbz8VhzXA0XlK4m2HYlz8B5QWE18fxpOr
 XZGz9xQspGBlb/TJqWPk+P6UcowREGCMUu28MnxY8ebs2U4D/wMu7BjApczc/L6JuvKE
 Q6LS2WiAx9p3nbxZXIF379ZnQ9odiiT6J78yUsopPmcpKAaIPTijdyKLf/RcGbJoEJ02
 ydls1Ec82VEor2CSERd+5SH+HQCzFHHueHoti82YOIikAfLuDR3yq7gNGEa0IC7w1vcO
 S/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681233031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yuaGwqi8yehJHqn9QWm7paJs7txwchU6M9DMK57E1Ps=;
 b=UoPrN2qPWCvtvSDcZQJjhr5dnv5zW2zid1WZktbcaSpUs/x3MtMrI8Djck6MHXO1Ts
 oLHFEMRz4r2u85sIfMN+ZvciJEJs6OAD4voV4vlY0sh2j85Bn/zILihVtB9Tf7jqFPuB
 cBxK0pyIP5aK3p+syNJbPfFq8c/lqTuCJIyrYY3JUKAiIuORk7Y2l+oU99JDk5Eh1oTS
 18Rv0Z1yM6w8Ka1loHWZXmS5/wTtFvpxMLZgS0d4yCPzjZdd0zBwOuCFIHn4o/BCg/Zg
 Z06dcjwTnfXnsSpGWDuwt8MYGELwFrUMQ6hqbfYAMGbrVlq5Drh6iyP7JgtK6gBgrC6d
 NNQA==
X-Gm-Message-State: AAQBX9cZq6iu0o9/kbCeOKHiz0eWbb3FneFmMJoIWRiiERvvIh1MtdlY
 YJOs5u/f4O37ekmjY2CI/VjdMJ3o50Cfxb2VQK8=
X-Google-Smtp-Source: AKy350YohwN5VBOhgFy0W5yZc5eijCi+mJ4Dxx0gTrl685yYThFcaKE/VPr3y1v82vUoaKkgTD1doA==
X-Received: by 2002:a05:6602:2211:b0:759:1e12:ba32 with SMTP id
 n17-20020a056602221100b007591e12ba32mr6583335ion.4.1681233031505; 
 Tue, 11 Apr 2023 10:10:31 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 d36-20020a0285a7000000b0040b11b7ef54sm4140942jai.39.2023.04.11.10.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 10:10:31 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: ryoon@netbsd.org, kevans@freebsd.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, riastradh@netbsd.org, brad@comstyle.com,
 reinoud@netbsd.org, jrtc27@jrtc27.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 09/20] bsd-user: h2g_rusage
Date: Tue, 11 Apr 2023 11:09:44 -0600
Message-Id: <20230411170955.17358-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230411170955.17358-1-imp@bsdimp.com>
References: <20230411170955.17358-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
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

From: Stacey Son <sson@FreeBSD.org>

Converts host's rusage to the guest's rusage.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsd-proc.c  | 48 ++++++++++++++++++++++++++++++++++++++++++++
 bsd-user/meson.build |  1 +
 bsd-user/qemu-bsd.h  | 30 +++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 bsd-user/bsd-proc.c
 create mode 100644 bsd-user/qemu-bsd.h

diff --git a/bsd-user/bsd-proc.c b/bsd-user/bsd-proc.c
new file mode 100644
index 00000000000..e64eb958947
--- /dev/null
+++ b/bsd-user/bsd-proc.c
@@ -0,0 +1,48 @@
+/*
+ *  BSD process related system call helpers
+ *
+ *  Copyright (c) 2013-14 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#include "qemu/osdep.h"
+
+#include "qemu.h"
+#include "qemu-bsd.h"
+#include "signal-common.h"
+
+void h2g_rusage(const struct rusage *rusage,
+                struct target_freebsd_rusage *target_rusage)
+{
+    __put_user(rusage->ru_utime.tv_sec, &target_rusage->ru_utime.tv_sec);
+    __put_user(rusage->ru_utime.tv_usec, &target_rusage->ru_utime.tv_usec);
+
+    __put_user(rusage->ru_stime.tv_sec, &target_rusage->ru_stime.tv_sec);
+    __put_user(rusage->ru_stime.tv_usec, &target_rusage->ru_stime.tv_usec);
+
+    __put_user(rusage->ru_maxrss, &target_rusage->ru_maxrss);
+    __put_user(rusage->ru_idrss, &target_rusage->ru_idrss);
+    __put_user(rusage->ru_idrss, &target_rusage->ru_idrss);
+    __put_user(rusage->ru_isrss, &target_rusage->ru_isrss);
+    __put_user(rusage->ru_minflt, &target_rusage->ru_minflt);
+    __put_user(rusage->ru_majflt, &target_rusage->ru_majflt);
+    __put_user(rusage->ru_nswap, &target_rusage->ru_nswap);
+    __put_user(rusage->ru_inblock, &target_rusage->ru_inblock);
+    __put_user(rusage->ru_oublock, &target_rusage->ru_oublock);
+    __put_user(rusage->ru_msgsnd, &target_rusage->ru_msgsnd);
+    __put_user(rusage->ru_msgrcv, &target_rusage->ru_msgrcv);
+    __put_user(rusage->ru_nsignals, &target_rusage->ru_nsignals);
+    __put_user(rusage->ru_nvcsw, &target_rusage->ru_nvcsw);
+    __put_user(rusage->ru_nivcsw, &target_rusage->ru_nivcsw);
+}
diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 5243122fc56..7d1b4de78b1 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -8,6 +8,7 @@ common_user_inc += include_directories('include')
 
 bsd_user_ss.add(files(
   'bsdload.c',
+  'bsd-proc.c',
   'elfload.c',
   'main.c',
   'mmap.c',
diff --git a/bsd-user/qemu-bsd.h b/bsd-user/qemu-bsd.h
new file mode 100644
index 00000000000..96e7f34b27c
--- /dev/null
+++ b/bsd-user/qemu-bsd.h
@@ -0,0 +1,30 @@
+/*
+ *  BSD conversion extern declarations
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef QEMU_BSD_H
+#define QEMU_BSD_H
+
+#include <sys/types.h>
+#include <sys/resource.h>
+
+/* bsd-proc.c */
+void h2g_rusage(const struct rusage *rusage,
+        struct target_freebsd_rusage *target_rusage);
+
+#endif /* QEMU_BSD_H */
-- 
2.40.0


