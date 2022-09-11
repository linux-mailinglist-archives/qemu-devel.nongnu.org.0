Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E475E5B4C8F
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 10:02:41 +0200 (CEST)
Received: from localhost ([::1]:38052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXHvM-000432-Ec
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 04:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oXHtF-0002Wz-T6; Sun, 11 Sep 2022 04:00:29 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30]:41739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oXHtC-0007or-Hb; Sun, 11 Sep 2022 04:00:29 -0400
Received: by mail-vs1-xe30.google.com with SMTP id k2so5974447vsk.8;
 Sun, 11 Sep 2022 01:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=cNpUWbJ7KeXZCIxglutmQWtuqNbom0u/2uT7EfIPMjw=;
 b=n6kz5fXsxBMMFPoSQlpub1Lqz7CW7oo1RWm0zyDotIbDPkuP9P8laHVSRNsq780L76
 TzatSyb+FZUjfJF3elSTFq7C7wKZyqGCmKOzbpk66krpkwc48PeXly6ng8WZ301/fq51
 BfJmfd8zv2H2bH2qeV78aFiDOqAngvuUo80iTICyyIs6ihc/TW5koRMvu2Zl5Jy44wCD
 f0loqPULcCFo4eX/QRTcMP9xspm2+CjffPmrhGS4bXUtZL0QgVXFe8IUg4S7lzg4kLOi
 DLymwm1mS8lkbpscXK8jEo8VdgGC2i93XVZRcjJ/dfW3dcatFfNwj8R27wwLOoOD9wti
 Mxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cNpUWbJ7KeXZCIxglutmQWtuqNbom0u/2uT7EfIPMjw=;
 b=peYhLyiNa0BGWKtvIjEcF31czDSFgJIjxJnRqueSKCC6Oc/VTCfx8HMoMu5e7SUufi
 aFD027zqYPQ1QoFVy5KaSYOxdYAdcXHOS+2xBKIS0St9RAfVvc/45jS+qsf6MZZDuo+8
 ZHcGrw5pb33FSwvoiVUt5U1rRfjv6dU2ySsxL0bL3RKiiSBN+nf5jgx/L8jCTE2Zfgcp
 wYqcMLEqrn9GvHBEiuyj0gcGXLK4YlrAYx4qbrSJv/C7zN4+qfnwhH9o5GB/xfi9u4TA
 YbK/QOwJG8ALvaGMdpV++WF/6OpVBMQvenVpTPIBUxHcz9cyxY23ixTnHYlitt5xcwiU
 ZfuA==
X-Gm-Message-State: ACgBeo2O04wv3wpJD0X2a+V5/CHAJEKDWe9GrAIMcg43yAb8nG61RiVd
 dXL3jaaKQs9JtJI9kaIc/uaL1sbDquG62Sn+CZ8=
X-Google-Smtp-Source: AA6agR735wKsYETjS1h72EZ+VV0e50fUr7MB7j+ZMVLaCHYc5aWPRXD3jHpR5+fPykdNv2b1Ea9TKSgARodNoxfeqUA=
X-Received: by 2002:a67:8c43:0:b0:398:6815:d340 with SMTP id
 o64-20020a678c43000000b003986815d340mr2424573vsd.42.1662883224464; Sun, 11
 Sep 2022 01:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220910063836.31295-1-faithilikerun@gmail.com>
 <9665c8b0-b291-7a42-8242-73a7c0967917@opensource.wdc.com>
In-Reply-To: <9665c8b0-b291-7a42-8242-73a7c0967917@opensource.wdc.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Sun, 11 Sep 2022 16:00:36 +0800
Message-ID: <CAAAx-8KUHoW4Apr1u9urRyVnKmp1Qo2kMKWP2+iRui4jtYj9LA@mail.gmail.com>
Subject: Re: [PATCH] block: introduce zone append write for zoned devices
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Fam Zheng <fam@euphon.net>,
 Hannes Reinecke <hare@suse.de>, 
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=faithilikerun@gmail.com; helo=mail-vs1-xe30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=B49=
=E6=9C=8811=E6=97=A5=E5=91=A8=E6=97=A5 14:06=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2022/09/10 15:38, Sam Li wrote:
> > A zone append command is a write operation that specifies the first
> > logical block of a zone as the write position. When writing to a zoned
> > block device using zone append, the byte offset of the write is pointin=
g
> > to the write pointer of that zone. Upon completion the device will
> > respond with the position the data has been placed in the zone.
>
> s/placed/written
>
> You need to explain more about what this patch does:
>
> Since Linux does not provide a user API to issue zone append operations t=
o zoned
> devices from user space, the file-posix driver is modified to add zone ap=
pend
> emulation using regular write operations. To do this, the file-posix driv=
er
> tracks the wp location of all zones of the device.... Blah.
>
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > ---
> >  block/block-backend.c              |  65 +++++++++++
> >  block/file-posix.c                 | 169 ++++++++++++++++++++++++++++-
> >  block/io.c                         |  21 ++++
> >  block/raw-format.c                 |   7 ++
> >  include/block/block-common.h       |   2 +
> >  include/block/block-io.h           |   3 +
> >  include/block/block_int-common.h   |   9 ++
> >  include/block/raw-aio.h            |   4 +-
> >  include/sysemu/block-backend-io.h  |   9 ++
> >  qemu-io-cmds.c                     |  62 +++++++++++
> >  tests/qemu-iotests/tests/zoned.out |   7 ++
> >  tests/qemu-iotests/tests/zoned.sh  |   9 ++
> >  12 files changed, 360 insertions(+), 7 deletions(-)
> >
> > diff --git a/block/block-backend.c b/block/block-backend.c
> > index ebe8d7bdf3..b77a1cb24b 100644
> > --- a/block/block-backend.c
> > +++ b/block/block-backend.c
> > @@ -1439,6 +1439,9 @@ typedef struct BlkRwCo {
> >          struct {
> >              BlockZoneOp op;
> >          } zone_mgmt;
> > +        struct {
> > +            int64_t *append_sector;
> > +        } zone_append;
> >      };
> >  } BlkRwCo;
> >
> > @@ -1869,6 +1872,47 @@ BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk,=
 BlockZoneOp op,
