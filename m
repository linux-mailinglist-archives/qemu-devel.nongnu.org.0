Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905692815DE
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 16:56:55 +0200 (CEST)
Received: from localhost ([::1]:35964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOMUQ-0000pX-KC
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 10:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kOMIB-0001UA-SU
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:44:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kOMI9-0004Xt-7U
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:44:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601649852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DiE+vkgWY8laThv28daYIMCdmx7NNdzF7THjb62ew/o=;
 b=Of8iNTUHx/laZKB9U3bVzZ2xOfs3bz623MFL7A6FSs7i8g2QnismQyKhphPS8T6PWdWKhZ
 qnQEioBMNUcF44cKz3yPZi5eNKJf6pWat63FzQok+AFcRnSO3dq1dCi93UhzruTbjY9vEK
 itGqCYc4Was/DVOWKg7zNtgW+8sE9Zw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-KMOeoXm4Nii5E_qms45hcg-1; Fri, 02 Oct 2020 10:44:10 -0400
X-MC-Unique: KMOeoXm4Nii5E_qms45hcg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCF83192AB60;
 Fri,  2 Oct 2020 14:44:08 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-112-139.ams2.redhat.com
 [10.36.112.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E90865D9D3;
 Fri,  2 Oct 2020 14:44:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 12/37] nbd: Add max-connections to nbd-server-start
Date: Fri,  2 Oct 2020 16:43:20 +0200
Message-Id: <20201002144345.253865-13-kwolf@redhat.com>
In-Reply-To: <20201002144345.253865-1-kwolf@redhat.com>
References: <20201002144345.253865-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 01:13:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a QMP equivalent of qemu-nbd's --shared option, limiting the
maximum number of clients that can attach at the same time.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20200924152717.287415-9-kwolf@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-export.json               | 10 +++++++--
 include/block/nbd.h                  |  3 ++-
 block/monitor/block-hmp-cmds.c       |  2 +-
 blockdev-nbd.c                       | 33 ++++++++++++++++++++++------
 storage-daemon/qemu-storage-daemon.c |  4 ++--
 5 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index 5890a94219..8aa8a01fa6 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -20,13 +20,16 @@
 #             is only resolved at time of use, so can be deleted and
 #             recreated on the fly while the NBD server is active.
 #             If missing, it will default to denying access (since 4.0).
+# @max-connections: The maximum number of connections to allow at the same
+#                   time, 0 for unlimited. (since 5.2; default: 0)
 #
 # Since: 4.2
 ##
 { 'struct': 'NbdServerOptions',
   'data': { 'addr': 'SocketAddress',
             '*tls-creds': 'str',
-            '*tls-authz': 'str'} }
+            '*tls-authz': 'str',
+            '*max-connections': 'uint32' } }
 
 ##
 # @nbd-server-start:
@@ -46,6 +49,8 @@
 #             is only resolved at time of use, so can be deleted and
 #             recreated on the fly while the NBD server is active.
 #             If missing, it will default to denying access (since 4.0).
+# @max-connections: The maximum number of connections to allow at the same
+#                   time, 0 for unlimited. (since 5.2; default: 0)
 #
 # Returns: error if the server is already running.
 #
@@ -54,7 +59,8 @@
 { 'command': 'nbd-server-start',
   'data': { 'addr': 'SocketAddressLegacy',
             '*tls-creds': 'str',
-            '*tls-authz': 'str'} }
+            '*tls-authz': 'str',
+            '*max-connections': 'uint32' } }
 
 ##
 # @BlockExportOptionsNbd:
