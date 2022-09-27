Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC39B5EC349
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:49:41 +0200 (CEST)
Received: from localhost ([::1]:42556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odA1s-00032M-29
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Rh-0003Da-0p
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:13 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Rf-00057G-D3
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:12 -0400
Received: by mail-pf1-x42a.google.com with SMTP id i6so5185368pfb.2
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=csOaISwTSwLoJpsFvuVDUfystuDYu8jpDcj/GRjEV6A=;
 b=pwPHZudPu6BqSuP6Sww9oSFRcGjjk+j3Kycx6gsTfesmgennkeObiG2pnnCE+LeAr7
 iEYNZ0eCTV/F3Pos7sc6awbwsv0fCOmF6x+JhAlj06nSGGitYv0mGisu8bYFqK5/l1VR
 toVnXAR+tw9c/fZOXhGeGiGQ2fF3EHzCJ5rTYFxOR6EX9EQFINaYQqmo1njI6hoyx0Zs
 rM/p3Scrwt0wIZjXGJVt3Iu6AQSPct70aW2+jG/76xasFmuHIiWpqAdMJ6hXVZr6iigm
 6KkJEgf7H4E0uc0Bm1G0I7vEKHNb1+JKFmwuJEZAMdb7puSslxz6sSFx4/YxBERtniVz
 NuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=csOaISwTSwLoJpsFvuVDUfystuDYu8jpDcj/GRjEV6A=;
 b=6P3yvCmaTAksycdJETcnTYLmnTDWboxbTcQpYn2Rl+jGqcAFDP/WJHAWODsHHPRrMr
 eSXmtFtn3cmAGygovRHT0gCDgd9pzugy34spzdQuGZ3x+wg5UcenRNuDNn2PqmgPuuOI
 4xz21Y6lz7nrc4i/oOwph2L+pBWP3b25qvrWVuNfmRPUWJWhzYvaYmE35mBpGrLJlBrR
 OZoMGhrVPq0nEdESt7bbN3XkwTOrMpSMmV87y4FXKE+6wMs66gCaUBLSOVEHNcftgvCk
 1V95+n5dFqCsa65wu3Kga4DMm4oSmf/OuX68Z9EfJRGuC9GGFIzltzn1e86QwfDJVL2t
 KzEQ==
X-Gm-Message-State: ACrzQf0PlHKpKQ3aqnK4Bf3WSdeI+9fV13vp9QmaJDxDYUBJvJmVuHt2
 FixN7RTJqmOcNXXj+w/AK8VNoxr4ILs=
X-Google-Smtp-Source: AMsMyM4xLHbiWKqrua/xJDd805+gcTDRGXnI0dqR01uzYe4Xe7pxirbCoNmSiwZFrPc+HuLf0F0hEw==
X-Received: by 2002:a63:e044:0:b0:43b:ddc9:3885 with SMTP id
 n4-20020a63e044000000b0043bddc93885mr23876873pgj.325.1664276890457; 
 Tue, 27 Sep 2022 04:08:10 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:08:10 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 33/54] tests/qtest: Use send/recv for socket communication
Date: Tue, 27 Sep 2022 19:06:11 +0800
Message-Id: <20220927110632.1973965-34-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42a.google.com
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


