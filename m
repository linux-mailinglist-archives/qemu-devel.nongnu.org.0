Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FE43401E3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:22:32 +0100 (CET)
Received: from localhost ([::1]:46414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMorP-0005jE-Vg
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lMomC-0000d1-Tv
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:17:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lMom9-0004Xh-FU
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:17:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616059023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aAeQ+/B5yR7XJidLlTE9iW/DyF8dfQVhpJY3Qb20bxI=;
 b=W2s8PYHevCOwsKw6sgr9aAT9W+Qhwgrcvsq4pP8RXsgkXUWWgu955PJeBJSBJo4lf1MvhG
 nVJWqSIHlfC/rfJ48QKrmJFXm7fCmsH2ERa+wCccBkxWT83+krgXeJZBcVXtT9aBF5/IJu
 ug3I436oueFudF73aRpDqyIIYs0a9ZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-oM9fYlisO_Cn6WaJLRTkmA-1; Thu, 18 Mar 2021 05:17:02 -0400
X-MC-Unique: oM9fYlisO_Cn6WaJLRTkmA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BBA4100946C
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 09:17:01 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-17.pek2.redhat.com
 [10.72.13.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98EB461D2D
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 09:16:59 +0000 (UTC)
Subject: Re: [RFC v2 11/13] vhost: Shadow virtqueue buffers forwarding
To: qemu-devel@nongnu.org
References: <20210315194842.277740-1-eperezma@redhat.com>
 <20210315194842.277740-12-eperezma@redhat.com>
 <5fcc5f81-88f7-1c00-c4a6-6ba5ad21ac8b@redhat.com>
 <CAJaqyWftTU3R7mpZVU8PPmTYEg8aYki4AgMafFB6vkOJAv5NFw@mail.gmail.com>
 <38fb8605-e7dc-de4d-dd0f-defc922a453e@redhat.com>
 <CAJaqyWfz9NbTBNXgpq_KreY66KzciiuxmQJshURkKB5AJd-ohg@mail.gmail.com>
 <4c76fc1c-08e3-9706-6439-4b93cbadbf0f@redhat.com>
 <CAJaqyWcynacsiqZZ1fBkznYTPGgCqVzeMPEn+pNz-C6nAk9xPA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f0acf4e0-8e3c-4139-6e6b-b9e71dbc8864@redhat.com>
Date: Thu, 18 Mar 2021 17:16:58 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAJaqyWcynacsiqZZ1fBkznYTPGgCqVzeMPEn+pNz-C6nAk9xPA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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


在 2021/3/18 下午4:06, Eugenio Perez Martin 写道:
> On Thu, Mar 18, 2021 at 4:14 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2021/3/17 下午10:38, Eugenio Perez Martin 写道:
>>> On Wed, Mar 17, 2021 at 3:51 AM Jason Wang <jasowang@redhat.com> wrote:
>>>> 在 2021/3/17 上午12:05, Eugenio Perez Martin 写道:
>>>>> On Tue, Mar 16, 2021 at 9:15 AM Jason Wang <jasowang@redhat.com> wrote:
>>>>>> 在 2021/3/16 上午3:48, Eugenio Pérez 写道:
>>>>>>> Initial version of shadow virtqueue that actually forward buffers.
>>>>>>>
>>>>>>> It reuses the VirtQueue code for the device part. The driver part is
>>>>>>> based on Linux's virtio_ring driver, but with stripped functionality
>>>>>>> and optimizations so it's easier to review.
>>>>>>>
>>>>>>> These will be added in later commits.
>>>>>>>
>>>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>>>> ---
>>>>>>>      hw/virtio/vhost-shadow-virtqueue.c | 212 +++++++++++++++++++++++++++--
>>>>>>>      hw/virtio/vhost.c                  | 113 ++++++++++++++-
>>>>>>>      2 files changed, 312 insertions(+), 13 deletions(-)
>>>>>>>
>>>>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
>>>>>>> index 1460d1d5d1..68ed0f2740 100644
>>>>>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
>>>>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
>>>>>>> @@ -9,6 +9,7 @@
>>>>>>>
>>>>>>>      #include "hw/virtio/vhost-shadow-virtqueue.h"
>>>>>>>      #include "hw/virtio/vhost.h"
>>>>>>> +#include "hw/virtio/virtio-access.h"
>>>>>>>
>>>>>>>      #include "standard-headers/linux/vhost_types.h"
>>>>>>>
>>>>>>> @@ -55,11 +56,96 @@ typedef struct VhostShadowVirtqueue {
>>>>>>>          /* Virtio device */
>>>>>>>          VirtIODevice *vdev;
>>>>>>>
>>>>>>> +    /* Map for returning guest's descriptors */
>>>>>>> +    VirtQueueElement **ring_id_maps;
>>>>>>> +
>>>>>>> +    /* Next head to expose to device */
>>>>>>> +    uint16_t avail_idx_shadow;
>>>>>>> +
>>>>>>> +    /* Next free descriptor */
>>>>>>> +    uint16_t free_head;
>>>>>>> +
>>>>>>> +    /* Last seen used idx */
>>>>>>> +    uint16_t shadow_used_idx;
>>>>>>> +
>>>>>>> +    /* Next head to consume from device */
>>>>>>> +    uint16_t used_idx;
>>>>>>> +
>>>>>>>          /* Descriptors copied from guest */
>>>>>>>          vring_desc_t descs[];
>>>>>>>      } VhostShadowVirtqueue;
>>>>>>>
>>>>>>> -/* Forward guest notifications */
>>>>>>> +static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
>>>>>>> +                                    const struct iovec *iovec,
>>>>>>> +                                    size_t num, bool more_descs, bool write)
>>>>>>> +{
>>>>>>> +    uint16_t i = svq->free_head, last = svq->free_head;
>>>>>>> +    unsigned n;
>>>>>>> +    uint16_t flags = write ? virtio_tswap16(svq->vdev, VRING_DESC_F_WRITE) : 0;
>>>>>>> +    vring_desc_t *descs = svq->vring.desc;
>>>>>>> +
>>>>>>> +    if (num == 0) {
>>>>>>> +        return;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    for (n = 0; n < num; n++) {
>>>>>>> +        if (more_descs || (n + 1 < num)) {
>>>>>>> +            descs[i].flags = flags | virtio_tswap16(svq->vdev,
>>>>>>> +                                                    VRING_DESC_F_NEXT);
>>>>>>> +        } else {
>>>>>>> +            descs[i].flags = flags;
>>>>>>> +        }
>>>>>>> +        descs[i].addr = virtio_tswap64(svq->vdev, (hwaddr)iovec[n].iov_base);
>>>>>> So unsing virtio_tswap() is probably not correct since we're talking
>>>>>> with vhost backends which has its own endiness.
>>>>>>
>>>>> I was trying to expose the buffer with the same endianness as the
>>>>> driver originally offered, so if guest->qemu requires a bswap, I think
>>>>> it will always require a bswap again to expose to the device again.
>>>> So assumes vhost-vDPA always provide a non-transitional device[1].
>>>>
>>>> Then if Qemu present a transitional device, we need to do the endian
>>>> conversion when necessary, if Qemu present a non-transitional device, we
>>>> don't need to do that, guest driver will do that for us.
>>>>
>>>> But it looks to me the virtio_tswap() can't be used for this since it:
>>>>
>>>> static inline bool virtio_access_is_big_endian(VirtIODevice *vdev)
>>>> {
>>>> #if defined(LEGACY_VIRTIO_IS_BIENDIAN)
>>>>        return virtio_is_big_endian(vdev);
>>>> #elif defined(TARGET_WORDS_BIGENDIAN)
>>>>        if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
>>>>            /* Devices conforming to VIRTIO 1.0 or later are always LE. */
>>>>            return false;
>>>>        }
>>>>        return true;
>>>> #else
>>>>        return false;
>>>> #endif
>>>> }
>>>>
>>>> So if we present a legacy device on top of a non-transitiaonl vDPA
>>>> device. The VIRITIO_F_VERSION_1 check is wrong.
>>>>
>>>>
>>>>>> For vhost-vDPA, we can assume that it's a 1.0 device.
>>>>> Isn't it needed if the host is big endian?
>>>> [1]
>>>>
>>>> So non-transitional device always assume little endian.
>>>>
>>>> For vhost-vDPA, we don't want to present transitional device which may
>>>> end up with a lot of burdens.
>>>>
>>>> I suspect the legacy driver plust vhost vDPA already break, so I plan to
>>>> mandate VERSION_1 for all vDPA devices.
>>>>
>>> Right. I think it's the best then.
>>>
>>> However, then we will need a similar method to always expose
>>> address/length as little endian, isn't it?
>>
>> Yes.
>>
>>
>>>>>>> +        descs[i].len = virtio_tswap32(svq->vdev, iovec[n].iov_len);
>>>>>>> +
>>>>>>> +        last = i;
>>>>>>> +        i = virtio_tswap16(svq->vdev, descs[i].next);
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    svq->free_head = virtio_tswap16(svq->vdev, descs[last].next);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static unsigned vhost_shadow_vq_add_split(VhostShadowVirtqueue *svq,
>>>>>>> +                                          VirtQueueElement *elem)
>>>>>>> +{
>>>>>>> +    int head;
>>>>>>> +    unsigned avail_idx;
>>>>>>> +    vring_avail_t *avail = svq->vring.avail;
>>>>>>> +
>>>>>>> +    head = svq->free_head;
>>>>>>> +
>>>>>>> +    /* We need some descriptors here */
>>>>>>> +    assert(elem->out_num || elem->in_num);
>>>>>>> +
>>>>>>> +    vhost_vring_write_descs(svq, elem->out_sg, elem->out_num,
>>>>>>> +                            elem->in_num > 0, false);
>>>>>>> +    vhost_vring_write_descs(svq, elem->in_sg, elem->in_num, false, true);
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * Put entry in available array (but don't update avail->idx until they
>>>>>>> +     * do sync).
>>>>>>> +     */
>>>>>>> +    avail_idx = svq->avail_idx_shadow & (svq->vring.num - 1);
>>>>>>> +    avail->ring[avail_idx] = virtio_tswap16(svq->vdev, head);
>>>>>>> +    svq->avail_idx_shadow++;
>>>>>>> +
>>>>>>> +    /* Expose descriptors to device */
>>>>>>> +    smp_wmb();
>>>>>>> +    avail->idx = virtio_tswap16(svq->vdev, svq->avail_idx_shadow);
>>>>>>> +
>>>>>>> +    return head;
>>>>>>> +
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void vhost_shadow_vq_add(VhostShadowVirtqueue *svq,
>>>>>>> +                                VirtQueueElement *elem)
>>>>>>> +{
>>>>>>> +    unsigned qemu_head = vhost_shadow_vq_add_split(svq, elem);
>>>>>>> +
>>>>>>> +    svq->ring_id_maps[qemu_head] = elem;
>>>>>>> +}
>>>>>>> +
>>>>>>> +/* Handle guest->device notifications */
>>>>>>>      static void vhost_handle_guest_kick(EventNotifier *n)
>>>>>>>      {
>>>>>>>          VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
>>>>>>> @@ -69,7 +155,72 @@ static void vhost_handle_guest_kick(EventNotifier *n)
>>>>>>>              return;
>>>>>>>          }
>>>>>>>
>>>>>>> -    event_notifier_set(&svq->kick_notifier);
>>>>>>> +    /* Make available as many buffers as possible */
>>>>>>> +    do {
>>>>>>> +        if (virtio_queue_get_notification(svq->vq)) {
>>>>>>> +            /* No more notifications until process all available */
>>>>>>> +            virtio_queue_set_notification(svq->vq, false);
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        while (true) {
>>>>>>> +            VirtQueueElement *elem;
>>>>>>> +            if (virtio_queue_full(svq->vq)) {
>>>>>>> +                break;
>>>>>> So we've disabled guest notification. If buffer has been consumed, we
>>>>>> need to retry the handle_guest_kick here. But I didn't find the code?
>>>>>>
>>>>> This code follows the pattern of virtio_blk_handle_vq: we jump out of
>>>>> the inner while, and we re-enable the notifications. After that, we
>>>>> check for updates on guest avail_idx.
>>>> Ok, but this will end up with a lot of unnecessary kicks without event
>>>> index.
>>>>
>>> I can move the kick out of the inner loop, but that could add latency.
>>
>> So I think the right way is to disable the notification until some
>> buffers are consumed by used ring.
>>
> I'm not sure if you mean:
>
> a) To limit to the maximum amount of buffers that can be available in
> Shadow Virtqueue at the same time.
>
> As I can see, the easiest way to do this would be to unregister
> vhost_handle_guest_kick from the event loop and let
> vhost_shadow_vq_handle_call to re-register it at some threshold of
> available buffers.
>
> I'm not sure how much this limit should be, but it seems wasteful for
> me to not to fill shadow virqueue naturally.


Yes, and I'm not sure how much we could gain from this extra complexity.


>
> b) To limit the amount of buffers that vhost_handle_guest_kick
> forwards to shadow virtqueue in one call.
>
> This already has a natural limit of the queue size, since the buffers
> will not be consumed (as forarded-to-guest) by qemu while this
> function is running. This limit could be reduced and
> vhost_handle_guest_kick could re-enqueue itself if its not reached.
> Same as previous, I'm not sure how much is a right limit, but
> vhost_handle_guest_kick will not make available more than queue size.


Yes, so using queue size is how the code works currently and it should 
be fine if we know svq and vq are the same size. We can leave the kick 
notification for the future, (I guess at least for networking device, 
hitting virtio_queue_full() should be rare).

It will be an real issue if svq and vq doesn't have the same size, but 
we can also leave this for future.


>
> c) To kick every N buffers made available, instead of N=1.
>
> I think this is not the solution you are proposing, but maybe is
> simpler than previous.
>
>>>>>>> +            }
>>>>>>> +
>>>>>>> +            elem = virtqueue_pop(svq->vq, sizeof(*elem));
>>>>>>> +            if (!elem) {
>>>>>>> +                break;
>>>>>>> +            }
>>>>>>> +
>>>>>>> +            vhost_shadow_vq_add(svq, elem);
>>>>>>> +            event_notifier_set(&svq->kick_notifier);
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        virtio_queue_set_notification(svq->vq, true);
>>>>>>> +    } while (!virtio_queue_empty(svq->vq));
>>>>>>> +}
>>>>>>> +
>>>>>>> +static bool vhost_shadow_vq_more_used(VhostShadowVirtqueue *svq)
>>>>>>> +{
>>>>>>> +    if (svq->used_idx != svq->shadow_used_idx) {
>>>>>>> +        return true;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    /* Get used idx must not be reordered */
>>>>>>> +    smp_rmb();
>>>>>>> +    svq->shadow_used_idx = virtio_tswap16(svq->vdev, svq->vring.used->idx);
>>>>>>> +
>>>>>>> +    return svq->used_idx != svq->shadow_used_idx;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static VirtQueueElement *vhost_shadow_vq_get_buf(VhostShadowVirtqueue *svq)
>>>>>>> +{
>>>>>>> +    vring_desc_t *descs = svq->vring.desc;
>>>>>>> +    const vring_used_t *used = svq->vring.used;
>>>>>>> +    vring_used_elem_t used_elem;
>>>>>>> +    uint16_t last_used;
>>>>>>> +
>>>>>>> +    if (!vhost_shadow_vq_more_used(svq)) {
>>>>>>> +        return NULL;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    last_used = svq->used_idx & (svq->vring.num - 1);
>>>>>>> +    used_elem.id = virtio_tswap32(svq->vdev, used->ring[last_used].id);
>>>>>>> +    used_elem.len = virtio_tswap32(svq->vdev, used->ring[last_used].len);
>>>>>>> +
>>>>>>> +    if (unlikely(used_elem.id >= svq->vring.num)) {
>>>>>>> +        error_report("Device %s says index %u is available", svq->vdev->name,
>>>>>>> +                     used_elem.id);
>>>>>>> +        return NULL;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    descs[used_elem.id].next = svq->free_head;
>>>>>>> +    svq->free_head = used_elem.id;
>>>>>>> +
>>>>>>> +    svq->used_idx++;
>>>>>>> +    svq->ring_id_maps[used_elem.id]->len = used_elem.len;
>>>>>>> +    return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
>>>>>>>      }
>>>>>>>
>>>>>>>      /* Forward vhost notifications */
>>>>>>> @@ -78,6 +229,7 @@ static void vhost_shadow_vq_handle_call_no_test(EventNotifier *n)
>>>>>>>          VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
>>>>>>>                                                   call_notifier);
>>>>>>>          EventNotifier *masked_notifier;
>>>>>>> +    VirtQueue *vq = svq->vq;
>>>>>>>
>>>>>>>          /* Signal start of using masked notifier */
>>>>>>>          qemu_event_reset(&svq->masked_notifier.is_free);
>>>>>>> @@ -86,14 +238,29 @@ static void vhost_shadow_vq_handle_call_no_test(EventNotifier *n)
>>>>>>>              qemu_event_set(&svq->masked_notifier.is_free);
>>>>>>>          }
>>>>>>>
>>>>>>> -    if (!masked_notifier) {
>>>>>>> -        unsigned n = virtio_get_queue_index(svq->vq);
>>>>>>> -        virtio_queue_invalidate_signalled_used(svq->vdev, n);
>>>>>>> -        virtio_notify_irqfd(svq->vdev, svq->vq);
>>>>>>> -    } else if (!svq->masked_notifier.signaled) {
>>>>>>> -        svq->masked_notifier.signaled = true;
>>>>>>> -        event_notifier_set(svq->masked_notifier.n);
>>>>>>> -    }
>>>>>>> +    /* Make as many buffers as possible used. */
>>>>>>> +    do {
>>>>>>> +        unsigned i = 0;
>>>>>>> +
>>>>>>> +        /* TODO: Use VRING_AVAIL_F_NO_INTERRUPT */
>>>>>>> +        while (true) {
>>>>>>> +            g_autofree VirtQueueElement *elem = vhost_shadow_vq_get_buf(svq);
>>>>>>> +            if (!elem) {
>>>>>>> +                break;
>>>>>>> +            }
>>>>>>> +
>>>>>>> +            assert(i < svq->vring.num);
>>>>>>> +            virtqueue_fill(vq, elem, elem->len, i++);
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        virtqueue_flush(vq, i);
>>>>>>> +        if (!masked_notifier) {
>>>>>>> +            virtio_notify_irqfd(svq->vdev, svq->vq);
>>>>>>> +        } else if (!svq->masked_notifier.signaled) {
>>>>>>> +            svq->masked_notifier.signaled = true;
>>>>>>> +            event_notifier_set(svq->masked_notifier.n);
>>>>>>> +        }
>>>>>>> +    } while (vhost_shadow_vq_more_used(svq));
>>>>>>>
>>>>>>>          if (masked_notifier) {
>>>>>>>              /* Signal not using it anymore */
>>>>>>> @@ -103,7 +270,6 @@ static void vhost_shadow_vq_handle_call_no_test(EventNotifier *n)
>>>>>>>
>>>>>>>      static void vhost_shadow_vq_handle_call(EventNotifier *n)
>>>>>>>      {
>>>>>>> -
>>>>>>>          if (likely(event_notifier_test_and_clear(n))) {
>>>>>>>              vhost_shadow_vq_handle_call_no_test(n);
>>>>>>>          }
>>>>>>> @@ -254,7 +420,11 @@ void vhost_shadow_vq_stop(struct vhost_dev *dev,
>>>>>>>                                unsigned idx,
>>>>>>>                                VhostShadowVirtqueue *svq)
>>>>>>>      {
>>>>>>> +    int i;
>>>>>>>          int r = vhost_shadow_vq_restore_vdev_host_notifier(dev, idx, svq);
>>>>>>> +
>>>>>>> +    assert(!dev->shadow_vqs_enabled);
>>>>>>> +
>>>>>>>          if (unlikely(r < 0)) {
>>>>>>>              error_report("Couldn't restore vq kick fd: %s", strerror(-r));
>>>>>>>          }
>>>>>>> @@ -272,6 +442,18 @@ void vhost_shadow_vq_stop(struct vhost_dev *dev,
>>>>>>>          /* Restore vhost call */
>>>>>>>          vhost_virtqueue_mask(dev, dev->vdev, dev->vq_index + idx,
>>>>>>>                               dev->vqs[idx].notifier_is_masked);
>>>>>>> +
>>>>>>> +
>>>>>>> +    for (i = 0; i < svq->vring.num; ++i) {
>>>>>>> +        g_autofree VirtQueueElement *elem = svq->ring_id_maps[i];
>>>>>>> +        /*
>>>>>>> +         * Although the doc says we must unpop in order, it's ok to unpop
>>>>>>> +         * everything.
>>>>>>> +         */
>>>>>>> +        if (elem) {
>>>>>>> +            virtqueue_unpop(svq->vq, elem, elem->len);
>>>>>> Shouldn't we need to wait until all pending requests to be drained? Or
>>>>>> we may end up duplicated requests?
>>>>>>
>>>>> Do you mean pending as in-flight/processing in the device? The device
>>>>> must be paused at this point.
>>>> Ok. I see there's a vhost_set_vring_enable(dev, false) in
>>>> vhost_sw_live_migration_start().
>>>>
>>>>
>>>>> Currently there is no assertion for
>>>>> this, maybe we can track the device status for it.
>>>>>
>>>>> For the queue handlers to be running at this point, the main event
>>>>> loop should serialize QMP and handlers as far as I know (and they
>>>>> would make all state inconsistent if the device stops suddenly). It
>>>>> would need to be synchronized if the handlers run in their own AIO
>>>>> context. That would be nice to have but it's not included here.
>>>> That's why I suggest to just drop the QMP stuffs and use cli parameters
>>>> to enable shadow virtqueue. Things would be greatly simplified I guess.
>>>>
>>> I can send a series without it, but SVQ will need to be able to kick
>>> in dynamically sooner or later if we want to use it for live
>>> migration.
>>
>> I'm not sure I get the issue here. My understnading is everyhing will be
>> processed in the same aio context.
>>
> What I meant is that QMP allows us to activate the shadow virtqueue
> mode in any moment, similar to how live migration would activate it.


I get you.


> To enable SVQ with a command line would imply that it runs the same
> way for all the time qemu runs.


Ok.


>
> If we do that way, we don't need more synchronization, since we have
> deleted the event that could run concurrently with the masking. But
> this synchronization will be needed if we want to enable SVQ
> dynamically for live migration, so we are "just" delaying work.
>
> However, if we add vdpa iova range to this patch series, I think it
> would be a good idea to delay that synchronization work to future
> series, so they are smaller and the first one can be tested better.


Yes, that's why I think we can start from simple case. E.g to let the 
shadow virtqueue logic run. Then we can consider to add synchronization 
in the future.

I guess things like mutex or bh might help, it would be more easier to 
add those stuffs on top.

Thanks


>
>> Thanks
>>
>>
>>>> Thanks
>>>>
>>>>
>>>>>> Thanks
>>>>>>
>>>>>>
>>>>>>> +        }
>>>>>>> +    }
>>>>>>>      }
>>>>>>>
>>>>>>>      /*
>>>>>>> @@ -284,7 +466,7 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx)
>>>>>>>          unsigned num = virtio_queue_get_num(dev->vdev, vq_idx);
>>>>>>>          size_t ring_size = vring_size(num, VRING_DESC_ALIGN_SIZE);
>>>>>>>          g_autofree VhostShadowVirtqueue *svq = g_malloc0(sizeof(*svq) + ring_size);
>>>>>>> -    int r;
>>>>>>> +    int r, i;
>>>>>>>
>>>>>>>          r = event_notifier_init(&svq->kick_notifier, 0);
>>>>>>>          if (r != 0) {
>>>>>>> @@ -303,6 +485,11 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx)
>>>>>>>          vring_init(&svq->vring, num, svq->descs, VRING_DESC_ALIGN_SIZE);
>>>>>>>          svq->vq = virtio_get_queue(dev->vdev, vq_idx);
>>>>>>>          svq->vdev = dev->vdev;
>>>>>>> +    for (i = 0; i < num - 1; i++) {
>>>>>>> +        svq->descs[i].next = virtio_tswap16(dev->vdev, i + 1);
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    svq->ring_id_maps = g_new0(VirtQueueElement *, num);
>>>>>>>          event_notifier_set_handler(&svq->call_notifier,
>>>>>>>                                     vhost_shadow_vq_handle_call);
>>>>>>>          qemu_event_init(&svq->masked_notifier.is_free, true);
>>>>>>> @@ -324,5 +511,6 @@ void vhost_shadow_vq_free(VhostShadowVirtqueue *vq)
>>>>>>>          event_notifier_cleanup(&vq->kick_notifier);
>>>>>>>          event_notifier_set_handler(&vq->call_notifier, NULL);
>>>>>>>          event_notifier_cleanup(&vq->call_notifier);
>>>>>>> +    g_free(vq->ring_id_maps);
>>>>>>>          g_free(vq);
>>>>>>>      }
>>>>>>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>>>>>>> index eab3e334f2..a373999bc4 100644
>>>>>>> --- a/hw/virtio/vhost.c
>>>>>>> +++ b/hw/virtio/vhost.c
>>>>>>> @@ -1021,6 +1021,19 @@ int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write)
>>>>>>>
>>>>>>>          trace_vhost_iotlb_miss(dev, 1);
>>>>>>>
>>>>>>> +    if (qatomic_load_acquire(&dev->shadow_vqs_enabled)) {
>>>>>>> +        uaddr = iova;
>>>>>>> +        len = 4096;
>>>>>>> +        ret = vhost_backend_update_device_iotlb(dev, iova, uaddr, len,
>>>>>>> +                                                IOMMU_RW);
>>>>>>> +        if (ret) {
>>>>>>> +            trace_vhost_iotlb_miss(dev, 2);
>>>>>>> +            error_report("Fail to update device iotlb");
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        return ret;
>>>>>>> +    }
>>>>>>> +
>>>>>>>          iotlb = address_space_get_iotlb_entry(dev->vdev->dma_as,
>>>>>>>                                                iova, write,
>>>>>>>                                                MEMTXATTRS_UNSPECIFIED);
>>>>>>> @@ -1227,8 +1240,28 @@ static int vhost_sw_live_migration_stop(struct vhost_dev *dev)
>>>>>>>          /* Can be read by vhost_virtqueue_mask, from vm exit */
>>>>>>>          qatomic_store_release(&dev->shadow_vqs_enabled, false);
>>>>>>>
>>>>>>> +    dev->vhost_ops->vhost_set_vring_enable(dev, false);
>>>>>>> +    if (vhost_backend_invalidate_device_iotlb(dev, 0, -1ULL)) {
>>>>>>> +        error_report("Fail to invalidate device iotlb");
>>>>>>> +    }
>>>>>>> +
>>>>>>>          for (idx = 0; idx < dev->nvqs; ++idx) {
>>>>>>> +        /*
>>>>>>> +         * Update used ring information for IOTLB to work correctly,
>>>>>>> +         * vhost-kernel code requires for this.
>>>>>>> +         */
>>>>>>> +        struct vhost_virtqueue *vq = dev->vqs + idx;
>>>>>>> +        vhost_device_iotlb_miss(dev, vq->used_phys, true);
>>>>>>> +
>>>>>>>              vhost_shadow_vq_stop(dev, idx, dev->shadow_vqs[idx]);
>>>>>>> +        vhost_virtqueue_start(dev, dev->vdev, &dev->vqs[idx],
>>>>>>> +                              dev->vq_index + idx);
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    /* Enable guest's vq vring */
>>>>>>> +    dev->vhost_ops->vhost_set_vring_enable(dev, true);
>>>>>>> +
>>>>>>> +    for (idx = 0; idx < dev->nvqs; ++idx) {
>>>>>>>              vhost_shadow_vq_free(dev->shadow_vqs[idx]);
>>>>>>>          }
>>>>>>>
>>>>>>> @@ -1237,6 +1270,59 @@ static int vhost_sw_live_migration_stop(struct vhost_dev *dev)
>>>>>>>          return 0;
>>>>>>>      }
>>>>>>>
>>>>>>> +/*
>>>>>>> + * Start shadow virtqueue in a given queue.
>>>>>>> + * In failure case, this function leaves queue working as regular vhost mode.
>>>>>>> + */
>>>>>>> +static bool vhost_sw_live_migration_start_vq(struct vhost_dev *dev,
>>>>>>> +                                             unsigned idx)
>>>>>>> +{
>>>>>>> +    struct vhost_vring_addr addr = {
>>>>>>> +        .index = idx,
>>>>>>> +    };
>>>>>>> +    struct vhost_vring_state s = {
>>>>>>> +        .index = idx,
>>>>>>> +    };
>>>>>>> +    int r;
>>>>>>> +    bool ok;
>>>>>>> +
>>>>>>> +    vhost_virtqueue_stop(dev, dev->vdev, &dev->vqs[idx], dev->vq_index + idx);
>>>>>>> +    ok = vhost_shadow_vq_start(dev, idx, dev->shadow_vqs[idx]);
>>>>>>> +    if (unlikely(!ok)) {
>>>>>>> +        return false;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    /* From this point, vhost_virtqueue_start can reset these changes */
>>>>>>> +    vhost_shadow_vq_get_vring_addr(dev->shadow_vqs[idx], &addr);
>>>>>>> +    r = dev->vhost_ops->vhost_set_vring_addr(dev, &addr);
>>>>>>> +    if (unlikely(r != 0)) {
>>>>>>> +        VHOST_OPS_DEBUG("vhost_set_vring_addr for shadow vq failed");
>>>>>>> +        goto err;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    r = dev->vhost_ops->vhost_set_vring_base(dev, &s);
>>>>>>> +    if (unlikely(r != 0)) {
>>>>>>> +        VHOST_OPS_DEBUG("vhost_set_vring_base for shadow vq failed");
>>>>>>> +        goto err;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * Update used ring information for IOTLB to work correctly,
>>>>>>> +     * vhost-kernel code requires for this.
>>>>>>> +     */
>>>>>>> +    r = vhost_device_iotlb_miss(dev, addr.used_user_addr, true);
>>>>>>> +    if (unlikely(r != 0)) {
>>>>>>> +        /* Debug message already printed */
>>>>>>> +        goto err;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    return true;
>>>>>>> +
>>>>>>> +err:
>>>>>>> +    vhost_virtqueue_start(dev, dev->vdev, &dev->vqs[idx], dev->vq_index + idx);
>>>>>>> +    return false;
>>>>>>> +}
>>>>>>> +
>>>>>>>      static int vhost_sw_live_migration_start(struct vhost_dev *dev)
>>>>>>>      {
>>>>>>>          int idx, stop_idx;
>>>>>>> @@ -1249,24 +1335,35 @@ static int vhost_sw_live_migration_start(struct vhost_dev *dev)
>>>>>>>              }
>>>>>>>          }
>>>>>>>
>>>>>>> +    dev->vhost_ops->vhost_set_vring_enable(dev, false);
>>>>>>> +    if (vhost_backend_invalidate_device_iotlb(dev, 0, -1ULL)) {
>>>>>>> +        error_report("Fail to invalidate device iotlb");
>>>>>>> +    }
>>>>>>> +
>>>>>>>          /* Can be read by vhost_virtqueue_mask, from vm exit */
>>>>>>>          qatomic_store_release(&dev->shadow_vqs_enabled, true);
>>>>>>>          for (idx = 0; idx < dev->nvqs; ++idx) {
>>>>>>> -        bool ok = vhost_shadow_vq_start(dev, idx, dev->shadow_vqs[idx]);
>>>>>>> +        bool ok = vhost_sw_live_migration_start_vq(dev, idx);
>>>>>>>              if (unlikely(!ok)) {
>>>>>>>                  goto err_start;
>>>>>>>              }
>>>>>>>          }
>>>>>>>
>>>>>>> +    /* Enable shadow vq vring */
>>>>>>> +    dev->vhost_ops->vhost_set_vring_enable(dev, true);
>>>>>>>          return 0;
>>>>>>>
>>>>>>>      err_start:
>>>>>>>          qatomic_store_release(&dev->shadow_vqs_enabled, false);
>>>>>>>          for (stop_idx = 0; stop_idx < idx; stop_idx++) {
>>>>>>>              vhost_shadow_vq_stop(dev, idx, dev->shadow_vqs[stop_idx]);
>>>>>>> +        vhost_virtqueue_start(dev, dev->vdev, &dev->vqs[idx],
>>>>>>> +                              dev->vq_index + stop_idx);
>>>>>>>          }
>>>>>>>
>>>>>>>      err_new:
>>>>>>> +    /* Enable guest's vring */
>>>>>>> +    dev->vhost_ops->vhost_set_vring_enable(dev, true);
>>>>>>>          for (idx = 0; idx < dev->nvqs; ++idx) {
>>>>>>>              vhost_shadow_vq_free(dev->shadow_vqs[idx]);
>>>>>>>          }
>>>>>>> @@ -1970,6 +2067,20 @@ void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Error **errp)
>>>>>>>
>>>>>>>              if (!hdev->started) {
>>>>>>>                  err_cause = "Device is not started";
>>>>>>> +        } else if (!vhost_dev_has_iommu(hdev)) {
>>>>>>> +            err_cause = "Does not support iommu";
>>>>>>> +        } else if (hdev->acked_features & BIT_ULL(VIRTIO_F_RING_PACKED)) {
>>>>>>> +            err_cause = "Is packed";
>>>>>>> +        } else if (hdev->acked_features & BIT_ULL(VIRTIO_RING_F_EVENT_IDX)) {
>>>>>>> +            err_cause = "Have event idx";
>>>>>>> +        } else if (hdev->acked_features &
>>>>>>> +                   BIT_ULL(VIRTIO_RING_F_INDIRECT_DESC)) {
>>>>>>> +            err_cause = "Supports indirect descriptors";
>>>>>>> +        } else if (!hdev->vhost_ops->vhost_set_vring_enable) {
>>>>>>> +            err_cause = "Cannot pause device";
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        if (err_cause) {
>>>>>>>                  goto err;
>>>>>>>              }
>>>>>>>
>


