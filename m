Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A939586D5F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 17:04:49 +0200 (CEST)
Received: from localhost ([::1]:33000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIWyM-0000c9-Td
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 11:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIWsu-0005Tk-Dc; Mon, 01 Aug 2022 10:59:08 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:40538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIWsr-00005C-AW; Mon, 01 Aug 2022 10:59:08 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-324ec5a9e97so27567757b3.7; 
 Mon, 01 Aug 2022 07:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=TBHiTiliMlPsV3MA7tvBy8H3UOXOhF5zgX561JjkqJg=;
 b=OxJTATPsPFznfVDCn0kSyJVpec4wTlXUIBRm5TRZJKEZn9RQFADQwIi4FfYgscYYrh
 1Suwh+fbfXcWEJko8R0UUslgBk4i8gz5hnF/WyxyOSOrr2Qpj0DRRFVcPyA0l5nu/zfI
 bXUbSJ8poGwiye3/kC7ifsIq2+lMFvWOd0lf3UWUHmdbcMKI/W+JzpXyfVEvo4xcIhhT
 mEvb1Ylrpwe+G6ks5b/l7uOMwQGVxITtT6LGlZKLHDM0pJU48hOPY15k0lEiTogZ7wdZ
 aIs6rl2SbfcfESeerza15/x3fY38E/7MNyTlLpw/RevCPrSfRKwlri30gUras2f+EJne
 ik0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=TBHiTiliMlPsV3MA7tvBy8H3UOXOhF5zgX561JjkqJg=;
 b=E/Z7mJIStQFTPY6okS2lBsFGI3DFNVR5rJnC2riF2DrmW/FNE9pyTbJz0ti09cK+re
 f+dnLXTqk2V1kv1KpN8PmGx8P9kOtvXVLLRWShoxse/eVnPmpzQI0iESrtjPSLrL0NNe
 LMeGtAsOIsYM9tJnp/UIvJHcF9zqGqkrEQPKDqeNIqgVhRE2qaacY1cZ8flHx6l6Zwa0
 aCTenQUUZ+Equzk+ewCn1njvvx/y5PR59+3v04X+AbSLHVCd1icAoKYVQUUsMK+ysxal
 XajPKwVszZsSVJ8X4HiWm9M62/RNTTCJX6OQTkjXoZg+VE6Sgr8GzOU7jH7RmVsQPkCW
 i2Hg==
X-Gm-Message-State: ACgBeo0McDV3Ijc2WMNrjIkUdSqsaVnrV+0dtqHhh1zJtLKxxV1uekQ1
 JFK5QE3sp42KMdjQEKIJNG/Wj5lfYcmeC7rw5ZQ=
X-Google-Smtp-Source: AA6agR7PaP916jtwH/SNSErHYahTiGyChgYkAHqcQTgyi0XCvYL9qXL8mqH1pOZKtYgJeme4WjrwJcZVwZlRFrG3qWc=
X-Received: by 2002:a81:8746:0:b0:31d:c5a6:ad8f with SMTP id
 x67-20020a818746000000b0031dc5a6ad8fmr13443289ywf.206.1659365943547; Mon, 01
 Aug 2022 07:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220801013305.10561-1-faithilikerun@gmail.com>
In-Reply-To: <20220801013305.10561-1-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 1 Aug 2022 10:58:51 -0400
Message-ID: <CAJSP0QXG1M-gEwo0QDMSnGqk4zgGP04uZwDME3ZeL6WaLx0tPA@mail.gmail.com>
Subject: Re: [RFC v5 05/11] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, damien.lemoal@opensource.wdc.com, 
 dmitry.fomichev@wdc.com, hare@suse.de, stefanha@redhat.com, mst@redhat.com, 
 armbru@redhat.com, qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, 
 hreitz@redhat.com, eblake@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112d.google.com
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

On Sun, 31 Jul 2022 at 21:34, Sam Li <faithilikerun@gmail.com> wrote:
>
> By adding zone management operations in BlockDriver, storage controller
> emulation can use the new block layer APIs including Report Zone and
> four zone management operations (open, close, finish, reset).
>
> BlockDriver can get zone information from null_blk device by refreshing
> BLockLimits.
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/block-backend.c            |  47 ++++++
>  block/coroutines.h               |   6 +
>  block/file-posix.c               | 272 ++++++++++++++++++++++++++++++-
>  block/io.c                       |  57 +++++++
>  include/block/block-common.h     |   1 -
>  include/block/block-io.h         |  13 ++
>  include/block/block_int-common.h |  22 ++-
>  include/block/raw-aio.h          |   6 +-
>  meson.build                      |   1 +
>  qapi/block-core.json             |   7 +-
>  10 files changed, 426 insertions(+), 6 deletions(-)
>
> diff --git a/block/block-backend.c b/block/block-backend.c
> index d4a5df2ac2..ef6a1f33d5 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1775,6 +1775,53 @@ int coroutine_fn blk_co_flush(BlockBackend *blk)
>      return ret;
>  }
>
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
> +        return -ENOMEDIUM;

