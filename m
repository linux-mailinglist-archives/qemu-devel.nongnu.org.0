Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B538D693A04
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 21:51:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRJJ1-0004kB-Iu; Sun, 12 Feb 2023 15:50:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pRJIb-0004WU-6o
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 15:50:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pRJIY-0002Er-RQ
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 15:50:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676235010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MlVbdDg58wCfU7EMcYRxy3yVsevXRSn0md6UlpbUgtI=;
 b=LyGYz1uETdMgV7pWugAIY5bYRxT3Oj24I8tIpfLtZ2Yb8K6+js354vTqYZqlFoveHMG524
 XbL0jZrCAzcmbBKkZkjiZ7xMK/HukjP6Yg0fEy5JXYCRiQdVDEUglN78W8NrVzDrrtZZ1T
 6wE198NqwmZ/kvU2bt1XeaAz1eV4C2w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-Zr_JqcRANZe3_a9bG7KEAg-1; Sun, 12 Feb 2023 15:50:06 -0500
X-MC-Unique: Zr_JqcRANZe3_a9bG7KEAg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9D0D811E6E;
 Sun, 12 Feb 2023 20:50:04 +0000 (UTC)
Received: from localhost (unknown [10.39.208.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09CE02026D4B;
 Sun, 12 Feb 2023 20:50:02 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 4/4] win32: replace closesocket() with close() wrapper
Date: Mon, 13 Feb 2023 00:49:42 +0400
Message-Id: <20230212204942.1905959-5-marcandre.lureau@redhat.com>
In-Reply-To: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
References: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

Use a close() wrapper instead, so that we don't need to worry about
closesocket() vs close() anymore, let's hope.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/sysemu/os-posix.h   |  1 -
 include/sysemu/os-win32.h   |  8 ++++----
 backends/tpm/tpm_emulator.c |  6 +++---
 crypto/afalg.c              |  6 +++---
 hw/hyperv/syndbg.c          |  4 ++--
 io/channel-socket.c         | 10 +++++-----
 net/dgram.c                 | 14 +++++++-------
 net/socket.c                | 22 +++++++++++-----------
 tests/qtest/libqtest.c      |  8 ++++----
 tests/qtest/microbit-test.c |  2 +-
 tests/qtest/netdev-socket.c | 10 +++++-----
 tests/unit/socket-helpers.c |  8 ++++----
 util/oslib-win32.c          | 21 ++++++++++-----------
 util/qemu-sockets.c         | 22 +++++++++++-----------
 14 files changed, 70 insertions(+), 72 deletions(-)

diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
index 58de7c994d..4c29b72941 100644
--- a/include/sysemu/os-posix.h
+++ b/include/sysemu/os-posix.h
@@ -51,7 +51,6 @@ void os_daemonize(void);
 void os_setup_post(void);
 int os_mlock(void);
 
-#define closesocket(s) close(s)
 #define ioctlsocket(s, r, v) ioctl(s, r, v)
 
 int os_set_daemonize(bool d);
diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 5b38c7bd04..c5008538ec 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -148,6 +148,10 @@ static inline void qemu_funlockfile(FILE *f)
  * set errno based on WSAGetLastError()
  */
 
+#undef close
+#define close qemu_close_wrap
+int qemu_close_wrap(int fd);
+
 #undef connect
 #define connect qemu_connect_wrap
 int qemu_connect_wrap(int sockfd, const struct sockaddr *addr,
@@ -179,10 +183,6 @@ int qemu_shutdown_wrap(int sockfd, int how);
 #define ioctlsocket qemu_ioctlsocket_wrap
 int qemu_ioctlsocket_wrap(int fd, int req, void *val);
 
-#undef closesocket
-#define closesocket qemu_closesocket_wrap
-int qemu_closesocket_wrap(int fd);
-
 #undef getsockopt
 #define getsockopt qemu_getsockopt_wrap
 int qemu_getsockopt_wrap(int sockfd, int level, int optname,
diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index 67e7b212e3..0695febb35 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -574,13 +574,13 @@ static int tpm_emulator_prepare_data_fd(TPMEmulator *tpm_emu)
         goto err_exit;
     }
 
-    closesocket(fds[1]);
+    close(fds[1]);
 
     return 0;
 
 err_exit:
-    closesocket(fds[0]);
-    closesocket(fds[1]);
+    close(fds[0]);
+    close(fds[1]);
     return -1;
 }
 
diff --git a/crypto/afalg.c b/crypto/afalg.c
index 10046bb0ae..348301e703 100644
--- a/crypto/afalg.c
+++ b/crypto/afalg.c
@@ -59,7 +59,7 @@ qcrypto_afalg_socket_bind(const char *type, const char *name,
 
     if (bind(sbind, (const struct sockaddr *)&salg, sizeof(salg)) != 0) {
         error_setg_errno(errp, errno, "Failed to bind socket");
-        closesocket(sbind);
+        close(sbind);
         return -1;
     }
 
@@ -105,11 +105,11 @@ void qcrypto_afalg_comm_free(QCryptoAFAlg *afalg)
     }
 
     if (afalg->tfmfd != -1) {
-        closesocket(afalg->tfmfd);
+        close(afalg->tfmfd);
     }
 
     if (afalg->opfd != -1) {
-        closesocket(afalg->opfd);
+        close(afalg->opfd);
     }
 
     g_free(afalg);
diff --git a/hw/hyperv/syndbg.c b/hw/hyperv/syndbg.c
index 16d04cfdc6..4d5ac71f03 100644
--- a/hw/hyperv/syndbg.c
+++ b/hw/hyperv/syndbg.c
@@ -340,7 +340,7 @@ static void hv_syndbg_realize(DeviceState *dev, Error **errp)
     syndbg->servaddr.sin_family = AF_INET;
     if (connect(syndbg->socket, (struct sockaddr *)&syndbg->servaddr,
                 sizeof(syndbg->servaddr)) < 0) {
-        closesocket(syndbg->socket);
+        close(syndbg->socket);
         error_setg(errp, "%s failed to connect to socket", TYPE_HV_SYNDBG);
         return;
     }
@@ -357,7 +357,7 @@ static void hv_syndbg_unrealize(DeviceState *dev)
 
     if (syndbg->socket > 0) {
         qemu_set_fd_handler(syndbg->socket, NULL, NULL, NULL);
-        closesocket(syndbg->socket);
+        close(syndbg->socket);
     }
 }
 
