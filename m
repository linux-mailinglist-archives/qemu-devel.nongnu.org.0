Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5C45E92F6
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:09:19 +0200 (CEST)
Received: from localhost ([::1]:32862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQRi-0001fM-TD
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrm-0003AZ-Lk
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:10 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:36390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrk-0006QI-UH
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:10 -0400
Received: by mail-pl1-x62d.google.com with SMTP id c24so3943363plo.3
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=csOaISwTSwLoJpsFvuVDUfystuDYu8jpDcj/GRjEV6A=;
 b=ogKSeqs7uhfc2bi395QMh0UBP807IHIoaQK0YCku8bUDzwN2slpX4Szl/rs7/cXq54
 0NtotQm++GTcKQMC4bFuinImfVSKYAysbe3r9jyaO8uDlLMoBtpBpKp774Ar41xpo1LK
 y5PrAEQH2Pu7ojNdFCS63GhpvJIppO95UY5LIyxRnzjgQAiTDc0S9Y43riLwL5qEAbs6
 CrRPorj4nSa2OQyK2nuFfqf3WiXfxlXRRHIC0SEO54e9uRD6i9lcFVU5ciqVuErrUbF5
 nlqf8K+YfkYbAQfvenxLQFFDakptR2CE5eMLT+JW0RbEieMkdSBkinW5erFYzt4YVofD
 4oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=csOaISwTSwLoJpsFvuVDUfystuDYu8jpDcj/GRjEV6A=;
 b=INo1vrl1jIxafM1IHM91mxZAh6TuOQX40iaOKJlX/mmKS4clkmM3QrAnRgPGdSTQJM
 7ZOVGyC8Mu3rW3mFYS7LvIzljJ1JA9tY87GGOgYF0rQgWZMIrt79UY5lbUtOyP0YTqBD
 BQdKUYf75nehimv3bZ6FgAOCwFx44WbavHDK1CvMXjCgRvhx5fpunF+xerfq6/W1Y8xM
 Vhurke3I4n7EjL7bqMdvPKbPlB1ZPMde5MAZa+Ievb/muICgAerSgCvKIBbu48Gwkm+c
 DVpGUykT3gwmzU+i1VC8QD/IixF7BuYVyCYFlcnrmNe4nDT+lpPyVFPcBChnnGMvQQLK
 QWpQ==
X-Gm-Message-State: ACrzQf0BbJUTL9GKfrRMccMS2IMT8qCBb9oOYnNkiIZ6ebbY6LHw1487
 EZ8mUGQZfZ4KLqxuoPolFeaL7KLMerU=
X-Google-Smtp-Source: AMsMyM5zX/blaCS4kbMNEAwt6fghIeWgCAAo0A026D7p1JnlDPfThdGX+g+Icsyt1DOIfdIJGCQM1A==
X-Received: by 2002:a17:902:e14c:b0:177:e7be:2ab6 with SMTP id
 d12-20020a170902e14c00b00177e7be2ab6mr17017869pla.25.1664105526496; 
 Sun, 25 Sep 2022 04:32:06 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:05 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 33/54] tests/qtest: Use send/recv for socket communication
Date: Sun, 25 Sep 2022 19:30:11 +0800
Message-Id: <20220925113032.1949844-34-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---

(no changes since v2)

Changes in v2:
- Introduce qemu_send_full() and use it

 include/qemu/sockets.h |  2 ++
 tests/qtest/libqmp.c   |  5 +++--
 tests/qtest/libqtest.c |  4 ++--
 util/osdep.c           | 33 +++++++++++++++++++++++++++++++++
 4 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 038faa157f..8ff7832eba 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -15,6 +15,8 @@ int inet_aton(const char *cp, struct in_addr *ia);
 bool fd_is_socket(int fd);
 int qemu_socket(int domain, int type, int protocol);
 int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen);
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
index d8ffa0e7b1..0dfe630373 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -436,7 +436,7 @@ void qtest_quit(QTestState *s)
 
 static void socket_send(int fd, const char *buf, size_t size)
 {
-    size_t res = qemu_write_full(fd, buf, size);
+    ssize_t res = qemu_send_full(fd, buf, size);
 
     assert(res == size);
 }
@@ -468,7 +468,7 @@ static GString *qtest_client_socket_recv_line(QTestState *s)
         ssize_t len;
         char buffer[1024];
 
-        len = read(s->fd, buffer, sizeof(buffer));
+        len = recv(s->fd, buffer, sizeof(buffer), 0);
         if (len == -1 && errno == EINTR) {
             continue;
         }
diff --git a/util/osdep.c b/util/osdep.c
index 60fcbbaebe..0342e754e1 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -502,6 +502,39 @@ int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen)
     return ret;
 }
 
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
2.34.1


