Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A66E5EA10F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:45:22 +0200 (CEST)
Received: from localhost ([::1]:60698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oclc1-00018m-Js
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1ocl1H-0002jC-4Q
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 06:07:23 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:55336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1ocl1D-0005fu-JW
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 06:07:21 -0400
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id B96D52E0898;
 Mon, 26 Sep 2022 12:59:55 +0300 (MSK)
Received: from den-plotnikov-w.yandex-team.ru (unknown [2a02:6b8:b081:13::1:8])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 a7t6TLLmY5-xqPi3v2g; Mon, 26 Sep 2022 12:59:53 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1664186394; bh=VKmN4ygxkz3h34JmPzcVqEFJSTlsncPKTQIgbAvHhOE=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=k8sRBMWV0kadnYMOO/zADmPxpYeL/7X+pHkW+y9aqphXeOSOWY4kOqWwHf5mHWHbe
 J88rFo4tn7r3qn7nxqIUi4v93Z4ukpYF3bPINvN5vJTgt+s5JFbqetNEMoR8WrtWFH
 ErRZGuasLuAa3c4jc7j5Zx9VcIdlzLc6DSJgpNlc=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru,
	armbru@redhat.com,
	michael.roth@amd.com
Subject: [patch v0] qapi/qmp: Add timestamps to qmp command responses.
Date: Mon, 26 Sep 2022 12:59:40 +0300
Message-Id: <20220926095940.283094-1-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Add "start" & "end" timestamps to qmp command responses.
It's disabled by default, but can be enabled with 'timestamp=on'
monitor's parameter, e.g.:
    -chardev  socket,id=mon1,path=/tmp/qmp.socket,server=on,wait=off
    -mon chardev=mon1,mode=control,timestamp=on

Example of result:

    ./qemu/scripts/qmp/qmp-shell /tmp/qmp.socket

    (QEMU) query-status
    {"end": {"seconds": 1650367305, "microseconds": 831032},
     "start": {"seconds": 1650367305, "microseconds": 831012},
     "return": {"status": "running", "singlestep": false, "running": true}}

The responce of the qmp command contains the start & end time of
the qmp command processing.

These times may be helpful for the management layer in understanding of
the actual timeline of a qmp command processing.

Suggested-by: Andrey Ryabinin <arbn@yandex-team.ru>
Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
---
 include/monitor/monitor.h   |  2 +-
 include/qapi/qmp/dispatch.h |  2 +-
 monitor/monitor-internal.h  |  1 +
 monitor/monitor.c           |  9 ++++++++-
 monitor/qmp.c               |  5 +++--
 qapi/control.json           |  3 +++
 qapi/qmp-dispatch.c         | 28 +++++++++++++++++++++++++++-
 qga/main.c                  |  2 +-
 stubs/monitor-core.c        |  2 +-
 tests/unit/test-qmp-cmds.c  |  6 +++---
 10 files changed, 49 insertions(+), 11 deletions(-)

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index a4b40e8391db4..2a18e9ee34bc2 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -19,7 +19,7 @@ bool monitor_cur_is_qmp(void);
 
 void monitor_init_globals(void);
 void monitor_init_globals_core(void);
-void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp);
+void monitor_init_qmp(Chardev *chr, bool pretty, bool timestamp, Error **errp);
 void monitor_init_hmp(Chardev *chr, bool use_readline, Error **errp);
 int monitor_init(MonitorOptions *opts, bool allow_hmp, Error **errp);
 int monitor_init_opts(QemuOpts *opts, Error **errp);
diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
index 1e4240fd0dbc0..d07f5764271be 100644
--- a/include/qapi/qmp/dispatch.h
+++ b/include/qapi/qmp/dispatch.h
@@ -56,7 +56,7 @@ const char *qmp_command_name(const QmpCommand *cmd);
 bool qmp_has_success_response(const QmpCommand *cmd);
 QDict *qmp_error_response(Error *err);
 QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