diff --git a/io/channel-socket.c b/io/channel-socket.c
index 18cc062431..db5f25d780 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -159,7 +159,7 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
 
     trace_qio_channel_socket_connect_complete(ioc, fd);
     if (qio_channel_socket_set_fd(ioc, fd, errp) < 0) {
-        closesocket(fd);
+        close(fd);
         return -1;
     }
 
@@ -233,7 +233,7 @@ int qio_channel_socket_listen_sync(QIOChannelSocket *ioc,
 
     trace_qio_channel_socket_listen_complete(ioc, fd);
     if (qio_channel_socket_set_fd(ioc, fd, errp) < 0) {
-        closesocket(fd);
+        close(fd);
         return -1;
     }
     qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_LISTEN);
@@ -310,7 +310,7 @@ int qio_channel_socket_dgram_sync(QIOChannelSocket *ioc,
 
     trace_qio_channel_socket_dgram_complete(ioc, fd);
     if (qio_channel_socket_set_fd(ioc, fd, errp) < 0) {
-        closesocket(fd);
+        close(fd);
         return -1;
     }
 
@@ -450,7 +450,7 @@ static void qio_channel_socket_finalize(Object *obj)
             }
         }
         wsa_event_clear(ioc->fd);
-        closesocket(ioc->fd);
+        close(ioc->fd);
         ioc->fd = -1;
     }
 }
@@ -856,7 +856,7 @@ qio_channel_socket_close(QIOChannel *ioc,
             socket_listen_cleanup(sioc->fd, errp);
         }
 
