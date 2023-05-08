Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203F56F9F01
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 07:26:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvtNN-00019Z-Et; Mon, 08 May 2023 01:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pvtNJ-00019M-Lj
 for qemu-devel@nongnu.org; Mon, 08 May 2023 01:25:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pvtNF-00058e-Nt
 for qemu-devel@nongnu.org; Mon, 08 May 2023 01:25:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683523524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o1Db7VLKJ57yjnHhX8pq8d674QMCKlEZxG076VDhJic=;
 b=Lil0koZuzd1Q2AnHly3NN/Z34i5zSnfpDANxL6IpJB4S8C2siLGDtFkT1SggZwu2gBgS6z
 k7iGQ+AQjSYMx2KNf/ELux3YAACQD+36PvhMOnb+NOkKi2g9UHEz8cLhVmqy/OHU8kFxc7
 dLcdezYuPua+TFIdWKY5ppG8KSjykPw=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-XJFifwaWMNqB0GPjdy5qrA-1; Mon, 08 May 2023 01:25:22 -0400
X-MC-Unique: XJFifwaWMNqB0GPjdy5qrA-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-4f139de8c55so3502867e87.0
 for <qemu-devel@nongnu.org>; Sun, 07 May 2023 22:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683523521; x=1686115521;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o1Db7VLKJ57yjnHhX8pq8d674QMCKlEZxG076VDhJic=;
 b=Z4jd9ZzkqgJ4dxKfITy4dVmCbIMNfHpGx4BdZlRWWSS2CBO8OMTDVSCTxZUeJBSZT0
 Zo9MvHjjuz+NZsCCy1nyN9y5rz4HqI2d5ksBMLB39/3TbuQJ6NTjAyr7BzhA+Ln1S0j/
 qb4+foXt0NHjEIz7wn2zw+9desPDEKlHMsDXL4a2M0Yn+95HZEKkQQAItqJpcg9RLXim
 dY0LT92s2ZITpFsCH5THX19lhSWqXm336FmDuBeqiCbA4aYRVnq/QZ6JLKG+fjsTRZxR
 DG6iyQGyZPEycdh8MUboWbYgo2uQpoAmvnkgEmAaN99skrc8kg+R/oAkm7nOTeQ5vITr
 FQ/w==
X-Gm-Message-State: AC+VfDxHiG4A7SQX/CCkhxWE78ZnzVVC8F2AXfsggmQ8EVrpUrsmmV2S
 eltbu5N1mSfVgbdKbSVq8m3fTtt0bnIfCOYLnmQg88aBnhBTTufJT//gKX7SG44nWNgV4hXGB/D
 9XgFonBeBIhAsUZIN+Wh6Wf2K1Ymx6Lc=
X-Received: by 2002:a2e:b5d4:0:b0:2a9:45fb:6331 with SMTP id
 g20-20020a2eb5d4000000b002a945fb6331mr2447169ljn.6.1683523521027; 
 Sun, 07 May 2023 22:25:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Q8VxPDD3oSr5uFalE+tyGnFLtz+kxiB3XThUDpA5MeQs55Wz1dVnxrB0DExEnyM0h07UEcgXuYQZahjxLtOM=
X-Received: by 2002:a2e:b5d4:0:b0:2a9:45fb:6331 with SMTP id
 g20-20020a2eb5d4000000b002a945fb6331mr2447158ljn.6.1683523520691; Sun, 07 May
 2023 22:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230501020221.188376-1-viktor@daynix.com>
 <20230501020221.188376-4-viktor@daynix.com>
