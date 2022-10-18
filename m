Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A9A6027F9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 11:09:18 +0200 (CEST)
Received: from localhost ([::1]:42326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okib6-0003eE-K3
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 05:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1okiDZ-0005xl-C5
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 04:44:58 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:36853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1okiDM-0004la-KO
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 04:44:57 -0400
Received: by mail-lf1-x130.google.com with SMTP id bu25so21451240lfb.3
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 01:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudlinux.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xKd2hc21G0FHoZaTHAW68u0taUzAr0Wqblrk+XyXJeM=;
 b=E1XPmVAY58vPaDxyQrF4WI7EzbPjElk3L1swRsDjiOnd37cv1dsLtNgXNBptn3M78E
 hoHzyBjg2BpX84T7PAcGYYSmFJaBcV3r+Mjdet27SyYQzdUIOHWAw9q2Kbj7Ip79p+hn
 +2lAO/NVi5mivrdBYVp3jY9xIgyR3nUVMfJBIA6X5oTUyAuHqvMqvtTe+PYiNev6rxZw
 o3wzfizRfnPDEvwGOHz0zWfYUyZCbchq+DrDnp7ogO6PrxCalEy3zoeRN4bE7G9yiSru
 sqRehtvfIItD6tQblYl5VwCs0dwnlIi6yap7z4odoI+PyTqPZhC0dH4BzwG1Dru2xfJ5
 fdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xKd2hc21G0FHoZaTHAW68u0taUzAr0Wqblrk+XyXJeM=;
 b=1q6pANLpFWzX8qZ2YP61fCturKGRKx+z3X93uLgGMUYefyOtRAquKJJpn5zmS7eL6X
 mTkRrHbj0mWvAKmlNIxfwVheQnSrhsUiuv7u4hBgQtsRNrAn/vnA/Jz8Rsoc4/zWWWYF
 OATMlo6QW1O3y3BFNaA5Qnu6cPfAij78dcnT9t3wp2qY69+pnGQuWC9MUoWDvyEjJSci
 7l+kJoTZGfKcyimPF/rJRTbxHSqcBIHeZAxDpVpy16wsD3PkxpJQBBzKjscMPKsj7fNH
 DJEesoHCSUlvWJHbGSlrOI/J/3ksqShUNxa1rUSVqI24FAeVj/UNeieCsKC+V8whhqPF
 7fWQ==
X-Gm-Message-State: ACrzQf22kDA0xR8Z4gvTh32IF7MnO0liATB9i8ReU8qohyawMsR4cti3
 pn1hkjejZiKLHldt9bOnb9jv+RbTKEBHpaIm
X-Google-Smtp-Source: AMsMyM7XKHWtpmtheO6vjL3d8NI9FZYbstwalES179Ery+RM1+0GafQyN0bZZD1NWsh0cWPo38CvdA==
X-Received: by 2002:a05:6512:3b13:b0:4a2:564e:6cea with SMTP id
 f19-20020a0565123b1300b004a2564e6ceamr617448lfv.242.1666082682331; 
 Tue, 18 Oct 2022 01:44:42 -0700 (PDT)
Received: from fedora.. (vist.dozen.mephi.ru. [85.143.113.73])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a05651c03c700b0026e04cc88cfsm1874523ljp.124.2022.10.18.01.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 01:44:42 -0700 (PDT)
From: Nikita Ivanov <nivanov@cloudlinux.com>
To: qemu-devel@nongnu.org
Cc: Nikita Ivanov <nivanov@cloudlinux.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-block@nongnu.org (open list:raw)
Subject: [PATCH v3 2/2] error handling: Use RETRY_ON_EINTR() macro where
 applicable
Date: Tue, 18 Oct 2022 11:43:41 +0300
Message-Id: <20221018084341.16270-3-nivanov@cloudlinux.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018084341.16270-1-nivanov@cloudlinux.com>
References: <20221018084341.16270-1-nivanov@cloudlinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=nivanov@cloudlinux.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a defined RETRY_ON_EINTR() macro in qemu/osdep.h
which handles the same while loop.
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/415

Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
---
 block/file-posix.c        | 37 ++++++++++++++++---------------------
 chardev/char-pty.c        |  4 +---
 hw/9pfs/9p-local.c        |  8 ++------
 net/l2tpv3.c              | 17 +++++------------
 net/socket.c              | 16 +++++++---------
 net/tap.c                 |  8 ++------
 qga/commands-posix.c      |  4 +---
 semihosting/syscalls.c    |  4 +---
 tests/qtest/libqtest.c    | 12 +++++-------
 tests/vhost-user-bridge.c |  4 +---
 util/main-loop.c          |  4 +---
 util/osdep.c              |  4 +---
 util/vfio-helpers.c       | 12 ++++++------
 13 files changed, 49 insertions(+), 85 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 23acffb9a4..8f7a22e3e4 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1229,9 +1229,7 @@ static int hdev_get_max_segments(int fd, struct stat *st)
         ret = -errno;
         goto out;
     }
