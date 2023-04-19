Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0D86E7E54
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 17:35:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp9oj-0007Te-Jj; Wed, 19 Apr 2023 11:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pp9oi-0007Sn-7y
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 11:33:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pp9og-0002UM-FE
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 11:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681918432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jDC/bBlJ7tshvPQDKNkKREcN3A0jZ/ruVhFnOwAPdYo=;
 b=ZHxwlxo4ABvnYgG/8z7O91RJR+XhU+yEUfu/ICr2SHFDl2yMxQpjSlgCuwQVnBroVMPeAZ
 0wvDtiF+tOlzUYlFgI1EWooo1qEFxdMEok9DDnimvU9pGn61X5bvLj1jXd/E6yTnHoXho1
 8ibNEXyv/0uubQHK2vT22i/CcJJ2V24=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-aMnRlv6vOW2I2tXYvkCyWw-1; Wed, 19 Apr 2023 11:33:51 -0400
X-MC-Unique: aMnRlv6vOW2I2tXYvkCyWw-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-54f8b46f399so1645207b3.10
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 08:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681918430; x=1684510430;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jDC/bBlJ7tshvPQDKNkKREcN3A0jZ/ruVhFnOwAPdYo=;
 b=ekCIeZg7kbT896r1KnjfBtm9EHYXCBFW2qq/iDg4sdQgoKTxsY2parNqFmJaA0aCp4
 q8Mtm69eKuSIVBnuZbmkWMYRgOOt+MhesaRLfm2CfIFfNDtjE/E8HBZXrPPZf70UpdeJ
 Bp5YnHaKhwIgt0ywMzjQ1bEYjzzGjqao6ufz+Hs2pIIxGVyD0ffClDs6vY52nCDCA+Km
 RAgP1qXkzLrjpMjsd+rb6gwtbFYGxLfTiokCws03yIq3bvQs6FdpKxiiox/8IfjBgNN6
 dD4IRQI0iDHjea5VuWpQUZdMr8bZ78Cw1lOOVSKaqC9FUERTtJcfRJvLskYTYzsS3Z00
 /REQ==
X-Gm-Message-State: AAQBX9d3ypiVBKvxqf5U9lwPx4nzGzh/3dh8bljVrhxGRxHy7gCJiQZt
 x8PP+RtforK3m3ejDLIcs7s65rTKh6zt8bduYCVYG6twrF6lxaYc0rkmm0oHwqNpwwm4oixCV7Z
 fd0gQ0ZGOvX+T4aBB0BXFLGS/oiqKrKp/TuREV7jrxw==
X-Received: by 2002:a05:6902:1106:b0:b8f:54c8:9b52 with SMTP id
 o6-20020a056902110600b00b8f54c89b52mr70196ybu.51.1681918430351; 
 Wed, 19 Apr 2023 08:33:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350YTg14kKaaFFFUd1+vvBsi2Z/LzwG7yZQ+6aLfZvFul4Y6j5Md2KPaQjdSMwkdgEHZ5JUKhZ4ZSzpfaN+IYV9k=
X-Received: by 2002:a05:6902:1106:b0:b8f:54c8:9b52 with SMTP id
 o6-20020a056902110600b00b8f54c89b52mr70169ybu.51.1681918430113; Wed, 19 Apr
 2023 08:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230418225638.1467969-1-peili.dev@gmail.com>
In-Reply-To: <20230418225638.1467969-1-peili.dev@gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 19 Apr 2023 17:33:13 +0200
Message-ID: <CAJaqyWebSowMMWh+HCjj7tmbA3Ey6C69T=SPA4k+6fd_-GjfoA@mail.gmail.com>
Subject: Re: [PATCH 1/2] Reduce vdpa initialization / startup overhead
To: peili.dev@gmail.com
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>, 
 Michael Tsirkin <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Apr 19, 2023 at 12:56=E2=80=AFAM <peili.dev@gmail.com> wrote:
>
> From: Pei Li <peili.dev@gmail.com>
>
> Currently, part of the vdpa initialization / startup process
> needs to trigger many ioctls per vq, which is very inefficient
> and causing unnecessary context switch between user mode and
> kernel mode.
>
> This patch creates an additional ioctl() command, namely
> VHOST_VDPA_GET_VRING_GROUP_BATCH, that will batching
> commands of VHOST_VDPA_GET_VRING_GROUP into a single
> ioctl() call.
>

It seems to me you forgot to send the 0/2 cover letter :).

