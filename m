Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B3250096C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 11:13:08 +0200 (CEST)
Received: from localhost ([::1]:49288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nevXH-0005ce-Ck
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 05:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nevUZ-0003Yr-5t
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 05:10:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nevUW-00060Z-HI
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 05:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649927415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AzfLclF13GsmISTufUCr38bM1cPObRbU2iSg5Bvksc4=;
 b=HobffraN3bvIx5Z8SYMo2qY6nbgECwm22LNmKEVoT0BAdOUyq3JPEMOaRdoig3plgBZKFb
 vGqQgtZ10YVXich7i8xWwBb0SD16lIR01PloJff+ted8+sJ6eyvaocmBoMboEgRD5M74vC
 vcQej4gbB0nZLu59vReRt/wZU3i4EyQ=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-HF7hIaFbMwqdd3KoMPr4Ug-1; Thu, 14 Apr 2022 05:10:14 -0400
X-MC-Unique: HF7hIaFbMwqdd3KoMPr4Ug-1
Received: by mail-lj1-f197.google.com with SMTP id
 c6-20020a2ea786000000b0024c3a85d203so939123ljf.5
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 02:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AzfLclF13GsmISTufUCr38bM1cPObRbU2iSg5Bvksc4=;
 b=Iy+3QI50xxbSGMJltJF2psxY3MNXUc4j0Ej+yfWzkjds/kuutDZqESinB7tjNILx0V
 hYL2Mzao8YyoQOjncc4AdPxOmf7Zwc89NdWG3xdrHDvXFgGAdA37TuH7pk0u3VILbn8b
 7H/bYTBP1uKz3y1tFL9b9GrY58tcYdxKx4HXTrlarsOrujC9xVjwjsUaWkHlGTmFYID7
 OKEaFZ4aufshU1PjSsXNdMuODEfQKS+WoQ0BrhPM9d2Cs/wH9HDoCwvJB4Zq7jVHaWsh
 BR6dLmhaBVTD/j/malTvFEkmjLAsbIYuYCXPo3R0sWMSC+KDCXPlaT7lwAAGGavW+qad
 05zA==
X-Gm-Message-State: AOAM533oyM307DdZJ4uU8Eht8AEMoJV/oe6AXcflXAk7q82ghMrDIXuC
 VIROzWborrWxiNWE8q/Co1g9d4KfzxNHmNmlMMEgm1BS6uY3hvbvB8EmqdhvuFo6wnbZKbEp7OJ
 NzXWZC7XNKdViOj2Tq81xqoei/axg5F4=
X-Received: by 2002:a05:6512:1156:b0:46b:b775:6359 with SMTP id
 m22-20020a056512115600b0046bb7756359mr1317168lfg.587.1649927412790; 
 Thu, 14 Apr 2022 02:10:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuKK/OCf+FItgRi7kUKuEwe5kmYYAiAirVkouFqWThmLfWp1pc+BX/5UluJYoTiflgfJjwVtEgxH35vQulieQ=
X-Received: by 2002:a05:6512:1156:b0:46b:b775:6359 with SMTP id
 m22-20020a056512115600b0046bb7756359mr1317125lfg.587.1649927411828; Thu, 14
 Apr 2022 02:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-17-eperezma@redhat.com>
In-Reply-To: <20220413163206.1958254-17-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 14 Apr 2022 17:10:00 +0800
Message-ID: <CACGkMEsyZ1UuYR=B=o3dBcSszOFSs8poKhRrUq75LrpnGbciuA@mail.gmail.com>
Subject: Re: [RFC PATCH v7 16/25] vdpa: control virtqueue support on shadow
 virtqueue
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 14, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> Introduce the control virtqueue support for vDPA shadow virtqueue. This
> is needed for advanced networking features like multiqueue.
>
> To demonstrate command handling, VIRTIO_NET_F_CTRL_MACADDR and
> VIRTIO_NET_CTRL_MQ are implemented. If vDPA device is started with SVQ
> support and virtio-net driver changes MAC or the number of queues
> virtio-net device model will be updated with the new one.
>
> Others cvq commands could be added here straightforwardly but they have
> been not tested.

If I understand the code correctly, the cvq can still see all the
guest mappings. I wonder if it's simpler to:

1) find a way to reuse the ctrl handler in virtio-net.c
2) do not expose all the guest memory to shadow cvq.

