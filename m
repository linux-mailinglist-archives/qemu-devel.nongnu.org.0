Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111EA37298F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 13:29:28 +0200 (CEST)
Received: from localhost ([::1]:48584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldtF0-0000zR-MZ
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 07:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ldtDp-0000Zl-33
 for qemu-devel@nongnu.org; Tue, 04 May 2021 07:28:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ldtDm-0001mt-DK
 for qemu-devel@nongnu.org; Tue, 04 May 2021 07:28:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620127689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MFTRyvdnDvMS31IhKv1d4u6DXv4PRBQMyw4ZeOO+txI=;
 b=RPnNdbqqfvEndC8YVR0SxTyc7fYmezPMZN0AybRt7gpSZoRh23qtr5tUqoM6QdhZzF7VnQ
 5X9OmdMNxK4NGQPftVwhfh64eYE5Nz+UQSyPbEszVlmjmjAXN/40T+wm5fafrOsZ+N3UJJ
 /8zCc1tuiAj7q60mAi/JxEn45EmOm6s=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-yBVB83PJPG-gUAQQvG9r0Q-1; Tue, 04 May 2021 07:28:07 -0400
X-MC-Unique: yBVB83PJPG-gUAQQvG9r0Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 q18-20020a0564025192b02903888712212fso6079820edd.19
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 04:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=MFTRyvdnDvMS31IhKv1d4u6DXv4PRBQMyw4ZeOO+txI=;
 b=C9kJJGM5EhnFhYZ2JxSwnmYLPfsTnJ4WZwHewaOfib7CDd4QM4wLRulBU4TNKMQmmx
 KUWvHenSJLsIWHDlIGf+lIWxDmdg0u1kAR1qGnohLyTjzDWB+vpqG6vV5M3CLlOKj/ae
 06xS9nML0k7DpH1wZ6w0+Sfi2tDaJiilN1zgFcaKJrYfo1/Zf8BkvlKlJEG0SmIOIcFy
 0td7SSfFV8fBv20Ro26rY1QoF4dYRCyWBKou/muMpccNuKC56uTN1Q3QZ7q6Qi6KCMt6
 LKuU3FdMCpDkt3B388q9vNAUliQ3Essviyvs7xC608EL7WqKF3sWxneGoTtgsc7mKLB8
 R7Jg==
X-Gm-Message-State: AOAM53374Dr0Er+yU4T3ACJ8xQtagxkmKuuewljLvRAFdT8iKn09Z8la
 HeOmTSMQHjCQwGfb3cFsMzUK0Qn2OuSVKhcIWBwy87pnBD3txRInSQGqQK5DDYaY1gsR+tayWoK
 k8RN00cQD2eKKOyM=
X-Received: by 2002:a17:906:ccc9:: with SMTP id
 ot9mr8455035ejb.253.1620127686646; 
 Tue, 04 May 2021 04:28:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2Oa26rD8gsYUGVQcs1uc/IsgMvul2HO8JONFx86GxSv23Y4csAub1WdDmkROmq2we6SdwBw==
X-Received: by 2002:a17:906:ccc9:: with SMTP id
 ot9mr8454997ejb.253.1620127686282; 
 Tue, 04 May 2021 04:28:06 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6fae.dip0.t-ipconnect.de. [91.12.111.174])
 by smtp.gmail.com with ESMTPSA id p9sm13933268edu.79.2021.05.04.04.28.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 04:28:06 -0700 (PDT)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210428133754.10713-1-david@redhat.com>
 <20210428133754.10713-10-david@redhat.com> <YJEddjCsFgXa4tiR@redhat.com>
 <477b3679-1218-87bb-29d6-9b1b6079ab78@redhat.com>
 <YJEiz4E+Gk/fqWBo@redhat.com>
 <e72359da-918c-df2d-c541-c1fcf7e3c7d5@redhat.com>
 <YJEsqPuuW/zCeetg@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v7 09/15] util/mmap-alloc: Support RAM_NORESERVE via
 MAP_NORESERVE under Linux
