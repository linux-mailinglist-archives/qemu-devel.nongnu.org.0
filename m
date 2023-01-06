Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B560E65FCE6
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 09:39:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDi6Y-0002ff-Vr; Fri, 06 Jan 2023 03:29:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDi6Q-0002cd-Px
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:29:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDi6O-0005Xs-1V
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:29:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672993763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gMZAYo5ZEUGaMYWhY38+M+KRqajP53zc1xw/KyMz948=;
 b=dV+gtQ9DxmCDewwE+IP8DqBsUD3h1VHCuxWmrDh6sR1JFjcQjLWNSAoWS36M8G9MI2mJht
 66l4M6FGuwrgJMNob/yXt/ZPw6P9PJSLjxjQ7sXWvUl0Su2sbfe701K3eL2EinSYHJsTLM
 rWdke0A5jbQ8Jp1IVggA4FE3iQ51X30=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-RyvyykXmMKu_DZel4KHJpA-1; Fri, 06 Jan 2023 03:29:15 -0500
X-MC-Unique: RyvyykXmMKu_DZel4KHJpA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15D89802C1C;
 Fri,  6 Jan 2023 08:29:15 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40795492B06;
 Fri,  6 Jan 2023 08:29:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Nikita Ivanov <nivanov@cloudlinux.com>
Subject: [PULL 13/15] Refactoring: refactor TFR() macro to RETRY_ON_EINTR()
Date: Fri,  6 Jan 2023 09:28:51 +0100
Message-Id: <20230106082853.31787-14-thuth@redhat.com>
In-Reply-To: <20230106082853.31787-1-thuth@redhat.com>
References: <20230106082853.31787-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

From: Nikita Ivanov <nivanov@cloudlinux.com>

Rename macro name to more transparent one and refactor
it to expression.

Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
Message-Id: <20221023090422.242617-2-nivanov@cloudlinux.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/qemu/osdep.h   | 8 +++++++-
 chardev/char-fd.c      | 2 +-
 chardev/char-pipe.c    | 8 +++++---
 net/tap-bsd.c          | 6 +++---
 net/tap-linux.c        | 2 +-
 net/tap-solaris.c      | 8 ++++----
 net/tap.c              | 2 +-
 os-posix.c             | 2 +-
 tests/qtest/libqtest.c | 2 +-
 9 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index b9c4307779..7d059ad526 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -251,7 +251,13 @@ void QEMU_ERROR("code path is reachable")
 #define ESHUTDOWN 4099
 #endif
 
