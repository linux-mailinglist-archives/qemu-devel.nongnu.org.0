Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F382DEE74
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 12:14:58 +0100 (CET)
Received: from localhost ([::1]:43742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqaCP-0005M2-QV
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 06:14:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZty-00058a-6o
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtl-0007Hc-Ku
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608375340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SIpzOs0Qi4hAUrYR57wbXh4KnjXI7OZjtx3Q89JwTyM=;
 b=ErrlxzUyS5H+ei4yYaEsl00aLY8rA+9esunDPHmPUey02LPr1UWUoaSzF67rMQy21CCnG2
 Jdx/nyNMac2VwDl4hYJ2pG2Rzv3WLZCo1mDikC4rvgboWFufiDFM6UYBTrbzBxSEF6QbiG
 xEhIzUlHLMS/BIcbuTkGYlUwuVxEvOI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-7dj6eS17NteZhXet5EroBg-1; Sat, 19 Dec 2020 05:55:38 -0500
X-MC-Unique: 7dj6eS17NteZhXet5EroBg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C47C107ACF7;
 Sat, 19 Dec 2020 10:55:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B734B5884C;
 Sat, 19 Dec 2020 10:55:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9BD1E112689A; Sat, 19 Dec 2020 11:55:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/33] qobject: Change qobject_to_json()'s value to GString
Date: Sat, 19 Dec 2020 11:55:17 +0100
Message-Id: <20201219105532.1734134-19-armbru@redhat.com>
In-Reply-To: <20201219105532.1734134-1-armbru@redhat.com>
References: <20201219105532.1734134-1-armbru@redhat.com>
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

qobject_to_json() and qobject_to_json_pretty() build a GString, then
covert it to QString.  Just one of the callers actually needs a
QString: qemu_rbd_parse_filename().  A few others need a string they
can modify: qmp_send_response(), qga's send_response(), to_json_str(),
and qmp_fd_vsend_fds().  The remainder just need a string.

Change qobject_to_json() and qobject_to_json_pretty() to return the
GString.

qemu_rbd_parse_filename() now has to convert to QString.  All others
save a QString temporary.  to_json_str() actually becomes a bit
simpler, because GString provides more convenient modification
functions.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201211171152.146877-6-armbru@redhat.com>
---
 include/qapi/qmp/qjson.h           |  4 +--
 block.c                            |  6 ++--
 block/rbd.c                        |  2 +-
 monitor/qmp.c                      | 14 ++++----
 qemu-img.c                         | 25 +++++++------
 qga/main.c                         | 22 ++++--------
 qobject/qjson.c                    |  6 ++--
 qom/object_interfaces.c            |  4 +--
 qom/qom-hmp-cmds.c                 |  7 ++--
 tests/check-qjson.c                | 56 ++++++++++++++----------------
 tests/qtest/libqtest.c             | 20 +++++------
 tests/test-visitor-serialization.c |  6 ++--
 12 files changed, 79 insertions(+), 93 deletions(-)

diff --git a/include/qapi/qmp/qjson.h b/include/qapi/qmp/qjson.h
index 82f4534f16..593b40b4e0 100644
--- a/include/qapi/qmp/qjson.h
+++ b/include/qapi/qmp/qjson.h
@@ -25,7 +25,7 @@ QDict *qdict_from_vjsonf_nofail(const char *string, va_list ap)
 QDict *qdict_from_jsonf_nofail(const char *string, ...)
     GCC_FMT_ATTR(1, 2);
 
-QString *qobject_to_json(const QObject *obj);
-QString *qobject_to_json_pretty(const QObject *obj, bool pretty);
+GString *qobject_to_json(const QObject *obj);
+GString *qobject_to_json_pretty(const QObject *obj, bool pretty);
 
 #endif /* QJSON_H */