-                    bool allow_oob, Monitor *cur_mon);
+                    bool allow_oob, bool timestamp, Monitor *cur_mon);
 bool qmp_is_oob(const QDict *dict);
 
 typedef void (*qmp_cmd_callback_fn)(const QmpCommand *cmd, void *opaque);
diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index caa2e90ef22a4..69425a7bc8152 100644
--- a/monitor/monitor-internal.h
+++ b/monitor/monitor-internal.h
@@ -136,6 +136,7 @@ typedef struct {
     Monitor common;
     JSONMessageParser parser;
     bool pretty;
+    bool timestamp;
     /*
      * When a client connects, we're in capabilities negotiation mode.
      * @commands is &qmp_cap_negotiation_commands then.  When command
diff --git a/monitor/monitor.c b/monitor/monitor.c
index 86949024f643a..85a0b6498dbc1 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -726,7 +726,7 @@ int monitor_init(MonitorOptions *opts, bool allow_hmp, Error **errp)
 
     switch (opts->mode) {
     case MONITOR_MODE_CONTROL:
-        monitor_init_qmp(chr, opts->pretty, &local_err);
+        monitor_init_qmp(chr, opts->pretty, opts->timestamp, &local_err);
         break;
     case MONITOR_MODE_READLINE:
         if (!allow_hmp) {
@@ -737,6 +737,10 @@ int monitor_init(MonitorOptions *opts, bool allow_hmp, Error **errp)
             error_setg(errp, "'pretty' is not compatible with HMP monitors");
             return -1;
         }
+        if (opts->timestamp) {
+            error_setg(errp, "'timestamp' is not compatible with HMP monitors");
+            return -1;
+        }
         monitor_init_hmp(chr, true, &local_err);
         break;
     default:
@@ -782,6 +786,9 @@ QemuOptsList qemu_mon_opts = {
         },{
             .name = "pretty",
             .type = QEMU_OPT_BOOL,
+        },{
+            .name = "timestamp",
+            .type = QEMU_OPT_BOOL,
         },
         { /* end of list */ }
     },
diff --git a/monitor/qmp.c b/monitor/qmp.c
index 092c527b6fc9c..fd487fee9f850 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -142,7 +142,7 @@ static void monitor_qmp_dispatch(MonitorQMP *mon, QObject *req)
     QDict *error;
 
     rsp = qmp_dispatch(mon->commands, req, qmp_oob_enabled(mon),
-                       &mon->common);
+                       mon->timestamp, &mon->common);
 
     if (mon->commands == &qmp_cap_negotiation_commands) {
         error = qdict_get_qdict(rsp, "error");
@@ -495,7 +495,7 @@ static void monitor_qmp_setup_handlers_bh(void *opaque)
     monitor_list_append(&mon->common);
 }
 
-void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
+void monitor_init_qmp(Chardev *chr, bool pretty, bool timestamp, Error **errp)
 {
     MonitorQMP *mon = g_new0(MonitorQMP, 1);
 
@@ -510,6 +510,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
                       qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_GCONTEXT));
 
     mon->pretty = pretty;
+    mon->timestamp = timestamp;
 
     qemu_mutex_init(&mon->qmp_queue_lock);
     mon->qmp_requests = g_queue_new();
diff --git a/qapi/control.json b/qapi/control.json
index afca2043af2fd..f4a4aef4be7f0 100644
--- a/qapi/control.json
+++ b/qapi/control.json
@@ -199,6 +199,8 @@
 #
 # @pretty: Enables pretty printing (QMP only)
 #
+# @timestamp: Enables qmp command start and end timestamps printing (QMP only)
+#
 # @chardev: Name of a character device to expose the monitor on
 #
 # Since: 5.0
@@ -208,5 +210,6 @@
       '*id': 'str',
       '*mode': 'MonitorMode',
       '*pretty': 'bool',
