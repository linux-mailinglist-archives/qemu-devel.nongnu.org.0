Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21E867980E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 13:28:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKIHX-00021Y-Eg; Tue, 24 Jan 2023 07:20:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pKIHV-0001zt-6e
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:20:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pKIHL-0006RC-NE
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674562794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vDunWt9EWbcTVK/yt3U+6YVKXow9qX6ZUmi9i1KFDR8=;
 b=Y/yyyVUxPD6KtX0Ua+gmL47req/0Ru6PotDDvbLeF1i3dRndi2JSgxRi52DQaFqELBaWj+
 YlxOe7o+QTEWEvQHKqNeuBgmqOJp/d0zqLFZl1zHP2y0W/CB+USIKMCelI9sCmsAKf+PSl
 3aYWDVKODmdsW8bwoJzKvfsWc2/E6rk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-7IBbb1BjMyaEnm34ne2CkA-1; Tue, 24 Jan 2023 07:19:51 -0500
X-MC-Unique: 7IBbb1BjMyaEnm34ne2CkA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E875A38123A2;
 Tue, 24 Jan 2023 12:19:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88E0C40C1141;
 Tue, 24 Jan 2023 12:19:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AE66B21E6916; Tue, 24 Jan 2023 13:19:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, kraxel@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, marcandre.lureau@redhat.com, dgilbert@redhat.com,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 jasowang@redhat.com, jiri@resnulli.us, berrange@redhat.com,
 thuth@redhat.com, quintela@redhat.com, stefanb@linux.vnet.ibm.com,
 stefanha@redhat.com, kvm@vger.kernel.org, qemu-block@nongnu.org
Subject: [PATCH 15/32] net: Move HMP commands from monitor to net/
Date: Tue, 24 Jan 2023 13:19:29 +0100
Message-Id: <20230124121946.1139465-16-armbru@redhat.com>
In-Reply-To: <20230124121946.1139465-1-armbru@redhat.com>
References: <20230124121946.1139465-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

This moves these commands from MAINTAINERS sections "Human
Monitor (HMP)" and "QMP" to "Network device backends".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/hmp-cmds.c |  61 -------------------
 monitor/misc.c     |  56 ------------------
 net/net-hmp-cmds.c | 142 +++++++++++++++++++++++++++++++++++++++++++++
 net/meson.build    |   1 +
 4 files changed, 143 insertions(+), 117 deletions(-)
 create mode 100644 net/net-hmp-cmds.c

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 2ca869c2ee..90259d02d7 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -21,17 +21,14 @@
 #include "qemu/help_option.h"
 #include "monitor/monitor.h"
 #include "qapi/error.h"
-#include "qapi/clone-visitor.h"
 #include "qapi/qapi-builtin-visit.h"
 #include "qapi/qapi-commands-control.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
-#include "qapi/qapi-commands-net.h"
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-commands-stats.h"
 #include "qapi/qapi-commands-tpm.h"
 #include "qapi/qapi-commands-virtio.h"
-#include "qapi/qapi-visit-net.h"
 #include "qapi/qapi-visit-migration.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
