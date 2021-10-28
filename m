Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8C543DACC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 07:36:36 +0200 (CEST)
Received: from localhost ([::1]:45680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfy5b-0005mN-93
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 01:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfxzM-0007Dy-Pt
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 01:30:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfxzJ-0000wl-3v
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 01:30:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635399004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5mE8ITcy78Q6xIk/YryXrQ/fnIjd4VzOu1ii3EqioJ8=;
 b=ZAVABunFdBCDIB306afSkicd5gigBoTyCSbBK2Wg1lqMGSIx5GT230B2TfgTujDb+4h/u4
 tG2whRU8AzwJcjG9DM+z6ZxLfYk7Ai6SIHy7z4h4gG5z54MGbU+iVeU+53nPwBY8RuYgZ8
 qH+myRbUZikaMFfkFxXvakpp7Wm2GYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-jl5DJDcGPqGK_nV5bhS60Q-1; Thu, 28 Oct 2021 01:30:02 -0400
X-MC-Unique: jl5DJDcGPqGK_nV5bhS60Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B32180668D;
 Thu, 28 Oct 2021 05:30:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF65D5F707;
 Thu, 28 Oct 2021 05:29:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9A08A11380BA; Thu, 28 Oct 2021 07:29:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] qapi/monitor: allow VNC display id in set/expire_password
Date: Thu, 28 Oct 2021 07:29:54 +0200
Message-Id: <20211028052955.454209-4-armbru@redhat.com>
In-Reply-To: <20211028052955.454209-1-armbru@redhat.com>
References: <20211028052955.454209-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Reiter <s.reiter@proxmox.com>, richard.henderson@linaro.org,
 Gerd Hoffmann <kraxel@redhat.com>
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
Message-Id: <20211021100135.4146766-4-s.reiter@proxmox.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/ui.json       | 112 +++++++++++++++++++++++++++++++++++----------
 monitor/hmp-cmds.c |  45 ++++++++++++------
 monitor/qmp-cmds.c |  36 ++++++---------
 hmp-commands.hx    |  24 +++++-----
 4 files changed, 148 insertions(+), 69 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 15cc19dcc5..99ac29ad9c 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -39,20 +39,61 @@
   'data': [ 'fail', 'disconnect', 'keep' ] }
 
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
+# Set the password of a remote display server.
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
+# General options for expire_password.
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
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index b8abe69609..f0f0c82d59 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1451,24 +1451,34 @@ void hmp_set_password(Monitor *mon, const QDict *qdict)
 {
     const char *protocol  = qdict_get_str(qdict, "protocol");
     const char *password  = qdict_get_str(qdict, "password");
+    const char *display = qdict_get_try_str(qdict, "display");
     const char *connected = qdict_get_try_str(qdict, "connected");
     Error *err = NULL;
-    DisplayProtocol proto;
-    SetPasswordAction conn;
 
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
 
-    conn = qapi_enum_parse(&SetPasswordAction_lookup, connected,
-                           SET_PASSWORD_ACTION_KEEP, &err);
-    if (err) {
-        goto out;
+    if (opts.protocol == DISPLAY_PROTOCOL_VNC) {
+        opts.u.vnc.has_display = !!display;
+        opts.u.vnc.display = (char *)display;
+    } else if (opts.protocol == DISPLAY_PROTOCOL_SPICE) {
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
 
 out:
     hmp_handle_error(mon, err);
@@ -1478,16 +1488,25 @@ void hmp_expire_password(Monitor *mon, const QDict *qdict)
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
index 0654d7289a..5637bd70b6 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -163,35 +163,27 @@ void qmp_system_wakeup(Error **errp)
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
@@ -199,11 +191,11 @@ void qmp_set_password(DisplayProtocol protocol, const char *password,
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
@@ -215,14 +207,14 @@ void qmp_expire_password(DisplayProtocol protocol, const char *whenstr,
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
diff --git a/hmp-commands.hx b/hmp-commands.hx
index cf723c69ac..9fbb207b35 100644
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
-- 
2.31.1


