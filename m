Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFB343DAC4
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 07:33:24 +0200 (CEST)
Received: from localhost ([::1]:40108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfy2V-0001yv-8O
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 01:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfxzJ-0007Db-8X
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 01:30:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfxzH-0000up-D2
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 01:30:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635399002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rs+kiK4u8MUhnKOvDFCfKLLRdkdWnTzLrL16cvZCk0Q=;
 b=e+Z3/64t+sBDcZd9XK3xvEIV8ka2d71bCK14PJGL1FWr12OSWrjjivFT+qGhaxfmHCrh5Z
 b41zTtp6rZb2iY0/p1IuQQxja3d+HweHrpCGS2gXBO3dnS/XyBb60qI1isnCFV/e4dmOjF
 jxAWJKH5trUHRJrjZJeGAvQfQgG8PeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-CdZmmKioMzSI1Hwg7-JYpg-1; Thu, 28 Oct 2021 01:30:00 -0400
X-MC-Unique: CdZmmKioMzSI1Hwg7-JYpg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBE7C1808310;
 Thu, 28 Oct 2021 05:29:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF8D760854;
 Thu, 28 Oct 2021 05:29:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 967B811380B8; Thu, 28 Oct 2021 07:29:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] qapi/monitor: refactor set/expire_password with enums
Date: Thu, 28 Oct 2021 07:29:53 +0200
Message-Id: <20211028052955.454209-3-armbru@redhat.com>
In-Reply-To: <20211028052955.454209-1-armbru@redhat.com>
References: <20211028052955.454209-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefan Reiter <s.reiter@proxmox.com>, richard.henderson@linaro.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Reiter <s.reiter@proxmox.com>

'protocol' and 'connected' are better suited as enums than as strings,
make use of that. No functional change intended.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
Message-Id: <20211021100135.4146766-3-s.reiter@proxmox.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/ui.json       | 37 +++++++++++++++++++++++++++++++++++--
 monitor/hmp-cmds.c | 29 +++++++++++++++++++++++++++--
 monitor/qmp-cmds.c | 37 ++++++++++++-------------------------
 3 files changed, 74 insertions(+), 29 deletions(-)

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
-- 
2.31.1


