Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8486B76F7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:55:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbgeL-0003i2-Ee; Mon, 13 Mar 2023 07:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgeD-0002r9-EE
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:47:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgeB-0004Qj-PR
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:47:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678708043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dnYdyit4vi4utaiAgh31x17JZsLcTBYAuwbAle3qcg8=;
 b=Ro1lBkk9pntQhqqcex2YJGv1fA3sKUbYnbxT9NcQsFunnzGXiI7t3VdUNevqlsi3bV+m/k
 CjHwRugy7wGC0lenf2DEiaMr1kAxAnVlW5huNbuZ39szhftli16vdIGUsjz6QdG7ZZD2F7
 9ZYsTdf6zkroIfLBaH0D0l6sIIiEY1g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-P0Uy77FmPKS-6oMq0tIybw-1; Mon, 13 Mar 2023 07:47:19 -0400
X-MC-Unique: P0Uy77FmPKS-6oMq0tIybw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2472185A7A4;
 Mon, 13 Mar 2023 11:47:18 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 642391121315;
 Mon, 13 Mar 2023 11:47:17 +0000 (UTC)
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
Subject: [PULL v2 06/25] win32/socket: introduce qemu_socket_select() helper
Date: Mon, 13 Mar 2023 15:46:29 +0400
Message-Id: <20230313114648.426607-7-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
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

This is a wrapper for WSAEventSelect, with Error handling. By default,
it will produce a warning, so callers don't have to be modified
now, and yet we can spot potential mis-use.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-Id: <20230221124802.4103554-7-marcandre.lureau@redhat.com>
---
 include/sysemu/os-win32.h |  5 +++++
 io/channel-socket.c       |  4 ++--
 io/channel-watch.c        |  6 +++---
 util/aio-win32.c          |  2 +-
 util/main-loop.c          |  6 +++---
 util/oslib-win32.c        | 17 ++++++++++++++++-
 6 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 97d0243aee..9f842ae643 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -29,6 +29,7 @@
 #include <winsock2.h>
 #include <windows.h>
 #include <ws2tcpip.h>
+#include "qemu/typedefs.h"
 
 #ifdef HAVE_AFUNIX_H
 #include <afunix.h>
@@ -164,6 +165,10 @@ static inline void qemu_funlockfile(FILE *f)
 #endif
 }
 
+/* Helper for WSAEventSelect, to report errors */
+bool qemu_socket_select(SOCKET s, WSAEVENT hEventObject,
+                        long lNetworkEvents, Error **errp);
+
 /* We wrap all the sockets functions so that we can
  * set errno based on WSAGetLastError()
  */
diff --git a/io/channel-socket.c b/io/channel-socket.c
index 2040297d2b..0bc29c4808 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -442,7 +442,7 @@ static void qio_channel_socket_finalize(Object *obj)
             }
         }
 #ifdef WIN32
-        WSAEventSelect(ioc->fd, NULL, 0);
+        qemu_socket_select(ioc->fd, NULL, 0, NULL);
 #endif
         closesocket(ioc->fd);
         ioc->fd = -1;
@@ -846,7 +846,7 @@ qio_channel_socket_close(QIOChannel *ioc,
 
     if (sioc->fd != -1) {
 #ifdef WIN32
-        WSAEventSelect(sioc->fd, NULL, 0);
+        qemu_socket_select(sioc->fd, NULL, 0, NULL);
 #endif
         if (qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_LISTEN)) {
             socket_listen_cleanup(sioc->fd, errp);
diff --git a/io/channel-watch.c b/io/channel-watch.c
index ad7c568a84..6ac41009fa 100644
--- a/io/channel-watch.c
+++ b/io/channel-watch.c
@@ -281,9 +281,9 @@ GSource *qio_channel_create_socket_watch(QIOChannel *ioc,
     GSource *source;
     QIOChannelSocketSource *ssource;
 
-    WSAEventSelect(socket, ioc->event,
-                   FD_READ | FD_ACCEPT | FD_CLOSE |
-                   FD_CONNECT | FD_WRITE | FD_OOB);
+    qemu_socket_select(socket, ioc->event,
+                       FD_READ | FD_ACCEPT | FD_CLOSE |
+                       FD_CONNECT | FD_WRITE | FD_OOB, NULL);
 
     source = g_source_new(&qio_channel_socket_source_funcs,
                           sizeof(QIOChannelSocketSource));
diff --git a/util/aio-win32.c b/util/aio-win32.c
index 80cfe012ad..be5136e486 100644
--- a/util/aio-win32.c
+++ b/util/aio-win32.c
@@ -115,7 +115,7 @@ void aio_set_fd_handler(AioContext *ctx,
 
         QLIST_INSERT_HEAD_RCU(&ctx->aio_handlers, node, node);
         event = event_notifier_get_handle(&ctx->notifier);
-        WSAEventSelect(node->pfd.fd, event, bitmask);
+        qemu_socket_select(node->pfd.fd, event, bitmask, NULL);
     }
     if (old_node) {
         aio_remove_fd_handler(ctx, old_node);
diff --git a/util/main-loop.c b/util/main-loop.c
index 3c0f525192..16e837fb12 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -416,9 +416,9 @@ void qemu_del_wait_object(HANDLE handle, WaitObjectFunc *func, void *opaque)
 
 void qemu_fd_register(int fd)
 {
-    WSAEventSelect(fd, event_notifier_get_handle(&qemu_aio_context->notifier),
-                   FD_READ | FD_ACCEPT | FD_CLOSE |
-                   FD_CONNECT | FD_WRITE | FD_OOB);
+    qemu_socket_select(fd, event_notifier_get_handle(&qemu_aio_context->notifier),
+                       FD_READ | FD_ACCEPT | FD_CLOSE |
+                       FD_CONNECT | FD_WRITE | FD_OOB, NULL);
 }
 
 static int pollfds_fill(GArray *pollfds, fd_set *rfds, fd_set *wfds,
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 528c9ee156..df752fc762 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -180,7 +180,7 @@ static int socket_error(void)
 void qemu_socket_set_block(int fd)
 {
     unsigned long opt = 0;
-    WSAEventSelect(fd, NULL, 0);
+    qemu_socket_select(fd, NULL, 0, NULL);
     ioctlsocket(fd, FIONBIO, &opt);
 }
 
@@ -283,6 +283,21 @@ char *qemu_get_pid_name(pid_t pid)
 }
 
 
+bool qemu_socket_select(SOCKET s, WSAEVENT hEventObject,
+                        long lNetworkEvents, Error **errp)
+{
+    if (errp == NULL) {
+        errp = &error_warn;
+    }
+
+    if (WSAEventSelect(s, hEventObject, lNetworkEvents) != 0) {
+        error_setg_win32(errp, WSAGetLastError(), "failed to WSAEventSelect()");
+        return false;
+    }
+
+    return true;
+}
+
 #undef connect
 int qemu_connect_wrap(int sockfd, const struct sockaddr *addr,
                       socklen_t addrlen)
-- 
2.39.2


