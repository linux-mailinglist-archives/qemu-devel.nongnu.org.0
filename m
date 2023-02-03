Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C48268929C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:49:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNriD-0008WI-FI; Fri, 03 Feb 2023 03:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrht-0008Ms-1e
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhl-0007U9-Vx
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sKFBX5haT/xOoNhcbUsT7s42u4tOM4oChMvpo7X+ExI=;
 b=de2gKDFIg7C1sjCncYAyS/ddSu0sRYs2paQcvNqeDEiArY5tn66SvpF0Kb14exYh10ru+e
 rwnu2UY+tiBvVRSc12QVnuMjwj0+y76J7/UdKa2PV7mNBL52gkOtIUbcUdGgS5/sso80/7
 QZU9b7+rIy6mssyHQufzBWcJtZqzzfs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-UtjfHjjXOh2wElLeLSbgeQ-1; Fri, 03 Feb 2023 03:45:54 -0500
X-MC-Unique: UtjfHjjXOh2wElLeLSbgeQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8407800050;
 Fri,  3 Feb 2023 08:45:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A49F9C16020;
 Fri,  3 Feb 2023 08:45:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DC5FE21E691F; Fri,  3 Feb 2023 09:45:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 19/35] net: Move hmp_info_network() to net-hmp-cmds.c
Date: Fri,  3 Feb 2023 09:45:33 +0100
Message-Id: <20230203084549.2622302-20-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230124121946.1139465-17-armbru@redhat.com>
---
 include/monitor/hmp.h |  1 +
 include/net/net.h     |  4 +++-
 monitor/hmp-cmds.c    |  1 -
 monitor/misc.c        |  1 -
 net/net-hmp-cmds.c    | 28 ++++++++++++++++++++++++++++
 net/net.c             | 28 +---------------------------
 6 files changed, 33 insertions(+), 30 deletions(-)

diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index d60d1305b8..a248ee9ed1 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -56,6 +56,7 @@ void hmp_ringbuf_read(Monitor *mon, const QDict *qdict);
 void hmp_cont(Monitor *mon, const QDict *qdict);
 void hmp_system_wakeup(Monitor *mon, const QDict *qdict);
 void hmp_nmi(Monitor *mon, const QDict *qdict);
+void hmp_info_network(Monitor *mon, const QDict *qdict);
 void hmp_set_link(Monitor *mon, const QDict *qdict);
 void hmp_balloon(Monitor *mon, const QDict *qdict);
 void hmp_loadvm(Monitor *mon, const QDict *qdict);
diff --git a/include/net/net.h b/include/net/net.h
index dc20b31e9f..fad589cc1d 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -115,6 +115,8 @@ struct NetClientState {
     QTAILQ_HEAD(, NetFilterState) filters;
 };
 
+typedef QTAILQ_HEAD(NetClientStateList, NetClientState) NetClientStateList;
+
 typedef struct NICState {
     NetClientState *ncs;
     NICConf *conf;
@@ -196,7 +198,6 @@ int qemu_find_nic_model(NICInfo *nd, const char * const *models,
                         const char *default_model);
 
 void print_net_client(Monitor *mon, NetClientState *nc);
-void hmp_info_network(Monitor *mon, const QDict *qdict);
 void net_socket_rs_init(SocketReadState *rs,
                         SocketReadStateFinalize *finalize,
                         bool vnet_hdr);
@@ -222,6 +223,7 @@ extern NICInfo nd_table[MAX_NICS];
 extern const char *host_net_devices[];
 
 /* from net.c */
+extern NetClientStateList net_clients;
 bool netdev_is_modern(const char *optarg);
 void netdev_parse_modern(const char *optarg);
 void net_client_parse(QemuOptsList *opts_list, const char *str);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 90259d02d7..b059af7abd 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -15,7 +15,6 @@
 
 #include "qemu/osdep.h"
 #include "monitor/hmp.h"
-#include "net/net.h"
 #include "sysemu/runstate.h"
 #include "qemu/sockets.h"
 #include "qemu/help_option.h"
diff --git a/monitor/misc.c b/monitor/misc.c
index bf3d863227..77a76b2b5f 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -26,7 +26,6 @@
 #include "monitor-internal.h"
 #include "monitor/qdev.h"
 #include "exec/gdbstub.h"
-#include "net/net.h"
 #include "net/slirp.h"
 #include "ui/qemu-spice.h"
 #include "qemu/ctype.h"
diff --git a/net/net-hmp-cmds.c b/net/net-hmp-cmds.c
index d7427ea4f8..41d326bf5f 100644
--- a/net/net-hmp-cmds.c
+++ b/net/net-hmp-cmds.c
@@ -16,7 +16,9 @@
 #include "qemu/osdep.h"
 #include "migration/misc.h"
 #include "monitor/hmp.h"
+#include "monitor/monitor.h"
 #include "net/net.h"
+#include "net/hub.h"
 #include "qapi/clone-visitor.h"
 #include "qapi/qapi-commands-net.h"
 #include "qapi/qapi-visit-net.h"
@@ -25,6 +27,32 @@
 #include "qemu/help_option.h"
 #include "qemu/option.h"
 
+void hmp_info_network(Monitor *mon, const QDict *qdict)
+{
+    NetClientState *nc, *peer;
+    NetClientDriver type;
+
+    net_hub_info(mon);
+
+    QTAILQ_FOREACH(nc, &net_clients, next) {
+        peer = nc->peer;
+        type = nc->info->type;
+
+        /* Skip if already printed in hub info */
+        if (net_hub_id_for_client(nc, NULL) == 0) {
+            continue;
+        }
+
+        if (!peer || type == NET_CLIENT_DRIVER_NIC) {
+            print_net_client(mon, nc);
+        } /* else it's a netdev connected to a NIC, printed with the NIC */
+        if (peer && type == NET_CLIENT_DRIVER_NIC) {
+            monitor_printf(mon, " \\ ");
+            print_net_client(mon, peer);
+        }
+    }
+}
+
 void hmp_set_link(Monitor *mon, const QDict *qdict)
 {
     const char *name = qdict_get_str(qdict, "name");
diff --git a/net/net.c b/net/net.c
index 2d01472998..251fc5ab55 100644
--- a/net/net.c
+++ b/net/net.c
@@ -63,7 +63,7 @@
 #endif
 
 static VMChangeStateEntry *net_change_state_entry;
-static QTAILQ_HEAD(, NetClientState) net_clients;
+NetClientStateList net_clients;
 
 typedef struct NetdevQueueEntry {
     Netdev *nd;
@@ -1345,32 +1345,6 @@ RxFilterInfoList *qmp_query_rx_filter(const char *name, Error **errp)
     return filter_list;
 }
 
-void hmp_info_network(Monitor *mon, const QDict *qdict)
-{
-    NetClientState *nc, *peer;
-    NetClientDriver type;
-
-    net_hub_info(mon);
-
-    QTAILQ_FOREACH(nc, &net_clients, next) {
-        peer = nc->peer;
-        type = nc->info->type;
-
-        /* Skip if already printed in hub info */
-        if (net_hub_id_for_client(nc, NULL) == 0) {
-            continue;
-        }
-
-        if (!peer || type == NET_CLIENT_DRIVER_NIC) {
-            print_net_client(mon, nc);
-        } /* else it's a netdev connected to a NIC, printed with the NIC */
-        if (peer && type == NET_CLIENT_DRIVER_NIC) {
-            monitor_printf(mon, " \\ ");
-            print_net_client(mon, peer);
-        }
-    }
-}
-
 void colo_notify_filters_event(int event, Error **errp)
 {
     NetClientState *nc;
-- 
2.39.0


