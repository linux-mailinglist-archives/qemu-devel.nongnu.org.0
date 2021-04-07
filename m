Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0694735615E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 04:19:41 +0200 (CEST)
Received: from localhost ([::1]:47050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTxn9-0002Iz-Kn
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 22:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lTxlw-0001oa-GV
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 22:18:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lTxls-0003kf-5G
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 22:18:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617761898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yvOnjIbvX0mh3O6HmzksG437ngMh1af6FsbKG4y5sSk=;
 b=EDdnBT1A8zDtt0Qn1iPDkVrMUsdfxHRUcsokRw9zAsgZE0j1UT2L0iZQb2aM/wg8c/r0A+
 efdsOynGktBvGCd6Zbnu/0BcvblopUEqRdjEiCYr75VLlv7b5wDK3BVfzffXlq3atdZDwp
 myDMoJbtdOUf8oDKbyQ7bOq2zPpJOVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-7_E568dYM4-Ydn0QoeilgA-1; Tue, 06 Apr 2021 22:18:16 -0400
X-MC-Unique: 7_E568dYM4-Ydn0QoeilgA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33A9381620;
 Wed,  7 Apr 2021 02:18:15 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-182.pek2.redhat.com
 [10.72.13.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCC6261F59;
 Wed,  7 Apr 2021 02:18:03 +0000 (UTC)
Subject: Re: [PATCH 0/6] Add debug interface to kick/call on purpose
To: Dongli Zhang <dongli.zhang@oracle.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
References: <20210326054433.11762-1-dongli.zhang@oracle.com>
 <440216a8-821f-92dd-bc8b-fb2427bdc0e6@redhat.com>
 <d5549b12-d269-a04d-01d2-2dbd1ee7fca0@oracle.com>
 <ceb1f31a-e353-2542-a516-68b49735672c@redhat.com>
 <9248ae00-9a7d-c960-a673-9b3a3ede0452@oracle.com>
 <da0ae46e-da09-5894-21d4-732e5e20d070@redhat.com>
 <2e48f463-0a17-4ffd-c3a6-4a847e0e34c6@oracle.com>
 <5b21b2a2-e3bd-3812-61d7-bd3550cf680f@redhat.com>
 <f2a81508-e000-4a48-a023-290d40a77b8e@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8bd86bce-6179-15d4-a332-8649c745ce7f@redhat.com>
Date: Wed, 7 Apr 2021 10:18:02 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <f2a81508-e000-4a48-a023-290d40a77b8e@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com, ehabkost@redhat.com,
 mst@redhat.com, joe.jin@oracle.com, armbru@redhat.com, dgilbert@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/4/6 下午4:43, Dongli Zhang 写道:
>
> On 4/5/21 6:55 PM, Jason Wang wrote:
>> 在 2021/4/6 上午4:00, Dongli Zhang 写道:
>>> On 4/1/21 8:47 PM, Jason Wang wrote:
>>>> 在 2021/3/30 下午3:29, Dongli Zhang 写道:
>>>>> On 3/28/21 8:56 PM, Jason Wang wrote:
>>>>>> 在 2021/3/27 上午5:16, Dongli Zhang 写道:
>>>>>>> Hi Jason,
>>>>>>>
>>>>>>> On 3/26/21 12:24 AM, Jason Wang wrote:
>>>>>>>> 在 2021/3/26 下午1:44, Dongli Zhang 写道:
>>>>>>>>> The virtio device/driver (e.g., vhost-scsi or vhost-net) may hang due to
>>>>>>>>> the loss of doorbell kick, e.g.,
>>>>>>>>>
>>>>>>>>> https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01711.html__;!!GqivPVa7Brio!KS3pAU2cKjz4wgI4QSlE-YsJPhPG71nkE5_tGhaOf7mi_xvNxbvKkfn03rk5BNDLSEU$
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> ... or due to the loss of IRQ, e.g., as fixed by linux kernel commit
>>>>>>>>> fe200ae48ef5 ("genirq: Mark polled irqs and defer the real handler").
>>>>>>>>>
>>>>>>>>> This patch introduces a new debug interface 'DeviceEvent' to DeviceClass
>>>>>>>>> to help narrow down if the issue is due to loss of irq/kick. So far the new
>>>>>>>>> interface handles only two events: 'call' and 'kick'. Any device (e.g.,
>>>>>>>>> virtio/vhost or VFIO) may implement the interface (e.g., via eventfd, MSI-X
>>>>>>>>> or legacy IRQ).
>>>>>>>>>
>>>>>>>>> The 'call' is to inject irq on purpose by admin for a specific device
>>>>>>>>> (e.g.,
>>>>>>>>> vhost-scsi) from QEMU/host to VM, while the 'kick' is to kick the doorbell
>>>>>>>>> on purpose by admin at QEMU/host side for a specific device.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> This device can be used as a workaround if call/kick is lost due to
>>>>>>>>> virtualization software (e.g., kernel or QEMU) issue.
>>>>>>>>>
>>>>>>>>> We may also implement the interface for VFIO PCI, e.g., to write to
>>>>>>>>> VFIOPCIDevice->msi_vectors[i].interrupt will be able to inject IRQ to VM
>>>>>>>>> on purpose. This is considered future work once the virtio part is done.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Below is from live crash analysis. Initially, the queue=2 has count=15 for
>>>>>>>>> 'kick' eventfd_ctx. Suppose there is data in vring avail while there is no
>>>>>>>>> used available. We suspect this is because vhost-scsi was not notified by
>>>>>>>>> VM. In order to narrow down and analyze the issue, we use live crash to
>>>>>>>>> dump the current counter of eventfd for queue=2.
>>>>>>>>>
>>>>>>>>> crash> eventfd_ctx ffff8f67f6bbe700
>>>>>>>>> struct eventfd_ctx {
>>>>>>>>>        kref = {
>>>>>>>>>          refcount = {
>>>>>>>>>            refs = {
>>>>>>>>>              counter = 4
>>>>>>>>>            }
>>>>>>>>>          }
>>>>>>>>>        },
>>>>>>>>>        wqh = {
>>>>>>>>>          lock = {
>>>>>>>>>            {
>>>>>>>>>              rlock = {
>>>>>>>>>                raw_lock = {
>>>>>>>>>                  val = {
>>>>>>>>>                    counter = 0
>>>>>>>>>                  }
>>>>>>>>>                }
>>>>>>>>>              }
>>>>>>>>>            }
>>>>>>>>>          },
>>>>>>>>>          head = {
>>>>>>>>>            next = 0xffff8f841dc08e18,
>>>>>>>>>            prev = 0xffff8f841dc08e18
>>>>>>>>>          }
>>>>>>>>>        },
>>>>>>>>>        count = 15, ---> eventfd is 15 !!!
>>>>>>>>>        flags = 526336
>>>>>>>>> }
>>>>>>>>>
>>>>>>>>> Now we kick the doorbell for vhost-scsi queue=2 on purpose for diagnostic
>>>>>>>>> with this interface.
>>>>>>>>>
>>>>>>>>> { "execute": "x-debug-device-event",
>>>>>>>>>        "arguments": { "dev": "/machine/peripheral/vscsi0",
>>>>>>>>>                       "event": "kick", "queue": 2 } }
>>>>>>>>>
>>>>>>>>> The counter is increased to 16. Suppose the hang issue is resolved, it
>>>>>>>>> indicates something bad is in software that the 'kick' is lost.
>>>>>>>> What do you mean by "software" here? And it looks to me you're testing
>>>>>>>> whether
>>>>>>>> event_notifier_set() is called by virtio_queue_notify() here. If so, I'm not
>>>>>>>> sure how much value could we gain from a dedicated debug interface like this
>>>>>>>> consider there're a lot of exisinting general purpose debugging method like
>>>>>>>> tracing or gdb. I'd say the path from virtio_queue_notify() to
>>>>>>>> event_notifier_set() is only a very small fraction of the process of
>>>>>>>> virtqueue
>>>>>>>> kick which is unlikey to be buggy. Consider usually the ioeventfd will be
>>>>>>>> offloaded to KVM, it's more a chance that something is wrong in setuping
>>>>>>>> ioeventfd instead of here. Irq is even more complicated.
>>>>>>> Thank you very much!
>>>>>>>
>>>>>>> I am not testing whether event_notifier_set() is called by
>>>>>>> virtio_queue_notify().
>>>>>>>
>>>>>>> The 'software' indicates the data processing and event notification mechanism
>>>>>>> involved with virtio/vhost PV driver frontend. E.g., while VM is waiting
>>>>>>> for an
>>>>>>> extra IRQ, vhost side did not trigger IRQ, suppose vring_need_event()
>>>>>>> erroneously returns false due to corrupted ring buffer status.
>>>>>> So there could be several factors that may block the notification:
>>>>>>
>>>>>> 1) eventfd bug (ioeventfd vs irqfd)
>>>>>> 2) wrong virtqueue state (either driver or device)
>>>>>> 3) missing barriers (either driver or device)
>>>>>> 4) Qemu bug (irqchip and routing)
>>>>>> ...
>>>>> This is not only about whether notification is blocked.
>>>>>
>>>>> It can also be used to help narrow down and understand if there is any
>>>>> suspicious issue in blk-mq/scsi/netdev/napi code. The PV drivers are not only
>>>>> drivers following virtio spec. It is closely related to many of other kernel
>>>>> components.
>>>>>
>>>>> Suppose IO was recovered after we inject an IRQ to vhost-scsi on purpose, we
>>>>> will be able to analyze what may happen along the IO completion path starting
>>>>> from when /where the IRQ is injected ... perhaps the root cause is not with
>>>>> virtio but blk-mq/scsi (this is just an example).
>>>>>
>>>>>
>>>>> In addition, this idea should help for vfio-pci. Suppose the developer for a
>>>>> specific device driver suspects IO/networking hangs because of loss if IRQ, we
>>>>> will be able to verify if that assumption is correct by injecting an IRQ on
>>>>> purpose.
>>>>>
>>>>> Therefore, this is not only about virtio PV driver (frontend/backend), but also
>>>>> used to help analyze the issue related to entire IO/networking/passthrough
>>>>> virtualization stacks, especially in production env where the issue can only be
>>>>> reproduced randomly.
>>>> So it looks to me you'd better having things like this in the EventNotifier
>>>> layer and introduce qmp commands to write/read that instead of starting with a
>>>> virtio specific commands. Or it might be even helpful to start from some
>>>> counters for event notifiers which could be accessed via monitor to help to for
>>>> debugging to start with which is much more safe in the environment of
>>>> production. Having artifical events are always dangerous.
>>> The EventNotifier is just fd used by different QEMU components. There is not a
>>> way to track each EventNotifier used by a QEMU process so that I do not think we
>>> are able to track at EventNotifier layer, unless we add extra code to track the
>>> init/uninit of each eventfd, or modify kernel.
>>>
>>> That's try I introduced "DeviceEvent event" to "struct DeviceClass" so that each
>>> device type will be able to customize its own way to track its eventfd list.
>>>
>>>
>>> Would you prefer "write to a specific eventfd for a specific QEMU device",
>>> instead of "kick/call for a specific device"?
>>
>> It might be better. But note that eventfd is Linux specific, that's why we need
>> do it at higher level (EventNotifier level to make it work for e.g win).
>>
>> And it might be even better to start with reading the counters.
> Is it possible to read from eventfd without modifying kernel?
>
> QEMU has only event_notifier_test_and_clear(). According to kernel code, to read
> from eventfd will decreate ctx->count as line 190.
>
> 185 void eventfd_ctx_do_read(struct eventfd_ctx *ctx, __u64 *cnt)
> 186 {
> 187         lockdep_assert_held(&ctx->wqh.lock);
> 188
> 189         *cnt = (ctx->flags & EFD_SEMAPHORE) ? 1 : ctx->count;
> 190         ctx->count -= *cnt;
> 191 }
>
> Can I assume it is not appropriate to read from eventfd?


I don't get here, this is how eventfd is designed (read to clear 
behaviour if EFD_SEMAPHORE is not specified). When reading this counter 
the user should know the semantic of eventfd read.


>
>>
>>>
>>>>>> Consider we want to debug virtio issue, only 2) or 3) is what we really cared>
>>>>>> So for kick you did (assume vhost is on):
>>>>>>
>>>>>> virtio_device_event_kick()
>>>>>>        virtio_queue_notify()
>>>>>>            event_notifier_set()
>>>>>>
>>>>>> It looks to me you're actaully testing if ioeventfd is correctly set by Qemu.
>>>>>>
>>>>>> For call you did:
>>>>>>
>>>>>> virtio_device_event_call()
>>>>>>        event_notifier_set()
>>>>>>
>>>>>> A test of irqfd is correctly set by Qemu. So all of those are not virtio
>>>>>> specific stuffs but you introduce virtio specific command to do debug non
>>>>>> virtio
>>>>>> functions.
>>>>>>
>>>>>> In the case of what you mentioned for vring_need_event(), what we really
>>>>>> want is
>>>>>> to dump the virtqueue state from the guest. This might requries some work of
>>>>>> extending virtio spec (e.g to dump device status like indices, event, wrap
>>>>>> counters).
>>>>> Suppose the issue is only randomly reproducible in production env, we should
>>>>> always take 4) into consideration because we will not be able to know where is
>>>>> the root cause at the very beginning of bug analysis.
>>>> So if it truns out to be an issue of irqchip, how will you do the debugging
>>>> then? I guess what's really helpful is a qmp command to dump irqchip
>>>> status/information.
>>> Thank you very much for suggestion. That will be a different problem and we may
>>> consider as future work.
>>>
>>> This patchset is about to do introduce change/events to help narrow down where
>>> may be the root case in order to facilitate diagnostic (especially for prod env
>>> issue and when it is not easy to reproduce).
>>>
>>>>>>> This was initially proposed for vhost only and I was going to export
>>>>>>> ioeventfd/irqfd from vhost to admin via sysfs. Finally, I realized I would
>>>>>>> better implement this at QEMU.
>>>>>>>
>>>>>>> The QEMU inits the eventfd (ioeventfd and irqfd), and offloads them to
>>>>>>> KVM/vhost. The VM side sends requests to ring buffer and kicks the doorbell
>>>>>>> (via
>>>>>>> ioeventfd), while the backend vhost side sends responses back and calls
>>>>>>> the IRQ
>>>>>>> (via ioeventfd).
>>>>>>>
>>>>>>> Unfortunately, sometimes there is issue with virtio/vhost so that
>>>>>>> kick/call was
>>>>>>> missed/ignored, or even never triggered. The example mentioned in the
>>>>>>> patchset
>>>>>>> cover letter is with virtio-net (I assume vhost=on), where a kick to ioventfd
>>>>>>> was ignored, due to pci-bridge/hotplug issue.
>>>>>> So this is not a good example since it was a chipset bug. You need to use
>>>>>> other
>>>>>> tool to debug chipset code isn't it?
>>>>> As this issue is reproducible only randomly, we will not be able to realize it
>>>>> is a chipset bug at the very beginning.
>>>>>
>>>>> While the link is about vhost-net, it is applicable to vhost-scsi as well.
>>>>> Suppose DEBUG_UNASSIGNED is not enabled, the developer will need to investigate
>>>>> all of blk-mq, scsi, virtio-scsi (ioeventfd), vhost-scsi (target), pci-bridge
>>>>> and pci-hotplug, in order to identify the root case.
>>>>>
>>>>> The "call/kick" interface is used to narrow down and verify the analysis,
>>>>> especially when many kernel components are involved.
>>>>>
>>>>>>> The hotplug is with a very small window but the IO hangs permanently. I did
>>>>>>> test
>>>>>>> that kicking the doorbell again will help recover the IO, so that I would be
>>>>>>> able to conclude this was due to lost of kick.
>>>>>>>
>>>>>>> The loss of irq/doorbell is painful especially in production environment
>>>>>>> where
>>>>>>> we are not able to attach to QEMU via gdb. While the patchset is only for
>>>>>>> QEMU,
>>>>>>> Xen PV driver used to experience loss of IRQ issue as well, e.g., linux
>>>>>>> kernel
>>>>>>> commit 4704fe4f03a5 ("xen/events: mask events when changing their VCPU
>>>>>>> binding").
>>>>>> So looking at the git history we can see it has little possibility that the
>>>>>> missing is due to virtio/vhost itself. So the commit you mention here is not
>>>>>> good as well since it's not a netfront/netbackend bug.
>>>>> I mentioned the xen issue just to explain that the loss of event/irq issue may
>>>>> happen and is very painful. Another xen example is (equivalent to KVM VFIO):
>>>>>
>>>>> https://urldefense.com/v3/__https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=56348df32bbc782e63b6e3fb978b80e015ae76e7__;!!GqivPVa7Brio!JY2OqmcXAmza_G2gR-dQwV2Oa0hGG_6trVkxSUMocoYi4A_VXwZbzVn_VA9yx10i7Hk$
>>>>>
>>>>
>>>> Sorry, I can't figure out how is this related to VFIO or virtio. It should be
>>>> reproducible for devices without using eventfd?
>>>>
>>> Yes, although not involving eventfd, other drivers/virtualization may encounter
>>> the loss of irq/kick as well. There is no relation between xen and vfio/virtio.
>>>
>>> That's why a diagnostic interface is appreciated.
>>>
>>> In my opinion, the 'diagnostic' is not only to collect data,
>>
>> Usually, collecting the data is the first step :)
>>
>>
>>>    but also to
>>> introduce event/change (e.g., inject IRQ) and then monitor/observe what will
>>> happen to the stalled VM.
>>
>> It might be helpful yes, but it's also very dangerous.
>>
>>
>>>>> That's why I mentioned this idea helps for VFIO (not only VFIO, but actually
>>>>> blk-mq+nvme+pci+kvm+vfio, assuming it is for nvme passthrough) as well.
>>>>>
>>>>>> So for the case of event call, what you did is:
>>>>>>
>>>>>> satic void virtio_device_event_call(VirtQueue *vq, bool eventfd,
>>>>>>                                         Error **errp)
>>>>>> {
>>>>>> #ifdef DEBUG_VIRTIO_EVENT
>>>>>>        printf("The 'call' event is triggered for path=%s, queue=%d,
>>>>>> irqfd=%d.\n",
>>>>>>               object_get_canonical_path(OBJECT(vq->vdev)),
>>>>>>               vq->queue_index, eventfd);
>>>>>> #endif
>>>>>>
>>>>>>        if (eventfd) {
>>>>>>            virtio_set_isr(vq->vdev, 0x1);
>>>>>>            event_notifier_set(&vq->guest_notifier);
>>>>>>        } else {
>>>>>>            virtio_irq(vq);
>>>>>>        }
>>>>>> }
>>>>>>
>>>>>> This means, when eventfd is set, you bypasses the MSI mask which is very
>>>>>> dangerous to make it used in the case of production environment. And if you
>>>>>> check masking, it won't help a lot if the MSI is masked wrongly.
>>>>> You are right.
>>>>>
>>>>> Only the vhost-net is dangerous because it masks a vector by registering an
>>>>> alternative masked_notifier to KVM, while virtio-blk/vhost-scsi/virtio-scsi
>>>>> will
>>>>> un-register the guest notifier.
>>>>>
>>>>>>> This can help "narrow down" if the IO/networking hang is due to loss of
>>>>>>> IRQ/doorbell issue (or VM MSI-x is erroneously masked), especially in
>>>>>>> production
>>>>>>> env. This can also be used as a workaround so that VM owner will not need to
>>>>>>> reboot VM.
>>>>>> So having such extra workaround is pretty dangerous in production environemnt
>>>>>> where I think we need to be conservative which means we need to collect
>>>>>> information instead of generating artificial event.
>>>>>>
>>>>>> And it doesn't help if the wrokaround can be triggered through management API.
>>>>> I agree with this.
>>>>>
>>>>> This depends on the administrator. This workaround should only be used in very
>>>>> limited and special case.
>>>>>
>>>>>>> In addition, the VFIO will benefit from it. We will be able to test if to
>>>>>>> inject
>>>>>>> IRQ on purpose helps when the driver (e.g., PCI, NVMe, Ethernet) developers
>>>>>>> blame the hang is caused by loss of IRQ with KVM/VFIO.(It seems there is more
>>>>>>> chance to loose IRQ during CPU hotplug or changing IRQ affinity).
>>>>>>>
>>>>>>>> I think we could not gain much for introducing an dedicated mechanism for
>>>>>>>> such a
>>>>>>>> corner case.
>>>>>>> As replied by Dave for prior RFC, the QEMU already supports
>>>>>>> hmp_ioport_write to
>>>>>>> trigger an ioport write on purpose.
>>>>>> If that applies. I would rather have a hmp_mem_write then we can test both MSI
>>>>>> and doorbell. But again, they are very dangerous to be used in production
>>>>>> envronment.
>>>>> This is just not convenient for production env administrator. We will need to
>>>>> first obtain the virtio pci info (e.g., via "lspci -vv"), and then prepare for
>>>>> the command after calculating the address of doorbell.
>>>>>
>>>>> Something bad may happen if the developer did not calculate the address
>>>>> correctly.
>>>> It won't be worse than hmp_ioport_write I think?
>>> I always believe it is worth adding hmp_mem_write().
>>>
>>> While it won't be worse than hmp_ioport_write(), in my opinion, it is not as
>>> easy/convenient as to write to eventfd.
>>>
>>>>> It should be much more easier for developer to just ask administrator to "call"
>>>>> queue X for a specific virtio device.
>>>> We can have the commands like "info virtio" which can show all the MSI/doorbell
>>>> information for user to use. Or limit its use for virtio and vfio device only to
>>>> avoid unexpected result.
>>> So far the method by this patchset is to introduce "DeviceEvent event" to
>>> "struct DeviceClass".
>>>
>>> Only virtio-pci-xxx and vfio (future work) will implement this interface.
>>>
>>>
>>>>>>> The linux block layer also supports the below to kick the IO queue on
>>>>>>> purpose.
>>>>>>>
>>>>>>> echo "kick" > /sys/kernel/debug/block/sda/state
>>>>>> This might be fine for hardware device but not virtio. The device can
>>>>>> choose to
>>>>>> poll the virtqueue instead of depending of the doorbell to work. And for
>>>>>> networking subsystem, we don't have such stuffs, instead ethtool support to
>>>>>> dump
>>>>>> ring and vendor specific stuffs which could be used for dumping virtqueue
>>>>>> state
>>>>>> in this case.
>>>>> This is just another example to help explain the philosophy behind the
>>>>> "kick/call" idea: sometimes to trigger the event on purpose will help us narrow
>>>>> down and verify our analysis of a kernel bug, especially a bug that is only
>>>>> randomly reproducible in production environment.
>>>>>
>>>>>
>>>>> I understand it is possibly not proper to introduce such interface to QEMU.
>>>>> That's why I used to send out the RFC.
>>>>>
>>>>> https://urldefense.com/v3/__https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg03441.html__;!!GqivPVa7Brio!JY2OqmcXAmza_G2gR-dQwV2Oa0hGG_6trVkxSUMocoYi4A_VXwZbzVn_VA9yu-n97gA$
>>>>>
>>>>>
>>>>> In my opinion, this interface is pretty useful when the diagnostic invokes many
>>>>> kernel components, or when developers from different components are working on
>>>>> the same bug, no matter whether the root cause is at virtio or not.
>>>> So for virtio, it's not hard to events without those interface. E.g for
>>>> networking you can generate some traffic and trace on where-ever you suspect
>>>> that could block the event (kick/call).
>>> Suppose the vhost-net backend is TUN. Once virtio-net RX path is stuck and its
>>> vring is full, the ring used by tun_net_xmit()-->ptr_ring_produce() will be full
>>> as well. I do not have a way to generate traffic for RX path in such situation.
>>
>> Right, but as discussed, we need interface to dump virtqueue state, then it
>> would be very easy to start with.
>>
>>
>>>> I still prefer hmp_mem_write()/read() which looks more generic, in the same
>>>> time, we can add more debug informaiton likes:
>>>>
>>>> 1) satistics like eventfd counters
>>>> 2) device information, register layout, doorbell/MSI-X information
>>>> 3) irqchip infromation
>>> Would you mind help for below questions?
>>>
>>> 1. Regardless about kick/call or hmp_mem_write(), is it safe to add such
>>> interfaces? I think it is safe because:
>>>
>>> (1) This affects only specific VM (QEMU), not all/others.
>>>
>>> (2) It is dangerous only when sysadmin triggers the events on purpose. If this
>>> interface is dangerous, both "(qemu) mce 0 1 0xb200000000000000 0x0 0x0 0x0" (to
>>> inject uncorrected error) and "echo c > /proc/sysrq-trigger" (to crash kernel)
>>> will be dangerous as well.
>>>
>>> (3) While this is implemented for only vhost-scsi-pci and vhost-vhost-pci, I do
>>> not see issue for host kernel. It will be security bug if to read/write eventfd
>>> from userspace crashes kernel space.
>>>
>>> (4) We primarily use this interface when VM is running into issue (unless we use
>>> it as workaround).
>>
>> Besides the above, I think it's only "safe" if we clearly define the semanic of
>> this command. E.g:
>>
>> 1) Does it work at EventNotifier (eventfd) level or virtio/vfio level?
> I am still confused with the difference between EventNotifier level and
> virtio/vfio level.
>
> There is not a global mechanism to track the EventNotifier used by each device.
> We will still need per-device-type interface to dump EventNotifier for each device.
>
> Please see more below.
>
>> 2) Can it bypass the masking?
> This is a good question and please see below for the answer.
>
>>
>>>
>>> 2. Is it fine to add such interface to QEMU software upstream, or such interface
>>> is not good for software upstream so that the interface should be added only
>>> when QEMU is customized for specific products' usage?
>>
>> We can listen to the comments from other experts on the list. But I think having
>> a generic trigger at EventNotifier level should be ok.
> Would you mind share and confirm if this is what you are looking for?
>
> To dump EventNotifier for each device.
>
> (qemu) x-debug-device-event-notifier /machine/peripheral/vscsi0 dump
>
> ... list all event-notifier related to this device ...
>
>
> Write to a specific EventNotifier. The id is from prior dump.
>
> (qemu) x-debug-device-event-notifier /machine/peripheral/vscsi0 write <dump id>
>
> ... print which event-notifier is written to ...
>

Something like this, yes.


> This will answer your question that "Can it bypass the masking?".
>
> For vhost-scsi, virtio-blk, virtio-scsi and virtio-net, to write to eventfd is
> not able to bypass masking because masking is to unregister the eventfd. To
> write to eventfd does not take effect.
>
> However, it is possible to bypass masking for vhost-net because vhost-net
> registered a specific masked_notifier eventfd in order to mask irq. To write to
> original eventfd still takes effect.


Right, using those commands assumes the user has a clear understanding 
of how eventnotifier is expected to work for different backends.


>
> We may leave the user to decide whether to write to 'masked_notifier' or
> original 'guest_notifier' for vhost-net.


Yes.

Thanks


>
> Thank you very much!
>
> Dongli Zhang
>
>
>> Thanks
>>
>>
>>>
>>> We may discuss how, e.g., hmp_mem_write() vs. kick/call if it is fine to add
>>> such interfaces.
>>>
>>> Thank you very much!
>>>
>>> Dongli Zhang
>>>