In-Reply-To: <20230501020221.188376-4-viktor@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 8 May 2023 13:25:09 +0800
Message-ID: <CACGkMEvDZQX2=AzL5Y8q6EzqriKXwQhM=2wb=ysot4xEydw59w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/4] vhost: register and change IOMMU flag
 depending on Device-TLB state
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
> The guest can disable or never enable Device-TLB. In these cases,
> it can't be used even if enabled in QEMU. So, check Device-TLB state
> before registering IOMMU notifier and select unmap flag depending on
> that. Also, implement a way to change IOMMU notifier flag if Device-TLB
> state is changed.
>
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D2001312
> Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
> ---
>  hw/virtio/vhost-backend.c         |  6 ++++++
>  hw/virtio/vhost.c                 | 26 ++++++++++++++++++++++++--
>  include/hw/virtio/vhost-backend.h |  4 ++++
>  include/hw/virtio/vhost.h         |  1 +
>  4 files changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> index 8e581575c9..30eb71fb83 100644
> --- a/hw/virtio/vhost-backend.c
> +++ b/hw/virtio/vhost-backend.c
> @@ -297,6 +297,11 @@ static void vhost_kernel_set_iotlb_callback(struct v=
host_dev *dev,
>          qemu_set_fd_handler((uintptr_t)dev->opaque, NULL, NULL, NULL);
>  }
>
> +static void vhost_kernel_toggle_device_iotlb(struct vhost_dev *dev, int =
enable)
> +{
> +    vhost_toggle_device_iotlb(dev, enable);
> +}
> +
>  const VhostOps kernel_ops =3D {
>          .backend_type =3D VHOST_BACKEND_TYPE_KERNEL,
>          .vhost_backend_init =3D vhost_kernel_init,
> @@ -328,6 +333,7 @@ const VhostOps kernel_ops =3D {
>          .vhost_vsock_set_running =3D vhost_kernel_vsock_set_running,
>          .vhost_set_iotlb_callback =3D vhost_kernel_set_iotlb_callback,
>          .vhost_send_device_iotlb_msg =3D vhost_kernel_send_device_iotlb_=
msg,
> +        .vhost_toggle_device_iotlb =3D vhost_kernel_toggle_device_iotlb,
>  };
>  #endif
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index a266396576..1bfcc6d263 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -796,7 +796,9 @@ static void vhost_iommu_region_add(MemoryListener *li=
stener,
>      iommu_idx =3D memory_region_iommu_attrs_to_index(iommu_mr,
>                                                     MEMTXATTRS_UNSPECIFIE=
D);
>      iommu_notifier_init(&iommu->n, vhost_iommu_unmap_notify,
> -                        IOMMU_NOTIFIER_DEVIOTLB_UNMAP,
> +                        dev->vdev->device_iotlb_enabled ?
> +                            IOMMU_NOTIFIER_DEVIOTLB_UNMAP :
> +                            IOMMU_NOTIFIER_UNMAP,
>                          section->offset_within_region,
>                          int128_get64(end),
>                          iommu_idx);
> @@ -804,7 +806,8 @@ static void vhost_iommu_region_add(MemoryListener *li=
stener,
>      iommu->iommu_offset =3D section->offset_within_address_space -
>                            section->offset_within_region;
>      iommu->hdev =3D dev;
> -    ret =3D memory_region_register_iommu_notifier(section->mr, &iommu->n=
, NULL);
> +    ret =3D memory_region_register_iommu_notifier(section->mr, &iommu->n=
,
> +            dev->vdev->device_iotlb_enabled ? NULL : &error_fatal);
>      if (ret) {
>          /*
>           * Some vIOMMUs do not support dev-iotlb yet.  If so, try to use=
 the
> @@ -841,6 +844,25 @@ static void vhost_iommu_region_del(MemoryListener *l=
istener,
>      }
>  }
>
> +void vhost_toggle_device_iotlb(struct vhost_dev *dev, bool enable)
> +{
> +    struct vhost_iommu *iommu;
> +    int ret;
> +
> +    QLIST_FOREACH(iommu, &dev->iommu_list, iommu_next) {
> +        memory_region_unregister_iommu_notifier(iommu->mr, &iommu->n);
> +        iommu->n.notifier_flags =3D enable ?
> +                IOMMU_NOTIFIER_DEVIOTLB_UNMAP : IOMMU_NOTIFIER_UNMAP;
> +        ret =3D memory_region_register_iommu_notifier(iommu->mr, &iommu-=
>n,
> +                enable ? NULL : &error_fatal);
> +        if (ret) {
> +            iommu->n.notifier_flags =3D IOMMU_NOTIFIER_UNMAP;
> +            memory_region_register_iommu_notifier(iommu->mr, &iommu->n,
> +                                                  &error_fatal);

I think it's better to tweak the code to avoid doing IOMMU_NOTIFIER_UNMAP t=
wice.

The rest looks good.

Thanks

> +        }
> +    }
> +}
> +
>  static int vhost_virtqueue_set_addr(struct vhost_dev *dev,
>                                      struct vhost_virtqueue *vq,
>                                      unsigned idx, bool enable_log)
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-=
backend.h
> index ec3fbae58d..f8e9660a96 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -133,6 +133,9 @@ typedef int (*vhost_set_config_call_op)(struct vhost_=
dev *dev,
>
>  typedef void (*vhost_reset_status_op)(struct vhost_dev *dev);
>
> +typedef void (*vhost_toggle_device_iotlb_op)(struct vhost_dev *dev,
> +                                             int enabled);
> +
>  typedef struct VhostOps {
>      VhostBackendType backend_type;
>      vhost_backend_init vhost_backend_init;
> @@ -181,6 +184,7 @@ typedef struct VhostOps {
>      vhost_force_iommu_op vhost_force_iommu;
>      vhost_set_config_call_op vhost_set_config_call;
>      vhost_reset_status_op vhost_reset_status;
> +    vhost_toggle_device_iotlb_op vhost_toggle_device_iotlb;
>  } VhostOps;
>
>  int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index a52f273347..b3f585c6cd 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -320,6 +320,7 @@ bool vhost_has_free_slot(void);
>  int vhost_net_set_backend(struct vhost_dev *hdev,
>                            struct vhost_vring_file *file);
>
> +void vhost_toggle_device_iotlb(struct vhost_dev *dev, bool enable);
>  int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int wr=
ite);
>
>  int vhost_virtqueue_start(struct vhost_dev *dev, struct VirtIODevice *vd=
ev,
> --
> 2.35.1
>


