Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269486800C8
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 19:25:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMCMo-00054A-7l; Sun, 29 Jan 2023 13:25:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMCMd-0004vJ-3e
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 13:25:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMCMb-0006Dd-FB
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 13:25:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675016712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iXnWXWUy2VOUkfKzFoE3RbpkwDAs84VO76GolSsfxeg=;
 b=EGPyw5sZtc6Pr7gK5qm7YYlTw1VHXFP3lIrxyudtXNbLI0/57n7p36+kcoP1awny0fF0IK
 rEX/ORynsTAS02Rlrak1YRIGaju7eCszp2ALCd69P42stM63cMcTYs81dtlTuY0690luy0
 89okDbyTlL6DgPFpmtSmAIjfxu3hk1U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-BmsSiegGOseIRJoMR1PumQ-1; Sun, 29 Jan 2023 13:24:56 -0500
X-MC-Unique: BmsSiegGOseIRJoMR1PumQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 271F43C02B6F;
 Sun, 29 Jan 2023 18:24:56 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB9F21121315;
 Sun, 29 Jan 2023 18:24:54 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 7/9] qmp: teach 'getfd' to import sockets on win32
Date: Sun, 29 Jan 2023 22:24:12 +0400
Message-Id: <20230129182414.583349-8-marcandre.lureau@redhat.com>
In-Reply-To: <20230129182414.583349-1-marcandre.lureau@redhat.com>
References: <20230129182414.583349-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

A process with enough capabilities can duplicate a socket to QEMU.
Modify 'getfd' to import it and add it to the monitor fd list, so it can
be later used by other commands.

Note that we actually store the SOCKET in the FD list, appropriate care
must now be taken to use the correct socket functions (similar approach
is taken by our io/ code and in glib, this is internal and shouldn't
affect the QEMU/QMP users)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qapi/misc.json     | 16 ++++++++--
 monitor/hmp-cmds.c |  6 +++-
 monitor/misc.c     | 75 ++++++++++++++++++++++++++++++++++++----------
 3 files changed, 79 insertions(+), 18 deletions(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index 27ef5a2b20..cd36d8befb 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -249,10 +249,18 @@
 ##
 # @getfd:
 #
-# Receive a file descriptor via SCM rights and assign it a name
+# On UNIX, receive a file descriptor via SCM rights and assign it a name.
+#
+# On Windows, (where ancillary socket fd-passing isn't an option yet), add a
+# socket that was duplicated to QEMU process with WSADuplicateSocketW() via
+# WSASocket() & WSAPROTOCOL_INFOW structure and assign it a name. A SOCKET is
+# considered as a kind of "file descriptor" in QMP context, for historical
+# reasons and simplicity. QEMU takes care to use socket functions appropriately.
 #
 # @fdname: file descriptor name
 #
+# @wsa-info: a WSAPROTOCOL_INFOW structure (encoded in base64). Since 8.0.
+#
 # Returns: Nothing on success
 #
 # Since: 0.14
@@ -270,7 +278,11 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'getfd', 'data': {'fdname': 'str'} }
+{ 'command': 'getfd', 'data': {
+    'fdname': 'str',
+    '*wsa-info': {'type': 'str', 'if': 'CONFIG_WIN32'}
+  }
+}
 
 ##
 # @closefd:
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 1dba973092..fc9145b8fa 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1232,7 +1232,11 @@ void hmp_getfd(Monitor *mon, const QDict *qdict)
     const char *fdname = qdict_get_str(qdict, "fdname");
     Error *err = NULL;
 
-    qmp_getfd(fdname, &err);
+    qmp_getfd(fdname,
+#ifdef WIN32
+              NULL,
+#endif
+              &err);
     hmp_handle_error(mon, err);
 }
 
diff --git a/monitor/misc.c b/monitor/misc.c
index 053af4045e..96c4977e5a 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -71,6 +71,7 @@
 #include "qapi/error.h"
 #include "qapi/qmp-event.h"
 #include "qemu/cutils.h"
+#include "qemu/sockets.h"
 
 #if defined(TARGET_S390X)
 #include "hw/s390x/storage-keys.h"
