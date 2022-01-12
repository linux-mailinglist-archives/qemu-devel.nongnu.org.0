Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CFC48C1E8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 11:02:15 +0100 (CET)
Received: from localhost ([::1]:34128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7aSM-0000mT-6P
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 05:02:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1n7aPy-000819-3v; Wed, 12 Jan 2022 04:59:46 -0500
Received: from [2607:f8b0:4864:20::931] (port=39551
 helo=mail-ua1-x931.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1n7aPw-00078A-GR; Wed, 12 Jan 2022 04:59:45 -0500
Received: by mail-ua1-x931.google.com with SMTP id m15so3698369uap.6;
 Wed, 12 Jan 2022 01:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5oxI1I7MSu4KcBjlxqAUPu3pJNDiKroSATssmbr4lRM=;
 b=MAPkEzJ9gdrjVvFALNGIES2Jq7LhbWo0iCNYCgn+TclsmFz9Rnd2Q9o566iQFeIcDL
 LjTOqCz677KB4gURkYBq+rdfRW90xJUuobLqZthnTzXoCdwnQLqa+J2aVOyc1zIzoaCM
 lvzyxo2oZ8oP5fX9lFFelW6m1pFozC7008AhXZpQHCoHIDnSKKI2u/xlff3rzKj0/GfB
 FJw9SMcOpO9MNhMQ6OfwULcSmqW5rN6SV2GuPbuWuoFJK/Z38Y1itcbolQ3GwDAs1Neh
 oKxfV1I/KLawKwD0P0lkTBDh85s1RZekzX1GvotJB3u8BuFw8vgYzdzcLysWQZ4iFa+Z
 DjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5oxI1I7MSu4KcBjlxqAUPu3pJNDiKroSATssmbr4lRM=;
 b=s5DU5zNXDJXuzdvi/kEiiH4HCBIaOFJ67eoSKeP0nbS+WjtPexOCSqINbl/Um8v//t
 lawQGCwlxD75P0q+93rK5zS2KhTtA8rQ/+O7cYHIAtodyWFjUgaZW3lx9P3/gKctyV3J
 7HPlh5GI+n5e25oyeoBhEM4p2ETOmIA34Fa9LLZcv8rbw9dU/MAr88sAA0/g9wl+Suu0
 YhNIoHEODvubRib2WkQrV4Bk09xZM2OtTqfbo1JAKkoqCdEKg87jj/wR88QfXA97wMIt
 KhxiNdtiUNsb+ws2qYzQADjObxkazcGwQWmD5rFRWFFTaTnakKsax81JyS4JYwXRMz8s
 fI5A==
X-Gm-Message-State: AOAM532HqfBJHjaJwHg1PQqxXFiI6KACrpCSzeCjE3819mUBug4N7xW9
 UTdLnFQcnUaqFW0B0eMDSqbho9CzGOskqg5YU9Y=
X-Google-Smtp-Source: ABdhPJzvyxojYqpOja5QQjWndAJsmEVaQsyr8YmmwhflDsDQ0o0CVmhrBnHtot9xHLJ8fD+M+fHpl4E4qJHf8cy3kY0=
X-Received: by 2002:a67:ef1c:: with SMTP id j28mr4066373vsr.13.1641981581181; 
 Wed, 12 Jan 2022 01:59:41 -0800 (PST)
MIME-Version: 1.0
References: <20220110114154.3774072-1-pl@kamp.de>
 <20220110114154.3774072-3-pl@kamp.de>
In-Reply-To: <20220110114154.3774072-3-pl@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Wed, 12 Jan 2022 10:59:42 +0100
Message-ID: <CAOi1vP8tLGvy7R3NLzfYkD-V=Tzokz6LOKvx--V-jHSSUfyyDw@mail.gmail.com>
Subject: Re: [PATCH 2/2] block/rbd: workaround for ceph issue #53784
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::931
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=idryomov@gmail.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, ct@flyingcircus.io,
 qemu-stable@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 12:43 PM Peter Lieven <pl@kamp.de> wrote:
>
> librbd had a bug until early 2022 that affected all versions of ceph that
> supported fast-diff. This bug results in reporting of incorrect offsets
> if the offset parameter to rbd_diff_iterate2 is not object aligned.
> Work around this bug by rounding down the offset to object boundaries.
>
> Fixes: https://tracker.ceph.com/issues/53784

I don't think the Fixes tag is appropriate here.  Linking librbd
ticket is fine but this patch doesn't really fix anything.

> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
>  block/rbd.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index 5e9dc91d81..260cb9f4b4 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -1333,6 +1333,7 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>      int status, r;
>      RBDDiffIterateReq req = { .offs = offset };
>      uint64_t features, flags;
> +    int64_t head;
>
>      assert(offset + bytes <= s->image_size);
>
> @@ -1360,6 +1361,19 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>          return status;
>      }
>
> +    /*
> +     * librbd had a bug until early 2022 that affected all versions of ceph that
> +     * supported fast-diff. This bug results in reporting of incorrect offsets
> +     * if the offset parameter to rbd_diff_iterate2 is not object aligned.
> +     * Work around this bug by rounding down the offset to object boundaries.
> +     *
> +     * See: https://tracker.ceph.com/issues/53784
> +     */
> +    head = offset & (s->object_size - 1);
> +    offset -= head;
> +    req.offs -= head;
> +    bytes += head;

So it looks like the intention is to have more or less a permanent
workaround since all librbd versions are affected, right?  For that,
I think we would need to also reject custom striping patterns and
clones.  For the above to be reliable, the image has to be standalone
and have a default striping pattern (stripe_unit == object_size &&
stripe_count == 1).  Otherwise, behave as if fast-diff is disabled or
invalid.

> +

Nit: I'd replace { .offs = offset } initialization at the top with {}
and assign to req.offs here, right before calling rbd_diff_iterate2().

>      r = rbd_diff_iterate2(s->image, NULL, offset, bytes, true, true,
>                            qemu_rbd_diff_iterate_cb, &req);
>      if (r < 0 && r != QEMU_RBD_EXIT_DIFF_ITERATE2) {
> @@ -1379,7 +1393,8 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>          status = BDRV_BLOCK_ZERO | BDRV_BLOCK_OFFSET_VALID;
>      }
>
> -    *pnum = req.bytes;
> +    assert(req.bytes > head);

I'd expand the workaround comment with an explanation of why it's OK
to round down the offset -- because rbd_diff_iterate2() is called with
whole_object=true.  If that wasn't the case, on top of inconsistent
results for different offsets within an object, this assert could be
triggered.

Thanks,

                Ilya

