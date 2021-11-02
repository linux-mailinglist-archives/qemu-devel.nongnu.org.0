Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43939442675
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 05:59:21 +0100 (CET)
Received: from localhost ([::1]:39106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhltH-0001bL-Ug
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 00:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mhlro-0000v9-3q
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 00:57:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mhlrk-0005M4-Jg
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 00:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635829063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fPxOPCRc3Z2/1ON035liOxmgokBJHX5NnrY+1zM54tQ=;
 b=SvvioHpAfT//n0d3vr9MLdBm+nQjEil4pq5oeAlgjSDymYKCo5dR8jtEO56/h5SNhWGZ1u
 r0tm6gmpOQ0BZEw4++WRLqfJYUxo/cyqjw3o9qtlMEBlmFmospmRmjjQZjFziY783drwmm
 L+jxcnUS4/uoQirG8qbw5sTxYbEnOnc=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-V9mTuxQhOgiERr_ijHGQLQ-1; Tue, 02 Nov 2021 00:57:41 -0400
X-MC-Unique: V9mTuxQhOgiERr_ijHGQLQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 v13-20020a2e2f0d000000b0021126b5cca2so7131307ljv.19
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 21:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fPxOPCRc3Z2/1ON035liOxmgokBJHX5NnrY+1zM54tQ=;
 b=RXsDYupb3MLPOr3LozBT+0PzL9aR6jLgBugFLO8A+VwBBaJnnZLPrZTWKHrBRwGFk2
 Wul+L9y0hnwLSy0FZ6YlC+28ehy5FZD1jaD9MmzKMwhqKchg5aW31gUBJOCWwEDMtZ7V
 UpsyzJj2t716ZjlEZ3qt5EgjZ/j2FjSKjCDSzd3ADs3l/OFkGLgjgYeY6TFKnGMezdqI
 FKxnsp1AZBZwP6YUQfZ8wcdrTGNeRDuRGXALI0OvvvJl9fEIHDy8iBzqKzAU+LhG24kD
 ivJw7oig93Ww4yECwq95AhMAdviMr41UG7g+jDNMOglQB2/4FU34DVo93/fHgIz9CSHJ
 Zf8g==
X-Gm-Message-State: AOAM532Na6dY64Z7Q0zSzSrVHlkog7fwCLZbEpuy9SYQDaNuJEaTq/cI
 634g30ghS1ZyvT6/TbtH0ZtoguITle2FS4DAGkHWvapTU/PRK0iwrkjsMbkklCuYa9axMrYZ6JM
 PyV6/qwovDdTIuhWDMnn8fOcb/8eyzlk=
X-Received: by 2002:a05:6512:110d:: with SMTP id
 l13mr30883202lfg.199.1635829059894; 
 Mon, 01 Nov 2021 21:57:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2FLI/DDC4r0Zz7kO0JbzR7nV0V5lH9M3uGR5Y5AeohLGlQG14sh4TdH3r24iVDPQtW68o98ohqXgPTRrHm+k=
X-Received: by 2002:a05:6512:110d:: with SMTP id
 l13mr30883164lfg.199.1635829059598; 
 Mon, 01 Nov 2021 21:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-4-eperezma@redhat.com>
In-Reply-To: <20211029183525.1776416-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 2 Nov 2021 12:57:28 +0800
Message-ID: <CACGkMEsa=iWwN3CkO5JmiB-2BU5T2HvBi=h48qApdktoFCe4Vw@mail.gmail.com>
Subject: Re: [RFC PATCH v5 03/26] virtio: Add VIRTIO_F_QUEUE_STATE
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Oct 30, 2021 at 2:36 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Implementation of RFC of device state capability:
> https://lists.oasis-open.org/archives/virtio-comment/202012/msg00005.html

Considering this still requires time to be done, we need to think of a
way to go without this.

Thanks



>
> With this capability, vdpa device can reset it's index so it can start
> consuming from guest after disabling shadow virtqueue (SVQ), with state
> not 0.
>
> The use case is to test SVQ with virtio-pci vdpa (vp_vdpa) with nested
> virtualization. Spawning a L0 qemu with a virtio-net device, use
> vp_vdpa driver to handle it in the guest, and then spawn a L1 qemu using
> that vdpa device. When L1 qemu calls device to set a new state though
> vdpa ioctl, vp_vdpa should set each queue state though virtio
> VIRTIO_PCI_COMMON_Q_AVAIL_STATE.
>
> Since this is only for testing vhost-vdpa, it's added here before of
> proposing to kernel code. No effort is done for checking that device
> can actually change its state, its layout, or if the device even
> supports to change state at all. These will be added in the future.
>
> Also, a modified version of vp_vdpa that allows to set these in PCI
> config is needed.
>
> TODO: Check for feature enabled and split in virtio pci config
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/virtio-pci.h                         | 1 +
>  include/hw/virtio/virtio.h                     | 4 +++-
>  include/standard-headers/linux/virtio_config.h | 3 +++
>  include/standard-headers/linux/virtio_pci.h    | 2 ++
>  hw/virtio/virtio-pci.c                         | 9 +++++++++
>  5 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
> index 2446dcd9ae..019badbd7c 100644
> --- a/hw/virtio/virtio-pci.h
> +++ b/hw/virtio/virtio-pci.h
> @@ -120,6 +120,7 @@ typedef struct VirtIOPCIQueue {
>    uint32_t desc[2];
>    uint32_t avail[2];
>    uint32_t used[2];
> +  uint16_t state;
>  } VirtIOPCIQueue;
>
>  struct VirtIOPCIProxy {
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 8bab9cfb75..5fe575b8f0 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -289,7 +289,9 @@ typedef struct VirtIORNGConf VirtIORNGConf;
>      DEFINE_PROP_BIT64("iommu_platform", _state, _field, \
>                        VIRTIO_F_IOMMU_PLATFORM, false), \
>      DEFINE_PROP_BIT64("packed", _state, _field, \
> -                      VIRTIO_F_RING_PACKED, false)
> +                      VIRTIO_F_RING_PACKED, false), \
> +    DEFINE_PROP_BIT64("save_restore_q_state", _state, _field, \
> +                      VIRTIO_F_QUEUE_STATE, true)
>
>  hwaddr virtio_queue_get_desc_addr(VirtIODevice *vdev, int n);
>  bool virtio_queue_enabled_legacy(VirtIODevice *vdev, int n);
> diff --git a/include/standard-headers/linux/virtio_config.h b/include/sta=
ndard-headers/linux/virtio_config.h
> index 22e3a85f67..59fad3eb45 100644
> --- a/include/standard-headers/linux/virtio_config.h
> +++ b/include/standard-headers/linux/virtio_config.h
> @@ -90,4 +90,7 @@
>   * Does the device support Single Root I/O Virtualization?
>   */
>  #define VIRTIO_F_SR_IOV                        37
> +
> +/* Device support save and restore virtqueue state */
> +#define VIRTIO_F_QUEUE_STATE            40
>  #endif /* _LINUX_VIRTIO_CONFIG_H */
> diff --git a/include/standard-headers/linux/virtio_pci.h b/include/standa=
rd-headers/linux/virtio_pci.h
> index db7a8e2fcb..c8d9802a87 100644
> --- a/include/standard-headers/linux/virtio_pci.h
> +++ b/include/standard-headers/linux/virtio_pci.h
> @@ -164,6 +164,7 @@ struct virtio_pci_common_cfg {
>         uint32_t queue_avail_hi;                /* read-write */
>         uint32_t queue_used_lo;         /* read-write */
>         uint32_t queue_used_hi;         /* read-write */
> +       uint16_t queue_avail_state;     /* read-write */
>  };
>
>  /* Fields in VIRTIO_PCI_CAP_PCI_CFG: */
> @@ -202,6 +203,7 @@ struct virtio_pci_cfg_cap {
>  #define VIRTIO_PCI_COMMON_Q_AVAILHI    44
>  #define VIRTIO_PCI_COMMON_Q_USEDLO     48
>  #define VIRTIO_PCI_COMMON_Q_USEDHI     52
> +#define VIRTIO_PCI_COMMON_Q_AVAIL_STATE        56
>
>  #endif /* VIRTIO_PCI_NO_MODERN */
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 750aa47ec1..d7bb549033 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1244,6 +1244,9 @@ static uint64_t virtio_pci_common_read(void *opaque=
, hwaddr addr,
>      case VIRTIO_PCI_COMMON_Q_USEDHI:
>          val =3D proxy->vqs[vdev->queue_sel].used[1];
>          break;
> +    case VIRTIO_PCI_COMMON_Q_AVAIL_STATE:
> +        val =3D virtio_queue_get_last_avail_idx(vdev, vdev->queue_sel);
> +        break;
>      default:
>          val =3D 0;
>      }
> @@ -1330,6 +1333,8 @@ static void virtio_pci_common_write(void *opaque, h=
waddr addr,
>                         proxy->vqs[vdev->queue_sel].avail[0],
>                         ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) <=
< 32 |
>                         proxy->vqs[vdev->queue_sel].used[0]);
> +            virtio_queue_set_last_avail_idx(vdev, vdev->queue_sel,
> +                        proxy->vqs[vdev->queue_sel].state);
>              proxy->vqs[vdev->queue_sel].enabled =3D 1;
>          } else {
>              virtio_error(vdev, "wrong value for queue_enable %"PRIx64, v=
al);
> @@ -1353,6 +1358,9 @@ static void virtio_pci_common_write(void *opaque, h=
waddr addr,
>      case VIRTIO_PCI_COMMON_Q_USEDHI:
>          proxy->vqs[vdev->queue_sel].used[1] =3D val;
>          break;
> +    case VIRTIO_PCI_COMMON_Q_AVAIL_STATE:
> +        proxy->vqs[vdev->queue_sel].state =3D val;
> +        break;
>      default:
>          break;
>      }
> @@ -1951,6 +1959,7 @@ static void virtio_pci_reset(DeviceState *qdev)
>          proxy->vqs[i].desc[0] =3D proxy->vqs[i].desc[1] =3D 0;
>          proxy->vqs[i].avail[0] =3D proxy->vqs[i].avail[1] =3D 0;
>          proxy->vqs[i].used[0] =3D proxy->vqs[i].used[1] =3D 0;
> +        proxy->vqs[i].state =3D 0;
>      }
>
>      if (pci_is_express(dev)) {
> --
> 2.27.0
>


