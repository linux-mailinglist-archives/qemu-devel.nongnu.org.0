Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994135E9A88
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 09:35:59 +0200 (CEST)
Received: from localhost ([::1]:59954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ociek-0004f3-4y
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 03:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ociZM-0002TV-Oj
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 03:30:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ociZK-0006SI-LS
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 03:30:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664177421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HkT8at2+psywQJNd6qRyHQyIlvGpoI1IFxyV5tTV4PU=;
 b=dOF7SNveQcE8hS3+2zBCdGoIogQKsGk4kSEJUtoj9W9bIqz+QAaU3KyJOSWyU1ddud9U2U
 HK7GA+br0r1u5wwnOVMrlt+yZ7p8H6gWG5ug1fNwOJQ/VkjTP3JoKmcdHiKqMbsoFXe7VQ
 6wBAjdpPSxD4PnnV3DhaOP4EG/0z3ZM=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-77--rLfxjHoMvuJElMopyx_1Q-1; Mon, 26 Sep 2022 03:30:20 -0400
X-MC-Unique: -rLfxjHoMvuJElMopyx_1Q-1
Received: by mail-ot1-f72.google.com with SMTP id
 y25-20020a9d6359000000b00655ffb2ca00so3051652otk.4
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 00:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=HkT8at2+psywQJNd6qRyHQyIlvGpoI1IFxyV5tTV4PU=;
 b=xzqqegWexjdwiafeHc2wotSlTdH9XX+xnIZ9XNVbwsTTc4ToYK7LPtd8d4HTGFXaZv
 H8Dj6RWCxy8idgr1n2nI6AcvgKoTxOyb6cig+2qHSVqreqixUs32+PuBkERLu7jx6GSK
 r6P+O+7H/g/1A9L0PyN4jLe8kDL1FjX+he4cmzUU6Z0dPUOc76BZ1+iU7hl8JiZO84Ga
 ono3rbOXAhdaQ5wclAEeEon00+WWkMeHJMJVElTk6SscAHNJ+rfDu/lHb/xClGFHy8A0
 0xHT7j8YhGviL1yLbfnrTqaIIKfLLo0KLaJTpdC7q8AsiKf/+XdmWPWHsW43TZhF6HLi
 cuPQ==
X-Gm-Message-State: ACrzQf0LtcP1trp43I3kPbQwOppqpVZYThAUYrQvnVeN/okNHV5cc44B
 f1no+Z5k+btvnRIZVL/8hODrCtX525+MowYEqUn0hsw9uAQDavVAIRXtK6ivA4H5nahqkZk3rVL
 P+Fvpj6eMAoubqqRoQSe/Ms4bQgGy+Oo=
X-Received: by 2002:a05:6870:e409:b0:127:d330:c941 with SMTP id
 n9-20020a056870e40900b00127d330c941mr11069020oag.280.1664177419141; 
 Mon, 26 Sep 2022 00:30:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5o1/nLZWqeoa+fxHti9WTDQbFE6+/mKJo8siq2rg0XUhLqdIB11KMxmAp05DYsKO76O8VtuDJirlcy85SbcVM=
X-Received: by 2002:a05:6870:e409:b0:127:d330:c941 with SMTP id
 n9-20020a056870e40900b00127d330c941mr11069015oag.280.1664177418941; Mon, 26
 Sep 2022 00:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220923155046.1571-1-luzhipeng@cestc.cn>
In-Reply-To: <20220923155046.1571-1-luzhipeng@cestc.cn>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 26 Sep 2022 15:30:08 +0800
Message-ID: <CACGkMEtPgUgmMxHhRUkz3nuOa6BwZ47b3NBRWQCQG8-SE_SSrg@mail.gmail.com>
Subject: Re: [PATCH] virtio: del net client if net_init_tap_one failed
To: luzhipeng <luzhipeng@cestc.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Sep 23, 2022 at 11:56 PM luzhipeng <luzhipeng@cestc.cn> wrote:
>
> From: lu zhipeng <luzhipeng@cestc.cn>
>
> If the net tap initializes successful, but failed during
> network card hot-plugging, the net-tap will remains,
> so cleanup.
>
> Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>

Applied.

Thanks

> ---
>  net/tap.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/net/tap.c b/net/tap.c
> index b3ddfd4a74..e203d07a12 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -686,7 +686,7 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
>      tap_set_sndbuf(s->fd, tap, &err);
>      if (err) {
>          error_propagate(errp, err);
> -        return;
> +        goto failed;
>      }
>
>      if (tap->has_fd || tap->has_fds) {
> @@ -726,12 +726,12 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
>                  } else {
>                      warn_report_err(err);
>                  }
> -                return;
> +                goto failed;
>              }
>              if (!g_unix_set_fd_nonblocking(vhostfd, true, NULL)) {
>                  error_setg_errno(errp, errno, "%s: Can't use file descriptor %d",
>                                   name, fd);
> -                return;
> +                goto failed;
>              }
>          } else {
>              vhostfd = open("/dev/vhost-net", O_RDWR);
> @@ -743,11 +743,11 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
>                      warn_report("tap: open vhost char device failed: %s",
>                                  strerror(errno));
>                  }
> -                return;
> +                goto failed;
>              }
>              if (!g_unix_set_fd_nonblocking(vhostfd, true, NULL)) {
>                  error_setg_errno(errp, errno, "Failed to set FD nonblocking");
> -                return;
> +                goto failed;
>              }
>          }
>          options.opaque = (void *)(uintptr_t)vhostfd;
> @@ -760,11 +760,17 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
>              } else {
>                  warn_report(VHOST_NET_INIT_FAILED);
>              }
> -            return;
> +            goto failed;
>          }
>      } else if (vhostfdname) {
>          error_setg(errp, "vhostfd(s)= is not valid without vhost");
> +        goto failed;
>      }
> +
> +    return;
> +
> +failed:
> +    qemu_del_net_client(&s->nc);
>  }
>
>  static int get_fds(char *str, char *fds[], int max)
> --
> 2.31.1
>
>
>
>


