Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077FD2EAFC3
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:11:41 +0100 (CET)
Received: from localhost ([::1]:38186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwovr-0005vv-Vh
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotX-0003uu-3o
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:16 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:39176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotT-0003k7-Iu
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:14 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FssWh031151;
 Tue, 5 Jan 2021 16:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=8gP3Cuoi56vVvmRr49Ca8yY8Wvgyuq6vkaEtBHde0vY=;
 b=w51m5qPEXW6MkLXZzzpEouJPIM1JfzboOdCwYl9Zt7SsU8HAUwzkVPqYcnaQZx1AgkIH
 3n/MQG/J7lGolBrGNnu3ILtVn17oJd198bjb+Amvzi9U6vhrecKK37gjy7NZfqsn5KMS
 rIwjbi3rloQRbnrb79k2txSzAgLqvsXs7lVk6/801gpJJmEiPQd4t+VNhMLYy8z2Loqz
 kBY22tnzhSHBMPkl8fLLU1FpGUpnAP8qkUQrpdlHkSWWIqWk0xHW8EArueeFhPGK2ZaI
 HYBSJ+jgxQfqgy6vzJE2bxmfZleLLhqKLWnTm0MB1oJYGlFHU2+Hkfss91RaiC00SHLr rw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 35tgsksg3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 05 Jan 2021 16:09:05 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FtKSm175811;
 Tue, 5 Jan 2021 16:09:04 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 35vct61vkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jan 2021 16:09:04 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 105G93ql018506;
 Tue, 5 Jan 2021 16:09:03 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Jan 2021 08:09:03 -0800
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 04/22] util: env var helpers
Date: Tue,  5 Jan 2021 07:41:52 -0800
Message-Id: <1609861330-129855-5-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
References: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=steven.sistare@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
---
 include/qemu/env.h |  27 ++++++++++++
 util/Makefile.objs |   2 +-
 util/env.c         | 119 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 147 insertions(+), 1 deletion(-)
 create mode 100644 include/qemu/env.h
 create mode 100644 util/env.c

diff --git a/include/qemu/env.h b/include/qemu/env.h
new file mode 100644
index 0000000..174f0c7
--- /dev/null
+++ b/include/qemu/env.h
@@ -0,0 +1,27 @@
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
+#define BOOL_PREFIX "QEMU_BOOL_"
+
+typedef int (*walkenv_cb)(const char *name, const char *val, void *handle);
+
+int getenv_fd(const char *name);
+void setenv_fd(const char *name, int fd);
+void unsetenv_fd(const char *name);
+void unsetenv_fdv(const char *fmt, ...);
+bool getenv_bool(const char *name);
+void setenv_bool(const char *name, bool val);
+void unsetenv_bool(const char *name);
+int walkenv(const char *prefix, walkenv_cb cb, void *handle);
+void printenv(void);
+
+#endif
diff --git a/util/Makefile.objs b/util/Makefile.objs
index cc5e371..d357932 100644
--- a/util/Makefile.objs
+++ b/util/Makefile.objs
@@ -1,4 +1,4 @@
-util-obj-y = osdep.o cutils.o unicode.o qemu-timer-common.o
+util-obj-y = osdep.o cutils.o unicode.o qemu-timer-common.o env.o
 util-obj-$(call lnot,$(CONFIG_ATOMIC64)) += atomic64.o
 util-obj-$(CONFIG_POSIX) += aio-posix.o
 util-obj-$(CONFIG_POSIX) += fdmon-poll.o
diff --git a/util/env.c b/util/env.c
new file mode 100644
index 0000000..afaf77f
--- /dev/null
+++ b/util/env.c
@@ -0,0 +1,119 @@
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
+bool getenv_bool(const char *name)
+{
+    bool found;
+    bool val = getenv_ulong(BOOL_PREFIX, name, &found);
+    if (!found) {
+        val = -1;
+    }
+    return val;
+}
+
+void setenv_bool(const char *name, bool val)
+{
+    setenv_ulong(BOOL_PREFIX, name, val);
+}
+
+void unsetenv_bool(const char *name)
+{
+    unsetenv_ulong(BOOL_PREFIX, name);
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
-- 
1.8.3.1


