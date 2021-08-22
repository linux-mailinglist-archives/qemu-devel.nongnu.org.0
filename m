Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E643F4199
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 23:04:21 +0200 (CEST)
Received: from localhost ([::1]:35982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHudf-0004NL-I3
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 17:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1mHucD-0003QG-9g; Sun, 22 Aug 2021 17:02:49 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:37415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1mHucB-0003SM-GM; Sun, 22 Aug 2021 17:02:49 -0400
Received: by mail-il1-x12a.google.com with SMTP id i13so3997107ilm.4;
 Sun, 22 Aug 2021 14:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ba3Fi3Jp94PiX96EttZFFvmqfhrGpPeO6jLV7FENRWs=;
 b=lpWMyZQCFYysRQZ3RUTVwSCXHOInZf++lZat9fuloI0F2TH10/z+vJqGhZbDbesVEz
 ZUS1qUtfjH0KFaPizYj9uv8hHXQ2LW846pywvE5JsNLZu56IE1ZHi3YuThYeGjkm3zOh
 5ksANzlJPjxS+Vaen7I0EDKGjz7DKe6YmoKqJvs4VANoN2pQrldl75X8W3oU43Lkzgig
 6Ri+tKDSM/zzh2kD3oA7vJIt6/xgl7FLmN6x3Z6VvGdUYR6DU3rno3aLvDuRl4cNUDHd
 3w53bUaRtrZ5xZqlxLOewe7xrs/M9wlYKTh8gj+H6ozzatnylbaOjEuYaJqJLzv82iyu
 dxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ba3Fi3Jp94PiX96EttZFFvmqfhrGpPeO6jLV7FENRWs=;
 b=LZjnMW+WnjeVxTvgCPDNxcawsmh0AGDg1fJ+GYyZ0//0Kqyhsm5sYdJ0rF0YnuinKE
 jczMphroPXsfulqdxAoRArio2Rw72ECUWl4jf8q00PTPV8RjCdgK4IZeqJrhfLlT37zd
 uDaU3kxiiXxSNpD/KHjgBcjiOlm6pcrAKv+p301ZQoZxPPMhml2KuoT6FJBNuYm5fI9B
 alOMr3x+8UM+BSq4nOAERRVvo2r1Hfkpah+nCC1Pfgcol+7NHU/GGOj8QLRocCM3bCFy
 QL4cFEqyzbGjMXgdrjWkwo03edbHqKTkP/BPH1Or/JNt76aSSnBrfkIuRnSDQvXo4w32
 ThgA==
X-Gm-Message-State: AOAM531ZYIs3jOf1oqOA/N1z5fA92ZOP1iGbAOmvocHq+UBVrpQk65T4
 JFDyNPyqquY7ziJ6dLKjkjYsULOq/DWpcj7aM4o=
X-Google-Smtp-Source: ABdhPJwNtRP7BmxIS7WS6qdPfWxOIENWSfMYrX8agFQGZ6JjpzksGodSKN5+KjIxgLAWXaCUjSLwQWeqKzjaZyZwkec=
X-Received: by 2002:a92:cac8:: with SMTP id m8mr11653400ilq.100.1629666165398; 
 Sun, 22 Aug 2021 14:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210810134124.18523-1-pl@kamp.de>
In-Reply-To: <20210810134124.18523-1-pl@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Sun, 22 Aug 2021 23:02:30 +0200
Message-ID: <CAOi1vP_vu3sRSp1nV8EfvNvkJMWg26iGJWtXqPnT9yUS6Zh36g@mail.gmail.com>
Subject: Re: [PATCH V2] block/rbd: implement bdrv_co_block_status
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=idryomov@gmail.com; helo=mail-il1-x12a.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Ilya Dryomov <idryomov@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, ct@flyingcircus.io, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 10, 2021 at 3:41 PM Peter Lieven <pl@kamp.de> wrote:
>
> the qemu rbd driver currently lacks support for bdrv_co_block_status.
> This results mainly in incorrect progress during block operations (e.g.
> qemu-img convert with an rbd image as source).
>
> This patch utilizes the rbd_diff_iterate2 call from librbd to detect
> allocated and unallocated (all zero areas).
>
> To avoid querying the ceph OSDs for the answer this is only done if
> the image has the fast-diff features which depends on the object-map

Hi Peter,

Nit: "has the fast-diff feature which depends on the object-map and
exclusive-lock features"

> and exclusive-lock. In this case it is guaranteed that the information
> is present in memory in the librbd client and thus very fast.
>
> If fast-diff is not available all areas are reported to be allocated
> which is the current behaviour if bdrv_co_block_status is not implemented.
>
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
> V1->V2:
> - add commit comment [Stefano]
> - use failed_post_open [Stefano]
> - remove redundant assert [Stefano]
> - add macro+comment for the magic -9000 value [Stefano]
> - always set *file if its non NULL [Stefano]
>
>  block/rbd.c | 125 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 125 insertions(+)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index dcf82b15b8..8692e76f40 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -88,6 +88,7 @@ typedef struct BDRVRBDState {
>      char *namespace;
>      uint64_t image_size;
>      uint64_t object_size;
> +    uint64_t features;
>  } BDRVRBDState;
>
>  typedef struct RBDTask {
> @@ -983,6 +984,13 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>      s->image_size = info.size;
>      s->object_size = info.obj_size;
>
> +    r = rbd_get_features(s->image, &s->features);
> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "error getting image features from %s",
> +                         s->image_name);
> +        goto failed_post_open;
> +    }

