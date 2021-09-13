Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7992408D9F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:27:07 +0200 (CEST)
Received: from localhost ([::1]:33692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlzG-0001Fg-TJ
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFX-0000J4-Df
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFT-0000iT-92
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631536784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZbnq8tDgxVTpOFOSGSiuqu99zzRHN47TdFtQ4vNLk8=;
 b=evKyDaS1dHuL6QXooBRePsiQ0it8gBNmDjvcZO7+FATIJS+kAez/kZ/E26cqnLDXX33bap
 KuRGplk99w0nbzGAMZLt9CzGIIzxVag5G82cvcQD1g2MA+y2HJpJEiEQv+Rd6L8DH+dEpp
 2Ant289HJSPJKaYIMwnKmbLgba/T+fI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-FCEFO8uvOB2n04VxjEpuKw-1; Mon, 13 Sep 2021 08:39:43 -0400
X-MC-Unique: FCEFO8uvOB2n04VxjEpuKw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 944742E77
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 12:39:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19A295FC13;
 Mon, 13 Sep 2021 12:39:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 339181138469; Mon, 13 Sep 2021 14:39:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/22] test-qobject-input-visitor: Wean off UserDefListUnion
Date: Mon, 13 Sep 2021 14:39:22 +0200
Message-Id: <20210913123932.3306639-13-armbru@redhat.com>
In-Reply-To: <20210913123932.3306639-1-armbru@redhat.com>
References: <20210913123932.3306639-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

The test_visitor_in_list_union_FOO() use simple union UserDefListUnion
to cover lists of builtin types.  Rewrite as
test_visitor_in_list_struct(), using struct ArrayStruct and a lot less
code.

test_visitor_in_fail_union_list() uses UserDefListUnion to cover
"variant members don't match the discriminator value".  Cover that in
test_visitor_in_fail_union_flat() instead, and drop
test_visitor_in_fail_union_list().  Appropriating the former for this
purpose is okay, because it actually failed due to missing
discriminator, which is still covered by
test_visitor_in_fail_union_flat_no_discrim().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/unit/test-qobject-input-visitor.c | 460 ++++++++----------------
 1 file changed, 148 insertions(+), 312 deletions(-)

diff --git a/tests/unit/test-qobject-input-visitor.c b/tests/unit/test-qobject-input-visitor.c
index e41b91a2a6..6f59a7f432 100644
--- a/tests/unit/test-qobject-input-visitor.c
+++ b/tests/unit/test-qobject-input-visitor.c
@@ -464,6 +464,151 @@ static void test_visitor_in_list(TestInputVisitorData *data,
     g_assert(!head);
 }
 
