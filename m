Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9789571609
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 11:47:04 +0200 (CEST)
Received: from localhost ([::1]:42686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCTw-00016g-1w
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 05:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCJb-0005ei-31
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:36:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCJZ-0007qH-1M
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657618579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4JCwGVreW5Z5NC5FZ9pjBxLt89NA5vi3SysqTGNE1zk=;
 b=VDfdM7PPbnNqdKnOAmN7p/CWW2NuD2GMMBGtH8kbh2B+EbROMLkOUlLjfo4hAXrpNjQxoc
 WP/uXrkXq4rof5/Y0ATVGrNrJ/r3Ihck6/4E7wi3WvmQPKcjr3pEzz3rrgPucinXlMITmM
 BDGXVt9lTMz/sbraslQM23uoArG9nQE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-EObqTvJiP0GNMHhloBoQ6w-1; Tue, 12 Jul 2022 05:36:16 -0400
X-MC-Unique: EObqTvJiP0GNMHhloBoQ6w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCE99811E80;
 Tue, 12 Jul 2022 09:36:15 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D854E4B8D64;
 Tue, 12 Jul 2022 09:36:11 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Warner Losh <imp@bsdimp.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 06/15] qapi: move QEMU-specific dispatch code in monitor
Date: Tue, 12 Jul 2022 13:35:19 +0400
Message-Id: <20220712093528.4144184-7-marcandre.lureau@redhat.com>
In-Reply-To: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Make QMP-dispatch code free from QEMU-specific OOB dispatch/async
coroutine handling. This will allow to move the base code to
qemu-common, and clear other users from potential mis-ususe (QGA doesn't
have OOB or coroutine).

To do that, introduce an optional callback QmpDispatchRun called when a
QMP command should be run, to allow QEMU to override the default
behaviour.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qapi/qmp/dispatch.h |  7 ++--
 monitor/qmp.c               | 68 ++++++++++++++++++++++++++++++++++++-
 qapi/qmp-dispatch.c         | 64 +++-------------------------------
 qga/main.c                  |  2 +-
 tests/unit/test-qmp-cmds.c  |  6 ++--
 5 files changed, 81 insertions(+), 66 deletions(-)

diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
index 1e4240fd0dbc..b659da613f2e 100644
--- a/include/qapi/qmp/dispatch.h
+++ b/include/qapi/qmp/dispatch.h
@@ -14,7 +14,6 @@
 #ifndef QAPI_QMP_DISPATCH_H
 #define QAPI_QMP_DISPATCH_H
 
-#include "monitor/monitor.h"
 #include "qemu/queue.h"
 
 typedef void (QmpCommandFunc)(QDict *, QObject **, Error **);
@@ -41,6 +40,10 @@ typedef struct QmpCommand
 
 typedef QTAILQ_HEAD(QmpCommandList, QmpCommand) QmpCommandList;
 
+typedef void (QmpDispatchRun)(bool oob, const QmpCommand *cmd,
+                              QDict *args, QObject **ret, Error **errp,
+                              void *run_data);
+
 void qmp_register_command(QmpCommandList *cmds, const char *name,
                           QmpCommandFunc *fn, QmpCommandOptions options,
                           unsigned special_features);
@@ -56,7 +59,7 @@ const char *qmp_command_name(const QmpCommand *cmd);
 bool qmp_has_success_response(const QmpCommand *cmd);
 QDict *qmp_error_response(Error *err);
 QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
-                    bool allow_oob, Monitor *cur_mon);
+                    bool allow_oob, QmpDispatchRun run_cb, void *run_data);
 bool qmp_is_oob(const QDict *dict);
 
 typedef void (*qmp_cmd_callback_fn)(const QmpCommand *cmd, void *opaque);
diff --git a/monitor/qmp.c b/monitor/qmp.c
index 092c527b6fc9..f8dec97c96bb 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -132,6 +132,72 @@ static void monitor_qmp_respond(MonitorQMP *mon, QDict *rsp)
     }
 }
 