-    do {
-        ret = read(sysfd, buf, sizeof(buf) - 1);
-    } while (ret == -1 && errno == EINTR);
+    ret = RETRY_ON_EINTR(read(sysfd, buf, sizeof(buf) - 1));
     if (ret < 0) {
         ret = -errno;
         goto out;
@@ -1379,9 +1377,9 @@ static int handle_aiocb_ioctl(void *opaque)
     RawPosixAIOData *aiocb = opaque;
     int ret;
 
-    do {
-        ret = ioctl(aiocb->aio_fildes, aiocb->ioctl.cmd, aiocb->ioctl.buf);
-    } while (ret == -1 && errno == EINTR);
+    ret = RETRY_ON_EINTR(
+        ioctl(aiocb->aio_fildes, aiocb->ioctl.cmd, aiocb->ioctl.buf)
+    );
     if (ret == -1) {
         return -errno;
     }
@@ -1463,18 +1461,17 @@ static ssize_t handle_aiocb_rw_vector(RawPosixAIOData *aiocb)
 {
     ssize_t len;
 
-    do {
-        if (aiocb->aio_type & QEMU_AIO_WRITE)
-            len = qemu_pwritev(aiocb->aio_fildes,
-                               aiocb->io.iov,
-                               aiocb->io.niov,
-                               aiocb->aio_offset);
-         else
-            len = qemu_preadv(aiocb->aio_fildes,
-                              aiocb->io.iov,
-                              aiocb->io.niov,
-                              aiocb->aio_offset);
-    } while (len == -1 && errno == EINTR);
+    len = RETRY_ON_EINTR(
+        (aiocb->aio_type & QEMU_AIO_WRITE) ?
+            qemu_pwritev(aiocb->aio_fildes,
+                           aiocb->io.iov,
+                           aiocb->io.niov,
+                           aiocb->aio_offset) :
+            qemu_preadv(aiocb->aio_fildes,
+                          aiocb->io.iov,
+                          aiocb->io.niov,
+                          aiocb->aio_offset)
+    );
 
     if (len == -1) {
         return -errno;
@@ -1899,9 +1896,7 @@ static int allocate_first_block(int fd, size_t max_size)
     buf = qemu_memalign(max_align, write_size);
     memset(buf, 0, write_size);
 
-    do {
-        n = pwrite(fd, buf, write_size, 0);
-    } while (n == -1 && errno == EINTR);
+    n = RETRY_ON_EINTR(pwrite(fd, buf, write_size, 0));
 
     ret = (n == -1) ? -errno : 0;
 
diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index 53f25c6bbd..92fd33c854 100644
--- a/chardev/char-pty.c
+++ b/chardev/char-pty.c
@@ -93,9 +93,7 @@ static void pty_chr_update_read_handler(Chardev *chr)
     pfd.fd = fioc->fd;
     pfd.events = G_IO_OUT;
     pfd.revents = 0;
-    do {
-        rc = g_poll(&pfd, 1, 0);
-    } while (rc == -1 && errno == EINTR);
+    rc = RETRY_ON_EINTR(g_poll(&pfd, 1, 0));
     assert(rc >= 0);
 
     if (pfd.revents & G_IO_HUP) {
diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index d42ce6d8b8..bb3187244f 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -470,9 +470,7 @@ static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
         if (fd == -1) {
             return -1;
         }
-        do {
-            tsize = read(fd, (void *)buf, bufsz);
-        } while (tsize == -1 && errno == EINTR);
+        tsize = RETRY_ON_EINTR(read(fd, (void *)buf, bufsz));
         close_preserve_errno(fd);
     } else if ((fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
                (fs_ctx->export_flags & V9FS_SM_NONE)) {
@@ -908,9 +906,7 @@ static int local_symlink(FsContext *fs_ctx, const char *oldpath,
         }
         /* Write the oldpath (target) to the file. */
         oldpath_size = strlen(oldpath);
-        do {
-            write_size = write(fd, (void *)oldpath, oldpath_size);
-        } while (write_size == -1 && errno == EINTR);
+        write_size = RETRY_ON_EINTR(write(fd, (void *)oldpath, oldpath_size));
         close_preserve_errno(fd);
 
         if (write_size != oldpath_size) {
diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index af373e5c30..e0726f5f89 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -240,9 +240,7 @@ static ssize_t net_l2tpv3_receive_dgram_iov(NetClientState *nc,
     message.msg_control = NULL;
     message.msg_controllen = 0;
     message.msg_flags = 0;
-    do {
-        ret = sendmsg(s->fd, &message, 0);
-    } while ((ret == -1) && (errno == EINTR));
+    ret = RETRY_ON_EINTR(sendmsg(s->fd, &message, 0));
     if (ret > 0) {
         ret -= s->offset;
     } else if (ret == 0) {
@@ -285,9 +283,7 @@ static ssize_t net_l2tpv3_receive_dgram(NetClientState *nc,
     message.msg_control = NULL;
     message.msg_controllen = 0;
     message.msg_flags = 0;
-    do {
-        ret = sendmsg(s->fd, &message, 0);
-    } while ((ret == -1) && (errno == EINTR));
+    ret = RETRY_ON_EINTR(sendmsg(s->fd, &message, 0));
     if (ret > 0) {
         ret -= s->offset;
     } else if (ret == 0) {
@@ -434,12 +430,9 @@ static void net_l2tpv3_send(void *opaque)
 
     msgvec = s->msgvec + s->queue_head;
     if (target_count > 0) {
-        do {
-            count = recvmmsg(
-                s->fd,
-                msgvec,
-                target_count, MSG_DONTWAIT, NULL);
-        } while ((count == -1) && (errno == EINTR));
+        count = RETRY_ON_EINTR(
+                recvmmsg(s->fd, msgvec, target_count, MSG_DONTWAIT, NULL)
+        );
         if (count < 0) {
             /* Recv error - we still need to flush packets here,
              * (re)set queue head to current position
diff --git a/net/socket.c b/net/socket.c
index bfd8596250..00f8a88531 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -117,15 +117,13 @@ static ssize_t net_socket_receive_dgram(NetClientState *nc, const uint8_t *buf,
     NetSocketState *s = DO_UPCAST(NetSocketState, nc, nc);
     ssize_t ret;
 
-    do {
-        if (s->dgram_dst.sin_family != AF_UNIX) {
-            ret = sendto(s->fd, buf, size, 0,
-                         (struct sockaddr *)&s->dgram_dst,
-                         sizeof(s->dgram_dst));
-        } else {
-            ret = send(s->fd, buf, size, 0);
-        }
-    } while (ret == -1 && errno == EINTR);
+    ret = RETRY_ON_EINTR(
+        s->dgram_dst.sin_family != AF_UNIX ?
+            sendto(s->fd, buf, size, 0,
+                     (struct sockaddr *)&s->dgram_dst,
+                     sizeof(s->dgram_dst)) :
+            send(s->fd, buf, size, 0)
+    );
 
     if (ret == -1 && errno == EAGAIN) {
         net_socket_write_poll(s, true);
diff --git a/net/tap.c b/net/tap.c
index e090d14203..4c90f70b7e 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -102,9 +102,7 @@ static ssize_t tap_write_packet(TAPState *s, const struct iovec *iov, int iovcnt
 {
     ssize_t len;
 
-    do {
-        len = writev(s->fd, iov, iovcnt);
-    } while (len == -1 && errno == EINTR);
+    len = RETRY_ON_EINTR(writev(s->fd, iov, iovcnt));
 
     if (len == -1 && errno == EAGAIN) {
         tap_write_poll(s, true);
@@ -577,9 +575,7 @@ static int net_bridge_run_helper(const char *helper, const char *bridge,
 
         close(sv[1]);
 
-        do {
-            fd = recv_fd(sv[0]);
-        } while (fd == -1 && errno == EINTR);
+        fd = RETRY_ON_EINTR(recv_fd(sv[0]));
         saved_errno = errno;
 
         close(sv[0]);
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index eea819cff0..95753f7c96 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -68,9 +68,7 @@ static void ga_wait_child(pid_t pid, int *status, Error **errp)
 
     *status = 0;
 
-    do {
-        rpid = waitpid(pid, status, 0);
-    } while (rpid == -1 && errno == EINTR);
+    rpid = RETRY_ON_EINTR(waitpid(pid, status, 0));
 
     if (rpid == -1) {
         error_setg_errno(errp, errno, "failed to wait for child (pid: %d)",
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 508a0ad88c..5893c760c5 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -317,9 +317,7 @@ static void host_read(CPUState *cs, gdb_syscall_complete_cb complete,
         complete(cs, -1, EFAULT);
         return;
     }
-    do {
-        ret = read(gf->hostfd, ptr, len);
-    } while (ret == -1 && errno == EINTR);
+    ret = RETRY_ON_EINTR(read(gf->hostfd, ptr, len));
     if (ret == -1) {
         complete(cs, -1, errno);
         unlock_user(ptr, buf, 0);
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 90648eb8d1..86f1091e78 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -101,10 +101,10 @@ static int socket_accept(int sock)
         return -1;
     }
 
-    do {
-        addrlen = sizeof(addr);
-        ret = accept(sock, (struct sockaddr *)&addr, &addrlen);
-    } while (ret == -1 && errno == EINTR);
+    addrlen = sizeof(addr);
+    ret = RETRY_ON_EINTR(
+        accept(sock, (struct sockaddr *)&addr, &addrlen)
+    );
     if (ret == -1) {
         fprintf(stderr, "%s failed: %s\n", __func__, strerror(errno));
     }
@@ -574,9 +574,7 @@ int qtest_socket_server(const char *socket_path)
     addr.sun_family = AF_UNIX;
     snprintf(addr.sun_path, sizeof(addr.sun_path), "%s", socket_path);
 
-    do {
-        ret = bind(sock, (struct sockaddr *)&addr, sizeof(addr));
-    } while (ret == -1 && errno == EINTR);
+    ret = RETRY_ON_EINTR(bind(sock, (struct sockaddr *)&addr, sizeof(addr)));
     g_assert_cmpint(ret, !=, -1);
     ret = listen(sock, 1);
     g_assert_cmpint(ret, !=, -1);
diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
index fecdf915e7..a5c711b1de 100644
--- a/tests/vhost-user-bridge.c
+++ b/tests/vhost-user-bridge.c
@@ -331,9 +331,7 @@ vubr_backend_recv_cb(int sock, void *ctx)
             .msg_iovlen = num,
             .msg_flags = MSG_DONTWAIT,
         };
-        do {
-            ret = recvmsg(vubr->backend_udp_sock, &msg, 0);
-        } while (ret == -1 && (errno == EINTR));
+        ret = RETRY_ON_EINTR(recvmsg(vubr->backend_udp_sock, &msg, 0));
 
         if (i == 0) {
             iov_restore_front(elem->in_sg, sg, hdrlen);
diff --git a/util/main-loop.c b/util/main-loop.c
index f00a25451b..63bd5d123d 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -64,9 +64,7 @@ static void sigfd_handler(void *opaque)
     ssize_t len;
 
     while (1) {
-        do {
-            len = read(fd, &info, sizeof(info));
-        } while (len == -1 && errno == EINTR);
+        len = RETRY_ON_EINTR(read(fd, &info, sizeof(info)));
 
         if (len == -1 && errno == EAGAIN) {
             break;
diff --git a/util/osdep.c b/util/osdep.c
index 746d5f7d71..aa358bd65e 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -244,9 +244,7 @@ static int qemu_lock_fcntl(int fd, int64_t start, int64_t len, int fl_type)
         .l_type   = fl_type,
     };
     qemu_probe_lock_ops();
-    do {
-        ret = fcntl(fd, fcntl_op_setlk, &fl);
-    } while (ret == -1 && errno == EINTR);
+    ret = RETRY_ON_EINTR(fcntl(fd, fcntl_op_setlk, &fl));
     return ret == -1 ? -errno : 0;
 }
 
diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 5ba01177bf..1a9b338cf9 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -240,9 +240,9 @@ static int qemu_vfio_pci_read_config(QEMUVFIOState *s, void *buf,
                                     s->config_region_info.offset,
                                     s->config_region_info.size);
     assert(QEMU_IS_ALIGNED(s->config_region_info.offset + ofs, size));
-    do {
-        ret = pread(s->device, buf, size, s->config_region_info.offset + ofs);
-    } while (ret == -1 && errno == EINTR);
+    ret = RETRY_ON_EINTR(
+        pread(s->device, buf, size, s->config_region_info.offset + ofs)
+    );
     return ret == size ? 0 : -errno;
 }
 
@@ -254,9 +254,9 @@ static int qemu_vfio_pci_write_config(QEMUVFIOState *s, void *buf, int size, int
                                      s->config_region_info.offset,
                                      s->config_region_info.size);
     assert(QEMU_IS_ALIGNED(s->config_region_info.offset + ofs, size));
-    do {
-        ret = pwrite(s->device, buf, size, s->config_region_info.offset + ofs);
-    } while (ret == -1 && errno == EINTR);
+    ret = RETRY_ON_EINTR(
+        pwrite(s->device, buf, size, s->config_region_info.offset + ofs)
+    );
     return ret == size ? 0 : -errno;
 }
 
-- 
2.37.3


