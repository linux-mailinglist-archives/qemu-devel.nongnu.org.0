Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41055190C5
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:59:05 +0200 (CEST)
Received: from localhost ([::1]:49596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm0Xw-00058k-LH
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlz3O-0007XL-1R
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:23:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlz3L-0005Ei-K3
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:23:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651609402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vGAsPEx3J2jPmQD3Acyc8kZGSS2G4k65JexyADFPDzg=;
 b=COUwqyA+8GqVG4txFm6JNjE0FuMUHPHWqZEn7UeOGo610/ramYqLEfbRwu7ssj8ICou3+b
 nkk3TIRn6h9cgVL2u0h9HVa1dqFZY6ffgOX1J2BSW3YEx6m5OFaV8bCl7iE8KR6u4pFJPN
 XEZonsPMgGzAjnRe5tZfmrz1/TzQLCg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-ZWqrCnk-OF2T2o-1FH7JkQ-1; Tue, 03 May 2022 10:42:33 -0400
X-MC-Unique: ZWqrCnk-OF2T2o-1FH7JkQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDB301CE9DAE;
 Tue,  3 May 2022 13:14:12 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4592F7774;
 Tue,  3 May 2022 13:14:07 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 14/23] Replace fcntl(O_NONBLOCK) with
 g_unix_set_fd_nonblocking()
Date: Tue,  3 May 2022 17:12:47 +0400
Message-Id: <20220503131256.187238-15-marcandre.lureau@redhat.com>
In-Reply-To: <20220503131256.187238-1-marcandre.lureau@redhat.com>
References: <20220503131256.187238-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 net/tap-bsd.c                      |  4 ++--
 net/tap-linux.c                    |  2 +-
 net/tap-solaris.c                  |  2 +-
 tests/qtest/fuzz/virtio_net_fuzz.c |  2 +-
 tests/unit/test-iov.c              |  4 ++--
 util/oslib-posix.c                 | 16 ++--------------
 6 files changed, 9 insertions(+), 21 deletions(-)

diff --git a/net/tap-bsd.c b/net/tap-bsd.c
index 7e65bd391f0b..005ce05c6e07 100644
--- a/net/tap-bsd.c
+++ b/net/tap-bsd.c
@@ -98,7 +98,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
             return -1;
         }
     }
-    fcntl(fd, F_SETFL, O_NONBLOCK);
+    g_unix_set_fd_nonblocking(fd, true, NULL);
     return fd;
 }
 
@@ -189,7 +189,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
         goto error;
     }
 
-    fcntl(fd, F_SETFL, O_NONBLOCK);
+    g_unix_set_fd_nonblocking(fd, true, NULL);
     return fd;
 
 error:
diff --git a/net/tap-linux.c b/net/tap-linux.c
index 3e24d232e782..304ff45071dd 100644
--- a/net/tap-linux.c
+++ b/net/tap-linux.c
@@ -113,7 +113,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
         return -1;
     }
     pstrcpy(ifname, ifname_size, ifr.ifr_name);
-    fcntl(fd, F_SETFL, O_NONBLOCK);
+    g_unix_set_fd_nonblocking(fd, true, NULL);
     return fd;
 }
 
diff --git a/net/tap-solaris.c b/net/tap-solaris.c
index 79919785c9f6..a44f8805c23e 100644
--- a/net/tap-solaris.c
+++ b/net/tap-solaris.c
@@ -198,7 +198,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
             return -1;
         }
     }
-    fcntl(fd, F_SETFL, O_NONBLOCK);
+    g_unix_set_fd_nonblocking(fd, true, NULL);
     return fd;
 }
 
diff --git a/tests/qtest/fuzz/virtio_net_fuzz.c b/tests/qtest/fuzz/virtio_net_fuzz.c
index 3df78d9c1c2a..c2c15f07f062 100644
--- a/tests/qtest/fuzz/virtio_net_fuzz.c
+++ b/tests/qtest/fuzz/virtio_net_fuzz.c
@@ -151,7 +151,7 @@ static void *virtio_net_test_setup_socket(GString *cmd_line, void *arg)
 {
     int ret = socketpair(PF_UNIX, SOCK_STREAM, 0, sockfds);
     g_assert_cmpint(ret, !=, -1);
-    fcntl(sockfds[0], F_SETFL, O_NONBLOCK);
+    g_unix_set_fd_nonblocking(sockfds[0], true, NULL);
     sockfds_initialized = true;
     g_string_append_printf(cmd_line, " -netdev socket,fd=%d,id=hs0 ",
                            sockfds[1]);
diff --git a/tests/unit/test-iov.c b/tests/unit/test-iov.c
index 0d2ba9ba87d9..93bda00f0e10 100644
--- a/tests/unit/test-iov.c
+++ b/tests/unit/test-iov.c
@@ -186,7 +186,7 @@ static void test_io(void)
 
        close(sv[0]);
        FD_SET(sv[1], &fds);
-       fcntl(sv[1], F_SETFL, O_RDWR|O_NONBLOCK);
+       g_unix_set_fd_nonblocking(sv[1], true, NULL);
        r = g_test_rand_int_range(sz / 2, sz);
        setsockopt(sv[1], SOL_SOCKET, SO_SNDBUF, &r, sizeof(r));
 
@@ -220,7 +220,7 @@ static void test_io(void)
 
        close(sv[1]);
        FD_SET(sv[0], &fds);
-       fcntl(sv[0], F_SETFL, O_RDWR|O_NONBLOCK);
+       g_unix_set_fd_nonblocking(sv[0], true, NULL);
        r = g_test_rand_int_range(sz / 2, sz);
        setsockopt(sv[0], SOL_SOCKET, SO_RCVBUF, &r, sizeof(r));
        usleep(500000);
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 2a6f6248ad03..72f25e599dba 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -226,24 +226,12 @@ void qemu_anon_ram_free(void *ptr, size_t size)
 
 void qemu_set_block(int fd)
 {
-    int f;
-    f = fcntl(fd, F_GETFL);
-    assert(f != -1);
-    f = fcntl(fd, F_SETFL, f & ~O_NONBLOCK);
-    assert(f != -1);
+    g_unix_set_fd_nonblocking(fd, false, NULL);
 }
 
 int qemu_try_set_nonblock(int fd)
 {
-    int f;
-    f = fcntl(fd, F_GETFL);
-    if (f == -1) {
-        return -errno;
-    }
-    if (fcntl(fd, F_SETFL, f | O_NONBLOCK) == -1) {
-        return -errno;
-    }
-    return 0;
+    return g_unix_set_fd_nonblocking(fd, true, NULL) ? 0 : -errno;
 }
 
 void qemu_set_nonblock(int fd)
-- 
2.36.0.44.g0f828332d5ac