Missing blk_dec_in_flight().

> +    }
> +    ret = bdrv_co_zone_report(blk_bs(blk), offset, nr_zones, zones);
> +    blk_dec_in_flight(blk);
> +    return ret;
> +}
> +
> +/*
> + * Send a zone_management command.
> + * offset is the starting zone specified as a sector offset.
> + * len is the maximum number of sectors the command should operate on.
> + */
> +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> +        int64_t offset, int64_t len)
> +{
> +    int ret;
> +    IO_CODE();
> +
> +    ret = blk_check_byte_request(blk, offset, len);
> +    if (ret < 0)
> +        return ret;

QEMU coding style uses {} around the if statement body.

> +    blk_inc_in_flight(blk);
> +    blk_wait_while_drained(blk);
> +    if (!blk_is_available(blk)) {
> +        return -ENOMEDIUM;

Missing blk_dec_in_flight().

> +    }
> +    ret = bdrv_co_zone_mgmt(blk_bs(blk), op, offset, len);
> +    blk_dec_in_flight(blk);
> +    return ret;
> +}
> +
>  void blk_drain(BlockBackend *blk)
>  {
>      BlockDriverState *bs = blk_bs(blk);
> diff --git a/block/coroutines.h b/block/coroutines.h
> index 3a2bad564f..e3f62d94e5 100644
> --- a/block/coroutines.h
> +++ b/block/coroutines.h
> @@ -63,6 +63,12 @@ nbd_co_do_establish_connection(BlockDriverState *bs, bool blocking,
>                                 Error **errp);
>
>
> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
> +                                    unsigned int *nr_zones,
> +                                    BlockZoneDescriptor *zones);
> +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> +                                  int64_t offset, int64_t len);
> +
>  /*
>   * "I/O or GS" API functions. These functions can run without
>   * the BQL, but only in one specific iothread/main loop.
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 0d8b4acdc7..6c045eb6e8 100644
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
> @@ -216,6 +219,13 @@ typedef struct RawPosixAIOData {
>              PreallocMode prealloc;
>              Error **errp;
>          } truncate;
> +        struct {
> +            unsigned int *nr_zones;
> +            BlockZoneDescriptor *zones;
> +        } zone_report;
> +        struct {
> +            BlockZoneOp op;
> +        } zone_mgmt;
>      };
>  } RawPosixAIOData;
>
> @@ -1386,7 +1396,7 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  #endif
>
>      if (bs->sg || S_ISBLK(st.st_mode)) {
> -        int ret = hdev_get_max_hw_transfer(s->fd, &st);
> +        ret = hdev_get_max_hw_transfer(s->fd, &st);
>
>          if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
>              bs->bl.max_hw_transfer = ret;
> @@ -1402,6 +1412,27 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>      if (ret < 0)
>          zoned = BLK_Z_NONE;
>      bs->bl.zoned = zoned;
> +    if (zoned != BLK_Z_NONE) {
> +        ret = get_sysfs_long_val(s->fd, &st, "chunk_sectors");
> +        if (ret > 0) {
> +            bs->bl.zone_sectors = ret;
> +        }
> +
> +        ret = get_sysfs_long_val(s->fd, &st, "zone_append_max_bytes");
> +        if (ret > 0) {
> +            bs->bl.zone_append_max_bytes = ret;
> +        }
> +
> +        ret = get_sysfs_long_val(s->fd, &st, "max_open_zones");
> +        if (ret > 0) {
> +            bs->bl.max_open_zones = ret;
> +        }
> +
> +        ret = get_sysfs_long_val(s->fd, &st, "max_active_zones");
> +        if (ret > 0) {
> +            bs->bl.max_active_zones = ret;
> +        }
> +    }
>  }
>
>  static int check_for_dasd(int fd)
> @@ -1896,6 +1927,131 @@ static off_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
>  }
>  #endif
>
> +/*
> + * parse_zone - Fill a zone descriptor
> + */
> +#if defined(CONFIG_BLKZONED)
> +static inline void parse_zone(struct BlockZoneDescriptor *zone,
> +                              struct blk_zone *blkz) {
> +    zone->start = blkz->start;
> +    zone->length = blkz->len;
> +    zone->cap = blkz->capacity;
> +    zone->wp = blkz->wp;
> +    zone->type = blkz->type;
> +    zone->cond = blkz->cond;
> +}

