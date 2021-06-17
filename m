Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07763AB650
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 16:45:09 +0200 (CEST)
Received: from localhost ([::1]:36954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lttGW-0004j4-Nb
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 10:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lttFQ-0003Mu-UR; Thu, 17 Jun 2021 10:44:00 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:40902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lttFO-000839-GM; Thu, 17 Jun 2021 10:44:00 -0400
Received: by mail-io1-xd36.google.com with SMTP id l64so3411741ioa.7;
 Thu, 17 Jun 2021 07:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ewuTomUBUr19Rk3PwO7sU/iDuyZmWgWfGnuCd91AlJg=;
 b=N8V/hJHn12IAGnKoA9q2qMeHb5i7qzGhSnlFXjYaaTjT6heg9dczWZ2fkDeHk7vFf4
 PHWwhfAI8mTjyNTJU+y81F53d8RIkpvUUIdjKXc4KcGH6oBJF9nK65GQUmnsWKzBd7df
 hC7YnbyEgqqyJBEVzViOr7a3QS2+/3CS4dWtIjZEbn/3ofhJaPKrOHwzSwa7afX+rhWv
 vL5+Q+7bSYj0/JxEJuVd8W/VXcc3kqpj8Mwls0Y7d/yhD5Pmyex1cOWO32faHckCw15w
 TIDvqsL09UzmP6Jde7100wEPfDMLp6fCH/Q8o8wa9G/4Jpy8IrmY54tumk8nk8zFMoyG
 p8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ewuTomUBUr19Rk3PwO7sU/iDuyZmWgWfGnuCd91AlJg=;
 b=ZVWKx00upgfigbKk3NAMdBOyxnxfoCp5+YSjngtvmLpPgOHYAz22lQP4Ke+EuhEhJT
 ljql79uzEsJk6QlIIXsPmQ5nHHFU1kNG2uBqOOqDre5mcmeSjERBofRUa3KMUz/cxNkD
 4cbi0xIa5z19NX4lg7wmjzKcLjVzyB4tnai1q6D0rOyHK2PcjmHlH5MHsCgTFtaDHI80
 BjUy8aKukxGzD8SLIJz7y2ieXI7eyZU4IEOg4u5RFy7yUdN9ZO9kxpv8Ye93gVH/t2s7
 y0pWs/BfaRiamAHoOcygLZa7smJCkWhcwnRLY4jXJ3cLu10viqJ0p20XgmCiNDBAwCGz
 GuMw==
X-Gm-Message-State: AOAM532tvKej1wselBZFlvwybVVLSV+yncMLlJ8lTJ8BbxiMRUyGQv1m
 x4gKfpBlDhSTAqYh5CjAP9TXAFSDNkeL//lOfWE2qbLnctA8OA==
X-Google-Smtp-Source: ABdhPJxG0913898BkAklvukh3FXqT4wQgtxJzaLCdoJLx2L3UXGY7pTs715PXSpKpjOotcPvIwsV5bVcVXgoBnMWqvU=
X-Received: by 2002:a6b:8f83:: with SMTP id r125mr4104046iod.123.1623941035962; 
 Thu, 17 Jun 2021 07:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210519142359.23083-1-pl@kamp.de>
 <20210519142359.23083-5-pl@kamp.de>
In-Reply-To: <20210519142359.23083-5-pl@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Thu, 17 Jun 2021 16:43:47 +0200
Message-ID: <CAOi1vP8jYNyrPxOKm1MaJZS99OY4EkU=Jtj=9xV=uUzW30gnGw@mail.gmail.com>
Subject: Re: [PATCH V3 4/6] block/rbd: migrate from aio to coroutines
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=idryomov@gmail.com; helo=mail-io1-xd36.google.com
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, ct@flyingcircus.io, Paolo Bonzini <pbonzini@redhat.com>,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 4:27 PM Peter Lieven <pl@kamp.de> wrote:
>
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
>  block/rbd.c | 255 ++++++++++++++++++----------------------------------
>  1 file changed, 87 insertions(+), 168 deletions(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index 97a2ae4c84..0d8612a988 100644
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
> @@ -826,89 +770,50 @@ static int qemu_rbd_resize(BlockDriverState *bs, uint64_t size)
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
> -/*
> - * This is the callback function for rbd_aio_read and _write
> - *
> - * Note: this function is being called from a non qemu thread so
> - * we need to be careful about what we do here. Generally we only
> - * schedule a BH, and do the rest of the io completion handling
> - * from rbd_finish_bh() which runs in a qemu context.
> - */

I would adapt this comment instead of removing it.  I mean, it is
still true and the reason for going through aio_bh_schedule_oneshot()
instead of calling aio_co_wake() directly, right?

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
> +    assert(!qiov || qiov->size == bytes);
>
> -    acb = qemu_aio_get(&rbd_aiocb_info, bs, cb, opaque);
> -    acb->cmd = cmd;
> -    acb->qiov = qiov;
> -    assert(!qiov || qiov->size == size);
> -
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
> @@ -918,44 +823,69 @@ static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
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

I would use bytes instead of qiov->size here and on the previous
line.  In many systems the iovec can be larger than the op and it
took me a couple of minutes to spot the "qiov->size == bytes" assert.

Also, previously we zeroed the entire op on read errors.  I don't think
it matters but want to make sure this was dropped on purpose.

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

How can this be triggered today?  qemu-io used to be able to, but that
support was removed a long time ago:

    https://mail.gnu.org/archive/html/qemu-devel/2014-12/msg01592.html

Just checking that this piece of code is not vestigial at this point.

Thanks,

                Ilya

