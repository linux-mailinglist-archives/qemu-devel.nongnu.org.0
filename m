Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7719D43E5BC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:06:11 +0200 (CEST)
Received: from localhost ([::1]:48500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7us-0004VG-Ea
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mg7lx-0002cS-Dw
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:56:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mg7lo-0004Mc-Fo
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:56:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635436607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=10YGfDfSqIbe7pjzzpFxtD1BkSLXOPJYlHSYOdQ683o=;
 b=TrFBiCEvEnyUA62oqx0JVFW0pU7LhomK4sTriBvuxhiVZl7F9JOa8QILrivFO1Vur4BF4o
 TyaHuTzHlIFomnzy8vv78Rt9CiL/GHd5vNhWCHC1SWH+fSM5eFKdVYCcwaJTjTr0JSB2DL
 OzICcLC+I/xO3kOmghQG8HyRYdyeAfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-kMC4xw5WPNi5EHIIgIcBpw-1; Thu, 28 Oct 2021 11:56:46 -0400
X-MC-Unique: kMC4xw5WPNi5EHIIgIcBpw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C70861023F4E;
 Thu, 28 Oct 2021 15:56:44 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23C955F4EE;
 Thu, 28 Oct 2021 15:56:33 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/22] monitor: introduce HumanReadableText and HMP support
Date: Thu, 28 Oct 2021 16:54:41 +0100
Message-Id: <20211028155457.967291-7-berrange@redhat.com>
In-Reply-To: <20211028155457.967291-1-berrange@redhat.com>
References: <20211028155457.967291-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) DKIM_INVALID=0.1, DKIM_SIGNED=0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This provides a foundation on which to convert simple HMP commands to
use QMP. The QMP implementation will generate formatted text targeted
for human consumption, returning it in the HumanReadableText data type.

The HMP command handler will simply print out the formatted string
within the HumanReadableText data type. Since this will be an entirely
formulaic action in the case of HMP commands taking no arguemnts, a
custom command handler is provided.

Thus instead of registering a 'cmd' callback for the HMP command, a
'cmd_info_hrt' callback is provided, which will simply be a pointer
to the QMP implementation.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/monitor/hmp.h       |  3 +++
 include/monitor/monitor.h   |  2 ++
 include/qapi/type-helpers.h | 14 ++++++++++++++
 monitor/hmp.c               | 31 ++++++++++++++++++++++++++++---
 monitor/misc.c              | 18 +++++++++++++++++-
 monitor/monitor-internal.h  |  7 +++++++
 qapi/common.json            | 11 +++++++++++
 qapi/meson.build            |  3 +++
 qapi/qapi-type-helpers.c    | 23 +++++++++++++++++++++++
 9 files changed, 108 insertions(+), 4 deletions(-)
 create mode 100644 include/qapi/type-helpers.h
 create mode 100644 qapi/qapi-type-helpers.c

diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index a2cb002a3a..96d014826a 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -15,6 +15,7 @@
 #define HMP_H
 
 #include "qemu/readline.h"
+#include "qapi/qapi-types-common.h"
 
 bool hmp_handle_error(Monitor *mon, Error *err);
 
@@ -130,5 +131,7 @@ void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
 void hmp_replay_seek(Monitor *mon, const QDict *qdict);
 void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict);
 void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
+void hmp_human_readable_text_helper(Monitor *mon,
+                                    HumanReadableText *(*qmp_handler)(Error **));
 
 #endif
diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index 1a8a369b50..12d395d62d 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -53,5 +53,7 @@ int64_t monitor_fdset_dup_fd_find(int dup_fd);
 
 void monitor_register_hmp(const char *name, bool info,
                           void (*cmd)(Monitor *mon, const QDict *qdict));
+void monitor_register_hmp_info_hrt(const char *name,
+                                   HumanReadableText *(*handler)(Error **errp));
 
 #endif /* MONITOR_H */
diff --git a/include/qapi/type-helpers.h b/include/qapi/type-helpers.h
new file mode 100644
index 0000000000..be1f181526
--- /dev/null
+++ b/include/qapi/type-helpers.h
@@ -0,0 +1,14 @@
+/*
+ * QAPI common helper functions
+ *
+ * This file provides helper functions related to types defined
+ * in the QAPI schema.
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ *
+ */
+
+#include "qapi/qapi-types-common.h"
+
+HumanReadableText *human_readable_text_from_str(GString *str);
diff --git a/monitor/hmp.c b/monitor/hmp.c
index d50c3124e1..352a4d9c80 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -1061,6 +1061,31 @@ fail:
     return NULL;
 }
 