-        if (closesocket(sioc->fd) < 0) {
+        if (close(sioc->fd) < 0) {
             sioc->fd = -1;
             error_setg_errno(&err, errno, "Unable to close socket");
             error_propagate(errp, err);
diff --git a/net/dgram.c b/net/dgram.c
index 9f7bf38376..48f653bceb 100644
--- a/net/dgram.c
+++ b/net/dgram.c
@@ -230,7 +230,7 @@ static int net_dgram_mcast_create(struct sockaddr_in *mcastaddr,
     return fd;
 fail:
     if (fd >= 0) {
-        closesocket(fd);
+        close(fd);
     }
     return -1;
 }
@@ -352,7 +352,7 @@ static int net_dgram_mcast_init(NetClientState *peer,
             if (convert_host_port(saddr, local->u.inet.host, local->u.inet.port,
                                   errp) < 0) {
                 g_free(saddr);
-                closesocket(fd);
+                close(fd);
                 return -1;
             }
 
@@ -360,14 +360,14 @@ static int net_dgram_mcast_init(NetClientState *peer,
             if (saddr->sin_addr.s_addr == 0) {
                 error_setg(errp, "can't setup multicast destination address");
                 g_free(saddr);
-                closesocket(fd);
+                close(fd);
                 return -1;
             }
             /* clone dgram socket */
             newfd = net_dgram_mcast_create(saddr, NULL, errp);
             if (newfd < 0) {
                 g_free(saddr);
-                closesocket(fd);
+                close(fd);
                 return -1;
             }
             /* clone newfd to fd, close newfd */
@@ -494,14 +494,14 @@ int net_init_dgram(const Netdev *netdev, const char *name,
         if (ret < 0) {
             error_setg_errno(errp, errno,
                              "can't set socket option SO_REUSEADDR");
-            closesocket(fd);
+            close(fd);
             return -1;
         }
         ret = bind(fd, (struct sockaddr *)&laddr_in, sizeof(laddr_in));
         if (ret < 0) {
             error_setg_errno(errp, errno, "can't bind ip=%s to socket",
                              inet_ntoa(laddr_in.sin_addr));
-            closesocket(fd);
+            close(fd);
             return -1;
         }
         qemu_socket_set_nonblock(fd);
@@ -548,7 +548,7 @@ int net_init_dgram(const Netdev *netdev, const char *name,
         if (ret < 0) {
             error_setg_errno(errp, errno, "can't bind unix=%s to socket",
                              laddr_un.sun_path);
-            closesocket(fd);
+            close(fd);
             return -1;
         }
         qemu_socket_set_nonblock(fd);
diff --git a/net/socket.c b/net/socket.c
index 2fc5696755..ba6e5b0b00 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -172,7 +172,7 @@ static void net_socket_send(void *opaque)
         if (s->listen_fd != -1) {
             qemu_set_fd_handler(s->listen_fd, net_socket_accept, NULL, s);
         }
-        closesocket(s->fd);
+        close(s->fd);
 
         s->fd = -1;
         net_socket_rs_init(&s->rs, net_socket_rs_finalize, false);
@@ -299,7 +299,7 @@ static int net_socket_mcast_create(struct sockaddr_in *mcastaddr,
     return fd;
 fail:
     if (fd >= 0)
-        closesocket(fd);
+        close(fd);
     return -1;
 }
 
@@ -314,7 +314,7 @@ static void net_socket_cleanup(NetClientState *nc)
     }
     if (s->listen_fd != -1) {
         qemu_set_fd_handler(s->listen_fd, NULL, NULL, NULL);
-        closesocket(s->listen_fd);
+        close(s->listen_fd);
         s->listen_fd = -1;
     }
 }
@@ -399,7 +399,7 @@ static NetSocketState *net_socket_fd_init_dgram(NetClientState *peer,
     return s;
 
 err:
-    closesocket(fd);
+    close(fd);
     return NULL;
 }
 
@@ -456,7 +456,7 @@ static NetSocketState *net_socket_fd_init(NetClientState *peer,
     if(getsockopt(fd, SOL_SOCKET, SO_TYPE, (char *)&so_type,
         (socklen_t *)&optlen)< 0) {
         error_setg(errp, "can't get socket option SO_TYPE");
-        closesocket(fd);
+        close(fd);
         return NULL;
     }
     switch(so_type) {
@@ -468,7 +468,7 @@ static NetSocketState *net_socket_fd_init(NetClientState *peer,
     default:
         error_setg(errp, "socket type=%d for fd=%d must be either"
                    " SOCK_DGRAM or SOCK_STREAM", so_type, fd);
-        closesocket(fd);
+        close(fd);
     }
     return NULL;
 }
@@ -526,13 +526,13 @@ static int net_socket_listen_init(NetClientState *peer,
     if (ret < 0) {
         error_setg_errno(errp, errno, "can't bind ip=%s to socket",
                          inet_ntoa(saddr.sin_addr));
-        closesocket(fd);
+        close(fd);
         return -1;
     }
     ret = listen(fd, 0);
     if (ret < 0) {
         error_setg_errno(errp, errno, "can't listen on socket");
-        closesocket(fd);
+        close(fd);
         return -1;
     }
 
@@ -579,7 +579,7 @@ static int net_socket_connect_init(NetClientState *peer,
                 break;
             } else {
                 error_setg_errno(errp, errno, "can't connect socket");
-                closesocket(fd);
+                close(fd);
                 return -1;
             }
         } else {
@@ -671,14 +671,14 @@ static int net_socket_udp_init(NetClientState *peer,
     if (ret < 0) {
         error_setg_errno(errp, errno,
                          "can't set socket option SO_REUSEADDR");
-        closesocket(fd);
+        close(fd);
         return -1;
     }
     ret = bind(fd, (struct sockaddr *)&laddr, sizeof(laddr));
     if (ret < 0) {
         error_setg_errno(errp, errno, "can't bind ip=%s to socket",
                          inet_ntoa(laddr.sin_addr));
-        closesocket(fd);
+        close(fd);
         return -1;
     }
     qemu_socket_set_nonblock(fd);
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index d658222a19..983ae18ca5 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -124,7 +124,7 @@ static int socket_accept(int sock)
                    (void *)&timeout, sizeof(timeout))) {
         fprintf(stderr, "%s failed to set SO_RCVTIMEO: %s\n",
                 __func__, strerror(errno));
-        closesocket(sock);
+        close(sock);
         return -1;
     }
 
@@ -135,7 +135,7 @@ static int socket_accept(int sock)
     if (ret == -1) {
         fprintf(stderr, "%s failed: %s\n", __func__, strerror(errno));
     }
-    closesocket(sock);
+    close(sock);
 
     return ret;
 }
@@ -546,8 +546,8 @@ void qtest_quit(QTestState *s)
     qtest_remove_abrt_handler(s);
 
     qtest_kill_qemu(s);
-    closesocket(s->fd);
-    closesocket(s->qmp_fd);
+    close(s->fd);
+    close(s->qmp_fd);
     g_string_free(s->rx, true);
 
     for (GList *it = s->pending_events; it != NULL; it = it->next) {
diff --git a/tests/qtest/microbit-test.c b/tests/qtest/microbit-test.c
index 4bc267020b..6022a92b6a 100644
--- a/tests/qtest/microbit-test.c
+++ b/tests/qtest/microbit-test.c
@@ -107,7 +107,7 @@ static void test_nrf51_uart(void)
     g_assert_true(recv(sock_fd, s, 10, 0) == 5);
     g_assert_true(memcmp(s, "world", 5) == 0);
 
-    closesocket(sock_fd);
+    close(sock_fd);
 
     qtest_quit(qts);
 }
diff --git a/tests/qtest/netdev-socket.c b/tests/qtest/netdev-socket.c
index 6ba256e173..9b5c52a272 100644
--- a/tests/qtest/netdev-socket.c
+++ b/tests/qtest/netdev-socket.c
@@ -95,7 +95,7 @@ static int inet_get_free_port_multiple(int nb, int *port, bool ipv6)
 
     nb = i;
     for (i = 0; i < nb; i++) {
-        closesocket(sock[i]);
+        close(sock[i]);
     }
 
     return nb;
@@ -262,8 +262,8 @@ static void test_stream_fd(void)
     qtest_quit(qts1);
     qtest_quit(qts0);
 
-    closesocket(sock[0]);
-    closesocket(sock[1]);
+    close(sock[0]);
+    close(sock[1]);
 }
 #endif
 
@@ -388,8 +388,8 @@ static void test_dgram_fd(void)
     qtest_quit(qts1);
     qtest_quit(qts0);
 
-    closesocket(sv[0]);
-    closesocket(sv[1]);
+    close(sv[0]);
+    close(sv[1]);
 }
 #endif
 
diff --git a/tests/unit/socket-helpers.c b/tests/unit/socket-helpers.c
index 914b3aa0cf..6de27baee2 100644
--- a/tests/unit/socket-helpers.c
+++ b/tests/unit/socket-helpers.c
@@ -117,13 +117,13 @@ static int socket_can_bind_connect(const char *hostname, int family)
 
  cleanup:
     if (afd != -1) {
-        closesocket(afd);
+        close(afd);
     }
     if (cfd != -1) {
-        closesocket(cfd);
+        close(cfd);
     }
     if (lfd != -1) {
-        closesocket(lfd);
+        close(lfd);
     }
     if (res) {
         freeaddrinfo(res);
@@ -160,7 +160,7 @@ void socket_check_afunix_support(bool *has_afunix)
     int fd;
 
     fd = socket(PF_UNIX, SOCK_STREAM, 0);
-    closesocket(fd);
+    close(fd);
 
 #ifdef _WIN32
     *has_afunix = (fd != (int)INVALID_SOCKET);
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 78fab521cf..a99f38e7ff 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -436,17 +436,15 @@ int qemu_ioctlsocket_wrap(int fd, int req, void *val)
 }
 
 
-#undef closesocket
-int qemu_closesocket_wrap(int fd)
+#undef close
+int qemu_close_wrap(int fd)
 {
+    SOCKET s = INVALID_SOCKET;
     int ret;
-    SOCKET s = _get_osfhandle(fd);
 
-    if (s == -1) {
-        errno = EINVAL;
-        return -1;
+    if (fd_is_socket(fd)) {
+        s = _get_osfhandle(fd);
     }
-
     /*
      * close() must be called before closesocket(), otherwise close() returns an
      * error and sets EBADF.
@@ -456,10 +454,11 @@ int qemu_closesocket_wrap(int fd)
         return ret;
     }
 
-    /* closesocket() is required, event after close()! */
-    ret = closesocket(s);
-    if (ret < 0) {
-        errno = socket_error();
+    if (s != INVALID_SOCKET) {
+        ret = closesocket(s);
+        if (ret < 0) {
+            errno = socket_error();
+        }
     }
 
     return ret;
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 6538859b87..c06a4dce77 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -326,7 +326,7 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
              * recover from this situation, so we need to recreate the
              * socket to allow bind attempts for subsequent ports:
              */
-            closesocket(slisten);
+            close(slisten);
             slisten = -1;
         }
     }
@@ -337,7 +337,7 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
 listen_failed:
     saved_errno = errno;
     if (slisten >= 0) {
-        closesocket(slisten);
+        close(slisten);
     }
     freeaddrinfo(res);
     errno = saved_errno;
@@ -380,7 +380,7 @@ static int inet_connect_addr(const InetSocketAddress *saddr,
     if (rc < 0) {
         error_setg_errno(errp, errno, "Failed to connect to '%s:%s'",
                          saddr->host, saddr->port);
-        closesocket(sock);
+        close(sock);
         return -1;
     }
 
@@ -483,7 +483,7 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
 
         if (ret < 0) {
             error_setg_errno(errp, errno, "Unable to set KEEPALIVE");
-            closesocket(sock);
+            close(sock);
             return -1;
         }
     }
@@ -580,7 +580,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
 
 err:
     if (sock != -1) {
-        closesocket(sock);
+        close(sock);
     }
     if (local) {
         freeaddrinfo(local);
@@ -777,7 +777,7 @@ static int vsock_connect_addr(const VsockSocketAddress *vaddr,
     if (rc < 0) {
         error_setg_errno(errp, errno, "Failed to connect to '%s:%s'",
                          vaddr->cid, vaddr->port);
-        closesocket(sock);
+        close(sock);
         return -1;
     }
 
@@ -814,13 +814,13 @@ static int vsock_listen_saddr(VsockSocketAddress *vaddr,
 
     if (bind(slisten, (const struct sockaddr *)&svm, sizeof(svm)) != 0) {
         error_setg_errno(errp, errno, "Failed to bind socket");
-        closesocket(slisten);
+        close(slisten);
         return -1;
     }
 
     if (listen(slisten, num) != 0) {
         error_setg_errno(errp, errno, "Failed to listen on socket");
-        closesocket(slisten);
+        close(slisten);
         return -1;
     }
     return slisten;
@@ -978,7 +978,7 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
 
 err:
     g_free(pathbuf);
-    closesocket(sock);
+    close(sock);
     return -1;
 }
 
@@ -1041,7 +1041,7 @@ static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
     return sock;
 
  err:
-    closesocket(sock);
+    close(sock);
     return -1;
 }
 
@@ -1238,7 +1238,7 @@ int socket_listen(SocketAddress *addr, int num, Error **errp)
          */
         if (listen(fd, num) != 0) {
             error_setg_errno(errp, errno, "Failed to listen on fd socket");
-            closesocket(fd);
+            close(fd);
             return -1;
         }
         break;
-- 
2.39.1


