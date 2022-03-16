Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D979E4DAE31
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 11:24:38 +0100 (CET)
Received: from localhost ([::1]:58284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUQpZ-000153-UG
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 06:24:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQNK-0002ap-IY
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:55:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQNI-00087M-NT
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:55:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647424524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g2wl/WON0DnlIUHcKBeft4l6C8oe3AH31RxJEpQWvms=;
 b=JpcwE/+WWcKXzdB1fBUTdit5fbE/9uxDhT0DwymYXAuhryfwvTDP2ABII8gfCDLHtUSVCr
 vtHf2uSyDL0C5G9R7eUlbPwSzhp8EQyeKHf7wYQorT/LDMpNYwa63jE1IvuT1C3zuHB475
 32XDUP1jIqoOesiN/zYNU6TY/YiPuyU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-EkZVVKPTMceD2mlUfiOyhw-1; Wed, 16 Mar 2022 05:55:22 -0400
X-MC-Unique: EkZVVKPTMceD2mlUfiOyhw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 946531C06903
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 09:55:22 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F038130BA4;
 Wed, 16 Mar 2022 09:55:01 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 26/27] tests: replace free_all() usage with g_auto
Date: Wed, 16 Mar 2022 13:54:59 +0400
Message-Id: <20220316095459.2613885-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Use more idiomatic glib/auto-style code.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/unit/check-qobject.c | 127 ++++++++++++-------------------------
 1 file changed, 40 insertions(+), 87 deletions(-)

diff --git a/tests/unit/check-qobject.c b/tests/unit/check-qobject.c
index c3d50e99949a..7903ebf4cf80 100644
--- a/tests/unit/check-qobject.c
+++ b/tests/unit/check-qobject.c
@@ -74,21 +74,6 @@ static void do_test_equality(bool expected, int _, ...)
 #define check_unequal(...) \
     do_test_equality(false, 0, __VA_ARGS__, &test_equality_end_of_arguments)
 
