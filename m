Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B36C3F720D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 11:39:58 +0200 (CEST)
Received: from localhost ([::1]:51534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIpO1-0005lL-6x
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 05:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mIpLe-0002C6-0e
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 05:37:30 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:46946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mIpLb-0007SF-P8
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 05:37:29 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id E014D4042F;
 Wed, 25 Aug 2021 11:37:15 +0200 (CEST)
From: Stefan Reiter <s.reiter@proxmox.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: [PATCH 2/2] monitor: allow VNC related QMP and HMP commands to take a
 display ID
Date: Wed, 25 Aug 2021 11:37:01 +0200
Message-Id: <20210825093701.668122-3-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825093701.668122-1-s.reiter@proxmox.com>
References: <20210825093701.668122-1-s.reiter@proxmox.com>
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
'set_password' and 'expire_password' QMP and HMP commands.

For HMP, this is a bit trickier, since at least 'set_password' already
has the 'connected' parameter following the mandatory 'password' one, so
we need to prefix the display ID with "id=" to allow correct parsing.

With this prefix, no existing command or workflow should be affected.

While rewriting the descriptions, also remove the line "Use zero to make
the password stay valid forever." from 'set_password', I believe this was
intended for 'expire_password', but would even be wrong there.

Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---
 hmp-commands.hx    | 28 +++++++++++++++-------------
 monitor/hmp-cmds.c | 20 ++++++++++++++++++--
 monitor/qmp-cmds.c |  9 +++++----
 qapi/ui.json       | 12 ++++++++++--
 4 files changed, 48 insertions(+), 21 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index e01ca13ca8..0b5abcfb8a 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1541,34 +1541,36 @@ ERST
 
     {
         .name       = "set_password",
-        .args_type  = "protocol:s,password:s,connected:s?",
-        .params     = "protocol password action-if-connected",
+        .args_type  = "protocol:s,password:s,display:s?,connected:s?",
+        .params     = "protocol password [id=display] [action-if-connected]",
         .help       = "set spice/vnc password",
         .cmd        = hmp_set_password,
     },
 
 SRST
-``set_password [ vnc | spice ] password [ action-if-connected ]``
-  Change spice/vnc password.  Use zero to make the password stay valid
-  forever.  *action-if-connected* specifies what should happen in
+``set_password [ vnc | spice ] password [ id=display ] [ action-if-connected ]``
+  Change spice/vnc password.  *display* (must be prefixed with
+  'id=') can be used with 'vnc' to specify which display to set the
+  password on.  *action-if-connected* specifies what should happen in
   case a connection is established: *fail* makes the password change
-  fail.  *disconnect* changes the password and disconnects the
-  client.  *keep* changes the password and keeps the connection up.
-  *keep* is the default.
+  fail.  *disconnect* changes the password and disconnects the client.
+  *keep* changes the password and keeps the connection up.  *keep* is
+  the default.
 ERST
 
     {
         .name       = "expire_password",
-        .args_type  = "protocol:s,time:s",
-        .params     = "protocol time",
+        .args_type  = "protocol:s,time:s,display:s?",
+        .params     = "protocol time [id=display]",
         .help       = "set spice/vnc password expire-time",
         .cmd        = hmp_expire_password,
     },
 
 SRST
-``expire_password [ vnc | spice ]`` *expire-time*
-  Specify when a password for spice/vnc becomes
-  invalid. *expire-time* accepts:
+``expire_password [ vnc | spice ] expire-time [ id=display ]``
+  Specify when a password for spice/vnc becomes invalid.
+  *display* behaves the same as in ``set_password``.
+  *expire-time* accepts:
 
   ``now``
     Invalidate password instantly.
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 31366e6331..30f5b2c3e3 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1546,10 +1546,20 @@ void hmp_set_password(Monitor *mon, const QDict *qdict)
 {
     const char *protocol  = qdict_get_str(qdict, "protocol");
     const char *password  = qdict_get_str(qdict, "password");
+    const char *display = qdict_get_try_str(qdict, "display");
     const char *connected = qdict_get_try_str(qdict, "connected");
     Error *err = NULL;
 
-    qmp_set_password(protocol, password, !!connected, connected, &err);
+    if (display && strncmp(display, "id=", 3)) {
+        connected = display;
+        display = NULL;
+    } else if (display) {
+        /* skip "id=" */
+        display = display + 3;
+    }
+
+    qmp_set_password(protocol, password, !!connected, connected, !!display,
+                     display, &err);
     hmp_handle_error(mon, err);
 }
 
@@ -1557,9 +1567,15 @@ void hmp_expire_password(Monitor *mon, const QDict *qdict)
 {
     const char *protocol  = qdict_get_str(qdict, "protocol");
     const char *whenstr = qdict_get_str(qdict, "time");
+    const char *display = qdict_get_try_str(qdict, "display");
     Error *err = NULL;
 
-    qmp_expire_password(protocol, whenstr, &err);
+    if (display && !strncmp(display, "id=", 3)) {
+        /* skip "id=" */
+        display = display + 3;
+    }
+
+    qmp_expire_password(protocol, whenstr, !!display, display, &err);
     hmp_handle_error(mon, err);
 }
 
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index f7d64a6457..a9ded90a41 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -165,7 +165,8 @@ void qmp_system_wakeup(Error **errp)
 }
 
 void qmp_set_password(const char *protocol, const char *password,
-                      bool has_connected, const char *connected, Error **errp)
+                      bool has_connected, const char *connected,
+                      bool has_display, const char *display, Error **errp)
 {
     int disconnect_if_connected = 0;
     int fail_if_connected = 0;
@@ -198,7 +199,7 @@ void qmp_set_password(const char *protocol, const char *password,
         }
         /* Note that setting an empty password will not disable login through
          * this interface. */
-        rc = vnc_display_password(NULL, password);
+        rc = vnc_display_password(has_display ? display : NULL, password);
     } else {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "protocol",
                    "'vnc' or 'spice'");
