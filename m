Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70B03CDD9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 16:02:35 +0200 (CEST)
Received: from localhost ([::1]:59280 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hahMB-0006it-0N
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 10:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56169)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hah1U-00062J-Ru
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 09:41:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hah1S-0000yH-HR
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 09:41:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41524)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hah1N-0000vw-7D; Tue, 11 Jun 2019 09:41:05 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 424C83087951;
 Tue, 11 Jun 2019 13:41:00 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-58.ams2.redhat.com [10.36.117.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A7CE19C59;
 Tue, 11 Jun 2019 13:40:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 15:40:35 +0200
Message-Id: <20190611134043.9524-4-kwolf@redhat.com>
In-Reply-To: <20190611134043.9524-1-kwolf@redhat.com>
References: <20190611134043.9524-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 11 Jun 2019 13:41:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 03/11] monitor: Make MonitorQMP a child
 class of Monitor
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 armbru@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, struct Monitor mixes state that is only relevant for HMP,
state that is only relevant for QMP, and some actually shared state.
In particular, a MonitorQMP field is present in the state of any
monitor, even if it's not a QMP monitor and therefore doesn't use the
state.

As a first step towards a clean separation between QMP and HMP, let
MonitorQMP extend Monitor and create a MonitorQMP object only when the
monitor is actually a QMP monitor.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 monitor.c | 214 ++++++++++++++++++++++++++++++------------------------
 1 file changed, 118 insertions(+), 96 deletions(-)

diff --git a/monitor.c b/monitor.c
index bb23cc0450..d18cf18393 100644
--- a/monitor.c
+++ b/monitor.c
@@ -166,26 +166,6 @@ struct MonFdset {
     QLIST_ENTRY(MonFdset) next;
 };
=20
-typedef struct {
-    JSONMessageParser parser;
-    /*
-     * When a client connects, we're in capabilities negotiation mode.
-     * @commands is &qmp_cap_negotiation_commands then.  When command
-     * qmp_capabilities succeeds, we go into command mode, and
-     * @command becomes &qmp_commands.
-     */
-    QmpCommandList *commands;
-    bool capab_offered[QMP_CAPABILITY__MAX]; /* capabilities offered */
-    bool capab[QMP_CAPABILITY__MAX];         /* offered and accepted */
-    /*
-     * Protects qmp request/response queue.
-     * Take monitor_lock first when you need both.
-     */
-    QemuMutex qmp_queue_lock;
-    /* Input queue that holds all the parsed QMP requests */
-    GQueue *qmp_requests;
-} MonitorQMP;
-
 /*
  * To prevent flooding clients, events can be throttled. The
  * throttling is calculated globally, rather than per-Monitor
@@ -218,7 +198,6 @@ struct Monitor {
      */
     ReadLineState *rs;
=20
-    MonitorQMP qmp;
     gchar *mon_cpu_path;
     mon_cmd_t *cmd_table;
     QTAILQ_ENTRY(Monitor) entry;
@@ -239,6 +218,27 @@ struct Monitor {
     int mux_out;
 };
=20
+typedef struct {
+    Monitor common;
+    JSONMessageParser parser;
+    /*
+     * When a client connects, we're in capabilities negotiation mode.
+     * @commands is &qmp_cap_negotiation_commands then.  When command
+     * qmp_capabilities succeeds, we go into command mode, and
+     * @command becomes &qmp_commands.
+     */
+    QmpCommandList *commands;
+    bool capab_offered[QMP_CAPABILITY__MAX]; /* capabilities offered */
+    bool capab[QMP_CAPABILITY__MAX];         /* offered and accepted */
+    /*
+     * Protects qmp request/response queue.
+     * Take monitor_lock first when you need both.
+     */
+    QemuMutex qmp_queue_lock;
+    /* Input queue that holds all the parsed QMP requests */
+    GQueue *qmp_requests;
+} MonitorQMP;
+
 /* Shared monitor I/O thread */
 IOThread *mon_iothread;
