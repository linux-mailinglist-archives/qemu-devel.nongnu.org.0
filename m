Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464762DEE41
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 11:57:26 +0100 (CET)
Received: from localhost ([::1]:41860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqZvR-0006Un-6l
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 05:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtl-0004cM-4v
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZti-0007Dt-SK
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608375337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mLj1Wb1Z/FFpGLjsvjmSqxHr3jcfC4o/Kgc33fRcvio=;
 b=LnxS20WVH3Gqtjh+04XPTw0GV+q4Uq1SUj+mDarfRmscIjlpKF5yQuc0R0Zd46LtNLIHaE
 D3xO4NkeXFvY/MYyOrDKi++OmiqXnPvxi6TcFyBZeRGGiVEjJllcy7PL5JmxgZpdh4Klfe
 S6Y3w0qmGkCDsLkTg2/2iYrlFY6HwMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-YlTmajp1N1OICs--_ZDFBQ-1; Sat, 19 Dec 2020 05:55:35 -0500
X-MC-Unique: YlTmajp1N1OICs--_ZDFBQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DFED800D53;
 Sat, 19 Dec 2020 10:55:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BEF7F10013C0;
 Sat, 19 Dec 2020 10:55:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 54C4811275D0; Sat, 19 Dec 2020 11:55:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/33] tests/check-qjson: Don't skip funny QNumber to JSON
 conversions
Date: Sat, 19 Dec 2020 11:55:03 +0100
Message-Id: <20201219105532.1734134-5-armbru@redhat.com>
In-Reply-To: <20201219105532.1734134-1-armbru@redhat.com>
References: <20201219105532.1734134-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

simple_number() and float_number() convert from JSON to QNumber and
back.

simple_number() tests "-0", but skips the conversion back to JSON,
because it yields "0", not "-0".  Works as intended, so better cover
it: don't skip, but expect the funny result.

float_number() tests "-32.20e-10", but skips the conversion back to
JSON, because it yields "-0".  This is a known bug in
qnum_to_string(), marked FIXME there.  Cover the bug: don't skip, but
expect the funny result.

While there, switch from g_assert() to g_assert_cmpstr() & friends for
friendlier test failures.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201210161452.2813491-2-armbru@redhat.com>
---
 tests/check-qjson.c | 55 +++++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 30 deletions(-)

diff --git a/tests/check-qjson.c b/tests/check-qjson.c
index 9a02079099..2a5852904a 100644
--- a/tests/check-qjson.c
+++ b/tests/check-qjson.c
@@ -793,37 +793,35 @@ static void utf8_string(void)
 
 static void simple_number(void)
 {
-    int i;
     struct {
         const char *encoded;
         int64_t decoded;
-        int skip;
+        const char *reencoded;
     } test_cases[] = {
         { "0", 0 },
         { "1234", 1234 },
         { "1", 1 },
         { "-32", -32 },
-        { "-0", 0, .skip = 1 },
-        { },
+        { "-0", 0, "0" },
+        {},
     };
+    int i;
+    QNum *qnum;
+    int64_t val;
+    QString *str;
 
     for (i = 0; test_cases[i].encoded; i++) {
-        QNum *qnum;
-        int64_t val;
-
         qnum = qobject_to(QNum,
                           qobject_from_json(test_cases[i].encoded,
                                             &error_abort));
         g_assert(qnum);
         g_assert(qnum_get_try_int(qnum, &val));
         g_assert_cmpint(val, ==, test_cases[i].decoded);
-        if (test_cases[i].skip == 0) {
-            QString *str;
 
-            str = qobject_to_json(QOBJECT(qnum));
-            g_assert(strcmp(qstring_get_str(str), test_cases[i].encoded) == 0);
-            qobject_unref(str);
-        }
+        str = qobject_to_json(QOBJECT(qnum));
+        g_assert_cmpstr(qstring_get_str(str), ==,
+                        test_cases[i].reencoded ?: test_cases[i].encoded);
+        qobject_unref(str);
 
         qobject_unref(qnum);
     }
@@ -874,35 +872,32 @@ static void large_number(void)
 
 static void float_number(void)
 {
-    int i;
     struct {
         const char *encoded;
         double decoded;
-        int skip;
+        const char *reencoded;
     } test_cases[] = {
         { "32.43", 32.43 },
         { "0.222", 0.222 },
         { "-32.12313", -32.12313 },
-        { "-32.20e-10", -32.20e-10, .skip = 1 },
-        { },
+        { "-32.20e-10", -32.20e-10, "-0" /* BUG */ },
+        {},
     };
+    int i;
+    QNum *qnum;
+    QString *str;
 
     for (i = 0; test_cases[i].encoded; i++) {
-        QObject *obj;
-        QNum *qnum;
-
-        obj = qobject_from_json(test_cases[i].encoded, &error_abort);
-        qnum = qobject_to(QNum, obj);
+        qnum = qobject_to(QNum,
+                          qobject_from_json(test_cases[i].encoded,
+                                            &error_abort));
         g_assert(qnum);
-        g_assert(qnum_get_double(qnum) == test_cases[i].decoded);
+        g_assert_cmpfloat(qnum_get_double(qnum), ==, test_cases[i].decoded);
 
-        if (test_cases[i].skip == 0) {
-            QString *str;
-
-            str = qobject_to_json(obj);
-            g_assert(strcmp(qstring_get_str(str), test_cases[i].encoded) == 0);
-            qobject_unref(str);
-        }
+        str = qobject_to_json(QOBJECT(qnum));
+        g_assert_cmpstr(qstring_get_str(str), ==,
+                        test_cases[i].reencoded ?: test_cases[i].encoded);
+        qobject_unref(str);
 
         qobject_unref(qnum);
     }
-- 
2.26.2