+static void test_visitor_in_list_struct(TestInputVisitorData *data,
+                                        const void *unused)
+{
+    const char *int_member[] = {
+        "integer", "s8", "s16", "s32", "s64", "u8", "u16", "u32", "u64" };
+    g_autoptr(GString) json = g_string_new("");
+    int i, j;
+    const char *sep;
+    g_autoptr(ArrayStruct) arrs = NULL;
+    Visitor *v;
+    intList *int_list;
+    int8List *s8_list;
+    int16List *s16_list;
+    int32List *s32_list;
+    int64List *s64_list;
+    uint8List *u8_list;
+    uint16List *u16_list;
+    uint32List *u32_list;
+    uint64List *u64_list;
+    numberList *num_list;
+    boolList *bool_list;
+    strList *str_list;
+
+    g_string_append_printf(json, "{");
+
+    for (i = 0; i < G_N_ELEMENTS(int_member); i++) {
+        g_string_append_printf(json, "'%s': [", int_member[i]);
+        sep = "";
+        for (j = 0; j < 32; j++) {
+            g_string_append_printf(json, "%s%d", sep, j);
+            sep = ", ";
+        }
+        g_string_append_printf(json, "], ");
+    }
+
+    g_string_append_printf(json, "'number': [");
+    sep = "";
+    for (i = 0; i < 32; i++) {
+        g_string_append_printf(json, "%s%f", sep, (double)i / 3);
+        sep = ", ";
+    }
+    g_string_append_printf(json, "], ");
+
+    g_string_append_printf(json, "'boolean': [");
+    sep = "";
+    for (i = 0; i < 32; i++) {
+        g_string_append_printf(json, "%s%s",
+                               sep, i % 3 == 0 ? "true" : "false");
+        sep = ", ";
+    }
+    g_string_append_printf(json, "], ");
+
+    g_string_append_printf(json, "'string': [");
+    sep = "";
+    for (i = 0; i < 32; i++) {
+        g_string_append_printf(json, "%s'%d'", sep, i);
+        sep = ", ";
+    }
+    g_string_append_printf(json, "]");
+
+    g_string_append_printf(json, "}");
+
+    v = visitor_input_test_init_raw(data, json->str);
+    visit_type_ArrayStruct(v, NULL, &arrs, &error_abort);
+
+    i = 0;
+    for (int_list = arrs->integer; int_list; int_list = int_list->next) {
+        g_assert_cmpint(int_list->value, ==, i);
+        i++;
+    }
+
+    i = 0;
+    for (s8_list = arrs->s8; s8_list; s8_list = s8_list->next) {
+        g_assert_cmpint(s8_list->value, ==, i);
+        i++;
+    }
+
+    i = 0;
+    for (s16_list = arrs->s16; s16_list; s16_list = s16_list->next) {
+        g_assert_cmpint(s16_list->value, ==, i);
+        i++;
+    }
+
+    i = 0;
+    for (s32_list = arrs->s32; s32_list; s32_list = s32_list->next) {
+        g_assert_cmpint(s32_list->value, ==, i);
+        i++;
+    }
+
+    i = 0;
+    for (s64_list = arrs->s64; s64_list; s64_list = s64_list->next) {
+        g_assert_cmpint(s64_list->value, ==, i);
+        i++;
+    }
+
+    i = 0;
+    for (u8_list = arrs->u8; u8_list; u8_list = u8_list->next) {
+        g_assert_cmpint(u8_list->value, ==, i);
+        i++;
+    }
+
+    i = 0;
+    for (u16_list = arrs->u16; u16_list; u16_list = u16_list->next) {
+        g_assert_cmpint(u16_list->value, ==, i);
+        i++;
+    }
+
+    i = 0;
+    for (u32_list = arrs->u32; u32_list; u32_list = u32_list->next) {
+        g_assert_cmpint(u32_list->value, ==, i);
+        i++;
+    }
+
+    i = 0;
+    for (u64_list = arrs->u64; u64_list; u64_list = u64_list->next) {
+        g_assert_cmpint(u64_list->value, ==, i);
+        i++;
+    }
+
+    i = 0;
+    for (num_list = arrs->number; num_list; num_list = num_list->next) {
+        char expected[32], actual[32];
+
+        sprintf(expected, "%.6f", (double)i / 3);
+        sprintf(actual, "%.6f", num_list->value);
+        g_assert_cmpstr(expected, ==, actual);
+        i++;
+    }
+
+    i = 0;
+    for (bool_list = arrs->boolean; bool_list; bool_list = bool_list->next) {
+        g_assert_cmpint(bool_list->value, ==, i % 3 == 0);
+        i++;
+    }
+
+    i = 0;
+    for (str_list = arrs->string; str_list; str_list = str_list->next) {
+        char expected[32];
+
+        sprintf(expected, "%d", i);
+        g_assert_cmpstr(str_list->value, ==, expected);
+        i++;
+    }
+}
+
 static void test_visitor_in_any(TestInputVisitorData *data,
                                 const void *unused)
 {
@@ -682,276 +827,6 @@ static void test_visitor_in_alternate_number(TestInputVisitorData *data,
     qapi_free_AltEnumInt(asi);
 }
 
-static void test_list_union_integer_helper(TestInputVisitorData *data,
-                                           const void *unused,
-                                           UserDefListUnionKind kind)
-{
-    g_autoptr(UserDefListUnion) cvalue = NULL;
-    Visitor *v;
-    GString *gstr_list = g_string_new("");
-    GString *gstr_union = g_string_new("");
-    int i;
-
-    for (i = 0; i < 32; i++) {
-        g_string_append_printf(gstr_list, "%d", i);
-        if (i != 31) {
-            g_string_append(gstr_list, ", ");
-        }
-    }
-    g_string_append_printf(gstr_union,  "{ 'type': '%s', 'data': [ %s ] }",
-                           UserDefListUnionKind_str(kind),
-                           gstr_list->str);
-    v = visitor_input_test_init_raw(data,  gstr_union->str);
-
-    visit_type_UserDefListUnion(v, NULL, &cvalue, &error_abort);
-    g_assert(cvalue != NULL);
-    g_assert_cmpint(cvalue->type, ==, kind);
-
-    switch (kind) {
-    case USER_DEF_LIST_UNION_KIND_INTEGER: {
-        intList *elem = NULL;
-        for (i = 0, elem = cvalue->u.integer.data;
-             elem; elem = elem->next, i++) {
-            g_assert_cmpint(elem->value, ==, i);
-        }
-        break;
-    }
-    case USER_DEF_LIST_UNION_KIND_S8: {
-        int8List *elem = NULL;
-        for (i = 0, elem = cvalue->u.s8.data; elem; elem = elem->next, i++) {
-            g_assert_cmpint(elem->value, ==, i);
-        }
-        break;
-    }
-    case USER_DEF_LIST_UNION_KIND_S16: {
-        int16List *elem = NULL;
-        for (i = 0, elem = cvalue->u.s16.data; elem; elem = elem->next, i++) {
-            g_assert_cmpint(elem->value, ==, i);
-        }
-        break;
-    }
-    case USER_DEF_LIST_UNION_KIND_S32: {
-        int32List *elem = NULL;
-        for (i = 0, elem = cvalue->u.s32.data; elem; elem = elem->next, i++) {
-            g_assert_cmpint(elem->value, ==, i);
-        }
-        break;
-    }
-    case USER_DEF_LIST_UNION_KIND_S64: {
-        int64List *elem = NULL;
-        for (i = 0, elem = cvalue->u.s64.data; elem; elem = elem->next, i++) {
-            g_assert_cmpint(elem->value, ==, i);
-        }
-        break;
-    }
-    case USER_DEF_LIST_UNION_KIND_U8: {
-        uint8List *elem = NULL;
-        for (i = 0, elem = cvalue->u.u8.data; elem; elem = elem->next, i++) {
-            g_assert_cmpint(elem->value, ==, i);
-        }
-        break;
-    }
-    case USER_DEF_LIST_UNION_KIND_U16: {
-        uint16List *elem = NULL;
-        for (i = 0, elem = cvalue->u.u16.data; elem; elem = elem->next, i++) {
-            g_assert_cmpint(elem->value, ==, i);
-        }
-        break;
-    }
-    case USER_DEF_LIST_UNION_KIND_U32: {
-        uint32List *elem = NULL;
-        for (i = 0, elem = cvalue->u.u32.data; elem; elem = elem->next, i++) {
-            g_assert_cmpint(elem->value, ==, i);
-        }
-        break;
-    }
-    case USER_DEF_LIST_UNION_KIND_U64: {
-        uint64List *elem = NULL;
-        for (i = 0, elem = cvalue->u.u64.data; elem; elem = elem->next, i++) {
-            g_assert_cmpint(elem->value, ==, i);
-        }
-        break;
-    }
-    default:
-        g_assert_not_reached();
-    }
-
-    g_string_free(gstr_union, true);
-    g_string_free(gstr_list, true);
-}
-
-static void test_visitor_in_list_union_int(TestInputVisitorData *data,
-                                           const void *unused)
-{
-    test_list_union_integer_helper(data, unused,
-                                   USER_DEF_LIST_UNION_KIND_INTEGER);
-}
-
-static void test_visitor_in_list_union_int8(TestInputVisitorData *data,
-                                            const void *unused)
-{
-    test_list_union_integer_helper(data, unused,
-                                   USER_DEF_LIST_UNION_KIND_S8);
-}
-
-static void test_visitor_in_list_union_int16(TestInputVisitorData *data,
-                                             const void *unused)
-{
-    test_list_union_integer_helper(data, unused,
-                                   USER_DEF_LIST_UNION_KIND_S16);
-}
-
-static void test_visitor_in_list_union_int32(TestInputVisitorData *data,
-                                             const void *unused)
-{
-    test_list_union_integer_helper(data, unused,
-                                   USER_DEF_LIST_UNION_KIND_S32);
-}
-
-static void test_visitor_in_list_union_int64(TestInputVisitorData *data,
-                                             const void *unused)
-{
-    test_list_union_integer_helper(data, unused,
-                                   USER_DEF_LIST_UNION_KIND_S64);
-}
-
-static void test_visitor_in_list_union_uint8(TestInputVisitorData *data,
-                                             const void *unused)
-{
-    test_list_union_integer_helper(data, unused,
-                                   USER_DEF_LIST_UNION_KIND_U8);
-}
-
-static void test_visitor_in_list_union_uint16(TestInputVisitorData *data,
-                                              const void *unused)
-{
-    test_list_union_integer_helper(data, unused,
-                                   USER_DEF_LIST_UNION_KIND_U16);
-}
-
-static void test_visitor_in_list_union_uint32(TestInputVisitorData *data,
-                                              const void *unused)
-{
-    test_list_union_integer_helper(data, unused,
-                                   USER_DEF_LIST_UNION_KIND_U32);
-}
-
-static void test_visitor_in_list_union_uint64(TestInputVisitorData *data,
-                                              const void *unused)
-{
-    test_list_union_integer_helper(data, unused,
-                                   USER_DEF_LIST_UNION_KIND_U64);
-}
-
-static void test_visitor_in_list_union_bool(TestInputVisitorData *data,
-                                            const void *unused)
-{
-    g_autoptr(UserDefListUnion) cvalue = NULL;
-    boolList *elem = NULL;
-    Visitor *v;
-    GString *gstr_list = g_string_new("");
-    GString *gstr_union = g_string_new("");
-    int i;
-
-    for (i = 0; i < 32; i++) {
-        g_string_append_printf(gstr_list, "%s",
-                               (i % 3 == 0) ? "true" : "false");
-        if (i != 31) {
-            g_string_append(gstr_list, ", ");
-        }
-    }
-    g_string_append_printf(gstr_union,  "{ 'type': 'boolean', 'data': [ %s ] }",
-                           gstr_list->str);
-    v = visitor_input_test_init_raw(data,  gstr_union->str);
-
-    visit_type_UserDefListUnion(v, NULL, &cvalue, &error_abort);
-    g_assert(cvalue != NULL);
-    g_assert_cmpint(cvalue->type, ==, USER_DEF_LIST_UNION_KIND_BOOLEAN);
-
-    for (i = 0, elem = cvalue->u.boolean.data; elem; elem = elem->next, i++) {
-        g_assert_cmpint(elem->value, ==, (i % 3 == 0) ? 1 : 0);
-    }
-
-    g_string_free(gstr_union, true);
-    g_string_free(gstr_list, true);
-}
-
-static void test_visitor_in_list_union_string(TestInputVisitorData *data,
-                                              const void *unused)
-{
-    g_autoptr(UserDefListUnion) cvalue = NULL;
-    strList *elem = NULL;
-    Visitor *v;
-    GString *gstr_list = g_string_new("");
-    GString *gstr_union = g_string_new("");
-    int i;
-
-    for (i = 0; i < 32; i++) {
-        g_string_append_printf(gstr_list, "'%d'", i);
-        if (i != 31) {
-            g_string_append(gstr_list, ", ");
-        }
-    }
-    g_string_append_printf(gstr_union,  "{ 'type': 'string', 'data': [ %s ] }",
-                           gstr_list->str);
-    v = visitor_input_test_init_raw(data,  gstr_union->str);
-
-    visit_type_UserDefListUnion(v, NULL, &cvalue, &error_abort);
-    g_assert(cvalue != NULL);
-    g_assert_cmpint(cvalue->type, ==, USER_DEF_LIST_UNION_KIND_STRING);
-
-    for (i = 0, elem = cvalue->u.string.data; elem; elem = elem->next, i++) {
-        gchar str[8];
-        sprintf(str, "%d", i);
-        g_assert_cmpstr(elem->value, ==, str);
-    }
-
-    g_string_free(gstr_union, true);
-    g_string_free(gstr_list, true);
-}
-
-#define DOUBLE_STR_MAX 16
-
-static void test_visitor_in_list_union_number(TestInputVisitorData *data,
-                                              const void *unused)
-{
-    g_autoptr(UserDefListUnion) cvalue = NULL;
-    numberList *elem = NULL;
-    Visitor *v;
-    GString *gstr_list = g_string_new("");
-    GString *gstr_union = g_string_new("");
-    int i;
-
-    for (i = 0; i < 32; i++) {
-        g_string_append_printf(gstr_list, "%f", (double)i / 3);
-        if (i != 31) {
-            g_string_append(gstr_list, ", ");
-        }
-    }
-    g_string_append_printf(gstr_union,  "{ 'type': 'number', 'data': [ %s ] }",
-                           gstr_list->str);
-    v = visitor_input_test_init_raw(data,  gstr_union->str);
-
-    visit_type_UserDefListUnion(v, NULL, &cvalue, &error_abort);
-    g_assert(cvalue != NULL);
-    g_assert_cmpint(cvalue->type, ==, USER_DEF_LIST_UNION_KIND_NUMBER);
-
-    for (i = 0, elem = cvalue->u.number.data; elem; elem = elem->next, i++) {
-        GString *double_expected = g_string_new("");
-        GString *double_actual = g_string_new("");
-
-        g_string_printf(double_expected, "%.6f", (double)i / 3);
-        g_string_printf(double_actual, "%.6f", elem->value);
-        g_assert_cmpstr(double_expected->str, ==, double_actual->str);
-
-        g_string_free(double_expected, true);
-        g_string_free(double_actual, true);
-    }
-
-    g_string_free(gstr_union, true);
-    g_string_free(gstr_list, true);
-}
-
 static void input_visitor_test_add(const char *testpath,
                                    const void *user_data,
                                    void (*test_func)(TestInputVisitorData *data,
@@ -1184,21 +1059,6 @@ static void test_visitor_in_fail_list_nested(TestInputVisitorData *data,
     visit_end_list(v, NULL);
 }
 
-static void test_visitor_in_fail_union_list(TestInputVisitorData *data,
-                                            const void *unused)
-{
-    UserDefListUnion *tmp = NULL;
-    Error *err = NULL;
-    Visitor *v;
-
-    v = visitor_input_test_init(data,
-                                "{ 'type': 'integer', 'data' : [ 'string' ] }");
-
-    visit_type_UserDefListUnion(v, NULL, &tmp, &err);
-    error_free_or_abort(&err);
-    g_assert(!tmp);
-}
-
 static void test_visitor_in_fail_union_flat(TestInputVisitorData *data,
                                             const void *unused)
 {
@@ -1206,7 +1066,7 @@ static void test_visitor_in_fail_union_flat(TestInputVisitorData *data,
     Error *err = NULL;
     Visitor *v;
 
-    v = visitor_input_test_init(data, "{ 'string': 'c', 'integer': 41, 'boolean': true }");
+    v = visitor_input_test_init(data, "{ 'enum1': 'value2', 'string': 'c', 'integer': 41, 'boolean': true }");
 
     visit_type_UserDefFlatUnion(v, NULL, &tmp, &err);
     error_free_or_abort(&err);
@@ -1310,6 +1170,8 @@ int main(int argc, char **argv)
                            NULL, test_visitor_in_struct);
     input_visitor_test_add("/visitor/input/struct-nested",
                            NULL, test_visitor_in_struct_nested);
+    input_visitor_test_add("/visitor/input/list2",
+                           NULL, test_visitor_in_list_struct);
     input_visitor_test_add("/visitor/input/list",
                            NULL, test_visitor_in_list);
     input_visitor_test_add("/visitor/input/any",
@@ -1326,30 +1188,6 @@ int main(int argc, char **argv)
                            NULL, test_visitor_in_wrong_type);
     input_visitor_test_add("/visitor/input/alternate-number",
                            NULL, test_visitor_in_alternate_number);
-    input_visitor_test_add("/visitor/input/list_union/int",
-                           NULL, test_visitor_in_list_union_int);
-    input_visitor_test_add("/visitor/input/list_union/int8",
-                           NULL, test_visitor_in_list_union_int8);
-    input_visitor_test_add("/visitor/input/list_union/int16",
-                           NULL, test_visitor_in_list_union_int16);
-    input_visitor_test_add("/visitor/input/list_union/int32",
-                           NULL, test_visitor_in_list_union_int32);
-    input_visitor_test_add("/visitor/input/list_union/int64",
-                           NULL, test_visitor_in_list_union_int64);
-    input_visitor_test_add("/visitor/input/list_union/uint8",
-                           NULL, test_visitor_in_list_union_uint8);
-    input_visitor_test_add("/visitor/input/list_union/uint16",
-                           NULL, test_visitor_in_list_union_uint16);
-    input_visitor_test_add("/visitor/input/list_union/uint32",
-                           NULL, test_visitor_in_list_union_uint32);
-    input_visitor_test_add("/visitor/input/list_union/uint64",
-                           NULL, test_visitor_in_list_union_uint64);
-    input_visitor_test_add("/visitor/input/list_union/bool",
-                           NULL, test_visitor_in_list_union_bool);
-    input_visitor_test_add("/visitor/input/list_union/str",
-                           NULL, test_visitor_in_list_union_string);
-    input_visitor_test_add("/visitor/input/list_union/number",
-                           NULL, test_visitor_in_list_union_number);
     input_visitor_test_add("/visitor/input/fail/struct",
                            NULL, test_visitor_in_fail_struct);
     input_visitor_test_add("/visitor/input/fail/struct-nested",
@@ -1368,8 +1206,6 @@ int main(int argc, char **argv)
                            NULL, test_visitor_in_fail_union_flat_no_discrim);
     input_visitor_test_add("/visitor/input/fail/alternate",
                            NULL, test_visitor_in_fail_alternate);
-    input_visitor_test_add("/visitor/input/fail/union-list",
-                           NULL, test_visitor_in_fail_union_list);
     input_visitor_test_add("/visitor/input/qapi-introspect",
                            NULL, test_visitor_in_qmp_introspect);
 
-- 
2.31.1


