Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 935382DEE71
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 12:12:50 +0100 (CET)
Received: from localhost ([::1]:36312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqaAL-0002GG-Kn
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 06:12:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZu2-0005NI-HW
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtn-0007Ic-AL
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608375342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vqhxR6uXG1fRCc/R6LcSH7A4bTgvfonW5xTAWh7dTgA=;
 b=Ard8uiZHJDuFj54HReJQwmsODr990+1821YI2GPAfOoU9iKURj5JAoFnY+BJpSYtwKXrq+
 uBX2MaeRBLpdU548ja4UieyjdkEv8APi02chzPAN01aGXwiX89Xmn6r2xIKpkhsXg/am4P
 T8Z5Ze1zwZKUUUwW2dnHiZzW23QKXLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-7TazG8DyMquqPgRr-eWapw-1; Sat, 19 Dec 2020 05:55:39 -0500
X-MC-Unique: 7TazG8DyMquqPgRr-eWapw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E4658015C4;
 Sat, 19 Dec 2020 10:55:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C6305D9C2;
 Sat, 19 Dec 2020 10:55:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EAA9E112564E; Sat, 19 Dec 2020 11:55:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/33] qobject: Make QString immutable
Date: Sat, 19 Dec 2020 11:55:32 +0100
Message-Id: <20201219105532.1734134-34-armbru@redhat.com>
In-Reply-To: <20201219105532.1734134-1-armbru@redhat.com>
References: <20201219105532.1734134-1-armbru@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The functions to modify a QString's string are all unused now.  Drop
them, and make the string immutable.  Saves 16 bytes per QString on my
system.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201211171152.146877-21-armbru@redhat.com>
---
 include/qapi/qmp/qstring.h |  8 +----
 qobject/qstring.c          | 65 ++------------------------------------
 tests/check-qobject.c      |  3 +-
 tests/check-qstring.c      | 16 ----------
 4 files changed, 4 insertions(+), 88 deletions(-)

diff --git a/include/qapi/qmp/qstring.h b/include/qapi/qmp/qstring.h
index 53567db6c0..1d8ba46936 100644
--- a/include/qapi/qmp/qstring.h
+++ b/include/qapi/qmp/qstring.h
@@ -17,19 +17,13 @@
 
 struct QString {
     struct QObjectBase_ base;
-    char *string;
-    size_t length;
-    size_t capacity;
+    const char *string;
 };
 
 QString *qstring_new(void);
 QString *qstring_from_str(const char *str);
 QString *qstring_from_substr(const char *str, size_t start, size_t end);
 QString *qstring_from_gstring(GString *gstr);
-size_t qstring_get_length(const QString *qstring);
 const char *qstring_get_str(const QString *qstring);
-void qstring_append_int(QString *qstring, int64_t value);
-void qstring_append(QString *qstring, const char *str);
-void qstring_append_chr(QString *qstring, int c);
 
 #endif /* QSTRING_H */
diff --git a/qobject/qstring.c b/qobject/qstring.c
index ea86d80cf0..b4613899b9 100644
--- a/qobject/qstring.c
+++ b/qobject/qstring.c
@@ -24,14 +24,6 @@ QString *qstring_new(void)
     return qstring_from_str("");
 }
 
