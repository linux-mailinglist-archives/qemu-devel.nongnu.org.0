Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDDF58AA0D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 13:21:28 +0200 (CEST)
Received: from localhost ([::1]:54610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJvOO-0007Z1-SG
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 07:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oJvEL-0007bT-0s
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:11:01 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:46947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oJvEI-0000SQ-Hr
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:11:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=OU4wLNvhfLpUe70n5z7wa6dVh8FqumaG5rhurA4pJWk=; b=QTRTWyFNHdCHqS7nbHazJc5CoW
 7dA3QCbxx9UrkbWuyEmk1NH9q1jZCb90MonisWyP5H6SHMunANa9InyNteoZcKW/qJhtFWPeubwol
 0s5rSRC5hMTEBYsfd1xeT5j8vzkBptJ6a0/enAqdUZz7D6G11Pl/rMlGxRWnAsIWDrnnHbynJ0R4r
 /Ppp6aozZlkcW3YosaPXXlf9pcy7vN/UhslKBzQowQCiHXf2RWG2GN5C0MGokgKy5MugilfthADIq
 D1/t+UDQf2M8ZW9WG3vCzf4y5cjWR2sY2+m3duv4D1e4/eirgpM8dtsgU4cRRVsF+Mcj7n5wMkyi1
 8Mxxm99lIrVsRfSoW+J/+lq2qG7fxVBeOCzR01nnhtqk/Zasrgm+LWUhl/zbxSpDL0SdjCh3hgDBY
 8DNWqcdv5dOtArwEQRq/p8m066r1DsD/dcWsHMy+aM7hz1QD50saLGfvKsq0t5ho4KZjs/imK/N0W
 jmmpSmbvIGpUE/bc0glfOug5tjTIj4OcD/kva58UPnjY9cESE4ovH9msZG11A5DjbZ1lzEMrYZcVG
 1Ur0QYsa7US5Bxp0Ka/cgWH6jB8zap/AEvWTpNBlOYzKDfnoRl/UcpDcansVOksvSMInym6aB9ZmU
 DqVEOHluRJchT256uFQCgm8lHPjyjawg7y49Cbj9o=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Nikita Ivanov <nivanov@cloudlinux.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Nikita Ivanov <nivanov@cloudlinux.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH] error handling: Use TFR() macro where applicable
Date: Fri, 05 Aug 2022 13:10:53 +0200
Message-ID: <4561100.0A2huPDW8y@silver>
In-Reply-To: <CAAJ4Ao9crXap1OYiutSgG5caZHzVkM=WvQYpVD2XN1M8JsD3cQ@mail.gmail.com>
References: <CAAJ4Ao9crXap1OYiutSgG5caZHzVkM=WvQYpVD2XN1M8JsD3cQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Donnerstag, 4. August 2022 09:25:17 CEST Nikita Ivanov wrote:
> From 0ceb04ada1ed5a863914f4449469d7572d3443ed Mon Sep 17 00:00:00 2001
> From: Nikita Ivanov <nivanov@cloudlinux.com>
> Date: Wed, 3 Aug 2022 12:54:00 +0300
> Subject: [PATCH] error handling: Use TFR() macro where applicable
>=20
> There is a defined TFR() macro in qemu/osdep.h which
> handles the same while loop.
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/415
>=20
> Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
> ---
>  hw/9pfs/9p-local.c   |  8 ++------
>  net/l2tpv3.c         | 15 +++------------
>  net/tap.c            |  8 ++------
>  qga/commands-posix.c |  4 +---
>  util/main-loop.c     |  4 +---
>  util/osdep.c         |  4 +---
>  6 files changed, 10 insertions(+), 33 deletions(-)

I was thinking the same as Marc-Andr=E9 before:

commit 1dacd88ddcf33eb6ed044c4080e3ef5e3de4b6b6
Author: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
Date:   Wed Mar 23 19:57:27 2022 +0400

    include: move TFR to osdep.h
   =20
    The macro requires EINTR, which has its header included in osdep.h.
   =20
    (Not sure what TFR stands for, perhaps "Test For Retry". Rename it ?)
   =20
    Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
    Message-Id: <20220323155743.1585078-17-marcandre.lureau@redhat.com>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Wouldn't it make sense to first rename TFR() to something like=20
RETRY_ON_EINTR() and then doing this consolidation here on top?

Best regards,
Christian Schoenebeck

> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index d42ce6d8b8..c90ab947ba 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -470,9 +470,7 @@ static ssize_t local_readlink(FsContext *fs_ctx,
> V9fsPath *fs_path,
>          if (fd =3D=3D -1) {
>              return -1;
>          }
> -        do {
> -            tsize =3D read(fd, (void *)buf, bufsz);
> -        } while (tsize =3D=3D -1 && errno =3D=3D EINTR);
> +        TFR(tsize =3D read(fd, (void *)buf, bufsz));
>          close_preserve_errno(fd);
>      } else if ((fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
>                 (fs_ctx->export_flags & V9FS_SM_NONE)) {
> @@ -908,9 +906,7 @@ static int local_symlink(FsContext *fs_ctx, const char
> *oldpath,
>          }
>          /* Write the oldpath (target) to the file. */
>          oldpath_size =3D strlen(oldpath);
> -        do {
> -            write_size =3D write(fd, (void *)oldpath, oldpath_size);
> -        } while (write_size =3D=3D -1 && errno =3D=3D EINTR);
> +        TFR(write_size =3D write(fd, (void *)oldpath, oldpath_size));
>          close_preserve_errno(fd);
>=20
>          if (write_size !=3D oldpath_size) {
> diff --git a/net/l2tpv3.c b/net/l2tpv3.c
> index af373e5c30..adfdbdb84c 100644
> --- a/net/l2tpv3.c
> +++ b/net/l2tpv3.c
> @@ -240,9 +240,7 @@ static ssize_t
> net_l2tpv3_receive_dgram_iov(NetClientState *nc,
>      message.msg_control =3D NULL;
>      message.msg_controllen =3D 0;
>      message.msg_flags =3D 0;
> -    do {
> -        ret =3D sendmsg(s->fd, &message, 0);
> -    } while ((ret =3D=3D -1) && (errno =3D=3D EINTR));
> +    TFR(ret =3D sendmsg(s->fd, &message, 0));
>      if (ret > 0) {
>          ret -=3D s->offset;
>      } else if (ret =3D=3D 0) {
> @@ -285,9 +283,7 @@ static ssize_t net_l2tpv3_receive_dgram(NetClientState
> *nc,
>      message.msg_control =3D NULL;
>      message.msg_controllen =3D 0;
>      message.msg_flags =3D 0;
> -    do {
> -        ret =3D sendmsg(s->fd, &message, 0);
> -    } while ((ret =3D=3D -1) && (errno =3D=3D EINTR));
> +    TFR(ret =3D sendmsg(s->fd, &message, 0));
>      if (ret > 0) {
>          ret -=3D s->offset;
>      } else if (ret =3D=3D 0) {
> @@ -434,12 +430,7 @@ static void net_l2tpv3_send(void *opaque)
>=20
>      msgvec =3D s->msgvec + s->queue_head;
>      if (target_count > 0) {
> -        do {
> -            count =3D recvmmsg(
> -                s->fd,
> -                msgvec,
> -                target_count, MSG_DONTWAIT, NULL);
> -        } while ((count =3D=3D -1) && (errno =3D=3D EINTR));
> +        TFR(count =3D recvmmsg(s->fd, msgvec, target_count, MSG_DONTWAIT,
> NULL));
>          if (count < 0) {
>              /* Recv error - we still need to flush packets here,
>               * (re)set queue head to current position
> diff --git a/net/tap.c b/net/tap.c
> index b3ddfd4a74..b047eca8b5 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -102,9 +102,7 @@ static ssize_t tap_write_packet(TAPState *s, const
> struct iovec *iov, int iovcnt
>  {
>      ssize_t len;
>=20
> -    do {
> -        len =3D writev(s->fd, iov, iovcnt);
> -    } while (len =3D=3D -1 && errno =3D=3D EINTR);
> +    TFR(len =3D writev(s->fd, iov, iovcnt));
>=20
>      if (len =3D=3D -1 && errno =3D=3D EAGAIN) {
>          tap_write_poll(s, true);
> @@ -577,9 +575,7 @@ static int net_bridge_run_helper(const char *helper,
> const char *bridge,
>=20
>          close(sv[1]);
>=20
> -        do {
> -            fd =3D recv_fd(sv[0]);
> -        } while (fd =3D=3D -1 && errno =3D=3D EINTR);
> +        TFR(fd =3D recv_fd(sv[0]));
>          saved_errno =3D errno;
>=20
>          close(sv[0]);
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 954efed01b..90f83aa9b6 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -68,9 +68,7 @@ static void ga_wait_child(pid_t pid, int *status, Error
> **errp)
>=20
>      *status =3D 0;
>=20
> -    do {
> -        rpid =3D waitpid(pid, status, 0);
> -    } while (rpid =3D=3D -1 && errno =3D=3D EINTR);
> +    TFR(rpid =3D waitpid(pid, status, 0));
>=20
>      if (rpid =3D=3D -1) {
>          error_setg_errno(errp, errno, "failed to wait for child (pid: %d=
)",
> diff --git a/util/main-loop.c b/util/main-loop.c
> index f00a25451b..58e14db2d4 100644
> --- a/util/main-loop.c
> +++ b/util/main-loop.c
> @@ -64,9 +64,7 @@ static void sigfd_handler(void *opaque)
>      ssize_t len;
>=20
>      while (1) {
> -        do {
> -            len =3D read(fd, &info, sizeof(info));
> -        } while (len =3D=3D -1 && errno =3D=3D EINTR);
> +        TFR(len =3D read(fd, &info, sizeof(info)));
>=20
>          if (len =3D=3D -1 && errno =3D=3D EAGAIN) {
>              break;
> diff --git a/util/osdep.c b/util/osdep.c
> index 60fcbbaebe..d35c473ac7 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -244,9 +244,7 @@ static int qemu_lock_fcntl(int fd, int64_t start,
> int64_t len, int fl_type)
>          .l_type   =3D fl_type,
>      };
>      qemu_probe_lock_ops();
> -    do {
> -        ret =3D fcntl(fd, fcntl_op_setlk, &fl);
> -    } while (ret =3D=3D -1 && errno =3D=3D EINTR);
> +    TFR(ret =3D fcntl(fd, fcntl_op_setlk, &fl));
>      return ret =3D=3D -1 ? -errno : 0;
>  }



