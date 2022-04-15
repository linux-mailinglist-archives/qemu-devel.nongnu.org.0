Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586935028C2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 13:15:03 +0200 (CEST)
Received: from localhost ([::1]:53080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfJun-0007Wq-Vc
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 07:15:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nfJtK-0006AD-VJ
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 07:13:31 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:55248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nfJtI-0002yI-S6
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 07:13:30 -0400
Received: by mail-wm1-x32b.google.com with SMTP id r64so4765943wmr.4
 for <qemu-devel@nongnu.org>; Fri, 15 Apr 2022 04:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=OV2BQf8hMKivEDO7apQjIkdGmvCaXSjvoYAlWI9j/b4=;
 b=qRlgSYkAoTTYdgSc0x/2iDpOCXbHCwmhFbWqjOWmI41bwMTt0r/V/7JIqmlBNGvazL
 SRxke5dOOD92i3/Ib21H9P2+biRuu2+xHxIVuefH+ZO6Jn7t2I6vngM2cuUKB6szuxR3
 g6zmX9dHFfPZLncd7esl/WKUPXkX0Kho9KcV7CZDMLOb3e5sIUS8IWexmqjFfboNkuJC
 v24211pz0ChHvxmDloNcbH1k9vbREJ08Uyxe97w7ipGlXGtnZxmt87DupNrhaaq/70Cy
 UubR2c14ZXGJFvoocF7JQGwPu5/c+64NmVDrT1olC8Eh3RgJCRP1/jyrrIgwTn5cV9HV
 06VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=OV2BQf8hMKivEDO7apQjIkdGmvCaXSjvoYAlWI9j/b4=;
 b=dps0ec6G5CxZ7xL6nsokTqO8WQUSU92Y/eNGbkKcnGp0SrRsT3D5yyrEi8gh3JWmUw
 qXUc0n5TBMdFdjZrY8TnfH2ClLLn9nfZPcQU0c250TiiKJJFx8t8dzp3v6LminMHEG4F
 O9iJig3yMBIZ6bJUoRVYjMoVzsOemCDYoElbKZdpL5yaN8iDwPeNfvNRlzc/02AHlRB6
 Du3JiZf84pxm9OxISTVaViH8LEmzCmd8wEaGqkTPb723Kj5zLJLoosOqcYadP48H3CMe
 7jx1Jfzlt5gOX/jP1ZkSM8SQeptqaqLlsv4UAIjIB0mxVGfiy7Npwz99Wz3FpZIw5Oa4
 Htfg==
X-Gm-Message-State: AOAM532rrsF1/KqK4vqpHS5bNnY027PXd+SsVsKaX1e7IpF+OkysF7m4
 n0bsH1qoDsdLbu1SbKQXHJe/+w==
X-Google-Smtp-Source: ABdhPJxc3GtVDdQh3bNrCjdPgWWdoPXzc8FykOGbffd7ENkM8IB9IiU0FTPwdOgEv89aKwB6QWAtgg==
X-Received: by 2002:a05:600c:3c8c:b0:38e:4c59:6852 with SMTP id
 bg12-20020a05600c3c8c00b0038e4c596852mr2905979wmb.194.1650021202227; 
 Fri, 15 Apr 2022 04:13:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a5d45cb000000b0020a810f7726sm485192wrs.5.2022.04.15.04.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 04:13:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 86CE91FFB7;
 Fri, 15 Apr 2022 12:13:20 +0100 (BST)
References: <20220414112902.41390-1-codeguy.moteen@gmail.com>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Moteen Shah <moteenshah.02@gmail.com>
Subject: Re: [PATCH v1] virtio/virtio.c: include virtio prefix in error message
Date: Fri, 15 Apr 2022 12:10:17 +0100
In-reply-to: <20220414112902.41390-1-codeguy.moteen@gmail.com>
Message-ID: <87lew6sipb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Moteen Shah <moteenshah.02@gmail.com> writes:

> From: Moteen Shah <moteenshah.02@gmail.com>
>
> The error message in virtio_init_region_cache()
> is given a prefix virtio.

It seems a shame considering we have a common virtio_error function that
we couldn't do it in one place. One option would be to make virtio_error
a macro that could insert __func__ in place:

  #define virtio_error(vdev, fmt, ...)                            \
      virtio_error_impl(vdev, "%s: " fmt, __func__, ## __VA_ARGS__);

  void virtio_error_impl(VirtIODevice *vdev, const char *fmt, ...) G_GNUC_P=
RINTF(2, 3);

and make rename the function in virtio.c. As the functions calling this
all tend to have virtio in their names anyway. What do you think?

>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/230
> Buglink: https://bugs.launchpad.net/qemu/+bug/1919021``
>
> Signed-off-by: Moteen Shah <moteenshah.02@gmail.com>
> ---
>  hw/virtio/virtio.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 9d637e043e..f31427bd41 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -174,7 +174,7 @@ static void virtio_init_region_cache(VirtIODevice *vd=
ev, int n)
>      len =3D address_space_cache_init(&new->desc, vdev->dma_as,
>                                     addr, size, packed);
>      if (len < size) {
> -        virtio_error(vdev, "Cannot map desc");
> +        virtio_error(vdev, "Virtio cannot map desc");
>          goto err_desc;
>      }
>=20=20
> @@ -182,7 +182,7 @@ static void virtio_init_region_cache(VirtIODevice *vd=
ev, int n)
>      len =3D address_space_cache_init(&new->used, vdev->dma_as,
>                                     vq->vring.used, size, true);
>      if (len < size) {
> -        virtio_error(vdev, "Cannot map used");
> +        virtio_error(vdev, "Virtio cannot map used");
>          goto err_used;
>      }
>=20=20
> @@ -190,7 +190,7 @@ static void virtio_init_region_cache(VirtIODevice *vd=
ev, int n)
>      len =3D address_space_cache_init(&new->avail, vdev->dma_as,
>                                     vq->vring.avail, size, false);
>      if (len < size) {
> -        virtio_error(vdev, "Cannot map avail");
> +        virtio_error(vdev, "Virtio cannot map avail");
>          goto err_avail;
>      }


--=20
Alex Benn=C3=A9e

