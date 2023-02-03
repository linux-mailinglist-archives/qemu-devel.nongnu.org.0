Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245666892B4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:51:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNrih-0000Sd-Fz; Fri, 03 Feb 2023 03:46:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNriD-00004v-8N
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNriA-0007kv-TZ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NoPXH7LCZk2apTmswH71YraVLS4OKjS42mcrvL7+FpY=;
 b=BxRaGKSfW7K82lTZEFHQ6wVlR2+VR70AvnRd+XsZW6DBa8yKG+/ZCxtJ+FioTjABGopl40
 k8DVryOCeviiFttVKbvezNoK17p/PIFTZbLYg5HeeXfFR1TMtdlY+/SzdYNlbsb4+aWsch
 4OlCdEabl47egl5BUpXwCIE/Fis/qp8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-jh0ADe-LMIalVUjSicCHqw-1; Fri, 03 Feb 2023 03:45:53 -0500
X-MC-Unique: jh0ADe-LMIalVUjSicCHqw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A99A738149B0;
 Fri,  3 Feb 2023 08:45:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 506492166B35;
 Fri,  3 Feb 2023 08:45:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BCD6021E6A25; Fri,  3 Feb 2023 09:45:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 06/35] char: Move HMP commands from monitor/ to chardev/
Date: Fri,  3 Feb 2023 09:45:20 +0100
Message-Id: <20230203084549.2622302-7-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

This moves these commands from MAINTAINERS sections "Human
Monitor (HMP)" and "QMP" to "Character device backends".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230124121946.1139465-4-armbru@redhat.com>
---
 chardev/char-hmp-cmds.c | 220 ++++++++++++++++++++++++++++++++++++++++
 monitor/hmp-cmds.c      | 123 ----------------------
 monitor/misc.c          |  78 --------------
 chardev/meson.build     |   6 +-
 4 files changed, 225 insertions(+), 202 deletions(-)
 create mode 100644 chardev/char-hmp-cmds.c

