Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF9C3471AB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 07:36:12 +0100 (CET)
Received: from localhost ([::1]:47460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOx7j-0006Up-BI
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 02:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lOx54-0004uf-7t
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 02:33:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lOx52-0003WG-B9
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 02:33:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616567602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pOLL/OCEPG7tQlQSiqWzDfU814eg+gsyo6SN/RszcXg=;
 b=FQB3RKYFrMv2iZzNxawRkxoh14JIIKKo8kdEO0tWjXZxox+DUXHVglkoI/mZupFiS2M7+x
 n7PuhGOq/GzRc+aZXZeOg1DYRzrQPG0w1vrW1jG7PejAcnXHeoJPnmOQKHX04J4PI3eq07
 4hlSnTv5PeWA707lV7xQsrBoNSL7pA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-qaIhGRvtNWeNYrDGc8mnTA-1; Wed, 24 Mar 2021 02:33:20 -0400
X-MC-Unique: qaIhGRvtNWeNYrDGc8mnTA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB19581746A
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 06:33:19 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-254.pek2.redhat.com
 [10.72.12.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03E396EE3C
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 06:33:18 +0000 (UTC)
Subject: Re: [PATCH v4 2/4] vhost-vdpa: add callback function for configure
 interrupt
To: qemu-devel@nongnu.org
References: <20210323015641.10820-1-lulu@redhat.com>
 <20210323015641.10820-3-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7acc16cc-aef8-34d1-250b-97ebf2cbdd8a@redhat.com>
Date: Wed, 24 Mar 2021 14:33:17 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323015641.10820-3-lulu@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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


ÔÚ 2021/3/23 ÉÏÎç9:56, Cindy Lu Ð´µÀ:
> Add call back function for configure interrupt.
> Set the notifier's fd to the kernel driver when vdpa start.
> also set -1 while vdpa stop. then the kernel will release
> the related resource
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/virtio/trace-events            |  2 ++
>   hw/virtio/vhost-vdpa.c            | 40 +++++++++++++++++++++++++++++--
>   include/hw/virtio/vhost-backend.h |  4 ++++
>   3 files changed, 44 insertions(+), 2 deletions(-)
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
> index 01d2101d09..bde32eefe7 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -467,20 +467,47 @@ static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
>       }
>       return ret;
>    }
> -
> +static void vhost_vdpa_config_notify_start(struct vhost_dev *dev,
> +                                struct VirtIODevice *vdev, bool start)
> +{
> +    int fd = 0;
> +    int r = 0;
> +    if (!(dev->features & (0x1ULL << VIRTIO_NET_F_STATUS))) {
> +        return;
> +    }
> +    if (start) {
> +        fd = event_notifier_get_fd(&vdev->config_notifier);
> +        r = dev->vhost_ops->vhost_set_config_call(dev, &fd);
> +     /*set the fd call back to vdpa driver*/
> +        if (!r) {
> +            vdev->use_config_notifier = VIRTIO_CONFIG_WORK;
> +            event_notifier_set(&vdev->config_notifier);


Is this a workaround for the vdpa device without config interrupt? I 
wonder how much we could gain from this.


> +            info_report("vhost_vdpa_config_notify start!");


This is a debug code I guess.


> +      }
> +    } else {
> +        fd = -1;
> +        vdev->use_config_notifier = VIRTIO_CONFIG_STOP;


Looks like a duplicated state with vhost_dev->started?


> +        r = dev->vhost_ops->vhost_set_config_call(dev, &fd);
> +    }
> +    return;
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
> @@ -546,6 +573,14 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>       return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
>   }
>   
> +static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
> +                                       int *fd)
> +{
> +    trace_vhost_vdpa_set_config_call(dev, fd);
> +
> +    return vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, fd);
> +}
> +
>   static int vhost_vdpa_get_features(struct vhost_dev *dev,
>                                        uint64_t *features)
>   {
> @@ -611,4 +646,5 @@ const VhostOps vdpa_ops = {
>           .vhost_get_device_id = vhost_vdpa_get_device_id,
>           .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
>           .vhost_force_iommu = vhost_vdpa_force_iommu,
> +        .vhost_set_config_call = vhost_vdpa_set_config_call,
>   };
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> index 8a6f8e2a7a..1a2fee8994 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h


A separated patch please.

Thanks


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


