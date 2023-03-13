Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428016B76E3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:53:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbgfd-0008S1-Tk; Mon, 13 Mar 2023 07:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgfQ-0007yB-MT
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:48:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgfO-0004wQ-Mb
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:48:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678708118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3vEfrYWExxXeJtlgbPURoCbJ42fAHdoLV7DhNJ2YY4E=;
 b=U5GioQkKRQbpugKUInL0WBzRhlui6z+4ohfXF4cpvzcxS1foNpLHYK3/hlDVtfRr5SHp6k
 w4um1UiuYtOlAveTT5/5thc0Snsaip6qJHgjyUDtiY8Jf6aQHiJ590IR9MfY6OSIVr6mmx
 yurvzLN2cjQO2yepz1CH42XEpdmleso=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-hzYpNoybNKeyj1IOSMUo8A-1; Mon, 13 Mar 2023 07:48:35 -0400
X-MC-Unique: hzYpNoybNKeyj1IOSMUo8A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FED585A588;
 Mon, 13 Mar 2023 11:48:34 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4ACE47507A;
 Mon, 13 Mar 2023 11:48:32 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Thomas Huth <thuth@redhat.com>, Fam Zheng <fam@euphon.net>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PULL v2 22/25] qmp: add 'get-win32-socket'
Date: Mon, 13 Mar 2023 15:46:45 +0400
Message-Id: <20230313114648.426607-23-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230306122751.2355515-9-marcandre.lureau@redhat.com>
---
 qapi/misc.json | 31 ++++++++++++++++++++
 monitor/fds.c  | 76 +++++++++++++++++++++++++++++++++++++++-----------
 2 files changed, 91 insertions(+), 16 deletions(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index f0217cfba0..5ef6286af3 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -275,6 +275,37 @@
 ##
 { 'command': 'getfd', 'data': {'fdname': 'str'} }
 
+##
+# @get-win32-socket:
+#
+# Add a socket that was duplicated to QEMU process with
+# WSADuplicateSocketW() via WSASocket() & WSAPROTOCOL_INFOW structure
+# and assign it a name (the SOCKET is associated with a CRT file
+# descriptor)
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
diff --git a/monitor/fds.c b/monitor/fds.c
index 7daf1064e1..9ed4197358 100644
--- a/monitor/fds.c
+++ b/monitor/fds.c
@@ -61,46 +61,55 @@ struct MonFdset {
 static QemuMutex mon_fdsets_lock;
 static QLIST_HEAD(, MonFdset) mon_fdsets;
 
-void qmp_getfd(const char *fdname, Error **errp)
+static bool monitor_add_fd(Monitor *mon, int fd, const char *fdname, Error **errp)
 {
-    Monitor *cur_mon = monitor_cur();
     mon_fd_t *monfd;
-    int fd, tmp_fd;
-
-    fd = qemu_chr_fe_get_msgfd(&cur_mon->chr);
-    if (fd == -1) {
-        error_setg(errp, "No file descriptor supplied via SCM_RIGHTS");
-        return;
-    }
 
     if (qemu_isdigit(fdname[0])) {
         close(fd);
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "fdname",
                    "a name not starting with a digit");
-        return;
+        return false;
     }
 
     /* See close() call below. */
-    qemu_mutex_lock(&cur_mon->mon_lock);
-    QLIST_FOREACH(monfd, &cur_mon->fds, next) {
+    qemu_mutex_lock(&mon->mon_lock);
+    QLIST_FOREACH(monfd, &mon->fds, next) {
+        int tmp_fd;
+
         if (strcmp(monfd->name, fdname) != 0) {
             continue;
         }
 
         tmp_fd = monfd->fd;
         monfd->fd = fd;
-        qemu_mutex_unlock(&cur_mon->mon_lock);
+        qemu_mutex_unlock(&mon->mon_lock);
         /* Make sure close() is outside critical section */
         close(tmp_fd);
-        return;
+        return true;
     }
 
     monfd = g_new0(mon_fd_t, 1);
     monfd->name = g_strdup(fdname);
     monfd->fd = fd;
 
-    QLIST_INSERT_HEAD(&cur_mon->fds, monfd, next);
-    qemu_mutex_unlock(&cur_mon->mon_lock);
+    QLIST_INSERT_HEAD(&mon->fds, monfd, next);
+    qemu_mutex_unlock(&mon->mon_lock);
+    return true;
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
+    monitor_add_fd(cur_mon, fd, fdname, errp);
 }
 
 void qmp_closefd(const char *fdname, Error **errp)
@@ -214,6 +223,41 @@ error:
     return NULL;
 }
 
+#ifdef WIN32
+void qmp_get_win32_socket(const char *infos, const char *fdname, Error **errp)
+{
+    g_autofree WSAPROTOCOL_INFOW *info = NULL;
+    gsize len;
+    SOCKET sk;
+    int fd;
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
+        error_setg_win32(errp, WSAGetLastError(), "Couldn't import socket");
+        return;
+    }
+
+    fd = _open_osfhandle(sk, _O_BINARY);
+    if (fd < 0) {
+        error_setg_errno(errp, errno, "Failed to associate a FD with the SOCKET");
+        closesocket(sk);
+        return;
+    }
+
+    monitor_add_fd(monitor_cur(), fd, fdname, errp);
+}
+#endif
+
+
 void qmp_remove_fd(int64_t fdset_id, bool has_fd, int64_t fd, Error **errp)
 {
     MonFdset *mon_fdset;
-- 
2.39.2