-static void do_free_all(int _, ...)
-{
-    va_list ap;
-    QObject *obj;
-
-    va_start(ap, _);
-    while ((obj = va_arg(ap, QObject *)) != NULL) {
-        qobject_unref(obj);
-    }
-    va_end(ap);
-}
-
-#define free_all(...) \
-    do_free_all(0, __VA_ARGS__, NULL)
-
 static void qobject_is_equal_null_test(void)
 {
     check_unequal(qnull(), NULL);
@@ -96,15 +81,14 @@ static void qobject_is_equal_null_test(void)
 
 static void qobject_is_equal_num_test(void)
 {
-    QNum *u0, *i0, *d0, *dnan, *um42, *im42, *dm42;
+    g_autoptr(QNum) u0 = qnum_from_uint(0u);
+    g_autoptr(QNum) i0 = qnum_from_int(0);
+    g_autoptr(QNum) d0 = qnum_from_double(0.0);
+    g_autoptr(QNum) dnan = qnum_from_double(NAN);
+    g_autoptr(QNum) um42 = qnum_from_uint((uint64_t)-42);
+    g_autoptr(QNum) im42 = qnum_from_int(-42);
+    g_autoptr(QNum) dm42 = qnum_from_double(-42.0);
 
-    u0 = qnum_from_uint(0u);
-    i0 = qnum_from_int(0);
-    d0 = qnum_from_double(0.0);
-    dnan = qnum_from_double(NAN);
-    um42 = qnum_from_uint((uint64_t)-42);
-    im42 = qnum_from_int(-42);
-    dm42 = qnum_from_double(-42.0);
 
     /* Integers representing a mathematically equal number should
      * compare equal */
@@ -121,60 +105,45 @@ static void qobject_is_equal_num_test(void)
     check_unequal(um42, im42);
     check_unequal(um42, dm42);
     check_unequal(im42, dm42);
-
-    free_all(u0, i0, d0, dnan, um42, im42, dm42);
 }
 
 static void qobject_is_equal_bool_test(void)
 {
-    QBool *btrue_0, *btrue_1, *bfalse_0, *bfalse_1;
-
-    btrue_0 = qbool_from_bool(true);
-    btrue_1 = qbool_from_bool(true);
-    bfalse_0 = qbool_from_bool(false);
-    bfalse_1 = qbool_from_bool(false);
+    g_autoptr(QBool) btrue_0 = qbool_from_bool(true);
+    g_autoptr(QBool) btrue_1 = qbool_from_bool(true);
+    g_autoptr(QBool) bfalse_0 = qbool_from_bool(false);
+    g_autoptr(QBool) bfalse_1 = qbool_from_bool(false);
 
     check_equal(btrue_0, btrue_1);
     check_equal(bfalse_0, bfalse_1);
     check_unequal(btrue_0, bfalse_0);
-
-    free_all(btrue_0, btrue_1, bfalse_0, bfalse_1);
 }
 
 static void qobject_is_equal_string_test(void)
 {
-    QString *str_base, *str_whitespace_0, *str_whitespace_1, *str_whitespace_2;
-    QString *str_whitespace_3, *str_case, *str_built;
-
-    str_base = qstring_from_str("foo");
-    str_whitespace_0 = qstring_from_str(" foo");
-    str_whitespace_1 = qstring_from_str("foo ");
-    str_whitespace_2 = qstring_from_str("foo\b");
-    str_whitespace_3 = qstring_from_str("fooo\b");
-    str_case = qstring_from_str("Foo");
-
+    g_autoptr(QString) str_base = qstring_from_str("foo");
+    g_autoptr(QString) str_whitespace_0 = qstring_from_str(" foo");
+    g_autoptr(QString) str_whitespace_1 = qstring_from_str("foo ");
+    g_autoptr(QString) str_whitespace_2 = qstring_from_str("foo\b");
+    g_autoptr(QString) str_whitespace_3 = qstring_from_str("fooo\b");
+    g_autoptr(QString) str_case = qstring_from_str("Foo");
     /* Should yield "foo" */
-    str_built = qstring_from_substr("buffoon", 3, 6);
+    g_autoptr(QString) str_built = qstring_from_substr("buffoon", 3, 6);
 
     check_unequal(str_base, str_whitespace_0, str_whitespace_1,
                   str_whitespace_2, str_whitespace_3, str_case);
 
     check_equal(str_base, str_built);
-
-    free_all(str_base, str_whitespace_0, str_whitespace_1, str_whitespace_2,
-             str_whitespace_3, str_case, str_built);
 }
 
 static void qobject_is_equal_list_test(void)
 {
-    QList *list_0, *list_1, *list_cloned;
-    QList *list_reordered, *list_longer, *list_shorter;
-
-    list_0 = qlist_new();
-    list_1 = qlist_new();
-    list_reordered = qlist_new();
-    list_longer = qlist_new();
-    list_shorter = qlist_new();
+    g_autoptr(QList) list_0 = qlist_new();
+    g_autoptr(QList) list_1 = qlist_new();
+    g_autoptr(QList) list_reordered = qlist_new();
+    g_autoptr(QList) list_longer = qlist_new();
+    g_autoptr(QList) list_shorter = qlist_new();
+    g_autoptr(QList) list_cloned = NULL;
 
     qlist_append_int(list_0, 1);
     qlist_append_int(list_0, 2);
@@ -205,26 +174,20 @@ static void qobject_is_equal_list_test(void)
      * itself */
     qlist_append(list_0, qnum_from_double(NAN));
     g_assert(qobject_is_equal(QOBJECT(list_0), QOBJECT(list_0)) == false);
-
-    free_all(list_0, list_1, list_cloned, list_reordered, list_longer,
-             list_shorter);
 }
 
 static void qobject_is_equal_dict_test(void)
 {
-    QDict *dict_0, *dict_1, *dict_cloned;
-    QDict *dict_different_key, *dict_different_value, *dict_different_null_key;
-    QDict *dict_longer, *dict_shorter, *dict_nested;
-    QDict *dict_crumpled;
-
-    dict_0 = qdict_new();
-    dict_1 = qdict_new();
-    dict_different_key = qdict_new();
-    dict_different_value = qdict_new();
-    dict_different_null_key = qdict_new();
-    dict_longer = qdict_new();
-    dict_shorter = qdict_new();
-    dict_nested = qdict_new();
+    g_autoptr(QDict) dict_cloned = NULL;
+    g_autoptr(QDict) dict_crumpled = NULL;
+    g_autoptr(QDict) dict_0 = qdict_new();
+    g_autoptr(QDict) dict_1 = qdict_new();
+    g_autoptr(QDict) dict_different_key = qdict_new();
+    g_autoptr(QDict) dict_different_value = qdict_new();
+    g_autoptr(QDict) dict_different_null_key = qdict_new();
+    g_autoptr(QDict) dict_longer = qdict_new();
+    g_autoptr(QDict) dict_shorter = qdict_new();
+    g_autoptr(QDict) dict_nested = qdict_new();
 
     qdict_put_int(dict_0, "f.o", 1);
     qdict_put_int(dict_0, "bar", 2);
@@ -284,31 +247,21 @@ static void qobject_is_equal_dict_test(void)
      * itself */
     qdict_put(dict_0, "NaN", qnum_from_double(NAN));
     g_assert(qobject_is_equal(QOBJECT(dict_0), QOBJECT(dict_0)) == false);
-
-    free_all(dict_0, dict_1, dict_cloned, dict_different_key,
-             dict_different_value, dict_different_null_key, dict_longer,
-             dict_shorter, dict_nested, dict_crumpled);
 }
 
 static void qobject_is_equal_conversion_test(void)
 {
-    QNum *u0, *i0, *d0;
-    QString *s0, *s_empty;
-    QBool *bfalse;
-
-    u0 = qnum_from_uint(0u);
-    i0 = qnum_from_int(0);
-    d0 = qnum_from_double(0.0);
-    s0 = qstring_from_str("0");
-    s_empty = qstring_new();
-    bfalse = qbool_from_bool(false);
+    g_autoptr(QNum) u0 = qnum_from_uint(0u);
+    g_autoptr(QNum) i0 = qnum_from_int(0);
+    g_autoptr(QNum) d0 = qnum_from_double(0.0);
+    g_autoptr(QString) s0 = qstring_from_str("0");
+    g_autoptr(QString) s_empty = qstring_new();
+    g_autoptr(QBool) bfalse = qbool_from_bool(false);
 
     /* No automatic type conversion */
     check_unequal(u0, s0, s_empty, bfalse, qnull(), NULL);
     check_unequal(i0, s0, s_empty, bfalse, qnull(), NULL);
     check_unequal(d0, s0, s_empty, bfalse, qnull(), NULL);
-
-    free_all(u0, i0, d0, s0, s_empty, bfalse);
 }
 
 int main(int argc, char **argv)
-- 
2.35.1.273.ge6ebfd0e8cbb


