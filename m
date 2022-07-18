Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A9D577B24
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 08:37:22 +0200 (CEST)
Received: from localhost ([::1]:39354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDKNc-0001LP-9x
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 02:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDKLG-0008Gp-91
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 02:34:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDKLC-0008Bm-Sg
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 02:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658126089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BmR0VRnRkHVUGhKDkG7LHmrOBRh/rRkGwVTgX/CDfs8=;
 b=gcWzxDjNS+nfdlNyiVkuYnvOaOvVpIaGPmUlPOXy9Kq87GclHXK5909/r6cO1aFrObTL9k
 b/89mTGJxNCv278/ViU6Fy8lngW4Y1hkYg6j8S6R6a0RlPnydiVtO16Xjip6GXkKCmookA
 ieXjvtNMgJeLfnm4rCkh5G7lWhaHStA=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-YjhgipDcNqi_qFiotbUGuw-1; Mon, 18 Jul 2022 02:34:48 -0400
X-MC-Unique: YjhgipDcNqi_qFiotbUGuw-1
Received: by mail-lj1-f198.google.com with SMTP id
 t14-20020a2e780e000000b0025d63d1c965so1741714ljc.13
 for <qemu-devel@nongnu.org>; Sun, 17 Jul 2022 23:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BmR0VRnRkHVUGhKDkG7LHmrOBRh/rRkGwVTgX/CDfs8=;
 b=jncWxYFwS2LoYMk7N65y3sVGFeydIOMGHHHZcWmRAx7R++lh9NsPr94CYqgfSbAYKJ
 IeEVYPhgRF4NBmEPcKloSL0nne2N5Vn4cbCxeTn6WPtzwCCbfG2jBDXsXgiZXrv0UXgV
 vaR6/y8odtuL+SChm4cRktcLZIt5VtzkMqPqvW7iHujmcyJdVaG/EI5BE6dk1obD9mBY
 Hr2Rpud/irInolMQy7iEkBAaIbze+orrbvu3M6ixh7gHc37beZgg3vVshd1IIUIszQBX
 Uh50lUXHKdTLNcgnnQEXKzgaPAeRfOKneLyUuCOQUL33y9V5Rlz4Tk/m0R0iSl/tK8al
 7syg==
X-Gm-Message-State: AJIora9Acw7MQz9X36zCxipvJlu8y2XtNa+UzTo+eywMmytHe+ATZNtK
 Lxynh+g0mLBXDKWY8GHHTWDa76Twg6tCjzYIwxcikG+bXA/tQXT7qRVse7/C9kv2czU38IB3v65
 luf/oMZ5ir8w9MEUc5/aUVc+mvqndiCo=
X-Received: by 2002:a2e:1451:0:b0:25d:7899:eddc with SMTP id
 17-20020a2e1451000000b0025d7899eddcmr11398199lju.251.1658126086665; 
 Sun, 17 Jul 2022 23:34:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uXDKxG0/RK6aD7QOkURjlIw6OSoKGG8ZEc4ysBtK0SGPnvFKgc2RAMGFi6Q0zpmDA2KjVbrXrKqgTVa+NXqv4=
X-Received: by 2002:a2e:1451:0:b0:25d:7899:eddc with SMTP id
 17-20020a2e1451000000b0025d7899eddcmr11398173lju.251.1658126086381; Sun, 17
 Jul 2022 23:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220716113407.2730331-1-eperezma@redhat.com>
 <20220716113407.2730331-5-eperezma@redhat.com>
In-Reply-To: <20220716113407.2730331-5-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 18 Jul 2022 14:34:35 +0800
Message-ID: <CACGkMEtuMB8iB=4JYCWSwgq46enfEWuDxwSoT4J+v4RzNSVY8w@mail.gmail.com>
Subject: Re: [RFC PATCH 04/12] vdpa: delay set_vring_ready after DRIVER_OK
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Gautam Dawar <gdawar@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Sat, Jul 16, 2022 at 7:34 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> To restore the device in the destination of a live migration we send the
> commands through control virtqueue. For a device to read CVQ it must
> have received DRIVER_OK status bit.
>
> However this open a window where the device could start receiving
> packets in rx queue 0 before it receive the RSS configuration.

A note here is that, after chatting with Michael, the device should
not start processing the buffer until a kick. So I wonder if it's more
than enough to not kick the data vq paris until we've recovered the
state via cvq?


> To avoid
> that, we will not send vring_enable until all configuration is used by
> the device.
>
> As a first step, reverse the DRIVER_OK and SET_VRING_ENABLE steps.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-vdpa.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 906c365036..1d8829c619 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -730,13 +730,18 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev=
 *dev, int idx)
>      return idx;
>  }
>
> +/**
> + * Set ready all vring of the device

It should be better to mention, for device we mean virtio device
instead of vhost device (which we may have multiple ones if mq is
enabled).

Thanks

> + *
> + * @dev: Vhost device
> + */
>  static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>  {
>      int i;
>      trace_vhost_vdpa_set_vring_ready(dev);
> -    for (i =3D 0; i < dev->nvqs; ++i) {
> +    for (i =3D 0; i < dev->vq_index_end; ++i) {
>          struct vhost_vring_state state =3D {
> -            .index =3D dev->vq_index + i,
> +            .index =3D i,
>              .num =3D 1,
>          };
>          vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
> @@ -1111,7 +1116,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev *d=
ev, bool started)
>          if (unlikely(!ok)) {
>              return -1;
>          }
> -        vhost_vdpa_set_vring_ready(dev);
>      } else {
>          ok =3D vhost_vdpa_svqs_stop(dev);
>          if (unlikely(!ok)) {
> @@ -1125,16 +1129,22 @@ static int vhost_vdpa_dev_start(struct vhost_dev =
*dev, bool started)
>      }
>
>      if (started) {
> +        int r;
> +
>          memory_listener_register(&v->listener, &address_space_memory);
> -        return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> +        r =3D vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> +        if (unlikely(r)) {
> +            return r;
> +        }
> +        vhost_vdpa_set_vring_ready(dev);
>      } else {
>          vhost_vdpa_reset_device(dev);
>          vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>                                     VIRTIO_CONFIG_S_DRIVER);
>          memory_listener_unregister(&v->listener);
> -
> -        return 0;
>      }
> +
> +    return 0;
>  }
>
>  static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
> --
> 2.31.1
>


