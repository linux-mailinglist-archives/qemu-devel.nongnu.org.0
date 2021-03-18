Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB6634022F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:36:36 +0100 (CET)
Received: from localhost ([::1]:59622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMp51-0005u5-KF
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lMoyd-0006Ey-Va
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:30:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lMoyb-0002V9-4D
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:29:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616059796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LL+9gfhaPufAEHYubyYreBIdO55dCWERsV9+fHTnFKw=;
 b=amLzbU372SHIsj5SgG7YIoZ3bJTNd4b1VYsLayGbrehbUl4e+0zupgxC5mwhzdJufMgcai
 5/3gpHXBkptlaDE82Kgl+IIGShQB2iMe15iav4HDpf2KsnFRIU5uYX/f1wF19WBdzMUI5C
 jSPixK4ZdIC8yx/PM0KhNvVPyPDRrDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-6QkPFp68O_uO6ixBSfoppQ-1; Thu, 18 Mar 2021 05:29:54 -0400
X-MC-Unique: 6QkPFp68O_uO6ixBSfoppQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C458181431E;
 Thu, 18 Mar 2021 09:29:52 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-17.pek2.redhat.com
 [10.72.13.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4755162951;
 Thu, 18 Mar 2021 09:29:39 +0000 (UTC)
Subject: Re: [RFC v2 05/13] vhost: Route guest->host notification through
 shadow virtqueue
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20210315194842.277740-1-eperezma@redhat.com>
 <20210315194842.277740-6-eperezma@redhat.com>
 <23e492d1-9e86-20d3-e2b3-b3d7c8c6da9c@redhat.com>
 <CAJaqyWf6Vec1B+ybHdHoUVOG8Ga8hO0=ub8eVou+S0PfgyW+2A@mail.gmail.com>
 <2a64dae7-a1db-53b2-413d-45225d8653ca@redhat.com>
 <CAJaqyWfkUTVyzMrGg_S6sCtAU+PD=zAjDsr3EdYvPa+fLutrhA@mail.gmail.com>
 <ac53f914-ffd3-3d16-b05d-c2d6e4c53cff@redhat.com>
 <CAJaqyWd-vcXJ7RdZn=cSM+JeOxvk7hzpWjpcsYccfAuKkBEeZg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d676c5b7-1e0b-54f6-1461-17b162f9d3b6@redhat.com>
Date: Thu, 18 Mar 2021 17:29:37 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAJaqyWd-vcXJ7RdZn=cSM+JeOxvk7hzpWjpcsYccfAuKkBEeZg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Guru Prasad <guru.prasad@broadcom.com>, Juan Quintela <quintela@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/3/18 下午5:18, Eugenio Perez Martin 写道:
> On Thu, Mar 18, 2021 at 4:11 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2021/3/18 上午12:47, Eugenio Perez Martin 写道:
>>> On Wed, Mar 17, 2021 at 3:05 AM Jason Wang <jasowang@redhat.com> wrote:
>>>> 在 2021/3/16 下午6:31, Eugenio Perez Martin 写道:
>>>>> On Tue, Mar 16, 2021 at 8:18 AM Jason Wang <jasowang@redhat.com> wrote:
>>>>>> 在 2021/3/16 上午3:48, Eugenio Pérez 写道:
>>>>>>> Shadow virtqueue notifications forwarding is disabled when vhost_dev
>>>>>>> stops, so code flow follows usual cleanup.
>>>>>>>
>>>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>>>> ---
>>>>>>>      hw/virtio/vhost-shadow-virtqueue.h |   7 ++
>>>>>>>      include/hw/virtio/vhost.h          |   4 +
>>>>>>>      hw/virtio/vhost-shadow-virtqueue.c | 113 ++++++++++++++++++++++-
>>>>>>>      hw/virtio/vhost.c                  | 143 ++++++++++++++++++++++++++++-
>>>>>>>      4 files changed, 265 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
>>>>>>> index 6cc18d6acb..c891c6510d 100644
>>>>>>> --- a/hw/virtio/vhost-shadow-virtqueue.h
>>>>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
>>>>>>> @@ -17,6 +17,13 @@
>>>>>>>
>>>>>>>      typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
>>>>>>>
>>>>>>> +bool vhost_shadow_vq_start(struct vhost_dev *dev,
>>>>>>> +                           unsigned idx,
>>>>>>> +                           VhostShadowVirtqueue *svq);
>>>>>>> +void vhost_shadow_vq_stop(struct vhost_dev *dev,
>>>>>>> +                          unsigned idx,
>>>>>>> +                          VhostShadowVirtqueue *svq);
>>>>>>> +
>>>>>>>      VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx);
>>>>>>>
>>>>>>>      void vhost_shadow_vq_free(VhostShadowVirtqueue *vq);
>>>>>>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>>>>>>> index ac963bf23d..7ffdf9aea0 100644
>>>>>>> --- a/include/hw/virtio/vhost.h
>>>>>>> +++ b/include/hw/virtio/vhost.h
>>>>>>> @@ -55,6 +55,8 @@ struct vhost_iommu {
>>>>>>>          QLIST_ENTRY(vhost_iommu) iommu_next;
>>>>>>>      };
>>>>>>>
>>>>>>> +typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
>>>>>>> +
>>>>>>>      typedef struct VhostDevConfigOps {
>>>>>>>          /* Vhost device config space changed callback
>>>>>>>           */
>>>>>>> @@ -83,7 +85,9 @@ struct vhost_dev {
>>>>>>>          uint64_t backend_cap;
>>>>>>>          bool started;
>>>>>>>          bool log_enabled;
>>>>>>> +    bool shadow_vqs_enabled;
>>>>>>>          uint64_t log_size;
>>>>>>> +    VhostShadowVirtqueue **shadow_vqs;
>>>>>> Any reason that you don't embed the shadow virtqueue into
>>>>>> vhost_virtqueue structure?
>>>>>>
>>>>> Not really, it could be relatively big and I would prefer SVQ
>>>>> members/methods to remain hidden from any other part that includes
>>>>> vhost.h. But it could be changed, for sure.
>>>>>
>>>>>> (Note that there's a masked_notifier in struct vhost_virtqueue).
>>>>>>
>>>>> They are used differently: in SVQ the masked notifier is a pointer,
>>>>> and if it's NULL the SVQ code knows that device is not masked. The
>>>>> vhost_virtqueue is the real owner.
>>>> Yes, but it's an example for embedding auxciliary data structures in the
>>>> vhost_virtqueue.
>>>>
>>>>
>>>>> It could be replaced by a boolean in SVQ or something like that, I
>>>>> experimented with a tri-state too (UNMASKED, MASKED, MASKED_NOTIFIED)
>>>>> and let vhost.c code to manage all the transitions. But I find clearer
>>>>> the pointer use, since it's the more natural for the
>>>>> vhost_virtqueue_mask, vhost_virtqueue_pending existing functions.
>>>>>
>>>>> This masking/unmasking is the part I dislike the most from this
>>>>> series, so I'm very open to alternatives.
>>>> See below. I think we don't even need to care about that.
>>>>
>>>>
>>>>>>>          Error *migration_blocker;
>>>>>>>          const VhostOps *vhost_ops;
>>>>>>>          void *opaque;
>>>>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
>>>>>>> index 4512e5b058..3e43399e9c 100644
>>>>>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
>>>>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
>>>>>>> @@ -8,9 +8,12 @@
>>>>>>>       */
>>>>>>>
>>>>>>>      #include "hw/virtio/vhost-shadow-virtqueue.h"
>>>>>>> +#include "hw/virtio/vhost.h"
>>>>>>> +
>>>>>>> +#include "standard-headers/linux/vhost_types.h"
>>>>>>>
>>>>>>>      #include "qemu/error-report.h"
>>>>>>> -#include "qemu/event_notifier.h"
>>>>>>> +#include "qemu/main-loop.h"
>>>>>>>
>>>>>>>      /* Shadow virtqueue to relay notifications */
>>>>>>>      typedef struct VhostShadowVirtqueue {
>>>>>>> @@ -18,14 +21,121 @@ typedef struct VhostShadowVirtqueue {
>>>>>>>          EventNotifier kick_notifier;
>>>>>>>          /* Shadow call notifier, sent to vhost */
>>>>>>>          EventNotifier call_notifier;
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * Borrowed virtqueue's guest to host notifier.
>>>>>>> +     * To borrow it in this event notifier allows to register on the event
>>>>>>> +     * loop and access the associated shadow virtqueue easily. If we use the
>>>>>>> +     * VirtQueue, we don't have an easy way to retrieve it.
>>>>>> So this is something that worries me. It looks like a layer violation
>>>>>> that makes the codes harder to work correctly.
>>>>>>
>>>>> I don't follow you here.
>>>>>
>>>>> The vhost code already depends on virtqueue in the same sense:
>>>>> virtio_queue_get_host_notifier is called on vhost_virtqueue_start. So
>>>>> if this behavior ever changes it is unlikely for vhost to keep working
>>>>> without changes. vhost_virtqueue has a kick/call int where I think it
>>>>> should be stored actually, but they are never used as far as I see.
>>>>>
>>>>> Previous RFC did rely on vhost_dev_disable_notifiers. From its documentation:
>>>>> /* Stop processing guest IO notifications in vhost.
>>>>>     * Start processing them in qemu.
>>>>>     ...
>>>>> But it was easier for this mode to miss a notification, since they
>>>>> create a new host_notifier in virtio_bus_set_host_notifier right away.
>>>>> So I decided to use the file descriptor already sent to vhost in
>>>>> regular operation mode, so guest-related resources change less.
>>>>>
>>>>> Having said that, maybe it's useful to assert that
>>>>> vhost_dev_{enable,disable}_notifiers are never called on shadow
>>>>> virtqueue mode. Also, it could be useful to retrieve it from
>>>>> virtio_bus, not raw shadow virtqueue, so all get/set are performed
>>>>> from it. Would that make more sense?
>>>>>
>>>>>> I wonder if it would be simpler to start from a vDPA dedicated shadow
>>>>>> virtqueue implementation:
>>>>>>
>>>>>> 1) have the above fields embeded in vhost_vdpa structure
>>>>>> 2) Work at the level of
>>>>>> vhost_vdpa_set_vring_kick()/vhost_vdpa_set_vring_call()
>>>>>>
>>>>> This notifier is never sent to the device in shadow virtqueue mode.
>>>>> It's for SVQ to react to guest's notifications, registering it on its
>>>>> main event loop [1]. So if I perform these changes the way I
>>>>> understand them, SVQ would still rely on this borrowed EventNotifier,
>>>>> and it would send to the vDPA device the newly created kick_notifier
>>>>> of VhostShadowVirtqueue.
>>>> The point is that vhost code should be coupled loosely with virtio. If
>>>> you try to "borrow" EventNotifier from virtio, you need to deal with a
>>>> lot of synchrization. An exampleis the masking stuffs.
>>>>
>>> I still don't follow this, sorry.
>>>
>>> The svq->host_notifier event notifier is not affected by the masking
>>> issue, it is completely private to SVQ. This commit creates and uses
>>> it, and nothing related to masking is touched until the next commit.
>>>
>>>>>> Then the layer is still isolated and you have a much simpler context to
>>>>>> work that you don't need to care a lot of synchornization:
>>>>>>
>>>>>> 1) vq masking
>>>>> This EventNotifier is not used for masking, it does not change from
>>>>> the start of the shadow virtqueue operation through its end. Call fd
>>>>> sent to vhost/vdpa device does not change either in shadow virtqueue
>>>>> mode operation with masking/unmasking. I will try to document it
>>>>> better.
>>>>>
>>>>> I think that we will need to handle synchronization with
>>>>> masking/unmasking from the guest and dynamically enabling SVQ
>>>>> operation mode, since they can happen at the same time as long as we
>>>>> let the guest run. There may be better ways of synchronizing them of
>>>>> course, but I don't see how moving to the vhost-vdpa backend helps
>>>>> with this. Please expand if I've missed it.
>>>>>
>>>>> Or do you mean to forbid regular <-> SVQ operation mode transitions and delay it
>>>>> to future patchsets?
>>>> So my idea is to do all the shadow virtqueue in the vhost-vDPA codes and
>>>> hide them from the upper layers like virtio. This means it works at
>>>> vhost level which can see vhost_vring_file only. When enalbed, what it
>>>> needs is just:
>>>>
>>>> 1) switch to use svq kickfd and relay ioeventfd to svq kickfd
>>>> 2) switch to use svq callfd and relay svq callfd to irqfd
>>>>
>>>> It will still behave like a vhost-backend that the switching is done
>>>> internally in vhost-vDPA which is totally transparent to the virtio
>>>> codes of Qemu.
>>>>
>>>> E.g:
>>>>
>>>> 1) in the case of guest notifier masking, we don't need to do anything
>>>> since virtio codes will replace another irqfd for us.
>>> Assuming that we don't modify vhost masking code, but send shadow
>>> virtqueue call descriptor to the vhost device:
>>>
>>> If guest virtio code mask the virtqueue and replaces the vhost-vdpa
>>> device call fd (VhostShadowVirtqueue.call_notifier in the next commit,
>>> or the descriptor in your previous second point, svq callfd) with the
>>> masked notifier, vhost_shadow_vq_handle_call will not be called
>>> anymore, and no more used descriptors will be forwarded. They will be
>>> stuck if the shadow virtqueue forever. Guest itself cannot recover
>>> from this situation, since a masking will set irqfd, not SVQ call fd.
>>
>> Just to make sure we're in the same page. During vq masking, the virtio
>> codes actually use the masked_notifier as callfd in vhost_virtqueue_mask():
>>
>>       if (mask) {
>>           assert(vdev->use_guest_notifier_mask);
>>           file.fd = event_notifier_get_fd(&hdev->vqs[index].masked_notifier);
>>       } else {
>>       file.fd = event_notifier_get_fd(virtio_queue_get_guest_notifier(vvq));
>>       }
>>
>>       file.index = hdev->vhost_ops->vhost_get_vq_index(hdev, n);
>>       r = hdev->vhost_ops->vhost_set_vring_call(hdev, &file);
>>
>> So consider the shadow virtqueue in done at vhost-vDPA. We just need to
>> make sure
>>
>> 1) update the callfd which passed by virtio layer via set_vring_kick()
>> 2) always write to the callfd during vhost_shadow_vq_handle_call()
>>
>> Then
>>
>> 3) When shadow vq is enabled, we just set the callfd of shadow virtqueue
>> to vDPA via VHOST_SET_VRING_CALL, and poll the svq callfd
>> 4) When shadow vq is disabled, we just set the callfd that is passed by
>> virtio via VHOST_SET_VRING_CALL, stop poll the svq callfd
>>
>> So you can see in step 2 and 4, we don't need to know whether or not the
>> vq is masked since we follow the vhost protocol "VhostOps" and do
>> everyhing transparently in the vhost-(vDPA) layer.
>>
> All of this assumes that we can enable/disable SVQ dynamically while
> the device is running. If it's not the case, there is no need for the
> mutex neither in vhost.c code nor vdpa_backend.
>
> As I see it, the issue is that step (2) and (4) happens in different
> threads: (2) is in vCPU vmexit, and (4) is in main event loop.
> Consider unmasking and disabling SVQ at the same time with no mutex:
>
> vCPU vmexit thread                     aio thread
> (unmask)                               (stops SVQ)
> |                                      |
> |                                      // Last callfd set was masked_notifier
> |                                      vdpa_backend.callfd = \
> |                                              atomic_read(masked_notifier).
> |                                      |
> vhost_set_vring_call(vq.guest_notifier)|
> -> vdpa_backend.callfd = \             |
>             vq.guest_notifier           |
> |                                      |
> |                                      ioctl(vdpa,
> VHOST_SET_VRING_CALL, vdpa_backend.callfd)
> |
> // guest expects more interrupts, but
> // device just set masked
>
> And vhost_set_vring_call could happen entirely even while ioctl is
> being executed.
>
> So that is the reason for the mutex: vdpa_backend.call_fd and the
> ioctl VHOST_SET_VRING_CALL must be serialized. I'm ok with moving to
> vdpa backend, but it's the same code, just in vdpa_backend.c instead
> of vhost.c, so it becomes less generic in my opinion.


You are right. But let's consider if we can avoid the dedicated mutex.

E.g can we use the BQL, bascially we need to synchronizae with iothread.

Or is it possible to schedule bh then things are serailzied automatically?


>
>>>> 2) easily to deal with vhost dev start and stop
>>>>
>>>> The advantages are obvious, simple and easy to implement.
>>>>
>>> I still don't see how performing this step from backend code avoids
>>> the synchronization problem, since they will be done from different
>>> threads anyway. Not sure what piece I'm missing.
>>
>> See my reply in another thread. If you enable the shadow virtqueue via a
>> OOB monitor that's a real issue.
>>
>> But I don't think we need to do that since
>>
>> 1) SVQ should be transparnet to management
>> 2) unncessary synchronization issue
>>
>> We can enable the shadow virtqueue through cli, new parameter with
>> vhost-vdpa probably. Then we don't need to care about threads. And in
>> the final version with full live migration support, the shadow virtqueue
>> should be enabled automatically. E.g for the device without
>> VHOST_F_LOG_ALL or we can have a dedicated capability of vDPA via
>> VHOST_GET_BACKEND_FEATURES.
>>
> It should be enabled automatically in those condition, but it also
> needs to be dynamic, and only be active during migration. Otherwise,
> guest should use regular vdpa operation. The problem with masking is
> the same if we enable with QMP or because live migration event.
>
> So we will have the previous synchronization problem sooner or later.
> If we omit the rollback to regular vdpa operation (in other words,
> disabling SVQ), code can be simplified, but I'm not sure if that is
> desirable.


Rgiht, so I'm ok to have the synchronziation from the start if you wish.

But we need to figure out what to synchronize and how to do synchronize.

THanks


>
> Thanks!
>
>> Thanks
>>
>>
>>> I can see / tested a few solutions but I don't like them a lot:
>>>
>>> * Forbid hot-swapping from/to shadow virtqueue mode, and set it from
>>> cmdline: We will have to deal with setting the SVQ mode dynamically
>>> sooner or later if we want to use it for live migration.
>>> * Forbid coming back to regular mode after switching to shadow
>>> virtqueue mode: The heavy part of the synchronization comes from svq
>>> stopping code, since we need to serialize the setting of device call
>>> fd. This could be acceptable, but I'm not sure about the implications:
>>> What happens if live migration fails and we need to step back? A mutex
>>> is not needed in this scenario, it's ok with atomics and RCU code.
>>>
>>> * Replace KVM_IRQFD instead and let SVQ poll the old one and masked
>>> notifier: I haven't thought a lot of this one, I think it's better to
>>> not touch guest notifiers.
>>> * Monitor also masked notifier from SVQ: I think this could be
>>> promising, but SVQ needs to be notified about masking/unmasking
>>> anyway, and there is code that depends on checking the masked notifier
>>> for the pending notification.
>>>
>>>>>> 2) vhost dev start and stop
>>>>>>
>>>>>> ?
>>>>>>
>>>>>>
>>>>>>> +     *
>>>>>>> +     * So shadow virtqueue must not clean it, or we would lose VirtQueue one.
>>>>>>> +     */
>>>>>>> +    EventNotifier host_notifier;
>>>>>>> +
>>>>>>> +    /* Virtio queue shadowing */
>>>>>>> +    VirtQueue *vq;
>>>>>>>      } VhostShadowVirtqueue;
>>>>>>>
>>>>>>> +/* Forward guest notifications */
>>>>>>> +static void vhost_handle_guest_kick(EventNotifier *n)
>>>>>>> +{
>>>>>>> +    VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
>>>>>>> +                                             host_notifier);
>>>>>>> +
>>>>>>> +    if (unlikely(!event_notifier_test_and_clear(n))) {
>>>>>>> +        return;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    event_notifier_set(&svq->kick_notifier);
>>>>>>> +}
>>>>>>> +
>>>>>>> +/*
>>>>>>> + * Restore the vhost guest to host notifier, i.e., disables svq effect.
>>>>>>> + */
>>>>>>> +static int vhost_shadow_vq_restore_vdev_host_notifier(struct vhost_dev *dev,
>>>>>>> +                                                     unsigned vhost_index,
>>>>>>> +                                                     VhostShadowVirtqueue *svq)
>>>>>>> +{
>>>>>>> +    EventNotifier *vq_host_notifier = virtio_queue_get_host_notifier(svq->vq);
>>>>>>> +    struct vhost_vring_file file = {
>>>>>>> +        .index = vhost_index,
>>>>>>> +        .fd = event_notifier_get_fd(vq_host_notifier),
>>>>>>> +    };
>>>>>>> +    int r;
>>>>>>> +
>>>>>>> +    /* Restore vhost kick */
>>>>>>> +    r = dev->vhost_ops->vhost_set_vring_kick(dev, &file);
>>>>>>> +    return r ? -errno : 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +/*
>>>>>>> + * Start shadow virtqueue operation.
>>>>>>> + * @dev vhost device
>>>>>>> + * @hidx vhost virtqueue index
>>>>>>> + * @svq Shadow Virtqueue
>>>>>>> + */
>>>>>>> +bool vhost_shadow_vq_start(struct vhost_dev *dev,
>>>>>>> +                           unsigned idx,
>>>>>>> +                           VhostShadowVirtqueue *svq)
>>>>>> It looks to me this assumes the vhost_dev is started before
>>>>>> vhost_shadow_vq_start()?
>>>>>>
>>>>> Right.
>>>> This might not true. Guest may enable and disable virtio drivers after
>>>> the shadow virtqueue is started. You need to deal with that.
>>>>
>>> Right, I will test this scenario.
>>>
>>>> Thanks
>>>>


