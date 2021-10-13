Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF38442B440
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 06:33:11 +0200 (CEST)
Received: from localhost ([::1]:46832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maVx0-0000lE-Ay
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 00:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maVvk-0007xE-6J
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 00:31:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maVve-00068x-UQ
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 00:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634099505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3xKHz2JdD8K6JiosUuEZHOU50tselCBgZiK5ddsVqi0=;
 b=U+ji1YG5qVWnS/70iR1YDDd+hhLdwkJIeMCL0f/ciKmGYi7roHKUqHxbmhD/Sip+fLgGOq
 jQ5LQxz6ms6WdLppSr78HiMOnmDehk6Z1E+lhFSkDokSNq2hlR2BjkGUjyBJuFa67ruxX/
 kI4Yapzrm062bmjKvCs8OB5IkxSv3vM=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-d05qcTPGOUCfy0eKv-vdTg-1; Wed, 13 Oct 2021 00:31:41 -0400
X-MC-Unique: d05qcTPGOUCfy0eKv-vdTg-1
Received: by mail-pf1-f199.google.com with SMTP id
 t4-20020a62ea04000000b0044b333f5d1bso830936pfh.20
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 21:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=3xKHz2JdD8K6JiosUuEZHOU50tselCBgZiK5ddsVqi0=;
 b=MHRPy5FqD/OeVP1cZlpsBFBK4dGwGbjbOzKqpySO5Q9DO9bFvnMcMYtZm4MwrCQlM6
 /FeSImn2QLJ4AkqHc07CFuxeU3DhXJEogDPWVAi1KKQ+1QjFxoyuQ3jL8pQlwBSJB6XI
 ySwwhHrH80ckj/La6pZQptpkPQGFtG46Xhkt2jMP/xe+eltSKkb+oSow7xH8CxvqO+A/
 aH8+qJPMDtYJNL7X/kXPBym5ZSL5M96OSzuRuGbSi1BVfM4TsEXBX72pXCCjNvaH4XfZ
 nncAJtS/+qmL6z1dO1XZfewqsg5fVX5nD+r4OqoayX/4kq/TskJ6gDW49ppzbvVfb4H3
 7nvg==
X-Gm-Message-State: AOAM531uwqa2lhAHq6Mf3VY2Jny1FONOak4tZNUwe//vulTlHM/CHShC
 bd5xmheTzILNBO96tPnj8+3CtblsWfj0KXdPsl9ohGGiEm5pcIVb3bbUVdO2BWRHsb/UHBltu+F
 DzUW8a4O1jfKzJp4=
X-Received: by 2002:a62:6543:0:b0:44c:61a0:555a with SMTP id
 z64-20020a626543000000b0044c61a0555amr34937218pfb.14.1634099500273; 
 Tue, 12 Oct 2021 21:31:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBrjt65dtZFwMi+p55sZgAXQ+BwZ5elBTAaGK6M69a/chE+h2NBWJ7poSj+DVKQnBq8Y0D4w==
X-Received: by 2002:a62:6543:0:b0:44c:61a0:555a with SMTP id
 z64-20020a626543000000b0044c61a0555amr34937177pfb.14.1634099499640; 
 Tue, 12 Oct 2021 21:31:39 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id y24sm12384333pfo.69.2021.10.12.21.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 21:31:39 -0700 (PDT)
Subject: Re: [RFC PATCH v4 15/20] vhost: Shadow virtqueue buffers forwarding
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-16-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a55ad3f5-09ef-b361-e690-1f8c9423fde3@redhat.com>
Date: Wed, 13 Oct 2021 12:31:26 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001070603.307037-16-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
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
> Initial version of shadow virtqueue that actually forward buffers. There
> are no iommu support at the moment, and that will be addressed in future
> patches of this series. Since all vhost-vdpa devices uses forced IOMMU,
> this means that SVQ is not usable at this point of the series on any
> device.
>
> For simplicity it only supports modern devices, that expects vring
> in little endian, with split ring and no event idx or indirect
> descriptors. Support for them will not be added in this series.
>
> It reuses the VirtQueue code for the device part. The driver part is
> based on Linux's virtio_ring driver, but with stripped functionality
> and optimizations so it's easier to review. Later commits add simpler
> ones.
>
> SVQ uses VIRTIO_CONFIG_S_DEVICE_STOPPED to pause the device and
> retrieve its status (next available idx the device was going to
> consume) race-free. It can later reset the device to replace vring
> addresses etc. When SVQ starts qemu can resume consuming the guest's
> driver ring from that state, without notice from the latter.
>
> This status bit VIRTIO_CONFIG_S_DEVICE_STOPPED is currently discussed
> in VirtIO, and is implemented in qemu VirtIO-net devices in previous
> commits.
>
> Removal of _S_DEVICE_STOPPED bit (in other words, resuming the device)
> can be done in the future if an use case arises. At this moment we can
> just rely on reseting the full device.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   qapi/net.json                      |   2 +-
>   hw/virtio/vhost-shadow-virtqueue.c | 237 ++++++++++++++++++++++++++++-
>   hw/virtio/vhost-vdpa.c             | 109 ++++++++++++-
>   3 files changed, 337 insertions(+), 11 deletions(-)
>
> diff --git a/qapi/net.json b/qapi/net.json
> index fe546b0e7c..1f4a55f2c5 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -86,7 +86,7 @@
>   #
>   # @name: the device name of the VirtIO device
>   #
> -# @enable: true to use the alternate shadow VQ notifications
> +# @enable: true to use the alternate shadow VQ buffers fowarding path
>   #
>   # Returns: Error if failure, or 'no error' for success.
>   #
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 34e159d4fd..df7e6fa3ec 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -10,6 +10,7 @@
>   #include "qemu/osdep.h"
>   #include "hw/virtio/vhost-shadow-virtqueue.h"
>   #include "hw/virtio/vhost.h"
> +#include "hw/virtio/virtio-access.h"
>   
>   #include "standard-headers/linux/vhost_types.h"
>   
> @@ -44,15 +45,135 @@ typedef struct VhostShadowVirtqueue {
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


Let's use "last_used_idx" as kernel driver did.


>   } VhostShadowVirtqueue;
>   
>   /* If the device is using some of these, SVQ cannot communicate */
>   bool vhost_svq_valid_device_features(uint64_t *dev_features)
>   {
> -    return true;
> +    uint64_t b;
> +    bool r = true;
> +
> +    for (b = VIRTIO_TRANSPORT_F_START; b <= VIRTIO_TRANSPORT_F_END; ++b) {
> +        switch (b) {
> +        case VIRTIO_F_NOTIFY_ON_EMPTY:
> +        case VIRTIO_F_ANY_LAYOUT:
> +            /* SVQ is fine with this feature */
> +            continue;
> +
> +        case VIRTIO_F_ACCESS_PLATFORM:
> +            /* SVQ needs this feature disabled. Can't continue */


So code can explain itself, need a comment to explain why.


> +            if (*dev_features & BIT_ULL(b)) {
> +                clear_bit(b, dev_features);
> +                r = false;
> +            }
> +            break;
> +
> +        case VIRTIO_F_VERSION_1:
> +            /* SVQ needs this feature, so can't continue */


A comment to explain why SVQ needs this feature.


> +            if (!(*dev_features & BIT_ULL(b))) {
> +                set_bit(b, dev_features);
> +                r = false;
> +            }
> +            continue;
> +
> +        default:
> +            /*
> +             * SVQ must disable this feature, let's hope the device is fine
> +             * without it.
> +             */
> +            if (*dev_features & BIT_ULL(b)) {
> +                clear_bit(b, dev_features);
> +            }
> +        }
> +    }
> +
> +    return r;
> +}


Let's move this to patch 14.


> +
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
> +static unsigned vhost_svq_add_split(VhostShadowVirtqueue *svq,
> +                                    VirtQueueElement *elem)
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
> +    /* Update avail index after the descriptor is wrote */
> +    smp_wmb();
> +    avail->idx = cpu_to_le16(svq->avail_idx_shadow);
> +
> +    return head;
> +
>   }
>   
> -/* Forward guest notifications */
> +static void vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
> +{
> +    unsigned qemu_head = vhost_svq_add_split(svq, elem);
> +
> +    svq->ring_id_maps[qemu_head] = elem;
> +}
> +
> +/* Handle guest->device notifications */
>   static void vhost_handle_guest_kick(EventNotifier *n)
>   {
>       VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
> @@ -62,7 +183,74 @@ static void vhost_handle_guest_kick(EventNotifier *n)
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


This can be done outside the loop.


> +
> +        while (true) {
> +            VirtQueueElement *elem = virtqueue_pop(svq->vq, sizeof(*elem));
> +            if (!elem) {
> +                break;
> +            }
> +
> +            vhost_svq_add(svq, elem);
> +            event_notifier_set(&svq->kick_notifier);
> +        }
> +
> +        virtio_queue_set_notification(svq->vq, true);


I think this can be moved to the end of this function.

Btw, we probably need a quota to make sure the svq is not hogging the 
main event loop.

Similar issue could be found in both virtio-net TX (using timer or bh) 
and TAP (a quota).


> +    } while (!virtio_queue_empty(svq->vq));
> +}
> +
> +static bool vhost_svq_more_used(VhostShadowVirtqueue *svq)
> +{
> +    if (svq->used_idx != svq->shadow_used_idx) {
> +        return true;
> +    }
> +
> +    /* Get used idx must not be reordered */
> +    smp_rmb();


Interesting, we don't do this for kernel drivers. It would be helpful to 
explain it more clear by "X must be done before Y".


> +    svq->shadow_used_idx = cpu_to_le16(svq->vring.used->idx);
> +
> +    return svq->used_idx != svq->shadow_used_idx;
> +}
> +
> +static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq)
> +{
> +    vring_desc_t *descs = svq->vring.desc;
> +    const vring_used_t *used = svq->vring.used;
> +    vring_used_elem_t used_elem;
> +    uint16_t last_used;
> +
> +    if (!vhost_svq_more_used(svq)) {
> +        return NULL;
> +    }
> +
> +    last_used = svq->used_idx & (svq->vring.num - 1);
> +    used_elem.id = le32_to_cpu(used->ring[last_used].id);
> +    used_elem.len = le32_to_cpu(used->ring[last_used].len);
> +
> +    svq->used_idx++;
> +    if (unlikely(used_elem.id >= svq->vring.num)) {
> +        error_report("Device %s says index %u is used", svq->vdev->name,
> +                     used_elem.id);
> +        return NULL;
> +    }
> +
> +    if (unlikely(!svq->ring_id_maps[used_elem.id])) {
> +        error_report(
> +            "Device %s says index %u is used, but it was not available",
> +            svq->vdev->name, used_elem.id);
> +        return NULL;
> +    }
> +
> +    descs[used_elem.id].next = svq->free_head;
> +    svq->free_head = used_elem.id;
> +
> +    svq->ring_id_maps[used_elem.id]->len = used_elem.len;
> +    return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
>   }
>   
>   /* Forward vhost notifications */
> @@ -70,8 +258,26 @@ static void vhost_svq_handle_call_no_test(EventNotifier *n)
>   {
>       VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
>                                                call_notifier);
> -
> -    event_notifier_set(&svq->guest_call_notifier);
> +    VirtQueue *vq = svq->vq;
> +
> +    /* Make as many buffers as possible used. */
> +    do {
> +        unsigned i = 0;
> +
> +        /* TODO: Use VRING_AVAIL_F_NO_INTERRUPT */
> +        while (true) {
> +            g_autofree VirtQueueElement *elem = vhost_svq_get_buf(svq);
> +            if (!elem) {
> +                break;
> +            }
> +
> +            assert(i < svq->vring.num);


Let's return error instead of using the assert.


> +            virtqueue_fill(vq, elem, elem->len, i++);
> +        }
> +
> +        virtqueue_flush(vq, i);
> +        event_notifier_set(&svq->guest_call_notifier);
> +    } while (vhost_svq_more_used(svq));
>   }
>   
>   static void vhost_svq_handle_call(EventNotifier *n)
> @@ -204,12 +410,25 @@ err_set_vring_kick:
>   void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
>                       VhostShadowVirtqueue *svq)
>   {
> +    int i;
>       int r = vhost_svq_restore_vdev_host_notifier(dev, idx, svq);
> +
>       if (unlikely(r < 0)) {
>           error_report("Couldn't restore vq kick fd: %s", strerror(-r));
>       }
>   
>       event_notifier_set_handler(&svq->host_notifier, NULL);
> +
> +    for (i = 0; i < svq->vring.num; ++i) {
> +        g_autofree VirtQueueElement *elem = svq->ring_id_maps[i];
> +        /*
> +         * Although the doc says we must unpop in order, it's ok to unpop
> +         * everything.
> +         */
> +        if (elem) {
> +            virtqueue_unpop(svq->vq, elem, elem->len);
> +        }


Will this result some of the "pending" buffers to be submitted multiple 
times? If yes, should we wait for all the buffers used instead of doing 
the unpop here?


> +    }
>   }
>   
>   /*
> @@ -224,7 +443,7 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
>       size_t driver_size;
>       size_t device_size;
>       g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
> -    int r;
> +    int r, i;
>   
>       r = event_notifier_init(&svq->kick_notifier, 0);
>       if (r != 0) {
> @@ -250,6 +469,11 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
>       memset(svq->vring.desc, 0, driver_size);
>       svq->vring.used = qemu_memalign(qemu_real_host_page_size, device_size);
>       memset(svq->vring.used, 0, device_size);
> +    for (i = 0; i < num - 1; i++) {
> +        svq->vring.desc[i].next = cpu_to_le16(i + 1);
> +    }
> +
> +    svq->ring_id_maps = g_new0(VirtQueueElement *, num);
>       event_notifier_set_handler(&svq->call_notifier,
>                                  vhost_svq_handle_call);
>       return g_steal_pointer(&svq);
> @@ -269,6 +493,7 @@ void vhost_svq_free(VhostShadowVirtqueue *vq)
>       event_notifier_cleanup(&vq->kick_notifier);
>       event_notifier_set_handler(&vq->call_notifier, NULL);
>       event_notifier_cleanup(&vq->call_notifier);
> +    g_free(vq->ring_id_maps);
>       qemu_vfree(vq->vring.desc);
>       qemu_vfree(vq->vring.used);
>       g_free(vq);
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index a057e8277d..bb7010ddb5 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -19,6 +19,7 @@
>   #include "hw/virtio/virtio-net.h"
>   #include "hw/virtio/vhost-shadow-virtqueue.h"
>   #include "hw/virtio/vhost-vdpa.h"
> +#include "hw/virtio/vhost-shadow-virtqueue.h"
>   #include "exec/address-spaces.h"
>   #include "qemu/main-loop.h"
>   #include "cpu.h"
> @@ -475,6 +476,28 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
>       return vhost_vdpa_backend_set_features(dev, features);
>   }
>   
> +/**
> + * Restore guest features to vdpa device
> + */
> +static int vhost_vdpa_set_guest_features(struct vhost_dev *dev)
> +{
> +    struct vhost_vdpa *v = dev->opaque;
> +    return vhost_vdpa_backend_set_features(dev, v->guest_features);
> +}
> +
> +/**
> + * Set shadow virtqueue supported features
> + */
> +static int vhost_vdpa_set_svq_features(struct vhost_dev *dev)
> +{
> +    struct vhost_vdpa *v = dev->opaque;
> +    uint64_t features = v->host_features;
> +    bool b = vhost_svq_valid_device_features(&features);
> +    assert(b);
> +
> +    return vhost_vdpa_backend_set_features(dev, features);
> +}
> +
>   static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
>   {
>       uint64_t features;
> @@ -730,6 +753,19 @@ static bool  vhost_vdpa_force_iommu(struct vhost_dev *dev)
>       return true;
>   }
>   
> +static int vhost_vdpa_vring_pause(struct vhost_dev *dev)
> +{
> +    int r;
> +    uint8_t status;
> +
> +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DEVICE_STOPPED);
> +    do {
> +        r = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);


