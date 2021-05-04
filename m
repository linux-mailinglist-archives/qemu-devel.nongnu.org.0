Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974B237296A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 13:06:09 +0200 (CEST)
Received: from localhost ([::1]:57734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldssS-0000gO-DQ
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 07:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ldsqn-0000Eg-KC
 for qemu-devel@nongnu.org; Tue, 04 May 2021 07:04:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ldsqk-0004Y8-IF
 for qemu-devel@nongnu.org; Tue, 04 May 2021 07:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620126261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t8qy/tfjYVV5tm/KYaQAkupJFwQ2smxNl5MOxQGWoL8=;
 b=T56qisjHc1XLNvMmu++s0sMJN+7GDUTjTJkp/qqUkzSZcfLL+DcRczn4DDdeQrEM07UqUB
 0pYv3PwWPgjz6d04KYLgFYmVb8ZCv0JZTDa1TTXWNcaRmBVnoE4LWb5Pg06UOrUuAd5s9L
 QCBKWSBMoBvv0l/yf/X0k0enlTByfQ4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-fUQyvbBlMteGZ5wFS-1s0g-1; Tue, 04 May 2021 07:04:20 -0400
X-MC-Unique: fUQyvbBlMteGZ5wFS-1s0g-1
Received: by mail-ed1-f72.google.com with SMTP id
 bm3-20020a0564020b03b0290387c8b79486so6177707edb.20
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 04:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=t8qy/tfjYVV5tm/KYaQAkupJFwQ2smxNl5MOxQGWoL8=;
 b=e2VFlY8oAcmrvGheeKquAGXw0sDVg4snHSKEL/2z5Om0Kq/TuK/V2gQHwZDyz+a4qR
 LKWPKY5x1TLfKh5/ReWMqboOiUsbg8Rb9Eudcw3dvlSRGqgJq836MWby5He03NKaJSUS
 PqBqzEEEo3/cgc121kChawO1/p9IroCsn+MUC6VHIwx9YhllcVIftwmPrGnLj3IR1ARe
 FSFCpyyHjI7xOzFgdlcrM8JtzI5BQXlPrgEFmGex9PGg7lSgfnZHH2tUKnXQlilb7iVc
 /v4SG0+AbyQETPnqmeohQieX/iJlOGrYmdfRxy/wBnolqukMjPNBXLOMZJkeOSVp43w2
 8l7w==
X-Gm-Message-State: AOAM533eNsdy48o91hyxmV19Ig1fXiYDxqc65am8xDjxkfQyI5rOQc7e
 KY+cKyD8fP0mGkUrOgAkXJdwPauqSB4sjt2W0TJMiiVIUfnexvVrx8JRdr2zanP1GCd9CHSiwBP
 8ft+0keD2b0S8quU=
X-Received: by 2002:a05:6402:3109:: with SMTP id
 dc9mr25407930edb.13.1620126259001; 
 Tue, 04 May 2021 04:04:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQ0nUtdlcYpR0w/QQl8ulX4rhN44nuPee0u/zUQ3KU2Yhh8Uf9WPXzj2G91ZO8uF3VerI5jg==
X-Received: by 2002:a05:6402:3109:: with SMTP id
 dc9mr25407881edb.13.1620126258605; 
 Tue, 04 May 2021 04:04:18 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6fae.dip0.t-ipconnect.de. [91.12.111.174])
 by smtp.gmail.com with ESMTPSA id c7sm5823276ede.37.2021.05.04.04.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 04:04:18 -0700 (PDT)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210428133754.10713-1-david@redhat.com>
 <20210428133754.10713-10-david@redhat.com> <YJEddjCsFgXa4tiR@redhat.com>
 <477b3679-1218-87bb-29d6-9b1b6079ab78@redhat.com>
 <YJEiz4E+Gk/fqWBo@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v7 09/15] util/mmap-alloc: Support RAM_NORESERVE via
 MAP_NORESERVE under Linux
Message-ID: <e72359da-918c-df2d-c541-c1fcf7e3c7d5@redhat.com>
Date: Tue, 4 May 2021 13:04:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJEiz4E+Gk/fqWBo@redhat.com>
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

