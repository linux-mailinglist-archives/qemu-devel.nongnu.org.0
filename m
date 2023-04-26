Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8471F6EF61E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 16:15:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prfub-0008SA-9Y; Wed, 26 Apr 2023 10:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1prfuY-0008Rr-3i
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 10:14:22 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1prfuU-0005vl-T9
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 10:14:21 -0400
Received: from mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:2cab:0:640:424b:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 85DAB605BC;
 Wed, 26 Apr 2023 17:08:51 +0300 (MSK)
Received: from den-plotnikov-w.yandex-team.ru (unknown
 [2a02:6b8:b081:b68b::1:3c])
 by mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id d8Ikj20OpOs0-snZ3DZGU; Wed, 26 Apr 2023 17:08:49 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682518130; bh=TJjbVdLH5uyh7SonYQqpz+uzDIXM2p2WsD+O5taxsds=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=L38EO9jsF3MCcp7lhJvkarRz41H87iIqtb0o/JV3/Ap3OOLvxUjJYhxJy2WFya0nW
 wKbeholwxopqXYYT7bOS5Dx/OVKevnvnixIkQnpuhpBUywADkSEgLRRtCcZStgwa4h
 tJJtvhGccPmJ4OY00iZ6rtm0/ENXqQJLpDTZkRRI=
Authentication-Results: mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, armbru@redhat.com, vsementsov@yandex-team.ru,
 berrange@redhat.com, marcandre.lureau@gmail.com,
 den-plotnikov@yandex-team.ru
Subject: [PATCH v5] qapi/qmp: Add timestamps to qmp command responses
Date: Wed, 26 Apr 2023 17:08:39 +0300
Message-Id: <20230426140839.72223-1-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Add "start" & "end" time values to QMP command responses.

These time values are added to let the qemu management layer get the exact
command execution time without any other time variance which might be brought
by other parts of management layer or qemu internals.
This helps to look for problems poactively from the management layer side.
The management layer would be able to detect problem cases by calculating
QMP command execution time:
1. execution_time_from_mgmt_perspective -
       execution_time_of_qmp_command > some_threshold
   This detects problems with management layer or internal qemu QMP command
   dispatching
2. current_qmp_command_execution_time > avg_qmp_command_execution_time
   This detects that a certain QMP command starts to execute longer than
   usual
In both these cases more thorough investigation of the root cases should be
done by using some qemu tracepoints depending on particular QMP command under
investigation or by other means. The timestamps help to avoid excessive log
output when qemu tracepoints are used to address similar cases.

Example of result:

    ./qemu/scripts/qmp/qmp-shell /tmp/qmp.socket

    (QEMU) query-status
    {"end": {"seconds": 1650367305, "microseconds": 831032},
     "start": {"seconds": 1650367305, "microseconds": 831012},
     "return": {"status": "running", "singlestep": false, "running": true}}

The response of the QMP command contains the start & end time of
the QMP command processing.

Also, "start" & "end" timestaps are added to qemu guest agent responses as
qemu-ga shares the same code for request dispatching.

Suggested-by: Andrey Ryabinin <arbn@yandex-team.ru>
Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
v4->v5:
 - use json-number instead of json-value for time values [Vladimir]
 - use a new util function for timestamp printing [Vladimir]

v3->v4:
 - rewrite commit message [Markus]
 - use new fileds description in doc [Markus]
 - change type to int64_t [Markus]
 - simplify tests [Markus]

v2->v3:
 - fix typo "timestaps -> timestamps" [Marc-André]

v1->v2:
 - rephrase doc descriptions [Daniel]
 - add tests for qmp timestamps to qmp test and qga test [Daniel]
 - adjust asserts in test-qmp-cmds according to the new number of returning keys

v0->v1:
 - remove interface to control "start" and "end" time values: return timestamps unconditionally
 - add description to qmp specification
 - leave the same timestamp format in "seconds", "microseconds" to be consistent with events
   timestamp
 - fix patch description
---
 docs/interop/qmp-spec.txt  | 28 ++++++++++++++++++++++++++--
 include/qapi/util.h        |  2 ++
 qapi/qapi-util.c           | 11 +++++++++++
 qapi/qmp-dispatch.c        | 11 +++++++++++
 qapi/qmp-event.c           |  6 +-----
 tests/qtest/qmp-test.c     | 32 ++++++++++++++++++++++++++++++++
 tests/unit/test-qga.c      | 29 +++++++++++++++++++++++++++++
 tests/unit/test-qmp-cmds.c |  4 ++--
 8 files changed, 114 insertions(+), 9 deletions(-)

diff --git a/docs/interop/qmp-spec.txt b/docs/interop/qmp-spec.txt
index b0e8351d5b261..ed204b53373e5 100644
--- a/docs/interop/qmp-spec.txt
+++ b/docs/interop/qmp-spec.txt
@@ -158,7 +158,9 @@ responses that have an unknown "id" field.
 
 The format of a success response is:
 
-{ "return": json-value, "id": json-value }
+{ "return": json-value, "id": json-value,
+  "start": {"seconds": json-number, "microseconds": json-number},
+  "end": {"seconds": json-number, "microseconds": json-number} }
 
  Where,
 