I guess we'd better add some sleep here.


> +    } while (r == 0 && !(status & VIRTIO_CONFIG_S_DEVICE_STOPPED));
> +
> +    return 0;
> +}
> +
>   /*
>    * Start shadow virtqueue.
>    */
> @@ -742,9 +778,29 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_dev *dev, unsigned idx)
>           .index = idx + dev->vq_index,
>           .fd = event_notifier_get_fd(vhost_call_notifier),
>       };
> +    struct vhost_vring_addr addr = {
> +        .index = idx + dev->vq_index,
> +    };
> +    struct vhost_vring_state num = {
> +        .index = idx + dev->vq_index,
> +        .num = virtio_queue_get_num(dev->vdev, idx),
> +    };
>       int r;
>       bool b;
>   
> +    vhost_svq_get_vring_addr(svq, &addr);
> +    r = vhost_vdpa_set_vring_addr(dev, &addr);
> +    if (unlikely(r)) {
> +        error_report("vhost_set_vring_addr for shadow vq failed");
> +        return false;
> +    }
> +
> +    r = vhost_vdpa_set_vring_num(dev, &num);
> +    if (unlikely(r)) {
> +        error_report("vhost_vdpa_set_vring_num for shadow vq failed");
> +        return false;
> +    }
> +
>       /* Set shadow vq -> guest notifier */
>       assert(v->call_fd[idx]);
>       vhost_svq_set_guest_call_notifier(svq, v->call_fd[idx]);
> @@ -781,15 +837,32 @@ static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable)
>           assert(v->shadow_vqs->len == 0);
>           for (n = 0; n < hdev->nvqs; ++n) {
>               VhostShadowVirtqueue *svq = vhost_svq_new(hdev, n);
> -            bool ok;
> -
>               if (unlikely(!svq)) {
>                   g_ptr_array_set_size(v->shadow_vqs, 0);
>                   return 0;
>               }
>               g_ptr_array_add(v->shadow_vqs, svq);
> +        }
> +    }
>   
> -            ok = vhost_vdpa_svq_start_vq(hdev, n);
> +    r = vhost_vdpa_vring_pause(hdev);
> +    assert(r == 0);
> +
> +    if (enable) {
> +        for (n = 0; n < v->shadow_vqs->len; ++n) {
> +            /* Obtain Virtqueue state */
> +            vhost_virtqueue_stop(hdev, hdev->vdev, &hdev->vqs[n], n);
> +        }
> +    }
> +
> +    /* Reset device so it can be configured */
> +    r = vhost_vdpa_dev_start(hdev, false);
> +    assert(r == 0);
> +
> +    if (enable) {
> +        int r;
> +        for (n = 0; n < v->shadow_vqs->len; ++n) {
> +            bool ok = vhost_vdpa_svq_start_vq(hdev, n);
>               if (unlikely(!ok)) {
>                   /* Free still not started svqs */
>                   g_ptr_array_set_size(v->shadow_vqs, n);
> @@ -797,11 +870,19 @@ static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable)
>                   break;
>               }
>           }
> +
> +        /* Need to ack features to set state in vp_vdpa devices */


