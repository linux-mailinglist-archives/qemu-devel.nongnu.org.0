Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374B5640439
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 11:11:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p12vX-0003hR-PJ; Fri, 02 Dec 2022 05:05:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p12vR-0003d8-9k
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:05:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p12vO-0002Pa-BQ
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669975541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sQxaGbzAjNQr/SDqv7yoIcK82mIxqAE2BV4YlG5gKOY=;
 b=Gi9FjEjwJQQraEvox2qJryLrY/OF57rMMrd806InDaNwJ6M9vQwfbxTcrGt5+7kCFfkLgz
 cj2UNW4kL88I6dMJRoHyi+pkCJrwuNDGvOtwipJS9WzTdG6H+5CDWnSk+xR3hxzjERBJpM
 bo1H0bqRqqEGQgtg7TrJXliAHDIVWxM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-N02d3SoDPVqYDWqPRlgBNA-1; Fri, 02 Dec 2022 05:05:40 -0500
X-MC-Unique: N02d3SoDPVqYDWqPRlgBNA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53CE486F14F;
 Fri,  2 Dec 2022 10:05:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65E44111E3FA;
 Fri,  2 Dec 2022 10:05:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 07B2921E65CB; Fri,  2 Dec 2022 11:05:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Subject: [PATCH v2 11/14] ui: Move HMP commands from monitor to new
 ui/ui-hmp-cmds.c
Date: Fri,  2 Dec 2022 11:05:09 +0100
Message-Id: <20221202100512.4161901-12-armbru@redhat.com>
In-Reply-To: <20221202100512.4161901-1-armbru@redhat.com>
References: <20221202100512.4161901-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Monitor (HMP)" to "Graphics".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 monitor/hmp-cmds.c | 343 ------------------------------------------
 ui/ui-hmp-cmds.c   | 361 +++++++++++++++++++++++++++++++++++++++++++++
 ui/meson.build     |   1 +
 3 files changed, 362 insertions(+), 343 deletions(-)
 create mode 100644 ui/ui-hmp-cmds.c

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 86dde966ff..f0f7b74fb3 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -52,7 +52,6 @@
 #include "qapi/string-input-visitor.h"
 #include "qapi/string-output-visitor.h"
 #include "qom/object_interfaces.h"
-#include "ui/console.h"
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "hw/core/cpu.h"
@@ -60,10 +59,6 @@
 #include "migration/snapshot.h"
 #include "migration/misc.h"
 