+typedef struct QmpDispatchBH {
+    const QmpCommand *cmd;
+    Monitor *cur_mon;
+    QDict *args;
+    QObject **ret;
+    Error **errp;
+    Coroutine *co;
+} QmpDispatchBH;
+
+static void do_qmp_dispatch_bh(void *opaque)
+{
+    QmpDispatchBH *data = opaque;
+
+    assert(monitor_cur() == NULL);
+    monitor_set_cur(qemu_coroutine_self(), data->cur_mon);
+    data->cmd->fn(data->args, data->ret, data->errp);
+    monitor_set_cur(qemu_coroutine_self(), NULL);
+    aio_co_wake(data->co);
+}
+
+/*
+ * Runs outside of coroutine context for OOB commands, but in coroutine
+ * context for everything else.
+ */
+static void qmp_dispatch_run(bool oob, const QmpCommand *cmd,
+                             QDict *args, QObject **ret, Error **errp,
+                             void *run_data)
+{
+    Monitor *cur_mon = run_data;
+
+    assert(!(oob && qemu_in_coroutine()));
+    assert(monitor_cur() == NULL);
+
+    if (!!(cmd->options & QCO_COROUTINE) == qemu_in_coroutine()) {
+        monitor_set_cur(qemu_coroutine_self(), cur_mon);
+        cmd->fn(args, ret, errp);
+        monitor_set_cur(qemu_coroutine_self(), NULL);
+    } else {
+       /*
+        * Actual context doesn't match the one the command needs.
+        *
+        * Case 1: we are in coroutine context, but command does not
+        * have QCO_COROUTINE.  We need to drop out of coroutine
+        * context for executing it.
+        *
+        * Case 2: we are outside coroutine context, but command has
+        * QCO_COROUTINE.  Can't actually happen, because we get here
+        * outside coroutine context only when executing a command
+        * out of band, and OOB commands never have QCO_COROUTINE.
+        */
+        assert(!oob && qemu_in_coroutine() && !(cmd->options & QCO_COROUTINE));
+
+        QmpDispatchBH data = {
+            .cur_mon    = cur_mon,
+            .cmd        = cmd,
+            .args       = args,
+            .ret        = ret,
+            .errp       = errp,
+            .co         = qemu_coroutine_self(),
+        };
+        aio_bh_schedule_oneshot(qemu_get_aio_context(), do_qmp_dispatch_bh,
+                                &data);
+        qemu_coroutine_yield();
+    }
+}
+
 /*
  * Runs outside of coroutine context for OOB commands, but in
  * coroutine context for everything else.
@@ -142,7 +208,7 @@ static void monitor_qmp_dispatch(MonitorQMP *mon, QObject *req)
     QDict *error;
 
     rsp = qmp_dispatch(mon->commands, req, qmp_oob_enabled(mon),
-                       &mon->common);
+                       qmp_dispatch_run, &mon->common);
 
     if (mon->commands == &qmp_cap_negotiation_commands) {
         error = qdict_get_qdict(rsp, "error");
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 0990873ec8ec..342b13d7ebbd 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -13,7 +13,6 @@
 
 #include "qemu/osdep.h"
 
-#include "block/aio.h"
 #include "qapi/compat-policy.h"
 #include "qapi/error.h"
 #include "qapi/qmp/dispatch.h"
@@ -22,8 +21,6 @@
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qobject-output-visitor.h"
 #include "qapi/qmp/qbool.h"
-#include "qemu/coroutine.h"
-#include "qemu/main-loop.h"
 
 Visitor *qobject_input_visitor_new_qmp(QObject *obj)
 {
@@ -110,32 +107,8 @@ bool qmp_is_oob(const QDict *dict)
         && !qdict_haskey(dict, "execute");
 }
 
-typedef struct QmpDispatchBH {
-    const QmpCommand *cmd;
-    Monitor *cur_mon;
-    QDict *args;
-    QObject **ret;
-    Error **errp;
-    Coroutine *co;
-} QmpDispatchBH;
-
-static void do_qmp_dispatch_bh(void *opaque)
-{
-    QmpDispatchBH *data = opaque;
-
-    assert(monitor_cur() == NULL);
-    monitor_set_cur(qemu_coroutine_self(), data->cur_mon);
-    data->cmd->fn(data->args, data->ret, data->errp);
-    monitor_set_cur(qemu_coroutine_self(), NULL);
-    aio_co_wake(data->co);
-}
-
-/*
- * Runs outside of coroutine context for OOB commands, but in coroutine
- * context for everything else.
- */
 QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
