Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD7954CC05
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 16:59:59 +0200 (CEST)
Received: from localhost ([::1]:44640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UUv-0003UG-74
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 10:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOP-000726-7q
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:13 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:22692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UON-00011x-9S
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:12 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FE7fdB002108;
 Wed, 15 Jun 2022 14:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=mwvu5VidlD01bWZ76R6Trk/yA9U4TDrvGDi+OFgCAiA=;
 b=vhpvVYp4vE13yYdtDFuhvYJ6z30V7Z9x2tIS/YbIyiuB58y15VdcQcOPqIKwmPpqPgx7
 s6AEXB8IZHfUeL9HNZHGbQLRNc63Idu0emWwZf9AIMn8BbiVGDu7muabSsYqW0LxsllD
 FqToAX2PQlOczXYQky/KJ3Up2hLNZYmdZ9L1z2KEqDa2mcj1rvHKsLnQxPDb1tpl45v4
 Kxttcg5i7jhycwvmpb9h4Op8RAAQWV7KoIUevikrrsmxiDwlcWWajt4RkNBz29QwuQuT
 kePwSHWgd7jj1v6lCCf790HmYnaxqbxcfUUT4+9naas/35yzGVp2+P7BqU+qMtA8t1lm ew== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhfcrsjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:50 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ6AB023069; Wed, 15 Jun 2022 14:52:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vps5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:49 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSNH018501;
 Wed, 15 Jun 2022 14:52:48 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-18; Wed, 15 Jun 2022 14:52:48 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH V8 17/39] qapi: strList unit tests
Date: Wed, 15 Jun 2022 07:52:04 -0700
Message-Id: <1655304746-102776-18-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: CdeNd0DK1BBRnKBtGxIsuSUTkqcobYDp
X-Proofpoint-GUID: CdeNd0DK1BBRnKBtGxIsuSUTkqcobYDp
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS               |  1 +
 tests/unit/meson.build    |  1 +
 tests/unit/test-strlist.c | 81 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 tests/unit/test-strlist.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e4e72f..f9a6362 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3160,6 +3160,7 @@ F: include/migration/cpr.h
 F: migration/cpr.c
 F: qapi/cpr.json
 F: stubs/cpr.c
+F: tests/unit/test-strlist.c
 
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 287b367..57d48d5 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -17,6 +17,7 @@ tests = {
   'test-forward-visitor': [testqapi],
   'test-string-input-visitor': [testqapi],
   'test-string-output-visitor': [testqapi],
+  'test-strlist': [testqapi],
   'test-opts-visitor': [testqapi],
   'test-visitor-serialization': [testqapi],
   'test-bitmap': [],
diff --git a/tests/unit/test-strlist.c b/tests/unit/test-strlist.c
new file mode 100644
index 0000000..ef740dc
--- /dev/null
+++ b/tests/unit/test-strlist.c
@@ -0,0 +1,81 @@
+/*
+ * Copyright (c) 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/util.h"
+#include "qapi/qapi-builtin-types.h"
+
+static strList *make_list(int length)
+{
+    strList *head = 0, *list, **prev = &head;
+
+    while (length--) {
+        list = *prev = g_new0(strList, 1);
+        list->value = g_strdup("aaa");
+        prev = &list->next;
+    }
+    return head;
+}
+
+static void test_length(void)
+{
+    strList *list;
+    int i;
+
+    for (i = 0; i < 5; i++) {
+        list = make_list(i);
+        g_assert_cmpint(i, ==, QAPI_LIST_LENGTH(list));
+        qapi_free_strList(list);
+    }
+}
+
+struct {
+    const char *string;
+    char delim;
+    const char *args[5];
+} list_data[] = {
+    { 0, ',', { 0 } },
+    { "", ',', { 0 } },
+    { "a", ',', { "a", 0 } },
+    { "a,b", ',', { "a", "b", 0 } },
+    { "a,b,c", ',', { "a", "b", "c", 0 } },
+    { "first last", ' ', { "first", "last", 0 } },
+    { "a:", ':', { "a", 0 } },
+    { "a::b", ':', { "a", "", "b", 0 } },
+    { ":", ':', { "", 0 } },
+    { ":a", ':', { "", "a", 0 } },
+    { "::a", ':', { "", "", "a", 0 } },
+};
+
+static void test_strv(void)
+{
+    int i, j;
+    const char **expect;
+    strList *list;
+    GStrv args;
+
+    for (i = 0; i < ARRAY_SIZE(list_data); i++) {
+        expect = list_data[i].args;
+        list = strList_from_string(list_data[i].string, list_data[i].delim);
+        args = strv_from_strList(list);
+        qapi_free_strList(list);
+        for (j = 0; expect[j] && args[j]; j++) {
+            g_assert_cmpstr(expect[j], ==, args[j]);
+        }
+        g_assert_null(expect[j]);
+        g_assert_null(args[j]);
+        g_strfreev(args);
+    }
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+    g_test_add_func("/test-string/length", test_length);
+    g_test_add_func("/test-string/strv", test_strv);
+    return g_test_run();
+}
-- 
1.8.3.1