The object-map and fast-diff features can be enabled/disabled while the
image is open so this should probably go to qemu_rbd_co_block_status().

> +
>      /* If we are using an rbd snapshot, we must be r/o, otherwise
>       * leave as-is */
>      if (s->snap != NULL) {
> @@ -1259,6 +1267,122 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
>      return spec_info;
>  }
>
> +typedef struct rbd_diff_req {
> +    uint64_t offs;
> +    uint64_t bytes;
> +    int exists;
> +} rbd_diff_req;
> +
> +/*
> + * rbd_diff_iterate2 allows to interrupt the exection by returning a negative
> + * value in the callback routine. Choose a value that does not conflict with
> + * an existing exitcode and return it if we want to prematurely stop the
> + * execution because we detected a change in the allocation status.
> + */
> +#define QEMU_RBD_EXIT_DIFF_ITERATE2 -9000
> +
> +static int qemu_rbd_co_block_status_cb(uint64_t offs, size_t len,
> +                                       int exists, void *opaque)
> +{
> +    struct rbd_diff_req *req = opaque;
> +
> +    assert(req->offs + req->bytes <= offs);
> +
> +    if (req->exists && offs > req->offs + req->bytes) {
> +        /*
> +         * we started in an allocated area and jumped over an unallocated area,
> +         * req->bytes contains the length of the allocated area before the
> +         * unallocated area. stop further processing.
> +         */
> +        return QEMU_RBD_EXIT_DIFF_ITERATE2;
> +    }
> +    if (req->exists && !exists) {
> +        /*
> +         * we started in an allocated area and reached a hole. req->bytes
> +         * contains the length of the allocated area before the hole.
> +         * stop further processing.
> +         */
> +        return QEMU_RBD_EXIT_DIFF_ITERATE2;
> +    }
> +    if (!req->exists && exists && offs > req->offs) {
> +        /*
> +         * we started in an unallocated area and hit the first allocated
> +         * block. req->bytes must be set to the length of the unallocated area
> +         * before the allocated area. stop further processing.
> +         */
> +        req->bytes = offs - req->offs;
> +        return QEMU_RBD_EXIT_DIFF_ITERATE2;
> +    }
> +
> +    /*
> +     * assert that we catched all cases above and allocation state has not

catched -> caught

> +     * changed during callbacks.
> +     */
> +    assert(exists == req->exists || !req->bytes);
> +    req->exists = exists;
> +
> +    /*
> +     * assert that we either return an unallocated block or have got callbacks
> +     * for all allocated blocks present.
> +     */
> +    assert(!req->exists || offs == req->offs + req->bytes);
> +    req->bytes = offs + len - req->offs;
> +
> +    return 0;
> +}
> +
> +static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
> +                                                 bool want_zero, int64_t offset,
> +                                                 int64_t bytes, int64_t *pnum,
> +                                                 int64_t *map,
> +                                                 BlockDriverState **file)
> +{
> +    BDRVRBDState *s = bs->opaque;
> +    int ret, r;
> +    struct rbd_diff_req req = { .offs = offset };
> +
> +    assert(offset + bytes <= s->image_size);
> +
> +    /* default to all sectors allocated */
> +    ret = BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;

I'm a little confused by the meaning of these flags (but I haven't
looked at the other drivers yet).  Looks like this patch always sets
BDRV_BLOCK_OFFSET_VALID (makes sense since the "host" offset is always
known for rbd) and returns either BDRV_BLOCK_DATA or BDRV_BLOCK_ZERO.

DATA ZERO OFFSET_VALID
 t    t        t       sectors read as zero, returned file is zero at offset
 t    f        t       sectors read as valid from file at offset
 f    t        t       sectors preallocated, read as zero, returned file not
                       necessarily zero at offset
 f    f        t       sectors preallocated but read from backing_hd,
                       returned file contains garbage at offset

What about the first case (BDRV_BLOCK_DATA | BDRV_BLOCK_ZERO)?
What is the practical difference to just BDRV_BLOCK_ZERO?

> +    if (map) {
> +        *map = offset;
> +    }
> +    if (file) {
> +        *file = bs;
> +    }

A comment in block_int.h says that map and file are guaranteed to be
non-NULL so these tests seem redundant?

> +    *pnum = bytes;
> +
> +    /* RBD image does not support fast-diff */
> +    if (!(s->features & RBD_FEATURE_FAST_DIFF)) {
> +        goto out;
> +    }

Need to make sure that fast-diff is valid here: call rbd_get_flags()
on the image and test for !RBD_FLAG_FAST_DIFF_INVALID.

> +
> +    r = rbd_diff_iterate2(s->image, NULL, offset, bytes, true, true,
> +                          qemu_rbd_co_block_status_cb, &req);
> +    if (r < 0 && r != QEMU_RBD_EXIT_DIFF_ITERATE2) {
> +        goto out;
> +    }
> +    assert(req.bytes <= bytes);
> +    if (!req.exists) {
> +        if (r == 0 && !req.bytes) {
> +            /*
> +             * rbd_diff_iterate2 does not invoke callbacks for unallocated areas
> +             * except for the case where an overlay has a hole where the parent
> +             * has not. This here catches the case where no callback was
> +             * invoked at all.
> +             */
> +            req.bytes = bytes;
> +        }
> +        ret &= ~BDRV_BLOCK_DATA;
> +        ret |= BDRV_BLOCK_ZERO;

Is this equivalent to ret = BDRV_BLOCK_ZERO | BDRV_BLOCK_OFFSET_VALID?
If so, that would be clearer IMO.

Thanks,

                Ilya

