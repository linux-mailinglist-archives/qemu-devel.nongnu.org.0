Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8279421FF7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 09:57:52 +0200 (CEST)
Received: from localhost ([::1]:33994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXfKh-0005dN-MZ
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 03:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1mXfID-0003kE-5H; Tue, 05 Oct 2021 03:55:17 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:34419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1mXfIB-0002Xe-5K; Tue, 05 Oct 2021 03:55:16 -0400
Received: by mail-vs1-xe32.google.com with SMTP id d18so9717vsh.1;
 Tue, 05 Oct 2021 00:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lgBoLvsZUf4w87NdDDRB8saOOvEAkvDANxObQKdSVsw=;
 b=qCppVQ+st/vUUR94qkMBFwCVbUyA2rFPssvUAX+N05m/0O0riL9Z/mOpQ4nxh9z9H7
 wHgsBxGECcbENrAVGRbInc5dTDNvGiWG9NavZ7TkPsolpR7gbc4Lwco4Wp24QKuSJNgv
 /6FzSzWE5bencgkFa/uOh3xP4U/Ltwqb0C0Wl1TL4052evlNgGxhfVGi0O7iqGeaLQbG
 VwnW9fkkuTRmsFxO+d2szYU67ePRfcKpstZxuGGclfXCnEwxOb76eB2PwNBepPdh198s
 fQNnPS5d28jd2h8NJ50E3zoi7Vk4cEZImmr+1asgr41DHTru4BSiXBoRSx5OuK/a+z5i
 Ua+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lgBoLvsZUf4w87NdDDRB8saOOvEAkvDANxObQKdSVsw=;
 b=sKafpFUAfp6TmsNetIhrjtKGTJ01cCtGIjHsARPvgNdG7Y24Mf3rR5CSCcnKxjUVew
 dA07CuY75ecLKoprIYt9/vpWPwQ+g0Gx3soVkHqnET2CmdhAns/K6L08xdGzXV4QfdYu
 mjAomTRI73vPZfXBpulXgH25yrzce9JAr6t+mlfhNHW1hrF8stniY5hS65c8Wo000QTz
 s4LVoIaAZAApMnI+UZx+43IvHDdLlhljdDirG50KgjpZV4Dhoqe3slQKmfascP/eA7yh
 u4v/8XORkKQ/Vs4dBugvpwG2lYFZw7s9/TXQV9Y1l3Kj6+TMm0z1/wp/MJrMEvsEMESQ
 Q8nQ==
X-Gm-Message-State: AOAM532MJois+TSePTo6gCpj0RWHfoI3rdrxmKFWYmixuvER9JOqiC6u
 H9kGGjlk08rlVU3+tQ6I4+KlkUmeHG0EERpiZP4=
X-Google-Smtp-Source: ABdhPJwe6R6yJmwFYJtyoILfK2b8fRUwj63nKb4UU2l9nry0jXPDiKTIwVFNN1jpWlEeNKZVZCykytC3aAllS9UZufI=
X-Received: by 2002:a67:f7c4:: with SMTP id a4mr17067609vsp.35.1633420513170; 
 Tue, 05 Oct 2021 00:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210916122116.802-1-pl@kamp.de>
In-Reply-To: <20210916122116.802-1-pl@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Tue, 5 Oct 2021 09:54:41 +0200
Message-ID: <CAOi1vP8_em_m=orH+5L+164+7EgD+JD_5kmrh=mWBMjZSe79kg@mail.gmail.com>
Subject: Re: [PATCH V3] block/rbd: implement bdrv_co_block_status
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=idryomov@gmail.com; helo=mail-vs1-xe32.google.com
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

On Thu, Sep 16, 2021 at 2:21 PM Peter Lieven <pl@kamp.de> wrote:
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
>  block/rbd.c | 126 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index dcf82b15b8..3cb24f9981 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -1259,6 +1259,131 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
>      return spec_info;
>  }
>
> +typedef struct rbd_diff_req {
> +    uint64_t offs;
> +    uint64_t bytes;
> +    int exists;

Hi Peter,

Nit: make exists a bool.  The one in the callback has to be an int
because of the callback signature but let's not spread that.

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

Do you have a test case for when this branch is taken?

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
> +     * assert that we caught all cases above and allocation state has not
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

Nit: I would rename ret to status or something like that to make
it clear(er) that it is an actual value and never an error.  Or,
even better, drop it entirely and return one of the two bitmasks
directly.

> +    struct rbd_diff_req req = { .offs = offset };
> +    uint64_t features, flags;
> +
> +    assert(offset + bytes <= s->image_size);
> +
> +    /* default to all sectors allocated */
> +    ret = BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
> +    *map = offset;
> +    *file = bs;
> +    *pnum = bytes;
> +
> +    /* check if RBD image supports fast-diff */
> +    r = rbd_get_features(s->image, &features);
> +    if (r < 0) {
> +        goto out;
> +    }
> +    if (!(features & RBD_FEATURE_FAST_DIFF)) {
> +        goto out;
> +    }
> +
> +    /* check if RBD fast-diff result is valid */
> +    r = rbd_get_flags(s->image, &flags);
> +    if (r < 0) {
> +        goto out;
> +    }
> +    if (flags & RBD_FLAG_FAST_DIFF_INVALID) {
> +        goto out;

Nit: I'm not a fan of labels that cover just the return statement.
Feel free to ignore this one but I would get rid of it and replace
these gotos with returns.

> +    }
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

The above is true in the case of diffing against a snapshot, i.e. when
the "from" snapshot has some data where the "to" revision (whether HEAD
or another snapshot) has a hole.  I don't think it is true for child vs
parent (but it has been a while since I looked at the diff code).  As
long as NULL is passed for fromsnapname, I would expect the callback to
be invoked only for allocated areas.  If I'm right, we could simplify
qemu_rbd_co_block_status_cb() considerably.

Thanks,

                Ilya

