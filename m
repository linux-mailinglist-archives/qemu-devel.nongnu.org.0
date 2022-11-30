Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D0A63CD11
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 03:02:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0CPv-000787-Ar; Tue, 29 Nov 2022 21:01:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p0CPt-00077g-6F; Tue, 29 Nov 2022 21:01:41 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p0CPn-0006fI-J5; Tue, 29 Nov 2022 21:01:38 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-3b48b139b46so157270237b3.12; 
 Tue, 29 Nov 2022 18:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CS4I2CfbxHtxKV9/ID96W2jCQmavsXDtLV1qNNL7nqc=;
 b=j9G54EnHOlLNKzlK7mzbWHM/wR+Hch65CI8HgqhGqpery7IWx114xMkkMb0TGk94c+
 s15d40TffvXL5A5mdSFofbQmxGwoYt1JiPZYzc6s8uQtlI14Uk5l/iWTKZI6Ux9SWh+L
 biPMYapQgcg84L2FEFAVVnerdCS25woNtDqOqAkqFEHNKzgAqp6pqXANObvZpUSEOfjs
 07LPghytsM1aPrcgBvWc9s5wV7rYjT3cALlIW7QQLZ8+zzycdIw91y29DDJixac2fPu7
 oBtq6qx9X+sO6f5cYPbLUcOPzNSFx4VObdCJSf1yu7V9tte7bKcbB79hSOQk6pJvXRl/
 w2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CS4I2CfbxHtxKV9/ID96W2jCQmavsXDtLV1qNNL7nqc=;
 b=15zEeqDx7Y0rVoyqbhqVkCVZltiI4+j8HnuzwHPntojDzsfLisycTKfTo5yJt4Krv5
 BUrey9asK1O86th7lK2WoOTlwIRb7inWYdKJPPt2AMWNi4XE1bqylsqgwStm/0h+3lJF
 ZsLVmj+WxFIGpYsew1jDCtnH8/LLsC9jp2mvT/SL2WhdRfE/4zUxzJqVLtNFAjjpcz1h
 l7hgDo92fDxQnP8TS9GdLx4RcZU041xAsWYjgMcJAisfUdHI7p2xROn3swCAxNyXPhGX
 lVY2VMJ1iGOGJe0Phe9IskZV8R+4zEmwIwzzVKnzpJTojQ0fB+k7LaDMUsKqnMRUAb5s
 9qew==
X-Gm-Message-State: ANoB5pnzsNeNVdAWedjbycGw8Wq2wGuuDGeHmoLYX+xCB8QQuHpPrqrQ
 NZuW7sI/DOSihYOtRxjLTVMs8wmZgwX3xXxMjVo=
X-Google-Smtp-Source: AA0mqf7WB/lCChsvnVyZY2h1NGN9QBnGeiBAp1qXPtUy9Ik8BWL8F6OUONG4Bn0T3DDCYrCyfx9csjtssIxJQmkjBiA=
X-Received: by 2002:a81:1d84:0:b0:3ce:492c:ae78 with SMTP id
 d126-20020a811d84000000b003ce492cae78mr7466146ywd.62.1669773693559; Tue, 29
 Nov 2022 18:01:33 -0800 (PST)
MIME-Version: 1.0
References: <20221027154504.20684-1-faithilikerun@gmail.com>
 <20221027154504.20684-4-faithilikerun@gmail.com>
In-Reply-To: <20221027154504.20684-4-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 29 Nov 2022 21:01:21 -0500
Message-ID: <CAJSP0QUSQ8MjkGn5SWRPbN+G+xoQH-Htm3BGCMOX_LV9Of=7Og@mail.gmail.com>
Subject: Re: [PATCH v13 3/8] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, 
 damien.lemoal@opensource.wdc.com, qemu-block@nongnu.org, stefanha@redhat.com, 
 Markus Armbruster <armbru@redhat.com>, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, 
 dmitry.fomichev@wdc.com, Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1132.google.com
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

