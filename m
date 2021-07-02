Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070C73B9F67
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:59:40 +0200 (CEST)
Received: from localhost ([::1]:47428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGtX-0003OK-2M
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzGs1-0001VN-17; Fri, 02 Jul 2021 06:58:05 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:38728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzGry-0003Hx-Cr; Fri, 02 Jul 2021 06:58:04 -0400
Received: by mail-io1-xd30.google.com with SMTP id k11so11132262ioa.5;
 Fri, 02 Jul 2021 03:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fntkzexnp2ZJRcId7+i7BP5uGB7tphg6HD79qTx1ftk=;
 b=rGIVd+ZNG92ikZOgsf32UPvUFVFskBvoQyMZTUVzp/JXaGI9rjdU1/VABiTrK1q92Q
 Y8/WQ2dv98OIqaYvB8wOmuzwdpW5xqr2wBoRrzWx66GK3NEgRqQO03tuiMSL0Pq6LrFK
 +Y3APxZN9/WtMqaF56pp3D/bnr+v11jYfK5Zc/L4jYOIb0AHDn7f6Gk0C1H7s0AQ2vXL
 gwPmyh/pLikI9Uyj3nx9lYlQ8jd4++1yPwp9sWLsqnY3nxk5TkKBv8Tlbtq763w6xtVR
 XnI7h37+aMmne0IPieXICJVZhJCXzwoFUagPQ62wCiqL4HBDXPyu9baxqy2eLX5vLSuT
 7swg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fntkzexnp2ZJRcId7+i7BP5uGB7tphg6HD79qTx1ftk=;
 b=H1fM0Zza8h1gAiirTAJpIfGkpSvdWxbtpu3x3AlT26N0KGi9xt6uDFVIGLlXOfSohy
 aKszw3oPFcXM0I+ZgAJ/EyhnSHuiGmsrYMKAjMD+E4KjCR6Vlf+pZuy0U7g2qvOkGdsD
 wOL6gfrEZOFzJX9Hzo1Eu8Aift8IPw3ieP7jDhhJNVV7iM75oFQ+3T3TrQC36bcXocrX
 /by/NpWmhcUiiHuBir80M1P2+5u1rMbEASgnuYQdTv6b9/NP5OtY4yWrhFb4bIUt/Btu
 A9xxoktTKhpGnGjurfn+SPaAOqONlBXcHXotig2xBYz84buNnYg+pwhcTQF7bCy69vri
 JaQg==
X-Gm-Message-State: AOAM531S/Q0ZBVfA/Rwf8z/6I1HlpZfd+5CfAnIrh2Mgr/emNDT/WMHn
 KK2iS0FpNg2ug74DR9Qok6gC1bnm0LT7F3Qyc0LPhVtJfVORWQ==
X-Google-Smtp-Source: ABdhPJxC6GhAVokhCiF+YiUbSh/9X4Pc2/tFAY6vj4rXoofMBvSFqPK6tYSFHWYOvYspp8gD5CiWISf3EZnj15MBDz4=
X-Received: by 2002:a05:6638:4114:: with SMTP id
 ay20mr3762833jab.10.1625223480469; 
 Fri, 02 Jul 2021 03:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210702090935.15300-1-pl@kamp.de>
 <20210702090935.15300-5-pl@kamp.de>
In-Reply-To: <20210702090935.15300-5-pl@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Fri, 2 Jul 2021 12:57:39 +0200
Message-ID: <CAOi1vP8M4nXhU7L8sjNGz7bxh8r3Q63vG8-1LMKKFiT++rDVDA@mail.gmail.com>
Subject: Re: [PATCH V4 4/6] block/rbd: migrate from aio to coroutines
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=idryomov@gmail.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, ct@flyingcircus.io, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, mreitz@redhat.com,
 Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 2, 2021 at 11:09 AM Peter Lieven <pl@kamp.de> wrote:
>
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
>  block/rbd.c | 252 +++++++++++++++++++---------------------------------
>  1 file changed, 90 insertions(+), 162 deletions(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index 1f8dc84079..be0471944a 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -66,22 +66,6 @@ typedef enum {
>      RBD_AIO_FLUSH
>  } RBDAIOCmd;
>
> -typedef struct RBDAIOCB {
> -    BlockAIOCB common;
> -    int64_t ret;
> -    QEMUIOVector *qiov;
> -    RBDAIOCmd cmd;
> -    int error;
> -    struct BDRVRBDState *s;
> -} RBDAIOCB;
> -
> -typedef struct RADOSCB {
> -    RBDAIOCB *acb;
> -    struct BDRVRBDState *s;
> -    int64_t size;
> -    int64_t ret;
> -} RADOSCB;
> -
>  typedef struct BDRVRBDState {
>      rados_t cluster;
>      rados_ioctx_t io_ctx;
> @@ -93,6 +77,13 @@ typedef struct BDRVRBDState {
>      uint64_t object_size;
>  } BDRVRBDState;
>
> +typedef struct RBDTask {
> +    BlockDriverState *bs;
> +    Coroutine *co;
> +    bool complete;
> +    int64_t ret;
> +} RBDTask;
> +
>  static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
>                              BlockdevOptionsRbd *opts, bool cache,
>                              const char *keypairs, const char *secretid,
> @@ -325,13 +316,6 @@ static int qemu_rbd_set_keypairs(rados_t cluster, const char *keypairs_json,
>      return ret;
>  }
>
> -static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
> -{
> -    RBDAIOCB *acb = rcb->acb;
> -    iov_memset(acb->qiov->iov, acb->qiov->niov, offs, 0,
> -               acb->qiov->size - offs);
> -}
> -
>  /* FIXME Deprecate and remove keypairs or make it available in QMP. */
>  static int qemu_rbd_do_create(BlockdevCreateOptions *options,
>                                const char *keypairs, const char *password_secret,
> @@ -450,46 +434,6 @@ exit:
>      return ret;
>  }
>
> -/*
> - * This aio completion is being called from rbd_finish_bh() and runs in qemu
> - * BH context.
> - */
> -static void qemu_rbd_complete_aio(RADOSCB *rcb)
> -{
> -    RBDAIOCB *acb = rcb->acb;
> -    int64_t r;
> -
> -    r = rcb->ret;
> -
> -    if (acb->cmd != RBD_AIO_READ) {
> -        if (r < 0) {
> -            acb->ret = r;
> -            acb->error = 1;
> -        } else if (!acb->error) {
> -            acb->ret = rcb->size;
> -        }
> -    } else {
> -        if (r < 0) {
> -            qemu_rbd_memset(rcb, 0);
> -            acb->ret = r;
> -            acb->error = 1;
> -        } else if (r < rcb->size) {
> -            qemu_rbd_memset(rcb, r);
> -            if (!acb->error) {
> -                acb->ret = rcb->size;
> -            }
> -        } else if (!acb->error) {
> -            acb->ret = r;
> -        }
> -    }
> -
> -    g_free(rcb);
> -
> -    acb->common.cb(acb->common.opaque, (acb->ret > 0 ? 0 : acb->ret));
> -
> -    qemu_aio_unref(acb);
> -}
> -
>  static char *qemu_rbd_mon_host(BlockdevOptionsRbd *opts, Error **errp)
>  {
>      const char **vals;
> @@ -826,89 +770,59 @@ static int qemu_rbd_resize(BlockDriverState *bs, uint64_t size)
>      return 0;
>  }
>
> -static const AIOCBInfo rbd_aiocb_info = {
> -    .aiocb_size = sizeof(RBDAIOCB),
> -};
> -
> -static void rbd_finish_bh(void *opaque)
> +static void qemu_rbd_finish_bh(void *opaque)
>  {
> -    RADOSCB *rcb = opaque;
> -    qemu_rbd_complete_aio(rcb);
> +    RBDTask *task = opaque;
> +    task->complete = 1;
> +    aio_co_wake(task->co);
>  }
>
>  /*
> - * This is the callback function for rbd_aio_read and _write
> + * This is the completion callback function for all rbd aio calls
> + * started from qemu_rbd_start_co().
>   *
>   * Note: this function is being called from a non qemu thread so
>   * we need to be careful about what we do here. Generally we only
>   * schedule a BH, and do the rest of the io completion handling
> - * from rbd_finish_bh() which runs in a qemu context.
> + * from qemu_rbd_finish_bh() which runs in a qemu context.
>   */
> -static void rbd_finish_aiocb(rbd_completion_t c, RADOSCB *rcb)
> +static void qemu_rbd_completion_cb(rbd_completion_t c, RBDTask *task)
>  {
> -    RBDAIOCB *acb = rcb->acb;
> -
> -    rcb->ret = rbd_aio_get_return_value(c);
> +    task->ret = rbd_aio_get_return_value(c);
>      rbd_aio_release(c);
> -
> -    replay_bh_schedule_oneshot_event(bdrv_get_aio_context(acb->common.bs),
> -                                     rbd_finish_bh, rcb);
> +    aio_bh_schedule_oneshot(bdrv_get_aio_context(task->bs),
> +                            qemu_rbd_finish_bh, task);
>  }
>
> -static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
> -                                 int64_t off,
> -                                 QEMUIOVector *qiov,
> -                                 int64_t size,
> -                                 BlockCompletionFunc *cb,
> -                                 void *opaque,
> -                                 RBDAIOCmd cmd)
> +static int coroutine_fn qemu_rbd_start_co(BlockDriverState *bs,
> +                                          uint64_t offset,
> +                                          uint64_t bytes,
> +                                          QEMUIOVector *qiov,
> +                                          int flags,
> +                                          RBDAIOCmd cmd)
>  {
> -    RBDAIOCB *acb;
> -    RADOSCB *rcb = NULL;
> +    BDRVRBDState *s = bs->opaque;
> +    RBDTask task = { .bs = bs, .co = qemu_coroutine_self() };
>      rbd_completion_t c;
>      int r;
>
> -    BDRVRBDState *s = bs->opaque;
> -
> -    acb = qemu_aio_get(&rbd_aiocb_info, bs, cb, opaque);
> -    acb->cmd = cmd;
> -    acb->qiov = qiov;
> -    assert(!qiov || qiov->size == size);
> +    assert(!qiov || qiov->size == bytes);
>
> -    rcb = g_new(RADOSCB, 1);
> -
> -    acb->ret = 0;
> -    acb->error = 0;
> -    acb->s = s;
> -
> -    rcb->acb = acb;
> -    rcb->s = acb->s;
> -    rcb->size = size;
> -    r = rbd_aio_create_completion(rcb, (rbd_callback_t) rbd_finish_aiocb, &c);
> +    r = rbd_aio_create_completion(&task,
> +                                  (rbd_callback_t) qemu_rbd_completion_cb, &c);
>      if (r < 0) {
> -        goto failed;
> +        return r;
>      }
>
>      switch (cmd) {
> -    case RBD_AIO_WRITE:
> -        /*
> -         * RBD APIs don't allow us to write more than actual size, so in order
> -         * to support growing images, we resize the image before write
> -         * operations that exceed the current size.
> -         */
> -        if (off + size > s->image_size) {
> -            r = qemu_rbd_resize(bs, off + size);
> -            if (r < 0) {
> -                goto failed_completion;
> -            }
> -        }
> -        r = rbd_aio_writev(s->image, qiov->iov, qiov->niov, off, c);
> -        break;
>      case RBD_AIO_READ:
> -        r = rbd_aio_readv(s->image, qiov->iov, qiov->niov, off, c);
> +        r = rbd_aio_readv(s->image, qiov->iov, qiov->niov, offset, c);
> +        break;
> +    case RBD_AIO_WRITE:
> +        r = rbd_aio_writev(s->image, qiov->iov, qiov->niov, offset, c);
>          break;
>      case RBD_AIO_DISCARD:
> -        r = rbd_aio_discard(s->image, off, size, c);
> +        r = rbd_aio_discard(s->image, offset, bytes, c);
>          break;
>      case RBD_AIO_FLUSH:
>          r = rbd_aio_flush(s->image, c);
> @@ -918,44 +832,69 @@ static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
>      }
>
>      if (r < 0) {
> -        goto failed_completion;
> +        error_report("rbd request failed early: cmd %d offset %" PRIu64
> +                     " bytes %" PRIu64 " flags %d r %d (%s)", cmd, offset,
> +                     bytes, flags, r, strerror(-r));
> +        rbd_aio_release(c);
> +        return r;
>      }
> -    return &acb->common;
>
> -failed_completion:
> -    rbd_aio_release(c);
> -failed:
> -    g_free(rcb);
> +    while (!task.complete) {
> +        qemu_coroutine_yield();
> +    }
>
> -    qemu_aio_unref(acb);
> -    return NULL;
> +    if (task.ret < 0) {
> +        error_report("rbd request failed: cmd %d offset %" PRIu64 " bytes %"
> +                     PRIu64 " flags %d task.ret %" PRIi64 " (%s)", cmd, offset,
> +                     bytes, flags, task.ret, strerror(-task.ret));
> +        return task.ret;
> +    }
> +
> +    /* zero pad short reads */
> +    if (cmd == RBD_AIO_READ && task.ret < qiov->size) {
> +        qemu_iovec_memset(qiov, task.ret, 0, qiov->size - task.ret);
> +    }
> +
> +    return 0;
> +}
> +
> +static int
> +coroutine_fn qemu_rbd_co_preadv(BlockDriverState *bs, uint64_t offset,
> +                               uint64_t bytes, QEMUIOVector *qiov,
> +                               int flags)
> +{
> +    return qemu_rbd_start_co(bs, offset, bytes, qiov, flags, RBD_AIO_READ);
>  }
>
> -static BlockAIOCB *qemu_rbd_aio_preadv(BlockDriverState *bs,
> -                                       uint64_t offset, uint64_t bytes,
> -                                       QEMUIOVector *qiov, int flags,
> -                                       BlockCompletionFunc *cb,
> -                                       void *opaque)
> +static int
> +coroutine_fn qemu_rbd_co_pwritev(BlockDriverState *bs, uint64_t offset,
> +                                 uint64_t bytes, QEMUIOVector *qiov,
> +                                 int flags)
>  {
> -    return rbd_start_aio(bs, offset, qiov, bytes, cb, opaque,
> -                         RBD_AIO_READ);
> +    BDRVRBDState *s = bs->opaque;
> +    /*
> +     * RBD APIs don't allow us to write more than actual size, so in order
> +     * to support growing images, we resize the image before write
> +     * operations that exceed the current size.
> +     */
> +    if (offset + bytes > s->image_size) {
> +        int r = qemu_rbd_resize(bs, offset + bytes);
> +        if (r < 0) {
> +            return r;
> +        }
> +    }
> +    return qemu_rbd_start_co(bs, offset, bytes, qiov, flags, RBD_AIO_WRITE);
>  }
>
> -static BlockAIOCB *qemu_rbd_aio_pwritev(BlockDriverState *bs,
> -                                        uint64_t offset, uint64_t bytes,
> -                                        QEMUIOVector *qiov, int flags,
> -                                        BlockCompletionFunc *cb,
> -                                        void *opaque)
> +static int coroutine_fn qemu_rbd_co_flush(BlockDriverState *bs)
>  {
> -    return rbd_start_aio(bs, offset, qiov, bytes, cb, opaque,
> -                         RBD_AIO_WRITE);
> +    return qemu_rbd_start_co(bs, 0, 0, NULL, 0, RBD_AIO_FLUSH);
>  }
>
> -static BlockAIOCB *qemu_rbd_aio_flush(BlockDriverState *bs,
> -                                      BlockCompletionFunc *cb,
> -                                      void *opaque)
> +static int coroutine_fn qemu_rbd_co_pdiscard(BlockDriverState *bs,
> +                                             int64_t offset, int count)
>  {
> -    return rbd_start_aio(bs, 0, NULL, 0, cb, opaque, RBD_AIO_FLUSH);
> +    return qemu_rbd_start_co(bs, offset, count, NULL, 0, RBD_AIO_DISCARD);
>  }
>
>  static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
> @@ -1114,16 +1053,6 @@ static int qemu_rbd_snap_list(BlockDriverState *bs,
>      return snap_count;
>  }
>
> -static BlockAIOCB *qemu_rbd_aio_pdiscard(BlockDriverState *bs,
> -                                         int64_t offset,
> -                                         int bytes,
> -                                         BlockCompletionFunc *cb,
> -                                         void *opaque)
> -{
> -    return rbd_start_aio(bs, offset, NULL, bytes, cb, opaque,
> -                         RBD_AIO_DISCARD);
> -}
> -
>  static void coroutine_fn qemu_rbd_co_invalidate_cache(BlockDriverState *bs,
>                                                        Error **errp)
>  {
> @@ -1187,11 +1116,10 @@ static BlockDriver bdrv_rbd = {
>      .bdrv_co_truncate       = qemu_rbd_co_truncate,
>      .protocol_name          = "rbd",
>
> -    .bdrv_aio_preadv        = qemu_rbd_aio_preadv,
> -    .bdrv_aio_pwritev       = qemu_rbd_aio_pwritev,
> -
> -    .bdrv_aio_flush         = qemu_rbd_aio_flush,
> -    .bdrv_aio_pdiscard      = qemu_rbd_aio_pdiscard,
> +    .bdrv_co_preadv         = qemu_rbd_co_preadv,
> +    .bdrv_co_pwritev        = qemu_rbd_co_pwritev,
> +    .bdrv_co_flush_to_disk  = qemu_rbd_co_flush,
> +    .bdrv_co_pdiscard       = qemu_rbd_co_pdiscard,
>
>      .bdrv_snapshot_create   = qemu_rbd_snap_create,
>      .bdrv_snapshot_delete   = qemu_rbd_snap_remove,
> --
> 2.17.1
>
>

Reviewed-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya

