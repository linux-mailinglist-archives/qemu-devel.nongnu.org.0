Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B004408C7C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:18:56 +0200 (CEST)
Received: from localhost ([::1]:42812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlrL-0004uX-Iz
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFb-0000SR-0X
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFU-0000im-Vp
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631536785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TbrvfA6vv0Mz6QzrL8SKC7k0DUYniuJZGd22dsMA24k=;
 b=YbmFiFMueU5TSFw7XtvrYnW6lDGdLhbMYXoU4ONUyTvOcFLO8ckbLT/XCASzYDQUovEEiS
 VJ5uU3xF1BUmbMLkRb7DN0vtlH9aNnod/3q//HfitdifsR/gMIcEh0zn7yF94F2zxnXLES
 yxooLpU6LoDtzkq4vKPfmQpxEGQwNz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-I1YRi9XBMF2mTsZHXz7cVw-1; Mon, 13 Sep 2021 08:39:43 -0400
X-MC-Unique: I1YRi9XBMF2mTsZHXz7cVw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F29D5108468B
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 12:39:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25C115D9DE;
 Mon, 13 Sep 2021 12:39:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 37C9C11380A9; Mon, 13 Sep 2021 14:39:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/22] test-qobject-output-visitor: Wean off UserDefListUnion
Date: Mon, 13 Sep 2021 14:39:23 +0200
Message-Id: <20210913123932.3306639-14-armbru@redhat.com>
In-Reply-To: <20210913123932.3306639-1-armbru@redhat.com>
References: <20210913123932.3306639-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jsnow@redhat.com, eblake@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The test_visitor_out_list_union_FOO() use simple union
UserDefListUnion to cover lists of builtin types.  Rewrite as
test_visitor_out_list_struct(), using struct ArrayStruct and a lot
less code.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/unit/test-qobject-output-visitor.c | 391 ++++++-----------------
 1 file changed, 93 insertions(+), 298 deletions(-)

diff --git a/tests/unit/test-qobject-output-visitor.c b/tests/unit/test-qobject-output-visitor.c
index 9dc1e075e7..34d67a439a 100644
--- a/tests/unit/test-qobject-output-visitor.c
+++ b/tests/unit/test-qobject-output-visitor.c
@@ -437,289 +437,118 @@ static void test_visitor_out_null(TestOutputVisitorData *data,
     g_assert(qobject_type(nil) == QTYPE_QNULL);
 }
 