diff --git a/block.c b/block.c
index 8f177504d4..09d4c6bd25 100644
--- a/block.c
+++ b/block.c
@@ -6995,13 +6995,13 @@ void bdrv_refresh_filename(BlockDriverState *bs)
     if (bs->exact_filename[0]) {
         pstrcpy(bs->filename, sizeof(bs->filename), bs->exact_filename);
     } else {
-        QString *json = qobject_to_json(QOBJECT(bs->full_open_options));
+        GString *json = qobject_to_json(QOBJECT(bs->full_open_options));
         if (snprintf(bs->filename, sizeof(bs->filename), "json:%s",
-                     qstring_get_str(json)) >= sizeof(bs->filename)) {
+                     json->str) >= sizeof(bs->filename)) {
             /* Give user a hint if we truncated things. */
             strcpy(bs->filename + sizeof(bs->filename) - 4, "...");
         }
-        qobject_unref(json);
+        g_string_free(json, true);
     }
 }
 
diff --git a/block/rbd.c b/block/rbd.c
index 9bd2bce716..9071a00e3f 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -232,7 +232,7 @@ static void qemu_rbd_parse_filename(const char *filename, QDict *options,
 
     if (keypairs) {
         qdict_put(options, "=keyvalue-pairs",
-                  qobject_to_json(QOBJECT(keypairs)));
+                  qstring_from_gstring(qobject_to_json(QOBJECT(keypairs))));
     }
 
 done:
