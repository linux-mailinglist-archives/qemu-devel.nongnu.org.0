Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF9968DAB4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:27:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPOvO-0007kV-00; Tue, 07 Feb 2023 09:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pPOvM-0007Xm-2S
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:26:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pPOvK-0006N3-Cg
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675779977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LfCMYotDh8f6Nxvoi3dPXXnqkaGiK9S2VLG0NcyGXN0=;
 b=hVDDKl1kYXCAerEct0gyK3VuPEyL/k+C8wk2BGMuON0DVO5vhgkfVq53GgAvqUQ8LYbH8b
 mRLkubB6J2jHNZZWKoq88Bx/+aqp1AcNjd3nAS8anTCyzWLSRtU9uQRYOwm2UTmenbAyvK
 SG4aiEC2tHHZbYEiNxG4o6eR1a4o9Og=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-tX7l_2tiO0-UwLMgDkAVmA-1; Tue, 07 Feb 2023 09:26:14 -0500
X-MC-Unique: tX7l_2tiO0-UwLMgDkAVmA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 447253C0D85E;
 Tue,  7 Feb 2023 14:26:14 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE221492C3C;
 Tue,  7 Feb 2023 14:26:12 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 08/10] qmp: teach 'getfd' to import sockets on win32
Date: Tue,  7 Feb 2023 18:25:33 +0400
Message-Id: <20230207142535.1153722-9-marcandre.lureau@redhat.com>
In-Reply-To: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
 monitor/fds.c      | 79 ++++++++++++++++++++++++++++++++++++----------
 monitor/hmp-cmds.c |  6 +++-
 3 files changed, 81 insertions(+), 20 deletions(-)

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
diff --git a/monitor/fds.c b/monitor/fds.c
index 03c5e97c35..a876e1128e 100644
--- a/monitor/fds.c
+++ b/monitor/fds.c
@@ -29,6 +29,7 @@
 #include "qapi/qmp/qerror.h"
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
+#include "qemu/sockets.h"
 #include "sysemu/runstate.h"
 
 /* file descriptors passed via SCM_RIGHTS */
@@ -61,36 +62,38 @@ struct MonFdset {
 static QemuMutex mon_fdsets_lock;
 static QLIST_HEAD(, MonFdset) mon_fdsets;
 
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
 
-    qemu_mutex_lock(&cur_mon->mon_lock);
-    QLIST_FOREACH(monfd, &cur_mon->fds, next) {
+    qemu_mutex_lock(&mon->mon_lock);
+    QLIST_FOREACH(monfd, &mon->fds, next) {
         if (strcmp(monfd->name, fdname) != 0) {
             continue;
         }
 
         tmp_fd = monfd->fd;
         monfd->fd = fd;
-        qemu_mutex_unlock(&cur_mon->mon_lock);
+        qemu_mutex_unlock(&mon->mon_lock);
         /* Make sure close() is outside critical section */
-        close(tmp_fd);
+        close_fd(tmp_fd);
         return;
     }
 
@@ -98,8 +101,50 @@ void qmp_getfd(const char *fdname, Error **errp)
     monfd->name = g_strdup(fdname);
     monfd->fd = fd;
 
-    QLIST_INSERT_HEAD(&cur_mon->fds, monfd, next);
-    qemu_mutex_unlock(&cur_mon->mon_lock);
+    QLIST_INSERT_HEAD(&mon->fds, monfd, next);
+    qemu_mutex_unlock(&mon->mon_lock);
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
@@ -120,7 +165,7 @@ void qmp_closefd(const char *fdname, Error **errp)
         g_free(monfd);
         qemu_mutex_unlock(&cur_mon->mon_lock);
         /* Make sure close() is outside critical section */
-        close(tmp_fd);
+        close_fd(tmp_fd);
         return;
     }
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 34bd8c67d7..46930bc1a9 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -197,7 +197,11 @@ void hmp_getfd(Monitor *mon, const QDict *qdict)
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
 
-- 
2.39.1


