Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 499805F6B79
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 18:21:34 +0200 (CEST)
Received: from localhost ([::1]:53120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTcq-0002Zh-2Y
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 12:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfL-0004R9-45
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:20:03 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfJ-00060X-70
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:20:02 -0400
Received: by mail-pl1-x634.google.com with SMTP id l4so1989933plb.8
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=80QFJRGf2wqHzaA7G6Y+Ei2sJ8fs6MA6Mk2vEP9/Fec=;
 b=AfEozj0u/MDqzgpUtX3ATXSs1x9GQsvF+GkLDngfVIY8ETEW3tH8/EXsal0+vFuzwI
 +LnFrnz2lnDjfinYhV+ih/v7SQf5BiIFA+1xv2qjt0sxVg4zszGsPO6rgeJ+LFm9vfNE
 pS3FznTjjD+1rC4ljFzAAzRX3ImxZxta4h5O0QJAfSdltQq+9CTozPCLr60Ug19LIYQi
 v/2Nq2g/6W1gfRCDsfT2I9o96ZjBWpzwo0rFluSSnjJjHwU+fwbBJJ6eMcyhHxl2WGXp
 AZW9cgLmX7tXjm+OtnD/zk0kUU/b5pO+qv6vEvFV+MdkiF/OcQVClfKAWcKndrFeWWXR
 qskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=80QFJRGf2wqHzaA7G6Y+Ei2sJ8fs6MA6Mk2vEP9/Fec=;
 b=ivJSx0roxmFOXR3toRv7q/JCUDiY0/o0/XZoLc9gcKBX2WwdLRlR6wfVfSmS99y4KM
 4/Xy/+B6UnJXd+c6mtsM/J2CbRgQmYs3V4qj8fwK4Ut1Icwh0ZqILMTekcitx5wVxFGL
 gpQUc0lAmG8QTENfpN7cGe7zfdiucsxnR8m57wyhgHM5brI0/X3Uz/aKH0BohZI5UNQR
 FAIBZsQSgkHcPCuOfY08dW7uEwmdzUcZ7SJHLmhN1LI4zKxi9sC5EfwXd5Ka9HDX8WSl
 b0EwXkvqAlIGs6DsDWNlpeJ/FhfFV+3OBDsaJIOs7bsB0WMFlW5/kbzfd+DaXU90WB7N
 Ezzg==
X-Gm-Message-State: ACrzQf1mj7ypxUUTV5Toqy+ieyhduwkHJR7/Kesi6U7t1bBX9DxhqMAI
 JCDUcc72mbd4BX79mY99HrUrs+pu6iU=
X-Google-Smtp-Source: AMsMyM4AwW7T5FtFCF4b8BMVLIHrYns5HvLj6Tp76SosBGyCL6PsQ8EVYeKyR7Y/rka0dGoXxKqYhA==
X-Received: by 2002:a17:903:2286:b0:17f:6aeb:a474 with SMTP id
 b6-20020a170903228600b0017f6aeba474mr56360plh.120.1665069599707; 
 Thu, 06 Oct 2022 08:19:59 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902780d00b0017c37a5a2fdsm11426759pll.216.2022.10.06.08.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:19:59 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v5 09/18] tests/qtest: Use send/recv for socket communication
Date: Thu,  6 Oct 2022 23:19:18 +0800
Message-Id: <20221006151927.2079583-10-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151927.2079583-1-bmeng.cn@gmail.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x634.google.com
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
index 036745e586..adf2b21bd9 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -33,6 +33,8 @@ int qemu_socketpair(int domain, int type, int protocol, int sv[2]);
 #endif
 
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
index 4f4b2d6477..8228262938 100644
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