+static void hmp_info_human_readable_text(Monitor *mon,
+                                         HumanReadableText *(*handler)(Error **))
+{
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = handler(&err);
+
+    if (hmp_handle_error(mon, err)) {
+        return;
+    }
+
+    monitor_printf(mon, "%s", info->human_readable_text);
+}
+
+static void handle_hmp_command_exec(Monitor *mon,
+                                    const HMPCommand *cmd,
+                                    QDict *qdict)
+{
+    if (cmd->cmd_info_hrt) {
+        hmp_info_human_readable_text(mon,
+                                     cmd->cmd_info_hrt);
+    } else {
+        cmd->cmd(mon, qdict);
+    }
+}
+
 typedef struct HandleHmpCommandCo {
     Monitor *mon;
     const HMPCommand *cmd;
@@ -1071,7 +1096,7 @@ typedef struct HandleHmpCommandCo {
 static void handle_hmp_command_co(void *opaque)
 {
     HandleHmpCommandCo *data = opaque;
-    data->cmd->cmd(data->mon, data->qdict);
+    handle_hmp_command_exec(data->mon, data->cmd, data->qdict);
     monitor_set_cur(qemu_coroutine_self(), NULL);
     data->done = true;
 }
@@ -1089,7 +1114,7 @@ void handle_hmp_command(MonitorHMP *mon, const char *cmdline)
         return;
     }
 
-    if (!cmd->cmd) {
+    if (!cmd->cmd && !cmd->cmd_info_hrt) {
         /* FIXME: is it useful to try autoload modules here ??? */
         monitor_printf(&mon->common, "Command \"%.*s\" is not available.\n",
                        (int)(cmdline - cmd_start), cmd_start);
@@ -1109,7 +1134,7 @@ void handle_hmp_command(MonitorHMP *mon, const char *cmdline)
     if (!cmd->coroutine) {
         /* old_mon is non-NULL when called from qmp_human_monitor_command() */
         Monitor *old_mon = monitor_set_cur(qemu_coroutine_self(), &mon->common);
-        cmd->cmd(&mon->common, qdict);
+        handle_hmp_command_exec(&mon->common, cmd, qdict);
         monitor_set_cur(qemu_coroutine_self(), old_mon);
     } else {
         HandleHmpCommandCo data = {
diff --git a/monitor/misc.c b/monitor/misc.c
index ffe7966870..3cb5269356 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1963,7 +1963,7 @@ void monitor_register_hmp(const char *name, bool info,
 
     while (table->name != NULL) {
         if (strcmp(table->name, name) == 0) {
-            g_assert(table->cmd == NULL);
+            g_assert(table->cmd == NULL && table->cmd_info_hrt == NULL);
             table->cmd = cmd;
             return;
         }
@@ -1972,6 +1972,22 @@ void monitor_register_hmp(const char *name, bool info,
     g_assert_not_reached();
 }
 
+void monitor_register_hmp_info_hrt(const char *name,
+                                   HumanReadableText *(*handler)(Error **errp))
+{
+    HMPCommand *table = hmp_info_cmds;
+
+    while (table->name != NULL) {
+        if (strcmp(table->name, name) == 0) {
+            g_assert(table->cmd == NULL && table->cmd_info_hrt == NULL);
+            table->cmd_info_hrt = handler;
+            return;
+        }
+        table++;
+    }
+    g_assert_not_reached();
+}
+
 void monitor_init_globals(void)
 {
     monitor_init_globals_core();
diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index 9c3a09cb01..3da3f86c6a 100644
--- a/monitor/monitor-internal.h
+++ b/monitor/monitor-internal.h
@@ -74,6 +74,13 @@ typedef struct HMPCommand {
     const char *help;
     const char *flags; /* p=preconfig */
     void (*cmd)(Monitor *mon, const QDict *qdict);
+    /*
+     * If implementing a command that takes no arguments and simply
+     * prints formatted data, then leave @cmd NULL, and then set
+     * @cmd_info_hrt to the corresponding QMP handler that returns
+     * the formatted text.
+     */
+    HumanReadableText *(*cmd_info_hrt)(Error **errp);
     bool coroutine;
     /*
      * @sub_table is a list of 2nd level of commands. If it does not exist,
diff --git a/qapi/common.json b/qapi/common.json
index 7c976296f0..412cc4f5ae 100644
--- a/qapi/common.json
+++ b/qapi/common.json
@@ -197,3 +197,14 @@
 { 'enum': 'GrabToggleKeys',
   'data': [ 'ctrl-ctrl', 'alt-alt', 'shift-shift','meta-meta', 'scrolllock',
             'ctrl-scrolllock' ] }
+
+##
+# @HumanReadableText:
+#
+# @human-readable-text: Formatted output intended for humans.
+#
+# Since: 6.2
+#
+##
+{ 'struct': 'HumanReadableText',
+  'data': { 'human-readable-text': 'str' } }
diff --git a/qapi/meson.build b/qapi/meson.build
index c356a385e3..c0c49c15e4 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -10,6 +10,9 @@ util_ss.add(files(
   'string-input-visitor.c',
   'string-output-visitor.c',
 ))
+if have_system
+  util_ss.add(files('qapi-type-helpers.c'))
+endif
 if have_system or have_tools
   util_ss.add(files(
     'qmp-dispatch.c',
diff --git a/qapi/qapi-type-helpers.c b/qapi/qapi-type-helpers.c
new file mode 100644
index 0000000000..f76b34f647
--- /dev/null
+++ b/qapi/qapi-type-helpers.c
@@ -0,0 +1,23 @@
+/*
+ * QAPI common helper functions
+ *
+ * This file provides helper functions related to types defined
+ * in the QAPI schema.
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qapi/type-helpers.h"
+
+HumanReadableText *human_readable_text_from_str(GString *str)
+{
+    HumanReadableText *ret = g_new0(HumanReadableText, 1);
+
+    ret->human_readable_text = g_steal_pointer(&str->str);
+
+    return ret;
+}
-- 
2.31.1


