Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CBF3309B5
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 09:47:19 +0100 (CET)
Received: from localhost ([::1]:53532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJBXq-0007Fe-E6
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 03:47:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lJBWh-0006ln-Pz
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 03:46:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lJBWe-00014E-HZ
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 03:46:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615193160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2McPEaRde6wLRHdJ/9pARiHoLMH+q9vCFLokGpJ7dtk=;
 b=h2iljA7o3srdqKwqqSaLMLJzsSD08seZisXei5wrBBDqeDpEF6/4l7AP5jNTrUpEadIYxl
 pv5wOZLRJElFkUy2ptbGi9sqvoiKlE10i3BnFZ9IIBiqLWjNttRWj0zs84ywckn67RSmYz
 lMIpcKWLtcPDQmPveXbmogBFLpxb0JY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-TKS8LzOzMtK70eC-OZoBFg-1; Mon, 08 Mar 2021 03:45:57 -0500
X-MC-Unique: TKS8LzOzMtK70eC-OZoBFg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71615108BD14;
 Mon,  8 Mar 2021 08:45:55 +0000 (UTC)
Received: from [10.36.113.123] (ovpn-113-123.ams2.redhat.com [10.36.113.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6744061F2B;
 Mon,  8 Mar 2021 08:45:21 +0000 (UTC)
To: marcel@redhat.com
References: <20210305101634.10745-1-david@redhat.com>
 <20210305101634.10745-9-david@redhat.com> <20210305154206.GH397383@xz-x1>
 <f577f691-9bdc-a435-9f20-1de62be2241e@redhat.com>
 <20210305155141.GI397383@xz-x1>
 <26dc6c36-5137-5d5e-36f0-2650e42e40ad@redhat.com>
 <CA+aaKfAc95Y2Eg2AkHELTzOa8DUt=-8feOufuUHF1jbFg5Z8SQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v2 8/9] util/mmap-alloc: Support RAM_NORESERVE via
 MAP_NORESERVE
Message-ID: <047792f8-e5a3-ab75-7fa2-e61f09655d06@redhat.com>
Date: Mon, 8 Mar 2021 09:45:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CA+aaKfAc95Y2Eg2AkHELTzOa8DUt=-8feOufuUHF1jbFg5Z8SQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.03.21 15:11, Marcel Apfelbaum wrote:
> Hi David,
> 
> On Sun, Mar 7, 2021 at 3:18 PM David Hildenbrand <david@redhat.com 
> <mailto:david@redhat.com>> wrote:
> 
>     On 05.03.21 16:51, Peter Xu wrote:
>      > On Fri, Mar 05, 2021 at 04:44:36PM +0100, David Hildenbrand wrote:
>      >> On 05.03.21 16:42, Peter Xu wrote:
>      >>> On Fri, Mar 05, 2021 at 11:16:33AM +0100, David Hildenbrand wrote:
>      >>>> +#define OVERCOMMIT_MEMORY_PATH "/proc/sys/vm/overcommit_memory"
>      >>>> +static bool map_noreserve_effective(int fd, bool readonly,
>     bool shared)
>      >>>> +{
>      >>>
>      >>> [...]
>      >>>
>      >>>> @@ -184,8 +251,7 @@ void *qemu_ram_mmap(int fd,
>      >>>>        size_t offset, total;
>      >>>>        void *ptr, *guardptr;
>      >>>> -    if (noreserve) {
>      >>>> -        error_report("Skipping reservation of swap space is
>     not supported");
>      >>>> +    if (noreserve && !map_noreserve_effective(fd, shared,
>     readonly)) {
>      >>>
>      >>> Need to switch "shared" & "readonly"?
>      >>
>      >> Indeed, interestingly it has the same effect (as we don't have
>     anonymous
>      >> read-only memory in QEMU :) )
>      >
>      > But note there is still a "g_assert(!shared || fd >= 0);" inside.. :)
> 
>     Aaaaaand, I just figured that we actually can create shared anonymous
>     memory in QEMU, simply via
> 
>     -object memory-backend-ram,share=on
> 
>     Introduced in 06329ccecfa0 ("mem: add share parameter to
>     memory-backend-ram"). That's also where we introduced the "shared" flag
>     for qemu_anon_ram_alloc().
> 
>     That commit mentions a use case for "RDMA devices in order to remap
>     non-contiguous QEMU virtual addresses to a contiguous virtual address
>     range.". I fail to understand why that requires sharing RAM with child
>     processes.
> 
>     Especially:
> 
>     a) qemu_ram_is_shared() returned false before patch #1. RAM_SHARED is
>     never set.
> 
>     b) qemu_ram_remap() does not work as expected?
> 
>     c) ram_discard_range() is broken with shared anonymous memory. Instead
>     of MADV_DONTNEED we need MADV_REMOVE.
> 
>     This looks like a partially broken feature and I wonder if there is an
>     actual user.
> 
>     @Marcel, can you clarify if there is an actual use case for shared
>     anonymous memory in QEMU? I.e., if the original use case that required
>     that change is valid? (and why it wasn't able to just use proper shmem)
> 
> 
> As you correctly stated, the PVRDMA device requires remapping of 
> non-contiguous QEMU
> virtual addresses to a contiguous virtual address range.
> 
> In order to do so it calls
>       mremap (... , MREMAP_MAYMOVE | MREMAP_FIXED, ...)

Thanks - I was missing who remaps and how (for a second I thought in 
another forked process).

docs/pvrdma.txt seems to describe the situation. Having to use anonymous 
shared memory is a bit unfortunate.

I yet haven't figured out how it is valid to remap parts of RAMBlocks to 
other locations via MREMAP_MAYMOVE. This sounds to me like we are 
punching holes into RAMBlocks - that can't be right.

Or maybe we are just shuffling around pages within a RAMBlock such that 
we don't actually punch holes?

Or does that happen when the source VM is stopped and won't ever run again?

-- 
Thanks,

David / dhildenb


