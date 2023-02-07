Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8523568DAAC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:26:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPOv5-0007Nu-11; Tue, 07 Feb 2023 09:26:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pPOv3-0007NO-CS
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:26:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pPOv1-0006FH-OS
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675779959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtl4SNIpf1RWo6RcTmh5yr4OwHwqsvHdcf3zej+YUZ0=;
 b=BPaWAYMNhznV4n9yTnhR87jt0FbD+emK/zad/nCK9rpqc89zEBAGFAqLeFaRJnpaDqz9/t
 sJ/PFpxONYnoIIGJMJQGphrDYtMTmWbUH3ZxQ1uqlaTiVKfM4fq8LEQjARPe22OGYa9WFG
 x0OIq95Mufs8qF8GbMV4VzzLoWu6ID4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-Ea558N7YNXGJ9x4dr1oAaA-1; Tue, 07 Feb 2023 09:25:57 -0500
X-MC-Unique: Ea558N7YNXGJ9x4dr1oAaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 639FB1C07585;
 Tue,  7 Feb 2023 14:25:57 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D781140EBF4;
 Tue,  7 Feb 2023 14:25:55 +0000 (UTC)
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
Subject: [PATCH v3 04/10] osdep: implement qemu_socketpair() for win32
Date: Tue,  7 Feb 2023 18:25:29 +0400
Message-Id: <20230207142535.1153722-5-marcandre.lureau@redhat.com>
In-Reply-To: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
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

Manually implement a socketpair() function, using UNIX sockets and
simple peer credential checking.

QEMU doesn't make much use of socketpair, beside vhost-user which is not
available for win32 at this point. However, I intend to use it for
writing some new portable tests.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/sockets.h |   2 -
 util/oslib-win32.c     | 110 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+), 2 deletions(-)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 2b0698a7c9..d935fd80da 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -15,7 +15,6 @@ int inet_aton(const char *cp, struct in_addr *ia);
 bool fd_is_socket(int fd);
 int qemu_socket(int domain, int type, int protocol);
 
-#ifndef WIN32
 /**
  * qemu_socketpair:
  * @domain: specifies a communication domain, such as PF_UNIX
@@ -30,7 +29,6 @@ int qemu_socket(int domain, int type, int protocol);
  * Return 0 on success.
  */
 int qemu_socketpair(int domain, int type, int protocol, int sv[2]);
-#endif
 
 int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen);
 /*
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 07ade41800..a7b0d8491e 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -496,6 +496,116 @@ ssize_t qemu_recvfrom_wrap(int sockfd, void *buf, size_t len, int flags,
     return ret;
 }
 
+int qemu_socketpair(int domain, int type, int protocol, int sv[2])
+{
+    struct sockaddr_un addr = {
+        0,
+    };
+    socklen_t socklen;
+    SOCKET listener = INVALID_SOCKET;
+    SOCKET client = INVALID_SOCKET;
+    SOCKET server = INVALID_SOCKET;
+    g_autofree char *path = NULL;
+    int tmpfd;
+    u_long arg, br;
+    int ret = -1;
+
+    g_return_val_if_fail(sv != NULL, -1);
+
+    addr.sun_family = AF_UNIX;
+    socklen = sizeof(addr);
+
+    tmpfd = g_file_open_tmp(NULL, &path, NULL);
+    if (tmpfd == -1) {
+        WSASetLastError(WSAEACCES);
+        goto out;
+    }
+
+    close(tmpfd);
+
+    if (strlen(path) >= sizeof(addr.sun_path)) {
+        WSASetLastError(WSAEACCES);
+        goto out;
+    }
+
+    strncpy(addr.sun_path, path, sizeof(addr.sun_path) - 1);
+
+    listener = socket(domain, type, protocol);
+    if (listener == INVALID_SOCKET) {
+        goto out;
+    }
+
+    if (DeleteFile(path) == 0 && GetLastError() != ERROR_FILE_NOT_FOUND) {
+        WSASetLastError(WSAEACCES);
+        goto out;
+    }
+    g_clear_pointer(&path, g_free);
+
+    if (bind(listener, (struct sockaddr *)&addr, socklen) == SOCKET_ERROR) {
+        goto out;
+    }
+
+    if (listen(listener, 1) == SOCKET_ERROR) {
+        goto out;
+    }
+
+    client = socket(domain, type, protocol);
+    if (client == INVALID_SOCKET) {
+        goto out;
+    }
+
+    arg = 1;
+    if (ioctlsocket(client, FIONBIO, &arg) == SOCKET_ERROR) {
+        goto out;
+    }
+
+    if (connect(client, (struct sockaddr *)&addr, socklen) == SOCKET_ERROR &&
+        WSAGetLastError() != WSAEWOULDBLOCK) {
+        goto out;
+    }
+
+    server = accept(listener, NULL, NULL);
+    if (server == INVALID_SOCKET) {
+        goto out;
+    }
+
+    arg = 0;
+    if (ioctlsocket(client, FIONBIO, &arg) == SOCKET_ERROR) {
+        goto out;
+    }
+
+    if (WSAIoctl(server, SIO_AF_UNIX_GETPEERPID, NULL, 0U, &arg, sizeof(arg),
+                 &br, NULL, NULL) == SOCKET_ERROR ||
+        arg != GetCurrentProcessId()) {
+        WSASetLastError(WSAEACCES);
+        goto out;
+    }
+
+    sv[0] = server;
+    server = INVALID_SOCKET;
+    sv[1] = client;
+    client = INVALID_SOCKET;
+    ret = 0;
+
+out:
+    if (ret == -1) {
+        errno = socket_error();
+    }
+    if (listener != INVALID_SOCKET) {
+        closesocket(listener);
+    }
+    if (client != INVALID_SOCKET) {
+        closesocket(client);
+    }
+    if (server != INVALID_SOCKET) {
+        closesocket(server);
+    }
+    if (path) {
+        DeleteFile(path);
+    }
+    return ret;
+}
+
 bool qemu_write_pidfile(const char *filename, Error **errp)
 {
     char buffer[128];
-- 
2.39.1


