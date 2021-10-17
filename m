Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8128C430AE1
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Oct 2021 18:48:43 +0200 (CEST)
Received: from localhost ([::1]:51958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mc9L0-0002mn-7o
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 12:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1mc9J5-0001fV-NQ; Sun, 17 Oct 2021 12:46:43 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:43908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1mc9J3-0006PZ-Ss; Sun, 17 Oct 2021 12:46:43 -0400
Received: by mail-ua1-x931.google.com with SMTP id i22so1205031ual.10;
 Sun, 17 Oct 2021 09:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X6pMSigd7rq+NLLShJYPsGddklESxe1mm2vIaB9I2J8=;
 b=cEpFpdHh2MSwKLGSlxt/JUK/SakMCU3ng98m8wUM+XlCCQLjo/W3+yPrpUTEgSKE5N
 Qy7RQzxhlRil+U6gdu4B6axJIksnQCGiEpn+k9XyIfDQixkho8AKB/iIxtJhdd1hCM5W
 UqHXn1xHzoYEsgEZy7oZ7gNIugRKQRHWKg2UNXq7qNpMMG2FQjn4p6bWUY9aXADzRmLf
 8bwPvpKHS0re4WTRXsLUDiCD+XJS3yMzp1A/eSZZ2ITKBVgemLDWK+XU1AP7Yt6VgNT5
 HPROo8HnbUURax55Zn6eMDSL2B/ad9CLxBPA3lbpuGvJwgmKTBjWvWlzlhoVHENBsupQ
 t52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X6pMSigd7rq+NLLShJYPsGddklESxe1mm2vIaB9I2J8=;
 b=s0qpq1IjEekUta8zX1WFgVXYTnMY83K3mQOKnkGBDc+lYYdCEMrXBWBW+ndgV5/jGl
 TtJ9y++hrSo9t7hlY03EeWwZKUF8S91vqJELhe63+hQ9VzYMA4Ivu7m2bVvjVSGPBWqG
 JoMtUyzwIeEBT/wzbeIIhXaC/stlGX5lv4ozPss/JBt0DzjM1M/GpbszHpJA/+iY73UL
 Qmylokniqnop8FtsmWpgFqvvbOJIlNNoMAgy37JM5U6zzaRBPDYWSUixkP8Tdm92W+/K
 GatzrQZO2WQrp9oGQoAriICqOOeixBQ+3xjve3FPlIXMDbwmXsBk2yg7EISKZdznjrGR
 XUGA==
X-Gm-Message-State: AOAM532y5ZjCq9Vi+sIB2eTaLPhJyWN5R28ISfRIXVfPWz/3BodygEgs
 TGhgGYjeuJrqx2DkrJW8+iaQ9mv06W+4eoSgaQhGPMaD4hh2aw==
X-Google-Smtp-Source: ABdhPJw823xBeii05kHDR3CQya+72Qv4uiLbKmw9a1ShihL1O356OiVsUNF9YNOw03WHuu5aEgJq951vlZdnNhqb1As=
X-Received: by 2002:a67:c29d:: with SMTP id k29mr24288888vsj.51.1634489199841; 
 Sun, 17 Oct 2021 09:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211012152231.24868-1-pl@kamp.de>
In-Reply-To: <20211012152231.24868-1-pl@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Sun, 17 Oct 2021 18:46:07 +0200
Message-ID: <CAOi1vP8f+s=E06paWdU3yfvQUO5p4GPUYdNw2PLGRQwHjWNngw@mail.gmail.com>
Subject: Re: [PATCH V5] block/rbd: implement bdrv_co_block_status
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=idryomov@gmail.com; helo=mail-ua1-x931.google.com
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
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 5:22 PM Peter Lieven <pl@kamp.de> wrote:
>
> the qemu rbd driver currently lacks support for bdrv_co_block_status.
> This results mainly in incorrect progress during block operations (e.g.
> qemu-img convert with an rbd image as source).
>
> This patch utilizes the rbd_diff_iterate2 call from librbd to detect
> allocated and unallocated (all zero areas).
>
> To avoid querying the ceph OSDs for the answer this is only done if
> the image has the fast-diff feature which depends on the object-map and
> exclusive-lock features. In this case it is guaranteed that the information
> is present in memory in the librbd client and thus very fast.
>
> If fast-diff is not available all areas are reported to be allocated
> which is the current behaviour if bdrv_co_block_status is not implemented.
>
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
>  block/rbd.c | 112 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
>
> V4->V5:
>  - rename rbd_diff_req to RBDDiffIterateReq, use typedef and move
>    defintion to top [Ilya]
>  - rename callback to qemu_rbd_diff_iterate_cb [Ilya]
>  - assert that req.bytes == 0 if !req.exists and r == 0 [Ilya]
>
> V3->V4:
>  - make req.exists a bool [Ilya]
>  - simplify callback under the assuption that we never receive a cb
>    for a hole since we do not diff against a snapshot [Ilya]
>  - remove out label [Ilya]
>  - rename ret to status [Ilya]
>
> V2->V3:
> - check rbd_flags every time (they can change during runtime) [Ilya]
> - also check for fast-diff invalid flag [Ilya]
> - *map and *file cant be NULL [Ilya]
> - set ret = BDRV_BLOCK_ZERO | BDRV_BLOCK_OFFSET_VALID in case of an
>   unallocated area [Ilya]
> - typo: catched -> caught [Ilya]
> - changed wording about fast-diff, object-map and exclusive lock in
>   commit msg [Ilya]
>
> V1->V2:
> - add commit comment [Stefano]
> - use failed_post_open [Stefano]
> - remove redundant assert [Stefano]
> - add macro+comment for the magic -9000 value [Stefano]
> - always set *file if its non NULL [Stefano]
>
>
> diff --git a/block/rbd.c b/block/rbd.c
> index 701fbf2b0c..def96292e0 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -97,6 +97,12 @@ typedef struct RBDTask {
>      int64_t ret;
>  } RBDTask;
>
> +typedef struct RBDDiffIterateReq {
> +    uint64_t offs;
> +    uint64_t bytes;
> +    bool exists;
> +} RBDDiffIterateReq;
> +
>  static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
>                              BlockdevOptionsRbd *opts, bool cache,
>                              const char *keypairs, const char *secretid,
> @@ -1259,6 +1265,111 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
>      return spec_info;
>  }
>
> +/*
> + * rbd_diff_iterate2 allows to interrupt the exection by returning a negative
> + * value in the callback routine. Choose a value that does not conflict with
> + * an existing exitcode and return it if we want to prematurely stop the
> + * execution because we detected a change in the allocation status.
> + */
> +#define QEMU_RBD_EXIT_DIFF_ITERATE2 -9000
> +
> +static int qemu_rbd_diff_iterate_cb(uint64_t offs, size_t len,
> +                                    int exists, void *opaque)
> +{
> +    RBDDiffIterateReq *req = opaque;
> +
> +    assert(req->offs + req->bytes <= offs);
> +    /*
> +     * we do not diff against a snapshot so we should never receive a callback
> +     * for a hole.
> +     */
> +    assert(exists);
> +
> +    if (!req->exists && offs > req->offs) {
> +        /*
> +         * we started in an unallocated area and hit the first allocated
> +         * block. req->bytes must be set to the length of the unallocated area
> +         * before the allocated area. stop further processing.
> +         */
> +        req->bytes = offs - req->offs;
> +        return QEMU_RBD_EXIT_DIFF_ITERATE2;
> +    }
> +
> +    if (req->exists && offs > req->offs + req->bytes) {
> +        /*
> +         * we started in an allocated area and jumped over an unallocated area,
> +         * req->bytes contains the length of the allocated area before the
> +         * unallocated area. stop further processing.
> +         */
> +        return QEMU_RBD_EXIT_DIFF_ITERATE2;
> +    }
> +
> +    req->bytes += len;
> +    req->exists = true;
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
> +    int status, r;
> +    RBDDiffIterateReq req = { .offs = offset };
> +    uint64_t features, flags;
> +
> +    assert(offset + bytes <= s->image_size);
> +
> +    /* default to all sectors allocated */
> +    status = BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
> +    *map = offset;
> +    *file = bs;
> +    *pnum = bytes;
> +
> +    /* check if RBD image supports fast-diff */
> +    r = rbd_get_features(s->image, &features);
> +    if (r < 0) {
> +        return status;
> +    }
> +    if (!(features & RBD_FEATURE_FAST_DIFF)) {
> +        return status;
> +    }
> +
> +    /* check if RBD fast-diff result is valid */
> +    r = rbd_get_flags(s->image, &flags);
> +    if (r < 0) {
> +        return status;
> +    }
> +    if (flags & RBD_FLAG_FAST_DIFF_INVALID) {
> +        return status;
> +    }
> +
> +    r = rbd_diff_iterate2(s->image, NULL, offset, bytes, true, true,
> +                          qemu_rbd_diff_iterate_cb, &req);
> +    if (r < 0 && r != QEMU_RBD_EXIT_DIFF_ITERATE2) {
> +        return status;
> +    }
> +    assert(req.bytes <= bytes);
> +    if (!req.exists) {
> +        if (r == 0) {
> +            /*
> +             * rbd_diff_iterate2 does not invoke callbacks for unallocated
> +             * areas. This here catches the case where no callback was
> +             * invoked at all (req.bytes == 0).
> +             */
> +            assert(req.bytes == 0);
> +            req.bytes = bytes;
> +        }
> +        status = BDRV_BLOCK_ZERO | BDRV_BLOCK_OFFSET_VALID;
> +    }
> +
> +    *pnum = req.bytes;
> +    return status;
> +}
> +
>  static int64_t qemu_rbd_getlength(BlockDriverState *bs)
>  {
>      BDRVRBDState *s = bs->opaque;
> @@ -1494,6 +1605,7 @@ static BlockDriver bdrv_rbd = {
>  #ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
>      .bdrv_co_pwrite_zeroes  = qemu_rbd_co_pwrite_zeroes,
>  #endif
> +    .bdrv_co_block_status   = qemu_rbd_co_block_status,
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

