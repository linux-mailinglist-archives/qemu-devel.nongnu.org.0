Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 192EC42B3E1
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:56:22 +0200 (CEST)
Received: from localhost ([::1]:37626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maVNN-0008GF-5b
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maVLx-0007VX-A7
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 23:54:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maVLv-0003mx-4H
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 23:54:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634097290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8pp6pJbc/kCViB86CHPdXK7ofeJwJIyHXYz6BBMaDCM=;
 b=AwSkffHTbALcx++x3kuybD/n+lWoymAzzbb24sFN8dShrVq8gJObxpHi1FuDdSAK8Nf6nF
 ESGgnsgUH55PAl6a1dgVi1ZLqlmfi+ade0U1RP1zo2S7A2aklod9IvSP+F+flwQ3FztMrO
 ssz+YPThV0xg4bRRnZLvYETHmMp7V08=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-d0SaujwaOGSzDSxs9QkbVw-1; Tue, 12 Oct 2021 23:54:49 -0400
X-MC-Unique: d0SaujwaOGSzDSxs9QkbVw-1
Received: by mail-pj1-f70.google.com with SMTP id
 s34-20020a17090a2f2500b001a0e1134a7aso31170pjd.1
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 20:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=8pp6pJbc/kCViB86CHPdXK7ofeJwJIyHXYz6BBMaDCM=;
 b=RkkHdQkhX+zFbfLeBXQFfaoFMvXVt43mhMLxAYQTszg96pF5b1/ktd0j7JiovPO5ew
 LtcXtuap9PvjoMusnKQxk9YCKPtS+5tNLZDupP+RxHihUe3maky7/GU+t6XP5ELJ6ONs
 lHlITWtq5TTgNmxgmHDVLMGCPYTbcho5bfsHOJaRHc8/zk/Wpat5QgXuSjIrnQ3Uyt50
 g14PdiHxxnyoACUJmXvA+7JraOOW8rs4U4T/FhByCD+sVIUIRyZkN0CNjm5q0UDpIkha
 euU0f/Gb9Yf3cTxfgxz2RnxvZbNKwfq4ZgIrICIgnKbhHsRVxCY+IVNCKOjdr5QnMN7J
 zMVA==
X-Gm-Message-State: AOAM531vKbTTI9exoFPCzZuoAfsVE2JqlCdzF5R/K+ORaqZttnbe1WJq
 nxzlqNIX0vb/yAlj8Zyzlle8hsiJ3x2+vGgl01F9D8SlmRqKEkz6iERoU/begFlbOkEy0ysSwyP
 Cu/yJPxDzzOZYOQk=
X-Received: by 2002:a17:90b:3797:: with SMTP id
 mz23mr10695568pjb.216.1634097287821; 
 Tue, 12 Oct 2021 20:54:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8frD7nceWkG/wcTi9zXiIJS75uqhIzHEjaaQgFza7nQYVt58ZyYCGcp9+txgUU5eg5JTZ4Q==
X-Received: by 2002:a17:90b:3797:: with SMTP id
 mz23mr10695537pjb.216.1634097287452; 
 Tue, 12 Oct 2021 20:54:47 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id p17sm4252142pjg.54.2021.10.12.20.54.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 20:54:47 -0700 (PDT)
Subject: Re: [RFC PATCH v4 12/20] virtio: Add vhost_shadow_vq_get_vring_addr
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-13-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <981f5647-544e-f35e-4b72-06eca733368f@redhat.com>
Date: Wed, 13 Oct 2021 11:54:37 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001070603.307037-13-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/10/1 下午3:05, Eugenio Pérez 写道:
> It reports the shadow virtqueue address from qemu virtual address space


I think both the title and commit log needs to more tweaks. Looking at 
the codes, what id does is actually introduce vring into svq.


>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h |  4 +++
>   hw/virtio/vhost-shadow-virtqueue.c | 50 ++++++++++++++++++++++++++++++
>   2 files changed, 54 insertions(+)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index 237cfceb9c..2df3d117f5 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -16,6 +16,10 @@ typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
>   
>   EventNotifier *vhost_svq_get_svq_call_notifier(VhostShadowVirtqueue *svq);
>   void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int call_fd);
> +void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
> +                              struct vhost_vring_addr *addr);
> +size_t vhost_svq_driver_area_size(const VhostShadowVirtqueue *svq);
> +size_t vhost_svq_device_area_size(const VhostShadowVirtqueue *svq);
>   
>   bool vhost_svq_start(struct vhost_dev *dev, unsigned idx,
>                        VhostShadowVirtqueue *svq);
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 3fe129cf63..5c1899f6af 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -18,6 +18,9 @@
>   
>   /* Shadow virtqueue to relay notifications */
>   typedef struct VhostShadowVirtqueue {
> +    /* Shadow vring */
> +    struct vring vring;
> +
>       /* Shadow kick notifier, sent to vhost */
>       EventNotifier kick_notifier;
>       /* Shadow call notifier, sent to vhost */
> @@ -38,6 +41,9 @@ typedef struct VhostShadowVirtqueue {
>   
>       /* Virtio queue shadowing */
>       VirtQueue *vq;
> +
> +    /* Virtio device */
> +    VirtIODevice *vdev;
>   } VhostShadowVirtqueue;
>   
>   /* Forward guest notifications */
> @@ -93,6 +99,35 @@ void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int call_fd)
>       event_notifier_init_fd(&svq->guest_call_notifier, call_fd);
>   }
>   
> +/*
> + * Get the shadow vq vring address.
> + * @svq Shadow virtqueue
> + * @addr Destination to store address
> + */
> +void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
> +                              struct vhost_vring_addr *addr)
> +{
> +    addr->desc_user_addr = (uint64_t)svq->vring.desc;
> +    addr->avail_user_addr = (uint64_t)svq->vring.avail;
> +    addr->used_user_addr = (uint64_t)svq->vring.used;
> +}
> +
> +size_t vhost_svq_driver_area_size(const VhostShadowVirtqueue *svq)
> +{
> +    uint16_t vq_idx = virtio_get_queue_index(svq->vq);
> +    size_t desc_size = virtio_queue_get_desc_size(svq->vdev, vq_idx);
> +    size_t avail_size = virtio_queue_get_avail_size(svq->vdev, vq_idx);
> +
> +    return ROUND_UP(desc_size + avail_size, qemu_real_host_page_size);


Is this round up required by the spec?


> +}
> +
> +size_t vhost_svq_device_area_size(const VhostShadowVirtqueue *svq)
> +{
> +    uint16_t vq_idx = virtio_get_queue_index(svq->vq);
> +    size_t used_size = virtio_queue_get_used_size(svq->vdev, vq_idx);
> +    return ROUND_UP(used_size, qemu_real_host_page_size);
> +}
> +
>   /*
>    * Restore the vhost guest to host notifier, i.e., disables svq effect.
>    */
> @@ -178,6 +213,10 @@ void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
>   VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
>   {
>       int vq_idx = dev->vq_index + idx;
> +    unsigned num = virtio_queue_get_num(dev->vdev, vq_idx);
> +    size_t desc_size = virtio_queue_get_desc_size(dev->vdev, vq_idx);
> +    size_t driver_size;
> +    size_t device_size;
>       g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
>       int r;
>   
> @@ -196,6 +235,15 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
>       }
>   
>       svq->vq = virtio_get_queue(dev->vdev, vq_idx);
> +    svq->vdev = dev->vdev;
> +    driver_size = vhost_svq_driver_area_size(svq);
> +    device_size = vhost_svq_device_area_size(svq);
> +    svq->vring.num = num;
> +    svq->vring.desc = qemu_memalign(qemu_real_host_page_size, driver_size);
> +    svq->vring.avail = (void *)((char *)svq->vring.desc + desc_size);
> +    memset(svq->vring.desc, 0, driver_size);


Any reason for using the contiguous area for both desc and avail?

Thanks


> +    svq->vring.used = qemu_memalign(qemu_real_host_page_size, device_size);
> +    memset(svq->vring.used, 0, device_size);
>       event_notifier_set_handler(&svq->call_notifier,
>                                  vhost_svq_handle_call);
>       return g_steal_pointer(&svq);
> @@ -215,5 +263,7 @@ void vhost_svq_free(VhostShadowVirtqueue *vq)
>       event_notifier_cleanup(&vq->kick_notifier);
>       event_notifier_set_handler(&vq->call_notifier, NULL);
>       event_notifier_cleanup(&vq->call_notifier);
> +    qemu_vfree(vq->vring.desc);
> +    qemu_vfree(vq->vring.used);
>       g_free(vq);
>   }


