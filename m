Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B37D41AB80
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 11:07:19 +0200 (CEST)
Received: from localhost ([::1]:47900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV954-0001p5-GM
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 05:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mV91h-0006cL-I0
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 05:03:49 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:54580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mV91d-00053U-Mc
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 05:03:49 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 320E142419;
 Tue, 28 Sep 2021 11:03:35 +0200 (CEST)
From: Stefan Reiter <s.reiter@proxmox.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: [PATCH v4 2/2] monitor: refactor set/expire_password and allow VNC
 display id
Date: Tue, 28 Sep 2021 11:03:26 +0200
Message-Id: <20210928090326.1056010-3-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928090326.1056010-1-s.reiter@proxmox.com>
References: <20210928090326.1056010-1-s.reiter@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=s.reiter@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
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

It is possible to specify more than one VNC server on the command line,
either with an explicit ID or the auto-generated ones à la "default",
"vnc2", "vnc3", ...

It is not possible to change the password on one of these extra VNC
displays though. Fix this by adding a "display" parameter to the
"set_password" and "expire_password" QMP and HMP commands.

For HMP, the display is specified using the "-d" value flag.

For QMP, the schema is updated to explicitly express the supported
variants of the commands with protocol-discriminated unions.

Suggested-by: Eric Blake <eblake@redhat.com>
Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---
 hmp-commands.hx    |  24 ++++---
 monitor/hmp-cmds.c |  57 ++++++++++++++-
 monitor/qmp-cmds.c |  62 ++++++----------
 qapi/ui.json       | 173 +++++++++++++++++++++++++++++++++++++--------
 4 files changed, 235 insertions(+), 81 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index cf723c69ac..d78e4cfc47 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1514,33 +1514,35 @@ ERST
 
     {
         .name       = "set_password",
-        .args_type  = "protocol:s,password:s,connected:s?",
-        .params     = "protocol password action-if-connected",
+        .args_type  = "protocol:s,password:s,display:-dS,connected:s?",
+        .params     = "protocol password [-d display] [action-if-connected]",
         .help       = "set spice/vnc password",
         .cmd        = hmp_set_password,
     },
 
 SRST
-``set_password [ vnc | spice ] password [ action-if-connected ]``
-  Change spice/vnc password.  *action-if-connected* specifies what
-  should happen in case a connection is established: *fail* makes the
-  password change fail.  *disconnect* changes the password and
+``set_password [ vnc | spice ] password [ -d display ] [ action-if-connected ]``
+  Change spice/vnc password.  *display* can be used with 'vnc' to specify
+  which display to set the password on.  *action-if-connected* specifies
+  what should happen in case a connection is established: *fail* makes
+  the password change fail.  *disconnect* changes the password and
   disconnects the client.  *keep* changes the password and keeps the
   connection up.  *keep* is the default.
 ERST
 
     {
         .name       = "expire_password",
-        .args_type  = "protocol:s,time:s",
-        .params     = "protocol time",
+        .args_type  = "protocol:s,time:s,display:-dS",
+        .params     = "protocol time [-d display]",
         .help       = "set spice/vnc password expire-time",
         .cmd        = hmp_expire_password,
     },
 
 SRST
-``expire_password [ vnc | spice ]`` *expire-time*
-  Specify when a password for spice/vnc becomes
-  invalid. *expire-time* accepts:
+``expire_password [ vnc | spice ] expire-time [ -d display ]``
+  Specify when a password for spice/vnc becomes invalid.
+  *display* behaves the same as in ``set_password``.
+  *expire-time* accepts:
 
   ``now``
     Invalidate password instantly.
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index b5e71d9e6f..48b3fe4519 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1451,10 +1451,41 @@ void hmp_set_password(Monitor *mon, const QDict *qdict)
 {
     const char *protocol  = qdict_get_str(qdict, "protocol");
     const char *password  = qdict_get_str(qdict, "password");
+    const char *display = qdict_get_try_str(qdict, "display");
     const char *connected = qdict_get_try_str(qdict, "connected");
     Error *err = NULL;
+    DisplayProtocol proto;
 
-    qmp_set_password(protocol, password, !!connected, connected, &err);
+    SetPasswordOptions opts = {
+        .password = g_strdup(password),
+        .u.vnc.display = NULL,
+    };
+
+    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
+                            DISPLAY_PROTOCOL_VNC, &err);
+    if (err) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+    opts.protocol = proto;
+
+    if (proto == DISPLAY_PROTOCOL_VNC) {
+        opts.u.vnc.has_display = !!display;
+        opts.u.vnc.display = g_strdup(display);
+    } else if (proto == DISPLAY_PROTOCOL_SPICE) {
+        opts.u.spice.has_connected = !!connected;
+        opts.u.spice.connected =
+            qapi_enum_parse(&SetPasswordAction_lookup, connected,
+                            SET_PASSWORD_ACTION_KEEP, &err);
+        if (err) {
+            hmp_handle_error(mon, err);
+            return;
+        }
+    }
+
+    qmp_set_password(&opts, &err);
+    g_free(opts.password);
+    g_free(opts.u.vnc.display);
     hmp_handle_error(mon, err);
 }
 
