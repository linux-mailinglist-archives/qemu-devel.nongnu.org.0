Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418F96F9F02
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 07:26:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvtOH-0001mg-2v; Mon, 08 May 2023 01:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pvtOG-0001mQ-61
 for qemu-devel@nongnu.org; Mon, 08 May 2023 01:26:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pvtOE-0005N0-Ma
 for qemu-devel@nongnu.org; Mon, 08 May 2023 01:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683523585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P0z0Mf4+MRWBt2cxDevkG1VYpvs0a/Nqy2/J5BPqv4A=;
 b=VC+XEWfaBNFfAsD8kDC8rtd2/+AWxjhnckJ7/p0u6ReQQC6jLrLpWbUYoKE6XH0j2CW0GX
 1uFZti/RMwWqdC2up6k5/Pg+WJB3jvywCOoqdlcKYxQHSCHko6CDYcogU9ONQU+mTwgxzp
 jl50oTBjMhp9K/IRophZBpZ0K7TX0MY=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-3vRtz2fKPAyNtOkYXhcmgw-1; Mon, 08 May 2023 01:26:23 -0400
X-MC-Unique: 3vRtz2fKPAyNtOkYXhcmgw-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-4edc5526c5fso2236764e87.2
 for <qemu-devel@nongnu.org>; Sun, 07 May 2023 22:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683523582; x=1686115582;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P0z0Mf4+MRWBt2cxDevkG1VYpvs0a/Nqy2/J5BPqv4A=;
 b=hR/xzwCkU5+hlosxRKKKtZXxzzjDwk6eH996MFQQFRsHYrYAZ0nT1EbvDrOqc6NT/G
 wf+bri5q8tzayDddWufxyzrsbXM0pd5sTK+JfPUUrB+I53kM+M8hnNtng2SQ28mvJRnR
 RBfsvOHL5e9L8aCa+QR9QYUa59E/It2UYBSKYHZANdjKJI6UMsSg5o5dqC5yyLdy8sd6
 vrvo65m/71DeKdDStzbalq69gGrZoVBE1zGo60DNHYI01U3+hmm8eWwNaVF0UDMGaqnM
 D/Q0olrklIb2u8OhBQxn0Nn7MaJOHMccF+pTHa8astU9lFEFkI2703vkop7ujSScCKsR
 W/TA==
X-Gm-Message-State: AC+VfDzvfYb+QpciOJaIOmoqsJaVTCoE75hCPImmHUD2PqqXZ6gx3+up
 sd6i/s+YvtDyR6s0iTyGvLEptXCCr2TbGeX1PFwtbLHt0+OFf60Z3CJwxPNpKuTkwieNPr0wC3X
 /PLA467nK7Wn4oNN8ESXqc9DhnoAuCU8=
X-Received: by 2002:a2e:2e06:0:b0:2ab:d1b:dcb2 with SMTP id
 u6-20020a2e2e06000000b002ab0d1bdcb2mr2404443lju.38.1683523582260; 
 Sun, 07 May 2023 22:26:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ee/IGeGbQ6lTbvfpJCFg0i5Dgx6I7V8ncRCS9HkeaTBLTEx14VSUgq++Z6JtMiSitgzXn8kqmxQTmkBvrTEU=
X-Received: by 2002:a2e:2e06:0:b0:2ab:d1b:dcb2 with SMTP id
 u6-20020a2e2e06000000b002ab0d1bdcb2mr2404438lju.38.1683523581982; Sun, 07 May
 2023 22:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230501020221.188376-1-viktor@daynix.com>
 <20230501020221.188376-5-viktor@daynix.com>
In-Reply-To: <20230501020221.188376-5-viktor@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 8 May 2023 13:26:10 +0800
Message-ID: <CACGkMEvpy0YPy_qr4C=RPA_vUALJi0kMNZzwXNC8AXZbxWVyRw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/4] virtio-net: pass Device-TLB enable/disable
 events to vhost
To: Viktor Prutyanov <viktor@daynix.com>
Cc: mst@redhat.com, peterx@redhat.com, marcel.apfelbaum@gmail.com, 
 qemu-devel@nongnu.org, yan@daynix.com, yuri.benditovich@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, May 1, 2023 at 10:02=E2=80=AFAM Viktor Prutyanov <viktor@daynix.com=
> wrote:
>
> If vhost is enabled for virtio-net, Device-TLB enable/disable events
> must be passed to vhost for proper IOMMU unmap flag selection.

The patch looks good, just wonder if you have tested it with vhost-user?

(It looks to me like it should work there).

Thanks

>
> Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
> ---
>  hw/net/vhost_net.c      | 11 +++++++++++
>  hw/net/virtio-net.c     |  8 ++++++++
>  include/net/vhost_net.h |  2 ++
>  3 files changed, 21 insertions(+)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index c4eecc6f36..2364c8de99 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -552,6 +552,17 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_=
t mtu)
>      return vhost_ops->vhost_net_set_mtu(&net->dev, mtu);
>  }
>
> +void vhost_net_toggle_device_iotlb(struct vhost_dev *dev, bool enable)
> +{
> +    const VhostOps *vhost_ops =3D dev->vhost_ops;
> +
> +    if (!vhost_ops->vhost_toggle_device_iotlb) {
> +        return;
> +    }
> +
> +    vhost_ops->vhost_toggle_device_iotlb(dev, enable);
> +}
> +
>  void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
>                                 int vq_index)
>  {
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 53e1c32643..e6851b885c 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3843,6 +3843,13 @@ static struct vhost_dev *virtio_net_get_vhost(Virt=
IODevice *vdev)
>      return &net->dev;
>  }
>
> +static void virtio_net_toggle_device_iotlb(VirtIODevice *vdev,
> +                                           bool enable)
> +{
> +    if (vdev->vhost_started)
> +        vhost_net_toggle_device_iotlb(virtio_net_get_vhost(vdev), enable=
);
> +}
> +
>  static const VMStateDescription vmstate_virtio_net =3D {
>      .name =3D "virtio-net",
>      .minimum_version_id =3D VIRTIO_NET_VM_VERSION,
> @@ -3948,6 +3955,7 @@ static void virtio_net_class_init(ObjectClass *klas=
s, void *data)
>      vdc->vmsd =3D &vmstate_virtio_net_device;
>      vdc->primary_unplug_pending =3D primary_unplug_pending;
>      vdc->get_vhost =3D virtio_net_get_vhost;
> +    vdc->toggle_device_iotlb =3D virtio_net_toggle_device_iotlb;
>  }
>
>  static const TypeInfo virtio_net_info =3D {
> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> index c37aba35e6..36d527f321 100644
> --- a/include/net/vhost_net.h
> +++ b/include/net/vhost_net.h
> @@ -56,4 +56,6 @@ int vhost_net_virtqueue_restart(VirtIODevice *vdev, Net=
ClientState *nc,
>                                  int vq_index);
>
>  void vhost_net_save_acked_features(NetClientState *nc);
> +
> +void vhost_net_toggle_device_iotlb(struct vhost_dev *dev, bool enable);
>  #endif
> --
> 2.35.1
>


