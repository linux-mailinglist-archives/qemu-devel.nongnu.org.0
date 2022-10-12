Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EAF5FC572
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 14:37:10 +0200 (CEST)
Received: from localhost ([::1]:49808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiayz-0005On-Lw
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 08:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1oiauG-0001L3-SM
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:32:17 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:37677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1oiau5-0001R2-AV
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:32:09 -0400
Received: by mail-ed1-x52e.google.com with SMTP id m16so1182216edc.4
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 05:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudlinux.com; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=uP0fPYPODqNEZapwWXWYagyGT3O7EQEPQXsYtiNGAgk=;
 b=E7QhQtrrdmSgqVt3qUdBlCAIXtj6cY4bH01nmQRFz2Orjmju77Uuiml7Zz1DSStSvU
 JRFNiyIJUH+/Lmah9EtZpKcxYHRXajHegRU1XQfTdWsheXKmTS2STtD3YXNkABeLtoYq
 0p0b/kG5iCXEB7xh4sFMKbbzIWNVmjRgl5uuiz6f9WNLErgyHBiAkEnQ3JERxnaHqy5U
 KxBzi0FKnpXH4fHkliq7HYzmPZD8wsAKatFDIaMAL7uS/xIvFdUirrXoQISzHHrKpCt9
 EEYZ89F3IhaLHpP1+jUsLBYI+f0yKvxzNINjmKf4ptarznIAmt8W5JnX1Ilx8mSqH60s
 xQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uP0fPYPODqNEZapwWXWYagyGT3O7EQEPQXsYtiNGAgk=;
 b=HEzI5DDC4vE057d8aJ8tnxwsZ048BSfbD+dMYspS1clxsDBMSz34be9EX5RqoTH9HV
 rEMnroeCG6y5g8QzzEqnP9JUL5HK0ZNx8f8AS/4d5y/PTFZTN8XqEYFvcE9SBO/S73zb
 yLBGeu3zQAGo1pvDhYQpxKLKTrbjl8KKjk5uf9BXYtdLAPxbl8arDLcl6+7rtBwkAjvg
 YymopCyc/ZLKjGNPhz/hilcSCcR1tnASNoLQfwo/aHn68zzyzJmIFRHPVar3H+E4gN8c
 Q89ZUBDUw5ZjvTthwmTRJv0Lu7I3CjSXrrUHhOdkavfpOuGWB0KJiUlA85vhEXA8aMTK
 jGzQ==
X-Gm-Message-State: ACrzQf2kCquzee/Bv2xrF2+Dqo8V2EkDGdfnGezh9TZgbxI7v5xUIC/o
 8ttoqa9eUA3jeox+mmpYmJ4rFxFIi9BspTLR/6aIC7+MG5UddPaX
X-Google-Smtp-Source: AMsMyM4050jPoC0COJKktxoS/0S3/hvk+9qH1VKPSMOQJocRbFFVHIMQsFI+ZRlpR/ZCWTWP9HwDu644ae+odNQ9BGY=
X-Received: by 2002:a05:6402:2713:b0:45b:fc9f:a4ae with SMTP id
 y19-20020a056402271300b0045bfc9fa4aemr16900879edd.132.1665577923091; Wed, 12
 Oct 2022 05:32:03 -0700 (PDT)
MIME-Version: 1.0
From: Nikita Ivanov <nivanov@cloudlinux.com>
Date: Wed, 12 Oct 2022 15:31:52 +0300
Message-ID: <CAAJ4Ao87Dbjc11xE9b2Mj=6VMX5J4LHJ2vt_Kn-SPEHWQ7Gu_g@mail.gmail.com>
Subject: [PATCH v2 2/2] error handling: Use RETRY_ON_EINTR() macro where
 applicable
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Greg Kurz <groug@kaod.org>, Jason Wang <jasowang@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="00000000000073d3b505ead59436"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=nivanov@cloudlinux.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--00000000000073d3b505ead59436
Content-Type: text/plain; charset="UTF-8"

There is a defined RETRY_ON_EINTR() macro in qemu/osdep.h which
handles the same while loop.
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/415

Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
---
 block/file-posix.c        | 37 ++++++++++++++++---------------------
 chardev/char-pty.c        |  4 +---
 hw/9pfs/9p-local.c        |  8 ++------
 net/l2tpv3.c              | 17 +++++------------
 net/socket.c              | 16 +++++++---------
 net/tap.c                 | 12 ++++--------
 qga/commands-posix.c      |  4 +---
 semihosting/syscalls.c    |  4 +---
 tests/qtest/libqtest.c    | 14 ++++++--------
 tests/vhost-user-bridge.c |  4 +---
 util/main-loop.c          |  4 +---
 util/osdep.c              |  4 +---
 util/vfio-helpers.c       | 12 ++++++------
 13 files changed, 52 insertions(+), 88 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 66fdb07820..c589cb489b 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1238,9 +1238,7 @@ static int hdev_get_max_segments(int fd, struct stat
*st)
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
@@ -1388,9 +1386,9 @@ static int handle_aiocb_ioctl(void *opaque)
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
@@ -1472,18 +1470,17 @@ static ssize_t
handle_aiocb_rw_vector(RawPosixAIOData *aiocb)
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
@@ -1908,9 +1905,7 @@ static int allocate_first_block(int fd, size_t
max_size)
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
@@ -470,9 +470,7 @@ static ssize_t local_readlink(FsContext *fs_ctx,
V9fsPath *fs_path,
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
@@ -908,9 +906,7 @@ static int local_symlink(FsContext *fs_ctx, const char
*oldpath,
         }
         /* Write the oldpath (target) to the file. */
         oldpath_size = strlen(oldpath);
-        do {
-            write_size = write(fd, (void *)oldpath, oldpath_size);
-        } while (write_size == -1 && errno == EINTR);
+        write_size = RETRY_ON_EINTR(write(fd, (void *)oldpath,
oldpath_size));
         close_preserve_errno(fd);

         if (write_size != oldpath_size) {
diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index af373e5c30..e0726f5f89 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -240,9 +240,7 @@ static ssize_t
net_l2tpv3_receive_dgram_iov(NetClientState *nc,
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
@@ -285,9 +283,7 @@ static ssize_t net_l2tpv3_receive_dgram(NetClientState
*nc,
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
@@ -117,15 +117,13 @@ static ssize_t
net_socket_receive_dgram(NetClientState *nc, const uint8_t *buf,
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
index e203d07a12..0f16011614 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -102,9 +102,7 @@ static ssize_t tap_write_packet(TAPState *s, const
struct iovec *iov, int iovcnt
 {
     ssize_t len;

-    do {
-        len = writev(s->fd, iov, iovcnt);
-    } while (len == -1 && errno == EINTR);
+    len = RETRY_ON_EINTR(writev(s->fd, iov, iovcnt));

     if (len == -1 && errno == EAGAIN) {
         tap_write_poll(s, true);
@@ -577,9 +575,7 @@ static int net_bridge_run_helper(const char *helper,
const char *bridge,

         close(sv[1]);

-        do {
-            fd = recv_fd(sv[0]);
-        } while (fd == -1 && errno == EINTR);
+        fd = RETRY_ON_EINTR(recv_fd(sv[0]));
         saved_errno = errno;

         close(sv[0]);
@@ -651,8 +647,8 @@ static int net_tap_init(const NetdevTapOptions *tap,
int *vnet_hdr,
         vnet_hdr_required = 0;
     }

-    TFR(fd = tap_open(ifname, ifname_sz, vnet_hdr, vnet_hdr_required,
-                      mq_required, errp));
+    fd = RETRY_ON_EINTR(tap_open(ifname, ifname_sz, vnet_hdr,
vnet_hdr_required,
+                                 mq_required, errp));
     if (fd < 0) {
         return -1;
     }
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index eea819cff0..95753f7c96 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -68,9 +68,7 @@ static void ga_wait_child(pid_t pid, int *status, Error
**errp)

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
@@ -317,9 +317,7 @@ static void host_read(CPUState *cs,
gdb_syscall_complete_cb complete,
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
index 4f4b2d6477..ca744d62ca 100644
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
@@ -140,7 +140,7 @@ void qtest_kill_qemu(QTestState *s)
     /* Skip wait if qtest_probe_child already reaped.  */
     if (pid != -1) {
         kill(pid, SIGTERM);
-        TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
+        pid = RETRY_ON_EINTR(waitpid(s->qemu_pid, &s->wstatus, 0));
         assert(pid == s->qemu_pid);
         s->qemu_pid = -1;
     }
@@ -582,9 +582,7 @@ int qtest_socket_server(const char *socket_path)
     addr.sun_family = AF_UNIX;
     snprintf(addr.sun_path, sizeof(addr.sun_path), "%s", socket_path);

-    do {
-        ret = bind(sock, (struct sockaddr *)&addr, sizeof(addr));
-    } while (ret == -1 && errno == EINTR);
+    ret = RETRY_ON_EINTR(bind(sock, (struct sockaddr *)&addr,
sizeof(addr)));
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
index 60fcbbaebe..3f344b0326 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -244,9 +244,7 @@ static int qemu_lock_fcntl(int fd, int64_t start,
int64_t len, int fl_type)
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
@@ -240,9 +240,9 @@ static int qemu_vfio_pci_read_config(QEMUVFIOState *s,
void *buf,
                                     s->config_region_info.offset,
                                     s->config_region_info.size);
     assert(QEMU_IS_ALIGNED(s->config_region_info.offset + ofs, size));
-    do {
-        ret = pread(s->device, buf, size, s->config_region_info.offset +
ofs);
-    } while (ret == -1 && errno == EINTR);
+    ret = RETRY_ON_EINTR(
+        pread(s->device, buf, size, s->config_region_info.offset + ofs)
+    );
     return ret == size ? 0 : -errno;
 }

@@ -254,9 +254,9 @@ static int qemu_vfio_pci_write_config(QEMUVFIOState *s,
void *buf, int size, int
                                      s->config_region_info.offset,
                                      s->config_region_info.size);
     assert(QEMU_IS_ALIGNED(s->config_region_info.offset + ofs, size));
-    do {
-        ret = pwrite(s->device, buf, size, s->config_region_info.offset +
ofs);
-    } while (ret == -1 && errno == EINTR);
+    ret = RETRY_ON_EINTR(
+        pwrite(s->device, buf, size, s->config_region_info.offset + ofs)
+    );
     return ret == size ? 0 : -errno;
 }

--
2.37.3

--00000000000073d3b505ead59436
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>There is a defined RETRY_ON_EINTR() macro in qemu/osd=
ep.h which<br>handles the same while loop.<br>Resolves: <a href=3D"https://=
gitlab.com/qemu-project/qemu/-/issues/415">https://gitlab.com/qemu-project/=
qemu/-/issues/415</a><br><br>Signed-off-by: Nikita Ivanov &lt;<a href=3D"ma=
ilto:nivanov@cloudlinux.com">nivanov@cloudlinux.com</a>&gt;<br>---<br>=C2=
=A0block/file-posix.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| 37 ++++++++++++++++-----=
----------------<br>=C2=A0chardev/char-pty.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A04 +---<br>=C2=A0hw/9pfs/9p-local.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A08 ++------<br>=C2=A0net/l2tpv3.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 17 +++++------------<br>=C2=A0net/socket.c =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 16 +++++++---------<br>=C2=A0net/tap.c =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ++++--------<br>=C2=
=A0qga/commands-posix.c =C2=A0 =C2=A0 =C2=A0| =C2=A04 +---<br>=C2=A0semihos=
ting/syscalls.c =C2=A0 =C2=A0| =C2=A04 +---<br>=C2=A0tests/qtest/libqtest.c=
 =C2=A0 =C2=A0| 14 ++++++--------<br>=C2=A0tests/vhost-user-bridge.c | =C2=
=A04 +---<br>=C2=A0util/main-loop.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A04 +---<br>=C2=A0util/osdep.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A04 +---<br>=C2=A0util/vfio-helpers.c =C2=A0 =C2=A0 =C2=A0 | 12=
 ++++++------<br>=C2=A013 files changed, 52 insertions(+), 88 deletions(-)<=
br><br>diff --git a/block/file-posix.c b/block/file-posix.c<br>index 66fdb0=
7820..c589cb489b 100644<br>--- a/block/file-posix.c<br>+++ b/block/file-pos=
ix.c<br>@@ -1238,9 +1238,7 @@ static int hdev_get_max_segments(int fd, stru=
ct stat *st)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -errno;<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>=C2=A0 =C2=A0 =C2=A0}<br>- =C2=A0 =
=C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D read(sysfd, buf, sizeof(=
buf) - 1);<br>- =C2=A0 =C2=A0} while (ret =3D=3D -1 &amp;&amp; errno =3D=3D=
 EINTR);<br>+ =C2=A0 =C2=A0ret =3D RETRY_ON_EINTR(read(sysfd, buf, sizeof(b=
uf) - 1));<br>=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ret =3D -errno;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out=
;<br>@@ -1388,9 +1386,9 @@ static int handle_aiocb_ioctl(void *opaque)<br>=
=C2=A0 =C2=A0 =C2=A0RawPosixAIOData *aiocb =3D opaque;<br>=C2=A0 =C2=A0 =C2=
=A0int ret;<br><br>- =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =
=3D ioctl(aiocb-&gt;aio_fildes, aiocb-&gt;ioctl.cmd, aiocb-&gt;ioctl.buf);<=
br>- =C2=A0 =C2=A0} while (ret =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<br=
>+ =C2=A0 =C2=A0ret =3D RETRY_ON_EINTR(<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0ioc=
tl(aiocb-&gt;aio_fildes, aiocb-&gt;ioctl.cmd, aiocb-&gt;ioctl.buf)<br>+ =C2=
=A0 =C2=A0);<br>=C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -1) {<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return -errno;<br>=C2=A0 =C2=A0 =C2=A0}<br>@@ -1472,18 =
+1470,17 @@ static ssize_t handle_aiocb_rw_vector(RawPosixAIOData *aiocb)<b=
r>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0ssize_t len;<br><br>- =C2=A0 =C2=A0do {<br=
>- =C2=A0 =C2=A0 =C2=A0 =C2=A0if (aiocb-&gt;aio_type &amp; QEMU_AIO_WRITE)<=
br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D qemu_pwritev(aiocb-&g=
t;aio_fildes,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aiocb-&gt;io.iov,<br>- =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 aiocb-&gt;io.niov,<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 aiocb-&gt;aio_offset);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>=
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D qemu_preadv(aiocb-&gt;ai=
o_fildes,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aiocb-&gt;io.iov,<br>- =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0aiocb-&gt;io.niov,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0aiocb-&gt;aio_offset);<br>- =C2=A0 =C2=A0} while (len =3D=3D -1 &amp;&am=
p; errno =3D=3D EINTR);<br>+ =C2=A0 =C2=A0len =3D RETRY_ON_EINTR(<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(aiocb-&gt;aio_type &amp; QEMU_AIO_WRITE) ?<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_pwritev(aiocb-&gt;aio_fildes,=
<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 aiocb-&gt;io.iov,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aiocb-&gt;io=
.niov,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 aiocb-&gt;aio_offset) :<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0qemu_preadv(aiocb-&gt;aio_fildes,<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0aiocb-&gt;io.iov,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aiocb-&gt;io.niov,<br>+ =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0aiocb-&gt;aio_offset)<br>+ =C2=A0 =C2=A0);<br><br>=C2=A0 =C2=A0 =
=C2=A0if (len =3D=3D -1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -err=
no;<br>@@ -1908,9 +1905,7 @@ static int allocate_first_block(int fd, size_t=
 max_size)<br>=C2=A0 =C2=A0 =C2=A0buf =3D qemu_memalign(max_align, write_si=
ze);<br>=C2=A0 =C2=A0 =C2=A0memset(buf, 0, write_size);<br><br>- =C2=A0 =C2=
=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D pwrite(fd, buf, write_size, 0=
);<br>- =C2=A0 =C2=A0} while (n =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<b=
r>+ =C2=A0 =C2=A0n =3D RETRY_ON_EINTR(pwrite(fd, buf, write_size, 0));<br><=
br>=C2=A0 =C2=A0 =C2=A0ret =3D (n =3D=3D -1) ? -errno : 0;<br><br>diff --gi=
t a/chardev/char-pty.c b/chardev/char-pty.c<br>index 53f25c6bbd..92fd33c854=
 100644<br>--- a/chardev/char-pty.c<br>+++ b/chardev/char-pty.c<br>@@ -93,9=
 +93,7 @@ static void pty_chr_update_read_handler(Chardev *chr)<br>=C2=A0 =
=C2=A0 =C2=A0pfd.fd =3D fioc-&gt;fd;<br>=C2=A0 =C2=A0 =C2=A0pfd.events =3D =
G_IO_OUT;<br>=C2=A0 =C2=A0 =C2=A0pfd.revents =3D 0;<br>- =C2=A0 =C2=A0do {<=
br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D g_poll(&amp;pfd, 1, 0);<br>- =C2=A0 =
=C2=A0} while (rc =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<br>+ =C2=A0 =C2=
=A0rc =3D RETRY_ON_EINTR(g_poll(&amp;pfd, 1, 0));<br>=C2=A0 =C2=A0 =C2=A0as=
sert(rc &gt;=3D 0);<br><br>=C2=A0 =C2=A0 =C2=A0if (pfd.revents &amp; G_IO_H=
UP) {<br>diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c<br>index d42c=
e6d8b8..bb3187244f 100644<br>--- a/hw/9pfs/9p-local.c<br>+++ b/hw/9pfs/9p-l=
ocal.c<br>@@ -470,9 +470,7 @@ static ssize_t local_readlink(FsContext *fs_c=
tx, V9fsPath *fs_path,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -=
1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tsize =3D read(fd, (void *)buf, bu=
fsz);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0} while (tsize =3D=3D -1 &amp;&amp; e=
rrno =3D=3D EINTR);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0tsize =3D RETRY_ON_EINT=
R(read(fd, (void *)buf, bufsz));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close=
_preserve_errno(fd);<br>=C2=A0 =C2=A0 =C2=A0} else if ((fs_ctx-&gt;export_f=
lags &amp; V9FS_SM_PASSTHROUGH) ||<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (fs_ctx-&gt;export_flags &amp; V9FS_SM_NONE)) {<br>@@ =
-908,9 +906,7 @@ static int local_symlink(FsContext *fs_ctx, const char *ol=
dpath,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Write the oldpath (target) to the file. */<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0oldpath_size =3D strlen(oldpath);<br>- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_size =
=3D write(fd, (void *)oldpath, oldpath_size);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0} while (write_size =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0write_size =3D RETRY_ON_EINTR(write(fd, (void *)old=
path, oldpath_size));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close_preserve_e=
rrno(fd);<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (write_size !=3D oldp=
ath_size) {<br>diff --git a/net/l2tpv3.c b/net/l2tpv3.c<br>index af373e5c30=
..e0726f5f89 100644<br>--- a/net/l2tpv3.c<br>+++ b/net/l2tpv3.c<br>@@ -240,=
9 +240,7 @@ static ssize_t net_l2tpv3_receive_dgram_iov(NetClientState *nc,=
<br>=C2=A0 =C2=A0 =C2=A0message.msg_control =3D NULL;<br>=C2=A0 =C2=A0 =C2=
=A0message.msg_controllen =3D 0;<br>=C2=A0 =C2=A0 =C2=A0message.msg_flags =
=3D 0;<br>- =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D sendm=
sg(s-&gt;fd, &amp;message, 0);<br>- =C2=A0 =C2=A0} while ((ret =3D=3D -1) &=
amp;&amp; (errno =3D=3D EINTR));<br>+ =C2=A0 =C2=A0ret =3D RETRY_ON_EINTR(s=
endmsg(s-&gt;fd, &amp;message, 0));<br>=C2=A0 =C2=A0 =C2=A0if (ret &gt; 0) =
{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret -=3D s-&gt;offset;<br>=C2=A0 =C2=
=A0 =C2=A0} else if (ret =3D=3D 0) {<br>@@ -285,9 +283,7 @@ static ssize_t =
net_l2tpv3_receive_dgram(NetClientState *nc,<br>=C2=A0 =C2=A0 =C2=A0message=
.msg_control =3D NULL;<br>=C2=A0 =C2=A0 =C2=A0message.msg_controllen =3D 0;=
<br>=C2=A0 =C2=A0 =C2=A0message.msg_flags =3D 0;<br>- =C2=A0 =C2=A0do {<br>=
- =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D sendmsg(s-&gt;fd, &amp;message, 0);<br=
>- =C2=A0 =C2=A0} while ((ret =3D=3D -1) &amp;&amp; (errno =3D=3D EINTR));<=
br>+ =C2=A0 =C2=A0ret =3D RETRY_ON_EINTR(sendmsg(s-&gt;fd, &amp;message, 0)=
);<br>=C2=A0 =C2=A0 =C2=A0if (ret &gt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ret -=3D s-&gt;offset;<br>=C2=A0 =C2=A0 =C2=A0} else if (ret =3D=3D 0=
) {<br>@@ -434,12 +430,9 @@ static void net_l2tpv3_send(void *opaque)<br><b=
r>=C2=A0 =C2=A0 =C2=A0msgvec =3D s-&gt;msgvec + s-&gt;queue_head;<br>=C2=A0=
 =C2=A0 =C2=A0if (target_count &gt; 0) {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0do=
 {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0count =3D recvmmsg(<br>- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;fd,<br>- =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msgvec,<br>- =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_count, MSG_DONTWAIT, NU=
LL);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0} while ((count =3D=3D -1) &amp;&amp; =
(errno =3D=3D EINTR));<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0count =3D RETRY_ON_E=
INTR(<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recvmmsg(=
s-&gt;fd, msgvec, target_count, MSG_DONTWAIT, NULL)<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (count &lt; 0) {<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Recv error - we still ne=
ed to flush packets here,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 * (re)set queue head to current position<br>diff --git a/net/socket.c b=
/net/socket.c<br>index bfd8596250..00f8a88531 100644<br>--- a/net/socket.c<=
br>+++ b/net/socket.c<br>@@ -117,15 +117,13 @@ static ssize_t net_socket_re=
ceive_dgram(NetClientState *nc, const uint8_t *buf,<br>=C2=A0 =C2=A0 =C2=A0=
NetSocketState *s =3D DO_UPCAST(NetSocketState, nc, nc);<br>=C2=A0 =C2=A0 =
=C2=A0ssize_t ret;<br><br>- =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (s-&gt;dgram_dst.sin_family !=3D AF_UNIX) {<br>- =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ret =3D sendto(s-&gt;fd, buf, size, 0,<br>- =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (=
struct sockaddr *)&amp;s-&gt;dgram_dst,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(s-&gt;dgram_=
dst));<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ret =3D send(s-&gt;fd, buf, size, 0);<br>- =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>- =C2=A0 =C2=A0} while (ret =3D=3D -1 &amp;&amp; errn=
o =3D=3D EINTR);<br>+ =C2=A0 =C2=A0ret =3D RETRY_ON_EINTR(<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0s-&gt;dgram_dst.sin_family !=3D AF_UNIX ?<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sendto(s-&gt;fd, buf, size, 0,<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (struct sock=
addr *)&amp;s-&gt;dgram_dst,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(s-&gt;dgram_dst)) :<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0send(s-&gt;fd, buf, size, 0)<br>+ =C2=A0 =C2=A0)=
;<br><br>=C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -1 &amp;&amp; errno =3D=3D EAGA=
IN) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0net_socket_write_poll(s, true);<=
br>diff --git a/net/tap.c b/net/tap.c<br>index e203d07a12..0f16011614 10064=
4<br>--- a/net/tap.c<br>+++ b/net/tap.c<br>@@ -102,9 +102,7 @@ static ssize=
_t tap_write_packet(TAPState *s, const struct iovec *iov, int iovcnt<br>=C2=
=A0{<br>=C2=A0 =C2=A0 =C2=A0ssize_t len;<br><br>- =C2=A0 =C2=A0do {<br>- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D writev(s-&gt;fd, iov, iovcnt);<br>- =C2=
=A0 =C2=A0} while (len =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<br>+ =C2=
=A0 =C2=A0len =3D RETRY_ON_EINTR(writev(s-&gt;fd, iov, iovcnt));<br><br>=C2=
=A0 =C2=A0 =C2=A0if (len =3D=3D -1 &amp;&amp; errno =3D=3D EAGAIN) {<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tap_write_poll(s, true);<br>@@ -577,9 +575,7=
 @@ static int net_bridge_run_helper(const char *helper, const char *bridge=
,<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(sv[1]);<br><br>- =C2=A0 =
=C2=A0 =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =
=3D recv_fd(sv[0]);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0} while (fd =3D=3D -1 &=
amp;&amp; errno =3D=3D EINTR);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D RETRY=
_ON_EINTR(recv_fd(sv[0]));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0saved_errno=
 =3D errno;<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(sv[0]);<br>@@ -6=
51,8 +647,8 @@ static int net_tap_init(const NetdevTapOptions *tap, int *vn=
et_hdr,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnet_hdr_required =3D 0;<br>=
=C2=A0 =C2=A0 =C2=A0}<br><br>- =C2=A0 =C2=A0TFR(fd =3D tap_open(ifname, ifn=
ame_sz, vnet_hdr, vnet_hdr_required,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mq_required, errp));<br>+ =C2=
=A0 =C2=A0fd =3D RETRY_ON_EINTR(tap_open(ifname, ifname_sz, vnet_hdr, vnet_=
hdr_required,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mq_required, errp))=
;<br>=C2=A0 =C2=A0 =C2=A0if (fd &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return -1;<br>=C2=A0 =C2=A0 =C2=A0}<br>diff --git a/qga/commands-posi=
x.c b/qga/commands-posix.c<br>index eea819cff0..95753f7c96 100644<br>--- a/=
qga/commands-posix.c<br>+++ b/qga/commands-posix.c<br>@@ -68,9 +68,7 @@ sta=
tic void ga_wait_child(pid_t pid, int *status, Error **errp)<br><br>=C2=A0 =
=C2=A0 =C2=A0*status =3D 0;<br><br>- =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0rpid =3D waitpid(pid, status, 0);<br>- =C2=A0 =C2=A0} while (r=
pid =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<br>+ =C2=A0 =C2=A0rpid =3D RE=
TRY_ON_EINTR(waitpid(pid, status, 0));<br><br>=C2=A0 =C2=A0 =C2=A0if (rpid =
=3D=3D -1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(errp, er=
rno, &quot;failed to wait for child (pid: %d)&quot;,<br>diff --git a/semiho=
sting/syscalls.c b/semihosting/syscalls.c<br>index 508a0ad88c..5893c760c5 1=
00644<br>--- a/semihosting/syscalls.c<br>+++ b/semihosting/syscalls.c<br>@@=
 -317,9 +317,7 @@ static void host_read(CPUState *cs, gdb_syscall_complete_=
cb complete,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0complete(cs, -1, EFAULT);=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>=C2=A0 =C2=A0 =C2=A0}<br>-=
 =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D read(gf-&gt;host=
fd, ptr, len);<br>- =C2=A0 =C2=A0} while (ret =3D=3D -1 &amp;&amp; errno =
=3D=3D EINTR);<br>+ =C2=A0 =C2=A0ret =3D RETRY_ON_EINTR(read(gf-&gt;hostfd,=
 ptr, len));<br>=C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -1) {<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0complete(cs, -1, errno);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0unlock_user(ptr, buf, 0);<br>diff --git a/tests/qtest/libqtest.c b/t=
ests/qtest/libqtest.c<br>index 4f4b2d6477..ca744d62ca 100644<br>--- a/tests=
/qtest/libqtest.c<br>+++ b/tests/qtest/libqtest.c<br>@@ -101,10 +101,10 @@ =
static int socket_accept(int sock)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=
urn -1;<br>=C2=A0 =C2=A0 =C2=A0}<br><br>- =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=
=A0 =C2=A0 =C2=A0addrlen =3D sizeof(addr);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0=
ret =3D accept(sock, (struct sockaddr *)&amp;addr, &amp;addrlen);<br>- =C2=
=A0 =C2=A0} while (ret =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<br>+ =C2=
=A0 =C2=A0addrlen =3D sizeof(addr);<br>+ =C2=A0 =C2=A0ret =3D RETRY_ON_EINT=
R(<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0accept(sock, (struct sockaddr *)&amp;add=
r, &amp;addrlen)<br>+ =C2=A0 =C2=A0);<br>=C2=A0 =C2=A0 =C2=A0if (ret =3D=3D=
 -1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;%s failed=
: %s\n&quot;, __func__, strerror(errno));<br>=C2=A0 =C2=A0 =C2=A0}<br>@@ -1=
40,7 +140,7 @@ void qtest_kill_qemu(QTestState *s)<br>=C2=A0 =C2=A0 =C2=A0/=
* Skip wait if qtest_probe_child already reaped. =C2=A0*/<br>=C2=A0 =C2=A0 =
=C2=A0if (pid !=3D -1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kill(pid, SIG=
TERM);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(pid =3D waitpid(s-&gt;qemu_pid, =
&amp;s-&gt;wstatus, 0));<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0pid =3D RETRY_ON_E=
INTR(waitpid(s-&gt;qemu_pid, &amp;s-&gt;wstatus, 0));<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0assert(pid =3D=3D s-&gt;qemu_pid);<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0s-&gt;qemu_pid =3D -1;<br>=C2=A0 =C2=A0 =C2=A0}<br>@@ -582,9 =
+582,7 @@ int qtest_socket_server(const char *socket_path)<br>=C2=A0 =C2=A0=
 =C2=A0addr.sun_family =3D AF_UNIX;<br>=C2=A0 =C2=A0 =C2=A0snprintf(addr.su=
n_path, sizeof(addr.sun_path), &quot;%s&quot;, socket_path);<br><br>- =C2=
=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D bind(sock, (struct s=
ockaddr *)&amp;addr, sizeof(addr));<br>- =C2=A0 =C2=A0} while (ret =3D=3D -=
1 &amp;&amp; errno =3D=3D EINTR);<br>+ =C2=A0 =C2=A0ret =3D RETRY_ON_EINTR(=
bind(sock, (struct sockaddr *)&amp;addr, sizeof(addr)));<br>=C2=A0 =C2=A0 =
=C2=A0g_assert_cmpint(ret, !=3D, -1);<br>=C2=A0 =C2=A0 =C2=A0ret =3D listen=
(sock, 1);<br>=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(ret, !=3D, -1);<br>diff -=
-git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c<br>index fecdf=
915e7..a5c711b1de 100644<br>--- a/tests/vhost-user-bridge.c<br>+++ b/tests/=
vhost-user-bridge.c<br>@@ -331,9 +331,7 @@ vubr_backend_recv_cb(int sock, v=
oid *ctx)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.msg_iovlen =
=3D num,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.msg_flags =3D =
MSG_DONTWAIT,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D rec=
vmsg(vubr-&gt;backend_udp_sock, &amp;msg, 0);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0} while (ret =3D=3D -1 &amp;&amp; (errno =3D=3D EINTR));<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ret =3D RETRY_ON_EINTR(recvmsg(vubr-&gt;backend_udp_sock, =
&amp;msg, 0));<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i =3D=3D 0) {<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iov_restore_front(elem-&g=
t;in_sg, sg, hdrlen);<br>diff --git a/util/main-loop.c b/util/main-loop.c<b=
r>index f00a25451b..63bd5d123d 100644<br>--- a/util/main-loop.c<br>+++ b/ut=
il/main-loop.c<br>@@ -64,9 +64,7 @@ static void sigfd_handler(void *opaque)=
<br>=C2=A0 =C2=A0 =C2=A0ssize_t len;<br><br>=C2=A0 =C2=A0 =C2=A0while (1) {=
<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0len =3D read(fd, &amp;info, sizeof(info));<br>- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0} while (len =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0len =3D RETRY_ON_EINTR(read(fd, &amp;info, sizeof(i=
nfo)));<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (len =3D=3D -1 &amp;&am=
p; errno =3D=3D EAGAIN) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>diff --git a/util/osdep.c b/util/osdep.c<br>index 60fcbbaebe..=
3f344b0326 100644<br>--- a/util/osdep.c<br>+++ b/util/osdep.c<br>@@ -244,9 =
+244,7 @@ static int qemu_lock_fcntl(int fd, int64_t start, int64_t len, in=
t fl_type)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.l_type =C2=A0 =3D fl_type,=
<br>=C2=A0 =C2=A0 =C2=A0};<br>=C2=A0 =C2=A0 =C2=A0qemu_probe_lock_ops();<br=
>- =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D fcntl(fd, fcnt=
l_op_setlk, &amp;fl);<br>- =C2=A0 =C2=A0} while (ret =3D=3D -1 &amp;&amp; e=
rrno =3D=3D EINTR);<br>+ =C2=A0 =C2=A0ret =3D RETRY_ON_EINTR(fcntl(fd, fcnt=
l_op_setlk, &amp;fl));<br>=C2=A0 =C2=A0 =C2=A0return ret =3D=3D -1 ? -errno=
 : 0;<br>=C2=A0}<br><br>diff --git a/util/vfio-helpers.c b/util/vfio-helper=
s.c<br>index 5ba01177bf..1a9b338cf9 100644<br>--- a/util/vfio-helpers.c<br>=
+++ b/util/vfio-helpers.c<br>@@ -240,9 +240,9 @@ static int qemu_vfio_pci_r=
ead_config(QEMUVFIOState *s, void *buf,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;config_region_info.offset,<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;config_region_info.si=
ze);<br>=C2=A0 =C2=A0 =C2=A0assert(QEMU_IS_ALIGNED(s-&gt;config_region_info=
.offset + ofs, size));<br>- =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ret =3D pread(s-&gt;device, buf, size, s-&gt;config_region_info.offset +=
 ofs);<br>- =C2=A0 =C2=A0} while (ret =3D=3D -1 &amp;&amp; errno =3D=3D EIN=
TR);<br>+ =C2=A0 =C2=A0ret =3D RETRY_ON_EINTR(<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0pread(s-&gt;device, buf, size, s-&gt;config_region_info.offset + ofs)=
<br>+ =C2=A0 =C2=A0);<br>=C2=A0 =C2=A0 =C2=A0return ret =3D=3D size ? 0 : -=
errno;<br>=C2=A0}<br><br>@@ -254,9 +254,9 @@ static int qemu_vfio_pci_write=
_config(QEMUVFIOState *s, void *buf, int size, int<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;config_region_info.offset,<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;config_re=
gion_info.size);<br>=C2=A0 =C2=A0 =C2=A0assert(QEMU_IS_ALIGNED(s-&gt;config=
_region_info.offset + ofs, size));<br>- =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ret =3D pwrite(s-&gt;device, buf, size, s-&gt;config_regio=
n_info.offset + ofs);<br>- =C2=A0 =C2=A0} while (ret =3D=3D -1 &amp;&amp; e=
rrno =3D=3D EINTR);<br>+ =C2=A0 =C2=A0ret =3D RETRY_ON_EINTR(<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0pwrite(s-&gt;device, buf, size, s-&gt;config_region_inf=
o.offset + ofs)<br>+ =C2=A0 =C2=A0);<br>=C2=A0 =C2=A0 =C2=A0return ret =3D=
=3D size ? 0 : -errno;<br>=C2=A0}<br><br>--<br>2.37.3</div></div>

--00000000000073d3b505ead59436--