Type and cond need to be explicitly converted from <linux/blkzoned.h>
constants to QEMU constants. For example, if someone changes the QEMU
constant value in the future then this code will silently break.

Or if you really want to avoid explicit conversion, please add
QEMU_BUILD_BUG_ON() to check that the constant values are identical.

> +
> +static int handle_aiocb_zone_report(void *opaque) {
> +    RawPosixAIOData *aiocb = opaque;
> +    int fd = aiocb->aio_fildes;
> +    unsigned int *nr_zones = aiocb->zone_report.nr_zones;
> +    BlockZoneDescriptor *zones = aiocb->zone_report.zones;
> +    int64_t sector = aiocb->aio_offset / 512; /* ZBDs use 512B sectors */
> +
> +    struct blk_zone *blkz;
> +    int64_t rep_size;
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
> +        ret = ioctl(fd, BLKREPORTZONE, rep);
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
> +            parse_zone(&zones[n], &blkz[i]);
> +            /* The next report should start after the last zone reported */
> +            sector = blkz[i].start + blkz[i].len;
> +        }
> +    }
> +
> +    *nr_zones = n;
> +    return 0;
> +}
> +
> +static int handle_aiocb_zone_mgmt(void *opaque) {
> +    RawPosixAIOData *aiocb = opaque;
> +    BlockDriverState *bs = aiocb->bs;
> +    int fd = aiocb->aio_fildes;
> +    int64_t sector = aiocb->aio_offset;
> +    int64_t nr_sectors = aiocb->aio_nbytes;
> +    BlockZoneOp op = aiocb->zone_mgmt.op;
> +    struct blk_zone_range range;
> +    const char *ioctl_name;
> +    unsigned long ioctl_op;
> +    int64_t zone_sector, zone_sector_mask;
> +    int ret;
> +
> +    zone_sector = bs->bl.zone_sectors;
> +    zone_sector_mask = zone_sector - 1;
> +    if (sector & zone_sector_mask) {
> +        error_report("offset %" PRId64 " is not aligned to zone size "
> +                     "%" PRId64 "", sector, zone_sector);
> +        return -EINVAL;
> +    }
> +
> +    if (nr_sectors & zone_sector_mask) {
> +        error_report("number of sectors %" PRId64 " is not aligned to zone size"
> +                      " %" PRId64 "", nr_sectors, zone_sector);
> +        return -EINVAL;
> +    }
> +
> +    switch (op) {
> +    case BLK_ZO_OPEN:
> +        ioctl_name = "BLKOPENZONE";
> +        ioctl_op = BLKOPENZONE;
> +        break;
> +    case BLK_ZO_CLOSE:
> +        ioctl_name = "BLKCLOSEZONE";
> +        ioctl_op = BLKCLOSEZONE;
> +        break;
> +    case BLK_ZO_FINISH:
> +        ioctl_name = "BLKFINISHZONE";
> +        ioctl_op = BLKFINISHZONE;
> +        break;
> +    case BLK_ZO_RESET:
> +        ioctl_name = "BLKRESETZONE";
> +        ioctl_op = BLKRESETZONE;
> +        break;
> +    default:
> +        error_report("Invalid zone operation 0x%x", op);
> +        return -EINVAL;
> +    }
> +
> +    /* Execute the operation */
> +    range.sector = sector;
> +    range.nr_sectors = nr_sectors;
> +    do {
> +        ret = ioctl(fd, ioctl_op, &range);
> +    } while (ret != 0 && errno == EINTR);
> +
> +    if (ret != 0) {
> +        error_report("ioctl %s failed %d",
> +                     ioctl_name, errno);
> +        return -errno;
> +    }
> +
> +    return 0;
> +}
> +#endif

