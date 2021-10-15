Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A20E42EE2A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:52:25 +0200 (CEST)
Received: from localhost ([::1]:60982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJt2-0006PX-Na
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mbJUj-0007G5-NS
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:27:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mbJUe-0002E5-RA
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:27:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634290031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CR+bSf7ss0G2DVe15v+C0LSmg0idReL412buR5CMlhM=;
 b=YlyFAnpChTfDsR1WIXt08fLuWOZj6su2ZXlQJmALBmTD1uX6VXNTT6ksvyAK29Mp9yCisU
 HFn6eS9CDBdYk1xMJbu/ga+mDHi8qg9H92gaFrkUgwRq4c+ZvTs3h5xk9XArAJJd9ALGOw
 ZDqW5ZQsfE86ZU0xNuSKHGjuYqcPZlE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-4iPdMws4Oqezbqi5m0yegw-1; Fri, 15 Oct 2021 05:27:08 -0400
X-MC-Unique: 4iPdMws4Oqezbqi5m0yegw-1
Received: by mail-wr1-f69.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso5728391wrg.1
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 02:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=CR+bSf7ss0G2DVe15v+C0LSmg0idReL412buR5CMlhM=;
 b=AA+kNJ5wSpSIRy1IFNAEOwqH4nRamLS9ttRLt4kGyrfY9a7SXelEO7/4aTeHJ6lmFv
 zR9eQBr+yUUKKfam+1l3tab5SwCgtJHoDFtfreeUutSkmaGHrCBokT4ZbH/FRm1VJh6B
 96DpPa37335i/YHC8XibgHvzhW3RI1LKQ0nGeqzuep565ocjNCPujE7elVZ9F4/2wHSO
 BQsjZgUCsmbEq70oJyC+iwEB4fEqN4LhqXUrq5IrWjAYiaRqw0uC6H1Pb41CSRxIV3Os
 7r8HCN13xKwLs8v92qlExNRsb/hnxMym2NPcuRq8Y2MrYsIqNMfHFpSScXOlgUNljThQ
 oHAg==
X-Gm-Message-State: AOAM53228i8PkgY9e7ODXymNNjCs2Q5b0fz11lQqMzyYN6FuijPiAesn
 YT4/QQWvRRguNJtSdhCPUnyH6vKPA6SBy1/YnINoEXFs5fzPyaySs0DcFa0EUSmu+3s3GYMVpJp
 KSBYrAVlmXyae968=
X-Received: by 2002:adf:ee8b:: with SMTP id b11mr12499042wro.349.1634290027271; 
 Fri, 15 Oct 2021 02:27:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxq474o0JJhqfQ9fES2Lm4C7b6u8tEFpNLlSo5aZwSD8NajKvV7jl9KXypvkdINRTp7i30a6A==
X-Received: by 2002:adf:ee8b:: with SMTP id b11mr12499009wro.349.1634290026963; 
 Fri, 15 Oct 2021 02:27:06 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6a01.dip0.t-ipconnect.de. [91.12.106.1])
 by smtp.gmail.com with ESMTPSA id
 a5sm4478039wrn.71.2021.10.15.02.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 02:27:06 -0700 (PDT)
Message-ID: <4d316170-c203-fe01-d447-bdc464ade59f@redhat.com>
Date: Fri, 15 Oct 2021 11:27:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
To: "david.dai" <david.dai@montage-tech.com>
References: <YVGAWh7e96f8yed0@stefanha-x1.localdomain>
 <38a0312e-3b00-ac41-3cb0-ab5592b06dc1@redhat.com>
 <20210927122848.GB144947@tianmu-host-sw-01>
 <c87c301e-62af-ab5a-2b9c-fa2ef28898f1@redhat.com>
 <20210930094007.GA239054@tianmu-host-sw-01>
 <5eba1406-4012-481a-b7ed-0090654668d2@redhat.com>
 <20211009094233.GA13867@tianmu-host-sw-01>
 <ea36815e-0b79-b5b2-9735-367404c9b8f6@redhat.com>
 <20211013081337.GA96268@tianmu-host-sw-01>
 <0c244f16-ca16-9f70-dab8-f543accc063b@redhat.com>
 <20211015091007.GA155094@tianmu-host-sw-01>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] hw/misc: Add a virtual pci device to dynamically attach
 memory to QEMU
In-Reply-To: <20211015091007.GA155094@tianmu-host-sw-01>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, eajames@linux.ibm.com,
 qemu-devel@nongnu.org, changguo.du@montage-tech.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.10.21 11:10, david.dai wrote:
