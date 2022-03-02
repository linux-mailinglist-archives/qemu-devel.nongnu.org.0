Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6CA4CADEF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:52:30 +0100 (CET)
Received: from localhost ([::1]:51246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPU5N-0004aN-Rg
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:52:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkK-000188-Cv
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:30:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkI-0000Fy-DZ
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:30:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646245841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0cEFJjINxdRihmqDNTllYNJqdgNUBUUbrBA92lP+Afg=;
 b=LmOEu6zTNJ2pB0RK2ospakTHCjRDhKSCLfPjnBitmYXaGkisgE5ZjCkB69F2jAJh961YdB
 pGQeemMJF/G/IVZf0idpqH9rsBssiYN0/a7rAmf2NjljrRE/NShxj1TNqjApIAynYnqCw5
 G/QDy+IwzoclEt9Dr12w4SakFsWqomI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-r7PfhVHiMpyhtylDc9P0yw-1; Wed, 02 Mar 2022 13:30:38 -0500
X-MC-Unique: r7PfhVHiMpyhtylDc9P0yw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4748518C43E7;
 Wed,  2 Mar 2022 18:30:37 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E0D31059172;
 Wed,  2 Mar 2022 18:30:35 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, f.ebner@proxmox.com, hreitz@redhat.com,
 jinpu.wang@ionos.com, peter.maydell@linaro.org, peterx@redhat.com,
 s.reiter@proxmox.com
Subject: [PULL 04/18] qapi/monitor: refactor set/expire_password with enums
Date: Wed,  2 Mar 2022 18:29:22 +0000
Message-Id: <20220302182936.227719-5-dgilbert@redhat.com>
In-Reply-To: <20220302182936.227719-1-dgilbert@redhat.com>
References: <20220302182936.227719-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Reiter <s.reiter@proxmox.com>

'protocol' and 'connected' are better suited as enums than as strings,
make use of that. No functional change intended.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
[FE: update "Since: " from 6.2 to 7.0
     put 'keep' first in enum to ease use as a default]
Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
Message-Id: <20220225084949.35746-3-f.ebner@proxmox.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 monitor/hmp-cmds.c | 29 +++++++++++++++++++++++++++--
 monitor/qmp-cmds.c | 37 ++++++++++++-------------------------
 qapi/ui.json       | 36 ++++++++++++++++++++++++++++++++++--
 3 files changed, 73 insertions(+), 29 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 8c384dc1b2..ff78741b75 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1398,8 +1398,24 @@ void hmp_set_password(Monitor *mon, const QDict *qdict)
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
 
@@ -1408,8 +1424,17 @@ void hmp_expire_password(Monitor *mon, const QDict *qdict)
     const char *protocol  = qdict_get_str(qdict, "protocol");
     const char *whenstr = qdict_get_str(qdict, "time");
     Error *err = NULL;
+    DisplayProtocol proto;
+
+    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
+                            DISPLAY_PROTOCOL_VNC, &err);
+    if (err) {
+        goto out;
+    }
 
-    qmp_expire_password(protocol, whenstr, &err);
+    qmp_expire_password(proto, whenstr, &err);
+
+out:
     hmp_handle_error(mon, err);
 }
 
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index db4d186448..b6e8b57fcc 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -168,33 +168,27 @@ void qmp_system_wakeup(Error **errp)
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
@@ -203,10 +197,6 @@ void qmp_set_password(const char *protocol, const char *password,
         /* Note that setting an empty password will not disable login through
          * this interface. */
         rc = vnc_display_password(NULL, password);
-    } else {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "protocol",
-                   "'vnc' or 'spice'");
-        return;
     }
 
     if (rc != 0) {
@@ -214,7 +204,7 @@ void qmp_set_password(const char *protocol, const char *password,
     }
 }
 
-void qmp_expire_password(const char *protocol, const char *whenstr,
+void qmp_expire_password(DisplayProtocol protocol, const char *whenstr,
                          Error **errp)
 {
     time_t when;
@@ -230,17 +220,14 @@ void qmp_expire_password(const char *protocol, const char *whenstr,
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
index 9354f4c467..e112409211 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -9,6 +9,34 @@
 { 'include': 'common.json' }
 { 'include': 'sockets.json' }
 
+##
+# @DisplayProtocol:
+#
+# Display protocols which support changing password options.
+#
+# Since: 7.0
+#
+##
+{ 'enum': 'DisplayProtocol',
+  'data': [ 'vnc', 'spice' ] }
+
+##
+# @SetPasswordAction:
+#
+# An action to take on changing a password on a connection with active clients.
+#
+# @keep: maintain existing clients
+#
+# @fail: fail the command if clients are connected
+#
+# @disconnect: disconnect existing clients
+#
+# Since: 7.0
+#
+##
+{ 'enum': 'SetPasswordAction',
+  'data': [ 'keep', 'fail', 'disconnect' ] }
+
 ##
 # @set_password:
 #
@@ -38,7 +66,9 @@
 #
 ##
 { 'command': 'set_password',
-  'data': {'protocol': 'str', 'password': 'str', '*connected': 'str'} }
+  'data': { 'protocol': 'DisplayProtocol',
+            'password': 'str',
+            '*connected': 'SetPasswordAction' } }
 
 ##
 # @expire_password:
@@ -71,7 +101,9 @@
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
2.35.1


