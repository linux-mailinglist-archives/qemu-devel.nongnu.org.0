Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE8E6892B9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:51:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNri7-0008SI-GC; Fri, 03 Feb 2023 03:46:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhn-0008If-KL
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:45:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhk-0007Tb-Ks
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IB6G2byFE5/s0HxIuHSVwwnIG1raIJwcnsVFzUWJ4lw=;
 b=L53SUzXLSXJnb7DVSfrEEt9+D69p3dfzqQse5rOyqWRTl6pyMf1AnO0UkiHtOa/hRnfj9z
 vpAMZwHlncB2izRttqB+zCSklY2odAWXBQIysyMGETGNCJnElSljy+kMd2H9mN1sXG2ZoS
 /Q2e+QceyzzdC4kQFpO1GsMZe90rvg0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-70cJkwXSNNWrjNsDnadcJA-1; Fri, 03 Feb 2023 03:45:54 -0500
X-MC-Unique: 70cJkwXSNNWrjNsDnadcJA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB619885622;
 Fri,  3 Feb 2023 08:45:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4831492B15;
 Fri,  3 Feb 2023 08:45:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E8DD921E692A; Fri,  3 Feb 2023 09:45:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 24/35] runstate: Move HMP commands from monitor/ to softmmu/
Date: Fri,  3 Feb 2023 09:45:38 +0100
Message-Id: <20230203084549.2622302-25-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This moves these commands from MAINTAINERS section "Human
Monitor (HMP)" and "QMP" to "Main loop".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230124121946.1139465-22-armbru@redhat.com>
---
 MAINTAINERS                 |  3 +-
 include/monitor/hmp.h       |  2 +
 monitor/hmp-cmds.c          | 20 ---------
 monitor/misc.c              | 42 -------------------
 softmmu/runstate-hmp-cmds.c | 82 +++++++++++++++++++++++++++++++++++++
 softmmu/meson.build         |  1 +
 6 files changed, 86 insertions(+), 64 deletions(-)
 create mode 100644 softmmu/runstate-hmp-cmds.c

diff --git a/MAINTAINERS b/MAINTAINERS
index dab4def753..b2f1d2518b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2804,8 +2804,7 @@ F: softmmu/cpus.c
 F: softmmu/cpu-throttle.c
 F: softmmu/cpu-timers.c
 F: softmmu/icount.c
-F: softmmu/runstate-action.c
-F: softmmu/runstate.c
+F: softmmu/runstate*
 F: qapi/run-state.json
 
 Read, Copy, Update (RCU)
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index a248ee9ed1..941da9fde6 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -156,6 +156,8 @@ void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
 void hmp_human_readable_text_helper(Monitor *mon,
                                     HumanReadableText *(*qmp_handler)(Error **));
 void hmp_info_stats(Monitor *mon, const QDict *qdict);
+void hmp_singlestep(Monitor *mon, const QDict *qdict);
+void hmp_watchdog_action(Monitor *mon, const QDict *qdict);
 void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict);
 void hmp_info_capture(Monitor *mon, const QDict *qdict);
 void hmp_stopcapture(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 81f63fa8ec..34e98b0e0b 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -20,7 +20,6 @@
 #include "qapi/error.h"
 #include "qapi/qapi-commands-control.h"
 #include "qapi/qapi-commands-misc.h"
-#include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-commands-stats.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
@@ -80,25 +79,6 @@ void hmp_info_version(Monitor *mon, const QDict *qdict)
     qapi_free_VersionInfo(info);
 }
 
