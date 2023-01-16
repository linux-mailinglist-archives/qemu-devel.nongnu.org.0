Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDD066BD54
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 12:56:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHO4l-0005Ho-Pv; Mon, 16 Jan 2023 06:54:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pHO4h-0005HL-ON; Mon, 16 Jan 2023 06:54:51 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pHO4f-00043E-3P; Mon, 16 Jan 2023 06:54:51 -0500
Received: by mail-ej1-x62c.google.com with SMTP id mp20so20911721ejc.7;
 Mon, 16 Jan 2023 03:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lew4vyxLyB5087XpPh651+93ttH0FYaxY13Xm6E8Vf0=;
 b=G5GCyLlYoN2wSV3XYDCowLyE2exvMfsXajdKlU8DOJ1WG7JTG/rUGTCRCY7R+sY6q/
 CVscxrAkLhPQWhCKCYY2mAlFDCh43CcrVCKoAwH7XQKgMuS8ELAJ7e5kXAxoFIxm71jR
 pFjvSouipzVCA2PeMxAuId1PC1GQdA2OSCszF/hpmhxFi6PvVNiBWOz9AclOrln1+G9i
 42nUE2lWauIdTgudh/YQaR+3ZfqGD5UQmXaMIK0u2vLS81+FKV7m/nLyedWq9qTd6tFq
 g4NxQ2B7/ajbNAOSDHopk83gQlWV8v101vlkq1YiteFRO2JM/Mmo7ESyyRrKmMxyOpfg
 VYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lew4vyxLyB5087XpPh651+93ttH0FYaxY13Xm6E8Vf0=;
 b=BE8rUjKdaxT9SGcRBaVi2aPIWvvqBuwUegk7woEeMaYq0AXTF1FgnNFh9NYG2oqmEd
 DGlWXdWV83CoLzBn6UGjwH8KnkHY05ThFYH0wWdQiWteQAU57XIas90g6LAG+dz2Rbsj
 MxTM2bN2HhEcW0txK7rEzU8m9Y4g07AgyJblDI66QSu+T1y9KKKj8quJS2c8BQQ0k4XX
 uwnqErrMB+5YpHjkWtq9vuyO6lDdXJ7PK5GMEcW/5XbsIUsrEcWZddj/jzmAwppMsQv2
 xTZzm+ShrkD30IVeuS5Vpu7UKsmOAwNsEaDDzK5FXU1BJEvML67Q/oYXme2ERbd3wXh3
 6SFg==
X-Gm-Message-State: AFqh2koYmo/fJAXOOfZrn8yTQSd7JRGASnGPEnagJgW82eueQ86WqN2x
 izebt2ol/gKXpvSs3oRQQnK4a+2EFplZaq9naW5r7P2by53eDA==
X-Google-Smtp-Source: AMrXdXtkISrLQFqtmZjA7gvJQUofXY4406c/u+NBdrx5rraSxXRz9LB5SsqPXhjtliukw3iscu+3lPW0bYNq5DMbuoM=
X-Received: by 2002:a17:907:9919:b0:870:8e12:81e2 with SMTP id
 ka25-20020a170907991900b008708e1281e2mr188230ejc.515.1673870085260; Mon, 16
 Jan 2023 03:54:45 -0800 (PST)
MIME-Version: 1.0
References: <20221027155215.21374-1-faithilikerun@gmail.com>
 <20221027155215.21374-2-faithilikerun@gmail.com>
In-Reply-To: <20221027155215.21374-2-faithilikerun@gmail.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Mon, 16 Jan 2023 19:54:17 +0800
Message-ID: <CAAAx-8L=kLQY0gUTq-orWCKW4VBbZTEiSk-GXv5nouoAXXsPWg@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] file-posix: add tracking of the zone write pointers
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Stefano Garzarella <sgarzare@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dmitry.fomichev@wdc.com,
 qemu-block@nongnu.org, 
 Julia Suvorova <jusual@redhat.com>, hare@suse.de, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Aarushi Mehta <mehta.aaru20@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=faithilikerun@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Sam Li <faithilikerun@gmail.com> =E4=BA=8E2022=E5=B9=B410=E6=9C=8827=E6=97=
=A5=E5=91=A8=E5=9B=9B 23:52=E5=86=99=E9=81=93=EF=BC=9A
>
> Since Linux doesn't have a user API to issue zone append operations to
> zoned devices from user space, the file-posix driver is modified to add
> zone append emulation using regular writes. To do this, the file-posix
> driver tracks the wp location of all zones of the device. It uses an
> array of uint64_t. The most significant bit of each wp location indicates
> if the zone type is conventional zones.
>
> The zones wp can be changed due to the following operations issued:
> - zone reset: change the wp to the start offset of that zone
> - zone finish: change to the end location of that zone
> - write to a zone
> - zone append
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/file-posix.c               | 153 ++++++++++++++++++++++++++++++-
>  include/block/block-common.h     |  14 +++
>  include/block/block_int-common.h |   3 +
>  3 files changed, 166 insertions(+), 4 deletions(-)
>
> diff --git a/block/file-posix.c b/block/file-posix.c
> index fe52e91da4..fbab23f450 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1323,6 +1323,77 @@ static int hdev_get_max_segments(int fd, struct st=
at *st)
>  #endif
>  }
>
> +#if defined(CONFIG_BLKZONED)
> +static int get_zones_wp(int fd, BlockZoneWps *wps, int64_t offset,
> +                        unsigned int nrz) {
> +    struct blk_zone *blkz;
> +    size_t rep_size;
> +    uint64_t sector =3D offset >> BDRV_SECTOR_BITS;
> +    int ret, n =3D 0, i =3D 0;
> +    rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struct bl=
k_zone);
> +    g_autofree struct blk_zone_report *rep =3D NULL;
> +
> +    rep =3D g_malloc(rep_size);
> +    blkz =3D (struct blk_zone *)(rep + 1);
> +    while (n < nrz) {
> +        memset(rep, 0, rep_size);
> +        rep->sector =3D sector;
> +        rep->nr_zones =3D nrz - n;
> +
> +        do {
> +            ret =3D ioctl(fd, BLKREPORTZONE, rep);
> +        } while (ret !=3D 0 && errno =3D=3D EINTR);
> +        if (ret !=3D 0) {
> +            error_report("%d: ioctl BLKREPORTZONE at %" PRId64 " failed =
%d",
> +                    fd, offset, errno);
> +            return -errno;
> +        }
> +
> +        if (!rep->nr_zones) {
> +            break;
> +        }
> +
> +        for (i =3D 0; i < rep->nr_zones; i++, n++) {
> +            /*
> +             * The wp tracking cares only about sequential writes requir=
ed and
> +             * sequential write preferred zones so that the wp can advan=
ce to
> +             * the right location.
> +             * Use the most significant bit of the wp location to indica=
te the
> +             * zone type: 0 for SWR/SWP zones and 1 for conventional zon=
es.
> +             */
> +            if (blkz[i].type =3D=3D BLK_ZONE_TYPE_CONVENTIONAL) {
> +                wps->wp[i] =3D 1ULL << 63;
> +            } else {
> +                switch(blkz[i].cond) {
> +                case BLK_ZONE_COND_FULL:
> +                case BLK_ZONE_COND_READONLY:
> +                    /* Zone not writable */
> +                    wps->wp[i] =3D (blkz[i].start + blkz[i].len) << BDRV=
_SECTOR_BITS;
> +                    break;
> +                case BLK_ZONE_COND_OFFLINE:
> +                    /* Zone not writable nor readable */
> +                    wps->wp[i] =3D (blkz[i].start) << BDRV_SECTOR_BITS;
> +                    break;
> +                default:
> +                    wps->wp[i] =3D blkz[i].wp << BDRV_SECTOR_BITS;
> +                    break;
> +                }
> +            }
> +        }
> +        sector =3D blkz[i - 1].start + blkz[i - 1].len;
> +    }
> +
> +    return 0;
> +}
> +
> +static void update_zones_wp(int fd, BlockZoneWps *wps, int64_t offset,
> +                            unsigned int nrz) {
> +    if (get_zones_wp(fd, wps, offset, nrz) < 0) {
> +        error_report("update zone wp failed");
> +    }
> +}
> +#endif
> +
>  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
>      BDRVRawState *s =3D bs->opaque;
> @@ -1412,6 +1483,15 @@ static void raw_refresh_limits(BlockDriverState *b=
s, Error **errp)
>          if (ret >=3D 0) {
>              bs->bl.max_active_zones =3D ret;
>          }
> +
> +        bs->bl.wps =3D g_malloc(sizeof(BlockZoneWps) + sizeof(int64_t) *=
 ret);