diff --git a/include/block/nbd.h b/include/block/nbd.h
index f55f5b710b..acccdb3180 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -354,7 +354,8 @@ void nbd_client_get(NBDClient *client);
 void nbd_client_put(NBDClient *client);
 
 void nbd_server_start(SocketAddress *addr, const char *tls_creds,
-                      const char *tls_authz, Error **errp);
+                      const char *tls_authz, uint32_t max_connections,
+                      Error **errp);
 void nbd_server_start_options(NbdServerOptions *arg, Error **errp);
 
 /* nbd_read
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index fb632b1189..662b7f7d00 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -411,7 +411,7 @@ void hmp_nbd_server_start(Monitor *mon, const QDict *qdict)
         goto exit;
     }
 
-    nbd_server_start(addr, NULL, NULL, &local_err);
+    nbd_server_start(addr, NULL, NULL, 0, &local_err);
     qapi_free_SocketAddress(addr);
     if (local_err != NULL) {
         goto exit;
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index 7bcca105f9..41d5542987 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -23,23 +23,41 @@ typedef struct NBDServerData {
     QIONetListener *listener;
     QCryptoTLSCreds *tlscreds;
     char *tlsauthz;
+    uint32_t max_connections;
+    uint32_t connections;
 } NBDServerData;
 
 static NBDServerData *nbd_server;
 
+static void nbd_update_server_watch(NBDServerData *s);
+
 static void nbd_blockdev_client_closed(NBDClient *client, bool ignored)
 {
     nbd_client_put(client);
+    assert(nbd_server->connections > 0);
+    nbd_server->connections--;
+    nbd_update_server_watch(nbd_server);
 }
 
 static void nbd_accept(QIONetListener *listener, QIOChannelSocket *cioc,
                        gpointer opaque)
 {
+    nbd_server->connections++;
+    nbd_update_server_watch(nbd_server);
+
     qio_channel_set_name(QIO_CHANNEL(cioc), "nbd-server");
     nbd_client_new(cioc, nbd_server->tlscreds, nbd_server->tlsauthz,
                    nbd_blockdev_client_closed);
 }
 
+static void nbd_update_server_watch(NBDServerData *s)
+{
+    if (!s->max_connections || s->connections < s->max_connections) {
+        qio_net_listener_set_client_func(s->listener, nbd_accept, NULL, NULL);
+    } else {
+        qio_net_listener_set_client_func(s->listener, NULL, NULL, NULL);
+    }
+}
 
 static void nbd_server_free(NBDServerData *server)
 {
@@ -88,7 +106,8 @@ static QCryptoTLSCreds *nbd_get_tls_creds(const char *id, Error **errp)
 
 
 void nbd_server_start(SocketAddress *addr, const char *tls_creds,
-                      const char *tls_authz, Error **errp)
+                      const char *tls_authz, uint32_t max_connections,
+                      Error **errp)
 {
     if (nbd_server) {
         error_setg(errp, "NBD server already running");
@@ -96,6 +115,7 @@ void nbd_server_start(SocketAddress *addr, const char *tls_creds,
     }
 
     nbd_server = g_new0(NBDServerData, 1);
+    nbd_server->max_connections = max_connections;
     nbd_server->listener = qio_net_listener_new();
 
     qio_net_listener_set_name(nbd_server->listener,
@@ -120,10 +140,7 @@ void nbd_server_start(SocketAddress *addr, const char *tls_creds,
 
     nbd_server->tlsauthz = g_strdup(tls_authz);
 
-    qio_net_listener_set_client_func(nbd_server->listener,
-                                     nbd_accept,
-                                     NULL,
-                                     NULL);
+    nbd_update_server_watch(nbd_server);
 
     return;
 
@@ -134,17 +151,19 @@ void nbd_server_start(SocketAddress *addr, const char *tls_creds,
 
 void nbd_server_start_options(NbdServerOptions *arg, Error **errp)
 {
-    nbd_server_start(arg->addr, arg->tls_creds, arg->tls_authz, errp);
+    nbd_server_start(arg->addr, arg->tls_creds, arg->tls_authz,
+                     arg->max_connections, errp);
 }
 
 void qmp_nbd_server_start(SocketAddressLegacy *addr,
                           bool has_tls_creds, const char *tls_creds,
                           bool has_tls_authz, const char *tls_authz,
+                          bool has_max_connections, uint32_t max_connections,
                           Error **errp)
 {
     SocketAddress *addr_flat = socket_address_flatten(addr);
 
-    nbd_server_start(addr_flat, tls_creds, tls_authz, errp);
+    nbd_server_start(addr_flat, tls_creds, tls_authz, max_connections, errp);
     qapi_free_SocketAddress(addr_flat);
 }
 
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index b6f678d3ab..0fcab6ed2d 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -101,9 +101,9 @@ static void help(void)
 "                         configure a QMP monitor\n"
 "\n"
 "  --nbd-server addr.type=inet,addr.host=<host>,addr.port=<port>\n"
-"               [,tls-creds=<id>][,tls-authz=<id>]\n"
+"               [,tls-creds=<id>][,tls-authz=<id>][,max-connections=<n>]\n"
 "  --nbd-server addr.type=unix,addr.path=<path>\n"
-"               [,tls-creds=<id>][,tls-authz=<id>]\n"
+"               [,tls-creds=<id>][,tls-authz=<id>][,max-connections=<n>]\n"
 "                         start an NBD server for exporting block nodes\n"
 "\n"
 "  --object help          list object types that can be added\n"
-- 
2.25.4


