Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5C4315F32
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 06:58:54 +0100 (CET)
Received: from localhost ([::1]:59120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9iWb-0006SK-7L
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 00:58:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l9iVk-00061r-Ja
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 00:58:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l9iVh-0005ln-W3
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 00:58:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612936677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x/Ns/KDBsldoFpbPdXv0D27tZTOOzNTPAwSvUu8uKRI=;
 b=Fu8EadkYtW2NpvTWVSayBbfPo5bjU5SaaZw44gC247kt3Ny3zHS2QZmOX+6bgmL+c3QjzE
 VaeHDAR2cy5C6NRcaRGHkEn2XRNxUy2h84Vx/UacAEUQJCQqgA/G/AfRdFqlbF8VjWKgGS
 j7aslr4xeLC+/9cNTIpPNxGlZzooTcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-tet5NKcPNjuMgW6_aFnuPw-1; Wed, 10 Feb 2021 00:57:53 -0500
X-MC-Unique: tet5NKcPNjuMgW6_aFnuPw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B10A380364E;
 Wed, 10 Feb 2021 05:57:51 +0000 (UTC)
Received: from [10.72.12.223] (ovpn-12-223.pek2.redhat.com [10.72.12.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1024F10016F9;
 Wed, 10 Feb 2021 05:57:37 +0000 (UTC)
Subject: Re: [RFC 09/10] vhost: Route guest->host notification through shadow
 virtqueue
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20210129205415.876290-1-eperezma@redhat.com>
 <20210129205415.876290-10-eperezma@redhat.com>
 <acb11542-52e0-a271-fd22-dff09daa032e@redhat.com>
 <CAJaqyWe_m3Ekmm5HjW_KZmi9CUL6JJ8Vd2pCtFgAJbfPXmiZCw@mail.gmail.com>
 <2e02fb06-985c-8d93-f4ce-24d108285ba6@redhat.com>
 <CAJaqyWc39+tqEwm6OMxEMa1XhRQxncWO31nUFXPFYMPJzh7cgQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <308a40ea-48ca-fc05-8925-9719c10ece1a@redhat.com>
Date: Wed, 10 Feb 2021 13:57:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJaqyWc39+tqEwm6OMxEMa1XhRQxncWO31nUFXPFYMPJzh7cgQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Rob Miller <rob.miller@broadcom.com>, Parav Pandit <parav@mellanox.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 virtualization@lists.linux-foundation.org, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/2/9 下午11:02, Eugenio Perez Martin wrote:
> On Thu, Feb 4, 2021 at 4:27 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> On 2021/2/2 下午6:08, Eugenio Perez Martin wrote:
>>> On Mon, Feb 1, 2021 at 7:29 AM Jason Wang <jasowang@redhat.com> wrote:
>>>> On 2021/1/30 上午4:54, Eugenio Pérez wrote:
>>>>> Shadow virtqueue notifications forwarding is disabled when vhost_dev
>>>>> stops.
>>>>>
>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>> ---
>>>>>     hw/virtio/vhost-shadow-virtqueue.h |   5 ++
>>>>>     include/hw/virtio/vhost.h          |   4 +
>>>>>     hw/virtio/vhost-shadow-virtqueue.c | 123 +++++++++++++++++++++++++-
>>>>>     hw/virtio/vhost.c                  | 135 ++++++++++++++++++++++++++++-
>>>>>     4 files changed, 264 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
>>>>> index 6cc18d6acb..466f8ae595 100644
>>>>> --- a/hw/virtio/vhost-shadow-virtqueue.h
>>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
>>>>> @@ -17,6 +17,11 @@
>>>>>
>>>>>     typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
>>>>>
>>>>> +bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
>>>>> +                               VhostShadowVirtqueue *svq);
>>>>> +void vhost_shadow_vq_stop_rcu(struct vhost_dev *dev,
>>>>> +                              VhostShadowVirtqueue *svq);
>>>>> +
>>>>>     VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx);
>>>>>
>>>>>     void vhost_shadow_vq_free(VhostShadowVirtqueue *vq);
>>>>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>>>>> index 2be782cefd..732a4b2a2b 100644
>>>>> --- a/include/hw/virtio/vhost.h
>>>>> +++ b/include/hw/virtio/vhost.h
>>>>> @@ -55,6 +55,8 @@ struct vhost_iommu {
>>>>>         QLIST_ENTRY(vhost_iommu) iommu_next;
>>>>>     };
>>>>>
>>>>> +typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
>>>>> +
>>>>>     typedef struct VhostDevConfigOps {
>>>>>         /* Vhost device config space changed callback
>>>>>          */
>>>>> @@ -83,7 +85,9 @@ struct vhost_dev {
>>>>>         uint64_t backend_cap;
>>>>>         bool started;
>>>>>         bool log_enabled;
>>>>> +    bool sw_lm_enabled;
>>>>>         uint64_t log_size;
>>>>> +    VhostShadowVirtqueue **shadow_vqs;
>>>>>         Error *migration_blocker;
>>>>>         const VhostOps *vhost_ops;
>>>>>         void *opaque;
>>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
>>>>> index c0c967a7c5..908c36c66d 100644
>>>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
>>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
>>>>> @@ -8,15 +8,129 @@
>>>>>      */
>>>>>
>>>>>     #include "hw/virtio/vhost-shadow-virtqueue.h"
>>>>> +#include "hw/virtio/vhost.h"
>>>>> +#include "hw/virtio/virtio-access.h"
>>>>> +
>>>>> +#include "standard-headers/linux/vhost_types.h"
>>>>> +#include "standard-headers/linux/virtio_ring.h"
>>>>>
>>>>>     #include "qemu/error-report.h"
>>>>> -#include "qemu/event_notifier.h"
>>>>> +#include "qemu/main-loop.h"
>>>>>
>>>>>     typedef struct VhostShadowVirtqueue {
>>>>>         EventNotifier kick_notifier;
>>>>>         EventNotifier call_notifier;
>>>>> +    const struct vhost_virtqueue *hvq;
>>>>> +    VirtIODevice *vdev;
>>>>> +    VirtQueue *vq;
>>>>>     } VhostShadowVirtqueue;
>>>> So instead of doing things at virtio level, how about do the shadow
>>>> stuffs at vhost level?
>>>>
>>>> It works like:
>>>>
>>>> virtio -> [shadow vhost backend] -> vhost backend
>>>>
>>>> Then the QMP is used to plug the shadow vhost backend in the middle or not.
>>>>
>>>> It looks kind of easier since we don't need to deal with virtqueue
>>>> handlers etc.. Instead, we just need to deal with eventfd stuffs:
>>>>
>>>> When shadow vhost mode is enabled, we just intercept the host_notifiers
>>>> and guest_notifiers. When it was disabled, we just pass the host/guest
>>>> notifiers to the real vhost backends?
>>>>
>>> Hi Jason.
>>>
>>> Sure we can try that model, but it seems to me that it comes with a
>>> different set of problems.
>>>
>>> For example, there are code in vhost.c that checks if implementations
>>> are available in vhost_ops, like:
>>>
>>> if (dev->vhost_ops->vhost_vq_get_addr) {
>>>           r = dev->vhost_ops->vhost_vq_get_addr(dev, &addr, vq);
>>>           ...
>>> }
>>>
>>> I can count 14 of these, checking:
>>>
>>> dev->vhost_ops->vhost_backend_can_merge
>>> dev->vhost_ops->vhost_backend_mem_section_filter
>>> dev->vhost_ops->vhost_force_iommu
>>> dev->vhost_ops->vhost_requires_shm_log
>>> dev->vhost_ops->vhost_set_backend_cap
>>> dev->vhost_ops->vhost_set_vring_busyloop_timeout
>>> dev->vhost_ops->vhost_vq_get_addr
>>> hdev->vhost_ops->vhost_dev_start
>>> hdev->vhost_ops->vhost_get_config
>>> hdev->vhost_ops->vhost_get_inflight_fd
>>> hdev->vhost_ops->vhost_net_set_backend
>>> hdev->vhost_ops->vhost_set_config
>>> hdev->vhost_ops->vhost_set_inflight_fd
>>> hdev->vhost_ops->vhost_set_iotlb_callback
>>>
>>> So we should Implement all of the vhost_ops callbacks, forwarding them
>>> to actual vhost_backed, and delete conditionally these ones? In other
>>> words, dynamically generate the new shadow vq vhost_ops? If a new
>>> callback is added to any vhost backend in the future, do we have to
>>> force the adding / checking for NULL in shadow backend vhost_ops?
>>> Would this be a good moment to check if all backends implement these
>>> and delete the checks?
>>
>> I think it won't be easy if we want to support all kinds of vhost
>> backends from the start. So we can go with vhost-vdpa one first.
>>
>> Actually how it work might be something like (no need to switch
>> vhost_ops, we can do everything silently in the ops)
>>
>> 1) when device to switch to shadow vq (e.g via QMP)
>> 2) vhost-vdpa will stop and sync state (last_avail_idx) internally
>> 3) reset vhost-vdpa, clean call and kick eventfd
>> 4) allocate vqs for vhost-vdpa, new call and kick eventfd, restart
>> vhost-vdpa
>> 5) start the shadow vq (make it start for last_avail_idx)
>> 6) intercept ioeventfd and forward the request to callfd
>> 7) intercept callfd and forward the request to irqfd
>> 8) forward request between shadow virtqueue and vhost-vdpa
>>
> Sorry, still not clear to me how it relates with the actual backend used :).


