Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65756112B8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:28:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPLP-00021d-MZ; Fri, 28 Oct 2022 09:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKf-0001JY-UH
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKe-0005Js-8g
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666963411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BnjOooUnlEXJpEdxh0xo5mHMvnFcRwN2oIxVw4lxem0=;
 b=ZQxTewaT09zxABGj9jxfzNQSCk4hWpDqRy5gcySP0AkS2bv+Ov9VNTxgffz50vEWmRArKn
 +CTtZE88acVGpI3VSih5SdZx572vWG2joolFC67a5x8qvVM/xO4PFNw/JmXa7WbwiJsZCT
 trb/2555Q3yUK0Ril7aO+g5qym19o4s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-XV_RxKZQMyO5MPrukw8eqw-1; Fri, 28 Oct 2022 09:23:30 -0400
X-MC-Unique: XV_RxKZQMyO5MPrukw8eqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B4EB185A7A3;
 Fri, 28 Oct 2022 13:23:30 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C42701121319;
 Fri, 28 Oct 2022 13:23:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 14/21] tests/qtest: Use send/recv for socket communication
Date: Fri, 28 Oct 2022 15:22:57 +0200
Message-Id: <20221028132304.829103-15-thuth@redhat.com>
In-Reply-To: <20221028132304.829103-1-thuth@redhat.com>
References: <20221028132304.829103-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Socket communication in the libqtest and libqmp codes uses read()
and write() which work on any file descriptor on *nix, and sockets
in *nix are an example of a file descriptor.

However sockets on Windows do not use *nix-style file descriptors,
so read() and write() cannot be used on sockets on Windows.
Switch over to use send() and recv() instead which work on both
Windows and *nix.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20221028045736.679903-3-bin.meng@windriver.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/qemu/sockets.h | 13 +++++++++++++
 tests/qtest/libqmp.c   |  5 +++--
 tests/qtest/libqtest.c |  5 +++--
 util/osdep.c           | 22 ++++++++++++++++++++++
 4 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 036745e586..61648f3f3c 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -33,6 +33,19 @@ int qemu_socketpair(int domain, int type, int protocol, int sv[2]);
 #endif
 
 int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen);
+/*
+ * A variant of send(2) which handles partial send.
+ *
+ * Return the number of bytes transferred over the socket.
+ * Set errno if fewer than `count' bytes are sent.
+ *
+ * This function don't work with non-blocking socket's.
+ * Any of the possibilities with non-blocking socket's is bad:
+ *   - return a short write (then name is wrong)
+ *   - busy wait adding (errno == EAGAIN) to the loop
+ */
+ssize_t qemu_send_full(int s, const void *buf, size_t count)
+    G_GNUC_WARN_UNUSED_RESULT;
 int socket_set_cork(int fd, int v);
 int socket_set_nodelay(int fd);
 void qemu_socket_set_block(int fd);
diff --git a/tests/qtest/libqmp.c b/tests/qtest/libqmp.c
index ade26c15f0..2b08382e5d 100644
--- a/tests/qtest/libqmp.c
+++ b/tests/qtest/libqmp.c
@@ -23,6 +23,7 @@
 #endif
 
 #include "qemu/cutils.h"
+#include "qemu/sockets.h"
 #include "qapi/error.h"
 #include "qapi/qmp/json-parser.h"
 #include "qapi/qmp/qjson.h"
@@ -36,7 +37,7 @@ typedef struct {
 
 static void socket_send(int fd, const char *buf, size_t size)
 {
-    size_t res = qemu_write_full(fd, buf, size);
+    ssize_t res = qemu_send_full(fd, buf, size);
 
     assert(res == size);
 }
@@ -69,7 +70,7 @@ QDict *qmp_fd_receive(int fd)
         ssize_t len;
         char c;
 
-        len = read(fd, &c, 1);
+        len = recv(fd, &c, 1, 0);
         if (len == -1 && errno == EINTR) {
             continue;
         }
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index b23eb3edc3..b01846fd98 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -27,6 +27,7 @@
 #include "libqmp.h"
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
+#include "qemu/sockets.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qjson.h"
 #include "qapi/qmp/qlist.h"
@@ -428,7 +429,7 @@ void qtest_quit(QTestState *s)
 
 static void socket_send(int fd, const char *buf, size_t size)
 {
-    size_t res = qemu_write_full(fd, buf, size);
+    ssize_t res = qemu_send_full(fd, buf, size);
 
     assert(res == size);
 }
@@ -460,7 +461,7 @@ static GString *qtest_client_socket_recv_line(QTestState *s)
         ssize_t len;
         char buffer[1024];
 
-        len = read(s->fd, buffer, sizeof(buffer));
+        len = recv(s->fd, buffer, sizeof(buffer), 0);
         if (len == -1 && errno == EINTR) {
             continue;
         }
diff --git a/util/osdep.c b/util/osdep.c
index 746d5f7d71..77c1a6c562 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -502,6 +502,28 @@ int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen)
     return ret;
 }
 
+ssize_t qemu_send_full(int s, const void *buf, size_t count)
+{
+    ssize_t ret = 0;
+    ssize_t total = 0;
+
+    while (count) {
+        ret = send(s, buf, count, 0);
+        if (ret < 0) {
+            if (errno == EINTR) {
+                continue;
+            }
+            break;
+        }
+
+        count -= ret;
+        buf += ret;
+        total += ret;
+    }
+
+    return total;
+}
+
 void qemu_set_hw_version(const char *version)
 {
     hw_version = version;
-- 
2.31.1