Please include the time we save thanks to avoiding the repetitive
ioctls in each patch.

CCing Jason and Michael.

> Signed-off-by: Pei Li <peili.dev@gmail.com>
> ---
>  hw/virtio/vhost-vdpa.c                       | 31 +++++++++++++++-----
>  include/standard-headers/linux/vhost_types.h |  3 ++
>  linux-headers/linux/vhost.h                  |  7 +++++
>  3 files changed, 33 insertions(+), 8 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index bc6bad23d5..6d45ff8539 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -679,7 +679,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_de=
v *dev)
>      uint64_t f =3D 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
>          0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
>          0x1ULL << VHOST_BACKEND_F_IOTLB_ASID |
> -        0x1ULL << VHOST_BACKEND_F_SUSPEND;
> +        0x1ULL << VHOST_BACKEND_F_SUSPEND |
> +        0x1ULL << VHOST_BACKEND_F_IOCTL_BATCH;
>      int r;
>
>      if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)) {
> @@ -731,14 +732,28 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev=
 *dev, int idx)
>
>  static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>  {
> -    int i;
> +    int i, nvqs =3D dev->nvqs;
> +    uint64_t backend_features =3D dev->backend_cap;
> +
>      trace_vhost_vdpa_set_vring_ready(dev);
> -    for (i =3D 0; i < dev->nvqs; ++i) {
> -        struct vhost_vring_state state =3D {
> -            .index =3D dev->vq_index + i,
> -            .num =3D 1,
> -        };
> -        vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
> +
> +    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOCTL_BATCH))) {
> +        for (i =3D 0; i < nvqs; ++i) {
> +            struct vhost_vring_state state =3D {
> +                .index =3D dev->vq_index + i,
> +                .num =3D 1,
> +            };
> +            vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
> +        }
> +    } else {
> +        struct vhost_vring_state states[nvqs + 1];
> +        states[0].num =3D nvqs;
> +        for (i =3D 1; i <=3D nvqs; ++i) {
> +            states[i].index =3D dev->vq_index + i - 1;
> +            states[i].num =3D 1;
> +        }
> +

I think it's more clear to share the array of vhost_vring_state
states[nvqs + 1], and then fill it either in one shot with
VHOST_VDPA_SET_VRING_ENABLE_BATCH or individually with
VHOST_VDPA_SET_VRING_ENABLE.

The same feedback goes for VHOST_VDPA_GET_VRING_GROUP_BATCH in the next pat=
ch.

> +        vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE_BATCH, &states[=
0]);
>      }
>      return 0;

This comment is previous to your patch but I just realized we don't
check the return value of vhost_vdpa_call. Maybe it is worth
considering addressing that in this series too.

>  }
> diff --git a/include/standard-headers/linux/vhost_types.h b/include/stand=
ard-headers/linux/vhost_types.h
> index c41a73fe36..068d0e1ceb 100644
> --- a/include/standard-headers/linux/vhost_types.h
> +++ b/include/standard-headers/linux/vhost_types.h
> @@ -164,4 +164,7 @@ struct vhost_vdpa_iova_range {
>  /* Device can be suspended */
>  #define VHOST_BACKEND_F_SUSPEND  0x4
>
> +/* IOCTL requests can be batched */
> +#define VHOST_BACKEND_F_IOCTL_BATCH 0x6
> +
>  #endif
> diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
> index f9f115a7c7..4c9ddd0a0e 100644
> --- a/linux-headers/linux/vhost.h
> +++ b/linux-headers/linux/vhost.h
> @@ -180,4 +180,11 @@
>   */
>  #define VHOST_VDPA_SUSPEND             _IO(VHOST_VIRTIO, 0x7D)
>
> +/* Batch version of VHOST_VDPA_SET_VRING_ENABLE
> + *
> + * Enable/disable the ring while batching the commands.
> + */
> +#define VHOST_VDPA_SET_VRING_ENABLE_BATCH      _IOW(VHOST_VIRTIO, 0x7F, =
\
> +                                            struct vhost_vring_state)
> +

These headers should be updated with update-linux-headers.sh. To be
done that way we need the changes merged in the kernel before.

We can signal that the series is not ready for inclusion with the
subject [RFC. PATCH], like [1], and note it in the commit message.
That way, you can keep updating the header manually for demonstration
purposes.

Thanks!

[1] https://lore.kernel.org/qemu-devel/20220413163206.1958254-23-eperezma@r=
edhat.com/


