Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0A529AD42
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 14:26:43 +0100 (CET)
Received: from localhost ([::1]:46528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXOzq-0007zI-F3
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 09:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kXOJA-0007ch-KR
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 08:42:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kXOJ5-00085F-D7
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 08:42:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603802549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VVrkumddJw5A8ZlNP/GL80UYD91phxoaprkhLEa4Jyg=;
 b=OYiDKB1qJ2g1cAre0hzM+AHS/5Hkej+FGRPpCdN2KrrX6fVUVl0IBHHo6+zmHmGdlNz/8h
 fuDbb72658kdNvejPP8Gs8QJk7rEYB9aECAXOqB+49gwr6sFwJZORlMoUvX+6F8PnY+LBt
 WCKqF+J4GbYu9fuBy0ZfNHGg4Gy973o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-CxW1hdJjOcCf0DEO2DgVQQ-1; Tue, 27 Oct 2020 08:42:27 -0400
X-MC-Unique: CxW1hdJjOcCf0DEO2DgVQQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 358D3108E1B5
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 12:42:15 +0000 (UTC)
Received: from [10.36.113.185] (ovpn-113-185.ams2.redhat.com [10.36.113.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 719D558826;
 Tue, 27 Oct 2020 12:42:13 +0000 (UTC)
Subject: Re: [PATCH RFC] memory: pause all vCPUs for the duration of memory
 transactions
To: Vitaly Kuznetsov <vkuznets@redhat.com>, qemu-devel@nongnu.org
References: <20201026084916.3103221-1-vkuznets@redhat.com>
 <294a987d-b0ef-1b58-98ac-0d4d43075d6e@redhat.com>
 <d7a20a33-0317-467e-6fc6-6528b3b46062@redhat.com>
 <87imav26d8.fsf@vitty.brq.redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <cb74d717-cfc1-a78b-cf80-eb8ebf1075fd@redhat.com>
Date: Tue, 27 Oct 2020 13:42:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87imav26d8.fsf@vitty.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 01:06:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.167, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.10.20 13:36, Vitaly Kuznetsov wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> On 26.10.20 11:43, David Hildenbrand wrote:
>>> On 26.10.20 09:49, Vitaly Kuznetsov wrote:
>>>> Currently, KVM doesn't provide an API to make atomic updates to memmap when
>>>> the change touches more than one memory slot, e.g. in case we'd like to
>>>> punch a hole in an existing slot.
>>>>
>>>> Reports are that multi-CPU Q35 VMs booted with OVMF sometimes print something
>>>> like
>>>>
>>>> !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Apic ID - 00000003 !!!!
>>>> ExceptionData - 0000000000000010  I:1 R:0 U:0 W:0 P:0 PK:0 SS:0 SGX:0
>>>> RIP  - 000000007E35FAB6, CS  - 0000000000000038, RFLAGS - 0000000000010006
>>>> RAX  - 0000000000000000, RCX - 000000007E3598F2, RDX - 00000000078BFBFF
>>>> ...
>>>>
>>>> The problem seems to be that TSEG manipulations on one vCPU are not atomic
>>>> from other vCPUs views. In particular, here's the strace:
>>>>
>>>> Initial creation of the 'problematic' slot:
>>>>
>>>> 10085 ioctl(13, KVM_SET_USER_MEMORY_REGION, {slot=6, flags=0, guest_phys_addr=0x100000,
>>>>     memory_size=2146435072, userspace_addr=0x7fb89bf00000}) = 0
>>>>
>>>> ... and then the update (caused by e.g. mch_update_smram()) later:
>>>>
>>>> 10090 ioctl(13, KVM_SET_USER_MEMORY_REGION, {slot=6, flags=0, guest_phys_addr=0x100000,
>>>>     memory_size=0, userspace_addr=0x7fb89bf00000}) = 0
>>>> 10090 ioctl(13, KVM_SET_USER_MEMORY_REGION, {slot=6, flags=0, guest_phys_addr=0x100000,
>>>>     memory_size=2129657856, userspace_addr=0x7fb89bf00000}) = 0
>>>>
>>>> In case KVM has to handle any event on a different vCPU in between these
>>>> two calls the #PF will get triggered.
>>>>
>>>> An ideal solution to the problem would probably require KVM to provide a
>>>> new API to do the whole transaction in one shot but as a band-aid we can
>>>> just pause all vCPUs to make memory transations atomic.
>>>>
>>>> Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>>>> ---
>>>> RFC: Generally, memap updates happen only a few times during guest boot but
>>>> I'm not sure there are no scenarios when pausing all vCPUs is undesireable
>>>> from performance point of view. Also, I'm not sure if kvm_enabled() check
>>>> is needed.
>>>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>>>> ---
>>>>   softmmu/memory.c | 11 +++++++++--
>>>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>>>> index fa280a19f7f7..0bf6f3f6d5dc 100644
>>>> --- a/softmmu/memory.c
>>>> +++ b/softmmu/memory.c
>>>> @@ -28,6 +28,7 @@
>>>>   
>>>>   #include "exec/memory-internal.h"
>>>>   #include "exec/ram_addr.h"
>>>> +#include "sysemu/cpus.h"
>>>>   #include "sysemu/kvm.h"
>>>>   #include "sysemu/runstate.h"
>>>>   #include "sysemu/tcg.h"
>>>> @@ -1057,7 +1058,9 @@ static void address_space_update_topology(AddressSpace *as)
>>>>   void memory_region_transaction_begin(void)
>>>>   {
>>>>       qemu_flush_coalesced_mmio_buffer();
>>>> -    ++memory_region_transaction_depth;
>>>> +    if ((++memory_region_transaction_depth == 1) && kvm_enabled()) {
>>>> +        pause_all_vcpus();
>>>> +    }
>>>>   }
>>>>   
>>>>   void memory_region_transaction_commit(void)
>>>> @@ -1087,7 +1090,11 @@ void memory_region_transaction_commit(void)
>>>>               }
>>>>               ioeventfd_update_pending = false;
>>>>           }
>>>> -   }
>>>> +
>>>> +        if (kvm_enabled()) {
>>>> +            resume_all_vcpus();
>>>> +        }
>>>> +    }
>>>>   }
>>>>   
>>>>   static void memory_region_destructor_none(MemoryRegion *mr)
>>>>
>>>
>>> This is in general unsafe. pause_all_vcpus() will temporarily drop the
>>> BQL, resulting in bad things happening to caller sites.
> 
> Oh, I see, thanks! I was expecting there's a reason we don't have this
> simple fix in already :-)
> 
>>>
>>> I studies the involved issues quite intensively when wanting to resize
>>> memory regions from virtio-mem code. It's not that easy.
>>>
>>> Have a look at my RFC for resizing. You can apply something similar to
>>> other operations.
>>>
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg684979.html
>>
>> Oh, and I even mentioned the case you try to fix here back then
>>
>> "
>> Instead of inhibiting during the region_resize(), we could inhibit for the
>> hole memory transaction (from begin() to commit()). This could be nice,
>> because also splitting of memory regions would be atomic (I remember there
>> was a BUG report regarding that), however, I am not sure if that might
>> impact any RT users.
>> "
>>
>> The current patches live in
>> https://github.com/davidhildenbrand/qemu/commits/virtio-mem-next
>>
>> Especially
>>
>> https://github.com/davidhildenbrand/qemu/commit/433fbb3abed20f15030e42f2b2bea7e6b9a15180
>>
>>
> 
> I'm not sure why we're focusing on ioctls here. I was debugging my case
> quite some time ago but from what I remember it had nothing to do with
> ioctls from QEMU. When we are removing a memslot any exit to KVM may
> trigger an error condition as we'll see that vCPU or some of our
> internal structures (e.g. VMCS for a nested guest) references
> non-existent memory. I don't see a good solution other than making the
> update fully atomic from *all* vCPUs point of view and this requires
> stopping all CPUs -- either from QEMU or from KVM.

I cannot follow. My patch waits until *any* KVM ioctls are out of the 
kernel. That includes VCPUs, but also other ioctls (because there are 
some that require a consistent memory block state).

So from a KVM point of view, the CPUs are stopped.

-- 
Thanks,

David / dhildenb


