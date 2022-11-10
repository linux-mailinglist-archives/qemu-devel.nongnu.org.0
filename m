Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91768623B32
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 06:22:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot01b-0007Sp-1i; Thu, 10 Nov 2022 00:22:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ot01Z-0007Rj-4i
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:22:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ot01X-0002yp-Is
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:22:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668057766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zBADNIHQ/2w9bsFk7qq7GQ+B6yI6upSrghyoXHyUfDo=;
 b=bRWbMT3qo1MJK1WptQQro1zv1rT3UMcexdg2zKthGkKXzflLxGVlMrGtI6X3+2KA/mP5gS
 2H+yJGFV1ezmyGgmCSW5rTrqQ1tlZdpEqpW4Q4FgYnBDv7qXSvbXncz+ccTSghb4GWJk88
 jkEMTa0GomSBDJuvq+3ThZiurgRF42U=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-7-4zVTI-KEMSWvzq5l9o3atw-1; Thu, 10 Nov 2022 00:22:38 -0500
X-MC-Unique: 4zVTI-KEMSWvzq5l9o3atw-1
Received: by mail-ot1-f71.google.com with SMTP id
 ck9-20020a056830648900b0066c56ff7b33so550328otb.20
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 21:22:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zBADNIHQ/2w9bsFk7qq7GQ+B6yI6upSrghyoXHyUfDo=;
 b=Vg/uZtiTeSVvIvzkSmIwl0HALNOsgGfbtR7jXZWNEAPZpnW6++9U5+t1e+6ydRniSJ
 G9I+i5lTEEhrswOCWZiEIipjMJaK1q48UeD2d7VK88ELZGTEAwGESUPqL0VsmTw30kKo
 yF+1AB1rsbFg2kfA2PImqa7R2KN1YqbTmDa5kCvbDc3e146Gj1BION74ojPqcTawM2W/
 59cysDYkeJl+NgAzT+p93hQ/7ASZ6vUtHd4N2npszNVEOrxfJ/eNVBzHug561ti2TiFB
 ygs8Drk7gUAcf5JavQHhmQMG0jr0yr4dqgmK7RwxUeo2cT5NVi1y1KBTGyPLic8qRB71
 Yx3g==
X-Gm-Message-State: ACrzQf2FFAefgkIsoQ59SfF4H26tVar6EnwzHn0uE6+dIY6K3AN2uXh+
 gIqq7Px33oY2mv2wn9LhkemqW5w+BICN3hj8x7BLpb3uHHFAzzJV4WCAch8m9Ml+YPrngCp73Ub
 8uuuQQ8Hi/QCVQvGeym3BOVI+6HqI7nI=
X-Received: by 2002:a05:6808:181e:b0:35a:5959:5909 with SMTP id
 bh30-20020a056808181e00b0035a59595909mr17148334oib.35.1668057757428; 
 Wed, 09 Nov 2022 21:22:37 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4fFxYqbqgMLqtqpgis0P4gU8U/nEIqOFJsyP10xJ7MQKudn4hRCzjbgLwqGbIMqBeg/bACAqJ5q+/FHECoafY=
X-Received: by 2002:a05:6808:181e:b0:35a:5959:5909 with SMTP id
 bh30-20020a056808181e00b0035a59595909mr17148329oib.35.1668057757247; Wed, 09
 Nov 2022 21:22:37 -0800 (PST)
MIME-Version: 1.0
References: <20221108170755.92768-1-eperezma@redhat.com>
 <20221108170755.92768-3-eperezma@redhat.com>
In-Reply-To: <20221108170755.92768-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 10 Nov 2022 13:22:25 +0800
Message-ID: <CACGkMEt0EVQtRUVqFpfdAKPhqgEdmLWhCvLKDjF0gMMj=rh+9w@mail.gmail.com>
Subject: Re: [PATCH v6 02/10] vhost: set SVQ device call handler at SVQ start
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Parav Pandit <parav@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, kvm@vger.kernel.org, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Wed, Nov 9, 2022 at 1:08 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> By the end of this series CVQ is shadowed as long as the features
> support it.
>
> Since we don't know at the beginning of qemu running if this is
> supported, move the event notifier handler setting to the start of the
> SVQ, instead of the start of qemu run.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  hw/virtio/vhost-shadow-virtqueue.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-=
virtqueue.c
> index 5bd14cad96..264ddc166d 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -648,6 +648,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtI=
ODevice *vdev,
>  {
>      size_t desc_size, driver_size, device_size;
>
> +    event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
>      svq->next_guest_avail_elem =3D NULL;
>      svq->shadow_avail_idx =3D 0;
>      svq->shadow_used_idx =3D 0;
> @@ -704,6 +705,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
>      g_free(svq->desc_state);
>      qemu_vfree(svq->vring.desc);
>      qemu_vfree(svq->vring.used);
> +    event_notifier_set_handler(&svq->hdev_call, NULL);
>  }
>
>  /**
> @@ -740,7 +742,6 @@ VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *io=
va_tree,
>      }
>
>      event_notifier_init_fd(&svq->svq_kick, VHOST_FILE_UNBIND);
> -    event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
>      svq->iova_tree =3D iova_tree;
>      svq->ops =3D ops;
>      svq->ops_opaque =3D ops_opaque;
> @@ -763,7 +764,6 @@ void vhost_svq_free(gpointer pvq)
>      VhostShadowVirtqueue *vq =3D pvq;
>      vhost_svq_stop(vq);
>      event_notifier_cleanup(&vq->hdev_kick);
> -    event_notifier_set_handler(&vq->hdev_call, NULL);
>      event_notifier_cleanup(&vq->hdev_call);
>      g_free(vq);
>  }
> --
> 2.31.1
>


