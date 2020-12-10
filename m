Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A492D62AD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:57:44 +0100 (CET)
Received: from localhost ([::1]:43934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knPGB-0000cW-K8
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:57:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOrm-0008SO-31
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:32:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOra-0003TV-3F
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:32:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607617933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q9mYqMdY2wit4YRtgFZ9a0FsNrNzKz02wZhr+/VziCU=;
 b=PzVz6zXRaEcb12Hnoq+OCxbhDFjDH7b4FKuIG2YeOFu1leJlWdg2F+a+fwgj4S4Ifs0BlO
 oWe/OpSIJl4jh18OS0SQB7HghlzcGQpTYwYPg773i5nYk9TB/10RGl7TWFzzFDIH7Bwqci
 1F+/SeJrRiH+p9gQ79+jesXZ3ZrjBZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-97_oz3hwNxC0rDbm7a1w2A-1; Thu, 10 Dec 2020 11:32:10 -0500
X-MC-Unique: 97_oz3hwNxC0rDbm7a1w2A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BE2B100A8F4;
 Thu, 10 Dec 2020 16:31:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE3075D6D3;
 Thu, 10 Dec 2020 16:31:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C9E9E10FA0A7; Thu, 10 Dec 2020 17:31:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/13] ui: Improve some set_passwd,
 expire_password error messages
Date: Thu, 10 Dec 2020 17:31:24 +0100
Message-Id: <20201210163132.2919935-6-armbru@redhat.com>
In-Reply-To: <20201210163132.2919935-1-armbru@redhat.com>
References: <20201210163132.2919935-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

set_passwd and expire_password reject invalid "protocol" with "Invalid
parameter 'protocol'".  Misleading; the parameter is valid, its value
isn't.  Improve to "Parameter 'protocol' expects 'vnc' or 'spice'".

expire_password fails with "Could not set password".  Misleading;
improve to "Could not set password expire time".

QERR_SET_PASSWD_FAILED is now unused.  Drop.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201113082626.2725812-5-armbru@redhat.com>
---
 include/qapi/qmp/qerror.h |  3 ---
 monitor/qmp-cmds.c        | 38 +++++++++++++++-----------------------
 2 files changed, 15 insertions(+), 26 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index 5d7e69cc1f..d8267129bc 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -65,9 +65,6 @@
 #define QERR_REPLAY_NOT_SUPPORTED \
     "Record/replay feature is not supported for '%s'"
 
-#define QERR_SET_PASSWD_FAILED \
-    "Could not set password"
-
 #define QERR_UNDEFINED_ERROR \
     "An undefined error has occurred"
 
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index a08143b323..ffbf948d55 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -199,13 +199,7 @@ void qmp_set_password(const char *protocol, const char *password,
         }
         rc = qemu_spice.set_passwd(password, fail_if_connected,
                                    disconnect_if_connected);
-        if (rc != 0) {
-            error_setg(errp, QERR_SET_PASSWD_FAILED);
-        }
-        return;
-    }
-
-    if (strcmp(protocol, "vnc") == 0) {
+    } else if (strcmp(protocol, "vnc") == 0) {
         if (fail_if_connected || disconnect_if_connected) {
             /* vnc supports "connected=keep" only */
             error_setg(errp, QERR_INVALID_PARAMETER, "connected");
@@ -214,13 +208,15 @@ void qmp_set_password(const char *protocol, const char *password,
         /* Note that setting an empty password will not disable login through
          * this interface. */
         rc = vnc_display_password(NULL, password);
-        if (rc < 0) {
-            error_setg(errp, QERR_SET_PASSWD_FAILED);
-        }
+    } else {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "protocol",
+                   "'vnc' or 'spice'");
         return;
     }
 
-    error_setg(errp, QERR_INVALID_PARAMETER, "protocol");
+    if (rc != 0) {
+        error_setg(errp, "Could not set password");
+    }
 }
 
 void qmp_expire_password(const char *protocol, const char *whenstr,
@@ -244,28 +240,24 @@ void qmp_expire_password(const char *protocol, const char *whenstr,
             return;
         }
         rc = qemu_spice.set_pw_expire(when);
-        if (rc != 0) {
-            error_setg(errp, QERR_SET_PASSWD_FAILED);
-        }
-        return;
-    }
-
-    if (strcmp(protocol, "vnc") == 0) {
+    } else if (strcmp(protocol, "vnc") == 0) {
         rc = vnc_display_pw_expire(NULL, when);
-        if (rc != 0) {
-            error_setg(errp, QERR_SET_PASSWD_FAILED);
-        }
+    } else {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "protocol",
+                   "'vnc' or 'spice'");
         return;
     }
 
-    error_setg(errp, QERR_INVALID_PARAMETER, "protocol");
+    if (rc != 0) {
+        error_setg(errp, "Could not set password expire time");
+    }
 }
 
 #ifdef CONFIG_VNC
 void qmp_change_vnc_password(const char *password, Error **errp)
 {
     if (vnc_display_password(NULL, password) < 0) {
-        error_setg(errp, QERR_SET_PASSWD_FAILED);
+        error_setg(errp, "Could not set password");
     }
 }
 
-- 
2.26.2


