Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6BE4DADFA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 10:56:32 +0100 (CET)
Received: from localhost ([::1]:34286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUQON-0002Yh-8R
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 05:56:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQKs-000084-5j
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:52:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQKp-0007iZ-RV
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647424371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=H6v8IUwXuXlRIvsW/B4U5YEqxZV/oqitW4JeSKEiqJk=;
 b=RA8ZXHow2wPyEDIDOgGZXBFI8/2kLW7OTsp4vNfqdK684ZcfysB2IC454dqF/40naemfRu
 x1EeCKob+CZnsnvP9Exhe4K2a4k6KvZ0IL3f1Gr9PCn0//0URw3Q4SKCbuYGzs5fTHVskl
 50b/beLpv6mw/NoyjsRwJqEKnXYfN0s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-d_fNogyyPtSdkZHt7yCB_w-1; Wed, 16 Mar 2022 05:52:47 -0400
X-MC-Unique: d_fNogyyPtSdkZHt7yCB_w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5A373C11C66;
 Wed, 16 Mar 2022 09:52:46 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5F8440FF40D;
 Wed, 16 Mar 2022 09:52:43 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 06/27] Drop qemu_foo() socket API wrapper
Date: Wed, 16 Mar 2022 13:52:41 +0400
Message-Id: <20220316095242.2613586-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Li Zhijian <lizhijian@fujitsu.com>, Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 "open list:Nuvoton NPCM7xx" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The socket API wrappers were initially introduced in commit
00aa0040 ("Wrap recv to avoid warnings"), but made redundant with
commit a2d96af4 ("osdep: add wrappers for socket functions") which fixes
the win32 declarations and thus removed the earlier warnings.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu-common.h                | 19 -------------------
 crypto/cipher-afalg.c                |  4 ++--
 crypto/hash-afalg.c                  |  4 ++--
 gdbstub.c                            |  2 +-
 io/channel-socket.c                  |  6 +++---
 net/socket.c                         | 24 ++++++++++++------------
 tests/qtest/e1000e-test.c            |  4 ++--
 tests/qtest/libqtest.c               |  4 ++--
 tests/qtest/npcm7xx_emc-test.c       |  4 ++--
 tests/qtest/test-filter-mirror.c     |  4 ++--
 tests/qtest/test-filter-redirector.c |  8 ++++----
 tests/qtest/virtio-net-test.c        | 10 +++++-----
 tests/unit/socket-helpers.c          |  2 +-
 util/osdep.c                         |  4 ++--
 util/qemu-sockets.c                  | 10 +++++-----
 15 files changed, 45 insertions(+), 64 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index c9f7dd7e193a..a049ac073874 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -33,25 +33,6 @@ ssize_t qemu_write_full(int fd, const void *buf, size_t count)
 int qemu_pipe(int pipefd[2]);
 #endif
 
-#ifdef _WIN32
-/* MinGW needs type casts for the 'buf' and 'optval' arguments. */
-#define qemu_getsockopt(sockfd, level, optname, optval, optlen) \
-    getsockopt(sockfd, level, optname, (void *)optval, optlen)
-#define qemu_setsockopt(sockfd, level, optname, optval, optlen) \
-    setsockopt(sockfd, level, optname, (const void *)optval, optlen)
-#define qemu_recv(sockfd, buf, len, flags) recv(sockfd, (void *)buf, len, flags)
-#define qemu_sendto(sockfd, buf, len, flags, destaddr, addrlen) \
-    sendto(sockfd, (const void *)buf, len, flags, destaddr, addrlen)
-#else
-#define qemu_getsockopt(sockfd, level, optname, optval, optlen) \
-    getsockopt(sockfd, level, optname, optval, optlen)
-#define qemu_setsockopt(sockfd, level, optname, optval, optlen) \
-    setsockopt(sockfd, level, optname, optval, optlen)
-#define qemu_recv(sockfd, buf, len, flags) recv(sockfd, buf, len, flags)
-#define qemu_sendto(sockfd, buf, len, flags, destaddr, addrlen) \
-    sendto(sockfd, buf, len, flags, destaddr, addrlen)
-#endif
-
 void cpu_exec_init_all(void);
 void cpu_exec_step_atomic(CPUState *cpu);
 
diff --git a/crypto/cipher-afalg.c b/crypto/cipher-afalg.c
index 052355a8a921..c55cd28bf01c 100644
--- a/crypto/cipher-afalg.c
+++ b/crypto/cipher-afalg.c
@@ -84,8 +84,8 @@ qcrypto_afalg_cipher_ctx_new(QCryptoCipherAlgorithm alg,
     g_free(name);
 
     /* setkey */
-    if (qemu_setsockopt(afalg->tfmfd, SOL_ALG, ALG_SET_KEY, key,
-                        nkey) != 0) {
+    if (setsockopt(afalg->tfmfd, SOL_ALG, ALG_SET_KEY, key,
+                   nkey) != 0) {
         error_setg_errno(errp, errno, "Set key failed");
         qcrypto_afalg_comm_free(afalg);
         return NULL;
diff --git a/crypto/hash-afalg.c b/crypto/hash-afalg.c
index cf34c694af6f..4ac18c7c1db7 100644
--- a/crypto/hash-afalg.c
+++ b/crypto/hash-afalg.c
@@ -88,8 +88,8 @@ qcrypto_afalg_hash_hmac_ctx_new(QCryptoHashAlgorithm alg,
 
     /* HMAC needs setkey */
     if (is_hmac) {
-        if (qemu_setsockopt(afalg->tfmfd, SOL_ALG, ALG_SET_KEY,
-                            key, nkey) != 0) {
+        if (setsockopt(afalg->tfmfd, SOL_ALG, ALG_SET_KEY,
+                       key, nkey) != 0) {
             error_setg_errno(errp, errno, "Set hmac key failed");
             qcrypto_afalg_comm_free(afalg);
             return NULL;
diff --git a/gdbstub.c b/gdbstub.c
index 3c14c6a03831..c8375e3c3ffe 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -426,7 +426,7 @@ static int get_char(void)
     int ret;
 
     for(;;) {
-        ret = qemu_recv(gdbserver_state.fd, &ch, 1, 0);
+        ret = recv(gdbserver_state.fd, &ch, 1, 0);
         if (ret < 0) {
             if (errno == ECONNRESET)
                 gdbserver_state.fd = -1;
diff --git a/io/channel-socket.c b/io/channel-socket.c
index 459922c87480..7a8d9f69c92d 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -681,9 +681,9 @@ qio_channel_socket_set_delay(QIOChannel *ioc,
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
     int v = enabled ? 0 : 1;
 
-    qemu_setsockopt(sioc->fd,
-                    IPPROTO_TCP, TCP_NODELAY,
-                    &v, sizeof(v));
+    setsockopt(sioc->fd,
+               IPPROTO_TCP, TCP_NODELAY,
+               &v, sizeof(v));
 }
 
 
diff --git a/net/socket.c b/net/socket.c
index 15b410e8d825..c4b80e9228d7 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -120,9 +120,9 @@ static ssize_t net_socket_receive_dgram(NetClientState *nc, const uint8_t *buf,
 
     do {
         if (s->dgram_dst.sin_family != AF_UNIX) {
-            ret = qemu_sendto(s->fd, buf, size, 0,
-                              (struct sockaddr *)&s->dgram_dst,
-                              sizeof(s->dgram_dst));
+            ret = sendto(s->fd, buf, size, 0,
+                         (struct sockaddr *)&s->dgram_dst,
+                         sizeof(s->dgram_dst));
         } else {
             ret = send(s->fd, buf, size, 0);
         }
@@ -163,7 +163,7 @@ static void net_socket_send(void *opaque)
     uint8_t buf1[NET_BUFSIZE];
     const uint8_t *buf;
 
-    size = qemu_recv(s->fd, buf1, sizeof(buf1), 0);
+    size = recv(s->fd, buf1, sizeof(buf1), 0);
     if (size < 0) {
         if (errno != EWOULDBLOCK)
             goto eoc;
@@ -198,7 +198,7 @@ static void net_socket_send_dgram(void *opaque)
     NetSocketState *s = opaque;
     int size;
 
-    size = qemu_recv(s->fd, s->rs.buf, sizeof(s->rs.buf), 0);
+    size = recv(s->fd, s->rs.buf, sizeof(s->rs.buf), 0);
     if (size < 0)
         return;
     if (size == 0) {
@@ -246,7 +246,7 @@ static int net_socket_mcast_create(struct sockaddr_in *mcastaddr,
      * only on posix systems.
      */
     val = 1;
-    ret = qemu_setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &val, sizeof(val));
+    ret = setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &val, sizeof(val));
     if (ret < 0) {
         error_setg_errno(errp, errno,
                          "can't set socket option SO_REUSEADDR");
@@ -268,8 +268,8 @@ static int net_socket_mcast_create(struct sockaddr_in *mcastaddr,
         imr.imr_interface.s_addr = htonl(INADDR_ANY);
     }
 
-    ret = qemu_setsockopt(fd, IPPROTO_IP, IP_ADD_MEMBERSHIP,
-                          &imr, sizeof(struct ip_mreq));
+    ret = setsockopt(fd, IPPROTO_IP, IP_ADD_MEMBERSHIP,
+                     &imr, sizeof(struct ip_mreq));
     if (ret < 0) {
         error_setg_errno(errp, errno,
                          "can't add socket to multicast group %s",
@@ -279,8 +279,8 @@ static int net_socket_mcast_create(struct sockaddr_in *mcastaddr,
 
     /* Force mcast msgs to loopback (eg. several QEMUs in same host */
     loop = 1;
-    ret = qemu_setsockopt(fd, IPPROTO_IP, IP_MULTICAST_LOOP,
-                          &loop, sizeof(loop));
+    ret = setsockopt(fd, IPPROTO_IP, IP_MULTICAST_LOOP,
+                     &loop, sizeof(loop));
     if (ret < 0) {
         error_setg_errno(errp, errno,
                          "can't force multicast message to loopback");
@@ -289,8 +289,8 @@ static int net_socket_mcast_create(struct sockaddr_in *mcastaddr,
 
     /* If a bind address is given, only send packets from that address */
     if (localaddr != NULL) {
-        ret = qemu_setsockopt(fd, IPPROTO_IP, IP_MULTICAST_IF,
-                              localaddr, sizeof(*localaddr));
+        ret = setsockopt(fd, IPPROTO_IP, IP_MULTICAST_IF,
+                         localaddr, sizeof(*localaddr));
         if (ret < 0) {
             error_setg_errno(errp, errno,
                              "can't set the default network send interface");
diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
index 0273fe4c1566..e648fdd409cd 100644
--- a/tests/qtest/e1000e-test.c
+++ b/tests/qtest/e1000e-test.c
@@ -91,9 +91,9 @@ static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *a
     g_assert_cmphex(le32_to_cpu(descr.upper.data) & dsta_dd, ==, dsta_dd);
 
     /* Check data sent to the backend */
-    ret = qemu_recv(test_sockets[0], &recv_len, sizeof(recv_len), 0);
+    ret = recv(test_sockets[0], &recv_len, sizeof(recv_len), 0);
     g_assert_cmpint(ret, == , sizeof(recv_len));
-    ret = qemu_recv(test_sockets[0], buffer, 64, 0);
+    ret = recv(test_sockets[0], buffer, 64, 0);
     g_assert_cmpint(ret, >=, 5);
     g_assert_cmpstr(buffer, == , "TEST");
 
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 41f4da4e54fc..9dac018fcba0 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -94,8 +94,8 @@ static int socket_accept(int sock)
     struct timeval timeout = { .tv_sec = SOCKET_TIMEOUT,
                                .tv_usec = 0 };
 
-    if (qemu_setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO,
-                        (void *)&timeout, sizeof(timeout))) {
+    if (setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO,
+                   (void *)&timeout, sizeof(timeout))) {
         fprintf(stderr, "%s failed to set SO_RCVTIMEO: %s\n",
                 __func__, strerror(errno));
         close(sock);
diff --git a/tests/qtest/npcm7xx_emc-test.c b/tests/qtest/npcm7xx_emc-test.c
index 9eec71d87c1f..7c435ac91576 100644
--- a/tests/qtest/npcm7xx_emc-test.c
+++ b/tests/qtest/npcm7xx_emc-test.c
@@ -521,12 +521,12 @@ static void emc_send_verify1(QTestState *qts, const EMCModule *mod, int fd,
 
     /* Check data sent to the backend. */
     recv_len = ~0;
-    ret = qemu_recv(fd, &recv_len, sizeof(recv_len), MSG_DONTWAIT);
+    ret = recv(fd, &recv_len, sizeof(recv_len), MSG_DONTWAIT);
     g_assert_cmpint(ret, == , sizeof(recv_len));
 
     g_assert(wait_socket_readable(fd));
     memset(buffer, 0xff, sizeof(buffer));
-    ret = qemu_recv(fd, buffer, test_size, MSG_DONTWAIT);
+    ret = recv(fd, buffer, test_size, MSG_DONTWAIT);
     g_assert_cmpmem(buffer, ret, test_data, test_size);
 }
 
diff --git a/tests/qtest/test-filter-mirror.c b/tests/qtest/test-filter-mirror.c
index 95367d14d36d..da4f94de727a 100644
--- a/tests/qtest/test-filter-mirror.c
+++ b/tests/qtest/test-filter-mirror.c
@@ -58,13 +58,13 @@ static void test_mirror(void)
     g_assert_cmpint(ret, ==, sizeof(send_buf) + sizeof(size));
     close(send_sock[0]);
 
-    ret = qemu_recv(recv_sock[0], &len, sizeof(len), 0);
+    ret = recv(recv_sock[0], &len, sizeof(len), 0);
     g_assert_cmpint(ret, ==, sizeof(len));
     len = ntohl(len);
 
     g_assert_cmpint(len, ==, sizeof(send_buf));
     recv_buf = g_malloc(len);
-    ret = qemu_recv(recv_sock[0], recv_buf, len, 0);
+    ret = recv(recv_sock[0], recv_buf, len, 0);
     g_assert_cmpstr(recv_buf, ==, send_buf);
 
     g_free(recv_buf);
diff --git a/tests/qtest/test-filter-redirector.c b/tests/qtest/test-filter-redirector.c
index 4f3f59cba865..fc16cf7e8d5f 100644
--- a/tests/qtest/test-filter-redirector.c
+++ b/tests/qtest/test-filter-redirector.c
@@ -115,13 +115,13 @@ static void test_redirector_tx(void)
     g_assert_cmpint(ret, ==, sizeof(send_buf) + sizeof(size));
     close(backend_sock[0]);
 
-    ret = qemu_recv(recv_sock, &len, sizeof(len), 0);
+    ret = recv(recv_sock, &len, sizeof(len), 0);
     g_assert_cmpint(ret, ==, sizeof(len));
     len = ntohl(len);
 
     g_assert_cmpint(len, ==, sizeof(send_buf));
     recv_buf = g_malloc(len);
-    ret = qemu_recv(recv_sock, recv_buf, len, 0);
+    ret = recv(recv_sock, recv_buf, len, 0);
     g_assert_cmpstr(recv_buf, ==, send_buf);
 
     g_free(recv_buf);
@@ -182,13 +182,13 @@ static void test_redirector_rx(void)
     ret = iov_send(send_sock, iov, 2, 0, sizeof(size) + sizeof(send_buf));
     g_assert_cmpint(ret, ==, sizeof(send_buf) + sizeof(size));
 
-    ret = qemu_recv(backend_sock[0], &len, sizeof(len), 0);
+    ret = recv(backend_sock[0], &len, sizeof(len), 0);
     g_assert_cmpint(ret, ==, sizeof(len));
     len = ntohl(len);
 
     g_assert_cmpint(len, ==, sizeof(send_buf));
     recv_buf = g_malloc(len);
-    ret = qemu_recv(backend_sock[0], recv_buf, len, 0);
+    ret = recv(backend_sock[0], recv_buf, len, 0);
     g_assert_cmpstr(recv_buf, ==, send_buf);
 
     close(send_sock);
diff --git a/tests/qtest/virtio-net-test.c b/tests/qtest/virtio-net-test.c
index 8bf74e516cce..a71395849f33 100644
--- a/tests/qtest/virtio-net-test.c
+++ b/tests/qtest/virtio-net-test.c
@@ -87,11 +87,11 @@ static void tx_test(QVirtioDevice *dev,
                            QVIRTIO_NET_TIMEOUT_US);
     guest_free(alloc, req_addr);
 
-    ret = qemu_recv(socket, &len, sizeof(len), 0);
+    ret = recv(socket, &len, sizeof(len), 0);
     g_assert_cmpint(ret, ==, sizeof(len));
     len = ntohl(len);
 
-    ret = qemu_recv(socket, buffer, len, 0);
+    ret = recv(socket, buffer, len, 0);
     g_assert_cmpstr(buffer, ==, "TEST");
 }
 
@@ -202,11 +202,11 @@ static void announce_self(void *obj, void *data, QGuestAllocator *t_alloc)
     qobject_unref(rsp);
 
     /* Catch the first packet and make sure it's a RARP */
-    ret = qemu_recv(sv[0], &len, sizeof(len), 0);
+    ret = recv(sv[0], &len, sizeof(len), 0);
     g_assert_cmpint(ret, ==,  sizeof(len));
     len = ntohl(len);
 
-    ret = qemu_recv(sv[0], buffer, len, 0);
+    ret = recv(sv[0], buffer, len, 0);
     g_assert_cmpint(*proto, ==, htons(ETH_P_RARP));
 
     /*
@@ -230,7 +230,7 @@ static void announce_self(void *obj, void *data, QGuestAllocator *t_alloc)
 
     while (true) {
         int saved_err;
-        ret = qemu_recv(sv[0], buffer, 60, MSG_DONTWAIT);
+        ret = recv(sv[0], buffer, 60, MSG_DONTWAIT);
         saved_err = errno;
         now = g_get_monotonic_time();
         g_assert_cmpint(now, <, deadline);
diff --git a/tests/unit/socket-helpers.c b/tests/unit/socket-helpers.c
index f704fd1a69ce..ef31664d0224 100644
--- a/tests/unit/socket-helpers.c
+++ b/tests/unit/socket-helpers.c
@@ -105,7 +105,7 @@ static int socket_can_bind_connect(const char *hostname, int family)
     }
 
     if (check_soerr) {
-        if (qemu_getsockopt(cfd, SOL_SOCKET, SO_ERROR, &soerr, &soerrlen) < 0) {
+        if (getsockopt(cfd, SOL_SOCKET, SO_ERROR, &soerr, &soerrlen) < 0) {
             goto cleanup;
         }
         if (soerr) {
diff --git a/util/osdep.c b/util/osdep.c
index 7c4deda6feba..af1d3c96396c 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -49,7 +49,7 @@ static const char *hw_version = QEMU_HW_VERSION;
 int socket_set_cork(int fd, int v)
 {
 #if defined(SOL_TCP) && defined(TCP_CORK)
-    return qemu_setsockopt(fd, SOL_TCP, TCP_CORK, &v, sizeof(v));
+    return setsockopt(fd, SOL_TCP, TCP_CORK, &v, sizeof(v));
 #else
     return 0;
 #endif
@@ -58,7 +58,7 @@ int socket_set_cork(int fd, int v)
 int socket_set_nodelay(int fd)
 {
     int v = 1;
-    return qemu_setsockopt(fd, IPPROTO_TCP, TCP_NODELAY, &v, sizeof(v));
+    return setsockopt(fd, IPPROTO_TCP, TCP_NODELAY, &v, sizeof(v));
 }
 
 int qemu_madvise(void *addr, size_t len, int advice)
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 0585e7a6298e..e8f45a7d30a5 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -97,7 +97,7 @@ bool fd_is_socket(int fd)
 {
     int optval;
     socklen_t optlen = sizeof(optval);
-    return !qemu_getsockopt(fd, SOL_SOCKET, SO_TYPE, &optval, &optlen);
+    return !getsockopt(fd, SOL_SOCKET, SO_TYPE, &optval, &optlen);
 }
 
 
@@ -185,8 +185,8 @@ static int try_bind(int socket, InetSocketAddress *saddr, struct addrinfo *e)
 
  rebind:
     if (e->ai_family == PF_INET6) {
-        qemu_setsockopt(socket, IPPROTO_IPV6, IPV6_V6ONLY, &v6only,
-                        sizeof(v6only));
+        setsockopt(socket, IPPROTO_IPV6, IPV6_V6ONLY, &v6only,
+                   sizeof(v6only));
     }
 
     stat = bind(socket, e->ai_addr, e->ai_addrlen);
@@ -483,8 +483,8 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
 
     if (saddr->keep_alive) {
         int val = 1;
-        int ret = qemu_setsockopt(sock, SOL_SOCKET, SO_KEEPALIVE,
-                                  &val, sizeof(val));
+        int ret = setsockopt(sock, SOL_SOCKET, SO_KEEPALIVE,
+                             &val, sizeof(val));
 
         if (ret < 0) {
             error_setg_errno(errp, errno, "Unable to set KEEPALIVE");
-- 
2.35.1.273.ge6ebfd0e8cbb