So I think I meant is, if we're doing at vhost level, we only play with 
eventfds not the event notifiers abstraction in virtio level.


>
> Would it work for you if we finish the notifications forwarding part
> and we work on the buffer forwarding part?


I think it's better to do them all since the notification forward itself 
is not a complete fnction.


>
> I'm going to send another cleaner revision, with less dependencies on
> virtio code, only notifications eventfds. I think it will be easier to
> discuss the changes on top of that.


Right, let's discuss there.

Thanks


>
>>> There are also checks like:
>>>
>>> if (dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_USER)
>>>
>>> How would shadow_vq backend expose itself? (I guess as the actual used backend).
>>>
>>> I can modify this patchset to not relay the guest->host notifications
>>> on vq handlers but on eventfd handlers. Although this will make it
>>> independent of the actual virtio device kind used, I can see two
>>> drawbacks:
>>> * The actual fact that it makes it independent of virtio device kind.
>>> If a device does not use the notifiers and poll the ring by itself, it
>>> has no chance of knowing that it should stop. What happens if
>>> virtio-net tx timer is armed when we start shadow vq?.
>>
>> So if we do that in vhost level, it's a vhost backend from the virtio
>> layer. Then we don't need to worry about tx timer stuffs.
>>
> Got it.
>
> So I'm going to assume that no device in virtio layer needs to be
> aware of the change. It seems a valid assumption to me.
>
>>> * The fixes (current and future) in vq notifications, like the one
>>> currently implemented in virtio_notify_irqfd for windows drivers
>>> regarding ISR bit 0. I think this one in particular is OK not to
>>> carry, but I think many changes affecting any of the functions will
>>> have to be mirrored in the other.
>>
>> Consider we behave like a vhost, it just work as in the past for other
>> type of vhost backends when MSI-X is not enabled?
>>
> Yes, it may be a bad example, as vhost devices may not update it.
> However I still think a lot of features (packed ring buffers
> treatment, etc), performance optimizations and future fixes will have
> to apply to two different codes in case we roll our own buffers
> treatment.
>
> Expanding in thread of patch 05/10, since you propose two solutions for this.
>
> Thanks!
>
>
>> Thanks
>>
>>
>>> Thoughts on this?
>>>
>>> Thanks!
>>>
>>>> Thanks
>>>>
>>>>
>>>>> +static uint16_t vhost_shadow_vring_used_flags(VhostShadowVirtqueue *svq)
>>>>> +{
>>>>> +    const struct vring_used *used = svq->hvq->used;
>>>>> +    return virtio_tswap16(svq->vdev, used->flags);
>>>>> +}
>>>>> +
>>>>> +static bool vhost_shadow_vring_should_kick(VhostShadowVirtqueue *vq)
>>>>> +{
>>>>> +    return !(vhost_shadow_vring_used_flags(vq) & VRING_USED_F_NO_NOTIFY);
>>>>> +}
>>>>> +
>>>>> +static void vhost_shadow_vring_kick(VhostShadowVirtqueue *vq)
>>>>> +{
>>>>> +    if (vhost_shadow_vring_should_kick(vq)) {
>>>>> +        event_notifier_set(&vq->kick_notifier);
>>>>> +    }
>>>>> +}
>>>>> +
>>>>> +static void handle_shadow_vq(VirtIODevice *vdev, VirtQueue *vq)
>>>>> +{
>>>>> +    struct vhost_dev *hdev = vhost_dev_from_virtio(vdev);
>>>>> +    uint16_t idx = virtio_get_queue_index(vq);
>>>>> +
>>>>> +    VhostShadowVirtqueue *svq = hdev->shadow_vqs[idx];
>>>>> +
>>>>> +    vhost_shadow_vring_kick(svq);
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * Start shadow virtqueue operation.
>>>>> + * @dev vhost device
>>>>> + * @svq Shadow Virtqueue
>>>>> + *
>>>>> + * Run in RCU context
>>>>> + */
>>>>> +bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
>>>>> +                               VhostShadowVirtqueue *svq)
>>>>> +{
>>>>> +    const VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(dev->vdev);
>>>>> +    EventNotifier *vq_host_notifier = virtio_queue_get_host_notifier(svq->vq);
>>>>> +    unsigned idx = virtio_queue_get_idx(svq->vdev, svq->vq);
>>>>> +    struct vhost_vring_file kick_file = {
>>>>> +        .index = idx,
>>>>> +        .fd = event_notifier_get_fd(&svq->kick_notifier),
>>>>> +    };
>>>>> +    int r;
>>>>> +    bool ok;
>>>>> +
>>>>> +    /* Check that notifications are still going directly to vhost dev */
>>>>> +    assert(virtio_queue_host_notifier_status(svq->vq));
>>>>> +
>>>>> +    ok = k->set_vq_handler(dev->vdev, idx, handle_shadow_vq);
>>>>> +    if (!ok) {
>>>>> +        error_report("Couldn't set the vq handler");
>>>>> +        goto err_set_kick_handler;
>>>>> +    }
>>>>> +
>>>>> +    r = dev->vhost_ops->vhost_set_vring_kick(dev, &kick_file);
>>>>> +    if (r != 0) {
>>>>> +        error_report("Couldn't set kick fd: %s", strerror(errno));
>>>>> +        goto err_set_vring_kick;
>>>>> +    }
>>>>> +
>>>>> +    event_notifier_set_handler(vq_host_notifier,
>>>>> +                               virtio_queue_host_notifier_read);
>>>>> +    virtio_queue_set_host_notifier_enabled(svq->vq, false);
>>>>> +    virtio_queue_host_notifier_read(vq_host_notifier);
>>>>> +
>>>>> +    return true;
>>>>> +
>>>>> +err_set_vring_kick:
>>>>> +    k->set_vq_handler(dev->vdev, idx, NULL);
>>>>> +
>>>>> +err_set_kick_handler:
>>>>> +    return false;
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * Stop shadow virtqueue operation.
>>>>> + * @dev vhost device
>>>>> + * @svq Shadow Virtqueue
>>>>> + *
>>>>> + * Run in RCU context
>>>>> + */
>>>>> +void vhost_shadow_vq_stop_rcu(struct vhost_dev *dev,
>>>>> +                              VhostShadowVirtqueue *svq)
>>>>> +{
>>>>> +    const VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(svq->vdev);
>>>>> +    unsigned idx = virtio_queue_get_idx(svq->vdev, svq->vq);
>>>>> +    EventNotifier *vq_host_notifier = virtio_queue_get_host_notifier(svq->vq);
>>>>> +    struct vhost_vring_file kick_file = {
>>>>> +        .index = idx,
>>>>> +        .fd = event_notifier_get_fd(vq_host_notifier),
>>>>> +    };
>>>>> +    int r;
>>>>> +
>>>>> +    /* Restore vhost kick */
>>>>> +    r = dev->vhost_ops->vhost_set_vring_kick(dev, &kick_file);
>>>>> +    /* Cannot do a lot of things */
>>>>> +    assert(r == 0);
>>>>> +
>>>>> +    event_notifier_set_handler(vq_host_notifier, NULL);
>>>>> +    virtio_queue_set_host_notifier_enabled(svq->vq, true);
>>>>> +    k->set_vq_handler(svq->vdev, idx, NULL);
>>>>> +}
>>>>> +
>>>>>     /*
>>>>>      * Creates vhost shadow virtqueue, and instruct vhost device to use the shadow
>>>>>      * methods and file descriptors.
>>>>> @@ -24,8 +138,13 @@ typedef struct VhostShadowVirtqueue {
>>>>>     VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx)
>>>>>     {
>>>>>         g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
>>>>> +    int vq_idx = dev->vhost_ops->vhost_get_vq_index(dev, dev->vq_index + idx);
>>>>>         int r;
>>>>>
>>>>> +    svq->vq = virtio_get_queue(dev->vdev, vq_idx);
>>>>> +    svq->hvq = &dev->vqs[idx];
>>>>> +    svq->vdev = dev->vdev;
>>>>> +
>>>>>         r = event_notifier_init(&svq->kick_notifier, 0);
>>>>>         if (r != 0) {
>>>>>             error_report("Couldn't create kick event notifier: %s",
>>>>> @@ -40,7 +159,7 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx)
>>>>>             goto err_init_call_notifier;
>>>>>         }
>>>>>
>>>>> -    return svq;
>>>>> +    return g_steal_pointer(&svq);
>>>>>
>>>>>     err_init_call_notifier:
>>>>>         event_notifier_cleanup(&svq->kick_notifier);
>>>>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>>>>> index 42836e45f3..bde688f278 100644
>>>>> --- a/hw/virtio/vhost.c
>>>>> +++ b/hw/virtio/vhost.c
>>>>> @@ -25,6 +25,7 @@
>>>>>     #include "exec/address-spaces.h"
>>>>>     #include "hw/virtio/virtio-bus.h"
>>>>>     #include "hw/virtio/virtio-access.h"
>>>>> +#include "hw/virtio/vhost-shadow-virtqueue.h"
>>>>>     #include "migration/blocker.h"
>>>>>     #include "migration/qemu-file-types.h"
>>>>>     #include "sysemu/dma.h"
>>>>> @@ -945,6 +946,82 @@ static void vhost_log_global_stop(MemoryListener *listener)
>>>>>         }
>>>>>     }
>>>>>
>>>>> +static int vhost_sw_live_migration_stop(struct vhost_dev *dev)
>>>>> +{
>>>>> +    int idx;
>>>>> +
>>>>> +    WITH_RCU_READ_LOCK_GUARD() {
>>>>> +        dev->sw_lm_enabled = false;
>>>>> +
>>>>> +        for (idx = 0; idx < dev->nvqs; ++idx) {
>>>>> +            vhost_shadow_vq_stop_rcu(dev, dev->shadow_vqs[idx]);
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    for (idx = 0; idx < dev->nvqs; ++idx) {
>>>>> +        vhost_shadow_vq_free(dev->shadow_vqs[idx]);
>>>>> +    }
>>>>> +
>>>>> +    g_free(dev->shadow_vqs);
>>>>> +    dev->shadow_vqs = NULL;
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int vhost_sw_live_migration_start(struct vhost_dev *dev)
>>>>> +{
>>>>> +    int idx;
>>>>> +
>>>>> +    dev->shadow_vqs = g_new0(VhostShadowVirtqueue *, dev->nvqs);
>>>>> +    for (idx = 0; idx < dev->nvqs; ++idx) {
>>>>> +        dev->shadow_vqs[idx] = vhost_shadow_vq_new(dev, idx);
>>>>> +        if (unlikely(dev->shadow_vqs[idx] == NULL)) {
>>>>> +            goto err;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    WITH_RCU_READ_LOCK_GUARD() {
>>>>> +        for (idx = 0; idx < dev->nvqs; ++idx) {
>>>>> +            int stop_idx = idx;
>>>>> +            bool ok = vhost_shadow_vq_start_rcu(dev,
>>>>> +                                                dev->shadow_vqs[idx]);
>>>>> +
>>>>> +            if (!ok) {
>>>>> +                while (--stop_idx >= 0) {
>>>>> +                    vhost_shadow_vq_stop_rcu(dev, dev->shadow_vqs[stop_idx]);
>>>>> +                }
>>>>> +
>>>>> +                goto err;
>>>>> +            }
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    dev->sw_lm_enabled = true;
>>>>> +    return 0;
>>>>> +
>>>>> +err:
>>>>> +    for (; idx >= 0; --idx) {
>>>>> +        vhost_shadow_vq_free(dev->shadow_vqs[idx]);
>>>>> +    }
>>>>> +    g_free(dev->shadow_vqs[idx]);
>>>>> +
>>>>> +    return -1;
>>>>> +}
>>>>> +
>>>>> +static int vhost_sw_live_migration_enable(struct vhost_dev *dev,
>>>>> +                                          bool enable_lm)
>>>>> +{
>>>>> +    int r;
>>>>> +
>>>>> +    if (enable_lm == dev->sw_lm_enabled) {
>>>>> +        return 0;
>>>>> +    }
>>>>> +
>>>>> +    r = enable_lm ? vhost_sw_live_migration_start(dev)
>>>>> +                  : vhost_sw_live_migration_stop(dev);
>>>>> +
>>>>> +    return r;
>>>>> +}
>>>>> +
>>>>>     static void vhost_log_start(MemoryListener *listener,
>>>>>                                 MemoryRegionSection *section,
>>>>>                                 int old, int new)
>>>>> @@ -1389,6 +1466,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
>>>>>         hdev->log = NULL;
>>>>>         hdev->log_size = 0;
>>>>>         hdev->log_enabled = false;
>>>>> +    hdev->sw_lm_enabled = false;
>>>>>         hdev->started = false;
>>>>>         memory_listener_register(&hdev->memory_listener, &address_space_memory);
>>>>>         QLIST_INSERT_HEAD(&vhost_devices, hdev, entry);
>>>>> @@ -1816,6 +1894,11 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
>>>>>             hdev->vhost_ops->vhost_dev_start(hdev, false);
>>>>>         }
>>>>>         for (i = 0; i < hdev->nvqs; ++i) {
>>>>> +        if (hdev->sw_lm_enabled) {
>>>>> +            vhost_shadow_vq_stop_rcu(hdev, hdev->shadow_vqs[i]);
>>>>> +            vhost_shadow_vq_free(hdev->shadow_vqs[i]);
>>>>> +        }
>>>>> +
>>>>>             vhost_virtqueue_stop(hdev,
>>>>>                                  vdev,
>>>>>                                  hdev->vqs + i,
>>>>> @@ -1829,6 +1912,8 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
>>>>>             memory_listener_unregister(&hdev->iommu_listener);
>>>>>         }
>>>>>         vhost_log_put(hdev, true);
>>>>> +    g_free(hdev->shadow_vqs);
>>>>> +    hdev->sw_lm_enabled = false;
>>>>>         hdev->started = false;
>>>>>         hdev->vdev = NULL;
>>>>>     }
>>>>> @@ -1845,5 +1930,53 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
>>>>>
>>>>>     void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Error **errp)
>>>>>     {
>>>>> -    error_setg(errp, "Shadow virtqueue still not implemented.");
>>>>> +    struct vhost_dev *hdev;
>>>>> +    const char *err_cause = NULL;
>>>>> +    const VirtioDeviceClass *k;
>>>>> +    int r;
>>>>> +    ErrorClass err_class = ERROR_CLASS_GENERIC_ERROR;
>>>>> +
>>>>> +    QLIST_FOREACH(hdev, &vhost_devices, entry) {
>>>>> +        if (hdev->vdev && 0 == strcmp(hdev->vdev->name, name)) {
>>>>> +            break;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    if (!hdev) {
>>>>> +        err_class = ERROR_CLASS_DEVICE_NOT_FOUND;
>>>>> +        err_cause = "Device not found";
>>>>> +        goto err;
>>>>> +    }
>>>>> +
>>>>> +    if (!hdev->started) {
>>>>> +        err_cause = "Device is not started";
>>>>> +        goto err;
>>>>> +    }
>>>>> +
>>>>> +    if (hdev->acked_features & BIT_ULL(VIRTIO_F_RING_PACKED)) {
>>>>> +        err_cause = "Use packed vq";
>>>>> +        goto err;
>>>>> +    }
>>>>> +
>>>>> +    if (vhost_dev_has_iommu(hdev)) {
>>>>> +        err_cause = "Device use IOMMU";
>>>>> +        goto err;
>>>>> +    }
>>>>> +
>>>>> +    k = VIRTIO_DEVICE_GET_CLASS(hdev->vdev);
>>>>> +    if (!k->set_vq_handler) {
>>>>> +        err_cause = "Virtio device type does not support reset of vq handler";
>>>>> +        goto err;
>>>>> +    }
>>>>> +
>>>>> +    r = vhost_sw_live_migration_enable(hdev, enable);
>>>>> +    if (unlikely(r)) {
>>>>> +        err_cause = "Error enabling (see monitor)";
>>>>> +    }
>>>>> +
>>>>> +err:
>>>>> +    if (err_cause) {
>>>>> +        error_set(errp, err_class,
>>>>> +                  "Can't enable shadow vq on %s: %s", name, err_cause);
>>>>> +    }
>>>>>     }
>