diff --git a/chardev/char-hmp-cmds.c b/chardev/char-hmp-cmds.c
new file mode 100644
index 0000000000..287c2b1bcd
--- /dev/null
+++ b/chardev/char-hmp-cmds.c
@@ -0,0 +1,220 @@
+/*
+ * HMP commands related to character devices
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
+#include "chardev/char.h"
+#include "monitor/hmp.h"
+#include "monitor/monitor.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-char.h"
+#include "qapi/qmp/qdict.h"
+#include "qemu/config-file.h"
+#include "qemu/option.h"
+
+void hmp_info_chardev(Monitor *mon, const QDict *qdict)
+{
+    ChardevInfoList *char_info, *info;
+
+    char_info = qmp_query_chardev(NULL);
+    for (info = char_info; info; info = info->next) {
+        monitor_printf(mon, "%s: filename=%s\n", info->value->label,
+                                                 info->value->filename);
+    }
+
+    qapi_free_ChardevInfoList(char_info);
+}
+
+void hmp_ringbuf_write(Monitor *mon, const QDict *qdict)
+{
+    const char *chardev = qdict_get_str(qdict, "device");
+    const char *data = qdict_get_str(qdict, "data");
+    Error *err = NULL;
+
+    qmp_ringbuf_write(chardev, data, false, 0, &err);
+
+    hmp_handle_error(mon, err);
+}
+
+void hmp_ringbuf_read(Monitor *mon, const QDict *qdict)
+{
+    uint32_t size = qdict_get_int(qdict, "size");
+    const char *chardev = qdict_get_str(qdict, "device");
+    char *data;
+    Error *err = NULL;
+    int i;
+
+    data = qmp_ringbuf_read(chardev, size, false, 0, &err);
+    if (hmp_handle_error(mon, err)) {
+        return;
+    }
+
+    for (i = 0; data[i]; i++) {
+        unsigned char ch = data[i];
+
+        if (ch == '\\') {
+            monitor_printf(mon, "\\\\");
+        } else if ((ch < 0x20 && ch != '\n' && ch != '\t') || ch == 0x7F) {
+            monitor_printf(mon, "\\u%04X", ch);
+        } else {
+            monitor_printf(mon, "%c", ch);
+        }
+
+    }
+    monitor_printf(mon, "\n");
+    g_free(data);
+}
+
+void hmp_chardev_add(Monitor *mon, const QDict *qdict)
+{
+    const char *args = qdict_get_str(qdict, "args");
+    Error *err = NULL;
+    QemuOpts *opts;
+
+    opts = qemu_opts_parse_noisily(qemu_find_opts("chardev"), args, true);
+    if (opts == NULL) {
+        error_setg(&err, "Parsing chardev args failed");
+    } else {
+        qemu_chr_new_from_opts(opts, NULL, &err);
+        qemu_opts_del(opts);
+    }
+    hmp_handle_error(mon, err);
+}
+
+void hmp_chardev_change(Monitor *mon, const QDict *qdict)
+{
+    const char *args = qdict_get_str(qdict, "args");
+    const char *id;
+    Error *err = NULL;
+    ChardevBackend *backend = NULL;
+    ChardevReturn *ret = NULL;
+    QemuOpts *opts = qemu_opts_parse_noisily(qemu_find_opts("chardev"), args,
+                                             true);
+    if (!opts) {
+        error_setg(&err, "Parsing chardev args failed");
+        goto end;
+    }
+
+    id = qdict_get_str(qdict, "id");
+    if (qemu_opts_id(opts)) {
+        error_setg(&err, "Unexpected 'id' parameter");
+        goto end;
+    }
+
+    backend = qemu_chr_parse_opts(opts, &err);
+    if (!backend) {
+        goto end;
+    }
+
+    ret = qmp_chardev_change(id, backend, &err);
+
+end:
+    qapi_free_ChardevReturn(ret);
+    qapi_free_ChardevBackend(backend);
+    qemu_opts_del(opts);
+    hmp_handle_error(mon, err);
+}
+
+void hmp_chardev_remove(Monitor *mon, const QDict *qdict)
+{
+    Error *local_err = NULL;
+
+    qmp_chardev_remove(qdict_get_str(qdict, "id"), &local_err);
+    hmp_handle_error(mon, local_err);
+}
+
+void hmp_chardev_send_break(Monitor *mon, const QDict *qdict)
+{
+    Error *local_err = NULL;
+
+    qmp_chardev_send_break(qdict_get_str(qdict, "id"), &local_err);
+    hmp_handle_error(mon, local_err);
+}
+
+void chardev_add_completion(ReadLineState *rs, int nb_args, const char *str)
+{
+    size_t len;
+    ChardevBackendInfoList *list, *start;
+
+    if (nb_args != 2) {
+        return;
+    }
+    len = strlen(str);
+    readline_set_completion_index(rs, len);
+
+    start = list = qmp_query_chardev_backends(NULL);
+    while (list) {
+        const char *chr_name = list->value->name;
+
+        if (!strncmp(chr_name, str, len)) {
+            readline_add_completion(rs, chr_name);
+        }
+        list = list->next;
+    }
+    qapi_free_ChardevBackendInfoList(start);
+}
+
+void chardev_remove_completion(ReadLineState *rs, int nb_args, const char *str)
+{
+    size_t len;
+    ChardevInfoList *list, *start;
+
+    if (nb_args != 2) {
+        return;
+    }
+    len = strlen(str);
+    readline_set_completion_index(rs, len);
+
+    start = list = qmp_query_chardev(NULL);
+    while (list) {
+        ChardevInfo *chr = list->value;
+
+        if (!strncmp(chr->label, str, len)) {
+            readline_add_completion(rs, chr->label);
+        }
+        list = list->next;
+    }
+    qapi_free_ChardevInfoList(start);
+}
+
+static void ringbuf_completion(ReadLineState *rs, const char *str)
+{
+    size_t len;
+    ChardevInfoList *list, *start;
+
+    len = strlen(str);
+    readline_set_completion_index(rs, len);
+
+    start = list = qmp_query_chardev(NULL);
+    while (list) {
+        ChardevInfo *chr_info = list->value;
+
+        if (!strncmp(chr_info->label, str, len)) {
+            Chardev *chr = qemu_chr_find(chr_info->label);
+            if (chr && CHARDEV_IS_RINGBUF(chr)) {
+                readline_add_completion(rs, chr_info->label);
+            }
+        }
+        list = list->next;
+    }
+    qapi_free_ChardevInfoList(start);
+}
+
+void ringbuf_write_completion(ReadLineState *rs, int nb_args, const char *str)
+{
+    if (nb_args != 2) {
+        return;
+    }
+    ringbuf_completion(rs, str);
+}
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index de1a96d48c..c8ed59c281 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -17,10 +17,7 @@
 #include "monitor/hmp.h"
 #include "net/net.h"
 #include "net/eth.h"
-#include "chardev/char.h"
 #include "sysemu/runstate.h"
-#include "qemu/config-file.h"
-#include "qemu/option.h"
 #include "qemu/sockets.h"
 #include "qemu/help_option.h"
 #include "monitor/monitor.h"
@@ -28,7 +25,6 @@
 #include "qapi/clone-visitor.h"
 #include "qapi/qapi-builtin-visit.h"
 #include "qapi/qapi-commands-block.h"
-#include "qapi/qapi-commands-char.h"
 #include "qapi/qapi-commands-control.h"
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-migration.h"
@@ -155,19 +151,6 @@ void hmp_info_uuid(Monitor *mon, const QDict *qdict)
     qapi_free_UuidInfo(info);
 }
 
-void hmp_info_chardev(Monitor *mon, const QDict *qdict)
-{
-    ChardevInfoList *char_info, *info;
-
-    char_info = qmp_query_chardev(NULL);
-    for (info = char_info; info; info = info->next) {
-        monitor_printf(mon, "%s: filename=%s\n", info->value->label,
-                                                 info->value->filename);
-    }
-
-    qapi_free_ChardevInfoList(char_info);
-}
-
 void hmp_info_migrate(Monitor *mon, const QDict *qdict)
 {
     MigrationInfo *info;
@@ -673,46 +656,6 @@ void hmp_pmemsave(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
-void hmp_ringbuf_write(Monitor *mon, const QDict *qdict)
-{
-    const char *chardev = qdict_get_str(qdict, "device");
-    const char *data = qdict_get_str(qdict, "data");
-    Error *err = NULL;
-
-    qmp_ringbuf_write(chardev, data, false, 0, &err);
-
-    hmp_handle_error(mon, err);
-}
-
-void hmp_ringbuf_read(Monitor *mon, const QDict *qdict)
-{
-    uint32_t size = qdict_get_int(qdict, "size");
-    const char *chardev = qdict_get_str(qdict, "device");
-    char *data;
-    Error *err = NULL;
-    int i;
-
-    data = qmp_ringbuf_read(chardev, size, false, 0, &err);
-    if (hmp_handle_error(mon, err)) {
-        return;
-    }
-
-    for (i = 0; data[i]; i++) {
-        unsigned char ch = data[i];
-
-        if (ch == '\\') {
-            monitor_printf(mon, "\\\\");
-        } else if ((ch < 0x20 && ch != '\n' && ch != '\t') || ch == 0x7F) {
-            monitor_printf(mon, "\\u%04X", ch);
-        } else {
-            monitor_printf(mon, "%c", ch);
-        }
-
-    }
-    monitor_printf(mon, "\n");
-    g_free(data);
-}
-
 void hmp_cont(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
@@ -1241,72 +1184,6 @@ void hmp_closefd(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
-void hmp_chardev_add(Monitor *mon, const QDict *qdict)
-{
-    const char *args = qdict_get_str(qdict, "args");
-    Error *err = NULL;
-    QemuOpts *opts;
-
-    opts = qemu_opts_parse_noisily(qemu_find_opts("chardev"), args, true);
-    if (opts == NULL) {
-        error_setg(&err, "Parsing chardev args failed");
-    } else {
-        qemu_chr_new_from_opts(opts, NULL, &err);
-        qemu_opts_del(opts);
-    }
-    hmp_handle_error(mon, err);
-}
-
-void hmp_chardev_change(Monitor *mon, const QDict *qdict)
-{
-    const char *args = qdict_get_str(qdict, "args");
-    const char *id;
-    Error *err = NULL;
-    ChardevBackend *backend = NULL;
-    ChardevReturn *ret = NULL;
-    QemuOpts *opts = qemu_opts_parse_noisily(qemu_find_opts("chardev"), args,
-                                             true);
-    if (!opts) {
-        error_setg(&err, "Parsing chardev args failed");
-        goto end;
-    }
-
-    id = qdict_get_str(qdict, "id");
-    if (qemu_opts_id(opts)) {
-        error_setg(&err, "Unexpected 'id' parameter");
-        goto end;
-    }
-
-    backend = qemu_chr_parse_opts(opts, &err);
-    if (!backend) {
-        goto end;
-    }
-
-    ret = qmp_chardev_change(id, backend, &err);
-
-end:
-    qapi_free_ChardevReturn(ret);
-    qapi_free_ChardevBackend(backend);
-    qemu_opts_del(opts);
-    hmp_handle_error(mon, err);
-}
-
-void hmp_chardev_remove(Monitor *mon, const QDict *qdict)
-{
-    Error *local_err = NULL;
-
-    qmp_chardev_remove(qdict_get_str(qdict, "id"), &local_err);
-    hmp_handle_error(mon, local_err);
-}
-
-void hmp_chardev_send_break(Monitor *mon, const QDict *qdict)
-{
-    Error *local_err = NULL;
-
-    qmp_chardev_send_break(qdict_get_str(qdict, "id"), &local_err);
-    hmp_handle_error(mon, local_err);
-}
-
 void hmp_object_del(Monitor *mon, const QDict *qdict)
 {
     const char *id = qdict_get_str(qdict, "id");
diff --git a/monitor/misc.c b/monitor/misc.c
index 80d5527774..c18a713d9c 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -49,7 +49,6 @@
 #include "exec/ioport.h"
 #include "block/qapi.h"
 #include "block/block-hmp-cmds.h"
-#include "qapi/qapi-commands-char.h"
 #include "qapi/qapi-commands-control.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
@@ -1362,29 +1361,6 @@ static void add_completion_option(ReadLineState *rs, const char *str,
     }
 }
 
-void chardev_add_completion(ReadLineState *rs, int nb_args, const char *str)
-{
-    size_t len;
-    ChardevBackendInfoList *list, *start;
-
-    if (nb_args != 2) {
-        return;
-    }
-    len = strlen(str);
-    readline_set_completion_index(rs, len);
-
-    start = list = qmp_query_chardev_backends(NULL);
-    while (list) {
-        const char *chr_name = list->value->name;
-
-        if (!strncmp(chr_name, str, len)) {
-            readline_add_completion(rs, chr_name);
-        }
-        list = list->next;
-    }
-    qapi_free_ChardevBackendInfoList(start);
-}
-
 void netdev_add_completion(ReadLineState *rs, int nb_args, const char *str)
 {
     size_t len;
@@ -1498,60 +1474,6 @@ static void peripheral_device_del_completion(ReadLineState *rs,
     g_slist_free(list);
 }
 
-void chardev_remove_completion(ReadLineState *rs, int nb_args, const char *str)
-{
-    size_t len;
-    ChardevInfoList *list, *start;
-
-    if (nb_args != 2) {
-        return;
-    }
-    len = strlen(str);
-    readline_set_completion_index(rs, len);
-
-    start = list = qmp_query_chardev(NULL);
-    while (list) {
-        ChardevInfo *chr = list->value;
-
-        if (!strncmp(chr->label, str, len)) {
-            readline_add_completion(rs, chr->label);
-        }
-        list = list->next;
-    }
-    qapi_free_ChardevInfoList(start);
-}
-
-static void ringbuf_completion(ReadLineState *rs, const char *str)
-{
-    size_t len;
-    ChardevInfoList *list, *start;
-
-    len = strlen(str);
-    readline_set_completion_index(rs, len);
-
-    start = list = qmp_query_chardev(NULL);
-    while (list) {
-        ChardevInfo *chr_info = list->value;
-
-        if (!strncmp(chr_info->label, str, len)) {
-            Chardev *chr = qemu_chr_find(chr_info->label);
-            if (chr && CHARDEV_IS_RINGBUF(chr)) {
-                readline_add_completion(rs, chr_info->label);
-            }
-        }
-        list = list->next;
-    }
-    qapi_free_ChardevInfoList(start);
-}
-
-void ringbuf_write_completion(ReadLineState *rs, int nb_args, const char *str)
-{
-    if (nb_args != 2) {
-        return;
-    }
-    ringbuf_completion(rs, str);
-}
-
 void device_del_completion(ReadLineState *rs, int nb_args, const char *str)
 {
     size_t len;
diff --git a/chardev/meson.build b/chardev/meson.build
index 789b50056a..7a3ba777ab 100644
--- a/chardev/meson.build
+++ b/chardev/meson.build
@@ -28,7 +28,11 @@ chardev_ss.add(when: 'CONFIG_WIN32', if_true: files(
 
 chardev_ss = chardev_ss.apply(config_host, strict: false)
 
-softmmu_ss.add(files('msmouse.c', 'wctablet.c', 'testdev.c'))
+softmmu_ss.add(files(
+    'char-hmp-cmds.c',
+    'msmouse.c',
+    'wctablet.c',
+    'testdev.c'))
 
 chardev_modules = {}
 
-- 
2.39.0