-void hmp_info_status(Monitor *mon, const QDict *qdict)
-{
-    StatusInfo *info;
-
-    info = qmp_query_status(NULL);
-
-    monitor_printf(mon, "VM status: %s%s",
-                   info->running ? "running" : "paused",
-                   info->singlestep ? " (single step mode)" : "");
-
-    if (!info->running && info->status != RUN_STATE_PAUSED) {
-        monitor_printf(mon, " (%s)", RunState_str(info->status));
-    }
-
-    monitor_printf(mon, "\n");
-
-    qapi_free_StatusInfo(info);
-}
-
 static int hmp_info_pic_foreach(Object *obj, void *opaque)
 {
     InterruptStatsProvider *intc;
diff --git a/monitor/misc.c b/monitor/misc.c
index ff3002a880..a2584df0ca 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -43,7 +43,6 @@
 #include "block/block-hmp-cmds.h"
 #include "qapi/qapi-commands-control.h"
 #include "qapi/qapi-commands-misc.h"
-#include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-init-commands.h"
 #include "qapi/error.h"
@@ -319,18 +318,6 @@ static void hmp_log(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_singlestep(Monitor *mon, const QDict *qdict)
-{
-    const char *option = qdict_get_try_str(qdict, "option");
-    if (!option || !strcmp(option, "on")) {
-        singlestep = 1;
-    } else if (!strcmp(option, "off")) {
-        singlestep = 0;
-    } else {
-        monitor_printf(mon, "unexpected option %s\n", option);
-    }
-}
-
 static void hmp_gdbserver(Monitor *mon, const QDict *qdict)
 {
     const char *device = qdict_get_try_str(qdict, "device");
@@ -349,22 +336,6 @@ static void hmp_gdbserver(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_watchdog_action(Monitor *mon, const QDict *qdict)
-{
-    Error *err = NULL;
-    WatchdogAction action;
-    char *qapi_value;
-
-    qapi_value = g_ascii_strdown(qdict_get_str(qdict, "action"), -1);
-    action = qapi_enum_parse(&WatchdogAction_lookup, qapi_value, -1, &err);
-    g_free(qapi_value);
-    if (err) {
-        hmp_handle_error(mon, err);
-        return;
-    }
-    qmp_watchdog_set_action(action, &error_abort);
-}
-
 static void monitor_printc(Monitor *mon, int c)
 {
     monitor_printf(mon, "'");
@@ -1317,19 +1288,6 @@ void device_del_completion(ReadLineState *rs, int nb_args, const char *str)
     peripheral_device_del_completion(rs, str);
 }
 
-void watchdog_action_completion(ReadLineState *rs, int nb_args, const char *str)
-{
-    int i;
-
-    if (nb_args != 2) {
-        return;
-    }
-    readline_set_completion_index(rs, strlen(str));
-    for (i = 0; i < WATCHDOG_ACTION__MAX; i++) {
-        readline_add_completion_of(rs, str, WatchdogAction_str(i));
-    }
-}
-
 static int
 compare_mon_cmd(const void *a, const void *b)
 {
diff --git a/softmmu/runstate-hmp-cmds.c b/softmmu/runstate-hmp-cmds.c
new file mode 100644
index 0000000000..d55a7d4db8
--- /dev/null
+++ b/softmmu/runstate-hmp-cmds.c
@@ -0,0 +1,82 @@
+/*
+ * HMP commands related to run state
+ *
+ * Copyright IBM, Corp. 2011
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "exec/cpu-common.h"
+#include "monitor/hmp.h"
+#include "monitor/monitor.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-run-state.h"
+#include "qapi/qmp/qdict.h"
+
+void hmp_info_status(Monitor *mon, const QDict *qdict)
+{
+    StatusInfo *info;
+
+    info = qmp_query_status(NULL);
+
+    monitor_printf(mon, "VM status: %s%s",
+                   info->running ? "running" : "paused",
+                   info->singlestep ? " (single step mode)" : "");
+
+    if (!info->running && info->status != RUN_STATE_PAUSED) {
+        monitor_printf(mon, " (%s)", RunState_str(info->status));
+    }
+
+    monitor_printf(mon, "\n");
+
+    qapi_free_StatusInfo(info);
+}
+
+void hmp_singlestep(Monitor *mon, const QDict *qdict)
+{
+    const char *option = qdict_get_try_str(qdict, "option");
+    if (!option || !strcmp(option, "on")) {
+        singlestep = 1;
+    } else if (!strcmp(option, "off")) {
+        singlestep = 0;
+    } else {
+        monitor_printf(mon, "unexpected option %s\n", option);
+    }
+}
+
+void hmp_watchdog_action(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    WatchdogAction action;
+    char *qapi_value;
+
+    qapi_value = g_ascii_strdown(qdict_get_str(qdict, "action"), -1);
+    action = qapi_enum_parse(&WatchdogAction_lookup, qapi_value, -1, &err);
+    g_free(qapi_value);
+    if (err) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+    qmp_watchdog_set_action(action, &error_abort);
+}
+
+void watchdog_action_completion(ReadLineState *rs, int nb_args, const char *str)
+{
+    int i;
+
+    if (nb_args != 2) {
+        return;
+    }
+    readline_set_completion_index(rs, strlen(str));
+    for (i = 0; i < WATCHDOG_ACTION__MAX; i++) {
+        readline_add_completion_of(rs, str, WatchdogAction_str(i));
+    }
+}
diff --git a/softmmu/meson.build b/softmmu/meson.build
index efbf4ec029..1828db149c 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -24,6 +24,7 @@ softmmu_ss.add(files(
   'qdev-monitor.c',
   'rtc.c',
   'runstate-action.c',
+  'runstate-hmp-cmds.c',
   'runstate.c',
   'tpm-hmp-cmds.c',
   'vl.c',
-- 
2.39.0


