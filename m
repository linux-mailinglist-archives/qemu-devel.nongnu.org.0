Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E0B2C4DAA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 04:10:06 +0100 (CET)
Received: from localhost ([::1]:45238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki7fY-0005NX-Vq
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 22:10:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ki7dE-0004WF-E1
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 22:07:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ki7dB-0006aw-JQ
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 22:07:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606360055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8yXE0MDOyVD7WAE8aijm9XJiMRGRHSOjfmxlipWrPcs=;
 b=MMyM6futOer8PZU1EPuHpSHLdLoqULq4+03J3dtz/yEpRYG7UdSKCxROvenspMr2Zl4Tnm
 xcrJhkPYu6YJFnWlFk9cmM/tMVEPVpKAXzsulPzH7LWLhyynF8mfsK/DnPeNwtErc89SJF
 P9pJc0z9EZ3V5gXZCg8RPCpgW86fsLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-GQ81NE11OqyvxM1ZNrQQ8w-1; Wed, 25 Nov 2020 22:07:32 -0500
X-MC-Unique: GQ81NE11OqyvxM1ZNrQQ8w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B4781005E46;
 Thu, 26 Nov 2020 03:07:29 +0000 (UTC)
Received: from [10.72.13.213] (ovpn-13-213.pek2.redhat.com [10.72.13.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B62E10023AF;
 Thu, 26 Nov 2020 03:07:04 +0000 (UTC)
Subject: Re: [RFC PATCH 00/27] vDPA software assisted live migration
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <5a4d0b7a-fb62-9e78-9e85-9262dca57f1c@redhat.com>
 <CAJaqyWf+6yoMHJuLv=QGLMP4egmdm722=V2kKJ_aiQAfCCQOFw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9edb2df1-dec0-8aad-4fdd-93c3b3be9ff6@redhat.com>
Date: Thu, 26 Nov 2020 11:07:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJaqyWf+6yoMHJuLv=QGLMP4egmdm722=V2kKJ_aiQAfCCQOFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kvm list <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Daniel Daly <dandaly0@gmail.com>,
 virtualization@lists.linux-foundation.org, Liran Alon <liralon@gmail.com>,
 Eli Cohen <eli@mellanox.com>, Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Alex Barba <alex.barba@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Jim Harford <jim.harford@broadcom.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Stephen Finucane <stephenfin@redhat.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/25 下午8:03, Eugenio Perez Martin wrote:
> On Wed, Nov 25, 2020 at 8:09 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> On 2020/11/21 上午2:50, Eugenio Pérez wrote:
>>> This series enable vDPA software assisted live migration for vhost-net
>>> devices. This is a new method of vhost devices migration: Instead of
>>> relay on vDPA device's dirty logging capability, SW assisted LM
>>> intercepts dataplane, forwarding the descriptors between VM and device.
>>>
>>> In this migration mode, qemu offers a new vring to the device to
>>> read and write into, and disable vhost notifiers, processing guest and
>>> vhost notifications in qemu. On used buffer relay, qemu will mark the
>>> dirty memory as with plain virtio-net devices. This way, devices does
>>> not need to have dirty page logging capability.
>>>
>>> This series is a POC doing SW LM for vhost-net devices, which already
>>> have dirty page logging capabilities. None of the changes have actual
>>> effect with current devices until last two patches (26 and 27) are
>>> applied, but they can be rebased on top of any other. These checks the
>>> device to meet all requirements, and disable vhost-net devices logging
>>> so migration goes through SW LM. This last patch is not meant to be
>>> applied in the final revision, it is in the series just for testing
>>> purposes.
>>>
>>> For use SW assisted LM these vhost-net devices need to be instantiated:
>>> * With IOMMU (iommu_platform=on,ats=on)
>>> * Without event_idx (event_idx=off)
>>
>> So a question is at what level do we want to implement qemu assisted
>> live migration. To me it could be done at two levels:
>>
>> 1) generic vhost level which makes it work for both vhost-net/vhost-user
>> and vhost-vDPA
>> 2) a specific type of vhost
>>
>> To me, having a generic one looks better but it would be much more
>> complicated. So what I read from this series is it was a vhost kernel
>> specific software assisted live migration which is a good start.
>> Actually it may even have real use case, e.g it can save dirty bitmaps
>> for guest with large memory. But we need to address the above
>> limitations first.
>>
>> So I would like to know what's the reason for mandating iommu platform
>> and ats? And I think we need to fix case of event idx support.
>>
> There is no specific reason for mandating iommu & ats, it was just
> started that way.
>
> I will extend the patch to support those cases too.
>
>>> Just the notification forwarding (with no descriptor relay) can be
>>> achieved with patches 7 and 9, and starting migration. Partial applies
>>> between 13 and 24 will not work while migrating on source, and patch
>>> 25 is needed for the destination to resume network activity.
>>>
>>> It is based on the ideas of DPDK SW assisted LM, in the series of
>>
>> Actually we're better than that since there's no need the trick like
>> hardcoded IOVA for mediated(shadow) virtqueue.
>>
>>
>>> DPDK's https://patchwork.dpdk.org/cover/48370/ .
>>
>> I notice that you do GPA->VA translations and try to establish a VA->VA
>> (use VA as IOVA) mapping via device IOTLB. This shortcut should work for
>> vhost-kernel/user but not vhost-vDPA. The reason is that there's no
>> guarantee that the whole 64bit address range could be used as IOVA. One
>> example is that for hardware IOMMU like intel, it usually has 47 or 52
>> bits of address width.
>>
>> So we probably need an IOVA allocator that can make sure the IOVA is not
>> overlapped and fit for [1]. We can probably build the IOVA for guest VA
>> via memory listeners. Then we have
>>
>> 1) IOVA for GPA
>> 2) IOVA for shadow VQ
>>
>> And advertise IOVA to VA mapping to vhost.
>>
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1b48dc03e575a872404f33b04cd237953c5d7498
>>
> Got it, will control it too.
>
> Maybe for vhost-net we could directly send iotlb miss for [0,~0ULL].


