Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AD75FB795
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 17:43:40 +0200 (CEST)
Received: from localhost ([::1]:55786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiHPu-0006Pw-IA
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 11:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1oiHHC-0001WP-Pa
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:34:41 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136]:40630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1oiHH8-0003iV-F5
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:34:38 -0400
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 8605F604F1;
 Tue, 11 Oct 2022 18:34:16 +0300 (MSK)
Received: from den-plotnikov-w.yandex-team.ru (unknown [2a02:6b8:b081:9::1:36])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 uJWtO1ptcY-YEPiAS3o; Tue, 11 Oct 2022 18:34:15 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1665502455; bh=LOdskcgKdy/yqfe4KrCOpuY3Cez33o1gN5W2GIk1AVE=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=OxiNk1S/dE8pWQzd9nT1XbtysZ8O0Z5vWGMXn81PfASMrg28srpePTlpQxRQE6oTd
 KwUzCH3RfAVmIZfbVIJ9VcnCynPCc2PuwllH4PzDfWZERGWTR1W8FCsDJrruPmRLkE
 Iuufu6EPNgGcna5A259tpv+qeuYqkbkGlmux9xyI=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, armbru@redhat.com, michael.roth@amd.com,
 vsementsov@yandex-team.ru, berrange@redhat.com, marcandre.lureau@gmail.com
Subject: [PATCH v3] qapi/qmp: Add timestamps to qmp command responses
Date: Tue, 11 Oct 2022 18:34:08 +0300
Message-Id: <20221011153408.495401-1-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add "start" & "end" time values to qmp command responses.

These time values are added to let the qemu management layer get the exact
command execution time without any other time variance which might be brought by
other parts of management layer or qemu internals. This is particulary useful
for the management layer logging for later problems resolving.

Example of result:

    ./qemu/scripts/qmp/qmp-shell /tmp/qmp.socket

    (QEMU) query-status
    {"end": {"seconds": 1650367305, "microseconds": 831032},
     "start": {"seconds": 1650367305, "microseconds": 831012},
     "return": {"status": "running", "singlestep": false, "running": true}}

The responce of the qmp command contains the start & end time of
the qmp command processing.

Suggested-by: Andrey Ryabinin <arbn@yandex-team.ru>
Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---

v0->v1:
 - remove interface to control "start" and "end" time values: return timestamps unconditionally
 - add description to qmp specification
 - leave the same timestamp format in "seconds", "microseconds" to be consistent with events
   timestamp
 - fix patch description

v1->v2:
 - rephrase doc descriptions [Daniel]
 - add tests for qmp timestamps to qmp test and qga test [Daniel]
 - adjust asserts in test-qmp-cmds according to the new number of returning keys

v2->v3:
 - fix typo "timestaps -> timestamps" [Marc-André]

 docs/interop/qmp-spec.txt  | 28 ++++++++++++++++++++++++++--
 qapi/qmp-dispatch.c        | 18 ++++++++++++++++++
 tests/qtest/qmp-test.c     | 34 ++++++++++++++++++++++++++++++++++
 tests/unit/test-qga.c      | 31 +++++++++++++++++++++++++++++++
 tests/unit/test-qmp-cmds.c |  4 ++--
 5 files changed, 111 insertions(+), 4 deletions(-)

diff --git a/docs/interop/qmp-spec.txt b/docs/interop/qmp-spec.txt
index b0e8351d5b261..2e0b7de0c4dc7 100644
--- a/docs/interop/qmp-spec.txt
+++ b/docs/interop/qmp-spec.txt
@@ -158,7 +158,9 @@ responses that have an unknown "id" field.
 
 The format of a success response is:
 
-{ "return": json-value, "id": json-value }
+{ "return": json-value, "id": json-value,
+  "start": {"seconds": json-value, "microseconds": json-value},
+  "end": {"seconds": json-value, "microseconds": json-value} }
 
  Where,
 
@@ -169,13 +171,25 @@ The format of a success response is:
   command does not return data
 - The "id" member contains the transaction identification associated
   with the command execution if issued by the Client
+- The "start" member contains the exact time of when the server
+  started executing the command. This excludes any time the
+  command request spent queued, after reading it off the wire.
+  It is a fixed json-object with time in seconds and microseconds
+  relative to the Unix Epoch (1 Jan 1970)
+- The "end" member contains the exact time of when the server
+  finished executing the command. This excludes any time the
+  command response spent queued, waiting to be sent on the wire.
+  It is a fixed json-object with time in seconds and microseconds
+  relative to the Unix Epoch (1 Jan 1970)
 
 2.4.2 error
 -----------
 
 The format of an error response is:
 
-{ "error": { "class": json-string, "desc": json-string }, "id": json-value }
+{ "error": { "class": json-string, "desc": json-string }, "id": json-value
+  "start": {"seconds": json-value, "microseconds": json-value},
+  "end": {"seconds": json-value, "microseconds": json-value} }
 
  Where,
 
@@ -184,6 +198,16 @@ The format of an error response is:
   not attempt to parse this message.
 - The "id" member contains the transaction identification associated with
   the command execution if issued by the Client
