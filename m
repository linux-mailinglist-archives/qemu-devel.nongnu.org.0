Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DB1662897
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:31:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEt6f-0008AC-SG; Mon, 09 Jan 2023 09:26:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEt6Y-00086v-5S
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:26:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEt6V-0008Sl-Si
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:26:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673274383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eVfM6pN5RnryTGdHDwH3xBTMR37/OEIok5xWb1/x5wc=;
 b=OUhuM1OP4jpIUXNSnLrdSnOfdj/CLIyeOtrPfApuOr0Pq5/KvbMSHIllWU8Ca10wXpAOT9
 +8SVDgCI2rRer91TezllmJruNl1ybjp9c1MocNNnWLaUhGync8Gcco2epa6muxFBZ/X4Qy
 2EkHLY3+osc7CgKbUUe9Vx6qiidvqRg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-PA1qCLLZPu60Y5q_SKvCtw-1; Mon, 09 Jan 2023 09:26:18 -0500
X-MC-Unique: PA1qCLLZPu60Y5q_SKvCtw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A93B9857D0D;
 Mon,  9 Jan 2023 14:26:17 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFB654078903;
 Mon,  9 Jan 2023 14:26:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Nikita Ivanov <nivanov@cloudlinux.com>
Subject: [PULL 14/15] error handling: Use RETRY_ON_EINTR() macro where
 applicable
Date: Mon,  9 Jan 2023 15:26:02 +0100
Message-Id: <20230109142604.506940-5-thuth@redhat.com>
In-Reply-To: <20230109142604.506940-1-thuth@redhat.com>
References: <20230109142604.506940-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

There is a defined RETRY_ON_EINTR() macro in qemu/osdep.h
which handles the same while loop.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/415
Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
Message-Id: <20221023090422.242617-3-nivanov@cloudlinux.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
[thuth: Dropped the hunk that changed socket_accept() in libqtest.c]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 block/file-posix.c        | 37 ++++++++++++++++---------------------
 chardev/char-pty.c        |  4 +---
 hw/9pfs/9p-local.c        |  8 ++------
 net/l2tpv3.c              | 17 +++++------------
 net/socket.c              | 16 +++++++---------
 net/tap.c                 |  8 ++------
 qga/commands-posix.c      |  4 +---
 semihosting/syscalls.c    |  4 +---
 tests/qtest/libqtest.c    |  4 +---
 tests/vhost-user-bridge.c |  4 +---
 util/main-loop.c          |  4 +---
 util/osdep.c              |  4 +---
 util/vfio-helpers.c       | 12 ++++++------
 13 files changed, 45 insertions(+), 81 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index b9647c5ffc..b9955db205 100644
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
index d2246a3d7e..9d07620235 100644
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
index 5852e42738..53b2d32573 100644
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
index b67437a1f0..2fc5696755 100644
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
index bd85c56a04..7d7bc1dc5f 100644
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
index b19b9c5d18..ebd33a643c 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -63,9 +63,7 @@ static void ga_wait_child(pid_t pid, int *status, Error **errp)
 
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
index f9c8987678..5cb38f90da 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -689,9 +689,7 @@ int qtest_socket_server(const char *socket_path)
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
index 10fa74c6e3..58f776a8c9 100644
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
index 77c1a6c562..e996c4744a 100644
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
index 7a84b1d806..2d8af38f88 100644
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
2.31.1