diff --git a/monitor/qmp.c b/monitor/qmp.c
index 1197c50b20..374bb4b81c 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -110,15 +110,15 @@ static void monitor_qmp_cleanup_queue_and_resume(MonitorQMP *mon)
 void qmp_send_response(MonitorQMP *mon, const QDict *rsp)
 {
     const QObject *data = QOBJECT(rsp);
-    QString *json;
+    GString *json;
 
     json = qobject_to_json_pretty(data, mon->pretty);
     assert(json != NULL);
 
-    qstring_append_chr(json, '\n');
-    monitor_puts(&mon->common, qstring_get_str(json));
+    g_string_append_c(json, '\n');
+    monitor_puts(&mon->common, json->str);
 
-    qobject_unref(json);
+    g_string_free(json, true);
 }
 
 /*
@@ -320,9 +320,9 @@ static void handle_qmp_command(void *opaque, QObject *req, Error *err)
     } /* else will fail qmp_dispatch() */
 
     if (req && trace_event_get_state_backends(TRACE_HANDLE_QMP_COMMAND)) {
-        QString *req_json = qobject_to_json(req);
-        trace_handle_qmp_command(mon, qstring_get_str(req_json));
-        qobject_unref(req_json);
+        GString *req_json = qobject_to_json(req);
+        trace_handle_qmp_command(mon, req_json->str);
+        g_string_free(req_json, true);
     }
 
     if (qdict && qmp_is_oob(qdict)) {
diff --git a/qemu-img.c b/qemu-img.c
index 1a59dfd3f3..8597d069af 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -33,7 +33,6 @@
 #include "qapi/qobject-output-visitor.h"
 #include "qapi/qmp/qjson.h"
 #include "qapi/qmp/qdict.h"
-#include "qapi/qmp/qstring.h"
 #include "qemu/cutils.h"
 #include "qemu/config-file.h"
 #include "qemu/option.h"
@@ -627,7 +626,7 @@ fail:
 
 static void dump_json_image_check(ImageCheck *check, bool quiet)
 {
-    QString *str;
+    GString *str;
     QObject *obj;
     Visitor *v = qobject_output_visitor_new(&obj);
 
@@ -635,10 +634,10 @@ static void dump_json_image_check(ImageCheck *check, bool quiet)
     visit_complete(v, &obj);
     str = qobject_to_json_pretty(obj, true);
     assert(str != NULL);
-    qprintf(quiet, "%s\n", qstring_get_str(str));
+    qprintf(quiet, "%s\n", str->str);
     qobject_unref(obj);
     visit_free(v);
-    qobject_unref(str);
+    g_string_free(str, true);
 }
 
 static void dump_human_image_check(ImageCheck *check, bool quiet)
@@ -2789,7 +2788,7 @@ static void dump_snapshots(BlockDriverState *bs)
 
 static void dump_json_image_info_list(ImageInfoList *list)
 {
-    QString *str;
+    GString *str;
     QObject *obj;
     Visitor *v = qobject_output_visitor_new(&obj);
 
@@ -2797,15 +2796,15 @@ static void dump_json_image_info_list(ImageInfoList *list)
     visit_complete(v, &obj);
     str = qobject_to_json_pretty(obj, true);
     assert(str != NULL);
-    printf("%s\n", qstring_get_str(str));
+    printf("%s\n", str->str);
     qobject_unref(obj);
     visit_free(v);
-    qobject_unref(str);
+    g_string_free(str, true);
 }
 
 static void dump_json_image_info(ImageInfo *info)
 {
-    QString *str;
+    GString *str;
     QObject *obj;
     Visitor *v = qobject_output_visitor_new(&obj);
 
@@ -2813,10 +2812,10 @@ static void dump_json_image_info(ImageInfo *info)
     visit_complete(v, &obj);
     str = qobject_to_json_pretty(obj, true);
     assert(str != NULL);
-    printf("%s\n", qstring_get_str(str));
+    printf("%s\n", str->str);
     qobject_unref(obj);
     visit_free(v);
-    qobject_unref(str);
+    g_string_free(str, true);
 }
 
 static void dump_human_image_info_list(ImageInfoList *list)
@@ -5236,7 +5235,7 @@ out:
 
 static void dump_json_block_measure_info(BlockMeasureInfo *info)
 {
-    QString *str;
+    GString *str;
     QObject *obj;
     Visitor *v = qobject_output_visitor_new(&obj);
 
@@ -5244,10 +5243,10 @@ static void dump_json_block_measure_info(BlockMeasureInfo *info)
     visit_complete(v, &obj);
     str = qobject_to_json_pretty(obj, true);
     assert(str != NULL);
-    printf("%s\n", qstring_get_str(str));
+    printf("%s\n", str->str);
     qobject_unref(obj);
     visit_free(v);
-    qobject_unref(str);
+    g_string_free(str, true);
 }
 
 static int img_measure(int argc, char **argv)
diff --git a/qga/main.c b/qga/main.c
index dea6a3aa64..e7f8f3b161 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -22,7 +22,6 @@
 #include "qapi/qmp/json-parser.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qjson.h"
-#include "qapi/qmp/qstring.h"
 #include "guest-agent-core.h"
 #include "qga-qapi-init-commands.h"
 #include "qapi/qmp/qerror.h"
@@ -528,8 +527,7 @@ fail:
 
 static int send_response(GAState *s, const QDict *rsp)
 {
-    const char *buf;
-    QString *payload_qstr, *response_qstr;
+    GString *response;
     GIOStatus status;
 
     g_assert(s->channel);
@@ -538,25 +536,19 @@ static int send_response(GAState *s, const QDict *rsp)
         return 0;
     }
 
-    payload_qstr = qobject_to_json(QOBJECT(rsp));
-    if (!payload_qstr) {
+    response = qobject_to_json(QOBJECT(rsp));
+    if (!response) {
         return -EINVAL;
     }
 
     if (s->delimit_response) {
         s->delimit_response = false;
-        response_qstr = qstring_new();
-        qstring_append_chr(response_qstr, QGA_SENTINEL_BYTE);
-        qstring_append(response_qstr, qstring_get_str(payload_qstr));
-        qobject_unref(payload_qstr);
-    } else {
-        response_qstr = payload_qstr;
+        g_string_prepend_c(response, QGA_SENTINEL_BYTE);
     }
 
-    qstring_append_chr(response_qstr, '\n');
-    buf = qstring_get_str(response_qstr);
-    status = ga_channel_write_all(s->channel, buf, strlen(buf));
-    qobject_unref(response_qstr);
+    g_string_append_c(response, '\n');
+    status = ga_channel_write_all(s->channel, response->str, response->len);
+    g_string_free(response, true);
     if (status != G_IO_STATUS_NORMAL) {
         return -EIO;
     }
diff --git a/qobject/qjson.c b/qobject/qjson.c
index e7100a539c..2f690c1816 100644
--- a/qobject/qjson.c
+++ b/qobject/qjson.c
@@ -284,15 +284,15 @@ static void to_json(const QObject *obj, GString *accu, bool pretty, int indent)
     }
 }
 
