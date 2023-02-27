Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0E16A3C1F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:15:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWXrr-0005PN-UG; Mon, 27 Feb 2023 02:24:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pWXro-0005P0-3i
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 02:24:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pWXrl-0006RT-NX
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 02:24:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677482641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HcPvEo+F2OZU0bbI4Y5XSo6Zcw491v3lgydd9/bPwkk=;
 b=Oe1022ULHoyh38aX6M2J094V14sgxfygCnq6SpbVNAHRoBVYQ2c4cD3+eeyRcpCig0rQxd
 YiVlO5i/nYRmtEU9oEQaJfaJGUiyyHO/fanzUjR/5fiMXT6EnT0M5buf6U32KRIr1Hs1Y9
 4AVrVonnzvehPgRMr/0W9vBsZjJSlWk=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-270-vn9zpWjVN0GTDascYpUGlg-1; Mon, 27 Feb 2023 02:22:32 -0500
X-MC-Unique: vn9zpWjVN0GTDascYpUGlg-1
Received: by mail-pl1-f200.google.com with SMTP id
 l10-20020a17090270ca00b0019caa6e6bd1so3165183plt.2
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 23:22:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HcPvEo+F2OZU0bbI4Y5XSo6Zcw491v3lgydd9/bPwkk=;
 b=ZkPbMDEn/UtBKOT3tPUdGTXMZERa0t/wJBeER8UbGnkwYJVDhT+fKA0S+U8TKGCN53
 qUFQvJhQaFDAg3gTku/6/bgTiHSMBeE2KgInXrjwDWZTyC6HzxkMSkTnmwHIkcpz8D+p
 W/6Oj9nM1g0dIif0dp+1xBluo3Zau1mRBNTtm/pPJvksaBDV5j1SQSoh6JCxi+h2adXg
 vWUhTnsmNLL8HBm0Mumc7PZXqmdWWHxPmg0bJxFh8SRHWvQ+CZMHJClgjBMwUY9eVZUK
 a+XWUO43sFp0kg3hL3ddt1g1HWohSx9tUX/SPXDBGDIrsrZDKvKlJqK8TaBSU8I/2ydT
 D1CQ==
X-Gm-Message-State: AO0yUKWGMNzptzKYw2OKxQUfWQY3aDijjRC4oFk6gLtrX/lk82YmQ3C9
 V1txAI+O6K9MH7VZZua3x+Gl/xSkspdV67896yhLI6VhcDVTwn9WAThI8eh2ba8jviN6J4WObYZ
 QPwdMpqjrvGlwtRM=
X-Received: by 2002:a17:903:187:b0:196:5d8d:2d6f with SMTP id
 z7-20020a170903018700b001965d8d2d6fmr29505947plg.13.1677482551378; 
 Sun, 26 Feb 2023 23:22:31 -0800 (PST)
X-Google-Smtp-Source: AK7set/Tmd92FMXAhkDaaSorEurrM+gRfdGftBJymrqm93w00a3QMRpI/+lsWUCJ/ovEvblV3HKfPw==
X-Received: by 2002:a17:903:187:b0:196:5d8d:2d6f with SMTP id
 z7-20020a170903018700b001965d8d2d6fmr29505908plg.13.1677482550942; 
 Sun, 26 Feb 2023 23:22:30 -0800 (PST)
Received: from [10.72.13.83] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 bd4-20020a170902830400b0019a9751096asm3793685plb.305.2023.02.26.23.22.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 23:22:30 -0800 (PST)
Message-ID: <163ea0b7-1814-3ab6-2f8a-ee594914f6bc@redhat.com>
Date: Mon, 27 Feb 2023 15:22:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 05/15] vdpa: move vhost reset after get vring base
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 Shannon Nelson <snelson@pensando.io>, Gautam Dawar <gdawar@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>, alvaro.karsz@solid-run.com,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, si-wei.liu@oracle.com,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-6-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230224155438.112797-6-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


在 2023/2/24 23:54, Eugenio Pérez 写道:
> The function vhost.c:vhost_dev_stop calls vhost operation
> vhost_dev_start(false). In the case of vdpa it totally reset and wipes
> the device, making the fetching of the vring base (virtqueue state) totally
> useless.


As discussed before, should we do something reverse: in 
vhost_vdpa_dev_started() since what proposed in the patch doesn't solve 
the issue (index could be moved after the get_vring_base())

1) if _F_SUSPEND is negotiated, suspend instead of reset

2) if _F_SUSPEND is not negotiated, reset and fail 
vhost_get_vring_base() to allow graceful fallback?

Thanks


>
> The kernel backend does not use vhost_dev_start vhost op callback, but
> vhost-user do. A patch to make vhost_user_dev_start more similar to vdpa
> is desirable, but it can be added on top.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   include/hw/virtio/vhost-backend.h |  4 ++++
>   hw/virtio/vhost-vdpa.c            | 22 ++++++++++++++++------
>   hw/virtio/vhost.c                 |  3 +++
>   3 files changed, 23 insertions(+), 6 deletions(-)
>
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> index c5ab49051e..ec3fbae58d 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -130,6 +130,9 @@ typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
>   
>   typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
>                                          int fd);
> +
> +typedef void (*vhost_reset_status_op)(struct vhost_dev *dev);
> +
>   typedef struct VhostOps {
>       VhostBackendType backend_type;
>       vhost_backend_init vhost_backend_init;
> @@ -177,6 +180,7 @@ typedef struct VhostOps {
>       vhost_get_device_id_op vhost_get_device_id;
>       vhost_force_iommu_op vhost_force_iommu;
>       vhost_set_config_call_op vhost_set_config_call;
> +    vhost_reset_status_op vhost_reset_status;
>   } VhostOps;
>   
>   int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 4fac144169..8cc9c98db9 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1134,14 +1134,23 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>       if (started) {
>           memory_listener_register(&v->listener, &address_space_memory);
>           return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
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
> +    struct vhost_vdpa *v = dev->opaque;
> +
> +    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
> +        return;
>       }
> +
> +    vhost_vdpa_reset_device(dev);
> +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> +                               VIRTIO_CONFIG_S_DRIVER);
> +    memory_listener_unregister(&v->listener);
>   }
>   
>   static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
> @@ -1328,4 +1337,5 @@ const VhostOps vdpa_ops = {
>           .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
>           .vhost_force_iommu = vhost_vdpa_force_iommu,
>           .vhost_set_config_call = vhost_vdpa_set_config_call,
> +        .vhost_reset_status = vhost_vdpa_reset_status,
>   };
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index eb8c4c378c..a266396576 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -2049,6 +2049,9 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings)
>                                hdev->vqs + i,
>                                hdev->vq_index + i);
>       }
> +    if (hdev->vhost_ops->vhost_reset_status) {
> +        hdev->vhost_ops->vhost_reset_status(hdev);
> +    }
>   
>       if (vhost_dev_has_iommu(hdev)) {
>           if (hdev->vhost_ops->vhost_set_iotlb_callback) {