@@ -957,27 +958,29 @@ static void hmp_wavcapture(Monitor *mon, const QDict *qdict)
     QLIST_INSERT_HEAD (&capture_head, s, entries);
 }
 
-void qmp_getfd(const char *fdname, Error **errp)
+static void close_fd(int fd)
 {
-    Monitor *cur_mon = monitor_cur();
-    mon_fd_t *monfd;
-    int fd, tmp_fd;
-
-    fd = qemu_chr_fe_get_msgfd(&cur_mon->chr);
-    if (fd == -1) {
-        error_setg(errp, "No file descriptor supplied via SCM_RIGHTS");
-        return;
+    if (fd_is_socket(fd)) {
+        closesocket(fd);
+    } else {
+        close(fd);
     }
+}
+
+static void monitor_add_fd(Monitor *mon, int fd, const char *fdname, Error **errp)
+{
+    mon_fd_t *monfd;
+    int tmp_fd;
 
     if (qemu_isdigit(fdname[0])) {
-        close(fd);
+        close_fd(fd);
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "fdname",
                    "a name not starting with a digit");
         return;
     }
 
-    QEMU_LOCK_GUARD(&cur_mon->mon_lock);
-    QLIST_FOREACH(monfd, &cur_mon->fds, next) {
+    QEMU_LOCK_GUARD(&mon->mon_lock);
+    QLIST_FOREACH(monfd, &mon->fds, next) {
         if (strcmp(monfd->name, fdname) != 0) {
             continue;
         }
@@ -985,7 +988,7 @@ void qmp_getfd(const char *fdname, Error **errp)
         tmp_fd = monfd->fd;
         monfd->fd = fd;
         /* Make sure close() is outside critical section */
-        close(tmp_fd);
+        close_fd(tmp_fd);
         return;
     }
 
@@ -993,7 +996,49 @@ void qmp_getfd(const char *fdname, Error **errp)
     monfd->name = g_strdup(fdname);
     monfd->fd = fd;
 
-    QLIST_INSERT_HEAD(&cur_mon->fds, monfd, next);
+    QLIST_INSERT_HEAD(&mon->fds, monfd, next);
+}
+
+void qmp_getfd(const char *fdname,
+#ifdef WIN32
+               const char *wsa_info,
+#endif
+               Error **errp)
+{
+    Monitor *cur_mon = monitor_cur();
+    int fd;
+
+#ifdef WIN32
+    if (wsa_info) {
+        g_autofree WSAPROTOCOL_INFOW *info = NULL;
+        gsize len;
+        SOCKET sk;
+
+        info = (void *)g_base64_decode(wsa_info, &len);
+        if (len != sizeof(*info)) {
+            error_setg(errp, "Invalid WSAPROTOCOL_INFOW value");
+            return;
+        }
+
+        sk = WSASocketW(FROM_PROTOCOL_INFO, FROM_PROTOCOL_INFO,
+                        FROM_PROTOCOL_INFO, info, 0, 0);
+        if (sk == INVALID_SOCKET) {
+            g_autofree gchar *emsg = g_win32_error_message(WSAGetLastError());
+            error_setg(errp, "Couldn't create socket: %s", emsg);
+            return;
+        }
+
+        return monitor_add_fd(cur_mon, sk, fdname, errp);
+    }
+#endif
+
+    fd = qemu_chr_fe_get_msgfd(&cur_mon->chr);
+    if (fd == -1) {
+        error_setg(errp, "No file descriptor supplied via SCM_RIGHTS");
+        return;
+    }
+
+    return monitor_add_fd(cur_mon, fd, fdname, errp);
 }
 
 void qmp_closefd(const char *fdname, Error **errp)
@@ -1014,7 +1059,7 @@ void qmp_closefd(const char *fdname, Error **errp)
         g_free(monfd);
         qemu_mutex_unlock(&cur_mon->mon_lock);
         /* Make sure close() is outside critical section */
-        close(tmp_fd);
+        close_fd(tmp_fd);
         return;
     }
 
-- 
2.39.1


