Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE715434CD6
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 15:57:18 +0200 (CEST)
Received: from localhost ([::1]:38228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdC5l-0000RU-U4
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 09:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mdC3s-00079W-JN
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:55:20 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:1826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mdC3o-0006uY-Tv
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:55:20 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 13E8E4691E;
 Wed, 20 Oct 2021 15:55:14 +0200 (CEST)
From: Stefan Reiter <s.reiter@proxmox.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: [PATCH v6 2/5] qapi/monitor: refactor set/expire_password with enums
Date: Wed, 20 Oct 2021 15:54:57 +0200
Message-Id: <20211020135500.2384930-3-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211020135500.2384930-1-s.reiter@proxmox.com>
References: <20211020135500.2384930-1-s.reiter@proxmox.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=s.reiter@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'protocol' and 'connected' are better suited as enums than as strings,
make use of that. No functional change intended.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---
 monitor/hmp-cmds.c | 29 +++++++++++++++++++++++++++--
 monitor/qmp-cmds.c | 37 ++++++++++++-------------------------
 qapi/ui.json       | 37 +++++++++++++++++++++++++++++++++++--
 3 files changed, 74 insertions(+), 29 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index bcaa41350e..b8abe69609 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1453,8 +1453,24 @@ void hmp_set_password(Monitor *mon, const QDict *qdict)
     const char *password  = qdict_get_str(qdict, "password");
     const char *connected = qdict_get_try_str(qdict, "connected");
     Error *err = NULL;
+    DisplayProtocol proto;
+    SetPasswordAction conn;
 
-    qmp_set_password(protocol, password, !!connected, connected, &err);
+    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
+                            DISPLAY_PROTOCOL_VNC, &err);
+    if (err) {
+        goto out;
+    }
+
+    conn = qapi_enum_parse(&SetPasswordAction_lookup, connected,
+                           SET_PASSWORD_ACTION_KEEP, &err);
+    if (err) {
+        goto out;
+    }
+
+    qmp_set_password(proto, password, !!connected, conn, &err);
+
+out:
     hmp_handle_error(mon, err);
 }
 
@@ -1463,8 +1479,17 @@ void hmp_expire_password(Monitor *mon, const QDict *qdict)
     const char *protocol  = qdict_get_str(qdict, "protocol");
     const char *whenstr = qdict_get_str(qdict, "time");
     Error *err = NULL;
+    DisplayProtocol proto;
 
-    qmp_expire_password(protocol, whenstr, &err);
+    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
+                            DISPLAY_PROTOCOL_VNC, &err);
+    if (err) {
+        goto out;
+    }
+
+    qmp_expire_password(proto, whenstr, &err);
+
+out:
     hmp_handle_error(mon, err);
 }
 
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 5c0d5e116b..0654d7289a 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -163,33 +163,27 @@ void qmp_system_wakeup(Error **errp)
     qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, errp);
 }
 
-void qmp_set_password(const char *protocol, const char *password,
-                      bool has_connected, const char *connected, Error **errp)
+void qmp_set_password(DisplayProtocol protocol, const char *password,
+                      bool has_connected, SetPasswordAction connected,
+                      Error **errp)
 {
     int disconnect_if_connected = 0;
     int fail_if_connected = 0;
     int rc;
 
     if (has_connected) {
-        if (strcmp(connected, "fail") == 0) {
-            fail_if_connected = 1;
-        } else if (strcmp(connected, "disconnect") == 0) {
-            disconnect_if_connected = 1;
-        } else if (strcmp(connected, "keep") == 0) {
-            /* nothing */
-        } else {
-            error_setg(errp, QERR_INVALID_PARAMETER, "connected");
-            return;
-        }
+        fail_if_connected = connected == SET_PASSWORD_ACTION_FAIL;
+        disconnect_if_connected = connected == SET_PASSWORD_ACTION_DISCONNECT;
     }
 
-    if (strcmp(protocol, "spice") == 0) {
+    if (protocol == DISPLAY_PROTOCOL_SPICE) {
         if (!qemu_using_spice(errp)) {
             return;
         }
         rc = qemu_spice.set_passwd(password, fail_if_connected,
                                    disconnect_if_connected);
-    } else if (strcmp(protocol, "vnc") == 0) {
+    } else {
+        assert(protocol == DISPLAY_PROTOCOL_VNC);
         if (fail_if_connected || disconnect_if_connected) {
             /* vnc supports "connected=keep" only */
             error_setg(errp, QERR_INVALID_PARAMETER, "connected");
@@ -198,10 +192,6 @@ void qmp_set_password(const char *protocol, const char *password,
         /* Note that setting an empty password will not disable login through
          * this interface. */
         rc = vnc_display_password(NULL, password);
-    } else {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "protocol",
-                   "'vnc' or 'spice'");
-        return;
     }
 
     if (rc != 0) {
@@ -209,7 +199,7 @@ void qmp_set_password(const char *protocol, const char *password,
     }
 }
 
-void qmp_expire_password(const char *protocol, const char *whenstr,
+void qmp_expire_password(DisplayProtocol protocol, const char *whenstr,
                          Error **errp)
 {
     time_t when;
@@ -225,17 +215,14 @@ void qmp_expire_password(const char *protocol, const char *whenstr,
         when = strtoull(whenstr, NULL, 10);
     }
 
-    if (strcmp(protocol, "spice") == 0) {
+    if (protocol == DISPLAY_PROTOCOL_SPICE) {
         if (!qemu_using_spice(errp)) {
             return;
         }
         rc = qemu_spice.set_pw_expire(when);
-    } else if (strcmp(protocol, "vnc") == 0) {
-        rc = vnc_display_pw_expire(NULL, when);
     } else {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "protocol",
-                   "'vnc' or 'spice'");
-        return;
+        assert(protocol == DISPLAY_PROTOCOL_VNC);
+        rc = vnc_display_pw_expire(NULL, when);
     }
 
     if (rc != 0) {
diff --git a/qapi/ui.json b/qapi/ui.json
index d7567ac866..15cc19dcc5 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -9,6 +9,35 @@
 { 'include': 'common.json' }
 { 'include': 'sockets.json' }
 
+##
+# @DisplayProtocol:
+#
+# Display protocols which support changing password options.
+#
+# Since: 6.2
+#
+##
+{ 'enum': 'DisplayProtocol',
+  'data': [ { 'name': 'vnc', 'if': 'CONFIG_VNC' },
+            { 'name': 'spice', 'if': 'CONFIG_SPICE' } ] }
+
+##
+# @SetPasswordAction:
+#
+# An action to take on changing a password on a connection with active clients.
+#
+# @fail: fail the command if clients are connected
+#
+# @disconnect: disconnect existing clients
+#
+# @keep: maintain existing clients
+#
+# Since: 6.2
+#
+##
+{ 'enum': 'SetPasswordAction',
+  'data': [ 'fail', 'disconnect', 'keep' ] }
+
 ##
 # @set_password:
 #
@@ -38,7 +67,9 @@
 #
 ##
 { 'command': 'set_password',
-  'data': {'protocol': 'str', 'password': 'str', '*connected': 'str'} }
+  'data': { 'protocol': 'DisplayProtocol',
+            'password': 'str',
+            '*connected': 'SetPasswordAction' } }
 
 ##
 # @expire_password:
@@ -71,7 +102,9 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'expire_password', 'data': {'protocol': 'str', 'time': 'str'} }
+{ 'command': 'expire_password',
+  'data': { 'protocol': 'DisplayProtocol',
+            'time': 'str' } }
 
 ##
 # @screendump:
-- 
2.30.2