@@ -211,7 +212,7 @@ void qmp_set_password(const char *protocol, const char *password,
 }
 
 void qmp_expire_password(const char *protocol, const char *whenstr,
-                         Error **errp)
+                         bool has_display, const char *display, Error **errp)
 {
     time_t when;
     int rc;
@@ -232,7 +233,7 @@ void qmp_expire_password(const char *protocol, const char *whenstr,
         }
         rc = qemu_spice.set_pw_expire(when);
     } else if (strcmp(protocol, "vnc") == 0) {
-        rc = vnc_display_pw_expire(NULL, when);
+        rc = vnc_display_pw_expire(has_display ? display : NULL, when);
     } else {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "protocol",
                    "'vnc' or 'spice'");
diff --git a/qapi/ui.json b/qapi/ui.json
index 16bf03224f..24dca811f8 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -25,6 +25,9 @@
 #             'disconnect' to disconnect existing clients
 #             'keep' to maintain existing clients
 #
+# @display: In case of VNC, the id of the display where the password
+#           should be changed. Defaults to the first.
+#
 # Returns: - Nothing on success
 #          - If Spice is not enabled, DeviceNotFound
 #
@@ -38,7 +41,8 @@
 #
 ##
 { 'command': 'set_password',
-  'data': {'protocol': 'str', 'password': 'str', '*connected': 'str'} }
+  'data': {'protocol': 'str', 'password': 'str', '*connected': 'str',
+           '*display': 'str'} }
 
 ##
 # @expire_password:
@@ -54,6 +58,9 @@
 #        - '+INT' where INT is the number of seconds from now (integer)
 #        - 'INT' where INT is the absolute time in seconds
 #
+# @display: In case of VNC, the id of the display where the password
+#           should be set to expire. Defaults to the first.
+#
 # Returns: - Nothing on success
 #          - If @protocol is 'spice' and Spice is not active, DeviceNotFound
 #
@@ -71,7 +78,8 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'expire_password', 'data': {'protocol': 'str', 'time': 'str'} }
+{ 'command': 'expire_password',
+  'data': {'protocol': 'str', 'time': 'str', '*display': 'str'} }
 
 ##
 # @screendump:
-- 
2.30.2



