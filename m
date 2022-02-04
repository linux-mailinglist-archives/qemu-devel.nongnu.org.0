Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A69D4A97EB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 11:37:01 +0100 (CET)
Received: from localhost ([::1]:33540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFvxc-0001Ru-8H
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 05:37:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nFvaE-000773-H4
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 05:12:50 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:59540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nFva9-0002Ch-Ci
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 05:12:50 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 14B304557D;
 Fri,  4 Feb 2022 11:12:34 +0100 (CET)
From: Fabian Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 3/3] qapi/monitor: allow VNC display id in
 set/expire_password
Date: Fri,  4 Feb 2022 11:12:20 +0100
Message-Id: <20220204101220.343526-4-f.ebner@proxmox.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204101220.343526-1-f.ebner@proxmox.com>
References: <20220204101220.343526-1-f.ebner@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: w.bumiller@proxmox.com, berrange@redhat.com, dgilbert@redhat.com,
 armbru@redhat.com, marcandre.lureau@gmail.com, kraxel@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, eblake@redhat.com,
 t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Reiter <s.reiter@proxmox.com>

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
[FE: update "Since: " from 6.2 to 7.0
     set {has_}connected for VNC in hmp_set_password]
Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
---

v7 -> v8:
* add missing # in the description for @ExpirePasswordOptions
* other changes are already mentioned above

 hmp-commands.hx    |  24 +++++-----
 monitor/hmp-cmds.c |  39 ++++++++++++----
 monitor/qmp-cmds.c |  34 ++++++--------
 qapi/ui.json       | 110 ++++++++++++++++++++++++++++++++++++---------
 4 files changed, 145 insertions(+), 62 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 70a9136ac2..cc2f4bdeba 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1514,33 +1514,35 @@ ERST
 
     {
         .name       = "set_password",
-        .args_type  = "protocol:s,password:s,connected:s?",
-        .params     = "protocol password action-if-connected",
+        .args_type  = "protocol:s,password:s,display:-dV,connected:s?",
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
+        .args_type  = "protocol:s,time:s,display:-dV",
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
index ff78741b75..be0d919b64 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1396,13 +1396,17 @@ void hmp_set_password(Monitor *mon, const QDict *qdict)
 {
     const char *protocol  = qdict_get_str(qdict, "protocol");
     const char *password  = qdict_get_str(qdict, "password");
+    const char *display = qdict_get_try_str(qdict, "display");
     const char *connected = qdict_get_try_str(qdict, "connected");
     Error *err = NULL;
-    DisplayProtocol proto;
     SetPasswordAction conn;
 
-    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
-                            DISPLAY_PROTOCOL_VNC, &err);
+    SetPasswordOptions opts = {
+        .password = (char *)password,
+    };
+
+    opts.protocol = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
+                                    DISPLAY_PROTOCOL_VNC, &err);
     if (err) {
         goto out;
     }
@@ -1413,7 +1417,17 @@ void hmp_set_password(Monitor *mon, const QDict *qdict)
         goto out;
     }
 
-    qmp_set_password(proto, password, !!connected, conn, &err);
+    if (opts.protocol == DISPLAY_PROTOCOL_VNC) {
+        opts.u.vnc.has_display = !!display;
+        opts.u.vnc.display = (char *)display;
+        opts.u.vnc.has_connected = !!connected;
+        opts.u.vnc.connected = conn;
+    } else if (opts.protocol == DISPLAY_PROTOCOL_SPICE) {
+        opts.u.spice.has_connected = !!connected;
+        opts.u.spice.connected = conn;
+    }
+
+    qmp_set_password(&opts, &err);
 
 out:
     hmp_handle_error(mon, err);
@@ -1423,16 +1437,25 @@ void hmp_expire_password(Monitor *mon, const QDict *qdict)
 {
     const char *protocol  = qdict_get_str(qdict, "protocol");
     const char *whenstr = qdict_get_str(qdict, "time");
+    const char *display = qdict_get_try_str(qdict, "display");
     Error *err = NULL;
-    DisplayProtocol proto;
 
-    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
-                            DISPLAY_PROTOCOL_VNC, &err);
+    ExpirePasswordOptions opts = {
+        .time = (char *)whenstr,
+    };
+
+    opts.protocol = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
+                                    DISPLAY_PROTOCOL_VNC, &err);
     if (err) {
         goto out;
     }
 
-    qmp_expire_password(proto, whenstr, &err);
+    if (opts.protocol == DISPLAY_PROTOCOL_VNC) {
+        opts.u.vnc.has_display = !!display;
+        opts.u.vnc.display = (char *)display;
+    }
+
+    qmp_expire_password(&opts, &err);
 
 out:
     hmp_handle_error(mon, err);
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index b6e8b57fcc..37db941fd3 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -168,35 +168,27 @@ void qmp_system_wakeup(Error **errp)
     qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, errp);
 }
 
-void qmp_set_password(DisplayProtocol protocol, const char *password,
-                      bool has_connected, SetPasswordAction connected,
-                      Error **errp)
+void qmp_set_password(SetPasswordOptions *opts, Error **errp)
 {
-    int disconnect_if_connected = 0;
-    int fail_if_connected = 0;
     int rc;
 
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
-                                   disconnect_if_connected);
+        rc = qemu_spice.set_passwd(opts->password,
+                opts->u.spice.connected == SET_PASSWORD_ACTION_FAIL,
+                opts->u.spice.connected == SET_PASSWORD_ACTION_DISCONNECT);
     } else {
-        assert(protocol == DISPLAY_PROTOCOL_VNC);
-        if (fail_if_connected || disconnect_if_connected) {
+        assert(opts->protocol == DISPLAY_PROTOCOL_VNC);
+        if (opts->u.vnc.connected != SET_PASSWORD_ACTION_KEEP) {
             /* vnc supports "connected=keep" only */
             error_setg(errp, QERR_INVALID_PARAMETER, "connected");
             return;
         }
         /* Note that setting an empty password will not disable login through
          * this interface. */
-        rc = vnc_display_password(NULL, password);
+        rc = vnc_display_password(opts->u.vnc.display, opts->password);
     }
 
     if (rc != 0) {
@@ -204,11 +196,11 @@ void qmp_set_password(DisplayProtocol protocol, const char *password,
     }
 }
 
-void qmp_expire_password(DisplayProtocol protocol, const char *whenstr,
-                         Error **errp)
+void qmp_expire_password(ExpirePasswordOptions *opts, Error **errp)
 {
     time_t when;
     int rc;
+    const char *whenstr = opts->time;
 
     if (strcmp(whenstr, "now") == 0) {
         when = 0;
@@ -220,14 +212,14 @@ void qmp_expire_password(DisplayProtocol protocol, const char *whenstr,
         when = strtoull(whenstr, NULL, 10);
     }
 
-    if (protocol == DISPLAY_PROTOCOL_SPICE) {
+    if (opts->protocol == DISPLAY_PROTOCOL_SPICE) {
         if (!qemu_using_spice(errp)) {
             return;
         }
         rc = qemu_spice.set_pw_expire(when);
     } else {
-        assert(protocol == DISPLAY_PROTOCOL_VNC);
-        rc = vnc_display_pw_expire(NULL, when);
+        assert(opts->protocol == DISPLAY_PROTOCOL_VNC);
+        rc = vnc_display_pw_expire(opts->u.vnc.display, when);
     }
 
     if (rc != 0) {
diff --git a/qapi/ui.json b/qapi/ui.json
index e112409211..089f05c702 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -38,20 +38,61 @@
   'data': [ 'keep', 'fail', 'disconnect' ] }
 
 ##
-# @set_password:
+# @SetPasswordOptions:
 #
-# Sets the password of a remote display session.
+# General options for set_password.
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
+# Since: 7.0
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
+# Since: 7.0
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
+# Since: 7.0
+#
+##
+{ 'struct': 'SetPasswordOptionsVnc',
+  'data': { '*display': 'str',
+            '*connected': 'SetPasswordAction' }}
+
+##
+# @set_password:
+#
+# Set the password of a remote display server.
 #
 # Returns: - Nothing on success
 #          - If Spice is not enabled, DeviceNotFound
@@ -65,17 +106,15 @@
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
+# General options for expire_password.
 #
-# @protocol: the name of the remote display protocol 'vnc' or 'spice'
+# @protocol: - 'vnc' to modify the VNC server expiration
+#            - 'spice' to modify the Spice server expiration
 #
 # @time: when to expire the password.
 #
@@ -84,16 +123,45 @@
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
+# Since: 7.0
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
+# Since: 7.0
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
@@ -101,9 +169,7 @@
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