On Thu, 27 Oct 2022 at 11:46, Sam Li <faithilikerun@gmail.com> wrote:
>
> Add a new zoned_host_device BlockDriver. The zoned_host_device option
> accepts only zoned host block devices. By adding zone management
> operations in this new BlockDriver, users can use the new block
> layer APIs including Report Zone and four zone management operations
> (open, close, finish, reset, reset_all).
>
> Qemu-io uses the new APIs to perform zoned storage commands of the device:
> zone_report(zrp), zone_open(zo), zone_close(zc), zone_reset(zrs),
> zone_finish(zf).
>
> For example, to test zone_report, use following command:
> $ ./build/qemu-io --image-opts -n driver=zoned_host_device, filename=/dev/nullb0
> -c "zrp offset nr_zones"
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> ---
>  block/block-backend.c             | 147 +++++++++++++
>  block/file-posix.c                | 348 ++++++++++++++++++++++++++++++
>  block/io.c                        |  41 ++++
>  include/block/block-io.h          |   7 +
>  include/block/block_int-common.h  |  21 ++
>  include/block/raw-aio.h           |   6 +-
>  include/sysemu/block-backend-io.h |  18 ++
>  meson.build                       |   4 +
>  qapi/block-core.json              |   8 +-
>  qemu-io-cmds.c                    | 149 +++++++++++++
>  10 files changed, 746 insertions(+), 3 deletions(-)
>
> diff --git a/block/block-backend.c b/block/block-backend.c
> index aa4adf06ae..731f23e816 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1431,6 +1431,15 @@ typedef struct BlkRwCo {
>      void *iobuf;
>      int ret;
>      BdrvRequestFlags flags;
> +    union {
> +        struct {
> +            unsigned int *nr_zones;
> +            BlockZoneDescriptor *zones;
> +        } zone_report;
> +        struct {
> +            unsigned long op;
> +        } zone_mgmt;
> +    };
>  } BlkRwCo;
>
>  int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags)
> @@ -1775,6 +1784,144 @@ int coroutine_fn blk_co_flush(BlockBackend *blk)
>      return ret;
>  }
>
> +static void coroutine_fn blk_aio_zone_report_entry(void *opaque)
> +{
> +    BlkAioEmAIOCB *acb = opaque;
> +    BlkRwCo *rwco = &acb->rwco;
> +
> +    rwco->ret = blk_co_zone_report(rwco->blk, rwco->offset,
> +                                   rwco->zone_report.nr_zones,
> +                                   rwco->zone_report.zones);
> +    blk_aio_complete(acb);
> +}
> +
> +BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, int64_t offset,
> +                                unsigned int *nr_zones,
> +                                BlockZoneDescriptor  *zones,
> +                                BlockCompletionFunc *cb, void *opaque)
> +{
> +    BlkAioEmAIOCB *acb;
> +    Coroutine *co;
> +    IO_CODE();
> +
> +    blk_inc_in_flight(blk);
> +    acb = blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
> +    acb->rwco = (BlkRwCo) {
> +        .blk    = blk,
> +        .offset = offset,
> +        .ret    = NOT_DONE,
> +        .zone_report = {
> +            .zones = zones,
> +            .nr_zones = nr_zones,
> +        },
> +    };
> +    acb->has_returned = false;
> +
> +    co = qemu_coroutine_create(blk_aio_zone_report_entry, acb);
> +    bdrv_coroutine_enter(blk_bs(blk), co);
> +
> +    acb->has_returned = true;
> +    if (acb->rwco.ret != NOT_DONE) {
> +        replay_bh_schedule_oneshot_event(blk_get_aio_context(blk),
> +                                         blk_aio_complete_bh, acb);
> +    }
> +
> +    return &acb->common;
> +}
> +
> +static void coroutine_fn blk_aio_zone_mgmt_entry(void *opaque)
> +{
> +    BlkAioEmAIOCB *acb = opaque;
> +    BlkRwCo *rwco = &acb->rwco;
> +
> +    rwco->ret = blk_co_zone_mgmt(rwco->blk, rwco->zone_mgmt.op,
> +                                 rwco->offset, acb->bytes);
> +    blk_aio_complete(acb);
> +}
> +
> +BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> +                              int64_t offset, int64_t len,
> +                              BlockCompletionFunc *cb, void *opaque) {
> +    BlkAioEmAIOCB *acb;
> +    Coroutine *co;
> +    IO_CODE();
> +
> +    blk_inc_in_flight(blk);
> +    acb = blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
> +    acb->rwco = (BlkRwCo) {
> +        .blk    = blk,
> +        .offset = offset,
> +        .ret    = NOT_DONE,
> +        .zone_mgmt = {
> +            .op = op,
> +        },
> +    };
> +    acb->bytes = len;
> +    acb->has_returned = false;
> +
> +    co = qemu_coroutine_create(blk_aio_zone_mgmt_entry, acb);
> +    bdrv_coroutine_enter(blk_bs(blk), co);
> +
> +    acb->has_returned = true;
> +    if (acb->rwco.ret != NOT_DONE) {
> +        replay_bh_schedule_oneshot_event(blk_get_aio_context(blk),
> +                                         blk_aio_complete_bh, acb);
> +    }
> +
> +    return &acb->common;
> +}
> +
> +/*
> + * Send a zone_report command.
> + * offset is a byte offset from the start of the device. No alignment
> + * required for offset.
> + * nr_zones represents IN maximum and OUT actual.
> + */
> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
> +                                    unsigned int *nr_zones,
> +                                    BlockZoneDescriptor *zones)
> +{
> +    int ret;
> +    IO_CODE();
> +
> +    blk_inc_in_flight(blk); /* increase before waiting */
> +    blk_wait_while_drained(blk);
> +    if (!blk_is_available(blk)) {
> +        blk_dec_in_flight(blk);
> +        return -ENOMEDIUM;
> +    }
> +    ret = bdrv_co_zone_report(blk_bs(blk), offset, nr_zones, zones);
> +    blk_dec_in_flight(blk);
> +    return ret;
> +}
> +
> +/*
> + * Send a zone_management command.
> + * op is the zone operation;
> + * offset is the byte offset from the start of the zoned device;
> + * len is the maximum number of bytes the command should operate on. It
> + * should be aligned with the device zone size.
> + */
> +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> +        int64_t offset, int64_t len)
> +{
> +    int ret;
> +    IO_CODE();
> +
> +    blk_inc_in_flight(blk);
> +    blk_wait_while_drained(blk);
> +
> +    ret = blk_check_byte_request(blk, offset, len);
> +    if (ret < 0) {
> +        blk_dec_in_flight(blk);
> +        return ret;
> +    }
> +
> +    ret = bdrv_co_zone_mgmt(blk_bs(blk), op, offset, len);
> +    blk_dec_in_flight(blk);
> +    return ret;
> +}
> +
>  void blk_drain(BlockBackend *blk)
>  {
>      BlockDriverState *bs = blk_bs(blk);
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 8cb07fdb8a..5f56526348 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -67,6 +67,9 @@
>  #include <sys/param.h>
>  #include <sys/syscall.h>
>  #include <sys/vfs.h>
> +#if defined(CONFIG_BLKZONED)
> +#include <linux/blkzoned.h>
> +#endif
>  #include <linux/cdrom.h>
>  #include <linux/fd.h>
>  #include <linux/fs.h>
> @@ -215,6 +218,13 @@ typedef struct RawPosixAIOData {
>              PreallocMode prealloc;
>              Error **errp;
>          } truncate;
> +        struct {
> +            unsigned int *nr_zones;
> +            BlockZoneDescriptor *zones;
> +        } zone_report;
> +        struct {
> +            unsigned long op;
> +        } zone_mgmt;
>      };
>  } RawPosixAIOData;
>
> @@ -1350,6 +1360,50 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>          zoned = BLK_Z_NONE;
>      }
>      bs->bl.zoned = zoned;
> +    if (zoned != BLK_Z_NONE) {
> +        /*
> +         * The zoned device must at least have zone size and nr_zones fields.
> +         */
> +        ret = get_sysfs_long_val(&st, "chunk_sectors");
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "Unable to read chunk_sectors "
> +                                         "sysfs attribute");
> +            goto out;
> +        } else if (!ret) {
> +            error_setg(errp, "Read 0 from chunk_sectors sysfs attribute");
> +            goto out;
> +        }
> +        bs->bl.zone_size = ret << BDRV_SECTOR_BITS;
> +
> +        ret = get_sysfs_long_val(&st, "nr_zones");
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "Unable to read nr_zones "
> +                                         "sysfs attribute");
> +            goto out;
> +        } else if (!ret) {
> +            error_setg(errp, "Read 0 from nr_zones sysfs attribute");
> +            goto out;
> +        }
> +        bs->bl.nr_zones = ret;
> +
> +        ret = get_sysfs_long_val(&st, "zone_append_max_bytes");
> +        if (ret > 0) {
> +            bs->bl.max_append_sectors = ret >> BDRV_SECTOR_BITS;
> +        }
> +
> +        ret = get_sysfs_long_val(&st, "max_open_zones");
> +        if (ret >= 0) {
> +            bs->bl.max_open_zones = ret;
> +        }
> +
> +        ret = get_sysfs_long_val(&st, "max_active_zones");
> +        if (ret >= 0) {
> +            bs->bl.max_active_zones = ret;
> +        }
> +        return;
> +    }
> +out:
> +    bs->bl.zoned = BLK_Z_NONE;
>  }
>
>  static int check_for_dasd(int fd)
> @@ -1374,9 +1428,11 @@ static int hdev_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz)
>      int ret;
>
>      /* If DASD, get blocksizes */
> +#ifndef CONFIG_BLKZONED
>      if (check_for_dasd(s->fd) < 0) {
>          return -ENOTSUP;
>      }
> +#endif

