Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CCF2ED04D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 13:58:23 +0100 (CET)
Received: from localhost ([::1]:45866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxUrt-0007g1-Ui
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 07:58:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxUqo-0007Dn-1B
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:57:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxUqj-0003Rf-CQ
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:57:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610024228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i6ikLnqyf5ahvOPH6mqtJKFILV66oVP3ydTviD26FAQ=;
 b=jAhrJE8y3IwIgYanjmdfPwqobQ9tAzuf6yTjPtN6tryuZks/R5AhoHi3AlYJ1ivCOoDswp
 PcC46Lh8RzqLw0/XMq7OzP6SYSDQL5QdE+YwaIbhG7W/WqjohlmZrpSVJOsyv1BnBfF/uQ
 LVRkqRjvzzqYimQXRnYpg/7NF04gw00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-DWNZ2klANSyeVnfvnkL1Hw-1; Thu, 07 Jan 2021 07:57:06 -0500
X-MC-Unique: DWNZ2klANSyeVnfvnkL1Hw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BCD1180A096;
 Thu,  7 Jan 2021 12:57:05 +0000 (UTC)
Received: from [10.36.114.161] (ovpn-114-161.ams2.redhat.com [10.36.114.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 552E519C66;
 Thu,  7 Jan 2021 12:56:51 +0000 (UTC)
Subject: Re: [PATCH v3 04/10] vfio: Query and store the maximum number of DMA
 mappings
To: Alex Williamson <alex.williamson@redhat.com>
References: <20201216141200.118742-1-david@redhat.com>
 <20201216141200.118742-5-david@redhat.com>
 <20201217105512.78a2ef71@omen.home>
 <bb621937-3d39-bade-082a-892f4126b018@redhat.com>
 <20201217124709.72b0706f@omen.home>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <eeeca864-4ad8-d8eb-29bb-1bb7bfa4fe5f@redhat.com>
Date: Thu, 7 Jan 2021 13:56:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201217124709.72b0706f@omen.home>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.12.20 20:47, Alex Williamson wrote:
> On Thu, 17 Dec 2020 20:04:28 +0100
> David Hildenbrand <david@redhat.com> wrote:
> 
>> On 17.12.20 18:55, Alex Williamson wrote:
>>> On Wed, 16 Dec 2020 15:11:54 +0100
>>> David Hildenbrand <david@redhat.com> wrote:
>>>   
>>>> Let's query the maximum number of DMA mappings by querying the available
>>>> mappings when creating the container.
>>>>
>>>> In addition, count the number of DMA mappings and warn when we would
>>>> exceed it. This is a preparation for RamDiscardMgr which might
>>>> create quite some DMA mappings over time, and we at least want to warn
>>>> early that the QEMU setup might be problematic. Use "reserved"
>>>> terminology, so we can use this to reserve mappings before they are
>>>> actually created.  
>>>
>>> This terminology doesn't make much sense to me, we're not actually
>>> performing any kind of reservation.  
>>
>> I see you spotted the second user which actually performs reservations.
>>
>>>   
>>>> Note: don't reserve vIOMMU DMA mappings - using the vIOMMU region size
>>>> divided by the mapping page size might be a bad indication of what will
>>>> happen in practice - we might end up warning all the time.  
>>>
>>> This suggests we're not really tracking DMA "reservations" at all.
>>> Would something like dma_regions_mappings be a more appropriate
>>> identifier for the thing you're trying to count?  We might as well also  
>>
>> Right now I want to count
>> - Mappings we know we will definitely have (counted in this patch)
>> - Mappings we know we could eventually have later (RamDiscardMgr)
>>
>>> keep a counter for dma_iommu_mappings where the sum of those two should
>>> stay below dma_max_mappings.  
>>
>> We could, however, tracking active IOMMU mappings when removing a memory
>> region from the address space isn't easily possible - we do a single
>> vfio_dma_unmap() which might span multiple mappings. Same applies to
>> RamDiscardMgr. Hard to count how many mappings we actually *currently*
>> have using that approach.
> 
> It's actually easy for the RamDiscardMgr regions, the unmap ioctl
> returns the total size of the unmapped extents.  Therefore since we
> only map granule sized extents, simple math should tell us how many
> entries we freed.  OTOH, if there are other ways that we unmap multiple
> mappings where we don't have those semantics, then it would be
> prohibitive.

So, I decided to not track the number of current mappings for now, but
instead use your suggestion to sanity-check via

1. Consulting kvm_get_max_memslots() to guess how many DMA mappings we
might have in the worst case apart from the one via RamDiscardMgr.

2. Calculating the maximum number of DMA mappings that could be consumed
by RamDiscardMgr in the given setup by looking at all entries in the
vrdl list.

Looks much cleaner now.

-- 
Thanks,

David / dhildenb


