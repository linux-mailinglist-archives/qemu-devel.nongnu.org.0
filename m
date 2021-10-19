Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F84433D0E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:10:29 +0200 (CEST)
Received: from localhost ([::1]:54994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcsdB-0003Bn-4c
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mcrSI-00044a-Eu
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:55:10 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:35250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mcrSD-0002LS-PK
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:55:10 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 5E9A646907;
 Tue, 19 Oct 2021 17:54:56 +0200 (CEST)
From: Stefan Reiter <s.reiter@proxmox.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: [PATCH v5 3/4] qapi/monitor: allow VNC display id in
 set/expire_password
Date: Tue, 19 Oct 2021 17:54:42 +0200
Message-Id: <20211019155443.1447372-4-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211019155443.1447372-1-s.reiter@proxmox.com>
References: <20211019155443.1447372-1-s.reiter@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

It is possible to specify more than one VNC server on the command line,
either with an explicit ID or the auto-generated ones à la "default",
"vnc2", "vnc3", ...

It is not possible to change the password on one of these extra VNC
displays though. Fix this by adding a "display" parameter to the
"set_password" and "expire_password" QMP and HMP commands.

For HMP, the display is specified using the "-d" value flag.

For QMP, the schema is updated to explicitly express the supported
variants of the commands with protocol-discriminated unions.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---
 hmp-commands.hx    |  24 +++++-----
 monitor/hmp-cmds.c |  51 ++++++++++++++++++---
 monitor/qmp-cmds.c |  44 +++++++++---------
 qapi/ui.json       | 112 +++++++++++++++++++++++++++++++++++----------
 4 files changed, 170 insertions(+), 61 deletions(-)

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
index 0ff18ebb3c..79549596e4 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1451,19 +1451,40 @@ void hmp_set_password(Monitor *mon, const QDict *qdict)
 {
     const char *protocol  = qdict_get_str(qdict, "protocol");
     const char *password  = qdict_get_str(qdict, "password");
+    const char *display = qdict_get_try_str(qdict, "display");
     const char *connected = qdict_get_try_str(qdict, "connected");
     Error *err = NULL;
     DisplayProtocol proto;
-    SetPasswordAction conn;
+
+    SetPasswordOptions opts = {
+        .password = g_strdup(password),
+        .u.vnc.display = NULL,
+    };
 
     proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
                             DISPLAY_PROTOCOL_VNC, &err);
-    if (!!connected) {
-        conn = qapi_enum_parse(&SetPasswordAction_lookup, connected,
-                               SET_PASSWORD_ACTION_KEEP, &err);
+    if (err) {
+        goto out;
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
+            goto out;
+        }
     }
 
-    qmp_set_password(proto, password, !!connected, conn, &err);
+    qmp_set_password(&opts, &err);
+
+out:
+    qapi_free_SetPasswordOptions(&opts);
     hmp_handle_error(mon, err);
 }
 
@@ -1471,13 +1492,31 @@ void hmp_expire_password(Monitor *mon, const QDict *qdict)
 {
     const char *protocol  = qdict_get_str(qdict, "protocol");
     const char *whenstr = qdict_get_str(qdict, "time");
+    const char *display = qdict_get_try_str(qdict, "display");
     Error *err = NULL;
     DisplayProtocol proto;
 
+    ExpirePasswordOptions opts = {
+        .time = g_strdup(whenstr),
+        .u.vnc.display = NULL,
+    };
+
     proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
                             DISPLAY_PROTOCOL_VNC, &err);
+    if (err) {
+        goto out;
+    }
+    opts.protocol = proto;
 
-    qmp_expire_password(proto, whenstr, &err);
+    if (proto == DISPLAY_PROTOCOL_VNC) {
+        opts.u.vnc.has_display = !!display;
+        opts.u.vnc.display = g_strdup(display);
+    }
+
+    qmp_expire_password(&opts, &err);
+
+out:
+    qapi_free_ExpirePasswordOptions(&opts);
     hmp_handle_error(mon, err);
 }
 
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index f1746a31fb..b0630d00ab 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -163,34 +163,35 @@ void qmp_system_wakeup(Error **errp)
     qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, errp);
 }
 
-void qmp_set_password(DisplayProtocol protocol, const char *password,
-                      bool has_connected, SetPasswordAction connected,
-                      Error **errp)
+void qmp_set_password(SetPasswordOptions *opts, Error **errp)
 {
-    int disconnect_if_connected = 0;
-    int fail_if_connected = 0;
-    int rc;
+    bool disconnect_if_connected = false;
+    bool fail_if_connected = false;
+    int rc = 0;
 
-    if (has_connected) {
-        fail_if_connected = connected == SET_PASSWORD_ACTION_FAIL;
-        disconnect_if_connected = connected == SET_PASSWORD_ACTION_DISCONNECT;
-    }
-
-    if (protocol == DISPLAY_PROTOCOL_SPICE) {
+    if (opts->protocol == DISPLAY_PROTOCOL_SPICE) {
         if (!qemu_using_spice(errp)) {
             return;
         }
-        rc = qemu_spice.set_passwd(password, fail_if_connected,
+        if (opts->u.spice.has_connected) {
+            fail_if_connected =
+                opts->u.spice.connected == SET_PASSWORD_ACTION_FAIL;
+            disconnect_if_connected =
+                opts->u.spice.connected == SET_PASSWORD_ACTION_DISCONNECT;
+        }
+        rc = qemu_spice.set_passwd(opts->password, fail_if_connected,
                                    disconnect_if_connected);
-    } else if (protocol == DISPLAY_PROTOCOL_VNC) {
-        if (fail_if_connected || disconnect_if_connected) {
+    } else if (opts->protocol == DISPLAY_PROTOCOL_VNC) {
+        if (opts->u.vnc.connected != SET_PASSWORD_ACTION_KEEP) {
             /* vnc supports "connected=keep" only */
             error_setg(errp, QERR_INVALID_PARAMETER, "connected");
             return;
         }
         /* Note that setting an empty password will not disable login through
          * this interface. */
-        rc = vnc_display_password(NULL, password);
+        rc = vnc_display_password(
+                opts->u.vnc.has_display ? opts->u.vnc.display : NULL,
+                opts->password);
     }
 
     if (rc != 0) {
@@ -198,11 +199,11 @@ void qmp_set_password(DisplayProtocol protocol, const char *password,
     }
 }
 
-void qmp_expire_password(DisplayProtocol protocol, const char *whenstr,
-                         Error **errp)
+void qmp_expire_password(ExpirePasswordOptions *opts, Error **errp)
 {
     time_t when;
     int rc;
+    const char* whenstr = opts->time;
 
     if (strcmp(whenstr, "now") == 0) {
         when = 0;
@@ -214,13 +215,14 @@ void qmp_expire_password(DisplayProtocol protocol, const char *whenstr,
         when = strtoull(whenstr, NULL, 10);
     }
 
-    if (protocol == DISPLAY_PROTOCOL_SPICE) {
+    if (opts->protocol == DISPLAY_PROTOCOL_SPICE) {
         if (!qemu_using_spice(errp)) {
             return;
         }
         rc = qemu_spice.set_pw_expire(when);
-    } else if (protocol == DISPLAY_PROTOCOL_VNC) {
-        rc = vnc_display_pw_expire(NULL, when);
+    } else if (opts->protocol == DISPLAY_PROTOCOL_VNC) {
+        rc = vnc_display_pw_expire(
+                opts->u.vnc.has_display ? opts->u.vnc.display : NULL, when);
     }
 
     if (rc != 0) {
diff --git a/qapi/ui.json b/qapi/ui.json
index 15cc19dcc5..17939d0dda 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -39,20 +39,61 @@
   'data': [ 'fail', 'disconnect', 'keep' ] }
 
 ##
-# @set_password:
+# @SetPasswordOptions:
 #
-# Sets the password of a remote display session.
+# Data required to set a new password on a display server protocol.
 #
 # @protocol: - 'vnc' to modify the VNC server password
 #            - 'spice' to modify the Spice server password
 #
 # @password: the new password
 #
-# @connected: how to handle existing clients when changing the
-#             password.  If nothing is specified, defaults to 'keep'
-#             'fail' to fail the command if clients are connected
-#             'disconnect' to disconnect existing clients
-#             'keep' to maintain existing clients
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
+# @SetPasswordOptionsSpice:
+#
+# Options for set_password specific to the SPICE procotol.
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
+# Since: 6.2
+#
+##
+{ 'struct': 'SetPasswordOptionsVnc',
+  'data': { '*display': 'str',
+            '*connected': 'SetPasswordAction' }}
+
+##
+# @set_password:
+#
+# Sets the password of a remote display session.
 #
 # Returns: - Nothing on success
 #          - If Spice is not enabled, DeviceNotFound
@@ -66,18 +107,16 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'set_password',
-  'data': { 'protocol': 'DisplayProtocol',
-            'password': 'str',
-            '*connected': 'SetPasswordAction' } }
+{ 'command': 'set_password', 'boxed': true, 'data': 'SetPasswordOptions' }
 
 ##
-# @expire_password:
+# @ExpirePasswordOptions:
 #
-# Expire the password of a remote display server.
-#
-# @protocol: the name of the remote display protocol 'vnc' or 'spice'
+# Data required to set password expiration on a display server protocol.
 #
+# @protocol: - 'vnc' to modify the VNC server expiration
+#            - 'spice' to modify the Spice server expiration
+
 # @time: when to expire the password.
 #
 #        - 'now' to expire the password immediately
@@ -85,16 +124,45 @@
 #        - '+INT' where INT is the number of seconds from now (integer)
 #        - 'INT' where INT is the absolute time in seconds
 #
-# Returns: - Nothing on success
-#          - If @protocol is 'spice' and Spice is not active, DeviceNotFound
-#
-# Since: 0.14
-#
 # Notes: Time is relative to the server and currently there is no way to
 #        coordinate server time with client time.  It is not recommended to
 #        use the absolute time version of the @time parameter unless you're
 #        sure you are on the same machine as the QEMU instance.
 #
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
+
+{ 'struct': 'ExpirePasswordOptionsVnc',
+  'data': { '*display': 'str' } }
+
+##
+# @expire_password:
+#
+# Expire the password of a remote display server.
+#
+# Returns: - Nothing on success
+#          - If @protocol is 'spice' and Spice is not active, DeviceNotFound
+#
+# Since: 0.14
+#
 # Example:
 #
 # -> { "execute": "expire_password", "arguments": { "protocol": "vnc",
@@ -102,9 +170,7 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'expire_password',
-  'data': { 'protocol': 'DisplayProtocol',
-            'time': 'str' } }
+{ 'command': 'expire_password', 'boxed': true, 'data': 'ExpirePasswordOptions' }
 
 ##
 # @screendump:
-- 
2.30.2



