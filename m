Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6385B6DE3F2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 20:32:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmImE-0005ku-7T; Tue, 11 Apr 2023 14:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pmIm9-0005kS-TM
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 14:31:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pmIm7-00075I-ST
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 14:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681237886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q59Q4+++SDMdvR4u7ERnk4GWX0IFFVzhRn1Psdnj1R8=;
 b=ZJMQzgiefjvOG8RUCeHV+Q8ti0oczo1U3LCWEETpyb0PZvgj8ilMVsBeXtLyL/f+vPUuzC
 jTcmgxgPVQ9ypCGjwQH2yixKHWqOYn3ygTs00stvtGhKLBJxxXOTUxctVqyPgQ7c2Ardjz
 eYGCnm6QPZOrySKAJulGgH6SX1ief94=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-JB1KpqL1NF2MEMsPXhg1Lw-1; Tue, 11 Apr 2023 14:31:25 -0400
X-MC-Unique: JB1KpqL1NF2MEMsPXhg1Lw-1
Received: by mail-wm1-f71.google.com with SMTP id
 l36-20020a05600c1d2400b003edd119ec9eso2892380wms.0
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 11:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681237884; x=1683829884;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q59Q4+++SDMdvR4u7ERnk4GWX0IFFVzhRn1Psdnj1R8=;
 b=5O/gL1xbjK1GrX3vyRJ4sKI+jIIGMhcdniNzg7WjY1G9o/9kujYhk52iHpKG9G2Rj0
 CW8rUrYclsxcEELkOpTXT2DQ1yZSDTVDLGURp0wBaG05oGZJs7IXCEvY01Y1YlqdEB/U
 IoGe9FYObHBSKxSoxHEfqf/QwduGjepjYsdAyHzhoVWI/Hd9UQGd20b+3t76Q9IJiRhj
 DdTx9c5vN172IX1LHe2ONTODTM74N0pf7zwiRnzCrGI6iVLSTksM071KmthHymjDmBji
 Pg5qDVJB64hN8kqbMWw4aNvmHbSwy0cmHhvwUEH7kHgyIqUUUT9JaJlcZnhX2KsJX1Ct
 fgww==
X-Gm-Message-State: AAQBX9dDDGuDjh8zR4WWy637VXf8RrmkHiSov6nNfsTEmvqs1ptJYt+L
 iTwRhRBOo0C8B6aTManvjEW7knA0J6yDflGWkBM8NKB0St8HvJ6JWfFzEbS/+3Nhd76Y0333eGI
 O+Bb8NttmPTRpVTI=
X-Received: by 2002:a7b:c406:0:b0:3ee:42fd:7768 with SMTP id
 k6-20020a7bc406000000b003ee42fd7768mr10698475wmi.1.1681237884213; 
 Tue, 11 Apr 2023 11:31:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350a9veqGZ9+0LeE5COg7mOmHXzFez6izEZ7CpomUyDoGUgdrGgkJLQ5Ger+CDuCsErXL9Ct7/w==
X-Received: by 2002:a7b:c406:0:b0:3ee:42fd:7768 with SMTP id
 k6-20020a7bc406000000b003ee42fd7768mr10698459wmi.1.1681237883773; 
 Tue, 11 Apr 2023 11:31:23 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:1300:6f08:1748:eba7:b2a9?
 (p200300cbc70613006f081748eba7b2a9.dip0.t-ipconnect.de.
 [2003:cb:c706:1300:6f08:1748:eba7:b2a9])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a05600c475000b003f092f0e0a0sm2918609wmo.3.2023.04.11.11.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 11:31:23 -0700 (PDT)
Message-ID: <65628a21-5446-7136-e9c7-e5b12d5b540a@redhat.com>
Date: Tue, 11 Apr 2023 20:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Steven Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Joao Martins
 <joao.m.martins@oracle.com>, Gavin Shan <gshan@redhat.com>
References: <1681141583-87816-1-git-send-email-steven.sistare@oracle.com>
 <5657e1e4-ab20-f0e9-a9d5-7b91aece1459@redhat.com>
 <c3793343-8fc7-7399-3629-43ed3456feac@oracle.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] util/mmap: optimize qemu_ram_mmap() alignment
