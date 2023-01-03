Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED6765BEA9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 12:09:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCfAD-0005ah-DV; Tue, 03 Jan 2023 06:09:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pCfAA-0005Y4-So
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 06:08:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pCfA9-0005Ez-4x
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 06:08:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672744136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gS/H2kJ5iu/hszxvqB7vTpfhoqUwZ4nZXbFYP75rS3w=;
 b=IwgO7jLKOiCcCfTxOLiJLmSRwyU64xCCs12/ZR0KiA6O0FS2oNrnPUDuhq+d82q77WkJFX
 QXBHfunAMXezjkwoTST8hllU9kNgsTVGVcnm4Q4VxAWYhItRTr5nrIY1g5K4y3XlnnncuM
 KCkBeWVcp9emgHui07MY3OIk18+YSWY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-C-NympMuNhumwVBRzzVTpQ-1; Tue, 03 Jan 2023 06:08:55 -0500
X-MC-Unique: C-NympMuNhumwVBRzzVTpQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFBB91C05EAC;
 Tue,  3 Jan 2023 11:08:54 +0000 (UTC)
Received: from localhost (unknown [10.39.208.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92E26492D8B;
 Tue,  3 Jan 2023 11:08:53 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 08/10] qmp: add 'get-win32-socket'
Date: Tue,  3 Jan 2023 15:08:12 +0400
Message-Id: <20230103110814.3726795-9-marcandre.lureau@redhat.com>
In-Reply-To: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
References: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

A process with enough capabilities can duplicate a socket to QEMU. Add a
QMP command to import it and add it to the monitor fd list, so it can be
later used by other commands.

Note that we actually store the SOCKET in the FD list, appropriate care
must now be taken to use the correct socket functions (similar approach
is taken by our io/ code and in glib, this is internal and shouldn't
affect the QEMU/QMP users)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qapi/misc.json | 32 ++++++++++++++++++++++
 monitor/misc.c | 74 ++++++++++++++++++++++++++++++++++++++++----------
 2 files changed, 91 insertions(+), 15 deletions(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index 27ef5a2b20..a19dd78fab 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -272,6 +272,38 @@
 ##
 { 'command': 'getfd', 'data': {'fdname': 'str'} }
 
+##
+# @get-win32-socket:
+#
+# Add a socket that was duplicated to QEMU process with WSADuplicateSocketW()
+# via WSASocket() & WSAPROTOCOL_INFOW structure and assign it a name. A SOCKET
+# is considered as a kind of "file descriptor" by QMP clients, for historical
+# reasons and simplicity, although QEMU takes care to use socket functions
+# appropriately.
+#
+# @info: the WSAPROTOCOL_INFOW structure (encoded in base64)
+#
+# @fdname: file descriptor name
+#
+# Returns: Nothing on success
+#
+# Since: 8.0
+#
+# Notes: If @fdname already exists, the file descriptor assigned to
+#        it will be closed and replaced by the received file
+#        descriptor.
+#
+#        The 'closefd' command can be used to explicitly close the
+#        file descriptor when it is no longer needed.
+#
+# Example:
+#
+# -> { "execute": "get-win32-socket", "arguments": { "info": "abcd123..", fdname": "skclient" } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'get-win32-socket', 'data': {'info': 'str', 'fdname': 'str'}, 'if': 'CONFIG_WIN32' }
+
 ##
 # @closefd:
 #
diff --git a/monitor/misc.c b/monitor/misc.c
index bf3f1c67ca..4dd76afb4f 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -73,6 +73,7 @@
 #include "qapi/error.h"
 #include "qapi/qmp-event.h"
 #include "qemu/cutils.h"
+#include "qemu/sockets.h"
 
 #if defined(TARGET_S390X)
 #include "hw/s390x/storage-keys.h"
@@ -1002,27 +1003,29 @@ static void hmp_wavcapture(Monitor *mon, const QDict *qdict)
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
@@ -1030,7 +1033,7 @@ void qmp_getfd(const char *fdname, Error **errp)
         tmp_fd = monfd->fd;
         monfd->fd = fd;
         /* Make sure close() is outside critical section */
-        close(tmp_fd);
+        close_fd(tmp_fd);
         return;
     }
 
@@ -1038,7 +1041,21 @@ void qmp_getfd(const char *fdname, Error **errp)
     monfd->name = g_strdup(fdname);
     monfd->fd = fd;
 
-    QLIST_INSERT_HEAD(&cur_mon->fds, monfd, next);
+    QLIST_INSERT_HEAD(&mon->fds, monfd, next);
+}
+
+void qmp_getfd(const char *fdname, Error **errp)
+{
+    Monitor *cur_mon = monitor_cur();
+    int fd;
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
@@ -1059,7 +1076,7 @@ void qmp_closefd(const char *fdname, Error **errp)
         g_free(monfd);
         qemu_mutex_unlock(&cur_mon->mon_lock);
         /* Make sure close() is outside critical section */
-        close(tmp_fd);
+        close_fd(tmp_fd);
         return;
     }
 
@@ -1152,6 +1169,33 @@ error:
     return NULL;
 }
 
+#ifdef _WIN32
+void qmp_get_win32_socket(const char *infos, const char *fdname, Error **errp)
+{
+    g_autofree WSAPROTOCOL_INFOW *info = NULL;
+    gsize len;
+    SOCKET sk;
+
+    info = (void *)g_base64_decode(infos, &len);
+    if (len != sizeof(*info)) {
+        error_setg(errp, "Invalid WSAPROTOCOL_INFOW value");
+        return;
+    }
+
+    sk = WSASocketW(FROM_PROTOCOL_INFO,
+                    FROM_PROTOCOL_INFO,
+                    FROM_PROTOCOL_INFO,
+                    info, 0, 0);
+    if (sk == INVALID_SOCKET) {
+        g_autofree gchar *emsg = g_win32_error_message(WSAGetLastError());
+        error_setg(errp, "Couldn't create socket: %s", emsg);
+        return;
+    }
+
+    monitor_add_fd(monitor_cur(), sk, fdname, errp);
+}
+#endif
+
 void qmp_remove_fd(int64_t fdset_id, bool has_fd, int64_t fd, Error **errp)
 {
     MonFdset *mon_fdset;
-- 
2.39.0