What is the purpose of this #ifndef? .bdrv_probe_blocksizes() should
only return block sizes for s390 DASD devices. I don't think zoned
storage needs block size probing here.

>      ret = probe_logical_blocksize(s->fd, &bsz->log);
>      if (ret < 0) {
>          return ret;
> @@ -1844,6 +1900,146 @@ static off_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
>  }
>  #endif
>
> +/*
> + * parse_zone - Fill a zone descriptor
> + */
> +#if defined(CONFIG_BLKZONED)
> +static inline int parse_zone(struct BlockZoneDescriptor *zone,
> +                              const struct blk_zone *blkz) {
> +    zone->start = blkz->start << BDRV_SECTOR_BITS;
> +    zone->length = blkz->len << BDRV_SECTOR_BITS;
> +    zone->wp = blkz->wp << BDRV_SECTOR_BITS;
> +
> +#ifdef HAVE_BLK_ZONE_REP_CAPACITY
> +    zone->cap = blkz->capacity << BDRV_SECTOR_BITS;
> +#else
> +    zone->cap = blkz->len << BDRV_SECTOR_BITS;
> +#endif
> +
> +    switch (blkz->type) {
> +    case BLK_ZONE_TYPE_SEQWRITE_REQ:
> +        zone->type = BLK_ZT_SWR;
> +        break;
> +    case BLK_ZONE_TYPE_SEQWRITE_PREF:
> +        zone->type = BLK_ZT_SWP;
> +        break;
> +    case BLK_ZONE_TYPE_CONVENTIONAL:
> +        zone->type = BLK_ZT_CONV;
> +        break;
> +    default:
> +        error_report("Unsupported zone type: 0x%x", blkz->type);
> +        return -ENOTSUP;
> +    }
> +
> +    switch (blkz->cond) {
> +    case BLK_ZONE_COND_NOT_WP:
> +        zone->state = BLK_ZS_NOT_WP;
> +        break;
> +    case BLK_ZONE_COND_EMPTY:
> +        zone->state = BLK_ZS_EMPTY;
> +        break;
> +    case BLK_ZONE_COND_IMP_OPEN:
> +        zone->state = BLK_ZS_IOPEN;
> +        break;
> +    case BLK_ZONE_COND_EXP_OPEN:
> +        zone->state = BLK_ZS_EOPEN;
> +        break;
> +    case BLK_ZONE_COND_CLOSED:
> +        zone->state = BLK_ZS_CLOSED;
> +        break;
> +    case BLK_ZONE_COND_READONLY:
> +        zone->state = BLK_ZS_RDONLY;
> +        break;
> +    case BLK_ZONE_COND_FULL:
> +        zone->state = BLK_ZS_FULL;
> +        break;
> +    case BLK_ZONE_COND_OFFLINE:
> +        zone->state = BLK_ZS_OFFLINE;
> +        break;
> +    default:
> +        error_report("Unsupported zone state: 0x%x", blkz->cond);
> +        return -ENOTSUP;
> +    }
> +    return 0;
> +}
> +#endif
> +
> +#if defined(CONFIG_BLKZONED)
> +static int handle_aiocb_zone_report(void *opaque)
> +{
> +    RawPosixAIOData *aiocb = opaque;
> +    int fd = aiocb->aio_fildes;
> +    unsigned int *nr_zones = aiocb->zone_report.nr_zones;
> +    BlockZoneDescriptor *zones = aiocb->zone_report.zones;
> +    /* zoned block devices use 512-byte sectors */
> +    uint64_t sector = aiocb->aio_offset / 512;
> +
> +    struct blk_zone *blkz;
> +    size_t rep_size;
> +    unsigned int nrz;
> +    int ret, n = 0, i = 0;
> +
> +    nrz = *nr_zones;
> +    rep_size = sizeof(struct blk_zone_report) + nrz * sizeof(struct blk_zone);
> +    g_autofree struct blk_zone_report *rep = NULL;
> +    rep = g_malloc(rep_size);
> +
> +    blkz = (struct blk_zone *)(rep + 1);
> +    while (n < nrz) {
> +        memset(rep, 0, rep_size);
> +        rep->sector = sector;
> +        rep->nr_zones = nrz - n;
> +
> +        do {
> +            ret = ioctl(fd, BLKREPORTZONE, rep);
> +        } while (ret != 0 && errno == EINTR);
> +        if (ret != 0) {
> +            error_report("%d: ioctl BLKREPORTZONE at %" PRId64 " failed %d",
> +                         fd, sector, errno);
> +            return -errno;
> +        }
> +
> +        if (!rep->nr_zones) {
> +            break;
> +        }
> +
> +        for (i = 0; i < rep->nr_zones; i++, n++) {
> +            ret = parse_zone(&zones[n], &blkz[i]);
> +            if (ret != 0) {
> +                return ret;
> +            }
> +
> +            /* The next report should start after the last zone reported */
> +            sector = blkz[i].start + blkz[i].len;
> +        }
> +    }
> +
> +    *nr_zones = n;
> +    return 0;
> +}
> +#endif
> +
> +#if defined(CONFIG_BLKZONED)
> +static int handle_aiocb_zone_mgmt(void *opaque)
> +{
> +    RawPosixAIOData *aiocb = opaque;
> +    int fd = aiocb->aio_fildes;
> +    uint64_t sector = aiocb->aio_offset / 512;
> +    int64_t nr_sectors = aiocb->aio_nbytes / 512;
> +    struct blk_zone_range range;
> +    int ret;
> +
> +    /* Execute the operation */
> +    range.sector = sector;
> +    range.nr_sectors = nr_sectors;
> +    do {
> +        ret = ioctl(fd, aiocb->zone_mgmt.op, &range);
> +    } while (ret != 0 && errno == EINTR);
> +
> +    return ret;

This should return a negative errno when an error has occurred:

  if (ret < 0) {
      return -errno;
  }
  return ret;

That way the caller (back in the thread that submitted this work item)
can get the errno value.

> +}
> +#endif
> +
>  static int handle_aiocb_copy_range(void *opaque)
>  {
>      RawPosixAIOData *aiocb = opaque;
> @@ -3038,6 +3234,107 @@ static void raw_account_discard(BDRVRawState *s, uint64_t nbytes, int ret)
>      }
>  }
>
> +/*
> + * zone report - Get a zone block device's information in the form
> + * of an array of zone descriptors.
> + * zones is an array of zone descriptors to hold zone information on reply;
> + * offset can be any byte within the entire size of the device;
> + * nr_zones is the maxium number of sectors the command should operate on.
> + */
> +#if defined(CONFIG_BLKZONED)
> +static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t offset,
> +                                           unsigned int *nr_zones,
> +                                           BlockZoneDescriptor *zones) {
> +    BDRVRawState *s = bs->opaque;
> +    RawPosixAIOData acb;
> +
> +    acb = (RawPosixAIOData) {
> +        .bs         = bs,
> +        .aio_fildes = s->fd,
> +        .aio_type   = QEMU_AIO_ZONE_REPORT,
> +        .aio_offset = offset,
> +        .zone_report    = {
> +            .nr_zones       = nr_zones,
> +            .zones          = zones,
> +        },
> +    };
> +
> +    return raw_thread_pool_submit(bs, handle_aiocb_zone_report, &acb);
> +}
> +#endif
> +
> +/*
> + * zone management operations - Execute an operation on a zone
> + */
> +#if defined(CONFIG_BLKZONED)
> +static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
> +        int64_t offset, int64_t len) {
> +    BDRVRawState *s = bs->opaque;
> +    RawPosixAIOData acb;
> +    int64_t zone_size, zone_size_mask;
> +    const char *op_name;
> +    unsigned long zo;
> +    int ret;
> +    int64_t capacity = bs->total_sectors << BDRV_SECTOR_BITS;
> +
> +    zone_size = bs->bl.zone_size;
> +    zone_size_mask = zone_size - 1;
> +    if (offset & zone_size_mask) {
> +        error_report("sector offset %" PRId64 " is not aligned to zone size "
> +                     "%" PRId64 "", offset / 512, zone_size / 512);
> +        return -EINVAL;
> +    }
> +
> +    if (((offset + len) < capacity && len & zone_size_mask) ||
> +        offset + len > capacity) {
> +        error_report("number of sectors %" PRId64 " is not aligned to zone size"
> +                      " %" PRId64 "", len / 512, zone_size / 512);
> +        return -EINVAL;
> +    }
> +
> +    switch (op) {
> +    case BLK_ZO_OPEN:
> +        op_name = "BLKOPENZONE";
> +        zo = BLKOPENZONE;
> +        break;
> +    case BLK_ZO_CLOSE:
> +        op_name = "BLKCLOSEZONE";
> +        zo = BLKCLOSEZONE;
> +        break;
> +    case BLK_ZO_FINISH:
> +        op_name = "BLKFINISHZONE";
> +        zo = BLKFINISHZONE;
> +        break;
> +    case BLK_ZO_RESET:
> +        op_name = "BLKRESETZONE";
> +        zo = BLKRESETZONE;
> +        break;
> +    default:
> +        error_report("Unsupported zone op: 0x%x", op);
> +        return -ENOTSUP;
> +    }
> +
> +    acb = (RawPosixAIOData) {
> +        .bs             = bs,
> +        .aio_fildes     = s->fd,
> +        .aio_type       = QEMU_AIO_ZONE_MGMT,
> +        .aio_offset     = offset,
> +        .aio_nbytes     = len,
> +        .zone_mgmt  = {
> +            .op = zo,
> +        },
> +    };
> +
> +    ret = raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
> +    if (ret != 0) {
> +        ret = -errno;

raw_thread_pool_submit() should return a negative errno, so there's no
need to do ret = -errno.

Also, the errno from handle_aiocb_zone_mgmt() isn't available to us
because we're running in a different thread. errno is thread-local
(each thread has its own errno value).

> +        error_report("ioctl %s failed %d", op_name, ret);
> +    }
> +
> +    return ret;
> +}
> +#endif
> +
>  static coroutine_fn int
>  raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
>                  bool blkdev)
> @@ -3768,6 +4065,54 @@ static BlockDriver bdrv_host_device = {
>  #endif
>  };
>
> +#if defined(CONFIG_BLKZONED)
> +static BlockDriver bdrv_zoned_host_device = {
> +    .format_name = "zoned_host_device",
> +    .protocol_name = "zoned_host_device",
> +    .instance_size = sizeof(BDRVRawState),
> +    .bdrv_needs_filename = true,
> +    .bdrv_probe_device  = hdev_probe_device,
> +    .bdrv_file_open     = hdev_open,
> +    .bdrv_close         = raw_close,
> +    .bdrv_reopen_prepare = raw_reopen_prepare,
> +    .bdrv_reopen_commit  = raw_reopen_commit,
> +    .bdrv_reopen_abort   = raw_reopen_abort,
> +    .bdrv_co_create_opts = bdrv_co_create_opts_simple,
> +    .create_opts         = &bdrv_create_opts_simple,
> +    .mutable_opts        = mutable_opts,
> +    .bdrv_co_invalidate_cache = raw_co_invalidate_cache,
> +    .bdrv_co_pwrite_zeroes = hdev_co_pwrite_zeroes,
> +
> +    .bdrv_co_preadv         = raw_co_preadv,
> +    .bdrv_co_pwritev        = raw_co_pwritev,
> +    .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
> +    .bdrv_co_pdiscard       = hdev_co_pdiscard,
> +    .bdrv_co_copy_range_from = raw_co_copy_range_from,
> +    .bdrv_co_copy_range_to  = raw_co_copy_range_to,
> +    .bdrv_refresh_limits = raw_refresh_limits,
> +    .bdrv_io_plug = raw_aio_plug,
> +    .bdrv_io_unplug = raw_aio_unplug,
> +    .bdrv_attach_aio_context = raw_aio_attach_aio_context,
> +
> +    .bdrv_co_truncate       = raw_co_truncate,
> +    .bdrv_getlength = raw_getlength,
> +    .bdrv_get_info = raw_get_info,
> +    .bdrv_get_allocated_file_size
> +                        = raw_get_allocated_file_size,
> +    .bdrv_get_specific_stats = hdev_get_specific_stats,
> +    .bdrv_check_perm = raw_check_perm,
> +    .bdrv_set_perm   = raw_set_perm,
> +    .bdrv_abort_perm_update = raw_abort_perm_update,
> +    .bdrv_probe_blocksizes = hdev_probe_blocksizes,
> +    .bdrv_probe_geometry = hdev_probe_geometry,
> +    .bdrv_co_ioctl = hdev_co_ioctl,
> +
> +    /* zone management operations */
> +    .bdrv_co_zone_report = raw_co_zone_report,
> +    .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
> +};
> +#endif
> +
>  #if defined(__linux__) || defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
>  static void cdrom_parse_filename(const char *filename, QDict *options,
>                                   Error **errp)
> @@ -4028,6 +4373,9 @@ static void bdrv_file_init(void)
>      bdrv_register(&bdrv_file);
>  #if defined(HAVE_HOST_BLOCK_DEVICE)
>      bdrv_register(&bdrv_host_device);
> +#if defined(CONFIG_BLKZONED)
> +    bdrv_register(&bdrv_zoned_host_device);
> +#endif
>  #ifdef __linux__
>      bdrv_register(&bdrv_host_cdrom);
>  #endif
> diff --git a/block/io.c b/block/io.c
> index d30073036e..88f707ea4d 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -3189,6 +3189,47 @@ out:
>      return co.ret;
>  }
>
> +int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
> +                        unsigned int *nr_zones,
> +                        BlockZoneDescriptor *zones)
> +{
> +    BlockDriver *drv = bs->drv;
> +    CoroutineIOCompletion co = {
> +            .coroutine = qemu_coroutine_self(),
> +    };
> +    IO_CODE();
> +
> +    bdrv_inc_in_flight(bs);
> +    if (!drv || !drv->bdrv_co_zone_report) {
> +        co.ret = -ENOTSUP;
> +        goto out;
> +    }
> +    co.ret = drv->bdrv_co_zone_report(bs, offset, nr_zones, zones);
> +out:
> +    bdrv_dec_in_flight(bs);
> +    return co.ret;
> +}
> +
> +int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
> +        int64_t offset, int64_t len)
> +{
> +    BlockDriver *drv = bs->drv;
> +    CoroutineIOCompletion co = {
> +            .coroutine = qemu_coroutine_self(),
> +    };
> +    IO_CODE();
> +
> +    bdrv_inc_in_flight(bs);
> +    if (!drv || !drv->bdrv_co_zone_mgmt) {
> +        co.ret = -ENOTSUP;
> +        goto out;
> +    }
> +    co.ret = drv->bdrv_co_zone_mgmt(bs, op, offset, len);
> +out:
> +    bdrv_dec_in_flight(bs);
> +    return co.ret;
> +}
> +
>  void *qemu_blockalign(BlockDriverState *bs, size_t size)
>  {
>      IO_CODE();
> diff --git a/include/block/block-io.h b/include/block/block-io.h
> index 492f95fc05..f0cdf67d33 100644
> --- a/include/block/block-io.h
> +++ b/include/block/block-io.h
> @@ -88,6 +88,13 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
>  /* Ensure contents are flushed to disk.  */
>  int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
>
> +/* Report zone information of zone block device. */
> +int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
> +                                     unsigned int *nr_zones,
> +                                     BlockZoneDescriptor *zones);
> +int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
> +                                   int64_t offset, int64_t len);
> +
>  int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
>  bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
>  int bdrv_block_status(BlockDriverState *bs, int64_t offset,
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index 7f7863cc9e..c844ec3cf7 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -691,6 +691,12 @@ struct BlockDriver {
>                                            QEMUIOVector *qiov,
>                                            int64_t pos);
>
> +    int coroutine_fn (*bdrv_co_zone_report)(BlockDriverState *bs,
> +            int64_t offset, unsigned int *nr_zones,
> +            BlockZoneDescriptor *zones);
> +    int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, BlockZoneOp op,
> +            int64_t offset, int64_t len);
> +
>      /* removable device specific */
>      bool (*bdrv_is_inserted)(BlockDriverState *bs);
>      void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
> @@ -828,6 +834,21 @@ typedef struct BlockLimits {
>
>      /* device zone model */
>      BlockZoneModel zoned;
> +
> +    /* zone size expressed in bytes */
> +    uint32_t zone_size;
> +
> +    /* total number of zones */
> +    uint32_t nr_zones;
> +
> +    /* maximum sectors of a zone append write operation */
> +    int64_t max_append_sectors;
> +
> +    /* maximum number of open zones */
> +    int64_t max_open_zones;
> +
> +    /* maximum number of active zones */
> +    int64_t max_active_zones;
>  } BlockLimits;
>
>  typedef struct BdrvOpBlocker BdrvOpBlocker;
> diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
> index 21fc10c4c9..877b2240b3 100644
> --- a/include/block/raw-aio.h
> +++ b/include/block/raw-aio.h
> @@ -29,6 +29,8 @@
>  #define QEMU_AIO_WRITE_ZEROES 0x0020
>  #define QEMU_AIO_COPY_RANGE   0x0040
>  #define QEMU_AIO_TRUNCATE     0x0080
> +#define QEMU_AIO_ZONE_REPORT  0x0100
> +#define QEMU_AIO_ZONE_MGMT    0x0200
>  #define QEMU_AIO_TYPE_MASK \
>          (QEMU_AIO_READ | \
>           QEMU_AIO_WRITE | \
> @@ -37,7 +39,9 @@
>           QEMU_AIO_DISCARD | \
>           QEMU_AIO_WRITE_ZEROES | \
>           QEMU_AIO_COPY_RANGE | \
> -         QEMU_AIO_TRUNCATE)
> +         QEMU_AIO_TRUNCATE | \
> +         QEMU_AIO_ZONE_REPORT | \
> +         QEMU_AIO_ZONE_MGMT)
>
>  /* AIO flags */
>  #define QEMU_AIO_MISALIGNED   0x1000
> diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
> index 50f5aa2e07..1b5fc7db6b 100644
> --- a/include/sysemu/block-backend-io.h
> +++ b/include/sysemu/block-backend-io.h
> @@ -45,6 +45,13 @@ BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, int64_t offset,
>                              BlockCompletionFunc *cb, void *opaque);
>  BlockAIOCB *blk_aio_flush(BlockBackend *blk,
>                            BlockCompletionFunc *cb, void *opaque);
> +BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, int64_t offset,
> +                                unsigned int *nr_zones,
> +                                BlockZoneDescriptor *zones,
> +                                BlockCompletionFunc *cb, void *opaque);
> +BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> +                              int64_t offset, int64_t len,
> +                              BlockCompletionFunc *cb, void *opaque);
>  BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
>                               BlockCompletionFunc *cb, void *opaque);
>  void blk_aio_cancel_async(BlockAIOCB *acb);
> @@ -156,6 +163,17 @@ int generated_co_wrapper blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
>  int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
>                                        int64_t bytes, BdrvRequestFlags flags);
>
> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
> +                                    unsigned int *nr_zones,
> +                                    BlockZoneDescriptor *zones);
> +int generated_co_wrapper blk_zone_report(BlockBackend *blk, int64_t offset,
> +                                         unsigned int *nr_zones,
> +                                         BlockZoneDescriptor *zones);
> +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> +                                  int64_t offset, int64_t len);
> +int generated_co_wrapper blk_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> +                                       int64_t offset, int64_t len);
> +
>  int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t offset,
>                                        int64_t bytes);
>  int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
> diff --git a/meson.build b/meson.build
> index 44c1f92697..0aa99b64a0 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1928,6 +1928,7 @@ config_host_data.set('CONFIG_REPLICATION', get_option('replication').allowed())
>  # has_header
>  config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))
>  config_host_data.set('CONFIG_LINUX_MAGIC_H', cc.has_header('linux/magic.h'))
> +config_host_data.set('CONFIG_BLKZONED', cc.has_header('linux/blkzoned.h'))
>  config_host_data.set('CONFIG_VALGRIND_H', cc.has_header('valgrind/valgrind.h'))
>  config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
>  config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
> @@ -2021,6 +2022,9 @@ config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
>  config_host_data.set('HAVE_STRUCT_STAT_ST_ATIM',
>                       cc.has_member('struct stat', 'st_atim',
>                                     prefix: '#include <sys/stat.h>'))
> +config_host_data.set('HAVE_BLK_ZONE_REP_CAPACITY',
> +                     cc.has_member('struct blk_zone', 'capacity',
> +                                   prefix: '#include <linux/blkzoned.h>'))
>
>  # has_type
>  config_host_data.set('CONFIG_IOVEC',
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 882b266532..05a3b44731 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2942,6 +2942,7 @@
>  # @compress: Since 5.0
>  # @copy-before-write: Since 6.2
>  # @snapshot-access: Since 7.0
> +# @zoned_host_device: Since 7.2
>  #
>  # Since: 2.9
>  ##
> @@ -2955,7 +2956,8 @@
>              'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
>              'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
>              { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
> -            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
> +            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat',
> +            { 'name': 'zoned_host_device', 'if': 'CONFIG_BLKZONED' } ] }
>
>  ##
>  # @BlockdevOptionsFile:
> @@ -4329,7 +4331,9 @@
>        'vhdx':       'BlockdevOptionsGenericFormat',
>        'vmdk':       'BlockdevOptionsGenericCOWFormat',
>        'vpc':        'BlockdevOptionsGenericFormat',
> -      'vvfat':      'BlockdevOptionsVVFAT'
> +      'vvfat':      'BlockdevOptionsVVFAT',
> +      'zoned_host_device': { 'type': 'BlockdevOptionsFile',
> +                             'if': 'CONFIG_BLKZONED' }
>    } }
>
>  ##
> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> index 952dc940f1..3a3bad77c3 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c
> @@ -1712,6 +1712,150 @@ static const cmdinfo_t flush_cmd = {
>      .oneline    = "flush all in-core file state to disk",
>  };
>
> +static inline int64_t tosector(int64_t bytes)
> +{
> +    return bytes >> BDRV_SECTOR_BITS;
> +}
> +
> +static int zone_report_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset;
> +    unsigned int nr_zones;
> +
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    nr_zones = cvtnum(argv[optind]);
> +
> +    g_autofree BlockZoneDescriptor *zones = NULL;
> +    zones = g_new(BlockZoneDescriptor, nr_zones);
> +    ret = blk_zone_report(blk, offset, &nr_zones, zones);
> +    if (ret < 0) {
> +        printf("zone report failed: %s\n", strerror(-ret));
> +    } else {
> +        for (int i = 0; i < nr_zones; ++i) {
> +            printf("start: 0x%" PRIx64 ", len 0x%" PRIx64 ", "
> +                   "cap"" 0x%" PRIx64 ", wptr 0x%" PRIx64 ", "
> +                   "zcond:%u, [type: %u]\n",
> +                    tosector(zones[i].start), tosector(zones[i].length),
> +                    tosector(zones[i].cap), tosector(zones[i].wp),
> +                    zones[i].state, zones[i].type);
> +        }
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_report_cmd = {
> +    .name = "zone_report",
> +    .altname = "zrp",
> +    .cfunc = zone_report_f,
> +    .argmin = 2,
> +    .argmax = 2,
> +    .args = "offset number",
> +    .oneline = "report zone information",
> +};
> +
> +static int zone_open_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, len;
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    len = cvtnum(argv[optind]);
> +    ret = blk_zone_mgmt(blk, BLK_ZO_OPEN, offset, len);
> +    if (ret < 0) {
> +        printf("zone open failed: %s\n", strerror(-ret));
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_open_cmd = {
> +    .name = "zone_open",
> +    .altname = "zo",
> +    .cfunc = zone_open_f,
> +    .argmin = 2,
> +    .argmax = 2,
> +    .args = "offset len",
> +    .oneline = "explicit open a range of zones in zone block device",
> +};
> +
> +static int zone_close_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, len;
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    len = cvtnum(argv[optind]);
> +    ret = blk_zone_mgmt(blk, BLK_ZO_CLOSE, offset, len);
> +    if (ret < 0) {
> +        printf("zone close failed: %s\n", strerror(-ret));
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_close_cmd = {
> +    .name = "zone_close",
> +    .altname = "zc",
> +    .cfunc = zone_close_f,
> +    .argmin = 2,
> +    .argmax = 2,
> +    .args = "offset len",
> +    .oneline = "close a range of zones in zone block device",
> +};
> +
> +static int zone_finish_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, len;
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    len = cvtnum(argv[optind]);
> +    ret = blk_zone_mgmt(blk, BLK_ZO_FINISH, offset, len);
> +    if (ret < 0) {
> +        printf("zone finish failed: %s\n", strerror(-ret));
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_finish_cmd = {
> +    .name = "zone_finish",
> +    .altname = "zf",
> +    .cfunc = zone_finish_f,
> +    .argmin = 2,
> +    .argmax = 2,
> +    .args = "offset len",
> +    .oneline = "finish a range of zones in zone block device",
> +};
> +
> +static int zone_reset_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, len;
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    len = cvtnum(argv[optind]);
> +    ret = blk_zone_mgmt(blk, BLK_ZO_RESET, offset, len);
> +    if (ret < 0) {
> +        printf("zone reset failed: %s\n", strerror(-ret));
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_reset_cmd = {
> +    .name = "zone_reset",
> +    .altname = "zrs",
> +    .cfunc = zone_reset_f,
> +    .argmin = 2,
> +    .argmax = 2,
> +    .args = "offset len",
> +    .oneline = "reset a zone write pointer in zone block device",
> +};
> +
>  static int truncate_f(BlockBackend *blk, int argc, char **argv);
>  static const cmdinfo_t truncate_cmd = {
>      .name       = "truncate",
> @@ -2504,6 +2648,11 @@ static void __attribute((constructor)) init_qemuio_commands(void)
>      qemuio_add_command(&aio_write_cmd);
>      qemuio_add_command(&aio_flush_cmd);
>      qemuio_add_command(&flush_cmd);
> +    qemuio_add_command(&zone_report_cmd);
> +    qemuio_add_command(&zone_open_cmd);
> +    qemuio_add_command(&zone_close_cmd);
> +    qemuio_add_command(&zone_finish_cmd);
> +    qemuio_add_command(&zone_reset_cmd);
>      qemuio_add_command(&truncate_cmd);
>      qemuio_add_command(&length_cmd);
>      qemuio_add_command(&info_cmd);
> --
> 2.38.1
>
>