> +        ret =3D get_zones_wp(s->fd, bs->bl.wps, 0, bs->bl.nr_zones);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "report wps failed");
> +            g_free(bs->bl.wps);
> +            return;
> +        }
> +        qemu_co_mutex_init(&bs->bl.wps->colock);
>          return;
>      }
>  out:
> @@ -2339,9 +2419,15 @@ static int coroutine_fn raw_co_prw(BlockDriverStat=
e *bs, uint64_t offset,
>  {
>      BDRVRawState *s =3D bs->opaque;
>      RawPosixAIOData acb;
> +    int ret;
>
>      if (fd_open(bs) < 0)
>          return -EIO;
> +#if defined(CONFIG_BLKZONED)
> +    if (bs->bl.wps) {
> +        qemu_co_mutex_lock(&bs->bl.wps->colock);
> +    }
> +#endif
>
>      /*
>       * When using O_DIRECT, the request must be aligned to be able to us=
e
> @@ -2355,14 +2441,16 @@ static int coroutine_fn raw_co_prw(BlockDriverSta=
te *bs, uint64_t offset,
>      } else if (s->use_linux_io_uring) {
>          LuringState *aio =3D aio_get_linux_io_uring(bdrv_get_aio_context=
(bs));
>          assert(qiov->size =3D=3D bytes);
> -        return luring_co_submit(bs, aio, s->fd, offset, qiov, type);
> +        ret =3D luring_co_submit(bs, aio, s->fd, offset, qiov, type);
> +        goto out;
>  #endif
>  #ifdef CONFIG_LINUX_AIO
>      } else if (s->use_linux_aio) {
>          LinuxAioState *aio =3D aio_get_linux_aio(bdrv_get_aio_context(bs=
));
>          assert(qiov->size =3D=3D bytes);
> -        return laio_co_submit(bs, aio, s->fd, offset, qiov, type,
> +        ret =3D laio_co_submit(bs, aio, s->fd, offset, qiov, type,
>                                s->aio_max_batch);
> +        goto out;
>  #endif
>      }
>
> @@ -2379,7 +2467,32 @@ static int coroutine_fn raw_co_prw(BlockDriverStat=
e *bs, uint64_t offset,
>      };
>
>      assert(qiov->size =3D=3D bytes);
> -    return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
> +    ret =3D raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
> +
> +out:
> +#if defined(CONFIG_BLKZONED)
> +    BlockZoneWps *wps =3D bs->bl.wps;
> +    if (ret =3D=3D 0) {
> +        if (type & QEMU_AIO_WRITE && wps && bs->bl.zone_size) {
> +            int index =3D offset / bs->bl.zone_size;
> +            if (!BDRV_ZT_IS_CONV(wps->wp[index])) {
> +                /* Advance the wp if needed */
> +                if (offset + bytes > wps->wp[index]) {
> +                    wps->wp[index] =3D offset + bytes;
> +                }
> +            }
> +        }
> +    } else {
> +        if (type & QEMU_AIO_WRITE) {
> +            update_zones_wp(s->fd, bs->bl.wps, 0, 1);
> +        }
> +    }
> +
> +    if (wps) {
> +        qemu_co_mutex_unlock(&wps->colock);
> +    }
> +#endif
> +    return ret;
>  }
>
>  static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offs=
et,
> @@ -2488,6 +2601,11 @@ static void raw_close(BlockDriverState *bs)
>      BDRVRawState *s =3D bs->opaque;
>
>      if (s->fd >=3D 0) {
> +#if defined(CONFIG_BLKZONED)
> +        if (bs->bl.wps) {
> +            g_free(bs->bl.wps);
> +        }
> +#endif
>          qemu_close(s->fd);
>          s->fd =3D -1;
>      }
> @@ -3288,6 +3406,7 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDrive=
rState *bs, BlockZoneOp op,
>      const char *op_name;
>      unsigned long zo;
>      int ret;
> +    BlockZoneWps *wps =3D bs->bl.wps;
>      int64_t capacity =3D bs->total_sectors << BDRV_SECTOR_BITS;
>
>      zone_size =3D bs->bl.zone_size;
> @@ -3305,6 +3424,14 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriv=
erState *bs, BlockZoneOp op,
>          return -EINVAL;
>      }
>
> +    qemu_co_mutex_lock(&wps->colock);
> +    uint32_t index =3D offset / bs->bl.zone_size;
> +    if (BDRV_ZT_IS_CONV(wps->wp[index]) && len !=3D capacity) {
> +        error_report("zone mgmt operations are not allowed for conventio=
nal zones");
> +        ret =3D -EIO;
> +        goto out;
> +    }
> +
>      switch (op) {
>      case BLK_ZO_OPEN:
>          op_name =3D "BLKOPENZONE";
> @@ -3324,7 +3451,8 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDrive=
rState *bs, BlockZoneOp op,
>          break;
>      default:
>          error_report("Unsupported zone op: 0x%x", op);
> -        return -ENOTSUP;
> +        ret =3D -ENOTSUP;
> +        goto out;
>      }
>
>      acb =3D (RawPosixAIOData) {
> @@ -3342,10 +3470,27 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDri=
verState *bs, BlockZoneOp op,
>                          len >> BDRV_SECTOR_BITS);
>      ret =3D raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
>      if (ret !=3D 0) {
> +        update_zones_wp(s->fd, wps, offset, index);
>          ret =3D -errno;
>          error_report("ioctl %s failed %d", op_name, ret);
> +        goto out;
>      }
>
> +    if (zo =3D=3D BLKRESETZONE && len =3D=3D capacity) {
> +        for (int i =3D 0; i < bs->bl.nr_zones; ++i) {
> +            if (!BDRV_ZT_IS_CONV(wps->wp[index])) {

There is a bug in it. Reset_all request should reset all the wp of
sequential zones not just the index one. Accidentally, a zoned block
device composed of only sequential zones can pass the zone append
tests by luck. It is more evident when testing on another one composed
of both conventional zones and sequential zones where the zone append
write request skipped the first sequential zone and returned the wrong
append sector.

It should be :
+ if (!BDRV_ZT_IS_CONV(wps->wp[i])) {


> +                wps->wp[i] =3D i * bs->bl.zone_size;
> +            }
> +        }
> +    } else if (zo =3D=3D BLKRESETZONE) {
> +        wps->wp[index] =3D offset;
> +    } else if (zo =3D=3D BLKFINISHZONE) {
> +        /* The zoned device allows the last zone smaller that the zone s=
ize. */
> +        wps->wp[index] =3D offset + len;
> +    }
> +
> +out:
> +    qemu_co_mutex_unlock(&wps->colock);
>      return ret;
>  }
>  #endif
> diff --git a/include/block/block-common.h b/include/block/block-common.h
> index 4025df380e..1abd0d5b65 100644
> --- a/include/block/block-common.h
> +++ b/include/block/block-common.h
> @@ -92,6 +92,14 @@ typedef struct BlockZoneDescriptor {
>      BlockZoneState state;
>  } BlockZoneDescriptor;
>
> +/*
> + * Track write pointers of a zone in bytes.
> + */
> +typedef struct BlockZoneWps {
> +    CoMutex colock;
> +    uint64_t wp[];
> +} BlockZoneWps;
> +
>  typedef struct BlockDriverInfo {
>      /* in bytes, 0 if irrelevant */
>      int cluster_size;
> @@ -205,6 +213,12 @@ typedef enum {
>  #define BDRV_SECTOR_BITS   9
>  #define BDRV_SECTOR_SIZE   (1ULL << BDRV_SECTOR_BITS)
>
> +/*
> + * Get the first most significant bit of wp. If it is zero, then
> + * the zone type is SWR.
> + */
> +#define BDRV_ZT_IS_CONV(wp)    (wp & (1ULL << 63))
> +
>  #define BDRV_REQUEST_MAX_SECTORS MIN_CONST(SIZE_MAX >> BDRV_SECTOR_BITS,=
 \
>                                             INT_MAX >> BDRV_SECTOR_BITS)
>  #define BDRV_REQUEST_MAX_BYTES (BDRV_REQUEST_MAX_SECTORS << BDRV_SECTOR_=
BITS)
> diff --git a/include/block/block_int-common.h b/include/block/block_int-c=
ommon.h
> index 2c057a9980..4effff3aa1 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -854,6 +854,9 @@ typedef struct BlockLimits {
>
>      /* maximum number of active zones */
>      int64_t max_active_zones;
> +
> +    /* array of write pointers' location of each zone in the zoned devic=
e. */
> +    BlockZoneWps *wps;
>  } BlockLimits;
>
>  typedef struct BdrvOpBlocker BdrvOpBlocker;
> --
> 2.38.1
>

