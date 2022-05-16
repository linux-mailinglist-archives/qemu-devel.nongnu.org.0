Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6F5528D05
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 20:29:53 +0200 (CEST)
Received: from localhost ([::1]:49932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqfTc-0001Ys-3y
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 14:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1nqfQy-0008VO-3s; Mon, 16 May 2022 14:27:08 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36]:42894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1nqfQw-0007Xx-Eo; Mon, 16 May 2022 14:27:07 -0400
Received: by mail-vk1-xa36.google.com with SMTP id e144so7933377vke.9;
 Mon, 16 May 2022 11:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qHdc1dBwrbBdzm2syCBKe5wncr4fnDaxADcarQmStoE=;
 b=OIqZjowa+lE8s6pwazbdHFAfjBmRRflOM7ZKfQoDFKU9Dsj98KBuSsrNNSDqRQ3oJZ
 XH60POKeZr9bpR08DID/0QeDracDITGecVHDIU5wyvCD8WRuDQv748p3dqOn20qWFBbf
 EYLiAul2QIai20kspCxf0vw1mwGnOG+uYdp/W20idLiOGH8uZU+/wN7BrhV6uXadg+Wq
 31l5OuDFur3C4AcPpPcV8b9DaeHapg+ZyjxeiqxeO9WQnxIIMjbNUk2gOLSHCx+Gun8n
 HA/X93j8Z2TU5Fm1uZjXljdsawPGOLAK04gVE6gHepWzdQQz79jEHPSS/3bfExzlCBlX
 MIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qHdc1dBwrbBdzm2syCBKe5wncr4fnDaxADcarQmStoE=;
 b=1VOGfQ5qReZN20vdZJtXYpFc58HNXdSVVfQWIkYOxjaModj3MuekJBRbpb3NDwIfjg
 ayAzY17rBpGiIa11//CzzdfBNY7ToNAJE52gkx8Fhh2dA6/7IspEri+zPDnQCTPExTk2
 hxJb8Qo10VmIzzBNcBTGHM9Rx/A22XZiDNpiHzDj0914VYefK1b8nNsfhV2mLqtAf7kn
 TLyNTOzvsNhuhriQiL61D2vaeMNzUkr35dXt+GydfKG+Ipup/uY8FTS5DgirIPIvE/Q3
 8USOXO/myTNY2sQTGBeqxSoY9NyP5t0xlsk5LWrdQDjh5uC8I+Q1a8Dfv3vp2YR50c8D
 Z8YA==
X-Gm-Message-State: AOAM532HSVNF0vr9F38G5ACTakgs1XWy2LHeM7cpweR78u3EJkzCkBEn
 wlelJI1gxcQQW7Q7zCZBXiVqpRh+3fSm4MCHboA=
X-Google-Smtp-Source: ABdhPJzkeli8bGgzyxtdlETSqrB4zDxGjdGVjqLXD4HpbQHTBi4LBuLpO9msnc3tU1/BLk+w/WL81LTU6ih4bQR2WIU=
X-Received: by 2002:a1f:6003:0:b0:34d:3d07:5827 with SMTP id
 u3-20020a1f6003000000b0034d3d075827mr6737369vkb.30.1652725624917; Mon, 16 May
 2022 11:27:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220516100324.61122-1-sgarzare@redhat.com>
In-Reply-To: <20220516100324.61122-1-sgarzare@redhat.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Mon, 16 May 2022 20:26:53 +0200
Message-ID: <CAOi1vP-LeTROyyHFoP8-MySCk-n8C_1qB13WLtdhemcpyaPQgw@mail.gmail.com>
Subject: Re: [PATCH] block/rbd: report a better error when namespace does not
 exist
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Lieven <pl@kamp.de>,
 Tingting Mao <timao@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=idryomov@gmail.com; helo=mail-vk1-xa36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 16, 2022 at 12:03 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> If the namespace does not exist, rbd_create() fails with -ENOENT and
> QEMU reports a generic "error rbd create: No such file or directory":
>
>     $ qemu-img create rbd:rbd/namespace/image 1M
>     Formatting 'rbd:rbd/namespace/image', fmt=raw size=1048576
>     qemu-img: rbd:rbd/namespace/image: error rbd create: No such file or directory
>
> Unfortunately rados_ioctx_set_namespace() does not fail if the namespace
> does not exist, so let's use rbd_namespace_exists() in qemu_rbd_connect()
> to check if the namespace exists, reporting a more understandable error:
>
>     $ qemu-img create rbd:rbd/namespace/image 1M
>     Formatting 'rbd:rbd/namespace/image', fmt=raw size=1048576
>     qemu-img: rbd:rbd/namespace/image: namespace 'namespace' does not exist
>
> Reported-by: Tingting Mao <timao@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  meson.build |  6 ++++++
>  block/rbd.c | 24 ++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/meson.build b/meson.build
> index 9b20dcd143..e6c0afd62b 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1828,6 +1828,12 @@ config_host_data.set('HAVE_GETIFADDRS', cc.has_function('getifaddrs'))
>  config_host_data.set('HAVE_OPENPTY', cc.has_function('openpty', dependencies: util))
>  config_host_data.set('HAVE_STRCHRNUL', cc.has_function('strchrnul'))
>  config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
> +if rbd.found()
> +  config_host_data.set('HAVE_RBD_NAMESPACE_EXISTS',
> +                       cc.has_function('rbd_namespace_exists',
> +                                       dependencies: rbd,
> +                                       prefix: '#include <rbd/librbd.h>'))
> +endif
>  if rdma.found()
>    config_host_data.set('HAVE_IBV_ADVISE_MR',
>                         cc.has_function('ibv_advise_mr',
> diff --git a/block/rbd.c b/block/rbd.c
> index 6caf35cbba..0ff23c5b26 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -831,6 +831,26 @@ static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
>          error_setg_errno(errp, -r, "error opening pool %s", opts->pool);
>          goto failed_shutdown;
>      }
> +
> +#ifdef HAVE_RBD_NAMESPACE_EXISTS
> +    if (opts->has_q_namespace && strlen(opts->q_namespace) > 0) {
> +        bool exists;
> +
> +        r = rbd_namespace_exists(*io_ctx, opts->q_namespace, &exists);
> +        if (r != 0) {

Nit: r < 0 for consistency (librbd errors are always negative).

> +            error_setg_errno(errp, -r, "error checking namespace");
> +            goto failed_ioctx_destroy;
> +        }
> +
> +        if (!exists) {
> +            error_setg(errp, "namespace '%s' does not exist",
> +                       opts->q_namespace);
> +            r = -ENOENT;
> +            goto failed_ioctx_destroy;
> +        }
> +    }
> +#endif
> +
>      /*
>       * Set the namespace after opening the io context on the pool,
>       * if nspace == NULL or if nspace == "", it is just as we did nothing
> @@ -840,6 +860,10 @@ static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
>      r = 0;
>      goto out;
>
> +#ifdef HAVE_RBD_NAMESPACE_EXISTS
> +failed_ioctx_destroy:
> +    rados_ioctx_destroy(*io_ctx);
> +#endif
>  failed_shutdown:
>      rados_shutdown(*cluster);
>  out:
> --
> 2.35.3
>

Reviewed-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya

