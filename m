Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E25F6027F8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 11:09:13 +0200 (CEST)
Received: from localhost ([::1]:60550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okib1-0003KZ-65
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 05:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1okiDN-0005tJ-Ok
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 04:44:46 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:42945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1okiDG-0004l1-AZ
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 04:44:45 -0400
Received: by mail-lf1-x12a.google.com with SMTP id o12so12929177lfq.9
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 01:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudlinux.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xX1CLWpqmC9MSqh2I5CVq8kkylxVI2wOqn3BrZB8Aew=;
 b=jfaMHF4YAXyW2Io5s9mXLvR5AUYB9jAcgZIWgmkUcWxbuf5rgcS0yDOVQ5IZajRQMD
 Mhrc5fFCABFyRmpZKymAUNSHvyRBJBpFGhUya9XvSgCEUxQbTSxmHifXZSJM25fTQV6Q
 wcKTLWd1hPt3xZKJCSHXImi9pBbcGDaQdsVNiKY/TTLD7onreQzTHtHmHzxcA/iokIP9
 kb1anaEs1QN2U0A5Ht8G0xqSzFPbfJrBg6sqcXPEJDAlwtHSDrJ2PAoTU4gxxjdJErnr
 MiR+h9mXFN/RBoZbPFknbON1QP1Gi7VzQO0qlW01pbeU17lPxge3WVMkp5w5WJvnD1NO
 MmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xX1CLWpqmC9MSqh2I5CVq8kkylxVI2wOqn3BrZB8Aew=;
 b=EJNtE/DWCzr0faK7hhw7moUW5ziYc730lRyWSl2plHBjhyEpQ3w2IWVtAN7yyvDqBT
 AuJsduoN22m0TvSaKRZcM7ZbDamJ9r2kYD3PXAdA+Oc8g9LarXRENcYRTzgD9VYKFNA6
 0STTp5PJlPeI1sqr/L6KGASiP3EGzklGfxcHADUxoOA5WsFilIonnO4WvRap2/S7bwC3
 LgC5LiBL9xBfg9pVi31EpuJb4c5xs2/ggOsy26SXmO/OAGyO46WBKQr2Jd407KbKxvKQ
 xQ9PGFDcGPeOxi1FnLdZfQc8QOG3ZOlgbKu8HhNgyNCAWssadV7u8mCmo9I1UNiusO6L
 ta/g==
X-Gm-Message-State: ACrzQf1CEL8CMj51pxiHSSUW5jtaeZc4kZee4eWz2w/i+ydpwfeUd7P5
 CF99xj++47hsz8eHSepbFAI4P5P4rmF2s8su
X-Google-Smtp-Source: AMsMyM45nAASVv2D2dPqeWF+Y7G7dL30kkr0QbjEfzAgBQUJUnaLFLJZf2ynQY1vQAmskbVPY5tDoA==
X-Received: by 2002:a05:6512:33d1:b0:4a2:119e:1887 with SMTP id
 d17-20020a05651233d100b004a2119e1887mr594206lfg.85.1666082673207; 
 Tue, 18 Oct 2022 01:44:33 -0700 (PDT)
Received: from fedora.. (vist.dozen.mephi.ru. [85.143.113.73])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a05651c03c700b0026e04cc88cfsm1874523ljp.124.2022.10.18.01.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 01:44:32 -0700 (PDT)
From: Nikita Ivanov <nivanov@cloudlinux.com>
To: qemu-devel@nongnu.org
Cc: Nikita Ivanov <nivanov@cloudlinux.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v3 1/2] Refactoring: refactor TFR() macro to RETRY_ON_EINTR()
Date: Tue, 18 Oct 2022 11:43:40 +0300
Message-Id: <20221018084341.16270-2-nivanov@cloudlinux.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018084341.16270-1-nivanov@cloudlinux.com>
References: <20221018084341.16270-1-nivanov@cloudlinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=nivanov@cloudlinux.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Rename macro name to more transparent one and refactor
it to expression.

Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
---
 chardev/char-fd.c      | 2 +-
 chardev/char-pipe.c    | 8 +++++---
 include/qemu/osdep.h   | 8 +++++++-
 net/tap-bsd.c          | 6 +++---
 net/tap-linux.c        | 2 +-
 net/tap-solaris.c      | 8 ++++----
 net/tap.c              | 2 +-
 os-posix.c             | 2 +-
 tests/qtest/libqtest.c | 2 +-
 9 files changed, 24 insertions(+), 16 deletions(-)

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
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index b1c161c035..45fcf5f2dc 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -243,7 +243,13 @@ void QEMU_ERROR("code path is reachable")
 #define ESHUTDOWN 4099
 #endif
 
-#define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
+#define RETRY_ON_EINTR(expr) \
+    (__extension__                                          \
+        ({ typeof(expr) __result;                               \
+           do {                                             \
+                __result = (typeof(expr)) (expr);         \
+           } while (__result == -1 && errno == EINTR);     \
+           __result; }))
 
 /* time_t may be either 32 or 64 bits depending on the host OS, and
  * can be either signed or unsigned, so we can't just hardcode a
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
index e203d07a12..e090d14203 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -651,7 +651,7 @@ static int net_tap_init(const NetdevTapOptions *tap, int *vnet_hdr,
         vnet_hdr_required = 0;
     }
 
-    TFR(fd = tap_open(ifname, ifname_sz, vnet_hdr, vnet_hdr_required,
+    fd = RETRY_ON_EINTR(tap_open(ifname, ifname_sz, vnet_hdr, vnet_hdr_required,
                       mq_required, errp));
     if (fd < 0) {
         return -1;
diff --git a/os-posix.c b/os-posix.c
index 321fc4bd13..bb27f67bac 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -266,7 +266,7 @@ void os_setup_post(void)
             error_report("not able to chdir to /: %s", strerror(errno));
             exit(1);
         }
-        TFR(fd = qemu_open_old("/dev/null", O_RDWR));
+        fd = RETRY_ON_EINTR(qemu_open_old("/dev/null", O_RDWR));
         if (fd == -1) {
             exit(1);
         }
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index b23eb3edc3..90648eb8d1 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -140,7 +140,7 @@ void qtest_kill_qemu(QTestState *s)
     /* Skip wait if qtest_probe_child already reaped.  */
     if (pid != -1) {
         kill(pid, SIGTERM);
-        TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
+        pid = RETRY_ON_EINTR(waitpid(s->qemu_pid, &s->wstatus, 0));
         assert(pid == s->qemu_pid);
         s->qemu_pid = -1;
     }
-- 
2.37.3


