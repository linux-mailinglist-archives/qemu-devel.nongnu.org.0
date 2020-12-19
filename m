Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 729712DEE5F
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 12:05:37 +0100 (CET)
Received: from localhost ([::1]:38806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqa3M-0008TY-EL
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 06:05:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZts-0004qx-D2
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtl-0007Gx-Ef
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608375340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SllfA2N6rUeiGlBN0XXzFzmBSwlJl7y67Ae4fWix+Zs=;
 b=IJsykYtcS2v3aVob6NK8H4M78hWqkIdmtXEw5GtqnzRj9fZJ0cewqUZ5VUrJ45S5rxnBXZ
 JGouxkqxOo/HzrN5ISwsO65EwTNLqOhP1fEX00bGJ72faAZULeRgoHXarzDH/1NQ6y3V34
 AtoWz2l/xL1nTD1HQIPtcu+xX3W5yKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-9FUwyJhFM5GYmjwDQLj6SQ-1; Sat, 19 Dec 2020 05:55:38 -0500
X-MC-Unique: 9FUwyJhFM5GYmjwDQLj6SQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12750180A096;
 Sat, 19 Dec 2020 10:55:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9AAB5D769;
 Sat, 19 Dec 2020 10:55:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C25491125643; Sat, 19 Dec 2020 11:55:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/33] qobject: Drop qstring_get_try_str()
Date: Sat, 19 Dec 2020 11:55:25 +0100
Message-Id: <20201219105532.1734134-27-armbru@redhat.com>
In-Reply-To: <20201219105532.1734134-1-armbru@redhat.com>
References: <20201219105532.1734134-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

No users left outside tests/, and the ones in tests/ can just as well
use qstring_get_str().  Do that, and drop the function.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201211171152.146877-14-armbru@redhat.com>
---
 include/qapi/qmp/qstring.h |  1 -
 qobject/qstring.c          | 10 ----------
 tests/check-qjson.c        | 11 +++++------
 3 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/include/qapi/qmp/qstring.h b/include/qapi/qmp/qstring.h
index 56034dae54..53567db6c0 100644
--- a/include/qapi/qmp/qstring.h
+++ b/include/qapi/qmp/qstring.h
@@ -28,7 +28,6 @@ QString *qstring_from_substr(const char *str, size_t start, size_t end);
 QString *qstring_from_gstring(GString *gstr);
 size_t qstring_get_length(const QString *qstring);
 const char *qstring_get_str(const QString *qstring);
-const char *qstring_get_try_str(const QString *qstring);
 void qstring_append_int(QString *qstring, int64_t value);
 void qstring_append(QString *qstring, const char *str);
 void qstring_append_chr(QString *qstring, int c);
diff --git a/qobject/qstring.c b/qobject/qstring.c
index cfe3f3bf00..ea86d80cf0 100644
--- a/qobject/qstring.c
+++ b/qobject/qstring.c
@@ -139,16 +139,6 @@ const char *qstring_get_str(const QString *qstring)
     return qstring->string;
 }
 
-/**
- * qstring_get_try_str(): Return a pointer to the stored string
- *
- * NOTE: will return NULL if qstring is not provided.
- */
-const char *qstring_get_try_str(const QString *qstring)
-{
-    return qstring ? qstring_get_str(qstring) : NULL;
-}
-
 /**
  * qstring_is_equal(): Test whether the two QStrings are equal
  */
diff --git a/tests/check-qjson.c b/tests/check-qjson.c
index 337add0838..c845f91d43 100644
--- a/tests/check-qjson.c
+++ b/tests/check-qjson.c
@@ -89,7 +89,7 @@ static void escaped_string(void)
         for (j = 0; j < 2; j++) {
             if (test_cases[i].utf8_out) {
                 cstr = from_json_str(test_cases[i].json_in, j, &error_abort);
-                g_assert_cmpstr(qstring_get_try_str(cstr),
+                g_assert_cmpstr(qstring_get_str(cstr),
                                 ==, test_cases[i].utf8_out);
                 if (!test_cases[i].skip) {
                     jstr = to_json_str(cstr);
@@ -751,7 +751,7 @@ static void utf8_string(void)
             /* Parse @json_in, expect @utf8_out */
             if (utf8_out) {
                 str = from_json_str(json_in, j, &error_abort);
-                g_assert_cmpstr(qstring_get_try_str(str), ==, utf8_out);
+                g_assert_cmpstr(qstring_get_str(str), ==, utf8_out);
                 qobject_unref(str);
             } else {
                 str = from_json_str(json_in, j, NULL);
@@ -782,7 +782,7 @@ static void utf8_string(void)
             /* Parse @json_out right back, unless it has replacements */
             if (!strstr(json_out, "\\uFFFD")) {
                 str = from_json_str(json_out, j, &error_abort);
-                g_assert_cmpstr(qstring_get_try_str(str), ==, utf8_in);
+                g_assert_cmpstr(qstring_get_str(str), ==, utf8_in);
                 qobject_unref(str);
             }
         }
@@ -1021,9 +1021,8 @@ static void interpolation_valid(void)
 
     /* string */
 
-    qstr = qobject_to(QString,
-                     qobject_from_jsonf_nofail("%s", value_s));
-    g_assert_cmpstr(qstring_get_try_str(qstr), ==, value_s);
+    qstr = qobject_to(QString, qobject_from_jsonf_nofail("%s", value_s));
+    g_assert_cmpstr(qstring_get_str(qstr), ==, value_s);
     qobject_unref(qstr);
 
     /* object */
-- 
2.26.2


