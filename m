Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2A53BA05F
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 14:27:41 +0200 (CEST)
Received: from localhost ([::1]:39984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzIGi-00021l-9O
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 08:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzIE7-0000GA-VX; Fri, 02 Jul 2021 08:24:59 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:35559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzIDy-0002rL-Pt; Fri, 02 Jul 2021 08:24:59 -0400
Received: by mail-il1-x12c.google.com with SMTP id a11so9561769ilf.2;
 Fri, 02 Jul 2021 05:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cGvZsueyG9ZmWfJvu7UeIVi/O2nPY5XV5L5Iqs85dIs=;
 b=BmYD/dK4PYOwfEyCwHGsdgDcx2ZYp7rXMgAHFXAYUVY54SjNXASFIjryFA4Rnj8X4P
 6mzFOEcCIWfVrCHizU3WdnWEocZmOkgC7cSDwsmMH464QLTb0fa9Dv3Tf1/MK6VqIWk+
 cf+FfHLICLwQUWr1r50QyxN28aC6fEDWaNIesl1Fp02AkLJ8zu4kWqp/HY+5gcExFl2l
 YyaKhbnnP6EdrOqo9W8JXRugfcVoBck6aaUritu1yd5ZTLQL43Sqjl78fU+XZekkC02j
 +osnS8fyeIfZsVCySY6pIGPRzQEhRetnm651kQXDGVTUZcSORi93qODZm275lF6ZWxaA
 fIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cGvZsueyG9ZmWfJvu7UeIVi/O2nPY5XV5L5Iqs85dIs=;
 b=lw1TdQvqkGi2dc5/yWnoMFBKJiNXnvBgs8hJycCK7CTAVpNgnZEndUeu/hyibO/EXi
 n9T1++B9KAJzo5MmUa3Czx3EjUTpQaIeymS3vZzJUEB3FtdMeRiXfzLZoWcsVnbtpmyg
 yRph4QWakIAPnCLKAVJ9NEexWEw2tf4GOVOvj4enThifTVUfIDmbNyuI92yT5NP/yx7v
 soToovHqI5FqGgIJuU1zc4SIwhf4mideYcDKdRGgffCS1MJR0cCzjOaQYzZmHcF/cd5a
 XHO+O03XR6XtLjhfY2YA2GQNUSjCMeD0kGqFQ+sDB/Hg7RbIxjSNNHBy5CA62XntiBrC
 fEIQ==
X-Gm-Message-State: AOAM53237D9FUF9ZqLjjLevGTOopGEgYtF56NsqB2//5mcOFGxDzMT8n
 ershb8knLm7fx3u7hGgeWGfTYcXeFahQb6d/5Yw=
X-Google-Smtp-Source: ABdhPJxF0EHLcA/uRoTudeqcfEWAjVFM6QjXYUfCqBjbvM4X5UCzruySusZ0rsNFNykGIyDjj/M9f8HcA10shAAAgJ4=
X-Received: by 2002:a92:7b01:: with SMTP id w1mr3283227ilc.100.1625228689211; 
 Fri, 02 Jul 2021 05:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210702090935.15300-1-pl@kamp.de>
 <20210702090935.15300-6-pl@kamp.de>
In-Reply-To: <20210702090935.15300-6-pl@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Fri, 2 Jul 2021 14:24:27 +0200
Message-ID: <CAOi1vP8pkgyquGggTMLKN3RirmFxQMxSe2PVa_JjJKMQddt-wA@mail.gmail.com>
Subject: Re: [PATCH V4 5/6] block/rbd: add write zeroes support
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=idryomov@gmail.com; helo=mail-il1-x12c.google.com
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
> this patch wittingly sets BDRV_REQ_NO_FALLBACK and silently ignores BDRV_REQ_MAY_UNMAP
> for older librbd versions.
>
> The rationale for this is as following (citing Ilya Dryomov current RBD maintainer):
> ---8<---
> a) remove the BDRV_REQ_MAY_UNMAP check in qemu_rbd_co_pwrite_zeroes()
>    and as a consequence always unmap if librbd is too old
>
>    It's not clear what qemu's expectation is but in general Write
>    Zeroes is allowed to unmap.  The only guarantee is that subsequent
>    reads return zeroes, everything else is a hint.  This is how it is
>    specified in the kernel and in the NVMe spec.
>
>    In particular, block/nvme.c implements it as follows:
>
>    if (flags & BDRV_REQ_MAY_UNMAP) {
>        cdw12 |= (1 << 25);
>    }
>
>    This sets the Deallocate bit.  But if it's not set, the device may
>    still deallocate:
>
>    """
>    If the Deallocate bit (CDW12.DEAC) is set to '1' in a Write Zeroes
>    command, and the namespace supports clearing all bytes to 0h in the
>    values read (e.g., bits 2:0 in the DLFEAT field are set to 001b)
>    from a deallocated logical block and its metadata (excluding
>    protection information), then for each specified logical block, the
>    controller:
>    - should deallocate that logical block;
>
>    ...
>
>    If the Deallocate bit is cleared to '0' in a Write Zeroes command,
>    and the namespace supports clearing all bytes to 0h in the values
>    read (e.g., bits 2:0 in the DLFEAT field are set to 001b) from
>    a deallocated logical block and its metadata (excluding protection
>    information), then, for each specified logical block, the
>    controller:
>    - may deallocate that logical block;
>    """
>
>    https://nvmexpress.org/wp-content/uploads/NVM-Express-NVM-Command-Set-Specification-2021.06.02-Ratified-1.pdf
>
> b) set BDRV_REQ_NO_FALLBACK in supported_zero_flags
>
>    Again, it's not clear what qemu expects here, but without it we end
>    up in a ridiculous situation where specifying the "don't allow slow
>    fallback" switch immediately fails all efficient zeroing requests on
>    a device where Write Zeroes is always efficient:
>
>    $ qemu-io -c 'help write' | grep -- '-[zun]'
>     -n, -- with -z, don't allow slow fallback
>     -u, -- with -z, allow unmapping
>     -z, -- write zeroes using blk_co_pwrite_zeroes
>
>    $ qemu-io -f rbd -c 'write -z -u -n 0 1M' rbd:foo/bar
>    write failed: Operation not supported
> --->8---
>
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
>  block/rbd.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index be0471944a..149317d33c 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -63,7 +63,8 @@ typedef enum {
>      RBD_AIO_READ,
>      RBD_AIO_WRITE,
>      RBD_AIO_DISCARD,
> -    RBD_AIO_FLUSH
> +    RBD_AIO_FLUSH,
> +    RBD_AIO_WRITE_ZEROES
>  } RBDAIOCmd;
>
>  typedef struct BDRVRBDState {
> @@ -705,6 +706,10 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>          }
>      }
>
> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
> +    bs->supported_zero_flags = BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK;
> +#endif
> +
>      /* When extending regular files, we get zeros from the OS */
>      bs->supported_truncate_flags = BDRV_REQ_ZERO_WRITE;
>
> @@ -827,6 +832,18 @@ static int coroutine_fn qemu_rbd_start_co(BlockDriverState *bs,
>      case RBD_AIO_FLUSH:
>          r = rbd_aio_flush(s->image, c);
>          break;
> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
> +    case RBD_AIO_WRITE_ZEROES: {
> +        int zero_flags = 0;
> +#ifdef RBD_WRITE_ZEROES_FLAG_THICK_PROVISION
> +        if (!(flags & BDRV_REQ_MAY_UNMAP)) {
> +            zero_flags = RBD_WRITE_ZEROES_FLAG_THICK_PROVISION;
> +        }
> +#endif
> +        r = rbd_aio_write_zeroes(s->image, offset, bytes, c, zero_flags, 0);
> +        break;
> +    }
> +#endif
>      default:
>          r = -EINVAL;
>      }
> @@ -897,6 +914,16 @@ static int coroutine_fn qemu_rbd_co_pdiscard(BlockDriverState *bs,
>      return qemu_rbd_start_co(bs, offset, count, NULL, 0, RBD_AIO_DISCARD);
>  }
>
> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
> +static int
> +coroutine_fn qemu_rbd_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
> +                                      int count, BdrvRequestFlags flags)
> +{
> +    return qemu_rbd_start_co(bs, offset, count, NULL, flags,
> +                             RBD_AIO_WRITE_ZEROES);
> +}
> +#endif
> +
>  static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
>  {
>      BDRVRBDState *s = bs->opaque;
> @@ -1120,6 +1147,9 @@ static BlockDriver bdrv_rbd = {
>      .bdrv_co_pwritev        = qemu_rbd_co_pwritev,
>      .bdrv_co_flush_to_disk  = qemu_rbd_co_flush,
>      .bdrv_co_pdiscard       = qemu_rbd_co_pdiscard,
> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
> +    .bdrv_co_pwrite_zeroes  = qemu_rbd_co_pwrite_zeroes,
> +#endif
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