=20
@@ -247,7 +247,7 @@ QEMUBH *qmp_dispatcher_bh;
=20
 struct QMPRequest {
     /* Owner of the request */
-    Monitor *mon;
+    MonitorQMP *mon;
     /*
      * Request object to be handled or Error to be reported
      * (exactly one of them is non-null)
@@ -355,18 +355,18 @@ static void qmp_request_free(QMPRequest *req)
 }
=20
 /* Caller must hold mon->qmp.qmp_queue_lock */
-static void monitor_qmp_cleanup_req_queue_locked(Monitor *mon)
+static void monitor_qmp_cleanup_req_queue_locked(MonitorQMP *mon)
 {
-    while (!g_queue_is_empty(mon->qmp.qmp_requests)) {
-        qmp_request_free(g_queue_pop_head(mon->qmp.qmp_requests));
+    while (!g_queue_is_empty(mon->qmp_requests)) {
+        qmp_request_free(g_queue_pop_head(mon->qmp_requests));
     }
 }
=20
-static void monitor_qmp_cleanup_queues(Monitor *mon)
+static void monitor_qmp_cleanup_queues(MonitorQMP *mon)
 {
-    qemu_mutex_lock(&mon->qmp.qmp_queue_lock);
+    qemu_mutex_lock(&mon->qmp_queue_lock);
     monitor_qmp_cleanup_req_queue_locked(mon);
-    qemu_mutex_unlock(&mon->qmp.qmp_queue_lock);
+    qemu_mutex_unlock(&mon->qmp_queue_lock);
 }
=20
=20
@@ -478,17 +478,17 @@ int monitor_printf(Monitor *mon, const char *fmt, .=
..)
     return ret;
 }
=20
-static void qmp_send_response(Monitor *mon, const QDict *rsp)
+static void qmp_send_response(MonitorQMP *mon, const QDict *rsp)
 {
     const QObject *data =3D QOBJECT(rsp);
     QString *json;
=20
-    json =3D mon->flags & MONITOR_USE_PRETTY ? qobject_to_json_pretty(da=
ta) :
-                                             qobject_to_json(data);
+    json =3D mon->common.flags & MONITOR_USE_PRETTY ?
+           qobject_to_json_pretty(data) : qobject_to_json(data);
     assert(json !=3D NULL);
=20
     qstring_append_chr(json, '\n');
-    monitor_puts(mon, qstring_get_str(json));
+    monitor_puts(&mon->common, qstring_get_str(json));
=20
     qobject_unref(json);
 }
@@ -511,12 +511,17 @@ static MonitorQAPIEventConf monitor_qapi_event_conf=
[QAPI_EVENT__MAX] =3D {
 static void monitor_qapi_event_emit(QAPIEvent event, QDict *qdict)
 {
     Monitor *mon;
+    MonitorQMP *qmp_mon;
=20
     trace_monitor_protocol_event_emit(event, qdict);
     QTAILQ_FOREACH(mon, &mon_list, entry) {
-        if (monitor_is_qmp(mon)
-            && mon->qmp.commands !=3D &qmp_cap_negotiation_commands) {
-            qmp_send_response(mon, qdict);
+        if (!monitor_is_qmp(mon)) {
+            continue;
+        }
+
+        qmp_mon =3D container_of(mon, MonitorQMP, common);
+        if (qmp_mon->commands !=3D &qmp_cap_negotiation_commands) {
+            qmp_send_response(qmp_mon, qdict);
         }
     }
 }
@@ -710,29 +715,33 @@ static void monitor_data_init(Monitor *mon, int fla=
gs, bool skip_flush,
     }
     memset(mon, 0, sizeof(Monitor));
     qemu_mutex_init(&mon->mon_lock);
-    qemu_mutex_init(&mon->qmp.qmp_queue_lock);
     mon->outbuf =3D qstring_new();
     /* Use *mon_cmds by default. */
     mon->cmd_table =3D mon_cmds;
     mon->skip_flush =3D skip_flush;
     mon->use_io_thread =3D use_io_thread;
-    mon->qmp.qmp_requests =3D g_queue_new();
     mon->flags =3D flags;
 }
=20
+static void monitor_data_destroy_qmp(MonitorQMP *mon)
+{
+    json_message_parser_destroy(&mon->parser);
+    qemu_mutex_destroy(&mon->qmp_queue_lock);
+    monitor_qmp_cleanup_req_queue_locked(mon);
+    g_queue_free(mon->qmp_requests);
+}
+
 static void monitor_data_destroy(Monitor *mon)
 {
     g_free(mon->mon_cpu_path);
     qemu_chr_fe_deinit(&mon->chr, false);
     if (monitor_is_qmp(mon)) {
-        json_message_parser_destroy(&mon->qmp.parser);
+        MonitorQMP *qmp_mon =3D container_of(mon, MonitorQMP, common);
+        monitor_data_destroy_qmp(qmp_mon);
     }
     readline_free(mon->rs);
     qobject_unref(mon->outbuf);
     qemu_mutex_destroy(&mon->mon_lock);
-    qemu_mutex_destroy(&mon->qmp.qmp_queue_lock);
-    monitor_qmp_cleanup_req_queue_locked(mon);
-    g_queue_free(mon->qmp.qmp_requests);
 }
=20
 char *qmp_human_monitor_command(const char *command_line, bool has_cpu_i=
ndex,
@@ -1085,8 +1094,9 @@ static void query_commands_cb(QmpCommand *cmd, void=
 *opaque)
 CommandInfoList *qmp_query_commands(Error **errp)
 {
     CommandInfoList *list =3D NULL;
+    MonitorQMP *mon =3D container_of(cur_mon, MonitorQMP, common);
=20
-    qmp_for_each_command(cur_mon->qmp.commands, query_commands_cb, &list=
);
+    qmp_for_each_command(mon->commands, query_commands_cb, &list);
=20
     return list;
 }
@@ -1153,16 +1163,16 @@ static void monitor_init_qmp_commands(void)
                          qmp_marshal_qmp_capabilities, QCO_ALLOW_PRECONF=
IG);
 }
=20
-static bool qmp_oob_enabled(Monitor *mon)
+static bool qmp_oob_enabled(MonitorQMP *mon)
 {
-    return mon->qmp.capab[QMP_CAPABILITY_OOB];
+    return mon->capab[QMP_CAPABILITY_OOB];
 }
=20
-static void monitor_qmp_caps_reset(Monitor *mon)
+static void monitor_qmp_caps_reset(MonitorQMP *mon)
 {
-    memset(mon->qmp.capab_offered, 0, sizeof(mon->qmp.capab_offered));
-    memset(mon->qmp.capab, 0, sizeof(mon->qmp.capab));
-    mon->qmp.capab_offered[QMP_CAPABILITY_OOB] =3D mon->use_io_thread;
+    memset(mon->capab_offered, 0, sizeof(mon->capab_offered));
+    memset(mon->capab, 0, sizeof(mon->capab));
+    mon->capab_offered[QMP_CAPABILITY_OOB] =3D mon->common.use_io_thread=
;
 }
=20
 /*
@@ -1170,7 +1180,7 @@ static void monitor_qmp_caps_reset(Monitor *mon)
  * On success, set mon->qmp.capab[], and return true.
  * On error, set @errp, and return false.
  */
-static bool qmp_caps_accept(Monitor *mon, QMPCapabilityList *list,
+static bool qmp_caps_accept(MonitorQMP *mon, QMPCapabilityList *list,
                             Error **errp)
 {
     GString *unavailable =3D NULL;
@@ -1179,7 +1189,7 @@ static bool qmp_caps_accept(Monitor *mon, QMPCapabi=
lityList *list,
     memset(capab, 0, sizeof(capab));
=20
     for (; list; list =3D list->next) {
-        if (!mon->qmp.capab_offered[list->value]) {
+        if (!mon->capab_offered[list->value]) {
             if (!unavailable) {
                 unavailable =3D g_string_new(QMPCapability_str(list->val=
ue));
             } else {
@@ -1196,25 +1206,27 @@ static bool qmp_caps_accept(Monitor *mon, QMPCapa=
bilityList *list,
         return false;
     }
=20
-    memcpy(mon->qmp.capab, capab, sizeof(capab));
+    memcpy(mon->capab, capab, sizeof(capab));
     return true;
 }
=20
 void qmp_qmp_capabilities(bool has_enable, QMPCapabilityList *enable,
                           Error **errp)
 {
-    if (cur_mon->qmp.commands =3D=3D &qmp_commands) {
+    MonitorQMP *mon =3D container_of(cur_mon, MonitorQMP, common);
+
+    if (mon->commands =3D=3D &qmp_commands) {
         error_set(errp, ERROR_CLASS_COMMAND_NOT_FOUND,
                   "Capabilities negotiation is already complete, command=
 "
                   "ignored");
         return;
     }
=20
-    if (!qmp_caps_accept(cur_mon, enable, errp)) {
+    if (!qmp_caps_accept(mon, enable, errp)) {
         return;
     }
=20
-    cur_mon->qmp.commands =3D &qmp_commands;
+    mon->commands =3D &qmp_commands;
 }
=20
 /* Set the current CPU defined by the user. Callers must hold BQL. */
@@ -4121,27 +4133,27 @@ static int monitor_can_read(void *opaque)
  * Null @rsp can only happen for commands with QCO_NO_SUCCESS_RESP.
  * Nothing is emitted then.
  */
-static void monitor_qmp_respond(Monitor *mon, QDict *rsp)
+static void monitor_qmp_respond(MonitorQMP *mon, QDict *rsp)
 {
     if (rsp) {
         qmp_send_response(mon, rsp);
     }
 }
=20
-static void monitor_qmp_dispatch(Monitor *mon, QObject *req)
+static void monitor_qmp_dispatch(MonitorQMP *mon, QObject *req)
 {
     Monitor *old_mon;
     QDict *rsp;
     QDict *error;
=20
     old_mon =3D cur_mon;
-    cur_mon =3D mon;
+    cur_mon =3D &mon->common;
=20
-    rsp =3D qmp_dispatch(mon->qmp.commands, req, qmp_oob_enabled(mon));
+    rsp =3D qmp_dispatch(mon->commands, req, qmp_oob_enabled(mon));
=20
     cur_mon =3D old_mon;
=20
-    if (mon->qmp.commands =3D=3D &qmp_cap_negotiation_commands) {
+    if (mon->commands =3D=3D &qmp_cap_negotiation_commands) {
         error =3D qdict_get_qdict(rsp, "error");
         if (error
             && !g_strcmp0(qdict_get_try_str(error, "class"),
@@ -4166,24 +4178,30 @@ static void monitor_qmp_dispatch(Monitor *mon, QO=
bject *req)
  * monitor to the end of mon_list queue.
  *
  * Note: if the function returned with non-NULL, then the caller will
- * be with mon->qmp.qmp_queue_lock held, and the caller is responsible
+ * be with qmp_mon->qmp_queue_lock held, and the caller is responsible
  * to release it.
  */
 static QMPRequest *monitor_qmp_requests_pop_any_with_lock(void)
 {
     QMPRequest *req_obj =3D NULL;
     Monitor *mon;
+    MonitorQMP *qmp_mon;
=20
     qemu_mutex_lock(&monitor_lock);
=20
     QTAILQ_FOREACH(mon, &mon_list, entry) {
-        qemu_mutex_lock(&mon->qmp.qmp_queue_lock);
-        req_obj =3D g_queue_pop_head(mon->qmp.qmp_requests);
+        if (!monitor_is_qmp(mon)) {
+            continue;
+        }
+
+        qmp_mon =3D container_of(mon, MonitorQMP, common);
+        qemu_mutex_lock(&qmp_mon->qmp_queue_lock);
+        req_obj =3D g_queue_pop_head(qmp_mon->qmp_requests);
         if (req_obj) {
             /* With the lock of corresponding queue held */
             break;
         }
-        qemu_mutex_unlock(&mon->qmp.qmp_queue_lock);
+        qemu_mutex_unlock(&qmp_mon->qmp_queue_lock);
     }
=20
     if (req_obj) {
@@ -4205,7 +4223,7 @@ static void monitor_qmp_bh_dispatcher(void *data)
     QMPRequest *req_obj =3D monitor_qmp_requests_pop_any_with_lock();
     QDict *rsp;
     bool need_resume;
-    Monitor *mon;
+    MonitorQMP *mon;
=20
     if (!req_obj) {
         return;
@@ -4214,8 +4232,8 @@ static void monitor_qmp_bh_dispatcher(void *data)
     mon =3D req_obj->mon;
     /*  qmp_oob_enabled() might change after "qmp_capabilities" */
     need_resume =3D !qmp_oob_enabled(mon) ||
-        mon->qmp.qmp_requests->length =3D=3D QMP_REQ_QUEUE_LEN_MAX - 1;
-    qemu_mutex_unlock(&mon->qmp.qmp_queue_lock);
+        mon->qmp_requests->length =3D=3D QMP_REQ_QUEUE_LEN_MAX - 1;
+    qemu_mutex_unlock(&mon->qmp_queue_lock);
     if (req_obj->req) {
         QDict *qdict =3D qobject_to(QDict, req_obj->req);
         QObject *id =3D qdict ? qdict_get(qdict, "id") : NULL;
@@ -4231,7 +4249,7 @@ static void monitor_qmp_bh_dispatcher(void *data)
=20
     if (need_resume) {
         /* Pairs with the monitor_suspend() in handle_qmp_command() */
-        monitor_resume(mon);
+        monitor_resume(&mon->common);
     }
     qmp_request_free(req_obj);
=20
@@ -4241,7 +4259,7 @@ static void monitor_qmp_bh_dispatcher(void *data)
=20
 static void handle_qmp_command(void *opaque, QObject *req, Error *err)
 {
-    Monitor *mon =3D opaque;
+    MonitorQMP *mon =3D opaque;
     QObject *id =3D NULL;
     QDict *qdict;
     QMPRequest *req_obj;
@@ -4273,7 +4291,7 @@ static void handle_qmp_command(void *opaque, QObjec=
t *req, Error *err)
     req_obj->err =3D err;
=20
     /* Protect qmp_requests and fetching its length. */
-    qemu_mutex_lock(&mon->qmp.qmp_queue_lock);
+    qemu_mutex_lock(&mon->qmp_queue_lock);
=20
     /*
      * Suspend the monitor when we can't queue more requests after
@@ -4282,8 +4300,8 @@ static void handle_qmp_command(void *opaque, QObjec=
t *req, Error *err)
      * command, for backward compatibility.
      */
     if (!qmp_oob_enabled(mon) ||
-        mon->qmp.qmp_requests->length =3D=3D QMP_REQ_QUEUE_LEN_MAX - 1) =
{
-        monitor_suspend(mon);
+        mon->qmp_requests->length =3D=3D QMP_REQ_QUEUE_LEN_MAX - 1) {
+        monitor_suspend(&mon->common);
     }
=20
     /*
@@ -4291,9 +4309,9 @@ static void handle_qmp_command(void *opaque, QObjec=
t *req, Error *err)
      * handled in time order.  Ownership for req_obj, req,
      * etc. will be delivered to the handler side.
      */
-    assert(mon->qmp.qmp_requests->length < QMP_REQ_QUEUE_LEN_MAX);
-    g_queue_push_tail(mon->qmp.qmp_requests, req_obj);
-    qemu_mutex_unlock(&mon->qmp.qmp_queue_lock);
+    assert(mon->qmp_requests->length < QMP_REQ_QUEUE_LEN_MAX);
+    g_queue_push_tail(mon->qmp_requests, req_obj);
+    qemu_mutex_unlock(&mon->qmp_queue_lock);
=20
     /* Kick the dispatcher routine */
     qemu_bh_schedule(qmp_dispatcher_bh);
@@ -4301,9 +4319,9 @@ static void handle_qmp_command(void *opaque, QObjec=
t *req, Error *err)
=20
 static void monitor_qmp_read(void *opaque, const uint8_t *buf, int size)
 {
-    Monitor *mon =3D opaque;
+    MonitorQMP *mon =3D opaque;
=20
-    json_message_parser_feed(&mon->qmp.parser, (const char *) buf, size)=
;
+    json_message_parser_feed(&mon->parser, (const char *) buf, size);
 }
=20
 static void monitor_read(void *opaque, const uint8_t *buf, int size)
@@ -4389,7 +4407,7 @@ void monitor_resume(Monitor *mon)
     trace_monitor_suspend(mon, -1);
 }
=20
-static QDict *qmp_greeting(Monitor *mon)
+static QDict *qmp_greeting(MonitorQMP *mon)
 {
     QList *cap_list =3D qlist_new();
     QObject *ver =3D NULL;
@@ -4398,7 +4416,7 @@ static QDict *qmp_greeting(Monitor *mon)
     qmp_marshal_query_version(NULL, &ver, NULL);
=20
     for (cap =3D 0; cap < QMP_CAPABILITY__MAX; cap++) {
-        if (mon->qmp.capab_offered[cap]) {
+        if (mon->capab_offered[cap]) {
             qlist_append_str(cap_list, QMPCapability_str(cap));
         }
     }
@@ -4411,11 +4429,11 @@ static QDict *qmp_greeting(Monitor *mon)
 static void monitor_qmp_event(void *opaque, int event)
 {
     QDict *data;
-    Monitor *mon =3D opaque;
+    MonitorQMP *mon =3D opaque;
=20
     switch (event) {
     case CHR_EVENT_OPENED:
-        mon->qmp.commands =3D &qmp_cap_negotiation_commands;
+        mon->commands =3D &qmp_cap_negotiation_commands;
         monitor_qmp_caps_reset(mon);
         data =3D qmp_greeting(mon);
         qmp_send_response(mon, data);
@@ -4430,8 +4448,8 @@ static void monitor_qmp_event(void *opaque, int eve=
nt)
          * is closed.
          */
         monitor_qmp_cleanup_queues(mon);
-        json_message_parser_destroy(&mon->qmp.parser);
-        json_message_parser_init(&mon->qmp.parser, handle_qmp_command,
+        json_message_parser_destroy(&mon->parser);
+        json_message_parser_init(&mon->parser, handle_qmp_command,
                                  mon, NULL);
         mon_refcount--;
         monitor_fdsets_cleanup();
@@ -4593,30 +4611,34 @@ static void monitor_list_append(Monitor *mon)
=20
 static void monitor_qmp_setup_handlers_bh(void *opaque)
 {
-    Monitor *mon =3D opaque;
+    MonitorQMP *mon =3D opaque;
     GMainContext *context;
=20
-    assert(mon->use_io_thread);
+    assert(mon->common.use_io_thread);
     context =3D iothread_get_g_main_context(mon_iothread);
     assert(context);
-    qemu_chr_fe_set_handlers(&mon->chr, monitor_can_read, monitor_qmp_re=
ad,
-                             monitor_qmp_event, NULL, mon, context, true=
);
-    monitor_list_append(mon);
+    qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
+                             monitor_qmp_read, monitor_qmp_event,
+                             NULL, &mon->common, context, true);
+    monitor_list_append(&mon->common);
 }
=20
 static void monitor_init_qmp(Chardev *chr, int flags)
 {
-    Monitor *mon =3D g_malloc(sizeof(*mon));
+    MonitorQMP *mon =3D g_malloc0(sizeof(*mon));
=20
     /* Note: we run QMP monitor in I/O thread when @chr supports that */
-    monitor_data_init(mon, flags, false,
+    monitor_data_init(&mon->common, flags, false,
                       qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_GCONTE=
XT));
=20
-    qemu_chr_fe_init(&mon->chr, chr, &error_abort);
-    qemu_chr_fe_set_echo(&mon->chr, true);
+    qemu_mutex_init(&mon->qmp_queue_lock);
+    mon->qmp_requests =3D g_queue_new();
=20
-    json_message_parser_init(&mon->qmp.parser, handle_qmp_command, mon, =
NULL);
-    if (mon->use_io_thread) {
+    qemu_chr_fe_init(&mon->common.chr, chr, &error_abort);
+    qemu_chr_fe_set_echo(&mon->common.chr, true);
+
+    json_message_parser_init(&mon->parser, handle_qmp_command, mon, NULL=
);
+    if (mon->common.use_io_thread) {
         /*
          * Make sure the old iowatch is gone.  It's possible when
          * e.g. the chardev is in client mode, with wait=3Don.
@@ -4631,10 +4653,10 @@ static void monitor_init_qmp(Chardev *chr, int fl=
ags)
                                 monitor_qmp_setup_handlers_bh, mon);
         /* The bottom half will add @mon to @mon_list */
     } else {
-        qemu_chr_fe_set_handlers(&mon->chr, monitor_can_read,
+        qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
                                  monitor_qmp_read, monitor_qmp_event,
-                                 NULL, mon, NULL, true);
-        monitor_list_append(mon);
+                                 NULL, &mon->common, NULL, true);
+        monitor_list_append(&mon->common);
     }
 }
=20
--=20
2.20.1