-static void init_list_union(UserDefListUnion *cvalue)
-{
-    int i;
-    switch (cvalue->type) {
-    case USER_DEF_LIST_UNION_KIND_INTEGER: {
-        intList **tail = &cvalue->u.integer.data;
-        for (i = 0; i < 32; i++) {
-            QAPI_LIST_APPEND(tail, i);
-        }
-        break;
-    }
-    case USER_DEF_LIST_UNION_KIND_S8: {
-        int8List **tail = &cvalue->u.s8.data;
-        for (i = 0; i < 32; i++) {
-            QAPI_LIST_APPEND(tail, i);
-        }
-        break;
-    }
-    case USER_DEF_LIST_UNION_KIND_S16: {
-        int16List **tail = &cvalue->u.s16.data;
-        for (i = 0; i < 32; i++) {
-            QAPI_LIST_APPEND(tail, i);
-        }
-        break;
-    }
-    case USER_DEF_LIST_UNION_KIND_S32: {
-        int32List **tail = &cvalue->u.s32.data;
-        for (i = 0; i < 32; i++) {
-            QAPI_LIST_APPEND(tail, i);
-        }
-        break;
-    }
-    case USER_DEF_LIST_UNION_KIND_S64: {
-        int64List **tail = &cvalue->u.s64.data;
-        for (i = 0; i < 32; i++) {
-            QAPI_LIST_APPEND(tail, i);
-        }
-        break;
-    }
-    case USER_DEF_LIST_UNION_KIND_U8: {
-        uint8List **tail = &cvalue->u.u8.data;
-        for (i = 0; i < 32; i++) {
-            QAPI_LIST_APPEND(tail, i);
-        }
-        break;
-    }
-    case USER_DEF_LIST_UNION_KIND_U16: {
-        uint16List **tail = &cvalue->u.u16.data;
-        for (i = 0; i < 32; i++) {
-            QAPI_LIST_APPEND(tail, i);
-        }
-        break;
-    }
-    case USER_DEF_LIST_UNION_KIND_U32: {
-        uint32List **tail = &cvalue->u.u32.data;
-        for (i = 0; i < 32; i++) {
-            QAPI_LIST_APPEND(tail, i);
-        }
-        break;
-    }
-    case USER_DEF_LIST_UNION_KIND_U64: {
-        uint64List **tail = &cvalue->u.u64.data;
-        for (i = 0; i < 32; i++) {
-            QAPI_LIST_APPEND(tail, i);
-        }
-        break;
-    }
-    case USER_DEF_LIST_UNION_KIND_BOOLEAN: {
-        boolList **tail = &cvalue->u.boolean.data;
-        for (i = 0; i < 32; i++) {
-            QAPI_LIST_APPEND(tail, QEMU_IS_ALIGNED(i, 3));
-        }
-        break;
-    }
-    case USER_DEF_LIST_UNION_KIND_STRING: {
-        strList **tail = &cvalue->u.string.data;
-        for (i = 0; i < 32; i++) {
-            QAPI_LIST_APPEND(tail, g_strdup_printf("%d", i));
-        }
-        break;
-    }
-    case USER_DEF_LIST_UNION_KIND_NUMBER: {
-        numberList **tail = &cvalue->u.number.data;
-        for (i = 0; i < 32; i++) {
-            QAPI_LIST_APPEND(tail, (double)i / 3);
-        }
-        break;
-    }
-    default:
-        g_assert_not_reached();
-    }
-}
-
-static void check_list_union(QObject *qobj,
-                             UserDefListUnionKind kind)
+static void test_visitor_out_list_struct(TestOutputVisitorData *data,
+                                         const void *unused)
 {
+    const char *int_member[] = {
+        "integer", "s8", "s16", "s32", "s64", "u8", "u16", "u32", "u64" };
+    g_autoptr(ArrayStruct) arrs = g_new0(ArrayStruct, 1);
+    int i, j;
     QDict *qdict;
     QList *qlist;
-    int i;
+    QListEntry *e;
 
-    qdict = qobject_to(QDict, qobj);
-    g_assert(qdict);
-    g_assert(qdict_haskey(qdict, "data"));
-    qlist = qlist_copy(qobject_to(QList, qdict_get(qdict, "data")));
-
-    switch (kind) {
-    case USER_DEF_LIST_UNION_KIND_U8:
-    case USER_DEF_LIST_UNION_KIND_U16:
-    case USER_DEF_LIST_UNION_KIND_U32:
-    case USER_DEF_LIST_UNION_KIND_U64:
-        for (i = 0; i < 32; i++) {
-            QObject *tmp;
-            QNum *qvalue;
-            uint64_t val;
-
-            tmp = qlist_peek(qlist);
-            g_assert(tmp);
-            qvalue = qobject_to(QNum, tmp);
-            g_assert(qnum_get_try_uint(qvalue, &val));
-            g_assert_cmpint(val, ==, i);
-            qobject_unref(qlist_pop(qlist));
-        }
-        break;
-
-    case USER_DEF_LIST_UNION_KIND_S8:
-    case USER_DEF_LIST_UNION_KIND_S16:
-    case USER_DEF_LIST_UNION_KIND_S32:
-    case USER_DEF_LIST_UNION_KIND_S64:
-        /*
-         * All integer elements in JSON arrays get stored into QNums
-         * when we convert to QObjects, so we can check them all in
-         * the same fashion, so simply fall through here.
-         */
-    case USER_DEF_LIST_UNION_KIND_INTEGER:
-        for (i = 0; i < 32; i++) {
-            QObject *tmp;
-            QNum *qvalue;
-            int64_t val;
-
-            tmp = qlist_peek(qlist);
-            g_assert(tmp);
-            qvalue = qobject_to(QNum, tmp);
-            g_assert(qnum_get_try_int(qvalue, &val));
-            g_assert_cmpint(val, ==, i);
-            qobject_unref(qlist_pop(qlist));
-        }
-        break;
-    case USER_DEF_LIST_UNION_KIND_BOOLEAN:
-        for (i = 0; i < 32; i++) {
-            QObject *tmp;
-            QBool *qvalue;
-            tmp = qlist_peek(qlist);
-            g_assert(tmp);
-            qvalue = qobject_to(QBool, tmp);
-            g_assert_cmpint(qbool_get_bool(qvalue), ==, i % 3 == 0);
-            qobject_unref(qlist_pop(qlist));
-        }
-        break;
-    case USER_DEF_LIST_UNION_KIND_STRING:
-        for (i = 0; i < 32; i++) {
-            QObject *tmp;
-            QString *qvalue;
-            gchar str[8];
-            tmp = qlist_peek(qlist);
-            g_assert(tmp);
-            qvalue = qobject_to(QString, tmp);
-            sprintf(str, "%d", i);
-            g_assert_cmpstr(qstring_get_str(qvalue), ==, str);
-            qobject_unref(qlist_pop(qlist));
-        }
-        break;
-    case USER_DEF_LIST_UNION_KIND_NUMBER:
-        for (i = 0; i < 32; i++) {
-            QObject *tmp;
-            QNum *qvalue;
-            GString *double_expected = g_string_new("");
-            GString *double_actual = g_string_new("");
-
-            tmp = qlist_peek(qlist);
-            g_assert(tmp);
-            qvalue = qobject_to(QNum, tmp);
-            g_string_printf(double_expected, "%.6f", (double)i / 3);
-            g_string_printf(double_actual, "%.6f", qnum_get_double(qvalue));
-            g_assert_cmpstr(double_actual->str, ==, double_expected->str);
-
-            qobject_unref(qlist_pop(qlist));
-            g_string_free(double_expected, true);
-            g_string_free(double_actual, true);
-        }
-        break;
-    default:
-        g_assert_not_reached();
+    for (i = 31; i >= 0; i--) {
+        QAPI_LIST_PREPEND(arrs->integer, i);
     }
-    qobject_unref(qlist);
-}
 
-static void test_list_union(TestOutputVisitorData *data,
-                            const void *unused,
-                            UserDefListUnionKind kind)
-{
-    UserDefListUnion *cvalue = g_new0(UserDefListUnion, 1);
-    QObject *obj;
+    for (i = 31; i >= 0; i--) {
+        QAPI_LIST_PREPEND(arrs->s8, i);
+    }
 
-    cvalue->type = kind;
-    init_list_union(cvalue);
+    for (i = 31; i >= 0; i--) {
+        QAPI_LIST_PREPEND(arrs->s16, i);
+    }
 
-    visit_type_UserDefListUnion(data->ov, NULL, &cvalue, &error_abort);
+    for (i = 31; i >= 0; i--) {
+        QAPI_LIST_PREPEND(arrs->s32, i);
+    }
 
-    obj = visitor_get(data);
-    check_list_union(obj, cvalue->type);
-    qapi_free_UserDefListUnion(cvalue);
-}
+    for (i = 31; i >= 0; i--) {
+        QAPI_LIST_PREPEND(arrs->s64, i);
+    }
 
-static void test_visitor_out_list_union_int(TestOutputVisitorData *data,
-                                            const void *unused)
-{
-    test_list_union(data, unused, USER_DEF_LIST_UNION_KIND_INTEGER);
-}
+    for (i = 31; i >= 0; i--) {
+        QAPI_LIST_PREPEND(arrs->u8, i);
+    }
 
-static void test_visitor_out_list_union_int8(TestOutputVisitorData *data,
-                                             const void *unused)
-{
-    test_list_union(data, unused, USER_DEF_LIST_UNION_KIND_S8);
-}
+    for (i = 31; i >= 0; i--) {
+        QAPI_LIST_PREPEND(arrs->u16, i);
+    }
 
-static void test_visitor_out_list_union_int16(TestOutputVisitorData *data,
-                                              const void *unused)
-{
-    test_list_union(data, unused, USER_DEF_LIST_UNION_KIND_S16);
-}
+    for (i = 31; i >= 0; i--) {
+        QAPI_LIST_PREPEND(arrs->u32, i);
+    }
 
-static void test_visitor_out_list_union_int32(TestOutputVisitorData *data,
-                                              const void *unused)
-{
-    test_list_union(data, unused, USER_DEF_LIST_UNION_KIND_S32);
-}
+    for (i = 31; i >= 0; i--) {
+        QAPI_LIST_PREPEND(arrs->u64, i);
+    }
 
-static void test_visitor_out_list_union_int64(TestOutputVisitorData *data,
-                                              const void *unused)
-{
-    test_list_union(data, unused, USER_DEF_LIST_UNION_KIND_S64);
-}
+    for (i = 31; i >= 0; i--) {
+        QAPI_LIST_PREPEND(arrs->number, (double)i / 3);
+    }
 
-static void test_visitor_out_list_union_uint8(TestOutputVisitorData *data,
-                                              const void *unused)
-{
-    test_list_union(data, unused, USER_DEF_LIST_UNION_KIND_U8);
-}
+    for (i = 31; i >= 0; i--) {
+        QAPI_LIST_PREPEND(arrs->boolean, QEMU_IS_ALIGNED(i, 3));
+    }
 
-static void test_visitor_out_list_union_uint16(TestOutputVisitorData *data,
-                                               const void *unused)
-{
-    test_list_union(data, unused, USER_DEF_LIST_UNION_KIND_U16);
-}
+    for (i = 31; i >= 0; i--) {
+        QAPI_LIST_PREPEND(arrs->string, g_strdup_printf("%d", i));
+    }
 
-static void test_visitor_out_list_union_uint32(TestOutputVisitorData *data,
-                                               const void *unused)
-{
-    test_list_union(data, unused, USER_DEF_LIST_UNION_KIND_U32);
-}
+    visit_type_ArrayStruct(data->ov, NULL, &arrs, &error_abort);
 
-static void test_visitor_out_list_union_uint64(TestOutputVisitorData *data,
-                                               const void *unused)
-{
-    test_list_union(data, unused, USER_DEF_LIST_UNION_KIND_U64);
-}
+    qdict = qobject_to(QDict, visitor_get(data));
+    g_assert(qdict);
 
-static void test_visitor_out_list_union_bool(TestOutputVisitorData *data,
-                                             const void *unused)
-{
-    test_list_union(data, unused, USER_DEF_LIST_UNION_KIND_BOOLEAN);
-}
+    for (i = 0; i < G_N_ELEMENTS(int_member); i++) {
+        qlist = qdict_get_qlist(qdict, int_member[i]);
+        g_assert(qlist);
+        j = 0;
+        QLIST_FOREACH_ENTRY(qlist, e) {
+            QNum *qvalue = qobject_to(QNum, qlist_entry_obj(e));
+            g_assert(qvalue);
+            g_assert_cmpint(qnum_get_int(qvalue), ==, j);
+            j++;
+        }
+    }
 
-static void test_visitor_out_list_union_str(TestOutputVisitorData *data,
-                                            const void *unused)
-{
-    test_list_union(data, unused, USER_DEF_LIST_UNION_KIND_STRING);
-}
+    qlist = qdict_get_qlist(qdict, "number");
+    g_assert(qlist);
+    i = 0;
+    QLIST_FOREACH_ENTRY(qlist, e) {
+        QNum *qvalue = qobject_to(QNum, qlist_entry_obj(e));
+        char expected[32], actual[32];
 
-static void test_visitor_out_list_union_number(TestOutputVisitorData *data,
-                                               const void *unused)
-{
-    test_list_union(data, unused, USER_DEF_LIST_UNION_KIND_NUMBER);
+        g_assert(qvalue);
+        sprintf(expected, "%.6f", (double)i / 3);
+        sprintf(actual, "%.6f", qnum_get_double(qvalue));
+        g_assert_cmpstr(actual, ==, expected);
+        i++;
+    }
+
+    qlist = qdict_get_qlist(qdict, "boolean");
+    g_assert(qlist);
+    i = 0;
+    QLIST_FOREACH_ENTRY(qlist, e) {
+        QBool *qvalue = qobject_to(QBool, qlist_entry_obj(e));
+        g_assert(qvalue);
+        g_assert_cmpint(qbool_get_bool(qvalue), ==, i % 3 == 0);
+        i++;
+    }
+
+    qlist = qdict_get_qlist(qdict, "string");
+    g_assert(qlist);
+    i = 0;
+    QLIST_FOREACH_ENTRY(qlist, e) {
+        QString *qvalue = qobject_to(QString, qlist_entry_obj(e));
+        char expected[32];
+
+        g_assert(qvalue);
+        sprintf(expected, "%d", i);
+        g_assert_cmpstr(qstring_get_str(qvalue), ==, expected);
+        i++;
+    }
 }
 
 static void output_visitor_test_add(const char *testpath,
@@ -764,42 +593,8 @@ int main(int argc, char **argv)
                             &out_visitor_data, test_visitor_out_alternate);
     output_visitor_test_add("/visitor/output/null",
                             &out_visitor_data, test_visitor_out_null);
-    output_visitor_test_add("/visitor/output/list_union/int",
-                            &out_visitor_data,
-                            test_visitor_out_list_union_int);
-    output_visitor_test_add("/visitor/output/list_union/int8",
-                            &out_visitor_data,
-                            test_visitor_out_list_union_int8);
-    output_visitor_test_add("/visitor/output/list_union/int16",
-                            &out_visitor_data,
-                            test_visitor_out_list_union_int16);
-    output_visitor_test_add("/visitor/output/list_union/int32",
-                            &out_visitor_data,
-                            test_visitor_out_list_union_int32);
-    output_visitor_test_add("/visitor/output/list_union/int64",
-                            &out_visitor_data,
-                            test_visitor_out_list_union_int64);
-    output_visitor_test_add("/visitor/output/list_union/uint8",
-                            &out_visitor_data,
-                            test_visitor_out_list_union_uint8);
-    output_visitor_test_add("/visitor/output/list_union/uint16",
-                            &out_visitor_data,
-                            test_visitor_out_list_union_uint16);
-    output_visitor_test_add("/visitor/output/list_union/uint32",
-                            &out_visitor_data,
-                            test_visitor_out_list_union_uint32);
-    output_visitor_test_add("/visitor/output/list_union/uint64",
-                            &out_visitor_data,
-                            test_visitor_out_list_union_uint64);
-    output_visitor_test_add("/visitor/output/list_union/bool",
-                            &out_visitor_data,
-                            test_visitor_out_list_union_bool);
-    output_visitor_test_add("/visitor/output/list_union/string",
-                            &out_visitor_data,
-                            test_visitor_out_list_union_str);
-    output_visitor_test_add("/visitor/output/list_union/number",
-                            &out_visitor_data,
-                            test_visitor_out_list_union_number);
+    output_visitor_test_add("/visitor/output/list_struct",
+                            &out_visitor_data, test_visitor_out_list_struct);
 
     g_test_run();
 
-- 
2.31.1