It works but it means vhost-net needs some special care. To me a generic 
IOVA allocator looks better.


>
>>> Comments are welcome.
>>>
>>> Thanks!
>>>
>>> Eugenio Pérez (27):
>>>     vhost: Add vhost_dev_can_log
>>>     vhost: Add device callback in vhost_migration_log
>>>     vhost: Move log resize/put to vhost_dev_set_log
>>>     vhost: add vhost_kernel_set_vring_enable
>>>     vhost: Add hdev->dev.sw_lm_vq_handler
>>>     virtio: Add virtio_queue_get_used_notify_split
>>>     vhost: Route guest->host notification through qemu
>>>     vhost: Add a flag for software assisted Live Migration
>>>     vhost: Route host->guest notification through qemu
>>>     vhost: Allocate shadow vring
>>>     virtio: const-ify all virtio_tswap* functions
>>>     virtio: Add virtio_queue_full
>>>     vhost: Send buffers to device
>>>     virtio: Remove virtio_queue_get_used_notify_split
>>>     vhost: Do not invalidate signalled used
>>>     virtio: Expose virtqueue_alloc_element
>>>     vhost: add vhost_vring_set_notification_rcu
>>>     vhost: add vhost_vring_poll_rcu
>>>     vhost: add vhost_vring_get_buf_rcu
>>>     vhost: Return used buffers
>>>     vhost: Add vhost_virtqueue_memory_unmap
>>>     vhost: Add vhost_virtqueue_memory_map
>>>     vhost: unmap qemu's shadow virtqueues on sw live migration
>>>     vhost: iommu changes
>>>     vhost: Do not commit vhost used idx on vhost_virtqueue_stop
>>>     vhost: Add vhost_hdev_can_sw_lm
>>>     vhost: forbid vhost devices logging
>>>
>>>    hw/virtio/vhost-sw-lm-ring.h      |  39 +++
>>>    include/hw/virtio/vhost.h         |   5 +
>>>    include/hw/virtio/virtio-access.h |   8 +-
>>>    include/hw/virtio/virtio.h        |   4 +
>>>    hw/net/virtio-net.c               |  39 ++-
>>>    hw/virtio/vhost-backend.c         |  29 ++
>>>    hw/virtio/vhost-sw-lm-ring.c      | 268 +++++++++++++++++++
>>>    hw/virtio/vhost.c                 | 431 +++++++++++++++++++++++++-----
>>>    hw/virtio/virtio.c                |  18 +-
>>>    hw/virtio/meson.build             |   2 +-
>>>    10 files changed, 758 insertions(+), 85 deletions(-)
>>>    create mode 100644 hw/virtio/vhost-sw-lm-ring.h
>>>    create mode 100644 hw/virtio/vhost-sw-lm-ring.c
>>
>> So this looks like a pretty huge patchset which I'm trying to think of
>> ways to split. An idea is to do this is two steps
>>
>> 1) implement a shadow virtqueue mode for vhost first (w/o live
>> migration). Then we can test descriptors relay, IOVA allocating, etc.
> How would that mode be activated if it is not tied to live migration?
> New backend/command line switch?


Either a new cli option or even a qmp command can work.


>
> Maybe it is better to also start with no iommu & ats support and add it on top.


Yes.


>
>> 2) add live migration support on top
>>
>> And it looks to me it's better to split the shadow virtqueue (virtio
>> driver part) into an independent file. And use generic name (w/o
>> "shadow") in order to be reused by other use cases as well.
>>
> I think the same.
>
> Thanks!
>
>> Thoughts?
>>
>


