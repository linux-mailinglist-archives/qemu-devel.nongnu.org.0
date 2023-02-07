Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3D968E09C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 19:52:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPT1u-0003cF-D7; Tue, 07 Feb 2023 13:49:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPT1Y-0003D6-2z
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:49:04 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPT1U-00018h-Mj
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:48:59 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317GmfHQ021424; Tue, 7 Feb 2023 18:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2022-7-12;
 bh=9KvRMO5UjyPNaODrn//m8PsW5PdvuMwBt2tE4uaayns=;
 b=BnqQFkGzWWFf1j8MKjPS5jOmDQzSq/WhZYe8H3nUVuxxXaiQ6AVxmm0d3CN6D4VOhJUe
 Wc+89CUtBXDQ0Yl+a99qQvQboPBnG2iVghnLmU3/y7XJDLTyldp7WRhxI+71iGFzHQiM
 FI8OrlV6pDsQuoi1NJ1Nzs7CEeARuMZ2SbK+DcXgeAKAgZk6G8KZYRQiGKACdG+UF1U/
 ZeGXSIPXt9KFQjtWjmTpNmmwKak3dKzCHU4SbcZd88OXdAsMS0t58PicOYF/C6Kfmdfw
 sjHPw9qKUP9DFpQ61J1lTAepKEMxif3zBwn6+KMm8SXFte9MDweyFNlhYHf4pWN36FyB OQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhe53edb9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 18:48:54 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 317Hwj11028682; Tue, 7 Feb 2023 18:48:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdtd3rh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 18:48:53 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 317Im35a033516;
 Tue, 7 Feb 2023 18:48:53 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with
 ESMTP id 3nhdtd3rdm-5; Tue, 07 Feb 2023 18:48:53 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Steve Sistare <steven.sistare@oracle.com>
Subject: [PATCH V2 4/4] qapi: strList unit tests
Date: Tue,  7 Feb 2023 10:48:47 -0800
Message-Id: <1675795727-235010-5-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675795727-235010-1-git-send-email-steven.sistare@oracle.com>
References: <1675795727-235010-1-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_11,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070167
X-Proofpoint-ORIG-GUID: pbsHC1j1b4gvJG0QHtpHUigESoRpp3Jg
X-Proofpoint-GUID: pbsHC1j1b4gvJG0QHtpHUigESoRpp3Jg
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/unit/meson.build    |  1 +
 tests/unit/test-strlist.c | 81 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 tests/unit/test-strlist.c

diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index ffa444f..43c3bee 100644
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


