Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340A469E0C8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 13:50:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUS5J-0007Ag-RM; Tue, 21 Feb 2023 07:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS5D-0006d4-U0
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:49:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS5B-00083S-0l
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:49:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676983760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sp6kwIhqtONjwt/LU+dqFKsYXP1fg0LOWKTZmEyCtZo=;
 b=A7X0SByOlJ+bYoHJ/4OjestWXXFYUbQSsl5cJ6/zq3owV3eDNl8zcolzqWl13mSdHdZ7Ga
 Vp/kD5tgAhbb+IqWkpDSv7rWkXONAWU1X9gqffU4xDMs2iNFNWvCnFXuhrMdFoAQwjnEfU
 Ywovwqg/gO60u76k6/PkckqsIdjgHI8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-8p4FBp1mNCas0etHElACdQ-1; Tue, 21 Feb 2023 07:49:17 -0500
X-MC-Unique: 8p4FBp1mNCas0etHElACdQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0466A381458C;
 Tue, 21 Feb 2023 12:49:17 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09F66492B00;
 Tue, 21 Feb 2023 12:49:14 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, armbru@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 16/16] win32: replace closesocket() with close() wrapper
Date: Tue, 21 Feb 2023 16:48:01 +0400
Message-Id: <20230221124802.4103554-17-marcandre.lureau@redhat.com>
In-Reply-To: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 include/sysemu/os-posix.h   |  2 --
 include/sysemu/os-win32.h   |  8 +++---
 backends/tpm/tpm_emulator.c |  6 ++--
 crypto/afalg.c              |  6 ++--
 hw/hyperv/syndbg.c          |  4 +--
 io/channel-socket.c         | 10 +++----
 net/dgram.c                 | 14 +++++-----
 net/socket.c                | 22 +++++++--------
 tests/qtest/libqtest.c      |  8 +++---
 tests/qtest/microbit-test.c |  2 +-
 tests/qtest/netdev-socket.c | 10 +++----
 tests/unit/socket-helpers.c |  8 +++---
 util/oslib-win32.c          | 56 +++++++++++++++++++------------------
 util/qemu-sockets.c         | 22 +++++++--------
 14 files changed, 89 insertions(+), 89 deletions(-)

diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
index 378213fc86..1030d39904 100644
--- a/include/sysemu/os-posix.h
+++ b/include/sysemu/os-posix.h
@@ -51,8 +51,6 @@ void os_daemonize(void);
 void os_setup_post(void);
 int os_mlock(void);
 
-#define closesocket(s) close(s)
-
 int os_set_daemonize(bool d);
 bool is_daemonized(void);
 
diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index d440f4e03e..f9a6f71b5a 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -155,6 +155,10 @@ bool qemu_socket_unselect(int sockfd, Error **errp);
  * set errno based on WSAGetLastError()
  */
 
+#undef close
+#define close qemu_close_wrap
+int qemu_close_wrap(int fd);
+
 #undef connect
 #define connect qemu_connect_wrap
 int qemu_connect_wrap(int sockfd, const struct sockaddr *addr,
@@ -186,10 +190,6 @@ int qemu_shutdown_wrap(int sockfd, int how);
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
index d18144b92e..402a2d6312 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -573,13 +573,13 @@ static int tpm_emulator_prepare_data_fd(TPMEmulator *tpm_emu)
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
index 94fe1b534b..065e12fb1e 100644
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
index 03757c7a7e..b0ea7d48b3 100644
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
 
@@ -444,7 +444,7 @@ static void qio_channel_socket_finalize(Object *obj)
 #ifdef WIN32
         qemu_socket_unselect(ioc->fd, NULL);
 #endif
-        closesocket(ioc->fd);
+        close(ioc->fd);
         ioc->fd = -1;
     }
 }
@@ -852,7 +852,7 @@ qio_channel_socket_close(QIOChannel *ioc,
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
index 2bfd460531..dee2032331 100644
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
@@ -564,8 +564,8 @@ void qtest_quit(QTestState *s)
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
index 1d98dca821..614b9bce28 100644
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
index 7836fb0be3..29a667ae3d 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -370,39 +370,39 @@ int qemu_bind_wrap(int sockfd, const struct sockaddr *addr,
 }
 
 
-#undef closesocket
-int qemu_closesocket_wrap(int fd)
+#undef close
+int qemu_close_wrap(int fd)
 {
     int ret;
     DWORD flags = 0;
-    SOCKET s = _get_osfhandle(fd);
+    SOCKET s = INVALID_SOCKET;
 
-    if (s == INVALID_SOCKET) {
-        return -1;
-    }
+    if (fd_is_socket(fd)) {
+        s = _get_osfhandle(fd);
 
-    /*
-     * If we were to just call _close on the descriptor, it would close the
-     * HANDLE, but it wouldn't free any of the resources associated to the
-     * SOCKET, and we can't call _close after calling closesocket, because
-     * closesocket has already closed the HANDLE, and _close would attempt to
-     * close the HANDLE again, resulting in a double free. We can however
-     * protect the HANDLE from actually being closed long enough to close the
-     * file descriptor, then close the socket itself.
-     */
-    if (!GetHandleInformation((HANDLE)s, &flags)) {
-        errno = EACCES;
-        return -1;
-    }
+        /*
+         * If we were to just call _close on the descriptor, it would close the
+         * HANDLE, but it wouldn't free any of the resources associated to the
+         * SOCKET, and we can't call _close after calling closesocket, because
+         * closesocket has already closed the HANDLE, and _close would attempt to
+         * close the HANDLE again, resulting in a double free. We can however
+         * protect the HANDLE from actually being closed long enough to close the
+         * file descriptor, then close the socket itself.
+         */
+        if (!GetHandleInformation((HANDLE)s, &flags)) {
+            errno = EACCES;
+            return -1;
+        }
 
-    if (!SetHandleInformation((HANDLE)s, HANDLE_FLAG_PROTECT_FROM_CLOSE, HANDLE_FLAG_PROTECT_FROM_CLOSE)) {
-        errno = EACCES;
-        return -1;
+        if (!SetHandleInformation((HANDLE)s, HANDLE_FLAG_PROTECT_FROM_CLOSE, HANDLE_FLAG_PROTECT_FROM_CLOSE)) {
+            errno = EACCES;
+            return -1;
+        }
     }
 
     ret = close(fd);
 
-    if (!SetHandleInformation((HANDLE)s, flags, flags)) {
+    if (s != INVALID_SOCKET && !SetHandleInformation((HANDLE)s, flags, flags)) {
         errno = EACCES;
         return -1;
     }
@@ -411,13 +411,15 @@ int qemu_closesocket_wrap(int fd)
      * close() returns EBADF since we PROTECT_FROM_CLOSE the underlying handle,
      * but the FD is actually freed
      */
-    if (ret < 0 && errno != EBADF) {
+    if (ret < 0 && (s == INVALID_SOCKET || errno != EBADF)) {
         return ret;
     }
 
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
2.39.2