Did you try compiling this with CONFIG_BLKZONED undefined? You can
simulate that by replacing CONFIG_BLKZONED with
CONFIG_BLKZONED_MISSING only in this source file (leave it unchanged
in meson.build). Please check that the code still compiles; you may
need to adjust #ifdefs to avoid calls to functions that are only
defined when the #ifdef is taken or you can add an #else that defines
dummy functions that return -ENOTSUP.

> +
>  static int handle_aiocb_copy_range(void *opaque)
>  {
>      RawPosixAIOData *aiocb = opaque;
> @@ -3068,6 +3224,61 @@ static void raw_account_discard(BDRVRawState *s, uint64_t nbytes, int ret)
>      }
>  }
>
> +/*
> + * zone report - Get a zone block device's information in the form
> + * of an array of zone descriptors.
> + *
> + * @param bs: passing zone block device file descriptor
> + * @param zones: an array of zone descriptors to hold zone
> + * information on reply
> + * @param offset: offset can be any byte within the zone size.
> + * @param len: (not sure yet.
> + * @return 0 on success, -1 on failure
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
> +                .nr_zones       = nr_zones,
> +                .zones          = zones,
> +        },
> +    };
> +
> +    return raw_thread_pool_submit(bs, handle_aiocb_zone_report, &acb);
> +}
> +
> +/*
> + * zone management operations - Execute an operation on a zone
> + */
> +static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
> +        int64_t offset, int64_t len) {
> +    BDRVRawState *s = bs->opaque;
> +    RawPosixAIOData acb;
> +
> +    acb = (RawPosixAIOData) {
> +        .bs             = bs,
> +        .aio_fildes     = s->fd,
> +        .aio_type       = QEMU_AIO_ZONE_MGMT,
> +        .aio_offset     = offset,
> +        .aio_nbytes     = len,
> +        .zone_mgmt  = {
> +                .op = op,
> +        },
> +    };
> +
> +    return raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
> +}
> +#endif
> +
>  static coroutine_fn int
>  raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
>                  bool blkdev)
> @@ -3419,6 +3630,9 @@ BlockDriver bdrv_file = {
>      .bdrv_abort_perm_update = raw_abort_perm_update,
>      .create_opts = &raw_create_opts,
>      .mutable_opts = mutable_opts,
> +
> +    .bdrv_co_zone_report = raw_co_zone_report,
> +    .bdrv_co_zone_mgmt = raw_co_zone_mgmt,

Should these really be defined for bdrv_file? I thought they are only
defined for zoned_host_device.

>  };
>
>  /***********************************************/
> @@ -3568,6 +3782,12 @@ static void hdev_parse_filename(const char *filename, QDict *options,
>      bdrv_parse_filename_strip_prefix(filename, "host_device:", options);
>  }
>
> +static void zoned_host_device_parse_filename(const char *filename, QDict *options,
> +                                Error **errp)
> +{
> +    bdrv_parse_filename_strip_prefix(filename, "zoned_host_device:", options);
> +}

This should be #if defined(CONFIG_BLKZONED) to avoid compiler warnings
about an unused function when CONFIG_BLKZONED is not defined.

