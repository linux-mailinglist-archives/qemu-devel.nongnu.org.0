Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D9B6025B4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 09:29:38 +0200 (CEST)
Received: from localhost ([::1]:33924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okh2d-0004Jt-Pv
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 03:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg6D-0005gd-7e
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg65-0001Ep-HV
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666074534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SPYjfLa2tJN1fpoytQQbBGJRZJ444KI78FLAHW4M35Y=;
 b=II+/cllJTa3OEunXhJS2L7KQt/82dmf8KSqzxKHGBDKmUIJq2vCDj47fWJVJ4khSHeVurs
 flwTy1lX3QrZykFG/MggeHemNmFEXTf4Duf6JmSqc56dsKXpoNhK3BHPo9oYGx6rKwfP0n
 jHPy6xOkMzFGovUOPJGIfcaq5fNb/SI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-ErwZM5uQMByHlOZZbWz1dQ-1; Tue, 18 Oct 2022 02:28:53 -0400
X-MC-Unique: ErwZM5uQMByHlOZZbWz1dQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27F39185A79C;
 Tue, 18 Oct 2022 06:28:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D55A6409AE1;
 Tue, 18 Oct 2022 06:28:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 62E0121E662B; Tue, 18 Oct 2022 08:28:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 25/28] qapi ui: Elide redundant has_FOO in generated C
Date: Tue, 18 Oct 2022 08:28:46 +0200
Message-Id: <20221018062849.3420573-26-armbru@redhat.com>
In-Reply-To: <20221018062849.3420573-1-armbru@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/ui.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 monitor/hmp-cmds.c     | 12 ++++--------
 ui/console.c           |  4 ++--
 ui/input.c             |  4 ++--
 ui/spice-core.c        |  5 -----
 ui/vnc.c               | 10 ----------
 scripts/qapi/schema.py |  1 -
 6 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 378f5b083d..5285d7f2fe 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -569,11 +569,9 @@ static void hmp_info_vnc_clients(Monitor *mon, VncClientInfoList *client)
 
         hmp_info_VncBasicInfo(mon, qapi_VncClientInfo_base(cinfo), "Client");
         monitor_printf(mon, "    x509_dname: %s\n",
-                       cinfo->has_x509_dname ?
-                       cinfo->x509_dname : "none");
+                       cinfo->x509_dname ?: "none");
         monitor_printf(mon, "    sasl_username: %s\n",
-                       cinfo->has_sasl_username ?
-                       cinfo->sasl_username : "none");
+                       cinfo->sasl_username ?: "none");
 
         client = client->next;
     }
@@ -618,7 +616,7 @@ void hmp_info_vnc(Monitor *mon, const QDict *qdict)
             hmp_info_vnc_authcrypt(mon, "  ", info->auth,
                                info->has_vencrypt ? &info->vencrypt : NULL);
         }
-        if (info->has_display) {
+        if (info->display) {
             monitor_printf(mon, "  Display: %s\n", info->display);
         }
         info2l = info2l->next;
@@ -1422,7 +1420,6 @@ void hmp_set_password(Monitor *mon, const QDict *qdict)
     }
 
     if (opts.protocol == DISPLAY_PROTOCOL_VNC) {
-        opts.u.vnc.has_display = !!display;
         opts.u.vnc.display = (char *)display;
     }
 
@@ -1450,7 +1447,6 @@ void hmp_expire_password(Monitor *mon, const QDict *qdict)
     }
 
     if (opts.protocol == DISPLAY_PROTOCOL_VNC) {
-        opts.u.vnc.has_display = !!display;
         opts.u.vnc.display = (char *)display;
     }
 
@@ -1735,7 +1731,7 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
         goto end;
     }
 
