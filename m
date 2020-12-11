Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43992D7D7A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:56:04 +0100 (CET)
Received: from localhost ([::1]:41028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmeB-0001IN-Rq
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knlxl-0007St-16
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:12:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knlxW-0003PX-QU
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:12:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R/UV1Crvy15NYpblfBUGq7qt+AX6MV2tyK8bA7ocB9w=;
 b=dAeGzwNbvpo7Wvz/Bee87IYjrBnQg91Udx5nH6cabg5P3QA0vMBufnfFSf2lGjx/Y2QIyO
 7/mYy21E96OkJWg2g/2kHAsJLZw1u/wD5CCEUy020g/ENMaSpZ5GNxLlUjgG09kdnVo+xK
 mQoIs2dLhRRHq2qGPHBTY4yJwj4k7YA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-s-egjbscPFGKFwPMDzt4Qw-1; Fri, 11 Dec 2020 12:11:55 -0500
X-MC-Unique: s-egjbscPFGKFwPMDzt4Qw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8960A107ACF5;
 Fri, 11 Dec 2020 17:11:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 329815F9A6;
 Fri, 11 Dec 2020 17:11:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A6C7F112F04E; Fri, 11 Dec 2020 18:11:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/20] qobject: Make qobject_to_json_pretty() take a pretty
 argument
Date: Fri, 11 Dec 2020 18:11:35 +0100
Message-Id: <20201211171152.146877-4-armbru@redhat.com>
In-Reply-To: <20201211171152.146877-1-armbru@redhat.com>
References: <20201211171152.146877-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qapi/qmp/qjson.h |  2 +-
 monitor/qmp.c            |  2 +-
 qemu-img.c               |  8 ++++----
 qobject/qjson.c          | 28 +++++++++++-----------------
 qom/qom-hmp-cmds.c       |  2 +-
 tests/qtest/libqtest.c   |  2 +-
 6 files changed, 19 insertions(+), 25 deletions(-)

diff --git a/include/qapi/qmp/qjson.h b/include/qapi/qmp/qjson.h
index 5ebbe5a118..82f4534f16 100644
--- a/include/qapi/qmp/qjson.h
+++ b/include/qapi/qmp/qjson.h
@@ -26,6 +26,6 @@ QDict *qdict_from_jsonf_nofail(const char *string, ...)
     GCC_FMT_ATTR(1, 2);
 
 QString *qobject_to_json(const QObject *obj);
-QString *qobject_to_json_pretty(const QObject *obj);
+QString *qobject_to_json_pretty(const QObject *obj, bool pretty);
 
 #endif /* QJSON_H */
diff --git a/monitor/qmp.c b/monitor/qmp.c
index b42f8c6af3..1197c50b20 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -112,7 +112,7 @@ void qmp_send_response(MonitorQMP *mon, const QDict *rsp)
     const QObject *data = QOBJECT(rsp);
     QString *json;
 
-    json = mon->pretty ? qobject_to_json_pretty(data) : qobject_to_json(data);
+    json = qobject_to_json_pretty(data, mon->pretty);
     assert(json != NULL);
 
     qstring_append_chr(json, '\n');
diff --git a/qemu-img.c b/qemu-img.c
index 8bdea40b58..59ccd4fdd2 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -633,7 +633,7 @@ static void dump_json_image_check(ImageCheck *check, bool quiet)
 
     visit_type_ImageCheck(v, NULL, &check, &error_abort);
     visit_complete(v, &obj);
-    str = qobject_to_json_pretty(obj);
+    str = qobject_to_json_pretty(obj, true);
     assert(str != NULL);
     qprintf(quiet, "%s\n", qstring_get_str(str));
     qobject_unref(obj);
@@ -2796,7 +2796,7 @@ static void dump_json_image_info_list(ImageInfoList *list)
 
     visit_type_ImageInfoList(v, NULL, &list, &error_abort);
     visit_complete(v, &obj);
