Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2961F2866
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 08:49:36 +0100 (CET)
Received: from localhost ([::1]:39554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iScXv-0003Ff-Q1
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 02:49:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45455)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iScU1-0001Jl-QF
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 02:45:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iScTz-0004wS-3P
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 02:45:32 -0500
Received: from mga02.intel.com ([134.134.136.20]:5076)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iScTy-0004DB-Pi
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 02:45:31 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 23:45:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,277,1569308400"; d="scan'208";a="404016857"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.36])
 by fmsmga006.fm.intel.com with ESMTP; 06 Nov 2019 23:45:26 -0800
From: Tao Xu <tao3.xu@intel.com>
To: mst@redhat.com, imammedo@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, armbru@redhat.com,
 mdroth@linux.vnet.ibm.com, thuth@redhat.com, lvivier@redhat.com
Subject: [PATCH v15 04/12] tests: Add test for QAPI builtin type time
Date: Thu,  7 Nov 2019 15:45:03 +0800
Message-Id: <20191107074511.14304-5-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191107074511.14304-1-tao3.xu@intel.com>
References: <20191107074511.14304-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
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
Cc: jingqi.liu@intel.com, tao3.xu@intel.com, fan.du@intel.com,
 qemu-devel@nongnu.org, jonathan.cameron@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add tests for time input such as zero, around limit of precision,
signed upper limit, actual upper limit, beyond limits, time suffixes,
and etc.

Signed-off-by: Tao Xu <tao3.xu@intel.com>
---

No changes in v15.

Changes in v14:
    - Drop time unit picosecond (Eric)
---
 tests/test-keyval.c                | 122 +++++++++++++++++++++++++++++
 tests/test-qobject-input-visitor.c |  29 +++++++
 2 files changed, 151 insertions(+)

diff --git a/tests/test-keyval.c b/tests/test-keyval.c
index 09b0ae3c68..28e2e34084 100644
--- a/tests/test-keyval.c
+++ b/tests/test-keyval.c
@@ -490,6 +490,127 @@ static void test_keyval_visit_size(void)
     visit_free(v);
 }
 
