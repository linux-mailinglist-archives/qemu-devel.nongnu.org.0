Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED7748E8F2
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:11:17 +0100 (CET)
Received: from localhost ([::1]:33812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8KUG-0005SN-R4
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:11:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1n8KH1-00059x-6N; Fri, 14 Jan 2022 05:57:35 -0500
Received: from [2607:f8b0:4864:20::934] (port=45665
 helo=mail-ua1-x934.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1n8KGz-00026k-LR; Fri, 14 Jan 2022 05:57:34 -0500
Received: by mail-ua1-x934.google.com with SMTP id x33so16210340uad.12;
 Fri, 14 Jan 2022 02:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e7XaCrbuL3s+e1NI2AFoBFoFfu47sldA/3qmCTYlk3I=;
 b=gJbv8z3/a1ruhfjJ5YgwW4lQBZpOh67zrfVpanRZRneEt6E1pI6gQ9aZCHPLOYMcWY
 AR+nLMMzij1FnmqxerrPyM2iXXaEWP6Bm7RGmHGLWohe1aLMHlTWxu3q8Hk8lW8vBqfv
 X95E4ixhEnE1XoS+vrye+wfwvX83aK6qmyABimlvx790YuY+adq+wJApUXRdOx6+H6Dy
 R7lDyNgeK0fDG6NMPWBD0FQJuSszPQHLncyW+7zh7Eo61RUOwmMLxA/3mpSi9zdlAtZe
 Ccpbr5+cXSBdq5HlojjfbNLDdwC/LJz5mqY/P1bnIcq4IK18bFfVf4FiMJh6Dfhbca5n
 2gOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e7XaCrbuL3s+e1NI2AFoBFoFfu47sldA/3qmCTYlk3I=;
 b=E2b5+lZ5zVkP/rg+FPDMCM1V5GVLiIlMxj6xJd9zyu48/xd7mBs9MKtO05NqxRIbW7
 ugT+ORaXQyMUP4TWqs5wv29x1YEi+ABni8I/idX3f803i+leXCTrKGwh3UEZOKSzMi0W
 mx1j47o9TeMjOdd/TjxgBTpChxEXkQduFsVY8Stacyx1F5pI6Un3gNnxqy1O9DEy5TQP
 8Vyi4vGn5UCcGmITMki6T/ktRXb+oA23Nv3a2ZDFRYFUZQwMPpZulRIy8rEDbCoMDNqb
 m30cGzzVl3IbOdlHzNr6ONunA1ZhXlb+QrCaygrdwgiA1+2W2fyV1WTCJWdOHwuM187Y
 EhVA==
X-Gm-Message-State: AOAM5339cANJEcFpMDVhDO4TNOF/rFcO6XFAr+0eNRNWXlYRwne2or5M
 Gzo4YcjpQC1I+LBFJmMG6n2qjghdkkKmXiFRhXs=
X-Google-Smtp-Source: ABdhPJxtlGRrW2lX+svc4g1xHTobrTim14pBiJDyZWAWivTn8GxTIE1/RgHHC2jZitvxXkWst0b50vZqEYXs6F909DA=
X-Received: by 2002:a67:e190:: with SMTP id e16mr266170vsl.47.1642157851526;
 Fri, 14 Jan 2022 02:57:31 -0800 (PST)
MIME-Version: 1.0
References: <20220113144426.4036493-1-pl@kamp.de>
 <20220113144426.4036493-3-pl@kamp.de>
In-Reply-To: <20220113144426.4036493-3-pl@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Fri, 14 Jan 2022 11:57:32 +0100
Message-ID: <CAOi1vP_NoDntb2_65TnqoTvWAPskgQu18=7tUymKYEa4CMGoZw@mail.gmail.com>
Subject: Re: [PATCH V2 for-6.2 2/2] block/rbd: workaround for ceph issue #53784
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::934
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=idryomov@gmail.com; helo=mail-ua1-x934.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 qemu block <qemu-block@nongnu.org>, qemu-stable@nongnu.org,
 Christian Theune <ct@flyingcircus.io>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 3:44 PM Peter Lieven <pl@kamp.de> wrote:
>
> librbd had a bug until early 2022 that affected all versions of ceph that
> supported fast-diff. This bug results in reporting of incorrect offsets
> if the offset parameter to rbd_diff_iterate2 is not object aligned.
>
> This patch works around this bug for pre Quincy versions of librbd.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
>  block/rbd.c | 42 ++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 40 insertions(+), 2 deletions(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index 20bb896c4a..d174d51659 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -1320,6 +1320,7 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>      int status, r;
>      RBDDiffIterateReq req = { .offs = offset };
>      uint64_t features, flags;
> +    uint64_t head = 0;
>
>      assert(offset + bytes <= s->image_size);
>
> @@ -1347,7 +1348,43 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>          return status;
>      }
>
> -    r = rbd_diff_iterate2(s->image, NULL, offset, bytes, true, true,
> +#if LIBRBD_VERSION_CODE < LIBRBD_VERSION(1, 17, 0)
> +    /*
> +     * librbd had a bug until early 2022 that affected all versions of ceph that
> +     * supported fast-diff. This bug results in reporting of incorrect offsets
> +     * if the offset parameter to rbd_diff_iterate2 is not object aligned.
> +     * Work around this bug by rounding down the offset to object boundaries.
> +     * This is OK because we call rbd_diff_iterate2 with whole_object = true.
> +     * However, this workaround only works for non cloned images with default
> +     * striping.
> +     *
> +     * See: https://tracker.ceph.com/issues/53784
> +     */
> +
> +    /*  check if RBD image has non-default striping enabled */

Nit: extra space

Thanks,

                Ilya

