Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C5850FBC9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 13:15:43 +0200 (CEST)
Received: from localhost ([::1]:35724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njJAU-0002ri-El
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 07:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1njIzP-0004eR-9G
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 07:04:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1njIzN-0004XL-KQ
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 07:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650971053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IUKl7FayplcAMe+oqYrNHhYGiZhfgVAqjMKZGJ6cvr8=;
 b=XGv+vV4dOhXmJOYr6rUAm3dPZv8J1iUdBLj1xs/dJnuuA5Rd3DHz+Jz8elSMAxuehsRnDe
 GRsTiN0roRqpGtlGbTbsSSaScJvnhbQilslBtIu/ucjDMZOoaB7C6/9AfUgNmDf4Wym686
 8iFsSNC6/wmyhj1VVFvTXTTzOWYBrR8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-PjrQ-kPOM4S0GkI-HoskzA-1; Tue, 26 Apr 2022 07:04:09 -0400
X-MC-Unique: PjrQ-kPOM4S0GkI-HoskzA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9488B29ABA02;
 Tue, 26 Apr 2022 11:04:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F5399E93;
 Tue, 26 Apr 2022 11:04:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 25E7C18007B2; Tue, 26 Apr 2022 13:03:59 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/9] qapi/ui: add 'display-update' command for changing listen
 address
Date: Tue, 26 Apr 2022 13:03:53 +0200
Message-Id: <20220426110358.1570723-6-kraxel@redhat.com>
In-Reply-To: <20220426110358.1570723-1-kraxel@redhat.com>
References: <20220426110358.1570723-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>

Add possibility to change addresses where VNC server listens for new
connections. Prior to 6.0 this functionality was available through
'change' qmp command which was deleted.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220401143936.356460-3-vsementsov@openvz.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h            |  1 +
 monitor/qmp-cmds.c              | 15 ++++++++
 ui/vnc.c                        | 23 ++++++++++++
 docs/about/removed-features.rst |  3 +-
 qapi/ui.json                    | 65 +++++++++++++++++++++++++++++++++
 5 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 0f84861933e1..c44b28a972ca 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -518,6 +518,7 @@ int vnc_display_pw_expire(const char *id, time_t expires);
 void vnc_parse(const char *str);
 int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp);
 bool vnc_display_reload_certs(const char *id,  Error **errp);
+bool vnc_display_update(DisplayUpdateOptionsVNC *arg, Error **errp);
 
 /* input.c */
 int index_from_key(const char *key, size_t key_length);
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 5e7302cbb995..1ebb89f46c12 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -346,6 +346,21 @@ void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
     }
 }
 
+void qmp_display_update(DisplayUpdateOptions *arg, Error **errp)
+{
+    switch (arg->type) {
+    case DISPLAY_UPDATE_TYPE_VNC:
+#ifdef CONFIG_VNC
+        vnc_display_update(&arg->u.vnc, errp);
+#else
+        error_setg(errp, "vnc is invalid, missing 'CONFIG_VNC'");
+#endif
+        break;
+    default:
+        abort();
+    }
+}
+
 static int qmp_x_query_rdma_foreach(Object *obj, void *opaque)
 {
     RdmaProvider *rdma;
diff --git a/ui/vnc.c b/ui/vnc.c
index 77a660fccb3f..b02cb3f405b9 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3981,6 +3981,29 @@ static int vnc_display_listen(VncDisplay *vd,
     return 0;
 }
 
+bool vnc_display_update(DisplayUpdateOptionsVNC *arg, Error **errp)
+{
+    VncDisplay *vd = vnc_display_find(NULL);
+
+    if (!vd) {
+        error_setg(errp, "Can not find vnc display");
+        return false;
+    }
+
+    if (arg->has_addresses) {
+        if (vd->listener) {
+            qio_net_listener_disconnect(vd->listener);
+            object_unref(OBJECT(vd->listener));
+            vd->listener = NULL;
+        }
+
+        if (vnc_display_listen(vd, arg->addresses, NULL, errp) < 0) {
+            return false;
+        }
+    }
+
+    return true;
+}
 
 void vnc_display_open(const char *id, Error **errp)
 {
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 4b831ea29176..b367418ca7da 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -355,7 +355,8 @@ documentation of ``query-hotpluggable-cpus`` for additional details.
 ``change`` (removed in 6.0)
 '''''''''''''''''''''''''''
 
-Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.
+Use ``blockdev-change-medium`` or ``change-vnc-password`` or
+``display-update`` instead.
 
 ``query-events`` (removed in 6.0)
 '''''''''''''''''''''''''''''''''
diff --git a/qapi/ui.json b/qapi/ui.json
index 596f37fc37aa..059302a5efcb 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1468,3 +1468,68 @@
 { 'command': 'display-reload',
   'data': 'DisplayReloadOptions',
   'boxed' : true }
+
+##
+# @DisplayUpdateType:
+#
+# Available DisplayUpdate types.
+#
+# @vnc: VNC display
+#
+# Since: 7.1
+#
+##
+{ 'enum': 'DisplayUpdateType',
+  'data': ['vnc'] }
+
+##
+# @DisplayUpdateOptionsVNC:
+#
+# Specify the VNC reload options.
+#
+# @addresses: If specified, change set of addresses
+#             to listen for connections. Addresses configured
+#             for websockets are not touched.
+#
+# Since: 7.1
+#
+##
+{ 'struct': 'DisplayUpdateOptionsVNC',
+  'data': { '*addresses': ['SocketAddress'] } }
+
+##
+# @DisplayUpdateOptions:
+#
+# Options of the display configuration reload.
+#
+# @type: Specify the display type.
+#
+# Since: 7.1
+#
+##
+{ 'union': 'DisplayUpdateOptions',
+  'base': {'type': 'DisplayUpdateType'},
+  'discriminator': 'type',
+  'data': { 'vnc': 'DisplayUpdateOptionsVNC' } }
+
+##
+# @display-update:
+#
+# Update display configuration.
+#
+# Returns: Nothing on success.
+#
+# Since: 7.1
+#
+# Example:
+#
+# -> { "execute": "display-update",
+#      "arguments": { "type": "vnc", "addresses":
+#                     [ { "type": "inet", "host": "0.0.0.0",
+#                         "port": "5901" } ] } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'display-update',
+  'data': 'DisplayUpdateOptions',
+  'boxed' : true }
-- 
2.35.1