> +
>  static bool hdev_is_sg(BlockDriverState *bs)
>  {
>
> @@ -3798,6 +4018,55 @@ static BlockDriver bdrv_host_device = {
>  #endif
>  };
>
> +#if defined(CONFIG_BLKZONED)
> +static BlockDriver bdrv_zoned_host_device = {
> +        .format_name = "zoned_host_device",
> +        .protocol_name = "zoned_host_device",
> +        .instance_size = sizeof(BDRVRawState),
> +        .bdrv_needs_filename = true,
> +        .bdrv_probe_device  = hdev_probe_device,
> +        .bdrv_parse_filename = zoned_host_device_parse_filename,
> +        .bdrv_file_open     = hdev_open,
> +        .bdrv_close         = raw_close,
> +        .bdrv_reopen_prepare = raw_reopen_prepare,
> +        .bdrv_reopen_commit  = raw_reopen_commit,
> +        .bdrv_reopen_abort   = raw_reopen_abort,
> +        .bdrv_co_create_opts = bdrv_co_create_opts_simple,
> +        .create_opts         = &bdrv_create_opts_simple,
> +        .mutable_opts        = mutable_opts,
> +        .bdrv_co_invalidate_cache = raw_co_invalidate_cache,
> +        .bdrv_co_pwrite_zeroes = hdev_co_pwrite_zeroes,
> +
> +        .bdrv_co_preadv         = raw_co_preadv,
> +        .bdrv_co_pwritev        = raw_co_pwritev,
> +        .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
> +        .bdrv_co_pdiscard       = hdev_co_pdiscard,
> +        .bdrv_co_copy_range_from = raw_co_copy_range_from,
> +        .bdrv_co_copy_range_to  = raw_co_copy_range_to,
> +        .bdrv_refresh_limits = raw_refresh_limits,
> +        .bdrv_io_plug = raw_aio_plug,
> +        .bdrv_io_unplug = raw_aio_unplug,
> +        .bdrv_attach_aio_context = raw_aio_attach_aio_context,
> +
> +        .bdrv_co_truncate       = raw_co_truncate,
> +        .bdrv_getlength = raw_getlength,
> +        .bdrv_get_info = raw_get_info,
> +        .bdrv_get_allocated_file_size
> +                            = raw_get_allocated_file_size,
> +        .bdrv_get_specific_stats = hdev_get_specific_stats,
> +        .bdrv_check_perm = raw_check_perm,
> +        .bdrv_set_perm   = raw_set_perm,
> +        .bdrv_abort_perm_update = raw_abort_perm_update,
> +        .bdrv_probe_blocksizes = hdev_probe_blocksizes,
> +        .bdrv_probe_geometry = hdev_probe_geometry,
> +        .bdrv_co_ioctl = hdev_co_ioctl,
> +
> +        /* zone management operations */
> +        .bdrv_co_zone_report = raw_co_zone_report,
> +        .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
> +};
> +#endif
> +
>  #if defined(__linux__) || defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
>  static void cdrom_parse_filename(const char *filename, QDict *options,
>                                   Error **errp)
> @@ -4059,6 +4328,7 @@ static void bdrv_file_init(void)
>  #if defined(HAVE_HOST_BLOCK_DEVICE)
>      bdrv_register(&bdrv_host_device);
>  #ifdef __linux__
> +    bdrv_register(&bdrv_zoned_host_device);

#ifdef CONFIG_BLKZONED missing?

>      bdrv_register(&bdrv_host_cdrom);
>  #endif
>  #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
> diff --git a/block/io.c b/block/io.c
> index 0a8cbefe86..a4625fb0e1 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -3198,6 +3198,63 @@ out:
>      return co.ret;
>  }
>
> +int bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
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
> +    if (!drv || (!drv->bdrv_co_zone_report)) {
> +        co.ret = -ENOTSUP;
> +        goto out;
> +    }
> +
> +    if (drv->bdrv_co_zone_report) {

Please see my comments on the previous revision of this patch series.

> +        co.ret = drv->bdrv_co_zone_report(bs, offset, nr_zones, zones);
> +    } else {
> +        co.ret = -ENOTSUP;
> +        goto out;
> +        qemu_coroutine_yield();
> +    }
> +
> +out:
> +    bdrv_dec_in_flight(bs);
> +    return co.ret;
> +}
> +
> +int bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
> +        int64_t offset, int64_t len)
> +{
> +    BlockDriver *drv = bs->drv;
> +    CoroutineIOCompletion co = {
> +            .coroutine = qemu_coroutine_self(),
> +    };
> +    IO_CODE();
> +
> +    bdrv_inc_in_flight(bs);
> +    if (!drv || (!drv->bdrv_co_zone_mgmt)) {
> +        co.ret = -ENOTSUP;
> +        goto out;
> +    }
> +
> +    if (drv->bdrv_co_zone_mgmt) {
> +        co.ret = drv->bdrv_co_zone_mgmt(bs, op, offset, len);
> +    } else {
> +        co.ret = -ENOTSUP;
> +        goto out;
> +        qemu_coroutine_yield();
> +    }
> +
> +out:
> +    bdrv_dec_in_flight(bs);
> +    return co.ret;
> +}
> +
>  void *qemu_blockalign(BlockDriverState *bs, size_t size)
>  {
>      IO_CODE();
> diff --git a/include/block/block-common.h b/include/block/block-common.h
> index c9d28b1c51..19cf27cca9 100644
> --- a/include/block/block-common.h
> +++ b/include/block/block-common.h
> @@ -23,7 +23,6 @@
>   */
>  #ifndef BLOCK_COMMON_H
>  #define BLOCK_COMMON_H
> -
>  #include "block/aio.h"
>  #include "block/aio-wait.h"
>  #include "qemu/iov.h"

Please drop this unrelated whitespace change.

> diff --git a/include/block/block-io.h b/include/block/block-io.h
> index fd25ffa9be..55ad261e16 100644
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
> @@ -297,6 +304,12 @@ bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
>  int generated_co_wrapper
>  bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
>
> +int generated_co_wrapper
> +blk_zone_report(BlockBackend *blk, int64_t offset, unsigned int *nr_zones,
> +                BlockZoneDescriptor *zones);
> +int generated_co_wrapper
> +blk_zone_mgmt(BlockBackend *blk, BlockZoneOp op, int64_t offset, int64_t len);
> +
>  /**
>   * bdrv_parent_drained_begin_single:
>   *
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index 7f7863cc9e..de44c7b6f4 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -94,7 +94,6 @@ typedef struct BdrvTrackedRequest {
>      struct BdrvTrackedRequest *waiting_for;
>  } BdrvTrackedRequest;
>
> -
>  struct BlockDriver {
>      /*
>       * These fields are initialized when this object is created,

Please drop this unrelated whitespace change.

> @@ -691,6 +690,12 @@ struct BlockDriver {
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
> @@ -828,6 +833,21 @@ typedef struct BlockLimits {
>
>      /* device zone model */
>      BlockZoneModel zoned;
> +
> +    /* zone size expressed in 512-byte sectors */
> +    uint32_t zone_sectors;
> +
> +    /* total number of zones */
> +    unsigned int nr_zones;
> +
> +    /* maximum size in bytes of a zone append write operation */
> +    int64_t zone_append_max_bytes;
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
> index 21fc10c4c9..3d26929cdd 100644
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
> +         QEMU_AIO_TRUNCATE  | \
> +         QEMU_AIO_ZONE_REPORT | \
> +         QEMU_AIO_ZONE_MGMT)
>
>  /* AIO flags */
>  #define QEMU_AIO_MISALIGNED   0x1000
> diff --git a/meson.build b/meson.build
> index 75aaca8462..8c34516443 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1883,6 +1883,7 @@ config_host_data.set('CONFIG_REPLICATION', get_option('live_block_migration').al
>  # has_header
>  config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))
>  config_host_data.set('CONFIG_LINUX_MAGIC_H', cc.has_header('linux/magic.h'))
> +config_host_data.set('CONFIG_BLKZONED', cc.has_header('linux/blkzoned.h'))
>  config_host_data.set('CONFIG_VALGRIND_H', cc.has_header('valgrind/valgrind.h'))
>  config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
>  config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 2173e7734a..507f514ef9 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2955,7 +2955,8 @@
>              'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
>              'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
>              { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
> -            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
> +            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat',
> +            { 'name': 'zoned_host_device', 'if': 'CONFIG_BLKZONED' } ] }
>
>  ##
>  # @BlockdevOptionsFile:
> @@ -4329,7 +4330,9 @@
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
> --
> 2.37.1
>
>

