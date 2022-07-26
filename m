Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A459F58173B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:21:18 +0200 (CEST)
Received: from localhost ([::1]:34056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNJ7-0007Gu-OG
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9c-0002Xl-5k
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:28 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:30466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9X-00068l-Mi
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:27 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFnPIv006232;
 Tue, 26 Jul 2022 16:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2022-7-12;
 bh=He2ETZhzSAMk/DUI0DoNjIMY9jcW0BWo1OroYLSZdQM=;
 b=cAn3lV8EjkY9W+xhaQ6Ua8iwyufzqyHgxmIE8FrX4qiv64+eRGk4DudjNfXeaptoImvS
 ZjAaETF7bp8nB5QsM4P7ZLv9ljNH4B82EVGDwZlTE0UtVqS5zgmriOMQvAn+FyUYWcf8
 xmnzf72qH//srRAlqHIIkrNvYo/17IgO2XTqn2E935ze/gsP03h5bDZU8Sy5Z0T4e8Hu
 caw4YxqOH/leKrI8wRBKDXhiGRVwlD9zHL7YUQ0xDRHAGJogZIv0ubsMaQ4R+f0tz4r9
 ozyGKPWAkwYvptdS+TKlpMOZmFbkLQVJUZ4l+9q0prWoSl4FFZQyPlc/r29rYvv9Oijk 9A== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg940pu1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:07 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QFH3Vl006242; Tue, 26 Jul 2022 16:11:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq1q0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:06 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uSb023334;
 Tue, 26 Jul 2022 16:11:05 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-15; Tue, 26 Jul 2022 16:11:05 +0000
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
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Peng Liang <tcx4c70@gmail.com>
Subject: [PATCH V9 14/46] qapi: strList unit tests
Date: Tue, 26 Jul 2022 09:10:11 -0700
Message-Id: <1658851843-236870-15-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207260063
X-Proofpoint-GUID: BYWk_vO9TKM6wzTbqugGD7jiavvYm-Py
X-Proofpoint-ORIG-GUID: BYWk_vO9TKM6wzTbqugGD7jiavvYm-Py
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
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 MAINTAINERS               |  6 ++++
 tests/unit/meson.build    |  1 +
 tests/unit/test-strlist.c | 81 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 88 insertions(+)
 create mode 100644 tests/unit/test-strlist.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 6af9cd9..362cfde 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3160,6 +3160,12 @@ F: net/filter-rewriter.c
 F: net/filter-mirror.c
 F: tests/qtest/test-filter*
 
+CPR
+M: Steve Sistare <steven.sistare@oracle.com>
+R: Mark Kanda <mark.kanda@oracle.com>
+S: Maintained
+F: tests/unit/test-strlist.c
+
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
 R: Paolo Bonzini <pbonzini@redhat.com>
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index b497a41..1030e61 100644
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


