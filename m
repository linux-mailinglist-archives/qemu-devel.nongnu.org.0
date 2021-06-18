Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C83323AC6B0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 10:59:59 +0200 (CEST)
Received: from localhost ([::1]:51362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luAM2-0003MQ-TN
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 04:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1luAKV-0002B9-M6
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 04:58:23 -0400
Received: from kerio.kamp.de ([195.62.97.192]:40630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1luAKS-00085w-RB
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 04:58:23 -0400
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:58:09 +0200
Received: (qmail 39650 invoked from network); 18 Jun 2021 08:58:11 -0000
Received: from ac17.vpn.kamp-intra.net (HELO ?172.20.250.17?)
 (pl@kamp.de@::ffff:172.20.250.17)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES128-SHA encrypted) ESMTPA;
 18 Jun 2021 08:58:11 -0000
Subject: Re: [PATCH V3 1/6] block/rbd: bump librbd requirement to luminous
 release
To: Ilya Dryomov <idryomov@gmail.com>
References: <20210519142359.23083-1-pl@kamp.de>
 <20210519142359.23083-2-pl@kamp.de>
 <CAOi1vP-CbfSqum0_3gftPq-nVJCY+e806O2Qf9ygBOOv0EbCbw@mail.gmail.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <1717e8f8-8354-0f13-a5ad-12f9d3f97081@kamp.de>
Date: Fri, 18 Jun 2021 10:58:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOi1vP-CbfSqum0_3gftPq-nVJCY+e806O2Qf9ygBOOv0EbCbw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.254,
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, ct@flyingcircus.io, Paolo Bonzini <pbonzini@redhat.com>,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.06.21 um 14:26 schrieb Ilya Dryomov:
> On Wed, May 19, 2021 at 4:26 PM Peter Lieven <pl@kamp.de> wrote:
>> even luminous (version 12.2) is unmaintained for over 3 years now.
>> Bump the requirement to get rid of the ifdef'ry in the code.
>> Qemu 6.1 dropped the support for RHEL-7 which was the last supported
>> OS that required an older librbd.
>>
>> Signed-off-by: Peter Lieven <pl@kamp.de>
>> ---
>>  block/rbd.c | 120 ++++------------------------------------------------
>>  meson.build |   7 ++-
>>  2 files changed, 13 insertions(+), 114 deletions(-)
>>
>> diff --git a/block/rbd.c b/block/rbd.c
>> index 26f64cce7c..6b1cbe1d75 100644
>> --- a/block/rbd.c
>> +++ b/block/rbd.c
>> @@ -55,24 +55,10 @@
>>   * leading "\".
>>   */
>>
>> -/* rbd_aio_discard added in 0.1.2 */
>> -#if LIBRBD_VERSION_CODE >= LIBRBD_VERSION(0, 1, 2)
>> -#define LIBRBD_SUPPORTS_DISCARD
>> -#else
>> -#undef LIBRBD_SUPPORTS_DISCARD
>> -#endif
>> -
>>  #define OBJ_MAX_SIZE (1UL << OBJ_DEFAULT_OBJ_ORDER)
>>
>>  #define RBD_MAX_SNAPS 100
>>
>> -/* The LIBRBD_SUPPORTS_IOVEC is defined in librbd.h */
>> -#ifdef LIBRBD_SUPPORTS_IOVEC
>> -#define LIBRBD_USE_IOVEC 1
>> -#else
>> -#define LIBRBD_USE_IOVEC 0
>> -#endif
>> -
>>  typedef enum {
>>      RBD_AIO_READ,
>>      RBD_AIO_WRITE,
>> @@ -84,7 +70,6 @@ typedef struct RBDAIOCB {
>>      BlockAIOCB common;
>>      int64_t ret;
>>      QEMUIOVector *qiov;
>> -    char *bounce;
>>      RBDAIOCmd cmd;
>>      int error;
>>      struct BDRVRBDState *s;
>> @@ -94,7 +79,6 @@ typedef struct RADOSCB {
>>      RBDAIOCB *acb;
>>      struct BDRVRBDState *s;
>>      int64_t size;
>> -    char *buf;
>>      int64_t ret;
>>  } RADOSCB;
>>
>> @@ -342,13 +326,9 @@ static int qemu_rbd_set_keypairs(rados_t cluster, const char *keypairs_json,
>>
>>  static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
>>  {
>> -    if (LIBRBD_USE_IOVEC) {
>> -        RBDAIOCB *acb = rcb->acb;
>> -        iov_memset(acb->qiov->iov, acb->qiov->niov, offs, 0,
>> -                   acb->qiov->size - offs);
>> -    } else {
>> -        memset(rcb->buf + offs, 0, rcb->size - offs);
>> -    }
>> +    RBDAIOCB *acb = rcb->acb;
>> +    iov_memset(acb->qiov->iov, acb->qiov->niov, offs, 0,
>> +               acb->qiov->size - offs);
>>  }
>>
>>  /* FIXME Deprecate and remove keypairs or make it available in QMP. */
>> @@ -504,13 +484,6 @@ static void qemu_rbd_complete_aio(RADOSCB *rcb)
>>
>>      g_free(rcb);
>>
>> -    if (!LIBRBD_USE_IOVEC) {
>> -        if (acb->cmd == RBD_AIO_READ) {
>> -            qemu_iovec_from_buf(acb->qiov, 0, acb->bounce, acb->qiov->size);
>> -        }
>> -        qemu_vfree(acb->bounce);
>> -    }
>> -
>>      acb->common.cb(acb->common.opaque, (acb->ret > 0 ? 0 : acb->ret));
>>
>>      qemu_aio_unref(acb);
>> @@ -878,28 +851,6 @@ static void rbd_finish_aiocb(rbd_completion_t c, RADOSCB *rcb)
>>                                       rbd_finish_bh, rcb);
>>  }
>>
>> -static int rbd_aio_discard_wrapper(rbd_image_t image,
>> -                                   uint64_t off,
>> -                                   uint64_t len,
>> -                                   rbd_completion_t comp)
>> -{
>> -#ifdef LIBRBD_SUPPORTS_DISCARD
>> -    return rbd_aio_discard(image, off, len, comp);
>> -#else
>> -    return -ENOTSUP;
>> -#endif
>> -}
>> -
>> -static int rbd_aio_flush_wrapper(rbd_image_t image,
>> -                                 rbd_completion_t comp)
>> -{
>> -#ifdef LIBRBD_SUPPORTS_AIO_FLUSH
>> -    return rbd_aio_flush(image, comp);
>> -#else
>> -    return -ENOTSUP;
>> -#endif
>> -}
>> -
>>  static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
>>                                   int64_t off,
>>                                   QEMUIOVector *qiov,
>> @@ -922,21 +873,6 @@ static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
>>
>>      rcb = g_new(RADOSCB, 1);
>>
>> -    if (!LIBRBD_USE_IOVEC) {
>> -        if (cmd == RBD_AIO_DISCARD || cmd == RBD_AIO_FLUSH) {
>> -            acb->bounce = NULL;
>> -        } else {
>> -            acb->bounce = qemu_try_blockalign(bs, qiov->size);
>> -            if (acb->bounce == NULL) {
>> -                goto failed;
>> -            }
>> -        }
>> -        if (cmd == RBD_AIO_WRITE) {
>> -            qemu_iovec_to_buf(acb->qiov, 0, acb->bounce, qiov->size);
>> -        }
>> -        rcb->buf = acb->bounce;
>> -    }
>> -
>>      acb->ret = 0;
>>      acb->error = 0;
>>      acb->s = s;
>> @@ -950,7 +886,7 @@ static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
>>      }
>>
>>      switch (cmd) {
>> -    case RBD_AIO_WRITE: {
>> +    case RBD_AIO_WRITE:
>>          /*
>>           * RBD APIs don't allow us to write more than actual size, so in order
>>           * to support growing images, we resize the image before write
>> @@ -962,25 +898,16 @@ static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
>>                  goto failed_completion;
>>              }
>>          }
>> -#ifdef LIBRBD_SUPPORTS_IOVEC
>> -            r = rbd_aio_writev(s->image, qiov->iov, qiov->niov, off, c);
>> -#else
>> -            r = rbd_aio_write(s->image, off, size, rcb->buf, c);
>> -#endif
>> +        r = rbd_aio_writev(s->image, qiov->iov, qiov->niov, off, c);
>>          break;
>> -    }
>>      case RBD_AIO_READ:
>> -#ifdef LIBRBD_SUPPORTS_IOVEC
>> -            r = rbd_aio_readv(s->image, qiov->iov, qiov->niov, off, c);
>> -#else
>> -            r = rbd_aio_read(s->image, off, size, rcb->buf, c);
>> -#endif
>> +        r = rbd_aio_readv(s->image, qiov->iov, qiov->niov, off, c);
>>          break;
>>      case RBD_AIO_DISCARD:
>> -        r = rbd_aio_discard_wrapper(s->image, off, size, c);
>> +        r = rbd_aio_discard(s->image, off, size, c);
>>          break;
>>      case RBD_AIO_FLUSH:
>> -        r = rbd_aio_flush_wrapper(s->image, c);
>> +        r = rbd_aio_flush(s->image, c);
>>          break;
>>      default:
>>          r = -EINVAL;
>> @@ -995,9 +922,6 @@ failed_completion:
>>      rbd_aio_release(c);
>>  failed:
>>      g_free(rcb);
>> -    if (!LIBRBD_USE_IOVEC) {
>> -        qemu_vfree(acb->bounce);
>> -    }
>>
>>      qemu_aio_unref(acb);
>>      return NULL;
>> @@ -1023,7 +947,6 @@ static BlockAIOCB *qemu_rbd_aio_pwritev(BlockDriverState *bs,
>>                           RBD_AIO_WRITE);
>>  }
>>
>> -#ifdef LIBRBD_SUPPORTS_AIO_FLUSH
>>  static BlockAIOCB *qemu_rbd_aio_flush(BlockDriverState *bs,
>>                                        BlockCompletionFunc *cb,
>>                                        void *opaque)
>> @@ -1031,20 +954,6 @@ static BlockAIOCB *qemu_rbd_aio_flush(BlockDriverState *bs,
>>      return rbd_start_aio(bs, 0, NULL, 0, cb, opaque, RBD_AIO_FLUSH);
>>  }
>>
>> -#else
>> -
>> -static int qemu_rbd_co_flush(BlockDriverState *bs)
>> -{
>> -#if LIBRBD_VERSION_CODE >= LIBRBD_VERSION(0, 1, 1)
>> -    /* rbd_flush added in 0.1.1 */
>> -    BDRVRBDState *s = bs->opaque;
>> -    return rbd_flush(s->image);
>> -#else
>> -    return 0;
>> -#endif
>> -}
>> -#endif
>> -
>>  static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
>>  {
>>      BDRVRBDState *s = bs->opaque;
>> @@ -1210,7 +1119,6 @@ static int qemu_rbd_snap_list(BlockDriverState *bs,
>>      return snap_count;
>>  }
>>
>> -#ifdef LIBRBD_SUPPORTS_DISCARD
>>  static BlockAIOCB *qemu_rbd_aio_pdiscard(BlockDriverState *bs,
>>                                           int64_t offset,
>>                                           int bytes,
>> @@ -1220,9 +1128,7 @@ static BlockAIOCB *qemu_rbd_aio_pdiscard(BlockDriverState *bs,
>>      return rbd_start_aio(bs, offset, NULL, bytes, cb, opaque,
>>                           RBD_AIO_DISCARD);
>>  }
>> -#endif
>>
>> -#ifdef LIBRBD_SUPPORTS_INVALIDATE
>>  static void coroutine_fn qemu_rbd_co_invalidate_cache(BlockDriverState *bs,
>>                                                        Error **errp)
>>  {
>> @@ -1232,7 +1138,6 @@ static void coroutine_fn qemu_rbd_co_invalidate_cache(BlockDriverState *bs,
>>          error_setg_errno(errp, -r, "Failed to invalidate the cache");
>>      }
>>  }
>> -#endif
>>
>>  static QemuOptsList qemu_rbd_create_opts = {
>>      .name = "rbd-create-opts",
>> @@ -1290,23 +1195,14 @@ static BlockDriver bdrv_rbd = {
>>      .bdrv_aio_preadv        = qemu_rbd_aio_preadv,
>>      .bdrv_aio_pwritev       = qemu_rbd_aio_pwritev,
>>
>> -#ifdef LIBRBD_SUPPORTS_AIO_FLUSH
>>      .bdrv_aio_flush         = qemu_rbd_aio_flush,
>> -#else
>> -    .bdrv_co_flush_to_disk  = qemu_rbd_co_flush,
>> -#endif
>> -
>> -#ifdef LIBRBD_SUPPORTS_DISCARD
>>      .bdrv_aio_pdiscard      = qemu_rbd_aio_pdiscard,
>> -#endif
>>
>>      .bdrv_snapshot_create   = qemu_rbd_snap_create,
>>      .bdrv_snapshot_delete   = qemu_rbd_snap_remove,
>>      .bdrv_snapshot_list     = qemu_rbd_snap_list,
>>      .bdrv_snapshot_goto     = qemu_rbd_snap_rollback,
>> -#ifdef LIBRBD_SUPPORTS_INVALIDATE
>>      .bdrv_co_invalidate_cache = qemu_rbd_co_invalidate_cache,
>> -#endif
>>
>>      .strong_runtime_opts    = qemu_rbd_strong_runtime_opts,
>>  };
>> diff --git a/meson.build b/meson.build
>> index 1559e8d873..644ef36476 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -721,13 +721,16 @@ if not get_option('rbd').auto() or have_block
>>        int main(void) {
>>          rados_t cluster;
>>          rados_create(&cluster, NULL);
>> +        #if LIBRBD_VERSION_CODE < LIBRBD_VERSION(1, 12, 0)
>> +        #error
> Hi Peter,
>
> Just a nit, but I would stick to the actual version of the library
> instead of the package version.  librbd major version is 1, librados
> major version is 2 -- it shows up in ldd, when listing /usr/lib, etc.
> Something like
>
>     #error librbd >= 1.12.0 required
>
> here


Okay.


>
>> +        #endif
>>          return 0;
>>        }''', dependencies: [librbd, librados])
>>        rbd = declare_dependency(dependencies: [librbd, librados])
>>      elif get_option('rbd').enabled()
>> -      error('could not link librados')
>> +      error('librados/librbd >= 12.0.0 required')
> and
>
>     error('could not link librados/librbd')
>
>>      else
>> -      warning('could not link librados, disabling')
>> +      warning('librados/librbd >= 12.0.0 not found, disabling rbd support')
>     warning('could not link librados/librbd, disabling')
>
> here to avoid repeating the version.


I would only like to change it if the "#error" is visible in the actual configure output. Have not testet your proposal yet.

If its visible I am fine to change it.


Peter




