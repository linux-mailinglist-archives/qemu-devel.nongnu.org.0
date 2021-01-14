Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F33B2F6B46
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:41:04 +0100 (CET)
Received: from localhost ([::1]:56610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08UR-00042J-Dc
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:41:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l08Sm-0002uN-7i
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:39:20 -0500
Received: from kerio.kamp.de ([195.62.97.192]:47281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l08Sh-0008JI-JG
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:39:19 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 20:39:06 +0100
Received: (qmail 22051 invoked from network); 14 Jan 2021 19:39:11 -0000
Received: from ac14.vpn.kamp-intra.net (HELO ?172.20.250.14?)
 (pl@kamp.de@::ffff:172.20.250.14)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES128-SHA encrypted) ESMTPA;
 14 Jan 2021 19:39:11 -0000
Subject: Re: [PATCH 5/7] block/rbd: migrate from aio to coroutines
To: dillaman@redhat.com
References: <20201227164236.10143-1-pl@kamp.de>
 <20201227164236.10143-6-pl@kamp.de>
 <CA+aFP1Ay2qkY8qdny=7AW_SUSqgK96qGGKnRB4gV_hh5s52TmQ@mail.gmail.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <d6e908c9-a779-fa75-eae4-f80e744f3bbc@kamp.de>
Date: Thu, 14 Jan 2021 20:39:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+aFP1Ay2qkY8qdny=7AW_SUSqgK96qGGKnRB4gV_hh5s52TmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.237,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Christian Theune <ct@flyingcircus.io>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.01.21 um 20:19 schrieb Jason Dillaman:
> On Sun, Dec 27, 2020 at 11:42 AM Peter Lieven <pl@kamp.de> wrote:
>> Signed-off-by: Peter Lieven <pl@kamp.de>
>> ---
>>  block/rbd.c | 247 ++++++++++++++++++----------------------------------
>>  1 file changed, 84 insertions(+), 163 deletions(-)
>>
>> diff --git a/block/rbd.c b/block/rbd.c
>> index 27b232f4d8..2d77d0007f 100644
>> --- a/block/rbd.c
>> +++ b/block/rbd.c
>> @@ -66,22 +66,6 @@ typedef enum {
>>      RBD_AIO_FLUSH
>>  } RBDAIOCmd;
>>
>> -typedef struct RBDAIOCB {
>> -    BlockAIOCB common;
>> -    int64_t ret;
>> -    QEMUIOVector *qiov;
>> -    RBDAIOCmd cmd;
>> -    int error;
>> -    struct BDRVRBDState *s;
>> -} RBDAIOCB;
>> -
>> -typedef struct RADOSCB {
>> -    RBDAIOCB *acb;
>> -    struct BDRVRBDState *s;
>> -    int64_t size;
>> -    int64_t ret;
>> -} RADOSCB;
>> -
>>  typedef struct BDRVRBDState {
>>      rados_t cluster;
>>      rados_ioctx_t io_ctx;
>> @@ -94,6 +78,13 @@ typedef struct BDRVRBDState {
>>      AioContext *aio_context;
>>  } BDRVRBDState;
>>
>> +typedef struct RBDTask {
>> +    BDRVRBDState *s;
>> +    Coroutine *co;
>> +    bool complete;
>> +    int64_t ret;
>> +} RBDTask;
>> +
>>  static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
>>                              BlockdevOptionsRbd *opts, bool cache,
>>                              const char *keypairs, const char *secretid,
>> @@ -316,13 +307,6 @@ static int qemu_rbd_set_keypairs(rados_t cluster, const char *keypairs_json,
>>      return ret;
>>  }
>>
>> -static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
>> -{
>> -    RBDAIOCB *acb = rcb->acb;
>> -    iov_memset(acb->qiov->iov, acb->qiov->niov, offs, 0,
>> -               acb->qiov->size - offs);
>> -}
>> -
>>  /* FIXME Deprecate and remove keypairs or make it available in QMP. */
>>  static int qemu_rbd_do_create(BlockdevCreateOptions *options,
>>                                const char *keypairs, const char *password_secret,
>> @@ -440,46 +424,6 @@ exit:
>>      return ret;
>>  }
>>
>> -/*
>> - * This aio completion is being called from rbd_finish_bh() and runs in qemu
>> - * BH context.
>> - */
>> -static void qemu_rbd_complete_aio(RADOSCB *rcb)
>> -{
>> -    RBDAIOCB *acb = rcb->acb;
>> -    int64_t r;
>> -
>> -    r = rcb->ret;
>> -
>> -    if (acb->cmd != RBD_AIO_READ) {
>> -        if (r < 0) {
>> -            acb->ret = r;
>> -            acb->error = 1;
>> -        } else if (!acb->error) {
>> -            acb->ret = rcb->size;
>> -        }
>> -    } else {
>> -        if (r < 0) {
>> -            qemu_rbd_memset(rcb, 0);
>> -            acb->ret = r;
>> -            acb->error = 1;
>> -        } else if (r < rcb->size) {
>> -            qemu_rbd_memset(rcb, r);
>> -            if (!acb->error) {
>> -                acb->ret = rcb->size;
>> -            }
>> -        } else if (!acb->error) {
>> -            acb->ret = r;
>> -        }
>> -    }
>> -
>> -    g_free(rcb);
>> -
>> -    acb->common.cb(acb->common.opaque, (acb->ret > 0 ? 0 : acb->ret));
>> -
>> -    qemu_aio_unref(acb);
>> -}
>> -
>>  static char *qemu_rbd_mon_host(BlockdevOptionsRbd *opts, Error **errp)
>>  {
>>      const char **vals;
>> @@ -817,88 +761,49 @@ static int qemu_rbd_resize(BlockDriverState *bs, uint64_t size)
>>      return 0;
>>  }
>>
>> -static const AIOCBInfo rbd_aiocb_info = {
>> -    .aiocb_size = sizeof(RBDAIOCB),
>> -};
>> -
>> -static void rbd_finish_bh(void *opaque)
>> +static void qemu_rbd_finish_bh(void *opaque)
>>  {
>> -    RADOSCB *rcb = opaque;
>> -    qemu_rbd_complete_aio(rcb);
>> +    RBDTask *task = opaque;
>> +    task->complete = 1;
>> +    aio_co_wake(task->co);
>>  }
>>
>> -/*
>> - * This is the callback function for rbd_aio_read and _write
>> - *
>> - * Note: this function is being called from a non qemu thread so
>> - * we need to be careful about what we do here. Generally we only
>> - * schedule a BH, and do the rest of the io completion handling
>> - * from rbd_finish_bh() which runs in a qemu context.
>> - */
>> -static void rbd_finish_aiocb(rbd_completion_t c, RADOSCB *rcb)
>> +static void qemu_rbd_completion_cb(rbd_completion_t c, RBDTask *task)
>>  {
>> -    RBDAIOCB *acb = rcb->acb;
>> -
>> -    rcb->ret = rbd_aio_get_return_value(c);
>> +    task->ret = rbd_aio_get_return_value(c);
>>      rbd_aio_release(c);
>> -
>> -    replay_bh_schedule_oneshot_event(acb->s->aio_context, rbd_finish_bh, rcb);
>> +    aio_bh_schedule_oneshot(task->s->aio_context, qemu_rbd_finish_bh, task);
>>  }
>>
>> -static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
>> -                                 int64_t off,
>> -                                 QEMUIOVector *qiov,
>> -                                 int64_t size,
>> -                                 BlockCompletionFunc *cb,
>> -                                 void *opaque,
>> -                                 RBDAIOCmd cmd)
>> +static int coroutine_fn qemu_rbd_start_co(BlockDriverState *bs,
>> +                                          uint64_t offset,
>> +                                          uint64_t bytes,
>> +                                          QEMUIOVector *qiov,
>> +                                          int flags,
>> +                                          RBDAIOCmd cmd)
>>  {
>> -    RBDAIOCB *acb;
>> -    RADOSCB *rcb = NULL;
>> -    rbd_completion_t c;
>> -    int r;
>> -
>>      BDRVRBDState *s = bs->opaque;
>> +    RBDTask task = { .s = s, .co = qemu_coroutine_self() };
>> +    rbd_completion_t c;
>> +    int r, ret = -EIO;
>>
>> -    acb = qemu_aio_get(&rbd_aiocb_info, bs, cb, opaque);
>> -    acb->cmd = cmd;
>> -    acb->qiov = qiov;
>> -    assert(!qiov || qiov->size == size);
>> -
>> -    rcb = g_new(RADOSCB, 1);
>> -
>> -    acb->ret = 0;
>> -    acb->error = 0;
>> -    acb->s = s;
>> +    assert(!qiov || qiov->size == bytes);
>>
>> -    rcb->acb = acb;
>> -    rcb->s = acb->s;
>> -    rcb->size = size;
>> -    r = rbd_aio_create_completion(rcb, (rbd_callback_t) rbd_finish_aiocb, &c);
>> +    r = rbd_aio_create_completion(&task,
>> +                                  (rbd_callback_t) qemu_rbd_completion_cb, &c);
>>      if (r < 0) {
>>          goto failed;
>>      }
>>
>>      switch (cmd) {
>> -    case RBD_AIO_WRITE:
>> -        /*
>> -         * RBD APIs don't allow us to write more than actual size, so in order
>> -         * to support growing images, we resize the image before write
>> -         * operations that exceed the current size.
>> -         */
>> -        if (off + size > s->image_size) {
>> -            r = qemu_rbd_resize(bs, off + size);
> I realize this is inherited code that is being refactored, but is it
> really possible for QEMU to issue IOs outside the block extents? This
> also has the same issue as the previous commit comment where the
> "image_size" is only initialized at image open time and therefore this
> path will keep getting hit if IOs are issued beyond the original block
> device extents.


This is for the case that you came to the idea that putting e.g. a qcow2 file on rbd which actually can grow during runtime.

If you put a raw image on an rbd image the only way to grow is with block_resize (which invoces truncate) or with qemu-img resize...


I personally was unsure if it makes sense at all to supprt anything except raw on rbd, but it was supported before so I left this in.


>
>> -            if (r < 0) {
>> -                goto failed_completion;
>> -            }
>> -        }
>> -        r = rbd_aio_writev(s->image, qiov->iov, qiov->niov, off, c);
>> -        break;
>>      case RBD_AIO_READ:
>> -        r = rbd_aio_readv(s->image, qiov->iov, qiov->niov, off, c);
>> +        r = rbd_aio_readv(s->image, qiov->iov, qiov->niov, offset, c);
>> +        break;
>> +    case RBD_AIO_WRITE:
>> +        r = rbd_aio_writev(s->image, qiov->iov, qiov->niov, offset, c);
>>          break;
>>      case RBD_AIO_DISCARD:
>> -        r = rbd_aio_discard(s->image, off, size, c);
>> +        r = rbd_aio_discard(s->image, offset, bytes, c);
>>          break;
>>      case RBD_AIO_FLUSH:
>>          r = rbd_aio_flush(s->image, c);
>> @@ -908,44 +813,71 @@ static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
>>      }
>>
>>      if (r < 0) {
>> +        task.complete = 1;
>> +        task.ret = r;
>> +    }
>> +
>> +    while (!task.complete) {
>> +        qemu_coroutine_yield();
>> +    }
>> +
>> +    if (task.ret < 0) {
>> +        error_report("rbd request failed: cmd %d offset %" PRIu64 " bytes %"
>> +                     PRIu64 " flags %d task.ret %" PRIi64 " (%s)", cmd, offset,
>> +                     bytes, flags, task.ret, strerror(-task.ret));
>>          goto failed_completion;
>>      }
>> -    return &acb->common;
>> +
>> +    /* zero pad short reads */
>> +    if (cmd == RBD_AIO_READ && task.ret < qiov->size) {
>> +        qemu_iovec_memset(qiov, task.ret, 0, qiov->size - task.ret);
>> +    }
>> +
>> +    return 0;
>>
>>  failed_completion:
>>      rbd_aio_release(c);
> Wasn't this already released in "qemu_rbd_completion_cb"?


You are right, in case of task.ret < 0 we need to go to "failed" and not "failed_completion".

If the I/O is successful we leave the coroutine with "return 0" just above the label.


Peter