-#define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
+#define RETRY_ON_EINTR(expr) \
+    (__extension__                                          \
+        ({ typeof(expr) __result;                               \
+           do {                                             \
+                __result = (expr);         \
+           } while (__result == -1 && errno == EINTR);     \
+           __result; }))
 
 /* time_t may be either 32 or 64 bits depending on the host OS, and
  * can be either signed or unsigned, so we can't just hardcode a
diff --git a/chardev/char-fd.c b/chardev/char-fd.c
index cf78454841..d2c4923359 100644
--- a/chardev/char-fd.c
+++ b/chardev/char-fd.c
@@ -198,7 +198,7 @@ int qmp_chardev_open_file_source(char *src, int flags, Error **errp)
 {
     int fd = -1;
 
-    TFR(fd = qemu_open_old(src, flags, 0666));
+    fd = RETRY_ON_EINTR(qemu_open_old(src, flags, 0666));
     if (fd == -1) {
         error_setg_file_open(errp, errno, src);
     }
diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
index 66d3b85091..5ad30bcc59 100644
--- a/chardev/char-pipe.c
+++ b/chardev/char-pipe.c
@@ -131,8 +131,8 @@ static void qemu_chr_open_pipe(Chardev *chr,
 
     filename_in = g_strdup_printf("%s.in", filename);
     filename_out = g_strdup_printf("%s.out", filename);
-    TFR(fd_in = qemu_open_old(filename_in, O_RDWR | O_BINARY));
-    TFR(fd_out = qemu_open_old(filename_out, O_RDWR | O_BINARY));
+    fd_in = RETRY_ON_EINTR(qemu_open_old(filename_in, O_RDWR | O_BINARY));
+    fd_out = RETRY_ON_EINTR(qemu_open_old(filename_out, O_RDWR | O_BINARY));
     g_free(filename_in);
     g_free(filename_out);
     if (fd_in < 0 || fd_out < 0) {
@@ -142,7 +142,9 @@ static void qemu_chr_open_pipe(Chardev *chr,
         if (fd_out >= 0) {
             close(fd_out);
         }
-        TFR(fd_in = fd_out = qemu_open_old(filename, O_RDWR | O_BINARY));
+        fd_in = fd_out = RETRY_ON_EINTR(
+            qemu_open_old(filename, O_RDWR | O_BINARY)
+        );
         if (fd_in < 0) {
             error_setg_file_open(errp, errno, filename);
             return;
diff --git a/net/tap-bsd.c b/net/tap-bsd.c
index 005ce05c6e..4c98fdd337 100644
--- a/net/tap-bsd.c
+++ b/net/tap-bsd.c
@@ -56,7 +56,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
         } else {
             snprintf(dname, sizeof dname, "/dev/tap%d", i);
         }
-        TFR(fd = open(dname, O_RDWR));
+        fd = RETRY_ON_EINTR(open(dname, O_RDWR));
         if (fd >= 0) {
             break;
         }
@@ -111,7 +111,7 @@ static int tap_open_clone(char *ifname, int ifname_size, Error **errp)
     int fd, s, ret;
     struct ifreq ifr;
 
-    TFR(fd = open(PATH_NET_TAP, O_RDWR));
+    fd = RETRY_ON_EINTR(open(PATH_NET_TAP, O_RDWR));
     if (fd < 0) {
         error_setg_errno(errp, errno, "could not open %s", PATH_NET_TAP);
         return -1;
@@ -159,7 +159,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
     if (ifname[0] != '\0') {
         char dname[100];
         snprintf(dname, sizeof dname, "/dev/%s", ifname);
-        TFR(fd = open(dname, O_RDWR));
+        fd = RETRY_ON_EINTR(open(dname, O_RDWR));
         if (fd < 0 && errno != ENOENT) {
             error_setg_errno(errp, errno, "could not open %s", dname);
             return -1;
diff --git a/net/tap-linux.c b/net/tap-linux.c
index 304ff45071..f54f308d35 100644
--- a/net/tap-linux.c
+++ b/net/tap-linux.c
@@ -45,7 +45,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
     int len = sizeof(struct virtio_net_hdr);
     unsigned int features;
 
-    TFR(fd = open(PATH_NET_TUN, O_RDWR));
+    fd = RETRY_ON_EINTR(open(PATH_NET_TUN, O_RDWR));
     if (fd < 0) {
         error_setg_errno(errp, errno, "could not open %s", PATH_NET_TUN);
         return -1;
diff --git a/net/tap-solaris.c b/net/tap-solaris.c
index a44f8805c2..38e15028bf 100644
--- a/net/tap-solaris.c
+++ b/net/tap-solaris.c
@@ -84,13 +84,13 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
     if( ip_fd )
        close(ip_fd);
 
-    TFR(ip_fd = open("/dev/udp", O_RDWR, 0));
+    ip_fd = RETRY_ON_EINTR(open("/dev/udp", O_RDWR, 0));
     if (ip_fd < 0) {
         error_setg(errp, "Can't open /dev/ip (actually /dev/udp)");
         return -1;
     }
 
-    TFR(tap_fd = open("/dev/tap", O_RDWR, 0));
+    tap_fd = RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
     if (tap_fd < 0) {
         error_setg(errp, "Can't open /dev/tap");
         return -1;
@@ -104,7 +104,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
     if ((ppa = ioctl (tap_fd, I_STR, &strioc_ppa)) < 0)
         error_report("Can't assign new interface");
 
-    TFR(if_fd = open("/dev/tap", O_RDWR, 0));
+    if_fd = RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
     if (if_fd < 0) {
         error_setg(errp, "Can't open /dev/tap (2)");
         return -1;
@@ -137,7 +137,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
     if (ioctl (ip_fd, I_PUSH, "arp") < 0)
         error_report("Can't push ARP module (3)");
     /* Open arp_fd */
-    TFR(arp_fd = open ("/dev/tap", O_RDWR, 0));
+    arp_fd = RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
     if (arp_fd < 0)
         error_report("Can't open %s", "/dev/tap");
 
diff --git a/net/tap.c b/net/tap.c
index e28ceb078f..bd85c56a04 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -650,7 +650,7 @@ static int net_tap_init(const NetdevTapOptions *tap, int *vnet_hdr,
         vnet_hdr_required = 0;
     }
 
-    TFR(fd = tap_open(ifname, ifname_sz, vnet_hdr, vnet_hdr_required,
+    fd = RETRY_ON_EINTR(tap_open(ifname, ifname_sz, vnet_hdr, vnet_hdr_required,
                       mq_required, errp));
     if (fd < 0) {
         return -1;
diff --git a/os-posix.c b/os-posix.c
index 4858650c3e..5adc69f560 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -272,7 +272,7 @@ void os_setup_post(void)
             error_report("not able to chdir to /: %s", strerror(errno));
             exit(1);
         }
-        TFR(fd = qemu_open_old("/dev/null", O_RDWR));
+        fd = RETRY_ON_EINTR(qemu_open_old("/dev/null", O_RDWR));
         if (fd == -1) {
             exit(1);
         }
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 2fbc3b88f3..f9c8987678 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -203,7 +203,7 @@ void qtest_wait_qemu(QTestState *s)
 #ifndef _WIN32
     pid_t pid;
 
-    TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
+    pid = RETRY_ON_EINTR(waitpid(s->qemu_pid, &s->wstatus, 0));
     assert(pid == s->qemu_pid);
 #else
     DWORD ret;
-- 
2.31.1