On 04.05.21 12:32, Daniel P. Berrangé wrote:
> On Tue, May 04, 2021 at 12:21:25PM +0200, David Hildenbrand wrote:
>> On 04.05.21 12:09, Daniel P. Berrangé wrote:
>>> On Wed, Apr 28, 2021 at 03:37:48PM +0200, David Hildenbrand wrote:
>>>> Let's support RAM_NORESERVE via MAP_NORESERVE on Linux. The flag has no
>>>> effect on most shared mappings - except for hugetlbfs and anonymous memory.
>>>>
>>>> Linux man page:
>>>>     "MAP_NORESERVE: Do not reserve swap space for this mapping. When swap
>>>>     space is reserved, one has the guarantee that it is possible to modify
>>>>     the mapping. When swap space is not reserved one might get SIGSEGV
>>>>     upon a write if no physical memory is available. See also the discussion
>>>>     of the file /proc/sys/vm/overcommit_memory in proc(5). In kernels before
>>>>     2.6, this flag had effect only for private writable mappings."
>>>>
>>>> Note that the "guarantee" part is wrong with memory overcommit in Linux.
>>>>
>>>> Also, in Linux hugetlbfs is treated differently - we configure reservation
>>>> of huge pages from the pool, not reservation of swap space (huge pages
>>>> cannot be swapped).
>>>>
>>>> The rough behavior is [1]:
>>>> a) !Hugetlbfs:
>>>>
>>>>     1) Without MAP_NORESERVE *or* with memory overcommit under Linux
>>>>        disabled ("/proc/sys/vm/overcommit_memory == 2"), the following
>>>>        accounting/reservation happens:
>>>>         For a file backed map
>>>>          SHARED or READ-only - 0 cost (the file is the map not swap)
>>>>          PRIVATE WRITABLE - size of mapping per instance
>>>>
>>>>         For an anonymous or /dev/zero map
>>>>          SHARED   - size of mapping
>>>>          PRIVATE READ-only - 0 cost (but of little use)
>>>>          PRIVATE WRITABLE - size of mapping per instance
>>>>
>>>>     2) With MAP_NORESERVE, no accounting/reservation happens.
>>>>
>>>> b) Hugetlbfs:
>>>>
>>>>     1) Without MAP_NORESERVE, huge pages are reserved.
>>>>
>>>>     2) With MAP_NORESERVE, no huge pages are reserved.
>>>>
>>>> Note: With "/proc/sys/vm/overcommit_memory == 0", we were already able
>>>> to configure it for !hugetlbfs globally; this toggle now allows
>>>> configuring it more fine-grained, not for the whole system.
>>>>
>>>> The target use case is virtio-mem, which dynamically exposes memory
>>>> inside a large, sparse memory area to the VM.
>>>
>>> Can you explain this use case in more real world terms, as I'm not
>>> understanding what a mgmt app would actually do with this in
>>> practice ?
>>
>> Let's consider huge pages for simplicity. Assume you have 128 free huge
>> pages in your hypervisor that you want to dynamically assign to VMs.
>>
>> Further assume you have two VMs running. A workflow could look like
>>
>> 1. Assign all huge pages to VM 0
>> 2. Reassign 64 huge pages to VM 1
>> 3. Reassign another 32 huge pages to VM 1
>> 4. Reasssign 16 huge pages to VM 0
>> 5. ...
>>
>> Basically what we're used to doing with "ordinary" memory.
> 
> What does this look like in terms of the memory backend configuration
> when you boot VM 0 and VM 1 ?
> 
> Are you saying that we boot both VMs with
> 
>     -object hostmem-memfd,size=128G,hugetlb=yes,hugetlbsize=1G,reserve=off
> 
> and then we have another property set on 'virtio-mem' to tell it
> how much/little of that 128 G, to actually give to the guest ?
> How do we change that at runtime ?

Roughly, yes. We only special-case memory backends managed by virtio-mem devices.

An advanced example for a single VM could look like this:

sudo build/qemu-system-x86_64 \
	... \
	-m 4G,maxmem=64G \
	-smp sockets=2,cores=2 \
	-object hostmem-memfd,id=bmem0,size=2G,hugetlb=yes,hugetlbsize=2M \
	-numa node,nodeid=0,cpus=0-1,memdev=bmem0 \
	-object hostmem-memfd,id=bmem1,size=2G,hugetlb=yes,hugetlbsize=2M \
	-numa node,nodeid=1,cpus=2-3,memdev=bmem1 \
	... \
	-object hostmem-memfd,id=mem0,size=30G,hugetlb=yes,hugetlbsize=2M,reserve=off \
	-device virtio-mem-pci,id=vmem0,memdev=mem0,node=0,requested-size=0G \
	-object hostmem-memfd,id=mem1,size=30G,hugetlb=yes,hugetlbsize=2M,reserve=off \
	-device virtio-mem-pci,id=vmem1,memdev=mem1,node=1,requested-size=0G \
	... \

We can request a size change by adjusting the "requested-size" property (e.g., via qom-set)
and observe the current size by reading the "size" property (e.g., qom-get). Think of
it as an advanced device-local memory balloon mixed with the concept of a memory hotplug.


I suggest taking a look at the libvirt virito-mem implemetation
-- don't think it's upstream yet:

https://lkml.kernel.org/r/cover.1615982004.git.mprivozn@redhat.com

I'm CCing Michal -- I already gave him a note upfront which additional
properties we might see for memory backends (e.g., reserve, managed-size)
and virtio-mem devices (e.g., iothread, prealloc, reserve, prot).

> 
> 
>> For that to work with virtio-mem, you'll have to disable reservation of huge
>> pages for the virtio-mem managed memory region.
>>
>> (prealloction of huge pages in virtio-mem to protect from user mistakes is a
>> separate work item)
>>
>> reserve=off will be the default for virtio-mem, and actual
>> reservation/preallcoation will be done within virtio-mem. There could be use
>> for "reserve=off" for virtio-balloon use cases as well, but I'd like to
>> exclude that from the discussion for now.
> 
> The hostmem backend defaults are indepdant of frontend usage, so when you
> say reserve=off is the default for virtio-mem, are you expecting the mgmt
> app like libvirt to specify that ?

Sorry, yes exactly; only for the memory backend managed by a virtio-mem device.

-- 
Thanks,

David / dhildenb