@@ -575,16 +572,6 @@ void hmp_cont(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
-void hmp_set_link(Monitor *mon, const QDict *qdict)
-{
-    const char *name = qdict_get_str(qdict, "name");
-    bool up = qdict_get_bool(qdict, "up");
-    Error *err = NULL;
-
-    qmp_set_link(name, up, &err);
-    hmp_handle_error(mon, err);
-}
-
 void hmp_loadvm(Monitor *mon, const QDict *qdict)
 {
     int saved_vm_running  = runstate_is_running();
@@ -617,21 +604,6 @@ void hmp_delvm(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
-void hmp_announce_self(Monitor *mon, const QDict *qdict)
-{
-    const char *interfaces_str = qdict_get_try_str(qdict, "interfaces");
-    const char *id = qdict_get_try_str(qdict, "id");
-    AnnounceParameters *params = QAPI_CLONE(AnnounceParameters,
-                                            migrate_announce_params());
-
-    qapi_free_strList(params->interfaces);
-    params->interfaces = hmp_split_at_comma(interfaces_str);
-    params->has_interfaces = params->interfaces != NULL;
-    params->id = g_strdup(id);
-    qmp_announce_self(params, NULL);
-    qapi_free_AnnounceParameters(params);
-}
-
 void hmp_migrate_cancel(Monitor *mon, const QDict *qdict)
 {
     qmp_migrate_cancel(NULL);
@@ -996,39 +968,6 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
     }
 }
 
-void hmp_netdev_add(Monitor *mon, const QDict *qdict)
-{
-    Error *err = NULL;
-    QemuOpts *opts;
-    const char *type = qdict_get_try_str(qdict, "type");
-
-    if (type && is_help_option(type)) {
-        show_netdevs();
-        return;
-    }
-    opts = qemu_opts_from_qdict(qemu_find_opts("netdev"), qdict, &err);
-    if (err) {
-        goto out;
-    }
-
-    netdev_add(opts, &err);
-    if (err) {
-        qemu_opts_del(opts);
-    }
-
-out:
-    hmp_handle_error(mon, err);
-}
-
-void hmp_netdev_del(Monitor *mon, const QDict *qdict)
-{
-    const char *id = qdict_get_str(qdict, "id");
-    Error *err = NULL;
-
-    qmp_netdev_del(id, &err);
-    hmp_handle_error(mon, err);
-}
-
 void hmp_getfd(Monitor *mon, const QDict *qdict)
 {
     const char *fdname = qdict_get_str(qdict, "fdname");
diff --git a/monitor/misc.c b/monitor/misc.c
index 0cf2518ce1..bf3d863227 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1268,21 +1268,6 @@ int get_monitor_def(Monitor *mon, int64_t *pval, const char *name)
     return ret;
 }
 
-void netdev_add_completion(ReadLineState *rs, int nb_args, const char *str)
-{
-    size_t len;
-    int i;
-
-    if (nb_args != 2) {
-        return;
-    }
-    len = strlen(str);
-    readline_set_completion_index(rs, len);
-    for (i = 0; i < NET_CLIENT_DRIVER__MAX; i++) {
-        readline_add_completion_of(rs, str, NetClientDriver_str(i));
-    }
-}
-
 void device_add_completion(ReadLineState *rs, int nb_args, const char *str)
 {
     GSList *list, *elt;
@@ -1365,47 +1350,6 @@ void device_del_completion(ReadLineState *rs, int nb_args, const char *str)
     peripheral_device_del_completion(rs, str);
 }
 
-void set_link_completion(ReadLineState *rs, int nb_args, const char *str)
-{
-    size_t len;
-
-    len = strlen(str);
-    readline_set_completion_index(rs, len);
-    if (nb_args == 2) {
-        NetClientState *ncs[MAX_QUEUE_NUM];
-        int count, i;
-        count = qemu_find_net_clients_except(NULL, ncs,
-                                             NET_CLIENT_DRIVER_NONE,
-                                             MAX_QUEUE_NUM);
-        for (i = 0; i < MIN(count, MAX_QUEUE_NUM); i++) {
-            readline_add_completion_of(rs, str, ncs[i]->name);
-        }
-    } else if (nb_args == 3) {
-        readline_add_completion_of(rs, str, "on");
-        readline_add_completion_of(rs, str, "off");
-    }
-}
-
-void netdev_del_completion(ReadLineState *rs, int nb_args, const char *str)
-{
-    int len, count, i;
-    NetClientState *ncs[MAX_QUEUE_NUM];
-
-    if (nb_args != 2) {
-        return;
-    }
-
-    len = strlen(str);
-    readline_set_completion_index(rs, len);
-    count = qemu_find_net_clients_except(NULL, ncs, NET_CLIENT_DRIVER_NIC,
-                                         MAX_QUEUE_NUM);
-    for (i = 0; i < MIN(count, MAX_QUEUE_NUM); i++) {
-        if (ncs[i]->is_netdev) {
-            readline_add_completion_of(rs, str, ncs[i]->name);
-        }
-    }
-}
-
 void watchdog_action_completion(ReadLineState *rs, int nb_args, const char *str)
 {
     int i;
diff --git a/net/net-hmp-cmds.c b/net/net-hmp-cmds.c
new file mode 100644
index 0000000000..d7427ea4f8
--- /dev/null
+++ b/net/net-hmp-cmds.c
@@ -0,0 +1,142 @@
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
+#include "migration/misc.h"
+#include "monitor/hmp.h"
+#include "net/net.h"
+#include "qapi/clone-visitor.h"
+#include "qapi/qapi-commands-net.h"
+#include "qapi/qapi-visit-net.h"
+#include "qapi/qmp/qdict.h"
+#include "qemu/config-file.h"
+#include "qemu/help_option.h"
+#include "qemu/option.h"
+
+void hmp_set_link(Monitor *mon, const QDict *qdict)
+{
+    const char *name = qdict_get_str(qdict, "name");
+    bool up = qdict_get_bool(qdict, "up");
+    Error *err = NULL;
+
+    qmp_set_link(name, up, &err);
+    hmp_handle_error(mon, err);
+}
+
+
+void hmp_announce_self(Monitor *mon, const QDict *qdict)
+{
+    const char *interfaces_str = qdict_get_try_str(qdict, "interfaces");
+    const char *id = qdict_get_try_str(qdict, "id");
+    AnnounceParameters *params = QAPI_CLONE(AnnounceParameters,
+                                            migrate_announce_params());
+
+    qapi_free_strList(params->interfaces);
+    params->interfaces = hmp_split_at_comma(interfaces_str);
+    params->has_interfaces = params->interfaces != NULL;
+    params->id = g_strdup(id);
+    qmp_announce_self(params, NULL);
+    qapi_free_AnnounceParameters(params);
+}
+
+void hmp_netdev_add(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    QemuOpts *opts;
+    const char *type = qdict_get_try_str(qdict, "type");
+
+    if (type && is_help_option(type)) {
+        show_netdevs();
+        return;
+    }
+    opts = qemu_opts_from_qdict(qemu_find_opts("netdev"), qdict, &err);
+    if (err) {
+        goto out;
+    }
+
+    netdev_add(opts, &err);
+    if (err) {
+        qemu_opts_del(opts);
+    }
+
+out:
+    hmp_handle_error(mon, err);
+}
+
+void hmp_netdev_del(Monitor *mon, const QDict *qdict)
+{
+    const char *id = qdict_get_str(qdict, "id");
+    Error *err = NULL;
+
+    qmp_netdev_del(id, &err);
+    hmp_handle_error(mon, err);
+}
+
+
+void netdev_add_completion(ReadLineState *rs, int nb_args, const char *str)
+{
+    size_t len;
+    int i;
+
+    if (nb_args != 2) {
+        return;
+    }
+    len = strlen(str);
+    readline_set_completion_index(rs, len);
+    for (i = 0; i < NET_CLIENT_DRIVER__MAX; i++) {
+        readline_add_completion_of(rs, str, NetClientDriver_str(i));
+    }
+}
+
+void set_link_completion(ReadLineState *rs, int nb_args, const char *str)
+{
+    size_t len;
+
+    len = strlen(str);
+    readline_set_completion_index(rs, len);
+    if (nb_args == 2) {
+        NetClientState *ncs[MAX_QUEUE_NUM];
+        int count, i;
+        count = qemu_find_net_clients_except(NULL, ncs,
+                                             NET_CLIENT_DRIVER_NONE,
+                                             MAX_QUEUE_NUM);
+        for (i = 0; i < MIN(count, MAX_QUEUE_NUM); i++) {
+            readline_add_completion_of(rs, str, ncs[i]->name);
+        }
+    } else if (nb_args == 3) {
+        readline_add_completion_of(rs, str, "on");
+        readline_add_completion_of(rs, str, "off");
+    }
+}
+
+void netdev_del_completion(ReadLineState *rs, int nb_args, const char *str)
+{
+    int len, count, i;
+    NetClientState *ncs[MAX_QUEUE_NUM];
+
+    if (nb_args != 2) {
+        return;
+    }
+
+    len = strlen(str);
+    readline_set_completion_index(rs, len);
+    count = qemu_find_net_clients_except(NULL, ncs, NET_CLIENT_DRIVER_NIC,
+                                         MAX_QUEUE_NUM);
+    for (i = 0; i < MIN(count, MAX_QUEUE_NUM); i++) {
+        if (ncs[i]->is_netdev) {
+            readline_add_completion_of(rs, str, ncs[i]->name);
+        }
+    }
+}
diff --git a/net/meson.build b/net/meson.build
index 6cd1e3dab3..87afca3e93 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -10,6 +10,7 @@ softmmu_ss.add(files(
   'filter-rewriter.c',
   'filter.c',
   'hub.c',
+  'net-hmp-cmds.c',
   'net.c',
   'queue.c',
   'socket.c',
-- 
2.39.0


