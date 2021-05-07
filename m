Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3B4376534
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:32:53 +0200 (CEST)
Received: from localhost ([::1]:40350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lezf2-0002Fx-Mp
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbK-0000RY-Qf
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:02 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:60344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbI-0001Qm-9d
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:02 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CETEG126746;
 Fri, 7 May 2021 12:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=ARpEyzI3y4U8V40/CLSccsjvztc225pgFKz6D2WIVmQ=;
 b=XKi0OzIrubAH99Ru8UUTXqJ+IJ6hEGxsPjz+/20Wyk5OWSbrRgiKmjWh4gNx/v/Cdwky
 69nLiK1B2tEG5vNi1LGctkShm90COoy4D/QBe9tV/IOwAL+oSSqbroAxXBKLmTj+FwPh
 AUrGod0V37Ym6IWbKSYPdCQExpNFOdVTzxjG7udIUiNBT5rcRwMvRbVNeY6EfpaxM9ps
 SL6Yj0RG0anWqNhbIQbmfGNvWaRiKpUGqSUEUG9MJv++xJdCTgudO/lZKi2rPbZxQncU
 /UxHE0qr+SsT4yC1Sge2+XSZQEv3yg/rI6sb0JXxjuq4FDTNOotbxmtPyWPrZsvVcWwp Eg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 38ctjv1cbf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:55 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CFlmb168407;
 Fri, 7 May 2021 12:28:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 38csrh1sxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:55 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 147CPaH6002524;
 Fri, 7 May 2021 12:28:54 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 38csrh1swb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:54 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 147CSqET016385;
 Fri, 7 May 2021 12:28:52 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 May 2021 05:28:52 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 04/22] util: env var helpers
Date: Fri,  7 May 2021 05:25:02 -0700
Message-Id: <1620390320-301716-5-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: VINH-8nMuODkwvsR9W4t5AjVhKvXKvN5
X-Proofpoint-GUID: VINH-8nMuODkwvsR9W4t5AjVhKvXKvN5
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 mlxlogscore=999
 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070085
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=steven.sistare@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add functions for saving fd's and other values in the environment via
setenv, and for reading them back via getenv.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/qemu/env.h | 23 +++++++++++++
 util/env.c         | 99 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 util/meson.build   |  1 +
 3 files changed, 123 insertions(+)
 create mode 100644 include/qemu/env.h
 create mode 100644 util/env.c

diff --git a/include/qemu/env.h b/include/qemu/env.h
new file mode 100644
index 0000000..3dad503
--- /dev/null
+++ b/include/qemu/env.h
@@ -0,0 +1,23 @@
+/*
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef QEMU_ENV_H
+#define QEMU_ENV_H
+
+#define FD_PREFIX "QEMU_FD_"
+
+typedef int (*walkenv_cb)(const char *name, const char *val, void *handle);
+
+int getenv_fd(const char *name);
+void setenv_fd(const char *name, int fd);
+void unsetenv_fd(const char *name);
+void unsetenv_fdv(const char *fmt, ...);
+int walkenv(const char *prefix, walkenv_cb cb, void *handle);
+void printenv(void);
+
+#endif
diff --git a/util/env.c b/util/env.c
new file mode 100644
index 0000000..b09ba05
--- /dev/null
+++ b/util/env.c
@@ -0,0 +1,99 @@
+/*
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/env.h"
+
+static uint64_t getenv_ulong(const char *prefix, const char *name, bool *found)
+{
+    char var[80], *val;
+    uint64_t res;
+
+    snprintf(var, sizeof(var), "%s%s", prefix, name);
+    val = getenv(var);
+    if (val) {
+        *found = true;
+        res = strtol(val, 0, 10);
+    } else {
+        *found = false;
+        res = 0;
+    }
+    return res;
+}
+
+static void setenv_ulong(const char *prefix, const char *name, uint64_t val)
+{
+    char var[80], val_str[80];
+    snprintf(var, sizeof(var), "%s%s", prefix, name);
+    snprintf(val_str, sizeof(val_str), "%"PRIu64, val);
+    setenv(var, val_str, 1);
+}
+
+static void unsetenv_ulong(const char *prefix, const char *name)
+{
+    char var[80];
+    snprintf(var, sizeof(var), "%s%s", prefix, name);
+    unsetenv(var);
+}
+
+int getenv_fd(const char *name)
+{
+    bool found;
+    int fd = getenv_ulong(FD_PREFIX, name, &found);
+    if (!found) {
+        fd = -1;
+    }
+    return fd;
+}
+
+void setenv_fd(const char *name, int fd)
+{
+    setenv_ulong(FD_PREFIX, name, fd);
+}
+
+void unsetenv_fd(const char *name)
+{
+    unsetenv_ulong(FD_PREFIX, name);
+}
+
+void unsetenv_fdv(const char *fmt, ...)
+{
+    va_list args;
+    char buf[80];
+    va_start(args, fmt);
+    vsnprintf(buf, sizeof(buf), fmt, args);
+    va_end(args);
+}
+
+int walkenv(const char *prefix, walkenv_cb cb, void *handle)
+{
+    char *str, name[128];
+    char **envp = environ;
+    size_t prefix_len = strlen(prefix);
+
+    while (*envp) {
+        str = *envp++;
+        if (!strncmp(str, prefix, prefix_len)) {
+            char *val = strchr(str, '=');
+            str += prefix_len;
+            strncpy(name, str, val - str);
+            name[val - str] = 0;
+            if (cb(name, val + 1, handle)) {
+                return 1;
+            }
+        }
+    }
+    return 0;
+}
+
+void printenv(void)
+{
+    char **ptr = environ;
+    while (*ptr) {
+        puts(*ptr++);
+    }
+}
diff --git a/util/meson.build b/util/meson.build
index 510765c..d2d90cc 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -22,6 +22,7 @@ util_ss.add(files('host-utils.c'))
 util_ss.add(files('bitmap.c', 'bitops.c'))
 util_ss.add(files('fifo8.c'))
 util_ss.add(files('cacheinfo.c', 'cacheflush.c'))
+util_ss.add(files('env.c'))
 util_ss.add(files('error.c', 'qemu-error.c'))
 util_ss.add(files('qemu-print.c'))
 util_ss.add(files('id.c'))
-- 
1.8.3.1


