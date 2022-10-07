Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A5B5F7AA5
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 17:37:29 +0200 (CEST)
Received: from localhost ([::1]:36076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpPk-0005ml-3F
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 11:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ogogE-0002dX-Qu
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 10:50:28 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:57047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ogog5-0000cr-CL
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 10:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=zHIK8c3JaZrbpbou5VrjLDHeHKf9pKC66p0zLuDnZ+E=; b=KE3FkCb7D0uaXC9NFAgArt7lP0
 J52MvM/EAtsxunEl5yglO/t1N3M7jzkDbl2rOUUvpl8vvmgO2gYR17dnv6qi0M8owwr2PiW1nHWN5
 vhjN0a25cime1PW/pZILiMI/YJNkmL5CXfg4kpcwLfxOC3ElM6mar30PYK46MXgFeXUD8R9aa/bBT
 crJcFHVFikjpjrj4TyVb3klKf52w5oeqdKyv0nhFp2k2Ibp32FK2khhFWW6qRsm5ISLzzGlHGksZc
 FKddYZ4V+T+Ialw3PqUCqg8yHsr3SCHx+zjaTvFI+GJ24MKVCN2exBrb2zKeXM68y3gLdu8ho2KqO
 NvO3j4eY+yW4DjaCRgKbr2RstvoIUyDtbSzNcNxHRT+h54vKrXcIl3/muKBFhi6RZlJHvAjtJjpaY
 3snvJl24jZW5KioN0uicW/olGQXCh7/Zk78F/zJ1UKFwP0DZrXkmGWapkdNGiKQK2EskmThSOHBCQ
 tjaex2pb7gev0ASmhJfsQ3MK4HxPP8tSH5hl7GaN+ZLgTQk66WYOtsdF0W+7vq5KJqamMtJ6hhAe2
 DNjCl7siU3WGURZocML1fTpbcJemlNxoY7o3xgr4M+UrICJOozcPvrRUn2JAx7hgrK+20uPFJEw8E
 gwHH404YU7Wn5/ELKKNMgwEi8oksXA/GwtO8dOjls=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Nikita Ivanov <nivanov@cloudlinux.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Greg Kurz <groug@kaod.org>, Jason Wang <jasowang@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] error handling: Use TFR() macro where applicable
Date: Fri, 07 Oct 2022 16:50:11 +0200
Message-ID: <5885388.c8DTVQRkz6@silver>
In-Reply-To: <CAAJ4Ao8sxnuxgeUFwvdwceMn6=xy_QxYuOzhAJcGthnSd1pRgQ@mail.gmail.com>
References: <CAAJ4Ao9crXap1OYiutSgG5caZHzVkM=WvQYpVD2XN1M8JsD3cQ@mail.gmail.com>
 <CAFEAcA9PcDk5pnRrKQf2zRaX8h8KSA9SDHODS102iK3jd_fpUQ@mail.gmail.com>
 <CAAJ4Ao8sxnuxgeUFwvdwceMn6=xy_QxYuOzhAJcGthnSd1pRgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Freitag, 7. Oktober 2022 13:44:28 CEST Nikita Ivanov wrote:
> Hi!

Hi Nikita!

> Sorry for such a long absence, I've been resolving some other issues in my
> life for a while. I've adjusted the patch according to your latest
> comments. Could you check it out, please?

Sorry for the drill, but I fear this has to follow common form for patch 
submissions:

  * one email as cover letter

  * two (additional) separate emails for the two patches, each referencing the 
    cover letter email

  * bumping the version in subject line

https://www.qemu.org/docs/master/devel/submitting-a-patch.html

One more comment on patch 2 below ...