In-Reply-To: <c3793343-8fc7-7399-3629-43ed3456feac@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.17, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11.04.23 16:39, Steven Sistare wrote:
> On 4/11/2023 3:57 AM, David Hildenbrand wrote:
>> On 10.04.23 17:46, Steve Sistare wrote:
>>> Guest RAM created with memory-backend-memfd is aligned to a
>>> QEMU_VMALLOC_ALIGN=2M boundary, and memory-backend-memfd does not support
>>> the "align" parameter to change the default.  This is sub-optimal on
>>> aarch64 kernels with a 64 KB page size and 512 MB huge page size, as the
>>> range will not be backed by huge pages.  Moreover, any shared allocation
>>> using qemu_ram_mmap() will be sub-optimal on such a system if the align
>>> parameter is less than 512 MB.
>>>
>>> The kernel is smart enough to return a hugely aligned pointer for MAP_SHARED
>>> mappings when /sys/kernel/mm/transparent_hugepage/shmem_enabled allows it.
>>> However, the qemu function qemu_ram_mmap() mmap's twice to perform its own
>>> alignment:
>>>
>>>       guardptr = mmap(0, total, PROT_NONE, flags, ...
>>>       flags |= shared ? MAP_SHARED : MAP_PRIVATE;
>>>       ptr = mmap(guardptr + offset, size, prot, flags | map_sync_flags, ...
>>>
>>> On the first call, flags has MAP_PRIVATE, hence the kernel does not apply
>>> its shared memory policy, and returns a non-huge-aligned guardptr.
>>>
>>> To fix, for shared mappings, pass MAP_SHARED to both mmap calls.
>>>
>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>>> Reviewed-by: Joao Martins <joao.m.martins@oracle.com>
>>> ---
>>>    util/mmap-alloc.c | 5 +++--
>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
>>> index 5ed7d29..37a0d1e 100644
>>> --- a/util/mmap-alloc.c
>>> +++ b/util/mmap-alloc.c
>>> @@ -121,7 +121,7 @@ static bool map_noreserve_effective(int fd, uint32_t qemu_map_flags)
>>>     * Reserve a new memory region of the requested size to be used for mapping
>>>     * from the given fd (if any).
>>>     */
>>> -static void *mmap_reserve(size_t size, int fd)
>>> +static void *mmap_reserve(size_t size, int fd, int final_flags)
>>>    {
>>>        int flags = MAP_PRIVATE;
>>>    @@ -144,6 +144,7 @@ static void *mmap_reserve(size_t size, int fd)
>>>    #else
>>>        fd = -1;
>>>        flags |= MAP_ANONYMOUS;
>>> +    flags |= final_flags & MAP_SHARED;
>>
>> Setting both, MAP_PRIVATE and MAP_SHARED sure sounds very wrong.
> 
> Yes, thanks.  I introduced that mistake when I ported the fix from an earlier qemu that did not
> have mmap_reserve.  Should be:
> 
>      fd = -1;
>      flags = MAP_ANONYMOUS;
>      flags |= final_flags & (MAP_SHARED | MAP_PRIVATE);
> 

Better, but I still don't like bringing in some Linux kernel MAP_SHARED 
logic that apparently does better right now in some case right now ... 
because this is supposed to work on POSIX and ideally optimizes on 
various systems+configurations.


>> The traditional way to handle that is via QEMU_VMALLOC_ALIGN.
>>
>> I think you'd actually want to turn QEMU_VMALLOC_ALIGN into a function that is able to special-case like hw/virtio/virtio-mem.c:virtio_mem_default_thp_size() does for "qemu_real_host_page_size() == 64 * KiB".
>>
>> If you set QEMU_VMALLOC_ALIGN properly, you'll also have any DIMMs get that alignment in guest physical address space.
> 
> If we increase QEMU_VMALLOC_ALIGN, then all allocations will be 512MB aligned.  If we make many small
> allocations, we could conceivably run out of VA space.  Further, the processor may use low order

Running out of VA space? I'm not so sure. We are talking about the 
qemu_ram_mmap() function here ... (well, and file_ram_alloc() which only 
uses QEMU_VMALLOC_ALIGN on s390x).

This is all about guest RAM, although the name suggests otherwise.


> address bits in internal hashes, and now offset X in every allocated range will have the same value for
> the low 29 bits, possibly causing more collisions and reducing performance.  Further, the huge alignment
> is not even needed if huge pages for shmem have been disabled in sysconfig.

I'm not convinced this is worth optimizing, or even special-casing just 
for arm64 when we're only talking about mapping guest RAM.

Besides, what about ordinary anon THP? See below.

> 
> We could avoid that by adding logic to also consider allocation size when choosing alignment, and
> checking sysconfig tunables.  Or, we can just let the kernel do so by telling it the truth about
> memory flavor when calling mmap.

It's probably best to not trust the kernel to do the right alignment 
thing because we learned that it's not easy to get such optimizations 
into the kernel:

https://lkml.kernel.org/r/20220809142457.4751229f@imladris.surriel.com

got reverted again, which would have done the right thing for anon THP.


I'd suggest that we either hard-code it for arm64 as well, by adjusting 
QEMU_VMALLOC_ALIGN (if we don't care about giving it a better name and 
making it a function).

#elif defined(__linux__) && defined(__aarch64__)
# define QEMU_VMALLOC_ALIGN((qemu_real_host_page_size() == 64 * KiB) ? 
512 MiB : 2 MiB)
#elif ...

Alternatively, we could rewrite into a proper function that caches the 
result and tries looking up the actual host THP size using 
"/sys/kernel/mm/transparent_hugepage/hpage_pmd_size" under Linux before 
falling back to the known defaults.

Sure, we could optimize in the caller (allocation size smaller than 
alignment?), but that requires good justification.

-- 
Thanks,

David / dhildenb