>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  net/vhost-vdpa.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 77 insertions(+), 3 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index a8dde49198..38e6912255 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -11,6 +11,7 @@
>
>  #include "qemu/osdep.h"
>  #include "clients.h"
> +#include "hw/virtio/virtio-net.h"
>  #include "net/vhost_net.h"
>  #include "net/vhost-vdpa.h"
>  #include "hw/virtio/vhost-vdpa.h"
> @@ -69,6 +70,30 @@ const int vdpa_feature_bits[] =3D {
>      VHOST_INVALID_FEATURE_BIT
>  };
>
> +/** Supported device specific feature bits with SVQ */
> +static const uint64_t vdpa_svq_device_features =3D
> +    BIT_ULL(VIRTIO_NET_F_CSUM) |
> +    BIT_ULL(VIRTIO_NET_F_GUEST_CSUM) |
> +    BIT_ULL(VIRTIO_NET_F_CTRL_GUEST_OFFLOADS) |
> +    BIT_ULL(VIRTIO_NET_F_MTU) |
> +    BIT_ULL(VIRTIO_NET_F_MAC) |
> +    BIT_ULL(VIRTIO_NET_F_GUEST_TSO4) |
> +    BIT_ULL(VIRTIO_NET_F_GUEST_TSO6) |
> +    BIT_ULL(VIRTIO_NET_F_GUEST_ECN) |
> +    BIT_ULL(VIRTIO_NET_F_GUEST_UFO) |
> +    BIT_ULL(VIRTIO_NET_F_HOST_TSO4) |
> +    BIT_ULL(VIRTIO_NET_F_HOST_TSO6) |
> +    BIT_ULL(VIRTIO_NET_F_HOST_ECN) |
> +    BIT_ULL(VIRTIO_NET_F_HOST_UFO) |
> +    BIT_ULL(VIRTIO_NET_F_MRG_RXBUF) |
> +    BIT_ULL(VIRTIO_NET_F_STATUS) |
> +    BIT_ULL(VIRTIO_NET_F_CTRL_VQ) |
> +    BIT_ULL(VIRTIO_NET_F_MQ) |
> +    BIT_ULL(VIRTIO_F_ANY_LAYOUT) |
> +    BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR) |
> +    BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> +    BIT_ULL(VIRTIO_NET_F_STANDBY);

I wonder what's the reason for having a dedicated feature whitelist for SVQ=
?

> +
>  VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
>  {
>      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> @@ -196,6 +221,46 @@ static int vhost_vdpa_get_iova_range(int fd,
>      return ret < 0 ? -errno : 0;
>  }
>
> +static void vhost_vdpa_net_handle_ctrl(VirtIODevice *vdev,
> +                                       const VirtQueueElement *elem)
> +{
> +    struct virtio_net_ctrl_hdr ctrl;
> +    virtio_net_ctrl_ack status =3D VIRTIO_NET_ERR;
> +    size_t s;
> +    struct iovec in =3D {
> +        .iov_base =3D &status,
> +        .iov_len =3D sizeof(status),
> +    };
> +
> +    s =3D iov_to_buf(elem->out_sg, elem->out_num, 0, &ctrl, sizeof(ctrl.=
class));
> +    if (s !=3D sizeof(ctrl.class)) {
> +        return;
> +    }
> +
> +    switch (ctrl.class) {
> +    case VIRTIO_NET_CTRL_MAC_ADDR_SET:
> +    case VIRTIO_NET_CTRL_MQ:
> +        break;
> +    default:
> +        return;
> +    };

Any reason that we only support those two commands?

> +
> +    s =3D iov_to_buf(elem->in_sg, elem->in_num, 0, &status, sizeof(statu=
s));
> +    if (s !=3D sizeof(status) || status !=3D VIRTIO_NET_OK) {
> +        return;
> +    }
> +
> +    status =3D VIRTIO_NET_ERR;
> +    virtio_net_handle_ctrl_iov(vdev, &in, 1, elem->out_sg, elem->out_num=
);
> +    if (status !=3D VIRTIO_NET_OK) {

status is guaranteed to be VIRTIO_NET_ERROR, so we hit the error for sure?

Thanks

> +        error_report("Bad CVQ processing in model");
> +    }
> +}
> +
> +static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops =3D {
> +    .used_elem_handler =3D vhost_vdpa_net_handle_ctrl,
> +};
> +
>  static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>                                         const char *device,
>                                         const char *name,
> @@ -225,6 +290,9 @@ static NetClientState *net_vhost_vdpa_init(NetClientS=
tate *peer,
>      s->vhost_vdpa.shadow_vqs_enabled =3D svq;
>      s->vhost_vdpa.iova_tree =3D iova_tree ? vhost_iova_tree_acquire(iova=
_tree) :
>                                NULL;
> +    if (!is_datapath) {
> +        s->vhost_vdpa.shadow_vq_ops =3D &vhost_vdpa_net_svq_ops;
> +    }
>      ret =3D vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index,=
 nvqs);
>      if (ret) {
>          if (iova_tree) {
> @@ -315,9 +383,15 @@ int net_init_vhost_vdpa(const Netdev *netdev, const =
char *name,
>      }
>      if (opts->x_svq) {
>          struct vhost_vdpa_iova_range iova_range;
> -
> -        if (has_cvq) {
> -            error_setg(errp, "vdpa svq does not work with cvq");
> +        uint64_t invalid_dev_features =3D
> +            features & ~vdpa_svq_device_features &
> +            /* Transport are all accepted at this point */
> +            ~MAKE_64BIT_MASK(VIRTIO_TRANSPORT_F_START,
> +                             VIRTIO_TRANSPORT_F_END - VIRTIO_TRANSPORT_F=
_START);
> +
> +        if (invalid_dev_features) {
> +            error_setg(errp, "vdpa svq does not work with features 0x%" =
PRIx64,
> +                       invalid_dev_features);
>              goto err_svq;
>          }
>          vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> --
> 2.27.0
>