Message-ID: <f3ccd8d5-3554-e2b6-0f43-021558d2e6d7@redhat.com>
Date: Tue, 4 May 2021 13:28:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJEsqPuuW/zCeetg@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, Nitesh Lal <nilal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.05.21 13:14, Daniel P. Berrangé wrote:
> On Tue, May 04, 2021 at 01:04:17PM +0200, David Hildenbrand wrote:
>> On 04.05.21 12:32, Daniel P. Berrangé wrote:
>>> On Tue, May 04, 2021 at 12:21:25PM +0200, David Hildenbrand wrote:
>>>> On 04.05.21 12:09, Daniel P. Berrangé wrote:
>>>>> On Wed, Apr 28, 2021 at 03:37:48PM +0200, David Hildenbrand wrote:
>>>>>> Let's support RAM_NORESERVE via MAP_NORESERVE on Linux. The flag has no
>>>>>> effect on most shared mappings - except for hugetlbfs and anonymous memory.
>>>>>>
>>>>>> Linux man page:
>>>>>>      "MAP_NORESERVE: Do not reserve swap space for this mapping. When swap
>>>>>>      space is reserved, one has the guarantee that it is possible to modify
>>>>>>      the mapping. When swap space is not reserved one might get SIGSEGV
>>>>>>      upon a write if no physical memory is available. See also the discussion
>>>>>>      of the file /proc/sys/vm/overcommit_memory in proc(5). In kernels before
>>>>>>      2.6, this flag had effect only for private writable mappings."
>>>>>>
>>>>>> Note that the "guarantee" part is wrong with memory overcommit in Linux.
>>>>>>
>>>>>> Also, in Linux hugetlbfs is treated differently - we configure reservation
>>>>>> of huge pages from the pool, not reservation of swap space (huge pages
>>>>>> cannot be swapped).
>>>>>>
>>>>>> The rough behavior is [1]:
>>>>>> a) !Hugetlbfs:
>>>>>>
>>>>>>      1) Without MAP_NORESERVE *or* with memory overcommit under Linux
>>>>>>         disabled ("/proc/sys/vm/overcommit_memory == 2"), the following
>>>>>>         accounting/reservation happens:
>>>>>>          For a file backed map
>>>>>>           SHARED or READ-only - 0 cost (the file is the map not swap)
>>>>>>           PRIVATE WRITABLE - size of mapping per instance
>>>>>>
>>>>>>          For an anonymous or /dev/zero map
>>>>>>           SHARED   - size of mapping
>>>>>>           PRIVATE READ-only - 0 cost (but of little use)
>>>>>>           PRIVATE WRITABLE - size of mapping per instance
>>>>>>
>>>>>>      2) With MAP_NORESERVE, no accounting/reservation happens.
>>>>>>
>>>>>> b) Hugetlbfs:
>>>>>>
>>>>>>      1) Without MAP_NORESERVE, huge pages are reserved.
>>>>>>
>>>>>>      2) With MAP_NORESERVE, no huge pages are reserved.
>>>>>>
>>>>>> Note: With "/proc/sys/vm/overcommit_memory == 0", we were already able
>>>>>> to configure it for !hugetlbfs globally; this toggle now allows
>>>>>> configuring it more fine-grained, not for the whole system.
>>>>>>
>>>>>> The target use case is virtio-mem, which dynamically exposes memory
>>>>>> inside a large, sparse memory area to the VM.
>>>>>
>>>>> Can you explain this use case in more real world terms, as I'm not
>>>>> understanding what a mgmt app would actually do with this in
>>>>> practice ?
>>>>
>>>> Let's consider huge pages for simplicity. Assume you have 128 free huge
>>>> pages in your hypervisor that you want to dynamically assign to VMs.
>>>>
>>>> Further assume you have two VMs running. A workflow could look like
>>>>
>>>> 1. Assign all huge pages to VM 0
>>>> 2. Reassign 64 huge pages to VM 1
>>>> 3. Reassign another 32 huge pages to VM 1
>>>> 4. Reasssign 16 huge pages to VM 0
>>>> 5. ...
>>>>
>>>> Basically what we're used to doing with "ordinary" memory.
>>>
>>> What does this look like in terms of the memory backend configuration
>>> when you boot VM 0 and VM 1 ?
>>>
>>> Are you saying that we boot both VMs with
>>>
>>>      -object hostmem-memfd,size=128G,hugetlb=yes,hugetlbsize=1G,reserve=off
>>>
>>> and then we have another property set on 'virtio-mem' to tell it
>>> how much/little of that 128 G, to actually give to the guest ?
>>> How do we change that at runtime ?
>>
>> Roughly, yes. We only special-case memory backends managed by virtio-mem devices.
>>
>> An advanced example for a single VM could look like this:
>>
>> sudo build/qemu-system-x86_64 \
>> 	... \
>> 	-m 4G,maxmem=64G \
>> 	-smp sockets=2,cores=2 \
>> 	-object hostmem-memfd,id=bmem0,size=2G,hugetlb=yes,hugetlbsize=2M \
>> 	-numa node,nodeid=0,cpus=0-1,memdev=bmem0 \
>> 	-object hostmem-memfd,id=bmem1,size=2G,hugetlb=yes,hugetlbsize=2M \
>> 	-numa node,nodeid=1,cpus=2-3,memdev=bmem1 \
>> 	... \
>> 	-object hostmem-memfd,id=mem0,size=30G,hugetlb=yes,hugetlbsize=2M,reserve=off \
>> 	-device virtio-mem-pci,id=vmem0,memdev=mem0,node=0,requested-size=0G \
>> 	-object hostmem-memfd,id=mem1,size=30G,hugetlb=yes,hugetlbsize=2M,reserve=off \
>> 	-device virtio-mem-pci,id=vmem1,memdev=mem1,node=1,requested-size=0G \
>> 	... \
>>
>> We can request a size change by adjusting the "requested-size" property (e.g., via qom-set)
>> and observe the current size by reading the "size" property (e.g., qom-get). Think of
>> it as an advanced device-local memory balloon mixed with the concept of a memory hotplug.
> 
> Ok, so in this example, the initial  GB of RAM has normal reserve=on
> so if there's insufficient hugepages we'll see the startup failure IIUC.

