Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49AD422685
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 14:29:19 +0200 (CEST)
Received: from localhost ([::1]:54270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXjZO-0005mT-T4
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 08:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXjT9-0007xQ-Ov
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 08:22:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXjT4-0007Xl-5W
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 08:22:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633436562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EZm0xh+ZCXxTMFgX9uWqrwY0Wf1ZFm5WJRWYzqbiKHs=;
 b=b/4PWWNVN4QEtZW6QDMfWL5IR0xKpgEVH+b2OL4twp1Y6Bnu9C1o05TiQJgYvKPdIWYwOv
 Td4hjki++OB21aYL/18LP3SqgTuCNnJF8AWyxf6n61RVLZG6Kq0C/r+2BdnIybq0H7biOY
 8uOM8XiSrM5gGiikuCYkGdEWPALfCMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-Awdzvr76N6Khf_iyLyNquQ-1; Tue, 05 Oct 2021 08:22:38 -0400
X-MC-Unique: Awdzvr76N6Khf_iyLyNquQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 553D3101F002;
 Tue,  5 Oct 2021 12:22:37 +0000 (UTC)
Received: from localhost (unknown [10.39.194.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 388F11F43A;
 Tue,  5 Oct 2021 12:22:23 +0000 (UTC)
Date: Tue, 5 Oct 2021 13:22:21 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 12/13] virtiofsd: Implement blocking posix locks
Message-ID: <YVxDferEMGA3cE8D@stefanha-x1.localdomain>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-13-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930153037.1194279-13-vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="y5SXQIPZT7IR+UMP"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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

--y5SXQIPZT7IR+UMP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 11:30:36AM -0400, Vivek Goyal wrote:
> As of now we don't support fcntl(F_SETLKW) and if we see one, we return
> -EOPNOTSUPP.
>=20
> Change that by accepting these requests and returning a reply
> immediately asking caller to wait. Once lock is available, send a
> notification to the waiter indicating lock is available.
>=20
> In response to lock request, we are returning error value as "1", which
> signals to client to queue the lock request internally and later client
> will get a notification which will signal lock is taken (or error). And
> then fuse client should wake up the guest process.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> Signed-off-by: Ioannis Angelakopoulos <iangelak@redhat.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.c  | 37 ++++++++++++++++-
>  tools/virtiofsd/fuse_lowlevel.h  | 26 ++++++++++++
>  tools/virtiofsd/fuse_virtio.c    | 50 ++++++++++++++++++++---
>  tools/virtiofsd/passthrough_ll.c | 70 ++++++++++++++++++++++++++++----
>  4 files changed, 167 insertions(+), 16 deletions(-)
>=20
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowle=
vel.c
> index e4679c73ab..2e7f4b786d 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -179,8 +179,8 @@ int fuse_send_reply_iov_nofree(fuse_req_t req, int er=
ror, struct iovec *iov,
>          .unique =3D req->unique,
>          .error =3D error,
>      };
> -
> -    if (error <=3D -1000 || error > 0) {
> +    /* error =3D 1 has been used to signal client to wait for notificait=
on */
> +    if (error <=3D -1000 || error > 1) {
>          fuse_log(FUSE_LOG_ERR, "fuse: bad error value: %i\n", error);
>          out.error =3D -ERANGE;
>      }
> @@ -290,6 +290,11 @@ int fuse_reply_err(fuse_req_t req, int err)
>      return send_reply(req, -err, NULL, 0);
>  }
> =20
> +int fuse_reply_wait(fuse_req_t req)
> +{
> +    return send_reply(req, 1, NULL, 0);
> +}
> +
>  void fuse_reply_none(fuse_req_t req)
>  {
>      fuse_free_req(req);
> @@ -2165,6 +2170,34 @@ static void do_destroy(fuse_req_t req, fuse_ino_t =
nodeid,
>      send_reply_ok(req, NULL, 0);
>  }
> =20
> +static int send_notify_iov(struct fuse_session *se, int notify_code,
> +                           struct iovec *iov, int count)
> +{
> +    struct fuse_out_header out;
> +    if (!se->got_init) {
> +        return -ENOTCONN;
> +    }
> +    out.unique =3D 0;
> +    out.error =3D notify_code;
> +    iov[0].iov_base =3D &out;
> +    iov[0].iov_len =3D sizeof(struct fuse_out_header);
> +    return fuse_send_msg(se, NULL, iov, count);
> +}
> +
> +int fuse_lowlevel_notify_lock(struct fuse_session *se, uint64_t unique,
> +                  int32_t error)
> +{
> +    struct fuse_notify_lock_out outarg =3D {0};
> +    struct iovec iov[2];
> +
> +    outarg.unique =3D unique;
> +    outarg.error =3D -error;
> +
> +    iov[1].iov_base =3D &outarg;
> +    iov[1].iov_len =3D sizeof(outarg);
> +    return send_notify_iov(se, FUSE_NOTIFY_LOCK, iov, 2);
> +}
> +
>  int fuse_lowlevel_notify_store(struct fuse_session *se, fuse_ino_t ino,
>                                 off_t offset, struct fuse_bufvec *bufv)
>  {
> diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowle=
vel.h
> index c55c0ca2fc..64624b48dc 100644
> --- a/tools/virtiofsd/fuse_lowlevel.h
> +++ b/tools/virtiofsd/fuse_lowlevel.h
> @@ -1251,6 +1251,22 @@ struct fuse_lowlevel_ops {
>   */
>  int fuse_reply_err(fuse_req_t req, int err);
> =20
> +/**
> + * Ask caller to wait for lock.
> + *
> + * Possible requests:
> + *   setlkw
> + *
> + * If caller sends a blocking lock request (setlkw), then reply to calle=
r
> + * that wait for lock to be available. Once lock is available caller wil=
l

I can't parse the first sentence.

s/that wait for lock to be available/that waiting for the lock is
necessary/?

> + * receive a notification with request's unique id. Notification will
> + * carry info whether lock was successfully obtained or not.
> + *
> + * @param req request handle
> + * @return zero for success, -errno for failure to send reply
> + */
> +int fuse_reply_wait(fuse_req_t req);
> +
>  /**
>   * Don't send reply
>   *
> @@ -1685,6 +1701,16 @@ int fuse_lowlevel_notify_delete(struct fuse_sessio=
n *se, fuse_ino_t parent,
>  int fuse_lowlevel_notify_store(struct fuse_session *se, fuse_ino_t ino,
>                                 off_t offset, struct fuse_bufvec *bufv);
> =20
> +/**
> + * Notify event related to previous lock request
> + *
> + * @param se the session object
> + * @param unique the unique id of the request which requested setlkw
> + * @param error zero for success, -errno for the failure
> + */
> +int fuse_lowlevel_notify_lock(struct fuse_session *se, uint64_t unique,
> +                              int32_t error);
> +
>  /*
>   * Utility functions
>   */
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.=
c
> index a87e88e286..bb2d4456fc 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -273,6 +273,23 @@ static void vq_send_element(struct fv_QueueInfo *qi,=
 VuVirtqElement *elem,
>      vu_dispatch_unlock(qi->virtio_dev);
>  }
> =20
> +/* Returns NULL if queue is empty */
> +static FVRequest *vq_pop_notify_elem(struct fv_QueueInfo *qi)
> +{
> +    struct fuse_session *se =3D qi->virtio_dev->se;
> +    VuDev *dev =3D &se->virtio_dev->dev;
> +    VuVirtq *q =3D vu_get_queue(dev, qi->qidx);
> +    FVRequest *req;
> +
> +    vu_dispatch_rdlock(qi->virtio_dev);
> +    pthread_mutex_lock(&qi->vq_lock);
> +    /* Pop an element from queue */
> +    req =3D vu_queue_pop(dev, q, sizeof(FVRequest));
> +    pthread_mutex_unlock(&qi->vq_lock);
> +    vu_dispatch_unlock(qi->virtio_dev);
> +    return req;
> +}
> +
>  /*
>   * Called back by ll whenever it wants to send a reply/message back
>   * The 1st element of the iov starts with the fuse_out_header
> @@ -281,9 +298,9 @@ static void vq_send_element(struct fv_QueueInfo *qi, =
VuVirtqElement *elem,
>  int virtio_send_msg(struct fuse_session *se, struct fuse_chan *ch,
>                      struct iovec *iov, int count)
>  {
> -    FVRequest *req =3D container_of(ch, FVRequest, ch);
> -    struct fv_QueueInfo *qi =3D ch->qi;
> -    VuVirtqElement *elem =3D &req->elem;
> +    FVRequest *req;
> +    struct fv_QueueInfo *qi;
> +    VuVirtqElement *elem;
>      int ret =3D 0;
> =20
>      assert(count >=3D 1);
> @@ -294,8 +311,30 @@ int virtio_send_msg(struct fuse_session *se, struct =
fuse_chan *ch,
> =20
>      size_t tosend_len =3D iov_size(iov, count);
> =20
> -    /* unique =3D=3D 0 is notification, which we don't support */
> -    assert(out->unique);
> +    /* unique =3D=3D 0 is notification */
> +    if (!out->unique) {

Is a check needed in fuse_session_process_buf_int() to reject requests
that the driver submitted to the device with req.unique =3D=3D 0? If we get
confused about the correct virtqueue to use in virtio_send_msg() then
there could be bugs.

> +        if (!se->notify_enabled) {
> +            return -EOPNOTSUPP;
> +        }
> +        /* If notifications are enabled, queue index 1 is notification q=
ueue */
> +        qi =3D se->virtio_dev->qi[1];
> +        req =3D vq_pop_notify_elem(qi);

Where is req freed?

> +        if (!req) {
> +            /*
> +             * TODO: Implement some sort of ring buffer and queue notifi=
cations
> +             * on that and send these later when notification queue has =
space
> +             * available.
> +             */
> +            return -ENOSPC;

This needs to be addressed before this patch series can be merged. The
notification vq is kicked by the guest driver when buffers are
replenished. The vq handler function can wake up waiting threads using a
condvar.

> +        }
> +        req->reply_sent =3D false;
> +    } else {
> +        assert(ch);
> +        req =3D container_of(ch, FVRequest, ch);
> +        qi =3D ch->qi;
> +    }
> +
> +    elem =3D &req->elem;
>      assert(!req->reply_sent);
> =20
>      /* The 'in' part of the elem is to qemu */
> @@ -985,6 +1024,7 @@ static int fv_get_config(VuDev *dev, uint8_t *config=
, uint32_t len)
>          struct fuse_notify_delete_out       delete_out;
>          struct fuse_notify_store_out        store_out;
>          struct fuse_notify_retrieve_out     retrieve_out;
> +        struct fuse_notify_lock_out         lock_out;
>      };
> =20
>      notify_size =3D sizeof(struct fuse_out_header) +
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrou=
gh_ll.c
> index 6928662e22..277f74762b 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -2131,13 +2131,35 @@ out:
>      }
>  }
> =20
> +static void setlk_send_notification(struct fuse_session *se, uint64_t un=
ique,
> +                                    int saverr)
> +{
> +    int ret;
> +
> +    do {
> +        ret =3D fuse_lowlevel_notify_lock(se, unique, saverr);
> +        /*
> +         * Retry sending notification if notification queue does not hav=
e
> +         * free descriptor yet, otherwise break out of loop. Either we
> +         * successfully sent notifiation or some other error occurred.
> +         */
> +        if (ret !=3D -ENOSPC) {
> +            break;
> +        }
> +        usleep(10000);
> +    } while (1);

Please use the notification vq handler to wake up blocked threads
instead of usleep().

> +}
> +
>  static void lo_setlk(fuse_req_t req, fuse_ino_t ino, struct fuse_file_in=
fo *fi,
>                       struct flock *lock, int sleep)
>  {
>      struct lo_data *lo =3D lo_data(req);
>      struct lo_inode *inode;
>      struct lo_inode_plock *plock;
> -    int ret, saverr =3D 0;
> +    int ret, saverr =3D 0, ofd;
> +    uint64_t unique;
> +    struct fuse_session *se =3D req->se;
> +    bool blocking_lock =3D false;
> =20
>      fuse_log(FUSE_LOG_DEBUG,
>               "lo_setlk(ino=3D%" PRIu64 ", flags=3D%d)"
> @@ -2151,11 +2173,6 @@ static void lo_setlk(fuse_req_t req, fuse_ino_t in=
o, struct fuse_file_info *fi,
>          return;
>      }
> =20
> -    if (sleep) {
> -        fuse_reply_err(req, EOPNOTSUPP);
> -        return;
> -    }
> -
>      inode =3D lo_inode(req, ino);
>      if (!inode) {
>          fuse_reply_err(req, EBADF);
> @@ -2168,21 +2185,56 @@ static void lo_setlk(fuse_req_t req, fuse_ino_t i=
no, struct fuse_file_info *fi,
> =20
>      if (!plock) {
>          saverr =3D ret;
> +        pthread_mutex_unlock(&inode->plock_mutex);
>          goto out;
>      }
> =20
> +    /*
> +     * plock is now released when inode is going away. We already have
> +     * a reference on inode, so it is guaranteed that plock->fd is
> +     * still around even after dropping inode->plock_mutex lock
> +     */
> +    ofd =3D plock->fd;
> +    pthread_mutex_unlock(&inode->plock_mutex);
> +
> +    /*
> +     * If this lock request can block, request caller to wait for
> +     * notification. Do not access req after this. Once lock is
> +     * available, send a notification instead.
> +     */
> +    if (sleep && lock->l_type !=3D F_UNLCK) {
> +        /*
> +         * If notification queue is not enabled, can't support async
> +         * locks.
> +         */
> +        if (!se->notify_enabled) {
> +            saverr =3D EOPNOTSUPP;
> +            goto out;
> +        }
> +        blocking_lock =3D true;
> +        unique =3D req->unique;
> +        fuse_reply_wait(req);
> +    }
> +
>      /* TODO: Is it alright to modify flock? */
>      lock->l_pid =3D 0;
> -    ret =3D fcntl(plock->fd, F_OFD_SETLK, lock);
> +    if (blocking_lock) {
> +        ret =3D fcntl(ofd, F_OFD_SETLKW, lock);

SETLKW can be interrupted by signals. Should we loop here when errno =3D=3D
EINTR?

> +    } else {
> +        ret =3D fcntl(ofd, F_OFD_SETLK, lock);
> +    }
>      if (ret =3D=3D -1) {
>          saverr =3D errno;
>      }
> =20
>  out:
> -    pthread_mutex_unlock(&inode->plock_mutex);
>      lo_inode_put(lo, &inode);
> =20
> -    fuse_reply_err(req, saverr);
> +    if (!blocking_lock) {
> +        fuse_reply_err(req, saverr);
> +    } else {
> +        setlk_send_notification(se, unique, saverr);
> +    }
>  }
> =20
>  static void lo_fsyncdir(fuse_req_t req, fuse_ino_t ino, int datasync,
> --=20
> 2.31.1
>=20

--y5SXQIPZT7IR+UMP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFcQ30ACgkQnKSrs4Gr
c8iF7Qf/fa9P3ZisrNYXJx53zGXXDf5hdVx88MB4FxHjcEC/NPERQoTr8w+NcXPs
/JX6eX962WaEFXYjVCbsp2Sm3Dclt9rtL0nA+GlTX/qGCjGB4hPKW8DF+WQwuXhI
0+V0MwwHJyFyjBN1rPQdnbS8QXMt7nDx5WAnR/x1UOtRTHUx6ASpFau4Es9+RPhu
HU7aJA1zDW5ZagFHLIYAHac7Q85PUNt6l8jue0cYXu1mKNvA5DDPvne+itSShJem
1UcJ9+n6dNDPCTuAs5lr/n559ASK55LB7d3M1dNIVzD4SW0LEgi5qADD22xlxwcW
BGDrGZdvI+2CijUlc1gZR6nwc3P5qQ==
=yk+4
-----END PGP SIGNATURE-----

--y5SXQIPZT7IR+UMP--