@@ -169,13 +171,25 @@ The format of a success response is:
   command does not return data
 - The "id" member contains the transaction identification associated
   with the command execution if issued by the Client
+- The "start" member contains the exact time of when the server
+  started executing the command. This excludes any time the
+  command request spent queued, after reading it off the wire.
+  It is a json-object with the number of seconds and microseconds
+  since the Unix epoch
+- The "end" member contains the exact time of when the server
+  finished executing the command. This excludes any time the
+  command response spent queued, waiting to be sent on the wire.
+  It is a json-object with the number of seconds and microseconds
+  since the Unix epoch
 
 2.4.2 error
 -----------
 
 The format of an error response is:
 
-{ "error": { "class": json-string, "desc": json-string }, "id": json-value }
+{ "error": { "class": json-string, "desc": json-string }, "id": json-value
+  "start": {"seconds": json-number, "microseconds": json-number},
+  "end": {"seconds": json-number, "microseconds": json-number} }
 
  Where,
 
@@ -184,6 +198,16 @@ The format of an error response is:
   not attempt to parse this message.
 - The "id" member contains the transaction identification associated with
   the command execution if issued by the Client
+- The "start" member contains the exact time of when the server
+  started executing the command. This excludes any time the
+  command request spent queued, after reading it off the wire.
+  It is a json-object with the number of seconds and microseconds
+  since the Unix epoch
+- The "end" member contains the exact time of when the server
+  finished executing the command. This excludes any time the
+  command response spent queued, waiting to be sent on the wire.
+  It is a json-object with the number of seconds and microseconds
+  since the Unix epoch
 
 NOTE: Some errors can occur before the Server is able to read the "id" member,
 in these cases the "id" member will not be part of the error response, even
diff --git a/include/qapi/util.h b/include/qapi/util.h
index 81a2b13a3339c..2cf09b5bd140f 100644
--- a/include/qapi/util.h
+++ b/include/qapi/util.h
@@ -56,4 +56,6 @@ int parse_qapi_name(const char *name, bool complete);
     (tail) = &(*(tail))->next; \
 } while (0)
 
+QDict *qapi_get_timestamp_dict(int64_t rt);
+
 #endif
diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
index 63596e11c5692..d9c8d710d1eab 100644
--- a/qapi/qapi-util.c
+++ b/qapi/qapi-util.c
@@ -15,6 +15,7 @@
 #include "qapi/error.h"
 #include "qemu/ctype.h"
 #include "qapi/qmp/qerror.h"
+#include "qapi/qmp/qdict.h"
 
 CompatPolicy compat_policy;
 
@@ -152,3 +153,13 @@ int parse_qapi_name(const char *str, bool complete)
     }
     return p - str;
 }
+
+QDict *qapi_get_timestamp_dict(int64_t rt)
+{
+    QDict *dict = qdict_new();
+
+    qdict_put_int(dict, "seconds", rt / G_USEC_PER_SEC);
+    qdict_put_int(dict, "microseconds", rt % G_USEC_PER_SEC);
+
+    return dict;
+}
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 555528b6bbd35..14835c036e5d3 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -130,6 +130,15 @@ static void do_qmp_dispatch_bh(void *opaque)
     aio_co_wake(data->co);
 }
 