> From 5389c5ccc8789f8f666ab99e50d38af728bd2c9c Mon Sep 17 00:00:00 2001
> From: Nikita Ivanov <nivanov@cloudlinux.com>
> Date: Wed, 3 Aug 2022 12:54:00 +0300
> Subject: [PATCH 1/2] error handling: Use TFR() macro where applicable
> 
> There is a defined TFR() macro in qemu/osdep.h which
> handles the same while loop.
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/415
> 
> Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
> ---
>  block/file-posix.c        | 39 ++++++++++++++++++---------------------
>  chardev/char-pty.c        |  4 +---
>  hw/9pfs/9p-local.c        |  8 ++------
>  net/l2tpv3.c              | 15 +++------------
>  net/socket.c              | 16 +++++++---------
>  net/tap.c                 |  8 ++------
>  qga/commands-posix.c      |  4 +---
>  semihosting/syscalls.c    |  4 +---
>  tests/qtest/libqtest.c    | 14 +++++++-------
>  tests/vhost-user-bridge.c |  4 +---
>  util/main-loop.c          |  4 +---
>  util/osdep.c              |  4 +---
>  util/vfio-helpers.c       | 12 ++++++------
>  13 files changed, 51 insertions(+), 85 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 66fdb07820..7892bdea31 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1238,9 +1238,9 @@ static int hdev_get_max_segments(int fd, struct stat
> *st)
>          ret = -errno;
>          goto out;
>      }
> -    do {
> -        ret = read(sysfd, buf, sizeof(buf) - 1);
> -    } while (ret == -1 && errno == EINTR);
> +    TFR(
> +        ret = read(sysfd, buf, sizeof(buf) - 1)
> +    );
>      if (ret < 0) {
>          ret = -errno;
>          goto out;
> @@ -1388,9 +1388,9 @@ static int handle_aiocb_ioctl(void *opaque)
>      RawPosixAIOData *aiocb = opaque;
>      int ret;
> 
> -    do {
> -        ret = ioctl(aiocb->aio_fildes, aiocb->ioctl.cmd, aiocb->ioctl.buf);
> -    } while (ret == -1 && errno == EINTR);
> +    TFR(
> +        ret = ioctl(aiocb->aio_fildes, aiocb->ioctl.cmd, aiocb->ioctl.buf)
> +    );
>      if (ret == -1) {
>          return -errno;
>      }
> @@ -1472,18 +1472,17 @@ static ssize_t
> handle_aiocb_rw_vector(RawPosixAIOData *aiocb)
>  {
>      ssize_t len;
> 
> -    do {
> -        if (aiocb->aio_type & QEMU_AIO_WRITE)
> -            len = qemu_pwritev(aiocb->aio_fildes,
> -                               aiocb->io.iov,
> -                               aiocb->io.niov,
> -                               aiocb->aio_offset);
> -         else
> -            len = qemu_preadv(aiocb->aio_fildes,
> -                              aiocb->io.iov,
> -                              aiocb->io.niov,
> -                              aiocb->aio_offset);
> -    } while (len == -1 && errno == EINTR);
> +    TFR(
> +        len = (aiocb->aio_type & QEMU_AIO_WRITE) ?
> +            qemu_pwritev(aiocb->aio_fildes,
> +                           aiocb->io.iov,
> +                           aiocb->io.niov,
> +                           aiocb->aio_offset) :
> +            qemu_preadv(aiocb->aio_fildes,
> +                          aiocb->io.iov,
> +                          aiocb->io.niov,
> +                          aiocb->aio_offset)
> +    );
> 
>      if (len == -1) {
>          return -errno;
> @@ -1908,9 +1907,7 @@ static int allocate_first_block(int fd, size_t
> max_size)
>      buf = qemu_memalign(max_align, write_size);
>      memset(buf, 0, write_size);
> 
> -    do {
> -        n = pwrite(fd, buf, write_size, 0);
> -    } while (n == -1 && errno == EINTR);
> +    TFR(n = pwrite(fd, buf, write_size, 0));
> 
>      ret = (n == -1) ? -errno : 0;
> 
> diff --git a/chardev/char-pty.c b/chardev/char-pty.c
> index 53f25c6bbd..b2f490bacf 100644
> --- a/chardev/char-pty.c
> +++ b/chardev/char-pty.c
> @@ -93,9 +93,7 @@ static void pty_chr_update_read_handler(Chardev *chr)
>      pfd.fd = fioc->fd;
>      pfd.events = G_IO_OUT;
>      pfd.revents = 0;
> -    do {
> -        rc = g_poll(&pfd, 1, 0);
> -    } while (rc == -1 && errno == EINTR);
> +    TFR(rc = g_poll(&pfd, 1, 0));
>      assert(rc >= 0);
> 
>      if (pfd.revents & G_IO_HUP) {
> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index d42ce6d8b8..c90ab947ba 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -470,9 +470,7 @@ static ssize_t local_readlink(FsContext *fs_ctx,
> V9fsPath *fs_path,
>          if (fd == -1) {
>              return -1;
>          }
> -        do {
> -            tsize = read(fd, (void *)buf, bufsz);
> -        } while (tsize == -1 && errno == EINTR);
> +        TFR(tsize = read(fd, (void *)buf, bufsz));
>          close_preserve_errno(fd);
>      } else if ((fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
>                 (fs_ctx->export_flags & V9FS_SM_NONE)) {
> @@ -908,9 +906,7 @@ static int local_symlink(FsContext *fs_ctx, const char
> *oldpath,
>          }
>          /* Write the oldpath (target) to the file. */
>          oldpath_size = strlen(oldpath);
> -        do {
> -            write_size = write(fd, (void *)oldpath, oldpath_size);
> -        } while (write_size == -1 && errno == EINTR);
> +        TFR(write_size = write(fd, (void *)oldpath, oldpath_size));
>          close_preserve_errno(fd);
> 
>          if (write_size != oldpath_size) {
> diff --git a/net/l2tpv3.c b/net/l2tpv3.c
> index af373e5c30..adfdbdb84c 100644
> --- a/net/l2tpv3.c
> +++ b/net/l2tpv3.c
> @@ -240,9 +240,7 @@ static ssize_t
> net_l2tpv3_receive_dgram_iov(NetClientState *nc,
>      message.msg_control = NULL;
>      message.msg_controllen = 0;
>      message.msg_flags = 0;
> -    do {
> -        ret = sendmsg(s->fd, &message, 0);
> -    } while ((ret == -1) && (errno == EINTR));
> +    TFR(ret = sendmsg(s->fd, &message, 0));
>      if (ret > 0) {
>          ret -= s->offset;
>      } else if (ret == 0) {
> @@ -285,9 +283,7 @@ static ssize_t net_l2tpv3_receive_dgram(NetClientState
> *nc,
>      message.msg_control = NULL;
>      message.msg_controllen = 0;
>      message.msg_flags = 0;
> -    do {
> -        ret = sendmsg(s->fd, &message, 0);
> -    } while ((ret == -1) && (errno == EINTR));
> +    TFR(ret = sendmsg(s->fd, &message, 0));
>      if (ret > 0) {
>          ret -= s->offset;
>      } else if (ret == 0) {
> @@ -434,12 +430,7 @@ static void net_l2tpv3_send(void *opaque)
> 
>      msgvec = s->msgvec + s->queue_head;
>      if (target_count > 0) {
> -        do {
> -            count = recvmmsg(
> -                s->fd,
> -                msgvec,
> -                target_count, MSG_DONTWAIT, NULL);
> -        } while ((count == -1) && (errno == EINTR));
> +        TFR(count = recvmmsg(s->fd, msgvec, target_count, MSG_DONTWAIT,
> NULL));
>          if (count < 0) {
>              /* Recv error - we still need to flush packets here,
>               * (re)set queue head to current position
> diff --git a/net/socket.c b/net/socket.c
> index bfd8596250..a3397660c2 100644
> --- a/net/socket.c
> +++ b/net/socket.c
> @@ -117,15 +117,13 @@ static ssize_t
> net_socket_receive_dgram(NetClientState *nc, const uint8_t *buf,
>      NetSocketState *s = DO_UPCAST(NetSocketState, nc, nc);
>      ssize_t ret;
> 
> -    do {
> -        if (s->dgram_dst.sin_family != AF_UNIX) {
> -            ret = sendto(s->fd, buf, size, 0,
> -                         (struct sockaddr *)&s->dgram_dst,
> -                         sizeof(s->dgram_dst));
> -        } else {
> -            ret = send(s->fd, buf, size, 0);
> -        }
> -    } while (ret == -1 && errno == EINTR);
> +    TFR(
> +        ret = s->dgram_dst.sin_family != AF_UNIX ?
> +            sendto(s->fd, buf, size, 0,
> +                     (struct sockaddr *)&s->dgram_dst,
> +                     sizeof(s->dgram_dst)) :
> +            send(s->fd, buf, size, 0)
> +    );
> 
>      if (ret == -1 && errno == EAGAIN) {
>          net_socket_write_poll(s, true);
> diff --git a/net/tap.c b/net/tap.c
> index e203d07a12..281b0ec9b9 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -102,9 +102,7 @@ static ssize_t tap_write_packet(TAPState *s, const
> struct iovec *iov, int iovcnt
>  {
>      ssize_t len;
> 
> -    do {
> -        len = writev(s->fd, iov, iovcnt);
> -    } while (len == -1 && errno == EINTR);
> +    TFR(len = writev(s->fd, iov, iovcnt));
> 
>      if (len == -1 && errno == EAGAIN) {
>          tap_write_poll(s, true);
> @@ -577,9 +575,7 @@ static int net_bridge_run_helper(const char *helper,
> const char *bridge,
> 
>          close(sv[1]);
> 
> -        do {
> -            fd = recv_fd(sv[0]);
> -        } while (fd == -1 && errno == EINTR);
> +        TFR(fd = recv_fd(sv[0]));
>          saved_errno = errno;
> 
>          close(sv[0]);
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index eea819cff0..19a03ce6d8 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -68,9 +68,7 @@ static void ga_wait_child(pid_t pid, int *status, Error
> **errp)
> 
>      *status = 0;
> 
> -    do {
> -        rpid = waitpid(pid, status, 0);
> -    } while (rpid == -1 && errno == EINTR);
> +    TFR(rpid = waitpid(pid, status, 0));
> 
>      if (rpid == -1) {
>          error_setg_errno(errp, errno, "failed to wait for child (pid: %d)",
> diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
> index 508a0ad88c..025c08147a 100644
> --- a/semihosting/syscalls.c
> +++ b/semihosting/syscalls.c
> @@ -317,9 +317,7 @@ static void host_read(CPUState *cs,
> gdb_syscall_complete_cb complete,
>          complete(cs, -1, EFAULT);
>          return;
>      }
> -    do {
> -        ret = read(gf->hostfd, ptr, len);
> -    } while (ret == -1 && errno == EINTR);
> +    TFR(ret = read(gf->hostfd, ptr, len));
>      if (ret == -1) {
>          complete(cs, -1, errno);
>          unlock_user(ptr, buf, 0);
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 4f4b2d6477..60de1d2fcb 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -101,10 +101,10 @@ static int socket_accept(int sock)
>          return -1;
>      }
> 
> -    do {
> -        addrlen = sizeof(addr);
> -        ret = accept(sock, (struct sockaddr *)&addr, &addrlen);
> -    } while (ret == -1 && errno == EINTR);
> +    addrlen = sizeof(addr);
> +    TFR(
> +        ret = accept(sock, (struct sockaddr *)&addr, &addrlen)
> +    );
>      if (ret == -1) {
>          fprintf(stderr, "%s failed: %s\n", __func__, strerror(errno));
>      }
> @@ -582,9 +582,9 @@ int qtest_socket_server(const char *socket_path)
>      addr.sun_family = AF_UNIX;
>      snprintf(addr.sun_path, sizeof(addr.sun_path), "%s", socket_path);
> 
> -    do {
> -        ret = bind(sock, (struct sockaddr *)&addr, sizeof(addr));
> -    } while (ret == -1 && errno == EINTR);
> +    TFR(
> +        ret = bind(sock, (struct sockaddr *)&addr, sizeof(addr))
> +    );
>      g_assert_cmpint(ret, !=, -1);
>      ret = listen(sock, 1);
>      g_assert_cmpint(ret, !=, -1);
> diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
> index fecdf915e7..66d1ddbd7a 100644
> --- a/tests/vhost-user-bridge.c
> +++ b/tests/vhost-user-bridge.c
> @@ -331,9 +331,7 @@ vubr_backend_recv_cb(int sock, void *ctx)
>              .msg_iovlen = num,
>              .msg_flags = MSG_DONTWAIT,
>          };
> -        do {
> -            ret = recvmsg(vubr->backend_udp_sock, &msg, 0);
> -        } while (ret == -1 && (errno == EINTR));
> +        TFR(ret = recvmsg(vubr->backend_udp_sock, &msg, 0));
> 
>          if (i == 0) {
>              iov_restore_front(elem->in_sg, sg, hdrlen);
> diff --git a/util/main-loop.c b/util/main-loop.c
> index f00a25451b..58e14db2d4 100644
> --- a/util/main-loop.c
> +++ b/util/main-loop.c
> @@ -64,9 +64,7 @@ static void sigfd_handler(void *opaque)
>      ssize_t len;
> 
>      while (1) {
> -        do {
> -            len = read(fd, &info, sizeof(info));
> -        } while (len == -1 && errno == EINTR);
> +        TFR(len = read(fd, &info, sizeof(info)));
> 
>          if (len == -1 && errno == EAGAIN) {
>              break;
> diff --git a/util/osdep.c b/util/osdep.c
> index 60fcbbaebe..d35c473ac7 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -244,9 +244,7 @@ static int qemu_lock_fcntl(int fd, int64_t start,
> int64_t len, int fl_type)
>          .l_type   = fl_type,
>      };
>      qemu_probe_lock_ops();
> -    do {
> -        ret = fcntl(fd, fcntl_op_setlk, &fl);
> -    } while (ret == -1 && errno == EINTR);
> +    TFR(ret = fcntl(fd, fcntl_op_setlk, &fl));
>      return ret == -1 ? -errno : 0;
>  }
> 
> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> index 5ba01177bf..c878be1c5f 100644
> --- a/util/vfio-helpers.c
> +++ b/util/vfio-helpers.c
> @@ -240,9 +240,9 @@ static int qemu_vfio_pci_read_config(QEMUVFIOState *s,
> void *buf,
>                                      s->config_region_info.offset,
>                                      s->config_region_info.size);
>      assert(QEMU_IS_ALIGNED(s->config_region_info.offset + ofs, size));
> -    do {
> -        ret = pread(s->device, buf, size, s->config_region_info.offset +
> ofs);
> -    } while (ret == -1 && errno == EINTR);
> +    TFR(
> +        ret = pread(s->device, buf, size, s->config_region_info.offset +
> ofs)
> +    );
>      return ret == size ? 0 : -errno;
>  }
> 
> @@ -254,9 +254,9 @@ static int qemu_vfio_pci_write_config(QEMUVFIOState *s,
> void *buf, int size, int
>                                       s->config_region_info.offset,
>                                       s->config_region_info.size);
>      assert(QEMU_IS_ALIGNED(s->config_region_info.offset + ofs, size));
> -    do {
> -        ret = pwrite(s->device, buf, size, s->config_region_info.offset +
> ofs);
> -    } while (ret == -1 && errno == EINTR);
> +    TFR(
> +        ret = pwrite(s->device, buf, size, s->config_region_info.offset +
> ofs)
> +    );
>      return ret == size ? 0 : -errno;
>  }
> 
> --
> 2.37.3
> 
> 
> From 7a9fccf00ec2d1c6b30b2ed1cb98398b49ddb0bc Mon Sep 17 00:00:00 2001
> From: Nikita Ivanov <nivanov@cloudlinux.com>
> Date: Mon, 8 Aug 2022 20:43:45 +0300
> Subject: [PATCH 2/2] Refactoring: rename TFR() to TEMP_FAILURE_RETRY()
> 
> glibc's unistd.h header provides the same macro with the
> subtle difference in type casting. Adjust macro name to the
> common standard and refactor it to expression.
> 
> Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
> ---
>  block/file-posix.c        | 14 +++++++-------
>  chardev/char-fd.c         |  2 +-
>  chardev/char-pipe.c       | 12 +++++++++---
>  chardev/char-pty.c        |  2 +-
>  hw/9pfs/9p-local.c        |  6 ++++--
>  include/qemu/osdep.h      |  8 +++++++-
>  net/l2tpv3.c              |  8 +++++---
>  net/socket.c              |  4 ++--
>  net/tap-bsd.c             |  6 +++---
>  net/tap-linux.c           |  2 +-
>  net/tap-solaris.c         |  8 ++++----
>  net/tap.c                 | 10 ++++++----
>  os-posix.c                |  2 +-
>  qga/commands-posix.c      |  2 +-
>  semihosting/syscalls.c    |  2 +-
>  tests/qtest/libqtest.c    | 10 +++++-----
>  tests/vhost-user-bridge.c |  4 +++-
>  util/main-loop.c          |  2 +-
>  util/osdep.c              |  2 +-
>  util/vfio-helpers.c       |  8 ++++----
>  20 files changed, 67 insertions(+), 47 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 7892bdea31..ee7f60c78a 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1238,8 +1238,8 @@ static int hdev_get_max_segments(int fd, struct stat
> *st)
>          ret = -errno;
>          goto out;
>      }
> -    TFR(
> -        ret = read(sysfd, buf, sizeof(buf) - 1)
> +    ret = TEMP_FAILURE_RETRY(
> +        read(sysfd, buf, sizeof(buf) - 1)
>      );
>      if (ret < 0) {
>          ret = -errno;
> @@ -1388,8 +1388,8 @@ static int handle_aiocb_ioctl(void *opaque)
>      RawPosixAIOData *aiocb = opaque;
>      int ret;
> 
> -    TFR(
> -        ret = ioctl(aiocb->aio_fildes, aiocb->ioctl.cmd, aiocb->ioctl.buf)
> +    ret = TEMP_FAILURE_RETRY(
> +        ioctl(aiocb->aio_fildes, aiocb->ioctl.cmd, aiocb->ioctl.buf)
>      );
>      if (ret == -1) {
>          return -errno;
> @@ -1472,8 +1472,8 @@ static ssize_t handle_aiocb_rw_vector(RawPosixAIOData
> *aiocb)
>  {
>      ssize_t len;
> 
> -    TFR(
> -        len = (aiocb->aio_type & QEMU_AIO_WRITE) ?
> +    len = TEMP_FAILURE_RETRY(
> +        (aiocb->aio_type & QEMU_AIO_WRITE) ?
>              qemu_pwritev(aiocb->aio_fildes,
>                             aiocb->io.iov,
>                             aiocb->io.niov,
> @@ -1907,7 +1907,7 @@ static int allocate_first_block(int fd, size_t
> max_size)
>      buf = qemu_memalign(max_align, write_size);
>      memset(buf, 0, write_size);
> 
> -    TFR(n = pwrite(fd, buf, write_size, 0));
> +    n = TEMP_FAILURE_RETRY(pwrite(fd, buf, write_size, 0));
> 
>      ret = (n == -1) ? -errno : 0;
> 
> diff --git a/chardev/char-fd.c b/chardev/char-fd.c
> index cf78454841..1250a63236 100644
> --- a/chardev/char-fd.c
> +++ b/chardev/char-fd.c
> @@ -198,7 +198,7 @@ int qmp_chardev_open_file_source(char *src, int flags,
> Error **errp)
>  {
>      int fd = -1;
> 
> -    TFR(fd = qemu_open_old(src, flags, 0666));
> +    fd = TEMP_FAILURE_RETRY(qemu_open_old(src, flags, 0666));
>      if (fd == -1) {
>          error_setg_file_open(errp, errno, src);
>      }
> diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
> index 66d3b85091..a59a055c87 100644
> --- a/chardev/char-pipe.c
> +++ b/chardev/char-pipe.c
> @@ -131,8 +131,12 @@ static void qemu_chr_open_pipe(Chardev *chr,
> 
>      filename_in = g_strdup_printf("%s.in", filename);
>      filename_out = g_strdup_printf("%s.out", filename);
> -    TFR(fd_in = qemu_open_old(filename_in, O_RDWR | O_BINARY));
> -    TFR(fd_out = qemu_open_old(filename_out, O_RDWR | O_BINARY));
> +    fd_in = TEMP_FAILURE_RETRY(
> +        qemu_open_old(filename_in, O_RDWR | O_BINARY)
> +    );
> +    fd_out = TEMP_FAILURE_RETRY(
> +        qemu_open_old(filename_out, O_RDWR | O_BINARY)
> +    );
>      g_free(filename_in);
>      g_free(filename_out);
>      if (fd_in < 0 || fd_out < 0) {
> @@ -142,7 +146,9 @@ static void qemu_chr_open_pipe(Chardev *chr,
>          if (fd_out >= 0) {
>              close(fd_out);
>          }
> -        TFR(fd_in = fd_out = qemu_open_old(filename, O_RDWR | O_BINARY));
> +        fd_in = fd_out = TEMP_FAILURE_RETRY(
> +            qemu_open_old(filename, O_RDWR | O_BINARY)
> +        );
>          if (fd_in < 0) {
>              error_setg_file_open(errp, errno, filename);
>              return;
> diff --git a/chardev/char-pty.c b/chardev/char-pty.c
> index b2f490bacf..913a98250b 100644
> --- a/chardev/char-pty.c
> +++ b/chardev/char-pty.c
> @@ -93,7 +93,7 @@ static void pty_chr_update_read_handler(Chardev *chr)
>      pfd.fd = fioc->fd;
>      pfd.events = G_IO_OUT;
>      pfd.revents = 0;
> -    TFR(rc = g_poll(&pfd, 1, 0));
> +    rc = TEMP_FAILURE_RETRY(g_poll(&pfd, 1, 0));
>      assert(rc >= 0);
> 
>      if (pfd.revents & G_IO_HUP) {
> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index c90ab947ba..6a3b4fac4a 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -470,7 +470,7 @@ static ssize_t local_readlink(FsContext *fs_ctx,
> V9fsPath *fs_path,
>          if (fd == -1) {
>              return -1;
>          }
> -        TFR(tsize = read(fd, (void *)buf, bufsz));
> +        tsize = TEMP_FAILURE_RETRY(read(fd, (void *)buf, bufsz));
>          close_preserve_errno(fd);
>      } else if ((fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
>                 (fs_ctx->export_flags & V9FS_SM_NONE)) {
> @@ -906,7 +906,9 @@ static int local_symlink(FsContext *fs_ctx, const char
> *oldpath,
>          }
>          /* Write the oldpath (target) to the file. */
>          oldpath_size = strlen(oldpath);
> -        TFR(write_size = write(fd, (void *)oldpath, oldpath_size));
> +        write_size = TEMP_FAILURE_RETRY(
> +            write(fd, (void *)oldpath, oldpath_size)
> +        );
>          close_preserve_errno(fd);
> 
>          if (write_size != oldpath_size) {
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index b1c161c035..6e244f15fa 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -243,7 +243,13 @@ void QEMU_ERROR("code path is reachable")
>  #define ESHUTDOWN 4099
>  #endif
> 
> -#define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
> +#define TEMP_FAILURE_RETRY(expr) \
> +    (__extension__                                          \
> +        ({ typeof(int64_t) __result;                               \

I think Peter meant `typeof(expr)` here. :)

> +           do {                                             \
> +                __result = (typeof(int64_t)) (expression);         \

Same here.

> +           } while (__result == -1L && errno == EINTR);     \
> +           __result; }))
> 
>  /* time_t may be either 32 or 64 bits depending on the host OS, and
>   * can be either signed or unsigned, so we can't just hardcode a
> diff --git a/net/l2tpv3.c b/net/l2tpv3.c
> index adfdbdb84c..cbde9332fe 100644
> --- a/net/l2tpv3.c
> +++ b/net/l2tpv3.c
> @@ -240,7 +240,7 @@ static ssize_t
> net_l2tpv3_receive_dgram_iov(NetClientState *nc,
>      message.msg_control = NULL;
>      message.msg_controllen = 0;
>      message.msg_flags = 0;
> -    TFR(ret = sendmsg(s->fd, &message, 0));
> +    ret = TEMP_FAILURE_RETRY(sendmsg(s->fd, &message, 0));
>      if (ret > 0) {
>          ret -= s->offset;
>      } else if (ret == 0) {
> @@ -283,7 +283,7 @@ static ssize_t net_l2tpv3_receive_dgram(NetClientState
> *nc,
>      message.msg_control = NULL;
>      message.msg_controllen = 0;
>      message.msg_flags = 0;
> -    TFR(ret = sendmsg(s->fd, &message, 0));
> +    ret = TEMP_FAILURE_RETRY(sendmsg(s->fd, &message, 0));
>      if (ret > 0) {
>          ret -= s->offset;
>      } else if (ret == 0) {
> @@ -430,7 +430,9 @@ static void net_l2tpv3_send(void *opaque)
> 
>      msgvec = s->msgvec + s->queue_head;
>      if (target_count > 0) {
> -        TFR(count = recvmmsg(s->fd, msgvec, target_count, MSG_DONTWAIT,
> NULL));
> +        count = TEMP_FAILURE_RETRY(
> +            recvmmsg(s->fd, msgvec, target_count, MSG_DONTWAIT, NULL)
> +        );
>          if (count < 0) {
>              /* Recv error - we still need to flush packets here,
>               * (re)set queue head to current position
> diff --git a/net/socket.c b/net/socket.c
> index a3397660c2..cfb893b183 100644
> --- a/net/socket.c
> +++ b/net/socket.c
> @@ -117,8 +117,8 @@ static ssize_t net_socket_receive_dgram(NetClientState
> *nc, const uint8_t *buf,
>      NetSocketState *s = DO_UPCAST(NetSocketState, nc, nc);
>      ssize_t ret;
> 
> -    TFR(
> -        ret = s->dgram_dst.sin_family != AF_UNIX ?
> +    ret = TEMP_FAILURE_RETRY(
> +        s->dgram_dst.sin_family != AF_UNIX ?
>              sendto(s->fd, buf, size, 0,
>                       (struct sockaddr *)&s->dgram_dst,
>                       sizeof(s->dgram_dst)) :
> diff --git a/net/tap-bsd.c b/net/tap-bsd.c
> index 005ce05c6e..720090244e 100644
> --- a/net/tap-bsd.c
> +++ b/net/tap-bsd.c
> @@ -56,7 +56,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
> } else {
>              snprintf(dname, sizeof dname, "/dev/tap%d", i);
>          }
> -        TFR(fd = open(dname, O_RDWR));
> +        fd = TEMP_FAILURE_RETRY(open(dname, O_RDWR));
>          if (fd >= 0) {
>              break;
>          }
> @@ -111,7 +111,7 @@ static int tap_open_clone(char *ifname, int
> ifname_size, Error **errp)
>      int fd, s, ret;
>      struct ifreq ifr;
> 
> -    TFR(fd = open(PATH_NET_TAP, O_RDWR));
> +    fd = TEMP_FAILURE_RETRY(open(PATH_NET_TAP, O_RDWR));
>      if (fd < 0) {
>          error_setg_errno(errp, errno, "could not open %s", PATH_NET_TAP);
>          return -1;
> @@ -159,7 +159,7 @@ int tap_open(char *ifname, int ifname_size, int
> *vnet_hdr,
>      if (ifname[0] != '\0') {
>          char dname[100];
>          snprintf(dname, sizeof dname, "/dev/%s", ifname);
> -        TFR(fd = open(dname, O_RDWR));
> +        fd = TEMP_FAILURE_RETRY(open(dname, O_RDWR));
>          if (fd < 0 && errno != ENOENT) {
>              error_setg_errno(errp, errno, "could not open %s", dname);
>              return -1;
> diff --git a/net/tap-linux.c b/net/tap-linux.c
> index 304ff45071..bf3ce44329 100644
> --- a/net/tap-linux.c
> +++ b/net/tap-linux.c
> @@ -45,7 +45,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
> int len = sizeof(struct virtio_net_hdr);
>      unsigned int features;
> 
> -    TFR(fd = open(PATH_NET_TUN, O_RDWR));
> +    fd = TEMP_FAILURE_RETRY(open(PATH_NET_TUN, O_RDWR));
>      if (fd < 0) {
>          error_setg_errno(errp, errno, "could not open %s", PATH_NET_TUN);
>          return -1;
> diff --git a/net/tap-solaris.c b/net/tap-solaris.c
> index a44f8805c2..73e0e9f196 100644
> --- a/net/tap-solaris.c
> +++ b/net/tap-solaris.c
> @@ -84,13 +84,13 @@ static int tap_alloc(char *dev, size_t dev_size, Error
> **errp)
>      if( ip_fd )
>         close(ip_fd);
> 
> -    TFR(ip_fd = open("/dev/udp", O_RDWR, 0));
> +    ip_fd = TEMP_FAILURE_RETRY(open("/dev/udp", O_RDWR, 0));
>      if (ip_fd < 0) {
>          error_setg(errp, "Can't open /dev/ip (actually /dev/udp)");
>          return -1;
>      }
> 
> -    TFR(tap_fd = open("/dev/tap", O_RDWR, 0));
> +    tap_fd = TEMP_FAILURE_RETRY(open("/dev/tap", O_RDWR, 0));
>      if (tap_fd < 0) {
>          error_setg(errp, "Can't open /dev/tap");
>          return -1;
> @@ -104,7 +104,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error
> **errp)
>      if ((ppa = ioctl (tap_fd, I_STR, &strioc_ppa)) < 0)
>          error_report("Can't assign new interface");
> 
> -    TFR(if_fd = open("/dev/tap", O_RDWR, 0));
> +    if_fd = TEMP_FAILURE_RETRY(open("/dev/tap", O_RDWR, 0));
>      if (if_fd < 0) {
>          error_setg(errp, "Can't open /dev/tap (2)");
>          return -1;
> @@ -137,7 +137,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error
> **errp)
>      if (ioctl (ip_fd, I_PUSH, "arp") < 0)
>          error_report("Can't push ARP module (3)");
>      /* Open arp_fd */
> -    TFR(arp_fd = open ("/dev/tap", O_RDWR, 0));
> +    arp_fd = TEMP_FAILURE_RETRY(open("/dev/tap", O_RDWR, 0));
>      if (arp_fd < 0)
>          error_report("Can't open %s", "/dev/tap");
> 
> diff --git a/net/tap.c b/net/tap.c
> index 281b0ec9b9..592d6c2c1a 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -102,7 +102,7 @@ static ssize_t tap_write_packet(TAPState *s, const
> struct iovec *iov, int iovcnt
>  {
>      ssize_t len;
> 
> -    TFR(len = writev(s->fd, iov, iovcnt));
> +    len = TEMP_FAILURE_RETRY(writev(s->fd, iov, iovcnt));
> 
>      if (len == -1 && errno == EAGAIN) {
>          tap_write_poll(s, true);
> @@ -575,7 +575,7 @@ static int net_bridge_run_helper(const char *helper,
> const char *bridge,
> 
>          close(sv[1]);
> 
> -        TFR(fd = recv_fd(sv[0]));
> +        fd = TEMP_FAILURE_RETRY(recv_fd(sv[0]));
>          saved_errno = errno;
> 
>          close(sv[0]);
> @@ -647,8 +647,10 @@ static int net_tap_init(const NetdevTapOptions *tap,
> int *vnet_hdr,
>          vnet_hdr_required = 0;
>      }
> 
> -    TFR(fd = tap_open(ifname, ifname_sz, vnet_hdr, vnet_hdr_required,
> -                      mq_required, errp));
> +    fd = TEMP_FAILURE_RETRY(
> +        tap_open(ifname, ifname_sz, vnet_hdr, vnet_hdr_required,
> +                      mq_required, errp)
> +    );
>      if (fd < 0) {
>          return -1;
>      }
> diff --git a/os-posix.c b/os-posix.c
> index 321fc4bd13..59cac65585 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -266,7 +266,7 @@ void os_setup_post(void)
>              error_report("not able to chdir to /: %s", strerror(errno));
>              exit(1);
>          }
> -        TFR(fd = qemu_open_old("/dev/null", O_RDWR));
> +        fd = TEMP_FAILURE_RETRY(qemu_open_old("/dev/null", O_RDWR));
>          if (fd == -1) {
>              exit(1);
>          }
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 19a03ce6d8..1cb214c7e2 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -68,7 +68,7 @@ static void ga_wait_child(pid_t pid, int *status, Error
> **errp)
> 
>      *status = 0;
> 
> -    TFR(rpid = waitpid(pid, status, 0));
> +    rpid = TEMP_FAILURE_RETRY(waitpid(pid, status, 0));
> 
>      if (rpid == -1) {
>          error_setg_errno(errp, errno, "failed to wait for child (pid: %d)",
> diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
> index 025c08147a..0cbef7d22b 100644
> --- a/semihosting/syscalls.c
> +++ b/semihosting/syscalls.c
> @@ -317,7 +317,7 @@ static void host_read(CPUState *cs,
> gdb_syscall_complete_cb complete,
>          complete(cs, -1, EFAULT);
>          return;
>      }
> -    TFR(ret = read(gf->hostfd, ptr, len));
> +    ret = TEMP_FAILURE_RETRY(read(gf->hostfd, ptr, len));
>      if (ret == -1) {
>          complete(cs, -1, errno);
>          unlock_user(ptr, buf, 0);
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 60de1d2fcb..56863a56b9 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -102,8 +102,8 @@ static int socket_accept(int sock)
>      }
> 
>      addrlen = sizeof(addr);
> -    TFR(
> -        ret = accept(sock, (struct sockaddr *)&addr, &addrlen)
> +    ret = TEMP_FAILURE_RETRY(
> +        accept(sock, (struct sockaddr *)&addr, &addrlen)
>      );
>      if (ret == -1) {
>          fprintf(stderr, "%s failed: %s\n", __func__, strerror(errno));
> @@ -140,7 +140,7 @@ void qtest_kill_qemu(QTestState *s)
>      /* Skip wait if qtest_probe_child already reaped. */
>      if (pid != -1) {
>          kill(pid, SIGTERM);
> -        TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
> +        pid = TEMP_FAILURE_RETRY(waitpid(s->qemu_pid, &s->wstatus, 0));
>          assert(pid == s->qemu_pid);
>          s->qemu_pid = -1;
>      }
> @@ -582,8 +582,8 @@ int qtest_socket_server(const char *socket_path)
>      addr.sun_family = AF_UNIX;
>      snprintf(addr.sun_path, sizeof(addr.sun_path), "%s", socket_path);
> 
> -    TFR(
> -        ret = bind(sock, (struct sockaddr *)&addr, sizeof(addr))
> +    ret = TEMP_FAILURE_RETRY(
> +        bind(sock, (struct sockaddr *)&addr, sizeof(addr))
>      );
>      g_assert_cmpint(ret, !=, -1);
>      ret = listen(sock, 1);
> diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
> index 66d1ddbd7a..392432259f 100644
> --- a/tests/vhost-user-bridge.c
> +++ b/tests/vhost-user-bridge.c
> @@ -331,7 +331,9 @@ vubr_backend_recv_cb(int sock, void *ctx)
>              .msg_iovlen = num,
>              .msg_flags = MSG_DONTWAIT,
>          };
> -        TFR(ret = recvmsg(vubr->backend_udp_sock, &msg, 0));
> +        ret = TEMP_FAILURE_RETRY(
> +                recvmsg(vubr->backend_udp_sock, &msg, 0)
> +        );
> 
>          if (i == 0) {
>              iov_restore_front(elem->in_sg, sg, hdrlen);
> diff --git a/util/main-loop.c b/util/main-loop.c
> index 58e14db2d4..5f65f928bd 100644
> --- a/util/main-loop.c
> +++ b/util/main-loop.c
> @@ -64,7 +64,7 @@ static void sigfd_handler(void *opaque)
>      ssize_t len;
> 
>      while (1) {
> -        TFR(len = read(fd, &info, sizeof(info)));
> +        len = TEMP_FAILURE_RETRY(read(fd, &info, sizeof(info)));
> 
>          if (len == -1 && errno == EAGAIN) {
>              break;
> diff --git a/util/osdep.c b/util/osdep.c
> index d35c473ac7..2c287e75e7 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -244,7 +244,7 @@ static int qemu_lock_fcntl(int fd, int64_t start,
> int64_t len, int fl_type)
>          .l_type   = fl_type,
>      };
>      qemu_probe_lock_ops();
> -    TFR(ret = fcntl(fd, fcntl_op_setlk, &fl));
> +    ret = TEMP_FAILURE_RETRY(fcntl(fd, fcntl_op_setlk, &fl));
>      return ret == -1 ? -errno : 0;
>  }
> 
> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> index c878be1c5f..e1422666eb 100644
> --- a/util/vfio-helpers.c
> +++ b/util/vfio-helpers.c
> @@ -240,8 +240,8 @@ static int qemu_vfio_pci_read_config(QEMUVFIOState *s,
> void *buf,
>                                      s->config_region_info.offset,
>                                      s->config_region_info.size);
>      assert(QEMU_IS_ALIGNED(s->config_region_info.offset + ofs, size));
> -    TFR(
> -        ret = pread(s->device, buf, size, s->config_region_info.offset +
> ofs)
> +    ret = TEMP_FAILURE_RETRY(
> +        pread(s->device, buf, size, s->config_region_info.offset + ofs)
>      );
>      return ret == size ? 0 : -errno;
>  }
> @@ -254,8 +254,8 @@ static int qemu_vfio_pci_write_config(QEMUVFIOState *s,
> void *buf, int size, int
>                                       s->config_region_info.offset,
>                                       s->config_region_info.size);
>      assert(QEMU_IS_ALIGNED(s->config_region_info.offset + ofs, size));
> -    TFR(
> -        ret = pwrite(s->device, buf, size, s->config_region_info.offset +
> ofs)
> +    ret = TEMP_FAILURE_RETRY(
> +        pwrite(s->device, buf, size, s->config_region_info.offset + ofs)
>      );
>      return ret == size ? 0 : -errno;
>  }
> --
> 2.37.3
> 
> 
> On Thu, Aug 18, 2022 at 5:12 PM Peter Maydell <peter.maydell@linaro.org>
> 
> wrote:
> > On Thu, 18 Aug 2022 at 15:07, Christian Schoenebeck
> > 
> > <qemu_oss@crudebyte.com> wrote:
> > > On Mittwoch, 17. August 2022 17:55:24 CEST Peter Maydell wrote:
> > > > On Wed, 17 Aug 2022 at 15:49, Nikita Ivanov <nivanov@cloudlinux.com>
> > 
> > wrote:
> > > > > Well...
> > > > > 
> > > > > What exactly is still under discussion? In my perspective, the main
> > > > > pitfalls have been resolved:
> > > > > 
> > > > > 0. All possible places where TFR() macro could be applied are
> > 
> > covered.
> > 
> > > > > 1. Macro has been renamed in order to be more transparent. The name
> > 
> > has
> > 
> > > > > been chosen in comparison with a similar glibc macro. 2. The macro
> > 
> > itself
> > 
> > > > > has been refactored, in order to replace it entirely with glibc
> > > > > alternative. 3. Problems with statement/expressions differences in
> > 
> > qemu
> > 
> > > > > and glibc implementation have been resolved.
> > > > > 
> > > > > Is there any room for improvement?
> > > > 
> > > > (a) do we want the statement version or the expression version?
> > > 
> > > I think the tendency was in favour for the expression version? Markus
> > 
> > made it
> > 
> > > clear that the glibc version indeed may evaluate as an expression (GCC
> > > extension).
> > 
> > Sounds good to me.
> > 
> > > > (b) do we want "use the glibc one, with same-semantics version for
> > > > compatibility", or do we want "we have our own thing"?
> > > > 
> > > > I would have voted for following glibc, except that it does
> > > > that cast-to-long thing, which is incorrect behaviour when
> > > > long is 32 bits and the return value from the function being
> > > > tested is 64 bits.
> > > 
> > > Then simply int64_t as a type instead, and as "our own thing"?
> > 
> > I think this is probably what I would go for, except that we
> > should use typeof() rather than a specific type.
> > 
> > Then we get to bikeshed the macro name again :-)
> > 
> > -- PMM
> 
> --
> Best Regards,
> *Nikita Ivanov* | C developer
> *Telephone:* +79140870696
> *Telephone:* +79015053149