-QString *qobject_to_json_pretty(const QObject *obj, bool pretty)
+GString *qobject_to_json_pretty(const QObject *obj, bool pretty)
 {
     GString *accu = g_string_new(NULL);
 
     to_json(obj, accu, pretty, 0);
-    return qstring_from_gstring(accu);
+    return accu;
 }
 
-QString *qobject_to_json(const QObject *obj)
+GString *qobject_to_json(const QObject *obj)
 {
     return qobject_to_json_pretty(obj, false);
 }
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index ed896fe764..1e9ad6f08a 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -5,7 +5,6 @@
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/qmp/qjson.h"
-#include "qapi/qmp/qstring.h"
 #include "qapi/qobject-input-visitor.h"
 #include "qom/object_interfaces.h"
 #include "qemu/help_option.h"
@@ -207,7 +206,8 @@ char *object_property_help(const char *name, const char *type,
         g_string_append(str, description);
     }
     if (defval) {
-        g_autofree char *def_json = qstring_free(qobject_to_json(defval), TRUE);
+        g_autofree char *def_json = g_string_free(qobject_to_json(defval),
+                                                  true);
         g_string_append_printf(str, " (default: %s)", def_json);
     }
 
diff --git a/qom/qom-hmp-cmds.c b/qom/qom-hmp-cmds.c
index 6b96dbe906..453fbfeabc 100644
--- a/qom/qom-hmp-cmds.c
+++ b/qom/qom-hmp-cmds.c
@@ -13,7 +13,6 @@
 #include "qapi/qapi-commands-qom.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qjson.h"
-#include "qapi/qmp/qstring.h"
 #include "qom/object.h"
 
 void hmp_qom_list(Monitor *mon, const QDict *qdict)
@@ -78,9 +77,9 @@ void hmp_qom_get(Monitor *mon, const QDict *qdict)
     QObject *obj = qmp_qom_get(path, property, &err);
 
     if (err == NULL) {
-        QString *str = qobject_to_json_pretty(obj, true);
-        monitor_printf(mon, "%s\n", qstring_get_str(str));
-        qobject_unref(str);
+        GString *str = qobject_to_json_pretty(obj, true);
+        monitor_printf(mon, "%s\n", str->str);
+        g_string_free(str, true);
     }
 
     qobject_unref(obj);
diff --git a/tests/check-qjson.c b/tests/check-qjson.c
index ca8fb816e9..337add0838 100644
--- a/tests/check-qjson.c
+++ b/tests/check-qjson.c
@@ -35,17 +35,15 @@ static QString *from_json_str(const char *jstr, bool single, Error **errp)
 
 static char *to_json_str(QString *str)
 {
-    QString *json = qobject_to_json(QOBJECT(str));
-    char *jstr;
+    GString *json = qobject_to_json(QOBJECT(str));
 
     if (!json) {
         return NULL;
     }
     /* peel off double quotes */
-    jstr = g_strndup(qstring_get_str(json) + 1,
-                     qstring_get_length(json) - 2);
-    qobject_unref(json);
-    return jstr;
+    g_string_truncate(json, json->len - 1);
+    g_string_erase(json, 0, 1);
+    return g_string_free(json, false);
 }
 
 static void escaped_string(void)
@@ -809,7 +807,7 @@ static void int_number(void)
     QNum *qnum;
     int64_t ival;
     uint64_t uval;