+static void add_timestamps(QDict *qdict, int64_t start_ms, int64_t end_ms)
+{
+    QDict *start_dict = qapi_get_timestamp_dict(start_ms);
+    QDict *end_dict = qapi_get_timestamp_dict(end_ms);
+
+    qdict_put_obj(qdict, "start", QOBJECT(start_dict));
+    qdict_put_obj(qdict, "end", QOBJECT(end_dict));
+}
+
 /*
  * Runs outside of coroutine context for OOB commands, but in coroutine
  * context for everything else.
@@ -146,6 +155,7 @@ QDict *coroutine_mixed_fn qmp_dispatch(const QmpCommandList *cmds, QObject *requ
     QObject *id;
     QObject *ret = NULL;
     QDict *rsp = NULL;
+    int64_t ts_start = g_get_real_time();
 
     dict = qobject_to(QDict, request);
     if (!dict) {
@@ -270,5 +280,6 @@ out:
         qdict_put_obj(rsp, "id", qobject_ref(id));
     }
 
+    add_timestamps(rsp, ts_start, g_get_real_time());
     return rsp;
 }
diff --git a/qapi/qmp-event.c b/qapi/qmp-event.c
index 0fe0d0a5a6e5a..d9158a3a2b871 100644
--- a/qapi/qmp-event.c
+++ b/qapi/qmp-event.c
@@ -16,16 +16,12 @@
 #include "qapi/qmp-event.h"
 #include "qapi/qmp/qstring.h"
 #include "qapi/qmp/qdict.h"
-#include "qapi/qmp/qjson.h"
 
 static void timestamp_put(QDict *qdict)
 {
-    QDict *ts;
     int64_t rt = g_get_real_time();
+    QDict *ts = qapi_get_timestamp_dict(rt);
 
-    ts = qdict_from_jsonf_nofail("{ 'seconds': %lld, 'microseconds': %lld }",
-                                 (long long)rt / G_USEC_PER_SEC,
-                                 (long long)rt % G_USEC_PER_SEC);
     qdict_put(qdict, "timestamp", ts);
 }
 
diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
index 22957fa49c228..0c17b315de873 100644
--- a/tests/qtest/qmp-test.c
+++ b/tests/qtest/qmp-test.c
@@ -33,6 +33,28 @@ static void test_version(QObject *version)
     visit_free(v);
 }
 
+static void test_timestamps(QDict *resp)
+{
+    QDict *start, *end;
+    int64_t start_s, start_us, end_s, end_us, start_ts, end_ts;
+
+    start = qdict_get_qdict(resp, "start");
+    g_assert(start);
+    end = qdict_get_qdict(resp, "end");
+    g_assert(end);
+
+    start_s = qdict_get_int(start, "seconds");
+    start_us = qdict_get_int(start, "microseconds");
+
+    end_s = qdict_get_int(end, "seconds");
+    end_us = qdict_get_int(end, "microseconds");
+
+    start_ts = (start_s * G_USEC_PER_SEC) + start_us;
+    end_ts = (end_s * G_USEC_PER_SEC) + end_us;
+
+    g_assert(end_ts > start_ts);
+}
+
 static void assert_recovered(QTestState *qts)
 {
     QDict *resp;
@@ -156,6 +178,16 @@ static void test_qmp_protocol(void)
     g_assert_cmpint(qdict_get_int(resp, "id"), ==, 2);
     qmp_expect_error_and_unref(resp, "GenericError");
 
+    /* Test timestamps on success */
+    resp = qtest_qmp(qts, "{ 'execute': 'query-version' }");
+    test_timestamps(resp);
+    qobject_unref(resp);
+
+    /* Test timestamps on error */
+    resp = qtest_qmp(qts, "{ 'execute': 'not-existing-cmd' }");
+    test_timestamps(resp);
+    qobject_unref(resp);
+
     qtest_quit(qts);
 }
 
diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index b4e0a145737d1..ceb62f0ebba7b 100644
--- a/tests/unit/test-qga.c
+++ b/tests/unit/test-qga.c
@@ -217,6 +217,34 @@ static void test_qga_ping(gconstpointer fix)
     qmp_assert_no_error(ret);
 }
 
+static void test_qga_timestamps(gconstpointer fix)
+{
+    QDict *start, *end;
+    int64_t start_s, start_us, end_s, end_us, start_ts, end_ts;
+    const TestFixture *fixture = fix;
+    g_autoptr(QDict) ret = NULL;
+
+    ret = qmp_fd(fixture->fd, "{'execute': 'guest-ping'}");
+    g_assert_nonnull(ret);
+    qmp_assert_no_error(ret);
+
+    start = qdict_get_qdict(ret, "start");
+    g_assert(start);
+    end = qdict_get_qdict(ret, "end");
+    g_assert(end);
+
+    start_s = qdict_get_int(start, "seconds");
+    start_us = qdict_get_int(start, "microseconds");
+
+    end_s = qdict_get_int(end, "seconds");
+    end_us = qdict_get_int(end, "microseconds");
+
+    start_ts = (start_s * G_USEC_PER_SEC) + start_us;
+    end_ts = (end_s * G_USEC_PER_SEC) + end_us;
+
+    g_assert(end_ts > start_ts);
+}
+
 static void test_qga_id(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
@@ -948,6 +976,7 @@ int main(int argc, char **argv)
     g_test_add_data_func("/qga/sync-delimited", &fix, test_qga_sync_delimited);
     g_test_add_data_func("/qga/sync", &fix, test_qga_sync);
     g_test_add_data_func("/qga/ping", &fix, test_qga_ping);
+    g_test_add_data_func("/qga/timestamps", &fix, test_qga_timestamps);
     g_test_add_data_func("/qga/info", &fix, test_qga_info);
     g_test_add_data_func("/qga/network-get-interfaces", &fix,
                          test_qga_network_get_interfaces);
diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
index 6d52b4e5d811c..ad8ca4e3fe5a1 100644
--- a/tests/unit/test-qmp-cmds.c
+++ b/tests/unit/test-qmp-cmds.c
@@ -153,7 +153,7 @@ static QObject *do_qmp_dispatch(bool allow_oob, const char *template, ...)
     g_assert(resp);
     ret = qdict_get(resp, "return");
     g_assert(ret);
-    g_assert(qdict_size(resp) == 1);
+    g_assert(qdict_size(resp) == 3);
 
     qobject_ref(ret);
     qobject_unref(resp);
@@ -181,7 +181,7 @@ static void do_qmp_dispatch_error(bool allow_oob, ErrorClass cls,
                     ==, QapiErrorClass_str(cls));
     g_assert(qdict_get_try_str(error, "desc"));
     g_assert(qdict_size(error) == 2);
-    g_assert(qdict_size(resp) == 1);
+    g_assert(qdict_size(resp) == 3);
 
     qobject_unref(resp);
     qobject_unref(req);
-- 
2.25.1


