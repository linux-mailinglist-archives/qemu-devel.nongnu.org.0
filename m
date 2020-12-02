Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE83A2CC168
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 16:57:05 +0100 (CET)
Received: from localhost ([::1]:52866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkUV7-0005jT-10
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 10:57:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.s.norwitz@gmail.com>)
 id 1kkUSQ-0003RU-Ik; Wed, 02 Dec 2020 10:54:18 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:41052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raphael.s.norwitz@gmail.com>)
 id 1kkUSO-0007eR-PA; Wed, 02 Dec 2020 10:54:18 -0500
Received: by mail-oi1-x243.google.com with SMTP id h3so2032702oie.8;
 Wed, 02 Dec 2020 07:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E/IhTDRmDq0oztEHfJSdNz9Iti+5+yrVTCm8k0V0yjM=;
 b=i0mNZ5/9l1L0hK8glqepawF60BRmPMhTc037fMrlO4Q2r4eLLsEuZW7jWaPnPUfcKk
 O6JAC6X348JrDBWYyzFnZGUlanKrS8/ymTIYGwG0HFJiUvo4JeweMb/ztmIX/m/OWE22
 cwn+h8aVkTy8UAsDxiy5x67BYZBH7OCFfPHZEtHVbVGHjxIf+/G6wgJ3tfIoq4F7zBJ1
 ChESTOYuoqwOG7BjOkQuxP8PtFMZkt6UwJ/y0SEKzrpzZ24wwVFIuPrKf1/N2G6Ea7FY
 X9wmQ52KgxgXQByhmO04M1jlVYPwihoH32hHgZ5yBIVIr5xGt/Pf1+JUkMoEyKyfYxpK
 oy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E/IhTDRmDq0oztEHfJSdNz9Iti+5+yrVTCm8k0V0yjM=;
 b=pOzlaHQcCGA3X2knn1KnFx0h5rwVev6wPCjDQvUCDkoMBpQlTj9iAQ96V1qBRIwng8
 Z4+A062l1VbloAygJDwDK7X41f5/ctqDHVX4YEaucV8XiAZzIVbd35LQGPpnLyVF3AXX
 yyM4FDgKAjFGndLpZAgHEWCAE5uTk8qim7SaxbgL+G8I9tieSx0mwexyc/lKfnae5g/F
 oHg9w/JSEk5dUmXVqQYUvWN3VOYMGe9JCFl4kWd3ylVBH7I0sKl0Iodrd2g52evTzbZY
 BaoV+HnGEOcv8GfQbfDlgk72uCqwpmKgsl3BfUnIk1/aEuRni/OpTGiZh2rk4fSD56nU
 DYqg==
X-Gm-Message-State: AOAM530dhmyOD8hjVX4Jl8pGNQxhEnFzLD7nfUtlsXK76LjaYfCqObdl
 tNh09CIKaP+1PQV8YSo063DuHgtST9b3OlcKs/c=
X-Google-Smtp-Source: ABdhPJxXWm7v2wlihU42EZc9l73xondCmwZUn8dxIvxQPFFwXVAt1MDZIIBr91UrV7if6gOPqlrmDwXsBiR8Tp8j2ic=
X-Received: by 2002:aca:c492:: with SMTP id u140mr2013866oif.51.1606924452818; 
 Wed, 02 Dec 2020 07:54:12 -0800 (PST)
MIME-Version: 1.0
References: <20201202152611.677753-1-stefanha@redhat.com>
 <20201202152611.677753-2-stefanha@redhat.com>
In-Reply-To: <20201202152611.677753-2-stefanha@redhat.com>
From: Raphael Norwitz <raphael.s.norwitz@gmail.com>
Date: Wed, 2 Dec 2020 10:54:02 -0500
Message-ID: <CAFubqFvCGVpdo=QTzjfV0e_xSGghiEP+uhWToRxVvqXyqw0jaA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] contrib/vhost-user-blk: avoid g_return_val_if()
 input validation
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=raphael.s.norwitz@gmail.com; helo=mail-oi1-x243.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, QEMU <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 2, 2020 at 10:27 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Do not validate input with g_return_val_if(). This API is intended for
> checking programming errors and is compiled out with -DG_DISABLE_CHECKS.
>
> Use an explicit if statement for input validation so it cannot
> accidentally be compiled out.
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  contrib/vhost-user-blk/vhost-user-blk.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
> index dc981bf945..60e3c9ed37 100644
> --- a/contrib/vhost-user-blk/vhost-user-blk.c
> +++ b/contrib/vhost-user-blk/vhost-user-blk.c
> @@ -404,7 +404,11 @@ vub_get_config(VuDev *vu_dev, uint8_t *config, uint32_t len)
>      VugDev *gdev;
>      VubDev *vdev_blk;
>
> -    g_return_val_if_fail(len <= sizeof(struct virtio_blk_config), -1);
> +    if (len > sizeof(struct virtio_blk_config)) {
> +        fprintf(stderr, "Invalid get_config len %u, expected <= %zu\n",
> +                len, sizeof(struct virtio_blk_config));
> +        return -1;
> +    }
>
>      gdev = container_of(vu_dev, VugDev, parent);
>      vdev_blk = container_of(gdev, VubDev, parent);
> --
> 2.28.0
>