-    QString *str;
+    GString *str;
 
     for (i = 0; test_cases[i].encoded; i++) {
         qnum = qobject_to(QNum,
@@ -828,9 +826,9 @@ static void int_number(void)
                           (double)test_cases[i].decoded);
 
         str = qobject_to_json(QOBJECT(qnum));
-        g_assert_cmpstr(qstring_get_str(str), ==,
+        g_assert_cmpstr(str->str, ==,
                         test_cases[i].reencoded ?: test_cases[i].encoded);
-        qobject_unref(str);
+        g_string_free(str, true);
 
         qobject_unref(qnum);
     }
@@ -851,7 +849,7 @@ static void uint_number(void)
     QNum *qnum;
     int64_t ival;
     uint64_t uval;
-    QString *str;
+    GString *str;
 
     for (i = 0; test_cases[i].encoded; i++) {
         qnum = qobject_to(QNum,
@@ -865,9 +863,9 @@ static void uint_number(void)
                           (double)test_cases[i].decoded);
 
         str = qobject_to_json(QOBJECT(qnum));
-        g_assert_cmpstr(qstring_get_str(str), ==,
+        g_assert_cmpstr(str->str, ==,
                         test_cases[i].reencoded ?: test_cases[i].encoded);
-        qobject_unref(str);
+        g_string_free(str, true);
 
         qobject_unref(qnum);
     }
@@ -892,7 +890,7 @@ static void float_number(void)
     QNum *qnum;
     int64_t ival;
     uint64_t uval;
-    QString *str;
+    GString *str;
 
     for (i = 0; test_cases[i].encoded; i++) {
         qnum = qobject_to(QNum,
@@ -904,9 +902,9 @@ static void float_number(void)
         g_assert(!qnum_get_try_uint(qnum, &uval));
 
         str = qobject_to_json(QOBJECT(qnum));
-        g_assert_cmpstr(qstring_get_str(str), ==,
+        g_assert_cmpstr(str->str, ==,
                         test_cases[i].reencoded ?: test_cases[i].encoded);
-        qobject_unref(str);
+        g_string_free(str, true);
 
         qobject_unref(qnum);
     }
@@ -917,7 +915,7 @@ static void keyword_literal(void)
     QObject *obj;
     QBool *qbool;
     QNull *null;
-    QString *str;
+    GString *str;
 
     obj = qobject_from_json("true", &error_abort);
     qbool = qobject_to(QBool, obj);
@@ -925,8 +923,8 @@ static void keyword_literal(void)
     g_assert(qbool_get_bool(qbool) == true);
 
     str = qobject_to_json(obj);
-    g_assert(strcmp(qstring_get_str(str), "true") == 0);
-    qobject_unref(str);
+    g_assert_cmpstr(str->str, ==, "true");
+    g_string_free(str, true);
 
     qobject_unref(qbool);
 
@@ -936,8 +934,8 @@ static void keyword_literal(void)
     g_assert(qbool_get_bool(qbool) == false);
 
     str = qobject_to_json(obj);
-    g_assert(strcmp(qstring_get_str(str), "false") == 0);
-    qobject_unref(str);
+    g_assert_cmpstr(str->str, ==, "false");
+    g_string_free(str, true);
 
     qobject_unref(qbool);
 
@@ -1087,7 +1085,7 @@ static void simple_dict(void)
 
     for (i = 0; test_cases[i].encoded; i++) {
         QObject *obj;
-        QString *str;
+        GString *str;
 
         obj = qobject_from_json(test_cases[i].encoded, &error_abort);
         g_assert(qlit_equal_qobject(&test_cases[i].decoded, obj));
@@ -1095,10 +1093,10 @@ static void simple_dict(void)
         str = qobject_to_json(obj);
         qobject_unref(obj);
 
-        obj = qobject_from_json(qstring_get_str(str), &error_abort);
+        obj = qobject_from_json(str->str, &error_abort);
         g_assert(qlit_equal_qobject(&test_cases[i].decoded, obj));
         qobject_unref(obj);
-        qobject_unref(str);
+        g_string_free(str, true);
     }
 }
 
@@ -1196,7 +1194,7 @@ static void simple_list(void)
 
     for (i = 0; test_cases[i].encoded; i++) {
         QObject *obj;
-        QString *str;
+        GString *str;
 
         obj = qobject_from_json(test_cases[i].encoded, &error_abort);
         g_assert(qlit_equal_qobject(&test_cases[i].decoded, obj));
@@ -1204,10 +1202,10 @@ static void simple_list(void)
         str = qobject_to_json(obj);
         qobject_unref(obj);
 
-        obj = qobject_from_json(qstring_get_str(str), &error_abort);
+        obj = qobject_from_json(str->str, &error_abort);
         g_assert(qlit_equal_qobject(&test_cases[i].decoded, obj));
         qobject_unref(obj);
-        qobject_unref(str);
+        g_string_free(str, true);
     }
 }
 
@@ -1258,7 +1256,7 @@ static void simple_whitespace(void)
 
     for (i = 0; test_cases[i].encoded; i++) {
         QObject *obj;
-        QString *str;
+        GString *str;
 
         obj = qobject_from_json(test_cases[i].encoded, &error_abort);
         g_assert(qlit_equal_qobject(&test_cases[i].decoded, obj));
@@ -1266,11 +1264,11 @@ static void simple_whitespace(void)
         str = qobject_to_json(obj);
         qobject_unref(obj);
 
-        obj = qobject_from_json(qstring_get_str(str), &error_abort);
+        obj = qobject_from_json(str->str, &error_abort);
         g_assert(qlit_equal_qobject(&test_cases[i].decoded, obj));
 
         qobject_unref(obj);
-        qobject_unref(str);
+        g_string_free(str, true);
     }
 }
 
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 213fa4f8fe..8e93b0a707 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -652,27 +652,25 @@ void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
     /* No need to send anything for an empty QObject.  */
     if (qobj) {
         int log = getenv("QTEST_LOG") != NULL;
-        QString *qstr = qobject_to_json(qobj);
-        const char *str;
+        GString *str = qobject_to_json(qobj);
 
         /*
          * BUG: QMP doesn't react to input until it sees a newline, an
          * object, or an array.  Work-around: give it a newline.
          */
-        qstring_append_chr(qstr, '\n');
-        str = qstring_get_str(qstr);
+        g_string_append_c(str, '\n');
 
         if (log) {
-            fprintf(stderr, "%s", str);
+            fprintf(stderr, "%s", str->str);
         }
         /* Send QMP request */
         if (fds && fds_num > 0) {
-            socket_send_fds(fd, fds, fds_num, str, qstring_get_length(qstr));
+            socket_send_fds(fd, fds, fds_num, str->str, str->len);
         } else {
-            socket_send(fd, str, qstring_get_length(qstr));
+            socket_send(fd, str->str, str->len);
         }
 
-        qobject_unref(qstr);
+        g_string_free(str, true);
         qobject_unref(qobj);
     }
 }