+      '*timestamp': 'bool',
       'chardev': 'str'
   } }
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 0990873ec8ec1..79885db7417ac 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -110,6 +110,22 @@ bool qmp_is_oob(const QDict *dict)
         && !qdict_haskey(dict, "execute");
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
 typedef struct QmpDispatchBH {
     const QmpCommand *cmd;
     Monitor *cur_mon;
@@ -135,7 +151,7 @@ static void do_qmp_dispatch_bh(void *opaque)
  * context for everything else.
  */
 QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
-                    bool allow_oob, Monitor *cur_mon)
+                    bool allow_oob, bool timestamp, Monitor *cur_mon)
 {
     Error *err = NULL;
     bool oob;
@@ -146,6 +162,11 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
     QObject *id;
     QObject *ret = NULL;
     QDict *rsp = NULL;
+    uint64_t ts_start = -1;
+
+    if (timestamp) {
+        ts_start = g_get_real_time();
+    }
 
     dict = qobject_to(QDict, request);
     if (!dict) {
@@ -270,5 +291,10 @@ out:
         qdict_put_obj(rsp, "id", qobject_ref(id));
     }
 
+    if (timestamp) {
+        uint64_t ts_end = g_get_real_time();
+        add_timestamps(rsp, ts_start, ts_end);
+    }
+
     return rsp;
 }
diff --git a/qga/main.c b/qga/main.c
index 5a9d8252e0755..c6650e4d69ffd 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -573,7 +573,7 @@ static void process_event(void *opaque, QObject *obj, Error *err)
     }
 
     g_debug("processing command");
-    rsp = qmp_dispatch(&ga_commands, obj, false, NULL);
+    rsp = qmp_dispatch(&ga_commands, obj, false, false, NULL);
 
 end:
     ret = send_response(s, rsp);
diff --git a/stubs/monitor-core.c b/stubs/monitor-core.c
index afa477aae656a..dcd9643da7f4c 100644
--- a/stubs/monitor-core.c
+++ b/stubs/monitor-core.c
@@ -12,7 +12,7 @@ Monitor *monitor_set_cur(Coroutine *co, Monitor *mon)
     return NULL;
 }
 
-void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
+void monitor_init_qmp(Chardev *chr, bool pretty, bool timestamp, Error **errp)
 {
 }
 
diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
index 6085c099950b5..778146ec96c18 100644
--- a/tests/unit/test-qmp-cmds.c
+++ b/tests/unit/test-qmp-cmds.c
@@ -150,7 +150,7 @@ static QObject *do_qmp_dispatch(bool allow_oob, const char *template, ...)
     req = qdict_from_vjsonf_nofail(template, ap);
     va_end(ap);
 
-    resp = qmp_dispatch(&qmp_commands, QOBJECT(req), allow_oob, NULL);
+    resp = qmp_dispatch(&qmp_commands, QOBJECT(req), allow_oob, false, NULL);
     g_assert(resp);
     ret = qdict_get(resp, "return");
     g_assert(ret);
@@ -173,7 +173,7 @@ static void do_qmp_dispatch_error(bool allow_oob, ErrorClass cls,
     req = qdict_from_vjsonf_nofail(template, ap);
     va_end(ap);
 
-    resp = qmp_dispatch(&qmp_commands, QOBJECT(req), allow_oob, NULL);
+    resp = qmp_dispatch(&qmp_commands, QOBJECT(req), allow_oob, false,  NULL);
     g_assert(resp);
     error = qdict_get_qdict(resp, "error");
     g_assert(error);
@@ -229,7 +229,7 @@ static void test_dispatch_cmd_success_response(void)
     QDict *resp;
 
     qdict_put_str(req, "execute", "cmd-success-response");
-    resp = qmp_dispatch(&qmp_commands, QOBJECT(req), false, NULL);
+    resp = qmp_dispatch(&qmp_commands, QOBJECT(req), false, false, NULL);
     g_assert_null(resp);
     qobject_unref(req);
 }
-- 
2.25.1