-                    bool allow_oob, Monitor *cur_mon)
+                    bool allow_oob, QmpDispatchRun run_cb, void *run_data)
 {
     Error *err = NULL;
     bool oob;
@@ -203,39 +176,12 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
         qobject_ref(args);
     }
 
-    assert(!(oob && qemu_in_coroutine()));
-    assert(monitor_cur() == NULL);
-    if (!!(cmd->options & QCO_COROUTINE) == qemu_in_coroutine()) {
-        monitor_set_cur(qemu_coroutine_self(), cur_mon);
-        cmd->fn(args, &ret, &err);
-        monitor_set_cur(qemu_coroutine_self(), NULL);
+    if (run_cb) {
+        run_cb(oob, cmd, args, &ret, &err, run_data);
     } else {
-       /*
-        * Actual context doesn't match the one the command needs.
-        *
-        * Case 1: we are in coroutine context, but command does not
-        * have QCO_COROUTINE.  We need to drop out of coroutine
-        * context for executing it.
-        *
-        * Case 2: we are outside coroutine context, but command has
-        * QCO_COROUTINE.  Can't actually happen, because we get here
-        * outside coroutine context only when executing a command
-        * out of band, and OOB commands never have QCO_COROUTINE.
-        */
-        assert(!oob && qemu_in_coroutine() && !(cmd->options & QCO_COROUTINE));
-
-        QmpDispatchBH data = {
-            .cur_mon    = cur_mon,
-            .cmd        = cmd,
-            .args       = args,
-            .ret        = &ret,
-            .errp       = &err,
-            .co         = qemu_coroutine_self(),
-        };
-        aio_bh_schedule_oneshot(qemu_get_aio_context(), do_qmp_dispatch_bh,
-                                &data);
-        qemu_coroutine_yield();
+        cmd->fn(args, &ret, &err);
     }
+
     qobject_unref(args);
     if (err) {
         /* or assert(!ret) after reviewing all handlers: */
diff --git a/qga/main.c b/qga/main.c
index c373fec3ee69..fb7d673bea9f 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -569,7 +569,7 @@ static void process_event(void *opaque, QObject *obj, Error *err)
     }
 
     g_debug("processing command");
-    rsp = qmp_dispatch(&ga_commands, obj, false, NULL);
+    rsp = qmp_dispatch(&ga_commands, obj, false, NULL, NULL);
 
 end:
     ret = send_response(s, rsp);
diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
index 6085c099950b..abe67a9bd880 100644
--- a/tests/unit/test-qmp-cmds.c
+++ b/tests/unit/test-qmp-cmds.c
@@ -150,7 +150,7 @@ static QObject *do_qmp_dispatch(bool allow_oob, const char *template, ...)
     req = qdict_from_vjsonf_nofail(template, ap);
     va_end(ap);
 
-    resp = qmp_dispatch(&qmp_commands, QOBJECT(req), allow_oob, NULL);
+    resp = qmp_dispatch(&qmp_commands, QOBJECT(req), allow_oob, NULL, NULL);
     g_assert(resp);
     ret = qdict_get(resp, "return");
     g_assert(ret);
@@ -173,7 +173,7 @@ static void do_qmp_dispatch_error(bool allow_oob, ErrorClass cls,
     req = qdict_from_vjsonf_nofail(template, ap);
     va_end(ap);
 
-    resp = qmp_dispatch(&qmp_commands, QOBJECT(req), allow_oob, NULL);
+    resp = qmp_dispatch(&qmp_commands, QOBJECT(req), allow_oob, NULL, NULL);
     g_assert(resp);
     error = qdict_get_qdict(resp, "error");
     g_assert(error);
@@ -229,7 +229,7 @@ static void test_dispatch_cmd_success_response(void)
     QDict *resp;
 
     qdict_put_str(req, "execute", "cmd-success-response");
-    resp = qmp_dispatch(&qmp_commands, QOBJECT(req), false, NULL);
+    resp = qmp_dispatch(&qmp_commands, QOBJECT(req), false, NULL, NULL);
     g_assert_null(resp);
     qobject_unref(req);
 }
-- 
2.37.0.rc0


