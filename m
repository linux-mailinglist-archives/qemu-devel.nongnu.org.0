Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96C8668A97
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 05:11:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGBOI-0001jo-Pv; Thu, 12 Jan 2023 23:10:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pGBOG-0001jY-Ks
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 23:10:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pGBOE-00012M-Dj
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 23:10:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673583001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3PD9AXeAjlOMbKKET8RLkQIF6abZxODyuoqssKJdQxk=;
 b=WpOQ5D1DBFMlY5q9v/B3aAMRvFC6/P1L8S1x3oC0fR0louOaLSVcx1n5c2MPzCpbnLWC57
 8tkcOvxm/2h/kiPdm0afN+86fe8DgaCC2tIqMfYZKx2Za2ds0JSOXOzd4tvYXdutx7vQOe
 /G/YS7yZqsV51OZMgKf3bKXOQ+Hk9VA=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-364-3hulqEl3PL6jYktc0Ql9uw-1; Thu, 12 Jan 2023 23:09:59 -0500
X-MC-Unique: 3hulqEl3PL6jYktc0Ql9uw-1
Received: by mail-oo1-f71.google.com with SMTP id
 y19-20020a4a9c13000000b004e3c9193e5eso7661685ooj.11
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 20:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3PD9AXeAjlOMbKKET8RLkQIF6abZxODyuoqssKJdQxk=;
 b=Mh9l1UPfLM6pnPhPhN6us3sptIlI8dMWPj777JHZJgQ3matHFM8ZvXK7BqGTm1Jdqs
 jiDF49XTFgIYiWHPuFqIcG54KXl6qx3+ekXjgaZhtS5Czto6qrdHZUdQbkCIs/sf1jqj
 uIWYr0DD5D2CNTJK/UuIS4fY82T4jyu6LP/Evo9Ptqsu9qaU2VOLjFOC44rwHYJPtPKO
 xPMZ2lzBqqBmGEGQ+iBCIFke3+0O8PaTrzyMTcvnuk/loonB1UpjMvifUo32FEsmOnuC
 upY9Z5QiH6YCDUYvjI219riCPmatTOQ1Yz+o0SSJvpj1GFzcyYh0ZZdQ1+fptKjuBdFw
 J+yA==
X-Gm-Message-State: AFqh2krquY4Kftr9f4bOxGBHT/LhAzVciDx1/vUT/LbmKXLshxHL0iIV
 DEE0K5zgDFhvyRUX5G/ykOj6D6uzFC3jFuWznutpIGcMTw9MinOxmrfltu1YSMx5NWp5Ww5feVC
 XxvIjYhLD9nO153dqSIdw3qNW1RUCSt0=
X-Received: by 2002:a05:6870:9e9a:b0:15b:96b5:9916 with SMTP id
 pu26-20020a0568709e9a00b0015b96b59916mr1326836oab.280.1673582997315; 
 Thu, 12 Jan 2023 20:09:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvjZZkGNh/sQ7kRosI4NFLFULLJF4FpFugFoCoOKHeJfCoN6WzW/UDtH1tJ0/mzBh+JNNNMLWjKngMjdk+AHFc=
X-Received: by 2002:a05:6870:9e9a:b0:15b:96b5:9916 with SMTP id
 pu26-20020a0568709e9a00b0015b96b59916mr1326818oab.280.1673582996996; Thu, 12
 Jan 2023 20:09:56 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-5-eperezma@redhat.com>
In-Reply-To: <20230112172434.760850-5-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 13 Jan 2023 12:09:45 +0800
Message-ID: <CACGkMEvo4fS0AZ7_i3MnpLJwic7VEX3x7BaaB=w1t7y2Fri9EQ@mail.gmail.com>
Subject: Re: [RFC v2 04/13] vdpa: rewind at get_base, not set_base
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com, 
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Jan 13, 2023 at 1:24 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> At this moment it is only possible to migrate to a vdpa device running
> with x-svq=3Don. As a protective measure, the rewind of the inflight
> descriptors was done at the destination. That way if the source sent a
> virtqueue with inuse descriptors they are always discarded.
>
> Since this series allows to migrate also to passthrough devices with no
> SVQ, the right thing to do is to rewind at the source so base of vrings
> are correct.
>
> Support for inflight descriptors may be added in the future.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  include/hw/virtio/vhost-backend.h |  4 +++
>  hw/virtio/vhost-vdpa.c            | 46 +++++++++++++++++++------------
>  hw/virtio/vhost.c                 |  3 ++
>  3 files changed, 36 insertions(+), 17 deletions(-)
>
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-=
backend.h
> index c5ab49051e..ec3fbae58d 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -130,6 +130,9 @@ typedef bool (*vhost_force_iommu_op)(struct vhost_dev=
 *dev);
