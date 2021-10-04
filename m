Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702DC42121E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 16:57:03 +0200 (CEST)
Received: from localhost ([::1]:39822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXPOo-00020B-Ed
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 10:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXPMg-0000bN-57
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:54:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXPMe-0005wD-Du
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633359287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gXCadVxY5s3oUF7aLJbkP2tSSY3h2TvKcXoHow6YzXo=;
 b=bFSWP6h5x4q0qHxfWQ6hbR2N5BXZ4vm26kX4Vo1ICU1oQVu5Ub7vEhQCxRFgV05BKGmvNk
 Rh8+od412cLjsh3v8vhCK2jZ7jNRMFChS8+un+qnOOPMDxn5UU62Sq+WePfrUV5z8SD7zx
 20qkmbsCKC9Nqzmd7u+0VSPf6EfLXKc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-ENvexLuJO8ytwxn64WJG8w-1; Mon, 04 Oct 2021 10:54:46 -0400
X-MC-Unique: ENvexLuJO8ytwxn64WJG8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 709F8DF8AD;
 Mon,  4 Oct 2021 14:54:45 +0000 (UTC)
Received: from localhost (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05CB460843;
 Mon,  4 Oct 2021 14:54:32 +0000 (UTC)
Date: Mon, 4 Oct 2021 15:54:31 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 10/13] virtiofsd: Custom threadpool for remote blocking
 posix locks requests
Message-ID: <YVsVp4rPILhz+/Eh@stefanha-x1.localdomain>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-11-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930153037.1194279-11-vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Z+FomQ254OgZIFhd"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: miklos@szeredi.hu, qemu-devel@nongnu.org, iangelak@redhat.com,
 dgilbert@redhat.com, virtio-fs@redhat.com, jaggel@bu.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Z+FomQ254OgZIFhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 11:30:34AM -0400, Vivek Goyal wrote:
> Add a new custom threadpool using posix threads that specifically
> service locking requests.
>=20
> In the case of a fcntl(SETLKW) request, if the guest is waiting
> for a lock or locks and issues a hard-reboot through SYSRQ then virtiofsd
> unblocks the blocked threads by sending a signal to them and waking
> them up.
>=20
> The current threadpool (GThreadPool) is not adequate to service the
> locking requests that result in a thread blocking. That is because
> GLib does not provide an API to cancel the request while it is
> serviced by a thread. In addition, a user might be running virtiofsd
> without a threadpool (--thread-pool-size=3D0), thus a locking request
> that blocks, will block the main virtqueue thread that services requests
> from servicing any other requests.
>=20
> The only exception occurs when the lock is of type F_UNLCK. In this case
> the request is serviced by the main virtqueue thread or a GThreadPool
> thread to avoid a deadlock, when all the threads in the custom threadpool
> are blocked.
>=20
> Then virtiofsd proceeds to cleanup the state of the threads, release
> them back to the system and re-initialize.

Is there another way to cancel SETLKW without resorting to a new thread
pool? Since this only matters when shutting down or restarting, can we
close all plock->fd file descriptors to kick the GThreadPool workers out
of fnctl()?

>=20
> Signed-off-by: Ioannis Angelakopoulos <iangelak@redhat.com>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  tools/virtiofsd/fuse_virtio.c         |  90 ++++++-
>  tools/virtiofsd/meson.build           |   1 +
>  tools/virtiofsd/passthrough_seccomp.c |   1 +
>  tools/virtiofsd/tpool.c               | 331 ++++++++++++++++++++++++++
>  tools/virtiofsd/tpool.h               |  18 ++
>  5 files changed, 440 insertions(+), 1 deletion(-)
>  create mode 100644 tools/virtiofsd/tpool.c
>  create mode 100644 tools/virtiofsd/tpool.h
>=20
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.=
c
> index 3b720c5d4a..c67c2e0e7a 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -20,6 +20,7 @@
>  #include "fuse_misc.h"
>  #include "fuse_opt.h"
>  #include "fuse_virtio.h"
> +#include "tpool.h"
> =20
>  #include <sys/eventfd.h>
>  #include <sys/socket.h>
> @@ -612,6 +613,60 @@ out:
>      free(req);
>  }
> =20
> +/*
> + * If the request is a locking request, use a custom locking thread pool=
.
> + */
> +static bool use_lock_tpool(gpointer data, gpointer user_data)
> +{
> +    struct fv_QueueInfo *qi =3D user_data;
> +    struct fuse_session *se =3D qi->virtio_dev->se;
> +    FVRequest *req =3D data;
> +    VuVirtqElement *elem =3D &req->elem;
> +    struct fuse_buf fbuf =3D {};
> +    struct fuse_in_header *inhp;
> +    struct fuse_lk_in *lkinp;
> +    size_t lk_req_len;
> +    /* The 'out' part of the elem is from qemu */
> +    unsigned int out_num =3D elem->out_num;
> +    struct iovec *out_sg =3D elem->out_sg;
> +    size_t out_len =3D iov_size(out_sg, out_num);
> +    bool use_custom_tpool =3D false;
> +
> +    /*
> +     * If notifications are not enabled, no point in using cusotm lock
> +     * thread pool.
> +     */
> +    if (!se->notify_enabled) {
> +        return false;
> +    }
> +
> +    assert(se->bufsize > sizeof(struct fuse_in_header));
> +    lk_req_len =3D sizeof(struct fuse_in_header) + sizeof(struct fuse_lk=
_in);
> +
> +    if (out_len < lk_req_len) {
> +        return false;
> +    }
> +
> +    fbuf.mem =3D g_malloc(se->bufsize);
> +    copy_from_iov(&fbuf, out_num, out_sg, lk_req_len);

This looks inefficient: for every FUSE request we now malloc se->bufsize
and then copy lk_req_len bytes, only to free the memory again.

Is it possible to keep lk_req_len bytes on the stack instead?

--Z+FomQ254OgZIFhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFbFacACgkQnKSrs4Gr
c8gBBgf/SjkAY3cbcX+VAOrCSPviGcgx7hxVc6MFQDC3AqygPX/X/MAHncPoXxYq
ug/wH6P/4ls/Fzf06KX0EwaWKlTr9+HdGA1nYbGXmxEJ5BsYhPcj/ipGuiGDEcap
BKVxyD/Qtd1sCaqYR0P3AGua22wYIhrD3O9RUINrDoL9MdWB5aIhThnabQ2/6NFO
S6UL3EaknNQAT8mpdgTcnWPVqrCcNWHCjdfxPO8QL/6Be5LAYJzLKWJkX6AIEnv1
JEM/T3jT2GijYHPBBMLl3qV3CCARdOBkM+OFf7xWr5YlD003n5rSUovuTRV7mcBf
LrhCsPN3vd5wpuz949rAlc5zH7x8qg==
=2V8P
-----END PGP SIGNATURE-----

--Z+FomQ254OgZIFhd--