-/**
- * qstring_get_length(): Get the length of a QString
- */
-size_t qstring_get_length(const QString *qstring)
-{
-    return qstring->length;
-}
-
 /**
  * qstring_from_substr(): Create a new QString from a C string substring
  *
@@ -42,18 +34,9 @@ QString *qstring_from_substr(const char *str, size_t start, size_t end)
     QString *qstring;
 
     assert(start <= end);
-
     qstring = g_malloc(sizeof(*qstring));
     qobject_init(QOBJECT(qstring), QTYPE_QSTRING);
-
-    qstring->length = end - start;
-    qstring->capacity = qstring->length;
-
-    assert(qstring->capacity < SIZE_MAX);
-    qstring->string = g_malloc(qstring->capacity + 1);
-    memcpy(qstring->string, str + start, qstring->length);
-    qstring->string[qstring->length] = 0;
-
+    qstring->string = g_strndup(str + start, end - start);
     return qstring;
 }
 
@@ -79,55 +62,11 @@ QString *qstring_from_gstring(GString *gstr)
 
     qstring = g_malloc(sizeof(*qstring));
     qobject_init(QOBJECT(qstring), QTYPE_QSTRING);
-    qstring->length = gstr->len;
-    qstring->capacity = gstr->allocated_len;
     qstring->string = g_string_free(gstr, false);
     return qstring;
 }
 
 
-static void capacity_increase(QString *qstring, size_t len)
-{
-    if (qstring->capacity < (qstring->length + len)) {
-        assert(len <= SIZE_MAX - qstring->capacity);
-        qstring->capacity += len;
-        assert(qstring->capacity <= SIZE_MAX / 2);
-        qstring->capacity *= 2; /* use exponential growth */
-
-        qstring->string = g_realloc(qstring->string, qstring->capacity + 1);
-    }
-}
-
-/* qstring_append(): Append a C string to a QString
- */
-void qstring_append(QString *qstring, const char *str)
-{
-    size_t len = strlen(str);
-
-    capacity_increase(qstring, len);
-    memcpy(qstring->string + qstring->length, str, len);
-    qstring->length += len;
-    qstring->string[qstring->length] = 0;
-}
-
-void qstring_append_int(QString *qstring, int64_t value)
-{
-    char num[32];
-
-    snprintf(num, sizeof(num), "%" PRId64, value);
-    qstring_append(qstring, num);
-}
-
-/**
- * qstring_append_chr(): Append a C char to a QString
- */
-void qstring_append_chr(QString *qstring, int c)
-{
-    capacity_increase(qstring, 1);
-    qstring->string[qstring->length++] = c;
-    qstring->string[qstring->length] = 0;
-}
-
 /**
  * qstring_get_str(): Return a pointer to the stored string
  *
@@ -158,6 +97,6 @@ void qstring_destroy_obj(QObject *obj)
 
     assert(obj != NULL);
     qs = qobject_to(QString, obj);
-    g_free(qs->string);
+    g_free((char *)qs->string);
     g_free(qs);
 }
diff --git a/tests/check-qobject.c b/tests/check-qobject.c
index 6b6deaeb8b..c1713d15af 100644
--- a/tests/check-qobject.c
+++ b/tests/check-qobject.c
@@ -155,8 +155,7 @@ static void qobject_is_equal_string_test(void)
     str_case = qstring_from_str("Foo");
 
     /* Should yield "foo" */
-    str_built = qstring_from_substr("form", 0, 2);
-    qstring_append_chr(str_built, 'o');
+    str_built = qstring_from_substr("buffoon", 3, 6);
 
     check_unequal(str_base, str_whitespace_0, str_whitespace_1,
                   str_whitespace_2, str_whitespace_3, str_case);
diff --git a/tests/check-qstring.c b/tests/check-qstring.c
index 2d079921e3..4bf9772093 100644
--- a/tests/check-qstring.c
+++ b/tests/check-qstring.c
@@ -47,21 +47,6 @@ static void qstring_get_str_test(void)
     qobject_unref(qstring);
 }
 
-static void qstring_append_chr_test(void)
-{
-    int i;
-    QString *qstring;
-    const char *str = "qstring append char unit-test";
-
-    qstring = qstring_new();
-
-    for (i = 0; str[i]; i++)
-        qstring_append_chr(qstring, str[i]);
-
-    g_assert(strcmp(str, qstring_get_str(qstring)) == 0);
-    qobject_unref(qstring);
-}
-
 static void qstring_from_substr_test(void)
 {
     QString *qs;
@@ -90,7 +75,6 @@ int main(int argc, char **argv)
 
     g_test_add_func("/public/from_str", qstring_from_str_test);
     g_test_add_func("/public/get_str", qstring_get_str_test);
-    g_test_add_func("/public/append_chr", qstring_append_chr_test);
     g_test_add_func("/public/from_substr", qstring_from_substr_test);
     g_test_add_func("/public/to_qstring", qobject_to_qstring_test);
 
-- 
2.26.2