@@ -1462,9 +1493,31 @@ void hmp_expire_password(Monitor *mon, const QDict *qdict)
 {
     const char *protocol  = qdict_get_str(qdict, "protocol");
     const char *whenstr = qdict_get_str(qdict, "time");
+    const char *display = qdict_get_try_str(qdict, "display");
     Error *err = NULL;
+    DisplayProtocol proto;
 
-    qmp_expire_password(protocol, whenstr, &err);
+    ExpirePasswordOptions opts = {
+        .time = g_strdup(whenstr),
+        .u.vnc.display = NULL,
+    };
+
+    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
+                            DISPLAY_PROTOCOL_VNC, &err);
+    if (err) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+    opts.protocol = proto;
+
+    if (proto == DISPLAY_PROTOCOL_VNC) {
+        opts.u.vnc.has_display = !!display;
+        opts.u.vnc.display = g_strdup(display);
+    }
+
+    qmp_expire_password(&opts, &err);
+    g_free(opts.time);
+    g_free(opts.u.vnc.display);
     hmp_handle_error(mon, err);
 }
 
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 5c0d5e116b..cb229c01f8 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -163,45 +163,30 @@ void qmp_system_wakeup(Error **errp)
     qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, errp);
 }
 
-void qmp_set_password(const char *protocol, const char *password,
-                      bool has_connected, const char *connected, Error **errp)
+void qmp_set_password(SetPasswordOptions *opts, Error **errp)
 {
-    int disconnect_if_connected = 0;
-    int fail_if_connected = 0;
-    int rc;
+    bool disconnect_if_connected = false;
+    bool fail_if_connected = false;
+    int rc = 0;
 
-    if (has_connected) {
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
-    }
-
-    if (strcmp(protocol, "spice") == 0) {
+    if (opts->protocol == DISPLAY_PROTOCOL_SPICE) {
         if (!qemu_using_spice(errp)) {
             return;
         }
-        rc = qemu_spice.set_passwd(password, fail_if_connected,
-                                   disconnect_if_connected);
-    } else if (strcmp(protocol, "vnc") == 0) {
-        if (fail_if_connected || disconnect_if_connected) {
-            /* vnc supports "connected=keep" only */
-            error_setg(errp, QERR_INVALID_PARAMETER, "connected");
-            return;
+        if (opts->u.spice.has_connected) {
+            fail_if_connected =
+                opts->u.spice.connected == SET_PASSWORD_ACTION_FAIL;
+            disconnect_if_connected =
+                opts->u.spice.connected == SET_PASSWORD_ACTION_DISCONNECT;
         }
+        rc = qemu_spice.set_passwd(opts->password, fail_if_connected,
+                                   disconnect_if_connected);
+    } else if (opts->protocol == DISPLAY_PROTOCOL_VNC) {
         /* Note that setting an empty password will not disable login through
          * this interface. */
-        rc = vnc_display_password(NULL, password);
-    } else {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "protocol",
-                   "'vnc' or 'spice'");
-        return;
+        rc = vnc_display_password(
+                opts->u.vnc.has_display ? opts->u.vnc.display : NULL,
+                opts->password);
     }
 
     if (rc != 0) {
@@ -209,11 +194,11 @@ void qmp_set_password(const char *protocol, const char *password,
     }
 }
 
-void qmp_expire_password(const char *protocol, const char *whenstr,
-                         Error **errp)
+void qmp_expire_password(ExpirePasswordOptions *opts, Error **errp)
 {
     time_t when;
     int rc;
+    const char* whenstr = opts->time;
 
     if (strcmp(whenstr, "now") == 0) {
         when = 0;
@@ -225,17 +210,14 @@ void qmp_expire_password(const char *protocol, const char *whenstr,
         when = strtoull(whenstr, NULL, 10);
     }
 
-    if (strcmp(protocol, "spice") == 0) {
+    if (opts->protocol == DISPLAY_PROTOCOL_SPICE) {
         if (!qemu_using_spice(errp)) {
             return;
         }
         rc = qemu_spice.set_pw_expire(when);
-    } else if (strcmp(protocol, "vnc") == 0) {
-        rc = vnc_display_pw_expire(NULL, when);
-    } else {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "protocol",
-                   "'vnc' or 'spice'");
-        return;
+    } else if (opts->protocol == DISPLAY_PROTOCOL_VNC) {
+        rc = vnc_display_pw_expire(
+                opts->u.vnc.has_display ? opts->u.vnc.display : NULL, when);
     }
 
     if (rc != 0) {
diff --git a/qapi/ui.json b/qapi/ui.json
index d7567ac866..4244c62c30 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -9,22 +9,23 @@
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
 ##
 # @set_password:
 #
 # Sets the password of a remote display session.
 #
-# @protocol: - 'vnc' to modify the VNC server password
-#            - 'spice' to modify the Spice server password
-#
-# @password: the new password
-#
-# @connected: how to handle existing clients when changing the
-#             password.  If nothing is specified, defaults to 'keep'
-#             'fail' to fail the command if clients are connected
-#             'disconnect' to disconnect existing clients
-#             'keep' to maintain existing clients
-#
 # Returns: - Nothing on success
 #          - If Spice is not enabled, DeviceNotFound
 #
@@ -37,33 +38,106 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'set_password',
-  'data': {'protocol': 'str', 'password': 'str', '*connected': 'str'} }
+{ 'command': 'set_password', 'boxed': true, 'data': 'SetPasswordOptions' }
+
+##
+# @SetPasswordOptions:
+#
+# Data required to set a new password on a display server protocol.
+#
+# @protocol: - 'vnc' to modify the VNC server password
+#            - 'spice' to modify the Spice server password
+#
+# @password: the new password
+#
+# Since: 6.2
+#
+##
+{ 'union': 'SetPasswordOptions',
+  'base': { 'protocol': 'DisplayProtocol',
+            'password': 'str' },
+  'discriminator': 'protocol',
+  'data': { 'vnc': 'SetPasswordOptionsVnc',
+            'spice': 'SetPasswordOptionsSpice' } }
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
+##
+# @SetPasswordActionVnc:
+#
+# See @SetPasswordAction. VNC only supports the keep action. 'connection'
+# should just be omitted for VNC, this is kept for backwards compatibility.
+#
+# @keep: maintain existing clients
+#
+# Since: 6.2
+#
+##
+{ 'enum': 'SetPasswordActionVnc',
+  'data': [ 'keep' ] }
+
+##
+# @SetPasswordOptionsSpice:
+#
+# Options for set_password specific to the VNC procotol.
+#
+# @connected: How to handle existing clients when changing the
+#             password. If nothing is specified, defaults to 'keep'.
+#
+# Since: 6.2
+#
+##
+{ 'struct': 'SetPasswordOptionsSpice',
+  'data': { '*connected': 'SetPasswordAction' } }
+
+##
+# @SetPasswordOptionsVnc:
+#
+# Options for set_password specific to the VNC procotol.
+#
+# @display: The id of the display where the password should be changed.
+#           Defaults to the first.
+#
+# @connected: How to handle existing clients when changing the
+#             password.
+#
+# Features:
+# @deprecated: For VNC, @connected will always be 'keep', parameter should be
+#              omitted.
+#
+# Since: 6.2
+#
+##
+{ 'struct': 'SetPasswordOptionsVnc',
+  'data': { '*display': 'str',
+            '*connected': { 'type': 'SetPasswordActionVnc',
+                            'features': ['deprecated'] } } }
 
 ##
 # @expire_password:
 #
 # Expire the password of a remote display server.
 #
-# @protocol: the name of the remote display protocol 'vnc' or 'spice'
-#
-# @time: when to expire the password.
-#
-#        - 'now' to expire the password immediately
-#        - 'never' to cancel password expiration
-#        - '+INT' where INT is the number of seconds from now (integer)
-#        - 'INT' where INT is the absolute time in seconds
-#
 # Returns: - Nothing on success
 #          - If @protocol is 'spice' and Spice is not active, DeviceNotFound
 #
 # Since: 0.14
 #
-# Notes: Time is relative to the server and currently there is no way to
-#        coordinate server time with client time.  It is not recommended to
-#        use the absolute time version of the @time parameter unless you're
-#        sure you are on the same machine as the QEMU instance.
-#
 # Example:
 #
 # -> { "execute": "expire_password", "arguments": { "protocol": "vnc",
@@ -71,7 +145,50 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'expire_password', 'data': {'protocol': 'str', 'time': 'str'} }
+{ 'command': 'expire_password', 'boxed': true, 'data': 'ExpirePasswordOptions' }
+
+##
+# @ExpirePasswordOptions:
+#
+# Data required to set password expiration on a display server protocol.
+#
+# @protocol: - 'vnc' to modify the VNC server expiration
+#            - 'spice' to modify the Spice server expiration
+
+# @time: when to expire the password.
+#
+#        - 'now' to expire the password immediately
+#        - 'never' to cancel password expiration
+#        - '+INT' where INT is the number of seconds from now (integer)
+#        - 'INT' where INT is the absolute time in seconds
+#
+# Notes: Time is relative to the server and currently there is no way to
+#        coordinate server time with client time.  It is not recommended to
+#        use the absolute time version of the @time parameter unless you're
+#        sure you are on the same machine as the QEMU instance.
+#
+# Since: 6.2
+#
+##
+{ 'union': 'ExpirePasswordOptions',
+  'base': { 'protocol': 'DisplayProtocol',
+            'time': 'str' },
+  'discriminator': 'protocol',
+  'data': { 'vnc': 'ExpirePasswordOptionsVnc' } }
+
+##
+# @ExpirePasswordOptionsVnc:
+#
+# Options for expire_password specific to the VNC procotol.
+#
+# @display: The id of the display where the expiration should be changed.
+#           Defaults to the first.
+#
+# Since: 6.2
+#
+##
+{ 'struct': 'ExpirePasswordOptionsVnc',
+  'data': { '*display': 'str' } }
 
 ##
 # @screendump:
-- 
2.30.2



