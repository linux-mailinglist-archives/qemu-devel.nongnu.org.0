Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DCA283C6E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 18:26:55 +0200 (CEST)
Received: from localhost ([::1]:60254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPTKA-0005XR-M2
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 12:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kPStY-0000YV-FO
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 11:59:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kPStV-00029i-6N
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 11:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601913560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iC1JfKskOaCjPJOk21njqJuf/fl618DDF8J2y8saP8k=;
 b=YbkRYjGskEyYTeTfYhEhDdxVwAIFrrH136f3ESOIz2yo5UusPXe7H4gqLoaUTmFicmCDv5
 HXa+ao+99V5mzBcvyhoRxFaOCVvc9cavcEn7LyUCc2w/GC2Z9AMcPRQ2eq9bhQw3sj1rUG
 e029qwhItQTjoTqa7OhP2Jnf4DCR+ZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-dFk9VvwTMyG7qoX49N95wQ-1; Mon, 05 Oct 2020 11:59:18 -0400
X-MC-Unique: dFk9VvwTMyG7qoX49N95wQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BE2B101FFC3;
 Mon,  5 Oct 2020 15:59:17 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-145.ams2.redhat.com
 [10.36.113.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BD6368433;
 Mon,  5 Oct 2020 15:59:16 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 06/14] qmp: Call monitor_set_cur() only in qmp_dispatch()
Date: Mon,  5 Oct 2020 17:58:47 +0200
Message-Id: <20201005155855.256490-7-kwolf@redhat.com>
In-Reply-To: <20201005155855.256490-1-kwolf@redhat.com>
References: <20201005155855.256490-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 02:11:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, marcandre.lureau@gmail.com, armbru@redhat.com,
 stefanha@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The correct way to set the current monitor for a coroutine handler will
be different than for a blocking handler, so monitor_set_cur() needs to
be called in qmp_dispatch().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qapi/qmp/dispatch.h | 3 ++-
 monitor/qmp.c               | 9 ++-------
 qapi/qmp-dispatch.c         | 8 +++++++-
 qga/main.c                  | 2 +-
 stubs/monitor-core.c        | 5 +++++
 tests/test-qmp-cmds.c       | 6 +++---
 6 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
index 5a9cf82472..0c2f467028 100644
--- a/include/qapi/qmp/dispatch.h
+++ b/include/qapi/qmp/dispatch.h
@@ -14,6 +14,7 @@
 #ifndef QAPI_QMP_DISPATCH_H
 #define QAPI_QMP_DISPATCH_H
 
+#include "monitor/monitor.h"
 #include "qemu/queue.h"
 
 typedef void (QmpCommandFunc)(QDict *, QObject **, Error **);
@@ -49,7 +50,7 @@ const char *qmp_command_name(const QmpCommand *cmd);
 bool qmp_has_success_response(const QmpCommand *cmd);
 QDict *qmp_error_response(Error *err);
 QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
-                    bool allow_oob);
+                    bool allow_oob, Monitor *cur_mon);
 bool qmp_is_oob(const QDict *dict);
 
 typedef void (*qmp_cmd_callback_fn)(const QmpCommand *cmd, void *opaque);
diff --git a/monitor/qmp.c b/monitor/qmp.c
index 8469970c69..e746b3575d 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -135,16 +135,11 @@ static void monitor_qmp_respond(MonitorQMP *mon, QDict *rsp)
 
 static void monitor_qmp_dispatch(MonitorQMP *mon, QObject *req)
 {
-    Monitor *old_mon;
     QDict *rsp;
     QDict *error;
 
-    old_mon = monitor_set_cur(&mon->common);
-    assert(old_mon == NULL);
-
-    rsp = qmp_dispatch(mon->commands, req, qmp_oob_enabled(mon));
-
-    monitor_set_cur(NULL);
+    rsp = qmp_dispatch(mon->commands, req, qmp_oob_enabled(mon),
+                       &mon->common);
 
     if (mon->commands == &qmp_cap_negotiation_commands) {
         error = qdict_get_qdict(rsp, "error");
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 79347e0864..2fdbc0fba4 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -89,7 +89,7 @@ bool qmp_is_oob(const QDict *dict)
 }
 
 QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
-                    bool allow_oob)
+                    bool allow_oob, Monitor *cur_mon)
 {
     Error *err = NULL;
     bool oob;
@@ -152,7 +152,13 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
         args = qdict_get_qdict(dict, "arguments");
         qobject_ref(args);
     }
+
+    assert(monitor_cur() == NULL);
+    monitor_set_cur(cur_mon);
+
     cmd->fn(args, &ret, &err);
+
+    monitor_set_cur(NULL);
     qobject_unref(args);
     if (err) {
         /* or assert(!ret) after reviewing all handlers: */
diff --git a/qga/main.c b/qga/main.c
index 740f5f7303..dea6a3aa64 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -579,7 +579,7 @@ static void process_event(void *opaque, QObject *obj, Error *err)
     }
 
     g_debug("processing command");
-    rsp = qmp_dispatch(&ga_commands, obj, false);
+    rsp = qmp_dispatch(&ga_commands, obj, false, NULL);
 
 end:
     ret = send_response(s, rsp);
diff --git a/stubs/monitor-core.c b/stubs/monitor-core.c
index 0cd2d864b2..dc1748bf13 100644
--- a/stubs/monitor-core.c
+++ b/stubs/monitor-core.c
@@ -8,6 +8,11 @@ Monitor *monitor_cur(void)
     return NULL;
 }
 
+Monitor *monitor_set_cur(Monitor *mon)
+{
+    return NULL;
+}
+
 void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
 {
 }
diff --git a/tests/test-qmp-cmds.c b/tests/test-qmp-cmds.c
index d12ff47e26..5f1b245e19 100644
--- a/tests/test-qmp-cmds.c
+++ b/tests/test-qmp-cmds.c
@@ -152,7 +152,7 @@ static QObject *do_qmp_dispatch(bool allow_oob, const char *template, ...)
     req = qdict_from_vjsonf_nofail(template, ap);
     va_end(ap);
 
-    resp = qmp_dispatch(&qmp_commands, QOBJECT(req), allow_oob);
+    resp = qmp_dispatch(&qmp_commands, QOBJECT(req), allow_oob, NULL);
     g_assert(resp);
     ret = qdict_get(resp, "return");
     g_assert(ret);
@@ -175,7 +175,7 @@ static void do_qmp_dispatch_error(bool allow_oob, ErrorClass cls,
     req = qdict_from_vjsonf_nofail(template, ap);
     va_end(ap);
 
-    resp = qmp_dispatch(&qmp_commands, QOBJECT(req), allow_oob);
+    resp = qmp_dispatch(&qmp_commands, QOBJECT(req), allow_oob, NULL);
     g_assert(resp);
     error = qdict_get_qdict(resp, "error");
     g_assert(error);
@@ -231,7 +231,7 @@ static void test_dispatch_cmd_success_response(void)
     QDict *resp;
 
     qdict_put_str(req, "execute", "cmd-success-response");
-    resp = qmp_dispatch(&qmp_commands, QOBJECT(req), false);
+    resp = qmp_dispatch(&qmp_commands, QOBJECT(req), false, NULL);
     g_assert_null(resp);
     qobject_unref(req);
 }
-- 
2.25.4