-    qmp_screendump(filename, id != NULL, id, id != NULL, head,
+    qmp_screendump(filename, id, id != NULL, head,
                    input_format != NULL, format, &err);
 end:
     hmp_handle_error(mon, err);
diff --git a/ui/console.c b/ui/console.c
index 49da6a91df..35b5680812 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -407,7 +407,7 @@ static void graphic_hw_update_bh(void *con)
 
 /* Safety: coroutine-only, concurrent-coroutine safe, main thread only */
 void coroutine_fn
-qmp_screendump(const char *filename, bool has_device, const char *device,
+qmp_screendump(const char *filename, const char *device,
                bool has_head, int64_t head,
                bool has_format, ImageFormat format, Error **errp)
 {
@@ -416,7 +416,7 @@ qmp_screendump(const char *filename, bool has_device, const char *device,
     DisplaySurface *surface;
     int fd;
 
-    if (has_device) {
+    if (device) {
         con = qemu_console_lookup_by_device_name(device, has_head ? head : 0,
                                                  errp);
         if (!con) {
diff --git a/ui/input.c b/ui/input.c
index e2a90af889..8f4a87d1d7 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -124,7 +124,7 @@ qemu_input_find_handler(uint32_t mask, QemuConsole *con)
     return NULL;
 }
 
-void qmp_input_send_event(bool has_device, const char *device,
+void qmp_input_send_event(const char *device,
                           bool has_head, int64_t head,
                           InputEventList *events, Error **errp)
 {
@@ -133,7 +133,7 @@ void qmp_input_send_event(bool has_device, const char *device,
     Error *err = NULL;
 
     con = NULL;
-    if (has_device) {
+    if (device) {
         if (!has_head) {
             head = 0;
         }
diff --git a/ui/spice-core.c b/ui/spice-core.c
index c3ac20ad43..72f8f1681c 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -222,7 +222,6 @@ static void channel_event(int event, SpiceChannelEventInfo *info)
         break;
     case SPICE_CHANNEL_EVENT_INITIALIZED:
         if (auth) {
-            server->has_auth = true;
             server->auth = g_strdup(auth);
         }
         add_channel_info(client, info);
@@ -522,13 +521,9 @@ static SpiceInfo *qmp_query_spice_real(Error **errp)
     port = qemu_opt_get_number(opts, "port", 0);
     tls_port = qemu_opt_get_number(opts, "tls-port", 0);
 
-    info->has_auth = true;
     info->auth = g_strdup(auth);
-
-    info->has_host = true;
     info->host = g_strdup(addr ? addr : "*");
 
-    info->has_compiled_version = true;
     major = (SPICE_SERVER_VERSION & 0xff0000) >> 16;
     minor = (SPICE_SERVER_VERSION & 0xff00) >> 8;
     micro = SPICE_SERVER_VERSION & 0xff;
diff --git a/ui/vnc.c b/ui/vnc.c
index acb3629cd8..de0beb9c18 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -244,7 +244,6 @@ static VncServerInfo *vnc_server_info_get(VncDisplay *vd)
     info = g_malloc0(sizeof(*info));
     vnc_init_basic_info_from_server_addr(vd->listener->sioc[0],
                                          qapi_VncServerInfo_base(info), &err);
-    info->has_auth = true;
     info->auth = g_strdup(vnc_auth_name(vd));
     if (err) {
         qapi_free_VncServerInfo(info);
@@ -263,13 +262,10 @@ static void vnc_client_cache_auth(VncState *client)
     if (client->tls) {
         client->info->x509_dname =
             qcrypto_tls_session_get_peer_name(client->tls);
-        client->info->has_x509_dname =
-            client->info->x509_dname != NULL;
     }
 #ifdef CONFIG_VNC_SASL
     if (client->sasl.conn &&
         client->sasl.username) {
-        client->info->has_sasl_username = true;
         client->info->sasl_username = g_strdup(client->sasl.username);
     }
 #endif
@@ -341,11 +337,9 @@ static VncClientInfo *qmp_query_vnc_client(const VncState *client)
 
     if (client->tls) {
         info->x509_dname = qcrypto_tls_session_get_peer_name(client->tls);
-        info->has_x509_dname = info->x509_dname != NULL;
     }
 #ifdef CONFIG_VNC_SASL
     if (client->sasl.conn && client->sasl.username) {
-        info->has_sasl_username = true;
         info->sasl_username = g_strdup(client->sasl.username);
     }
 #endif
@@ -426,11 +420,8 @@ VncInfo *qmp_query_vnc(Error **errp)
             abort();
         }
 
-        info->has_host = true;
-        info->has_service = true;
         info->has_family = true;
 
-        info->has_auth = true;
         info->auth = g_strdup(vnc_auth_name(vd));
     }
 
@@ -568,7 +559,6 @@ VncInfo2List *qmp_query_vnc_servers(Error **errp)
         if (vd->dcl.con) {
             dev = DEVICE(object_property_get_link(OBJECT(vd->dcl.con),
                                                   "device", &error_abort));
-            info->has_display = true;
             info->display = g_strdup(dev->id);
         }
         for (i = 0; vd->listener != NULL && i < vd->listener->nsioc; i++) {
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 3673296ad8..fd18f8249b 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,7 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/ui.json',
             'qapi/virtio.json',
             'qga/qapi-schema.json']
         if self.info and any(self.info.fname.endswith(mod)
-- 
2.37.2