Yes, except in some NUMA configurations, as huge page reservation isn't 
numa aware; even with reservation there are cases where we can run out 
of applicable free huge pages. Usually we end up preallocating all 
memory in the memory backend just so we're on the safe side.

> 
> What happens when we set qom-set requested-size=10GB at runtime, but there
> are only 8 GB of hugepages left available ?

This is one of the user errors that will be tackled next by a dynamic 
preallocation (and/or reservation) inside virtio-mem.

Once the guest would actually touch >8 GiB, we run out of free huge 
pages and don't have huge page overcommit enabled (or huge page 
overcommit fails allocation which can happen easily), we'd essentially 
crash the VM.

Pretty much similar to messing up memory overcommit with "ordinary" 
memory and getting your VM killed by the OOM handler.

The solution is fairly easy: preallocate huge pages when resizing the 
virtio-mem device (making new huge pages available to the VM in this case).

In the simplest case this can be done using fallocate(). If you're 
interested about the dirty details where it's not that easy, take a look 
at my MADV_POPULATE_READ/MADV_POPULATE_WRITE kernel series [1]. Marek is 
working on handling virtio-mem device via an iothread, so we can do 
preallocation easily "concurrently" while the VM is running, avoiding 
holding the BQL for a long time.

[1] https://lkml.kernel.org/r/20210419135443.12822-1-david@redhat.com

-- 
Thanks,

David / dhildenb


