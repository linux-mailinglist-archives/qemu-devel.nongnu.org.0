Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C6548C0E7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 10:21:16 +0100 (CET)
Received: from localhost ([::1]:37024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Zoh-0004aR-E5
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 04:21:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1n7ZZp-0006PO-Pc; Wed, 12 Jan 2022 04:05:53 -0500
Received: from [2607:f8b0:4864:20::92d] (port=34470
 helo=mail-ua1-x92d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1n7ZZo-0007fA-2G; Wed, 12 Jan 2022 04:05:53 -0500
Received: by mail-ua1-x92d.google.com with SMTP id y4so3502535uad.1;
 Wed, 12 Jan 2022 01:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vaKpJ7X40TtepWT2+I5FmR9q8hdbnJ/5P5y5Vqtw/uc=;
 b=iUE68uF2psLX0PXXMaFuiRw5EakwtHpOCuQ6+t15yaZLH8CH+KF1pe21HEr77NW9CV
 cQoQw0tEDpPUsC/kYm25pQqmXoH2b/l9HD6LfCYN9cwwhgfQrw8rc/X/VINSlWAiNXUR
 rkW0srFgMTsrtwNQZ4t6L1hnaIdxISMnEGipxTITIArfx2Z99GQ958TV1zNMDXnGBqbx
 6y86iOxJ5dK96F+MZ2x/nMlKBds/hdNFGkpIvAWB+u8JG4Hpdxshv2FJnWECDSnP4pkf
 M+6PxrGt+6I9+wX4T3CeOVfQBoXxLpc5midbiv9sihdh5kXH4wHgDXLYLHOzFOUk6EGE
 jS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vaKpJ7X40TtepWT2+I5FmR9q8hdbnJ/5P5y5Vqtw/uc=;
 b=Gw+nlYyHIUIHrVPk6XG0+xMRNoGNVV91jzJWawCmSo9VBwMfAdNjBvm0fToUWHVNO8
 ij/DW2EKMBkWB12mU5nhakr98Xv8mEEFtFLpgxrJKeibkWYhwlQH3kr2oPO2do330CUJ
 qW22+AcGYH0NRcmI6cYKW8HaaEoPRplyYzUi6DycoMY9fipPZZVnLTCzVlIAkxFF8dKs
 6ch3W+Bad5rrjvrKc4mphUZTkMoHakjpSdrgjauXlbzZBKU2RUKVn/D9UihF1pGltOvK
 K4H8II/Q+NvVkwxGt/zrxMvIPCD3bJp9lR6uWypjTE8Qz9gaWkwknURfmcYikBb/YtmR
 t7nQ==
X-Gm-Message-State: AOAM531Gv0yWm+4+yRcpI8Wxjfw0p2QeFEq5JeXGexhoEACsaETtKrlW
 Gb+WCO+jGloSUBFMTIYnMYFef+ZVO67jW4YQtPq9nDfBQvc=
X-Google-Smtp-Source: ABdhPJxWpMj+s/b0UYOqGNt9vVuDt1/pvAYNRPR173b29xVIkJMyH/bw9yu//uW50qyHYcdMNRizfEZxuwabWbJEtuk=
X-Received: by 2002:ab0:2c17:: with SMTP id l23mr3707425uar.130.1641978343071; 
 Wed, 12 Jan 2022 01:05:43 -0800 (PST)
MIME-Version: 1.0
References: <20220110114154.3774072-1-pl@kamp.de>
 <20220110114154.3774072-2-pl@kamp.de>
In-Reply-To: <20220110114154.3774072-2-pl@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Wed, 12 Jan 2022 10:05:44 +0100
Message-ID: <CAOi1vP_nvvfmXXq=2kXYVoO-4UtzDmJ0X44_NnB1QCnSKTyGMA@mail.gmail.com>
Subject: Re: [PATCH 1/2] block/rbd: fix handling of holes in
 .bdrv_co_block_status
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=idryomov@gmail.com; helo=mail-ua1-x92d.google.com
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
 qemu-block@nongnu.org, qemu-stable@nongnu.org, ct@flyingcircus.io,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 12:42 PM Peter Lieven <pl@kamp.de> wrote:
>
> the assumption that we can't hit a hole if we do not diff against a snapshot was wrong.
>
> We can see a hole in an image if we diff against base if there exists an older snapshot
> of the image and we have discarded blocks in the image where the snapshot has data.
>
> Fixes: 0347a8fd4c3faaedf119be04c197804be40a384b
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
>  block/rbd.c | 55 +++++++++++++++++++++++++++++++++--------------------
>  1 file changed, 34 insertions(+), 21 deletions(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index def96292e0..5e9dc91d81 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -1279,13 +1279,24 @@ static int qemu_rbd_diff_iterate_cb(uint64_t offs, size_t len,
>      RBDDiffIterateReq *req = opaque;
>
>      assert(req->offs + req->bytes <= offs);
> -    /*
> -     * we do not diff against a snapshot so we should never receive a callback
> -     * for a hole.
> -     */
> -    assert(exists);
>
> -    if (!req->exists && offs > req->offs) {
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
>          /*
>           * we started in an unallocated area and hit the first allocated
>           * block. req->bytes must be set to the length of the unallocated area
> @@ -1295,17 +1306,19 @@ static int qemu_rbd_diff_iterate_cb(uint64_t offs, size_t len,
>          return QEMU_RBD_EXIT_DIFF_ITERATE2;
>      }
>
> -    if (req->exists && offs > req->offs + req->bytes) {
> -        /*
> -         * we started in an allocated area and jumped over an unallocated area,
> -         * req->bytes contains the length of the allocated area before the
> -         * unallocated area. stop further processing.
> -         */
> -        return QEMU_RBD_EXIT_DIFF_ITERATE2;
> -    }
> +    /*
> +     * assert that we caught all cases above and allocation state has not
> +     * changed during callbacks.
> +     */
> +    assert(exists == req->exists || !req->bytes);
> +    req->exists = exists;
>
> -    req->bytes += len;
> -    req->exists = true;
> +    /*
> +     * assert that we either return an unallocated block or have got callbacks
> +     * for all allocated blocks present.
> +     */
> +    assert(!req->exists || offs == req->offs + req->bytes);
> +    req->bytes = offs + len - req->offs;
>
>      return 0;
>  }
> @@ -1354,13 +1367,13 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>      }
>      assert(req.bytes <= bytes);
>      if (!req.exists) {
> -        if (r == 0) {
> +        if (r == 0 && !req.bytes) {
>              /*
> -             * rbd_diff_iterate2 does not invoke callbacks for unallocated
> -             * areas. This here catches the case where no callback was
> -             * invoked at all (req.bytes == 0).
> +             * rbd_diff_iterate2 does not invoke callbacks for unallocated areas
> +             * except for the case where an overlay has a hole where the parent
> +             * or an older snapshot of the image has not. This here catches the
> +             * case where no callback was invoked at all.
>               */
> -            assert(req.bytes == 0);
>              req.bytes = bytes;
>          }
>          status = BDRV_BLOCK_ZERO | BDRV_BLOCK_OFFSET_VALID;
> --
> 2.25.1
>
>

Hi Peter,

Can we just skip these "holes" by replacing the existing assert with
an if statement that would simply bail from the callback on !exists?

Just trying to keep the logic as simple as possible since as it turns
out we get to contend with ages-old librbd bugs here...

Thanks,

                Ilya