> On Wed, Oct 13, 2021 at 10:33:39AM +0200, David Hildenbrand (david@redhat.com) wrote:
>>
>> CAUTION: This email originated from outside of the organization. Do not
>> click links or open attachments unless you recognize the sender and know the
>> content is safe.
>>
>>
>> On 13.10.21 10:13, david.dai wrote:
>>> On Mon, Oct 11, 2021 at 09:43:53AM +0200, David Hildenbrand (david@redhat.com) wrote:
>>>>
>>>>
>>>>
>>>>>> virito-mem currently relies on having a single sparse memory region (anon
>>>>>> mmap, mmaped file, mmaped huge pages, mmap shmem) per VM. Although we can
>>>>>> share memory with other processes, sharing with other VMs is not intended.
>>>>>> Instead of actually mmaping parts dynamically (which can be quite
>>>>>> expensive), virtio-mem relies on punching holes into the backend and
>>>>>> dynamically allocating memory/file blocks/... on access.
>>>>>>
>>>>>> So the easy way to make it work is:
>>>>>>
>>>>>> a) Exposing the CXL memory to the buddy via dax/kmem, esulting in device
>>>>>> memory getting managed by the buddy on a separate NUMA node.
>>>>>>
>>>>>
>>>>> Linux kernel buddy system? how to guarantee other applications don't apply memory
>>>>> from it
>>>>
>>>> Excellent question. Usually, you would online the memory to ZONE_MOVABLE,
>>>> such that even if some other allocation ended up there, that it could
>>>> get migrated somewhere else.
>>>>
>>>> For example, "daxctl reconfigure-device" tries doing that as default:
>>>>
>>>> https://pmem.io/ndctl/daxctl-reconfigure-device.html
>>>>
>>>> However, I agree that we might actually want to tell the system to not
>>>> use this CPU-less node as fallback for other allocations, and that we
>>>> might not want to swap out such memory etc.
>>>>
>>>>
>>>> But, in the end all that virtio-mem needs to work in the hypervisor is
>>>>
>>>> a) A sparse memmap (anonymous RAM, memfd, file)
>>>> b) A way to populate memory within that sparse memmap (e.g., on fault,
>>>>     using madvise(MADV_POPULATE_WRITE), fallocate())
>>>> c) A way to discard memory (madvise(MADV_DONTNEED),
>>>>     fallocate(FALLOC_FL_PUNCH_HOLE))
>>>>
>>>> So instead of using anonymous memory+mbind, you can also mmap a sparse file
>>>> and rely on populate-on-demand. One alternative for your use case would be
>>>> to create a DAX  filesystem on that CXL memory (IIRC that should work) and
>>>> simply providing virtio-mem with a sparse file located on that filesystem.
>>>>
>>>> Of course, you can also use some other mechanism as you might have in
>>>> your approach, as long as it supports a,b,c.
>>>>
>>>>>
>>>>>>
>>>>>> b) (optional) allocate huge pages on that separate NUMA node.
>>>>>> c) Use ordinary memory-device-ram or memory-device-memfd (for huge pages),
>>>>>> *bidning* the memory backend to that special NUMA node.
>>>>>>
>>>>> "-object memory-backend/device-ram or memory-device-memfd, id=mem0, size=768G"
>>>>> How to bind backend memory to NUMA node
>>>>>
>>>>
>>>> I think the syntax is "policy=bind,host-nodes=X"
>>>>
>>>> whereby X is a node mask. So for node "0" you'd use "host-nodes=0x1" for "5"
>>>> "host-nodes=0x20" etc.
>>>>
>>>>>>
>>>>>> This will dynamically allocate memory from that special NUMA node, resulting
>>>>>> in the virtio-mem device completely being backed by that device memory,
>>>>>> being able to dynamically resize the memory allocation.
>>>>>>
>>>>>>
>>>>>> Exposing an actual devdax to the virtio-mem device, shared by multiple VMs
>>>>>> isn't really what we want and won't work without major design changes. Also,
>>>>>> I'm not so sure it's a very clean design: exposing memory belonging to other
>>>>>> VMs to unrelated QEMU processes. This sounds like a serious security hole:
>>>>>> if you managed to escalate to the QEMU process from inside the VM, you can
>>>>>> access unrelated VM memory quite happily. You want an abstraction
>>>>>> in-between, that makes sure each VM/QEMU process only sees private memory:
>>>>>> for example, the buddy via dax/kmem.
>>>>>>
>>>>> Hi David
>>>>> Thanks for your suggestion, also sorry for my delayed reply due to my long vacation.
>>>>> How does current virtio-mem dynamically attach memory to guest, via page fault?
>>>>
>>>> Essentially you have a large sparse mmap. Withing that mmap, memory is
>>>> populated on demand. Instead if mmap/munmap you perform a single large
>>>> mmap and then dynamically populate memory/discard memory.
>>>>
>>>> Right now, memory is populated via page faults on access. This is
>>>> sub-optimal when dealing with limited resources (i.e., hugetlbfs,
>>>> file blocks) and you might run out of backend memory.
>>>>
>>>> I'm working on a "prealloc" mode, which will preallocate/populate memory
>>>> necessary for exposing the next block of memory to the VM, and which
>>>> fails gracefully if preallocation/population fails in the case of such
>>>> limited resources.
>>>>
>>>> The patch resides on:
>>>> 	https://github.com/davidhildenbrand/qemu/tree/virtio-mem-next
>>>>
>>>> commit ded0e302c14ae1b68bdce9059dcca344e0a5f5f0
>>>> Author: David Hildenbrand <david@redhat.com>
>>>> Date:   Mon Aug 2 19:51:36 2021 +0200
>>>>
>>>>      virtio-mem: support "prealloc=on" option
>>>>      Especially for hugetlb, but also for file-based memory backends, we'd
>>>>      like to be able to prealloc memory, especially to make user errors less
>>>>      severe: crashing the VM when there are not sufficient huge pages around.
>>>>      A common option for hugetlb will be using "reserve=off,prealloc=off" for
>>>>      the memory backend and "prealloc=on" for the virtio-mem device. This
>>>>      way, no huge pages will be reserved for the process, but we can recover
>>>>      if there are no actual huge pages when plugging memory.
>>>>      Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>
>>>>
>>>> -- 
>>>> Thanks,
>>>>
>>>> David / dhildenb
>>>>
>>>
>>> Hi David,
>>>
>>> After read virtio-mem code, I understand what you have expressed, please allow me to describe
>>> my understanding to virtio-mem, so that we have a aligned view.
>>>
>>> Virtio-mem:
>>>   Virtio-mem device initializes and reserved a memory area(GPA), later memory dynamically
>>>   growing/shrinking will not exceed this scope, memory-backend-ram has mapped anon. memory
>>>   to the whole area, but no ram is attached because Linux have a policy to delay allocation.
>>
>> Right, but it can also be any sparse file (memory-backend-memfd,
>> memory-backend-file).
>>
>>>   When virtio-mem driver apply to dynamically add memory to guest, it first request a region
>>>   from the reserved memory area, then notify virtio-mem device to record the information
>>>   (virtio-mem device doesn't make real memory allocation). After received response from
>>
>> In the upcoming prealloc=on mode I referenced, the allocation will happen
>> before the guest is notified about success and starts using the memory.
>>
>> With vfio/mdev support, the allocation will happen nowadays already, when
>> vfio/mdev is notified about the populated memory ranges (see
>> RamDiscardManager). That's essentially what makes virtio-mem device
>> passthrough work.
>>
>>>   virtio-mem deivce, virtio-mem driver will online the requested region and add it to Linux
>>>   page allocator. Real ram allocation will happen via page fault when guest cpu access it.
>>>   Memory shrink will be achieved by madvise()
>>
>> Right, but you could write a custom virtio-mem driver that pools this memory
>> differently.
>>
>> Memory shrinking in the hypervisor is either done using madvise(DONMTNEED)
>> or fallocate(FALLOC_FL_PUNCH_HOLE)
>>
>>>
>>> Questions:
>>> 1. heterogeneous computing, memory may be accessed by CPUs on host side and device side.
>>>     Memory delayed allocation is not suitable. Host software(for instance, OpenCL) may
>>>     allocate a buffer to computing device to place the computing result in.
>>
>> That works already with virtio-mem with vfio/mdev via the RamDiscardManager
>> infrastructure introduced recently. With "prealloc=on", the delayed memory
>> allocation can also be avoided without vfio/mdev.
>>
>>> 2. we hope build ourselves page allocator in host kernel, so it can offer customized mmap()
>>>     method to build va->pa mapping in MMU and IOMMU.
>>
>> Theoretically, you can wire up pretty much any driver in QEMU like vfio/mdev
>> via the RamDiscardManager. From there, you can issue whatever syscall you
>> need to popualte memory when plugging new memory blocks. All you need to
>> support is a sparse mmap and a way to populate/discard memory.
>> Populate/discard could be wired up in QEMU virtio-mem code as you need it.
>>
>>> 3. some potential requirements also require our driver to manage memory, so that page size
>>>     granularity can be controlled to fit small device iotlb cache.
>>>     CXL has bias mode for HDM(host managed device memory), it needs physical address to make
>>>     bias mode switch between host access and device access. These tell us driver manage memory
>>>     is mandatory.
>>
>> I think if you write your driver in a certain way and wire it up in QEMU
>> virtio-mem accordingly (e.g., using a new memory-backend-whatever), that
>> shouldn't be an issue.
>>
> 
> Thanks a lot, so let me have a try.

Let me know if you need some help or run into issues! Further, if we
need spec extensions to handle some additional requirements, that's also
not really an issue.

I certainly don't want you to use virtio-mem by any means. However
"virtual pci device to dynamically attach memory to QEMU" is essentially
what virtio-mem was does :) .  As it's already compatible with vfio/mdev
and soon has full support for dealing with limited resources
(preallocation support, VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE), it feels
like a good fit for your use case as well, although some details are
left to be figured out.

(also, virtio-mem solved a lot of the issues related to guest memory
dumping, VM snapshotting/migration, and how to make it consumable by
upper layers like libvirt -- so you would get that for almost free as well)

-- 
Thanks,

David / dhildenb


