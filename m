Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8528A280C3C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 04:10:00 +0200 (CEST)
Received: from localhost ([::1]:45372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOAWF-0004GQ-4u
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 22:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.s.norwitz@gmail.com>)
 id 1kOAUP-0003nO-Iu
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 22:08:05 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:37621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raphael.s.norwitz@gmail.com>)
 id 1kOASR-0006fr-Mm
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 22:08:03 -0400
Received: by mail-oi1-x244.google.com with SMTP id a3so623629oib.4
 for <qemu-devel@nongnu.org>; Thu, 01 Oct 2020 19:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aVAc3BqaJHX/UkRZcdAwS3s72TQdvkZyW+cffXgRhkg=;
 b=kWP8BqrKbEQd8rsND86Yr6bfHMjJhOfLhN2U6+VpW0KnlMP6aXQ8RcNNSSR5WKr2wI
 XLG+saPF71h9WYEiz9ZvE3LS7zwiKA4dVUTmT5SBFQ9ZBjMD2a5vxMm471Maf6xrwBPx
 UzjDlf5eKnOlyqHsCOXEkz/3ZL3ZEmkjlKan+jsbmhbf47ZL7GwMzFqOLxecXORcc85u
 j6T46k4dBZunTQP9/tA2Y81q0UqYVfvKF7B+FKDMpJym3mxAWfkEcZ2J65d0F0//UQjH
 GhAbXTu9Cbpkz5Z2/5q9ktr0UsQXGnYoklURMSEMaCRePyY5rrtIYWYYqtFGJYSNzmZE
 ZAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aVAc3BqaJHX/UkRZcdAwS3s72TQdvkZyW+cffXgRhkg=;
 b=TguanATZHYRS5+8/cb8YTu2sIfD0bARm8WeR+SJcyUjohOE7atWICNdTrLUkCnenQI
 o/FtxzXd6k9mTnpigT4Yfe/6Y30TX5nEGsSF36hWYVgWKyyWm/NHQvo0MXcZl3nQYk27
 uQlrUdfnitvrNRDYiYHOds3t4jzh/5P4GCzbORhNstjD5ogEWlHt+y7AiUUPGcxoJ1aE
 lYAUZEd9YO8luOf1Y49ikWAmHZs7y0V2dfC7kRcLDKA1I2zRoU/1lTGCxFBZWd+JaGIZ
 u0DoQ68YDQaUjSSmSwjusEY9Q3Qye136cx5EYep+g8So0mj6KaTjFH8rPUS+M8JeZPjF
 4OtQ==
X-Gm-Message-State: AOAM530pc7Bp0elkNrHz2e+sRGKBpt3GryG7PcHFCPuLL4vPXHqNQlmI
 RjekL8OC0hgdA3Fc9vtLM/SUVHkBNdUXBIiIkwo=
X-Google-Smtp-Source: ABdhPJwS22MMerGTuuJ2YDVQHg5+pxsIes0LQDgoSAJTMuEHGn2OzAnu7YBtKe6RLe2Yaefh2HiCQY8IUiVuDw3axlU=
X-Received: by 2002:aca:d653:: with SMTP id n80mr151463oig.51.1601604361657;
 Thu, 01 Oct 2020 19:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200928131731.69684-1-chenjiajun8@huawei.com>
In-Reply-To: <20200928131731.69684-1-chenjiajun8@huawei.com>
From: Raphael Norwitz <raphael.s.norwitz@gmail.com>
Date: Thu, 1 Oct 2020 22:05:50 -0400
Message-ID: <CAFubqFs1Vac2xQspDBF5M1oxCH0O9jEhjPj5g0CD6RSHrqwEiQ@mail.gmail.com>
Subject: Re: [PATCH] vhost-user: add separate memslot counter for vhost-user
To: Jiajun Chen <chenjiajun8@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=raphael.s.norwitz@gmail.com; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: zhang.zhanghailiang@huawei.com, "Michael S. Tsirkin" <mst@redhat.com>,
 jasowang@redhat.com, QEMU <qemu-devel@nongnu.org>, xiexiangyou@huawei.com,
 imammedo@redhat.com,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 28, 2020 at 9:17 AM Jiajun Chen <chenjiajun8@huawei.com> wrote:
>
> Used_memslots is equal to dev->mem->nregions now, it is true for
> vhost kernel, but not for vhost user, which uses the memory regions
> that have file descriptor. In fact, not all of the memory regions
> have file descriptor.
> It is usefully in some scenarios, e.g. used_memslots is 8, and only
> 5 memory slots can be used by vhost user, it is failed to hot plug
> a new memory RAM because vhost_has_free_slot just returned false,
> but we can hot plug it safely in fact.
>
> --
> ChangeList:
> v3:
> -make used_memslots a member of struct vhost_dev instead of a global static value
>
> v2:
> -eliminating useless used_memslots_exceeded variable and used_memslots_is_exceeded() API
>
> v1:
> -vhost-user: add separate memslot counter for vhost-user
>
> Signed-off-by: Jiajun Chen <chenjiajun8@huawei.com>
> Signed-off-by: Jianjay Zhou <jianjay.zhou@huawei.com>

I'm happy with this from a vhost/vhost-user perspective. vhost-backend
change looks good too. I'm a little confused by what's going on with
net/vhost-user.c.

> ---
>  hw/virtio/vhost-backend.c         | 12 ++++++++++
>  hw/virtio/vhost-user.c            | 25 +++++++++++++++++++++
>  hw/virtio/vhost.c                 | 37 +++++++++++++++++++++++--------
>  include/hw/virtio/vhost-backend.h |  5 +++++
>  include/hw/virtio/vhost.h         |  1 +
>  net/vhost-user.c                  |  7 ++++++
>  6 files changed, 78 insertions(+), 9 deletions(-)
>

> diff --git a/net/vhost-user.c b/net/vhost-user.c
> index 17532daaf3..7e93955537 100644
> --- a/net/vhost-user.c
> +++ b/net/vhost-user.c
> @@ -20,6 +20,7 @@
>  #include "qemu/error-report.h"
>  #include "qemu/option.h"
>  #include "trace.h"
> +#include "include/hw/virtio/vhost.h"
>
>  typedef struct NetVhostUserState {
>      NetClientState nc;
> @@ -347,6 +348,12 @@ static int net_vhost_user_init(NetClientState *peer, const char *device,
>          qemu_chr_fe_set_handlers(&s->chr, NULL, NULL,
>                                   net_vhost_user_event, NULL, nc0->name, NULL,
>                                   true);

Can you elaborate on this check here? What does it have to do with
fixing memslots accounting? Maybe it should be in a separate change?

> +
> +        if (!vhost_has_free_slot()) {
> +            error_report("used memslots exceeded the backend limit, quit "
> +                         "loop");
> +            goto err;
> +        }
>      } while (!s->started);
>
>      assert(s->vhost_net);
> --
> 2.27.0.dirty
>