+static void test_keyval_visit_time(void)
+{
+    Error *err = NULL;
+    Visitor *v;
+    QDict *qdict;
+    uint64_t time;
+
+    /* Lower limit zero */
+    qdict = keyval_parse("time1=0", NULL, &error_abort);
+    v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
+    qobject_unref(qdict);
+    visit_start_struct(v, NULL, NULL, 0, &error_abort);
+    visit_type_time(v, "time1", &time, &error_abort);
+    g_assert_cmpuint(time, ==, 0);
+    visit_check_struct(v, &error_abort);
+    visit_end_struct(v, NULL);
+    visit_free(v);
+
+    /* Around limit of precision: 2^53-1, 2^53, 2^53+1 */
+    qdict = keyval_parse("time1=9007199254740991,"
+                         "time2=9007199254740992,"
+                         "time3=9007199254740993",
+                         NULL, &error_abort);
+    v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
+    qobject_unref(qdict);
+    visit_start_struct(v, NULL, NULL, 0, &error_abort);
+    visit_type_time(v, "time1", &time, &error_abort);
+    g_assert_cmphex(time, ==, 0x1fffffffffffff);
+    visit_type_time(v, "time2", &time, &error_abort);
+    g_assert_cmphex(time, ==, 0x20000000000000);
+    visit_type_time(v, "time3", &time, &error_abort);
+    g_assert_cmphex(time, ==, 0x20000000000000);
+    visit_check_struct(v, &error_abort);
+    visit_end_struct(v, NULL);
+    visit_free(v);
+
+    /* Close to signed upper limit 0x7ffffffffffffc00 (53 msbs set) */
+    qdict = keyval_parse("time1=9223372036854774784," /* 7ffffffffffffc00 */
+                         "time2=9223372036854775295", /* 7ffffffffffffdff */
+                         NULL, &error_abort);
+    v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
+    qobject_unref(qdict);
+    visit_start_struct(v, NULL, NULL, 0, &error_abort);
+    visit_type_time(v, "time1", &time, &error_abort);
+    g_assert_cmphex(time, ==, 0x7ffffffffffffc00);
+    visit_type_time(v, "time2", &time, &error_abort);
+    g_assert_cmphex(time, ==, 0x7ffffffffffffc00);
+    visit_check_struct(v, &error_abort);
+    visit_end_struct(v, NULL);
+    visit_free(v);
+
+    /* Close to actual upper limit 0xfffffffffffff800 (53 msbs set) */
+    qdict = keyval_parse("time1=18446744073709549568," /* fffffffffffff800 */
+                         "time2=18446744073709550591", /* fffffffffffffbff */
+                         NULL, &error_abort);
+    v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
+    qobject_unref(qdict);
+    visit_start_struct(v, NULL, NULL, 0, &error_abort);
+    visit_type_time(v, "time1", &time, &error_abort);
+    g_assert_cmphex(time, ==, 0xfffffffffffff800);
+    visit_type_time(v, "time2", &time, &error_abort);
+    g_assert_cmphex(time, ==, 0xfffffffffffff800);
+    visit_check_struct(v, &error_abort);
+    visit_end_struct(v, NULL);
+    visit_free(v);
+
+    /* Beyond limits */
+    qdict = keyval_parse("time1=-1,"
+                         "time2=18446744073709550592", /* fffffffffffffc00 */
+                         NULL, &error_abort);
+    v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
+    qobject_unref(qdict);
+    visit_start_struct(v, NULL, NULL, 0, &error_abort);
+    visit_type_time(v, "time1", &time, &err);
+    error_free_or_abort(&err);
+    visit_type_time(v, "time2", &time, &err);
+    error_free_or_abort(&err);
+    visit_end_struct(v, NULL);
+    visit_free(v);
+
+    /* Suffixes */
+    qdict = keyval_parse("time1=2ns,time2=3.4us,time3=5ms,time4=600s",
+                         NULL, &error_abort);
+    v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
+    qobject_unref(qdict);
+    visit_start_struct(v, NULL, NULL, 0, &error_abort);
+    visit_type_time(v, "time1", &time, &error_abort);
+    g_assert_cmpuint(time, ==, 2);
+    visit_type_time(v, "time2", &time, &error_abort);
+    g_assert_cmpuint(time, ==, 3400);
+    visit_type_time(v, "time3", &time, &error_abort);
+    g_assert_cmphex(time, ==, 5 * 1000 * 1000);
+    visit_type_time(v, "time4", &time, &error_abort);
+    g_assert_cmphex(time, ==, 600 * 1000000000LL);
+    visit_check_struct(v, &error_abort);
+    visit_end_struct(v, NULL);
+    visit_free(v);
+
+    /* Beyond limit with suffix */
+    qdict = keyval_parse("time1=1844674407370955s", NULL, &error_abort);
+    v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
+    qobject_unref(qdict);
+    visit_start_struct(v, NULL, NULL, 0, &error_abort);
+    visit_type_time(v, "time1", &time, &err);
+    error_free_or_abort(&err);
+    visit_end_struct(v, NULL);
+    visit_free(v);
+
+    /* Trailing crap */
+    qdict = keyval_parse("time1=89ks,time2=ns", NULL, &error_abort);
+    v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
+    qobject_unref(qdict);
+    visit_start_struct(v, NULL, NULL, 0, &error_abort);
+    visit_type_time(v, "time1", &time, &err);
+    error_free_or_abort(&err);
+    visit_type_time(v, "time2", &time, &err);;
+    error_free_or_abort(&err);
+    visit_end_struct(v, NULL);
+    visit_free(v);
+}
+
 static void test_keyval_visit_dict(void)
 {
     Error *err = NULL;
@@ -678,6 +799,7 @@ int main(int argc, char *argv[])
     g_test_add_func("/keyval/visit/bool", test_keyval_visit_bool);
     g_test_add_func("/keyval/visit/number", test_keyval_visit_number);
     g_test_add_func("/keyval/visit/size", test_keyval_visit_size);
+    g_test_add_func("/keyval/visit/time", test_keyval_visit_time);
     g_test_add_func("/keyval/visit/dict", test_keyval_visit_dict);
     g_test_add_func("/keyval/visit/list", test_keyval_visit_list);
     g_test_add_func("/keyval/visit/optional", test_keyval_visit_optional);
diff --git a/tests/test-qobject-input-visitor.c b/tests/test-qobject-input-visitor.c
index 6bacabf063..55138042b8 100644
--- a/tests/test-qobject-input-visitor.c
+++ b/tests/test-qobject-input-visitor.c
@@ -366,6 +366,31 @@ static void test_visitor_in_size_str_fail(TestInputVisitorData *data,
     error_free_or_abort(&err);
 }
 
+static void test_visitor_in_time_str_keyval(TestInputVisitorData *data,
+                                            const void *unused)
+{
+    uint64_t res, value = 265 * 1000 * 1000;
+    Visitor *v;
+
+    v = visitor_input_test_init_full(data, true, "\"265ms\"");
+
+    visit_type_time(v, NULL, &res, &error_abort);
+    g_assert_cmpfloat(res, ==, value);
+}
+
+static void test_visitor_in_time_str_fail(TestInputVisitorData *data,
+                                          const void *unused)
+{
+    uint64_t res = 0;
+    Visitor *v;
+    Error *err = NULL;
+
+    v = visitor_input_test_init(data, "\"265ms\"");
+
+    visit_type_time(v, NULL, &res, &err);
+    error_free_or_abort(&err);
+}
+
 static void test_visitor_in_string(TestInputVisitorData *data,
                                    const void *unused)
 {
@@ -1311,6 +1336,10 @@ int main(int argc, char **argv)
                            NULL, test_visitor_in_size_str_keyval);
     input_visitor_test_add("/visitor/input/size_str_fail",
                            NULL, test_visitor_in_size_str_fail);
+    input_visitor_test_add("/visitor/input/time_str_keyval",
+                           NULL, test_visitor_in_time_str_keyval);
+    input_visitor_test_add("/visitor/input/time_str_fail",
+                           NULL, test_visitor_in_time_str_fail);
     input_visitor_test_add("/visitor/input/string",
                            NULL, test_visitor_in_string);
     input_visitor_test_add("/visitor/input/enum",
-- 
2.20.1


