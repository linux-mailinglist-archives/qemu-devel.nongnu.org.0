Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EA850F913
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 11:47:42 +0200 (CEST)
Received: from localhost ([::1]:40392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njHnI-0006Jj-WB
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 05:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHVo-0003sP-Nj
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:29:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHVn-0006O3-0s
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:29:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650965374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4WfgAdqvgq0SLHETH5ZyogofxTn/u/DMkUb5zTJFBDw=;
 b=IZnRAYUA2th2/XbLg8/19kKc9/K6zXSxVt31qclTbh3gldlpxdzqQB56uSnUDh0jlS9qIH
 L/RE5LIAKC4QZOIiIbUzDz88Q4LlNA+97fXAh0f4DEtOdoyj79y3UQJmokDZFFMbvMu5uo
 zO8O1GsGZ2DhE7zHzHpIi7Fay3vTwk4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-M2J81c0NM5WxUp5jUgUfJg-1; Tue, 26 Apr 2022 05:29:31 -0400
X-MC-Unique: M2J81c0NM5WxUp5jUgUfJg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 226D63838C82;
 Tue, 26 Apr 2022 09:29:31 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 018C740D2824;
 Tue, 26 Apr 2022 09:29:28 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/26] Replace fcntl(0_NONBLOCK) with
 g_unix_set_fd_nonblocking()
Date: Tue, 26 Apr 2022 13:27:06 +0400
Message-Id: <20220426092715.3931705-18-marcandre.lureau@redhat.com>
In-Reply-To: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Jason Wang <jasowang@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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
index 1c231087408f..d75dfad6b625 100644
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
+    return g_unix_set_fd_nonblocking(fd, true, NULL) ? 0 : -1;
 }
 
 void qemu_set_nonblock(int fd)
-- 
2.36.0


