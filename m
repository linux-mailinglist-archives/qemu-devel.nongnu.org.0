Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9A1305262
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 06:48:40 +0100 (CET)
Received: from localhost ([::1]:44476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4dh1-0005p7-OT
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 00:48:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l4dgB-000501-VA
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 00:47:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l4dgA-0003Vm-6l
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 00:47:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611726465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M3eWHYOrWyhY/wrH+GTqTKAKBdGByLl95vgUFN9w9U0=;
 b=gXY1FYYuaU40Eajavz3Vl2Oii4wrO66wT2kuKeve3o9wD9BeeKm3fu0J9X1Fd293mbnLU7
 d2S/HGOjy7zaUQZH3uwqLTXUBSvuLpuL478yZ/GM2mxj5mut2q48l1uXh3u7gipX8o3low
 NnhPayPATl+qBOsZfcvilzTEmcz9Bkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-Lg2RGZ2IOeySOjlfGvmixA-1; Wed, 27 Jan 2021 00:47:41 -0500
X-MC-Unique: Lg2RGZ2IOeySOjlfGvmixA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 762DA1005D50
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 05:47:40 +0000 (UTC)
Received: from [10.72.13.33] (ovpn-13-33.pek2.redhat.com [10.72.13.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0ED5E5D9DD;
 Wed, 27 Jan 2021 05:47:35 +0000 (UTC)
Subject: Re: [PATCH v3 5/5] vhost-vdpa: add callback function for configure
 interrupt
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210126074254.3225-1-lulu@redhat.com>
 <20210126074254.3225-6-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <639e39d7-e210-e2d6-5d42-0afb01dcddf7@redhat.com>
Date: Wed, 27 Jan 2021 13:47:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210126074254.3225-6-lulu@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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


On 2021/1/26 下午3:42, Cindy Lu wrote:
> Add call back function for configure interrupt.
> Set the notifier's fd to the kernel driver when vdpa start.
> also set -1 while vdpa stop. then the kernel will release
> the related resource
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/virtio/trace-events            |  2 ++
>   hw/virtio/vhost-vdpa.c            | 37 ++++++++++++++++++++++++++++++-
>   include/hw/virtio/vhost-backend.h |  4 ++++
>   3 files changed, 42 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 2060a144a2..6710835b46 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -52,6 +52,8 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int index, int fd) "dev: %p index:
>   vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
>   vhost_vdpa_set_owner(void *dev) "dev: %p"
>   vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
> +vhost_vdpa_set_config_call(void *dev, int *fd)"dev: %p fd: %p"
> +
>   
>   # virtio.c
>   virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 01d2101d09..cc1d39d663 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -467,20 +467,47 @@ static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
>       }
>       return ret;
>    }
> +static void vhost_vdpa_config_notify_start(struct vhost_dev *dev,
> +                                struct VirtIODevice *vdev, bool start)
> +{
> +    int fd, r;
> +    if (start) {
> +        fd = event_notifier_get_fd(&vdev->config_notifier);
> +        vdev->use_config_notifier = true;
> +     } else {
> +        fd = -1;
> +        vdev->use_config_notifier = false;
> +     }
> +     /*set the fd call back to vdpa driver*/


I guess checkpatch.pl might warn here. Please try to silent checkpath.pl 
before submitting patches.


> +    r = dev->vhost_ops->vhost_set_config_call(dev, &fd);
> +    if (r) {
> +        vdev->use_config_notifier = false;
> +        info_report("vhost_vdpa_config_notify not started!");


This looks kind of fragile. Do we need some workaround here like:

1) filter out the features that depends on config interrupt

or

2) A timer to watch the change of config space

Thanks


> +    }
> +    /*active the config_notifier when vdev->use_config_notifier is true*/
> +    if ((vdev->use_config_notifier) && (start)) {
> +        event_notifier_set(&vdev->config_notifier);
> +    }
> +    return;
>   
> +}
>   static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>   {
>       struct vhost_vdpa *v = dev->opaque;
>       trace_vhost_vdpa_dev_start(dev, started);
> +    VirtIODevice *vdev = dev->vdev;
> +
>       if (started) {
>           uint8_t status = 0;
>           memory_listener_register(&v->listener, &address_space_memory);
>           vhost_vdpa_set_vring_ready(dev);
>           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>           vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
> -
> +        /*set the configure interrupt call back*/
> +        vhost_vdpa_config_notify_start(dev, vdev, true);
>           return !(status & VIRTIO_CONFIG_S_DRIVER_OK);
>       } else {
> +        vhost_vdpa_config_notify_start(dev, vdev, false);
>           vhost_vdpa_reset_device(dev);
>           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>                                      VIRTIO_CONFIG_S_DRIVER);
> @@ -546,6 +573,13 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>       return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
>   }
>   
> +static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
> +                                       int *fd)
> +{
> +    trace_vhost_vdpa_set_config_call(dev, fd);
> +    return vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, fd);
> +}
> +
>   static int vhost_vdpa_get_features(struct vhost_dev *dev,
>                                        uint64_t *features)
>   {
> @@ -611,4 +645,5 @@ const VhostOps vdpa_ops = {
>           .vhost_get_device_id = vhost_vdpa_get_device_id,
>           .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
>           .vhost_force_iommu = vhost_vdpa_force_iommu,
> +        .vhost_set_config_call = vhost_vdpa_set_config_call,
>   };
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> index 8a6f8e2a7a..1a2fee8994 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -125,6 +125,9 @@ typedef int (*vhost_get_device_id_op)(struct vhost_dev *dev, uint32_t *dev_id);
>   
>   typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
>   
> +typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
> +                                       int *fd);
> +
>   typedef struct VhostOps {
>       VhostBackendType backend_type;
>       vhost_backend_init vhost_backend_init;
> @@ -170,6 +173,7 @@ typedef struct VhostOps {
>       vhost_vq_get_addr_op  vhost_vq_get_addr;
>       vhost_get_device_id_op vhost_get_device_id;
>       vhost_force_iommu_op vhost_force_iommu;
> +    vhost_set_config_call_op vhost_set_config_call;
>   } VhostOps;
>   
>   extern const VhostOps user_ops;


