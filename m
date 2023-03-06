Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632E46ABF88
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 13:31:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ9x2-0007Ua-Et; Mon, 06 Mar 2023 07:28:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ9ww-0007Ty-NZ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:28:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ9wu-0003KB-Mn
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:28:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678105696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ULK8E4KoGQ4cGDikNLsvRl5d0vZNm9xHdJjUtFzMw8=;
 b=ilMOHPdhL5I52qihf4mbjKV0khqnS5ympf5bGEaQZmvQYhGOa5RJaHZO8LkA4APBI7IjIF
 5U0Qutbl+xqQx7bm4VdbCJr+yOQuyOWhgH5pPdHohgqpZRTOxU3gUPAkJK+iQoQrTWXTf3
 xA4pVdjcFJw14x7vxnLUneGRnUp3DE4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-bIOOlE8vMs-zhRDWiEFWIA-1; Mon, 06 Mar 2023 07:28:12 -0500
X-MC-Unique: bIOOlE8vMs-zhRDWiEFWIA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CA1A3C10225;
 Mon,  6 Mar 2023 12:28:12 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4384D1401C32;
 Mon,  6 Mar 2023 12:28:10 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v4 04/11] osdep: implement qemu_socketpair() for win32
Date: Mon,  6 Mar 2023 16:27:44 +0400
Message-Id: <20230306122751.2355515-5-marcandre.lureau@redhat.com>
In-Reply-To: <20230306122751.2355515-1-marcandre.lureau@redhat.com>
References: <20230306122751.2355515-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
index 29a667ae3d..16f8a67f7e 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -310,6 +310,116 @@ bool qemu_socket_unselect(int sockfd, Error **errp)
     return qemu_socket_select(sockfd, NULL, 0, errp);
 }
 
+int qemu_socketpair(int domain, int type, int protocol, int sv[2])
+{
+    struct sockaddr_un addr = {
+        0,
+    };
+    socklen_t socklen;
+    int listener = -1;
+    int client = -1;
+    int server = -1;
+    g_autofree char *path = NULL;
+    int tmpfd;
+    u_long arg;
+    int ret = -1;
+
+    g_return_val_if_fail(sv != NULL, -1);
+
+    addr.sun_family = AF_UNIX;
+    socklen = sizeof(addr);
+
+    tmpfd = g_file_open_tmp(NULL, &path, NULL);
+    if (tmpfd == -1 || !path) {
+        errno = EACCES;
+        goto out;
+    }
+
+    close(tmpfd);
+
+    if (strlen(path) >= sizeof(addr.sun_path)) {
+        errno = EINVAL;
+        goto out;
+    }
+
+    strncpy(addr.sun_path, path, sizeof(addr.sun_path) - 1);
+
+    listener = socket(domain, type, protocol);
+    if (listener == -1) {
+        goto out;
+    }
+
+    if (DeleteFile(path) == 0 && GetLastError() != ERROR_FILE_NOT_FOUND) {
+        errno = EACCES;
+        goto out;
+    }
+    g_clear_pointer(&path, g_free);
+
+    if (bind(listener, (struct sockaddr *)&addr, socklen) == -1) {
+        goto out;
+    }
+
+    if (listen(listener, 1) == -1) {
+        goto out;
+    }
+
+    client = socket(domain, type, protocol);
+    if (client == -1) {
+        goto out;
+    }
+
+    arg = 1;
+    if (ioctlsocket(client, FIONBIO, &arg) != NO_ERROR) {
+        goto out;
+    }
+
+    if (connect(client, (struct sockaddr *)&addr, socklen) == -1 &&
+        WSAGetLastError() != WSAEWOULDBLOCK) {
+        goto out;
+    }
+
+    server = accept(listener, NULL, NULL);
+    if (server == -1) {
+        goto out;
+    }
+
+    arg = 0;
+    if (ioctlsocket(client, FIONBIO, &arg) != NO_ERROR) {
+        goto out;
+    }
+
+    arg = 0;
+    if (ioctlsocket(client, SIO_AF_UNIX_GETPEERPID, &arg) != NO_ERROR) {
+        goto out;
+    }
+
+    if (arg != GetCurrentProcessId()) {
+        errno = EPERM;
+        goto out;
+    }
+
+    sv[0] = server;
+    server = -1;
+    sv[1] = client;
+    client = -1;
+    ret = 0;
+
+out:
+    if (listener != -1) {
+        close(listener);
+    }
+    if (client != -1) {
+        close(client);
+    }
+    if (server != -1) {
+        close(server);
+    }
+    if (path) {
+        DeleteFile(path);
+    }
+    return ret;
+}
+
 #undef connect
 int qemu_connect_wrap(int sockfd, const struct sockaddr *addr,
                       socklen_t addrlen)
-- 
2.39.2


