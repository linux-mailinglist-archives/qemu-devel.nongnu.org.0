Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id C368838C2E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 16:06:32 +0200 (CEST)
Received: from localhost ([::1]:51480 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZFVn-0001jE-V8
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 10:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45201)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hZFKl-0001lJ-L0
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 09:55:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hZFKj-0003Mo-4O
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 09:55:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40666)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hZFKa-0002nD-8V; Fri, 07 Jun 2019 09:54:58 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9ABE581124;
 Fri,  7 Jun 2019 13:54:43 +0000 (UTC)
Received: from dhcp-200-226.str.redhat.com (dhcp-200-226.str.redhat.com
 [10.33.200.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 654151001B15;
 Fri,  7 Jun 2019 13:54:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Jun 2019 15:54:24 +0200
Message-Id: <20190607135430.22149-5-kwolf@redhat.com>
In-Reply-To: <20190607135430.22149-1-kwolf@redhat.com>
References: <20190607135430.22149-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 07 Jun 2019 13:54:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC PATCH 04/10] monitor: Create MonitorHMP with
 readline state
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ReadLineState in Monitor is only used for HMP monitors. Create
MonitorHMP and move it there.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/monitor/monitor.h |   5 +-
 hmp.c                     |   4 +-
 monitor.c                 | 123 +++++++++++++++++++++-----------------
 3 files changed, 75 insertions(+), 57 deletions(-)

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index 86656297f1..1ba354f811 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -7,6 +7,7 @@
 #include "qemu/readline.h"
=20
 extern __thread Monitor *cur_mon;
+typedef struct MonitorHMP MonitorHMP;
=20
 /* flags for monitor_init */
 /* 0x01 unused */
@@ -35,8 +36,8 @@ void monitor_flush(Monitor *mon);
 int monitor_set_cpu(int cpu_index);
 int monitor_get_cpu_index(void);
=20
-void monitor_read_command(Monitor *mon, int show_prompt);
-int monitor_read_password(Monitor *mon, ReadLineFunc *readline_func,
+void monitor_read_command(MonitorHMP *mon, int show_prompt);
+int monitor_read_password(MonitorHMP *mon, ReadLineFunc *readline_func,
                           void *opaque);
=20
 AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset=
_id,
diff --git a/hmp.c b/hmp.c
index be5e345c6f..99414cd39c 100644
--- a/hmp.c
+++ b/hmp.c
@@ -1943,6 +1943,8 @@ static void hmp_change_read_arg(void *opaque, const=
 char *password,
=20
 void hmp_change(Monitor *mon, const QDict *qdict)
 {
+    /* FIXME Make MonitorHMP public and use container_of */
+    MonitorHMP *hmp_mon =3D (MonitorHMP *) mon;
     const char *device =3D qdict_get_str(qdict, "device");
     const char *target =3D qdict_get_str(qdict, "target");
     const char *arg =3D qdict_get_try_str(qdict, "arg");
@@ -1960,7 +1962,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
         if (strcmp(target, "passwd") =3D=3D 0 ||
             strcmp(target, "password") =3D=3D 0) {
             if (!arg) {
-                monitor_read_password(mon, hmp_change_read_arg, NULL);
+                monitor_read_password(hmp_mon, hmp_change_read_arg, NULL=
);
                 return;
             }
         }
diff --git a/monitor.c b/monitor.c
index d18cf18393..810f3dcf9c 100644
--- a/monitor.c
+++ b/monitor.c
@@ -190,14 +190,6 @@ struct Monitor {
     bool skip_flush;
     bool use_io_thread;
=20
-    /*
-     * State used only in the thread "owning" the monitor.
-     * If @use_io_thread, this is @mon_iothread.
-     * Else, it's the main thread.
-     * These members can be safely accessed without locks.
-     */
-    ReadLineState *rs;
-
     gchar *mon_cpu_path;
     mon_cmd_t *cmd_table;
     QTAILQ_ENTRY(Monitor) entry;
@@ -218,6 +210,17 @@ struct Monitor {
     int mux_out;
 };
=20
+struct MonitorHMP {
+    Monitor common;
+    /*
+     * State used only in the thread "owning" the monitor.
+     * If @use_io_thread, this is @mon_iothread.
+     * Else, it's the main thread.
+     * These members can be safely accessed without locks.
+     */
+    ReadLineState *rs;
+};
+
 typedef struct {
     Monitor common;
     JSONMessageParser parser;
@@ -324,7 +327,7 @@ bool monitor_cur_is_qmp(void)
     return cur_mon && monitor_is_qmp(cur_mon);
 }
=20
-void monitor_read_command(Monitor *mon, int show_prompt)
+void monitor_read_command(MonitorHMP *mon, int show_prompt)
 {
     if (!mon->rs)
         return;
@@ -334,7 +337,7 @@ void monitor_read_command(Monitor *mon, int show_prom=
pt)
         readline_show_prompt(mon->rs);
 }
=20
-int monitor_read_password(Monitor *mon, ReadLineFunc *readline_func,
+int monitor_read_password(MonitorHMP *mon, ReadLineFunc *readline_func,
                           void *opaque)
 {
     if (mon->rs) {
@@ -342,7 +345,8 @@ int monitor_read_password(Monitor *mon, ReadLineFunc =
*readline_func,
         /* prompt is printed on return from the command handler */
         return 0;
     } else {
-        monitor_printf(mon, "terminal does not support password promptin=
g\n");
+        monitor_printf(&mon->common,
+                       "terminal does not support password prompting\n")=
;
         return -ENOTTY;
     }
 }
@@ -703,7 +707,7 @@ static void monitor_qapi_event_init(void)
                                                 qapi_event_throttle_equa=
l);
 }
=20
-static void handle_hmp_command(Monitor *mon, const char *cmdline);
+static void handle_hmp_command(MonitorHMP *mon, const char *cmdline);
=20
 static void monitor_iothread_init(void);
=20
@@ -738,8 +742,10 @@ static void monitor_data_destroy(Monitor *mon)
     if (monitor_is_qmp(mon)) {
         MonitorQMP *qmp_mon =3D container_of(mon, MonitorQMP, common);
         monitor_data_destroy_qmp(qmp_mon);
+    } else {
+        MonitorHMP *hmp_mon =3D container_of(mon, MonitorHMP, common);
+        readline_free(hmp_mon->rs);
     }
-    readline_free(mon->rs);
     qobject_unref(mon->outbuf);
     qemu_mutex_destroy(&mon->mon_lock);
 }
@@ -748,12 +754,13 @@ char *qmp_human_monitor_command(const char *command=
_line, bool has_cpu_index,
                                 int64_t cpu_index, Error **errp)
 {
     char *output =3D NULL;
-    Monitor *old_mon, hmp;
+    Monitor *old_mon;
+    MonitorHMP hmp =3D {};
=20
-    monitor_data_init(&hmp, 0, true, false);
+    monitor_data_init(&hmp.common, 0, true, false);
=20
     old_mon =3D cur_mon;
-    cur_mon =3D &hmp;
+    cur_mon =3D &hmp.common;
=20
     if (has_cpu_index) {
         int ret =3D monitor_set_cpu(cpu_index);
@@ -768,16 +775,16 @@ char *qmp_human_monitor_command(const char *command=
_line, bool has_cpu_index,
     handle_hmp_command(&hmp, command_line);
     cur_mon =3D old_mon;
=20
-    qemu_mutex_lock(&hmp.mon_lock);
-    if (qstring_get_length(hmp.outbuf) > 0) {
-        output =3D g_strdup(qstring_get_str(hmp.outbuf));
+    qemu_mutex_lock(&hmp.common.mon_lock);
+    if (qstring_get_length(hmp.common.outbuf) > 0) {
+        output =3D g_strdup(qstring_get_str(hmp.common.outbuf));
     } else {
         output =3D g_strdup("");
     }
-    qemu_mutex_unlock(&hmp.mon_lock);
+    qemu_mutex_unlock(&hmp.common.mon_lock);
=20
 out:
-    monitor_data_destroy(&hmp);
+    monitor_data_destroy(&hmp.common);
     return output;
 }
=20
@@ -1341,14 +1348,15 @@ static void hmp_info_sync_profile(Monitor *mon, c=
onst QDict *qdict)
=20
 static void hmp_info_history(Monitor *mon, const QDict *qdict)
 {
+    MonitorHMP *hmp_mon =3D container_of(mon, MonitorHMP, common);
     int i;
     const char *str;
=20
-    if (!mon->rs)
+    if (!hmp_mon->rs)
         return;
     i =3D 0;
     for(;;) {
-        str =3D readline_get_history(mon->rs, i);
+        str =3D readline_get_history(hmp_mon->rs, i);
         if (!str)
             break;
         monitor_printf(mon, "%d: '%s'\n", i, str);
@@ -3048,11 +3056,12 @@ static const mon_cmd_t *search_dispatch_table(con=
st mon_cmd_t *disp_table,
  * Do not assume the return value points into @table!  It doesn't when
  * the command is found in a sub-command table.
  */
-static const mon_cmd_t *monitor_parse_command(Monitor *mon,
+static const mon_cmd_t *monitor_parse_command(MonitorHMP *hmp_mon,
                                               const char *cmdp_start,
                                               const char **cmdp,
                                               mon_cmd_t *table)
 {
+    Monitor *mon =3D &hmp_mon->common;
     const char *p;
     const mon_cmd_t *cmd;
     char cmdname[256];
@@ -3083,7 +3092,7 @@ static const mon_cmd_t *monitor_parse_command(Monit=
or *mon,
     *cmdp =3D p;
     /* search sub command */
     if (cmd->sub_table !=3D NULL && *p !=3D '\0') {
-        return monitor_parse_command(mon, cmdp_start, cmdp, cmd->sub_tab=
le);
+        return monitor_parse_command(hmp_mon, cmdp_start, cmdp, cmd->sub=
_table);
     }
=20
     return cmd;
@@ -3460,7 +3469,7 @@ fail:
     return NULL;
 }
=20
-static void handle_hmp_command(Monitor *mon, const char *cmdline)
+static void handle_hmp_command(MonitorHMP *mon, const char *cmdline)
 {
     QDict *qdict;
     const mon_cmd_t *cmd;
@@ -3468,26 +3477,26 @@ static void handle_hmp_command(Monitor *mon, cons=
t char *cmdline)
=20
     trace_handle_hmp_command(mon, cmdline);
=20
-    cmd =3D monitor_parse_command(mon, cmdline, &cmdline, mon->cmd_table=
);
+    cmd =3D monitor_parse_command(mon, cmdline, &cmdline, mon->common.cm=
d_table);
     if (!cmd) {
         return;
     }
=20
-    qdict =3D monitor_parse_arguments(mon, &cmdline, cmd);
+    qdict =3D monitor_parse_arguments(&mon->common, &cmdline, cmd);
     if (!qdict) {
         while (cmdline > cmd_start && qemu_isspace(cmdline[-1])) {
             cmdline--;
         }
-        monitor_printf(mon, "Try \"help %.*s\" for more information\n",
+        monitor_printf(&mon->common, "Try \"help %.*s\" for more informa=
tion\n",
                        (int)(cmdline - cmd_start), cmd_start);
         return;
     }
=20
-    cmd->cmd(mon, qdict);
+    cmd->cmd(&mon->common, qdict);
     qobject_unref(qdict);
 }
=20
-static void cmd_completion(Monitor *mon, const char *name, const char *l=
ist)
+static void cmd_completion(MonitorHMP *mon, const char *name, const char=
 *list)
 {
     const char *p, *pstart;
     char cmd[128];
@@ -3511,7 +3520,7 @@ static void cmd_completion(Monitor *mon, const char=
 *name, const char *list)
     }
 }
=20
-static void file_completion(Monitor *mon, const char *input)
+static void file_completion(MonitorHMP *mon, const char *input)
 {
     DIR *ffs;
     struct dirent *d;
@@ -4000,7 +4009,7 @@ void loadvm_completion(ReadLineState *rs, int nb_ar=
gs, const char *str)
     }
 }
=20
-static void monitor_find_completion_by_table(Monitor *mon,
+static void monitor_find_completion_by_table(MonitorHMP *mon,
                                              const mon_cmd_t *cmd_table,
                                              char **args,
                                              int nb_args)
@@ -4095,7 +4104,7 @@ static void monitor_find_completion_by_table(Monito=
r *mon,
 static void monitor_find_completion(void *opaque,
                                     const char *cmdline)
 {
-    Monitor *mon =3D opaque;
+    MonitorHMP *mon =3D opaque;
     char *args[MAX_ARGS];
     int nb_args, len;
=20
@@ -4115,7 +4124,7 @@ static void monitor_find_completion(void *opaque,
     }
=20
     /* 2. auto complete according to args */
-    monitor_find_completion_by_table(mon, mon->cmd_table, args, nb_args)=
;
+    monitor_find_completion_by_table(mon, mon->common.cmd_table, args, n=
b_args);
=20
 cleanup:
     free_cmdline_args(args, nb_args);
@@ -4326,19 +4335,21 @@ static void monitor_qmp_read(void *opaque, const =
uint8_t *buf, int size)
=20
 static void monitor_read(void *opaque, const uint8_t *buf, int size)
 {
+    MonitorHMP *mon;
     Monitor *old_mon =3D cur_mon;
     int i;
=20
     cur_mon =3D opaque;
+    mon =3D container_of(cur_mon, MonitorHMP, common);
=20
-    if (cur_mon->rs) {
+    if (mon->rs) {
         for (i =3D 0; i < size; i++)
-            readline_handle_byte(cur_mon->rs, buf[i]);
+            readline_handle_byte(mon->rs, buf[i]);
     } else {
         if (size =3D=3D 0 || buf[size - 1] !=3D 0)
             monitor_printf(cur_mon, "corrupted command\n");
         else
-            handle_hmp_command(cur_mon, (char *)buf);
+            handle_hmp_command(mon, (char *)buf);
     }
=20
     cur_mon =3D old_mon;
@@ -4347,11 +4358,11 @@ static void monitor_read(void *opaque, const uint=
8_t *buf, int size)
 static void monitor_command_cb(void *opaque, const char *cmdline,
                                void *readline_opaque)
 {
-    Monitor *mon =3D opaque;
+    MonitorHMP *mon =3D opaque;
=20
-    monitor_suspend(mon);
+    monitor_suspend(&mon->common);
     handle_hmp_command(mon, cmdline);
-    monitor_resume(mon);
+    monitor_resume(&mon->common);
 }
=20
 int monitor_suspend(Monitor *mon)
@@ -4397,8 +4408,9 @@ void monitor_resume(Monitor *mon)
         }
=20
         if (!monitor_is_qmp(mon)) {
-            assert(mon->rs);
-            readline_show_prompt(mon->rs);
+            MonitorHMP *hmp_mon =3D container_of(mon, MonitorHMP, common=
);
+            assert(hmp_mon->rs);
+            readline_show_prompt(hmp_mon->rs);
         }
=20
         aio_bh_schedule_oneshot(ctx, monitor_accept_input, mon);
@@ -4460,6 +4472,7 @@ static void monitor_qmp_event(void *opaque, int eve=
nt)
 static void monitor_event(void *opaque, int event)
 {
     Monitor *mon =3D opaque;
+    MonitorHMP *hmp_mon =3D container_of(cur_mon, MonitorHMP, common);
=20
     switch (event) {
     case CHR_EVENT_MUX_IN:
@@ -4467,7 +4480,7 @@ static void monitor_event(void *opaque, int event)
         mon->mux_out =3D 0;
         qemu_mutex_unlock(&mon->mon_lock);
         if (mon->reset_seen) {
-            readline_restart(mon->rs);
+            readline_restart(hmp_mon->rs);
             monitor_resume(mon);
             monitor_flush(mon);
         } else {
@@ -4494,8 +4507,8 @@ static void monitor_event(void *opaque, int event)
         monitor_printf(mon, "QEMU %s monitor - type 'help' for more "
                        "information\n", QEMU_VERSION);
         if (!mon->mux_out) {
-            readline_restart(mon->rs);
-            readline_show_prompt(mon->rs);
+            readline_restart(hmp_mon->rs);
+            readline_show_prompt(hmp_mon->rs);
         }
         mon->reset_seen =3D 1;
         mon_refcount++;
@@ -4556,15 +4569,17 @@ void monitor_init_globals(void)
 static void GCC_FMT_ATTR(2, 3) monitor_readline_printf(void *opaque,
                                                        const char *fmt, =
...)
 {
+    MonitorHMP *mon =3D opaque;
     va_list ap;
     va_start(ap, fmt);
-    monitor_vprintf(opaque, fmt, ap);
+    monitor_vprintf(&mon->common, fmt, ap);
     va_end(ap);
 }
=20
 static void monitor_readline_flush(void *opaque)
 {
-    monitor_flush(opaque);
+    MonitorHMP *mon =3D opaque;
+    monitor_flush(&mon->common);
 }
=20
 /*
@@ -4662,11 +4677,11 @@ static void monitor_init_qmp(Chardev *chr, int fl=
ags)
=20
 static void monitor_init_hmp(Chardev *chr, int flags)
 {
-    Monitor *mon =3D g_malloc(sizeof(*mon));
+    MonitorHMP *mon =3D g_malloc0(sizeof(*mon));
     bool use_readline =3D flags & MONITOR_USE_READLINE;
=20
-    monitor_data_init(mon, flags, false, false);
-    qemu_chr_fe_init(&mon->chr, chr, &error_abort);
+    monitor_data_init(&mon->common, flags, false, false);
+    qemu_chr_fe_init(&mon->common.chr, chr, &error_abort);
=20
     if (use_readline) {
         mon->rs =3D readline_init(monitor_readline_printf,
@@ -4676,9 +4691,9 @@ static void monitor_init_hmp(Chardev *chr, int flag=
s)
         monitor_read_command(mon, 0);
     }
=20
-    qemu_chr_fe_set_handlers(&mon->chr, monitor_can_read, monitor_read,
-                             monitor_event, NULL, mon, NULL, true);
-    monitor_list_append(mon);
+    qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read, monitor=
_read,
+                             monitor_event, NULL, &mon->common, NULL, tr=
ue);
+    monitor_list_append(&mon->common);
 }
=20
 void monitor_init(Chardev *chr, int flags)
--=20
2.20.1


