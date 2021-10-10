Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 956A54282F2
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Oct 2021 20:34:25 +0200 (CEST)
Received: from localhost ([::1]:46218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZdeS-0008P7-24
	for lists+qemu-devel@lfdr.de; Sun, 10 Oct 2021 14:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1mZdZz-0005aZ-HC; Sun, 10 Oct 2021 14:29:47 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:38667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1mZdZx-0001Fq-J0; Sun, 10 Oct 2021 14:29:47 -0400
Received: by mail-lf1-x12a.google.com with SMTP id x27so63804437lfu.5;
 Sun, 10 Oct 2021 11:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xkLFeR5JCJAj1bTQzMYH3PsRQ+5+vEPGYxdbGy0FUgU=;
 b=DbM3aySNotVx4Ls+miMlKK3eSD2WjjIm7uNFdpXI+wFP8X+regiRDPKLJHzGdZtXvo
 eIBrkd8FAGSJ/C3/lFzbVGw2A0cLHdxXSlJxGwoYJZFqowpjf073UnyjpbAVYXrCQGAh
 gY6EuAcNkFhvYF0GebMH2gQhosg+K5N34ALE1qzeYgeJSP5+bTKCocQ2bMCQX8//hjER
 NlMA9AOerUmGOo212F9G9no9XU1+88U+k8mpiB7mTVfNSQsUtpb9ecYVuvmMTW5zQbZA
 BMDuWGR5yLtXjcmbVzpU2S4HSM832Q9GZui3NPEbgmfL+azGGJs0IxGtDxaWerRtK37W
 VwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xkLFeR5JCJAj1bTQzMYH3PsRQ+5+vEPGYxdbGy0FUgU=;
 b=15KhbF8UdxHKhqPRT0RUyrNQ+NfIvTwkD6s1IlX8RROtsEG5v4wO8+XqJ6JHffLRFw
 acXKmoNhSrVRLl7ZnJW5gPmUWxaqm7zGNLvFYr0OVxNcdRN1dh9/qf0XIryWDuLZKheF
 eXwas9Ery7NJk/62POPN+aXHq79UrB8Hnx83/heMIBGg6lUvPwbdspS5zK4WYRKcrKpn
 tFkZ1W0cDAUDSVdEySWuAD9pYlxvANHQvL3wZAYrd43qKtOY2vDzg+N8mBm+86y6mS/V
 T5c2izUH6ovj8yTffwEL+pKZz5ZpCzYhXLCGXwQ6ouS9IzbiyQLdtrRw0oqhePDEV0kY
 oiwQ==
X-Gm-Message-State: AOAM533gjGnYP5xDSN3jqlJ8lq4xk0JclBiPOKHR9tnu1HjyL/SQBgx+
 1HH6ORbBz9lGJNJe7iPGLC9cWtoOAH/FN6j1YSI=
X-Google-Smtp-Source: ABdhPJzN7kXPh6uQwALFIPrcm0Q+xMhEMsR4cgUPrc2r0fM978ANLrQtMEkGnCnBAuOrFk1Z9F/w7ih5Z9/AmIB7Mtc=
X-Received: by 2002:a05:6512:360a:: with SMTP id
 f10mr11503149lfs.445.1633890582823; 
 Sun, 10 Oct 2021 11:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211007162805.11280-1-pl@kamp.de>
In-Reply-To: <20211007162805.11280-1-pl@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Sun, 10 Oct 2021 20:29:10 +0200
Message-ID: <CAOi1vP-ODwWoZDw8k0RY9hD0WJv5uQthMZteDAbUmeAqLcmpbQ@mail.gmail.com>
Subject: Re: [PATCH V4] block/rbd: implement bdrv_co_block_status
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=idryomov@gmail.com; helo=mail-lf1-x12a.google.com
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

On Thu, Oct 7, 2021 at 6:28 PM Peter Lieven <pl@kamp.de> wrote:
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
>  block/rbd.c | 111 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
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
> diff --git a/block/rbd.c b/block/rbd.c
> index 701fbf2b0c..b9fa8e78eb 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -1259,6 +1259,116 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
>      return spec_info;
>  }
>
> +typedef struct rbd_diff_req {
> +    uint64_t offs;
> +    uint64_t bytes;
> +    bool exists;
> +} rbd_diff_req;

Hi Peter,

Nit: rename to something like RBDDiffIterateReq to be consistent
with e.g. RBDTask and actually use the typedef (i.e. drop "struct"
elsewhere in the patch).

And perhaps move it to the top of the file where other structs are
defined, e.g. after RBDTask.

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

Nit: rename to qemu_rbd_diff_iterate_cb().

> +{
> +    struct rbd_diff_req *req = opaque;
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
> +    struct rbd_diff_req req = { .offs = offset };
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
> +                          qemu_rbd_co_block_status_cb, &req);
> +    if (r < 0 && r != QEMU_RBD_EXIT_DIFF_ITERATE2) {
> +        return status;
> +    }
> +    assert(req.bytes <= bytes);
> +    if (!req.exists) {
> +        if (r == 0 && !req.bytes) {

!req.bytes condition seems redundant here.  Given !req.exists, either
the callback wasn't called at all or r == QEMU_RBD_EXIT_DIFF_ITERATE2.
Perhaps assert before assigning it with bytes instead?

Thanks,

                Ilya

