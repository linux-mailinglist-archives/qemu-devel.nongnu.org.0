Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763FB5630C9
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 11:57:56 +0200 (CEST)
Received: from localhost ([::1]:37456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7DPO-00053i-SM
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 05:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o7D9V-0001Ma-2k
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:41:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o7D9P-000344-Hg
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:41:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656668482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QJB2S2CDZKEY01XMKFfboC5FRzfl2xX2lxUIW3qxX+E=;
 b=Hd/EIiBDOtBLkdOGd38GtA9HxjUmiOXIMWU+1uk4MFdQ7d+BMIm+f4WBFXBmhU3yb0e+9v
 WzxNZ+QFY/ON1NxTHoKpQIaPqA7t3pt53AyTeCd28djQ1c3FTK3kXy4FLeccd1ZVqBw0RQ
 wVJDnMag+/3EbA/k0eo8ZLR2XmwZUIs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-fApP1rC-NgKdd7LmJu8Okw-1; Fri, 01 Jul 2022 05:41:21 -0400
X-MC-Unique: fApP1rC-NgKdd7LmJu8Okw-1
Received: by mail-ed1-f71.google.com with SMTP id
 g7-20020a056402424700b00435ac9c7a8bso1416773edb.14
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 02:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QJB2S2CDZKEY01XMKFfboC5FRzfl2xX2lxUIW3qxX+E=;
 b=uoRNuTRL0DMularhhhEUiC+Wn0vykya9ghujWoLRWyTIyYxO49wOpkoEY9O67kWTJi
 RePwj4PerULzl3Bj4TOSVKBMnbak0q4yckCWUm1YMQWY3Iccuf9o+9VDgjocEhHlWGXt
 36fQiNhG71nriinOMJ3UGiylDo9qH0FDeian7Q5fIwgyiMASjPqS/C6Fa7aPQNSRQYlh
 eR2MtR7NFugvTa8HrUpK8B3WqEy9Yzi3tMkbK8mJNgILpfGN1lB5yvWee62c0MTahS0s
 bF/6+Fcn+vdpE9e/61XmaFqWtWyyYhaphJaBJhe+CRo4fXV90W8rxzdRw1Xv63wblYzo
 9hAw==
X-Gm-Message-State: AJIora/RTPlnbmBKvapccgSpgnlnXI0ay2G+ok5LtJG/r2ry52+OF4RE
 CW7vMz5kdwtJ2WiBCwejS66kq7nxN3W3LtlPs0cLzv0JW0pZh5Z1Xi/og8iMrXofYbnI5ES5LD1
 cAbN9vKRBb5oVRig=
X-Received: by 2002:a17:906:6494:b0:722:ed09:f6c9 with SMTP id
 e20-20020a170906649400b00722ed09f6c9mr13786874ejm.107.1656668480413; 
 Fri, 01 Jul 2022 02:41:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sr8xUTBy45SHaZ2snkJYYlxHgN/+1hCo40XjXD0Cj9yQfZSwik1ZyiXQtuKk5R3GJC1w21tw==
X-Received: by 2002:a17:906:6494:b0:722:ed09:f6c9 with SMTP id
 e20-20020a170906649400b00722ed09f6c9mr13786834ejm.107.1656668479937; 
 Fri, 01 Jul 2022 02:41:19 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a170906235200b006fee16142b9sm10144638eja.110.2022.07.01.02.41.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jul 2022 02:41:19 -0700 (PDT)
Message-ID: <21cbfa05-0e2c-8e69-a5ab-fac31f87531f@redhat.com>
Date: Fri, 1 Jul 2022 11:41:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] block/rbd: support driver-specific reopen
Content-Language: en-US
To: Raphael Pour <raphael.pour@hetzner.com>
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:RBD" <qemu-block@nongnu.org>,
 Peter Lieven <pl@kamp.de>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Ilya Dryomov <idryomov@gmail.com>
