Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEF769DA6C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 06:37:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pULKa-0005jB-EC; Tue, 21 Feb 2023 00:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pULK7-0005d3-VW
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 00:36:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pULK3-0001o9-Ga
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 00:36:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676957770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MRrLG9S9sWDDOj2GCZKdRPchWuMzUt1uMV7hdUGXxw8=;
 b=VZ2mC6Bw/tYN4ydGwzYswq6q9f28bfxHo4fLX8Lt0Ilfdmle8UY0YldJ+3yi3fz6z+9fvx
 yDkAtErcgzve1UIVeU9f11mec96/5GpVGjFJ84XPf7tIMmfi1E1GSvx+bqh5Vb9yK52O3S
 YBirJCOqmFyIK+oPjWuyhWIwh/Fde9A=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-392-McUatRhrMy2DA2WhLjAsfQ-1; Tue, 21 Feb 2023 00:36:09 -0500
X-MC-Unique: McUatRhrMy2DA2WhLjAsfQ-1
Received: by mail-pg1-f198.google.com with SMTP id
 s21-20020a632155000000b004fc1f5c8a4dso1079435pgm.11
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 21:36:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MRrLG9S9sWDDOj2GCZKdRPchWuMzUt1uMV7hdUGXxw8=;
 b=Sd7N+CiG3HqNVzI6pnA7bPicdg9xREvkELboljZfjKVh7TRJyG/FNT2KjzrExeIvAs
 LSPQ9cJl7EfPrUkR7MT9XD6QrR8sd26lLqNa/i/xnJKdXXwayo1wEdhDqETZRJUswm6S
 Zt5/CKRGcl5BVjIcxzUocXAM3ZhcYffBX5i5fbTh8qc5MbPTQYaHcxYatTozFUJMP1b+
 w2zHbU5zStPU9eOYzZ5RuIH9C5Kfa6TPKxnW1at0yIGXtOpmBUrYbrKKPFOTVsTwMhRl
 yUz2VxGqTzFO7Sd93oHh0kk+bdaGwioJthv00j3uGYy+NINM1fok77l70X2kU/oZJ4F+
 6jIw==
X-Gm-Message-State: AO0yUKW5aq+8xO+UPbutdTNtILTmMOqBXbYVT4W+y6ypJuJWTSk/BQ7O
 kSbnU/ZeE8A5p+ek83l09YvtdZ3UoZGPlGJUi7YCukD8EvPr5PYzRxMgl4f+9mwcFeKH6DTqpqh
 utwMLZcT6n+J7C4t8vNWDk3c=
X-Received: by 2002:a17:903:1ca:b0:19b:9a19:76ae with SMTP id
 e10-20020a17090301ca00b0019b9a1976aemr3672702plh.1.1676957767916; 
 Mon, 20 Feb 2023 21:36:07 -0800 (PST)
X-Google-Smtp-Source: AK7set/ND8UocV2wBFriaDaIT5yySPoZU7PBsqhtDrME6CRJ2pDPchMqrvcLjzT59RGbVdCwnIh+Qw==
X-Received: by 2002:a17:903:1ca:b0:19b:9a19:76ae with SMTP id
 e10-20020a17090301ca00b0019b9a1976aemr3672679plh.1.1676957767624; 
 Mon, 20 Feb 2023 21:36:07 -0800 (PST)
Received: from [10.72.12.235] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a170902ea8500b0019c32968271sm2451577plb.11.2023.02.20.21.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 21:36:07 -0800 (PST)
Message-ID: <f8487b52-964f-641c-4365-e38b44ea2627@redhat.com>
Date: Tue, 21 Feb 2023 13:36:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 04/13] vdpa: move vhost reset after get vring base
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 alvaro.karsz@solid-run.com, Zhu Lingshan <lingshan.zhu@intel.com>,
 Lei Yang <leiyang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-5-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230208094253.702672-5-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


在 2023/2/8 17:42, Eugenio Pérez 写道:
> The function vhost.c:vhost_dev_stop calls vhost operation
> vhost_dev_start(false). In the case of vdpa it totally reset and wipes
> the device, making the fetching of the vring base (virtqueue state) totally
> useless.
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
> index cbbe92ffe8..26e38a6aab 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1152,14 +1152,23 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
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
> +                                VIRTIO_CONFIG_S_DRIVER);
> +    memory_listener_unregister(&v->listener);
>   }
>   
>   static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
> @@ -1346,4 +1355,5 @@ const VhostOps vdpa_ops = {
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


This looks racy, if we don't suspend/reset the device, device can move 
last_avail_idx even after get_vring_base()?

Instead of doing things like this, should we fallback to 
virtio_queue_restore_last_avail_idx() in this case?

Thanks


>   
>       if (vhost_dev_has_iommu(hdev)) {
>           if (hdev->vhost_ops->vhost_set_iotlb_callback) {