-#ifdef CONFIG_SPICE
-#include <spice/enums.h>
-#endif
-
 bool hmp_handle_error(Monitor *mon, Error *err)
 {
     if (err) {
@@ -179,26 +174,6 @@ void hmp_info_chardev(Monitor *mon, const QDict *qdict)
     qapi_free_ChardevInfoList(char_info);
 }
 
-void hmp_info_mice(Monitor *mon, const QDict *qdict)
-{
-    MouseInfoList *mice_list, *mouse;
-
-    mice_list = qmp_query_mice(NULL);
-    if (!mice_list) {
-        monitor_printf(mon, "No mouse devices connected\n");
-        return;
-    }
-
-    for (mouse = mice_list; mouse; mouse = mouse->next) {
-        monitor_printf(mon, "%c Mouse #%" PRId64 ": %s%s\n",
-                       mouse->value->current ? '*' : ' ',
-                       mouse->value->index, mouse->value->name,
-                       mouse->value->absolute ? " (absolute)" : "");
-    }
-
-    qapi_free_MouseInfoList(mice_list);
-}
-
 void hmp_info_migrate(Monitor *mon, const QDict *qdict)
 {
     MigrationInfo *info;
@@ -518,170 +493,6 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
     qapi_free_MigrationParameters(params);
 }
 
-
-#ifdef CONFIG_VNC
-/* Helper for hmp_info_vnc_clients, _servers */
-static void hmp_info_VncBasicInfo(Monitor *mon, VncBasicInfo *info,
-                                  const char *name)
-{
-    monitor_printf(mon, "  %s: %s:%s (%s%s)\n",
-                   name,
-                   info->host,
-                   info->service,
-                   NetworkAddressFamily_str(info->family),
-                   info->websocket ? " (Websocket)" : "");
-}
-
-/* Helper displaying and auth and crypt info */
-static void hmp_info_vnc_authcrypt(Monitor *mon, const char *indent,
-                                   VncPrimaryAuth auth,
-                                   VncVencryptSubAuth *vencrypt)
-{
-    monitor_printf(mon, "%sAuth: %s (Sub: %s)\n", indent,
-                   VncPrimaryAuth_str(auth),
-                   vencrypt ? VncVencryptSubAuth_str(*vencrypt) : "none");
-}
-
-static void hmp_info_vnc_clients(Monitor *mon, VncClientInfoList *client)
-{
-    while (client) {
-        VncClientInfo *cinfo = client->value;
-
-        hmp_info_VncBasicInfo(mon, qapi_VncClientInfo_base(cinfo), "Client");
-        monitor_printf(mon, "    x509_dname: %s\n",
-                       cinfo->has_x509_dname ?
-                       cinfo->x509_dname : "none");
-        monitor_printf(mon, "    sasl_username: %s\n",
-                       cinfo->has_sasl_username ?
-                       cinfo->sasl_username : "none");
-
-        client = client->next;
-    }
-}
-
-static void hmp_info_vnc_servers(Monitor *mon, VncServerInfo2List *server)
-{
-    while (server) {
-        VncServerInfo2 *sinfo = server->value;
-        hmp_info_VncBasicInfo(mon, qapi_VncServerInfo2_base(sinfo), "Server");
-        hmp_info_vnc_authcrypt(mon, "    ", sinfo->auth,
-                               sinfo->has_vencrypt ? &sinfo->vencrypt : NULL);
-        server = server->next;
-    }
-}
-
-void hmp_info_vnc(Monitor *mon, const QDict *qdict)
-{
-    VncInfo2List *info2l, *info2l_head;
-    Error *err = NULL;
-
-    info2l = qmp_query_vnc_servers(&err);
-    info2l_head = info2l;
-    if (hmp_handle_error(mon, err)) {
-        return;
-    }
-    if (!info2l) {
-        monitor_printf(mon, "None\n");
-        return;
-    }
-
-    while (info2l) {
-        VncInfo2 *info = info2l->value;
-        monitor_printf(mon, "%s:\n", info->id);
-        hmp_info_vnc_servers(mon, info->server);
-        hmp_info_vnc_clients(mon, info->clients);
-        if (!info->server) {
-            /*
-             * The server entry displays its auth, we only need to
-             * display in the case of 'reverse' connections where
-             * there's no server.
-             */
-            hmp_info_vnc_authcrypt(mon, "  ", info->auth,
-                               info->has_vencrypt ? &info->vencrypt : NULL);
-        }
-        if (info->has_display) {
-            monitor_printf(mon, "  Display: %s\n", info->display);
-        }
-        info2l = info2l->next;
-    }
-
-    qapi_free_VncInfo2List(info2l_head);
-
-}
-#endif
-
-#ifdef CONFIG_SPICE
-void hmp_info_spice(Monitor *mon, const QDict *qdict)
-{
-    SpiceChannelList *chan;
-    SpiceInfo *info;
-    const char *channel_name;
-    static const char *const channel_names[] = {
-        [SPICE_CHANNEL_MAIN] = "main",
-        [SPICE_CHANNEL_DISPLAY] = "display",
-        [SPICE_CHANNEL_INPUTS] = "inputs",
-        [SPICE_CHANNEL_CURSOR] = "cursor",
-        [SPICE_CHANNEL_PLAYBACK] = "playback",
-        [SPICE_CHANNEL_RECORD] = "record",
-        [SPICE_CHANNEL_TUNNEL] = "tunnel",
-        [SPICE_CHANNEL_SMARTCARD] = "smartcard",
-        [SPICE_CHANNEL_USBREDIR] = "usbredir",
-        [SPICE_CHANNEL_PORT] = "port",
-        [SPICE_CHANNEL_WEBDAV] = "webdav",
-    };
-
-    info = qmp_query_spice(NULL);
-
-    if (!info->enabled) {
-        monitor_printf(mon, "Server: disabled\n");
-        goto out;
-    }
-
-    monitor_printf(mon, "Server:\n");
-    if (info->has_port) {
-        monitor_printf(mon, "     address: %s:%" PRId64 "\n",
-                       info->host, info->port);
-    }
-    if (info->has_tls_port) {
-        monitor_printf(mon, "     address: %s:%" PRId64 " [tls]\n",
-                       info->host, info->tls_port);
-    }
-    monitor_printf(mon, "    migrated: %s\n",
-                   info->migrated ? "true" : "false");
-    monitor_printf(mon, "        auth: %s\n", info->auth);
-    monitor_printf(mon, "    compiled: %s\n", info->compiled_version);
-    monitor_printf(mon, "  mouse-mode: %s\n",
-                   SpiceQueryMouseMode_str(info->mouse_mode));
-
-    if (!info->has_channels || info->channels == NULL) {
-        monitor_printf(mon, "Channels: none\n");
-    } else {
-        for (chan = info->channels; chan; chan = chan->next) {
-            monitor_printf(mon, "Channel:\n");
-            monitor_printf(mon, "     address: %s:%s%s\n",
-                           chan->value->host, chan->value->port,
-                           chan->value->tls ? " [tls]" : "");
-            monitor_printf(mon, "     session: %" PRId64 "\n",
-                           chan->value->connection_id);
-            monitor_printf(mon, "     channel: %" PRId64 ":%" PRId64 "\n",
-                           chan->value->channel_type, chan->value->channel_id);
-
-            channel_name = "unknown";
-            if (chan->value->channel_type > 0 &&
-                chan->value->channel_type < ARRAY_SIZE(channel_names) &&
-                channel_names[chan->value->channel_type]) {
-                channel_name = channel_names[chan->value->channel_type];
-            }
-
-            monitor_printf(mon, "     channel name: %s\n", channel_name);
-        }
-    }
-
-out:
-    qapi_free_SpiceInfo(info);
-}
-#endif
-
 void hmp_info_balloon(Monitor *mon, const QDict *qdict)
 {
     BalloonInfo *info;
@@ -1376,71 +1187,6 @@ void hmp_x_colo_lost_heartbeat(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
-void hmp_set_password(Monitor *mon, const QDict *qdict)
-{
-    const char *protocol  = qdict_get_str(qdict, "protocol");
-    const char *password  = qdict_get_str(qdict, "password");
-    const char *display = qdict_get_try_str(qdict, "display");
-    const char *connected = qdict_get_try_str(qdict, "connected");
-    Error *err = NULL;
-
-    SetPasswordOptions opts = {
-        .password = (char *)password,
-        .has_connected = !!connected,
-    };
-
-    opts.connected = qapi_enum_parse(&SetPasswordAction_lookup, connected,
-                                     SET_PASSWORD_ACTION_KEEP, &err);
-    if (err) {
-        goto out;
-    }
-
-    opts.protocol = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
-                                    DISPLAY_PROTOCOL_VNC, &err);
-    if (err) {
-        goto out;
-    }
-
-    if (opts.protocol == DISPLAY_PROTOCOL_VNC) {
-        opts.u.vnc.has_display = !!display;
-        opts.u.vnc.display = (char *)display;
-    }
-
-    qmp_set_password(&opts, &err);
-
-out:
-    hmp_handle_error(mon, err);
-}
-
-void hmp_expire_password(Monitor *mon, const QDict *qdict)
-{
-    const char *protocol  = qdict_get_str(qdict, "protocol");
-    const char *whenstr = qdict_get_str(qdict, "time");
-    const char *display = qdict_get_try_str(qdict, "display");
-    Error *err = NULL;
-
-    ExpirePasswordOptions opts = {
-        .time = (char *)whenstr,
-    };
-
-    opts.protocol = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
-                                    DISPLAY_PROTOCOL_VNC, &err);
-    if (err) {
-        goto out;
-    }
-
-    if (opts.protocol == DISPLAY_PROTOCOL_VNC) {
-        opts.u.vnc.has_display = !!display;
-        opts.u.vnc.display = (char *)display;
-    }
-
-    qmp_expire_password(&opts, &err);
-
-out:
-    hmp_handle_error(mon, err);
-}
-
-
 #ifdef CONFIG_VNC
 static void hmp_change_read_arg(void *opaque, const char *password,
                                 void *readline_opaque)
@@ -1638,95 +1384,6 @@ void hmp_closefd(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
-void hmp_sendkey(Monitor *mon, const QDict *qdict)
-{
-    const char *keys = qdict_get_str(qdict, "keys");
-    KeyValue *v = NULL;
-    KeyValueList *head = NULL, **tail = &head;
-    int has_hold_time = qdict_haskey(qdict, "hold-time");
-    int hold_time = qdict_get_try_int(qdict, "hold-time", -1);
-    Error *err = NULL;
-    const char *separator;
-    int keyname_len;
-
-    while (1) {
-        separator = qemu_strchrnul(keys, '-');
-        keyname_len = separator - keys;
-
-        /* Be compatible with old interface, convert user inputted "<" */
-        if (keys[0] == '<' && keyname_len == 1) {
-            keys = "less";
-            keyname_len = 4;
-        }
-
-        v = g_malloc0(sizeof(*v));
-
-        if (strstart(keys, "0x", NULL)) {
-            const char *endp;
-            unsigned long value;
-
-            if (qemu_strtoul(keys, &endp, 0, &value) < 0
-                || value >= INT_MAX) {
-                goto err_out;
-            }
-            assert(endp <= keys + keyname_len);
-            if (endp != keys + keyname_len) {
-                goto err_out;
-            }
-            v->type = KEY_VALUE_KIND_NUMBER;
-            v->u.number.data = value;
-        } else {
-            int idx = index_from_key(keys, keyname_len);
-            if (idx == Q_KEY_CODE__MAX) {
-                goto err_out;
-            }
-            v->type = KEY_VALUE_KIND_QCODE;
-            v->u.qcode.data = idx;
-        }
-        QAPI_LIST_APPEND(tail, v);
-        v = NULL;
-
-        if (!*separator) {
-            break;
-        }
-        keys = separator + 1;
-    }
-
-    qmp_send_key(head, has_hold_time, hold_time, &err);
-    hmp_handle_error(mon, err);
-
-out:
-    qapi_free_KeyValue(v);
-    qapi_free_KeyValueList(head);
-    return;
-
-err_out:
-    monitor_printf(mon, "invalid parameter: %.*s\n", keyname_len, keys);
-    goto out;
-}
-
-void coroutine_fn
-hmp_screendump(Monitor *mon, const QDict *qdict)
-{
-    const char *filename = qdict_get_str(qdict, "filename");
-    const char *id = qdict_get_try_str(qdict, "device");
-    int64_t head = qdict_get_try_int(qdict, "head", 0);
-    const char *input_format  = qdict_get_try_str(qdict, "format");
-    Error *err = NULL;
-    ImageFormat format;
-
-    format = qapi_enum_parse(&ImageFormat_lookup, input_format,
-                              IMAGE_FORMAT_PPM, &err);
-    if (err) {
-        goto end;
-    }
-
-    qmp_screendump(filename, id != NULL, id, id != NULL, head,
-                   input_format != NULL, format, &err);
-end:
-    hmp_handle_error(mon, err);
-}
-
 void hmp_chardev_add(Monitor *mon, const QDict *qdict)
 {
     const char *args = qdict_get_str(qdict, "args");
diff --git a/ui/ui-hmp-cmds.c b/ui/ui-hmp-cmds.c
new file mode 100644
index 0000000000..c26a1f00d0
--- /dev/null
+++ b/ui/ui-hmp-cmds.c
@@ -0,0 +1,361 @@
+/*
+ * Human Monitor Interface commands
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
+#ifdef CONFIG_SPICE
+#include <spice/enums.h>
+#endif
+#include "monitor/hmp.h"
+#include "monitor/monitor.h"
+#include "qapi/qapi-commands-ui.h"
+#include "qapi/qmp/qdict.h"
+#include "qemu/cutils.h"
+#include "ui/console.h"
+
+void hmp_info_mice(Monitor *mon, const QDict *qdict)
+{
+    MouseInfoList *mice_list, *mouse;
+
+    mice_list = qmp_query_mice(NULL);
+    if (!mice_list) {
+        monitor_printf(mon, "No mouse devices connected\n");
+        return;
+    }
+
+    for (mouse = mice_list; mouse; mouse = mouse->next) {
+        monitor_printf(mon, "%c Mouse #%" PRId64 ": %s%s\n",
+                       mouse->value->current ? '*' : ' ',
+                       mouse->value->index, mouse->value->name,
+                       mouse->value->absolute ? " (absolute)" : "");
+    }
+
+    qapi_free_MouseInfoList(mice_list);
+}
+
+#ifdef CONFIG_VNC
+/* Helper for hmp_info_vnc_clients, _servers */
+static void hmp_info_VncBasicInfo(Monitor *mon, VncBasicInfo *info,
+                                  const char *name)
+{
+    monitor_printf(mon, "  %s: %s:%s (%s%s)\n",
+                   name,
+                   info->host,
+                   info->service,
+                   NetworkAddressFamily_str(info->family),
+                   info->websocket ? " (Websocket)" : "");
+}
+
+/* Helper displaying and auth and crypt info */
+static void hmp_info_vnc_authcrypt(Monitor *mon, const char *indent,
+                                   VncPrimaryAuth auth,
+                                   VncVencryptSubAuth *vencrypt)
+{
+    monitor_printf(mon, "%sAuth: %s (Sub: %s)\n", indent,
+                   VncPrimaryAuth_str(auth),
+                   vencrypt ? VncVencryptSubAuth_str(*vencrypt) : "none");
+}
+
+static void hmp_info_vnc_clients(Monitor *mon, VncClientInfoList *client)
+{
+    while (client) {
+        VncClientInfo *cinfo = client->value;
+
+        hmp_info_VncBasicInfo(mon, qapi_VncClientInfo_base(cinfo), "Client");
+        monitor_printf(mon, "    x509_dname: %s\n",
+                       cinfo->has_x509_dname ?
+                       cinfo->x509_dname : "none");
+        monitor_printf(mon, "    sasl_username: %s\n",
+                       cinfo->has_sasl_username ?
+                       cinfo->sasl_username : "none");
+
+        client = client->next;
+    }
+}
+
+static void hmp_info_vnc_servers(Monitor *mon, VncServerInfo2List *server)
+{
+    while (server) {
+        VncServerInfo2 *sinfo = server->value;
+        hmp_info_VncBasicInfo(mon, qapi_VncServerInfo2_base(sinfo), "Server");
+        hmp_info_vnc_authcrypt(mon, "    ", sinfo->auth,
+                               sinfo->has_vencrypt ? &sinfo->vencrypt : NULL);
+        server = server->next;
+    }
+}
+
+void hmp_info_vnc(Monitor *mon, const QDict *qdict)
+{
+    VncInfo2List *info2l, *info2l_head;
+    Error *err = NULL;
+
+    info2l = qmp_query_vnc_servers(&err);
+    info2l_head = info2l;
+    if (hmp_handle_error(mon, err)) {
+        return;
+    }
+    if (!info2l) {
+        monitor_printf(mon, "None\n");
+        return;
+    }
+
+    while (info2l) {
+        VncInfo2 *info = info2l->value;
+        monitor_printf(mon, "%s:\n", info->id);
+        hmp_info_vnc_servers(mon, info->server);
+        hmp_info_vnc_clients(mon, info->clients);
+        if (!info->server) {
+            /*
+             * The server entry displays its auth, we only need to
+             * display in the case of 'reverse' connections where
+             * there's no server.
+             */
+            hmp_info_vnc_authcrypt(mon, "  ", info->auth,
+                               info->has_vencrypt ? &info->vencrypt : NULL);
+        }
+        if (info->has_display) {
+            monitor_printf(mon, "  Display: %s\n", info->display);
+        }
+        info2l = info2l->next;
+    }
+
+    qapi_free_VncInfo2List(info2l_head);
+
+}
+#endif
+
+#ifdef CONFIG_SPICE
+void hmp_info_spice(Monitor *mon, const QDict *qdict)
+{
+    SpiceChannelList *chan;
+    SpiceInfo *info;
+    const char *channel_name;
+    static const char *const channel_names[] = {
+        [SPICE_CHANNEL_MAIN] = "main",
+        [SPICE_CHANNEL_DISPLAY] = "display",
+        [SPICE_CHANNEL_INPUTS] = "inputs",
+        [SPICE_CHANNEL_CURSOR] = "cursor",
+        [SPICE_CHANNEL_PLAYBACK] = "playback",
+        [SPICE_CHANNEL_RECORD] = "record",
+        [SPICE_CHANNEL_TUNNEL] = "tunnel",
+        [SPICE_CHANNEL_SMARTCARD] = "smartcard",
+        [SPICE_CHANNEL_USBREDIR] = "usbredir",
+        [SPICE_CHANNEL_PORT] = "port",
+        [SPICE_CHANNEL_WEBDAV] = "webdav",
+    };
+
+    info = qmp_query_spice(NULL);
+
+    if (!info->enabled) {
+        monitor_printf(mon, "Server: disabled\n");
+        goto out;
+    }
+
+    monitor_printf(mon, "Server:\n");
+    if (info->has_port) {
+        monitor_printf(mon, "     address: %s:%" PRId64 "\n",
+                       info->host, info->port);
+    }
+    if (info->has_tls_port) {
+        monitor_printf(mon, "     address: %s:%" PRId64 " [tls]\n",
+                       info->host, info->tls_port);
+    }
+    monitor_printf(mon, "    migrated: %s\n",
+                   info->migrated ? "true" : "false");
+    monitor_printf(mon, "        auth: %s\n", info->auth);
+    monitor_printf(mon, "    compiled: %s\n", info->compiled_version);
+    monitor_printf(mon, "  mouse-mode: %s\n",
+                   SpiceQueryMouseMode_str(info->mouse_mode));
+
+    if (!info->has_channels || info->channels == NULL) {
+        monitor_printf(mon, "Channels: none\n");
+    } else {
+        for (chan = info->channels; chan; chan = chan->next) {
+            monitor_printf(mon, "Channel:\n");
+            monitor_printf(mon, "     address: %s:%s%s\n",
+                           chan->value->host, chan->value->port,
+                           chan->value->tls ? " [tls]" : "");
+            monitor_printf(mon, "     session: %" PRId64 "\n",
+                           chan->value->connection_id);
+            monitor_printf(mon, "     channel: %" PRId64 ":%" PRId64 "\n",
+                           chan->value->channel_type, chan->value->channel_id);
+
+            channel_name = "unknown";
+            if (chan->value->channel_type > 0 &&
+                chan->value->channel_type < ARRAY_SIZE(channel_names) &&
+                channel_names[chan->value->channel_type]) {
+                channel_name = channel_names[chan->value->channel_type];
+            }
+
+            monitor_printf(mon, "     channel name: %s\n", channel_name);
+        }
+    }
+
+out:
+    qapi_free_SpiceInfo(info);
+}
+#endif
+
+void hmp_set_password(Monitor *mon, const QDict *qdict)
+{
+    const char *protocol  = qdict_get_str(qdict, "protocol");
+    const char *password  = qdict_get_str(qdict, "password");
+    const char *display = qdict_get_try_str(qdict, "display");
+    const char *connected = qdict_get_try_str(qdict, "connected");
+    Error *err = NULL;
+
+    SetPasswordOptions opts = {
+        .password = (char *)password,
+        .has_connected = !!connected,
+    };
+
+    opts.connected = qapi_enum_parse(&SetPasswordAction_lookup, connected,
+                                     SET_PASSWORD_ACTION_KEEP, &err);
+    if (err) {
+        goto out;
+    }
+
+    opts.protocol = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
+                                    DISPLAY_PROTOCOL_VNC, &err);
+    if (err) {
+        goto out;
+    }
+
+    if (opts.protocol == DISPLAY_PROTOCOL_VNC) {
+        opts.u.vnc.has_display = !!display;
+        opts.u.vnc.display = (char *)display;
+    }
+
+    qmp_set_password(&opts, &err);
+
+out:
+    hmp_handle_error(mon, err);
+}
+
+void hmp_expire_password(Monitor *mon, const QDict *qdict)
+{
+    const char *protocol  = qdict_get_str(qdict, "protocol");
+    const char *whenstr = qdict_get_str(qdict, "time");
+    const char *display = qdict_get_try_str(qdict, "display");
+    Error *err = NULL;
+
+    ExpirePasswordOptions opts = {
+        .time = (char *)whenstr,
+    };
+
+    opts.protocol = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
+                                    DISPLAY_PROTOCOL_VNC, &err);
+    if (err) {
+        goto out;
+    }
+
+    if (opts.protocol == DISPLAY_PROTOCOL_VNC) {
+        opts.u.vnc.has_display = !!display;
+        opts.u.vnc.display = (char *)display;
+    }
+
+    qmp_expire_password(&opts, &err);
+
+out:
+    hmp_handle_error(mon, err);
+}
+
+void hmp_sendkey(Monitor *mon, const QDict *qdict)
+{
+    const char *keys = qdict_get_str(qdict, "keys");
+    KeyValue *v = NULL;
+    KeyValueList *head = NULL, **tail = &head;
+    int has_hold_time = qdict_haskey(qdict, "hold-time");
+    int hold_time = qdict_get_try_int(qdict, "hold-time", -1);
+    Error *err = NULL;
+    const char *separator;
+    int keyname_len;
+
+    while (1) {
+        separator = qemu_strchrnul(keys, '-');
+        keyname_len = separator - keys;
+
+        /* Be compatible with old interface, convert user inputted "<" */
+        if (keys[0] == '<' && keyname_len == 1) {
+            keys = "less";
+            keyname_len = 4;
+        }
+
+        v = g_malloc0(sizeof(*v));
+
+        if (strstart(keys, "0x", NULL)) {
+            const char *endp;
+            unsigned long value;
+
+            if (qemu_strtoul(keys, &endp, 0, &value) < 0
+                || value >= INT_MAX) {
+                goto err_out;
+            }
+            assert(endp <= keys + keyname_len);
+            if (endp != keys + keyname_len) {
+                goto err_out;
+            }
+            v->type = KEY_VALUE_KIND_NUMBER;
+            v->u.number.data = value;
+        } else {
+            int idx = index_from_key(keys, keyname_len);
+            if (idx == Q_KEY_CODE__MAX) {
+                goto err_out;
+            }
+            v->type = KEY_VALUE_KIND_QCODE;
+            v->u.qcode.data = idx;
+        }
+        QAPI_LIST_APPEND(tail, v);
+        v = NULL;
+
+        if (!*separator) {
+            break;
+        }
+        keys = separator + 1;
+    }
+
+    qmp_send_key(head, has_hold_time, hold_time, &err);
+    hmp_handle_error(mon, err);
+
+out:
+    qapi_free_KeyValue(v);
+    qapi_free_KeyValueList(head);
+    return;
+
+err_out:
+    monitor_printf(mon, "invalid parameter: %.*s\n", keyname_len, keys);
+    goto out;
+}
+
+void coroutine_fn
+hmp_screendump(Monitor *mon, const QDict *qdict)
+{
+    const char *filename = qdict_get_str(qdict, "filename");
+    const char *id = qdict_get_try_str(qdict, "device");
+    int64_t head = qdict_get_try_int(qdict, "head", 0);
+    const char *input_format  = qdict_get_try_str(qdict, "format");
+    Error *err = NULL;
+    ImageFormat format;
+
+    format = qapi_enum_parse(&ImageFormat_lookup, input_format,
+                              IMAGE_FORMAT_PPM, &err);
+    if (err) {
+        goto end;
+    }
+
+    qmp_screendump(filename, id != NULL, id, id != NULL, head,
+                   input_format != NULL, format, &err);
+end:
+    hmp_handle_error(mon, err);
+}
diff --git a/ui/meson.build b/ui/meson.build
index 9194ea335b..612ea2325b 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -14,6 +14,7 @@ softmmu_ss.add(files(
   'kbd-state.c',
   'keymaps.c',
   'qemu-pixman.c',
+  'ui-hmp-cmds.c',
   'ui-qmp-cmds.c',
   'util.c',
 ))
-- 
2.37.3