References: <20220413122656.3070251-1-raphael.pour@hetzner.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220413122656.3070251-1-raphael.pour@hetzner.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 13.04.22 14:26, Raphael Pour wrote:
> This patch completes the reopen functionality for an attached RBD where altered
> driver options can be passed to. This is necessary to move RBDs between ceph
> clusters without interrupting QEMU, where some ceph settings need to be adjusted.
>
> The reopen_prepare method early returns if no rbd-specific driver options are
> given to maintain compatible with the previous behavior by dropping all
> generic block layer options. Otherwise the reopen acts similar to qemu_rbd_open.
>
> The reopen_commit tears down the old state and replaces it with the new
> one.
>
> The reopen_abort drops an ongoing reopen.
>
> Signed-off-by: Raphael Pour <raphael.pour@hetzner.com>
> ---
>   block/rbd.c | 206 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 201 insertions(+), 5 deletions(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index 6caf35cbba..e7b45d1c50 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -1029,19 +1029,213 @@ out:

I think the comment above this point (“Since RBD is currently...”) 
should either be dropped now or moved above the `if (new_s->snap && 
...)` condition.

>   static int qemu_rbd_reopen_prepare(BDRVReopenState *state,
>                                      BlockReopenQueue *queue, Error **errp)
>   {
> -    BDRVRBDState *s = state->bs->opaque;
> -    int ret = 0;
> +    BDRVRBDState *new_s = state->bs->opaque;
> +    BlockdevOptionsRbd *opts = NULL;
> +    const QDictEntry *e;
> +    Error *local_err = NULL;
> +    char *keypairs, *secretid;
> +    rbd_image_info_t info;
> +    int r = 0;
>   
> -    if (s->snap && state->flags & BDRV_O_RDWR) {
> +    if (new_s->snap && state->flags & BDRV_O_RDWR) {
>           error_setg(errp,
>                      "Cannot change node '%s' to r/w when using RBD snapshot",
>                      bdrv_get_device_or_node_name(state->bs));

Is this still the case?  I understand next to nothing about RBD, but can 
the user not make it R/W if they simultaneously decide to switch from 
snapshot to not-snapshot?

(I.e. shouldn’t we just let the generic code below figure out whether 
we’ll get an error with the whole new configuration?)

> -        ret = -EINVAL;
> +        r = -EINVAL;

If it is still relevant: Why not return the error immediately here?

If we don’t, it looks like a couple of bad things might happen below; 
like `r` getting overwritten, or `errp` getting set twice (which would 
cause an assertion failure).

>       }
>   
> -    return ret;
> +    /*
> +     * Remove all keys from the generic layer which
> +     * can't be converted by rbd
> +     */

Does any other driver do this?  Shouldn’t we leave them there so that 
the generic layer can verify that they aren’t changed?

> +    qdict_del(state->options, "driver");
> +    qdict_del(state->options, "node-name");
> +    qdict_del(state->options, "auto-read-only");
> +    qdict_del(state->options, "discard");
> +    qdict_del(state->options, "cache");

Because AFAIU this would mean that users could attempt to change e.g. 
the @cache option, and wouldn’t receive an error back, even though there 
is no support for changing it.

> +
> +    /*
> +     * To maintain the compatibility prior the rbd-reopen,
> +     * where the generic layer can be altered without any
> +     * rbd argument given,

What does “the generic layer can be altered” mean?  As far as I 
understand, it was only possible to change between read/write and 
read-only access.

>                              we must early return if there
> +     * aren't any rbd-specific options left.
> +     */
> +    if (qdict_size(state->options) == 0) {
> +        return r;
> +    }
> +
> +    new_s = state->opaque = g_new0(BDRVReopenState, 1);

This seems like it’s only “new” from this point on, but before that, it 
was the old state.  I find it confusing that a variable named “new_s” 
apparently stored the old state before this point, so if that were the 
case, I’d use a different variable (e.g. the previously existing `s`) 
for `state->bs->opaque`.

> +
> +    keypairs = g_strdup(qdict_get_try_str(state->options, "=keyvalue-pairs"));
> +    if (keypairs) {
> +        qdict_del(state->options, "=keyvalue-pairs");
> +    }
> +
> +    secretid = g_strdup(qdict_get_try_str(state->options, "password-secret"));
> +    if (secretid) {
> +        qdict_del(state->options, "password-secret");
> +    }
> +
> +    r = qemu_rbd_convert_options(state->options, &opts, &local_err);
> +    if (local_err) {
> +        /*
> +         * If keypairs are present, that means some options are present in
> +         * the modern option format.  Don't attempt to parse legacy option
> +         * formats, as we won't support mixed usage.
> +         */
> +        if (keypairs) {
> +            error_propagate(errp, local_err);
> +            goto out;
> +        }
> +
> +        /*
> +         * If the initial attempt to convert and process the options failed,
> +         * we may be attempting to open an image file that has the rbd options
> +         * specified in the older format consisting of all key/value pairs
> +         * encoded in the filename.  Go ahead and attempt to parse the
> +         * filename, and see if we can pull out the required options.
> +         */
> +        r = qemu_rbd_attempt_legacy_options(state->options, &opts, &keypairs);
> +        if (r < 0) {
> +            /*
> +             * Propagate the original error, not the legacy parsing fallback
> +             * error, as the latter was just a best-effort attempt.
> +             */
> +            error_propagate(errp, local_err);
> +            goto out;
> +        }
> +        /*
> +         * Take care whenever deciding to actually deprecate; once this ability
> +         * is removed, we will not be able to open any images with legacy-styled
> +         * backing image strings.
> +         */
> +        warn_report("RBD options encoded in the filename as keyvalue pairs "
> +                    "is deprecated");
> +    }
> +
> +    /*
> +     * Remove the processed options from the QDict (the visitor processes
> +     * _all_ options in the QDict)
> +     */
> +    while ((e = qdict_first(state->options))) {
> +        qdict_del(state->options, e->key);
> +    }

OK, I see why you’d then want to remove all non-RBD options before this 
point.  Other block drivers seem to solve this by having an 
X_runtime_opts QemuOptsList, which contains all driver-handled options, 
so they can then use qemu_opts_absorb_qdict() to extract the options 
they can handle.  (Compare e.g. qcow2_update_options_prepare().)

> +
> +    r = qemu_rbd_connect(&new_s->cluster, &new_s->io_ctx, opts,
> +                         !(state->flags & BDRV_O_NOCACHE), keypairs,
> +                         secretid, errp);

I assume that’s possible without causing issues while we still have the 
old connection open?  (I can’t test this, but I assume you did, so I’m 
just asking back for confirmation :))

> +    if (r < 0) {
> +        goto out;
> +    }
> +
> +    new_s->snap = g_strdup(opts->snapshot);
> +    new_s->image_name = g_strdup(opts->image);
> +
> +    /* rbd_open is always r/w */
> +    r = rbd_open(new_s->io_ctx, new_s->image_name, &new_s->image, new_s->snap);
> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "error reading header from %s",
> +                         new_s->image_name);
> +        goto failed_open;
> +    }
> +
> +    if (opts->has_encrypt) {
> +#ifdef LIBRBD_SUPPORTS_ENCRYPTION
> +        r = qemu_rbd_encryption_load(new_s->image, opts->encrypt, errp);
> +        if (r < 0) {
> +            goto failed_post_open;
> +        }
> +#else
> +        r = -ENOTSUP;
> +        error_setg(errp, "RBD library does not support image encryption");
> +        goto failed_post_open;
> +#endif
> +    }
> +
> +    r = rbd_stat(new_s->image, &info, sizeof(info));
> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "error getting image info from %s",
> +                         new_s->image_name);
> +        goto failed_post_open;
> +    }
> +    new_s->image_size = info.size;
> +    new_s->object_size = info.obj_size;
> +
> +    /*
> +     * If we are using an rbd snapshot, we must be r/o, otherwise
> +     * leave as-is
> +     */
> +    if (new_s->snap != NULL) {
> +        r = bdrv_apply_auto_read_only(state->bs, "rbd snapshots are read-only",
> +                                      errp);
> +        if (r < 0) {
> +            goto failed_post_open;
> +        }
> +    }
> +
> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
> +    state->bs->supported_zero_flags = BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK;
> +#endif
> +
> +    /* When extending regular files, we get zeros from the OS */
> +    state->bs->supported_truncate_flags = BDRV_REQ_ZERO_WRITE;
> +
> +    r = 0;
> +    goto out;