-    str = qobject_to_json_pretty(obj);
+    str = qobject_to_json_pretty(obj, true);
     assert(str != NULL);
     printf("%s\n", qstring_get_str(str));
     qobject_unref(obj);
@@ -2812,7 +2812,7 @@ static void dump_json_image_info(ImageInfo *info)
 
     visit_type_ImageInfo(v, NULL, &info, &error_abort);
     visit_complete(v, &obj);
-    str = qobject_to_json_pretty(obj);
+    str = qobject_to_json_pretty(obj, true);
     assert(str != NULL);
     printf("%s\n", qstring_get_str(str));
     qobject_unref(obj);
@@ -5243,7 +5243,7 @@ static void dump_json_block_measure_info(BlockMeasureInfo *info)
 
     visit_type_BlockMeasureInfo(v, NULL, &info, &error_abort);
     visit_complete(v, &obj);
-    str = qobject_to_json_pretty(obj);
+    str = qobject_to_json_pretty(obj, true);
     assert(str != NULL);
     printf("%s\n", qstring_get_str(str));
     qobject_unref(obj);
diff --git a/qobject/qjson.c b/qobject/qjson.c
index f1f2c69704..523a4ab8de 100644
--- a/qobject/qjson.c
+++ b/qobject/qjson.c
@@ -149,8 +149,6 @@ QDict *qdict_from_jsonf_nofail(const char *string, ...)
     return qdict;
 }
 
-static void to_json(const QObject *obj, QString *str, int pretty, int indent);
-
 static void json_pretty_newline(QString *str, bool pretty, int indent)
 {
     int i;
@@ -163,7 +161,7 @@ static void json_pretty_newline(QString *str, bool pretty, int indent)
     }
 }
 
-static void to_json(const QObject *obj, QString *str, int pretty, int indent)
+static void to_json(const QObject *obj, QString *str, bool pretty, int indent)
 {
     switch (qobject_type(obj)) {
     case QTYPE_QNULL:
@@ -294,20 +292,16 @@ static void to_json(const QObject *obj, QString *str, int pretty, int indent)
     }
 }
 
+QString *qobject_to_json_pretty(const QObject *obj, bool pretty)
+{
+    QString *str = qstring_new();
+
+    to_json(obj, str, pretty, 0);
+
+    return str;
+}
+
 QString *qobject_to_json(const QObject *obj)
 {
-    QString *str = qstring_new();
-
-    to_json(obj, str, 0, 0);
-
-    return str;
-}
-
-QString *qobject_to_json_pretty(const QObject *obj)
-{
-    QString *str = qstring_new();
-
-    to_json(obj, str, 1, 0);
-
-    return str;
+    return qobject_to_json_pretty(obj, false);
 }
diff --git a/qom/qom-hmp-cmds.c b/qom/qom-hmp-cmds.c
index 8861a109d5..6b96dbe906 100644
--- a/qom/qom-hmp-cmds.c
+++ b/qom/qom-hmp-cmds.c
@@ -78,7 +78,7 @@ void hmp_qom_get(Monitor *mon, const QDict *qdict)
     QObject *obj = qmp_qom_get(path, property, &err);
 
     if (err == NULL) {
-        QString *str = qobject_to_json_pretty(obj);
+        QString *str = qobject_to_json_pretty(obj, true);
         monitor_printf(mon, "%s\n", qstring_get_str(str));
         qobject_unref(str);
     }
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index e49f3a1e45..213fa4f8fe 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1197,7 +1197,7 @@ void qtest_qmp_assert_success(QTestState *qts, const char *fmt, ...)
 
     g_assert(response);
     if (!qdict_haskey(response, "return")) {
-        QString *s = qobject_to_json_pretty(QOBJECT(response));
+        QString *s = qobject_to_json_pretty(QOBJECT(response), true);
         g_test_message("%s", qstring_get_str(s));
         qobject_unref(s);
     }
-- 
2.26.2


