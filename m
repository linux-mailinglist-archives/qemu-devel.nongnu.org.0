Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E674D3985B3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 11:52:32 +0200 (CEST)
Received: from localhost ([::1]:34074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loNY8-0007HR-04
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 05:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loNWz-0005MQ-17
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:51:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loNWs-0000aD-VA
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622627474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ABI4aBjedu7FgUY6x5QkcepnRWFQJAJtjqNOfXbZZCQ=;
 b=RTtB/06lv+vLnEHof4qhFy0hkTALUgA5txUCujJC70La+fhQU/JFUfSwKYYrGHpWvTicei
 QU2OWNwuIKvJ6qnelMDxCxMEtDgPhHRi+VRRkIlnD72hWLtLmCJe+8A+OTrsQ1v3Q3odvH
 EhyN7WQnR5k9tmhYJtNf+6ZNBtYJ1MU=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-dknp27wvOumP-3thsGPTmA-1; Wed, 02 Jun 2021 05:51:13 -0400
X-MC-Unique: dknp27wvOumP-3thsGPTmA-1
Received: by mail-pg1-f200.google.com with SMTP id
 135-20020a63038d0000b0290220201658a7so1324714pgd.21
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 02:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ABI4aBjedu7FgUY6x5QkcepnRWFQJAJtjqNOfXbZZCQ=;
 b=HBGVZ1DysP4T/R4lkuOv5PMJqgD2XYN/kP+v27uKhr1+MozbSm9ftpqhkm6+H1/EmF
 /p9Qe/fpuYP0aPamC4K3RugYRLFDKBLAMuxeYr8fWBrAi2FSuXfR98GW28faFeW6ymz+
 R1uVbPwXowF4geQ4y+Sxw/9cHepqarl0Xf6pp0WXktMcXcCZqDPOLCi3j/EZ0eGwU8cO
 ywtIemfgDBD+JMvW7Gq+biC2fA6RwEbNtj7K6M5Dt/ibCqk3BTplfDXmUDkCpaxctfnB
 z24GZlltOcejBwC+lr9a8s+IadBG6bwIz73HdqnQgLmsg03nPkJr5jk2ka7RxxSLuju8
 jLLA==
X-Gm-Message-State: AOAM533vQTDMOTuIe5stUehgtTmPLpxr/j3+0Q0KaEe0H/pR9DWwp0Xi
 Q475LnXzmBZ76zFuHDuVCQ5adEet8QUoJNM1xZ0jfbJDhRgYcMHjZyV+OfNxZZwSoYgXEml89FL
 WVJKVvSni9Hq2j7M=
X-Received: by 2002:a17:90b:3584:: with SMTP id
 mm4mr4771576pjb.171.1622627471767; 
 Wed, 02 Jun 2021 02:51:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyM9Lr3nApButF+87sjYF3JhiFZ3FUD7QsCTIZXNG+jtG6IU2hlPzrhb/QK9NgryQq0SoIHXQ==
X-Received: by 2002:a17:90b:3584:: with SMTP id
 mm4mr4771540pjb.171.1622627471417; 
 Wed, 02 Jun 2021 02:51:11 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id p19sm2981708pjv.21.2021.06.02.02.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 02:51:10 -0700 (PDT)
Subject: Re: [RFC v3 17/29] vhost: Shadow virtqueue buffers forwarding
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-18-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bfd680e5-9434-3fbe-3119-1f3c5fc42f4c@redhat.com>
Date: Wed, 2 Jun 2021 17:50:47 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210519162903.1172366-18-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/5/20 上午12:28, Eugenio Pérez 写道:
> Initial version of shadow virtqueue that actually forward buffers. The
> exposed addresses are the qemu's virtual address, so devices with IOMMU
> that does not allow full mapping of qemu's address space does not work
> at the moment.
>
> Also for simplicity it only supports modern devices, that expects vring
> in little endian, with split ring and no event idx or indirect
> descriptors.
>
> It reuses the VirtQueue code for the device part. The driver part is
> based on Linux's virtio_ring driver, but with stripped functionality
> and optimizations so it's easier to review.
>
> Later commits will solve some of these concerns.


It would be more more easier to review if you squash those 
"enhancements" into this patch.


>
> Code also need to map used ring (device part) as RW in, and only in,
> vhost-net. To map (or call vhost_device_iotlb_miss) inconditionally
> would print an error in case of vhost devices with its own mapping
> (vdpa).


I think we should not depend on the IOTLB miss. Instead, we should 
program the device IOTLB before starting the svq. Or is there anything 
that prevent you from doing this?


> To know if this call is needed, vhost_sw_live_migration_start_vq and
> vhost_sw_live_migration_stop copy the test performed in
> vhost_dev_start. Testing for the actual backend type could be cleaner,
> or checking for non-NULL vhost_force_iommu, enable_custom_iommu, or
> another vhostOp. We could extract this test in its own function too,
> so its name could give a better hint. Just copy the vhost_dev_start
> check at the moment.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.c | 205 +++++++++++++++++++++++++++--
>   hw/virtio/vhost.c                  | 134 ++++++++++++++++++-
>   2 files changed, 325 insertions(+), 14 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index ff50f12410..6d767fe248 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -9,6 +9,7 @@
>   
>   #include "hw/virtio/vhost-shadow-virtqueue.h"
>   #include "hw/virtio/vhost.h"
> +#include "hw/virtio/virtio-access.h"
>   
>   #include "standard-headers/linux/vhost_types.h"
>   
> @@ -48,9 +49,93 @@ typedef struct VhostShadowVirtqueue {
>   
>       /* Virtio device */
>       VirtIODevice *vdev;
> +
> +    /* Map for returning guest's descriptors */
> +    VirtQueueElement **ring_id_maps;
> +
> +    /* Next head to expose to device */
> +    uint16_t avail_idx_shadow;
> +
> +    /* Next free descriptor */
> +    uint16_t free_head;
> +
> +    /* Last seen used idx */
> +    uint16_t shadow_used_idx;
> +
> +    /* Next head to consume from device */
> +    uint16_t used_idx;
>   } VhostShadowVirtqueue;
>   
> -/* Forward guest notifications */
> +static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
> +                                    const struct iovec *iovec,
> +                                    size_t num, bool more_descs, bool write)
> +{
> +    uint16_t i = svq->free_head, last = svq->free_head;
> +    unsigned n;
> +    uint16_t flags = write ? cpu_to_le16(VRING_DESC_F_WRITE) : 0;
> +    vring_desc_t *descs = svq->vring.desc;
> +
> +    if (num == 0) {
> +        return;
> +    }
> +
> +    for (n = 0; n < num; n++) {
> +        if (more_descs || (n + 1 < num)) {
> +            descs[i].flags = flags | cpu_to_le16(VRING_DESC_F_NEXT);
> +        } else {
> +            descs[i].flags = flags;
> +        }
> +        descs[i].addr = cpu_to_le64((hwaddr)iovec[n].iov_base);
> +        descs[i].len = cpu_to_le32(iovec[n].iov_len);
> +
> +        last = i;
> +        i = cpu_to_le16(descs[i].next);
> +    }
> +
> +    svq->free_head = le16_to_cpu(descs[last].next);
> +}
> +
> +static unsigned vhost_shadow_vq_add_split(VhostShadowVirtqueue *svq,
> +                                          VirtQueueElement *elem)
> +{
> +    int head;
> +    unsigned avail_idx;
> +    vring_avail_t *avail = svq->vring.avail;
> +
> +    head = svq->free_head;
> +
> +    /* We need some descriptors here */
> +    assert(elem->out_num || elem->in_num);
> +
> +    vhost_vring_write_descs(svq, elem->out_sg, elem->out_num,
> +                            elem->in_num > 0, false);
> +    vhost_vring_write_descs(svq, elem->in_sg, elem->in_num, false, true);
> +
> +    /*
> +     * Put entry in available array (but don't update avail->idx until they
> +     * do sync).
> +     */
> +    avail_idx = svq->avail_idx_shadow & (svq->vring.num - 1);
> +    avail->ring[avail_idx] = cpu_to_le16(head);
> +    svq->avail_idx_shadow++;
> +
> +    /* Expose descriptors to device */


It's better to describe the detail order.

E.g "Update avail index after the descriptor is wrote"


> +    smp_wmb();
> +    avail->idx = cpu_to_le16(svq->avail_idx_shadow);
> +
> +    return head;
> +
> +}
> +
> +static void vhost_shadow_vq_add(VhostShadowVirtqueue *svq,
> +                                VirtQueueElement *elem)
> +{
> +    unsigned qemu_head = vhost_shadow_vq_add_split(svq, elem);
> +
> +    svq->ring_id_maps[qemu_head] = elem;
> +}
> +
> +/* Handle guest->device notifications */
>   static void vhost_handle_guest_kick(EventNotifier *n)
>   {
>       VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
> @@ -60,7 +145,67 @@ static void vhost_handle_guest_kick(EventNotifier *n)
>           return;
>       }
>   
> -    event_notifier_set(&svq->kick_notifier);
> +    /* Make available as many buffers as possible */
> +    do {
> +        if (virtio_queue_get_notification(svq->vq)) {
> +            /* No more notifications until process all available */
> +            virtio_queue_set_notification(svq->vq, false);
> +        }
> +
> +        while (true) {
> +            VirtQueueElement *elem = virtqueue_pop(svq->vq, sizeof(*elem));
> +            if (!elem) {
> +                break;
> +            }
> +
> +            vhost_shadow_vq_add(svq, elem);
> +            event_notifier_set(&svq->kick_notifier);
> +        }
> +
> +        virtio_queue_set_notification(svq->vq, true);
> +    } while (!virtio_queue_empty(svq->vq));
> +}
> +
> +static bool vhost_shadow_vq_more_used(VhostShadowVirtqueue *svq)
> +{
> +    if (svq->used_idx != svq->shadow_used_idx) {
> +        return true;
> +    }
> +
> +    /* Get used idx must not be reordered */
> +    smp_rmb();
> +    svq->shadow_used_idx = cpu_to_le16(svq->vring.used->idx);
> +
> +    return svq->used_idx != svq->shadow_used_idx;
> +}
> +
> +static VirtQueueElement *vhost_shadow_vq_get_buf(VhostShadowVirtqueue *svq)
> +{
> +    vring_desc_t *descs = svq->vring.desc;
> +    const vring_used_t *used = svq->vring.used;
> +    vring_used_elem_t used_elem;
> +    uint16_t last_used;
> +
> +    if (!vhost_shadow_vq_more_used(svq)) {
> +        return NULL;
> +    }
> +
> +    last_used = svq->used_idx & (svq->vring.num - 1);
> +    used_elem.id = le32_to_cpu(used->ring[last_used].id);
> +    used_elem.len = le32_to_cpu(used->ring[last_used].len);
> +
> +    if (unlikely(used_elem.id >= svq->vring.num)) {
> +        error_report("Device %s says index %u is available", svq->vdev->name,
> +                     used_elem.id);
> +        return NULL;
> +    }
> +
> +    descs[used_elem.id].next = svq->free_head;
> +    svq->free_head = used_elem.id;
> +
> +    svq->used_idx++;
> +    svq->ring_id_maps[used_elem.id]->len = used_elem.len;
> +    return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
>   }
>   
>   /* Forward vhost notifications */
> @@ -69,17 +214,33 @@ static void vhost_shadow_vq_handle_call_no_test(EventNotifier *n)
>       VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
>                                                call_notifier);
>       EventNotifier *masked_notifier;
> +    VirtQueue *vq = svq->vq;
>   
>       masked_notifier = svq->masked_notifier.n;
>   
> -    if (!masked_notifier) {
> -        unsigned n = virtio_get_queue_index(svq->vq);
> -        virtio_queue_invalidate_signalled_used(svq->vdev, n);
> -        virtio_notify_irqfd(svq->vdev, svq->vq);
> -    } else if (!svq->masked_notifier.signaled) {
> -        svq->masked_notifier.signaled = true;
> -        event_notifier_set(svq->masked_notifier.n);
> -    }
> +    /* Make as many buffers as possible used. */
> +    do {
> +        unsigned i = 0;
> +
> +        /* TODO: Use VRING_AVAIL_F_NO_INTERRUPT */
> +        while (true) {
> +            g_autofree VirtQueueElement *elem = vhost_shadow_vq_get_buf(svq);
> +            if (!elem) {
> +                break;
> +            }
> +
> +            assert(i < svq->vring.num);
> +            virtqueue_fill(vq, elem, elem->len, i++);
> +        }
> +
> +        virtqueue_flush(vq, i);
> +        if (!masked_notifier) {
> +            virtio_notify_irqfd(svq->vdev, svq->vq);


Any reason that you don't use virtio_notify() here?


> +        } else if (!svq->masked_notifier.signaled) {
> +            svq->masked_notifier.signaled = true;
> +            event_notifier_set(svq->masked_notifier.n);
> +        }


This is an example of the extra complexity if you do shadow virtqueue at 
virtio level.

If you do everything at e.g vhost-vdpa, you don't need to care about 
masked_notifer at all.

Thanks