It seems to me like all of this code comes directly from 
qemu_rbd_open().  I think it should therefore be put into a new function 
that’s used by both qemu_rbd_open() and qemu_rbd_reopen_prepare().

> +
> +failed_post_open:
> +    rbd_close(new_s->image);
> +failed_open:
> +    rados_ioctx_destroy(new_s->io_ctx);
> +    g_free(new_s->snap);
> +    g_free(new_s->image_name);
> +    rados_shutdown(new_s->cluster);
> +out:
> +    qapi_free_BlockdevOptionsRbd(opts);
> +    g_free(keypairs);
> +    g_free(secretid);
> +    return r;
>   }
>   
> +static void qemu_rbd_reopen_abort(BDRVReopenState *reopen_state)
> +{
> +    BDRVRBDState *s = reopen_state->bs->opaque;

Should this not be `reopen_state->opaque`, i.e. the new state?  I 
would’ve thought in case of abort we need to leave the old state intact.

> +
> +    if (s->io_ctx) {
> +        rados_ioctx_destroy(s->io_ctx);
> +    }
> +
> +   if (s->cluster) {
> +        rados_shutdown(s->cluster);
> +    }
> +
> +    g_free(s->snap);
> +    g_free(reopen_state->opaque);
> +    reopen_state->opaque = NULL;

These two lines look as I’d’ve expected them, but that makes the 
preceding code more suspicious (i.e. we close the old state, then free 
the new one).

> +}
> +
> +static void qemu_rbd_reopen_commit(BDRVReopenState *reopen_state)
> +{
> +    BDRVRBDState *s = reopen_state->bs->opaque;
> +    BDRVRBDState *new_s = reopen_state->opaque;
> +
> +    rados_aio_flush(s->io_ctx);
> +
> +    rbd_close(s->image);
> +    rados_ioctx_destroy(s->io_ctx);
> +    g_free(s->snap);
> +    rados_shutdown(s->cluster);
> +
> +    s->io_ctx = new_s->io_ctx;
> +    s->cluster = new_s->cluster;
> +    s->image = new_s->image;
> +    s->snap = new_s->snap;
> +
> +    g_free(reopen_state->opaque);
> +    reopen_state->opaque = NULL;
> +}

This looks OK.

> +
> +
>   static void qemu_rbd_close(BlockDriverState *bs)
>   {
>       BDRVRBDState *s = bs->opaque;
> @@ -1628,6 +1822,8 @@ static BlockDriver bdrv_rbd = {
>       .bdrv_file_open         = qemu_rbd_open,
>       .bdrv_close             = qemu_rbd_close,
>       .bdrv_reopen_prepare    = qemu_rbd_reopen_prepare,
> +    .bdrv_reopen_commit     = qemu_rbd_reopen_commit,
> +    .bdrv_reopen_abort     = qemu_rbd_reopen_abort,
>       .bdrv_co_create         = qemu_rbd_co_create,
>       .bdrv_co_create_opts    = qemu_rbd_co_create_opts,
>       .bdrv_has_zero_init     = bdrv_has_zero_init_1,