>
>  typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
>                                         int fd);
> +
> +typedef void (*vhost_reset_status_op)(struct vhost_dev *dev);
> +
>  typedef struct VhostOps {
>      VhostBackendType backend_type;
>      vhost_backend_init vhost_backend_init;
> @@ -177,6 +180,7 @@ typedef struct VhostOps {
>      vhost_get_device_id_op vhost_get_device_id;
>      vhost_force_iommu_op vhost_force_iommu;
>      vhost_set_config_call_op vhost_set_config_call;
> +    vhost_reset_status_op vhost_reset_status;
>  } VhostOps;
>
>  int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 542e003101..28a52ddc78 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1132,14 +1132,23 @@ static int vhost_vdpa_dev_start(struct vhost_dev =
*dev, bool started)
>      if (started) {
>          memory_listener_register(&v->listener, &address_space_memory);
>          return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> -    } else {
> -        vhost_vdpa_reset_device(dev);
> -        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> -                                   VIRTIO_CONFIG_S_DRIVER);
> -        memory_listener_unregister(&v->listener);
> +    }
>
> -        return 0;
> +    return 0;
> +}
> +
> +static void vhost_vdpa_reset_status(struct vhost_dev *dev)
> +{
> +    struct vhost_vdpa *v =3D dev->opaque;
> +
> +    if (dev->vq_index + dev->nvqs !=3D dev->vq_index_end) {
> +        return;
>      }
> +
> +    vhost_vdpa_reset_device(dev);
> +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> +                                VIRTIO_CONFIG_S_DRIVER);
> +    memory_listener_unregister(&v->listener);
>  }
>
>  static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
> @@ -1182,18 +1191,7 @@ static int vhost_vdpa_set_vring_base(struct vhost_=
dev *dev,
>                                         struct vhost_vring_state *ring)
>  {
>      struct vhost_vdpa *v =3D dev->opaque;
> -    VirtQueue *vq =3D virtio_get_queue(dev->vdev, ring->index);
>
> -    /*
> -     * vhost-vdpa devices does not support in-flight requests. Set all o=
f them
> -     * as available.
> -     *
> -     * TODO: This is ok for networking, but other kinds of devices might
> -     * have problems with these retransmissions.
> -     */
> -    while (virtqueue_rewind(vq, 1)) {
> -        continue;
> -    }
>      if (v->shadow_vqs_enabled) {
>          /*
>           * Device vring base was set at device start. SVQ base is handle=
d by
> @@ -1212,6 +1210,19 @@ static int vhost_vdpa_get_vring_base(struct vhost_=
dev *dev,
>      int ret;
>
>      if (v->shadow_vqs_enabled) {
> +        VirtQueue *vq =3D virtio_get_queue(dev->vdev, ring->index);
> +
> +        /*
> +         * vhost-vdpa devices does not support in-flight requests. Set a=
ll of
> +         * them as available.
> +         *
> +         * TODO: This is ok for networking, but other kinds of devices m=
ight
> +         * have problems with these retransmissions.
> +         */
> +        while (virtqueue_rewind(vq, 1)) {
> +            continue;
> +        }
> +
>          ring->num =3D virtio_queue_get_last_avail_idx(dev->vdev, ring->i=
ndex);
>          return 0;
>      }
> @@ -1326,4 +1337,5 @@ const VhostOps vdpa_ops =3D {
>          .vhost_vq_get_addr =3D vhost_vdpa_vq_get_addr,
>          .vhost_force_iommu =3D vhost_vdpa_force_iommu,
>          .vhost_set_config_call =3D vhost_vdpa_set_config_call,
> +        .vhost_reset_status =3D vhost_vdpa_reset_status,

Can we simply use the NetClient stop method here?

Thanks

>  };
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index eb8c4c378c..a266396576 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -2049,6 +2049,9 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIOD=
evice *vdev, bool vrings)
>                               hdev->vqs + i,
>                               hdev->vq_index + i);
>      }
> +    if (hdev->vhost_ops->vhost_reset_status) {
> +        hdev->vhost_ops->vhost_reset_status(hdev);
> +    }
>
>      if (vhost_dev_has_iommu(hdev)) {
>          if (hdev->vhost_ops->vhost_set_iotlb_callback) {
> --
> 2.31.1
>