@@ -1197,9 +1195,9 @@ void qtest_qmp_assert_success(QTestState *qts, const char *fmt, ...)
 
     g_assert(response);
     if (!qdict_haskey(response, "return")) {
-        QString *s = qobject_to_json_pretty(QOBJECT(response), true);
-        g_test_message("%s", qstring_get_str(s));
-        qobject_unref(s);
+        GString *s = qobject_to_json_pretty(QOBJECT(response), true);
+        g_test_message("%s", s->str);
+        g_string_free(s, true);
     }
     g_assert(qdict_haskey(response, "return"));
     qobject_unref(response);
diff --git a/tests/test-visitor-serialization.c b/tests/test-visitor-serialization.c
index dfe120a50d..4629958647 100644
--- a/tests/test-visitor-serialization.c
+++ b/tests/test-visitor-serialization.c
@@ -957,15 +957,15 @@ static void qmp_deserialize(void **native_out, void *datap,
                             VisitorFunc visit, Error **errp)
 {
     QmpSerializeData *d = datap;
-    QString *output_json;
+    GString *output_json;
     QObject *obj_orig, *obj;
 
     visit_complete(d->qov, &d->obj);
     obj_orig = d->obj;
     output_json = qobject_to_json(obj_orig);
-    obj = qobject_from_json(qstring_get_str(output_json), &error_abort);
+    obj = qobject_from_json(output_json->str, &error_abort);
 
-    qobject_unref(output_json);
+    g_string_free(output_json, true);
     d->qiv = qobject_input_visitor_new(obj);
     qobject_unref(obj_orig);
     qobject_unref(obj);
-- 
2.26.2