+- The "start" member contains the exact time of when the server
+  started executing the command. This excludes any time the
+  command request spent queued, after reading it off the wire.
+  It is a fixed json-object with time in seconds and microseconds
+  relative to the Unix Epoch (1 Jan 1970)
+- The "end" member contains the exact time of when the server
+  finished executing the command. This excludes any time the
+  command response spent queued, waiting to be sent on the wire.
+  It is a fixed json-object with time in seconds and microseconds
+  relative to the Unix Epoch (1 Jan 1970)
 
 NOTE: Some errors can occur before the Server is able to read the "id" member,
 in these cases the "id" member will not be part of the error response, even
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 0990873ec8ec1..fce87416f2128 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -130,6 +130,22 @@ static void do_qmp_dispatch_bh(void *opaque)
     aio_co_wake(data->co);
 }
 
+static void add_timestamps(QDict *qdict, uint64_t start_ms, uint64_t end_ms)
+{
+    QDict *start_dict, *end_dict;
+
+    start_dict = qdict_new();
+    qdict_put_int(start_dict, "seconds", start_ms / G_USEC_PER_SEC);
+    qdict_put_int(start_dict, "microseconds", start_ms % G_USEC_PER_SEC);
+
+    end_dict = qdict_new();
+    qdict_put_int(end_dict, "seconds", end_ms / G_USEC_PER_SEC);
+    qdict_put_int(end_dict, "microseconds", end_ms % G_USEC_PER_SEC);
+
+    qdict_put_obj(qdict, "start", QOBJECT(start_dict));
+    qdict_put_obj(qdict, "end", QOBJECT(end_dict));
+}
+
 /*
  * Runs outside of coroutine context for OOB commands, but in coroutine
  * context for everything else.
@@ -146,6 +162,7 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
     QObject *id;
     QObject *ret = NULL;
     QDict *rsp = NULL;
+    uint64_t ts_start = g_get_real_time();
 
     dict = qobject_to(QDict, request);
     if (!dict) {
@@ -270,5 +287,6 @@ out:
         qdict_put_obj(rsp, "id", qobject_ref(id));
     }
 
+    add_timestamps(rsp, ts_start, g_get_real_time());
     return rsp;
 }
diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
index 22957fa49c228..e0d83eea91ae5 100644
--- a/tests/qtest/qmp-test.c
+++ b/tests/qtest/qmp-test.c
@@ -33,6 +33,30 @@ static void test_version(QObject *version)
     visit_free(v);
 }
 
+static void test_timestamps(QDict *resp)
+{
+    QDict *start, *end;
+    uint64_t start_s, start_us, end_s, end_us, start_ts, end_ts;
+
+    start = qdict_get_qdict(resp, "start");
+    g_assert(start);
+    end = qdict_get_qdict(resp, "end");
+    g_assert(end);
+
+    start_s = qdict_get_try_int(start, "seconds", 0);
+    g_assert(start_s);
+    start_us = qdict_get_try_int(start, "microseconds", 0);
+
+    end_s = qdict_get_try_int(end, "seconds", 0);
+    g_assert(end_s);
+    end_us = qdict_get_try_int(end, "microseconds", 0);
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
@@ -156,6 +180,16 @@ static void test_qmp_protocol(void)
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
index b4e0a145737d1..18ec9bac3650e 100644
--- a/tests/unit/test-qga.c
+++ b/tests/unit/test-qga.c
@@ -217,6 +217,36 @@ static void test_qga_ping(gconstpointer fix)
     qmp_assert_no_error(ret);
 }
 
+static void test_qga_timestamps(gconstpointer fix)
+{
+    QDict *start, *end;
+    uint64_t start_s, start_us, end_s, end_us, start_ts, end_ts;
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
+    start_s = qdict_get_try_int(start, "seconds", 0);
+    g_assert(start_s);
+    start_us = qdict_get_try_int(start, "microseconds", 0);
+
+    end_s = qdict_get_try_int(end, "seconds", 0);
+    g_assert(end_s);
+    end_us = qdict_get_try_int(end, "microseconds", 0);
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
@@ -948,6 +978,7 @@ int main(int argc, char **argv)
     g_test_add_data_func("/qga/sync-delimited", &fix, test_qga_sync_delimited);
     g_test_add_data_func("/qga/sync", &fix, test_qga_sync);
     g_test_add_data_func("/qga/ping", &fix, test_qga_ping);
+    g_test_add_data_func("/qga/timestamps", &fix, test_qga_timestamps);
     g_test_add_data_func("/qga/info", &fix, test_qga_info);
     g_test_add_data_func("/qga/network-get-interfaces", &fix,
                          test_qga_network_get_interfaces);
diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
index 6085c099950b5..54d63bb8e346f 100644
--- a/tests/unit/test-qmp-cmds.c
+++ b/tests/unit/test-qmp-cmds.c
@@ -154,7 +154,7 @@ static QObject *do_qmp_dispatch(bool allow_oob, const char *template, ...)
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


