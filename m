Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E1A4504B4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 13:50:18 +0100 (CET)
Received: from localhost ([::1]:45620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmbRA-0007b2-NX
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 07:50:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmbJ3-00028l-Dq
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 07:41:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmbIz-00034L-WF
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 07:41:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636980102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pnYRldyG8BnphLUsaoz6OT1QsTPt7lqRizbnWFee0ms=;
 b=GZelJ3RQvdBmt+r7ovLZmI7cSC/lQb2k8hd7/bcCNMc03BlI47OI2s+GE/LnnSKfgMuEXE
 PBGJ9S7Ab1hQAyn4gVQwU8xTwUhT32SDLY8EhCs2TnaskmbLPqeFo2/wUCaP08fdEKkMW5
 6fUpRGll1ygvjgC554Ax5qhhp232vRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-YvNxRxrVOtGaOAradN69pQ-1; Mon, 15 Nov 2021 07:41:39 -0500
X-MC-Unique: YvNxRxrVOtGaOAradN69pQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AA548042E9;
 Mon, 15 Nov 2021 12:41:33 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0DBD17A82;
 Mon, 15 Nov 2021 12:40:56 +0000 (UTC)
Date: Mon, 15 Nov 2021 13:40:55 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: yadong.qi@intel.com
Subject: Re: [PATCH 1/2] block:hdev: support BLKSECDISCARD
Message-ID: <YZJVVzott+zsoLqN@redhat.com>
References: <20211115045200.3567293-1-yadong.qi@intel.com>
 <20211115045200.3567293-2-yadong.qi@intel.com>
MIME-Version: 1.0
In-Reply-To: <20211115045200.3567293-2-yadong.qi@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, qemu-block@nongnu.org, mst@redhat.com, luhai.chen@intel.com,
 qemu-devel@nongnu.org, kai.z.wang@intel.com, hreitz@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.11.2021 um 05:51 hat yadong.qi@intel.com geschrieben:
> From: Yadong Qi <yadong.qi@intel.com>
> 
> Add a new option "secdiscard" for block drive. Parse it and
> record it in bs->open_flags as bit(BDRV_O_SECDISCARD).
> 
> Add a new BDRV_REQ_SECDISCARD bit for secure discard request
> from virtual device.
> 
> For host_device backend: implement by ioctl(BLKSECDISCARD) on
> real host block device.
> For other backend, no implementation.
> 
> E.g.:
>     qemu-system-x86_64 \
>     ... \
>     -drive file=/dev/mmcblk0p2,if=none,format=raw,discard=on,secdiscard=on,id=sd0 \
>     -device virtio-blk-pci,drive=sd0,id=sd0_vblk \
>     ...
> 
> Signed-off-by: Yadong Qi <yadong.qi@intel.com>
> ---
>  block.c                          | 46 +++++++++++++++++++++++++++++
>  block/blkdebug.c                 |  5 ++--
>  block/blklogwrites.c             |  6 ++--
>  block/blkreplay.c                |  5 ++--
>  block/block-backend.c            | 15 ++++++----
>  block/copy-before-write.c        |  5 ++--
>  block/copy-on-read.c             |  5 ++--
>  block/coroutines.h               |  6 ++--
>  block/file-posix.c               | 50 ++++++++++++++++++++++++++++----
>  block/filter-compress.c          |  5 ++--
>  block/io.c                       |  5 ++--
>  block/mirror.c                   |  5 ++--
>  block/nbd.c                      |  3 +-
>  block/nvme.c                     |  3 +-
>  block/preallocate.c              |  5 ++--
>  block/qcow2-refcount.c           |  4 +--
>  block/qcow2.c                    |  3 +-
>  block/raw-format.c               |  5 ++--
>  block/throttle.c                 |  5 ++--
>  hw/block/virtio-blk.c            |  2 +-
>  hw/ide/core.c                    |  1 +
>  hw/nvme/ctrl.c                   |  3 +-
>  hw/scsi/scsi-disk.c              |  2 +-
>  include/block/block.h            | 13 +++++++--
>  include/block/block_int.h        |  2 +-
>  include/block/raw-aio.h          |  4 ++-
>  include/sysemu/block-backend.h   |  1 +
>  tests/unit/test-block-iothread.c |  9 +++---
>  28 files changed, 171 insertions(+), 52 deletions(-)

Notably absent: qapi/block-core.json. Without changing this, the option
can't be available in -blockdev, which is the primary option to configure
block device backends.

This patch seems to contain multiple logical changes that should be
split into separate patches:

* Adding a flags parameter to .bdrv_co_pdiscard

* Support for the new feature in the core block layer (should be done
  with -blockdev)

* Convenience magic for -drive (BDRV_O_SECDISCARD). It's not clear that
  this should be done at all because the option is really specific to
  one single block driver (file-posix). I think in your patch, all
  other block drivers silently ignore the option, which is not what we
  want.

> diff --git a/block.c b/block.c
> index 580cb77a70..4f05e96d12 100644
> --- a/block.c
> +++ b/block.c
> @@ -1128,6 +1128,32 @@ int bdrv_parse_discard_flags(const char *mode, int *flags)
>      return 0;
>  }
>  
> +/**
> + * Set open flags for a given secdiscard mode
> + *
> + * Return 0 on success, -1 if the secdiscard mode was invalid.
> + */
> +int bdrv_parse_secdiscard_flags(const char *mode, int *flags, Error **errp)
> +{
> +    *flags &= ~BDRV_O_SECDISCARD;
> +
> +    if (!strcmp(mode, "off")) {
> +        /* do nothing */
> +    } else if (!strcmp(mode, "on")) {
> +        if (!(*flags & BDRV_O_UNMAP)) {
> +            error_setg(errp, "cannot enable secdiscard when discard is "
> +                             "disabled!");
> +            return -1;
> +        }

This check has nothing to do with parsing the option, it's validating
its value.

You don't even need a new function to parse it, because there is already
qemu_opt_get_bool(). Duplicating it means only that you're inconsistent
with other boolean options, which alternatively accept "yes"/"no",
"true"/"false", "y/n".

> +
> +        *flags |= BDRV_O_SECDISCARD;
> +    } else {
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
>  /**
>   * Set open flags for a given cache mode
>   *
> @@ -1695,6 +1721,11 @@ QemuOptsList bdrv_runtime_opts = {
>              .type = QEMU_OPT_STRING,
>              .help = "discard operation (ignore/off, unmap/on)",
>          },
> +        {
> +            .name = BDRV_OPT_SECDISCARD,
> +            .type = QEMU_OPT_STRING,
> +            .help = "secure discard operation (off, on)",
> +        },
>          {
>              .name = BDRV_OPT_FORCE_SHARE,
>              .type = QEMU_OPT_BOOL,
> @@ -1735,6 +1766,7 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
>      const char *driver_name = NULL;
>      const char *node_name = NULL;
>      const char *discard;
> +    const char *secdiscard;
>      QemuOpts *opts;
>      BlockDriver *drv;
>      Error *local_err = NULL;
> @@ -1829,6 +1861,16 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
>          }
>      }
>  
> +
> +    secdiscard = qemu_opt_get(opts, BDRV_OPT_SECDISCARD);
> +    if (secdiscard != NULL) {
> +        if (bdrv_parse_secdiscard_flags(secdiscard, &bs->open_flags,
> +                                        errp) != 0) {
> +            ret = -EINVAL;
> +            goto fail_opts;
> +        }
> +    }
> +
>      bs->detect_zeroes =
>          bdrv_parse_detect_zeroes(opts, bs->open_flags, &local_err);
>      if (local_err) {
> @@ -3685,6 +3727,10 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
>                                 &flags, options, flags, options);
>      }
>  
> +    if (g_strcmp0(qdict_get_try_str(options, BDRV_OPT_SECDISCARD), "on")) {
> +            flags |= BDRV_O_SECDISCARD;

Indentation is off.

> +    }
> +
>      bs->open_flags = flags;
>      bs->options = options;
>      options = qdict_clone_shallow(options);
> diff --git a/block/blkdebug.c b/block/blkdebug.c
> index bbf2948703..b49bb6a3e9 100644
> --- a/block/blkdebug.c
> +++ b/block/blkdebug.c
> @@ -717,7 +717,8 @@ static int coroutine_fn blkdebug_co_pwrite_zeroes(BlockDriverState *bs,
>  }
>  
>  static int coroutine_fn blkdebug_co_pdiscard(BlockDriverState *bs,
> -                                             int64_t offset, int64_t bytes)
> +                                             int64_t offset, int64_t bytes,
> +                                             BdrvRequestFlags flags)
>  {
>      uint32_t align = bs->bl.pdiscard_alignment;
>      int err;
> @@ -747,7 +748,7 @@ static int coroutine_fn blkdebug_co_pdiscard(BlockDriverState *bs,
>          return err;
>      }
>  
> -    return bdrv_co_pdiscard(bs->file, offset, bytes);
> +    return bdrv_co_pdiscard(bs->file, offset, bytes, 0);
>  }
>  
>  static int coroutine_fn blkdebug_co_block_status(BlockDriverState *bs,
> diff --git a/block/blklogwrites.c b/block/blklogwrites.c
> index f7a251e91f..d8d81a40ae 100644
> --- a/block/blklogwrites.c
> +++ b/block/blklogwrites.c
> @@ -456,7 +456,8 @@ static int coroutine_fn blk_log_writes_co_do_file_flush(BlkLogWritesFileReq *fr)
>  static int coroutine_fn
>  blk_log_writes_co_do_file_pdiscard(BlkLogWritesFileReq *fr)
>  {
> -    return bdrv_co_pdiscard(fr->bs->file, fr->offset, fr->bytes);
> +    return bdrv_co_pdiscard(fr->bs->file, fr->offset, fr->bytes,
> +                            fr->file_flags);
>  }
>  
>  static int coroutine_fn
> @@ -484,7 +485,8 @@ static int coroutine_fn blk_log_writes_co_flush_to_disk(BlockDriverState *bs)
>  }
>  
>  static int coroutine_fn
> -blk_log_writes_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
> +blk_log_writes_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
> +                                       BdrvRequestFlags flags)
>  {
>      return blk_log_writes_co_log(bs, offset, bytes, NULL, 0,
>                                   blk_log_writes_co_do_file_pdiscard,
> diff --git a/block/blkreplay.c b/block/blkreplay.c
> index dcbe780ddb..65e66d0766 100644
> --- a/block/blkreplay.c
> +++ b/block/blkreplay.c
> @@ -105,10 +105,11 @@ static int coroutine_fn blkreplay_co_pwrite_zeroes(BlockDriverState *bs,
>  }
>  
>  static int coroutine_fn blkreplay_co_pdiscard(BlockDriverState *bs,
> -                                              int64_t offset, int64_t bytes)
> +                                              int64_t offset, int64_t bytes,
> +                                              BdrvRequestFlags flags)
>  {
>      uint64_t reqid = blkreplay_next_id();
> -    int ret = bdrv_co_pdiscard(bs->file, offset, bytes);
> +    int ret = bdrv_co_pdiscard(bs->file, offset, bytes, flags);
>      block_request_create(reqid, bs, qemu_coroutine_self());
>      qemu_coroutine_yield();
>  
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 12ef80ea17..f2c5776172 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1597,7 +1597,8 @@ BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
>  
>  /* To be called between exactly one pair of blk_inc/dec_in_flight() */
>  int coroutine_fn
> -blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
> +blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
> +                   BdrvRequestFlags flags)
>  {
>      int ret;
>  
> @@ -1608,7 +1609,7 @@ blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
>          return ret;
>      }
>  
> -    return bdrv_co_pdiscard(blk->root, offset, bytes);
> +    return bdrv_co_pdiscard(blk->root, offset, bytes, flags);
>  }
>  
>  static void blk_aio_pdiscard_entry(void *opaque)
> @@ -1616,15 +1617,17 @@ static void blk_aio_pdiscard_entry(void *opaque)
>      BlkAioEmAIOCB *acb = opaque;
>      BlkRwCo *rwco = &acb->rwco;
>  
> -    rwco->ret = blk_co_do_pdiscard(rwco->blk, rwco->offset, acb->bytes);
> +    rwco->ret = blk_co_do_pdiscard(rwco->blk, rwco->offset, acb->bytes,
> +                                   rwco->flags);
>      blk_aio_complete(acb);
>  }
>  
>  BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk,
>                               int64_t offset, int64_t bytes,
> +                             BdrvRequestFlags flags,
>                               BlockCompletionFunc *cb, void *opaque)
>  {
> -    return blk_aio_prwv(blk, offset, bytes, NULL, blk_aio_pdiscard_entry, 0,
> +    return blk_aio_prwv(blk, offset, bytes, NULL, blk_aio_pdiscard_entry, flags,
>                          cb, opaque);
>  }
>  
> @@ -1634,7 +1637,7 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
>      int ret;
>  
>      blk_inc_in_flight(blk);
> -    ret = blk_co_do_pdiscard(blk, offset, bytes);
> +    ret = blk_co_do_pdiscard(blk, offset, bytes, 0);
>      blk_dec_in_flight(blk);
>  
>      return ret;
> @@ -1645,7 +1648,7 @@ int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
>      int ret;
>  
>      blk_inc_in_flight(blk);
> -    ret = blk_do_pdiscard(blk, offset, bytes);
> +    ret = blk_do_pdiscard(blk, offset, bytes, 0);
>      blk_dec_in_flight(blk);
>  
>      return ret;
> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
> index c30a5ff8de..8d60a3028f 100644
> --- a/block/copy-before-write.c
> +++ b/block/copy-before-write.c
> @@ -64,14 +64,15 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
>  }
>  
>  static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
> -                                        int64_t offset, int64_t bytes)
> +                                        int64_t offset, int64_t bytes,
> +                                       BdrvRequestFlags flags)
>  {
>      int ret = cbw_do_copy_before_write(bs, offset, bytes, 0);
>      if (ret < 0) {
>          return ret;
>      }
>  
> -    return bdrv_co_pdiscard(bs->file, offset, bytes);
> +    return bdrv_co_pdiscard(bs->file, offset, bytes, 0);
>  }
>  
>  static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
> diff --git a/block/copy-on-read.c b/block/copy-on-read.c
> index 1fc7fb3333..52183cc9a2 100644
> --- a/block/copy-on-read.c
> +++ b/block/copy-on-read.c
> @@ -201,9 +201,10 @@ static int coroutine_fn cor_co_pwrite_zeroes(BlockDriverState *bs,
>  
>  
>  static int coroutine_fn cor_co_pdiscard(BlockDriverState *bs,
> -                                        int64_t offset, int64_t bytes)
> +                                        int64_t offset, int64_t bytes,
> +                                       BdrvRequestFlags flags)
>  {
> -    return bdrv_co_pdiscard(bs->file, offset, bytes);
> +    return bdrv_co_pdiscard(bs->file, offset, bytes, 0);
>  }
>  
>  
> diff --git a/block/coroutines.h b/block/coroutines.h
> index c8c14a29c8..b0ba771bef 100644
> --- a/block/coroutines.h
> +++ b/block/coroutines.h
> @@ -98,9 +98,11 @@ int coroutine_fn
>  blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
>  
>  int generated_co_wrapper
> -blk_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
> +blk_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
> +                BdrvRequestFlags flags);
>  int coroutine_fn
> -blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
> +blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
> +                   BdrvRequestFlags flags);
>  
>  int generated_co_wrapper blk_do_flush(BlockBackend *blk);
>  int coroutine_fn blk_co_do_flush(BlockBackend *blk);
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 7a27c83060..caa406e429 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -160,6 +160,7 @@ typedef struct BDRVRawState {
>      bool is_xfs:1;
>  #endif
>      bool has_discard:1;
> +    bool has_secdiscard:1;
>      bool has_write_zeroes:1;
>      bool discard_zeroes:1;
>      bool use_linux_aio:1;

has_secdiscard is only set to false in raw_open_common() and never
changed or used.

> @@ -727,6 +728,7 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
>  #endif /* !defined(CONFIG_LINUX_IO_URING) */
>  
>      s->has_discard = true;
> +    s->has_secdiscard = false;
>      s->has_write_zeroes = true;
>      if ((bs->open_flags & BDRV_O_NOCACHE) != 0 && !dio_byte_aligned(s->fd)) {
>          s->needs_alignment = true;
> @@ -765,6 +767,7 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
>              s->discard_zeroes = true;
>          }
>  #endif
> +
>  #ifdef __linux__
>          /* On Linux 3.10, BLKDISCARD leaves stale data in the page cache.  Do
>           * not rely on the contents of discarded blocks unless using O_DIRECT.

Unrelated hunk.

> @@ -1859,6 +1862,35 @@ static int handle_aiocb_discard(void *opaque)
>      return ret;
>  }
>  
> +static int handle_aiocb_secdiscard(void *opaque)
> +{
> +    RawPosixAIOData *aiocb = opaque;
> +    int ret = -ENOTSUP;
> +    BlockDriverState *bs = aiocb->bs;
> +
> +    if (!(bs->open_flags & BDRV_O_SECDISCARD)) {
> +        return -ENOTSUP;
> +    }
> +
> +    if (aiocb->aio_type & QEMU_AIO_BLKDEV) {
> +#ifdef BLKSECDISCARD
> +        do {
> +            uint64_t range[2] = { aiocb->aio_offset, aiocb->aio_nbytes };
> +            if (ioctl(aiocb->aio_fildes, BLKSECDISCARD, range) == 0) {
> +                return 0;
> +            }
> +        } while (errno == EINTR);
> +
> +        ret = translate_err(-errno);
> +#endif
> +    }
> +
> +    if (ret == -ENOTSUP) {
> +        bs->open_flags &= ~BDRV_O_SECDISCARD;

I'd rather avoid changing bs->open_flags. This is user input and I would
preserve it in its original state.

We already know when opening the image whether it is a block device. Why
do we even open the image instead of erroring out there?

> +    }
> +    return ret;
> +}
> +
>  /*
>   * Help alignment probing by allocating the first block.
>   *

Kevin