> >      return &acb->common;
> >  }
> >
> > +static void blk_aio_zone_append_entry(void *opaque) {
> > +    BlkAioEmAIOCB *acb =3D opaque;
> > +    BlkRwCo *rwco =3D &acb->rwco;
> > +
> > +    rwco->ret =3D blk_co_zone_append(rwco->blk, rwco->zone_append.appe=
nd_sector,
> > +                                   rwco->iobuf, rwco->flags);
> > +    blk_aio_complete(acb);
> > +}
> > +
> > +BlockAIOCB *blk_aio_zone_append(BlockBackend *blk, int64_t *offset,
> > +                                QEMUIOVector *qiov, BdrvRequestFlags f=
lags,
> > +                                BlockCompletionFunc *cb, void *opaque)=
 {
> > +    BlkAioEmAIOCB *acb;
> > +    Coroutine *co;
> > +    IO_CODE();
> > +
> > +    blk_inc_in_flight(blk);
> > +    acb =3D blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
> > +    acb->rwco =3D (BlkRwCo) {
> > +            .blk    =3D blk,
> > +            .ret    =3D NOT_DONE,
> > +            .flags  =3D flags,
> > +            .iobuf  =3D qiov,
> > +            .zone_append =3D {
> > +                    .append_sector =3D offset,
> > +            },
> > +    };
> > +    acb->has_returned =3D false;
> > +
> > +    co =3D qemu_coroutine_create(blk_aio_zone_append_entry, acb);
> > +    bdrv_coroutine_enter(blk_bs(blk), co);
> > +
> > +    acb->has_returned =3D true;
> > +    if (acb->rwco.ret !=3D NOT_DONE) {
> > +        replay_bh_schedule_oneshot_event(blk_get_aio_context(blk),
> > +                                         blk_aio_complete_bh, acb);
> > +    }
> > +
> > +    return &acb->common;
> > +}
> > +
> >  /*
> >   * Send a zone_report command.
> >   * offset is a byte offset from the start of the device. No alignment
> > @@ -1920,6 +1964,27 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *=
blk, BlockZoneOp op,
> >      return ret;
> >  }
> >
> > +/*
> > + * Send a zone_append command.
> > + */
> > +int coroutine_fn blk_co_zone_append(BlockBackend *blk, int64_t *offset=
,
> > +        QEMUIOVector *qiov, BdrvRequestFlags flags)
> > +{
> > +    int ret;
> > +    IO_CODE();
> > +
> > +    blk_inc_in_flight(blk);
> > +    blk_wait_while_drained(blk);
> > +    if (!blk_is_available(blk)) {
> > +        blk_dec_in_flight(blk);
> > +        return -ENOMEDIUM;
> > +    }
> > +
> > +    ret =3D bdrv_co_zone_append(blk_bs(blk), offset, qiov, flags);
> > +    blk_dec_in_flight(blk);
> > +    return ret;
> > +}
> > +
> >  void blk_drain(BlockBackend *blk)
> >  {
> >      BlockDriverState *bs =3D blk_bs(blk);
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 354de22860..65500e43f4 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -173,6 +173,7 @@ typedef struct BDRVRawState {
> >      } stats;
> >
> >      PRManager *pr_mgr;
> > +    CoRwlock zones_lock;
> >  } BDRVRawState;
> >
> >  typedef struct BDRVRawReopenState {
> > @@ -206,6 +207,8 @@ typedef struct RawPosixAIOData {
> >          struct {
> >              struct iovec *iov;
> >              int niov;
> > +            int64_t *append_sector;
> > +            BlockZoneDescriptor *zone;
> >          } io;
> >          struct {
> >              uint64_t cmd;
> > @@ -1333,6 +1336,9 @@ static int hdev_get_max_segments(int fd, struct s=
tat *st) {
> >  #endif
> >  }
> >
> > +static inline void parse_zone(struct BlockZoneDescriptor *zone,
> > +                              const struct blk_zone *blkz);
> > +static int do_zone_report(int64_t offset, int fd, struct BlockZoneDesc=
riptor *zones, unsigned int nrz);
> >  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
> >  {
> >      BDRVRawState *s =3D bs->opaque;
> > @@ -1402,6 +1408,19 @@ static void raw_refresh_limits(BlockDriverState =
*bs, Error **errp)
> >          if (ret >=3D 0) {
> >              bs->bl.max_active_zones =3D ret;
> >          }
> > +
> > +        ret =3D get_sysfs_long_val(&st, "logical_block_size");
> > +        if (ret >=3D 0) {
> > +            bs->bl.logical_block_size =3D ret;
> > +        }
> > +
> > +        ret =3D get_sysfs_long_val(&st, "nr_zones");
> > +        if (ret > 0) {
> > +            bs->bl.nr_zones =3D ret;
> > +            int64_t zones_size =3D ret * sizeof(BlockZoneDescriptor);
> > +            bs->bl.zones =3D g_malloc(zones_size);
> > +            do_zone_report(0, s->fd, bs->bl.zones, ret);
>
> What happens if this fails ?

There are two cases:
1) ioctl fails: error reports in do_zone_report
2) the number of zones that reported are less than expected

I was wondering if 2) happens. If that happens, then do_zone_report
again or simply report an error.

>
> > +        }
> >      }
> >  }
> >
> > @@ -1569,18 +1588,24 @@ static ssize_t handle_aiocb_rw_vector(RawPosixA=
IOData *aiocb)
> >      ssize_t len;
> >
> >      do {
> > -        if (aiocb->aio_type & QEMU_AIO_WRITE)
> > +        if (aiocb->aio_type & QEMU_AIO_WRITE) {
> >              len =3D qemu_pwritev(aiocb->aio_fildes,
> >                                 aiocb->io.iov,
> >                                 aiocb->io.niov,
> >                                 aiocb->aio_offset);
> > -         else
> > +        } else if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
> > +            uint64_t wp =3D aiocb->aio_offset;
> > +            len =3D qemu_pwritev(aiocb->aio_fildes,
> > +                               aiocb->io.iov,
> > +                               aiocb->io.niov,
> > +                               wp);
>
> That wp variable is not necessary, which makes this "else if" also unnece=
ssary.
> What about simply:
>
>            if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))
>                len =3D qemu_pwritev(aiocb->aio_fildes,
>                                   aiocb->io.iov,
>                                   aiocb->io.niov,
>                                   aiocb->aio_offset);
>            else
>                ...
>
> >              len =3D qemu_preadv(aiocb->aio_fildes,
> >                                aiocb->io.iov,
> >                                aiocb->io.niov,
> >                                aiocb->aio_offset);
> > +        }
> >      } while (len =3D=3D -1 && errno =3D=3D EINTR);
> > -
>
> whiteline change.
>
> >      if (len =3D=3D -1) {
> >          return -errno;
> >      }
> > @@ -1604,6 +1629,12 @@ static ssize_t handle_aiocb_rw_linear(RawPosixAI=
OData *aiocb, char *buf)
> >                           (const char *)buf + offset,
> >                           aiocb->aio_nbytes - offset,
> >                           aiocb->aio_offset + offset);
> > +        } else if (aiocb->aio_type =3D=3D QEMU_AIO_ZONE_APPEND) {
> > +            uint64_t wp =3D aiocb->aio_offset;
>
> This variable is not necessary.
>
> > +            len =3D pwrite(aiocb->aio_fildes,
> > +                         (const char *)buf + offset,
> > +                         aiocb->aio_nbytes - offset,
> > +                         wp + offset);
> >          } else {
> >              len =3D pread(aiocb->aio_fildes,
> >                          buf + offset,
> > @@ -1638,7 +1669,6 @@ static int handle_aiocb_rw(void *opaque)
> >      RawPosixAIOData *aiocb =3D opaque;
> >      ssize_t nbytes;
> >      char *buf;
> > -
>
> whiteline change.
>
> >      if (!(aiocb->aio_type & QEMU_AIO_MISALIGNED)) {
> >          /*
> >           * If there is just a single buffer, and it is properly aligne=
d
> > @@ -1692,7 +1722,7 @@ static int handle_aiocb_rw(void *opaque)
> >      }
> >
> >      nbytes =3D handle_aiocb_rw_linear(aiocb, buf);
> > -    if (!(aiocb->aio_type & QEMU_AIO_WRITE)) {
> > +    if (!(aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))) =
{
> >          char *p =3D buf;
> >          size_t count =3D aiocb->aio_nbytes, copy;
> >          int i;
> > @@ -1713,6 +1743,25 @@ static int handle_aiocb_rw(void *opaque)
> >
> >  out:
> >      if (nbytes =3D=3D aiocb->aio_nbytes) {
> > +#if defined(CONFIG_BLKZONED)
> > +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))=
 {
> > +            BlockZoneDescriptor *zone =3D aiocb->io.zone;
> > +            int64_t nr_sectors =3D aiocb->aio_nbytes / 512;
> > +            if (zone) {
> > +                qemu_mutex_init(&zone->lock);
> > +                if (zone->type =3D=3D BLK_ZT_SWR) {
> > +                    qemu_mutex_lock(&zone->lock);
> > +                    zone->wp +=3D nr_sectors;
> > +                    qemu_mutex_unlock(&zone->lock);
> > +                }
> > +                qemu_mutex_destroy(&zone->lock);
>
> This is weird. you init the mutex, lock/unlock it and destroy it. So it h=
as
> absolutely no meaning at all.

I was thinking that init every lock for all the zones or init the lock
for the zone that needed it. The confusion I have here is the cost of
initializing/destroying the lock.

>
> > +
> > +                if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
> > +                    *aiocb->io.append_sector =3D zone->wp;
>
> This needs to be done with the zone mutex locked. Otherwise, when reachin=
g this
> code, the zone wp may have changed already and so you would be returning =
the
> wrong position.

I see.

>
> > +                }
> > +            }
> > +        }
> > +#endif
> >          return 0;
> >      } else if (nbytes >=3D 0 && nbytes < aiocb->aio_nbytes) {
> >          if (aiocb->aio_type & QEMU_AIO_WRITE) {
> > @@ -1724,6 +1773,13 @@ out:
> >          }
> >      } else {
> >          assert(nbytes < 0);
> > +        if (aiocb->aio_type =3D=3D QEMU_AIO_ZONE_APPEND) {
> > +            BDRVRawState *s =3D aiocb->bs->opaque;
> > +            qemu_co_rwlock_init(&s->zones_lock);
> > +            qemu_co_rwlock_rdlock(&s->zones_lock);
> > +            do_zone_report(0, aiocb->aio_fildes, aiocb->bs->bl.zones, =
aiocb->bs->bl.nr_zones);
> > +            qemu_co_rwlock_unlock(&s->zones_lock);
> > +        }
> >          return nbytes;
> >      }
> >  }
> > @@ -2012,17 +2068,23 @@ static int handle_aiocb_zone_report(void *opaqu=
e) {
> >  static int handle_aiocb_zone_mgmt(void *opaque) {
> >  #if defined(CONFIG_BLKZONED)
> >      RawPosixAIOData *aiocb =3D opaque;
> > +    BlockDriverState *bs =3D aiocb->bs;
> >      int fd =3D aiocb->aio_fildes;
> >      int64_t sector =3D aiocb->aio_offset / 512;
> >      int64_t nr_sectors =3D aiocb->aio_nbytes / 512;
> >      struct blk_zone_range range;
> > +    unsigned long zone_op =3D aiocb->zone_mgmt.zone_op;
> >      int ret;
> >
> > +    BlockZoneDescriptor *zones;
> > +    zones =3D bs->bl.zones;
> > +    int index =3D sector / bs->bl.zone_sectors;
> > +
> >      /* Execute the operation */
> >      range.sector =3D sector;
> >      range.nr_sectors =3D nr_sectors;
> >      do {
> > -        ret =3D ioctl(fd, aiocb->zone_mgmt.zone_op, &range);
> > +        ret =3D ioctl(fd, zone_op, &range);
> >      } while (ret !=3D 0 && errno =3D=3D EINTR);
> >
> >      if (ret !=3D 0) {
> > @@ -2030,6 +2092,28 @@ static int handle_aiocb_zone_mgmt(void *opaque) =
{
> >                       errno);
> >          return -errno;
> >      }
> > +
> > +    if (aiocb->zone_mgmt.all) {
> > +        for (int i =3D 0; i < bs->bl.nr_zones; ++i) {
> > +            qemu_mutex_init(&zones[i].lock);
> > +            qemu_mutex_lock(&zones[i].lock);
> > +            zones[i].wp =3D zones[i].start;
> > +            qemu_mutex_unlock(&zones[i].lock);
> > +            qemu_mutex_destroy(&zones[i].lock);
>
> Same comment here. The mutex init/destroy calls should not be here. The z=
one
> mutex should be initialized when the zone array is first allocated and de=
stroyed
> when the zone array is freed. In between these events, the zone mutex sho=
uld
> NEVER be reinitialized.
>
> > +        }
> > +    } else if (zone_op =3D=3D BLKRESETZONE) {
> > +        qemu_mutex_init(&zones[index].lock);
> > +        qemu_mutex_lock(&zones[index].lock);
> > +        zones[index].wp =3D zones[index].start;
> > +        qemu_mutex_unlock(&zones[index].lock);
> > +        qemu_mutex_destroy(&zones[index].lock);
> > +    } else if (zone_op =3D=3D BLKFINISHZONE) {
> > +        qemu_mutex_init(&zones[index].lock);
> > +        qemu_mutex_lock(&zones[index].lock);
> > +        zones[index].wp =3D zones[index].start + zones[index].length;
> > +        qemu_mutex_unlock(&zones[index].lock);
> > +        qemu_mutex_destroy(&zones[index].lock);
> > +    }
> >      return ret;
> >  #else
> >      return -ENOTSUP;
> > @@ -2340,6 +2424,17 @@ static int coroutine_fn raw_co_prw(BlockDriverSt=
ate *bs, uint64_t offset,
> >          },
> >      };
> >
> > +    int64_t sector =3D offset / 512;
> > +    struct stat st;
> > +    if (fstat(s->fd, &st)) {
> > +        return -1;
> > +    }
> > +    int64_t zone_sector =3D get_sysfs_long_val(&st, "chunk_sectors");
> > +    if (zone_sector > 0) {
> > +        int index =3D sector / bs->bl.zone_sectors;
> > +        BlockZoneDescriptor *zone =3D &bs->bl.zones[index];
> > +        acb.io.zone =3D zone;
>
> The zone variable is not necessary. You may also want to add a small inli=
ne
> helper function to get a zone pointer from a sector value.
>
> > +    }
> >      assert(qiov->size =3D=3D bytes);
> >      return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
> >  }
> > @@ -2448,6 +2543,9 @@ static void raw_aio_attach_aio_context(BlockDrive=
rState *bs,
> >  static void raw_close(BlockDriverState *bs)
> >  {
> >      BDRVRawState *s =3D bs->opaque;
> > +#if defined(CONFIG_BLKZONED)
> > +    g_free(bs->bl.zones);
> > +#endif
> >
> >      if (s->fd >=3D 0) {
> >          qemu_close(s->fd);
> > @@ -3283,6 +3381,11 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDr=
iverState *bs, BlockZoneOp op,
> >          zone_op_name =3D "BLKRESETZONE";
> >          zone_op =3D BLKRESETZONE;
> >          break;
> > +    case BLK_ZO_RESET_ALL:
> > +        zone_op_name =3D "BLKRESETZONE";
> > +        zone_op =3D BLKRESETZONE;
> > +        is_all =3D true;
> > +        break;
> >      default:
> >          g_assert_not_reached();
> >      }
> > @@ -3306,6 +3409,59 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDr=
iverState *bs, BlockZoneOp op,
> >  #endif
> >  }
> >
> > +static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
> > +                                           int64_t *offset,
> > +                                           QEMUIOVector *qiov,
> > +                                           BdrvRequestFlags flags) {
> > +#if defined(CONFIG_BLKZONED)
> > +    BDRVRawState *s =3D bs->opaque;
> > +    int64_t zone_sector =3D bs->bl.zone_sectors;
> > +    int64_t zone_sector_mask =3D zone_sector - 1;
> > +    int64_t iov_len =3D 0;
> > +    int64_t len =3D 0;
> > +    RawPosixAIOData acb;
> > +
> > +    if (*offset & zone_sector_mask) {
> > +        error_report("offset %" PRId64 " is not aligned to zone size "
> > +                     "%" PRId64 "", *offset, zone_sector);
> > +        return -EINVAL;
> > +    }
> > +
> > +    int64_t lbsz =3D bs->bl.logical_block_size;> +    int64_t lbsz_mas=
k =3D lbsz - 1;
> > +    for (int i =3D 0; i < qiov->niov; i++) {
> > +       iov_len =3D qiov->iov[i].iov_len;
> > +       if (iov_len & lbsz_mask) {
> > +           error_report("len of IOVector[%d] %" PRId64 " is not aligne=
d to block "
> > +                        "size %" PRId64 "", i, iov_len, lbsz);
> > +           return -EINVAL;
> > +       }
>
> This alignment check should be against the device write granularity, not =
the
> logical block size. The write granularity will always be equal to the dev=
ice
> physical block size, which may or may not be equal to the device logical =
block
> size. E.g. a 512e SMR disk has a 512B logical block size but a 4096B phys=
ical
> block size. And the ZBC & ZAC specifications mandate that all write be al=
igned
> to the physical block size.

I see. I'll change it to physical block size.

>
> > +       len +=3D iov_len;
> > +    }
> > +
> > +    int64_t sector =3D *offset / 512; //??? did not multiply before
> > +    BlockZoneDescriptor *zone =3D &bs->bl.zones[sector/zone_sector];
> > +
> > +    acb =3D (RawPosixAIOData) {
> > +        .bs =3D bs,
> > +        .aio_fildes =3D s->fd,
> > +        .aio_type =3D QEMU_AIO_ZONE_APPEND,
> > +        .aio_offset =3D zone->wp * 512,
> > +        .aio_nbytes =3D len,
> > +        .io =3D {
> > +                .iov =3D qiov->iov,
> > +                .niov =3D qiov->niov,
> > +                .zone =3D zone,
> > +                .append_sector =3D offset,
> > +        },
> > +    };
> > +
> > +    return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
> > +#else
> > +    return -ENOTSUP;
> > +#endif
> > +}
> > +
> >  static coroutine_fn int
> >  raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
> >                  bool blkdev)
> > @@ -4081,6 +4237,7 @@ static BlockDriver bdrv_zoned_host_device =3D {
> >      /* zone management operations */
> >      .bdrv_co_zone_report =3D raw_co_zone_report,
> >      .bdrv_co_zone_mgmt =3D raw_co_zone_mgmt,
> > +    .bdrv_co_zone_append =3D raw_co_zone_append,
> >  };
> >  #endif
> >
> > diff --git a/block/io.c b/block/io.c
> > index de9ec1d740..3ade9361e4 100644
> > --- a/block/io.c
> > +++ b/block/io.c
> > @@ -3239,6 +3239,27 @@ out:
> >      return co.ret;
> >  }
> >
> > +int bdrv_co_zone_append(BlockDriverState *bs, int64_t *offset,
> > +                        QEMUIOVector *qiov,
> > +                        BdrvRequestFlags flags)
> > +{
> > +    BlockDriver *drv =3D bs->drv;
> > +    CoroutineIOCompletion co =3D {
> > +            .coroutine =3D qemu_coroutine_self(),
> > +    };
> > +    IO_CODE();
> > +
> > +    bdrv_inc_in_flight(bs);
> > +    if (!drv || !drv->bdrv_co_zone_append) {
> > +        co.ret =3D -ENOTSUP;
> > +        goto out;
> > +    }
> > +    co.ret =3D drv->bdrv_co_zone_append(bs, offset, qiov, flags);
> > +out:
> > +    bdrv_dec_in_flight(bs);
> > +    return co.ret;
> > +}
> > +
> >  void *qemu_blockalign(BlockDriverState *bs, size_t size)
> >  {
> >      IO_CODE();
> > diff --git a/block/raw-format.c b/block/raw-format.c
> > index 9441536819..df8cc33467 100644
> > --- a/block/raw-format.c
> > +++ b/block/raw-format.c
> > @@ -325,6 +325,12 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriv=
erState *bs, BlockZoneOp op,
> >      return bdrv_co_zone_mgmt(bs->file->bs, op, offset, len);
> >  }
> >
> > +static int coroutine_fn raw_co_zone_append(BlockDriverState *bs, int64=
_t *offset,
> > +                                           QEMUIOVector *qiov,
> > +                                           BdrvRequestFlags flags) {
> > +    return bdrv_co_zone_append(bs->file->bs, offset, qiov, flags);
> > +}
> > +
> >  static int64_t raw_getlength(BlockDriverState *bs)
> >  {
> >      int64_t len;
> > @@ -628,6 +634,7 @@ BlockDriver bdrv_raw =3D {
> >      .bdrv_co_pdiscard     =3D &raw_co_pdiscard,
> >      .bdrv_co_zone_report  =3D &raw_co_zone_report,
> >      .bdrv_co_zone_mgmt  =3D &raw_co_zone_mgmt,
> > +    .bdrv_co_zone_append =3D &raw_co_zone_append,
> >      .bdrv_co_block_status =3D &raw_co_block_status,
> >      .bdrv_co_copy_range_from =3D &raw_co_copy_range_from,
> >      .bdrv_co_copy_range_to  =3D &raw_co_copy_range_to,
> > diff --git a/include/block/block-common.h b/include/block/block-common.=
h
> > index 36bd0e480e..a55e9b390e 100644
> > --- a/include/block/block-common.h
> > +++ b/include/block/block-common.h
> > @@ -54,6 +54,7 @@ typedef enum BlockZoneOp {
> >      BLK_ZO_CLOSE,
> >      BLK_ZO_FINISH,
> >      BLK_ZO_RESET,
> > +    BLK_ZO_RESET_ALL,
> >  } BlockZoneOp;
> >
> >  typedef enum BlockZoneModel {
> > @@ -84,6 +85,7 @@ typedef enum BlockZoneType {
> >   * Provides information on a zone with all position and size values in=
 bytes.
> >   */
> >  typedef struct BlockZoneDescriptor {
> > +    QemuMutex lock;
> >      uint64_t start;
> >      uint64_t length;
> >      uint64_t cap;
> > diff --git a/include/block/block-io.h b/include/block/block-io.h
> > index 65463b88d9..a792164018 100644
> > --- a/include/block/block-io.h
> > +++ b/include/block/block-io.h
> > @@ -94,6 +94,9 @@ int coroutine_fn bdrv_co_zone_report(BlockDriverState=
 *bs, int64_t offset,
> >                                       BlockZoneDescriptor *zones);
> >  int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp o=
p,
> >                                     int64_t offset, int64_t len);
> > +int coroutine_fn bdrv_co_zone_append(BlockDriverState *bs, int64_t *of=
fset,
> > +                                     QEMUIOVector *qiov,
> > +                                     BdrvRequestFlags flags);
> >
> >  int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
> >  bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
> > diff --git a/include/block/block_int-common.h b/include/block/block_int=
-common.h
> > index 043aa161a0..ebda5953dc 100644
> > --- a/include/block/block_int-common.h
> > +++ b/include/block/block_int-common.h
> > @@ -701,6 +701,9 @@ struct BlockDriver {
> >              BlockZoneDescriptor *zones);
> >      int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, BlockZ=
oneOp op,
> >              int64_t offset, int64_t len);
> > +    int coroutine_fn (*bdrv_co_zone_append)(BlockDriverState *bs,
> > +            int64_t *offset, QEMUIOVector *qiov,
> > +            BdrvRequestFlags flags);
> >
> >      /* removable device specific */
> >      bool (*bdrv_is_inserted)(BlockDriverState *bs);
> > @@ -854,6 +857,12 @@ typedef struct BlockLimits {
> >
> >      /* maximum number of active zones */
> >      int64_t max_active_zones;
> > +
> > +    /* array of zones in the zoned block device. Only tracks write poi=
nter's
> > +     * location of each zone as a helper for zone_append API */
> > +    BlockZoneDescriptor *zones;
>
> This is a lot of memory for only tracking the wp... Why not reduce this t=
o an
> array of int64 values, for the wp only ? As you may need the zone type to=
o
> (conventional vs sequential), you can use the most significant bit (a zon=
e wp
> value will never use all 64 bits !).
>
> Or device another zone structure with zone type, zone wp and mutex only, =
so
> smaller than the regular zone report structure.

I was just trying to reuse do_zone_report. It is better to only track
the wp only. Then a new struct and smaller zone_report should be
introduced for it.

>
> > +
> > +    int64_t logical_block_size;
> >  } BlockLimits;
> >
> >  typedef struct BdrvOpBlocker BdrvOpBlocker;
> > diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
> > index 3d26929cdd..f13cc1887b 100644
> > --- a/include/block/raw-aio.h
> > +++ b/include/block/raw-aio.h
> > @@ -31,6 +31,7 @@
> >  #define QEMU_AIO_TRUNCATE     0x0080
> >  #define QEMU_AIO_ZONE_REPORT  0x0100
> >  #define QEMU_AIO_ZONE_MGMT    0x0200
> > +#define QEMU_AIO_ZONE_APPEND  0x0400
> >  #define QEMU_AIO_TYPE_MASK \
> >          (QEMU_AIO_READ | \
> >           QEMU_AIO_WRITE | \
> > @@ -41,7 +42,8 @@
> >           QEMU_AIO_COPY_RANGE | \
> >           QEMU_AIO_TRUNCATE  | \
> >           QEMU_AIO_ZONE_REPORT | \
> > -         QEMU_AIO_ZONE_MGMT)
> > +         QEMU_AIO_ZONE_MGMT | \
> > +         QEMU_AIO_ZONE_APPEND)
> >
> >  /* AIO flags */
> >  #define QEMU_AIO_MISALIGNED   0x1000
> > diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-b=
ackend-io.h
> > index 6835525582..33e35ae5d7 100644
> > --- a/include/sysemu/block-backend-io.h
> > +++ b/include/sysemu/block-backend-io.h
> > @@ -51,6 +51,9 @@ BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, in=
t64_t offset,
> >  BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> >                                int64_t offset, int64_t len,
> >                                BlockCompletionFunc *cb, void *opaque);
> > +BlockAIOCB *blk_aio_zone_append(BlockBackend *blk, int64_t *offset,
> > +                                QEMUIOVector *qiov, BdrvRequestFlags f=
lags,
> > +                                BlockCompletionFunc *cb, void *opaque)=
;
> >  BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int64_=
t bytes,
> >                               BlockCompletionFunc *cb, void *opaque);
> >  void blk_aio_cancel_async(BlockAIOCB *acb);
> > @@ -172,6 +175,12 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *bl=
k, BlockZoneOp op,
> >                                    int64_t offset, int64_t len);
> >  int generated_co_wrapper blk_zone_mgmt(BlockBackend *blk, BlockZoneOp =
op,
> >                                         int64_t offset, int64_t len);
> > +int coroutine_fn blk_co_zone_append(BlockBackend *blk, int64_t *offset=
,
> > +                                    QEMUIOVector *qiov,
> > +                                    BdrvRequestFlags flags);
> > +int generated_co_wrapper blk_zone_append(BlockBackend *blk, int64_t *o=
ffset,
> > +                                         QEMUIOVector *qiov,
> > +                                         BdrvRequestFlags flags);
> >
> >  int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t offse=
t,
> >                                        int64_t bytes);
> > diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> > index 446a059603..8868c88290 100644
> > --- a/qemu-io-cmds.c
> > +++ b/qemu-io-cmds.c
> > @@ -1850,6 +1850,67 @@ static const cmdinfo_t zone_reset_cmd =3D {
> >          .oneline =3D "reset a zone write pointer in zone block device"=
,
> >  };
> >
> > +static int do_aio_zone_append(BlockBackend *blk, QEMUIOVector *qiov,
> > +                              int64_t *offset, int flags, int *total)
> > +{
> > +    int async_ret =3D NOT_DONE;
> > +
> > +    blk_aio_zone_append(blk, offset, qiov, flags, aio_rw_done, &async_=
ret);
> > +    while (async_ret =3D=3D NOT_DONE) {
> > +        main_loop_wait(false);
> > +    }
> > +
> > +    *total =3D qiov->size;
> > +    return async_ret < 0 ? async_ret : 1;
> > +}
> > +static int zone_append_f(BlockBackend *blk, int argc, char **argv) {
> > +    int ret;
> > +//    struct timespec t1, t2;
> > +    int flags =3D 0;
> > +    int total =3D 0;
> > +    int64_t offset;
> > +    char *buf;
> > +    int nr_iov;
> > +    int pattern =3D 0xcd;
> > +    QEMUIOVector qiov;
> > +
> > +    if (optind > argc - 2) {
> > +        return -EINVAL;
> > +    }
> > +    optind++;
> > +    offset =3D cvtnum(argv[optind]);
> > +    if (offset < 0) {
> > +        print_cvtnum_err(offset, argv[optind]);
> > +        return offset;
> > +    }
> > +    optind++;
> > +    nr_iov =3D argc - optind;
> > +    buf =3D create_iovec(blk, &qiov, &argv[optind], nr_iov, pattern);
> > +    if (buf =3D=3D NULL) {
> > +        return -EINVAL;
> > +    }
> > +    ret =3D do_aio_zone_append(blk, &qiov, &offset, flags, &total);
> > +    if (ret < 0) {
> > +        printf("zone append failed: %s\n", strerror(-ret));
> > +        goto out;
> > +    }
> > +
> > +    out:
> > +    qemu_iovec_destroy(&qiov);
> > +    qemu_io_free(buf);
> > +    return ret;
> > +}
> > +
> > +static const cmdinfo_t zone_append_cmd =3D {
> > +        .name =3D "zone_append",
> > +        .altname =3D "zap",
> > +        .cfunc =3D zone_append_f,
> > +        .argmin =3D 3,
> > +        .argmax =3D 3,
> > +        .args =3D "offset len [len..]",
> > +        .oneline =3D "append write a number of bytes at a specified of=
fset",
> > +};
> > +
> >  static int truncate_f(BlockBackend *blk, int argc, char **argv);
> >  static const cmdinfo_t truncate_cmd =3D {
> >      .name       =3D "truncate",
> > @@ -2647,6 +2708,7 @@ static void __attribute((constructor)) init_qemui=
o_commands(void)
> >      qemuio_add_command(&zone_close_cmd);
> >      qemuio_add_command(&zone_finish_cmd);
> >      qemuio_add_command(&zone_reset_cmd);
> > +    qemuio_add_command(&zone_append_cmd);
> >      qemuio_add_command(&truncate_cmd);
> >      qemuio_add_command(&length_cmd);
> >      qemuio_add_command(&info_cmd);
> > diff --git a/tests/qemu-iotests/tests/zoned.out b/tests/qemu-iotests/te=
sts/zoned.out
> > index 0c8f96deb9..b3b139b4ec 100644
> > --- a/tests/qemu-iotests/tests/zoned.out
> > +++ b/tests/qemu-iotests/tests/zoned.out
> > @@ -50,4 +50,11 @@ start: 0x80000, len 0x80000, cap 0x80000, wptr 0x100=
000, zcond:14, [type: 2]
> >  (5) resetting the second zone
> >  After resetting a zone:
> >  start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80000, zcond:1, [type=
: 2]
> > +
> > +
> > +(6) append write
> > +After appending the first zone:
> > +start: 0x0, len 0x80000, cap 0x80000, wptr 0x18, zcond:2, [type: 2]
> > +After appending the second zone:
> > +start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80018, zcond:2, [type=
: 2]
> >  *** done
> > diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-iotests/tes=
ts/zoned.sh
> > index 871f47efed..b4dc89aaac 100755
> > --- a/tests/qemu-iotests/tests/zoned.sh
> > +++ b/tests/qemu-iotests/tests/zoned.sh
> > @@ -79,6 +79,15 @@ echo "(5) resetting the second zone"
> >  sudo $QEMU_IO $IMG -c "zrs 268435456 268435456"
> >  echo "After resetting a zone:"
> >  sudo $QEMU_IO $IMG -c "zrp 268435456 1"
> > +echo
> > +echo
> > +echo "(6) append write" # assuming block size of device is 4096
> > +sudo $QEMU_IO $IMG -c "zap 0 0x1000 0x2000"
> > +echo "After appending the first zone:"
> > +sudo $QEMU_IO $IMG -c "zrp 0 1"
> > +sudo $QEMU_IO $IMG -c "zap 268435456 0x1000 0x2000"
> > +echo "After appending the second zone:"
> > +sudo $QEMU_IO $IMG -c "zrp 268435456 1"
> >  # success, all done
> >  echo "*** done"
> >  rm -f $seq.full
>
> --
> Damien Le Moal
> Western Digital Research
>

