Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DDE48B18E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 17:06:09 +0100 (CET)
Received: from localhost ([::1]:53964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Jey-0005jp-8L
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 11:06:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7JbB-0003jG-AJ
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 11:02:13 -0500
Received: from [2a00:1450:4864:20::52c] (port=37723
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7Jb9-0004WM-HH
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 11:02:13 -0500
Received: by mail-ed1-x52c.google.com with SMTP id o6so69132962edc.4
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 08:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=RxKhG8vUyoLlUeFGuuR0mfdiR6eI4f1Q87GkZykGciw=;
 b=F6Sls14lRlbkkdGu85d72e5clIEFjX0UYco54iYlGhN2yhZdMf6+0zBsIc6mhDbYf8
 KACl8fgHAW9PJuzG1j7H6yy/UiqXFUWWA2+lvNzgRJfPRXCTk+HBizVUZNKOpKQWAR6R
 bmONMCi9jXbzz+KHsYmROvqw0iX9Ojmu9Ckei8UHkhqXXJ3CLYmfNMGobkNeAmcwC9KH
 hAITZaASlVG9/fYHaMIirUxmkM5KbW3sEGYxNv9nt3iX7LlldrDFLzFlYUyjjjVepoTC
 LbngDoec/RmrWo/8L6DJR9dPQZl0/C78DjygCDZ79Bf4dieyIQGoB9eNO9/2gRrgCNXL
 xUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=RxKhG8vUyoLlUeFGuuR0mfdiR6eI4f1Q87GkZykGciw=;
 b=Xdb8tdzdFv2thsHDU42C4HAuwrrd5pacYx5s6ILaRgtG/+mesf7DNmaWOCcZ7nZ7SX
 OMtfOXfEXbKAIHJlfEV+7GOc9w38LHDDD9LhG4il0PY9417bk7K3UPTsJMrDjmJdzyaX
 C0bT/wuljopW0GzBscNAMFGCh15Z0QRkMY+Op80rKskqSVeDyR+QF4tzc+D1jy5qiHfi
 fXoBNU0dRJ5ATwWOVMJ/+0FqaOCoQWLVCADHLsSZkDkN0CqG012DOl3VcuyFZqRwpVMQ
 uum8cP5QHA8gJDl8nM/WrtAeHx+E75RcB614xNC0bp7bk5fITpq7yIXleKyGCZgh0XeM
 k+zA==
X-Gm-Message-State: AOAM531ciaSdYon0q4EQuI8gJlLXaTpZVHripbaXj/dxZPHGTcHOErWv
 IqHuQRYOkuAfBEakM/vPxq3afA==
X-Google-Smtp-Source: ABdhPJwIo0MTal48SsqnxqYz/NWthMYSo+L+aSsGp6tKQTXjKfmKX7BJNOmQ4aDJmZJk8vfxFywjmg==
X-Received: by 2002:a05:6402:849:: with SMTP id b9mr579883edz.51.1641916924672; 
 Tue, 11 Jan 2022 08:02:04 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b4sm3708016ejl.129.2022.01.11.08.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 08:02:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EF6DA1FFB7;
 Tue, 11 Jan 2022 16:02:02 +0000 (GMT)
References: <20211209145601.331477-1-peter.griffin@linaro.org>
 <20211209145601.331477-4-peter.griffin@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 3/8] vhost-user-video: boiler plate code for
 vhost-user-video device
Date: Tue, 11 Jan 2022 14:58:01 +0000
In-reply-to: <20211209145601.331477-4-peter.griffin@linaro.org>
Message-ID: <87wnj6b6rp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: marcandre.lureau@redhat.com, stratos-dev@op-lists.linaro.org,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Griffin <peter.griffin@linaro.org> writes:

> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  hw/display/Kconfig                   |   5 +
>  hw/display/meson.build               |   3 +
>  hw/display/vhost-user-video.c        | 386 +++++++++++++++++++++++++++
>  include/hw/virtio/vhost-user-video.h |  41 +++
>  4 files changed, 435 insertions(+)
>  create mode 100644 hw/display/vhost-user-video.c
>  create mode 100644 include/hw/virtio/vhost-user-video.h
>
> diff --git a/hw/display/Kconfig b/hw/display/Kconfig
> index a2306b67d8..186163b015 100644
> --- a/hw/display/Kconfig
> +++ b/hw/display/Kconfig
> @@ -118,6 +118,11 @@ config VHOST_USER_VGA
>      default y
>      depends on VIRTIO_VGA && VHOST_USER_GPU
>=20=20
> +config VHOST_USER_VIDEO
> +    bool
> +    default y
> +    depends on VIRTIO && VHOST_USER
> +
>  config DPCD
>      bool
>      select AUX
> diff --git a/hw/display/meson.build b/hw/display/meson.build
> index 861c43ff98..48284528cf 100644
> --- a/hw/display/meson.build
> +++ b/hw/display/meson.build
> @@ -37,6 +37,9 @@ softmmu_ss.add(when: 'CONFIG_MACFB', if_true: files('ma=
cfb.c'))
>  softmmu_ss.add(when: 'CONFIG_NEXTCUBE', if_true: files('next-fb.c'))
>=20=20
>  specific_ss.add(when: 'CONFIG_VGA', if_true: files('vga.c'))
> +specific_ss.add(when: 'CONFIG_VHOST_USER_VIDEO', if_true: files('vhost-u=
ser-video.c'))
> +specific_ss.add(when: ['CONFIG_VHOST_USER_VIDEO', 'CONFIG_VIRTIO_PCI' ],
> +  if_true: files('vhost-user-video-pci.c'))
>=20=20
>  if config_all_devices.has_key('CONFIG_QXL')
>    qxl_ss =3D ss.source_set()
> diff --git a/hw/display/vhost-user-video.c b/hw/display/vhost-user-video.c
> new file mode 100644
> index 0000000000..506e350365
> --- /dev/null
> +++ b/hw/display/vhost-user-video.c
> @@ -0,0 +1,386 @@
> +/*
> + * Vhost-user VIDEO virtio device
> + *
> + * This is the boilerplate for instantiating a vhost-user device
> + * implementing a virtio-video device.
> + *
> + * The virtio video decoder and encoder devices are virtual devices that
> + * support encoding and decoding respectively.
> + *
> + * The actual back-end for this driver is the vhost-user-video daemon.
> + * The code here just connects up the device in QEMU and allows it to
> + * be instantiated.
> + *
> + * Copyright (c) 2021 Linaro Ltd
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/virtio/virtio-bus.h"
> +#include "hw/virtio/vhost-user-video.h"
> +#include "qemu/error-report.h"
> +
> +/* currently there is no VIDEO enc/dec defined in Linux virtio_ids.h */
> +#define VIRTIO_ID_VIDEO_ENC         30
> +#define VIRTIO_ID_VIDEO_DEC         31
> +#define MAX_CAPS_LEN 4096
> +
> +static void vhost_user_video_get_config(VirtIODevice *vdev, uint8_t *con=
fig)
> +{
> +    VHostUserVIDEO *video =3D VHOST_USER_VIDEO(vdev);
> +    struct virtio_video_config *vconfig =3D (struct virtio_video_config =
*)config;
> +    int ret;
> +    Error *local_err =3D NULL;
> +
> +    memset(config, 0, sizeof(struct virtio_video_config));
> +
> +    ret =3D vhost_dev_get_config(&video->vhost_dev, config,
> +                               sizeof(struct virtio_video_config), &loca=
l_err);
> +    if (ret) {
> +        error_report("vhost-user-video: get device config space failed");
> +
> +        /*TODO vhost_dev_get_config() fails so for now lets just set
>  it here */

Is this a lifetime issue?=20

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