vhost_vdpa actually?


> +        r = vhost_vdpa_set_svq_features(hdev);
> +        if (unlikely(r)) {
> +            enable = false;
> +        }
>       }
>   
>       v->shadow_vqs_enabled = enable;
>   
>       if (!enable) {
> +        vhost_vdpa_set_guest_features(hdev);
> +
>           /* Disable all queues or clean up failed start */
>           for (n = 0; n < v->shadow_vqs->len; ++n) {
>               struct vhost_vring_file file = {
> @@ -818,7 +899,12 @@ static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable)
>               /* TODO: This can unmask or override call fd! */
>               vhost_virtqueue_start(hdev, hdev->vdev, &hdev->vqs[n], vq_idx);
>           }
> +    }
>   
> +    r = vhost_vdpa_dev_start(hdev, true);
> +    assert(r == 0);
> +
> +    if (!enable) {
>           /* Resources cleanup */
>           g_ptr_array_set_size(v->shadow_vqs, 0);
>       }
> @@ -831,6 +917,7 @@ void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Error **errp)
>       struct vhost_vdpa *v;
>       const char *err_cause = NULL;
>       bool r;
> +    uint64_t svq_features;
>   
>       QLIST_FOREACH(v, &vhost_vdpa_devices, entry) {
>           if (v->dev->vdev && 0 == strcmp(v->dev->vdev->name, name)) {
> @@ -846,6 +933,20 @@ void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Error **errp)
>           goto err;
>       }
>   
> +    svq_features = v->host_features;
> +    if (!vhost_svq_valid_device_features(&svq_features)) {
> +        error_setg(errp,
> +            "Can't enable shadow vq on %s: Unexpected feature flags (%lx-%lx)",
> +            name, v->host_features, svq_features);
> +        return;
> +    } else {
> +        /* TODO: Check for virtio_vdpa + IOMMU & modern device */


I guess you mean "vhost_vdpa" here. For IOMMU, I guess you mean "vIOMMU" 
actually?

Thanks


> +    }
> +
> +    if (err_cause) {
> +        goto err;
> +    }
> +
>       r = vhost_vdpa_enable_svq(v, enable);
>       if (unlikely(!r)) {
>           err_cause = "Error enabling (see monitor)";
> @@ -853,7 +954,7 @@ void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Error **errp)
>       }
>   
>   err:
> -    if (err_cause) {
> +    if (errp == NULL && err_cause) {
>           error_setg(errp, "Can't enable shadow vq on %s: %s", name, err_cause);
>       }
>   }


